#include <Unison.h>
#include <string_utils.h>
#include <DspSendUtils.h>

using namespace std;

/* FuseFarm/FuseROM Global Variables */ 
IntS TechRowLen;
IntS TechDataStart;
IntS TechDataLen;
IntS TechRowDataLen;
IntS TechRowDataStart;
IntS ctlrRepairRowStart;
IntS revSCRAM;
BoolS useSCRAM;
BoolS useRow0;
BoolS useECC;
BoolS useDieID;
BoolS useDataNoECC;
IntS ECCLen;
IntS ECCStart;
IntS CRALen;
IntS CRAStart;
IntS CNTLen;
IntS CNTStart;
IntS ROMRedundancyEnable;
IntS EENBit;
IntS WPBit;
IntS RPBit;
IntS RepairBit;
IntS RepairBit2;
IntS ReadRegLen;
StringS ennBitCRAStr;
StringS repairBitCRAStr;
StringS correctRepairBitCRAStr;
StringS readProtectCRAStr;
StringS writeProtectCRAStr;
StringS nonDataStr;
StringS nullECCStr;
StringS nullCRAStr;
StringS nullDataStr;    // STDFROMRowStr
StringS nullRowDataStr; // STDFROMRowStr
StringS nullRowStr;     // STDFROMRowStr
StringS FFCtlrName;
StringS ProgramCRACode;
StringS ProgramCode;
StringS maxFROMRepairStr;
IntS maxFROMBlkAddr;
IntS maxRepairRows;
FloatS maxProgWait;
FloatS maxProgWaitOverride;
BoolS CTLR_BUG_FIX;
BoolS useFROMPwrMgmt;
BoolS onebitRPWP;
BoolS firstReadRow;
BoolS lastReadRow;
BoolS ENABLE_READ_REPAIR_ROWS;
BoolS ENABLE_PROG_WP_TWO_STEPS;
BoolS ENABLE_READ_DW_SC_TTR;
BoolS ENABLE_READ_UD_SC_TTR;
BoolS ENABLE_PROG_WAIT_OVERRIDE;

FloatS timer1;
FloatS timer2;


/******************************************************************************/ 
/******************************************************************************/ 
/****                            FuseFarm                                  ****/ 
/******************************************************************************/ 
/******************************************************************************/ 
  
void FF_ECCHamming(StringS techName, StringS &rowStr) 
{
} /* FF_ECCHamming */
                             
StringS FF_ConvertDigCapArrToStr(UnsignedS1D digCapArr, IntS dataLen, IntS dataLoc) 
 /*****************************************************************************
  This function converts from an Unsigned1D to a StringS.
 *****************************************************************************/ 
 {            
   StringS dataStr;
   
   dataStr = "";
   for (IntS bit = dataLoc; bit < dataLoc+dataLen; bit++)
   {
     if (digCapArr[bit] == 1)  
     // JT 2012/05/18 - see comments below
//       dataStr = "1" + dataStr;
       dataStr += "1";
     else
     // JT 2012/05/18 - see comments below
//       dataStr = "0" + dataStr;
       dataStr += "0";
   } 
   
   // JT 2012/05/18
   // it's faster to build the string from LSB to MSB and reverse 
   // it because when you prepend to the string, it has to shift 
   // everything down in memory to make room for prepended char
   ReverseStringInPlace(dataStr);
   
   return dataStr;
}  /* FF_ConvertDigCapArrToStr */ 

IntS FF_ConvertStringToInt(StringS dataStr)
{
   IntS dec = 0;
   IntS strLen;
   
   strLen = dataStr.Length();
   for (IntS bit = 0; bit < strLen; bit++)
   { 
       // JT 2012/05/18
       // StringS is a char array, so you don't need substring
       // trick is that you have to use '' for char where "" means string
//     if (dataStr.Substring(strLen-bit-1,1) == "1")
      if (dataStr[strLen-bit-1] == '1')
         dec += (1 << bit);
   } 

   return dec;  
} /* FF_ConvertStringToInt */

BoolS FF_GetRepairBit(StringS techName, StringS FROMRowStr) 
/*****************************************************************************
  This function will return TRUE if the repair bit(s) are set.
 *****************************************************************************/ 
{
  BoolS returnStatus = false;
           
  if (FROMRowStr.Length() == TechRowLen)  
  {
    if (CNTLen == 2) /* Control bits RP/WP, WP */ 
    {
      if (FROMRowStr.Substring(CNTStart - 1, 2) == "11")  
        returnStatus = true;
    }
    else
    {      
    // JT 2012/05/18
    // use a char comparison, not string here
//      if (FROMRowStr.Substring(RepairBit - 1, 1) == "1")  
      if (FROMRowStr[RepairBit - 1] == '1')  
        returnStatus = true;
    } 
  } 
  
  return returnStatus;
}  /* FF_GetRepairBit */ 

void FF_SetCodeFlags(StringS &codeOption, StringS &techName) 
/*****************************************************************************
  This function will set the code option flags. 
*****************************************************************************/ 
{
  useDieID = false;
  if (codeOption.Find("DIEID") > 0)  
    useDieID = true;

  useECC = false;
  if (codeOption.Find("ECC") > 0)  
    useECC = true;

  useDataNoECC = false;
  if ((codeOption.Find("26") > 0) || // F021,GS80
      (codeOption.Find("19") > 0))   // SR80 
    useDataNoECC = true;

  useFROMPwrMgmt = true;
  if ((techName == "C027") ||
      (techName == "C021") ||
      (techName == "GS60"))  
    useFROMPwrMgmt = false;

  FFCtlrName = "";
  if ((techName == "C027") ||
      (techName == "C021"))  
    FFCtlrName = "old"; 
}  /* FF_SetCodeFlags */ 

void FF_InitFROMVars(StringS &techName) 
/*****************************************************************************
  This function initializes global FuseFarm/FuseROM variables.

  C027:
    |<-------------- ROW --------------->|
    
     CNT                DATA
    +...+................................+
     123 45678911111111112222222222333333
               01234567890123456789012345

    |<----------- ROW DATA ------------->|

  F021,GS80:
    |<------------------ ROW ------------------>|

      CRA   CNT            DATA
    +......+...+................................+
     123456 789 11111111112222222222333333333344
                01234567890123456789012345678901


      CRA   CNT  ECC             DATA
    +......+...+......+..........................+
     123456 789 111111 11112222222222333333333344
                012345 67890123456789012345678901

           |<----------- ROW DATA ------------->|

  C021,GS60,GS60CP,GS70:
    |<------------------ ROW ------------------>|

      CRA   CNT            DATA
    +......+...+................................+
     123456 789 11111111112222222222333333333344
                01234567890123456789012345678901

           |<----------- ROW DATA ------------->|

  SR70:
    |<----------------- ROW ------------------>|
 
      CRA   CNT             DATA  
    +......+..+................................+
     123456 78 91111111111222222222233333333334
                0123456789012345678901234567890

           |<---------- ROW DATA ------------->|

  SR80:
    |<-------------- ROW -------------->|
 
      CRA CNT  ECC          DATA  
    +.....+..+......+...................+
     12345 67 891111 1111112222222222333
                0123 4567890123456789012

          |<-------- ROW DATA --------->|

  MTC85:
    |<-------------- ROW ------------->|
 
      CRA   CNT             DATA  
    +.....+..+.........................+
     12345 67 8911111111112222222222333
                01234567890123456789012

          |<-------- ROW DATA -------->|
  
 *****************************************************************************/ 
{
  if (techName == "C027")  
  {
  }
  else if (techName == "F021")  
  {
    TechRowLen                = 41;
    TechRowDataStart          = 7;

    if (useDataNoECC || useECC)  
    {
      EENBit                  = 9;
      ECCStart                = 10;
      ECCLen                  = 6;
      TechDataStart           = 16;
      TechDataLen             = 26;
      nonDataStr              = "000000000000000"; /*15*/ 
      nullDataStr             = "00000000000000000000000000"; /*26*/ 
      nullECCStr              = "000000"; /*6*/ 
    }
    else /* Data32 */ 
    {
      ECCLen                  = 0;
      TechDataStart           = 10;
      TechDataLen             = 32;
      nonDataStr              = "000000000"; /*9*/ 
      nullDataStr             = "00000000000000000000000000000000"; /*32*/    
    } 

    TechRowDataLen            = 35;
    CRAStart                  = 1;
    CRALen                    = 6;
    CNTStart                  = 7;
    CNTLen                    = 3;
    ROMRedundancyEnable       = 35;
    WPBit                     = 7;
    RPBit                     = 7;
    RepairBit                 = 8;
    ReadRegLen                = 10;
    correctRepairBitCRAStr    = "111100";
    repairBitCRAStr           = "100010"; 
    readProtectCRAStr         = "100011"; 
    writeProtectCRAStr        = "100011";
    ennBitCRAStr              = "100001";
    nullCRAStr                = "000000"; /*6*/ 
    nullRowDataStr            = "00000000000000000000000000000000000"; /*35*/ 
    nullRowStr                = "00000000000000000000000000000000000000000"; /*41*/ 
    ProgramCRACode            = "00010";
    ProgramCode               = "00111";
    maxFROMBlkAddr            = 63;
    maxFROMRepairStr          = "1,3,5";
    maxProgWait               = 2msec;
    ctlrRepairRowStart        = 1;
    useRow0                   = true;
    onebitRPWP                = true;
  }
  else
  {
  }
} /* FF_InitFROMVars */

StringS FF_GetTechName(StringS &codeOption)  
/*****************************************************************************
  This function will get the technology name from the codeOption string.
 *****************************************************************************/ 
{
  StringS techName;
    
  techName = codeOption;
    
  if (techName.Find("_") > 0)  
    techName = techName.Substring(0, techName.Find("_"));
  
  return(techName);
}  /* FF_GetTechName */ 


// JT 2012/05/18
// Maybe use string_utils version IntToBinStr instead?
StringS FF_DectoBinStr(IntS decimal, IntS strLen)    
/*****************************************************************************
  This function converts an integer to a N-bit string, MSB padded with 0's.
 *****************************************************************************/ 
 {
   IntS bit;
   StringS binary = "";
   IntS mask = 1;
   
   for (bit = 0; bit < strLen; bit++)
   {
     if ((mask & decimal) >= 1)
       binary = "1" + binary;
     else
       binary = "0" + binary;
     mask <<= 1;
   }
   
   return binary;
}  /* FF_DectoBinStr */ 

StringML FF_DectoVecStr(IntM decimal, IntS strLen)    
/*****************************************************************************
  This function converts an integer into a StringML for vector data.
 *****************************************************************************/ 
 {
   IntS bit;
   StringML vectorData;
   IntS mask = 1;
   
   for (bit = 0; bit < strLen; bit++)
   {
     if ((decimal & mask) >= 1)
       vectorData += "H";
     else
       vectorData += "L";
     mask <<= 1;
   }
   
   return vectorData;
}  /* FF_DectoVecStr */ 

void PatternDigitalCapture(StringS patternBurst, PinML capturePins, StringS capName, UnsignedS maxCapCount, 
                           UnsignedM1D &captureArr, const UnsignedM1D &simValue)
{
   BoolM timed_out;
  
   DIGITAL.DefineParallelCapture(capturePins, capName, maxCapCount);
   DIGITAL.StartCapture(capName);
   DIGITAL.ExecutePattern(patternBurst);
   timed_out = DIGITAL.WaitForCapture(capName);
   DIGITAL.ReadCapture(capName, captureArr, simValue);
   if (timed_out.AnyEqual(true)) 
   {
      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
      {
         if (timed_out[*si])
         {
            cout << "Digital capture timed out on site " << *si << " for thread " 
                 << patternBurst << " capture " << capName << endl;
         }
      }
   }
} /* PatternDigitalCapture */

BoolM STDReadFuseRow(StringS &techName,
//                   FuseROMCtlr STDFuseFarmRec,
                     IntS &ctlrNum,
                     IntS &blkNum,
                     IntM rowAddr,
                     StringS &readPattern,
                     StringM &readRowStr,
                     IntM &readError) 
/*****************************************************************************
  This function is used to read a FROM row.
 *****************************************************************************/ 
{
  StringS digPatName;
  PinML digSrcPin;
  PinML digCapPin;
  UnsignedM1D digCapArr;
  IntS digCapLen;
  StringS digCapRef;
  UnsignedM1D simValue(41,0);
  BoolM readRowStatus = true;
  UnsignedM send_uint;
  UnsignedM1D send_data(1);
  StringS send_name = "FF_ReadRowAddr";
  StringS send_ref = "FF_ReadRow_sref";
  
  readError = 0;
  readRowStr = nullRowStr;
  
  /*********************************************/ 
  /* Add block and row address to source array */ 
  /*********************************************/  
  IntM send_int = ((blkNum << 11) + rowAddr) & 0xFFFF;
  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
    send_uint[*si] = unsigned(send_int[*si]); 
  send_data.SetValue(0, send_uint);
  
  digSrcPin = "PA2_48";
  
  if (!IsDspSendDefined(send_name))
  {
    // 1 word, 16 bits per word using LSB first
    DIGITAL.DefineSerialSend(digSrcPin, send_name, send_ref, 1, 16, WORD_LSB_FIRST);
  }
  
  DIGITAL.LoadSend(send_name, send_data);
  DIGITAL.StartSend(send_name);
  
  digCapPin = "o_cpu_fail_47";
  digCapRef = "CapFF";
  digCapLen = TechRowLen;

  /*****************/ 
  /* Read row data */ 
  /*****************/   
  PatternDigitalCapture(readPattern, digCapPin, digCapRef, digCapLen, digCapArr, simValue);
  
  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
  {
    if (false) // not V_PF_Status[site]  
    {
      readError[*si] = 50;
      readRowStatus[*si] = false;
//    DevSetHoldState(site, FALSE);
    }
    else
    {
      /******************************************************/ 
      /* Convert read row data from capture array to string */ 
      /******************************************************/ 
      readRowStr[*si] = FF_ConvertDigCapArrToStr(digCapArr[*si], TechRowLen, 0);
    } 
    
    if (true) // TIStdScreenPrint or TIStdSumScrPrint  
    {
      cout << "Site " << *si
           << " FROM " << ctlrNum << " Block " << blkNum
           << " Row " << rowAddr[*si]
           << " Read Error: " << readError[*si]
           << " Status: " << readRowStatus[*si]
           << endl;
      cout << "  Read:    ";
      
      if (readRowStr[*si].Length() == TechRowLen)  
      {
        if (CRALen > 0)  
          cout << readRowStr[*si].Substring(CRAStart - 1, CRALen) << " ";
        cout << readRowStr[*si].Substring(CNTStart - 1, CNTLen) << " ";
        if (ECCLen > 0)  
          cout << readRowStr[*si].Substring(ECCStart - 1, ECCLen) << " ";
        cout << readRowStr[*si].Substring(TechDataStart - 1, TechDataLen) << endl;
      }
      else
        cout << readRowStr[*si] << endl;   
    }   
  }
  
  return readRowStatus;
} /* STDReadFuseRow */
 
TMResultM STDReadFuseROM(StringS codeOption,
//                    FuseROMCtlr STDFuseFarmRec,
                     IntS ctlrNum, IntS blkNum,
                     IntM rowStart, IntM rowStop,
                     StringS readPattern,
                     StringM initDataStr,
                     StringM &returnDataStr,
//                    FuseROMData STDFROMDataArr,
                     IntM &errorCode,
                     IntM MSBPadding,
                     StringS TWVarName)  
{
  TMResultM readDataStatus = TM_PASS;
  
  IntS si;
  IntS index;
  IntM currRowAddr;
  IntM rowAddr;
  IntM LSBPadding;
  Sites readTested;
  BoolM allSitesInactive;
  BoolM readRowStatus;
  StringS techName;
//  StringML blkStr;
  StringS ctlrTWStr;
  StringS blkTWStr;
  StringS rowTWStr;
  StringS rowDataTWStr;
  StringS TWStr;
  StringM actReadRowStr;
  StringM saveInitDataStr;
  IntS firstRowStart; 
  IntS firstRowStop;
  BoolS uniqueSrcData;
  IntS siteSrcData;
  Sites devActive = ActiveSites;
  
  techName = FF_GetTechName(codeOption);
  FF_SetCodeFlags(codeOption, techName);
  FF_InitFROMVars(techName);
  
  firstReadRow = true;
  lastReadRow = false;

  LSBPadding = 0;
  errorCode = 0;

  readTested = ActiveSites;

  //ArrayCopyBoolean(readDataStatus, V_Dev_Active, V_Sites);
  
  saveInitDataStr = initDataStr;
      
  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
  { 
    if (initDataStr[*si].Length() > 0)
    {
      if (MSBPadding[*si] > 0)  
      {
        for (index = 1; index <= MSBPadding[*si]; index++)
          initDataStr[*si] += "0";
      } 

      if (((initDataStr[*si].Length() % TechDataLen) > 0) || 
          (initDataStr[*si].Length() < TechDataLen))  
      {
        LSBPadding[*si] = TechDataLen - (initDataStr[*si].Length() % TechDataLen);

        while ((initDataStr[*si].Length() % TechDataLen) > 0)
          initDataStr[*si] = "0" + initDataStr[*si];
      } 
    }
    else
    {
      /***************************************************/ 
      /* If initial data string empty, make it all zeros */ 
      /***************************************************/ 
      if (rowStop[*si] >= rowStart[*si])
      {
        for (index = 1; index <= (rowStop[*si] - rowStart[*si] + 1); index++)
          initDataStr[*si] += nullDataStr;
      }
    }
  } 
  
//  devActive -= SITE_1;
//  cout << devActive << endl;
//  RunTime.SetActiveSites(devActive);
//  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//  {
//    cout << "SITE_LOOP=" << *si << endl;
//  }    
  
  if (devActive != NO_SITES) // (!ActiveSites.Begin().End()) // V_Any_Dev_Active
  {
//    blkStr = FF_DectoVecStr(blkNum, 5);
    
    rowAddr = rowStart;
    currRowAddr = rowStart;
    
    /*******************/ 
    /* Start read flow */ 
    /*******************/
    while (devActive != NO_SITES) // V_Any_Dev_Active
    {
      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
      {
        if (currRowAddr[*si] > rowStop[*si])
        {
          devActive -= *si;
        }
      }
      
//      RunTime.SetActiveSites(devActive);
      
      /*****************/ 
      /* Read row data */ 
      /*****************/ 
      if (devActive != NO_SITES) // V_Any_Dev_Active
      {
        readRowStatus = 
          STDReadFuseRow(techName, // FuseROMCtlr,
                         ctlrNum, blkNum, currRowAddr,
                         readPattern, actReadRowStr, errorCode);
      }        

      if (devActive != NO_SITES) // V_Any_Dev_Active)
      {
        for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
        {
          /*******************************************/ 
          /* Copy read row data to global FROM array */ 
          /*******************************************/ 
//        FuseROMData[site,currRowAddr[site]] = actReadRowStr[site];

          /* Send TW Data */
        
          if ((errorCode[*si] > 1) || (actReadRowStr[*si].Length() != TechRowLen))  
          {
            devActive -= *si;
            readDataStatus[*si] = TM_FAIL;
            readTested -= *si;
          }
          else
          {
            /*******************************************/ 
            /* Check for the RepairBit on the read row */ 
            /*******************************************/ 
            if (FF_GetRepairBit(techName, actReadRowStr[*si]))
            {
              if (currRowAddr[*si] < 5) // (currRowAddr[site] < FuseROMCtlr.MaxFROMRepairs[blkNum])
              {
                devActive -= *si;
                readDataStatus[*si] = TM_FAIL;
                readTested -= *si;
              }
              else
              {
                /********************************************/ 
                /* Row RepairBit set, change address to the */ 
                /* correct controller repair row            */ 
                /********************************************/ 
                switch(5) // FuseROMCtlr.MaxFROMRepairs[blkNum]
                {
                  case 1:
                    devActive -= *si;
                    readDataStatus[*si] = TM_FAIL;
                    readTested -= *si;
                    break; 
                  case 2:
                  case 3:
                  case 4:
                  case 5:
                  case 9:
//                  currRowAddr[*si] = (currRowAddr[*si] % (FuseROMCtlr.MaxFROMRepairs[blkNum] - ord(useRow0))) + ctlrRepairRowStart;
                    currRowAddr[*si] = (currRowAddr[*si] % (5 - IntS(useRow0))) + ctlrRepairRowStart;
                    break; 
                  default:
                    devActive -= *si;
                    readDataStatus[*si] = TM_FAIL;
                    readTested -= *si;
                    break; 
                }             
              }
            }
            else
            {
              /******************************************/ 
              /* Add row data to the return data string */ 
              /******************************************/ 
              returnDataStr[*si] = actReadRowStr[*si].Substring(TechDataStart - 1, TechDataLen) + returnDataStr[*si];

              /*************************/ 
              /* Increment row address */ 
              /*************************/ 
              rowAddr[*si] = rowAddr[*si] + 1;
              currRowAddr[*si] = rowAddr[*si];
            }
          }
        }
      }
      
//      RunTime.SetActiveSites(devActive);      
    }  
  }
  
//  RunTime.SetActiveSites(readTested);

  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
  {
    if (true)
    {
      /*********************************************************/ 
      /* Pad return data string with zeros if incorrect length */ 
      /*********************************************************/
      while (returnDataStr[*si].Length() < initDataStr[*si].Length())
        returnDataStr[*si] = "0" + returnDataStr[*si];

      /*********************************************************/ 
      /* If padding > 0, return only the program string length */ 
      /*********************************************************/ 
      returnDataStr[*si] = returnDataStr[*si].Substring(LSBPadding[*si], returnDataStr[*si].Length() - (MSBPadding[*si] + LSBPadding[*si]));

      if (readDataStatus[*si]==TM_PASS)  
      {
        if ((errorCode[*si] == 0) && (returnDataStr[*si] != saveInitDataStr[*si]))  
          errorCode[*si] = 1;

        if (errorCode[*si] == 0)  
          readDataStatus[*si] = TM_PASS;
        else
        {
          if (errorCode[*si] == 1)  
            readDataStatus[*si] = TM_FAIL;
        } 
      }
    }
  }
      
  return readDataStatus;
} /* STDReadFuseROM */      


TMResultM STDProgramFuseRow(IntS version, 
                        StringS techName,
//                      FuseROMCtlr STDFuseFarmRec,
                        IntS ctlrNum, IntS blkNum,
                        BoolM repairStep,
                        IntM rowAddr,
                        StringM progRowStr,
                        StringM expReadRowStr,
                        StringS progPattern,
                        StringM &readRowStr,
//                      FuseROMData STDFROMDataArr,
                        IntM &progError,
                        IntM &progAccumulator,
                        IntM &numRepairBits)  
/*****************************************************************************
  This function is used to program a FROM row using Modify/Capture.
 *****************************************************************************/
{
   TMResultM progRowStatus = TM_PASS;

   IntS dwBits;
   IntS strLen;
   IntS sourceBits;
   IntS FROM_CLK_chan;
   BoolM restoreActiveSites;
   BoolM checkCRA;
   BoolM checkWPbit;
   BoolM allSitesInactive;
//   option  :  boardOption ;
   StringM progErrorStr;
   StringM progAccumulatorStr;
//   WPcheckError            : MSString40Array;
   StringM rowAddrStr;
   IntM actProgError;
  
//   ArrayCopyBoolean(progRowStatus, V_Dev_Active, V_Sites);
//   ArrayCopyBoolean(restoreActiveSites, V_Dev_Active, V_Sites);   
  progError = 0;
  progAccumulator = 0;
  checkCRA = false;
//   ArraySetBoolean(checkWPbit, FALSE);
//   ArraySetBoolean(allSitesInactive, FALSE);

  StringS digPatName;
  StringS digSrcPin = "PA2_48";
  PinML digCapPin = "o_cpu_fail_47";
  UnsignedM1D digCapArr;
  UnsignedS digCapLen;
  StringS digCapRef = "CapFF";

  UnsignedM1D simValue(121,0);
  IntM send_int;
  const int num_bits_per_chunk = 16;
  // calculate number of send samples, use TechDataLen, CRALen and ProgCode length
  // then divide by 16-bit words and round up. Finally, add one for address.
  // This is needed because with DSP Send on a DPIN96, we are only allowed one send
  // per pattern, so we have to stuff the address, data, and codes in to one send.
  // We will pack things in so that unused space goes at the end, which the pattern
  // doesn't increment through.
  IntS send_length = int(MATH.LegacyRound(FloatS(double(TechDataLen + CRALen + 5) / double(num_bits_per_chunk) + 0.5))) + 1;
  UnsignedM1D send_data(send_length, 0);
  int i, num_words, num_chars_left;
  StringS strProgData, strCRAData, strProgCode, strData;
  StringS send_name = "FF_ProgramRow";
  StringS send_ref = "FF_ProgramRow_sref";
  

  /*******************************/ 
  /* Build row and block address */ 
  /*******************************/   
  send_int = ((blkNum << 11) + rowAddr) & 0xFFFF;
   
  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
  {      
    send_data[*si][0] = unsigned(send_int[*si]);
    
    /******************/ 
    /* Build row data */ 
    /******************/ 
    strProgData = progRowStr[*si].Substring(TechDataStart-1, TechDataLen);
          
    /******************************/ 
    /* Build CRA and program code */ 
    /******************************/ 
    if (CRALen > 0)
    {    
      strCRAData = progRowStr[*si].Substring(CRAStart-1, CRALen);
             
      if (strCRAData != nullCRAStr) 
      {
        strProgCode = "00010";
     
        checkCRA[*si] = true;

        numRepairBits[*si]++;
      }
      else
      {
        strProgCode = "00111";
        strCRAData = "000000";       
      }
    } else {
      strCRAData = "";
      strProgCode = "";
    }
    // Now build a string of all the pieces
    // To get the data stream to work out properly when sent
    // LSB-first, we have to reorder the pieces in reverse. 
    strData = strProgCode + strCRAData + strProgData;
    
    // Now break the string into 16-bit words.
    // Since we are sending LSB-first, start from the end of the string
    strLen = strData.Length();
    num_words = strLen / num_bits_per_chunk;
    num_chars_left = strLen % num_bits_per_chunk;
    for (i = 1; i <= num_words; ++i)  // remember, word 0 was used for address
    {
      send_data[*si][i] = BinStringToUnsigned(strData.Substring(strLen - (num_bits_per_chunk * i), num_bits_per_chunk), true);
    }
    if (num_chars_left != 0) // we have unconverted bits
    {
      send_data[*si][i] = BinStringToUnsigned(strData.Substring(0, num_chars_left), true);
    }
  } 
   
  if (!IsDspSendDefined(send_name))
  {
    DIGITAL.DefineSerialSend(digSrcPin, send_name, send_ref, send_length, num_bits_per_chunk, WORD_LSB_FIRST);
  }
  
  DIGITAL.LoadSend(send_name, send_data);
  DIGITAL.StartSend(send_name);
 
  digCapLen = 16 + TechRowDataLen + 5 + 24 + TechRowLen; //+ CRALen;

  PatternDigitalCapture(progPattern, digCapPin, digCapRef, digCapLen, digCapArr, simValue); 
  
  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
  {
    /**************/
    /* Simulation */
    /**************/
    if (false)
    {
      readRowStr[*si] = progRowStr[*si];

      for (IntS i = 0; i < 51; i++)
        digCapArr[*si][i] = 0; 
 
      IntS i = 51;
      digCapArr[*si][i] = 0; i++; // Program Error
      digCapArr[*si][i] = 0; i++;
      digCapArr[*si][i] = 0; i++;    
      digCapArr[*si][i] = 0; i++;   
      digCapArr[*si][i] = 0; i++;  
      digCapArr[*si][i] = 0; i++; // Accumulator
      digCapArr[*si][i] = 0; i++;  
      digCapArr[*si][i] = 0; i++;      
      digCapArr[*si][i] = 0; i++;      
      digCapArr[*si][i] = 0; i++;     
      digCapArr[*si][i] = 0; i++;      
      digCapArr[*si][i] = 0; i++;      
      digCapArr[*si][i] = 0; i++;      
      digCapArr[*si][i] = 0; i++;      
      digCapArr[*si][i] = 0; i++;  
      digCapArr[*si][i] = 0; i++;      
      digCapArr[*si][i] = 0; i++;      
      digCapArr[*si][i] = 0; i++;      
      digCapArr[*si][i] = 0; i++;      
      digCapArr[*si][i] = 0; i++;      
      digCapArr[*si][i] = 0; i++;      
      digCapArr[*si][i] = 0; i++;      
      digCapArr[*si][i] = 0; i++;  
      digCapArr[*si][i] = 0; i++;  
      digCapArr[*si][i] = 0; i++;
      digCapArr[*si][i] = 0; i++;  
      digCapArr[*si][i] = 0; i++;  
      digCapArr[*si][i] = 0; i++;  
      digCapArr[*si][i] = 0; i++;     
    
      strLen = readRowStr[*si].Length();
      for (IntS bit = 0; bit < strLen; bit++)
      { 
        if (readRowStr.Substring(strLen-bit-1, 1) == "1")
          digCapArr[*si][80+bit] = 1;
        else
          digCapArr[*si][80+bit] = 0;  
      }
    }      

    if (false) // not V_PF_Status[site]  
    {
      progError[*si] = 50;
      progRowStatus[*si] = TM_FAIL;
//    DevSetHoldState(site, FALSE);
    }
    else
    {
      /***************************************************************/ 
      /* Convert error, accumulator and read data from capture array */ 
      /***************************************************************/ 
      progErrorStr[*si] = FF_ConvertDigCapArrToStr(digCapArr[*si], 5, 16+35); 
      progAccumulatorStr[*si] = FF_ConvertDigCapArrToStr(digCapArr[*si], 24, 16+35+5); 
      readRowStr[*si] = FF_ConvertDigCapArrToStr(digCapArr[*si], TechRowLen, 16+35+5+24);
      
      actProgError[*si] = FF_ConvertStringToInt(progErrorStr[*si]);
      progAccumulator[*si] = FF_ConvertStringToInt(progAccumulatorStr[*si]);
    }   
    
    /*******************************************/ 
    /* Copy read row data to global FROM array */ 
    /*******************************************/ 
//    FuseROMData[site,rowAddr[site]] = readRowStr[site];

//    FF_CheckProgErrorCodes();    
  }

  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
  {      
    if (true) // TIStdScreenPrint 
    {
      cout << "Site " << *si
           << " FROM " << ctlrNum << " Block " << blkNum
           << " Row " << rowAddr[*si]
           << " Program Error: " << progError[*si]
           << "[" << actProgError[*si] << "]"
           << " Accumulator: " << progAccumulator[*si]
           << " Status: " << progRowStatus[*si] 
           << endl;
           
      cout << "  Program: ";
      if (progRowStr[*si].Length() == TechRowLen)  
      {
        if (CRALen > 0)  
          cout << progRowStr[*si].Substring(CRAStart-1, CRALen) << " ";
        cout << progRowStr[*si].Substring(CNTStart-1, CNTLen) << " ";
        if (ECCLen > 0)  
          cout << progRowStr[*si].Substring(ECCStart-1, ECCLen) << " ";
        cout << progRowStr[*si].Substring(TechDataStart-1, TechDataLen) << endl;
      }
      else
        cout << progRowStr[*si] << endl; 
        
      cout << "  Read:    ";
      if (readRowStr[*si].Length() == TechRowLen)  
      {
        if (CRALen > 0)  
          cout << readRowStr[*si].Substring(CRAStart-1, CRALen) << " ";
        cout << readRowStr[*si].Substring(CNTStart-1, CNTLen) << " ";
        if (ECCLen > 0)  
          cout << readRowStr[*si].Substring(ECCStart-1, ECCLen) << " ";
        cout << readRowStr[*si].Substring(TechDataStart-1, TechDataLen) << endl;
      }
      else
        cout << readRowStr[*si] << endl;   
    }
  }
  
  return progRowStatus;
} /* STDProramFuseROW */


TMResultM STDProgramFuseROM(StringS codeOption,
//                      FuseROMCtlr STDFuseFarmRec,
                        IntS ctlrNum, IntS blkNum,
                        IntM rowAddrStart,
                        StringM initDataStr,
//                      fusePatterns STDFuseFarmPatArr,
                        StringS progPattern,
                        BoolS writeProtect,
                        BoolS readProtect,
                        BoolS enableRedundancy,
//                      TWDataLevel TWDataType,
                        IntM numRepairRows,
                        StringM &returnDataStr,
//                      FuseROMData STDFROMDataArr,
                        IntM &errorCode,
                        IntM MSBPadding,
                        BoolM preReadRow,
//                      FROM_CLK_Pin PinList,
                        IntM &numRepairBits)
                        
{
  TMResultM progDataStatus;

  IntS index;
  IntS unProgrammedBits;
  IntS unMatchedBits;
  IntS vector;
  IntS FROM_CLK_chan;
  IntM stepNum;
  IntM stepCnt;
  IntM repairRowAddr;
  IntM rowAddr;
  IntM nextRowAddr;
  IntM RDRowAddr;
  IntM accumulatorNum;
  IntM lastRowAddr;
  IntM LSBPadding;
  IntM1D stepRepairRowAddr;
  IntM1D stepRowAddr(128, 0);
  StringM1D stepRowDataStr(128, "");
  BoolS clearCheckRowData;
  BoolS clearReadAccumulator;
  BoolM repairStep;
  BoolM sitesToProg;
  BoolM sitesToRead;
  BoolM sitesToRestore;
  TMResultM returnRowStatus;
  BoolM preReadRowDone;
  StringS repairRowDataStr;
  StringS tmpRowStr;
  StringM origRowDataStr;
  StringM currRowDataStr;
  StringM rowDataStr;
  StringM actRowDataStr;
  StringM expRowDataStr; 
  StringM mergeRowDataStr;
  StringS vecPinData;
  StringS CRAString;
  StringML blkStr;
  StringS techName;
// option  :  FROM_CLK_option ;
// option  :  boardOption ;
  BoolS onlyColRepair;
  BoolS rowChange;
  IntS rowNum;
  IntM readRowAddr;
  IntS firstRowAddr;
  BoolS uniqueSrcData;
  IntS siteSrcData;
  BoolS firstActiveSiteFound;  
  
  techName = FF_GetTechName(codeOption);
  FF_SetCodeFlags(codeOption, techName);
  FF_InitFROMVars(techName); 

  onlyColRepair = false;
  if (techName == "F021")
  {
    onlyColRepair = readProtect;

    /********************************************/ 
    /* Use write protect for the protection bit */ 
    /********************************************/ 
    readProtect = false;  
  }
  
  if (CNTLen == 2) /* Control bits RP+WP, WP */ 
  {
    /****************************************/ 
    /* Read protect will also write protect */ 
    /****************************************/ 
    if (readProtect)  
      writeProtect = false;
  } 

  stepNum = 1;  
  repairRowAddr = -1;
  RDRowAddr = -1;
  LSBPadding = 0;
  errorCode = 0;
  stepCnt = 0;
  repairStep = false;
//  ArrayCopyBoolean(sitesToRestore, V_Dev_Active, V_Sites);
//  ArrayCopyBoolean(progDataStatus, V_Dev_Active, V_Sites);
//  ArrayCopyBoolean(sitesToProg, V_Dev_Active, V_Sites);
  
  if (true) // V_Any_Dev_Active
  {
    StringM progDataStr = initDataStr;
    IntS currRowAddr;
    
    for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
    {
      currRowAddr = rowAddrStart[*si];

      /*****************************/ 
      /* Parse program data string */ 
      /*****************************/  
      while (progDataStr[*si] != "")
      {
        /*************************/ 
        /* Increment step number */ 
        /*************************/ 
        stepCnt[*si] = stepCnt[*si] + 1;

        /************************/ 
        /* Set step row address */ 
        /************************/ 
        stepRowAddr[*si][stepCnt[*si]-1] = currRowAddr;

        /*********************/ 
        /* Set step row data */ 
        /*********************/ 
        if (progDataStr[*si].Length() < TechDataLen)  
        {
//          /************************************/ 
//          /* Partial row data, pad with zeros */ 
//          /************************************/ 
//          stepRowDataStr[stepCnt[site],site] = progDataStr[site];
//     
//          while (len(stepRowDataStr[stepCnt[site],site]) < TechDataLen) do
//          {
//            stepRowDataStr[stepCnt[site],site] =
//              concat('0', stepRowDataStr[stepCnt[site],site]);
//          } 
//
          progDataStr[*si] = "";   
        }
        else
        {
          /*******************************/ 
          /* Get one row of program data */ 
          /*******************************/ 
          stepRowDataStr[*si][stepCnt[*si]-1] =
            progDataStr[*si].Substring(progDataStr[*si].Length() - TechDataLen, TechDataLen);

          /***************************************/ 
          /* Remove row from program data string */ 
          /***************************************/ 
          progDataStr[*si] = progDataStr[*si].Substring(0, progDataStr[*si].Length() - TechDataLen);
        } 

        /**************************/ 
        /* Add zeros for full row */ 
        /**************************/ 
        stepRowDataStr[*si][stepCnt[*si]-1] = nonDataStr + stepRowDataStr[*si][stepCnt[*si]-1];

        if (useECC)  
        {
          /***********************/ 
          /* Add ECC bits to row */ 
          /***********************/ 
          if (!preReadRow[*si])  
            FF_ECCHamming(techName, stepRowDataStr[*si][stepCnt[*si]-1]);
        } 
//
//        /********************************************************/ 
//        /* No new data to program, set RPBit or WPBit if needed */ 
//        /********************************************************/ 
//        if (stepRowDataStr[stepCnt[site],site] = nullRowStr)  
//        {
//          if not (writeProtect or readProtect or useECC)  
//            stepCnt[site] = stepCnt[site] - 1;
//          else
//          {
//            if readProtect  
//              stepRowDataStr[stepCnt[site],site,RPBit] = '1';
//
//            if writeProtect  
//              stepRowDataStr[stepCnt[site],site,WPBit] = '1'; 
//          } 
//        }
//        else
//        {
//          if (not readProtect) and (not ENABLE_PROG_WP_TWO_STEPS)  
//          {
//            if writeProtect  
//              stepRowDataStr[stepCnt[site],site,WPBit] = '1';
//          }
//          else
//          {
//            /**************************************/ 
//            /* Program WP, RP or RP/WP in 2 steps */ 
//            /**************************************/ 
//            if readProtect or 
//               (writeProtect and ENABLE_PROG_WP_TWO_STEPS)  
//            {
//              stepCnt[site] = stepCnt[site] + 1;
//
//              stepRowAddr[stepCnt[site],site] = currRowAddr;
//
//              stepRowDataStr[stepCnt[site],site] =
//                stepRowDataStr[stepCnt[site] - 1,site];
//            } 
//
//            if readProtect   
//              stepRowDataStr[stepCnt[site],site,RPBit] = '1';
//
//            if writeProtect  
//              stepRowDataStr[stepCnt[site],site,WPBit] = '1';
//          } 
//        } 

        /*************************/ 
        /* Increment row address */ 
        /*************************/ 
        currRowAddr = currRowAddr + 1;
      } 

      /*************************************/ 
      /* To avoid bug when Row0 programmed */ 
      /*************************************/ 
      stepRowAddr[*si][stepCnt[*si]-1+1] = -1;
    } 
   
    /*******************/
    /* First step data */
    /*******************/
    rowAddr = stepRowAddr[0];
    rowDataStr = stepRowDataStr[0];
    origRowDataStr = rowDataStr; 
    expRowDataStr = rowDataStr ; 
    if (false) // CTLR_BUG_FIX
      mergeRowDataStr = rowDataStr;
    returnDataStr = ""; 
    
    for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
    {
//      while (returnDataStr[*si].Length() < ((rowAddr[*si] - rowAddrStart[*si]) * TechDataLen))
//        returnDataStr[*si] = nullDataStr + returnDataStr[*si];

      if ((initDataStr[*si].Length() % TechDataLen) > 0)  
        lastRowAddr[*si] = (initDataStr[*si].Length() / TechDataLen) + rowAddrStart[*si];
      else
        lastRowAddr[*si] = ((initDataStr[*si].Length() / TechDataLen) - 1) + rowAddrStart[*si];

      if (!preReadRow[*si])  
      {
        if (((rowAddr[*si] == rowAddrStart[*si]) & (MSBPadding[*si] > 0)) ||
            ((rowAddr[*si] == lastRowAddr[*si]) & (LSBPadding[*si] > 0)))  
        {
          sitesToRead[*si] = false;
        } 
      } 

      if (stepCnt[*si] = 0)  
      {
        sitesToRead[*si] = false;
//      DevSetHoldState(site, FALSE);
      }     
    }
      
    blkStr += FF_DectoVecStr(blkNum, 5);  
    
    /**********************/ 
    /* Start program flow */ 
    /**********************/ 
    if (true) // while (V_Any_Dev_Active)
    {
      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
      {
      }
      
//  ArrayCopyBoolean(sitesToProg, V_Dev_Active, V_Sites);  
    
      if (false) // ENABLE_READ_REPAIR_ROWS
      {
      }
      
//    DevSetHoldStates(sitesToRead)
  
      if (false) // while (V_Any_Dev_Active)
      {
      }
      
//    DevSetHoldStates(sitesToProg)
      
      if (true) // if (V_Any_Dev_Active)
      {

        
        /********************/ 
        /* Program row data */ 
        /********************/ 
        returnRowStatus = 
          STDProgramFuseRow(0, techName, ctlrNum, blkNum,
//                          FuseROMCtlr STDFuseFarmRec,
                            repairStep,
                            rowAddr,
                            rowDataStr,
                            expRowDataStr,
                            progPattern,
                            actRowDataStr,
//                          FuseROMData STDFROMDataArr,
                            errorCode,
                            accumulatorNum,
                            numRepairBits);
      }

      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
      {
      }
    }      
  }
  
//DevSetHoldStates(sitesToRestore);
  
  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
  {
    if (initDataStr[*si].Length() > 0)  
    {
      while (returnDataStr[*si].Length() < initDataStr[*si].Length())
        returnDataStr[*si] = "0" + returnDataStr[*si];
      
      returnDataStr[*si] = returnDataStr[*si].Substring(LSBPadding[*si], returnDataStr[*si].Length() - (MSBPadding[*si] + LSBPadding[*si]));                   
    } 
  }
  
  return progDataStatus;
} /* STDProgramFuseROM */
                                
void FF_Debug()
{
  IntS si;
  StringS codeOption;
  IntS ctlrNum;
  IntS blkNum;
  IntM rowStart;
  IntM rowStop;
  StringS readPattern;
  StringM initDataStr;
  StringM returnDataStr;
// FuseROMData STDFROMDataArr,
  IntM errorCode;
  IntM MSBPadding;
  StringS TWVarName;  
  TMResultM results;
    
  codeOption = "F021";
  ctlrNum = 1;
  blkNum = 0;
  rowStart = 12;
  rowStop = 15;
  readPattern = "FF_Read_Mg1A_Thrd";
  //                      11111111112222222222333
  //             12345678901234567890123456789012
  initDataStr = "00000000000000000000000000000000";
  initDataStr = "00000000000000000000000000000000" + initDataStr;
  initDataStr = "00000000000000000000000000000000" + initDataStr;
  initDataStr = "00000000000000000000000000000000" + initDataStr;
  MSBPadding = 0;
  TWVarName = "";

  cout << "Reading TIDieID..." << endl;
  
  FloatS timer1;
  FloatS timer2;
  
  TIME.StartTimer();
  timer1 = TIME.GetTimer();
  
  results = STDReadFuseROM(codeOption,
//                         FuseROMCtlr STDFuseFarmRec,
                           ctlrNum, blkNum,
                           rowStart, rowStop,
                           readPattern,
                           initDataStr,
                           returnDataStr,
//                         FuseROMData STDFROMDataArr,
                           errorCode,
                           MSBPadding,
                           TWVarName);  
  
  timer2 = TIME.GetTimer();
  cout << "TT = " << timer2-timer1 << endl;
  TIME.StopTimer();
  
//  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
//  {
//    cout << "Results[" << *si << "] = " << results[*si] << endl;
//    cout << "Error Code[" << *si << "] = " << errorCode[*si] << endl;
//    cout << "Return String[" << *si << "] = " << returnDataStr[*si] << endl;
//  } 

  IntM rowAddrStart;
  StringS progPattern;
  BoolS writeProtect;
  BoolS readProtect;
  BoolS enableRedundancy;
  IntM numRepairRows;
  BoolM preReadRow = false;
  IntM numRepairBits = 0;
  
// VDDPGM = 1.8V
// VPP = 1.9V
// PER = 100nS

  ctlrNum = 1;
  blkNum = 0;
  rowAddrStart = 13;
  //             33322222222221111111111
  //             21098765432109876543210987654321
  initDataStr = "00000000000000010000000000000000";
  MSBPadding = 0;
  progPattern = "FF_Program_Mg1A_Thrd";
  
  TIME.StartTimer();
  timer1 = TIME.GetTimer();

  results =
      STDProgramFuseROM("F021",
//                      FuseROMCtlr STDFuseFarmRec,
                        ctlrNum, blkNum,
                        rowAddrStart,
                        initDataStr,
//                      fusePatterns STDFuseFarmPatArr,
                        progPattern,
                        writeProtect,
                        readProtect,
                        enableRedundancy,
//                      TWDataLevel TWDataType,
                        numRepairRows,
                        returnDataStr,
//                      FuseROMData STDFROMDataArr,
                        errorCode,
                        MSBPadding,
                        preReadRow,
//                      FROM_CLK_Pin PinList,
                        numRepairBits);

  timer2 = TIME.GetTimer();
  cout << "TT = " << timer2-timer1 << endl;
  TIME.StopTimer();
  
//  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
//  {
//    cout << "Results[" << *si << "] = " << results[*si] << endl;
//    cout << "Error Code[" << *si << "] = " << errorCode[*si] << endl; 
//    cout << "Return String[" << *si << "] = " << returnDataStr[*si] << endl;
//  }                                
                        
                        
} /* FF_Debug */    
