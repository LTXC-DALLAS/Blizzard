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
                     StringS TWVarName);       

void FF_Debug();
