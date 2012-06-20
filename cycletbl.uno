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
    __Cell "OSC0_124" l/2 DoubleClk {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __EntryState __DriveOn;
            __Waveform { __DriveHigh; __DriveLow; __DriveHigh; __DriveLow; }
        }
    }
    __Cell "OSC0_124" k DrvOn {
        __Data 7;
        __Color 4;
        __Drive {
            __Waveform { __DriveOn; __DriveLow; }
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
}
__PatternSequence SCAN_IDDQ_PG_PS {
    __Thread[0] = SCAN_IDDQ_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT1 = { WFT1 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_IDDQ_PG_Thrd {
}
__PatternSequence SCAN_PATHDELAY_1_PG_PS {
    __Thread[0] = a_tft_tk_80_80_10_Thrd;
    __Thread[1] = a_tft_tk_80_80_12_Thrd;
    __Thread[2] = a_tft_tk_80_80_13_Thrd;
    __Thread[3] = a_tft_tk_80_80_14_Thrd;
    __Thread[4] = a_tft_tk_80_80_15_Thrd;
    __Thread[5] = a_tft_tk_80_80_16_Thrd;
    __Thread[6] = a_tft_tk_80_80_17_Thrd;
    __Thread[7] = a_tft_tk_80_80_19_Thrd;
    __Thread[8] = a_tft_tk_80_80_1_Thrd;
    __Thread[9] = a_tft_tk_80_80_20_Thrd;
    __Thread[10] = a_tft_tk_80_80_21_Thrd;
    __Thread[11] = a_tft_tk_80_80_22_Thrd;
    __Thread[12] = a_tft_tk_80_80_24_Thrd;
    __Thread[13] = a_tft_tk_80_80_25_Thrd;
    __Thread[14] = a_tft_tk_80_80_26_Thrd;
    __Thread[15] = a_tft_tk_80_80_27_Thrd;
    __Thread[16] = a_tft_tk_80_80_28_Thrd;
    __Thread[17] = a_tft_tk_80_80_29_Thrd;
    __Thread[18] = a_tft_tk_80_80_2_Thrd;
    __Thread[19] = a_tft_tk_80_80_30_Thrd;
    __Thread[20] = a_tft_tk_80_80_31_PG_Thrd;
    __Thread[21] = a_tft_tk_80_80_32_Thrd;
    __Thread[22] = a_tft_tk_80_80_33_Thrd;
    __Thread[23] = a_tft_tk_80_80_34_Thrd;
    __Thread[24] = a_tft_tk_80_80_35_Thrd;
    __Thread[25] = a_tft_tk_80_80_36_Thrd;
    __Thread[26] = a_tft_tk_80_80_37_Thrd;
    __Thread[27] = a_tft_tk_80_80_38_Thrd;
    __Thread[28] = a_tft_tk_80_80_39_Thrd;
    __Thread[29] = a_tft_tk_80_80_3_Thrd;
    __Thread[30] = a_tft_tk_80_80_40_Thrd;
    __Thread[31] = a_tft_tk_80_80_42_Thrd;
    __Thread[32] = a_tft_tk_80_80_43_Thrd;
    __Thread[33] = a_tft_tk_80_80_44_Thrd;
    __Thread[34] = a_tft_tk_80_80_45_Thrd;
    __Thread[35] = a_tft_tk_80_80_46_Thrd;
    __Thread[36] = a_tft_tk_80_80_47_Thrd;
    __Thread[37] = a_tft_tk_80_80_4_Thrd;
    __Thread[38] = a_tft_tk_80_80_5_Thrd;
    __Thread[39] = a_tft_tk_80_80_6_Thrd;
    __Thread[40] = a_tft_tk_80_80_8_Thrd;
    __Thread[41] = a_tft_tk_80_80_9_Thrd;
    __Thread[42] = a_tft_tk_80_80_18_Thrd;
    __Thread[43] = a_tft_tk_80_80_23_Thrd;
    __Thread[44] = a_tft_tk_80_80_41_Thrd;
    __Thread[45] = a_tft_tk_80_80_11_Thrd;
    __Thread[46] = SPD_Debug_80_80_1_Thrd;
    __Thread[47] = a_tft_tk_80_80_1_trev_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT7 = { WFT7 } }
    }
    __AutoBasePeriod = __True;
}
__PatternSequence SCAN_PATHDELAY_1_PG_DBG_PS {
    __Thread[0] = SCAN_PATHDELAY_1_PG_DBG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT7 = { WFT7 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SPD_Debug_80_80_1_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "SPD_Debug_80_80_1.SPD_Debug_80_80_1_st"; }
    }
}
__Thread SCAN_PATHDELAY_1_PG_DBG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_1.a_tft_tk_80_80_1_st"; }
    }
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
__Thread a_tft_tk_80_80_1_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_1.a_tft_tk_80_80_1_st"; }
    }
}
__Thread a_tft_tk_80_80_2_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_2.a_tft_tk_80_80_2_st"; }
    }
}
__Thread a_tft_tk_80_80_3_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_3.a_tft_tk_80_80_3_st"; }
    }
}
__Thread a_tft_tk_80_80_4_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_4.a_tft_tk_80_80_4_st"; }
    }
}
__Thread a_tft_tk_80_80_5_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_5.a_tft_tk_80_80_5_st"; }
    }
}
__Thread a_tft_tk_80_80_6_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_6.a_tft_tk_80_80_6_st"; }
    }
}
//This pattern doesn't exist
//__Thread a_tft_tk_80_80_7_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_7.a_tft_tk_80_80_7_st"; }
//    }
//}
__Thread a_tft_tk_80_80_8_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_8.a_tft_tk_80_80_8_st"; }
    }
}
__Thread a_tft_tk_80_80_9_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_9.a_tft_tk_80_80_9_st"; }
    }
}
__Thread a_tft_tk_80_80_10_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_10.a_tft_tk_80_80_10_st"; }
    }
}
__Thread a_tft_tk_80_80_11_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_11.a_tft_tk_80_80_11__st"; }
    }
}
__Thread a_tft_tk_80_80_12_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_12.a_tft_tk_80_80_12_st"; }
    }
}
__Thread a_tft_tk_80_80_13_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_13.a_tft_tk_80_80_13_st"; }
    }
}
__Thread a_tft_tk_80_80_14_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_14.a_tft_tk_80_80_14_st"; }
    }
}
__Thread a_tft_tk_80_80_15_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_15.a_tft_tk_80_80_15_st"; }
    }
}
__Thread a_tft_tk_80_80_16_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_16.a_tft_tk_80_80_16_st"; }
    }
}
__Thread a_tft_tk_80_80_17_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_17.a_tft_tk_80_80_17_st"; }
    }
}
__Thread a_tft_tk_80_80_18_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_18.a_tft_tk_80_80_18_st"; }
    }
}
__Thread a_tft_tk_80_80_19_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_19.a_tft_tk_80_80_19_st"; }
    }
}
__Thread a_tft_tk_80_80_20_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_20.a_tft_tk_80_80_20_st"; }
    }
}
__Thread a_tft_tk_80_80_21_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_21.a_tft_tk_80_80_21_st"; }
    }
}
__Thread a_tft_tk_80_80_22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_22.a_tft_tk_80_80_22_st"; }
    }
}
__Thread a_tft_tk_80_80_23_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_23.a_tft_tk_80_80_23_st"; }
    }
}
__Thread a_tft_tk_80_80_24_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_24.a_tft_tk_80_80_24_st"; }
    }
}
__Thread a_tft_tk_80_80_25_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_25.a_tft_tk_80_80_25_st"; }
    }
}
__Thread a_tft_tk_80_80_26_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_26.a_tft_tk_80_80_26_st"; }
    }
}
__Thread a_tft_tk_80_80_27_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_27.a_tft_tk_80_80_27_st"; }
    }
}
__Thread a_tft_tk_80_80_28_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_28.a_tft_tk_80_80_28_st"; }
    }
}
__Thread a_tft_tk_80_80_29_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_29.a_tft_tk_80_80_29_st"; }
    }
}
__Thread a_tft_tk_80_80_30_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_30.a_tft_tk_80_80_30_st"; }
    }
}
__Thread a_tft_tk_80_80_31_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_31.a_tft_tk_80_80_31_st"; }
    }
}
__Thread a_tft_tk_80_80_32_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_32.a_tft_tk_80_80_32_st"; }
    }
}
__Thread a_tft_tk_80_80_33_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_33.a_tft_tk_80_80_33_st"; }
    }
}
__Thread a_tft_tk_80_80_34_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_34.a_tft_tk_80_80_34_st"; }
    }
}
__Thread a_tft_tk_80_80_35_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_35.a_tft_tk_80_80_35_st"; }
    }
}
__Thread a_tft_tk_80_80_36_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_36.a_tft_tk_80_80_36_st"; }
    }
}
__Thread a_tft_tk_80_80_37_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_37.a_tft_tk_80_80_37_st"; }
    }
}
__Thread a_tft_tk_80_80_38_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_38.a_tft_tk_80_80_38_st"; }
    }
}
__Thread a_tft_tk_80_80_39_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_39.a_tft_tk_80_80_39_st"; }
    }
}
__Thread a_tft_tk_80_80_40_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_40.a_tft_tk_80_80_40_st"; }
    }
}
__Thread a_tft_tk_80_80_41_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_41.a_tft_tk_80_80_41_st"; }
    }
}
__Thread a_tft_tk_80_80_42_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_42.a_tft_tk_80_80_42_st"; }
    }
}
__Thread a_tft_tk_80_80_43_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_43.a_tft_tk_80_80_43_st"; }
    }
}
__Thread a_tft_tk_80_80_44_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_44.a_tft_tk_80_80_44_st"; }
    }
}
__Thread a_tft_tk_80_80_45_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_45.a_tft_tk_80_80_45_st"; }
    }
}
__Thread a_tft_tk_80_80_46_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_46.a_tft_tk_80_80_46_st"; }
    }
}
__Thread a_tft_tk_80_80_47_Thrd {
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
    __Thread[0] = SCAN_PATHDELAY_16_2_PG_Thrd;
    __Thread[1] = SCAN_PATHDELAY_16_3_PG_Thrd;
    __Thread[2] = SCAN_PATHDELAY_16_2_RevC_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT3 = { WFT3 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_PATHDELAY_16_2_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_16_16_2.a_tft_tk_16_16_2_st"; }
    }
}
__Thread SCAN_PATHDELAY_16_2_RevC_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_16_16_2_RevC.a_tft_tk_16_16_2_RevC_st"; }
    }
}
__Thread SCAN_PATHDELAY_16_3_PG_Thrd {
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
    __Thread[0] = SCAN_PATHDELAY_33_1_PG_Thrd;
    __Thread[1] = SCAN_PATHDELAY_33_2_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT5 = { WFT5 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_PATHDELAY_33_2_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_33_33_2.a_tft_tk_33_33_2_st"; }
    }
}
__Thread SCAN_PATHDELAY_33_1_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_tft_tk_33_33_1.a_tft_tk_33_33_1_st"; }
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
        __PatternLabel = __Expression { __String = "a_st_tk_11_v22.a_st_tk_11_v22_st"; }
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
    __Thread[2] = pb_pb_march13n_1p__ENG_Thrd;
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
__Thread pb_pb_march13n_1p__ENG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_march13n_1p_ENG.pb_pb_march13n_1p_ENG_st"; }
    }
}
__Thread pb_pb_march13n_1p_DC_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_march13n_1p_DC.pb_pb_march13n_1p_DC_st"; }
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
}

/***********************************************************************************************/
/**          Preceeding thread and pattern sequence created for debug purposes                **/
/***********************************************************************************************/

__PatternSequence BIST_PROD_PG_PS {
    __Thread[0] = BIST_PROD_PGDB_Thrd;
    __Thread[1] = BIST_PROD_PG_Srch_Thrd;
    __Thread[2] = March13N_Debug;
    __Thread[3] = MapCol_Debug;
    __Thread[4] = DTxn2_Debug;
    __Thread[5] = Flip10_Debug;
    __Thread[6] = Down2_Debug;
    __Thread[7] = FTR_Debug;
    __Thread[8] = PMOSOpen_Debug;
    __Thread[9] = Precharge_Debug;
    __Thread[10] = March13N_Srch;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT17_eng = { WFT17_eng } }
        __Row { TDLStdPatGrp, WFT17_DC = { WFT17_DC } }
    }
    __AutoBasePeriod = __True;
}
__Thread BIST_PROD_PG_Srch_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_down2_1p_DC.pb_pb_down2_1p_DC_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_dtxn2_1p_DC.pb_pb_dtxn2_1p_DC_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_flip10_1p_DC.pb_pb_flip10_1p_DC_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_ftr_DC.pb_pb_ftr_DC_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_mapcol_1p_DC.pb_pb_mapcol_1p_DC_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_march13n_1p_DC.pb_pb_march13n_1p_DC_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_pmos_open_1p_v22_DC.pb_pb_pmos_open_1p_v22_DC_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_precharge_1p_DC.pb_pb_precharge_1p_DC_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_ptr_DC.pb_pb_ptr_DC_st"; }
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
    __Thread[2] = pb_pb_down2_2p_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT18_eng = { WFT18_eng } }
        __Row { TDLStdPatGrp, WFT18_DC = { WFT18_DC } }
    }
    __AutoBasePeriod = __True;
}
__Thread PBIST_2P_PROD_PG_Srch_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Enter"; }
        __PatternLabel = __Expression { __String = "pb_pb_down2_2p_DC.pb_pb_down2_2p_DC_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_dtxn2_2p_DC.pb_pb_dtxn2_2p_DC_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_flip10_2p_DC.pb_pb_flip10_2p_DC_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_mapcol_2p_DC.pb_pb_mapcol_2p_DC_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_march13n_2p_DC.pb_pb_march13n_2p_DC_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_pmos_open_2p_DC.pb_pb_pmos_open_2p_DC_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Exit"; }
        __PatternLabel = __Expression { __String = "pb_pb_precharge_2p_DC.pb_pb_precharge_2p_DC_st"; }
    }
}
__Thread PBIST_2P_PROD_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Enter"; }
        __PatternLabel = __Expression { __String = "pb_pb_down2_2p.pb_pb_down2_2p_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_dtxn2_2p.pb_pb_dtxn2_2p_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_flip10_2p.pb_pb_flip10_2p_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_mapcol_2p.pb_pb_mapcol_2p_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_march13n_2p.pb_pb_march13n_2p_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_pmos_open_2p.pb_pb_pmos_open_2p_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Exit"; }
        __PatternLabel = __Expression { __String = "pb_pb_precharge_2p.pb_pb_precharge_2p_st"; }
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
        __ThreadAction = __Expression { __String = "Seq:Enter"; }
        __PatternLabel = __Expression { __String = "pb_vl_down2_1p_v23.pb_vl_down2_1p_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_vl_down2_2p_v23.pb_vl_down2_2p_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_vl_dtxn2_1p_v23.pb_vl_dtxn2_1p_v23_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Exit"; }
        __PatternLabel = __Expression { __String = "pb_vl_flip10_1p_v23.pb_vl_flip10_1p_v23_st"; }
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
}
__Thread Iddq_PM02_pb_iddq_ret_chkr_v23_Thrd {
}
__Thread Iddq_PM02_pb_iddq_ret_invchkr_Thrd {
}
__Thread Iddq_PM02_pb_iddq_ret_invchkr_v23_Thrd {
}
__Thread Iddq_PM02_pb_iddq_ret_ones_Thrd {
}
__Thread Iddq_PM02_pb_iddq_ret_ones_v23_Thrd {
}
__Thread Iddq_PM02_pb_iddq_ret_zeroes_Thrd {
}
__Thread Iddq_PM02_pb_iddq_ret_zeroes_v23_Thrd {
}
__PatternSequence Iddq_SEQ {
    __Thread[0] = a_iddq_Thrd;
    __Thread[1] = a_iddq_NoPM_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT1 = { WFT1 } }
        __Row { TDLStdPatGrp, WFT12_eng = { WFT12_eng } }
    }
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

__PatternSequence FuseFarm_SEQ {
    __Thread[1] = FF_InitCheck_NoEd_Thrd;
    __Thread[2] = FF_RunAutoload_NoEd_Thrd;
    __Thread[3] = FF_CheckROM_Mg0_NoEd_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT12_eng = { WFT12_eng } }
        __Row { TDLStdPatGrp, WFT12 = { WFT12_eng } }
    }
    __AutoBasePeriod = __True;
}

//__Thread FF_InitCheck_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __Pattern = FF_InitCheck_eng_DPM;
//    }
//}
//__Thread FF_RunAutoload_ENG_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __Pattern = FF_RunAutoload_ENG;
//    }
//}
//__Thread FF_CheckROM_Mg0_ENG_Thrd {
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __Pattern = FF_CheckROM_Mg0_ENG;
//    }
//}
__Thread FF_Program_Mg1A_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = FF_Program_Mg1A; 
    }
}
__Thread FF_Read_Mg1A_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = FF_Read_Mg1A; 
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
    __Thread[0] = Garnet_Shell064_T072C008S007_A2_Thrd;
    __Thread[1] = f021_shell_exepat_pll_v3p0_Thrd;
    __Thread[2] = ramread_nburst_lsw_Thrd;
    __Thread[3] = ramread_nburst_msw_Thrd;
    __Thread[4] = ramread_nburst_addr_Thrd;
    __Thread[5] = ramread_mbox_Thrd;
    __Thread[6] = ramwrite_burst_addr_Thrd;
    __Thread[7] = Garnet_Shell064_T072C009S007_A3_v2p0_Thrd;
    __Thread[8] = f021_shell_exepat_pll_v4p0_Thrd;
    __Thread[9] = ramread_nburst_lsw_v4p0_Thrd;
    __Thread[10] = ramread_nburst_msw_v4p0_Thrd;
    __Thread[11] = ramread_nburst_addr_v4p0_Thrd;
    __Thread[12] = ramread_mbox_v4p0_Thrd;
    __Thread[13] = ramwrite_burst_addr_v4p0_Thrd;
    __Thread[14] = f021_shell_exepat_vco_v4p0_Thrd;
    __Thread[15] = jtag_reset_init_Thrd;
    __Thread[16] = ldo_bypass_init_Thrd;
    __Thread[17] = pb_pb_fail_insert_Thrd;
    __Thread[18] = pb_pb_fail_logout_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT1 = { WFT1 } }
        __Row { TDLStdPatGrp, WFT11 = { WFT11 } }
        __Row { TDLStdPatGrp, WFT12_eng = { WFT12_eng } }
        __Row { TDLStdPatGrp, WFT5 = { WFT5 } }
    }
    __AutoBasePeriod = __True;
}

__Thread jtag_reset_init_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "jtag_reset_init.jtag_resett_st"; }
    }
}
__Thread ldo_bypass_init_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ldo_bypass_init_DSH.ldo_bypass_init_st"; }
    }
}
__Thread Garnet_Shell064_T072C008S007_A2_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "Garnet_Shell064_T072C008S007_A2.Garnet_Shell064_T072C008S007_A2_start"; }
    }
}
__Thread f021_shell_exepat_pll_v3p0_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "f021_shell_exepat_pll_v3p0.f021_shell_exepat_pll_v3p0_start"; }
    }
}
__Thread ramread_nburst_lsw_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ramread_nburst_lsw_v3p0.ramread_nburst_lsw_v3p0_start"; }
    }
}
__Thread ramread_nburst_msw_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ramread_nburst_msw_v3p0.ramread_nburst_msw_v3p0_start"; }
    }
}
__Thread ramread_nburst_addr_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ramread_nburst_addr_v3p0.ramread_nburst_addr_v3p0_start"; }
    }
}
__Thread ramread_mbox_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ramread_mbox_scram_v3p0.ramread_mbox_scram_v3p0_start"; }
    }
}
__Thread ramwrite_burst_addr_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ramwrite_burst_addr_v3p0.ramwrite_burst_addr_v3p0_start"; }
    }
}

__Thread Garnet_Shell064_T072C009S007_A3_v2p0_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "Garnet_Shell064_T072C009S007_A3_v2p0.Garnet_Shell064_T072C009S007_A3_v2p0_start"; }
    }
}
__Thread f021_shell_exepat_pll_v4p0_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "f021_shell_exepat_pll_v4p0.f021_shell_exepat_pll_v4p0_start"; }
    }
}
__Thread ramread_nburst_lsw_v4p0_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ramread_nburst_lsw_v4p0.ramread_nburst_lsw_v4p0_start"; }
    }
}
__Thread ramread_nburst_msw_v4p0_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ramread_nburst_msw_v4p0.ramread_nburst_msw_v4p0_start"; }
    }
}
__Thread ramread_nburst_addr_v4p0_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ramread_nburst_addr_v4p0.ramread_nburst_addr_v4p0_start"; }
    }
}
__Thread ramread_mbox_v4p0_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ramread_mbox_scram_v4p0.ramread_mbox_scram_v4p0_start"; }
    }
}
__Thread ramwrite_burst_addr_v4p0_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ramwrite_burst_addr_v4p0.ramwrite_burst_addr_v4p0_start"; }
    }
}
__Thread f021_shell_exepat_vco_v4p0_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "f021_shell_exepat_vco_v4p0.f021_shell_exepat_vco_v4p0_start"; }
    }
}
__Thread a_st_tk_10_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_10_v22.a_st_tk_10_v22_st"; }
    }
}
__Thread a_st_tk_11_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_11_v22.a_st_tk_11_v22_st"; }
    }
}
__Thread a_st_tk_12_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_12_v22.a_st_tk_12_v22_st"; }
    }
}
__Thread a_st_tk_13_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_13_v22.a_st_tk_13_v22_st"; }
    }
}
__Thread a_st_tk_14_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_14_v22.a_st_tk_14_v22_st"; }
    }
}
__Thread a_st_tk_15_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_15_v22.a_st_tk_15_v22_st"; }
    }
}
__Thread a_st_tk_16_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_16_v22.a_st_tk_16_v22_st"; }
    }
}
__Thread a_st_tk_17_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_17_v22.a_st_tk_17_v22_st"; }
    }
}
__Thread a_st_tk_18_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_18_v22.a_st_tk_18_v22_st"; }
    }
}
__Thread a_st_tk_19_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_19_v22.a_st_tk_19_v22_st"; }
    }
}
__Thread a_st_tk_1_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_1_v22.a_st_tk_1_v22_st"; }
    }
}
__Thread a_st_tk_1_v22SH1_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_1_v22.a_st_tk_1_v22_st"; }
    }
}
__Thread a_st_tk_1_v22SH261_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_1_v22SH261.a_st_tk_1_v22_st"; }
    }
}
__Thread a_st_tk_1_v22SH9682_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_1_v22SH9682.a_st_tk_1_v22_st"; }
    }
}
__Thread a_st_tk_1_v22SH9682_Fail_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_1_v22SH9682_Fail.a_st_tk_1_v22_st"; }
    }
}
__Thread st_tk_init_byhand_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "st_tk_init_byhand.st_tk_init_st"; }
    }
}
__Thread a_st_tk_20_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_20_v22.a_st_tk_20_v22_st"; }
    }
}
__Thread a_st_tk_21_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_21_v22.a_st_tk_21_v22_st"; }
    }
}
__Thread a_st_tk_2_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_2_v22.a_st_tk_2_v22_st"; }
    }
}
__Thread a_st_tk_3_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_3_v22.a_st_tk_3_v22_st"; }
    }
}
__Thread a_st_tk_4_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_4_v22.a_st_tk_4_v22_st"; }
    }
}
__Thread a_st_tk_5_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_5_v22.a_st_tk_5_v22_st"; }
    }
}
__Thread a_st_tk_6_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_6_v22.a_st_tk_6_v22_st"; }
    }
}
__Thread a_st_tk_7_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_7_v22.a_st_tk_7_v22_st"; }
    }
}
__Thread a_st_tk_8_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_8_v22.a_st_tk_8_v22_st"; }
    }
}
__Thread a_st_tk_9_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_9_v22.a_st_tk_9_v22_st"; }
    }
}
__Thread a_st_tk_fles_1_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_fles_1_v22.a_st_tk_fles_1_v22_st"; }
    }
}
__Thread a_st_tk_fles_2_v22_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_fles_2_v22.a_st_tk_fles_2_v22_st"; }
    }
}
__Thread ScanDebug_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ScanDebug.ScanDebug_st"; }
    }
}
__Thread ScanDebug_Osc0_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ScanDebug_Osc0.ScanDebug_Osc0_st"; }
    }
}
__Thread ScanDebug_Osc02_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ScanDebug_Osc02.ScanDebug_Osc02_st"; }
    }
}
__Thread ScanDebugVVS_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ScanDebugVVS.ScanDebugVVS_st"; }
    }
}
__Thread a_st_tk_1_DSH_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_1_DSH.a_st_tk_1_DSH_st"; }
    }
}
__Thread a_st_tk_1_DSH1_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_st_tk_1_DSH1.a_st_tk_1_DSH_st"; }
    }
}

__PatternSequence SCAN_SA_Debug_PS {
    __Thread[0] = a_st_tk_1_v22_Thrd;
    __Thread[1] = ScanDebug_Thrd;
    __Thread[2] = st_tk_init_byhand_Thrd;
    __Thread[3] = a_st_tk_1_DSH_Thrd;
    __Thread[4] = a_st_tk_1_v22SH1_Thrd;
    __Thread[5] = a_st_tk_1_DSH1_Thrd;
    __Thread[6] = ScanDebug_Osc0_Thrd;
    __Thread[7] = ScanDebug_Osc02_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT1 = { WFT1_OSC0 } }
        __Row { TDLStdPatGrp, WFT1_OSC0 = { WFT1_OSC0 } }
    }
    __AutoBasePeriod = __True;
}

__PatternSequence SCAN_SA_PG_PS {
    __Thread[0] = a_st_tk_1_v22_Thrd;
    __Thread[1] = a_st_tk_2_v22_Thrd;
    __Thread[2] = a_st_tk_3_v22_Thrd;
    __Thread[3] = a_st_tk_4_v22_Thrd;
    __Thread[4] = a_st_tk_5_v22_Thrd;
    __Thread[5] = a_st_tk_6_v22_Thrd;
    __Thread[6] = a_st_tk_7_v22_Thrd;
    __Thread[7] = a_st_tk_8_v22_Thrd;
    __Thread[8] = a_st_tk_9_v22_Thrd;
    __Thread[9] = a_st_tk_10_v22_Thrd;
    __Thread[10] = a_st_tk_11_v22_Thrd;
    __Thread[11] = a_st_tk_12_v22_Thrd;
    __Thread[12] = a_st_tk_13_v22_Thrd;
    __Thread[13] = a_st_tk_14_v22_Thrd;
    __Thread[14] = a_st_tk_15_v22_Thrd;
    __Thread[15] = a_st_tk_16_v22_Thrd;
    __Thread[16] = a_st_tk_17_v22_Thrd;
    __Thread[17] = a_st_tk_18_v22_Thrd;
    __Thread[18] = a_st_tk_19_v22_Thrd;
    __Thread[19] = a_st_tk_20_v22_Thrd;
    __Thread[20] = a_st_tk_21_v22_Thrd;
    __Thread[21] = a_st_tk_fles_1_v22_Thrd;
    __Thread[22] = a_st_tk_fles_2_v22_Thrd;
    __Thread[23] = ScanDebug_Thrd;
    __Thread[24] = st_tk_init_byhand_Thrd;
    __Thread[25] = a_st_tk_1_DSH_Thrd;
    __Thread[26] = a_st_tk_1_v22SH1_Thrd;
    __Thread[27] = SCAN_SA_PG_glob_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT1 = { WFT1 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_SA_PG_glob_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "SCAN_SA_PG_glob.SCAN_SA_PG_glob_st"; }
    }
}
__PatternSequence BIST_PROD_DEBUG {
    __Thread[0] = March13N_Debug;
    __Thread[1] = MapCol_Debug;
    __Thread[2] = DTxn2_Debug;
    __Thread[3] = Flip10_Debug;
    __Thread[4] = Down2_Debug;
    __Thread[5] = FTR_Debug;
    __Thread[6] = PMOSOpen_Debug;
    __Thread[7] = Precharge_Debug;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT17_eng = { WFT17_eng } }
    }
    __AutoBasePeriod = __True;
}
__Thread MapCol_Debug {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_mapcol_1p_ENG.pb_pb_mapcol_1p_ENG_st"; }
    }
}
__Thread March13N_Debug {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_march13n_1p_ENG.pb_pb_march13n_1p_ENG_st"; }
    }
}
__Thread March13N_Srch {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_march13n_1p_Srch.pb_pb_march13n_1p_Srch_st"; }
    }
}
__Thread DTxn2_Debug {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_dtxn2_1p_ENG.pb_pb_dtxn2_1p_ENG_st"; }
    }
}
__Thread Flip10_Debug {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_flip10_1p_ENG.pb_pb_flip10_1p_ENG_st"; }
    }
}
__Thread Down2_Debug {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_down2_1p_ENG.pb_pb_down2_1p_ENG_st"; }
    }
}
__Thread FTR_Debug {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_ftr_ENG.pb_pb_ftr_ENG_st"; }
    }
}
__Thread PMOSOpen_Debug {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_pmos_open_1p_v22_ENG.pb_pb_pmos_open_1p_v22_ENG_st"; }
    }
}
__Thread Precharge_Debug {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_precharge_1p_ENG.pb_pb_precharge_1p_ENG_st"; }
    }
}
__Thread PTR_Debug {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_ptr_ENG.pb_pb_ptr_ENG_st"; }
    }
}
__Thread BIST_PROD_PGDB_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Enter"; }
        __PatternLabel = __Expression { __String = "pb_pb_down2_1p_ENG.pb_pb_down2_1p_ENG_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_dtxn2_1p_ENG.pb_pb_dtxn2_1p_ENG_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_flip10_1p_ENG.pb_pb_flip10_1p_ENG_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_ftr_ENG.pb_pb_ftr_ENG_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_march13n_1p_ENG.pb_pb_march13n_1p_ENG_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_pmos_open_1p_v22_ENG.pb_pb_pmos_open_1p_v22_ENG_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "pb_pb_precharge_1p_ENG.pb_pb_precharge_1p_ENG_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_pb_ptr_ENG.pb_pb_ptr_ENG_st"; }
    }
}
__PatternSequence DMLED_PS {
    __Thread[0] = candmalbtx1rx0_1beat_Thrd;
    __Thread[1] = candmalbtx0rx1_1beat_Thrd;
    __Thread[2] = ssi0_loopback_pll_b_Thrd;
    __Thread[3] = ssi1_loopback_pll_b_Thrd;
    __Thread[4] = ssi2_loopback_pll_b_Thrd;
    __Thread[5] = ssi3_loopback_pll_b_Thrd;
    __Thread[6] = i2c0_dma_Thrd;
    __Thread[7] = i2c1_dma_Thrd;
    __Thread[8] = i2c2_dma_Thrd;
    __Thread[9] = i2c3_dma_Thrd;
    __Thread[10] = i2c4_dma_Thrd;
    __Thread[11] = gpt0_1s_32_down_Thrd;
    __Thread[12] = gpt1_1s_32_down_Thrd;
    __Thread[13] = gpt2_1s_32_down_Thrd;
    __Thread[14] = gpt3_1s_32_down_Thrd;
    __Thread[15] = gpt4_1s_32_down_Thrd;
    __Thread[16] = gpt5_1s_32_down_Thrd;
    __Thread[17] = gpt6_per_32_down_Thrd;
    __Thread[18] = gpt7_per_32_down_Thrd;
    __Thread[19] = gpt8_per_32_down_Thrd;
    __Thread[20] = gpt9_per_32_down_Thrd;
    __Thread[21] = gpt10_per_32_down_Thrd;
    __Thread[22] = gpt11_per_32_down_Thrd;
    __Thread[23] = gpt5_debug;
    __Thread[24] = gpt5_debugP;
    __Thread[25] = gpt5_debugF;
    __Thread[26] = candmalb_Thrd;
    __Thread[27] = ssi_loopback_Thrd;
    __Thread[28] = i2c_gpt_Thrd;
    __Thread[29] = wd_timer_Thrd;
    __Thread[30] = wd_timer0_Thrd;
    __Thread[31] = wd_timer1_Thrd;
    __Thread[32] = misc_dmled_Thrd;
    __Thread[33] = pwm0_Thrd;
    __Thread[34] = pwm1_Thrd;
    __Thread[35] = usbphy_Thrd;
    __Thread[36] = pwm_Thrd;
    __Thread[37] = uart_dmled_Thrd;
    __Thread[38] = sysctldsldo_pioscpd_Thrd;
    __Thread[39] = hib_dmled_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT9 = { WFT9 } }
        __Row { TDLStdPatGrp, WFT23 = { WFT23 } }
        __Row { TDLStdPatGrp, WFT_MATCH = { WFT_MATCH } }
        __Row { TDLStdPatGrp, WFT24 = { WFT24 } }
        __Row { TDLStdPatGrp, WFT8 = { WFT8 } }
        __Row { TDLStdPatGrp, WFT26 = { WFT26 } }
    }
    __AutoBasePeriod = __True;
}
__Thread candmalbtx1rx0_1beat_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "candmalbtx1rx0_1beat_DPM.candmalbtx1rx0_1beat_DPM_st"; }
    }
}
__Thread candmalbtx0rx1_1beat_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "candmalbtx0rx1_1beat_DPM.candmalbtx0rx1_1beat_DPM_st"; }
    }
}
__Thread ssi0_loopback_pll_b_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ssi0_loopback_pll_b.ssi0_loopback_pll_b_st"; }
    }
}
__Thread ssi1_loopback_pll_b_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ssi1_loopback_pll_b.ssi1_loopback_pll_b_st"; }
    }
}
__Thread ssi2_loopback_pll_b_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ssi2_loopback_pll_b.ssi2_loopback_pll_b_st"; }
    }
}
__Thread ssi3_loopback_pll_b_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "ssi3_loopback_pll_b.ssi3_loopback_pll_b_st"; }
    }
}
__Thread i2c0_dma_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "i2c0_dma_DPM.i2c0_dma_DPM_st"; }
    }
}

__Thread i2c1_dma_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "i2c1_dma_DPM.i2c1_dma_DPM_st"; }
    }
}

__Thread i2c2_dma_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "i2c2_dma_DPM.i2c2_dma_DPM_st"; }
    }
}

__Thread i2c3_dma_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "i2c3_dma_DPM.i2c3_dma_DPM_st"; }
    }
}

__Thread i2c4_dma_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "i2c4_dma_DPM.i2c4_dma_DPM_st"; }
    }
}

 
__Thread gpt0_1s_32_down_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt0_1s_32_down.gpt0_1s_32_down_st"; }
    }
}

__Thread gpt1_1s_32_down_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt1_1s_32_down.gpt1_1s_32_down_st"; }
    }
}

__Thread gpt2_1s_32_down_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt2_1s_32_down.gpt2_1s_32_down_st"; }
    }
}

__Thread gpt3_1s_32_down_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt3_1s_32_down.gpt3_1s_32_down_st"; }
    }
}

__Thread gpt4_1s_32_down_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt4_1s_32_down.gpt4_1s_32_down_st"; }
    }
}

__Thread gpt5_1s_32_down_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt5_1s_32_down.gpt5_1s_32_down_st"; }
    }
}

__Thread gpt6_per_32_down_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt6_per_32_down.gpt6_per_32_down_st"; }
    }
}

__Thread gpt7_per_32_down_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt7_per_32_down.gpt7_per_32_down_st"; }
    }
}

__Thread gpt8_per_32_down_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt8_per_32_down.gpt8_per_32_down_st"; }
    }
}

__Thread gpt9_per_32_down_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt9_per_32_down.gpt9_per_32_down_st"; }
    }
}

__Thread gpt10_per_32_down_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt10_per_32_down.gpt10_per_32_down_st"; }
    }
}

__Thread gpt11_per_32_down_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt11_per_32_down.gpt11_per_32_down_st"; }
    }
}
__Thread gpt5_debug {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt5_1s_32_down_DBG.gpt5_1s_32_down_st"; }
    }
}
__Thread gpt5_debugP {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt5_1s_32_down_DBGP.gpt5_1s_32_down_st"; }
    }
}
__Thread gpt5_debugF {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "gpt5_1s_32_down_DBGF.gpt5_1s_32_down_st"; }
    }
}
__Thread candmalb_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Enter"; }
        __Pattern = candmalbtx1rx0_1beat_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Exit"; }
        __Pattern = candmalbtx0rx1_1beat_DPM;
    }
}
__Thread i2c_gpt_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Enter"; }
        __Pattern = i2c0_dma_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = i2c1_dma_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = i2c2_dma_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = i2c3_dma_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = i2c4_dma_DPM;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = gpt0_1s_32_down;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = gpt1_1s_32_down;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = gpt2_1s_32_down;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = gpt3_1s_32_down;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = gpt4_1s_32_down;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = gpt5_1s_32_down;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = gpt6_per_32_down;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = gpt7_per_32_down;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = gpt8_per_32_down;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = gpt9_per_32_down;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "gpt10_per_32_down.gpt10_per_32_down_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Exit"; }
        __Pattern = gpt11_per_32_down;
    }
}
__Thread ssi_loopback_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Enter"; }
        __Pattern = ssi0_loopback_pll_b;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = ssi1_loopback_pll_b;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __Pattern = ssi2_loopback_pll_b;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Exit"; }
        __Pattern = ssi3_loopback_pll_b;
    }
}
__Thread wd_timer_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Exit"; }
        __Pattern = wdtimer0_reset_pll_v23;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Exit"; }
        __Pattern = wdtimer1_reset_pll_v23;
    }
}
__Thread wd_timer0_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = wdtimer0_reset_pll_v23;
    }
}
__Thread wd_timer1_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = wdtimer1_reset_pll_v23;
    }
}
__PatternSequence debug_ps {
    __Thread[0] = gpt5_debug;
    __Thread[1] = gpt5_debugP;
    __Thread[2] = gpt5_debugF;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT8 = { WFT8 } }
    }
    __AutoBasePeriod = __True;
}
__Thread pwm_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Enter"; }
        __Pattern = pwm_1_int_check;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Exit"; }
        __Pattern = usbphy;
    }
}
__Thread misc_dmled_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Enter"; }
        __PatternLabel = __Expression { __String = "ahbm_write_buffer_v23_DPM.ahbm_write_buffer_v23_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Exit"; }
        __PatternLabel = __Expression { __String = "udma_ping_pong_DPM.udma_ping_pong_DPM_st"; }
    }
}
__Thread pwm0_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pwm_0_int_check.pwm_0_int_check_st"; }
    }
}
__Thread pwm1_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pwm_1_int_check.pwm_1_int_check_st"; }
    }
}
__Thread usbphy_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "usbphy.usbphy_st"; }
    }
}
__Thread uart_dmled_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Enter"; }
        __PatternLabel = __Expression { __String = "u0u1_8bit_mode_DPM.u0u1_8bit_mode_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "u0u2_8bit_mode_DPM.u0u2_8bit_mode_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "u0u3_8bit_mode_DPM.u0u3_8bit_mode_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "u0u4_8bit_mode_DPM.u0u4_8bit_mode_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "u0u5_8bit_mode_DPM.u0u5_8bit_mode_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "u0u6_8bit_mode_DPM.u0u6_8bit_mode_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Exit"; }
        __PatternLabel = __Expression { __String = "u0u7_8bit_mode_DPM.u0u7_8bit_mode_DPM_st"; }
    }
}
__Thread sysctldsldo_pioscpd_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "sysctldsldo_pioscpd.sysctldsldo_pioscpd_st"; }
    }
}
__Thread hib_dmled_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Enter"; }
        __PatternLabel = __Expression { __String = "hibernate_rtcSec_DPM.hibernate_rtcSec_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "hibernate_rtcSec_DPM.hibernate_rtcSec_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Continue"; }
        __PatternLabel = __Expression { __String = "hibernate_vabort_DPM.hibernate_vabort_DPM_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:Exit"; }
        __PatternLabel = __Expression { __String = "hibernate_vbatchk_DPM.hibernate_vbatchk_DPM_st"; }
    }
}
__Thread FF_InitCheck_NoEd_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = FF_InitCheck_NoEd;
    }
}
__Thread FF_RunAutoload_NoEd_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = FF_RunAutoload_NoEd;
    }
}
__Thread a_tft_tk_80_80_1_trev_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = a_tft_tk_80_80_1_trev;
    }
}
__Thread pb_pb_down2_2p_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = pb_pb_down2_2p;
    }
}
__Thread a_iddq_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = ldo_bypass_JTAG_reset_DSH;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = a_iddq;
    }
}
__Thread a_iddq_NoPM_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = ldo_bypass_JTAG_reset_DSH;
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = a_iddq_NoPM;
    }
}
__Thread FF_CheckROM_Mg0_NoEd_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = FF_CheckROM_Mg0_NoEd;
    }
}
__Thread pb_pb_fail_insert_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = pb_pb_fail_insert;
    }
}
__Thread pb_pb_fail_logout_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __Pattern = pb_pb_fail_logout;
    }
}
