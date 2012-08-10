//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                  TestwareSupport.h                                       //
//                                                                                          //
//  This is the header file to the TIDatalog (TIDlog) class. This class has functions which //
// will perform the test and datalog routines necessary for most tests at TI.               //
//                                                                                          //
// See comments on the function headers for usage.                                          //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////
//                                     Revision Log                                         //
//////////////////////////////////////////////////////////////////////////////////////////////
//  2012-08-09 v1.1    : jat    Added TestBool and TestTMResult                             //
//  2012-04-24 v1.0    : jat    initial release                                             //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////

#ifndef TIDATALOG_H
#define TIDATALOG_H

#include <Unison.h>
#include <TWexterns.h>

// Once implemented, change this to true in order to write a .vars file for all 
// Testware variables. 
// :TODO: Implement writing of testware vars
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
        //
        // ValueLS functions will:
        // 1.) Test dataToTest against the limits in testLimit, logging the data against testPins, if present.
        //     Note: This is a slight departure from the Cadence version of TestwareSupport - you can still 
        //     test with no testPins defined, but only a single multisite value, not an array. 
        // 2.) If useTestware is true, then dataToTest will be sent to Testware. If dataToTest is a single multisite
        //     value, then the Name field of the LimitStruct is used as the Testware variable name. If dataToTest is
        //     a multisite array, then the Testware variable name is the LimitStruct Name with the pin name 
        //     appended. If this name is longer than the max allowed for Testware, then the Testware variable 
        //     name is changed to be the LimitStruct Name with _P# appended where # is the position of the pin/data
        //     within the array.
        //     The above means that testPins MUST BE SUPPLIED FOR ALL DATA IN AN ARRAY TO GET LOGGED TO TESTWARE.
        // 3.) Perform CLO functions if doClo is true and global conditions for CLO are true and in a CLO Flow. 
        //     Because of the global conditions required, doClo can usually be left true.
        //     CLO is not yet implemented. :TODO:
        // 4.) Return the TMResultM value found in step 1 from testing the data.
        TMResultM ValueLS (const FloatM &dataToTest,                       // Data to be tested
                           const PinML &testPins,                          // Test pins to log data against in the datalogger, can be UTL_VOID for non-1D 
                                                                           // versions of this function, or even 1D versions if there is only one element.
                           LimitStruct &testLimit,                         // Test limit struct. If UTL_VOID, TM_NOTEST is returned and no Testware logging.
                           const BoolS &useTestware,                       // True will log data to testware as above. False skips Testware logging.
                           const EnumS<TWDataType> &testwareDatatype,      // TWDataType 
                           const BoolS &doClo = true);                     // Perform CLO functions instead of normal operation based on global flags
                                                                           // and conditions. (CLO enabled, inside CLO flow, etc) This can usually be
                                                                           // left as true and global flags determine outcome. If you haven't enabled 
                                                                           // CLO in the program globally, doClo is meaningless.
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
        
        
        // For cases where LimitStructs are not used, the below Value functions are provided.
        // If you do not want to execute a bin when doing the test statement, pass UTL_VOID as the failBin; this 
        // will allow the testing, but will not bin the device if it fails - which means binning is to be done 
        // in the Flow. 
        //
        // The Value functions are much like the ValueLS functions except that required limits fields are passed
        // in individually instead of using a LimitStruct. The same functionality applies. testName is used as 
        // the test comment as well as the Testware variable name (prefix). An Expected result (usually ER_PASS)
        // is required for the lower-level functions used since LimitStructs are not used. I gave the option
        // of allowing ER_FAIL or other enums in case the functionality was desired by fringe cases.
        TMResultM Value (const FloatM &dataToTest,                         // Data to be tested
                         const PinML &testPins,                            // Test pins to log data against in the datalogger, can be UTL_VOID for non-1D 
                                                                           // versions of this function, or even 1D versions if there is only one element.
                         const FloatM &loLim,                              // Low Limit. This limit is the same for all elements in a 1D dataToTest, but 
                                                                           // can be different by site. Can be UTL_VOID for no lower limit.
                         const FloatM &hiLim,                              // High Limit. This limit is the same for all elements in a 1D dataToTest, but 
                                                                           // can be different by site. Can be UTL_VOID for no high limit.
                         const StringS &units,                             // Test units
                         const StringS &testName,                          // Test Name. Used for test comment in datalogger and Testware variable name
                                                                           // (see above)
                         const StringS &failBin,                           // Fail bin to execute if a site fails. This can be UTL_VOID to skip binning
                                                                           // to do binning in the flow.
                         const IntS &minorID,                              // Test minor ID to add to major ID of test. Can be UTL_VOID.
                         const BoolS &useTestware,                         // True will log data to testware as above. False skips Testware logging.
                         const EnumS<TWDataType> &testwareDatatype,        // TWDataType 
                         const ExpectedResultS &expectedResult = ER_PASS,  // Expected result of the test. This way you can have negative tests where
                                                                           // you expect a fail and the fail is actually the correct 'passing' result.
                         const BoolS &doClo = true);                       // Perform CLO functions instead of normal operation based on global flags
                                                                           // and conditions. (CLO enabled, inside CLO flow, etc) This can usually be
                                                                           // left as true and global flags determine outcome. If you haven't enabled 
                                                                           // CLO in the program globally, doClo is meaningless.
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
                            
        
        // TestBool is used to test and datalog a boolean value. Note that 1 will be used for a TRUE value and 0 will be used
        // for a FALSE value in the datalog. The test limits will be set to 1/1 for trueIsPass of TRUE and 0/0
        // for trueIsPass of FALSE.
        TMResultM TestBool (const BoolM &dataToTest, const PinML &testPins, const StringS &testName, const StringS &failBin,
                           const IntS &minorID, const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype,
                           const BoolS trueIsPass = true, const BoolS &doClo = true);
        
        
        // TestTMResult is used to datalog a TMResultM value. It will show in the datalog as an integer. 
        // The limits will be set to 1/1 with TM_PASS being tested as a 1. 
        // NOTE: To achieve TM_PASS being 1, 1 is added to the TMResultM, so the logging goes like:
        // TM_PASS = 1
        // TM_FAIL = 2
        // TM_NOTEST = 3
        // TM_PARAM_FAIL = 4
        // TM_REPAIRABLE = 5
        // TM_TIMEOUT = 6
        TMResultM TestTMResult (const TMResultM &dataToTest, const PinML &testPins, const StringS &testName, const StringS &failBin,
                               const IntS &minorID, const BoolS &useTestware, const EnumS<TWDataType> &testwareDatatype,
                               const BoolS &doClo = true);
        
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

// Create a global TIDlog object so that one doesn't have to be created to use this class.
extern TIDatalog TIDlog;

#endif

