// /****************************************************************************/
// /* Jazz Integrated Program : F771727                                        */
// /*                                                                          */
// /* Program Module   : VLCTProg/efuse.h                                      */
// /* Creation Date    : Mon Apr 25 17:34:07 2011                              */
// /* Jazz Version Used: /apps/chipcreate/jazz/v5.7                            */
// /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
// /*                                                                          */
// /*                              Revision Comments                           */
// /*                                                                          */
// /* 1st char of Rev (0-Z) - major revisions                                  */
// /* 2nd char of Rev (0-Z) - minor revisions                                  */
// /*                                                                          */
// /* Rev : Comment                                     : UserID        : Date */
// /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
// /*                                                                          */
// /* TMX : Added BlizzEfuseDecode                      : BEK      : 30Jun2011 */
// /*                                                                          */
// /*  A0 : Initial version of the VLCT Test Program    : a0271837      :      */
// /*                                                                          */
// /****************************************************************************/

#ifndef EFUSE_H
#define EFUSE_H

#include <Unison.h>
#include <TestwareSupport.h>
#include <DebugVars.h>

#define TOTAL_EFUSE_CTLR 1
#define TOTAL_EFUSE_BLKS 2  // Was 1 in VLCT, but they sized arrays from 0 to this, meaning 2 elements
#define MAX_INSTANCES 146
#define MAX_EFUSE_SEGMENTS 10
#define MAX_EFUSE_ELEMENTS 15

struct FuseInstDataRec 
{
   int rowStart[TOTAL_EFUSE_CTLR][TOTAL_EFUSE_BLKS][MAX_EFUSE_SEGMENTS];
   int rowStop[TOTAL_EFUSE_CTLR][TOTAL_EFUSE_BLKS][MAX_EFUSE_SEGMENTS];
   int instStart[TOTAL_EFUSE_CTLR][TOTAL_EFUSE_BLKS][MAX_EFUSE_SEGMENTS];
   int instStop[TOTAL_EFUSE_CTLR][TOTAL_EFUSE_BLKS][MAX_EFUSE_SEGMENTS];
   int padLSB[TOTAL_EFUSE_CTLR][TOTAL_EFUSE_BLKS][MAX_EFUSE_SEGMENTS];
   int padMSB[TOTAL_EFUSE_CTLR][TOTAL_EFUSE_BLKS][MAX_EFUSE_SEGMENTS];
   int maxSeg[TOTAL_EFUSE_CTLR][TOTAL_EFUSE_BLKS];
   int fuseROMCtlr;
   bool validCtlr[TOTAL_EFUSE_CTLR];
   int totalBlks[TOTAL_EFUSE_CTLR];
   int totalSegs[TOTAL_EFUSE_CTLR];
   int totalBits;
   bool segmentChain[TOTAL_EFUSE_CTLR];
   StringS nullChainStr[TOTAL_EFUSE_CTLR][TOTAL_EFUSE_BLKS][MAX_EFUSE_SEGMENTS];
   StringM progChainStr;
   StringS progTestName;
   StringS readTestName;
};

extern FuseInstDataRec instData[13];

struct ProgDataRec 
{
   IntM rowStart;
   IntM rowStop;
   BoolM rowPreRead;
   IntM MSBPadding;
   StringM progChainStr;
   StringM returnStr;
   bool redundancy;
   bool writeProtect;
   bool readProtect;
   TWDataType sendTWData;
   IntM errorCode;
   BoolM results;
   StringM codeOption;
}; 

extern ProgDataRec progData; 
 
enum FuseMargEnumType {Mg0, MgN, Mg1A, Mg1B};
enum FuseElemEnumType {dummyElement};

enum DesignInstEnumType {FlashChain, NonMBist, MemBist, MBist, PBist, Custom,
                      /* BEK 24May2011 Added for Flash_Test_N Efuse bit */
                      Flash_Test_N, 
                      TIDieID, BG_TEMP_TRIM, TS_OS_TRIM, IREF_TRIM,
                      NWELL_RTRIM,
                      /* BEK 30Jun2011 Added for precision oscillator trim */
                      Piosc_Trim, LastDesignInstEnum };

extern bool fuseROMProgrammed;

void InitializeFuseROMVariables();

//void SendNumFuseROMRepairsToTW();

void LoadEfuseCtlrData();

IntM ReadFuseROM(const StringS &code_option,
                 const DesignInstEnumType &instType,
                 const FuseMargEnumType &margType,
                 const StringM &compChainStr,
                       StringM &returnChainStr,
                       TMResultM &readResults);

TMResultM ProgramFuseROM(const StringS &readCodeOption,
                         const DesignInstEnumType &instType, 
                         const StringM &progChainStr,
                               StringM &returnChainStr);
//
//void ProgramFuseROMElement(  FuseElemEnumType LSBElemType, FuseElemEnumType 
//                                MSBElemType,
//                                    StringM returnChainStr,
//                                    BoolM progResults);
//
//void ProgramFuseROMRepair(DesignInstEnumType instType,
//                                   BoolM progResults);
//
//void RunAutoloadTest(  DesignInstEnumType firstInstType, DesignInstEnumType 
//                          lastInstType,
//                              BoolM runAutoloadResults);
//
//void CheckFuseCtlr();
//
// /* BEK 30Jun2011 Added for Blizzard decode of the EFuse block */
//void decode_blizz_efuse();
//

#endif  // ifndef EFUSE_H


