 /****************************************************************************/
 /* Jazz Integrated Program : F771727                                        */
 /*                                                                          */
 /* Program Module   : VLCTProg/efuse.p                                      */
 /* Creation Date    : Mon Apr 25 17:34:07 2011                              */
 /* Jazz Version Used: /apps/chipcreate/jazz/v5.7                            */
 /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
 /*                                                                          */
 /*                              Revision Comments                           */
 /*                                                                          */
 /* 1st char of Rev (0-Z) - major revisions                                  */
 /* 2nd char of Rev (0-Z) - minor revisions                                  */
 /*                                                                          */
 /* Rev : Comment                                     : UserID        : Date */
 /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
 /*                                                                          */
 /* TMX : Updated the LoadEfuseCtlrData routine to    : BEK      : 30Jun2011 */
 /*         reflect the correct number of bits in all                        */
 /*         registers                                                        */
 /* TMX : Added Decode_Blizz_EFuse routine            : BEK      : 30Jun2011 */
 /*                                                                          */
 /*  A0 : Initial version of the VLCT Test Program    : a0271837      :      */
 /*                                                                          */
 /****************************************************************************/

#include <Unison.h>
#include <efuse.h>
#include <stdEfuse.h>
#include <enums.evo>
#include <iomanip>
using namespace std; 

FuseInstDataRec instData[13];
ProgDataRec progData;
bool fuseROMProgrammed;

struct FuseConfigRec {
   DesignInstEnumType instType;
   FuseElemEnumType   elemType;
   int rowStart;
   int rowStop;
   int colStart;
   int colStop;
   int bits;
   int instBits;
   bool MSBbits;
   int memInst;
};

struct BlockDataRec {
   StringM1D fuseROMData;
   IntM numRepairs;
   IntM numBitRepairs;
   int instances;
   int maxElements[MAX_INSTANCES];
   
   BlockDataRec() : fuseROMData(102) {}
};

struct C027EfuseDataRec {
   STDFuseFarmRec STPData;
   FuseConfigRec fuseConfig[TOTAL_EFUSE_BLKS][MAX_INSTANCES][MAX_EFUSE_ELEMENTS];

   int blocks;
   BlockDataRec blkData[TOTAL_EFUSE_BLKS];

   StringS checkMg0;
   StringS checkNorm;
   StringS initCheck;
   StringS loadData;
   StringS progMg1A;
   StringS progMg1B;
   StringS readMg0;
   StringS readNorm;
   StringS readMg1A;
   StringS readMg1B;
   StringS runAutoload;
   StringS dieIDRead;
   StringS OCP_RINGOSC;
   StringS OCP_VIA;
   StringS OCP_XTR32;

   StringS1D fusePatterns;
   //Are the below really needed?
//                       FROMCLK         : PinList;
//
//                       runAutoloadTest : TestNames;
//                       initCheckTest   : TestNames;
//                       checkMg0Test    : TestNames;

   BoolM checkMg0Results;
   
   C027EfuseDataRec() : fusePatterns(4) {}
};

C027EfuseDataRec fuseFarmCtlr[TOTAL_EFUSE_CTLR];

// /*****************************************************************************
//  This is an example of a F021 FuseFarm controller block diagram. A FuseFarm
//  controller may contain multiple FuseROM blocks configured from 0 - 63 rows.
// 
//  Rows 1 to N contain 41 bits of data:
//  Data[34] = write protect (WP)
//  Data[33] = read protect (RP) 
//  Data[32] = repair (R) 
//  Data[31:0] = fuse scan chain data 
//  Row 0: 
//  Data[7:0] = redundancy address
//  Data[31] = load fuse scan chain disable bit (only for block 0)
// 
//  A FuseROM instance may be split into multiple segments in a block. An
//  element is specific field in the instance, for example, WaferX of DieID.
// 
//  The LSB of a FuseROM instance is located in the highest row and column
//  number. The MSB is located in the lowest row and column number.
// 
//  +-----------------------------------------------------------------------+
//  |  FuseFarm Controller (ctlr)                                           |
//  |                                                                       |
//  |            (blk)                                                      |
//  |    FuseROM Block 0                    FuseROM Block (b)               |
//  |  +------------------------------+   +------------------------------+  |
//  |  | MBist              Segment 2 |   | Custom                       |  |
//  |  |                              |   |                              |  |
//  |  +------------------------------+   |                              |  |
//  |  | Non MBist                    |   +------------------------------|  |
//  |  +------------------------------+   | PBist              Segment 1 |  |
//  |  | MBist              Segment 1 |   |                              |  |
//  |  |                    (seg)     |   |                              |  |
//  |  +------------------------------+   |                              |  |
//  |  | DieID        Instance (inst) |   |                              |  |
//  |  +------------------------------+   +------------------------------+  |
//  |  | Ctlr Repair Rows             |   | Ctlr Repair Rows             |  |
//  |  +------------------------------+   +------------------------------+  |
//  |  | Row0                         |   | Row0                         |  |
//  |  +------------------------------+   +------------------------------+  |
//  |  | Redundant Row                |   | Redundant Row                |  |
//  |  +------------------------------+   +------------------------------+  |
//  |                                                                       |
//  |   DieID                                                               |
//  |  +------+------------------------------------+                        |
//  |  |      |  WaferX  |   Element (elem)        |                        |
//  |  +------+------------------------------------+ Row (r+3)              |
//  |  +------+------------------------------------+                        |
//  |  +------+------------------------------------+                        |
//  |  +------+---+--------------------------------+ Row (r)                |
//  |   CCCCCC WRR 3            Data              0                         |
//  |   RRRRRR PP  1           Col (c)                                      |
//  |   AAAAAA                                                              |
//  |   543210                                                              |
//  +-----------------------------------------------------------------------+
// 
//  Fuse Documentation Links:
// 
//  ASIC FuseFarm Development
//  www.dal.asp.ti.com/fusefarm
// 
//  Make Test Efuse
//  ttc.pac.sc.ti.com/TSP/strategy/memory/Apps/vlclt_mem_apps.html
// 
//  F021 Efuse Programming Conditions
//  https://sps02.itg.ti.com/sites/makeoe/Standards/Forms/AllItems.aspx
// 
//  *****************************************************************************/

void InitializeFuseROMVariables()
 /*****************************************************************************
  This procedure intializes FuseROM variables before each execution of the
  test flow.
 
  Global Input Variables :
  fuseFarmCtlr record
  blkData.numRepairs     - count of repair rows used
  blkData.numBitRepairs  - count of column repairs used
  blkData.fuseROMData    - global FuseROM row data array
  STPData.maxFROMRepairs - max number of FuseROM controller + redundant
  rows
  STPData.fuseROMSize    - total number of FuseROM rows per block
  
  Location : testflow.p
  *****************************************************************************/
{
    IntS ctlr;
    IntS blk;
    IntS row;


    fuseROMProgrammed =  false;

    for (ctlr = 0;ctlr < TOTAL_EFUSE_CTLR;ctlr++)
        for (blk = 0;blk < fuseFarmCtlr[ctlr].blocks;blk++)
        {
            fuseFarmCtlr[ctlr].blkData[blk].numRepairs =
            fuseFarmCtlr[ctlr].STPData.maxFROMRepairs[blk];

            fuseFarmCtlr[ctlr].blkData[blk].numBitRepairs = 0;

            for (row = 0;row <= fuseFarmCtlr[ctlr].STPData.fuseROMSize[blk];row++)
                fuseFarmCtlr[ctlr].blkData[blk].fuseROMData.SetValue(row, "");
        } 
}   /* InitializeFuseROMVariables */

//void SendNumFuseROMRepairsToTW()
// /*****************************************************************************
//  This procedure sends the number of FuseROM repair rows and columns used to
//  TestWare.
// 
//  Global Input Variables :
//  fuseFarmCtlr record
//  blkData.numRepairs     - count of repair rows used
//  blkData.numBitRepairs  - count of repair columns used
//  STPData.maxFROMRepairs - max number of FuseROM controller + redundant
//  rows
// 
//  Location : testflow.p
//  *****************************************************************************/
//{
//    IntS site;
//    IntS ctlr;
//    IntS blk;
//    IntS numRepairs;
//    IntS numBitRepairs;
//    TWString ctlrNumStr;
//    TWString blkNumStr;
//    TWString tmpStr1;
//    TWString tmpStr2;
//
//
//    for (ctlr = 1;ctlr <= TOTAL_EFUSE_CTLR;ctlr++)
//    {
//        if (ctlr < 10)  
//            WriteString(ctlrNumStr, "0", ctlr:1);
//        else
//            WriteString(ctlrNumStr, ctlr:1);
//
//        for (blk = 0;blk <= fuseFarmCtlr[ctlr].blocks;blk++)
//        {
//            if (blk < 10)  
//                WriteString(blkNumStr, "B0", blk:1);
//            else
//                WriteString(blkNumStr, "B", blk:1);
//
//            WriteString(tmpStr1, "NRRFUSE", ctlrNumStr, blkNumStr);
//            WriteString(tmpStr2, "NRBFUSE", ctlrNumStr, blkNumStr);
//
//            for (site = 1;site <= V_Sites;site++)
//            {
//                numRepairs = fuseFarmCtlr[ctlr].STPData.maxFROMRepairs[blk] -
//                fuseFarmCtlr[ctlr].blkData[blk].numRepairs[site];
//
//                if (numRepairs > 0)  
//                    TWPDLDataLogVariableSite(tmpStr1, numRepairs, site, TWMinimumData);
//
//                numBitRepairs = fuseFarmCtlr[ctlr].blkData[blk].numBitRepairs[site];
//
//                if (numBitRepairs > 0)  
//                    TWPDLDataLogVariableSite(tmpStr2, numBitRepairs, site, TWMinimumData);
//            } 
//        } 
//    } 
//}   /* SendNumFuseROMRepairsToTW */


// NOTE: Currently, the ElemData is not retrieved as it was unused by F021 lib and Blizzard.
void GetEfuseInstElemData()
 /*****************************************************************************
  This procedure will index the fuseFarmCtlr record to extract the data 
  required to build, program and read a FuseROM instance or element.
 
  Global Output Variables : 
  instData - record of FuseROM instance data
  validCtlr   - valid controller
  fuseROMCtlr - controller number
  maxSeg      - total number of segements per block
  rowStart    - row start for segment
  rowStop     - row stop for segment
  instStart   - fuseFarmCtlr record start index for segment
  instStop    - fuseFarmCtlr record stop index for segment     
  padLSB      - number of LSB pad bits for segment
  padMSB      - number of MSB pad bits for segment
 
  elemData - record of FuseROM element data
  validData   - valid for controller and block
  rowStart    - row start  
  rowStop     - row stop
  padLSB      - number of LSB pad bits
  padMSB      - number of MSB pad bits
  fuseROMInst - instance number
  progElemStr - initialize element strings to zeros
  *****************************************************************************/
{
    IntS ctlr;
    IntS blk;
    IntS inst;
    IntS seg;
    IntS elem;
    IntS bits;
    IntS bitIndex;
    IntS elemIndex;
    StringS tmpElemStr;
    int instType;
    FuseElemEnumType elemType;
    BoolS rowStopFound;
    BoolS blkFound;


    for (instType = 1; instType < LastDesignInstEnum; ++instType) 
    {
        instData[instType].totalBits = 0;

        for (ctlr = 0;ctlr < TOTAL_EFUSE_CTLR;++ctlr)
        {
            instData[instType].totalBlks[ctlr] = 0;
            instData[instType].totalSegs[ctlr] = 0;
            instData[instType].validCtlr[ctlr] = false;

            for (blk = 0;blk < fuseFarmCtlr[ctlr].blocks;blk++)
            {
                // start seg at -1 because it's used as an index
                // and there is a pre-increment
                seg = -1;
                rowStopFound = false;
                blkFound = false;

                for (inst = 1;inst <= fuseFarmCtlr[ctlr].blkData[blk].instances;inst++)
                    if (fuseFarmCtlr[ctlr].fuseConfig[blk][inst][0].instType == 
                        instType)  
                    {         
                        instData[instType].fuseROMCtlr = ctlr; 
                        instData[instType].validCtlr[ctlr] = true;

                        instData[instType].totalBits = 
                        instData[instType].totalBits +
                        fuseFarmCtlr[ctlr].fuseConfig[blk][inst][0].bits;

                        if (!blkFound)
                        {
                            instData[instType].totalBlks[ctlr] =
                            instData[instType].totalBlks[ctlr] + 1;
                            blkFound = true;
                        } 

                        if (!rowStopFound)
                        {
                            seg = seg + 1;

                            // for the loops using seg > maxSeg, do an increment 
                            // here so that maxSeg is the number of segs, so > maxSeg
                            // will work properly for 0-based indexes
                            instData[instType].maxSeg[ctlr][blk] = seg+1;

                            instData[instType].rowStart[ctlr][blk][seg] =
                            fuseFarmCtlr[ctlr].fuseConfig[blk][inst][0].rowStart;

                            instData[instType].instStart[ctlr][blk][seg] = inst;

                            instData[instType].padMSB[ctlr][blk][seg] = 
                            fuseFarmCtlr[ctlr].fuseConfig[blk][inst][0].colStart;

                            instData[instType].totalSegs[ctlr] = 
                            instData[instType].totalSegs[ctlr] + 1;

                            rowStopFound = true;
                        } 

                        // 0 is a valid seg index, so use >=
                        if (seg >= 0)  
                        {
                            instData[instType].rowStop[ctlr][blk][seg] =
                            fuseFarmCtlr[ctlr].fuseConfig[blk][inst][0].rowStop;

                            instData[instType].instStop[ctlr][blk][seg] = inst;

                            instData[instType].padLSB[ctlr][blk][seg] = 31 -
                            fuseFarmCtlr[ctlr].fuseConfig[blk][inst][0].colStop;
                        }          
                    }
                    else
                        rowStopFound = false;
            }  

            if ((instData[instType].totalBlks[ctlr] > 1) or
                (instData[instType].totalSegs[ctlr] > 1))  
                instData[instType].segmentChain[ctlr] = true;
            else
                instData[instType].segmentChain[ctlr] = false;
        } 
    }  

// :TODO: Implement this if ever needed...F021 lib and Blizzard never needed the elemData
//
//    for (ctlr = 0;ctlr < TOTAL_EFUSE_CTLR;++ctlr)
//        for (blk = 0;blk < fuseFarmCtlr[ctlr].blocks;blk++)
//        {
//            for (inst = 1;inst <= fuseFarmCtlr[ctlr].blkData[blk].instances;inst++)
//                for (elem = 1;elem <= fuseFarmCtlr[ctlr].blkData[blk].maxElements[inst];elem++)
//                {   
//                    elemType = fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].elemType;
//
//                    elemData[elemType].rowStart[ctlr][blk] = 
//                    fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].rowStart;
//
//                    elemData[elemType].rowStop[ctlr][blk] = 
//                    fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].rowStop;
//
//                    elemData[elemType].padLSB[ctlr][blk] = 31 -  
//                    fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].colStop;
//
//                    elemData[elemType].padMSB[ctlr][blk] = 
//                    fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].colStart;
//
//                    elemData[elemType].fuseROMInst[ctlr][blk] = inst; 
//                    elemData[elemType].fuseROMElem[ctlr][blk] = elem;         
//
//                    elemData[elemType].validData[ctlr][blk] = true;
//
//                    tmpElemStr = "";
//                    bits = fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].instBits;
//
//                    for (bitIndex = 1;bitIndex <= bits;bitIndex++)
//                        tmpElemStr = tmpElemStr +  "0";
//
//                    elemData[elemType].progElemStr = tmpElemStr;
//                } 
//        } 
}   /* GetEfuseInstElemData */

void BuildNullStrings()
 /*****************************************************************************
  This procedure will build null strings for every FuseROM instance segment. 
  A null string is all zeros.
  *****************************************************************************/
{
    IntS ctlr;
    IntS blk;
    IntS seg;
    IntS elem;
    IntS inst;
    int instType;
    IntS instBits;
    IntS bitIndex;
    IntS instStart;
    IntS instStop;


    elem = 0;

    for (instType = 1; instType < LastDesignInstEnum; ++instType) 
    {
        for (ctlr = 0;ctlr < TOTAL_EFUSE_CTLR;ctlr++)
            for (blk = 0;blk < fuseFarmCtlr[ctlr].blocks;blk++)
                for (seg = 0;seg < instData[instType].maxSeg[ctlr][blk];seg++)
                {
                    instData[instType].nullChainStr[ctlr][blk][seg] = "";

                    instStart = instData[instType].instStart[ctlr][blk][seg];
                    instStop = instData[instType].instStop[ctlr][blk][seg];

                    for (inst = instStop;inst >= instStart;--inst)
                    {
                        instBits = fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].bits;

                        for (bitIndex = 0;bitIndex < instBits;bitIndex++)
                            instData[instType].nullChainStr[ctlr][blk][seg] += "0";
                    } 
                }  
    } 
}   /* BuildNullStrings */

//void STDEfuseTestSetup(  STDEfuseModeType fuseMode, STDEfuseModeType  prevFuseMode)
// /*****************************************************************************
//  This procedure defines the hardware setups for each Efuse mode used
//  during the STDProgramFuseChain[ROM] function.
//  *****************************************************************************/
//{
//
//    if (fuseMode == FF_Prog)  
//    {
//        PowerUpAtSTDEfuseP(DCsetup_LooseVmin, NORM_FMSU);
//
//        ClockSet(S_CLOCK1A, false, FreqArr[ STDEfuse ], v[VIH_Loose_Vmin],
//                 v[VIL_Loose], S_POGOPIN);
//        ClockSet(S_CLOCK2A, false, FreqArr[ STDEfuse ], v[VIH_Loose_Vmin],
//                 v[VIL_Loose], S_POGOPIN);
//       
//    } 
//
//    if (fuseMode == FF_Read)  
//    {
//        if (prevFuseMode == FF_Read)  
//            PowerUpAtEfuseRead(DCsetup_LooseVmin, NORM_FMSU);
//        else
//            PowerUpAtSTDEfuseR(DCsetup_LooseVmin, NORM_FMSU);
//
//        ClockSet(S_CLOCK1A, false, FreqArr[ STDEfuse ], v[VIH_Loose_Vmin],
//                 v[VIL_Loose], S_POGOPIN);
//         /*ClockSet(S_CLOCK2A, false, FreqArr[ STDEfuse ], v[VIH_Loose_Vmin],
//                  v[VIL_Loose], S_POGOPIN);*/
//        
//    } 
//
//     /* Added for Efuse and we need ClockPinSet for Efuse pattern...pasa 8/17/11*/
//    clockpinset(s_clk_1a, s_clock);
//    /* ClockPinSet(S_CLK_2A, S_Clock);
//     ClockStartFreeRun(S_CLOCK1A); */
//
//
//}   /* STDEfuseTestSetup */

// forward reference
void PrintEfuseInstData(DesignInstEnumType instType);

void LoadEfuseCtlrData()
 /*****************************************************************************
  This procedure loads the FuseFarm controller data before test start.
  *****************************************************************************/
{
    IntS ctlr;
    IntS blk;
    IntS inst;
//    IntS seg;
//    DesignInstEnumType instType;

    IntM test_type("TITestType");
    
   // :IMPORTANT: :TODO:
   // Change these back before doing more than room temp MP1 in Production
   // These are hard-coded for ease of debug only!
   IntS SelectedTITestType = IntS(MP1); //test_type[ActiveSites.Begin().GetValue()];


    for (ctlr = 0;ctlr < TOTAL_EFUSE_CTLR;ctlr++)
        for (blk = 0;blk < fuseFarmCtlr[ctlr].blocks;blk++)
            for (inst = 1;inst <= fuseFarmCtlr[ctlr].blkData[blk].instances;inst++)
                fuseFarmCtlr[ctlr].blkData[blk].maxElements[inst] = 0;

     /********************************/
     /* Global STDEfuse Code Options */
     /********************************/
     /* BEK 24May2011 Modified from F021 to F021_DIEID for Efuse to work correctly */
     /* Commented out as per KC. Jamal Sheikh modified Fri, Dec 16 2011*/
    progData.codeOption = "F021_DIEID";
//    readData.codeOption = "F021_DIEID";
    

     /* Controller instance: F771727/dut_core_inst/fusefarm_inst/I_sc_efuse_ctlr */
    fuseFarmCtlr[0].runAutoload = "FF_RunAutoload_Thrd";
    fuseFarmCtlr[0].checkMg0    = "FF_CheckROM_Mg0_Thrd";  /*JRR*/
    fuseFarmCtlr[0].checkNorm   = "FF_CheckROM_norm_Thrd";  /*JRR*/
    fuseFarmCtlr[0].initCheck   = "FF_InitCheck_Thrd";
    fuseFarmCtlr[0].loadData    = "FF_LoadFuseData_1110_Thrd";
    fuseFarmCtlr[0].progMg1A    = "FF_Program_Mg1A_Thrd";
    fuseFarmCtlr[0].progMg1B    = "FF_Program_Mg1B_Thrd";
    fuseFarmCtlr[0].readMg0     = "FF_Read_Mg0_Thrd";
    fuseFarmCtlr[0].readMg1A    = "FF_Read_Mg1A_Thrd";
    fuseFarmCtlr[0].readMg1B    = "FF_Read_Mg1B_Thrd";
    fuseFarmCtlr[0].readNorm    = "FF_Read_Norm_Thrd";

   /* Pasa modified per Kim Chau recommend for MP3 to use normal read...12/15/11*/
  if(SelectedTITestType==MP3)  
  fuseFarmCtlr[0].fusePatterns[1] = fuseFarmCtlr[0].readNorm;
  else
    fuseFarmCtlr[0].fusePatterns[1] = fuseFarmCtlr[0].readMg1A;
  if(SelectedTITestType==MP3)  
    fuseFarmCtlr[0].fusePatterns[2] = fuseFarmCtlr[0].progMg1B;
  else    
    fuseFarmCtlr[0].fusePatterns[2] = fuseFarmCtlr[0].progMg1B;
    

//    fuseFarmCtlr[0].runAutoloadTest  = EfuseRunAutoload_1_st;
//    fuseFarmCtlr[0].initCheckTest    = EfuseInitCheck_1_st;
//    fuseFarmCtlr[0].checkMg0Test = EFUSECHECKMG0_1_ST;  /* pasa added*/
    
    fuseFarmCtlr[0].STPData.maxFROMRepairs[0] = 5;
    fuseFarmCtlr[0].STPData.fuseROMSize[0] = 14;

    fuseFarmCtlr[0].STPData.JTAGTDI = "PA2_48";
    fuseFarmCtlr[0].STPData.JTAGTDO = "o_cpu_fail_47";
//    fuseFarmCtlr[0].FROMCLK = OSC0_124;

    fuseFarmCtlr[0].blocks = 1;

    fuseFarmCtlr[0].blkData[0].instances = MAX_INSTANCES;

    fuseFarmCtlr[0].fuseConfig[0][1][0].rowStart = 5;
    fuseFarmCtlr[0].fuseConfig[0][1][0].rowStop  = 8;
    fuseFarmCtlr[0].fuseConfig[0][1][0].colStart = 0;
    fuseFarmCtlr[0].fuseConfig[0][1][0].colStop  = 31;
    fuseFarmCtlr[0].fuseConfig[0][1][0].instType = TIDieID;
    fuseFarmCtlr[0].fuseConfig[0][1][0].bits     = 128;
    fuseFarmCtlr[0].fuseConfig[0][1][0].instBits = 128;
    fuseFarmCtlr[0].fuseConfig[0][1][0].MSBbits  = true;

    fuseFarmCtlr[0].fuseConfig[0][2][0].rowStart = 9;
    fuseFarmCtlr[0].fuseConfig[0][2][0].rowStop  = 9;
    fuseFarmCtlr[0].fuseConfig[0][2][0].colStart = 0;
    fuseFarmCtlr[0].fuseConfig[0][2][0].colStop  = 0;
    fuseFarmCtlr[0].fuseConfig[0][2][0].instType = Flash_Test_N;  /*BEK 19May2011 Changed to make blowing fuses easier Custom;*/
    fuseFarmCtlr[0].fuseConfig[0][2][0].bits     = 1;
    fuseFarmCtlr[0].fuseConfig[0][2][0].instBits = 1;
    fuseFarmCtlr[0].fuseConfig[0][2][0].MSBbits  = true;

    fuseFarmCtlr[0].fuseConfig[0][3][0].rowStart = 9;
    fuseFarmCtlr[0].fuseConfig[0][3][0].rowStop  = 9;
    fuseFarmCtlr[0].fuseConfig[0][3][0].colStart = 1;
    fuseFarmCtlr[0].fuseConfig[0][3][0].colStop  = 5;  /*BEK 19May2011 Changed to make blowing fuses easier 1;*/
    fuseFarmCtlr[0].fuseConfig[0][3][0].instType = Custom;
    fuseFarmCtlr[0].fuseConfig[0][3][0].bits     = 5; /*1} {BEK 30Jun2011 Changed to reflect correct number of bits*/
    fuseFarmCtlr[0].fuseConfig[0][3][0].instBits = 5; /*1} {BEK 30Jun2011 Changed to reflect correct number of bits*/
    fuseFarmCtlr[0].fuseConfig[0][3][0].MSBbits  = true;

     /*BEK 19May2011 Removed individual fuse definitions to make blowing fuses easier */

    fuseFarmCtlr[0].fuseConfig[0][8][0].rowStart = 9;
    fuseFarmCtlr[0].fuseConfig[0][8][0].rowStop  = 9;
    fuseFarmCtlr[0].fuseConfig[0][8][0].colStart = 6;
    fuseFarmCtlr[0].fuseConfig[0][8][0].colStop  = 11;  /*BEK 19May2011 Changed to make blowing fuses easier 6;*/
    fuseFarmCtlr[0].fuseConfig[0][8][0].instType = BG_TEMP_TRIM;  /*BEK 19May2011 Changed to make blowing fuses easier Custom;*/
    fuseFarmCtlr[0].fuseConfig[0][8][0].bits     = 6; /*1} {BEK 30Jun2011 Changed to reflect correct number of bits*/
    fuseFarmCtlr[0].fuseConfig[0][8][0].instBits = 6; /*1} {BEK 30Jun2011 Changed to reflect correct number of bits*/
    fuseFarmCtlr[0].fuseConfig[0][8][0].MSBbits  = true;

     /*BEK 19May2011 Removed individual fuse definitions to make blowing fuses easier */

    fuseFarmCtlr[0].fuseConfig[0][14][0].rowStart = 9;
    fuseFarmCtlr[0].fuseConfig[0][14][0].rowStop  = 9;
    fuseFarmCtlr[0].fuseConfig[0][14][0].colStart = 12;
    fuseFarmCtlr[0].fuseConfig[0][14][0].colStop  = 19;
    fuseFarmCtlr[0].fuseConfig[0][14][0].instType = PBist;
    fuseFarmCtlr[0].fuseConfig[0][14][0].bits     = 8;
    fuseFarmCtlr[0].fuseConfig[0][14][0].instBits = 8;
    fuseFarmCtlr[0].fuseConfig[0][14][0].MSBbits  = true;
    fuseFarmCtlr[0].fuseConfig[0][14][0].memInst  = 8;

    fuseFarmCtlr[0].fuseConfig[0][15][0].rowStart = 9;
    fuseFarmCtlr[0].fuseConfig[0][15][0].rowStop  = 10;
    fuseFarmCtlr[0].fuseConfig[0][15][0].colStart = 20;
    fuseFarmCtlr[0].fuseConfig[0][15][0].colStop  = 19;
    fuseFarmCtlr[0].fuseConfig[0][15][0].instType = NonMBist;  /*JRR*/
    fuseFarmCtlr[0].fuseConfig[0][15][0].bits     = 32;
    fuseFarmCtlr[0].fuseConfig[0][15][0].instBits = 32;
    fuseFarmCtlr[0].fuseConfig[0][15][0].MSBbits  = true;

    fuseFarmCtlr[0].fuseConfig[0][16][0].rowStart = 10;
    fuseFarmCtlr[0].fuseConfig[0][16][0].rowStop  = 11;
    fuseFarmCtlr[0].fuseConfig[0][16][0].colStart = 20;
    fuseFarmCtlr[0].fuseConfig[0][16][0].colStop  = 19;
    fuseFarmCtlr[0].fuseConfig[0][16][0].instType = NonMBist;  /*JRR*/
    fuseFarmCtlr[0].fuseConfig[0][16][0].bits     = 32;
    fuseFarmCtlr[0].fuseConfig[0][16][0].instBits = 32;
    fuseFarmCtlr[0].fuseConfig[0][16][0].MSBbits  = true;

    fuseFarmCtlr[0].fuseConfig[0][17][0].rowStart = 11;
    fuseFarmCtlr[0].fuseConfig[0][17][0].rowStop  = 12;
    fuseFarmCtlr[0].fuseConfig[0][17][0].colStart = 20;
    fuseFarmCtlr[0].fuseConfig[0][17][0].colStop  = 17;
    fuseFarmCtlr[0].fuseConfig[0][17][0].instType = NonMBist;  /*JRR*/
    fuseFarmCtlr[0].fuseConfig[0][17][0].bits     = 30;
    fuseFarmCtlr[0].fuseConfig[0][17][0].instBits = 30;
    fuseFarmCtlr[0].fuseConfig[0][17][0].MSBbits  = true;

    fuseFarmCtlr[0].fuseConfig[0][18][0].rowStart = 12;
    fuseFarmCtlr[0].fuseConfig[0][18][0].rowStop  = 12;
    fuseFarmCtlr[0].fuseConfig[0][18][0].colStart = 18;
    fuseFarmCtlr[0].fuseConfig[0][18][0].colStop  = 25;
    fuseFarmCtlr[0].fuseConfig[0][18][0].instType = PBist;
    fuseFarmCtlr[0].fuseConfig[0][18][0].bits     = 8;
    fuseFarmCtlr[0].fuseConfig[0][18][0].instBits = 8;
    fuseFarmCtlr[0].fuseConfig[0][18][0].MSBbits  = true;
    fuseFarmCtlr[0].fuseConfig[0][18][0].memInst  = 10;

    fuseFarmCtlr[0].fuseConfig[0][19][0].rowStart = 12;
    fuseFarmCtlr[0].fuseConfig[0][19][0].rowStop  = 13;
    fuseFarmCtlr[0].fuseConfig[0][19][0].colStart = 26;
    fuseFarmCtlr[0].fuseConfig[0][19][0].colStop  = 1;
    fuseFarmCtlr[0].fuseConfig[0][19][0].instType = PBist;
    fuseFarmCtlr[0].fuseConfig[0][19][0].bits     = 8;
    fuseFarmCtlr[0].fuseConfig[0][19][0].instBits = 8;
    fuseFarmCtlr[0].fuseConfig[0][19][0].MSBbits  = true;
    fuseFarmCtlr[0].fuseConfig[0][19][0].memInst  = 9;

    GetEfuseInstElemData();
    BuildNullStrings();
    
//    PrintEfuseInstData(FlashChain);
//    PrintEfuseInstData(NonMBist);
//    PrintEfuseInstData(MemBist);
//    PrintEfuseInstData(MBist);
//    PrintEfuseInstData(PBist);
//    PrintEfuseInstData(Custom);
//    PrintEfuseInstData(Flash_Test_N);
//    PrintEfuseInstData(TIDieID);
//    PrintEfuseInstData(BG_TEMP_TRIM);
//    PrintEfuseInstData(TS_OS_TRIM);
//    PrintEfuseInstData(IREF_TRIM);
//    PrintEfuseInstData(NWELL_RTRIM);
//    PrintEfuseInstData(Piosc_Trim);
    
}   /* LoadEfuseCtlrData */

void PrintEfuseInstData(DesignInstEnumType instType)
 /*****************************************************************************
  This procedure will print program or read boundaries for a FuseROM 
  instance.
  *****************************************************************************/
{
    IntS ctlr;
    IntS blk;
    IntS seg;


    cout << endl;  
    cout << "FuseROM Instance == " <<  instType << endl;
    cout << "+----+---+---+----+----+----+----+---+---+" << endl;
    cout << "|    |   |   |ROW |ROW |INDX|INDX|PAD|PAD|" << endl;
    cout << "|CTLR|BLK|SEG|STRT|STOP|STRT|STOP|LSB|MSB|" << endl;
    cout << "+----+---+---+----+----+----+----+---+---+" << endl;

    for (ctlr = 0;ctlr < TOTAL_EFUSE_CTLR;++ctlr)
        for (blk = 0;blk < fuseFarmCtlr[ctlr].blocks;++blk)
            for (seg = 0;seg < instData[instType].maxSeg[ctlr][blk];++seg)
                cout << "|" << setw(4) <<  ctlr <<  "|" << setw(3) << blk <<  "|" <<  setw(3) << seg << 
                        "|" << setw(4) << instData[instType].rowStart[ctlr][blk][seg] << 
                        "|" << setw(4) << instData[instType].rowStop[ctlr][blk][seg] << 
                        "|" << setw(4) << instData[instType].instStart[ctlr][blk][seg] << 
                        "|" << setw(4) << instData[instType].instStop[ctlr][blk][seg] << 
                        "|" << setw(3) << instData[instType].padLSB[ctlr][blk][seg] << 
                        "|" << setw(3) << instData[instType].padMSB[ctlr][blk][seg] << 
                        "|" << endl;

    cout <<  "+----+---+---+----+----+----+----+---+---+" << endl;
}   /* PrintEfuseInstData */

//void PrintEfuseElemData(  FuseElemEnumType firstElemType, FuseElemEnumType 
//                             lastElemType)
// /*****************************************************************************
//  This procedure will print program or read boundaries for a FuseROM element.
//  *****************************************************************************/
//{
//    IntS ctlr;
//    IntS blk;
//    IntS inst;
//    IntS elem;
//    FuseElemEnumType elemType;
//
//
//    cout << TIWindow << endl;  
//    cout << TIWindow <<  "FuseROM Element" << endl;
//    cout << TIWindow <<  "+----+---+----+----+----+----+---+---+" << endl;
//    cout << TIWindow <<  "|    |   |    |    |ROW |ROW |PAD|PAD|" << endl;
//    cout << TIWindow <<  "|CTLR|BLK|INDX|ELEM|STRT|STOP|LSB|MSB|" << endl;
//    cout << TIWindow <<  "+----+---+----+----+----+----+---+---+" << endl;
//
//    for (ctlr = 1;ctlr <= TOTAL_EFUSE_CTLR;ctlr++)
//        for (blk = 0;blk < fuseFarmCtlr[ctlr].blocks;blk++)
//            for (elemType = firstElemType;elemType <= lastElemType;elemType++)
//                if elemData[elemType].validData[ctlr][blk]  
//                {
//                    inst = elemData[elemType].fuseROMInst[ctlr][blk];
//                    elem = elemData[elemType].fuseROMElem[ctlr][blk];
//
//                    cout << TIWindow <<  "|" <<  ctlr:4 <<  "|" <<  blk:3 <<  "|" <<  inst:4 <<  "|" <<  elem:4 << 
//                            "|" <<  elemData[elemType].rowStart[ctlr][blk]:4 << 
//                            "|" <<  elemData[elemType].rowStop[ctlr][blk]:4 << 
//                            "|" <<  elemData[elemType].padLSB[ctlr][blk]:3 << 
//                            "|" <<  elemData[elemType].padMSB[ctlr][blk]:3 << 
//                            "|" <<  elemType << endl;
//                } 
//
//    cout << TIWindow <<  "+----+---+----+----+----+----+---+---+" << endl;
//}   /* PrintEfuseElemData */
//
//void PrintEfusePgmData( StringS techName)
// /*****************************************************************************
//  This procedure will print FuseFarm programming conditions for the standard
//  routines.
//  *****************************************************************************/
//{
//    IntS ctlr;
//    IntS chan32CLK;
//    string[7] clkConnect;
//    IntS vector;
//    string[1] vecPinData;
//    string[35] vecDataStr;
//    IntS dataMarg;
//    string[4] dataMargStr;
//    IntS dataRPW;
//    IntS dataWPW;
//    IntS dataITER;
//    IntS dataSPW;
//    IntS dataRDB;
//    IntS dataCmpDis;
//    IntS loop;
//    BoolS complete;
//    BoolS errorPause;
//    
//
//    errorPause = false;
//    
//    cout << TIWindow << endl;
//    cout << TIWindow <<  "FuseFarm Programming Conditions: Std Routines" << endl;
//    cout << TIWindow <<  "+----+----+-------+-----+---+---+---+----+" << endl;
//    cout << TIWindow <<  "|    |32IO|    CLK| MARG|   |   |   |    |" << endl;
//    cout << TIWindow <<  "|CTLR|CHAN| FORMAT|SENSE|WPW|RPW|SPW|ITER|" << endl;
//    cout << TIWindow <<  "+----+----+-------+-----+---+---+---+----+" << endl;
//    
//    for (ctlr = 1;ctlr <= TOTAL_EFUSE_CTLR;ctlr++)
//    {
//        chan32CLK = ((PinGetChannel(fuseFarmCtlr[ctlr].FROMCLK) - 1) mod 32) + 1;
//
//        switch(chan32CLK) {
//          case -10 : clkConnect = "CLK_1A";
//          case -11 : clkConnect = "CLK_1B";
//          case -12 : clkConnect = "CLK_1C";
//          case -13 : clkConnect = "CLK_1D";
//          case -14 : clkConnect = "CLK_1E";
//          case -15 : clkConnect = "CLK_1F";
//          case -16 : clkConnect = "CLK_1G";
//          case -17 : clkConnect = "CLK_1H";
//          case -30 : clkConnect = "CLK_2A";
//          case -31 : clkConnect = "CLK_2B";
//          case -32 : clkConnect = "CLK_2C";
//          case -33 : clkConnect = "CLK_2D";
//          case -34 : clkConnect = "CLK_2E";
//          case -35 : clkConnect = "CLK_2F";
//          case -36 : clkConnect = "CLK_2G";
//          case -37 : clkConnect = "CLK_2H";
//          25, 27,
//          case  28: case  32 :  clkConnect = "DIVCLK7";
//          case  29: case  31 :  clkConnect = "ALTCLK1";
//          case  26: case  30 :  clkConnect = "DIVCLK6";
//          default:
//          clkConnect = "";
//        } 
//
//        vecDataStr = "";
//        for (vector = 0;vector <= 9;vector++)
//        {
//            PatternLabelGetPinData(fuseFarmCtlr[ctlr].fusePatterns[2],
//                                   "Write_ReadMode", vector,
//                                   fuseFarmCtlr[ctlr].STPData.JTAGTDI,
//                                   S_BINARY, vecPinData);
//            vecDataStr = vecDataStr +  vecPinData;
//        } 
//
//        ReadString("0b" +  StringReverse(mid(vecDataStr +  1 +  2))) +  dataMarg;
//
//        if (techName == "C027") or (techName == "C021")  
//            ReadString("0b" +  StringReverse(mid(vecDataStr +  6 +  3))) +  dataRPW;
//        else
//            ReadString("0b" +  StringReverse(mid(vecDataStr +  5 +  4))) +  dataRPW;
//
//        if (techName == "F021")  
//            ReadString("0b" +  StringReverse(mid(vecDataStr +  9 +  2))) +  dataRDB;
//        
//        switch(dataMarg) {
//          case 0 : dataMargStr = "Norm";
//          case 1 : dataMargStr = "0";
//          case 2 : dataMargStr = "1A";
//          case 3 : dataMargStr = "1B";
//        } 
//        
//        if (techName == "SR70")  
//            dataMargStr = "Norm";
//
//        vecDataStr = "";
//        for (vector = 0;vector <= 34;vector++)
//        {
//            PatternLabelGetPinData(fuseFarmCtlr[ctlr].fusePatterns[2],
//                                   "Write_ProgMode", vector,
//                                   fuseFarmCtlr[ctlr].STPData.JTAGTDI,
//                                   S_BINARY, vecPinData);
//            vecDataStr = vecDataStr +  vecPinData;
//        } 
//        
//        if (techName == "SR70")  
//        {
//            ReadString("0b" +  StringReverse(mid(vecDataStr +   1 +  11))) +  dataWPW;
//            ReadString("0b" +  StringReverse(mid(vecDataStr +  12 +   4))) +  dataITER;
//            ReadString("0b" +  StringReverse(mid(vecDataStr +  17 +   1))) +  dataCmpDis;
//            ReadString("0b" +  StringReverse(mid(vecDataStr +  18 +  16))) +  dataSPW;
//        }
//        else
//        {
//            ReadString("0b" +  StringReverse(mid(vecDataStr +   1 +   9))) +  dataWPW;
//            ReadString("0b" +  StringReverse(mid(vecDataStr +  10 +   4))) +  dataITER;
//            ReadString("0b" +  StringReverse(mid(vecDataStr +  15 +  16))) +  dataSPW;
//            ReadString("0b" +  StringReverse(mid(vecDataStr +  30 +   1))) +  dataCmpDis;
//        } 
//
//        write(TIWindow <<  "|" <<  ctlr:4 <<  "|";
//        if (chan32CLK > 0)  
//            write(TIWindow <<  chan32CLK:4);
//        else
//            write(TIWindow <<  " ":4;
//        write(TIWindow <<  "|" <<  clkConnect:7 <<  "|";
//        cout << TIWindow <<  dataMargStr:5 <<  "|" <<  dataWPW:3 <<  "|" << 
//                dataRPW:3 <<  "|" <<  dataSPW:3 <<  "|" <<  dataITER:4 <<  "|" << 
//                fuseFarmCtlr[ctlr].fusePatterns[2] << endl;
//
//        if (dataCmpDis == 1)  
//        {
//            cout << "FUSE ERROR : Compare Disable enabled in program pattern" << 
//                    fuseFarmCtlr[ctlr].fusePatterns[2]:1 << endl;
//            errorPause = true;
//        } 
//
//        if ((techName == "F021") and (dataRDB != 0b11))  
//        {
//            cout << "FUSE ERROR : F021 Read[9:8] != 11 in program pattern" << 
//                    fuseFarmCtlr[ctlr].fusePatterns[2]:1 << endl;
//            cout << "             The read pattern should match." << endl;
//            errorPause = true;
//        } 
//    } 
//
//    cout << TIWindow <<  "+----+----+-------+-----+---+---+---+----+" << endl;
//
//    if errorPause  
//        pause;
//
//}   /* PrintEfusePgmData */
//
//void BuildRepairString(DesignInstEnumType instType,
//                                  IntS ctlr, IntS  blk, IntS  seg,
//                                StringM repairChainStr,
//                                BoolS repairDataExists)
// /*****************************************************************************
//  This procedure will index the fuseFarmCtlr record and build the FuseROM
//  memory repair string.
//  *****************************************************************************/
//{
//    IntS site;
//    IntS inst;
//    IntS elem;
//    IntS mem;
//    IntS start;
//    IntS instStart;
//    IntS instStop;
//
//
//    elem = 0;
//    repairDataExists = false;
//
//    for (site = 1;site <= V_Sites;site++)
//    {
//        repairChainStr[site] = "";
//
//        if V_Dev_Active[site]   
//        {
//            instStart = instData[instType].instStart[ctlr][blk][seg];
//            instStop = instData[instType].instStop[ctlr][blk][seg];
//
//            for (inst = instStop;inst >= instStart;--inst)
//            {           
//                mem = fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].memInst;
//                
//                if (fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].bits ==
//                    fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].instBits)   
//                    repairChainStr[site] =
//                    concat(repairChainStr[site], memInst[mem].repairString[site])
//                else 
//                {
//                    if (fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].MSBbits)  
//                        start = fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].instBits -
//                        fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].bits + 1
//                    else
//                        start = 1;
//
//                    if ( ( start > 0 ) and
//                        ( start < len( memInst[mem].repairString[site] ) ) )  
//                        repairChainStr[site] =
//                        concat(repairChainStr[site],
//                               mid(memInst[mem].repairString[site], start,
//                               fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].bits));
//                } 
//
//                if (memInst[mem].rowRepCnt[site] > 0) or
//                    (memInst[mem].colRepCnt[site] > 0)  
//                    repairDataExists = true;
//            } 
//        } 
//    }   
//}   /* BuildRepairString */
//
void BuildSegmentString(const DesignInstEnumType &instType,
                        const IntS &ctlr, const IntS  &blk, const IntS  &seg,
                        const IntS &bitStart,  //This ultimately comes from an int, not intM
                        const StringM &progChainStr,
                        StringM &segmentChainStr)
 /*****************************************************************************
  This procedure will split the FuseROM instance program string into 
  segmented strings to be programmed separately. This procedure must start 
  with the first segment, the MSB bits of the FuseROM instance. An empty 
   program string will be filled with all zeros.
  *****************************************************************************/
{
    IntS inst;
    IntS elem;
    IntS local_bit_start;
    IntS instStart;
    IntS instStop;

    elem = 0;
                                                                      
    segmentChainStr = "";
    
    instStart = instData[instType].instStart[ctlr][blk][seg];
    instStop = instData[instType].instStop[ctlr][blk][seg];
            
    for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
    {
        if (progChainStr[*si] != "")  
        {
            local_bit_start = bitStart;

            for (inst = instStop;inst >= instStart; --inst)
            {   
                local_bit_start = local_bit_start - 
                                  fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].bits;  //removed '+ 1' since this is 
                                                                                        //being used as a string index
                if ( ( local_bit_start >= 0 ) &&
                    ( local_bit_start < progChainStr[*si].Length() ) )  
                    segmentChainStr[*si] += progChainStr[*si].Substring(local_bit_start, 
                                  fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].bits);
                --local_bit_start; 
            } 
        }
        else
            segmentChainStr[*si] = instData[instType].nullChainStr[ctlr][blk][seg];
    }  
}   /* BuildSegmentString */

//void BuildElementString(  FuseElemEnumType LSBElemType, FuseElemEnumType  MSBElemType,
//                                   IntS ctlr, IntS  blk,
//                                 StringM elemChainStr)
// /*****************************************************************************
//  This procedure will build a FuseROM element string from LSBElemType to
//  MSBElemType. The LSBElemType is the element with the highest 
//  FuseROM row and column number.
// 
//  Global Input Variables :
//  elemData - record of FuseROM element data
//  validData   - valid for controller and block
//  fuseROMInst - instance number
//  fuseROMElem - element number
//  progElemStr - element string data
//  *****************************************************************************/
//{
//    IntS site;
//    IntS inst;
//    IntS start;
//    IntS elem;
//    FuseElemEnumType elemType;
//
//
//    for (site = 1;site <= V_Sites;site++)
//    {
//        elemChainStr[site] = "";
//
//        if V_Dev_Active[site]   
//        {
//            for (elemType = LSBElemType;elemType <= MSBElemType;elemType++)
//                if elemData[elemType].validData[ctlr][blk]  
//                {
//                    inst = elemData[elemType].fuseROMInst[ctlr][blk];
//                    elem = elemData[elemType].fuseROMElem[ctlr][blk];
//                    
//                    if (fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].bits ==
//                        fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].instBits)  
//                    {
//                        elemChainStr[site] =
//                        elemChainStr[site] +  elemData[elemType].progElemStr[site];
//                    }
//                    else 
//                        if fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].MSBbits  
//                            start = fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].instBits -
//                            fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].bits + 1
//                        else
//                            start = 1;
//
//                    if ( ( start > 0 ) and
//                        ( start < len( elemData[elemType].progElemStr[site] ) ) )  
//                        elemChainStr[site] =
//                        concat(elemChainStr[site],
//                               mid(elemData[elemType].progElemStr[site], start,
//                               fuseFarmCtlr[ctlr].fuseConfig[blk][inst][elem].bits)); 
//                }  
//        } 
//    } 
//}   /* BuildElementString */

IntM ReadFuseROM(const StringS &codeOption,
                 const DesignInstEnumType &instType, 
                 const FuseMargEnumType &margType,
                 const StringM &compChainStr,
                       StringM &returnChainStr,
                       TMResultM &readResults)
 /*****************************************************************************
  This function will read a FuseROM instance. If the instance is segmented, 
  the return string will recombine the read data.
  
  The return string will be the same length as the compare string. To 
  properly remove padding, the compare string must equal the correct 
  number of bits.
  
  The error code is returned by the function.
  *****************************************************************************/
{
    IntS ctlr;
    IntS blk;
    IntS seg;
    IntS bitStart;
    StringS printStr;
    FloatS localTT;
    IntM error_code;
    StringM local_comp_chain_str;
    IntS row_start, row_stop, msb_padding;
    TMResultM std_read_results;
    StringS read_pat;
    StringM return_str;
    
    readResults =  TM_NOTEST;
    bitStart =  instData[instType].totalBits;
                                                         // could use TIScreenPrint spec var below...
    if (TestProg.GetDatalogEnable()==DATALOG_FILTER_ON)  // was tistdscreenprint, but don't want to include f021_flashglobal
        PrintEfuseInstData(instType);

    for (ctlr = 0;ctlr < TOTAL_EFUSE_CTLR;++ctlr)
        for (blk = 0;blk < fuseFarmCtlr[ctlr].blocks;++blk)
            for (seg = 0;seg < instData[instType].maxSeg[ctlr][blk];++seg)
            {
               switch(margType) {
                  case Mg0  : read_pat = fuseFarmCtlr[ctlr].readMg0;
                              break;
                  case MgN  : read_pat = fuseFarmCtlr[ctlr].readNorm;
                              break;
                  case Mg1A : read_pat = fuseFarmCtlr[ctlr].readMg1A;
                              break;
                  case Mg1B : read_pat = fuseFarmCtlr[ctlr].readMg1B;
                              break;
               } 

               if (instData[instType].segmentChain[ctlr])
               {
                   BuildSegmentString(instType, ctlr, blk, seg,
                                      bitStart,
                                      compChainStr,
                                      local_comp_chain_str);
               }
               else
               {
                   local_comp_chain_str = compChainStr;

                   for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
                      if (compChainStr[*si] == "")  
                          local_comp_chain_str[*si] = instData[instType].nullChainStr[ctlr][blk][seg];
               } 

               row_start = instData[instType].rowStart[ctlr][blk][seg];
               row_stop = instData[instType].rowStop[ctlr][blk][seg];
               msb_padding = instData[instType].padMSB[ctlr][blk][seg];

               std_read_results = STDReadFuseROM(codeOption,
//                                               fuseFarmCtlr[ctlr].STPData,
                                                 ctlr, blk,
                                                 row_start,
                                                 row_stop,
                                                 read_pat,
                                                 local_comp_chain_str,
                                                 return_str,
//                                               fuseFarmCtlr[ctlr].blkData[blk].fuseROMData,
                                                 error_code,
                                                 msb_padding,
                                                 "");

                readResults = DLOG.AccumulateResults(std_read_results, readResults);

                if (instData[instType].segmentChain[ctlr])
                   returnChainStr = return_str + returnChainStr;  
                else
                    returnChainStr = return_str;
            } 
   return (error_code);
}   /* ReadFuseROM */


TMResultM ProgramFuseROM(const StringS &readCodeOption,
                         const DesignInstEnumType &instType, 
                         const StringM &progChainStr,
                               StringM &returnChainStr)
 /*****************************************************************************
  This procedure will program a FuseROM instance. If the instance is 
  segmented, the return string will recombine the read data. Program data 
  with MSB and/or LSB row padding will automatically pre-read the first 
  and/or last row.
 
  Global Input Variables : 
  progData.rowPreRead   - Enable row pre-read, the read data is combined
  with the program data string
 
  progData.redundancy   - Enable redunancy
  progData.writeProtect - Enable write protect
  progData.readProtect  - Enable read protect
  progData.sendTWData   - Enable send FuseROM row data to TestWare, 
  w = ctlr, x = blk, y = row and z = string length
  TWMinimumData :
  None
  TWNomimalData :
  NFUSEwBxRy   = number of fuses to program by row
  GFUSEwBxRy   = number of fuses programmed by row
  AFUSEwBxRy   = number of total iterations by row
  TWExtendedData : (+ Nominal)
  STRFUSEwBxRy = expected/read string data by row
  TWExhaustiveData : (+ Extended)
  RFUSEwBxRy   = number of error code by row
  *****************************************************************************/
{
    TMResultM progResults, tmp_results;
    IntS ctlr;
    IntS blk;
    IntS seg;
    StringM segmentChainStr;
    IntS bitStart;

    progResults =  TM_NOTEST;
    bitStart =  instData[instType].totalBits;

    if (tistdscreenprint)  
        PrintEfuseInstData(instType);

    for (ctlr = 0;ctlr < TOTAL_EFUSE_CTLR;++ctlr)
        for (blk = 0;blk < fuseFarmCtlr[ctlr].blocks;++blk)
            for (seg = 0;seg < instData[instType].maxSeg[ctlr][blk];++seg)
            {
                if (instData[instType].segmentChain[ctlr])
                {
                    BuildSegmentString(instType, ctlr, blk, seg,
                                       bitStart,
                                       progChainStr,
                                       segmentChainStr);
                    progData.progChainStr = segmentChainStr;
                }
                else
                {
                    progData.progChainStr = progChainStr;
                }
                
                progData.rowStart = instData[instType].rowStart[ctlr][blk][seg];
                progData.MSBPadding = instData[instType].padMSB[ctlr][blk][seg];

                if (!RunAllTests)
                {      
                       tmp_results = STDProgramFuseROM(readCodeOption,
                            fuseFarmCtlr[ctlr].STPData,
                            ctlr, blk,
                            progData.rowStart,
                            progData.progChainStr,
                            fuseFarmCtlr[ctlr].fusePatterns,
                            progData.writeProtect, 
                            progData.readProtect,
                            progData.redundancy,
                            progData.sendTWData,     
                            fuseFarmCtlr[ctlr].blkData[blk].numRepairs,
                            progData.returnStr,
                            fuseFarmCtlr[ctlr].blkData[blk].fuseROMData,
                            progData.errorCode,
                            progData.MSBPadding,
                            progData.rowPreRead,
                            fuseFarmCtlr[ctlr].blkData[blk].numBitRepairs);
                }
                else
                    if (tistdscreenprint) 
                        cout <<  "Bypass ProgramFuseROM as RunAllTests is true" << endl;

                if (instData[instType].segmentChain[ctlr])
                   returnChainStr = progData.returnStr + returnChainStr;
                else
                   returnChainStr = progData.returnStr;

                if (SYS.TesterSimulated()) 
                     tmp_results =  TM_PASS ;
                      
                progResults = DLOG.AccumulateResults(progResults, tmp_results);
            } 
   if (tistdscreenprint)
   {
      IntM int_results;
      // convert TMResultM to IntM 
      int_results = IntM(progResults);
      TIDlog.Value(int_results, UTL_VOID, TM_PASS, TM_PASS, "", "ProgramFuseROM", UTL_VOID, UTL_VOID, 
                  false, TWMinimumData);
   }
   
   return (progResults);
}   /* ProgramFuseROM */

//void ProgramFuseROMElement(  FuseElemEnumType LSBElemType, FuseElemEnumType 
//                                    MSBElemType,
//                                    StringM returnChainStr,
//                                    BoolM progResults)
// /*****************************************************************************
//  This procedure will program elements of a FuseROM instance. The LSBElemType 
//  is the element with the highest FuseROM row and column number. Program data 
//  with MSB and/or LSB row padding will automatically pre-read the first 
//  and/or last row.
// 
//  fuseFarmCtlr Record  Element Syntax :
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,0].rowStart := 9;
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,0].rowStop  := 10;
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,0].colStart := 0;
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,0].colStop  := 31;
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,0].instType := TIDieiD;
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,0].bits     := 64;
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,0].instBits := 64;
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,0].MSBbits  := true;
// 
//  fuseFarmCtlr[ctlr].blkData[blk].maxElements[inst] := N;
// 
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,elem].rowStart := 10;
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,elem].rowStop  := 10;
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,elem].colStart := 30;
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,elem].colStop  := 30;
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,elem].elemType := TIMemoryRepair;
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,elem].bits     := 1;
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,elem].instBits := 1;
//  fuseFarmCtlr[ctlr].fuseConfig[blk,inst,elem].MSBbits  := true;
// 
//  elem = 1 to N, N is the maximum number of elements per instance 
// 
//  The element data must be defined before the procedure is called as
// 
//  elemData[TIMemoryRepair].progElemStr[site] := "1";
// 
//  The length of the program element string should match the number of
//  instBits in the fuseFarmCtlr record.
// 
//  Global Input Variables : 
//  progData.rowPreRead   - Enable row pre-read, the read data is combined
//  with the program data string
// 
//  progData.redundancy   - Enable redunancy
//  progData.writeProtect - Enable write protect
//  progData.readProtect  - Enable read protect
//  progData.sendTWData   - Enable send FuseROM row data to TestWare, 
//  w = ctlr, x = blk, y = row and z = string length
//  TWMinimumData :
//  None
//  TWNomimalData :
//  NFUSEwBxRy   = number of fuses to program by row
//  GFUSEwBxRy   = number of fuses programmed by row
//  AFUSEwBxRy   = number of total iterations by row
//  TWExtendedData : (+ Nominal)
//  STRFUSEwBxRy = expected/read string data by row
//  TWExhaustiveData : (+ Extended)
//  RFUSEwBxRy   = number of error code by row
//  *****************************************************************************/
//{
//    IntS ctlr;
//    IntS blk;
//    IntS seg;
//    IntM bitStart;
//    IntS inst;
//    DesignInstEnumType instType;
//    StringM progChainStr;
//    FloatS localTT;
//
//
//    TTHeader("ProgramFuseROMElement", localTT, 2, true);
//
//    progResults =  V_Dev_Active;
//
//    if TIStdScreenPrint  
//        PrintEfuseElemData(LSBElemType, MSBElemType);
//
//    for (ctlr = 0;ctlr < TOTAL_EFUSE_CTLR;ctlr++)
//        for (blk = 0;blk < fuseFarmCtlr[ctlr].blocks;blk++)
//        {
//            if elemData[LSBElemType].validData[ctlr][blk] or 
//                elemData[MSBElemType].validData[ctlr][blk]  
//            {
//                BuildElementString(LSBElemType, MSBElemType, ctlr, blk,
//                                   progChainStr);
//
//                ArraySetInteger(progData.rowStart,
//                                elemData[MSBElemType].rowStart[ctlr][blk]);
//
//                ArraySetInteger(progData.MSBPadding,
//                                elemData[MSBElemType].padMSB[ctlr][blk]);
//
//                progData.progChainStr = progChainStr;
//
//                if not TIIgnoreFail  
//                {
//                    if TIStdSumScrPrint  
//                        SaveNTurnOffScreenPrint;      
//
//                    Discard(STDProgramFuseROM(readData.codeOption,
//                            progData.results,
//                            fuseFarmCtlr[ctlr].STPData,
//                            ctlr, blk,
//                            progData.rowStart,
//                            progData.progChainStr,
//                            fuseFarmCtlr[ctlr].fusePatterns,
//                            progData.writeProtect, 
//                            progData.readProtect,
//                            progData.redundancy,
//                            progData.sendTWData,     
//                            fuseFarmCtlr[ctlr].blkData[blk].numRepairs,
//                            progData.returnStr,
//                            fuseFarmCtlr[ctlr].blkData[blk].fuseROMData,
//                            progData.errorCode,
//                            progData.MSBPadding,
//                            progData.rowPreRead,
//                            fuseFarmCtlr[ctlr].FROMCLK,
//                            fuseFarmCtlr[ctlr].blkData[blk].numBitRepairs));
//
//                    RestoreScreenPrint;
//                }
//                else
//                    if TIStdScreenPrint  
//                        cout << TIWindow << 
//                                "Bypass ProgramFuseROMElement as TIIgnoreFail is true" << endl;
//
//                returnChainStr = progData.returnStr;
//
//                if TISimulation  
//                     progData.results =  true ;
//
//                ArrayANDBoolean(progResults, 
//                                progResults, progData.results, V_Sites);
//            } 
//        } 
//    
//    if TIStdScreenPrint or TIStdSumScrPrint  
//        STDPrintBool("ProgramFuseROM", progResults);
//
//    TTFooter(localTT, 2, true);
//}   /* ProgramFuseROMElement */
//
//void ProgramFuseROMRepair(DesignInstEnumType instType, 
//                                   BoolM progResults)
// /*****************************************************************************
//  This procedure programs a FuseROM memory repair instance. Program data 
//  with MSB and/or LSB row padding will automatically pre-read the first 
//  and/or last row.
// 
//  Global Input Variables : 
//  progData.rowPreRead   - Enable row pre-read, the read data is combined
//  with the program data string
// 
//  progData.redundancy   - Enable redunancy
//  progData.writeProtect - Enable write protect
//  progData.readProtect  - Enable read protect
//  progData.sendTWData   - Enable send FuseROM row data to TestWare, 
//  w = ctlr, x = blk, y = row and z = string length
//  TWMinimumData :
//  None
//  TWNomimalData :
//  NFUSEwBxRy   = number of fuses to program by row
//  GFUSEwBxRy   = number of fuses programmed by row
//  AFUSEwBxRy   = number of total iterations by row
//  TWExtendedData : (+ Nominal)
//  STRFUSEwBxRy = expected/read string data by row
//  TWExhaustiveData : (+ Extended)
//  RFUSEwBxRy   = number of error code by row
//  *****************************************************************************/
//{
//    IntS site;
//    IntS ctlr;
//    IntS blk;
//    IntS seg;
//    BoolS repairDataExists;
//    StringM progChainStr;
//
//
//    progResults =  V_Dev_Active;
//
//    if TIStdScreenPrint  
//        PrintEfuseInstData(instType);
//
//    for (ctlr = 1;ctlr <= TOTAL_EFUSE_CTLR;ctlr++)
//        for (blk = 0;blk < fuseFarmCtlr[ctlr].blocks;blk++)
//            for (seg = 1;seg <= instData[instType].maxSeg[ctlr][blk];seg++)
//            {
//                BuildRepairString(instType, ctlr, blk, seg, 
//                                  progChainStr, repairDataExists); 
//
//                if repairDataExists   
//                {
//                    ArraySetInteger(progData.rowStart,
//                                    instData[instType].rowStart[ctlr][blk][seg]);
//
//                    ArraySetInteger(progData.MSBPadding,
//                                    instData[instType].padMSB[ctlr][blk][seg]);
//
//                    progData.progChainStr = progChainStr;
//
//                    if not TIIgnoreFail  
//                    {
//                        if TIStdSumScrPrint  
//                            SaveNTurnOffScreenPrint;
//
//                        Discard(STDProgramFuseROM(readData.codeOption,
//                                progData.results,
//                                fuseFarmCtlr[ctlr].STPData,
//                                ctlr, blk,
//                                progData.rowStart,
//                                progData.progChainStr,
//                                fuseFarmCtlr[ctlr].fusePatterns,
//                                progData.writeProtect, 
//                                progData.readProtect,
//                                progData.redundancy,
//                                progData.sendTWData,     
//                                fuseFarmCtlr[ctlr].blkData[blk].numRepairs,
//                                progData.returnStr,
//                                fuseFarmCtlr[ctlr].blkData[blk].fuseROMData,
//                                progData.errorCode,
//                                progData.MSBPadding,
//                                progData.rowPreRead,
//                                fuseFarmCtlr[ctlr].FROMCLK,
//                                fuseFarmCtlr[ctlr].blkData[blk].numBitRepairs));
//                        
//                        RestoreScreenPrint;
//                    }
//                    else
//                        if TIStdScreenPrint  
//                            cout << TIWindow << 
//                                    "Bypass ProgramFuseROMRepair as TIIgnoreFail is true" << endl;
//
//                    if TISimulation  
//                         progData.results =  true ;
//
//                    ArrayANDBoolean(progResults, 
//                                    progResults, progData.results, V_Sites);
//                } 
//            } 
//
//}   /* ProgramFuseROMRepair */
//
//void RunAutoloadTest(  DesignInstEnumType firstInstType, DesignInstEnumType 
//                              lastInstType,
//                              BoolM runAutoloadResults)
// /*****************************************************************************
//  This procedure tests the RunAutoload instruction for the FuseFarm 
//  controller where the first to last instance is valid. A controller will 
//  only be tested once. 
//  *****************************************************************************/
//{ 
//    IntS ctlr;
//    IntS status;
//    IntS site;
//    StringS printStr;
//    DesignInstEnumType instType;
//    BoolS1D ctlrTested; /* :MANUAL FIX REQUIRED: array dimensions are : 1..TOTAL_EFUSE_CTLR */
//
//
//    runAutoloadResults =  V_Dev_Active;
//
//    for (ctlr = 1;ctlr <= TOTAL_EFUSE_CTLR;ctlr++)
//    {
//        ctlrTested[ctlr] = false; 
//
//        for (instType = firstInstType;instType <= lastInstType;instType++)
//            if instData[instType].validCtlr[ctlr] and 
//                (not ctlrTested[ctlr])  
//            {
//                ctlrTested[ctlr] = true; 
//
//                PatternExecute(status, fuseFarmCtlr[ctlr].runAutoload);     
//                runAutoloadResults =  V_PF_Status;
//
//                TestOpen(fuseFarmCtlr[ctlr].runAutoloadTest);
//                ResultsRecordActive(runAutoloadResults, S_NULL);
//                TestClose;
//
//                if TIStdScreenPrint  
//                {
//                    WriteString(printStr, "RunAutoload["][ ctlr:1][ "]");
//                    STDPrintBool(printStr, runAutoloadResults);
//                } 
//            } 
//    } 
//}   /* RunAutoloadTest */
//
//void FuseROMVerify(StringS fromTest,
//                        StringS codeOption,
//                        PinM coreSupply,
//                        PinM efuseSupply)
// /******************************************************************************
//  This procedure should be utilized for C027, C021 and C014.M technologies.
//  It will dump the entire fuse rom contents and compare it at two voltage corners
//  specified as the technology Vboxlo and device Vmax, and two margin corners
//  specified as Mg0 and (Mg1A or Mg1B) depending on the technology as aligned
//  in the eFuse Programming Spec available on the PDK website.
//  It should be run at least from device bring-up through device qualification
//  to establish any eFuse marginality attributed to design, process or product
//  development process.
//  ******************************************************************************/
//
//{
//    const IntS TechDataLength = 32;    /* routine only supports C027.*, C021.*, C014.M */
//    const IntS MAX_MARGINMODES = 2; 
//    const IntS MAX_VOLTAGES = 2; 
//
//
//    array[1..MAX_MARGINMODES] of FuseMargEnumType doMargin; /* Unknown Array type :MANUAL FIX REQUIRED: */ /* :MANUAL FIX REQUIRED: array dimensions are : 1..MAX_MARGINMODES */
//    array[1..MAX_VOLTAGES] of VoltageCorner doVC; /* Unknown Array type :MANUAL FIX REQUIRED: */ /* :MANUAL FIX REQUIRED: array dimensions are : 1..MAX_VOLTAGES */
//    array[1..TOTAL_EFUSE_CTLR,
//                            0..TOTAL_EFUSE_BLKS,
//                            1..MAX_MARGINMODES,
//                            1..MAX_VOLTAGES] of STDFROMDataArr allFROMData; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
//    IntS site;
//    IntS ctlr;
//    IntS blk;
//    IntS row;
//    IntS margin;
//    IntS voltage;
//    BoolS doDisconnectVPP;
//    StringS readString1;
//    StringS margString1;
//    StringS margString2;
//    StringS vCString1;
//    StringS vCString2;
//
//    FloatS) procedure skewVPP(doSkew:BoolS; offset;
//    
//        IntS supplyIndex;
//        FloatS vProgVdd;
//        FloatS iProgVdd;
//        FloatS vProgVpp;
//        FloatS iProgVpp;
//
//    
//        if doSkew  
//        {
//            for (supplyIndex = 1;supplyIndex <= GroupGetCount(SupplyGroup);supplyIndex++)
//                if efuseSupply == GroupGetElement(SupplyGroup, supplyIndex)    /*is VPP defined?*/
//                {
//                    STDGetVI(coreSupply, vProgVdd, iProgVdd);
//                    if STDGetConnect(efuseSupply)     /*VPP defined, is it connected?*/
//                    {
//                        STDGetVI(efuseSupply, vProgVpp, iProgVpp);
//                        STDSetVI(efuseSupply, vProgVdd+offset, iProgVpp);
//                    }
//                    else
//                    {
//                        doDisconnectVPP = true;                     /*not connected*/
//                        STDSetVI(efuseSupply, 0v, 100na);            /*avoid hot switch*/
//                        STDConnect(efuseSupply);
//                        STDSetVI(efuseSupply, vProgVdd+offset, SupplyCurrArray[efuseSupply]);
//                    } 
//                } 
//        } 
//    } 
//
//{
//
//    if EnableTimer  
//        startMyTimer(timerLVL3, 3);
//
//    STDTestOpen( fromTest );
//
//    if EnableFuseRomVerify AND V_Any_Dev_Active  
//    {
//        doMargin[1] = Mg0;
//        if ( (codeOption == "C027") OR
//            (codeOption == "C027_SCRAM_1") OR
//            (codeOption == "C027_SCRAM") )  
//            doMargin[2] = Mg1A
//        else
//            doMargin[2] = Mg1B;
//
//        doVC[1] = VC_Vboxlo;
//        doVC[2] = VC_Vmax;
//
//        readData.rowStart =  0;
//        readData.MSBPadding =  0;
//
//        for (voltage = 1;voltage <= MAX_VOLTAGES;voltage++)
//        {
//            doDisconnectVPP = false;
//
//            switch(doVC[voltage]) {
//              case VC_Vboxlo :
//                          
//                             PowerUpAtVboxlo(DCsetup_LooseVboxlo, NORM_FMSU);
//                             skewVpp(true, 100mV);
//                             
//                             ClockSet(S_CLOCK1A, false, FreqArr[ DMA ], v[VIH_Loose_Vboxlo],
//                                      v[VIL_Loose], S_POGOPIN);
//                                /* Added for Efuse and we need ClockPinSet for Efuse pattern...pasa 8/17/11*/
//                             clockpinset(s_clk_1a, s_clock);
//                          break; 
//              case VC_Vmax :
//                        
//                           PowerUpAtVmax(DCsetup_LooseVmax, NORM_FMSU);
//                           skewVpp(false, 0mV);
//
//                           ClockSet(S_CLOCK1A, false, FreqArr[ DMA ], v[VIH_Loose_Vmax],
//                                    v[VIL_Loose], S_POGOPIN);
//                            /*ClockSet(S_CLOCK2A, false, FreqArr[Freq4], v[VIH_Loose_Vmax],
//                                     v[VIL_Loose], S_POGOPIN);*/
//                           clockpinset(s_clk_1a, s_clock);
//
//
//                        break; 
//              default:
//             
//                if TIStdScreenPrint  
//                    cout << TIWindow <<  "ERROR!  Attempting to PowerUp at corner" << 
//              case " :" <<  doVC[voltage] <<  "that is not defined in PowerUpAtVCorner!!")
//                else
//                    cout << "ERROR!  Attempting to PowerUp at corner" << 
//              case " :" <<  doVC[voltage] <<  "that is not defined in PowerUpAtVCorner!!" << endl;
//                pause;
//             break; 
//            } 
//
//            for (ctlr = 1;ctlr <= TOTAL_EFUSE_CTLR;ctlr++)
//                for (blk = 0;blk < fuseFarmCtlr[ctlr].blocks;blk++)
//                {
//                    ArraySetInteger(readData.rowStop,
//                                    fuseFarmCtlr[ctlr].STPData.fuseROMSize[blk] - 1);
//
//                    readData.compChainStr[1]="";
//
//                    while len(readData.compChainStr[1]) <
//                        fuseFarmCtlr[ctlr].STPData.fuseROMSize[blk] * TechDataLength do
//                        readData.compChainStr[1] = readData.compChainStr[1] +  "0";
//                    for (site = 1;site <= V_Sites;site++)
//                        readData.compChainStr[site] = readData.compChainStr[1];
//
//                    for (margin = 1;margin <= MAX_MARGINMODES;margin++)
//                    {
//                        switch(doMargin[margin]) {
//                          case Mg0  : readData.readMgPat = fuseFarmCtlr[ctlr].readMg0;
//                          case MgN  : readData.readMgPat = fuseFarmCtlr[ctlr].readNorm;
//                          case Mg1A : readData.readMgPat = fuseFarmCtlr[ctlr].readMg1A;
//                          case Mg1B : readData.readMgPat = fuseFarmCtlr[ctlr].readMg1B;
//                        } 
//
//                        WriteString(margString1, doMargin[margin]);
//                        TWParseString( margString1 );
//                        margString1 = margString1 +  "_";
//                        margString1 = margString1 +  twMCC_V;
//                        margString1 = margString1 +  "_";
//                        readString1 = "FRV_" +  margString1;
//
//                        Discard(STDReadFuseROM(codeOption,
//                                readData.results,
//                                fuseFarmCtlr[ctlr].STPData,
//                                ctlr, blk,
//                                readData.rowStart,
//                                readData.rowStop,
//                                readData.readMgPat,
//                                readData.compChainStr,
//                                readData.returnStr,
//                                fuseFarmCtlr[ctlr].blkData[blk].fuseROMData,
//                                readData.errorCode,
//                                readData.MSBPadding,
//                                readString1));
//
//                        allFROMData[ctlr][ blk][ margin][ voltage] =
//                        fuseFarmCtlr[ctlr].blkData[blk].fuseROMData;
//                    } 
//                } 
//
//            if doDisconnectVPP  
//            {
//                STDSetVI(efuseSupply, 0v, SupplyCurrArray[efuseSupply]);
//                STDDisconnect(efuseSupply);
//                doDisconnectVPP = false;
//            } 
//
//        }   /* voltage loop */
//
//        for (site = 1;site <= V_Sites;site++)
//            if V_Dev_Active[site]  
//                for (ctlr = 1;ctlr <= TOTAL_EFUSE_CTLR;ctlr++)
//                    for (blk = 0;blk < fuseFarmCtlr[ctlr].blocks;blk++)
//                        for (margin = 1;margin <= MAX_MARGINMODES;margin++)
//                            for (voltage = 1;voltage <= MAX_VOLTAGES;voltage++)
//                                for row = 0 to
//                                    fuseFarmCtlr[ctlr].STPData.fuseROMSize[blk] - 1 do
//                                    if allFROMData[ctlr][ blk][ 1][ 1][ site][ row] !=
//                                        allFROMData[ctlr][ blk][ margin][ voltage][ site][ row]  
//                                    {
//                                        STDTest_PF_Status[site] = false;
//                                        if TIStdScreenPrint  
//                                        {
//                                            writeString(margString1, doMargin[1]);
//                                            writeString(margString2, doMargin[margin]);
//                                            writeString(vCString1,   doVC[1]);
//                                            writeString(vCString2,   doVC[voltage]);
//
//                                            cout << TIWindow <<  "FRV FAIL ON:  Site " <<  site:2 << 
//                                                    " FROM" <<  ctlr:2 <<  " Block" <<  blk:2 <<  " Row " <<  row:3 << 
//                                                    " Between " <<  margString1:4 <<  " / " << 
//                                                    vCString1:len(vCString1) << 
//                                                    " and " <<  margString2:4 <<  " / " << 
//                                                    vCString2:len(vCString2) << endl;
//                                        } 
//                                    } 
//
//    }   /* if V_Any_Dev_Active */
//
//    STDLogBool("FUSE_ROM_VERIFY", STDTest_PF_Status, true);
//
//    STDTestClose(DevSet_Open);
//
//    if EnableTimer  
//        stopMyTimer("FuseRomVerify_st", timerLVL3, 3);
//
//}   /* FuseROMVerify */
//
//
//void CheckFuseCtlr()
// /*****************************************************************************
//  This procedure will test the basic functionality of a FuseFarm controller. 
//  CheckROM Margin0 is executed to check for unblown fuses.
// 
//  Global Output Variables : 
//  fuseROMProgrammed - CheckMg0 results for all controllers,
//  false = all FuseROMs pass Margin0
//  true  = any FuseROM failed Margin0
//  fuseFarmCtlr
//  checkMg0Results - CheckMg0 results for each controller,
//  false = all FuseROMs pass Margin0
//  true  = any FuseROM failed Margin0
//  *****************************************************************************/
//{
//    IntS site;
//    IntS ctlr;
//    IntS status;
//
//
//    if TIStdScreenPrint  
//        PrintEfusePgmData( "F021" );
//    
//    PowerUpAtEfuseRead(DCsetup_LooseVmin, NORM_FMSU);
//    ClockSet(S_CLOCK1A, false, FreqArr[ DMA ], v[VIH_Loose_Vmin],
//             v[VIL_Loose], S_POGOPIN);
//     /*ClockSet(S_CLOCK2A, false, FreqArr[Freq4], v[VIH_Loose_Vmin],
//              v[VIL_Loose], S_POGOPIN);*/
//    
//             /* Added for PBIST and we need ClockPinSet for Efuse pattern...pasa 8/17/11*/
//    clockpinset(s_clk_1a, s_clock);
//     /*ClockPinSet(S_CLK_2A, S_Clock);
//     ClockStartFreeRun(S_CLOCK1A);*/
//        
//    
//    
//    for (ctlr = 1;ctlr <= TOTAL_EFUSE_CTLR;ctlr++)
//    {
//        if V_Any_Dev_Active  
//        {
//            STDTestOpen(fuseFarmCtlr[ctlr].initCheckTest);
//            STDCmpPattern(fuseFarmCtlr[ctlr].initCheck, DLOG_AS_PATT);
//            STDTestClose(DevSet_Open);
//        } 
//
//        if V_Any_Dev_Active  
//        {
//            STDTestOpen(fuseFarmCtlr[ctlr].runAutoloadTest);
//            STDCmpPattern(fuseFarmCtlr[ctlr].runAutoload, DLOG_AS_PATT);
//            STDTestClose(DevSet_Open);
//        } 
//
//        if V_Any_Dev_Active  
//        {
//            PatternExecute(status, fuseFarmCtlr[ctlr].checkMg0);
//            STDLogPattern(fuseFarmCtlr[ctlr].checkMg0, DLOG_AS_PATT);
//            ArrayCopyBoolean(fuseFarmCtlr[ctlr].checkMg0Results,
//                             V_PF_Status, V_Sites);
//        } 
//
//        for (site = 1;site <= V_Sites;site++)
//            if V_Dev_Active[site]  
//            {
//                if not fuseFarmCtlr[ctlr].checkMg0Results[site]  
//                    fuseROMProgrammed[site] = true;
//            } 
//    } 
//
//    if enableEfuseDOE  
//        if V_Any_Dev_Active  
//            ProgramEfuseDOE( "F021", 1, 1, 15, EF_DOE, false );
//
//
//    FuseROMVerify(FuseRomVerify_st, "F021", VDD, VPP);
//
//}   /* CheckFuseCtlr */
//
//
// /* BEK 30Jun2011 Added for Blizzard decode of the EFuse block */
//void decode_blizz_efuse()
//
//{
//    designinstenumtype inst;
//    StringM readfusechain;
//    StringM cmpfusechain;
//    BoolM tmpresult;
//    IntS site;
//    string[256] readstr;
//    IntS i;
//    IntS j;
//    BoolS save_screenprint;
//    
//
//
//     tmpresult =  pass ;
//    stdefusetestsetup( ff_read, ff_prog );
//
//    for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//    {
//        cmpfusechain[site]  = "";
//        readfusechain[site] = "";
//    }   /* for site := 1 to v_sites do */
//
//    save_screenprint = tistdscreenprint;
//    tistdscreenprint = false;
//    
//    for inst = enumgetfirst( designinstenumtype ) to
//        enumgetlast( designinstenumtype ) do
//        if( efuserec[inst][1].name != "" )  
//        {
//            readfuserom( inst, mg1a, cmpfusechain, readfusechain, tmpresult );
//            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//                if v_dev_active[site]  
//                {
//                    readstr = stringreverse( readfusechain[site] );
//                    for (i = 1;i <= 100;i++)
//                        if( efuserec[inst][i].name != "" )  
//                        {
//                            for (j = 1;j <= efuserec[inst][1].segments;j++)
//                                if efuserec[inst][i].reversed  
//                                    efuserec[inst][i].strvalue[site] = concat( efuserec[inst][i].strvalue[site],
//                                                                              stringreverse( mid( readstr,
//                                                                              efuserec[inst][i].strstart[j],
//                                                                              efuserec[inst][i].strlen[j] ) ) )
//                                else
//                                    efuserec[inst][i].strvalue[site] = concat( efuserec[inst][i].strvalue[site],
//                                                                              mid( readstr, efuserec[inst][i].strstart[j],
//                                                                              efuserec[inst][i].strlen[j] ) );
//                            readstring(  "0b" +  efuserec[inst][i].strvalue[site] ) +  efuserec[inst][i].intvalue[site] ;
//                        }   /* if( efuserec[inst,i].name <> "" ) then */
//                }   /* if v_dev_active[site] then */
//        }   /* if( efuserec[inst,1].name <> "" ) then */
//    
//    tistdscreenprint = save_screenprint;
//    
//    for inst = enumgetfirst( designinstenumtype ) to
//        enumgetlast( designinstenumtype ) do
//        if( efuserec[inst][1].name != "" )  
//            for (i = 1;i <= 100;i++)
//                if( efuserec[inst][i].name != "" )  
//                    if efuserec[inst][i].useint  
//                    {
//                        if efuserec[inst][i].usedec  
//                            stdlogint( efuserec[inst][i].name, efuserec[inst][i].intvalue, tmpresult, 0, 0, "N", in_int, false );
//                        else
//                            stdlogint( efuserec[inst][i].name, efuserec[inst][1].intvalue, tmpresult, 0, 0, "N", in_hex, false );
//                    }  /* if efuserec[inst,i].useint then */
//                    else
//                        stdlogstr( efuserec[inst][i].name, efuserec[inst][i].strvalue, false );
//    
//}   /* decode_bliz_efuse */
//
//
//
