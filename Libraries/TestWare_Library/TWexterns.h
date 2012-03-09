/***********************************************************************/
/***                  TI Standard Program Template                   ***/
/***                                                                 ***/
/***                  File Name: TIexterns.h                         ***/
/***                  Description: TIexterns external reference file ***/
/***                                                                 ***/
/***      Revision History:                                          ***/
/***                                                                 ***/
/***                                                                 ***/
/***                                                                 ***/
/***********************************************************************/
#ifndef TIEXTERNS_H
#define TIEXTERNS_H

#include "/u/TI_apps/enVision/stdprogram/TWPDL.h"

extern BoolM TWPDLDataLogRealVariable(StringS name, StringS units, FloatM value, EnumS<TWDataType> TWdatatype);
extern BoolM TWPDLDataLogVariable(StringS name, IntM value, EnumS<TWDataType> TWdatatype);
extern BoolM TWPDLDataLogText(StringS name, StringM value, EnumS<TWDataType> TWdatatype);
extern BoolM TWPDLDataLogDieID(StringM LOT, IntM WAFER, IntM X, IntM Y, StringM MISC, StringM Checkbits, StringM Register, StringM FABID, StringM WAFERID, EnumS<TWDataType> TWdatatype);
extern BoolM TWPDLDataLogC035DieID(StringM LOT, IntM WAFER, IntM X, IntM Y, StringM MISC, StringM Checkbits, StringM Register, StringM FABID, StringM WAFERID, StringM DesRev, StringM TestCode, StringM MemRepair, StringM Reserved, StringM EFuseSuccess,  EnumS<TWDataType> TWdatatype);
extern BoolM TWPDLDataLogPrint();

#endif /* #ifndef TIEXTERNS_H */


