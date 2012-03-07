#ifndef TIDATALOG_H
#define TIDATALOG_H

#include <Unison.h>
#include <TWexterns.h>

#define WRITE_TW_VARS_FILE false


// :TODO: fix below to use the TI-standard CloFunctionType enum, when available
#define CLO_NONE 0
#define CLO_GENERATE 1
#define CLO_VERIFY 2

enum WriteVarType 
{
    WRITE_VAR_INT,
    WRITE_VAR_FLOAT,
    WRITE_VAR_STRING,
};


extern BoolS   gTWInitialized;
extern BoolS   gVarFileCreated;
extern BoolS   gCloEnable;
extern IntS    gCloFunction;
extern StringS gCloFileName;
extern BoolM   gFirstFail;

extern BoolS gCloGenerateOk; 
extern BoolS gCorrLockOutPassed;  

class TIDatalog {

    public:
        TIDatalog();
        ~TIDatalog();
        TMResultM FloatValue (const FloatM &dataToTest, const PinML &testPins, LimitStruct &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        TMResultM FloatValue (const FloatM1D &dataToTest, const PinML &testPins, LimitStruct &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        TMResultM FloatValue (const FloatM &dataToTest, const PinML &testPins, ObjectS &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        TMResultM FloatValue (const FloatM1D &dataToTest, const PinML &testPins, ObjectS &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        TMResultM IntValue (const IntM &dataToTest, const PinML &testPins, LimitStruct &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        TMResultM IntValue (const IntM1D &dataToTest, const PinML &testPins, LimitStruct &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        TMResultM IntValue (const IntM &dataToTest, const PinML &testPins, ObjectS &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        TMResultM IntValue (const IntM1D &dataToTest, const PinML &testPins, ObjectS &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
    private: 
        void FailCLOGenerate ();
        int WriteVar (const StringS &varName, const IntS &testId);
        int WriteVar (const StringS &varName, const IntS &varLoLimit, const IntS &varHiLimit, const IntS &testId); 
        int WriteVar (const StringS &varName, const StringS &varUnits, const FloatS &varLoLimit, const FloatS &varHiLimit, const IntS &testId);
        int PrintVarFileHeader (const IntS &fileHandle);

};

extern TIDatalog TIDlog;

#endif

