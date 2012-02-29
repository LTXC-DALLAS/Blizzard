Unison:U0.2:S4.3;

/************************/
/***  Pattern Groups  ***/
/************************/
__PatternGroup TDLStdPatGrp {
    __SignalHeader DefaultSignalHeader ScanHeader1 ScanHeader2 ScanHeader3
    allFuncPins; //allFuncPins added for pattern debug purposes
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
//    __Cell "TDLStdPatGrp.Pins" L/H NRZDrive {
// D96 digitial subsystem is more sensitive to the number of alias assignments for a given 
// digital pin in a given OXBI cell.  D96 tolerates no duplicate alias assignments for a given
// pin in a given OXBI location.  For example, AIN10_183 alias 'L' for Data 6 can only be defined
// in one default waveform table cell.  Since most clocks require the RZClk waveform and patterns
// use the 'L' alias for these pins, must remove them from the NRZDrive pinlist in the default
// waveform table.  --BJP
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
//    __Cell "TDLStdPatGrp.Pins" L/C RZClk {
    __Cell "AIN10_183+OSC0_124+TCK_152+o_cpu_done_46" L/C RZClk {
        __Data 6/7;
        __Color 8/4;
        __Drive {
            __Waveform { __DriveOn; __DriveData; __DriveLow; }
        }
    }
// Clock pins sometimes have an H alias w/in a pattern.  
    __Cell "AIN10_183+OSC0_124+TCK_152+o_cpu_done_46" H NRZDriveClk {
        __Data 7;
        __Color 6;
        __Drive {
            __Waveform { __DriveOn; __DriveData; }
        }
    }
// For pattern compile debug.  Don't think there are any RO clocks in the program. --BJP
//    __Cell "TDLStdPatGrp.Pins" c/H ROClk {
//    __Cell "TDLStdPatGrp.Pins" c/h ROClk {
//	__Data 6/7;
//	__Color 4/8;
//	__Drive {
//	    __Waveform { __DriveOn; __DriveData; __DriveHigh; }
//	}
//    }
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
// Let ActiveStrbMsk cell take care of this
//    __Cell "TDLStdPatGrp.Pins" 0/1 ActiveStrb {
//        __Data 0/1;
//        __Color 8/10;
//        __Drive {
//            __Waveform { __DriveOff; }
//        }
//        __Compare {
//            __Waveform { __CompareData; }
//        }
//    }
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
// Let ActiveStrbMsk cell take care of this
//    __Cell "TDLStdPatGrp.Pins" M _M_ {
//        __Data 2;
//        __Color 7;
//        __Drive {
//            __Waveform { __DriveOff; }
//        }
//    }
    __Cell "TDLStdPatGrp.Pins" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __EntryState __DriveOn;
            __Waveform { }
        }
    }
    __Cell "TDLStdPatGrp.Pins" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
    }
    __Cell "TDLStdPatGrp.Pins" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
    }
    __Cell "TDLStdPatGrp.Pins" d DPM2CPM {
        __Data 3 __Other;
        __Color 3;
    }
//    __Cell "TDLStdPatGrp.Pins" 2 CUSTOM_2 {
//        __Data 7;
//        __Color 4;
//    }
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
//Added for scan pattern compile debug --BJP
//    __Cell "TDLStdPatGrp.Pins" L/H SCANDRIVE_LH {
//      __Data 6/7 __Serial;
//      __Color 3/6;
//      __Drive {
//	__Waveform { __DriveOn; __DriveData; }
//      }
//    }
//Added for scan pattern compile debug --BJP
//    __Cell "TDLStdPatGrp.Pins" 0/1/M SCANSTB {
//      __Data 0/1/2 __Serial;
//      __Color 8/10/7;
//      __Drive {
//	  __Waveform { __DriveOff; }
//      }
//      __Compare {
//	  __Waveform { __CompareData; }
//      }
//    }
//Added for scan pattern compile debug --BJP
//    __Cell "TDLStdPatGrp.Pins" M SCANMSK {
//        __Data 2 __Serial;
//        __Color 7;
//        __Drive {
//            __Waveform { __DriveOff; }
//        }
//    }
//Added for scan pattern compile debug --BJP
//    __Cell "TDLStdPatGrp.Pins" 0/1/M/L/H SCANDRIVE_LH {
//      __Data 0/1/2/6/7 __Serial;
//      __Color 8/10/7/3/6;
//      __Drive {
//	__Waveform { __DriveOn; __DriveData; }
//      __Waveform { __DriveOff; }
//      }
//      __Compare {
//      __Waveform { __CompareData; }
//      }        
//   }
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
// This pattern is commented out of the V1PQ727C04 VLCT program
// (see lin 1010 of global.h of the VLCT program) -- BJP
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __Pattern = hibernate_reg_rw_DPM;
//    }
// This pattern is commented out of the V1PQ727C04 VLCT program
// (see lin 1009 of global.h of the VLCT program) -- BJP
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __Pattern = hib_rtcsec_subsec_DPM;
//    }
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
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT16 = { WFT16 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_IDDQ_1_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_iddq_ret_chkr.pb_iddq_ret_chkr_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_iddq_ret_invchkr.pb_iddq_ret_invchkr_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_iddq_ret_ones.pb_iddq_ret_ones_st"; }
    }
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_iddq_ret_zeroes.pb_iddq_ret_zeroes_st"; }
    }
}
__PatternSequence SCAN_IDDQ_PG_PS {
    __Thread[0] = SCAN_IDDQ_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT1 = { WFT1 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_IDDQ_PG_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "a_iddq.a_iddq"; }
    }
}
__PatternSequence SCAN_PATHDELAY_1_PG_PS {
    __Thread[0] = SCAN_PATHDELAY_1_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT3 = { WFT3 } }
        __Row { TDLStdPatGrp, WFT4 = { WFT4 } }
        __Row { TDLStdPatGrp, WFT5 = { WFT5 } }
        __Row { TDLStdPatGrp, WFT6 = { WFT6 } }
        __Row { TDLStdPatGrp, WFT7 = { WFT7 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_PATHDELAY_1_PG_Thrd {
//The patterns currently exist as cpm-calling-dpm.  Need to translate into generic patterns.
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
//No _7 pattern included in the patterns set
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_7.a_tft_tk_80_80_7_st"; }
//    }
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
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_11.a_tft_tk_80_80_11_st"; }
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
//  THIS PATTERN IS NOT INCLUDED IN THE JAZZ-GENERATED PATTERN DIRECTORY
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "a_tft_tk_16_16_1.a_tft_tk_16_16_1_st"; }
//    }
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
//This pattern does not exist in our patterns set
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "a_tft_tk_40_40_2.a_tft_tk_40_40_2_st"; }
//    }
}
__PatternSequence SCAN_PATHDELAY_16_PG_PS {
    __Thread[0] = SCAN_PATHDELAY_16_PG_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT3 = { WFT3 } }
    }
    __AutoBasePeriod = __True;
}
__Thread SCAN_PATHDELAY_16_PG_Thrd {
//  THIS PATTERN IS NOT INCLUDED IN THE JAZZ-GENERATED PATTERN DIRECTORY
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "a_tft_tk_16_16_1.a_tft_tk_16_16_1_st"; }
//    }
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
//This pattern does not exist in our pattern set
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "a_tft_tk_40_40_2.a_tft_tk_40_40_2_st"; }
//    }
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
//There is no _7 included in the patterns set
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_7.a_tft_tk_80_80_7_st"; }
//    }
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
        __PatternLabel = __Expression { __String = "a_tft_tk_80_80_11.a_tft_tk_80_80_11_st"; }
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
        __ThreadAction = __Expression { __String = "Seq:Enterexit"; }
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
//    __Row {
//        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
//        __PatternLabel = __Expression { __String = "a_st_tk_11_v22.a_st_tk_11_v22_st"; }
//    }
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
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT18 = { WFT18 } }
    }
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
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_vl_dtxn2_2p_v23.pb_vl_dtxn2_2p_v23_st"; }
    }
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
    __Thread[0] = ANALOG_FSUSB_PUPD_100;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT15 = { WFT15 } }
    }
    __AutoBasePeriod = __True;
}

__PatternSequence ANALOG_TRIM_TRIM_100_SEQ {
    __Thread[0] = ANALOG_TRIM_TRIM_100;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT8 = { WFT8 } }
    }
    __AutoBasePeriod = __True;
}

__PatternSequence ANALOG_USB_CHG_100_SEQ {
    __Thread[0] = ANALOG_USB_CHG_100;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT15 = { WFT15 } }
    }
    __AutoBasePeriod = __True;
}

__PatternSequence ANALOG_USB_OTG_100_SEQ {
    __Thread[0] = ANALOG_USB_OTG_100;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT15 = { WFT15 } }
    }
    __AutoBasePeriod = __True;
}

__PatternSequence BIST_MEMORY_VBOXLO_33_SEQ {
    __Thread[0] = BIST_MEMORY_VBOXLO_33;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT20 = { WFT20 } }
        __Row { TDLStdPatGrp, WFTBase = { WFT20 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncGated"; }
        }
    }
}

__PatternSequence BIST_PROD_33_1_SEQ {
    __Thread[0] = BIST_PROD_33_1;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT18 = { WFT18 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncGated"; }
        }
    }
}

__PatternSequence BIST_PROD_33_SEQ {
    __Thread[0] = BIST_PROD_33;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT17 = { WFT17 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncGated"; }
        }
    }
}

__PatternSequence BURNIN_200_SEQ {
    __Thread[0] = BURNIN_200;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT27 = { WFT27 } }
        __Row { TDLStdPatGrp, WFT28 = { WFT28 } }
    }
    __AutoBasePeriod = __True;
}

__PatternSequence DC_PARA_100_SEQ {
    __Thread[0] = DC_PARA_100;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT10 = { WFT10 } }
    }
    __AutoBasePeriod = __True;
}

__PatternSequence DIAG_VHI_200_SEQ {
    __Thread[0] = DIAG_VHI_200_pb_pb_march13n_rep;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT19 = { WFT19 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncGated"; }
        }
    }
}

__PatternSequence DIAG_VLO_200_SEQ {
    __Thread[0] = DIAG_VLO_200_pb_pb_march13n_rep;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT19 = { WFT19 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncGated"; }
        }
    }
}

__PatternSequence FFDieIDProg_SEQ {
    __Thread[0] = CheckROM_norm_100;
    __Thread[1] = InitCheck_100;
    __Thread[2] = Program_Mg1A_100;
    __Thread[3] = Read_Mg0_100;
    __Thread[4] = Read_Mg1A_100;
    __Thread[5] = Read_Norm_100;
    __Thread[6] = RunAutoload_100;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT12 = { WFT12 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncGated"; }
        }
    }
}

__PatternSequence FUNC_GROS_100_1_SEQ {
    __Thread[0] = FUNC_GROS_100_1;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT21 = { WFT21 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncGated"; }
        }
    }
}

__PatternSequence FUNC_GROS_100_2_SEQ {
    __Thread[0] = FUNC_GROS_100_2;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT22 = { WFT22 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncGated"; }
        }
    }
}

__PatternSequence FUNC_GROS_100_3_SEQ {
    __Thread[0] = FUNC_GROS_100_3;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT23 = { WFT23 } }
        __Row { TDLStdPatGrp, WFT24 = { WFT24 } }
        __Row { TDLStdPatGrp, WFTBase = { WFT23, WFT24 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncGated"; }
        }
    }
}

__PatternSequence FUNC_GROS_100_4_SEQ {
    __Thread[0] = FUNC_GROS_100_4;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT26 = { WFT26 } }
        __Row { TDLStdPatGrp, WFTBase = { WFT26 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncGated"; }
        }
    }
}

__PatternSequence FUNC_GROS_100_SEQ {
    __Thread[0] = FUNC_GROS_100;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT9 = { WFT9 } }
        __Row { TDLStdPatGrp, WFT8 = { WFT8 } }
        __Row { TDLStdPatGrp, WFT11 = { WFT11 } }
        __Row { TDLStdPatGrp, WFT14 = { WFT14 } }
        __Row { TDLStdPatGrp, WFT15 = { WFT15 } }
        __Row { TDLStdPatGrp, WFT25 = { WFT25 } }
        __Row { TDLStdPatGrp, WFTBase = { WFT11, WFT14, WFT15, WFT25 } }
    }
    __AutoBasePeriod = __True;
}

__PatternSequence FUNC_GROS_166p66_SEQ {
    __Thread[0] = FUNC_GROS_166p66;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT13 = { WFT13 } }
    }
    __AutoBasePeriod = __True;
}

__PatternSequence FUNC_SCAN_AC_50_1_SEQ {
    __Thread[0] = FUNC_SCAN_AC_50_1;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT2 = { WFT2 } }
        __Row { TDLStdPatGrp, WFT7 = { WFT7 } }
        __Row { TDLStdPatGrp, WFTBase = { WFT2, WFT7 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncFreeRun"; }
        }
    }
}

__PatternSequence FUNC_SCAN_AC_50_2_SEQ {
    __Thread[0] = FUNC_SCAN_AC_50_2;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT3 = { WFT3 } }
        __Row { TDLStdPatGrp, WFTBase = { WFT3 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncFreeRun"; }
        }
    }
}

__PatternSequence FUNC_SCAN_AC_50_3_SEQ {
    __Thread[0] = FUNC_SCAN_AC_50_3;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT4 = { WFT4 } }
        __Row { TDLStdPatGrp, WFTBase = { WFT4 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncFreeRun"; }
        }
    }
}

__PatternSequence FUNC_SCAN_AC_50_4_SEQ {
    __Thread[0] = FUNC_SCAN_AC_50_4;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT5 = { WFT5 } }
        __Row { TDLStdPatGrp, WFTBase = { WFT5 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncFreeRun"; }
        }
    }
}

__PatternSequence FUNC_SCAN_AC_50_5_SEQ {
    __Thread[0] = FUNC_SCAN_AC_50_5;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT6 = { WFT6 } }
        __Row { TDLStdPatGrp, WFTBase = { WFT6 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncFreeRun"; }
        }
    }
}

__PatternSequence FUNC_SCAN_AC_50_SEQ {
    __Thread[0] = FUNC_SCAN_AC_50;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT1 = { WFT1 } }
        __Row { TDLStdPatGrp, WFTBase = { WFT1 } }
    }
    __AutoBasePeriod = __True;
}

__PatternSequence Iddq_PM01_SEQ {
    __Thread[0] = Iddq_PM01_a_iddq;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT1 = { WFT1 } }
    }
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
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT16 = { WFT16 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncGated"; }
        }
    }
}
__Thread Iddq_PM02_pb_iddq_ret_chkr_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_iddq_ret_chkr.pb_iddq_ret_chkr_st"; }
    }
}
__Thread Iddq_PM02_pb_iddq_ret_chkr_v23_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_iddq_ret_chkr_v23.pb_iddq_ret_chkr_v23_st"; }
    }
}
__Thread Iddq_PM02_pb_iddq_ret_invchkr_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_iddq_ret_invchkr.pb_iddq_ret_invchkr_st"; }
    }
}
__Thread Iddq_PM02_pb_iddq_ret_invchkr_v23_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_iddq_ret_invchkr_v23.pb_iddq_ret_invchkr_v23_st"; }
    }
}
__Thread Iddq_PM02_pb_iddq_ret_ones_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_iddq_ret_ones.pb_iddq_ret_ones_st"; }
    }
}
__Thread Iddq_PM02_pb_iddq_ret_ones_v23_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_iddq_ret_ones_v23.pb_iddq_ret_ones_v23_st"; }
    }
}
__Thread Iddq_PM02_pb_iddq_ret_zeroes_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_iddq_ret_zeroes.pb_iddq_ret_zeroes_st"; }
    }
}
__Thread Iddq_PM02_pb_iddq_ret_zeroes_v23_Thrd {
    __Row {
        __ThreadAction = __Expression { __String = "Seq:EnterExit"; }
        __PatternLabel = __Expression { __String = "pb_iddq_ret_zeroes_v23.pb_iddq_ret_zeroes_v23_st"; }
    }
}
__PatternSequence Iddq_SEQ {
    __Thread[0] = Iddq_PM01_a_iddq;
    __Thread[1] = Iddq_PM02_a_iddq;
    __Thread[2] = Iddq_PM03_a_iddq;
    __Thread[3] = Iddq_PM04_a_iddq;
    __Thread[4] = Iddq_PM05_a_iddq;
    __Thread[5] = Iddq_PM06_a_iddq;
    __Thread[6] = Iddq_PM07_a_iddq;
    __Thread[7] = Iddq_PM08_a_iddq;
    __Thread[8] = Iddq_PM09_a_iddq;
    __Thread[9] = Iddq_PM10_a_iddq;
    __Thread[10] = Iddq_PM11_a_iddq;
    __Thread[11] = Iddq_PM12_a_iddq;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT1 = { WFT1 } }
    }
    __AutoBasePeriod = __True;
}

__PatternSequence LeakIO_SEQ {
    __Thread[0] = DC_PM03_dcpara_ioz_pd;
    __Thread[1] = DC_PM04_dcpara_ioz_pd;
    __Thread[2] = DC_PM01_dcpara;
    __Thread[3] = DC_PM03_dcpara;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT10 = { WFT10 } }
    }
    __AutoBasePeriod = __True;
}

__PatternSequence Read_Mg0_100_SEQ {
    __Thread[0] = Read_Mg0_100;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT12 = { WFT12 } }
    }
    __AutoBasePeriod = __True;
    __PinModes {
        __Row {
            __Pins = __Expression { __String = "OSC0_124"; }
            __Direction = __Expression { __String = "Dir:Input"; }
            __Drive = __Expression { __String = "Drv:SyncGated"; }
        }
    }
}

__PatternSequence Vout_SEQ {
    __Thread[0] = DC_PM01_dcpara_ioz_pd;
    __Thread[1] = DC_PM02_dcpara_ioz_pd;
    __Thread[2] = DC_PM02_dcpara;
    __Thread[3] = DC_PM04_dcpara;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT10 = { WFT10 } }
    }
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
