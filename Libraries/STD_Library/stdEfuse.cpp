#include <Unison.h>
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

BoolS FF_GetRepairBit(StringS techName,
                      StringS FROMRowStr) 
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
      if (FROMRowStr.Substring(RepairBit - 1, 1) == "1")  
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

StringS FF_DectoVecStr(IntS decimal, IntS strLen)    
/*****************************************************************************
  This function converts an integer to a vector data string.
 *****************************************************************************/ 
 {
   IntS bit;
   StringS vector = "";
   IntS mask = 1;
   
   for (bit = 0; bit < strLen; bit++)
   {
     if ((mask & decimal) >= 1)
       vector = "H" + vector;
     else
       vector = "L" + vector;
     mask <<= 1;
   }
   
   return vector;
}  /* FF_DectoVecStr */ 

void PatternDigitalCapture(StringS patternBurst, PinML capturePins, StringS capName, UnsignedS maxCapCount, 
                           UnsignedM1D &captureArr, const UnsignedM1D &simValue, UnsignedS wordSize = UTL_VOID, 
                           WordOrientationS wordOrientation = WORD_MSB_FIRST)
{
   BoolM timed_out;
   
   // if no wordSize is given, then we do parallel even if that means a 1-bit parallel
   // if more than 1 capture pin, it has to be parallel
//   if (wordSize == UTL_VOID) 
//   {
      DIGITAL.DefineParallelCapture(capturePins, capName, maxCapCount);
//   } else {
//      DIGITAL.DefineSerialCapture(capturePins, capName, maxCapCount, wordSize, wordOrientation);
//   }
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
}

BoolM STDReadFuseRow(StringS &techName,
//                   FuseROMCtlr STDFuseFarmRec,
                     IntS &ctlrNum,
                     IntS &blkNum,
                     StringS &blkStr,
                     IntM rowAddr,
                     StringS &readPattern,
                     StringM &readRowStr,
                     IntM &readError) 
/*****************************************************************************
  This function is used to read a FROM row.
 *****************************************************************************/ 
{
  IntS si;
  StringS dwBlkStr;
  StringML digVecData;
  StringS rowAddrStr;
  StringS labelReadRowData;
  PinML data_input;
  
  BoolM readRowStatus(true);
                
  readError = 0;
  readRowStr = nullRowStr;
  
  /**************************************************/ 
  /* Add block number for DumpWord0 to source array */ 
  /**************************************************/ 
  if (FFCtlrName == "old")  
    dwBlkStr = blkStr;
  else
    dwBlkStr = "";
  
  /*********************************************/ 
  /* Add block and row address to source array */ 
  /*********************************************/   
//  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
//  {  
//    digVecData[*si] = dwBlkStr + blkStr + FF_DectoVecStr(rowAddr[*si], 11);
//  } 
 
  // :TODO: hardcoded. Fix this.
  digVecData += "H";
  digVecData += "L";
  digVecData += "H";
  digVecData += "L";
  digVecData += "L";
  digVecData += "L";
  digVecData += "L";
  digVecData += "L";
  digVecData += "L";
  digVecData += "L";
  digVecData += "L";
  digVecData += "L";
  digVecData += "L";
  digVecData += "L";
  digVecData += "L";
  digVecData += "L";

  
  data_input = "PA2_48";

  labelReadRowData = "FF_Read_Mg1A.Read_RowAddr";
  //PatternBurst(readPattern).GetPattern(0).GetName() + ".Read_RowData";
  
  DIGITAL.ModifyVectors(data_input, readPattern, labelReadRowData, digVecData);
  
  UnsignedM1D ff_cap_array, simValue(41,0);
  
  StringS mycap = "CapFF";
  
  PatternDigitalCapture(readPattern, "o_cpu_fail_47", mycap, 41, 
                           ff_cap_array, simValue);
  
  StringM bitstream = "";
  
  for (int i = 0; i < ff_cap_array.GetSize(); ++i)
  {
     bitstream += CONV.UnsignedToString(ff_cap_array[i]);
  }
  
  /*****************/ 
  /* Read row data */ 
  /*****************/ 
  /*
  PatternDigitalSourceCapture(readPattern, 
                              FuseROMCtlr.JTAGTDI,
                              FuseROMCtlr.JTAGTDO, 
                              16 + dwBits, TechRowLen,
                              uniqueSrcData, 
                              MSDigSrcArr, MSDigCapArr);
  */
        
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
//      FF_ConvertCapArrToFROMRowStr(MSDigCapArr[site], 1, readRowStr[site]);

//                                11111111112222222222333333333344
//                       12345678901234567890123456789012345678901
//      readRowStr[*si] = "00000100100000100000000000000000000000001";
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
 
BoolM STDReadFuseROM(StringS codeOption,
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
  BoolM readDataStatus = false;
  
  IntS si;
  IntS index;
  IntM currRowAddr;
  IntM rowAddr;
  IntM LSBPadding;
  BoolM readTested;
  BoolM allSitesInactive;
  BoolM readRowStatus;
  StringS techName;
  StringS blkStr;
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
  BoolM devActive;
  
  techName = FF_GetTechName(codeOption);
  FF_SetCodeFlags(codeOption, techName);
  FF_InitFROMVars(techName);
  
  firstReadRow = true;
  lastReadRow = false;
 // uniqueSrcData = true;

  LSBPadding = 0;
  errorCode = 0;

  //ArrayCopyBoolean(readTested, V_Dev_Active, V_Sites);
  //ArrayCopyBoolean(readDataStatus, V_Dev_Active, V_Sites);

  readTested = true;
  readDataStatus = true;

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
  
  devActive = ActiveSites.GetPassingSites();
      
  if (true) // V_Any_Dev_Active
  {
    blkStr = FF_DectoVecStr(blkNum, 5);
    
    rowAddr = rowStart;
    currRowAddr = rowStart;
    
    /*******************/ 
    /* Start read flow */ 
    /*******************/
    while (devActive.AnyEqual(true)) // V_Any_Dev_Active
    {
      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
      {
        if (currRowAddr[*si] > rowStop[*si])
        {
          devActive[*si] = false;
        }
      }
      
      /*****************/ 
      /* Read row data */ 
      /*****************/ 
      if (devActive.AnyEqual(true)) // V_Any_Dev_Active
      {
        readRowStatus = 
          STDReadFuseRow(techName, // FuseROMCtlr,
                         ctlrNum, blkNum, blkStr, currRowAddr,
                         readPattern, actReadRowStr, errorCode);
      }        

      if (devActive.AnyEqual(true)) // V_Any_Dev_Active)
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
//          DevSetHoldState(site, FALSE);
            devActive[*si] = false;
            readDataStatus[*si] = false;
            readTested[*si] = false;
          }
          else
          {
          /*******************************************/ 
          /* Check for the RepairBit on the read row */ 
          /*******************************************/ 
            if (false) // FF_GetRepairBit()
            {
              if (false) // (currRowAddr[site] < FuseROMCtlr.MaxFROMRepairs[blkNum])
              {
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
//                  DevSetHoldState(site, FALSE);
                    devActive[*si] = false;
                    readDataStatus[*si] = false;
                    readTested[*si] = true;
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
//                  DevSetHoldState(site, FALSE);
                    devActive[*si] = false;
                    readDataStatus[*si] = false;
                    readTested[*si] = true;
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
    }  
  }
  
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

      if (readDataStatus[*si])  
      {
        if ((errorCode[*si] == 0) && (returnDataStr[*si] != saveInitDataStr[*si]))  
          errorCode[*si] = 1;

        if (errorCode[*si] == 0)  
          readDataStatus[*si] = true;
        else
        {
          if (errorCode[*si] == 1)  
            readDataStatus[*si] = false;
        } 
      }
    }
  }
      
  return readDataStatus;
} /* STDReadFuseROM */      

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
  BoolM results;
  
  codeOption = "F021";
  ctlrNum = 1;
  blkNum = 0;
  rowStart = 5;
  rowStop = 5;
  readPattern = "FF_Read_Mg1A_Thrd";
  //                      11111111112222222222333
  //             12345678901234567890123456789012
  initDataStr = "00000000000000000000000000000000";
//  initDataStr = "00000000000000000000000000000000" + initDataStr;
  MSBPadding = 0;
  TWVarName = "";

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
                  
  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) 
  {
    cout << "Results[" << *si << "] = " << results[*si] << endl;
    cout << "Error Code[" << *si << "] = " << errorCode[*si] << endl;
    cout << "Return String[" << *si << "] = " << returnDataStr[*si] << endl;
  } 
 
} /* FF_Debug */    
