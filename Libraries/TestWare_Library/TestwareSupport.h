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

enum TWPatLogType 
{
    LogPatternAsInt,   // just log an integer that states outcome of pattern (burst)
                       // 0 = fail, 1 = pass, 2 = no_test
// :TODO: Implement TWPDLDataLogPatternFail & PatternSuite
//    LogPatternSuite,   // use TWPDLDataLogPatternSuite
//    LogPatternFail,    // use TWPDLDataLogPatternFail
};

const int TW_MAX_NAME_LENGTH = 30;

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
        
        // Now you may wonder why there are so many overloads for ValueLS. The reason is simple - speed.
        // I could have made it a single function taking a BasicVar, but the additional cases and error
        // checking slowed down the execution. Not very much, but it adds up since every test will use
        // these functions. Also, it didn't really save a lot of memory because of all the cases it 
        // didn't save a lot of lines of code.
        TMResultM ValueLS (const FloatM &dataToTest, const PinML &testPins, LimitStruct &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        TMResultM ValueLS (const FloatM1D &dataToTest, const PinML &testPins, LimitStruct &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        TMResultM ValueLS (const FloatM &dataToTest, const PinML &testPins, ObjectS &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        TMResultM ValueLS (const FloatM1D &dataToTest, const PinML &testPins, ObjectS &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        TMResultM ValueLS (const IntM &dataToTest, const PinML &testPins, LimitStruct &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        TMResultM ValueLS (const IntM1D &dataToTest, const PinML &testPins, LimitStruct &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        TMResultM ValueLS (const IntM &dataToTest, const PinML &testPins, ObjectS &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        TMResultM ValueLS (const IntM1D &dataToTest, const PinML &testPins, ObjectS &testLimit,
               const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true);
        
        TMResultM Value (const FloatM &dataToTest, const PinML &testPins, const FloatM &loLim, const FloatM &hiLim,
                            const StringS &units, const StringS &testName, const StringS &failBin, const IntS &minorID, 
                            const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, 
                            const ExpectedResultS &expectedResult = ER_PASS, const BoolS &doClo = true);
        TMResultM Value (const FloatM1D &dataToTest, const PinML &testPins, const FloatM &loLim, const FloatM &hiLim,
                            const StringS &units, const StringS &testName, const StringS &failBin, const IntS &minorID, 
                            const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, 
                            const ExpectedResultS &expectedResult = ER_PASS, const BoolS &doClo = true);
        TMResultM Value (const IntM &dataToTest, const PinML &testPins, const IntM &loLim, const IntM &hiLim,
                            const StringS &units, const StringS &testName, const StringS &failBin, const IntS &minorID, 
                            const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, 
                            const ExpectedResultS &expectedResult = ER_PASS, const BoolS &doClo = true);
        TMResultM Value (const IntM1D &dataToTest, const PinML &testPins, const IntM &loLim, const IntM &hiLim,
                            const StringS &units, const StringS &testName, const StringS &failBin, const IntS &minorID, 
                            const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype, 
                            const ExpectedResultS &expectedResult = ER_PASS, const BoolS &doClo = true);
                            
        // :TODO: Fix FunctionalLS it is not ready yet
//        TMResultM FunctionalLS (const TMResultM &patResult, LimitStruct &testLimit, const BoolS &useTestware, 
//               const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true, 
//               const EnumS<TWPatLogType> &patternLogType = LogPatternAsInt);
//        TMResultM FunctionalLS (const TMResultM &patResult, ObjectS &testLimit, const BoolS &useTestware, 
//               const EnumS<TWDataType> &testwareDatatype, const BoolS &doClo = true, 
//               const EnumS<TWPatLogType> &patternLogType = LogPatternAsInt);
    private: 
        void FailCLOGenerate ();
        int WriteVar (const StringS &varName, const IntS &testID, const SV_TYPE type, 
                      const LimitStruct varLimits = UTL_VOID); 
        int PrintVarFileHeader (const IntS &fileHandle);

};

extern TIDatalog TIDlog;

#endif

