#include <FX_TMU.h>

TMFAMILY_CLASS (FX_TMU)

TM_RETURN FX_TMU::Execute () {

    TMResultM test_result  = TM_NOTEST;
    IntS row;
    IntS number_of_pins;
    IntS number_of_rows;
    UnsignedM pulses;
    FloatM1D test_value;
    BoolM1D TMU_timeout;
    // Declare site variables used for site iterator
    SITE site;
    Sites SavedSites = ActiveSites;
    SiteIter site_iter = SavedSites.Begin();

    if (debug) { TIME.StartTimer (); }  
    
    number_of_rows = row_enable.GetSize();
    row_test_result.Resize (number_of_rows, TM_NOTEST);
    for (row = 0; row < number_of_rows; row++) {
        number_of_pins = test_pins[row].GetNumPins();
        if (number_of_pins > 0) { test_value.Resize (number_of_pins, 0.); }
        if (row_enable[row]) {  
            LimitStruct limits_struct(test_limits[row]);
            if (measurement_type == TMU_MEASURE_FREQUENCY_COUNTER) {    
                if (number_of_pulses == CountLegacy)         { pulses =   10000; } // Default value
                else if (number_of_pulses[row] == Count10)   { pulses =      10; }
                else if (number_of_pulses[row] == Count100)  { pulses =     100; }
                else if (number_of_pulses[row] == Count1k)   { pulses =   10000; }
                else if (number_of_pulses[row] == Count100k) { pulses =  100000; }
                else if (number_of_pulses[row] == Count1M)   { pulses = 1000000; }
                TMU.MeasureFrequencyByCount (test_pins[row], pulses, max_expected_frequency[row], test_value, limits_struct.GetSimulateValue().GetFloatM());       
            }           
            else if (measurement_type == TMU_MEASURE_FREQUENCY) {
                TMU.SetTimeout (200msec);
                TMU.SetTrigger (test_pins[row], test_pins[row], arm_tmu_on[row]);
                TMU.MeasureFrequency (test_pins[row], max_expected_frequency[row], start_measure_on[row], number_of_samples[row], test_value, limits_struct.GetSimulateValue().GetFloatM());
                TMU_timeout = TMU.Wait (test_pins[row]);
                site_iter = SavedSites.Begin();
                for (site_iter.Begin(); !site_iter.End(); site_iter++) {
                    site = site_iter.GetValue();
                    if (TMU_timeout[site][0]) { cout << "FX_TMP timed out on site " << site << endl;}
                    else {  }
                }   // endfor site
            }    
            row_results[row] = test_value;
            // Test and datalog
            TIDlog.FloatValue (test_value, test_pins[row], limits_struct, use_testware, testware_datatype);
            row_test_result[row] = limits_struct.GetResult();
            test_result = AccumulateResults(test_result, row_test_result[row]);
       }    // endif row_enable   
    }       // endfor row

    if (debug) { std::cout << "FX_TMU executed in " << TIME.GetTimer() << std::endl; }

    SetResult (test_result);
    return TM_HAS_RESULT;
}

BoolM FX_TMU::Initialize() {
    BoolM init_status(true);
    return init_status;
}

BoolM FX_TMU::ParamCheck() {
    StringS error_message;
    BoolM param_check_status(true);      
    return param_check_status;
}

FX_TMU::FX_TMU () {

    StringS text_field;

    AddInputParameter(debug, "debug", "FALSE");
    SetParameterAttribute("debug","parameter-group","Base Settings");           
    SetParameterAttribute("debug", "tooltip", "Debug variable.");

    AddInputParameter(use_testware, "use_testware", "TRUE");
    SetParameterAttribute("use_testware","parameter-group","Base Settings");           
    SetParameterAttribute("use_testware", "tooltip", "Use the testware database.");
 
    AddInputParameter(testware_datatype, "testware_datatype", "TWDataType:TWMinimumData");
    SetParameterAttribute("testware_datatype","parameter-group","Base Settings" );    
    SetParameterAttribute("testware_datatype", "tooltip", "Testware data type.");

    AddInputParameter(run_pattern, "run_pattern", "FALSE");
    SetParameterAttribute("run_pattern","parameter-group","Setup Settings" );    
    text_field = "run_pattern - Run MSDI pattern if set to TRUE. It is FALSE by default.";
    SetParameterAttribute("run_pattern", "description", text_field);  

    AddInputParameter(preset_pins, "preset_pins", "FALSE");
    SetParameterAttribute("preset_pins","parameter-group","Setup Settings");    
    text_field = "preset_pins - If you have pins you wish to preset to a high or a low, set this boolean to TRUE.";
    SetParameterAttribute("preset_pins", "description", text_field);

    AddInputParameter(measurement_type, "measurement_type", "TMU_MEASURE_TYPE:TMU_MEASURE_FREQUENCY");
    SetParameterAttribute("measurement_type","parameter-group","Test Settings" );    
    text_field =  "TMU_MEASURE_TYPE:TMU_MEASURE_FREQUENCY - default<br>";
    text_field += "TMU_MEASURE_TYPE:TMU_MEASURE_FREQUENCY_COUNTER<br>";
    text_field += "TMU_MEASURE_TYPE:TMU_MEASURE_DUTY_CYCLE<br>";
    text_field += "TMU_MEASURE_TYPE:TMU_MEASURE_PERIOD<br>";
    text_field += "TMU_MEASURE_TYPE:TMU_MEASURE_DELAY<br>";
    text_field += "TMU_MEASURE_TYPE:TMU_MEASURE_RISE_TIME<br>";
    text_field += "TMU_MEASURE_TYPE:TMU_MEASURE_FALL_TIME<br>";
    text_field += "TMU_MEASURE_TYPE:TMU_MEASURE_DIGITIZED<br>";
    text_field += "TMU_MEASURE_TYPE:TMU_MEASURE_PULSE_WIDTH<br>";
    SetParameterAttribute("measurement_type", "description", text_field);

    AddInputParameter(row_enable, "row_enable", "TRUE");
    SetParameterAttribute("row_enable","parameter-group","Test Settings" );    
    text_field = "row_enable - Set to true to enable execution of the row.";
    SetParameterAttribute("row_enable", "description", text_field);

    AddInputParameter(test_pins, "test_pins", "");
    SetParameterAttribute("test_pins","parameter-group","Test Settings" );    
    text_field = "test_pins - ";
    SetParameterAttribute("test_pins", "description", text_field);

    AddInputParameter(reference_pins, "reference_pins", "");
    SetParameterAttribute("reference_pins","parameter-group","Test Settings" );    
    text_field = "reference_pins - ";
    SetParameterAttribute("reference_pins", "description", text_field);
    SetParameterAttribute("reference_pins", "display-if", "..measurement_type = TMU_MEASURE_TYPE:TMU_MEASURE_DELAY");
    
    AddInputParameter(preset_pins_high, "preset_pins_high", "");
    SetParameterAttribute("preset_pins_high","parameter-group","Test Settings" );    
    text_field = "preset_pins_high - ";
    SetParameterAttribute("preset_pins_high", "description", text_field);
    SetParameterAttribute("preset_pins_high", "display-if", "..preset_pins");

    AddInputParameter(preset_pins_low, "preset_pins_low", "");
    SetParameterAttribute("preset_pins_low","parameter-group","Test Settings" );    
    text_field = "preset_pins_low - ";
    SetParameterAttribute("preset_pins_low", "description", text_field);
    SetParameterAttribute("preset_pins_low", "display-if", "..preset_pins");
/*
    AddInputParameter(edge_one_driven_by, "edge_one_driven_by", "EdgeDrivenBy:Dut");
    SetParameterAttribute("edge_one_driven_by","parameter-group","Test Settings" );    
    text_field =  "edge_one_driven_by - Selections are<br>";
    text_field += "'DUT' - default  This causes the test method to use the cal factors that are defined for the test for the Reference_pins<br>";
    text_field += "'TESTER'         This causes the cal factors to not be used when the tester is driving the TDP_reference_pins.<br>";
    SetParameterAttribute("edge_one_driven_by", "description", text_field);
    SetParameterAttribute("edge_one_driven_by", "display-if", "value(..measurement_type) >= value(MeasType:TpdRise2Rise) AND value(..measurement_type) <= value(MeasType:TpdFall2Fall)");
*/
    AddInputParameter(pattern_name, "pattern_name", "");
    SetParameterAttribute("pattern_name","parameter-group","Test Settings" );    
    text_field = "pattern_name - ";
    SetParameterAttribute("pattern_name", "description", text_field);
    SetParameterAttribute("pattern_name", "display-if", "..run_pattern");

    AddInputParameter(pattern_label, "pattern_label", "");
    SetParameterAttribute("pattern_label","parameter-group","Test Settings" );    
    text_field = "pattern_label - ";
    SetParameterAttribute("pattern_label", "description", text_field);
    SetParameterAttribute("pattern_label", "display-if", "..run_pattern");

    AddInputParameter(number_of_samples, "number_of_samples", "1");
    SetParameterAttribute("number_of_samples","parameter-group","Test Settings");    
    text_field = "number_of_samples - ";
    SetParameterAttribute("number_of_samples", "description", text_field);
    SetParameterAttribute("number_of_samples", "display-if", "..measurement_type != TMU_MEASURE_TYPE:TMU_MEASURE_FREQUENCY_COUNTER");

    AddInputParameter(number_of_pulses, "number_of_pulses", "FreqCountSamples:Count1k");
    SetParameterAttribute("number_of_pulses","parameter-group","Test Settings");    
    text_field =  "number_of_pulses - Selections are<br>";
    text_field += "FreqCountSamples:CountLegacy<br>";
    text_field += "FreqCountSamples:Count10<br>";
    text_field += "FreqCountSamples:Count100<br>";
    text_field += "FreqCountSamples:Count1k<br>";
    text_field += "FreqCountSamples:Count100k<br>";
    text_field += "FreqCountSamples:Count1M<br>";
    SetParameterAttribute("number_of_pulses", "description", text_field);
    SetParameterAttribute("number_of_pulses", "display-if", "..measurement_type = TMU_MEASURE_TYPE:TMU_MEASURE_FREQUENCY_COUNTER");

    AddInputParameter(max_expected_frequency, "max_expected_frequency", "25MHz");
    SetParameterAttribute("max_expected_frequency","parameter-group","Test Settings");    
    text_field = "max_expected_frequency - This is the maximum frequency you expect to see in your measurement.";
    SetParameterAttribute("max_expected_frequency", "description", text_field);
    SetParameterAttribute("max_expected_frequency", "display-if", "..measurement_type = TMU_MEASURE_TYPE:TMU_MEASURE_FREQUENCY OR ..measurement_type = TMU_MEASURE_TYPE:TMU_MEASURE_FREQUENCY_COUNTER");

    AddInputParameter(min_expected_period, "min_expected_period", "40ns");
    SetParameterAttribute("min_expected_period","parameter-group","Test Settings");    
    text_field = "min_expected_period - This is the minimum period you expect to see in your measurement.";
    SetParameterAttribute("min_expected_period", "description", text_field);
    SetParameterAttribute("min_expected_period", "display-if", "..measurement_type = TMU_MEASURE_TYPE:TMU_MEASURE_PERIOD");

    AddInputParameter(min_expected_pulse_width, "min_expected_pulse_width", "40ns");
    SetParameterAttribute("min_expected_pulse_width","parameter-group","Test Settings");    
    text_field = "min_expected_pulse_width - This is the minimum pulse width you expect to see in your measurement.";
    SetParameterAttribute("min_expected_pulse_width", "description", text_field);
    SetParameterAttribute("min_expected_pulse_width", "display-if", "..measurement_type = TMU_MEASURE_TYPE:TMU_MEASURE_PULSE_WIDTH");
/*
    AddInputParameter(prescaler_setting, "prescaler_setting", "Prescaler:One");
    SetParameterAttribute("prescaler_setting","parameter-group","Test Settings");    
    text_field  = "prescaler_setting - This is the prescaler setting you wish to use. According to the specs, the TMU can only measure frequency or period up<br>";
    text_field += "to 25MHz. Given this, the prescaler must be used to scale down the input so that the TMU can measure it.<br>";
    SetParameterAttribute("prescaler_setting", "description", text_field);
    SetParameterAttribute("prescaler_setting", "display-if", "");
*/
    AddInputParameter(arm_tmu_on, "arm_tmu_on", "TMU_TRIGGER_TYPE:TMU_TRIGGER_IMMEDIATE");
    SetParameterAttribute("arm_tmu_on","parameter-group","Test Settings");    
    text_field =  "arm_tmu_on - Selections are<br>";
    text_field += "TMU_TRIGGER_TYPE:TMU_TRIGGER_IMMEDIATE- default<br>";
    text_field += "TMU_TRIGGER_TYPE:TMU_TRIGGER_ON_PIN<br>";
    text_field += "TMU_TRIGGER_TYPE:TMU_TRIGGER_ON_PATTERN<br>";
    text_field += "TMU_TRIGGER_TYPE:TMU_TRIGGER_ON_SYNCREF<br>";
    SetParameterAttribute("arm_tmu_on", "description", text_field);
    SetParameterAttribute("arm_tmu_on", "display-if", "..measurement_type != TMU_MEASURE_TYPE:TMU_MEASURE_FREQUENCY_COUNTER");

    AddInputParameter(start_measure_on, "start_measure_on", "TMU_EDGE_TYPE:TMU_RISING_EDGE");
    SetParameterAttribute("start_measure_on","parameter-group","Test Settings");    
    text_field =  "start_measure_on - Selections are<br>";
    text_field += "TMU_EDGE_TYPE:TMU_RISING_EDGE - default<br>";
    text_field += "TMU_EDGE_TYPE:TMU_FALLING_EDGE<br>";
    SetParameterAttribute("start_measure_on", "description", text_field);
    SetParameterAttribute("start_measure_on", "display-if", "..measurement_type != TMU_MEASURE_TYPE:TMU_MEASURE_FREQUENCY_COUNTER");
/*
    AddInputParameter(test_jitter, "test_jitter", "FALSE");
    SetParameterAttribute("test_jitter","parameter-group","Test Settings");    
    text_field =  "test_jitter - Setting the boolean to TRUE will open the setups and limits for Jitter testing.<br>";
    text_field += "NOTE: This feature should normally default to FALSE, but there are issues with the <br>";
    text_field += "event digitizer that define that it only be used in sampling mode. Therefore there<br>";
    text_field += "is a param check established to force the user to use this feature until the issue<br>";
    text_field += "is resolved.<br>";
    SetParameterAttribute("test_jitter", "description", text_field);
    SetParameterAttribute("test_jitter", "display-if", "(..measurement_type = MeasType:Frequency OR ..measurement_type = MeasType:Period) AND ..TEDAvailable");

    AddInputParameter(jitter_type, "jitter_type", "JitterType:Edge");
    SetParameterAttribute("jitter_type","parameter-group","Test Settings");    
    text_field = "jitter_type - Selections are the type of jitter calculations that you would like performed.";
    text_field += "JitterType:Edge - default This is the most common type of jitter measurement for the start_measure_on selected.<br>";
    text_field += "JitterType:Period         This returns the jitter for the entire period rather than for a specific edge.<br>";
    SetParameterAttribute("jitter_type", "description", text_field);
    SetParameterAttribute("jitter_type", "display-if", "..test_jitter AND (..measurement_type = MeasType:Frequency OR ..measurement_type = MeasType:Period)");
*/
/*
    AddInputParameter(trigger_voltage, "trigger_voltage", "TriggerVoltage:Voh2Voh");
    SetParameterAttribute("trigger_voltage","parameter-group","Test Settings");    
    text_field = "trigger_voltage - Selections are for what voltage the comparators trip at.";
    SetParameterAttribute("trigger_voltage", "description", text_field);
    SetParameterAttribute("trigger_voltage", "display-if", "value(..measurement_type) >= value(MeasType:TpdRise2Rise) AND value(..measurement_type) <= value(MeasType:TpdFall2Fall) OR NOT ..TEDMethodUsed OR value(..measurement_type) <= value(MeasType:PulseWidth)");
*/
    AddOutputParameter(row_test_result, "row_test_result");
    SetParameterAttribute("row_test_result","parameter-group","Limits" );                      

    AddOutputParameter(row_results, "row_results");
    SetParameterAttribute("row_results","parameter-group","Limits" );                      
    SetParameterAttribute("row_results", "display-if", "TRUE");

    AddInputParameter(test_limits, "test_limits");
    SetParameterAttribute("test_limits","restrict-type","LimitStruct" );                      
    SetParameterAttribute("test_limits","parameter-group","Limits");  
 /*
    AddInputParameter(rms_jitter_limits, "rms_jitter_limits");
    SetParameterAttribute("rms_jitter_limits","parameter-group","Limits");                          
    SetParameterAttribute("rms_jitter_limits", "display-if", "..test_jitter");
 
    AddInputParameter(max_jitter_limits, "max_jitter_limits");
    SetParameterAttribute("max_jitter_limits","parameter-group","Limits");                          
    SetParameterAttribute("max_jitter_limits", "display-if", "..test_jitter");

    AddInputParameter(min_jitter_limits, "min_jitter_limits");
    SetParameterAttribute("min_jitter_limits","parameter-group","Limits");                          
    SetParameterAttribute("min_jitter_limits", "display-if", "..test_jitter");

    AddInputParameter(jitter_range_limits, "jitter_range_limits");
    SetParameterAttribute("jitter_range_limits","parameter-group","Limits");                          
    SetParameterAttribute("jitter_range_limits", "display-if", "..test_jitter");
*/    
}
