Unison:U1.0c:S5.3;
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
__Test ATPG_CPU_Vmin {
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
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_25_PG_Thrd'"; }
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
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_33_1_PG_Thrd'"; }
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
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_33_2_PG_Thrd'"; }
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
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = VBOXLO_MEMORY_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PBIST_VBOXL_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'VBOXLO_MEMORY_PG_Thrd'"; }
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
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            SearchAxis = __Expression { __String = "&CharAxis_SrchVdd_Vmin_PBIST_VBOXL"; }
            SearchAlgorithm = __Expression { __String = "SEARCH_ALGORITHM:SEARCH_BINARY"; }
            StepResultFunction = __Expression { __String = "&PBIST_VBOXL_Srch_Fnctn"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
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
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = BIST_PROD_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = PBIST_1P_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'BIST_PROD_PG_Srch_Thrd'"; }
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
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = SCAN_PATHDELAY_1_PG_PS;
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
        __Title = BIST_PROD_FreqSearchPre_st;
        __WrapCells = __True;
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
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = PBIST_2P_PROD_PG_PS;
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
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = BIST_PROD_PG_PS;
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
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
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
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = SCAN_PATHDELAY_1_PG_PS;
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
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
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
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = BIST_PROD_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = FUNC_BIST_1_Freq_Search_Verify;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'BIST_PROD_PG_Thrd'"; }
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
        __TestMethod {
            __Name = LTXC::SearchTest;
            TestPerPin = __Expression { __String = "FALSE"; }
            TestLimitSource = __Expression { __String = "LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
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
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = PBIST_2P_PROD_PG_PS;
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
    __Entry[0] = DCsetup_allZero;
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
    __Entry[0] = DCsetup_allZero;
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
__Test Flash_FUNC_LoadShellAndTestNum_T {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = Flash_Shell_TestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = LoadRevBFlashShell;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'Flash_Load_RevBShell_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = LoadRevCFlashShell;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'Flash_Load_RevCShell_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = LoadTestNumber;
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'Flash_Load_TestNum_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
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

__Test FlashTestNum_T {
    __Mask[0] = DCSpecsMask;
    __Mask[1] = PSSpecsMask;
    __Mask[2] = ACSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Load_Flash_ShellC;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'FlashShellC_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[1] = {
        __Title = Load_Flash_ShellB;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'FlashShellB_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = LoadTestNumber_0x00100000;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'FlashTestNum_NoRPT1_Thrd'"; }
            MinorID = __Expression { __String = "20"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[3] = {
        __Title = LoadTestNumber_0x00200000;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'FlashTestNum_NoRPT2_Thrd'"; }
            MinorID = __Expression { __String = "30"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[4] = {
        __Title = LoadTestNumber_Blank;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'FlashTestNum_Thrd'"; }
            MinorID = __Expression { __String = "40"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[5] = {
        __Title = LoadTestNumber_0x10000000;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'FlashTestNum_0x10000000_Thrd'"; }
            MinorID = __Expression { __String = "40"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[6] = {
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
    __Block[7] = {
        __Title = TPad1_MeasV;
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
    __Block[8] = {
        __Title = TPad2_MeasV;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::DCTest;
            TestPins = __Expression { __String = "FLTP2"; }
            TestLimitSource = __Expression { __String = "DC_LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "50"; }
            ForceValue = __Expression { __String = "0.0A"; }
            ForceRange = __Expression { __String = "10mA"; }
            MeasureRange = __Expression { __String = "2V"; }
            LowLimit = __Expression { __String = "1.15V"; }
            HighLimit = __Expression { __String = "1.35V"; }
            LowClamp = __Expression { __String = "1.0V"; }
            HighClamp = __Expression { __String = "2.25V"; }
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
__Test FlashEfuse_func {
    __Entry[0] = DCsetup_Loose;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test F021_FlashConfig_test {
    __Mask[0] = PSSpecsMask;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = F021_FlashConfig;
        }
    }
}
__Test Pump_Iref_Vnom {
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = Pump_Iref_Vnom_func;
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
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = FlashTestNum_SEQ;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
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
            TestPatterns = __Expression { __String = "'FF_InitCheck_Thrd'"; }
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
            TestPatterns = __Expression { __String = "'FF_RunAutoload_ENG_Thrd'"; }
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
            TestPatterns = __Expression { __String = "'FF_CheckROM_Mg0_ENG_Thrd'"; }
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
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_VHV_Vmax {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_VSL_Vmin {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_VSL_Vmax {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_Vread_Vmin {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_Vread_Vmax {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_VSA5_Vmin {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_VSA5_Vmax {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_VWL_Vmin {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_VWL_Vmax {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_VCG2P5_Vmin {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_VCG2P5_Vmax {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_VINH_Vmin {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_VINH_Vmax {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_VHV2X_Vmin {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test Pump_VHV2X_Vmax {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
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
__Test PreTunOxideVT1_func_T{
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
__Test TunOxideStress_func_T {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test PstTunOxide_VT1_func_T {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test PstTunOxide_VT1OTP_func_T {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test TunOxide_VT1Delta_func_T {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
}
__Test TunOxide_VT1DeltaOTP_func_T {
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
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
