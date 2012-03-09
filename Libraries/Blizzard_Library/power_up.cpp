#include <power_up.h>

TMFAMILY_CLASS (power_up)

TM_RETURN power_up::Execute () {

    limit_table = TestProg.GetActiveLimitTable();
    TMResultM test_result  = TM_NOTEST;
    int row;

    int number_of_rows = Tested_pins.GetSize();
    row_test_result.Resize (number_of_rows, TM_NOTEST);
    for (row = 0; row < number_of_rows; row++) {
        /*FI_VI (Tested_pins[row], 0uA, 49uA, 3.9V, 3.9V, true);*/ }
    TIME.Wait (1msec);
//    DutPowerON (packv, vccv, batv, 0msec);
    DIGITAL.SetDriveState ("DIG_INIT_LO", DIGITAL_DRV_STATE_LOW);
    DIGITAL.SetDriveState ("DIG_INIT_HI", DIGITAL_DRV_STATE_HIGH);
    DIGITAL.SetDriveState ("DIG_INIT_HIZ", DIGITAL_DRV_STATE_OFF);
    TIME.Wait (wait_time);  

    for (row = 0; row < number_of_rows; row++) {
        limits_struct = limit_table.FindLimit(test_limits[row]);
        VI.SetMeasureSamples (Tested_pins[row], 1);
        VI.MeasureVAverage (Tested_pins[row], row_reg_value[row], limits_struct.GetSimulateValue().GetFloatM());
        if (SYS.TesterSimulated ()) { row_reg_value[row] = limits_struct.GetSimulateValue().GetFloatM(); }
//        Test_Double_Array_Test_Text (row_reg_value[row], test_pins[row], limits_struct, use_testware, testware_datatype);
        row_test_result[row] = limits_struct.GetResult(); 
        if (debug) { cout << "Test result for row "<< row << " is " << row_test_result[row] << endl; }
        test_result = AccumulateResults(test_result, row_test_result[row]);
    }    
    
    for (row = 0; row < number_of_rows; row++) {
        VI.Gate (Tested_pins[row], VI_GATE_OFF_LOZ);
        VI.Disconnect (Tested_pins[row]); }
    DIGITAL.Connect ("DIG_ALL", DIGITAL_DCL_TO_DUT);

    SetResult (test_result);
    return TM_HAS_RESULT;
}

BoolM power_up::Initialize() {
    BoolM init_status(true);
    return init_status;
}

BoolM power_up::ParamCheck() {
    StringS error_message;
    BoolM param_check_status(true);
    limit_table = TestProg.GetActiveLimitTable();
    int number_of_rows = Tested_pins.GetSize();
    for (int row = 0; row < number_of_rows; row++) {
        limits_struct = limit_table.FindLimit(test_limits[row]);
        if (!limits_struct.Valid()) { 
            error_message = "There must be a valid limit table in limit structure";
            ERR.ReportError(ERR_PARAMETER_OUT_OF_RANGE, error_message, UTL_VOID, NO_SITES, UTL_VOID);            
            param_check_status = false; }
    }       
    if (debug) {cout << "power_up: ParamCheck status is " <<  param_check_status << endl; }
    return param_check_status;
}

power_up::power_up () {
    StringS text_field;
    AddInputParameter (debug, "debug", "FALSE");
    SetParameterAttribute("debug","parameter-group","Base Settings");    
    text_field = "debug - General purpose debug variable";
    SetParameterAttribute ("debug", "description", text_field);

    AddInputParameter (vccv, "vccv");
    SetParameterAttribute("vccv","parameter-group","Base Settings");    
    text_field = "vccv - VCC power supply";
    SetParameterAttribute ("vccv", "description", text_field);

    AddInputParameter (packv, "packv");
    SetParameterAttribute("packv","parameter-group","Base Settings");    
    text_field = "packv - PACK power supply";
    SetParameterAttribute ("packv", "description", text_field);

    AddInputParameter (batv, "batv");
    SetParameterAttribute("batv","parameter-group","Base Settings");    
    text_field = "batv - BAT power supply";
    SetParameterAttribute ("batv", "description", text_field);

    AddInputParameter (wait_time, "wait_time", "1ms");
    SetParameterAttribute("wait_time","parameter-group","Base Settings");    
    text_field = "wait_time - Settling time before measurement";
    SetParameterAttribute ("wait_time", "description", text_field);

    AddInputParameter(use_testware, "use_testware", "TRUE");
    SetParameterAttribute("use_testware","parameter-group","Base Settings");           
    SetParameterAttribute("use_testware", "tooltip", "Use the testware database.");
 
    AddInputParameter(testware_datatype, "testware_datatype", "TWDataType:TWNominalData");
    SetParameterAttribute("testware_datatype","parameter-group","Base Settings" );    
    SetParameterAttribute("testware_datatype", "tooltip", "Testware data type.");
 
    AddInputParameter (Tested_pins, "Tested_pins");
    SetParameterAttribute("Tested_pins","parameter-group","Rows Settings");    
    text_field = "Tested_pins - Regulator pins REG25 and REG33";
    SetParameterAttribute ("Tested_pins", "description", text_field);

    AddOutputParameter (row_reg_value, "row_reg_value");
    SetParameterAttribute("row_reg_value","parameter-group","Rows Settings");    
    text_field = "row_reg_value - Regulators measured voltages";
    SetParameterAttribute ("row_reg_value", "description", text_field);

    AddInputParameter(test_pins, "test_pins");
    SetParameterAttribute("test_pins","parameter-group","Limits");                      

    AddInputParameter(test_limits, "test_limits");
    SetParameterAttribute("test_limits","parameter-group","Limits");                      

    AddOutputParameter(row_test_result, "row_test_result");
    SetParameterAttribute("row_test_result","parameter-group","Limits");                      
}
