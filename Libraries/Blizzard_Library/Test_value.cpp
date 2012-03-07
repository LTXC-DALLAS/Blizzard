#include <Test_value.h>

TMFAMILY_CLASS (Test_value)

TM_RETURN Test_value::Execute () {

    TMResultM local_result = TM_NOTEST;
    TMResultM test_result  = TM_NOTEST;
    IntS row, number_of_rows;
    number_of_rows = row_enable.GetSize();
	row_test_result.Resize (limits_test_value.GetSize(), TM_NOTEST);   
 
    // Test and datalog
    for (row = 0; row < number_of_rows; row++) {
        if (row_enable[row]) {

    		IntS number_of_tested_pins = tested_pins[row].GetNumPins();

       		row_test_result[row] = TIDlog.ValueLS(tested_value[row], tested_pins[row], limits_test_value[row], use_testware, testware_datatype, false);

    		test_result = DLOG.AccumulateResults (test_result, row_test_result[row]);
		}
	}
    		SetResult (test_result);
    		return TM_HAS_RESULT;
}

BoolM Test_value::Initialize() {
    BoolM init_status(true);
    return init_status;
}

BoolM Test_value::ParamCheck() {
    StringS error_message;
    BoolM param_check_status(true);      
    return param_check_status;
}

Test_value::Test_value () {
    StringS text_field;

    AddInputParameter(use_testware, "use_testware", "TRUE");
    SetParameterAttribute("use_testware","parameter-group","Base Settings");           
    SetParameterAttribute("use_testware", "tooltip", "Use the testware database.");
 
    AddInputParameter(testware_datatype, "testware_datatype", "TWDataType:TWMinimumData");
    SetParameterAttribute("testware_datatype","parameter-group","Base Settings" );    
    SetParameterAttribute("testware_datatype", "tooltip", "Testware data type.");

    AddInputParameter(row_enable,"row_enable", "TRUE");
    SetParameterAttribute("row_enable","parameter-group","Test Settings" );
    
    AddInputParameter(tested_pins, "tested_pins", "");
    SetParameterAttribute("tested_pins","parameter-group","Test Settings" );    
    text_field = "tested_pins - ";
    SetParameterAttribute("tested_pins", "description", text_field);

    AddInputParameter(tested_value, "tested_value", "");
    SetParameterAttribute("tested_value","parameter-group","Test Settings" );    
    text_field = "tested_value - ";
    SetParameterAttribute("tested_value", "description", text_field);

    AddInputParameter(limits_test_value, "limits_test_value");
    SetParameterAttribute("limits_test_value","parameter-group","Test Settings");  
    SetParameterAttribute("limits_test_value","restrict-type","LimitStruct");      

    AddOutputParameter(row_test_result, "row_test_result");
    SetParameterAttribute("row_test_result","parameter-group","Test Settings" );                                      

 }
