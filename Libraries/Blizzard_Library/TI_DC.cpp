
// *************************************************************************************
//  Module      : TI_DC.cpp
//  Description : 
//
//  Copyright (C) LTX-Credence Corporation 2007-2010.  All rights reserved.
// *************************************************************************************

#include "TI_DC.h"

using namespace std;

const int MAX_ROWS = 32;
const int MAX_CONNECTIONS = 64;

static StringS1D connection_table1(MAX_CONNECTIONS, "");
static StringS1D connection_table2(MAX_CONNECTIONS, "");

static IntS      connection_counter = 1;

FloatM1D     all_pin_meas_float;
ArrayOfPinML connection_list;
BoolS        common_setup_done = false;
BoolS        safe_to_run = false;

extern StringS TIGetPinInstrument (PinM pin);

TMFAMILY_CLASS(TI_DC)

TM_RETURN TI_DC::Execute()
{
    TMResultM local_result = TM_NOTEST;
    TMResultM test_result  = TM_NOTEST;
    IntS row, number_of_rows;

    if (debug) {
        TIME.Wait (0msec);
        TIME.StartTimer ();
    }  
    number_of_rows = row_enable.GetSize();
    if (TI_DC::force_type == OSPins)
        row_test_result.Resize (shorts_limits.GetSize(), TM_NOTEST);
    else
        row_test_result.Resize (test_limits.GetSize(), TM_NOTEST);
   
    
    for (row = 0; row < number_of_rows; row++) {
        if (row_enable[row]) {
            if (remove_connections[row] == PreTestAll
             || remove_connections[row] == PrePostAll
             || remove_connections[row] == PreAllNever) ResetResourceConnections (row);
            if (cbit_type != NO_CBIT) {
                CloseCbits (set_cbit_list[row], cbit_type);
                if (relay_delay[row] > 0) TIME.Wait (relay_delay[row]);
            }
            if (setup_pattern == PreSetup and pattern_name[row] != "") {
                ExecuteDigital (row, debug);
            }
            if (fi_mode[row] || fv_mode[row] || (qfvi_pins[row].GetNumPins () > 0)) {
                if (debug) {
                    std::cout << "pre setselectconnect : " << TIME.GetTimer() << std::endl;
                }
                SetSelectConnectDC (row);
                if (debug) {
                    std::cout << "post setselectconnect : " << TIME.GetTimer() << std::endl;
                }
            }
            if (setup_pattern == PreMeas and pattern_name[row] != "") {
                ExecuteDigital (row, debug);
            }
            if (settling_time[row] != 0sec) {
                if (qfvi_pins[row].GetNumPins () > 0 and settling_time[row] < 6msec) {
                    TIME.Wait (6msec);
                }
                else {
                    TIME.Wait (settling_time[row]);
                }    
            }
            if (msr_i[row] || msr_v[row]) {
                ExecuteTestDC (row, debug);
            }
            if (setup_pattern == PostMeas and pattern_name[row] != "") {
                ExecuteDigital (row, debug);
            }
            if (continue_patterns[row]) {
                DIGITAL.WaitForPattern();
            }
            if (remove_connections[row] == PostTestAll
                || remove_connections[row] == LocalTestOnly
                || remove_connections[row] == PrePostAll
                || remove_connections[row] == PostAllNever) ResetResourceConnections (row);
            if (TestedType()) {
                TestData (row);
                test_result = DLOG.AccumulateResults(test_result, row_test_result[row]);
            }
        }
    }
    if (!TestedType())
        test_result = TM_NOTEST;
        
    if (debug) {
        std::cout << "TI_DC.tmod executed in " << TIME.StopTimer() << std::endl;
    }

    if (RunTime.ResetPressed()) {
        SetResult(test_result);
        return TM_HAS_RESULT;
    }

    SetResult(test_result);
    return TM_HAS_RESULT;
}

BoolS TI_DC::TestedType () {
    return (force_type == ForceITestV or force_type == ForceVTestI
         or force_type == ForceVTestR or force_type == ForceITestR
         or force_type == TestI or force_type == TestV
         or force_type == ForceVTestV or force_type == OSPins);
}

void TI_DC::TestData (IntS row) {

    if (TI_DC::force_type == OSPins) {
        row_test_result[row] = TIDlog.ValueLS (row_results[row], test_pins[row], opens_limits[row], use_testware, testware_datatype[row], do_clo);
        TMResultM shorts_result;
        shorts_result = TIDlog.ValueLS(row_results[row], test_pins[row], shorts_limits[row], use_testware, testware_datatype[row], do_clo);
        row_test_result[row] = DLOG.AccumulateResults(row_test_result[row], shorts_result);
    }
    else {
        row_test_result[row] = TIDlog.ValueLS (row_results[row], test_pins[row], test_limits[row], use_testware, testware_datatype[row], do_clo);
    }
}

void TI_DC::ExecuteDigital (IntS row, BoolS debug) {
    BoolM test_fail;
    if (pattern_label[row] != "") {
        DIGITAL.ExecutePattern (pattern_label[row]);
    }
    else {
        DIGITAL.ExecutePattern (pattern_name[row]);
    }
}

void TI_DC::ResetResourceConnections (IntS row) {
    IntS i, start_index;
    int connection_row;
    int connection_column;
    PinML temp_pins;
    if (remove_connections[row] == LocalTestOnly) {
        start_index = connection_counter - 1;
    }
    else {
        start_index = 1;
    }
    for (i = start_index; i <= connection_counter - 1; i++) {
        if (connection_table1[i] == "DP") {
            if (connection_table2[i] == "cpmu") {
                CPMU.Disconnect (connection_list[i]);
                DIGITAL.Connect (connection_list[i], DIGITAL_DCL_TO_DUT);
            }
            else if (connection_table2[i] == "ppmu") {
                //SPR 135859
                // DIGITAL.Disconnect (connection_list[i], DIGITAL_PPMU_TO_DUT);
                // This was replaced by a VI statement. Todor:0615
                // The SPR will be left open since it is a little weird.
                VI.Disconnect (connection_list[i]); // vmax 0.0V;          }
            }
        }
        else if (connection_table1[i] == "HCOVI") {
            VI.Gate (connection_list[i], VI_GATE_OFF_HIZ);
            VI.Disconnect (connection_list[i]);
        }
        else if (connection_table1[i] == "QFVI") {
            //Regex_Escape:gate qfvi connection_list[i] off;
            //Regex_Escape:disconnect qfvi connection_list[i];
            //Regex_Escape:set qfvi connection_list[i] to fv 0V;
        }
        else {
            VI.Gate (connection_list[i], VI_GATE_OFF_LOZ);
            VI.Disconnect (connection_list[i]);
            //VI.ForceI (connection_list[i], 0uA clamp vmax 5V vmin - 4V);
        }
    }
    connection_counter = start_index;
    if (remove_connections[row] == LocalTestOnly) {
        connection_list[connection_counter] = UTL_VOID;
        connection_table1[connection_counter] = "";
        connection_table2[connection_counter] = "";
    }
    else {
        connection_table1.Slice(1,MAX_CONNECTIONS-1) = "";
        connection_table2.Slice(1,MAX_CONNECTIONS-1) = "";
        connection_list.Slice(0,MAX_CONNECTIONS-1) = UTL_VOID;
    }
    TIME.Wait (0.0);
}

void TI_DC::SystemUsageTracker (StringS type, PinML pins_list, IntS row) {
    StringS connection;

    if (remove_connections[row] == Never
     || remove_connections[row] == PreAllNever
     || remove_connections[row] == PostAllNever) {
        return;
    }
    connection = TI_DC_GetPinInstrument (pins_list[0]);
    if (connection_counter < 0 || connection_counter >= MAX_CONNECTIONS) {
        connection_counter = 1;
    }
    connection_table1 [connection_counter] = connection;
    connection_table2 [connection_counter] = type;
    connection_list[connection_counter] = pins_list;
    connection_counter = connection_counter + 1;
    
    //cout << connection_table1[connection_counter-1] << endl;
    //cout << connection_counter-1 << endl;
}

void TI_DC::ExecuteTestDC (IntS row, BoolS debug) {
    IntS     num_ps_pins, num_dp_pins, num_qfvi_pins, total_num_pins;
    FloatM   single_measurement;
    FloatM1D PerPinMeasurements; 

    num_ps_pins = ps_pins[row].GetNumPins ();
    num_qfvi_pins = qfvi_pins[row].GetNumPins ();
    num_dp_pins = dp_pins[row].GetNumPins ();
    total_num_pins = num_ps_pins+num_qfvi_pins+num_dp_pins;
    if (total_num_pins > 0){ // Only resize on the initial execution.
        row_results[row].Resize (total_num_pins, 0.0);
    }    
    if (num_ps_pins > 0) {
        PerPinMeasurements.Resize (num_ps_pins, 0.0); 
        all_pin_meas_float.Resize (num_ps_pins, 0.0);
        //Dont resize this every time it screws up the results index.        
        //row_results[row].Resize (num_ps_pins, 0.0);

        if (msr_i[row]) {
            FloatM1D SimulatedPerPinMeasurements;
            SimulatedPerPinMeasurements.Resize (ps_pins[row].GetNumPins(), -0.0000000uA); 
            VI.SetMeasureSamples (ps_pins[row], measure_averages[row]);
            DEBUG.Breakpoint("AfterSetup",(StringS)FormatBreakpointMessage(RunTime.GetActiveTest().GetName(),"AfterSetup", "TI_DC","",UTL_VOID));
            if (!test_per_pin[row]) {
                for (int i=0; i<num_ps_pins; ++i) {
                    VI.MeasureIAverage (ps_pins[row][i], single_measurement, SimulatedPerPinMeasurements[i]);
                    PerPinMeasurements += single_measurement;
                }
            }
            else
                VI.MeasureIAverage (ps_pins[row], PerPinMeasurements, SimulatedPerPinMeasurements);
            DEBUG.Breakpoint("AfterTest",(StringS)FormatBreakpointMessage(RunTime.GetActiveTest().GetName(),"AfterTest", "TI_DC","",UTL_VOID));
        }
        else if (msr_v[row]) {
            FloatM1D SimulatedPerPinMeasurements;
            SimulatedPerPinMeasurements.Resize (ps_pins[row].GetNumPins(), -0.0000000uV); 
            VI.SetMeasureSamples (ps_pins[row], measure_averages[row]);
            DEBUG.Breakpoint("AfterSetup",(StringS)FormatBreakpointMessage(RunTime.GetActiveTest().GetName(),"AfterSetup", "TI_DC","",UTL_VOID));
            if (!test_per_pin[row]) {
                for (int i=0; i<num_ps_pins; ++i) {
                    VI.MeasureVAverage (ps_pins[row][i], single_measurement, SimulatedPerPinMeasurements[i]);
                    PerPinMeasurements.SetValue (i, single_measurement);
                }
            }
            else 
                VI.MeasureVAverage (ps_pins[row], PerPinMeasurements, SimulatedPerPinMeasurements);
            DEBUG.Breakpoint("AfterTest",(StringS)FormatBreakpointMessage(RunTime.GetActiveTest().GetName(),"AfterTest", "TI_DC","",UTL_VOID));
        }
        if (force_type == ForceVTestR) {
            for (int index = 0; index < num_ps_pins; ++index) {
                all_pin_meas_float.SetValue(index, force_value[row] / PerPinMeasurements[index]);
            }
        }
        else if (force_type == ForceITestR) {
            for (int index = 0; index < num_ps_pins; ++index) {
                all_pin_meas_float.SetValue(index, PerPinMeasurements[index] / force_value[row]);
            }
        }
        else {
            all_pin_meas_float = PerPinMeasurements;
        }
        for (int index = 0; index < num_ps_pins; ++index) {
            row_results[row].SetValue(ps_placement_ary[row][index], all_pin_meas_float[index]);
        }
    }
    if (num_qfvi_pins > 0) {
        all_pin_meas_float.Resize (num_qfvi_pins, 0.0);
        //Dont resize this every time it screws up the results index.       
        //row_results[row].Resize (num_qfvi_pins, 0.0);
        //Regex_Escape:measure qfvi qfvi_pins[row] for measure_averages[row] samples every 10us averaged into all_pin_meas_float;
        if (force_type == ForceVTestR) {
            for (int index = 0; index < num_qfvi_pins; ++index) {
                all_pin_meas_float.SetValue(index, force_value[row] / PerPinMeasurements[index]);
            }
        }
        if (force_type == ForceITestR) {
            for (int index = 0; index < num_qfvi_pins; ++index) {
                all_pin_meas_float.SetValue(index, PerPinMeasurements[index] / force_value[row]);
            }
        }
        else {
            all_pin_meas_float = PerPinMeasurements;
        }
        if (!RunTime.ConnectedToTester()) all_pin_meas_float.Resize (num_qfvi_pins, 1.0);
        for (int index = 0; index < num_qfvi_pins; ++index) {
            row_results[row].SetValue(qfvi_placement_ary[row][index], all_pin_meas_float[index]);
        }
    }
    if (num_dp_pins > 0) {
        PerPinMeasurements.Resize (num_dp_pins, 0.0); 
        all_pin_meas_float.Resize (num_dp_pins, 0.0);
        //Dont resize this every time it screws up the results index.
        //row_results[row].Resize (num_dp_pins, 0.0);
        if (use_cpmu[row]) {
            if (msr_i[row]) {
                Sites SavedSites = ActiveSites;
                SiteIter site_iter = SavedSites.Begin();
                for (site_iter.Begin(); !site_iter.End(); ++site_iter) {
                    RunTime.SetActiveSites(site_iter.GetValue());
                    FloatM1D SimulatedPerPinMeasurements;
                    SimulatedPerPinMeasurements.Resize (dp_pins[row].GetNumPins(), -0.0000000uA); 
                    CPMU.SetMeasureSamples (dp_pins[row], measure_averages[row]);
                    if (!test_per_pin[row]) {
                        for (int i=0; i<num_dp_pins; ++i) {
                            CPMU.MeasureIAverage (dp_pins[row][i], single_measurement, SimulatedPerPinMeasurements[i]);
                            PerPinMeasurements += single_measurement;
                        }
                    }
                    else
                        CPMU.MeasureIAverage (dp_pins[row], PerPinMeasurements, SimulatedPerPinMeasurements);
                }
                RunTime.SetActiveSites(SavedSites);
                CPMU.Disconnect (dp_pins[row]);
                if (force_type == ForceVTestR) {
                    for (int index = 0; index < num_dp_pins; ++index) {
                        all_pin_meas_float.SetValue(index, force_value[row] / PerPinMeasurements[index]);
                    }
                }
                else {
                    all_pin_meas_float = PerPinMeasurements;
                }
                if (!RunTime.ConnectedToTester()) all_pin_meas_float.Resize (num_dp_pins, 1.0);
                for (int index = 0; index < num_dp_pins; ++index) {
                    row_results[row].SetValue(dp_placement_ary[row][index], all_pin_meas_float[index]);
                }
            }
            if (msr_v[row]) {
                Sites SavedSites = ActiveSites;
                SiteIter site_iter = SavedSites.Begin();
                for (site_iter.Begin(); !site_iter.End(); ++site_iter) {
                    RunTime.SetActiveSites(site_iter.GetValue());
                    FloatM1D SimulatedPerPinMeasurements;
                    SimulatedPerPinMeasurements.Resize (dp_pins[row].GetNumPins(), -0.0000000uV); 
                    CPMU.SetMeasureSamples (dp_pins[row], measure_averages[row]);
                    if (!test_per_pin[row]) {
                        for (int i=0; i<num_dp_pins; ++i) {
                            CPMU.MeasureVAverage (dp_pins[row][i], single_measurement, SimulatedPerPinMeasurements[i]);
                            PerPinMeasurements += single_measurement;
                        }
                    }
                    else
                        CPMU.MeasureVAverage (dp_pins[row], PerPinMeasurements, SimulatedPerPinMeasurements);
                }
                RunTime.SetActiveSites(SavedSites);
                CPMU.Disconnect (dp_pins[row]);
                if (force_type == ForceITestR) {
                    for (int index = 0; index < num_dp_pins; ++index) {
                        all_pin_meas_float.SetValue(index, PerPinMeasurements[index] / force_value[row]);
                    }
                }
                else {
                    for (int index = 0; index < num_dp_pins; ++index) {
                        all_pin_meas_float.SetValue(index, PerPinMeasurements[index]);
                    }
                }
                if (!RunTime.ConnectedToTester()) all_pin_meas_float.Resize (num_dp_pins, 1.0);
                for (int index = 0; index < num_dp_pins; ++index) {
                    row_results[row].SetValue(dp_placement_ary[row][index], all_pin_meas_float[index]);
                }
            }
        }
        else if (use_ppmu[row] || force_type == MsrI || force_type == MsrV || force_type == TestI || force_type == TestV) {
            if (msr_i[row]) {
                if (open_dcls[row]) {
                    DIGITAL.Disconnect (dp_pins[row], DIGITAL_DCL_TO_DUT);
                    FloatM1D SimulatedPerPinMeasurements;
                    SimulatedPerPinMeasurements.Resize (dp_pins[row].GetNumPins(), -0.0000000uA); 
                    VI.SetMeasureSamples (dp_pins[row], measure_averages[row]);
                    if (!test_per_pin[row]) {
                        for (int i=0; i<num_dp_pins; ++i) {
                            VI.MeasureIAverage (dp_pins[row][i], single_measurement, SimulatedPerPinMeasurements[i]);
                            PerPinMeasurements += single_measurement;
                        }
                    }
                    else
                        VI.MeasureIAverage (dp_pins[row], PerPinMeasurements, SimulatedPerPinMeasurements);
                }
                else {
                    DIGITAL.Connect (dp_pins[row], DIGITAL_DCL_TO_DUT);
                    FloatM1D SimulatedPerPinMeasurements;
                    SimulatedPerPinMeasurements.Resize (dp_pins[row].GetNumPins(), -0.0000000uV); 
                    VI.SetMeasureSamples (dp_pins[row], measure_averages[row]);
                    if (!test_per_pin[row]) {
                        for (int i=0; i<num_dp_pins; ++i) {
                            VI.MeasureIAverage (dp_pins[row][i], single_measurement, SimulatedPerPinMeasurements[i]);
                            PerPinMeasurements += single_measurement;
                        }
                    }
                    else
                        VI.MeasureIAverage (dp_pins[row], PerPinMeasurements, SimulatedPerPinMeasurements);
                }
                if (force_type == ForceVTestR) {
                    for (int index = 0; index < num_dp_pins; ++index) {
                        all_pin_meas_float.SetValue(index, force_value[row] / PerPinMeasurements[index]);
                    }
                }
                else {
                    for (int index = 0; index < num_dp_pins; ++index) {
                        all_pin_meas_float.SetValue(index, PerPinMeasurements[index]);
                    }
                }
                if (!RunTime.ConnectedToTester()) all_pin_meas_float.Resize (num_dp_pins, 1.0);
                for (int index = 0; index < num_dp_pins; ++index) {
                    row_results[row].SetValue(dp_placement_ary[row][index], all_pin_meas_float[index]);
                }
            }
            if (msr_v[row]) {
                if (open_dcls[row]) {
                    DIGITAL.Disconnect (dp_pins[row], DIGITAL_DCL_TO_DUT);
                    FloatM1D SimulatedPerPinMeasurements;
                    SimulatedPerPinMeasurements.Resize (dp_pins[row].GetNumPins(), -0.0000000uA); 
                    VI.SetMeasureSamples (dp_pins[row], measure_averages[row]);
                    if (!test_per_pin[row]) {
                        for (int i=0; i<num_dp_pins; ++i) {
                            VI.MeasureVAverage (dp_pins[row][i], single_measurement, SimulatedPerPinMeasurements[i]);
                            PerPinMeasurements += single_measurement;
                        }
                    }
                    else
                        VI.MeasureVAverage (dp_pins[row], PerPinMeasurements, SimulatedPerPinMeasurements);
                }
                else {
                    DIGITAL.Connect (dp_pins[row], DIGITAL_DCL_TO_DUT);
                    FloatM1D SimulatedPerPinMeasurements;
                    SimulatedPerPinMeasurements.Resize (dp_pins[row].GetNumPins(), -0.0000000uA); 
                    VI.SetMeasureSamples (dp_pins[row], measure_averages[row]);
                    if (!test_per_pin[row]) {
                        for (int i=0; i<num_dp_pins; ++i) {
                            VI.MeasureVAverage (dp_pins[row][i], single_measurement, SimulatedPerPinMeasurements[i]);
                            PerPinMeasurements += single_measurement;
                        }
                    }
                    else
                        VI.MeasureVAverage (dp_pins[row], PerPinMeasurements, SimulatedPerPinMeasurements);
                }
                if (force_type == ForceITestR) {
                    for (int index = 0; index < num_dp_pins; ++index) {
                        all_pin_meas_float.SetValue(index, PerPinMeasurements[index] / force_value[row]);
                    }
                }
                else {
                    for (int index = 0; index < num_dp_pins; ++index) {
                        all_pin_meas_float.SetValue(index, PerPinMeasurements[index]);
                    }
                }
            }
            if (!RunTime.ConnectedToTester()) all_pin_meas_float.Resize (num_dp_pins, 1.0);
            for (int index = 0; index < num_dp_pins; ++index) {
                row_results[row].SetValue(dp_placement_ary[row][index], all_pin_meas_float[index]);
            }
        }
    }
}

void TI_DC::SetSelectConnectDC (IntS row) {
    if ((fi_mode[row] || fv_mode[row]) && ps_pins[row].GetNumPins() > 0) {
        if (sense_connect[row] == Local) {
             VI.Connect (ps_pins[row], VI_TO_DUT, VI_MODE_LOCAL);
        }
        else if (sense_connect[row] == Remote) {
            VI.Connect (ps_pins[row], VI_TO_DUT, VI_MODE_REMOTE);
        }
        if (fv_mode[row]) {
            if (2. * max_current[row] < 4.2mA) {
 //               VI.Force (ps_pins[row], VI_FORCE_V, force_value[row], max_voltage[row], max_current[row], 2.1mA, -2.2mA, VI_FORCE_ENABLE);
                VI.Force (ps_pins[row], VI_FORCE_V, force_value[row], max_voltage[row], max_current[row], 2.1mA, 0mA, VI_FORCE_ENABLE);
            }
            else {
                VI.Force (ps_pins[row], VI_FORCE_V, force_value[row], max_voltage[row], max_current[row], max_current[row], -max_current[row], VI_FORCE_ENABLE);
            }
            /* There is a bug here somewhere. */
            if (sense_connect[row] == Local) {
                SystemUsageTracker ("LOCAL", ps_pins[row], row);
            }
            else if (sense_connect[row] == Remote) {
                SystemUsageTracker ("REMOTE", ps_pins[row], row);
            }
            else {
                SystemUsageTracker ("PREVIOUS", ps_pins[row], row);
            }
             VI.Gate (ps_pins[row], VI_GATE_ON);
        }
        else if (fi_mode[row]) {
            if (2. * max_voltage[row] < 0.65) {
                VI.Force (ps_pins[row], VI_FORCE_I, force_value[row], max_current[row], max_voltage[row], +0.325V, -0.325V, VI_FORCE_ENABLE);
            }
            else {
                VI.Force (ps_pins[row], VI_FORCE_I, force_value[row], max_current[row], max_voltage[row], max_voltage[row], min_voltage[row], VI_FORCE_ENABLE);
            }
            if (sense_connect[row] == Local) {
                SystemUsageTracker ("LOCAL", ps_pins[row], row);
            }
            else if (sense_connect[row] == Remote) {
                SystemUsageTracker ("REMOTE", ps_pins[row], row);
            }
            else {
                SystemUsageTracker ("PREVIOUS", ps_pins[row], row);
            }
            VI.Gate (ps_pins[row], VI_GATE_ON);
        }
    }
    if (qfvi_pins[row].GetNumPins() > 0) {
        if (fv_mode[row]) {
            if (max_voltage[row] <= 25V) {
                //Regex_Escape:set qfvi qfvi_pins[row] vrange to max_voltage[row] vclamps to vmax max_voltage[row] vmin -max_voltage[row];
            } else if (force_value[row] < 0V) {
                //Regex_Escape:set qfvi qfvi_pins[row] vrange to max_voltage[row] vclamps to vmax 1V vmin -MATH.Abs(max_voltage[row]);
            }
            else if (force_value[row] > 0V) {
                //Regex_Escape:set qfvi qfvi_pins[row] vrange to max_voltage[row] vclamps to vmax max_voltage[row] vmin -1V;
            }
            else {
                //Regex_Escape:set qfvi qfvi_pins[row] vrange to max_voltage[row] vclamps to vmax max_voltage[row] vmin -max_voltage[row];
            }
            //Regex_Escape:set qfvi qfvi_pins[row] irange to max_current[row] iclamps to imax max_current[row] imin -max_current[row];
            //Regex_Escape:set qfvi qfvi_pins[row] bandwidth to 56000.0;
            //Regex_Escape:set qfvi qfvi_pins[row] to fv force_value[row] max max_voltage[row];
            if (msr_i[row])  {
               //Regex_Escape:set qfvi qfvi_pins[row] to measure i;
            }
            if (sense_connect[row] == Local) {
                SystemUsageTracker ("LOCAL", qfvi_pins[row], row);
            }
            else if (sense_connect[row] == Remote) {
                SystemUsageTracker ("REMOTE", qfvi_pins[row], row);
            }
            else {
                SystemUsageTracker ("PREVIOUS", qfvi_pins[row], row);
            }
            if (sense_connect[row] == Local) {
                //Regex_Escape:connect qfvi qfvi_pins[row] //local;
            }
            else if (sense_connect[row] == Remote) {
                //Regex_Escape:connect qfvi qfvi_pins[row] remote;
            }
            if (sense_connect[row] != Previous) {
                //Regex_Escape:gate qfvi qfvi_pins[row] on;
            }
        }
        else if (fi_mode[row]) {
            //Regex_Escape:set qfvi qfvi_pins[row] vrange to max_voltage[row] vclamps to vmax max_voltage[row] vmin -max_voltage[row];
            //Regex_Escape:set qfvi qfvi_pins[row] irange to max_current[row] iclamps to imax max_current[row] imin -max_current[row];
            //Regex_Escape:set qfvi qfvi_pins[row] bandwidth to 56000.0;
            //Regex_Escape:set qfvi qfvi_pins[row] to fi force_value[row] max max_current[row];
            //Regex_Escape:set qfvi qfvi_pins[row] vrange to max_voltage[row] vclamps to vmax max_voltage[row] vmin -max_voltage[row];
            if (sense_connect[row] == Local) {
                SystemUsageTracker ("LOCAL", qfvi_pins[row], row);
            }
            else if (sense_connect[row] == Remote) {
                SystemUsageTracker ("REMOTE", qfvi_pins[row], row);
            }
            else {
                SystemUsageTracker ("PREVIOUS", qfvi_pins[row], row);
            }
            if (sense_connect[row] == Local) {
                //Regex_Escape:connect qfvi qfvi_pins[row] //local;
            } else if (sense_connect[row] == Remote) {
                //Regex_Escape:connect qfvi qfvi_pins[row] remote;
            }
            if (sense_connect != Previous) {
                //Regex_Escape:gate qfvi qfvi_pins[row] on;
            }
        }
        if (msr_i[row])  {
            //Regex_Escape:set qfvi qfvi_pins[row] to measure i measure filter on;
            //Regex_Escape:set qfvi qfvi_pins[row] irange to max_current[row] iclamps to imax max_current[row] imin -(max_current[row]);
        }
        else if (msr_v[row]) {
            //Regex_Escape:set qfvi qfvi_pins[row] to measure v max max_voltage[row] measure filter on;
        }
    }
    if (preset_pins_low.GetNumPins() > 0) {
        VI.Disconnect (preset_pins_low); 
        DIGITAL.Connect (preset_pins_low, DIGITAL_DCL_TO_DUT);
        DIGITAL.SetDriveMode (preset_pins_low, DIGITAL_DRV_MODE_LOW);
    }
    if (preset_pins_high.GetNumPins() > 0) {
        VI.Disconnect (preset_pins_high); 
        DIGITAL.Connect (preset_pins_high, DIGITAL_DCL_TO_DUT);
        DIGITAL.SetDriveMode (preset_pins_high, DIGITAL_DRV_MODE_HIGH);
    }
    if ((fi_mode[row] or fv_mode[row]) and dp_pins[row].GetNumPins() > 0) {
        DIGITAL.SetDriveMode (dp_pins[row], DIGITAL_DRV_MODE_OFF);
        if (open_dcls[row]) {
            DIGITAL.Disconnect (dp_pins[row], DIGITAL_DCL_TO_DUT);
        }
        if (fv_mode[row]) {
            if (force_value[row] <= -2V or force_value[row] >= 7V or MATH.Abs (max_current[row]) > 25.0mA) {
                use_cpmu[row] = true;
                CPMU.Connect (dp_pins[row]);
                CPMU.ForceV (dp_pins[row], force_value[row]);
                SystemUsageTracker ("cpmu", dp_pins[row], row);
            }
            else {
                use_ppmu[row] = true;
                VI.Connect (dp_pins[row], VI_TO_DUT, VI_MODE_LOCAL);
                VI.Force (dp_pins[row], VI_FORCE_V, force_value[row], max_voltage[row], max_current[row], max_current[row], -max_current[row], VI_FORCE_ENABLE);
                SystemUsageTracker ("ppmu", dp_pins[row], row);
            }
        }
        else if (fi_mode[row]) {
            if (MATH.Abs (max_current[row]) > 25.0mA or min_voltage[row] < -2V or max_voltage[row] > 7V) {
                use_cpmu[row] = true;
                CPMU.Connect (dp_pins[row]);
                CPMU.ForceI (dp_pins[row], force_value[row]);
                SystemUsageTracker ("cpmu", dp_pins[row], row);
            }
            else {
                use_ppmu[row] = true;
                VI.Connect (dp_pins[row], VI_TO_DUT, VI_MODE_LOCAL);
                if (max_voltage[row] > 2V){
                    VI.Force (dp_pins[row], VI_FORCE_I, force_value[row], max_current[row], max_voltage[row], max_voltage[row], -2V, VI_FORCE_ENABLE);
                }
                else {
                    VI.Force (dp_pins[row], VI_FORCE_I, force_value[row], max_current[row], max_voltage[row], max_voltage[row], -max_voltage[row], VI_FORCE_ENABLE);
                }
                SystemUsageTracker ("ppmu", dp_pins[row], row);
            }
        }
    }
}

BoolM TI_DC::Initialize()
{
    BoolM init_status(true);
    int connection_row;
    int connection_column;
    connection_table1 = "";
    connection_table2 = "";
    connection_list.Resize (MAX_CONNECTIONS);
    connection_counter = 1;
    
    connection_table1[0] = "PinType";
    connection_table2[0] = "ResourcePathConnection";
    
    //cout << connection_table1[0] << endl;
    //cout << connection_table1[1] << endl;
    
    return init_status;
}

StringS TI_DC::TI_DC_GetPinInstrument(PinM pin) {
    StringS channel_name = pin.GetChannelName(ActiveSites.Begin().GetValue());
    
    if (channel_name[0] >= '0' && channel_name[0] <= '9') return ("DP");
    else if (!strncmp ("OVI", channel_name, 3)) return ("OVI");
    else if (!strncmp ("HDVI", channel_name, 4)) return ("HDVI");
    else if (!strncmp ("HCOVI", channel_name, 5)) return ("HCOVI");
    else if (!strncmp ("VI16B", channel_name, 5)) return ("VI16B");
    else if (!strncmp ("VI16", channel_name, 4)) return ("VI16");
    else if (!strncmp ("QFVI", channel_name, 4)) return ("QFVI");
    else if (!strncmp ("DPS16_", channel_name, 6)) return ("DPS16");
    else if (!strncmp ("VIS16_", channel_name, 6)) return ("VIS16");

    return ("");
}

BoolS TI_DC::CommonSetup (IntS row) {
    IntS number_of_rows, i;
    StringS inst_used, LowerCaseTesterType;
    StringS part_number;
    StringS1D measure_type_check (5);
    BoolS1D loc_test_pin_set;	//was a set! Needs to be initialized to false!
    PinML row_pins;

    if (force_type == DC_None) {
        fv_mode[row] = false;
        fi_mode[row] = false;
        msr_i[row] = false;
        msr_v[row] = false;
        return true;
    }
    number_of_rows = row_enable.GetSize();
    if (force_pins[row].GetNumPins() > 0) {
        inst_used = TI_DC_GetPinInstrument (force_pins[row][0]);
    }
    fi_mode[row] = false;
    fv_mode[row] = false;
    msr_i[row] = false;
    msr_v[row] = false;
    if (force_type == ForceI || force_type == ForceIMsrV
     || force_type == ForceITestV || force_type == ForceITestR
     || force_type == OSPins) {
        fi_mode[row] = true;
    }
    else if (force_type == ForceV || force_type == ForceVMsrI
          || force_type == ForceVTestI || force_type == ForceVTestR
          || force_type == ForceVMsrV || force_type == ForceVTestV) {
        fv_mode[row] = true;
    }
    if (force_type == ForceIMsrV || force_type == ForceITestR
     || force_type == ForceITestV || force_type == MsrV
     || force_type == TestV || force_type == ForceVMsrV
     || force_type == ForceVTestV || force_type == OSPins) {
        msr_v[row] = true;
    }
    else if (force_type == ForceVMsrI || force_type == ForceVTestR
          || force_type == ForceVTestI or force_type == MsrI
          || force_type == TestI) {
        msr_i[row] = true;
    }

    return true;
}

BoolM TI_DC::ParamCheck() {
    IntS         dp_index = 0;
    IntS         ps_index = 0;
    IntS         qfvi_index = 0;
    IntS         number_of_rows = row_enable.GetSize();
    IntS         suppress_lo_lim = false;
    BoolM        param_check_status = true;
    PinML        empty_pinlist;
    StringS      error_message;
    PintypeTypeS DIGITAL_PINS(PINTYPE_DIGITAL_PIN);
    PintypeTypeS POWER_PINS(PINTYPE_POWER_PIN);
    PintypeTypeS VI_PINS(PINTYPE_VI_PIN);
    PintypeTypeS RESOURCE_PINS(PINTYPE_RESOURCE_PIN);

    dp_pins.Resize (number_of_rows);
    ps_pins.Resize (number_of_rows);
    qfvi_pins.Resize (number_of_rows);
    dp_placement_ary.Resize (number_of_rows, UTL_VOID);
    ps_placement_ary.Resize (number_of_rows, UTL_VOID);
    qfvi_placement_ary.Resize (number_of_rows, UTL_VOID);
    msr_i.Resize(number_of_rows, false);
    msr_v.Resize(number_of_rows, false);
    fi_mode.Resize(number_of_rows, false);
    fv_mode.Resize(number_of_rows, false);
    use_cpmu.Resize(number_of_rows, false);
    use_ppmu.Resize(number_of_rows, false);
    row_results.Resize(number_of_rows, UTL_VOID);

    if(number_of_rows > number_of_rows){
        error_message = "Error : Method only supports a maximum of 32 rows";
        ERR.ReportError(ERR_PARAMETER_OUT_OF_RANGE, error_message, UTL_VOID, NO_SITES, UTL_VOID);
        param_check_status = false;
    }   
    
    for (IntS row=0; row != number_of_rows; row++) {       
        if (!row_enable[row]){ //if row_enable is FALSE, jump to the next one.
            continue;
        }
        common_setup_done = CommonSetup(row);
        if (force_pins[row].GetNumPins() <= 0) {
            error_message = "force_pins[row] is not specified or is empty. This field is required.";
            ERR.ReportError(ERR_INVALID_PIN, error_message, UTL_VOID, NO_SITES, force_pins[row]);
            param_check_status = false;
        }
        if (!force_value[row].Valid() && (fv_mode[row] || fi_mode[row])) {
            error_message = "A valid force_value is required.";
            ERR.ReportError(ERR_INVALID_PARAMETER, error_message, UTL_VOID, NO_SITES, UTL_VOID);
            param_check_status = false;
        }    
        if (TestedType()){
            if (force_type == OSPins) { 
                if (number_of_rows != shorts_limits.GetSize()) {
                    error_message = "There must be a limit row for each force row.";
                    ERR.ReportError(ERR_PARAMETER_OUT_OF_RANGE, error_message, UTL_VOID, NO_SITES, UTL_VOID);
                    param_check_status = false;                       
                }
                else {
                    if (number_of_rows != opens_limits.GetSize()) {
                        error_message = "There must be a limit row for each force row.";
                        ERR.ReportError(ERR_PARAMETER_OUT_OF_RANGE, error_message, UTL_VOID, NO_SITES, UTL_VOID);            
                        param_check_status = false;                       
                    }
                }
            }
            else {
                if (number_of_rows != test_limits.GetSize()) {
                    error_message = "There must be a limit row for each force row.";
                    ERR.ReportError(ERR_PARAMETER_OUT_OF_RANGE, error_message, UTL_VOID, NO_SITES, UTL_VOID);
                    param_check_status = false;                       
                }  
                else if (test_pins[row].GetNumPins() != force_pins[row].GetNumPins() and force_type != OSPins) {
                    error_message = "force_pins and test_limits.test_pins must match (1st TEST = 1st test_limits row)";
                    ERR.ReportError(ERR_PARAMETER_OUT_OF_RANGE, error_message, UTL_VOID, NO_SITES, UTL_VOID);            
                    param_check_status = false;                                            
                }
            }
        }

        dp_index = 0;
        ps_index = 0;
        qfvi_index = 0;
        dp_pins[row] = empty_pinlist;
        ps_pins[row] = empty_pinlist;
        qfvi_pins[row] = empty_pinlist;

        IntS ForcePinsCount = force_pins[row].GetNumPins();
        dp_placement_ary[row].Resize (ForcePinsCount);
        ps_placement_ary[row].Resize (ForcePinsCount);
        qfvi_placement_ary[row].Resize (ForcePinsCount);

        for (int i = 0; i < ForcePinsCount; i++) {
            PinType this_pins_type = FindObject(force_pins[row][i].GetPinType()); 
            PintypeTypeS ForcePinType = this_pins_type.GetBasicType();
            if (ForcePinType == PINTYPE_DIGITAL_PIN) {
                dp_pins[row] += force_pins[row][i]; 
                dp_placement_ary[row][dp_index] = i;
                dp_index++;
            }
            //else if (inst_used == "QFVI") {
            else if (ForcePinType == PINTYPE_RESOURCE_PIN) {
                qfvi_pins[row] += force_pins[row][i]; 
                qfvi_placement_ary[row][qfvi_index] = i;
                qfvi_index++;
            }
            else {
                ps_pins[row] += force_pins[row][i];
                ps_placement_ary[row][ps_index] = i;
                ps_index++;
            }
        }
        /* Look Here for a bug test_pins is only defined in tested type.
        you have to ignore this is you are not testing anything.*/
        IntS number_of_test_pins = force_pins[row].GetNumPins();
        row_results[row].Resize (number_of_test_pins, 0.0);
    }

    return param_check_status;
}

TI_DC *TI_DC::ParamPtr;

TMResultM TI_DC::Callback()
{
    FloatM1D per_pin_measurements;

    // callback coding
    //  ParamPtr->

    TMResultM local_result = TM_NOTEST;

    return local_result;
}

TI_DC::TI_DC()
{
    StringS text_field;

    AddInputParameter(debug, "debug", "FALSE");
    SetParameterAttribute("debug","parameter-group","Base Settings" );    
    
    AddInputParameter(force_type, "force_type", "DcType:DC_None");
    SetParameterAttribute("force_type","parameter-group","Base Settings" );    
    SetParameterAttribute("force_type", "tooltip", "Setup DC use model");
    text_field = "DcType:None          -- no dc functions, this block is only used for setup (cbits, removing previous connections)<br>";
    text_field += "DcType:ForceV        -- force voltage on pin(s)<br>";
    text_field += "DcType:ForceI        -- force current on pin(s)<br>";
    text_field += "DcType:MsrV          -- measure voltage on pin(s) previously setup to force current<br> ";
    text_field += "DcType:MsrI          -- measure current on pin(s) previously setup to force voltage<br>";
    text_field += "DcType:TestV         -- measure and test voltage on pin(s) previously set to force current<br>";
    text_field += "DcType:TestI         -- measure and test current on pin(s) previously set to force voltage<br>";
    text_field += "DcType:ForceVMsrI    -- force voltage and measure current<br>";
    text_field += "DcType:ForceVMsrI    -- force voltage and measure current<br>";
    text_field += "DcType:ForceVTestI   -- force voltage, measure and test current<br>";
    text_field += "DcType:ForceITestV   -- force current, measure and test voltage<br>";
    text_field += "DcType:ForceVTestR   -- force voltage, measure current, calculate and test resistance<br>";
    text_field += "DcType:ForceITestR   -- force current, measure voltage, calculate and test resistance<br>";
    text_field += "DcType:OSPins        -- force current, test voltage, use opens and shorts limits to fit TI format<br>";
    SetParameterAttribute("force_type", "description", text_field);

    AddInputParameter(row_enable,"row_enable", "TRUE");
    SetParameterAttribute("row_enable","parameter-group","Rows" );
    
    AddInputParameter(LevelsSetup, "LevelsSetup");
    SetParameterAttribute("LevelsSetup","parameter-group","Base Settings" );       
    text_field = "Optional Levels object executed prior to performing the test";
    SetParameterAttribute("LevelsSetup", "tooltip", text_field);
    SetParameterAttribute("LevelsSetup", "display-if", "..setup_pattern != ExecPattern:EP_None");                    
    text_field = "LevelsObject - An optional Levels object to be executed prior to performing ";
    text_field += "the test.<br>";
    text_field += "If ExecuteSitesSerially is enabled, the Levels object will be executed ";
    text_field += "for each site prior to the test.";
    SetParameterAttribute("LevelsSetup", "description", text_field);
   
    AddInputParameter(force_pins, "force_pins");
    SetParameterAttribute("force_pins","parameter-group","Rows" );    
    SetParameterAttribute("force_pins", "display-if", "..force_type != DcType:DC_None");    
    SetParameterAttribute("force_pins", "tooltip", "Pin expression listing pins to be tested");
    text_field = "force_pins[row] - A required pin expression that contains the list of pins ";
    text_field += "to be measured or tested by this test method.<br>";
    text_field += "The only allowed pin types are ";
    text_field += "DIGITAL_PINS, DSP_PINS and VI_PINS. ";
    text_field += "All pins must be of the same type.";
    SetParameterAttribute("force_pins", "description", text_field);
    
    AddInputParameter(test_per_pin, "test_per_pin", "FALSE");
    SetParameterAttribute("test_per_pin","parameter-group","Rows" );    
    SetParameterAttribute("test_per_pin", "display-if", "..force_type != DcType:DC_None");    
    SetParameterAttribute("test_per_pin", "tooltip", "Boolean expression for testing per pin");
    text_field = "test_per_pin[row] - A boolean expression which defines whether to test by pin or not.";
    SetParameterAttribute("test_per_pin", "description", text_field);

    AddInputParameter(sense_connect, "sense_connect", "SenseConnect:Local");
    SetParameterAttribute("sense_connect","parameter-group","Rows" );    
    SetParameterAttribute("sense_connect", "display-if", "..force_type != DcType:DC_None");
    SetParameterAttribute("sense_connect", "tooltip", "How to hook up sense lines.");
    text_field = "SenseConnect:Local         -- connect sense lines locally<br>";
    text_field += "SenseConnect:Remote        -- connect sense lines to dut board<br>";
    text_field += "SenseConnect:Previous      -- instrument already connected, use however it is already connected<br>";
    SetParameterAttribute("sense_connect", "description", text_field);
  
    AddInputParameter(cbit_type, "cbit_type", "CbitType:NO_CBIT");
    SetParameterAttribute("cbit_type","parameter-group","Base Settings" );       
    SetParameterAttribute("cbit_type", "tooltip", "This tells the routine what type of cbits you are using on the board.");
    text_field = "CbitType:None        -- no cbit control needed for this block<br>";
    text_field += "CbitType:Tester      -- OVI, HCOVI, or TMBD cbits are being used<br>";
    text_field += "CbitType:Cboc        -- CBOC Cbits are being used<br>";
    text_field += "CbitType:User        -- non-CBOC on-DIB Cbits are being used<br>";
    text_field += "CbitType:Ecbit        -- Ecbit module Cbits are being used<br>";
    SetParameterAttribute("cbit_type", "description", text_field);
    
    AddInputParameter(set_cbit_list, "set_cbit_list");
    SetParameterAttribute("set_cbit_list","parameter-group","Rows" );        
    SetParameterAttribute("set_cbit_list", "display-if", "..cbit_type != CbitType:NO_CBIT");    
    SetParameterAttribute("set_cbit_list", "tooltip", "CBITS to close prior to measurement.  All other cbits will be opened.");
    text_field = "This means an empty pin list will open all relays on the board!<br> ";
    text_field += "The method will wait relay_delay time after all CBITs switching to allow for relay settling.<br>";
    SetParameterAttribute("set_cbit_list", "description", text_field);

    AddInputParameter(relay_delay, "relay_delay", "0ms");
    SetParameterAttribute("relay_delay","parameter-group","Rows" );        
    SetParameterAttribute("relay_delay", "display-if", "..cbit_type != CbitType:NO_CBIT");    
    SetParameterAttribute("relay_delay", "tooltip", "This is a delay time to wait after opening and closing cbits.");
    text_field = "Note, different cbit types have different cbit switching times separate<br>";
    text_field += "from the relay switching time. This relay_delay needs to account for cbit and<br>";
    text_field += "relay switching time (see relay spec sheet)<br>";
    text_field += "<br>";
    text_field += "HCOVI CBITS, FX CBITS, CBOC CBITS, and USER CBITS all have a cbit switching time of ~50us<br>";
    text_field += "OVI CBITS have a cbit switching time of ~550us<br>";
    SetParameterAttribute("relay_delay", "description", text_field);    
    
    AddInputParameter(force_value, "force_value");
    SetParameterAttribute("force_value","parameter-group","Rows" );            
    SetParameterAttribute("force_value", "display-if", "..force_type != DcType:DC_None AND ..force_type != DcType:MsrI AND ..force_type != DcType:TestI AND ..force_type != DcType:MsrV AND ..force_type != DcType:TestV");    
    
    AddInputParameter(min_voltage, "min_voltage", "0V");
    SetParameterAttribute("min_voltage","parameter-group","Rows" );               
    SetParameterAttribute("min_voltage", "display-if", "..force_type != DcType:DC_None AND ..force_type != DcType:MsrI AND ..force_type != DcType:TestI AND ..force_type != DcType:MsrV AND ..force_type != DcType:TestV");    
    SetParameterAttribute("min_voltage", "tooltip", "Sets force or measure voltage clamps and ranges, dependent on mode.");
    text_field = "Remember that FX1 PPMU has a minimum voltage of -2V, anything below that forces use of CPMU.<br>";
    SetParameterAttribute("min_voltage", "description", text_field);    

    AddInputParameter(max_voltage, "max_voltage");
    SetParameterAttribute("max_voltage","parameter-group","Rows" );                   
    SetParameterAttribute("max_voltage", "display-if", "..force_type != DcType:DC_None AND ..force_type != DcType:MsrI AND ..force_type != DcType:TestI");       
    SetParameterAttribute("max_voltage", "tooltip", "Sets force or measure voltage clamps and ranges, dependent on mode.");
    text_field = "Rememeber that FX1 PPMU has a maximum voltage of 7V, anything above that forces use of CPMU.<br>";
    SetParameterAttribute("max_voltage", "description", text_field);    

    AddInputParameter(max_current, "max_current");
    SetParameterAttribute("max_current","parameter-group","Rows" );                      
    SetParameterAttribute("max_current", "display-if", "..force_type != DcType:DC_None AND ..force_type != DcType:MsrV AND ..force_type != DcType:TestV");       
    SetParameterAttribute("max_current", "tooltip", "Sets force or measure voltage clamps and ranges, dependent on mode.");

    AddInputParameter(settling_time, "settling_time", "0s");
    SetParameterAttribute("settling_time","parameter-group","Rows" );                      
    SetParameterAttribute("settling_time", "display-if", "..force_type != DcType:DC_None");           
    SetParameterAttribute("settling_time", "tooltip", "Sets force or measure voltage clamps and ranges, dependent on mode.");

    AddInputParameter(pattern_name, "pattern_name");
    SetParameterAttribute("pattern_name","parameter-group","Rows" );                      
    SetParameterAttribute("pattern_name", "display-if", "..setup_pattern != ExecPattern:EP_None");               
    SetParameterAttribute("pattern_name", "tooltip", "Sets force or measure voltage clamps and ranges, dependent on mode.");

    AddInputParameter(pattern_label, "pattern_label");
    SetParameterAttribute("pattern_label","parameter-group","Rows" );                      
    SetParameterAttribute("pattern_label", "display-if", "..setup_pattern != ExecPattern:EP_None");                  
    SetParameterAttribute("pattern_label", "tooltip", "Sets force or measure voltage clamps and ranges, dependent on mode.");

    AddInputParameter(setup_pattern, "setup_pattern", "ExecPattern:EP_None" );
    SetParameterAttribute("setup_pattern","parameter-group","Base Settings" );           
    SetParameterAttribute("setup_pattern", "tooltip", "Sets force or measure voltage clamps and ranges, dependent on mode.");

    AddInputParameter(continue_patterns, "continue_patterns", "FALSE");
    SetParameterAttribute("continue_patterns","parameter-group","Rows" );                      
    SetParameterAttribute("continue_patterns", "display-if", "..setup_pattern != ExecPattern:EP_None");                      
    SetParameterAttribute("continue_patterns", "tooltip", "Sets force or measure voltage clamps and ranges, dependent on mode.");

    AddInputParameter(measure_averages, "measure_averages", "1");
    SetParameterAttribute("measure_averages","parameter-group","Rows" );                      
    SetParameterAttribute("measure_averages", "display-if", "..force_type != DcType:DC_None AND ..force_type != DcType:ForceI AND ..force_type != DcType:ForceV");                          
    SetParameterAttribute("measure_averages", "tooltip", "Sets force or measure voltage clamps and ranges, dependent on mode.");

    AddInputParameter(open_dcls, "open_dcls", "TRUE");
    SetParameterAttribute("open_dcls","parameter-group","Rows" );                      
    SetParameterAttribute("open_dcls", "tooltip", "Sets force or measure voltage clamps and ranges, dependent on mode.");

    AddInputParameter(remove_connections, "remove_connections", "RemoveConnect:RC_None");
    SetParameterAttribute("remove_connections","parameter-group","Rows" );                      
    SetParameterAttribute("remove_connections", "tooltip", "Sets force or measure voltage clamps and ranges, dependent on mode.");

    AddInputParameter(preset_pins_high, "preset_pins_high");
    SetParameterAttribute("preset_pins_high","parameter-group","Base Settings" );           
    SetParameterAttribute("preset_pins_high", "tooltip", "Sets force or measure voltage clamps and ranges, dependent on mode.");

    AddInputParameter(preset_pins_low, "preset_pins_low");
    SetParameterAttribute("preset_pins_low","parameter-group","Base Settings" );           
    SetParameterAttribute("preset_pins_low", "tooltip", "Sets force or measure voltage clamps and ranges, dependent on mode.");

    AddInputParameter(use_testware, "use_testware", "TRUE");
    SetParameterAttribute("use_testware","parameter-group","Base Settings" );           
    SetParameterAttribute("use_testware", "tooltip", "Use the testware database.");

    AddInputParameter(use_testware, "do_clo", "TRUE");
    SetParameterAttribute("do_clo","parameter-group","Base Settings" );           
    SetParameterAttribute("do_clo", "tooltip", "Perform CLO on this block, if CLO is enabled globally and currently executing.");

    AddInputParameter(testware_datatype, "testware_datatype", "TWDataType:TWMinimumData");
    SetParameterAttribute("testware_datatype","parameter-group","Rows" );           
    SetParameterAttribute("testware_datatype", "tooltip", "Testware data type.");
    SetParameterAttribute("testware_datatype", "display-if", "..use_testware");
 
    AddOutputParameter(row_results, "row_results");
    SetParameterAttribute("row_results","parameter-group","Rows" );                      
    SetParameterAttribute("row_results", "display-if", "..force_type != DcType:DC_None AND ..force_type != DcType:ForceI AND ..force_type != DcType:ForceV");
 
    AddOutputParameter(row_test_result, "row_test_result");
    SetParameterAttribute("row_test_result","parameter-group","Limits" );                      
    SetParameterAttribute("row_test_result", "display-if", "..force_type = DcType:OSPins OR ..force_type = DcType:ForceITestV OR ..force_type = DcType:ForceVTestI OR ..force_type = DcType:ForceVTestR OR ..force_type = DcType:ForceITestR OR ..force_type = DcType:TestI OR ..force_type = DcType:TestV OR ..force_type = DcType:ForceVTestV");

    AddInputParameter(test_pins, "test_pins");
    SetParameterAttribute("test_pins","parameter-group","Limits" );                      
    SetParameterAttribute("test_pins", "display-if", "..force_type = DcType:OSPins OR ..force_type = DcType:ForceITestV OR ..force_type = DcType:ForceVTestI OR ..force_type = DcType:ForceVTestR OR ..force_type = DcType:ForceITestR OR ..force_type = DcType:TestI OR ..force_type = DcType:TestV OR ..force_type = DcType:ForceVTestV");

    AddInputParameter(opens_limits, "opens_limits");
    SetParameterAttribute("opens_limits","parameter-group","Limits");                      
    SetParameterAttribute("opens_limits","restrict-type","LimitStruct");                      
    SetParameterAttribute("opens_limits", "display-if", "..force_type = DcType:OSPins");

    AddInputParameter(shorts_limits, "shorts_limits");
    SetParameterAttribute("shorts_limits","parameter-group","Limits");                      
    SetParameterAttribute("shorts_limits","restrict-type","LimitStruct");                      
    SetParameterAttribute("shorts_limits", "display-if", "..force_type = DcType:OSPins");

    AddInputParameter(test_limits, "test_limits");
    SetParameterAttribute("test_limits","parameter-group","Limits");                      
    SetParameterAttribute("test_limits","restrict-type","LimitStruct" );                      
    SetParameterAttribute("test_limits", "display-if", "..force_type = DcType:ForceITestV OR ..force_type = DcType:ForceVTestI OR ..force_type = DcType:ForceVTestR OR ..force_type = DcType:ForceITestR OR ..force_type = DcType:TestI OR ..force_type = DcType:TestV OR ..force_type = DcType:ForceVTestV");

    // register breakpoints
    AddLocalBreakpoint("AfterSetup");
    AddLocalBreakpoint("AfterTest");

    // initialize class variables
    run_time_characterization = false;

    AddGlobalBreakpoint("AfterPreset");
    AddGlobalBreakpoint("AfterTest");
}



