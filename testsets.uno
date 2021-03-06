Unison:U3.0:S5.3;
__Test Digital_Continuity {
    __Entry[0] = DCsetup_allZero;
    __Exit[0] = DCsetup_ZeroPins_ZeroSupplies_RampDown;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Conty_AllDigPins;
        __WrapCells = __True;
        __TestMethod {
            __Name = TI_DC;
            debug = __Expression { __String = "FALSE"; }
            force_type = __Expression { __String = "DcType:OSPins"; }
            cbit_type = __Expression { __String = "CbitType:NO_CBIT"; }
            setup_pattern = __Expression { __String = "ExecPattern:EP_None"; }
            use_testware = __Expression { __String = "TRUE"; }
            do_clo = __Expression { __String = "TRUE"; }
            __ArrayOfGroup {
                __ArrayOf = row_enable;
                __ArrayOf = force_pins;
                __ArrayOf = test_per_pin;
                __ArrayOf = sense_connect;
                __ArrayOf = set_cbit_list;
                __ArrayOf = relay_delay;
                __ArrayOf = force_value;
                __ArrayOf = min_voltage;
                __ArrayOf = max_voltage;
                __ArrayOf = max_current;
                __ArrayOf = settling_time;
                __ArrayOf = pattern_name;
                __ArrayOf = pattern_label;
                __ArrayOf = continue_patterns;
                __ArrayOf = measure_averages;
                __ArrayOf = open_dcls;
                __ArrayOf = remove_connections;
                __ArrayOf = testware_datatype;
                __ArrayOf = row_results;
                __Row  {
                    row_enable = __Expression { __String = "TRUE"; }
                    force_pins = __Expression { __String = "OPEN_EVEN_PINS_GND+OPEN_ODD_PINS_GND-Probe_Only_Pins"; }
                    test_per_pin = __Expression { __String = "TRUE"; }
                    sense_connect = __Expression { __String = "SenseConnect:Local"; }
                    relay_delay = __Expression { __String = "0ms"; }
                    force_value = __Expression { __String = "-1mA"; }
                    min_voltage = __Expression { __String = "-1V"; }
                    max_voltage = __Expression { __String = "1V"; }
                    max_current = __Expression { __String = "1.2mA"; }
                    settling_time = __Expression { __String = "100us"; }
                    continue_patterns = __Expression { __String = "FALSE"; }
                    measure_averages = __Expression { __String = "1"; }
                    open_dcls = __Expression { __String = "TRUE"; }
                    remove_connections = __Expression { __String = "RemoveConnect:PostTestAll"; }
                    testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
                }
            }
            __ArrayOfGroup {
                __ArrayOf = row_test_result;
                __ArrayOf = test_pins;
                __ArrayOf = opens_limits;
                __ArrayOf = shorts_limits;
                __ArrayOf = test_limits;
                __Row  {
                    test_pins = __Expression { __String = "OPEN_EVEN_PINS_GND+OPEN_ODD_PINS_GND-Probe_Only_Pins"; }
                }
            }
        }
    }
    __Block[1] = {
        __Title = Set_DigPinsLow;
        __TestMethod {
            __Name = SetDriversLow;
            pins = __Expression { __String = "OPEN_EVEN_PINS_GND+OPEN_ODD_PINS_GND"; }
        }
    }
    __Block[2] = {
        __Title = Conty_DigEvenPins;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = TI_DC;
            debug = __Expression { __String = "FALSE"; }
            force_type = __Expression { __String = "DcType:OSPins"; }
            cbit_type = __Expression { __String = "CbitType:NO_CBIT"; }
            setup_pattern = __Expression { __String = "ExecPattern:EP_None"; }
            use_testware = __Expression { __String = "TRUE"; }
            do_clo = __Expression { __String = "TRUE"; }
            __ArrayOfGroup {
                __ArrayOf = row_enable;
                __ArrayOf = force_pins;
                __ArrayOf = test_per_pin;
                __ArrayOf = sense_connect;
                __ArrayOf = set_cbit_list;
                __ArrayOf = relay_delay;
                __ArrayOf = force_value;
                __ArrayOf = min_voltage;
                __ArrayOf = max_voltage;
                __ArrayOf = max_current;
                __ArrayOf = settling_time;
                __ArrayOf = pattern_name;
                __ArrayOf = pattern_label;
                __ArrayOf = continue_patterns;
                __ArrayOf = measure_averages;
                __ArrayOf = open_dcls;
                __ArrayOf = remove_connections;
                __ArrayOf = testware_datatype;
                __ArrayOf = row_results;
                __Row  {
                    row_enable = __Expression { __String = "TRUE"; }
                    force_pins = __Expression { __String = "OPEN_EVEN_PINS_GND-Probe_Only_Pins"; }
                    test_per_pin = __Expression { __String = "TRUE"; }
                    sense_connect = __Expression { __String = "SenseConnect:Local"; }
                    relay_delay = __Expression { __String = "0ms"; }
                    force_value = __Expression { __String = "-1mA"; }
                    min_voltage = __Expression { __String = "-1V"; }
                    max_voltage = __Expression { __String = "1V"; }
                    max_current = __Expression { __String = "-1.2mA"; }
                    settling_time = __Expression { __String = "10us"; }
                    continue_patterns = __Expression { __String = "FALSE"; }
                    measure_averages = __Expression { __String = "1"; }
                    open_dcls = __Expression { __String = "TRUE"; }
                    remove_connections = __Expression { __String = "RemoveConnect:RC_None"; }
                    testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
                }
            }
            __ArrayOfGroup {
                __ArrayOf = row_test_result;
                __ArrayOf = test_pins;
                __ArrayOf = opens_limits;
                __ArrayOf = shorts_limits;
                __ArrayOf = test_limits;
                __Row  {
                    row_test_result = __Expression { __String = "TM_RESULT:TM_PASS"; __Mode = Output; }
                    test_pins = __Expression { __String = "OPEN_EVEN_PINS_GND-Probe_Only_Pins"; }
                }
            }
        }
    }
    __Block[3] = {
        __Title = Conty_DigOddPins;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = TI_DC;
            debug = __Expression { __String = "FALSE"; }
            force_type = __Expression { __String = "DcType:OSPins"; }
            cbit_type = __Expression { __String = "CbitType:NO_CBIT"; }
            setup_pattern = __Expression { __String = "ExecPattern:EP_None"; }
            use_testware = __Expression { __String = "TRUE"; }
            do_clo = __Expression { __String = "TRUE"; }
            __ArrayOfGroup {
                __ArrayOf = row_enable;
                __ArrayOf = force_pins;
                __ArrayOf = test_per_pin;
                __ArrayOf = sense_connect;
                __ArrayOf = set_cbit_list;
                __ArrayOf = relay_delay;
                __ArrayOf = force_value;
                __ArrayOf = min_voltage;
                __ArrayOf = max_voltage;
                __ArrayOf = max_current;
                __ArrayOf = settling_time;
                __ArrayOf = pattern_name;
                __ArrayOf = pattern_label;
                __ArrayOf = continue_patterns;
                __ArrayOf = measure_averages;
                __ArrayOf = open_dcls;
                __ArrayOf = remove_connections;
                __ArrayOf = testware_datatype;
                __ArrayOf = row_results;
                __Row  {
                    row_enable = __Expression { __String = "TRUE"; }
                    force_pins = __Expression { __String = "OPEN_ODD_PINS_GND-Probe_Only_Pins"; }
                    test_per_pin = __Expression { __String = "TRUE"; }
                    sense_connect = __Expression { __String = "SenseConnect:Local"; }
                    relay_delay = __Expression { __String = "0ms"; }
                    force_value = __Expression { __String = "-1mA"; }
                    min_voltage = __Expression { __String = "-1V"; }
                    max_voltage = __Expression { __String = "1V"; }
                    max_current = __Expression { __String = "-1.2mA"; }
                    settling_time = __Expression { __String = "10us"; }
                    continue_patterns = __Expression { __String = "FALSE"; }
                    measure_averages = __Expression { __String = "1"; }
                    open_dcls = __Expression { __String = "TRUE"; }
                    remove_connections = __Expression { __String = "RemoveConnect:RC_None"; }
                    testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
                }
            }
            __ArrayOfGroup {
                __ArrayOf = row_test_result;
                __ArrayOf = test_pins;
                __ArrayOf = opens_limits;
                __ArrayOf = shorts_limits;
                __ArrayOf = test_limits;
                __Row  {
                    row_test_result = __Expression { __String = "TM_RESULT:TM_PASS"; __Mode = Output; }
                    test_pins = __Expression { __String = "OPEN_ODD_PINS_GND-Probe_Only_Pins"; }
                }
            }
        }
    }
    __Block[4] = {
        __Title = Restore_DigPins;
        __TestMethod {
            __Name = RestoreDrivers;
            pins = __Expression { __String = "OPEN_EVEN_PINS_GND+OPEN_ODD_PINS_GND-Probe_Only_Pins"; }
        }
    }
}
__Test SupplyShorts {
    __Entry[0] = DCsetup_allZero;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __WrapCells = __True;
        __TestMethod {
            __Name = TI_DC;
            debug = __Expression { __String = "FALSE"; }
            force_type = __Expression { __String = "DcType:ForceVTestI"; }
            cbit_type = __Expression { __String = "CbitType:NO_CBIT"; }
            setup_pattern = __Expression { __String = "ExecPattern:EP_None"; }
            use_testware = __Expression { __String = "FALSE"; }
            do_clo = __Expression { __String = "FALSE"; }
            __ArrayOfGroup {
                __ArrayOf = row_enable;
                __ArrayOf = force_pins;
                __ArrayOf = test_per_pin;
                __ArrayOf = sense_connect;
                __ArrayOf = set_cbit_list;
                __ArrayOf = relay_delay;
                __ArrayOf = force_value;
                __ArrayOf = min_voltage;
                __ArrayOf = max_voltage;
                __ArrayOf = max_current;
                __ArrayOf = settling_time;
                __ArrayOf = pattern_name;
                __ArrayOf = pattern_label;
                __ArrayOf = continue_patterns;
                __ArrayOf = measure_averages;
                __ArrayOf = open_dcls;
                __ArrayOf = remove_connections;
                __ArrayOf = testware_datatype;
                __ArrayOf = row_results;
                __Row  {
                    row_enable = __Expression { __String = "TRUE"; }
                    force_pins = __Expression { __String = "VDD"; }
                    test_per_pin = __Expression { __String = "TRUE"; }
                    sense_connect = __Expression { __String = "SenseConnect:Remote"; }
                    relay_delay = __Expression { __String = "0ms"; }
                    force_value = __Expression { __String = "800mV"; }
                    min_voltage = __Expression { __String = "-1.5V"; }
                    max_voltage = __Expression { __String = "1.5V"; }
                    max_current = __Expression { __String = "2mA"; }
                    settling_time = __Expression { __String = "100us"; }
                    continue_patterns = __Expression { __String = "FALSE"; }
                    measure_averages = __Expression { __String = "1"; }
                    open_dcls = __Expression { __String = "TRUE"; }
                    remove_connections = __Expression { __String = "RemoveConnect:RC_None"; }
                    testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
                }
                __Row  {
                    row_enable = __Expression { __String = "TRUE"; }
                    force_pins = __Expression { __String = "VDDA"; }
                    test_per_pin = __Expression { __String = "FALSE"; }
                    sense_connect = __Expression { __String = "SenseConnect:Remote"; }
                    relay_delay = __Expression { __String = "0ms"; }
                    force_value = __Expression { __String = "800mV"; }
                    min_voltage = __Expression { __String = "-1.5V"; }
                    max_voltage = __Expression { __String = "1.5V"; }
                    max_current = __Expression { __String = "2mA"; }
                    settling_time = __Expression { __String = "100us"; }
                    continue_patterns = __Expression { __String = "FALSE"; }
                    measure_averages = __Expression { __String = "1"; }
                    open_dcls = __Expression { __String = "TRUE"; }
                    remove_connections = __Expression { __String = "RemoveConnect:RC_None"; }
                    testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
                }
                __Row  {
                    row_enable = __Expression { __String = "TRUE"; }
                    force_pins = __Expression { __String = "VDDAR"; }
                    test_per_pin = __Expression { __String = "FALSE"; }
                    sense_connect = __Expression { __String = "SenseConnect:Remote"; }
                    relay_delay = __Expression { __String = "0ms"; }
                    force_value = __Expression { __String = "800mV"; }
                    min_voltage = __Expression { __String = "-1.5V"; }
                    max_voltage = __Expression { __String = "1.5V"; }
                    max_current = __Expression { __String = "2mA"; }
                    settling_time = __Expression { __String = "100us"; }
                    continue_patterns = __Expression { __String = "FALSE"; }
                    measure_averages = __Expression { __String = "1"; }
                    open_dcls = __Expression { __String = "TRUE"; }
                    remove_connections = __Expression { __String = "RemoveConnect:RC_None"; }
                    testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
                }
                __Row  {
                    row_enable = __Expression { __String = "TRUE"; }
                    force_pins = __Expression { __String = "VDDS"; }
                    test_per_pin = __Expression { __String = "FALSE"; }
                    sense_connect = __Expression { __String = "SenseConnect:Remote"; }
                    relay_delay = __Expression { __String = "0ms"; }
                    force_value = __Expression { __String = "800mV"; }
                    min_voltage = __Expression { __String = "-1.5V"; }
                    max_voltage = __Expression { __String = "1.5V"; }
                    max_current = __Expression { __String = "2mA"; }
                    settling_time = __Expression { __String = "100us"; }
                    continue_patterns = __Expression { __String = "FALSE"; }
                    measure_averages = __Expression { __String = "1"; }
                    open_dcls = __Expression { __String = "TRUE"; }
                    remove_connections = __Expression { __String = "RemoveConnect:RC_None"; }
                    testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
                }
                __Row  {
                    row_enable = __Expression { __String = "TRUE"; }
                    force_pins = __Expression { __String = "VNWA"; }
                    test_per_pin = __Expression { __String = "FALSE"; }
                    sense_connect = __Expression { __String = "SenseConnect:Remote"; }
                    relay_delay = __Expression { __String = "0ms"; }
                    force_value = __Expression { __String = "800mV"; }
                    min_voltage = __Expression { __String = "-1.5V"; }
                    max_voltage = __Expression { __String = "1.5V"; }
                    max_current = __Expression { __String = "2mA"; }
                    settling_time = __Expression { __String = "100us"; }
                    continue_patterns = __Expression { __String = "FALSE"; }
                    measure_averages = __Expression { __String = "1"; }
                    open_dcls = __Expression { __String = "TRUE"; }
                    remove_connections = __Expression { __String = "RemoveConnect:PostTestAll"; }
                    testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
                }
            }
            __ArrayOfGroup {
                __ArrayOf = row_test_result;
                __ArrayOf = test_pins;
                __ArrayOf = opens_limits;
                __ArrayOf = shorts_limits;
                __ArrayOf = test_limits;
                __Row  {
                    row_test_result = __Expression { __String = "TM_RESULT:TM_PASS"; __Mode = Output; }
                    test_pins = __Expression { __String = "VDD"; }
                }
                __Row  {
                    row_test_result = __Expression { __String = "TM_RESULT:TM_PASS"; __Mode = Output; }
                    test_pins = __Expression { __String = "VDDA"; }
                }
                __Row  {
                    row_test_result = __Expression { __String = "TM_RESULT:TM_PASS"; __Mode = Output; }
                    test_pins = __Expression { __String = "VDDAR"; }
                }
                __Row  {
                    row_test_result = __Expression { __String = "TM_RESULT:TM_PASS"; __Mode = Output; }
                    test_pins = __Expression { __String = "VDDS"; }
                }
                __Row  {
                    row_test_result = __Expression { __String = "TM_RESULT:TM_PASS"; __Mode = Output; }
                    test_pins = __Expression { __String = "VNWA"; }
                }
            }
        }
    }
    __Block[1] = {
        __Title = Block2;
        __TestMethod {
            __Name = LTXC::Connections;
            TestPins = __Expression { __String = "ALLPINS"; }
            PinControl = __Expression { __String = "CONNECTION_ENUM:CONNECT_TO_DUT"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = Block2_1;
        __TestMethod {
            __Name = LTXC::Connections;
            TestPins = __Expression { __String = "ALLSUPPLIES+AnalogPower_Pins"; }
            PinControl = __Expression { __String = "CONNECTION_ENUM:CONNECT_TO_DUT"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
        }
    }
}
__Test ATPG_CPU_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = SCAN_SA_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = a_st_tk_1_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_1_v22_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[1] = {
        __Title = a_st_tk_2_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_2_v22_Thrd'"; }
            MinorID = __Expression { __String = "1"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[2] = {
        __Title = a_st_tk_3_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_3_v22_Thrd'"; }
            MinorID = __Expression { __String = "2"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[3] = {
        __Title = a_st_tk_4_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_4_v22_Thrd'"; }
            MinorID = __Expression { __String = "3"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[4] = {
        __Title = a_st_tk_5_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_5_v22_Thrd'"; }
            MinorID = __Expression { __String = "4"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[5] = {
        __Title = a_st_tk_6_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_6_v22_Thrd'"; }
            MinorID = __Expression { __String = "5"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[6] = {
        __Title = a_st_tk_7_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_7_v22_Thrd'"; }
            MinorID = __Expression { __String = "6"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[7] = {
        __Title = a_st_tk_8_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_8_v22_Thrd'"; }
            MinorID = __Expression { __String = "7"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[8] = {
        __Title = a_st_tk_9_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_9_v22_Thrd'"; }
            MinorID = __Expression { __String = "8"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[9] = {
        __Title = a_st_tk_10_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_10_v22_Thrd'"; }
            MinorID = __Expression { __String = "9"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[10] = {
        __Title = a_st_tk_11_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_11_v22_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[11] = {
        __Title = a_st_tk_12_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_12_v22_Thrd'"; }
            MinorID = __Expression { __String = "11"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[12] = {
        __Title = a_st_tk_13_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_13_v22_Thrd'"; }
            MinorID = __Expression { __String = "12"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[13] = {
        __Title = a_st_tk_14_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_14_v22_Thrd'"; }
            MinorID = __Expression { __String = "13"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[14] = {
        __Title = a_st_tk_15_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_10_v22_Thrd'"; }
            MinorID = __Expression { __String = "14"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[15] = {
        __Title = a_st_tk_16_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_16_v22_Thrd'"; }
            MinorID = __Expression { __String = "15"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[16] = {
        __Title = a_st_tk_17_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_17_v22_Thrd'"; }
            MinorID = __Expression { __String = "16"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[17] = {
        __Title = a_st_tk_18_v22_2_4;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_18_v22_Thrd'"; }
            MinorID = __Expression { __String = "17"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[18] = {
        __Title = a_st_tk_19_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_19_v22_Thrd'"; }
            MinorID = __Expression { __String = "18"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[19] = {
        __Title = a_st_tk_20_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_20_v22_Thrd'"; }
            MinorID = __Expression { __String = "19"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[20] = {
        __Title = a_st_tk_fles_1_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_fles_1_v22_Thrd'"; }
            MinorID = __Expression { __String = "19"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[21] = {
        __Title = a_st_tk_fles_2_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_fles_2_v22_Thrd'"; }
            MinorID = __Expression { __String = "19"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test ATPG_CPU_Vmin {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = SCAN_SA_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = a_st_tk_1_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_1_v22_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[1] = {
        __Title = a_st_tk_2_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_2_v22_Thrd'"; }
            MinorID = __Expression { __String = "1"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[2] = {
        __Title = a_st_tk_3_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_3_v22_Thrd'"; }
            MinorID = __Expression { __String = "2"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[3] = {
        __Title = a_st_tk_4_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_4_v22_Thrd'"; }
            MinorID = __Expression { __String = "3"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[4] = {
        __Title = a_st_tk_5_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_5_v22_Thrd'"; }
            MinorID = __Expression { __String = "4"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[5] = {
        __Title = a_st_tk_6_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_6_v22_Thrd'"; }
            MinorID = __Expression { __String = "5"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[6] = {
        __Title = a_st_tk_7_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_7_v22_Thrd'"; }
            MinorID = __Expression { __String = "6"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[7] = {
        __Title = a_st_tk_8_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_8_v22_Thrd'"; }
            MinorID = __Expression { __String = "7"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[8] = {
        __Title = a_st_tk_9_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_9_v22_Thrd'"; }
            MinorID = __Expression { __String = "8"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[9] = {
        __Title = a_st_tk_10_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_10_v22_Thrd'"; }
            MinorID = __Expression { __String = "9"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[10] = {
        __Title = a_st_tk_11_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_11_v22_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[11] = {
        __Title = a_st_tk_12_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_12_v22_Thrd'"; }
            MinorID = __Expression { __String = "11"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[12] = {
        __Title = a_st_tk_13_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_13_v22_Thrd'"; }
            MinorID = __Expression { __String = "12"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[13] = {
        __Title = a_st_tk_14_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_14_v22_Thrd'"; }
            MinorID = __Expression { __String = "13"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[14] = {
        __Title = a_st_tk_15_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_10_v22_Thrd'"; }
            MinorID = __Expression { __String = "14"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[15] = {
        __Title = a_st_tk_16_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_16_v22_Thrd'"; }
            MinorID = __Expression { __String = "15"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[16] = {
        __Title = a_st_tk_17_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_17_v22_Thrd'"; }
            MinorID = __Expression { __String = "16"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[17] = {
        __Title = a_st_tk_18_v22_2_4;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_18_v22_Thrd'"; }
            MinorID = __Expression { __String = "17"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[18] = {
        __Title = a_st_tk_19_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_19_v22_Thrd'"; }
            MinorID = __Expression { __String = "18"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[19] = {
        __Title = a_st_tk_20_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_20_v22_Thrd'"; }
            MinorID = __Expression { __String = "19"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[20] = {
        __Title = a_st_tk_fles_1_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_fles_1_v22_Thrd'"; }
            MinorID = __Expression { __String = "19"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[21] = {
        __Title = a_st_tk_fles_2_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_fles_2_v22_Thrd'"; }
            MinorID = __Expression { __String = "19"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}

__Test ATPG_CPU_VboxHi {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVboxhi;
    __Entry[1] = DCsetup_LooseVboxHi;
    __Entry[2] = SCAN_SA_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = a_st_tk_1_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_1_v22_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[1] = {
        __Title = a_st_tk_2_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_2_v22_Thrd'"; }
            MinorID = __Expression { __String = "1"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[2] = {
        __Title = a_st_tk_3_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_3_v22_Thrd'"; }
            MinorID = __Expression { __String = "2"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[3] = {
        __Title = a_st_tk_4_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_4_v22_Thrd'"; }
            MinorID = __Expression { __String = "3"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[4] = {
        __Title = a_st_tk_5_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_5_v22_Thrd'"; }
            MinorID = __Expression { __String = "4"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[5] = {
        __Title = a_st_tk_6_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_6_v22_Thrd'"; }
            MinorID = __Expression { __String = "5"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[6] = {
        __Title = a_st_tk_7_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_7_v22_Thrd'"; }
            MinorID = __Expression { __String = "6"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[7] = {
        __Title = a_st_tk_8_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_8_v22_Thrd'"; }
            MinorID = __Expression { __String = "7"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[8] = {
        __Title = a_st_tk_9_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_9_v22_Thrd'"; }
            MinorID = __Expression { __String = "8"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[9] = {
        __Title = a_st_tk_10_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_10_v22_Thrd'"; }
            MinorID = __Expression { __String = "9"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[10] = {
        __Title = a_st_tk_11_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_11_v22_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[11] = {
        __Title = a_st_tk_12_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_12_v22_Thrd'"; }
            MinorID = __Expression { __String = "11"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[12] = {
        __Title = a_st_tk_13_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_13_v22_Thrd'"; }
            MinorID = __Expression { __String = "12"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[13] = {
        __Title = a_st_tk_14_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_14_v22_Thrd'"; }
            MinorID = __Expression { __String = "13"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[14] = {
        __Title = a_st_tk_15_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_10_v22_Thrd'"; }
            MinorID = __Expression { __String = "14"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[15] = {
        __Title = a_st_tk_16_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_16_v22_Thrd'"; }
            MinorID = __Expression { __String = "15"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[16] = {
        __Title = a_st_tk_17_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_17_v22_Thrd'"; }
            MinorID = __Expression { __String = "16"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[17] = {
        __Title = a_st_tk_18_v22_2_4;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_18_v22_Thrd'"; }
            MinorID = __Expression { __String = "17"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[18] = {
        __Title = a_st_tk_19_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_19_v22_Thrd'"; }
            MinorID = __Expression { __String = "18"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[19] = {
        __Title = a_st_tk_20_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_20_v22_Thrd'"; }
            MinorID = __Expression { __String = "19"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[20] = {
        __Title = a_st_tk_fles_1_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_fles_1_v22_Thrd'"; }
            MinorID = __Expression { __String = "19"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[21] = {
        __Title = a_st_tk_fles_2_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_fles_2_v22_Thrd'"; }
            MinorID = __Expression { __String = "19"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}

__Test SCAN_PATHDELAY_16_PG_Vmin {
    __Entry[0] = SCAN_PATHDELAY_16_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_16_PG_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test SCAN_PATHDELAY_16_PG {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerDownWORead_PowerUpAtVmin;
    __Entry[1] = DCsetup_LooseVmin;
    __Entry[2] = SCAN_PATHDELAY_16_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = SPD_16_2;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_16_2_PG_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[1] = {
        __Title = SPD_16_3;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_16_3_PG_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test SCAN_PATHDELAY_1_PG {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVmin;
    __Entry[1] = DCsetup_LooseVmin;
    __Entry[2] = SCAN_PATHDELAY_1_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = a_tft_tk_80_80_1;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_1_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[1] = {
        __Title = a_tft_tk_80_80_2;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_2_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[2] = {
        __Title = a_tft_tk_80_80_3;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_3_Thrd'"; }
            MinorID = __Expression { __String = "20"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[3] = {
        __Title = a_tft_tk_80_80_4;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_4_Thrd'"; }
            MinorID = __Expression { __String = "30"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[4] = {
        __Title = a_tft_tk_80_80_5;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_5_Thrd'"; }
            MinorID = __Expression { __String = "40"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[5] = {
        __Title = a_tft_tk_80_80_6;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_6_Thrd'"; }
            MinorID = __Expression { __String = "50"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[6] = {
        __Title = a_tft_tk_80_80_7;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_7_Thrd'"; }
            MinorID = __Expression { __String = "60"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[7] = {
        __Title = a_tft_tk_80_80_8;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_8_Thrd'"; }
            MinorID = __Expression { __String = "70"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[8] = {
        __Title = a_tft_tk_80_80_9;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_9_Thrd'"; }
            MinorID = __Expression { __String = "80"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[9] = {
        __Title = a_tft_tk_80_80_10;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_10_Thrd'"; }
            MinorID = __Expression { __String = "90"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[10] = {
        __Title = a_tft_tk_80_80_11;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_11_Thrd'"; }
            MinorID = __Expression { __String = "100"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[11] = {
        __Title = a_tft_tk_80_80_12;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_12_Thrd'"; }
            MinorID = __Expression { __String = "110"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[12] = {
        __Title = a_tft_tk_80_80_13;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_13_Thrd'"; }
            MinorID = __Expression { __String = "120"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[13] = {
        __Title = a_tft_tk_80_80_14;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_14_Thrd'"; }
            MinorID = __Expression { __String = "130"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[14] = {
        __Title = a_tft_tk_80_80_15;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_15_Thrd'"; }
            MinorID = __Expression { __String = "140"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[15] = {
        __Title = a_tft_tk_80_80_16;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_16_Thrd'"; }
            MinorID = __Expression { __String = "150"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[16] = {
        __Title = a_tft_tk_80_80_17;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_17_Thrd'"; }
            MinorID = __Expression { __String = "160"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[17] = {
        __Title = a_tft_tk_80_80_18;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_18_Thrd'"; }
            MinorID = __Expression { __String = "170"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[18] = {
        __Title = a_tft_tk_80_80_19;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_19_Thrd'"; }
            MinorID = __Expression { __String = "180"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[19] = {
        __Title = a_tft_tk_80_80_20;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_20_Thrd'"; }
            MinorID = __Expression { __String = "190"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[20] = {
        __Title = a_tft_tk_80_80_21;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_21_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[21] = {
        __Title = a_tft_tk_80_80_21_1;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_21_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[22] = {
        __Title = a_tft_tk_80_80_22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_22_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[23] = {
        __Title = a_tft_tk_80_80_23;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_23_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[24] = {
        __Title = a_tft_tk_80_80_24;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_24_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[25] = {
        __Title = a_tft_tk_80_80_25;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_25_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[26] = {
        __Title = a_tft_tk_80_80_26;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_26_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[27] = {
        __Title = a_tft_tk_80_80_27;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_27_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[28] = {
        __Title = a_tft_tk_80_80_28;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_28_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[29] = {
        __Title = a_tft_tk_80_80_29;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_29_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[30] = {
        __Title = a_tft_tk_80_80_30;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_30_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[31] = {
        __Title = a_tft_tk_80_80_31;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_31_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[32] = {
        __Title = a_tft_tk_80_80_32;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_32_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[33] = {
        __Title = a_tft_tk_80_80_33;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_33_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[34] = {
        __Title = a_tft_tk_80_80_34;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_34_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[35] = {
        __Title = a_tft_tk_80_80_35_7;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_35_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[36] = {
        __Title = a_tft_tk_80_80_36_6;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_36_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[37] = {
        __Title = a_tft_tk_80_80_37_5;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_37_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[38] = {
        __Title = a_tft_tk_80_80_38_4;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_38_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[39] = {
        __Title = a_tft_tk_80_80_39_3;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_39_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[40] = {
        __Title = a_tft_tk_80_80_40;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_40_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[41] = {
        __Title = a_tft_tk_80_80_41;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_41_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[42] = {
        __Title = a_tft_tk_80_80_42;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_42_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[43] = {
        __Title = a_tft_tk_80_80_43;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_43_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[44] = {
        __Title = a_tft_tk_80_80_44;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_44_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[45] = {
        __Title = a_tft_tk_80_80_45;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_45_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[46] = {
        __Title = a_tft_tk_80_80_46;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_46_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[47] = {
        __Title = a_tft_tk_80_80_47;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_47_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test SCAN_PATHDELAY_1_PG_Vmin {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVmin;
    __Entry[1] = DCsetup_LooseVmin;
    __Entry[2] = SCAN_PATHDELAY_1_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = a_tft_tk_80_80_1;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_1_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[1] = {
        __Title = a_tft_tk_80_80_2;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_2_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[2] = {
        __Title = a_tft_tk_80_80_3;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_3_Thrd'"; }
            MinorID = __Expression { __String = "20"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[3] = {
        __Title = a_tft_tk_80_80_4;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_4_Thrd'"; }
            MinorID = __Expression { __String = "30"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[4] = {
        __Title = a_tft_tk_80_80_5;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_5_Thrd'"; }
            MinorID = __Expression { __String = "40"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[5] = {
        __Title = a_tft_tk_80_80_6;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_6_Thrd'"; }
            MinorID = __Expression { __String = "50"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[6] = {
        __Title = a_tft_tk_80_80_7;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_7_Thrd'"; }
            MinorID = __Expression { __String = "60"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[7] = {
        __Title = a_tft_tk_80_80_8;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_8_Thrd'"; }
            MinorID = __Expression { __String = "70"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[8] = {
        __Title = a_tft_tk_80_80_9;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_9_Thrd'"; }
            MinorID = __Expression { __String = "80"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[9] = {
        __Title = a_tft_tk_80_80_10;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_10_Thrd'"; }
            MinorID = __Expression { __String = "90"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[10] = {
        __Title = a_tft_tk_80_80_11;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_11_Thrd'"; }
            MinorID = __Expression { __String = "100"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[11] = {
        __Title = a_tft_tk_80_80_12;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_12_Thrd'"; }
            MinorID = __Expression { __String = "110"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[12] = {
        __Title = a_tft_tk_80_80_13;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_13_Thrd'"; }
            MinorID = __Expression { __String = "120"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[13] = {
        __Title = a_tft_tk_80_80_14;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_14_Thrd'"; }
            MinorID = __Expression { __String = "130"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[14] = {
        __Title = a_tft_tk_80_80_15;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_15_Thrd'"; }
            MinorID = __Expression { __String = "140"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[15] = {
        __Title = a_tft_tk_80_80_16;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_16_Thrd'"; }
            MinorID = __Expression { __String = "150"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[16] = {
        __Title = a_tft_tk_80_80_17;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_17_Thrd'"; }
            MinorID = __Expression { __String = "160"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[17] = {
        __Title = a_tft_tk_80_80_18;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_18_Thrd'"; }
            MinorID = __Expression { __String = "170"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[18] = {
        __Title = a_tft_tk_80_80_19;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_19_Thrd'"; }
            MinorID = __Expression { __String = "180"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[19] = {
        __Title = a_tft_tk_80_80_20;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_20_Thrd'"; }
            MinorID = __Expression { __String = "190"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[20] = {
        __Title = a_tft_tk_80_80_21;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_21_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[21] = {
        __Title = a_tft_tk_80_80_21_1;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_21_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[22] = {
        __Title = a_tft_tk_80_80_22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_22_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[23] = {
        __Title = a_tft_tk_80_80_23;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_23_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[24] = {
        __Title = a_tft_tk_80_80_24;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_24_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[25] = {
        __Title = a_tft_tk_80_80_25;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_25_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[26] = {
        __Title = a_tft_tk_80_80_26;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_26_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[27] = {
        __Title = a_tft_tk_80_80_27;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_27_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[28] = {
        __Title = a_tft_tk_80_80_28;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_28_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[29] = {
        __Title = a_tft_tk_80_80_29;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_29_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[30] = {
        __Title = a_tft_tk_80_80_30;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_30_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[31] = {
        __Title = a_tft_tk_80_80_31;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_31_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[32] = {
        __Title = a_tft_tk_80_80_32;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_32_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[33] = {
        __Title = a_tft_tk_80_80_33;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_33_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[34] = {
        __Title = a_tft_tk_80_80_34;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_34_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[35] = {
        __Title = a_tft_tk_80_80_35_7;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_35_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[36] = {
        __Title = a_tft_tk_80_80_36_6;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_36_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[37] = {
        __Title = a_tft_tk_80_80_37_5;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_37_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[38] = {
        __Title = a_tft_tk_80_80_38_4;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_38_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[39] = {
        __Title = a_tft_tk_80_80_39_3;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_39_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[40] = {
        __Title = a_tft_tk_80_80_40;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_40_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[41] = {
        __Title = a_tft_tk_80_80_41;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_41_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[42] = {
        __Title = a_tft_tk_80_80_42;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_42_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[43] = {
        __Title = a_tft_tk_80_80_43;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_43_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[44] = {
        __Title = a_tft_tk_80_80_44;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_44_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[45] = {
        __Title = a_tft_tk_80_80_45;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_45_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[46] = {
        __Title = a_tft_tk_80_80_46;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_46_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[47] = {
        __Title = a_tft_tk_80_80_47;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_47_Thrd'"; }
            MinorID = __Expression { __String = "200"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test SCAN_PATHDELAY_25_PG {
    __Entry[0] = SCAN_PATHDELAY_25_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Scan_PathDelay_25;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_25_PG_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test SCAN_PATHDELAY_33_PG {
    __Entry[0] = SCAN_PATHDELAY_33_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Scan_PathDelay_33_1;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_33_1_PG_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[1] = {
        __Title = Scan_PathDelay_33_2;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_33_2_PG_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test SCAN_PATHDELAY_PG {
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = SCAN_PATHDELAY_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Scan_PathDelay;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_PG_Thrd'"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test SCAN_PATHDELAY_40_PG {
    __Entry[0] = SCAN_PATHDELAY_40_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = SCAN_PATHDELAY_40;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_40_PG_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test BIST_PROD_PG {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVmin;
    __Entry[1] = DCsetup_LooseVmin;
    __Entry[2] = BIST_PROD_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = BIST_Prod;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'BIST_PROD_PGDB_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_RAM_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test BIST_PROD_PG_Vmin {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVmin;
    __Entry[1] = DCsetup_LooseVmin;
    __Entry[2] = BIST_PROD_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = BIST_Prod;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'BIST_PROD_PGDB_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_RAM_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test PBIST_2P_PROD_PG {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerDownWORead_PowerUpAtVmin;
    __Entry[1] = DCsetup_LooseVmin;
    __Entry[2] = PBIST_2P_PROD_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PBIST_2P_Prod;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'PBIST_2P_PROD_PG_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_RAM_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test WrEngRow_func {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = LTXC::GenericTest;
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            SimulateRowResults = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test dieid_postread_func {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = TIReadDieIDTW;
        }
    }
}
__Test ATPG_STUCK_VminSearchPre1_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = SCAN_SA_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = ATPG_STUCK_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_SA_PG_Thrd'"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = ATPG_STUCK_VminSearchPre1_st;
        __WrapCells = __True;
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            SearchAxis = __Expression { __String = "&CharAxis_SrchVdd_Vmin_ATPG_STUCK"; }
            SearchAlgorithm = __Expression { __String = "SEARCH_ALGORITHM:SEARCH_BINARY"; }
            StepResultFunction = __Expression { __String = "&ATPG_STUCK_Srch_Fnctn"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            OutputRunTimeErrors = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test PBIST_VBOXL_VminSearchPre1_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = BIST_PROD_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PBIST_VBOXL_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'BIST_PROD_PGDB_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = PBIST_VBOXL_VminSearchPre1_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "10"; }
            SearchAxis = __Expression { __String = "&CharAxis_SrchVdd_Vmin_PBIST_VBOXL"; }
            SearchAlgorithm = __Expression { __String = "SEARCH_ALGORITHM:SEARCH_BINARY"; }
            StepResultFunction = __Expression { __String = "&PBIST_VBOXL_Srch_Fnctn"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            OutputRunTimeErrors = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test PBIST_1P_VminSearchPre1_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = BIST_PROD_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PBIST_1P_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'BIST_PROD_PGDB_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = PBIST_1P_VminSearchPre1_st;
        __WrapCells = __True;
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "10"; }
            SearchAxis = __Expression { __String = "&CharAxis_SrchVdd_Vmin_PBIST_1P"; }
            SearchAlgorithm = __Expression { __String = "SEARCH_ALGORITHM:SEARCH_BINARY"; }
            StepResultFunction = __Expression { __String = "&PBIST_1P_Srch_Fnctn"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            OutputRunTimeErrors = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test PBIST_2P_VminSearchPre1_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = PBIST_2P_PROD_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PBIST_2P_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'PBIST_2P_PROD_PG_Srch_Thrd'"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = PBIST_2P_VminSearchPre1_st;
        __WrapCells = __True;
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            SearchAxis = __Expression { __String = "&CharAxis_SrchVdd_Vmin_PBIST_2P"; }
            SearchAlgorithm = __Expression { __String = "SEARCH_ALGORITHM:SEARCH_BINARY"; }
            StepResultFunction = __Expression { __String = "&PBIST_2P_Srch_Fnctn"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            OutputRunTimeErrors = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test PBIST_RET_VminSearchPre1_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = Iddq_PM02_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PBIST_RET_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'Iddq_PM02_pb_iddq_ret_invchkr_Thrd'"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = PBIST_RET_VminSearchPre1_st;
        __WrapCells = __True;
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            SearchAxis = __Expression { __String = "&CharAxis_SrchVdd_Vmin_PBIST_RET"; }
            SearchAlgorithm = __Expression { __String = "SEARCH_ALGORITHM:SEARCH_BINARY"; }
            StepResultFunction = __Expression { __String = "&PBIST_RET_Srch_Fnctn"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            OutputRunTimeErrors = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test TRANSFLT_80_VminSearchPre_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = SCAN_PATHDELAY_1_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = TransFLT_80_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_1_PG_Thrd'"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = TRANSFLT_80_VminSearchPre_st;
        __WrapCells = __True;
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            SearchAxis = __Expression { __String = "&CharAxis_SrchVdd_Vmin_TRANSFLT_80"; }
            SearchAlgorithm = __Expression { __String = "SEARCH_ALGORITHM:SEARCH_BINARY"; }
            StepResultFunction = __Expression { __String = "&TRANSFLT_80_Srch_Fnctn"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            OutputRunTimeErrors = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test BIST_PROD_FreqSearchPre_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerDownWithoutRead;
    __Entry[1] = PowerUpAtVmask;
    __Entry[2] = DCsetup_LooseVmask;
    __Entry[3] = SCAN_PATHDELAY_1_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = BIST_PROD_Freq_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_1_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = BIST_PROD_FreqSearchPre_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            SearchAxis = __Expression { __String = "&CharAxis_SrchFrq_Vmin_BIST_PROD"; }
            SearchAlgorithm = __Expression { __String = "SEARCH_ALGORITHM:SEARCH_BINARY"; }
            StepResultFunction = __Expression { __String = "&BIST_PROD_Srch_Fnctn"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            OutputRunTimeErrors = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test FUNC_BIST_FreqSearchPre_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerDownWithoutRead;
    __Entry[1] = PowerUpAtVmask;
    __Entry[2] = DCsetup_LooseVmask;
    __Entry[3] = PBIST_2P_PROD_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = FUNC_BIST_Freq_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'PBIST_2P_PROD_PG_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = FUNC_BIST_FreqSearchPre_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            SearchAxis = __Expression { __String = "&CharAxis_SrchFrq_Vmin_BIST_PROD"; }
            SearchAlgorithm = __Expression { __String = "SEARCH_ALGORITHM:SEARCH_BINARY"; }
            StepResultFunction = __Expression { __String = "&FUNC_BIST_Srch_Fnctn"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            OutputRunTimeErrors = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test FUNC_BIST_1_FreqSearchPre_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = BIST_PROD_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = FUNC_BIST_1_Freq_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'BIST_PROD_PG_Srch_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = FUNC_BIST_1_FreqSearchPre_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "10"; }
            SearchAxis = __Expression { __String = "&CharAxis_SrchFrq_Vmin_FUNC_BIST_1"; }
            SearchAlgorithm = __Expression { __String = "SEARCH_ALGORITHM:SEARCH_BINARY"; }
            StepResultFunction = __Expression { __String = "&FUNC_BIST_1_Srch_Fnctn"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            OutputRunTimeErrors = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test BIST_PROD_FreqSearchPost_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_LooseVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = SCAN_PATHDELAY_1_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = BIST_PROD_Freq_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_1_PG_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = BIST_PROD_FreqSearchPost_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "10"; }
            SearchAxis = __Expression { __String = "&CharAxis_SrchFrq_Vmin_BIST_PROD"; }
            SearchAlgorithm = __Expression { __String = "SEARCH_ALGORITHM:SEARCH_BINARY"; }
            StepResultFunction = __Expression { __String = "&BIST_PROD_Srch_Fnctn"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            OutputRunTimeErrors = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test FUNC_BIST_1_FreqSearchPost_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = BIST_PROD_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = FUNC_BIST_1_Freq_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'BIST_PROD_PGDB_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = FUNC_BIST_1_FreqSearchPost_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "10"; }
            SearchAxis = __Expression { __String = "&CharAxis_SrchFrq_Vmin_FUNC_BIST_1"; }
            SearchAlgorithm = __Expression { __String = "SEARCH_ALGORITHM:SEARCH_BINARY"; }
            StepResultFunction = __Expression { __String = "&FUNC_BIST_1_Srch_Fnctn"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            OutputRunTimeErrors = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test FUNC_BIST_FreqSearchPost_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = PBIST_2P_PROD_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = FUNC_BIST_Freq_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'PBIST_2P_PROD_PG_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = FUNC_BIST_FreqSearchPost_st;
        __WrapCells = __True;
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "10"; }
            SearchAxis = __Expression { __String = "&CharAxis_SrchFrq_Vmin_BIST_PROD"; }
            SearchAlgorithm = __Expression { __String = "SEARCH_ALGORITHM:SEARCH_BINARY"; }
            StepResultFunction = __Expression { __String = "&FUNC_BIST_Srch_Fnctn"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            OutputRunTimeErrors = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test ConnectDevice {
    __Entry[0] = DCsetup_ZeroPins_ZeroSupplies_RampDown;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = ConnectSupplies;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::Connections;
            TestPins = __Expression { __String = "ALLSUPPLIES-Probe_Only_Pins-VDDAR"; }
            PinControl = __Expression { __String = "CONNECTION_ENUM:CONNECT_TO_DUT"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = ConnectAnaSupplies;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::Connections;
            TestPins = __Expression { __String = "AnalogPower_Pins+DCREF_Pins-Probe_Only_Pins"; }
            PinControl = __Expression { __String = "CONNECTION_ENUM:CONNECT_TO_DUT"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = ConnectPins;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::Connections;
            TestPins = __Expression { __String = "ALLPINS-Probe_Only_Pins"; }
            PinControl = __Expression { __String = "CONNECTION_ENUM:CONNECT_TO_DUT"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
        }
    }
}
__Test DisconnectDevice {
    __Entry[0] = DCsetup_ZeroPins_ZeroSupplies_RampDown;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = DisconnectPins;
        __TestMethod {
            __Name = LTXC::Connections;
            TestPins = __Expression { __String = "ALLPINS"; }
            PinControl = __Expression { __String = "CONNECTION_ENUM:DISCONNECT_FROM_DUT"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = DisconnectDCREFAndAnaSupplyPins;
        __TestMethod {
            __Name = LTXC::Connections;
            TestPins = __Expression { __String = "AnalogPower_Pins+DCREF_Pins"; }
            PinControl = __Expression { __String = "CONNECTION_ENUM:DISCONNECT_FROM_DUT"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = DisconnectSupplies;
        __TestMethod {
            __Name = LTXC::Connections;
            TestPins = __Expression { __String = "ALLSUPPLIES"; }
            PinControl = __Expression { __String = "CONNECTION_ENUM:DISCONNECT_FROM_DUT"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
        }
    }
}
__Test FocusCalibration {
    __Entry[0] = CalibrationLevels;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Blizzard_Fixture_Calibration;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::FocusCalibration;
            TestPins = __Expression { __String = "CALPINS"; }
            CalibrationType = __Expression { __String = "FOCUS_CAL_TYPE_ENUM:CALIBRATE_FIXTURE"; }
            CalibrationFile = __Expression { __String = "'BlizFixCal'"; }
            LoadFromFile = __Expression { __String = "FALSE"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
        }
    }
    __Block[1] = {
        __Title = Blizzard_Focus_Calibration_1;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = LTXC::FocusCalibration;
            TestPins = __Expression { __String = "CALPINS"; }
            CalibrationType = __Expression { __String = "FOCUS_CAL_TYPE_ENUM:CALIBRATE_TIMING"; }
            CalibrationObject = __Expression { __String = "'BlizTimingCal'"; }
            LoadFromFile = __Expression { __String = "FALSE"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
        }
    }
}

__Test SelectSpecs {
    __Mask[0] = Globals_Typ_Mask;
    __Mask[1] = Globals_Meas_Mask;
    __Mask[2] = DCSpecsMask;
    __Mask[3] = ACSpecsMask;
    __Entry[0] = SetTyp_To_Meas_MF;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = MyBlock0;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::GenericTest;
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            SimulateRowResults = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test SinglePort_MapCol_T {
    __Mask[0] = PSSpecsMask;
    __Mask[1] = ACSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = pb_pb_mapcol_1p_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = SinglePort_MapCol;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'pb_pb_mapcol_1p_Thrd'"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test FF_InitCheck_T {
    __Mask[0] = DCSpecsMask;
    __Mask[1] = PSSpecsMask;
    __Mask[2] = ACSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FuseFarm_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = FF_InitCheck;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'FF_InitCheck_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = FF_RunAutoload;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'FF_RunAutoload_ENG_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = FF_CheckROM_Mg0;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'FF_CheckROM_Mg0_ENG_Thrd'"; }
            MinorID = __Expression { __String = "20"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}

__Test F021_InitFLGlobalVars {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = F021_InitFLGlobalvars_func;
        }
    }
}
__Test F021_FlashConfig_test {
    __Mask[0] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block3;
        __TestMethod {
            __Name = Initialize_hardware;
        }
    }
    __Block[1] = {
        __Title = Block2;
        __TestMethod {
            __Name = LoadEfuseCtlrData;
        }
    }
    __Block[2] = {
        __Title = Block1;
        __TestMethod {
            __Name = F021_FlashConfig;
        }
    }
}
__Test Pump_Iref_Vnom {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = jtag_reset;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "o_cpu_fail_47"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'jtag_reset_init_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = ldo_bypass;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "o_cpu_fail_47"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ldo_bypass_init_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = Block1;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_Iref_Vnom_func;
        }
    }
    __Block[3] = {
        __Title = Block4;
        __TestMethod {
            __Name = IPMOS_TCode_Upload_func;
        }
    }
}
__Test FTN_LoopCPU_T {
    __Mask[0] = DCSpecsMask;
    __Mask[1] = PSSpecsMask;
    __Mask[2] = ACSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Load_Flash_ShellB;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'Garnet_Shell064_T072C008S007_A2_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = LoadTestNumber_0x10000000;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'f021_shell_exepat_pll_Both_Thrd'"; }
            MinorID = __Expression { __String = "40"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = Block3;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::Connections;
            TestPins = __Expression { __String = "FLTP2"; }
            PinControl = __Expression { __String = "CONNECTION_ENUM:DISCONNECT_FROM_DUT"; }
            CallAtEnd = __Expression { __String = "&Clear_CPU_Flag"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
        }
    }
    __Block[3] = {
        __Title = TPad2_MeasV_1_1;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = LTXC::DCTest;
            TestPins = __Expression { __String = "FLTP2"; }
            TestLimitSource = __Expression { __String = "DC_LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "50"; }
            ForceValue = __Expression { __String = "10nA"; }
            ForceRange = __Expression { __String = "1nA"; }
            MeasureRange = __Expression { __String = "2V"; }
            LowLimit = __Expression { __String = "1.174V -500mV"; }
            HighLimit = __Expression { __String = "1.271V+650mV"; }
            LowClamp = __Expression { __String = "0.1V"; }
            HighClamp = __Expression { __String = "2.5V"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            MeasurementDelay = __Expression { }
            MethodOfTest = __Expression { __String = "MEASURE_METHOD:MEASURE_PARALLEL"; }
            MakeBeforeBreakRelays = __Expression { __String = "VI_CONNECT_SEQUENCE:VI_MAKE_BEFORE_BREAK"; }
            CallAtEnd = __Expression { __String = "&Clear_CPU_Flag"; }
            PresetPatternMinorID = __Expression { __String = "60"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            MeasurementAverages = __Expression { __String = "1"; }
            OptimizationMethod = __Expression { __String = "OPTIMIZATION_METHOD:OPTIMIZE_FOR_SPEED"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[4] = {
        __Title = LoadTestNumber_0x11200000;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'FlashTestNum_0x11200000_Thrd'"; }
            MinorID = __Expression { __String = "40"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[5] = {
        __Title = TPad1_MeasV_1;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = LTXC::DCTest;
            TestPins = __Expression { __String = "FLTP1"; }
            TestLimitSource = __Expression { __String = "DC_LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "50"; }
            ForceValue = __Expression { __String = "0.0A"; }
            ForceRange = __Expression { __String = "10mA"; }
            MeasureRange = __Expression { __String = "6V"; }
            LowLimit = __Expression { __String = "5.1V"; }
            HighLimit = __Expression { __String = "5.35V"; }
            LowClamp = __Expression { __String = "4V"; }
            HighClamp = __Expression { __String = "6.5V"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            MethodOfTest = __Expression { __String = "MEASURE_METHOD:MEASURE_PARALLEL"; }
            MakeBeforeBreakRelays = __Expression { __String = "VI_CONNECT_SEQUENCE:VI_MAKE_BEFORE_BREAK"; }
            CallAtEnd = __Expression { __String = "&Clear_CPU_Flag"; }
            PresetPatternMinorID = __Expression { __String = "60"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "1"; }
            OptimizationMethod = __Expression { __String = "OPTIMIZATION_METHOD:OPTIMIZE_FOR_SPEED"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test Pump_BGAP_Vnom {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_BGap_Vnom_func;
        }
    }
}
__Test DMLED_Debug_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = debug_ps;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'gpt5_debugP'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test FuncBist_Vmin_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerDownWithoutRead;
    __Entry[1] = PowerUpAtVmin;
    __Entry[2] = DCsetup_LooseVmin;
    __Entry[3] = DMLED_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = can_dmled_st_dummy;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'candmalbtx1rx0_1beat_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = can_dmled_st;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'candmalb_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[2] = {
        __Title = ssi0_dmled_st;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ssi0_loopback_pll_b_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[3] = {
        __Title = ssi1_dmled_st;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ssi1_loopback_pll_b_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[4] = {
        __Title = ssi2_dmled_st;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ssi2_loopback_pll_b_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[5] = {
        __Title = ssi3_dmled_st;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ssi3_loopback_pll_b_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[6] = {
        __Title = i2c_gpt_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'i2c_gpt_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[7] = {
        __Title = i2c0_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'i2c0_dma_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[8] = {
        __Title = i2c1_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'i2c1_dma_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[9] = {
        __Title = i2c2_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'i2c2_dma_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[10] = {
        __Title = i2c3_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'i2c3_dma_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[11] = {
        __Title = i2c4_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'i2c4_dma_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[12] = {
        __Title = gpt0_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'gpt0_1s_32_down_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[13] = {
        __Title = gpt1_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'gpt1_1s_32_down_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[14] = {
        __Title = gpt2_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'gpt2_1s_32_down_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[15] = {
        __Title = gpt3_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'gpt3_1s_32_down_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[16] = {
        __Title = gpt4_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'gpt4_1s_32_down_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[17] = {
        __Title = gpt5_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'gpt5_1s_32_down_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[18] = {
        __Title = gpt6_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'gpt6_per_32_down_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[19] = {
        __Title = gpt7_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'gpt7_per_32_down_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[20] = {
        __Title = gpt8_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'gpt8_per_32_down_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[21] = {
        __Title = gpt9_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'gpt9_per_32_down_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[22] = {
        __Title = gpt10_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'gpt10_per_32_down_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[23] = {
        __Title = gpt11_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'gpt11_per_32_down_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[24] = {
        __Title = wdtimer0_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'wd_timer1_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[25] = {
        __Title = wdtimer1_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'wd_timer1_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[26] = {
        __Title = misc0_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'misc_dmled_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[27] = {
        __Title = misc1_dmled0_st;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            LevelsSetup = __Expression { __String = "&PowerDownWORead_PowerUpAtVmin"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'pwm0_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWNominalData"; }
        }
    }
    __Block[28] = {
        __Title = misc1_dmled1_st;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'pwm1_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWNominalData"; }
        }
    }
    __Block[29] = {
        __Title = misc1_dmled2_st;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'usbphy_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWNominalData"; }
        }
    }
    __Block[30] = {
        __Title = misc1_dmled3_st_;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'sysctldsldo_pioscpd_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWNominalData"; }
        }
    }
    __Block[31] = {
        __Title = uart_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'uart_dmled_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWNominalData"; }
        }
    }
    __Block[32] = {
        __Title = hib_dmled_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'hib_dmled_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWNominalData"; }
        }
    }
}
__Test FuseCtlr_func {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtEfuseRead;
    __Entry[1] = DCsetup_LooseVmin;
    __Entry[2] = FuseFarm_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = CheckFuseCtlr_InitCheck;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'FF_InitCheck_NoEd_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUSE_ROM_READ'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[1] = {
        __Title = CheckFuseCtlr_RunAutoload;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'FF_RunAutoload_NoEd_Thrd'"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUSE_ROM_READ'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[2] = {
        __Title = CheckFuseCtlr_CheckROM_Mg0;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'FF_CheckROM_Mg0_NoEd_Thrd'"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUSE_ROM_READ'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test FuncBist_Vmax_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = DMLED_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = can_dmled_st_dummy;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'candmalbtx1rx0_1beat_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = can_dmled_st;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'candmalb_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[2] = {
        __Title = ssi_dmled_st;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ssi_loopback_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[3] = {
        __Title = i2c_gpt_dmled_st;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'i2c_gpt_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[4] = {
        __Title = wdtimer_dmled_st;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'i2c_gpt_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[5] = {
        __Title = Block6;
        __TestMethod {
            __Name = power_up;
            debug = __Expression { __String = "FALSE"; }
            wait_time = __Expression { __String = "1ms"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWNominalData"; }
        }
    }
}
__Test DieIDPreRead_func {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test DieID_PartialProg_func {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test Pump_VHV_Vmin {
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_VHV_Vmin_func;
            postTrimLevels1 = __Expression { __String = "&DCsetup_LooseVmask"; }
            postTrimLevels2 = __Expression { __String = "&PowerUpAtVmask"; }
        }
    }
}
__Test Pump_VHV_Vmax {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_VHV_Vmax_func;
        }
    }
}
__Test Pump_VSL_Vmin {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_VSL_Vmin_func;
        }
    }
}
__Test Pump_VSL_Vmax {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_VSL_Vmax_func;
        }
    }
}
__Test Pump_Vread_Vmin {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_Vread_Vmin_func;
        }
    }
}
__Test Pump_Vread_Vmax {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_Vread_Vmax_func;
        }
    }
}
__Test Pump_VSA5_Vmin {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_VSA5_Vmin_func;
        }
    }
}
__Test Pump_VSA5_Vmax {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_VSA5_Vmax_func;
        }
    }
}
__Test Pump_VWL_Vmin {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_VWL_Vmin_func;
        }
    }
}
__Test Pump_VWL_Vmax {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_VWL_Vmax_func;
        }
    }
}
__Test Pump_VCG2P5_Vmin {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_VCG2P5_Vmin_func;
        }
    }
}
__Test Pump_VCG2P5_Vmax {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_VCG2P5_Vmax_func;
        }
    }
}
__Test Pump_VINH_Vmin {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_VINH_Vmin_func;
        }
    }
}
__Test Pump_VINH_Vmax {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_VINH_Vmax_func;
        }
    }
}
__Test Pump_VHV2X_Vmin {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_VHV2X_Vmin_func;
        }
    }
}
__Test Pump_VHV2X_Vmax {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS OR RunAllTests"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = Pump_VHV2X_Vmax_func;
        }
    }
}

__Test Pbist_Logout_Test_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = pBistLogout_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Pbist_Logout_Test;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "ALLPINS"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'pb_pb_fail_insert_fail_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "FALSE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test Pbist_Logout_Capture_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = pBistLogout_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Pbist_Fail_Logout_F;
        __TestMethod {
            __Name = PbistFailLogout;
        }
    }
}

__Test BankErs_PreTunOxide_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_ZeroPins_ZeroSupplies_RampDown;
    __Entry[1] = DCsetup_Loose;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = BankErs_PreTunOxide;
        __TestMethod {
            __Name = BankErs_PreTunOxide_func;
        }
    }
}
__Test ErsOTP_PreTunOxide_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = ErsOTP_PreTunOxide;
        __TestMethod {
            __Name = ErsOTP_PreTunOxide_func;
        }
    }
}
__Test PreTunOxideVT1_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PreTunOxideVT1;
        __TestMethod {
            __Name = PreTunOxideVT1_func;
        }
    }
}
__Test PreTunOxideVT1OTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PreTunOxideVT1OTP;
        __TestMethod {
            __Name = PreTunOxideVT1OTP_func;
        }
    }
}
__Test TunOxide_Stress_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = TunOxide_Stress;
        __TestMethod {
            __Name = TunOxide_Stress_func;
        }
    }
}
__Test PstTunOxideVT1_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PstTunOxideVT1;
        __TestMethod {
            __Name = PstTunOxideVT1_func;
        }
    }
}
__Test PstTunOxideVT1OTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PstTunOxideVT1OTP;
        __TestMethod {
            __Name = PstTunOxideVT1OTP_func;
        }
    }
}
__Test TunOxideVT1Delta_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = TunOxideVT1Delta;
        __TestMethod {
            __Name = TunOxideVT1Delta_func;
        }
    }
}
__Test TunOxideVT1DeltaOTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = TunOxideVT1DeltaOTP;
        __TestMethod {
            __Name = TunOxideVT1DeltaOTP_func;
        }
    }
}

__Test BankErs_PrePgmFF_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_ZeroPins_ZeroSupplies_RampDown;
    __Entry[1] = DCsetup_Loose;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = BankErs_PrePgmFF;
        __TestMethod {
            __Name = BankErs_PrePgmFF_func;
        }
    }
}
__Test ErsOTP_PrePgmFF_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = ErsOTP_PrePgmFF;
        __TestMethod {
            __Name = ErsOTP_PrePgmFF_func;
        }
    }
}
__Test PrePgmFFVT1_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PrePgmFFVT1;
        __TestMethod {
            __Name = PrePgmFFVT1_func;
        }
    }
}
__Test PrePgmFFVT1OTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PrePgmFFVT1OTP;
        __TestMethod {
            __Name = PrePgmFFVT1OTP_func;
        }
    }
}
__Test PgmFF_Stress_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PgmFF_Stress;
        __TestMethod {
            __Name = PgmFF_Stress_func;
        }
    }
}
__Test PstPgmFFVT1_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PstPgmFFVT1;
        __TestMethod {
            __Name = PstPgmFFVT1_func;
        }
    }
}
__Test PstPgmFFVT1OTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PstPgmFFVT1OTP;
        __TestMethod {
            __Name = PstPgmFFVT1OTP_func;
        }
    }
}
__Test PgmFFVT1Delta_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PgmFFVT1Delta;
        __TestMethod {
            __Name = PgmFFVT1Delta_func;
        }
    }
}
__Test PgmFFVT1DeltaOTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PgmFFVT1DeltaOTP;
        __TestMethod {
            __Name = PgmFFVT1DeltaOTP_func;
        }
    }
}

__Test BankErs_PreFGWL_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_ZeroPins_ZeroSupplies_RampDown;
    __Entry[1] = DCsetup_Loose;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = BankErs_PreFGWL;
        __TestMethod {
            __Name = BankErs_PreFGWL_func;
        }
    }
}
__Test ErsOTP_PreFGWL_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = ErsOTP_PreFGWL;
        __TestMethod {
            __Name = ErsOTP_PreFGWL_func;
        }
    }
}
__Test PreFGWLVT1_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PreFGWLVT1;
        __TestMethod {
            __Name = PreFGWLVT1_func;
        }
    }
}
__Test PreFGWLVT1OTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PreFGWLVT1OTP;
        __TestMethod {
            __Name = PreFGWLVT1OTP_func;
        }
    }
}
__Test FGWL_Stress_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = FGWL_Stress;
        __TestMethod {
            __Name = FGWL_Stress_func;
        }
    }
}
__Test PstFGWLVT1_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PstFGWLVT1;
        __TestMethod {
            __Name = PstFGWLVT1_func;
        }
    }
}
__Test PstFGWLVT1OTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PstFGWLVT1OTP;
        __TestMethod {
            __Name = PstFGWLVT1OTP_func;
        }
    }
}
__Test FGWLVT1Delta_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = FGWLVT1Delta;
        __TestMethod {
            __Name = FGWLVT1Delta_func;
        }
    }
}
__Test FGWLVT1DeltaOTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = FGWLVT1DeltaOTP;
        __TestMethod {
            __Name = FGWLVT1DeltaOTP_func;
        }
    }
}

__Test Flash_Cycle9X_Pgm_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_ZeroPins_ZeroSupplies_RampDown;
    __Entry[1] = DCsetup_Loose;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Flash_Cycle9X_Pgm;
        __TestMethod {
            __Name = Flash_Cycle9X_Pgm_func;
        }
    }
}
__Test Flash_Cycle9X_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Flash_Cycle9X;
        __TestMethod {
            __Name = Flash_Cycle9X_func;
        }
    }
}
__Test RdM1_PstCycle9X_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdM1_PstCycle9X;
        __TestMethod {
            __Name = RdM1_PstCycle9X_func;
        }
    }
}

__Test PreconOTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_ZeroPins_ZeroSupplies_RampDown;
    __Entry[1] = DCsetup_Loose;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PreconOTP;
        __TestMethod {
            __Name = PreconOTP_func;
        }
    }
}
__Test RdM0OTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdM0OTP;
        __TestMethod {
            __Name = RdM0OTP_func;
        }
    }
}
__Test EraseOTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = EraseOTP;
        __TestMethod {
            __Name = EraseOTP_func;
        }
    }
}
__Test RdM1OTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdM1OTP;
        __TestMethod {
            __Name = RdM1OTP_func;
        }
    }
}
__Test PgmOTPTemplate_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PgmOTPTemplate;
        __TestMethod {
            __Name = PgmOTPTemplate_func;
        }
    }
}
__Test RdM1OTPTemplate_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdM1OTPTemplate;
        __TestMethod {
            __Name = RdM1OTPTemplate_func;
        }
    }
}
__Test RdM0OTPTemplate_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdM0OTPTemplate;
        __TestMethod {
            __Name = RdM0OTPTemplate_func;
        }
    }
}

__Test PgmChkboard_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_ZeroPins_ZeroSupplies_RampDown;
    __Entry[1] = DCsetup_Loose;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PgmChkboard;
        __TestMethod {
            __Name = PgmChkboard_func;
        }
    }
}
__Test RdM0Chkboard_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdM0Chkboard;
        __TestMethod {
            __Name = RdM0Chkboard_func;
        }
    }
}
__Test RdM1Chkboard_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdM1Chkboard;
        __TestMethod {
            __Name = RdM1Chkboard_func;
        }
    }
}
__Test PgmChkboardOTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PgmChkboardOTP;
        __TestMethod {
            __Name = PgmChkboardOTP_func;
        }
    }
}

__Test SenAmpNoise_Screen_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_ZeroPins_ZeroSupplies_RampDown;
    __Entry[1] = DCsetup_Loose;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = SenAmpNoise_Screen;
        __TestMethod {
            __Name = SenAmpNoise_Screen_func;
        }
    }
}
__Test IterSectErs_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = IterSectErs;
        __TestMethod {
            __Name = IterSectErs_func;
        }
    }
}
__Test RdM1_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdM1;
        __TestMethod {
            __Name = RdM1_func;
        }
    }
}
__Test RefreshOTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RefreshOTP;
        __TestMethod {
            __Name = RefreshOTP_func;
        }
    }
}

__Test PreDRLVT0Min_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_ZeroPins_ZeroSupplies_RampDown;
    __Entry[1] = DCsetup_Loose;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PreDRLVT0Min;
        __TestMethod {
            __Name = PreDRLVT0Min_func;
        }
    }
}
__Test PreDRLVT1Max_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PreDRLVT1Max;
        __TestMethod {
            __Name = PreDRLVT1Max_func;
        }
    }
}
__Test PreDRLVT0MinOTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PreDRLVT0MinOTP;
        __TestMethod {
            __Name = PreDRLVT0MinOTP_func;
        }
    }
}
__Test PreDRLVT1MaxOTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PreDRLVT1MaxOTP;
        __TestMethod {
            __Name = PreDRLVT1MaxOTP_func;
        }
    }
}

__Test RdNormSCyc_Vmin_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdNormSCyc_Vmin;
        __TestMethod {
            __Name = RdNormSCyc_Vmin_func;
        }
    }
}
__Test RdNormSCyc_Vmax_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdNormSCyc_Vmax;
        __TestMethod {
            __Name = RdNormSCyc_Vmax_func;
        }
    }
}
__Test RdPipe_Vmin_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdPipe_Vmin;
        __TestMethod {
            __Name = RdPipe_Vmin_func;
        }
    }
}
__Test RdPipe_Vmax_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdPipe_Vmax;
        __TestMethod {
            __Name = RdPipe_Vmax_func;
        }
    }
}
__Test RdNormSCyc_FreqSrch_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdNormSCyc_FreqSrch;
        __TestMethod {
            __Name = RdNormSCyc_FreqSrch_func;
        }
    }
}

__Test Flash_ISleep_Pst_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Flash_ISleep_Pst;
        __TestMethod {
            __Name = Flash_ISleep_Pst_func;
        }
    }
}

__Test ATPG_CPU_Vstress {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVmin;
    __Entry[1] = DCsetup_LooseVmin;
    __Entry[2] = SCAN_SA_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = a_st_tk_1_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_1_v22_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[1] = {
        __Title = a_st_tk_2_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_2_v22_Thrd'"; }
            MinorID = __Expression { __String = "1"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[2] = {
        __Title = a_st_tk_3_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_3_v22_Thrd'"; }
            MinorID = __Expression { __String = "2"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[3] = {
        __Title = a_st_tk_4_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_4_v22_Thrd'"; }
            MinorID = __Expression { __String = "3"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[4] = {
        __Title = a_st_tk_5_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_5_v22_Thrd'"; }
            MinorID = __Expression { __String = "4"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[5] = {
        __Title = a_st_tk_6_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_6_v22_Thrd'"; }
            MinorID = __Expression { __String = "5"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[6] = {
        __Title = a_st_tk_7_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_7_v22_Thrd'"; }
            MinorID = __Expression { __String = "6"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[7] = {
        __Title = a_st_tk_8_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_8_v22_Thrd'"; }
            MinorID = __Expression { __String = "7"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[8] = {
        __Title = a_st_tk_9_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_9_v22_Thrd'"; }
            MinorID = __Expression { __String = "8"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[9] = {
        __Title = a_st_tk_10_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_10_v22_Thrd'"; }
            MinorID = __Expression { __String = "9"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[10] = {
        __Title = a_st_tk_11_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_11_v22_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[11] = {
        __Title = a_st_tk_12_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_12_v22_Thrd'"; }
            MinorID = __Expression { __String = "11"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[12] = {
        __Title = a_st_tk_13_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_13_v22_Thrd'"; }
            MinorID = __Expression { __String = "12"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[13] = {
        __Title = a_st_tk_14_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_14_v22_Thrd'"; }
            MinorID = __Expression { __String = "13"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[14] = {
        __Title = a_st_tk_15_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_10_v22_Thrd'"; }
            MinorID = __Expression { __String = "14"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[15] = {
        __Title = a_st_tk_16_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_16_v22_Thrd'"; }
            MinorID = __Expression { __String = "15"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[16] = {
        __Title = a_st_tk_17_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_17_v22_Thrd'"; }
            MinorID = __Expression { __String = "16"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[17] = {
        __Title = a_st_tk_18_v22_2_4;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_18_v22_Thrd'"; }
            MinorID = __Expression { __String = "17"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[18] = {
        __Title = a_st_tk_19_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_19_v22_Thrd'"; }
            MinorID = __Expression { __String = "18"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[19] = {
        __Title = a_st_tk_20_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_20_v22_Thrd'"; }
            MinorID = __Expression { __String = "19"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[20] = {
        __Title = a_st_tk_fles_1_v22;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_fles_1_v22_Thrd'"; }
            MinorID = __Expression { __String = "19"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[21] = {
        __Title = a_st_tk_fles_2_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_st_tk_fles_2_v22_Thrd'"; }
            MinorID = __Expression { __String = "19"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VBOXHI'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test a_iddq_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_LooseVmask;
    __Entry[1] = PowerUpAtVmask;
    __Entry[2] = Iddq_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = JTAG_Reset_LDO_Bypass;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ldo_bypass_JTAG_reset_DSH_Thrd'"; }
            MinorID = __Expression { __String = "110"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = a_iddq_func_verify;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_iddq_NoPM_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = JTAG_Reset_LDO_Bypass_1;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ldo_bypass_JTAG_reset_DSH_Thrd'"; }
            MinorID = __Expression { __String = "110"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[3] = {
        __Title = IddqVboxLOPost_a_iddq_PM1_VNWA_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VNWA"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "10"; }
            ForcedVoltage = __Expression { __String = "VNWA_PS"; }
            MaxAllowedCurrent = __Expression { __String = "2mA"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VNWA_VBOXLO*2*0"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VNWA_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            PresetTestPins = __Expression { __String = "DSH_PL"; }
            PresetPatterns = __Expression { __String = "'a_iddq_Thrd'"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VNWA_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VNWA_VBOXLO"; }
            PresetPatternMinorID = __Expression { __String = "20"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[4] = {
        __Title = IddqVboxLOPost_a_iddq_PM1_VBAT_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VBAT"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "30"; }
            ForcedVoltage = __Expression { __String = "VBAT_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VBAT_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VBAT_VBOXLO*2*0"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VBAT_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            PresetTestPins = __Expression { __String = "DSH_PL"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VBAT_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VBAT_VBOXLO"; }
            PresetPatternMinorID = __Expression { __String = "40"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[5] = {
        __Title = IddqVboxLOPost_a_iddq_PM1_VDDA_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VDDA"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "50"; }
            ForcedVoltage = __Expression { __String = "VDDA_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VDDA_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VDDA_VBOXLO*2*0"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VDDA_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            PresetTestPins = __Expression { __String = "DSH_PL"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VDDA_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VDDA_VBOXLO"; }
            PresetPatternMinorID = __Expression { __String = "60"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[6] = {
        __Title = IddqVboxLOPost_a_iddq_PM1_VDDS_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VDDS"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "70"; }
            SetupDelay = __Expression { __String = "300mS"; }
            ForcedVoltage = __Expression { __String = "VDDS_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VDDS_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VDDS_VBOXLO"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VDDS_VBOXLO*2"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            PresetTestPins = __Expression { __String = "DSH_PL"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VDDS_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VDDS_VBOXLO"; }
            PresetPatternMinorID = __Expression { __String = "80"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[7] = {
        __Title = IddqVboxLOPost_a_iddq_PM1_VDD_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VDD"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "90"; }
            ForcedVoltage = __Expression { __String = "VDD_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO*2"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            PresetTestPins = __Expression { __String = "DSH_PL"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&ConnectOpenPinList"; }
            PresetPatternMinorID = __Expression { __String = "100"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[8] = {
        __Title = IddqVboxLOPost_a_iddq_PM2_VDD_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VDD"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "90"; }
            CallAfterSetup = __Expression { __String = "&Clear_CPU_Flag"; }
            ForcedVoltage = __Expression { __String = "VDD_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO*2"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&ConnectOpenPinList"; }
            PresetPatternMinorID = __Expression { __String = "100"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[9] = {
        __Title = IddqVboxLOPost_a_iddq_PM3_VDD_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VDD"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "90"; }
            CallAfterSetup = __Expression { __String = "&Clear_CPU_Flag"; }
            ForcedVoltage = __Expression { __String = "VDD_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO*2"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&ConnectOpenPinList"; }
            PresetPatternMinorID = __Expression { __String = "100"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[10] = {
        __Title = IddqVboxLOPost_a_iddq_PM4_VDD_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VDD"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "90"; }
            CallAfterSetup = __Expression { __String = "&Clear_CPU_Flag"; }
            ForcedVoltage = __Expression { __String = "VDD_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO*2"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&ConnectOpenPinList"; }
            PresetPatternMinorID = __Expression { __String = "100"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[11] = {
        __Title = IddqVboxLOPost_a_iddq_PM5_VDD_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VDD"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "90"; }
            CallAfterSetup = __Expression { __String = "&Clear_CPU_Flag"; }
            ForcedVoltage = __Expression { __String = "VDD_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO*2"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&ConnectOpenPinList"; }
            PresetPatternMinorID = __Expression { __String = "100"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[12] = {
        __Title = IddqVboxLOPost_a_iddq_PM6_VDD_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VDD"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "90"; }
            CallAfterSetup = __Expression { __String = "&Clear_CPU_Flag"; }
            ForcedVoltage = __Expression { __String = "VDD_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO*2"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&ConnectOpenPinList"; }
            PresetPatternMinorID = __Expression { __String = "100"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[13] = {
        __Title = IddqVboxLOPost_a_iddq_PM7_VDD_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VDD"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "90"; }
            CallAfterSetup = __Expression { __String = "&Clear_CPU_Flag"; }
            ForcedVoltage = __Expression { __String = "VDD_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO*2"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&ConnectOpenPinList"; }
            PresetPatternMinorID = __Expression { __String = "100"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[14] = {
        __Title = IddqVboxLOPost_a_iddq_PM8_VDD_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VDD"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "90"; }
            CallAfterSetup = __Expression { __String = "&Clear_CPU_Flag"; }
            ForcedVoltage = __Expression { __String = "VDD_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO*2"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&ConnectOpenPinList"; }
            PresetPatternMinorID = __Expression { __String = "100"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[15] = {
        __Title = IddqVboxLOPost_a_iddq_PM9_VDD_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VDD"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "90"; }
            CallAfterSetup = __Expression { __String = "&Clear_CPU_Flag"; }
            ForcedVoltage = __Expression { __String = "VDD_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO*2"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&ConnectOpenPinList"; }
            PresetPatternMinorID = __Expression { __String = "100"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[16] = {
        __Title = IddqVboxLOPost_a_iddq_PM10_VDD_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VDD"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "90"; }
            CallAfterSetup = __Expression { __String = "&Clear_CPU_Flag"; }
            ForcedVoltage = __Expression { __String = "VDD_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO*2"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&ConnectOpenPinList"; }
            PresetPatternMinorID = __Expression { __String = "100"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[17] = {
        __Title = IddqVboxLOPost_a_iddq_PM11_VDD_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VDD"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "90"; }
            CallAfterSetup = __Expression { __String = "&Clear_CPU_Flag"; }
            ForcedVoltage = __Expression { __String = "VDD_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO*2"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&ConnectOpenPinList"; }
            PresetPatternMinorID = __Expression { __String = "100"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[18] = {
        __Title = IddqVboxLOPost_a_iddq_PM12_VDD_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VDD"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "90"; }
            CallAfterSetup = __Expression { __String = "&Clear_CPU_Flag"; }
            ForcedVoltage = __Expression { __String = "VDD_PS"; }
            MaxAllowedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO*2"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VDD_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VDD_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&ConnectOpenPinList"; }
            PresetPatternMinorID = __Expression { __String = "100"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test pb_iddq_ret_chkr_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_LooseVmask;
    __Entry[1] = PowerUpAtVmask;
    __Entry[2] = Iddq_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = JTAG_Reset_LDO_Bypass;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ldo_bypass_JTAG_reset_DSH_Thrd'"; }
            MinorID = __Expression { __String = "110"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = ret_chkr_func_verify;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'pb_iddq_ret_chkr_NoPM_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = JTAG_Reset_LDO_Bypass_1;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ldo_bypass_JTAG_reset_DSH_Thrd'"; }
            MinorID = __Expression { __String = "110"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[3] = {
        __Title = IddqVboxLOPost_ret_chkr_PM1_VNWA_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VNWA"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "10"; }
            ForcedVoltage = __Expression { __String = "VNWA_PS"; }
            MaxAllowedCurrent = __Expression { __String = "2mA"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VNWA_VBOXLO*2*0"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VNWA_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            PresetTestPins = __Expression { __String = "DSH_PL"; }
            PresetPatterns = __Expression { __String = "'pb_iddq_ret_chkr_Thrd'"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VNWA_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VNWA_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&Clear_CPU_Flag"; }
            PresetPatternMinorID = __Expression { __String = "20"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}

__Test pb_iddq_ret_invchkr_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_LooseVmask;
    __Entry[1] = PowerUpAtVmask;
    __Entry[2] = Iddq_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = JTAG_Reset_LDO_Bypass;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ldo_bypass_JTAG_reset_DSH_Thrd'"; }
            MinorID = __Expression { __String = "110"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = ret_invchkr_func_verify;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'pb_iddq_ret_invchkr_NoPM_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = JTAG_Reset_LDO_Bypass_1;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ldo_bypass_JTAG_reset_DSH_Thrd'"; }
            CallAtEnd = __Expression { __String = "&Clear_CPU_Flag"; }
            MinorID = __Expression { __String = "110"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[3] = {
        __Title = IddqVboxLOPost_ret_invchkr_PM1_VNWA_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VNWA"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "10"; }
            ForcedVoltage = __Expression { __String = "VNWA_PS"; }
            MaxAllowedCurrent = __Expression { __String = "2mA"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VNWA_VBOXLO*2*0"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VNWA_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            PresetTestPins = __Expression { __String = "DSH_PL"; }
            PresetPatterns = __Expression { __String = "'pb_iddq_ret_invchkr_Thrd'"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VNWA_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VNWA_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&Clear_CPU_Flag"; }
            PresetPatternMinorID = __Expression { __String = "20"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}

__Test pb_iddq_ret_ones_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_LooseVmask;
    __Entry[1] = PowerUpAtVmask;
    __Entry[2] = Iddq_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = JTAG_Reset_LDO_Bypass;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ldo_bypass_JTAG_reset_DSH_Thrd'"; }
            MinorID = __Expression { __String = "110"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = ret_ones_func_verify;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'pb_iddq_ret_ones_NoPM_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = JTAG_Reset_LDO_Bypass_1;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ldo_bypass_JTAG_reset_DSH_Thrd'"; }
            MinorID = __Expression { __String = "110"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[3] = {
        __Title = IddqVboxLOPost_ret_ones_PM1_VNWA_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VNWA"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "10"; }
            ForcedVoltage = __Expression { __String = "VNWA_PS"; }
            MaxAllowedCurrent = __Expression { __String = "2mA"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VNWA_VBOXLO*2*0"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VNWA_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            PresetTestPins = __Expression { __String = "DSH_PL"; }
            PresetPatterns = __Expression { __String = "'pb_iddq_ret_ones_Thrd'"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VNWA_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VNWA_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&Clear_CPU_Flag"; }
            PresetPatternMinorID = __Expression { __String = "20"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}

__Test pb_iddq_ret_zeroes_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_LooseVmask;
    __Entry[1] = PowerUpAtVmask;
    __Entry[2] = Iddq_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = JTAG_Reset_LDO_Bypass;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ldo_bypass_JTAG_reset_DSH_Thrd'"; }
            MinorID = __Expression { __String = "110"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = ret_zeroes_func_verify;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'pb_iddq_ret_zeroes_NoPM_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = JTAG_Reset_LDO_Bypass_1;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ldo_bypass_JTAG_reset_DSH_Thrd'"; }
            MinorID = __Expression { __String = "110"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[3] = {
        __Title = IddqVboxLOPost_ret_zeroes_PM1_VNWA_st;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = LTXC::PowerTest;
            TestPins = __Expression { __String = "VNWA"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "10"; }
            ForcedVoltage = __Expression { __String = "VNWA_PS"; }
            MaxAllowedCurrent = __Expression { __String = "2mA"; }
            MinAllowedCurrent = __Expression { __String = "IDDQ_MIN_VNWA_VBOXLO*2*0"; }
            MaxExpectedCurrent = __Expression { __String = "IDDQ_MAX_VNWA_VBOXLO*2"; }
            MeasurementDelay = __Expression { __String = "300mS"; }
            MethodOfTest = __Expression { __String = "POWER_TEST_METHOD_ENUM:STATIC"; }
            ComparePath = __Expression { __String = "DIGITAL_CMP_PATH:DIGITAL_CMP_VOH"; }
            EdgeType = __Expression { __String = "EDGE_TYPE:EDGE_RISING"; }
            TriggerMode = __Expression { __String = "DIGITAL_TRIGGER_MODE:DIGITAL_TRIGGER_PULSE"; }
            PresetTestPins = __Expression { __String = "DSH_PL"; }
            PresetPatterns = __Expression { __String = "'pb_iddq_ret_zeroes_Thrd'"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            SetupRangeAfterPreset = __Expression { __String = "FALSE"; }
            CallAfterPreset = __Expression { __String = "&DisconnectOpenPinList"; }
            LowLimit = __Expression { __String = "IDDQ_MIN_VNWA_VBOXLO"; }
            HighLimit = __Expression { __String = "IDDQ_MAX_VNWA_VBOXLO"; }
            CallAtEnd = __Expression { __String = "&Clear_CPU_Flag"; }
            PresetPatternMinorID = __Expression { __String = "20"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            MeasurementAverages = __Expression { __String = "5"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
}
__Test FlashEfuse_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = FlashEfuse_func;
        }
    }
}
__Test MainBG_Trim_T {
    __Entry[0] = PowerCycleVmask_FC;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = jtag_reset_1;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "o_cpu_fail_47"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'jtag_reset_init_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "TRUE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = ldo_bypass_1;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "o_cpu_fail_47"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ldo_bypass_init_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "TRUE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = Block3;
        __TestMethod {
            __Name = MainBG_Trim_func;
        }
    }
}
__Test VBOXLO_MEMORY_PG_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = VBOXLO_MEMORY_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'VBOXLO_MEMORY_PG_Thrd'"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test VBOXLO_MEMORY_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = VBOXLO_MEMORY_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = a_st_tk_1_v22;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "RunAllTests"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'VBOXLO_MEMORY_PG_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_ATPG_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
__Test InitVars {
    __PortExpression[0] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = InitializeFuseROMVariables;
        }
    }
}
__Test EraseRefArray_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = ldo_bypass_1_2;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "o_cpu_fail_47"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ldo_bypass_init_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "TRUE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = Block1;
        __TestMethod {
            __Name = EraseRefArray_func;
        }
    }
}
__Test IrefPMOS_Trim_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = IrefPMOS_Trim_func;
        }
    }
}
__Test FOSC_VCO_Vmin_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = FOSC_VCO_Vmin_func;
        }
    }
}
__Test VReadBuf_Vmin_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = VReadBUF_Vmin_func;
        }
    }
}
__Test VReadBuf_Vmax_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = VReadBUF_Vmax_func;
        }
    }
}
__Test TP1TP2_Leak_Pre_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = TP1TP2_Leak_Pre_func;
        }
    }
}
__Test Pump_VHV_Stress_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = Pump_VHV_Stress_func;
        }
    }
}
__Test TP1TP2_Leak_Pst_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = TP1TP2_Leak_Pst_func;
        }
    }
}
__Test IPMOS_Read_Vnom_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = IPMOS_Read_Vnom_func;
        }
    }
}
__Test IPMOS_Pvfy_Vnom_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = IPMOS_Pvfy_Vnom_func;
        }
    }
}
__Test IPMOS_Evfy_Vnom_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = IPMOS_Evfy_Vnom_func;
        }
    }
}
__Test IPMOS_Cvfy_Vnom_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = IPMOS_Cvfy_Vnom_func;
        }
    }
}
__Test Iref_Read_Vnom_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = Iref_Read_Vnom_func;
        }
    }
}
__Test Iref_Pvfy_Vnom_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = Iref_Pvfy_Vnom_func;
        }
    }
}
__Test Iref_Evfy_Vnom_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = Iref_Evfy_Vnom_func;
        }
    }
}
__Test Iref_Cvfy_Vnom_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = Iref_Cvfy_Vnom_func;
        }
    }
}
__Test SA_Iref_NoLoad_Read_Vmin_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = SA_Iref_NoLoad_Read_Vmin_func;
        }
    }
}
__Test IWLDRV_Prog_Vmin_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block2;
        __TestMethod {
            __Name = IWLDRV_Prog_Vmin_func;
        }
    }
}
__Test WLS_Leak_Vmax_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = WLS_Leak_Vmax_func;
        }
    }
}
__Test BLS_Leak_Vmax_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = BLS_Leak_Vmax_func;
        }
    }
}
__Test EGCG_Leak_Vmax_T {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test CGS_Leak_Vmax_T {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test EGCSS_Leak_Vmax_T {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test EGS_Leak_Vmax_T {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}

__Test Iref_RM01_Vnom_T {
    __Entry[0] = PowerUpAtVmask;
    __Entry[1] = DCsetup_LooseVmask;
    __Entry[2] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = Iref_RM01_Vnom_func;
        }
    }
}

/**********************************************************/
/**********************************************************/
/**                                                      **/
/**             Begin BJP f021 Flash Tests               **/
/**                                                      **/
/**********************************************************/
/**********************************************************/

__Test Pump_Leak_Vmax_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Pump_Leak_Vmax;
        __TestMethod {
            __Name = Pump_Leak_Vmax_func;
        }
    }
}
__Test EGCG_Leak_Vmax_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = EGCG_Leak_Vmax;
        __TestMethod {
            __Name = EGCG_Leak_Vmax_func;
        }
    }
}
__Test CGS_Leak_Vmax_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = CGS_Leak_Vmax;
        __TestMethod {
            __Name = CGS_Leak_Vmax_func;
        }
    }
}
__Test EGCSS_Leak_Vmax_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = EGCSS_Leak_Vmax;
        __TestMethod {
            __Name = EGCSS_Leak_Vmax_func;
        }
    }
}
__Test EGS_LEAK_VMAX_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = EGS_Leak_Vmax;
        __TestMethod {
            __Name = EGS_Leak_Vmax_func;
        }
    }
}
__Test Flash_Cycle1X_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Flash_Cycle1X;
        __TestMethod {
            __Name = Flash_Cycle1X_func;
        }
    }
}
__Test Flash_Cycle1X_Pgm_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Flash_Cycle1X_Pgm;
        __TestMethod {
            __Name = Flash_Cycle1X_Pgm_func;
        }
    }
}
__Test RdM1_PstCycle1X_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdM1_PstCycle1X;
        __TestMethod {
            __Name = RdM1_PstCycle1X_func;
        }
    }
}
__Test PgmMain_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PgmMain;
        __TestMethod {
            __Name = PgmMain_func;
        }
    }
}
__Test RdM0_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdM0;
        __TestMethod {
            __Name = RdM0_func;
        }
    }
}
__Test BankErs_PreThinOxide_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = BankErs_PreThinOxide;
        __TestMethod {
            __Name = BankErs_PreThinOxide_func;
        }
    }
}
__Test ErsOTP_PreThinOxide_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = ErsOTP_PreThinOxide;
        __TestMethod {
            __Name = ErsOTP_PreThinOxide_func;
        }
    }
}
__Test PreThinOxideVT1_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PreThinOxideVT1;
        __TestMethod {
            __Name = PreThinOxideVT1_func;
        }
    }
}
__Test PreThinOxideVT1OTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PreThinOxideVT1OTP;
        __TestMethod {
            __Name = PreThinOxideVT1OTP_func;
        }
    }
}
__Test ThinOxide_Stress_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = ThinOxide_Stress;
        __TestMethod {
            __Name = ThinOxide_Stress_func;
        }
    }
}
__Test PstThinOxideVT1_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PstThinOxideVT1;
        __TestMethod {
            __Name = PstThinOxideVT1_func;
        }
    }
}
__Test PstThinOxideVT1OTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PstThinOxideVT1OTP;
        __TestMethod {
            __Name = PstThinOxideVT1OTP_func;
        }
    }
}
__Test ThinOxideVt1Delta_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = ThinOxideVt1Delta;
        __TestMethod {
            __Name = TunOxideVT1Delta_func;
        }
    }
}
__Test ThinOxideVt1DeltaOTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = ThinOxideVt1DeltaOTP;
        __TestMethod {
            __Name = ThinOxideVT1DeltaOTP_func;
        }
    }
}
__Test BankErs_PrePunchThru_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = BankErs_PrePunchThru;
        __TestMethod {
            __Name = BankErs_PrePunchThru_func;
        }
    }
}
__Test ErsOTP_PrePunchThru_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = ErsOTP_PrePunchThru;
        __TestMethod {
            __Name = ErsOTP_PrePunchThru_func;
        }
    }
}
__Test PrePunchThruVT1_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PrePunchThruVT1;
        __TestMethod {
            __Name = PrePunchThruVT1_func;
        }
    }
}
__Test PrePunchThruVT1OTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PrePunchThruVT1OTP;
        __TestMethod {
            __Name = PrePunchThruVT1OTP_func;
        }
    }
}
__Test PunchThru_Stress_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PunchThru_Stress;
        __TestMethod {
            __Name = PunchThru_Stress_func;
        }
    }
}
__Test PstPunchThruVT1_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PstPunchThruVT1;
        __TestMethod {
            __Name = PstPunchThruVT1_func;
        }
    }
}
__Test PstPunchThruVT1OTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PstPunchThruVT1OTP;
        __TestMethod {
            __Name = PstPunchThruVT1OTP_func;
        }
    }
}
__Test PunchThruVT1Delta_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PunchThruVT1Delta;
        __TestMethod {
            __Name = PunchThruVT1Delta_func;
        }
    }
}
__Test PunchThruVT1DeltaOTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PunchThruVT1DeltaOTP;
        __TestMethod {
            __Name = PunchThruVT1DeltaOTP_func;
        }
    }
}
__Test RevTunnel_Stress_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RevTunnel_Stress;
        __TestMethod {
            __Name = RevTunnel_Stress_func;
        }
    }
}
__Test PstRevTunVT1_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PstRevTunVT1;
        __TestMethod {
            __Name = PstRevTunVT1_func;
        }
    }
}
__Test PstRevTunVT1OTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PstRevTunVT1OTP;
        __TestMethod {
            __Name = PstRevTunVT1OTP_func;
        }
    }
}
__Test RevTunVT1Delta_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RevTunVT1Delta;
        __TestMethod {
            __Name = RevTunVT1Delta_func;
        }
    }
}
__Test RevTunVT1DeltaOTP_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RevTunVT1DeltaOTP;
        __TestMethod {
            __Name = RevTunVT1DeltaOTP_func;
        }
    }
}
__Test PgmMain_PreCSFG_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PgmMain_PreCSFG;
        __TestMethod {
            __Name = PgmMain_PreCSFG_func;
        }
    }
}
__Test RdM0_PreCSFG_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdM0_PreCSFG;
        __TestMethod {
            __Name = RdM0_PreCSFG_func;
        }
    }
}
__Test PgmOTP_PreCSFG_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PgmOTP_PreCSFG;
        __TestMethod {
            __Name = PgmOTP_PreCSFG_func;
        }
    }
}
__Test RdM0OTP_PreCSFG_func_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = RdM0OTP_PreCSFG;
        __TestMethod {
            __Name = RdM0OTP_PreCSFG_func;
        }
    }
}

/**********************************************************/
/**********************************************************/
/**                                                      **/
/**              End BJP f021 Flash Tests                **/
/**                                                      **/
/**********************************************************/
/**********************************************************/
