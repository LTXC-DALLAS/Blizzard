// *************************************************************************************
//  Module      : TWFuncTest.h
//  Description : My Functional test include file
//
// *************************************************************************************

#ifndef TWFUNCTEST_H
#define TWFUNCTEST_H

#include <globals.h>
#include <Unison.h>
#include <TMFamily.h>
#include <TWexterns.h>


enum FUNC_MODE_ENUM { 
    SETUP,              // Prepares a functional pattern for execution - not currently supported
    EXECUTE,            // Executes a previously setup functional pattern - not currently supported
    SETUP_AND_EXECUTE   // Prepares the functional pattern and executes it
};


    class TWFuncTest : public TMFamily
    {
     public:
        TWFuncTest();
        virtual ~TWFuncTest() { }
       TM_RETURN DoAction(TM_ACTION action);
        // method entry points
        TM_RETURN        Execute();
        BoolM            ParamCheck();
        BoolM            Initialize();

        StringS FormatBreakpointMessage(const StringS TestName, const StringS EventName, const StringS MethodMessage, const StringS ExtraMessage, const TMResultM result_break);

     protected:
        // locally defined parameter variables
        PinML                            TestPins;
        Levels                           LevelsSetup;
        FunctionCall                     CallAfterSetup;
        EnumS<FUNC_MODE_ENUM>            TestMode;
        StringS                          TestPatterns;
        FunctionCall                     CallAtEnd;
        BoolS                            ShowAdditionalArgs;
        TMResultM                        SimulatedTestResult;
        IntS                             MinorID;
        BoolS                            DisablePatternDatalog;
        BoolS                            ExecuteSitesSerially;
        BoolS                            CharacterizationEnable;
        Margin                           CharacterizationObject;
        BoolS                            use_testware;       //added for testware compliance
        EnumS<TWDataType>                testware_datatype;  //added for testware compliance
        StringS                          TWText;             //added for testware compliance
        StringS                          FailBin;            //added for testware compliance
        
        // class variables
        BoolS                            run_time_characterization;
         
        TMResultM AccumulateResults(TMResultM &test_result, const TMResultM new_result);
        BoolS     CheckReturnType(const FunctionCall &func, const VarTypeS expected_type, const VarConfigS expected_config, const StringS expected_name) const;
       
    private:
        // characterization support
        static TWFuncTest  *ParamPtr;
        void             SetParamPtr() { ParamPtr = this; }
        static TMResultM Callback();
        BoolS VerifyBasicTypes(PinML TestPins, PintypeTypeS1D ValidTypes);

    };

TM_RETURN TWFuncTest::DoAction(TM_ACTION action)
{
    switch (action) {
        case TM_EXECUTE:          { return Execute(); 
                                  }
        case TM_PARAMETER_CHANGE: { SetValue(ParamCheck()); 
                                    return TM_HAS_VALUE; 
                                  }
        case TM_INITIALIZE:       { SetValue(Initialize()); 
                                    return TM_HAS_VALUE; 
                                  }
        default:                  { SetValue(BoolM(false)); 
                                    return TM_HAS_VALUE; 
                                  }
    }
}
#endif  // TWFUNCTEST_H
