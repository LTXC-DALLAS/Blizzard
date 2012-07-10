
#ifndef STDEFUSE_H
#define STDEFUSE_H

#include <Unison.h>
#include <TWPDL.h>

struct STDFuseFarmRec {
  int maxFROMRepairs[32];
  int fuseROMSize[32];
  PinM JTAGTDI;
  PinM JTAGTDO;
};

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
                     
TMResultM STDProgramFuseROM(StringS codeOption,
                        STDFuseFarmRec FuseROMCtlr,
                        IntS ctlrNum, IntS blkNum,
                        IntM rowAddrStart,
                        StringM initDataStr,
                        StringS1D fusePatterns,
                        BoolS writeProtect,
                        BoolS readProtect,
                        BoolS enableRedundancy,
                        TWDataType TWDataLevel,
                        IntM numRepairRows,
                        StringM &returnDataStr,
                        StringM1D &STDFROMDataArr,
                        IntM &errorCode,
                        IntM MSBPadding,
                        BoolM preReadRow,
//                      FROM_CLK_Pin PinList,
                        IntM &numRepairBits);
void FF_Debug();


#endif
