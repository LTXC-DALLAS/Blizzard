Unison:U1.0c:S5.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/actable.evo                                    */
/* Creation Date  : Tue Jan  3 17:11:58 2012                                  */
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*									      */
/*	                        Revision Comments 			      */
/*                                                                            */
/* 1st char of Rev (0-Z) - major revisions               	              */
/* 2nd char of Rev (0-Z) - minor revisions               		      */
/*									      */
/* Rev : Comment                                          : UserID   : Date   */
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*									      */
/*  A0 : Initial version of the Fusion Test Program       : x0051755 :        */
/*                                                                            */
/******************************************************************************/
/*  Jazz Version used: /vobs/ASP/jazz/release */
/******************************************************************************/

/***********************************************************************/
/***                                                                 ***/
/***  The file actable.evo is the location in which waveforms are    ***/
/***  constructed and organized into tables. Each WaveformTable      ***/
/***  defines timings for some pins. It is not required that all     ***/
/***  pins be defined in each WaveformTable (different from the      ***/
/***  Default WaveformTable, in which all pins must be defined).     ***/
/***  This is because WaveformTables can be inherited one from       ***/
/***  another. WaveformTables that are bound to a TimeSet in the     ***/
/***  PatternSequence object MUST have all pins defined.             ***/
/***                                                                 ***/
/***  As a result of this flexibility, there are many good strategies***/
/***  for creating WaveformTables. One is to create a CommonACTable  ***/
/***  which has all the Waveform expressions that do not change from ***/
/***  table to table. Inherit this table in each WaveformTable that  ***/
/***  is to tie to a timing set, then add the non-common Waveforms.  ***/
/***  The second is to completely specify each WaveformTable         ***/
/***  individually. A third is to create WaveformTables that         ***/
/***  completely define the characteristics of each Pin or PinList,  ***/
/***  then use the inherit function to combine all pin Waveforms     ***/
/***  into a WaveformTable to bind to a time set. For the sake of    ***/
/***  minimizing the redundant information in a program, the first   ***/
/***  is preferred. However, from an automation perspective, the     ***/
/***  first is probably most difficult to do.                        ***/
/***                                                                 ***/
/***********************************************************************/

/***********************************************************************/
/*** Jazz uses the following variables in the acSetupTable test plan ***/
/*** table to construct the default waveforms:                       ***/
/***    ZeroOffset      - adjustment applied to ALL waveforms (tref) ***/
/***    SpecValue       - a parameter specification                  ***/
/***    PercentOfPeriod - the TDL OFFSET value multipled by the      ***/
/***                      generic period variable (tper) and divided ***/
/***                      by the TDL PERIOD value of the             ***/
/***                      For example, assume for a given TDL:       ***/
/***                       PERIOD = 100ns, and OFFSET = 50ns         ***/
/***                       The resulting PercentOfPeriod value would ***/
/***                        be 50ns*(tper/100ns)                     ***/
/***    TimingAdjust    - any TADJUST variables defined by the TDL   ***/
/***    TesterCorFactor - drive or strobe timing correction factors  ***/
/***    Guardband       - user defined timing guardband              ***/
/***********************************************************************/

__WaveformTable WFT999 {
    __Period "tper";
    __Cell "ScanHeader2_PL+o_cpu_done_46+XOSC0_100+TDI_150+TMS_151+TCK_152" L/H WFT999_DRV {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps + 1.6ns"; }
        }
    }
    __Cell "OSC0_124" </> WFT999_RZ2_Async_OSC0_124 {
        __Data 6/7;
        __Color 6/7;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AIN10_183" L/C WFT999_RZ1_OSC {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns) -1.6ns"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "ScanHeader2_PL+AIN05_192" 0/1/M WFT999_STB {
        __Data 0/1/2;
        __Color 8/10/7;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "ALLPINS-ScanHeader2_PL-AIN10_183" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ScanHeader2_PL" o WFT999_SCANSTROBE {
        __Data 7 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
    __Cell "ScanHeader2_PL" i WFT999_SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
}

/*******************************************************************************
WFT:WFT1 used in 24 patterns:
	a_iddq	a_st_tk_10_v22	a_st_tk_11_v22
	a_st_tk_12_v22	a_st_tk_13_v22	a_st_tk_14_v22
	a_st_tk_15_v22	a_st_tk_16_v22	a_st_tk_17_v22
	a_st_tk_18_v22	a_st_tk_19_v22	a_st_tk_1_v22
	a_st_tk_20_v22	a_st_tk_21_v22	a_st_tk_2_v22
	a_st_tk_3_v22	a_st_tk_4_v22	a_st_tk_5_v22
	a_st_tk_6_v22	a_st_tk_7_v22	a_st_tk_8_v22
	a_st_tk_9_v22	a_st_tk_fles_1_v22	a_st_tk_fles_2_v22
*******************************************************************************/
__WaveformTable WFT1 {
    __Period "tper";
    __Cell "AC1_NR+AC1_NR_STB-o_cpu_done_46" L/H WFT1_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "TCK_152+o_cpu_done_46" L/C WFT1_RZ {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)-1.5ns"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "AIN10_183" L/C WFT1_RZ_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)-1.5ns+15ns"; __DriveData @ "tref +9ns*(.Period/50ns)+15ns"; __DriveLow @ "tref +23ns*(.Period/50ns)+15ns"; }
        }
    }
    __Cell "OSC0_124" L/C WFT1_RZ_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)-1.5ns-5ns"; __DriveData @ "tref +9ns*(.Period/50ns)-5ns"; __DriveLow @ "tref +23ns*(.Period/50ns)-5ns"; }
        }
    }
    __Cell "o_cpu_done_46" H WFT1_NRZDriveClk {
        __Data 7;
        __Color 6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" 0/1/M WFT1_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +9ns*(.Period/50ns)*5"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" Z WFT1_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +9ns*(.Period/50ns)*5"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ScanHeader1_PL+ScanHeader2_PL+ScanHeader3_PL" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns + 1.5ns"; }
        }
    }
    __Cell "ScanHeader1_PL+ScanHeader2_PL+ScanHeader3_PL" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}
__WaveformTable WFT1_OSC0 {
    __Period "tper";
    __Cell "AC1_NR+AC1_NR_STB-o_cpu_done_46" L/H WFT1_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "TCK_152+o_cpu_done_46" L/C WFT1_RZ {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)-1.5ns - 3ns"; __DriveData @ "tref +9ns*(.Period/50ns) - 3ns"; __DriveLow @ "tref +23ns*(.Period/50ns) - 3ns"; }
        }
    }
    __Cell "AIN10_183" L/C WFT1_RZ_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)-1.5ns +3ns"; __DriveData @ "tref +9ns*(.Period/50ns) + 3ns"; __DriveLow @ "tref +23ns*(.Period/50ns) + 3ns"; }
        }
    }
    __Cell "OSC0_124" L/C WFT1_RZ_OSC0 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "(.Period/2)-1.5ns"; __DriveData @ "(.Period/2) + 5ns"; __DriveLow @ "(.Period)"; }
        }
    }
    __Cell "o_cpu_done_46" H WFT1_NRZDriveClk {
        __Data 7;
        __Color 6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" 0/1/M WFT1_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" Z WFT1_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ScanHeader1_PL+ScanHeader2_PL+ScanHeader3_PL" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns + 1.5ns"; }
        }
    }
    __Cell "ScanHeader1_PL+ScanHeader2_PL+ScanHeader3_PL" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}

/*******************************************************************************
WFT:WFT1_basic_SH3 used in 24 patterns:
        a_st_tk_fles_1_v22
	a_st_tk_fles_2_v22
	a_tft_tk_40_40_1
*******************************************************************************/
__WaveformTable WFT1_basic_SH3 {
    __Period "tper";
    __Cell "o_cpu_done_46+PA2_48+PA3_49+PA4_50+PA5_51+PA6_54+PA7_55+XOSC0_100+RST_n_122+OSC0_124+PB0_129+PB1_130+ia_ftestadc_132+TDO_149+TDI_150+TMS_151+TCK_152+AIN11_182+AIN10_183" L/H WFT1_NR1_basic {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "OSC0_124+TCK_152+AIN10_183" L/C WFT1_RZ {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT1_scan_SH3 used in 3 patterns:
        a_st_tk_fles_1_v22
	a_st_tk_fles_2_v22
	a_tft_tk_40_40_1
*******************************************************************************/
__WaveformTable WFT1_scan_SH3 {
    __Period "tper";
    __Cell "ScanHeader3_PL" 0/1 WFT1_NR1_scan {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AIN10_183" L/C WFT1_RZ {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "ScanHeader3_PL_outs" 0/1/M WFT1_STB1 {
        __Data 0/1/2;
        __Color 8/10/7;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "18ns"; }
        }
    }
    __Cell "AIN15_1+AIN14_2+AIN13_3+AIN12_4+PQ0_5+PQ1_6+rbias_9+PB6_10+PB7_15+PQ2_16+AIN16_23+AIN17_24+AIN18_25+AIN19_26+PN2_27+PH7_28+PH6_29+PH5_30+PH4_35+PH3_36+PH2_37+PH1_40+PH0_41+o_cpu_done_46+o_cpu_fail_47+PG7_56+PG6_57+PP2_58+PP5_59+RAWPOR_n_60+PQ3_61+PQ4_62+PQ5_63+PQ6_64+PQ7_65+FLASH3_70+FLASH4_71+FLASH5_72+PG5_76+PG4_77+PG3_78+PG2_79+PG1_80+PG0_81+PF7_84+PF6_85+PF5_86+TRD3_87+PN7_94+PN6_95+PN5_96+PN4_97+wake_n_98+hib_n_99+XOSC0_100+XOSC1_102+PP3_106+PP4_107+PP1_108+PP0_109+PM7_110+PM6_111+LPC0CLK_116+LPC0SERIRQ_117+LPC0A20_118+LPC0CLKRUN_n_119+LPC0SCI_n_120+LPC0PD_n_121+RST_n_122+OSC0_124+OSC1_125+USB0DM_127+USB0DP_128+PB2_131+ia_ftestadc_132+LPC0RESET_n_135+LPC0FRAME_n_136+LPC0AD0_137+LPC0AD1_138+LPC0AD2_139+LPC0AD3_140+PK7_141+PK6_142+PK5_143+PK4_144+TDO_149+TDI_150+TMS_151+TCK_152+PN3_153+PJ0_158+PJ1_159+PJ2_160+PJ3_161+RAWPOR_N_TEST_162+PP6_163+POR_ORIDE_164+C2_p_174+C2_n_175+PJ6_176+PJ7_177+AIN23_178+AIN22_179+AIN21_180+AIN20_181+AIN11_182+AIN09_188+AIN08_189+AIN07_190+AIN06_191+AIN05_192" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "PA2_48+PA3_49+PA4_50+PA5_51+PA6_54+PA7_55+PB0_129+PB1_130" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "C0_n_42+C0_p_43+C1_p_44+C1_n_45+TRD2_88+TRD1_89+TRD0_90+PF3_91" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}
/*******************************************************************************
WFT:WFT10 used in 4 patterns:
	dcpara	dcpara_ioz	dcpara_ioz_pd
	dcpara_ioz_pu
*******************************************************************************/
__WaveformTable WFT10 {
    __Period "tper";
    __Cell "AC2_NR+AC6_NR_STB" L/H WFT10_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +1ns*(.Period/100ns)"; __DriveData @ "tref +1ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC6_NR_STB+AC1_STB" 0/1/M WFT10_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +17ns*(.Period/100ns)"; }
        }
    }
    __Cell "AIN10_183" L/C WFT25_RZ1 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +1ns*(.Period/100ns)-1.5ns"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AIN10_183" H WFT25_NR1Clk {
        __Data 7;
        __Color 6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps+1.5ps"; }
        }
    }
    __Cell "AC6_NR_STB+AC1_STB" Z WFT10_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +17ns*(.Period/100ns)"; }
        }
    }
     __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT11 used in 7 patterns:
	dmled_read	dmled_test_number	fl_otp_loader_v21
	fl_sw_dl_a1a3_4	fl_sw_dl_a2_2	fl_sw_dl_dpse
	fl_sw_dl_v30
*******************************************************************************/
__WaveformTable WFT11 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT11_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps + 1.6ns"; }
        }
    }
    __Cell "AC1_NR_STB" L/H WFT11_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps + 1.6ns"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" L/C WFT11_RZ1_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.6ns"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_OSC0_124" L/C WFT11_RZ1_OSC0 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.6ns"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT11_RZ1_TCK {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.6ns"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_OSC0_124+AC1_RZ_STB_TCK_152+AC1_STB" 0/1/M WFT11_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_OSC0_124+AC1_RZ_STB_TCK_152+AC1_STB" Z WFT11_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT12 used in 14 patterns:
	FF_CheckROM_Mg0	FF_CheckROM_norm	FF_InitCheck
	FF_LoadFuseData_0001	FF_LoadFuseData_0011	FF_LoadFuseData_1010
	FF_LoadFuseData_1110	FF_Program_Mg1A	FF_Program_Mg1B
	FF_Read_Mg0	FF_Read_Mg1A	FF_Read_Mg1B
	FF_Read_Norm	FF_RunAutoload
*******************************************************************************/
__WaveformTable WFT12 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT12_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC7_NR_STB" L/H WFT12_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC8_NR_STB" L/H WFT12_NR3 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +10ns*(.Period/100ns)"; __DriveData @ "tref +10ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT12_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +40ns*(.Period/100ns)"; __DriveData @ "tref +40ns*(.Period/100ns)"; __DriveLow @ "tref +80ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" </> WFT12_RZ2_Async_OSC0_124 {
        __Data 6/7;
        __Color 6/7;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" L/C WFT12_RZ3_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +40ns*(.Period/100ns)"; __DriveData @ "tref +40ns*(.Period/100ns)"; __DriveLow @ "tref +80ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT12_RZ4_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +40ns*(.Period/100ns)"; __DriveData @ "tref +40ns*(.Period/100ns)"; __DriveLow @ "tref +80ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC7_NR_STB" 0/1/M WFT12_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +95ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC7_NR_STB" Z WFT12_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +95ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC8_NR_STB" 0/1/M WFT12_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +95ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC8_NR_STB" Z WFT12_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +95ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" 0/1/M WFT12_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +95ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" Z WFT12_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +95ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT12_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +95ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT12_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +95ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT12_STB5 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +95ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT12_STB5_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +95ns*(.Period/100ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

__WaveformTable WFT12_eng {
    __Period "tper";
    __Cell "AC1_NR+AC7_NR_STB+AC8_NR_STB" L/H WFT12_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps+1.5ns"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152" L/C WFT12_RZ1 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.5ns"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT12_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-3.5ns"; __DriveData @ "tref +50ns*(.Period/100ns)-3.5ns"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC7_NR_STB+AC8_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" 0/1/M WFT12_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +95ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC7_NR_STB+AC8_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" Z WFT12_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +95ns*(.Period/100ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT13 used in 1 patterns:
	flash_int_check
*******************************************************************************/
__WaveformTable WFT13 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT13_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC4_NR_STB" L/H WFT13_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC5_NR_STB" L/H WFT13_NR3 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT13_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +83.33ns*(.Period/166.66ns)"; __DriveData @ "tref +83.33ns*(.Period/166.66ns)"; __DriveLow @ "tref +166.66ns*(.Period/166.66ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" L/C WFT13_RZ2_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +83.33ns*(.Period/166.66ns)"; __DriveData @ "tref +83.33ns*(.Period/166.66ns)"; __DriveLow @ "tref +166.66ns*(.Period/166.66ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT13_RZ3_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +83.33ns*(.Period/166.66ns)"; __DriveData @ "tref +83.33ns*(.Period/166.66ns)"; __DriveLow @ "tref +166.66ns*(.Period/166.66ns)"; }
        }
    }
    __Cell "AC4_NR_STB" 0/1/M WFT13_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/166.66ns)"; }
        }
    }
    __Cell "AC4_NR_STB" Z WFT13_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/166.66ns)"; }
        }
    }
    __Cell "AC5_NR_STB" 0/1/M WFT13_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +95ns*(.Period/166.66ns)"; }
        }
    }
    __Cell "AC5_NR_STB" Z WFT13_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +95ns*(.Period/166.66ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" 0/1/M WFT13_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/166.66ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" Z WFT13_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/166.66ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT13_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/166.66ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT13_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/166.66ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT13_STB5 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/166.66ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT13_STB5_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/166.66ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT14 used in 6 patterns:
	hibosc_obs	iosc_obs	piosc_obs
	switch_cell_can0_pd	switch_cell_can1_pd	switch_cell_usb_pd
*******************************************************************************/
__WaveformTable WFT14 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT14_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC9_NR_STB" L/H WFT14_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT14_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_PA3_49" L/C WFT14_RZ2_PA3_49 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT14_RZ3_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC9_NR_STB" 0/1/M WFT14_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC9_NR_STB" Z WFT14_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_PA3_49" 0/1/M WFT14_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_PA3_49" Z WFT14_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT14_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT14_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT14_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT14_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT15 used in 31 patterns:
	OTG_ChgdischgVbusM	otg_5vprotection	otg_SidMeasIddH
	otg_SvblhMs_endH	otg_SvblhMs_vldH	otg_SvblhMvbvldH
	phy_FdpdmScv	phy_Loopback_Rxdm	phy_Loopback_Rxdp
	phy_MdHTxHZRxcv	phy_MdHTxH_Rxdm	phy_MdHTxH_Rxdp
	phy_MdHTxLZRxcv	phy_MdHTxL_Rxdm	phy_MdHTxL_Rxdp
	phy_MdLTxHZRxcv	phy_MdLTxH_Rxdm	phy_MdLTxH_Rxdp
	phy_MdLTxLZRxcv	phy_MdLTxL_Rxdm	phy_MdLTxL_Rxdp
	phy_Sdm__Tdm	phy_Sdp__Tdp	phy_SdpdmTcv
	phy_SuHPdHpuLSwLImv	phy_SuHPdLPuHSwHImv	phy_SuHPdLPuHSwLImv
	phy_SuHPdLPuLSwLImv	phy_SuLPdHPuHSwHSpi	phy_SuLPdHPuLSwLSpi
	phy_loopback_Rxcv
*******************************************************************************/
__WaveformTable WFT15 {
    __Period "tper";
    __Cell "AC1_NR+AC10_NR_STB+AC11_NR_STB" L/H WFT15_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_RZ_STB_o_cpu_done_46" L/C WFT15_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC10_NR_STB+AC11_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_RZ_STB_o_cpu_done_46+AC1_STB" 0/1/M WFT15_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +10ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC10_NR_STB+AC11_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_RZ_STB_o_cpu_done_46+AC1_STB" Z WFT15_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +10ns*(.Period/100ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT16 used in 8 patterns:
	pb_iddq_ret_chkr	pb_iddq_ret_chkr_v23	pb_iddq_ret_invchkr
	pb_iddq_ret_invchkr_v23	pb_iddq_ret_ones	pb_iddq_ret_ones_v23
	pb_iddq_ret_zeroes	pb_iddq_ret_zeroes_v23
*******************************************************************************/
__WaveformTable WFT16 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT16_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_NR_STB" L/H WFT16_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT16_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/33ns)"; __DriveData @ "tref +16ns*(.Period/33ns)"; __DriveLow @ "tref +33ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" </> WFT16_RZ2_Async_OSC0_124 {
        __Data 6/7;
        __Color 6/7;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" L/C WFT16_RZ3_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/33ns)"; __DriveData @ "tref +16ns*(.Period/33ns)"; __DriveLow @ "tref +33ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT16_RZ4_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/33ns)"; __DriveData @ "tref +16ns*(.Period/33ns)"; __DriveLow @ "tref +33ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_NR_STB" 0/1/M WFT16_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_NR_STB" Z WFT16_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" 0/1/M WFT16_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" Z WFT16_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT16_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT16_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT16_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT16_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ALLPINS" d DPM2CPM {
        __Data 3 __Other;
        __Color 3;
        __Drive {
            __Waveform {  @ "0ns"; __DriveOff @ "0ns"; }
        }
    }
    __Cell "ALLPINS" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "ALLPINS" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}

/*******************************************************************************
WFT:WFT17 used in 10 patterns:
	pb_pb_down2_1p	pb_pb_dtxn2_1p	pb_pb_flip10_1p
	pb_pb_ftr	pb_pb_mapcol_1p	pb_pb_march13n_1p
	pb_pb_pmos_open_1p_v22	pb_pb_precharge_1p	pb_pb_ptr
	pb_pb_wrenz
*******************************************************************************/
__WaveformTable WFT17 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT17_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_NR_STB" L/H WFT17_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT17_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/33ns)"; __DriveData @ "tref +16ns*(.Period/33ns)"; __DriveLow @ "tref +33ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" </> WFT17_RZ2_Async_OSC0_124 {
        __Data 6/7;
        __Color 6/7;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" L/C WFT17_RZ3_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/33ns)"; __DriveData @ "tref +16ns*(.Period/33ns)"; __DriveLow @ "tref +33ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT17_RZ4_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/33ns)"; __DriveData @ "tref +16ns*(.Period/33ns)"; __DriveLow @ "tref +33ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_NR_STB" 0/1/M WFT17_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_NR_STB" Z WFT17_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" 0/1/M WFT17_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" Z WFT17_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT17_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT17_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT17_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT17_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT17_eng used in pb_pb_mapcol_1p_PS which has only one pattern:
	pb_pb_mapcol_1p
	This pattern uses WFT17 but the Zipper Table of the pattern 
	sequence refers WFT17 to WFT17_eng
*******************************************************************************/
__WaveformTable WFT17_eng {
    __Period "tper";
    __Cell "AC1_NR+AC1_NR_STB" L/H WFT17_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT17_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/33ns) - 1.5ns"; __DriveData @ "tref +16ns*(.Period/33ns)"; __DriveLow @ "tref +33ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152" L/C WFT17_RZ3_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/33ns) - 1.5ns"; __DriveData @ "tref +16ns*(.Period/33ns)"; __DriveLow @ "tref +33ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" 0/1/M WFT17_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" Z WFT17_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT18 used in 7 patterns:
	pb_pb_down2_2p	pb_pb_dtxn2_2p	pb_pb_flip10_2p
	pb_pb_mapcol_2p	pb_pb_march13n_2p	pb_pb_pmos_open_2p
	pb_pb_precharge_2p
*******************************************************************************/
__WaveformTable WFT18 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT18_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_NR_STB" L/H WFT18_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT18_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/33ns)"; __DriveData @ "tref +16ns*(.Period/33ns)"; __DriveLow @ "tref +33ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" </> WFT18_RZ2_Async_OSC0_124 {
        __Data 6/7;
        __Color 6/7;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" L/C WFT18_RZ3_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/33ns)"; __DriveData @ "tref +16ns*(.Period/33ns)"; __DriveLow @ "tref +33ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT18_RZ4_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/33ns)"; __DriveData @ "tref +16ns*(.Period/33ns)"; __DriveLow @ "tref +33ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_NR_STB" 0/1/M WFT18_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_NR_STB" Z WFT18_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" 0/1/M WFT18_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" Z WFT18_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT18_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT18_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT18_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT18_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT19 used in 1 patterns:
	pb_pb_march13n_rep
*******************************************************************************/
__WaveformTable WFT19 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT19_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_NR_STB" L/H WFT19_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT19_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/200ns)"; __DriveData @ "tref +16ns*(.Period/200ns)"; __DriveLow @ "tref +33ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" </> WFT19_RZ2_Async_OSC0_124 {
        __Data 6/7;
        __Color 6/7;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" L/C WFT19_RZ3_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/200ns)"; __DriveData @ "tref +16ns*(.Period/200ns)"; __DriveLow @ "tref +33ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT19_RZ4_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/200ns)"; __DriveData @ "tref +16ns*(.Period/200ns)"; __DriveLow @ "tref +33ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_NR_STB" 0/1/M WFT19_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_NR_STB" Z WFT19_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" 0/1/M WFT19_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" Z WFT19_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT19_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT19_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT19_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT19_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/200ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT2 used in 10 patterns:
	a_tft_ntk_80_80_1	a_tft_ntk_80_80_10	a_tft_ntk_80_80_2
	a_tft_ntk_80_80_3	a_tft_ntk_80_80_4	a_tft_ntk_80_80_5
	a_tft_ntk_80_80_6	a_tft_ntk_80_80_7	a_tft_ntk_80_80_8
	a_tft_ntk_80_80_9
*******************************************************************************/
__WaveformTable WFT2 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT2_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC2_NR_STB" L/H WFT2_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC3_NR_STB" L/H WFT2_NR3 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT2_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" </> WFT2_RZ2_Async_OSC0_124 {
        __Data 6/7;
        __Color 6/7;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" L/C WFT2_RZ3_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT2_RZ4_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC2_NR_STB" 0/1/M WFT2_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +10ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC2_NR_STB" Z WFT2_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +10ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC3_NR_STB" 0/1/M WFT2_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC3_NR_STB" Z WFT2_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" 0/1/M WFT2_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +10ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" Z WFT2_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +10ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT2_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +10ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT2_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +10ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT2_STB5 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT2_STB5_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ALLPINS" d DPM2CPM {
        __Data 3 __Other;
        __Color 3;
        __Drive {
            __Waveform {  @ "0ns"; __DriveOff @ "0ns"; }
        }
    }
    __Cell "ALLPINS" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "ALLPINS" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}

/*******************************************************************************
WFT:WFT20 used in 32 patterns:
	pb_vl_down2_1p	pb_vl_down2_1p_v23	pb_vl_down2_2p
	pb_vl_down2_2p_v23	pb_vl_dtxn2_1p	pb_vl_dtxn2_1p_v23
	pb_vl_dtxn2_2p	pb_vl_dtxn2_2p_v23	pb_vl_flip10_1p
	pb_vl_flip10_1p_v23	pb_vl_flip10_2p	pb_vl_flip10_2p_v23
	pb_vl_ftr_read	pb_vl_ftr_read_v23	pb_vl_map_col_1p
	pb_vl_map_col_1p_v23	pb_vl_map_col_2p	pb_vl_map_col_2p_v23
	pb_vl_march13n_1p	pb_vl_march13n_1p_v23	pb_vl_march13n_2p
	pb_vl_march13n_2p_v23	pb_vl_pmos_open_1p	pb_vl_pmos_open_1p_v23
	pb_vl_pmos_open_2p	pb_vl_pmos_open_2p_v23	pb_vl_precharge_1p
	pb_vl_precharge_1p_v23	pb_vl_precharge_2p	pb_vl_precharge_2p_v23
	pb_vl_ptr_read	pb_vl_ptr_read_v23
*******************************************************************************/
__WaveformTable WFT20 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT20_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_NR_STB" L/H WFT20_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT20_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/33ns)"; __DriveData @ "tref +16ns*(.Period/33ns)"; __DriveLow @ "tref +33ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" </> WFT20_RZ2_Async_OSC0_124 {
        __Data 6/7;
        __Color 6/7;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" L/C WFT20_RZ3_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/33ns)"; __DriveData @ "tref +16ns*(.Period/33ns)"; __DriveLow @ "tref +33ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT20_RZ4_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +16ns*(.Period/33ns)"; __DriveData @ "tref +16ns*(.Period/33ns)"; __DriveLow @ "tref +33ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_NR_STB" 0/1/M WFT20_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_NR_STB" Z WFT20_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" 0/1/M WFT20_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" Z WFT20_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT20_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT20_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT20_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT20_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +14ns*(.Period/33ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ALLPINS" d DPM2CPM {
        __Data 3 __Other;
        __Color 3;
        __Drive {
            __Waveform {  @ "0ns"; __DriveOff @ "0ns"; }
        }
    }
    __Cell "ALLPINS" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "ALLPINS" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}

/*******************************************************************************
WFT:WFT21 used in 1 patterns:
	piosc_trim
*******************************************************************************/
__WaveformTable WFT21 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT21_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC12_NR_STB" L/H WFT21_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT21_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" </> WFT21_RZ2_Async_OSC0_124 {
        __Data 6/7;
        __Color 6/7;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT21_RZ3_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC12_NR_STB" 0/1/M WFT21_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC12_NR_STB" Z WFT21_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT21_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT21_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT21_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT21_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT22 used in 1 patterns:
	sleep
*******************************************************************************/
__WaveformTable WFT22 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT22_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_NR_STB" L/H WFT22_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT22_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" </> WFT22_RZ2_Async_OSC0_124 {
        __Data 6/7;
        __Color 6/7;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" L/C WFT22_RZ3_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT22_RZ4_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_NR_STB" 0/1/M WFT22_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_NR_STB" Z WFT22_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" 0/1/M WFT22_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" Z WFT22_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT22_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT22_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT22_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT22_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT23 used in 1 patterns:
	ssi0_loopback_pll_b
*******************************************************************************/
__WaveformTable WFT23 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT23_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps+1.5ns"; }
        }
    }
    __Cell "AC1_NR_STB" L/H WFT23_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps+1.5ns"; }
        }
    }
    __Cell "OSC0_124" L/C WFT23_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.5ns-10ns"; __DriveData @ "tref +50ns*(.Period/100ns)-10ns"; __DriveLow @ "tref +100ns*(.Period/100ns)-10ns"; }
        }
    }
    __Cell "AIN10_183" L/C WFT23_RZ3_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.5ns"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "TCK_152" L/C WFT23_RZ4_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.5ns+10ns"; __DriveData @ "tref +50ns*(.Period/100ns)+10ns"; __DriveLow @ "tref +100ns*(.Period/100ns)+10ns"; }
        }
    }
    __Cell "OSC0_124" 0/1/M WFT23_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "OSC0_124" Z WFT23_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_NR_STB" 0/1/M WFT23_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_NR_STB" Z WFT23_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AIN10_183" 0/1/M WFT23_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AIN10_183" Z WFT23_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT23_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT23_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT23_STB5 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT23_STB5_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ALLPINS" d DPM2CPM {
        __Data 3 __Other;
        __Color 3;
        __Drive {
            __Waveform {  @ "0ns"; __DriveOff @ "0ns"; }
        }
    }
    __Cell "ALLPINS" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "ALLPINS" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}

/*******************************************************************************
WFT:WFT24 used in 3 patterns:
	ssi1_loopback_pll_b	ssi2_loopback_pll_b	ssi3_loopback_pll_b
*******************************************************************************/
__WaveformTable WFT24 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT24_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps+1.5ns"; }
        }
    }
    __Cell "AC1_NR_STB" L/H WFT24_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps+1.5ns"; }
        }
    }
    __Cell "OSC0_124" L/C WFT24_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.5ns-10ns"; __DriveData @ "tref +50ns*(.Period/100ns)-10ns"; __DriveLow @ "tref +100ns*(.Period/100ns)-10ns"; }
        }
    }
    __Cell "AIN10_183" L/C WFT24_RZ3_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.5ns"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "TCK_152" L/C WFT24_RZ4_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.5ns+10ns"; __DriveData @ "tref +50ns*(.Period/100ns)+10ns"; __DriveLow @ "tref +100ns*(.Period/100ns)+10ns"; }
        }
    }
    __Cell "AC1_NR_STB" 0/1/M WFT24_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_NR_STB" Z WFT24_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AIN10_183" 0/1/M WFT24_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AIN10_183" Z WFT24_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "TCK_152" 0/1/M WFT24_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "TCK_152" Z WFT24_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT24_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT24_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ALLPINS" d DPM2CPM {
        __Data 3 __Other;
        __Color 3;
        __Drive {
            __Waveform {  @ "0ns"; __DriveOff @ "0ns"; }
        }
    }
    __Cell "ALLPINS" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "ALLPINS" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}

/*******************************************************************************
WFT:WFT25 used in 4 patterns:
	syspll_lock	syspll_lock_max	syspll_lock_min
	usbpll_lock
*******************************************************************************/
__WaveformTable WFT25 {
    __Period "tper";
    __Cell "AC1_NR+AC12_NR_STB-o_cpu_done_46-AIN10_183" L/H WFT25_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "OSC0_124+TCK_152+o_cpu_done_46+AIN10_183" L/C WFT25_RZ1 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "OSC0_124+TCK_152+o_cpu_done_46+AIN10_183" H WFT25_NR1Clk {
        __Data 7;
        __Color 6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC12_NR_STB+AC1_RZ_STB_TCK_152+AC1_STB" 0/1/M WFT25_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC12_NR_STB+AC1_RZ_STB_TCK_152+AC1_STB" Z WFT25_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT26 used in 3 patterns:
	wdtimer0_reset_pll_v23	wdtimer1_reset_pll_v23	wdtimer1_reset_pll_v24
*******************************************************************************/
__WaveformTable WFT26 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT26_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_NR_STB" L/H WFT26_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_RZ_STB_OSC0_124" L/C WFT26_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_OSC0_124" </> WFT26_RZ2_Async_OSC0_124 {
        __Data 6/7;
        __Color 6/7;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" L/C WFT26_RZ3_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT26_RZ4_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_OSC0_124" 0/1/M WFT26_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_OSC0_124" Z WFT26_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_NR_STB" 0/1/M WFT26_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_NR_STB" Z WFT26_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" 0/1/M WFT26_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" Z WFT26_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT26_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT26_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT26_STB5 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT26_STB5_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ALLPINS" d DPM2CPM {
        __Data 3 __Other;
        __Color 3;
        __Drive {
            __Waveform {  @ "0ns"; __DriveOff @ "0ns"; }
        }
    }
    __Cell "ALLPINS" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "ALLPINS" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}

/*******************************************************************************
WFT:WFT27 used in 1 patterns:
	bi_atpg_a2
*******************************************************************************/
__WaveformTable WFT27 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT27_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_NR_STB" L/H WFT27_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT27_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/200ns)"; __DriveData @ "tref +50ns*(.Period/200ns)"; __DriveLow @ "tref +150ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" L/C WFT27_RZ2_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/200ns)"; __DriveData @ "tref +50ns*(.Period/200ns)"; __DriveLow @ "tref +150ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT27_RZ3_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/200ns)"; __DriveData @ "tref +50ns*(.Period/200ns)"; __DriveLow @ "tref +150ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_NR_STB" 0/1/M WFT27_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +180ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_NR_STB" Z WFT27_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +180ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" 0/1/M WFT27_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +180ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" Z WFT27_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +180ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT27_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +180ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT27_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +180ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT27_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +180ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT27_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +180ns*(.Period/200ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT28 used in 1 patterns:
	bi_atpg7
*******************************************************************************/
__WaveformTable WFT28 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT28_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_NR_STB" L/H WFT28_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT28_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/200ns)"; __DriveData @ "tref +50ns*(.Period/200ns)"; __DriveLow @ "tref +150ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" L/C WFT28_RZ2_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/200ns)"; __DriveData @ "tref +50ns*(.Period/200ns)"; __DriveLow @ "tref +150ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" L/C WFT28_RZ3_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/200ns)"; __DriveData @ "tref +50ns*(.Period/200ns)"; __DriveLow @ "tref +150ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_NR_STB" 0/1/M WFT28_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +50ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_NR_STB" Z WFT28_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +50ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" 0/1/M WFT28_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +50ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" Z WFT28_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +50ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" 0/1/M WFT28_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +50ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152" Z WFT28_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +50ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT28_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +50ns*(.Period/200ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT28_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +50ns*(.Period/200ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

/*******************************************************************************
WFT:WFT3 used in 2 patterns:
	a_tft_tk_16_16_2	a_tft_tk_16_16_3
*******************************************************************************/
__WaveformTable WFT3 {
    __Period "tper";
    __Cell "AC1_NR+AC1_NR_STB-o_cpu_done_46" L/H WFT3_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+o_cpu_done_46" L/C WFT3_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "o_cpu_done_46" H WFT3_NRZDriveClk {
        __Data 7;
        __Color 6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" < WFT3_RZ2_Async_OSC0_124 {
        __Data 6;
        __Color 6;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" 0/1/M WFT3_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" Z WFT3_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ALLPINS" d DPM2CPM {
        __Data 3 __Other;
        __Color 3;
        __Drive {
            __Waveform {  @ "0ns"; __DriveOff @ "0ns"; }
        }
    }
    __Cell "ALLPINS" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "ALLPINS" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}

/*******************************************************************************
WFT:WFT4 used in 1 patterns:
	a_tft_tk_25_25_1
*******************************************************************************/
__WaveformTable WFT4 {
    __Period "tper";
    __Cell "AC1_NR+AC1_NR_STB-o_cpu_done_46" L/H WFT4_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+o_cpu_done_46" L/C WFT4_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "o_cpu_done_46" H WFT4_NRZDriveClk {
        __Data 7;
        __Color 6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" < WFT4_RZ2_Async_OSC0_124 {
        __Data 6;
        __Color 6;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" 0/1/M WFT4_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" Z WFT4_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ALLPINS" d DPM2CPM {
        __Data 3 __Other;
        __Color 3;
        __Drive {
            __Waveform {  @ "0ns"; __DriveOff @ "0ns"; }
        }
    }
    __Cell "ALLPINS" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "ALLPINS" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}

/*******************************************************************************
WFT:WFT5 used in 2 patterns:
	a_tft_tk_33_33_1	a_tft_tk_33_33_2
*******************************************************************************/
__WaveformTable WFT5 {
    __Period "tper";
    __Cell "AC1_NR+AC1_NR_STB-o_cpu_done_46" L/H WFT5_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+o_cpu_done_46" L/C WFT5_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "o_cpu_done_46" H WFT5_NRZDriveClk {
        __Data 7;
        __Color 6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" < WFT5_RZ2_Async_OSC0_124 {
        __Data 6;
        __Color 6;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" 0/1/M WFT5_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183+AC1_NR_STB+AC1_RZ_STB_TCK_152+AC1_STB" Z WFT5_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ALLPINS" d DPM2CPM {
        __Data 3 __Other;
        __Color 3;
        __Drive {
            __Waveform {  @ "0ns"; __DriveOff @ "0ns"; }
        }
    }
    __Cell "ALLPINS" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "ALLPINS" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}

/*******************************************************************************
WFT:WFT6 used in 1 patterns:
	a_tft_tk_40_40_1
*******************************************************************************/
__WaveformTable WFT6 {
    __Period "tper";
    __Cell "AC1_NR+AC1_NR_STB-o_cpu_done_46" L/H WFT6_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+o_cpu_done_46" L/C WFT6_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "o_cpu_done_46" H WFT6_NRZDriveClk {
        __Data 7;
        __Color 6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" < WFT6_RZ2_Async_OSC0_124 {
        __Data 6;
        __Color 6;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                          @ D1 -> "2 * tperAsync"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" 0/1/M WFT6_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" Z WFT6_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ALLPINS" d DPM2CPM {
        __Data 3 __Other;
        __Color 3;
        __Drive {
            __Waveform {  @ "0ns"; __DriveOff @ "0ns"; }
        }
    }
    __Cell "ALLPINS" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "ALLPINS" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}

/*******************************************************************************
WFT:WFT7 used in 46 patterns:
	a_tft_tk_80_80_1	a_tft_tk_80_80_10	a_tft_tk_80_80_11
	a_tft_tk_80_80_12	a_tft_tk_80_80_13	a_tft_tk_80_80_14
	a_tft_tk_80_80_15	a_tft_tk_80_80_16	a_tft_tk_80_80_17
	a_tft_tk_80_80_18	a_tft_tk_80_80_19	a_tft_tk_80_80_2
	a_tft_tk_80_80_20	a_tft_tk_80_80_21	a_tft_tk_80_80_22
	a_tft_tk_80_80_23	a_tft_tk_80_80_24	a_tft_tk_80_80_25
	a_tft_tk_80_80_26	a_tft_tk_80_80_27	a_tft_tk_80_80_28
	a_tft_tk_80_80_29	a_tft_tk_80_80_3	a_tft_tk_80_80_30
	a_tft_tk_80_80_31	a_tft_tk_80_80_32	a_tft_tk_80_80_33
	a_tft_tk_80_80_34	a_tft_tk_80_80_35	a_tft_tk_80_80_36
	a_tft_tk_80_80_37	a_tft_tk_80_80_38	a_tft_tk_80_80_39
	a_tft_tk_80_80_4	a_tft_tk_80_80_40	a_tft_tk_80_80_41
	a_tft_tk_80_80_42	a_tft_tk_80_80_43	a_tft_tk_80_80_44
	a_tft_tk_80_80_45	a_tft_tk_80_80_46	a_tft_tk_80_80_47
	a_tft_tk_80_80_5	a_tft_tk_80_80_6	a_tft_tk_80_80_8
	a_tft_tk_80_80_9
*******************************************************************************/
__WaveformTable WFT7 {
    __Period "tper";
    __Cell "AC1_NR+AC1_NR_STB-o_cpu_done_46" L/H WFT7_NR {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "AC1_RZ_STB_TCK_152+o_cpu_done_46" L/C WFT7_RZ1_OSC {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)-1.5ns-4ns"; __DriveData @ "tref +9ns*(.Period/50ns)-4ns"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_RZ_STB_AIN10_183" L/C WFT7_RZ1_AIN10 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)-1.5ns+14ns"; __DriveData @ "tref +9ns*(.Period/50ns)+14ns"; __DriveLow @ "tref +23ns*(.Period/50ns)+14ns"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" L/C WFT7_RZ1_OSC0 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)-1.5ns"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)+4ns"; }
        }
    }
    __Cell "o_cpu_done_46" H WFT7_NRZDriveClk {
        __Data 7;
        __Color 6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" 0/1/M WFT7_STB {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_NR_STB+AC1_RZ_STB_AIN10_183+AC1_RZ_STB_TCK_152+AC1_STB" Z WFT7_STB_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ALLPINS" d DPM2CPM {
        __Data 3 __Other;
        __Color 3;
        __Drive {
            __Waveform {  @ "0ns"; __DriveOff @ "0ns"; }
        }
    }
    __Cell "ALLPINS" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "ALLPINS" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}

/*******************************************************************************
WFT:WFT8 used in 41 patterns:
	bg_temp_trim	deep_sleep	deep_sleep_ldo_byp
	deep_sleep_ldo_byp_v2	deep_sleep_ldo_en	deep_sleep_ldo_en_v2
	deep_sleep_v23	fancontrol_reg_rdwr	gpt0_1s_32_down
	gpt10_per_32_down	gpt11_per_32_down	gpt1_1s_32_down
	gpt2_1s_32_down	gpt3_1s_32_down	gpt4_1s_32_down
	gpt5_1s_32_down	gpt6_per_32_down	gpt7_per_32_down
	gpt8_per_32_down	gpt9_per_32_down	hibana_hibn
	hibana_hysvreg	hibana_lbc_vbat19	hibana_lbc_vbat21
	hibana_lbc_vbat23	hibana_lbc_vbat25	hibana_vbapiok
	hibernate_rtcGen	hibernate_rtcSec	hibernate_vabort
	hibernate_vbatchk	iref_trim	lpc_reg_access
	pwm_0_int_check	pwm_1_int_check	qei0dirintlpbk
	qei1dirintlpbk	sleep_ldo_byp	sleep_ldo_en
	sysctldsldo_pioscpd	usbphy
*******************************************************************************/
__WaveformTable WFT8 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT8_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps+1.5ns"; }
        }
    }
    __Cell "AC1_NR_STB" L/H WFT8_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps+1.5ns"; }
        }
    }
    __Cell "TCK_152" L/C WFT8_RZ_TCK {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.5ns"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AIN10_183" L/C WFT8_RZ_AIN10 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.5ns"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "OSC0_124" L/C WFT8_RZ_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.5ns"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "TCK_152+AC1_NR_STB+AIN10_183+AC1_STB" 0/1/M WFT8_STB {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_NR_STB+AIN10_183+TCK_152+AC1_STB" Z WFT8_STB_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ALLPINS" d DPM2CPM {
        __Data 3 __Other;
        __Color 3;
        __Drive {
            __Waveform {  @ "0ns"; __DriveOff @ "0ns"; }
        }
    }
    __Cell "ALLPINS" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "ALLPINS" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}

/*******************************************************************************
WFT:WFT9 used in 19 patterns:
	ahbm_write_buffer_v23	candmalbtx0rx1_1beat	candmalbtx1rx0_1beat
	eeprom_wdone_int	hib_rtcsec_subsec	hibernate_reg_rw
	i2c0_dma	i2c1_dma	i2c2_dma
	i2c3_dma	i2c4_dma	u0u1_8bit_mode
	u0u2_8bit_mode	u0u3_8bit_mode	u0u4_8bit_mode
	u0u5_8bit_mode	u0u6_8bit_mode	u0u7_8bit_mode
	udma_ping_pong
*******************************************************************************/
__WaveformTable WFT9 {
    __Period "tper";
    __Cell "AC1_NR" L/H WFT9_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps+1.5ns"; }
        }
    }
    __Cell "AC4_NR_STB" L/H WFT9_NR2 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps+1.5ns"; }
        }
    }
    __Cell "AC5_NR_STB" L/H WFT9_NR3 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps+1.5ns"; }
        }
    }
    __Cell "OSC0_124" L/C WFT9_RZ1_OSC0_124 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.5ns"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AIN10_183" L/C WFT9_RZ2_AIN10_183 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.5ns"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "TCK_152" L/C WFT9_RZ3_TCK_152 {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +50ns*(.Period/100ns)-1.5ns"; __DriveData @ "tref +50ns*(.Period/100ns)"; __DriveLow @ "tref +100ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC4_NR_STB" 0/1/M WFT9_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC4_NR_STB" Z WFT9_STB1_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC5_NR_STB" 0/1/M WFT9_STB2 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +95ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC5_NR_STB" Z WFT9_STB2_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +95ns*(.Period/100ns)"; }
        }
    }
    __Cell "AIN10_183" 0/1/M WFT9_STB3 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AIN10_183" Z WFT9_STB3_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "TCK_152" 0/1/M WFT9_STB4 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "TCK_152" Z WFT9_STB4_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" 0/1/M WFT9_STB5 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "AC1_STB" Z WFT9_STB5_Z {
        __Data 2;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "tref"; }
        }
        __Compare {
            __Waveform { __CompareFloat @ "tref +90ns*(.Period/100ns)"; }
        }
    }
    __Cell "ALLPINS" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
}

__WaveformTable WFT99 {
    __Period "tper";
    __Cell "ScanHeader2_PL+o_cpu_done_46+XOSC0_100+PB0_129+PB1_130+TDI_150+TMS_151+TCK_152+AIN10_183" L/H ScanHeader2_PL {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "ScanHeader2_PL" 0/1 WFT99_STB {
        __Data 0/1;
        __Color 8/10;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "ALLPINS" M _M_ {
        __Data 2;
        __Color 7;
        __Drive {
            __Waveform { __DriveOff; }
        }
    }
    __Cell "ALLPINS-ScanHeader2_PL-AIN10_183+PA2_48+PA3_49+PA4_50+PA5_51+PA6_54+PA7_55" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ScanHeader2_PL" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "ScanHeader2_PL" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}
/*__WaveformTable WFT999_scan {
    __Period "tper";
    __Cell "ScanHeader2_PL" 0/1 WFT999_STB_scan {
        __Data 0/1;
        __Color 8/10;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "18ns"; }
        }
    }
    __Cell "ScanHeader2_PL+o_cpu_done_46+XOSC0_100+PB0_129+PB1_130+TDI_150+TMS_151+TCK_152+AIN10_183" L/H WFT999_DRV_scan {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; }
        }
    }
    __Cell "AIN10_183" L/C WFT999_RZ1_OSC {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "ALLPINS" M WFT999_MSK_scan {
        __Data 2;
        __Color 7;
        __Drive {
            __Waveform { __DriveOff; }
        }
    }
    __Cell "ALLPINS-ScanHeader2_PL-AIN10_183+PA2_48+PA3_49+PA4_50+PA5_51+PA6_54+PA7_55" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "ScanHeader2_PL" i WFT999_SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "ScanHeader2_PL" o WFT999_SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}*/
/*__WaveformTable WFT999_basic {
    __Period "tper";
    __Cell "ScanHeader2_PL" 0/1 WFT999_STB {
        __Data 0/1;
        __Color 8/10;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +9ns*(.Period/50ns)"; }
        }
    }
    __Cell "ScanHeader2_PL+o_cpu_done_46+XOSC0_100+PB0_129+PB1_130+TDI_150+TMS_151+TCK_152" L/H WFT999_DRV {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "ALLPINS" M WFT999_MSK {
        __Data 2;
        __Color 7;
        __Drive {
            __Waveform { __DriveOff; }
        }
    }
    __Cell "AIN10_183" L/C WFT999_RZ1_OSC {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "AC1_RZ_OSC0_124" </> WFT7_RZ2_Async_OSC0_124 {
        __Data 6/7;
        __Color 6/7;
        __Drive {
            __EntryState __DriveLow;
            __Waveform { __DriveHigh @ "tperAsync/2"; __DriveLow @ "tperAsync"; __DriveHigh @ "3*tperAsync/2"; __DriveLow @ "2 * tperAsync";
                         __PeriodMarker @ D1 -> "2 * tperAsync"; }
        }
    }
}*/


/*******************************************************************************
WFT:Test_basic_SH3 used to verify general scan pattern & waveform:
*******************************************************************************/
__WaveformTable Test_basic_SH3 {
    __Period "tper";
    __Cell "ALLPINS" 0/1/M WFT1_STB1 {
        __Data 0/1/2;
        __Color 8/10/3;
        __Drive {
            __Waveform { __DriveOff @ "tref +0ps"; }
        }
        __Compare {
            __Waveform { __CompareData @ "tref +9ns*(.Period/50ns)"; }
        }
    }
}

/*******************************************************************************
WFT:Test_scan_SH3 used to verify general scan pattern & waveform:
*******************************************************************************/
__WaveformTable Test_scan_SH3 {
    __Period "tper";
    __Cell "ScanHeader3_PL" 0/1 Test_NR1_scan {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps"; }
        }
    }
    __Cell "AIN10_183" L/C Test_RZ_scan {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
        }
    }
    __Cell "ScanHeader3_PL_outs" 0/1/M WFT1_STB1 {
        __Data 0/1/2;
        __Color 8/10/7;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "18ns"; }
        }
    }
    __Cell "AIN15_1+AIN14_2+AIN13_3+AIN12_4+PQ0_5+PQ1_6+rbias_9+PB6_10+PB7_15+PQ2_16+AIN16_23+AIN17_24+AIN18_25+AIN19_26+PN2_27+PH7_28+PH6_29+PH5_30+PH4_35+PH3_36+PH2_37+PH1_40+PH0_41+o_cpu_done_46+o_cpu_fail_47+PG7_56+PG6_57+PP2_58+PP5_59+RAWPOR_n_60+PQ3_61+PQ4_62+PQ5_63+PQ6_64+PQ7_65+FLASH3_70+FLASH4_71+FLASH5_72+PG5_76+PG4_77+PG3_78+PG2_79+PG1_80+PG0_81+PF7_84+PF6_85+PF5_86+TRD3_87+PN7_94+PN6_95+PN5_96+PN4_97+wake_n_98+hib_n_99+XOSC0_100+XOSC1_102+PP3_106+PP4_107+PP1_108+PP0_109+PM7_110+PM6_111+LPC0CLK_116+LPC0SERIRQ_117+LPC0A20_118+LPC0CLKRUN_n_119+LPC0SCI_n_120+LPC0PD_n_121+RST_n_122+OSC0_124+OSC1_125+USB0DM_127+USB0DP_128+PB2_131+ia_ftestadc_132+LPC0RESET_n_135+LPC0FRAME_n_136+LPC0AD0_137+LPC0AD1_138+LPC0AD2_139+LPC0AD3_140+PK7_141+PK6_142+PK5_143+PK4_144+TDO_149+TDI_150+TMS_151+TCK_152+PN3_153+PJ0_158+PJ1_159+PJ2_160+PJ3_161+RAWPOR_N_TEST_162+PP6_163+POR_ORIDE_164+C2_p_174+C2_n_175+PJ6_176+PJ7_177+AIN23_178+AIN22_179+AIN21_180+AIN20_181+AIN11_182+AIN09_188+AIN08_189+AIN07_190+AIN06_191+AIN05_192" - HoldStateWF {
        __Data 6;
        __Color 7;
        __Drive {
            __Waveform { }
        }
    }
    __Cell "PA2_48+PA3_49+PA4_50+PA5_51+PA6_54+PA7_55+PB0_129+PB1_130" i SCANDRIVE {
        __Data 6 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOn @ "0ns"; __DriveData @ "0ns"; }
        }
    }
    __Cell "PF3_91+C0_n_42+C0_p_43+C1_p_44+C1_n_45+TRD2_88+TRD1_89+TRD0_90" o SCANSTROBE {
        __Data 3 __Serial;
        __Color 3;
        __Drive {
            __Waveform { __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}
