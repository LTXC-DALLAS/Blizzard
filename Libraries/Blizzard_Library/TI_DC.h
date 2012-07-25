// *************************************************************************************
//  Module      : TI_DC.h
//  Description : 
//
//  Copyright (C) LTX-Credence Corporation 2007-2010.  All rights reserved.
// *************************************************************************************

#include <Unison.h>
#include <TMFamily.h>
#include <Enums.h>
#include <CbitCtrl.h>
#include <TestwareSupport.h>

using namespace UTL;

class TI_DC : public TMFamily
{

 public:
    TI_DC();
    virtual ~TI_DC() { }

    TM_RETURN DoAction(TM_ACTION action);

    virtual TM_RETURN Execute();

    virtual BoolM     ParamCheck();

    virtual BoolM     Initialize();

    typedef EnumS<SV_CONFIG> VarConfigS;

    BoolS     CheckReturnType(const FunctionCall &func, const VarTypeS expected_type, const VarConfigS expected_config, const StringS expected_name) const;


    StringS FormatBreakpointMessage(const StringS TestName, const StringS EventName, const StringS MethodMessage, const StringS ExtraMessage, const TMResultM result_break);

    void ResetResourceConnections (IntS row);
    void ExecuteDigital (IntS row, BoolS debug);
    void TestData (IntS row);
    void ExecuteTestDC (IntS row, BoolS debug);
    void SetSelectConnectDC (IntS row);
    void SystemUsageTracker (StringS type, PinML pins_list, IntS row);
    BoolS CommonSetup (IntS row);
    BoolS TestedType ();

 protected:
    // locally defined parameter variables

    BoolS                       debug;
    ArrayOfBoolS                row_enable;
    ArrayOfBoolS                test_per_pin;
    ArrayOfPinML                force_pins;
    EnumS<DcType>               force_type;
    ArrayOfEnumS<SenseConnect>  sense_connect;
    EnumS<CbitType>             cbit_type;
    ArrayOfPinML                set_cbit_list;
    ArrayOfFloatS               relay_delay;
    ArrayOfFloatS               force_value;
    ArrayOfFloatS               min_voltage;
    ArrayOfFloatS               max_voltage;
    ArrayOfFloatS               max_current;
    ArrayOfFloatS               settling_time; 
    ArrayOfStringS              pattern_name;
    ArrayOfStringS              pattern_label;
    EnumS<ExecPattern>          setup_pattern; 
    ArrayOfBoolS                continue_patterns;
    ArrayOfUnsignedM            measure_averages;
    ArrayOfBoolS                open_dcls;
    ArrayOfEnumS<RemoveConnect> remove_connections;
    PinML                       preset_pins_high;
    PinML                       preset_pins_low;
    BoolS                       use_testware;
    BoolS                       do_clo;
    ArrayOfBoolS                fv_mode;
    ArrayOfBoolS                fi_mode;
    ArrayOfEnumS<TWDataType>    testware_datatype;
    ArrayOfFloatM1D             row_results;
    ArrayOfPinML                test_pins;
    ArrayOfObjectS              test_limits;
    ArrayOfObjectS              opens_limits;
    ArrayOfObjectS              shorts_limits;
    ArrayOfPinML                dp_pins;
    ArrayOfPinML                ps_pins;
    ArrayOfPinML                qfvi_pins;
    ArrayOfBoolS                msr_i;
    ArrayOfBoolS                msr_v;
    ArrayOfBoolS                use_ppmu;
    ArrayOfBoolS                use_cpmu;
    ArrayOfIntS1D               dp_placement_ary;
    ArrayOfIntS1D               ps_placement_ary;
    ArrayOfIntS1D               qfvi_placement_ary;
    ArrayOfBoolS                suppress_lo_lim;
    BoolS                       Initialized;
    Levels                      LevelsSetup;
    ArrayOfEnumM<TM_RESULT>     row_test_result;
    BoolS                       run_time_characterization;
    static PintypeTypeS         DIGITAL_PINS;
    static PintypeTypeS         POWER_PINS;
    static PintypeTypeS         VI_PINS;
    static PintypeTypeS         RESOURCE_PINS;

 private:
    // characterization support
    static TI_DC *ParamPtr;
    void   SetParamPtr() { ParamPtr = this; }
    static TMResultM Callback();
    
    StringS TI_DC_GetPinInstrument(PinM pin);
};

TM_RETURN TI_DC::DoAction(TM_ACTION action)
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

// ****************************
// family class service methods
// ****************************

BoolS TI_DC::CheckReturnType( const FunctionCall &func, const VarTypeS expected_type, const VarConfigS expected_config, const StringS expected_name) const
{
    if ((expected_type != UTL_VOID) && (func.GetReturnType() != expected_type))
        return false;
    if ((expected_config != UTL_VOID) && (func.GetReturnConfig() != expected_config))
        return false;
    if (expected_name.Length() && (func.GetReturnTypeName() != expected_name))
        return false;
    return true;
}

StringS TI_DC::FormatBreakpointMessage(const StringS TestName, const StringS EventName, const StringS MethodMessage,
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
