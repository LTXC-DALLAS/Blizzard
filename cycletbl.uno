Unison:U1.0c:S5.3;

/************************/
/***  Pattern Groups  ***/
/************************/
__PatternGroup TDLStdPatGrp {
    __SignalHeader DefaultSignalHeader ScanHeader1 ScanHeader2 ScanHeader3 allFuncPins EVASignalHeader;
}

        /***********************************************************/
        /***          TI TDL Default Waveform Table              ***/
        /***********************************************************/
        /***                                                     ***/
        /***  This is a default WaveformTable which supports the ***/
        /***  TI TDL character set. This default WaveformTable   ***/
        /***  should be in all test programs.                    ***/
        /***                                                     ***/
        /***********************************************************/

__WaveformTable TDLStdPatGrp TDLStdPatGrp {
    __Cell "TDLStdPatGrp.Pins-AIN10_183-OSC0_124-TCK_152-o_cpu_done_46" L/H NRZDrive {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn; __DriveData; }
        }
    }
    __Cell "TDLStdPatGrp.Pins" Y/S DriveNoCare {
        __Data 6/7;
        __Color 9/3;
        __Drive {
            __Waveform { __DriveOn; __DriveLow; }
        }
    }
    __Cell "AIN10_183+OSC0_124+TCK_152+o_cpu_done_46" L/C RZClk {
        __Data 6/7;
        __Color 8/4;
        __Drive {
            __Waveform { __DriveOn; __DriveData; __DriveLow; }
        }
    }
    __Cell "AIN10_183+OSC0_124+TCK_152+o_cpu_done_46" H NRZDriveClk {
        __Data 7;
        __Color 6;
        __Drive {
            __Waveform { __DriveOn; __DriveData; }
        }
    }
    __Cell "TDLStdPatGrp.Pins" 2 DoubleClk {
        __Data 7;
        __Color 4;
        __Drive {
            __Waveform { __DriveHigh; __DriveLow; __DriveHigh; __DriveLow; }
        }
    }
    __Cell "TDLStdPatGrp.Pins" D RZClk2 {
        __Data 7;
        __Color 4;
        __Drive {
            __Waveform { __DriveOn; __DriveHigh; __DriveLow; }
        }
    }
    __Cell "TDLStdPatGrp.Pins" 0/1/M ActiveStrbMsk {
        __Data 0/1/2;
        __Color 8/10/7;
        __Drive {
            __Waveform { __DriveOff; }
        }
        __Compare {
            __Waveform { __CompareData; }
        }
    }
    __Cell "TDLStdPatGrp.Pins" Z HighZStrb {
        __Data 2;
        __Color 4;
        __Drive {
            __Waveform { __DriveOff; }
        }
    }
    __Cell "TDLStdPatGrp.Pins" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __EntryState __DriveOn;
            __Waveform { }
        }
    }
    __Cell "ScanHeader1_PL+ScanHeader2_PL+ScanHeader3_PL" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
    }
    __Cell "ScanHeader1_PL+ScanHeader2_PL+ScanHeader3_PL" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
    }
    __Cell "TDLStdPatGrp.Pins" d DPM2CPM {
        __Data 3 __Other;
        __Color 3;
    }
    __Cell "TDLStdPatGrp.Pins" < CUSTOM_LT {
        __Data 6;
        __Color 6;
        __Drive {
            __Waveform { __DriveOn; __DriveHigh; __DriveLow; __DriveOff; }
        }
    }
    __Cell "TDLStdPatGrp.Pins" > CUSTOM_GT {
        __Data 7;
        __Color 7;
        __Drive {
            __Waveform { __DriveOn; __DriveHigh; __DriveLow; __DriveOff; }
        }
    }
}
__PatternSequence FUNC_BIST_PG_PS {
    __Thread[0] = FUNC_BIST_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT9 = { WFT9 } }
        __Row { TDLStdPatGrp, WFT23 = { WFT23 } }
        __Row { TDLStdPatGrp, WFT24 = { WFT24 } }
    }
    __AutoBasePeriod = __True;
}
__Thread FUNC_BIST_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = u0u1_8bit_mode_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = u0u4_8bit_mode_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = u0u5_8bit_mode_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = u0u2_8bit_mode_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = u0u3_8bit_mode_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = u0u6_8bit_mode_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = u0u7_8bit_mode_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ssi0_loopback_pll_b.ssi0_loopback_pll_b_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ssi1_loopback_pll_b.ssi1_loopback_pll_b_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ssi2_loopback_pll_b.ssi2_loopback_pll_b_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ssi3_loopback_pll_b.ssi3_loopback_pll_b_st"; }
    }
}
__PatternSequence FUNC_BIST_PG_1_PS {
    __Thread[0] = FUNC_BIST_PG_1_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT9 = { WFT9 } }
    }
    __AutoBasePeriod = __True;
}
__Thread FUNC_BIST_PG_1_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = u0u1_8bit_mode_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = u0u4_8bit_mode_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = u0u5_8bit_mode_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = u0u2_8bit_mode_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = u0u3_8bit_mode_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = u0u6_8bit_mode_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = u0u7_8bit_mode_DPM;
    }
}
__PatternSequence SCAN_IDDQ_1_PG_PS {
    __Thread[0] = SCAN_IDDQ_1_PG_Thrd;
    __AutoBasePeriod = __True;
}
__Thread SCAN_IDDQ_1_PG_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "pb_iddq_ret_chkr.pb_iddq_ret_chkr_st"; }
//    }
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "pb_iddq_ret_invchkr.pb_iddq_ret_invchkr_st"; }
//    }
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "pb_iddq_ret_ones.pb_iddq_ret_ones_st"; }
//    }
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "pb_iddq_ret_zeroes.pb_iddq_ret_zeroes_st"; }
//    }
}
__PatternSequence SCAN_IDDQ_PG_PS {
    __Thread[0] = SCAN_IDDQ_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT1 = { WFT1 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_IDDQ_PG_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "a_iddq.a_iddq"; }
//    }
}
__PatternSequence SCAN_PATHDELAY_1_PG_PS {
    __Thread[0] = SCAN_PATHDELAY_1_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT7 = { WFT7 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_PATHDELAY_1_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_1.a_tft_tk_80_80_1_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_2.a_tft_tk_80_80_2_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_3.a_tft_tk_80_80_3_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_4.a_tft_tk_80_80_4_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_5.a_tft_tk_80_80_5_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_6.a_tft_tk_80_80_6_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_8.a_tft_tk_80_80_8_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_9.a_tft_tk_80_80_9_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_10.a_tft_tk_80_80_10_st"; }
    }
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_11.a_tft_tk_80_80_11_st"; }
//    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_12.a_tft_tk_80_80_12_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_13.a_tft_tk_80_80_13_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_14.a_tft_tk_80_80_14_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_15.a_tft_tk_80_80_15_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_16.a_tft_tk_80_80_16_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_17.a_tft_tk_80_80_17_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_18.a_tft_tk_80_80_18_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_19.a_tft_tk_80_80_19_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_20.a_tft_tk_80_80_20_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_21.a_tft_tk_80_80_21_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_22.a_tft_tk_80_80_22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_23.a_tft_tk_80_80_23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_24.a_tft_tk_80_80_24_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_25.a_tft_tk_80_80_25_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_26.a_tft_tk_80_80_26_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_27.a_tft_tk_80_80_27_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_28.a_tft_tk_80_80_28_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_29.a_tft_tk_80_80_29_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_30.a_tft_tk_80_80_30_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_31.a_tft_tk_80_80_31_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_32.a_tft_tk_80_80_32_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_33.a_tft_tk_80_80_33_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_34.a_tft_tk_80_80_34_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_35.a_tft_tk_80_80_35_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_36.a_tft_tk_80_80_36_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_37.a_tft_tk_80_80_37_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_38.a_tft_tk_80_80_38_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_39.a_tft_tk_80_80_39_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_40.a_tft_tk_80_80_40_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_41.a_tft_tk_80_80_41_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_42.a_tft_tk_80_80_42_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_43.a_tft_tk_80_80_43_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_44.a_tft_tk_80_80_44_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_45.a_tft_tk_80_80_45_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_46.a_tft_tk_80_80_46_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_47.a_tft_tk_80_80_47_st"; }
    }
}
__PatternSequence SCAN_PATHDELAY_PG_PS {
    __Thread[0] = SCAN_PATHDELAY_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT3 = { WFT3 } }
        __Row { TDLStdPatGrp, WFT4 = { WFT4 } }
        __Row { TDLStdPatGrp, WFT5 = { WFT5 } }
        __Row { TDLStdPatGrp, WFT6 = { WFT6 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_PATHDELAY_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_16_16_2.a_tft_tk_16_16_2_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_16_16_3.a_tft_tk_16_16_3_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_25_25_1.a_tft_tk_25_25_1_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_33_33_1.a_tft_tk_33_33_1_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_33_33_2.a_tft_tk_33_33_2_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_40_40_1.a_tft_tk_40_40_1_st"; }
    }
}
__PatternSequence SCAN_PATHDELAY_16_PG_PS {
    __Thread[0] = SCAN_PATHDELAY_16_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT3 = { WFT3 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_PATHDELAY_16_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_16_16_2.a_tft_tk_16_16_2_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_16_16_3.a_tft_tk_16_16_3_st"; }
    }
}

__PatternSequence SCAN_PATHDELAY_25_PG_PS {
    __Thread[0] = SCAN_PATHDELAY_25_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT4 = { WFT4 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_PATHDELAY_25_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_25_25_1.a_tft_tk_25_25_1_st"; }
    }
}
__PatternSequence SCAN_PATHDELAY_33_PG_PS {
    __Thread[0] = SCAN_PATHDELAY_33_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT5 = { WFT5 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_PATHDELAY_33_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_33_33_1.a_tft_tk_33_33_1_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_33_33_2.a_tft_tk_33_33_2_st"; }
    }
}
__PatternSequence SCAN_PATHDELAY_40_PG_PS {
    __Thread[0] = SCAN_PATHDELAY_40_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT6 = { WFT6 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_PATHDELAY_40_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_40_40_1.a_tft_tk_40_40_1_st"; }
    }
}

__PatternSequence SCAN_PATHDELAY_80_PG_PS {
    __Thread[0] = SCAN_PATHDELAY_80_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT2 = { WFT2 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_PATHDELAY_80_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_1.a_tft_tk_80_80_1_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_2.a_tft_tk_80_80_2_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_3.a_tft_tk_80_80_3_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_4.a_tft_tk_80_80_4_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_5.a_tft_tk_80_80_5_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_6.a_tft_tk_80_80_6_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_8.a_tft_tk_80_80_8_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_9.a_tft_tk_80_80_9_st"; }
    }
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_11.a_tft_tk_80_80_11_st"; }
//    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_12.a_tft_tk_80_80_12_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_13.a_tft_tk_80_80_13_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_14.a_tft_tk_80_80_14_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_15.a_tft_tk_80_80_15_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_16.a_tft_tk_80_80_16_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_17.a_tft_tk_80_80_17_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_18.a_tft_tk_80_80_18_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_19.a_tft_tk_80_80_19_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_21.a_tft_tk_80_80_21_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_22.a_tft_tk_80_80_22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_23.a_tft_tk_80_80_23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_24.a_tft_tk_80_80_24_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_25.a_tft_tk_80_80_25_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_26.a_tft_tk_80_80_26_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_27.a_tft_tk_80_80_27_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_28.a_tft_tk_80_80_28_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_29.a_tft_tk_80_80_29_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_31.a_tft_tk_80_80_31_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_32.a_tft_tk_80_80_32_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_33.a_tft_tk_80_80_33_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_34.a_tft_tk_80_80_34_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_35.a_tft_tk_80_80_35_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_36.a_tft_tk_80_80_36_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_37.a_tft_tk_80_80_37_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_38.a_tft_tk_80_80_38_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_39.a_tft_tk_80_80_39_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_41.a_tft_tk_80_80_41_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_42.a_tft_tk_80_80_42_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_43.a_tft_tk_80_80_43_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_44.a_tft_tk_80_80_44_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_45.a_tft_tk_80_80_45_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_46.a_tft_tk_80_80_46_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_47.a_tft_tk_80_80_47_st"; }
    }
}


__PatternSequence SCAN_SA_PG_PS {
    __Thread[0] = SCAN_SA_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT1 = { WFT1 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_SA_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_1_v22.a_st_tk_1_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_2_v22.a_st_tk_2_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_3_v22.a_st_tk_3_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_4_v22.a_st_tk_4_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_5_v22.a_st_tk_5_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_6_v22.a_st_tk_6_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_7_v22.a_st_tk_7_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_8_v22.a_st_tk_8_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_9_v22.a_st_tk_9_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_10_v22.a_st_tk_10_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_12_v22.a_st_tk_12_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_13_v22.a_st_tk_13_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_14_v22.a_st_tk_14_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_15_v22.a_st_tk_15_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_16_v22.a_st_tk_16_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_17_v22.a_st_tk_17_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_18_v22.a_st_tk_18_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_19_v22.a_st_tk_19_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_20_v22.a_st_tk_20_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_21_v22.a_st_tk_21_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_fles_1_v22.a_st_tk_fles_1_v22_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_fles_2_v22.a_st_tk_fles_2_v22_st"; }
    }
}
/***********************************************************************************************/
/**                This thread and pattern sequence created for debug purposes                **/
/***********************************************************************************************/
//Might need to add jtag patterns to this thread.  
__PatternSequence pb_pb_mapcol_1p_PS {
    __Thread[0] = pb_pb_mapcol_1p_Thrd;
    __Thread[1] = pb_pb_mapcol_1p_SH2_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT17_eng = { WFT17_eng } }
    }
    __AutoBasePeriod = __True;
}
__Thread pb_pb_mapcol_1p_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_mapcol_1p_ENG.pb_pb_mapcol_1p_ENG_st"; }
    }
}
//Might need to add jtag patterns to this thread.  
__PatternSequence pb_pb_mapcol_1p_SH2_PS {
    __Thread[0] = pb_pb_mapcol_1p_SH2_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT17_eng = { WFT17_eng } }
    }
    __AutoBasePeriod = __True;
}
__Thread pb_pb_mapcol_1p_SH2_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "pb_pb_mapcol_1p_ENG_SH2.pb_pb_mapcol_1p_ENG_SH2_st"; }
//    }
}

/***********************************************************************************************/
/**          Preceeding thread and pattern sequence created for debug purposes                **/
/***********************************************************************************************/

__PatternSequence BIST_PROD_PG_PS {
    __Thread[0] = BIST_PROD_PG_Thrd;
    __Thread[1] = BIST_PROD_PG_Srch_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT17 = { WFT17 } }
    }
    __AutoBasePeriod = __True;
}
__Thread BIST_PROD_PG_Srch_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_march13n_1p_DPM.pb_pb_march13n_1p_DPM_st"; }
    }
}
__Thread BIST_PROD_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_down2_1p_DPM.pb_pb_down2_1p_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_dtxn2_1p_DPM.pb_pb_dtxn2_1p_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_flip10_1p_DPM.pb_pb_flip10_1p_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_ftr_DPM.pb_pb_ftr_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_mapcol_1p_DPM.pb_pb_mapcol_1p_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_march13n_1p_DPM.pb_pb_march13n_1p_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_pmos_open_1p_v22_DPM.pb_pb_pmos_open_1p_v22_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_precharge_1p_DPM.pb_pb_precharge_1p_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_ptr_DPM.pb_pb_ptr_DPM_st"; }
    }
}

__PatternSequence PBIST_2P_PROD_PG_PS {
    __Thread[0] = PBIST_2P_PROD_PG_Thrd;
    __Thread[1] = PBIST_2P_PROD_PG_Srch_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT18 = { WFT18 } }
    }
    __AutoBasePeriod = __True;
}
__Thread PBIST_2P_PROD_PG_Srch_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_march13n_2p_DPM.pb_pb_march13n_2p_DPM_st"; }
    }
}
__Thread PBIST_2P_PROD_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_down2_2p_DPM.pb_pb_down2_2p_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_dtxn2_2p_DPM.pb_pb_dtxn2_2p_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_flip10_2p_DPM.pb_pb_flip10_2p_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_mapcol_2p_DPM.pb_pb_mapcol_2p_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_march13n_2p_DPM.pb_pb_march13n_2p_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_pmos_open_2p_DPM.pb_pb_pmos_open_2p_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_precharge_2p_DPM.pb_pb_precharge_2p_DPM_st"; }
    }
}

__PatternSequence BURNIN_PG_PS {
    __Thread[0] = BURNIN_PG_Thrd;
    __AutoBasePeriod = __True;
}
__Thread BURNIN_PG_Thrd {
}
__PatternSequence VBOXLO_MEMORY_PG_PS {
    __Thread[0] = VBOXLO_MEMORY_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT19 = { WFT19 } }
        __Row { TDLStdPatGrp, WFT20 = { WFT20 } }
    }
    __AutoBasePeriod = __True;
}
__Thread VBOXLO_MEMORY_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_down2_1p_v23.pb_vl_down2_1p_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_down2_2p_v23.pb_vl_down2_2p_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_dtxn2_1p_v23.pb_vl_dtxn2_1p_v23_st"; }
    }
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "pb_vl_dtxn2_2p_v23.pb_vl_dtxn2_2p_v23_st"; }
//    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_flip10_1p_v23.pb_vl_flip10_1p_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_ftr_read_v23.pb_vl_ftr_read_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_map_col_1p_v23.pb_vl_map_col_1p_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_map_col_2p_v23.pb_vl_map_col_2p_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_march13n_1p_v23.pb_vl_march13n_1p_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_march13n_2p_v23.pb_vl_march13n_2p_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_pmos_open_1p_v23.pb_vl_pmos_open_1p_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_pmos_open_2p_v23.pb_vl_pmos_open_2p_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_precharge_1p_v23.pb_vl_precharge_1p_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_precharge_2p_v23.pb_vl_precharge_2p_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_ptr_read_v23.pb_vl_ptr_read_v23_st"; }
    }
}

__PatternSequence ANALOG_FSUSB_PUPD_100_SEQ {
    __AutoBasePeriod = __True;
}

__PatternSequence ANALOG_TRIM_TRIM_100_SEQ {
    __AutoBasePeriod = __True;
}

__PatternSequence ANALOG_USB_CHG_100_SEQ {
    __AutoBasePeriod = __True;
}

__PatternSequence ANALOG_USB_OTG_100_SEQ {
    __AutoBasePeriod = __True;
}

__PatternSequence BIST_MEMORY_VBOXLO_33_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncGated"; __Type = Drv:; }
        }
    }
}

__PatternSequence BIST_PROD_33_1_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncGated"; __Type = Drv:; }
        }
    }
}

__PatternSequence BIST_PROD_33_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncGated"; __Type = Drv:; }
        }
    }
}

__PatternSequence BURNIN_200_SEQ {
    __AutoBasePeriod = __True;
}

__PatternSequence DC_PARA_100_SEQ {
    __AutoBasePeriod = __True;
}

__PatternSequence DIAG_VHI_200_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncGated"; __Type = Drv:; }
        }
    }
}

__PatternSequence DIAG_VLO_200_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncGated"; __Type = Drv:; }
        }
    }
}

__PatternSequence FFDieIDProg_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncGated"; __Type = Drv:; }
        }
    }
}

__PatternSequence FUNC_GROS_100_1_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncGated"; __Type = Drv:; }
        }
    }
}

__PatternSequence FUNC_GROS_100_2_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncGated"; __Type = Drv:; }
        }
    }
}

__PatternSequence FUNC_GROS_100_3_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncGated"; __Type = Drv:; }
        }
    }
}

__PatternSequence FUNC_GROS_100_4_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncGated"; __Type = Drv:; }
        }
    }
}

__PatternSequence FUNC_GROS_100_SEQ {
    __AutoBasePeriod = __True;
}

__PatternSequence FUNC_GROS_166p66_SEQ {
    __AutoBasePeriod = __True;
}

__PatternSequence FUNC_SCAN_AC_50_1_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncFreeRun"; __Type = Drv:; }
        }
    }
}

__PatternSequence FUNC_SCAN_AC_50_2_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncFreeRun"; __Type = Drv:; }
        }
    }
}

__PatternSequence FUNC_SCAN_AC_50_3_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncFreeRun"; __Type = Drv:; }
        }
    }
}

__PatternSequence FUNC_SCAN_AC_50_4_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncFreeRun"; __Type = Drv:; }
        }
    }
}

__PatternSequence FUNC_SCAN_AC_50_5_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncFreeRun"; __Type = Drv:; }
        }
    }
}

__PatternSequence FUNC_SCAN_AC_50_SEQ {
    __AutoBasePeriod = __True;
}

__PatternSequence Iddq_PM01_SEQ {
    __AutoBasePeriod = __True;
}
/**Used for Vmin Search**/
__PatternSequence Iddq_PM02_SEQ {
    __Thread[0] = Iddq_PM02_pb_iddq_ret_chkr_Thrd;
    __Thread[1] = Iddq_PM02_pb_iddq_ret_chkr_v23_Thrd;
    __Thread[2] = Iddq_PM02_pb_iddq_ret_invchkr_Thrd;
    __Thread[3] = Iddq_PM02_pb_iddq_ret_invchkr_v23_Thrd;
    __Thread[4] = Iddq_PM02_pb_iddq_ret_ones_Thrd;
    __Thread[5] = Iddq_PM02_pb_iddq_ret_ones_v23_Thrd;
    __Thread[6] = Iddq_PM02_pb_iddq_ret_zeroes_Thrd;
    __Thread[7] = Iddq_PM02_pb_iddq_ret_zeroes_v23_Thrd;
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncGated"; __Type = Drv:; }
        }
    }
}
__Thread Iddq_PM02_pb_iddq_ret_chkr_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "pb_iddq_ret_chkr.pb_iddq_ret_chkr_st"; }
//    }
}
__Thread Iddq_PM02_pb_iddq_ret_chkr_v23_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "pb_iddq_ret_chkr_v23.pb_iddq_ret_chkr_v23_st"; }
//    }
}
__Thread Iddq_PM02_pb_iddq_ret_invchkr_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "pb_iddq_ret_invchkr.pb_iddq_ret_invchkr_st"; }
//    }
}
__Thread Iddq_PM02_pb_iddq_ret_invchkr_v23_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "pb_iddq_ret_invchkr_v23.pb_iddq_ret_invchkr_v23_st"; }
//    }
}
__Thread Iddq_PM02_pb_iddq_ret_ones_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "pb_iddq_ret_ones.pb_iddq_ret_ones_st"; }
//    }
}
__Thread Iddq_PM02_pb_iddq_ret_ones_v23_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "pb_iddq_ret_ones_v23.pb_iddq_ret_ones_v23_st"; }
//    }
}
__Thread Iddq_PM02_pb_iddq_ret_zeroes_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "pb_iddq_ret_zeroes.pb_iddq_ret_zeroes_st"; }
//    }
}
__Thread Iddq_PM02_pb_iddq_ret_zeroes_v23_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "pb_iddq_ret_zeroes_v23.pb_iddq_ret_zeroes_v23_st"; }
//    }
}
__PatternSequence Iddq_SEQ {
    __AutoBasePeriod = __True;
}

__PatternSequence LeakIO_SEQ {
    __AutoBasePeriod = __True;
}

__PatternSequence Read_Mg0_100_SEQ {
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; __Type = PIN; }
            __Direction = __Expression { __String = "Dir:Input"; __Type = Dir:; }
            __Drive = __Expression { __String = "Drv:SyncGated"; __Type = Drv:; }
        }
    }
}

__PatternSequence Vout_SEQ {
    __AutoBasePeriod = __True;
}

__PatternSequence TestPatScan_PS {
    __Thread[0] = TestPatScan_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT999 = { WFT999 } }
    }
    __AutoBasePeriod = __True;
}
__Thread TestPatScan_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "TestPatScan.TestPatScan_st"; }
    }
}

__PatternSequence Flash_Shell_TestNum_SEQ {
    __Thread[0] = Flash_Load_RevBShell_Thrd;
    __Thread[1] = Flash_Load_RevCShell_Thrd;
    __Thread[2] = Flash_Load_TestNum_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT11 = { WFT11 } }
    }
    __AutoBasePeriod = __True;
}

__Thread Flash_Load_RevCShell_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "fl_sw_dl_a1a3_4_DPM.fl_sw_dl_a1a3_4_DPM_st"; }
    }
}

__Thread Flash_Load_RevBShell_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "fl_sw_dl_a2_2_DPM.fl_sw_dl_a2_2_DPM_st"; }
    }
}

__Thread Flash_Load_TestNum_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "dmled_test_number_DPM.dmled_test_number_DPM_st"; }
    }
}

__PatternSequence FuseFarm_SEQ {
    __Thread[0] = FF_InitCheck_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT12_eng = { WFT12_eng } }
    }
    __AutoBasePeriod = __True;
}

__Thread FF_InitCheck_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = FF_InitCheck_eng_DPM;
    }
}
__PatternSequence DCPara_SEQ {
    __Thread[0] = DC_Para_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT10 = { WFT10 } }
    }
    __AutoBasePeriod = __True;
}
__Thread DC_Para_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "dcpara_DPM.dcpara_DPM_st"; }
    }
}
__PatternSequence FlashTestNum_SEQ {
    __Thread[0] = FlashShellB_Thrd;
    __Thread[1] = FlashShellC_Thrd;
    __Thread[2] = FlashTestNum_NoRPT1_Thrd;
    __Thread[3] = FlashTestNum_NoRPT2_Thrd;
    __Thread[4] = FlashTestNum_0x11200000_Thrd;
    __Thread[5] = FlashTestNum_0x10000000_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT11 = { WFT11 } }
    }
    __AutoBasePeriod = __True;
}

__Thread FlashShellB_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = fl_sw_dl_a2_2_DPM;
    }
}
__Thread FlashShellC_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = fl_sw_dl_a1a3_4_DPM;
    }
}
__Thread FlashTestNum_0x00100000_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "dmled_test_number_0x00100000.dmled_test_number_DPM_st"; }
    }
}
__Thread FlashTestNum_0x00200000_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "dmled_test_number_0x00200000.dmled_test_number_DPM_st"; }
    }
}
__Thread FlashTestNum_NoRPT1_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "dmled_test_number_NoRPT1.dmled_test_number_NoRPT1_st"; }
    }
}
__Thread FlashTestNum_NoRPT2_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "dmled_test_number_NoRPT2.dmled_test_number_NoRPT2_st"; }
    }
}
__Thread FlashTestNum_0x10000000_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "dmled_test_number_0x10000000.dmled_test_number_NoRPT1_st"; }
    }
}
__Thread FlashTestNum_0x11200000_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "dmled_test_number_0x11200000.dmled_test_number_NoRPT1_st"; }
    }
}
