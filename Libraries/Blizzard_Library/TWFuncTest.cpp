// *************************************************************************************
//  Module      : TWFuncTest.cpp
//  Description : Hacked Functional test method
//
// *************************************************************************************

#include "TWFuncTest.h"

static PINTYPE_TYPE DigitalTypes[]  = { PINTYPE_DIGITAL_PIN,  PINTYPE_NULL_PIN };

    PintypeTypeS1D DIGITAL_PINS  = DigitalTypes;
    TMFAMILY_CLASS(TWFuncTest)
//nothing
    TM_RETURN TWFuncTest::Execute()
    {
        TMResultM local_result = TM_NOTEST;
        TMResultM test_result  = TM_NOTEST;
        SITE site;      
        
        if (RunTime.ResetPressed()) {
            SetResult(test_result);
            return TM_HAS_RESULT;
        }

        Sites SavedSites = ActiveSites;
        SiteIter site_iter = SavedSites.Begin();

        for (site_iter.Begin(); !site_iter.End(); site_iter++) {
 
            if (ExecuteSitesSerially)
                RunTime.SetActiveSites(site_iter.GetValue());

            if (LevelsSetup.Valid())
                LevelsSetup.Execute();

            // execute optional CallAfterSetup function call
            if (CallAfterSetup.Valid()) {
                if (CheckReturnType(CallAfterSetup, SV_ENUM, SV_SCALAR_M, "TM_RESULT")) {
                    local_result = CallAfterSetup.Execute().GetEnumM();
                    test_result = AccumulateResults(test_result, local_result);
                }
                else
                    CallAfterSetup.Execute();
            }
            DEBUG.Breakpoint("AfterSetup",(StringS)FormatBreakpointMessage(RunTime.GetActiveTest().GetName(),"AfterSetup","FuncTest","",UTL_VOID)+RunTime.GetActivePatternSetup().GetName()+"/"+TestPatterns);

            PatternSetup pattern_setup = RunTime.GetActivePatternSetup();
            if (pattern_setup.Valid())
                pattern_setup.SetActivePins(TestPins);

            TMResultM pattern_result = TM_PASS;

            pattern_result = DIGITAL.TestPattern(TestPatterns, !DisablePatternDatalog, SimulatedTestResult);
            if (!DisablePatternDatalog) {
                DLOG.Functional(TestPins, pattern_result, TWText, FailBin, UTL_VOID, MinorID, ER_PASS);
            }
            test_result = AccumulateResults(test_result, pattern_result);
            SetParamPtr();
            CallbackFunction callback(Callback);
            if ( (DEBUG.BreakpointActive("OnFail") && pattern_result.AnyEqual(TM_FAIL)) || DEBUG.BreakpointActive("AfterTest") )  {
                StringS eventStr = DEBUG.BreakpointActive("AfterTest")?"AfterTest":"OnFail";
                DEBUG.Breakpoint(eventStr,(StringS)FormatBreakpointMessage(RunTime.GetActiveTest().GetName(),eventStr,"FuncTest","pattern",pattern_result)+RunTime.GetActivePatternSetup().GetName()+"/"+TestPatterns);
            }
            if (CharacterizationObject.Valid() && CharacterizationEnable) {
                run_time_characterization = true;
                CharacterizationObject.Execute();
                run_time_characterization = false;
            }

            // execute optional CallAtEnd function call
            if (CallAtEnd.Valid()) {
                if (CheckReturnType(CallAtEnd, SV_ENUM, SV_SCALAR_M, "TM_RESULT")) {
                    local_result = CallAtEnd.Execute().GetEnumM();
                    test_result = AccumulateResults(test_result, local_result);
                }
                else
                    CallAtEnd.Execute();
            }
    
            if (!ExecuteSitesSerially)
                break;
        }

        if (ExecuteSitesSerially)
            RunTime.SetActiveSites(SavedSites);
//BEGIN TESTWARE COMPLIANCE CODE
	     IntM int_test_result;
        if (use_testware)
	{
	   SavedSites=ActiveSites;
	
	   for(site_iter.Begin();!site_iter.End();site_iter++)
	   {
	      site=site_iter.GetValue();
	      if(test_result[site]==TM_PASS)
	         int_test_result[site]=0;
	      else
	         int_test_result[site]=1;
	   }
         }
   TWPDLDataLogVariable(TWText,int_test_result,testware_datatype);
   
//END TESTWARE COMPLIANCE CODE	    

        SetResult(test_result);
        return TM_HAS_RESULT;
    }
    
BoolM TWFuncTest::ParamCheck()
{
   StringS error_message;
   BoolM param_check_status = true;

   if (TestMode != SETUP_AND_EXECUTE) 
   {
      error_message = "TestMode only supports SETUP_AND_EXECUTE at the present time.";
      ERR.ReportError(ERR_INVALID_PARAMETER, error_message, TestMode, NO_SITES, UTL_VOID);
      param_check_status = false;
   }

   if (TestPins.GetNumPins() <= 0) 
   {
      error_message = "TestPins is not specified or is empty. This field is required.";
      ERR.ReportError(ERR_INVALID_PIN, error_message, UTL_VOID, NO_SITES, TestPins);
      param_check_status = false;
   }
   else 
   {
      if (!VerifyBasicTypes(TestPins, DIGITAL_PINS)) 
      {
         error_message = "TestPins pin type must be DIGITAL_PINS or NULL_PINS. ";
         ERR.ReportError(ERR_INVALID_PIN, error_message, UTL_VOID, NO_SITES, TestPins);
         param_check_status = false;
      }
   }
   if (!SimulatedTestResult.Valid()) 
   {
      error_message = "SimulatedTestResult is not valid. A valid TM_RESULT is required.";
      ERR.ReportError(ERR_INVALID_PARAMETER, error_message, SimulatedTestResult, NO_SITES, UTL_VOID);
      param_check_status = false;
   }

   PatternSetup pattern_setup = RunTime.GetActivePatternSetup();
   if (pattern_setup.Valid() && TestPatterns.Length()) 
   {
      pattern_setup.SetActivePins(TestPins);
      DIGITAL.TestPattern(TestPatterns, !DisablePatternDatalog, SimulatedTestResult);
   }
   else 
   {
      error_message = "PatternSetup is not valid. This field is required.";
      ERR.ReportError(ERR_INVALID_OBJECT, error_message, UTL_VOID, NO_SITES, UTL_VOID);
      param_check_status = false;
   }

  Bin CheckBin = Bin::Find(FailBin);
  // int binnum = CheckBin.GetBinNumber();
   if (!CheckBin.Valid() && FailBin.Length())
   {
      error_message = "Invalid bin name.";
      ERR.ReportError(ERR_INVALID_PARAMETER, error_message, SimulatedTestResult, NO_SITES, UTL_VOID);
      param_check_status = false;
   }
   //check if user provided FailBin string
   if (FailBin.Length()==0)
   {
      error_message = "No bin name.";
      ERR.ReportError(ERR_INVALID_PARAMETER, error_message, SimulatedTestResult, NO_SITES, UTL_VOID);
      param_check_status = false;
   }	
   
   return param_check_status; 
}

    TWFuncTest *TWFuncTest::ParamPtr;

    TMResultM TWFuncTest::Callback()
    {
        TMResultM pattern_result = TM_NOTEST;
        PatternSetup setup = RunTime.GetActivePatternSetup();
        if (setup.Valid()) {
            pattern_result = DIGITAL.TestPattern(ParamPtr->TestPatterns, !ParamPtr->run_time_characterization, ParamPtr->SimulatedTestResult);
            if (!ParamPtr->run_time_characterization)
                DLOG.Functional(ParamPtr->TestPins, pattern_result, ParamPtr->TWText, ParamPtr->FailBin, UTL_VOID, 
                                ParamPtr->MinorID, ER_PASS);
        }
        return pattern_result;
    }

    TWFuncTest::TWFuncTest()
    {
        StringS text_field;

        AddInputParameter(TestPins, "TestPins");
        SetParameterAttribute("TestPins", "tooltip", "Pin expression listing pins to be tested");
        text_field = "TestPins - A required pin expression that contains the list of pins ";
        text_field += "to be measured or tested by this test method.<br>";
        text_field += "The only allowed pin type DIGITAL_PINS.";
        SetParameterAttribute("TestPins", "description", text_field);

        AddInputParameter(LevelsSetup, "LevelsSetup");
        text_field = "Optional Levels object executed prior to performing the test";
        SetParameterAttribute("LevelsSetup", "tooltip", text_field);
        text_field = "LevelsObject - An optional Levels object to be executed prior to performing ";
        text_field += "the test.<br>";
        text_field += "If ExecuteSitesSerially is enabled, the Levels object will be executed ";
        text_field += "for each site prior to the test.";
        SetParameterAttribute("LevelsSetup", "description", text_field);

        AddInputParameter(CallAfterSetup, "CallAfterSetup");
        text_field = "Optional FunctionCall executed prior to performing the test";
        SetParameterAttribute("CallAfterSetup", "tooltip", text_field);
        text_field = "CallAfterSetup - An optional FunctionCall object allowing execution of any ";
        text_field += "valid Unison function. This routine will be executed after execution of ";
        text_field += "the optional LevelsObject, but prior to performing any preset activities or ";
        text_field += "performing the test.<br>";
        text_field += "If the CallAfterSetup routine has a return type of TMResultM or EnumM&lt TM_RESULT &gt, ";
        text_field += "it's return value will be included in the block test result:";
        text_field += "<table border=1><tr><td><b>Return Value</b></td><td><b>Previous Block Test Result</b></td>";
        text_field += "<td><b>Resultant Block Test Result</b></td></tr>";
        text_field += "<tr><td>TM_PASS</td><td>TM_NOTEST</td><td>TM_PASS</td></tr>";
        text_field += "<tr><td>TM_PASS</td><td>Not TM_NOTEST</td><td>no change</td></tr>";
        text_field += "<tr><td>Not TM_PASS</td><td>TM_NOTEST or TM_PASS</td><td>FunctionCall result</td></tr>";
        text_field += "<tr><td>Not TM_PASS</td><td>Not (TM_NOTEST or TM_PASS)</td><td>no change</td></tr></table>";
        text_field += "If the block test return type is other than TMResultM or EnumM&lt TM_RESULT &gt, ";
        text_field += "it will be ignored.<br>";
        text_field += "If ExecuteSitesSerially is enabled, the FunctionCall will be executed ";
        text_field += "for each site prior to the test.";
        SetParameterAttribute("CallAfterSetup", "description", text_field);

        AddInputParameter(TestMode, "TestMode", "FUNC_MODE_ENUM:SETUP_AND_EXECUTE");
        SetParameterAttribute("TestMode", "tooltip", "Selects test execution mode");
        text_field = "TestMode - FUNC_MODE_ENUM expression selects test execution mode.<br>";
        text_field += "Available modes are:";
        text_field += "<table border=1><tr><td><b>Mode</b></td><td><b>Action</b></td></tr>";
        text_field += "<tr><td>SETUP **</td><td>Prepares a functional pattern for execution</td></tr>"; 
        text_field += "<tr><td>EXECUTE **</td><td>Executes a previously setup functional pattern</td></tr>";
        text_field += "<tr><td>SETUP_AND_EXECUTE</td><td>Prepares the functional pattern and executes it</td></tr></table>";
        text_field += "** - Mode not currently supported<br>";
        text_field += "The default value for this parameter is SETUP_AND_EXECUTE.";
        SetParameterAttribute("TestMode", "description", text_field);

        AddInputParameter(TestPatterns, "TestPatterns");
        SetParameterAttribute("TestPatterns", "tooltip", "Test Pattern or PatternBurst to be executed");
        text_field = "TestPatterns - String expression specifying the Test Pattern or PatternBurst to ";
        text_field += "be executed. The Pattern or PatternBurst must exist in the PatternSetup or ";
        text_field += "PatternSequence object specified in the test object Entry Objects fields.";
        SetParameterAttribute("TestPatterns", "description", text_field);

        AddInputParameter(CallAtEnd, "CallAtEnd");
        text_field = "Optional FunctionCall object executed after performing the test";
        SetParameterAttribute("CallAtEnd", "tooltip", text_field);
        text_field = "CallAtEnd - An optional FunctionCall object allowing execution of any ";
        text_field += "valid Unison function. This routine will be executed after completion of ";
        text_field += "the test execution and datalog activities.<br>";
        text_field += "If the CallAtEnd routine has a return type of TMResultM or EnumM&lt TM_RESULT &gt, ";
        text_field += "it's return value will be included in the block test result:";
        text_field += "<table border=1><tr><td><b>Return Value</b></td><td><b>Previous Block Test Result</b></td>";
        text_field += "<td><b>Resultant Block Test Result</b></td></tr>";
        text_field += "<tr><td>TM_PASS</td><td>TM_NOTEST</td><td>TM_PASS</td></tr>";
        text_field += "<tr><td>TM_PASS</td><td>Not TM_NOTEST</td><td>no change</td></tr>";
        text_field += "<tr><td>Not TM_PASS</td><td>TM_NOTEST or TM_PASS</td><td>FunctionCall result</td></tr>";
        text_field += "<tr><td>Not TM_PASS</td><td>Not (TM_NOTEST or TM_PASS)</td><td>no change</td></tr></table>";
        text_field += "If the block test return type is other than TMResultM or EnumM&lt TM_RESULT &gt, ";
        text_field += "it will be ignored.<br>";
        text_field += "If ExecuteSitesSerially is enabled, the FunctionCall will be executed ";
        text_field += "for each site after completion of the test.";
        SetParameterAttribute("CallAtEnd", "description", text_field);

        AddInputParameter(MinorID, "MinorID");
        text_field = "Minor ID used in datalog test ID calculation.";
        SetParameterAttribute("MinorID", "tooltip", text_field);
        text_field = "MinorID - integer expression added to the test object major ID to calculate the ";
        text_field += "datalog test ID. The value specified has additional functionality as shown ";
        text_field += "in the following table:";
        text_field += "<table border=1><tr><td><b>MinorID</b></td><td><b>Effect</b></td></tr>";
        text_field += "<tr><td>(empty)</td><td>System algorithm used to set the minor ID for all pins datalogged</td></tr>";
        text_field += "<tr><td>integer</td><td>Value used as the minor ID for all pins datalogged</td></tr>";
        text_field += "<tr><td>-integer</td><td>Ones compliment of the value is used as the starting minor ID, ";
        text_field += "with each pin's datalogged minor ID incremented by one from the previous pin</td></tr></table>";
        SetParameterAttribute("MinorID", "description", text_field);
        SetParameterAttribute("MinorID", "needs-minor-id-init", "");

        AddInputParameter(ShowAdditionalArgs, "ShowAdditionalArgs", "FALSE");
        text_field = "Displays additional method arguments when set to TRUE";
        SetParameterAttribute("ShowAdditionalArgs", "tooltip", text_field);
        text_field = "ShowAdditionalArgs - Boolean expression that enables display of additional ";
        text_field += "arguments if set to TRUE. The default value for this parameter is FALSE.";
        SetParameterAttribute("ShowAdditionalArgs", "description", text_field);

        AddInputParameter(SimulatedTestResult, "SimulatedTestResult", "TM_RESULT:TM_PASS");
        SetParameterAttribute("SimulatedTestResult", "display-if", "..ShowAdditionalArgs");
        text_field = "Test result expression returned in simulation mode";
        SetParameterAttribute("SimulatedTestResult", "tooltip", text_field);
        text_field = "SimulatedTestResult - Test result expression returned by the block in ";
        text_field += "simulation mode. The default value for this parameter is TM_PASS.";
        SetParameterAttribute("SimulatedTestResult", "description", text_field);

        AddInputParameter(DisablePatternDatalog, "DisablePatternDatalog", "FALSE");
        SetParameterAttribute("DisablePatternDatalog", "display-if", "..ShowAdditionalArgs");
        text_field = "Disables datalog output when set to TRUE";
        SetParameterAttribute("DisablePatternDatalog", "tooltip", text_field);
        text_field = "DisablePatternDatalog - Boolean expression that suppresses datalog generation ";
        text_field += "if set to TRUE. The default value for this parameter is FALSE.";
        SetParameterAttribute("DisablePatternDatalog", "description", text_field);

        AddInputParameter(ExecuteSitesSerially,  "ExecuteSitesSerially", "FALSE");
        SetParameterAttribute("ExecuteSitesSerially", "display-if", "..ShowAdditionalArgs");
        text_field = "Executes sites serially when set to TRUE";
        SetParameterAttribute("ExecuteSitesSerially", "tooltip", text_field);
        text_field = "ExecuteSiteSerially - Boolean expression that causes the test to execute the ";
        text_field += "sites individually in a serial site loop if set to TRUE. The default value ";
        text_field += "for this parameter is FALSE.";
        SetParameterAttribute("ExecuteSitesSerially", "description", text_field);

        AddInputParameter(CharacterizationEnable,  "CharacterizationEnable", "FALSE");
        SetParameterAttribute("CharacterizationEnable", "display-if", "..ShowAdditionalArgs");
        text_field = "Enables execution of the CharacterizationObject when set to TRUE";
        SetParameterAttribute("CharacterizationEnable", "tooltip", text_field);
        text_field = "CharacterizationEnable - Boolean expression that enables execution of the ";
        text_field += "optional CharacterizationObject when set to TRUE. The default value for ";
        text_field += "this parameter is FALSE.";
        SetParameterAttribute("CharacterizationEnable", "description", text_field);

        AddInputParameter(CharacterizationObject,  "CharacterizationObject", "");
        SetParameterAttribute("CharacterizationObject", "display-if", "..ShowAdditionalArgs");
        text_field = "Optional Margin object executed when CharacterizationEnable is TRUE";
        SetParameterAttribute("CharacterizationObject", "tooltip", text_field);
        text_field = "CharacterizationObject - Optional Margin object executed when CharacterizationEnable ";
        text_field += "is set to TRUE.";
        SetParameterAttribute("CharacterizationObject", "description", text_field);

//BEGIN TESTWARE COMPLIANCE CODE
        AddInputParameter(use_testware, "use_testware", "TRUE");
        SetParameterAttribute("use_testware","parameter-group","Base Settings");            
        SetParameterAttribute("use_testware", "tooltip", "Use the testware database.");

        AddInputParameter(testware_datatype, "testware_datatype", "TWDataType:TWMinimumData");
        SetParameterAttribute("testware_datatype","parameter-group","Base Settings" );    
        SetParameterAttribute("testware_datatype", "tooltip", "Testware data type.");

        AddInputParameter(TWText, "TWText");
        SetParameterAttribute("TWText", "tooltip", "Text logged to TestWare");
        SetParameterAttribute("TWText", "description", text_field);

        AddInputParameter(FailBin, "FailBin");
        SetParameterAttribute("FailBin", "tooltip", "Failing devices binned to this");
        SetParameterAttribute("FailBin", "description", text_field);

//END TESTWARE COMPLIANCE CODE
        // register breakpoints
        AddLocalBreakpoint("AfterSetup");
        AddLocalBreakpoint("AfterTest");

        // initialize class variables
        run_time_characterization = false;
    }

    TMResultM TWFuncTest::AccumulateResults(TMResultM &test_result, TMResultM new_result)
    {
        // accumulates non-passing site results from new_result into passing sites in test_result
        SiteIter site_iter = ActiveSites.Begin();
    
        for(site_iter.Begin(); !site_iter.End(); site_iter++) {
            if (test_result[site_iter.GetValue()] == TM_PASS || test_result[site_iter.GetValue()] == TM_NOTEST) {
                switch (new_result[site_iter.GetValue()]) {
                    case TM_PASS:
                    case TM_FAIL:
                    case TM_PARAM_FAIL:
                    case TM_NOTEST:
                    case TM_REPAIRABLE: 
                    case TM_TIMEOUT: { test_result[site_iter.GetValue()] = new_result[site_iter.GetValue()]; break; }
                    default: { break; }
                }
            }
        }
        return test_result;
    }

    BoolS TWFuncTest::CheckReturnType( const FunctionCall &func, const VarTypeS expected_type, const VarConfigS expected_config, const StringS expected_name) const
    {
        if ((expected_type != UTL_VOID) && (func.GetReturnType() != expected_type))
            return false;
        if ((expected_config != UTL_VOID) && (func.GetReturnConfig() != expected_config))
            return false;
        if (expected_name.Length() && (func.GetReturnTypeName() != expected_name))
            return false;
        return true;
    }

    StringS TWFuncTest::FormatBreakpointMessage(const StringS TestName, const StringS EventName, const StringS MethodMessage,
                                                const StringS ExtraMessage, const TMResultM result_break)
    {
        StringS finalMessage = "  "+TestName+" "+MethodMessage+": After "+ExtraMessage;
        StringS eventString = " test ";
        IntS Zero = 0;
      
        if ( EventName.Find("OnFail") == Zero )
            eventString = " fail ";
        else if ( EventName.Find("AfterSetup") == Zero )
            eventString = " setup ";
        else if ( EventName.Find("AfterPreset") == Zero )
            eventString = " preset ";

        finalMessage = finalMessage+eventString;
      
        if ( result_break != UTL_VOID )
            finalMessage = finalMessage+result_break;
        // For next line and extra information for test methods themselves.
        finalMessage = finalMessage+"\n"+"   ";

        return finalMessage;
    }

    BoolS TWFuncTest::VerifyBasicTypes(PinML TestPins, PintypeTypeS1D ValidTypes)
    {
        PintypeTypeS1D TestPinTypes = TestPins.GetBasicTypes();
        IntS pin_type_size = TestPinTypes.GetSize();
        IntS verify_size = ValidTypes.GetSize();
         
        for (int enum_iter=0; enum_iter<pin_type_size; ++enum_iter) {
            int equal_type = false;
            for (int enum_iter2=0; enum_iter2<verify_size; ++enum_iter2)
                if (TestPinTypes[enum_iter] == ValidTypes[enum_iter2]) equal_type = true;
            if (!equal_type) return false;
        }
        return true;
    }
BoolM TWFuncTest::Initialize() {
    BoolM init_rslt(true);
    return init_rslt;
}


