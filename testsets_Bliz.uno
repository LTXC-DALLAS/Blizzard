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
            __Name = LTXC::DCTest;
            TestPins = __Expression { __String = "OPEN_EVEN_PINS_GND+OPEN_ODD_PINS_GND-Probe_Only_Pins"; }
            TestLimitSource = __Expression { __String = "DC_LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "0"; }
            ForceValue = __Expression { __String = "-1mA"; }
            ForceRange = __Expression { __String = "-1mA"; }
            MeasureRange = __Expression { __String = "1V"; }
            LowLimit = __Expression { __String = "-1V"; }
            HighLimit = __Expression { __String = "-100mV"; }
            LowClamp = __Expression { __String = "-1.5V"; }
            HighClamp = __Expression { __String = "1.5V"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            MethodOfTest = __Expression { __String = "MEASURE_METHOD:MEASURE_PARALLEL"; }
            MakeBeforeBreakRelays = __Expression { __String = "VI_CONNECT_SEQUENCE:VI_MAKE_BEFORE_BREAK"; }
            PresetPatternMinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            MeasurementAverages = __Expression { __String = "1"; }
            OptimizationMethod = __Expression { __String = "OPTIMIZATION_METHOD:OPTIMIZE_FOR_SPEED"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            SimulatedPerPinMeasurements = __Expression { __String = "-400mV"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
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
        __TestMethod {
            __Name = LTXC::DCTest;
            TestPins = __Expression { __String = "OPEN_EVEN_PINS_GND-Probe_Only_Pins"; }
            TestLimitSource = __Expression { __String = "DC_LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "20"; }
            ForceValue = __Expression { __String = "-1mA"; }
            ForceRange = __Expression { __String = "-1mA"; }
            MeasureRange = __Expression { __String = "1V"; }
            LowLimit = __Expression { __String = "-1V"; }
            HighLimit = __Expression { __String = "-100mV"; }
            LowClamp = __Expression { __String = "-1.5V"; }
            HighClamp = __Expression { __String = "1.5V"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            MethodOfTest = __Expression { __String = "MEASURE_METHOD:MEASURE_PARALLEL"; }
            MakeBeforeBreakRelays = __Expression { __String = "VI_CONNECT_SEQUENCE:VI_MAKE_BEFORE_BREAK"; }
            PresetPatternMinorID = __Expression { __String = "30"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            MeasurementAverages = __Expression { __String = "1"; }
            OptimizationMethod = __Expression { __String = "OPTIMIZATION_METHOD:OPTIMIZE_FOR_SPEED"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            SimulatedPerPinMeasurements = __Expression { __String = "-400mV"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[3] = {
        __Title = Conty_DigOddPins;
        __WrapCells = __True;
        __TestMethod {
            __Name = LTXC::DCTest;
            TestPins = __Expression { __String = "OPEN_ODD_PINS_GND-Probe_Only_Pins"; }
            TestLimitSource = __Expression { __String = "DC_LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "40"; }
            ForceValue = __Expression { __String = "-1mA"; }
            ForceRange = __Expression { __String = "-1mA"; }
            MeasureRange = __Expression { __String = "1V"; }
            LowLimit = __Expression { __String = "-1V"; }
            HighLimit = __Expression { __String = "-100mV"; }
            LowClamp = __Expression { __String = "-1.5V"; }
            HighClamp = __Expression { __String = "1.5V"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            MethodOfTest = __Expression { __String = "MEASURE_METHOD:MEASURE_PARALLEL"; }
            MakeBeforeBreakRelays = __Expression { __String = "VI_CONNECT_SEQUENCE:VI_MAKE_BEFORE_BREAK"; }
            PresetPatternMinorID = __Expression { __String = "50"; }
            ShowAdditionalArgs = __Expression { __String = "TRUE"; }
            MeasurementAverages = __Expression { __String = "1"; }
            OptimizationMethod = __Expression { __String = "OPTIMIZATION_METHOD:OPTIMIZE_FOR_SPEED"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            DisableDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            SimulatedPerPinMeasurements = __Expression { __String = "-400mV"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
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
}
__Test ATPG_CPU_T {
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = SCAN_SA_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = ATPG_CPU;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_SA_PG_Thrd'"; }
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
__Test ATPG_CPU_Vmin {
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = SCAN_SA_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_SA_PG_Thrd'"; }
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

__Test ATPG_CPU_VboxHi {
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = SCAN_SA_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_SA_PG_Thrd'"; }
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

__Test SCAN_PATHDELAY_16_PG {
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = SCAN_PATHDELAY_16_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_16_PG_Thrd'"; }
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
__Test SCAN_PATHDELAY_1_PG {
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = SCAN_PATHDELAY_1_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Scan_PathDelay_1;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
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
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = SCAN_PATHDELAY_25_PG_PS;
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
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = SCAN_PATHDELAY_33_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Scan_PathDelay_33;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_33_PG_Thrd'"; }
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
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = SCAN_PATHDELAY_40_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_40_PG_Thrd'"; }
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
__Test BIST_PROD_PG {
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = BIST_PROD_PG_PS;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = BIST_Prod;
        __WrapCells = __True;
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'BIST_PROD_PG_Thrd'"; }
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
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = PBIST_2P_PROD_PG_PS;
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
        __Title = Blizzard_Calibration;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "FALSE"; }
        __TestMethod {
            __Name = LTXC::FocusCalibration;
            TestPins = __Expression { __String = "ALLPINS"; }
            CalibrationType = __Expression { __String = "FOCUS_CAL_TYPE_ENUM:CALIBRATE_TIMING"; }
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
    __Entry[1] = Flash_Shell_TestNum_SEQ;
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
        __EnableExpression = __Expression { __String = "FALSE"; }
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
    __Block[1] = {
        __Title = LoadTestNumber_0x10000000;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __ContinueOnFail = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::FuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'ShellB_Tnum0x00100000_Thrd'"; }
            MinorID = __Expression { __String = "40"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
        }
    }
    __Block[2] = {
        __Title = TPad2_MeasV_1_1;
        __WrapCells = __True;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::DCTest;
            TestPins = __Expression { __String = "FLTP2"; }
            TestLimitSource = __Expression { __String = "DC_LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS"; }
            MinorID = __Expression { __String = "50"; }
            ForceValue = __Expression { __String = "10nA"; }
            ForceRange = __Expression { __String = "10mA"; }
            MeasureRange = __Expression { __String = "2V"; }
            LowLimit = __Expression { __String = "1.174V -500mV"; }
            HighLimit = __Expression { __String = "1.271V+650mV"; }
            LowClamp = __Expression { __String = "0.1V"; }
            HighClamp = __Expression { __String = "2.5V"; }
            OverridePatternFails = __Expression { __String = "FALSE"; }
            MeasurementDelay = __Expression { __String = "10ms"; }
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
    __Block[3] = {
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
    __Block[4] = {
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
