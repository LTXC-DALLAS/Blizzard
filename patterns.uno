Unison:U1.0c:S5.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/patterns.evo                                   */
/* Creation Date  : Tue Jan  3 17:12:46 2012                                  */
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
/***  The file patterns.evo provides the information about enVision  ***/
/***  test patterns used in the program. This file has three         ***/
/***  sections:                                                      ***/
/***     SignalHeader - Provides the map of DUT Pin Name to its      ***/
/***                    position in the pattern line.                ***/
/***     PatternMap   - Provides the path name of the patterns files ***/
/***                    to be loaded.                                ***/
/***     Thread       - Describes sequences of patterns to be run.   ***/
/***                                                                 ***/
/***********************************************************************/

        /***********************************************************/
        /***             Signal Header                           ***/
        /***********************************************************/
        /***                                                     ***/
        /*** This section describes the arrangement of data in   ***/
        /*** the pattern source files. Essentially, a map of     ***/
        /*** which DUT pins are associated with which column in  ***/
        /*** the patterns. Normally, a device program would have ***/
        /*** one of these for functional patterns, and possibly  ***/
        /*** several for scan patterns. The Scan SignalHeader    ***/
        /*** provides a bit of extra data needed by the pattern  ***/
        /*** compiler to determine what to do in scan patterns.  ***/
        /***                                                     ***/
        /*** The simplest form of a SignalHead is simply a blank ***/
        /*** separated list of Pin names. Additional options are ***/
        /*** a % sign (causes a space to be expected before that ***/
        /*** pin in the pattern), and a Hex option (causes the   ***/
        /*** following to be interpreted as Hex code. The Hex    ***/
        /*** requires an extra character in the pattern to       ***/
        /*** select the Wave/Format for each Hex group.          ***/
        /***                                                     ***/
        /***                     Examples                        ***/
        /***           Signal Header                   Pat Data  ***/
        /***           -------------                   --------  ***/
        /***  SignalHeader Name { A3 A2 A1 A0 }         1010     ***/
        /***  SignalHeader Name { A3 A2 %A1 A0 }        10 10    ***/
        /***  SignalHeader Name { ABus {A3 A2 A1 A0 }   hA       ***/
        /***                                                     ***/
        /***       The 'h' selects the correct timing/format     ***/
        /***                                                     ***/
        /*** The SignalHeader for a Scan chain has additional    ***/
        /*** requirements:                                       ***/
        /***  ScanLength= The number of bits in a scan chain     ***/
        /***  Fill      = Data to fill with when necessary       ***/
        /***  PostFill  = Filling occurs after chain is run      ***/
        /***********************************************************/

/********************************/
/******** Signal Headers ********/
/********************************/
__SignalHeader allFuncPins {
    __Signals {
        AIN15_1 AIN14_2 AIN13_3 AIN12_4 PQ0_5 PQ1_6 rbias_9 PB6_10 PB7_15 PQ2_16 AIN16_23 AIN17_24 AIN18_25 AIN19_26 PN2_27 PH7_28
    }
}
__SignalHeader DefaultSignalHeader {
    __Signals {
        AIN15_1 AIN14_2 AIN13_3 AIN12_4 PQ0_5 PQ1_6 rbias_9 PB6_10 PB7_15 PQ2_16 AIN16_23 AIN17_24 AIN18_25 AIN19_26 PN2_27 PH7_28
        PH6_29 PH5_30 PH4_35 PH3_36 PH2_37 PH1_40 PH0_41 C0_n_42 C0_p_43 C1_p_44 C1_n_45 o_cpu_done_46 o_cpu_fail_47 PA2_48 PA3_49 PA4_50
        PA5_51 PA6_54 PA7_55 PG7_56 PG6_57 PP2_58 PP5_59 RAWPOR_n_60 PQ3_61 PQ4_62 PQ5_63 PQ6_64 PQ7_65 FLASH3_70 FLASH4_71 FLASH5_72
        PG5_76 PG4_77 PG3_78 PG2_79 PG1_80 PG0_81 PF7_84 PF6_85 PF5_86 TRD3_87 TRD2_88 TRD1_89 TRD0_90 PF3_91 PN7_94 PN6_95
        PN5_96 PN4_97 wake_n_98 hib_n_99 XOSC0_100 XOSC1_102 PP3_106 PP4_107 PP1_108 PP0_109 PM7_110 PM6_111 LPC0CLK_116 LPC0SERIRQ_117 LPC0A20_118 LPC0CLKRUN_n_119
        LPC0SCI_n_120 LPC0PD_n_121 RST_n_122 OSC0_124 OSC1_125 USB0DM_127 USB0DP_128 PB0_129 PB1_130 PB2_131 ia_ftestadc_132 LPC0RESET_n_135 LPC0FRAME_n_136 LPC0AD0_137 LPC0AD1_138 LPC0AD2_139
        LPC0AD3_140 PK7_141 PK6_142 PK5_143 PK4_144 TDO_149 TDI_150 TMS_151 TCK_152 PN3_153 PJ0_158 PJ1_159 PJ2_160 PJ3_161 RAWPOR_N_TEST_162 PP6_163
        POR_ORIDE_164 C2_p_174 C2_n_175 PJ6_176 PJ7_177 AIN23_178 AIN22_179 AIN21_180 AIN20_181 AIN11_182 AIN10_183 AIN09_188 AIN08_189 AIN07_190 AIN06_191 AIN05_192
    }
}
__SignalHeader EVASignalHeader {
    __Signals {
        AIN15_1 AIN14_2 AIN13_3 AIN12_4 PQ0_5 PQ1_6 PB6_10 PB7_15 PQ2_16 AIN16_23 AIN17_24 AIN18_25 AIN19_26 PN2_27 PH7_28
        PH6_29 PH5_30 PH4_35 PH3_36 PH2_37 PH1_40 PH0_41 C0_n_42 C0_p_43 C1_p_44 C1_n_45 o_cpu_done_46 o_cpu_fail_47 PA2_48 PA3_49 PA4_50
        PA5_51 PA6_54 PA7_55 PG7_56 PG6_57 PP2_58 PP5_59 RAWPOR_n_60 PQ3_61 PQ4_62 PQ5_63 PQ6_64 PQ7_65
        PG5_76 PG4_77 PG1_80 PG0_81 PF7_84 PF6_85 PF5_86 TRD3_87 TRD2_88 TRD1_89 TRD0_90 PF3_91 PN7_94 PN6_95
        PN5_96 PN4_97 wake_n_98 hib_n_99 XOSC0_100 PP3_106 PP4_107 PP1_108 PP0_109 PM7_110 PM6_111 LPC0CLK_116 LPC0SERIRQ_117 LPC0A20_118 LPC0CLKRUN_n_119
        LPC0SCI_n_120 LPC0PD_n_121 RST_n_122 OSC0_124 USB0DM_127 USB0DP_128 PB0_129 PB1_130 PB2_131 ia_ftestadc_132 LPC0RESET_n_135 LPC0FRAME_n_136 LPC0AD0_137 LPC0AD1_138 LPC0AD2_139
        LPC0AD3_140 PK7_141 PK6_142 PK5_143 PK4_144 TDO_149 TDI_150 TMS_151 TCK_152 PN3_153 PJ1_159
        C2_p_174 C2_n_175 PJ6_176 PJ7_177 AIN22_179 AIN21_180 AIN20_181 AIN11_182 AIN10_183 AIN09_188 AIN08_189 AIN07_190 AIN06_191 AIN05_192
    }
}

__SignalHeader ScanHeader2 {
    __Signals {
        PA2_48 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        C1_n_45 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
        PA3_49 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        C1_p_44 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
        PA4_50 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        C0_p_43 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
        PA5_51 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        C0_n_42 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
        PA6_54 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        TRD2_88 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
        PA7_55 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        TRD1_89 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
        PB0_129 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        TRD0_90 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
        PB1_130 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        PF3_91 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
    }
}
__SignalHeader ScanHeader1_261 {
    __Signals {
        PA2_48 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        C1_n_45 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
        PA3_49 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        C1_p_44 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
        PA4_50 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        C0_p_43 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
        PA5_51 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        C0_n_42 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
        PA6_54 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        TRD2_88 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
        PA7_55 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        TRD1_89 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
        PB0_129 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        TRD0_90 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
        PB1_130 { __Scan, __ScanLength = 261, __Fill = L, __PreFill; }
        PF3_91 { __Scan, __ScanLength = 261, __Fill = M, __PostFill; }
    }
}
__SignalHeader ScanHeader1_9682 {
    __Signals {
        PA2_48 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        C1_n_45 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
        PA3_49 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        C1_p_44 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
        PA4_50 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        C0_p_43 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
        PA5_51 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        C0_n_42 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
        PA6_54 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        TRD2_88 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
        PA7_55 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        TRD1_89 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
        PB0_129 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        TRD0_90 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
        PB1_130 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        PF3_91 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
    }
}

__SignalHeader ScanHeader1 {
    __Signals {
        PA2_48 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        C1_n_45 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
        PA3_49 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        C1_p_44 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
        PA4_50 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        C0_p_43 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
        PA5_51 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        C0_n_42 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
        PA6_54 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        TRD2_88 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
        PA7_55 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        TRD1_89 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
        PB0_129 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        TRD0_90 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
        PB1_130 { __Scan, __ScanLength = 9682, __Fill = L, __PreFill; }
        PF3_91 { __Scan, __ScanLength = 9682, __Fill = M, __PostFill; }
    }
}

__SignalHeader ScanHeader3 {
    __Signals {
        PA2_48 { __Scan, __ScanLength = 291, __Fill = L, __PreFill; }
        C1_n_45 { __Scan, __ScanLength = 291, __Fill = M, __PostFill; }
        PA3_49 { __Scan, __ScanLength = 291, __Fill = L, __PreFill; }
        C1_p_44 { __Scan, __ScanLength = 291, __Fill = M, __PostFill; }
        PA4_50 { __Scan, __ScanLength = 291, __Fill = L, __PreFill; }
        C0_p_43 { __Scan, __ScanLength = 291, __Fill = M, __PostFill; }
        PA5_51 { __Scan, __ScanLength = 291, __Fill = L, __PreFill; }
        C0_n_42 { __Scan, __ScanLength = 291, __Fill = M, __PostFill; }
        PA6_54 { __Scan, __ScanLength = 291, __Fill = L, __PreFill; }
        TRD2_88 { __Scan, __ScanLength = 291, __Fill = M, __PostFill; }
        PA7_55 { __Scan, __ScanLength = 291, __Fill = L, __PreFill; }
        TRD1_89 { __Scan, __ScanLength = 291, __Fill = M, __PostFill; }
        PB0_129 { __Scan, __ScanLength = 291, __Fill = L, __PreFill; }
        TRD0_90 { __Scan, __ScanLength = 291, __Fill = M, __PostFill; }
        PB1_130 { __Scan, __ScanLength = 291, __Fill = L, __PreFill; }
        PF3_91 { __Scan, __ScanLength = 291, __Fill = M, __PostFill; }
    }
}

__SignalHeader LDO_Bypass_SH {
    __Signals {
        AIN15_1 AIN14_2 AIN13_3 AIN12_4 PQ0_5 PQ1_6 rbias_9 PB6_10 PB7_15 PQ2_16 AIN00_17 
	AIN01_18 AIN02_19 ATEST AIN16_23 AIN17_24 AIN18_25 AIN19_26 PN2_27 PH7_28 PH6_29 
	PH5_30 PH4_35 PH3_36 PH2_37 PH1_40 PH0_41 C0_n_42 C0_p_43 C1_p_44 C1_n_45 
	o_cpu_done_46 o_cpu_fail_47 PA2_48 PA3_49 PA4_50 PA5_51 PA6_54 PA7_55 PG7_56 
	PG6_57 PP2_58 PP5_59 RAWPOR_n_60 PQ3_61 PQ4_62 PQ5_63 PQ6_64 PQ7_65 FLASH3_70 
	FLASH4_71 FLASH5_72 PG5_76 PG4_77 PG3_78 PG2_79 PG1_80 PG0_81 PF7_84 PF6_85 
	PF5_86 TRD3_87 TRD2_88 TRD1_89 TRD0_90 PF3_91 PN7_94 PN6_95 PN5_96 PN4_97 
	wake_n_98 hib_n_99 XOSC0_100 XOSC1_102 PP3_106 PP4_107 PP1_108 PP0_109 PM7_110 
	PM6_111 LPC0CLK_116 LPC0SERIRQ_117 LPC0A20_118 LPC0CLKRUN_n_119 LPC0SCI_n_120 
	LPC0PD_n_121 RST_n_122 OSC0_124 OSC1_125 USB0DM_127 USB0DP_128 PB0_129 PB1_130 
	PB2_131 ia_ftestadc_132 LPC0RESET_n_135 LPC0FRAME_n_136 LPC0AD0_137 LPC0AD1_138 
	LPC0AD2_139 LPC0AD3_140 PK7_141 PK6_142 PK5_143 PK4_144 TDO_149 TDI_150 TMS_151 
	TCK_152 PN3_153 PJ0_158 PJ1_159 PJ2_160 PJ3_161 RAWPOR_N_TEST_162 PP6_163 
	POR_ORIDE_164 C2_p_174 C2_n_175 PJ6_176 PJ7_177 AIN23_178 AIN22_179 AIN21_180 
	AIN20_181 AIN11_182 AIN10_183 AIN09_188 AIN08_189 AIN07_190 AIN06_191 AIN05_192 
	AIN04_193
    }
}

/******************/
/*** PatternMap ***/
/******************/

// PatternMap syntax:
//
// PatternMap PatternMap_Global {
//
//  InheritFrom = "PatternMap_1 PatternMap_2";         // Other PatternMaps to inherit from
//   DefaultSourcePath = "./Patterns/Ascii";           // Default location of evo's
//   DefaultBinaryPath = "./Patterns/Binary/$TESTER"; // Default location of epf's
//   DefaultPatternGroup = "TDLStdPatGrp";             // TDLStdPatGrp or SCANPatGrp
//
//   Pattern <name> { <filename>, <sourcepath>, <binarypath>, <patterngroup>, <remove> }
//     //name = enVision pattern object name
//
//     . filename,sourcepath,binarypath,patterngroup,remove can be
//       strings, or expressions, or be left blank
//     . If left blank, filename defaults to name
//     . remove = true disables loading of pattern
// }
/*__PatternMap EvaSH_PatternMap {
    __DefaultSourcePath = "./Patterns/Ascii";
    __DefaultBinaryPath = "./Patterns/Binary/$TESTER";
    __DefaultPatternGroup = "EVA_SH_PatGrp";
    __Pattern pb_pb_mapcol_1p_ENG_SH2 {
        __File "pb_pb_mapcol_1p_ENG_SH2";
        __Path "./Patterns/Ascii";
    }
}*/
__PatternMap DefaultPatternMap {
    __DefaultSourcePath = "./Patterns/Ascii";
    __DefaultBinaryPath = "./Patterns/Binary/$TESTER";
    __DefaultPatternGroup = "TDLStdPatGrp";
    __Pattern TestPatScan {
        __File "TestPatScan";
        __Path "./Patterns/Ascii";
    }
    __Pattern ScanDebug {
        __File "ScanDebug";
        __Path "./Patterns/Ascii";
    }
    __Pattern ScanDebug_Osc0 {
        __File "ScanDebug_Osc0";
        __Path "./Patterns/Ascii";
    }
    __Pattern ScanDebug_Osc02 {
        __File "ScanDebug_Osc02";
        __Path "./Patterns/Ascii";
    }
    __Pattern ScanDebugVVS {
        __File "ScanDebugVVS";
        __Path "./Patterns/Ascii";
    }
    __Pattern fancontrol_reg_rdwr {
        __File "fancontrol_reg_rdwr";
        __Path "./Patterns/Ascii";
    }
    __Pattern wdtimer0_reset_pll_v23 {
        __File "wdtimer0_reset_pll_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_1_DSH {
        __File "a_st_tk_1_DSH";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_1_DSH1 {
        __File "a_st_tk_1_DSH1";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_1_v22SH261 {
        __File "a_st_tk_1_v22SH261";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_1_v22SH9682 {
        __File "a_st_tk_1_v22SH9682";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_1_v22SH9682_Fail {
        __File "a_st_tk_1_v22SH9682_Fail";
        __Path "./Patterns/Ascii";
    }
    __Pattern st_tk_init_byhand {
        __File "st_tk_init_byhand";
        __Path "./Patterns/Ascii";
    }
//    __Pattern jtag_reset_init {
//        __File "jtag_reset_init";
//        __Path "./Patterns/Ascii";
//    }

/*********************************************************/
/***    Trevor's debugged flash shell pattern          ***/

    __Pattern Garnet_Shell064_T072C008S007_A2 {
        __File "Garnet_Shell064_T072C008S007_A2";
        __Path "./Patterns/Ascii";
    }

/*********************************************************/

/*********************************************************/
/***    Trevor's debugged flash Tnum pattern           ***/

    //RPT_CPU at the end
    __Pattern f021_shell_exepat_pll_v3p0 {
        __File "f021_shell_exepat_pll_v3p0";
        __Path "./Patterns/Ascii";
    }

    //RPT 600k at the end
    __Pattern f021_shell_exepat_pll_NCPU {
        __File "f021_shell_exepat_pll_NCPU";
        __Path "./Patterns/Ascii";
    }
    //RPT 500k at the end followed by RPT_CPU w/ clock turned off
    __Pattern f021_shell_exepat_pll_Both {
        __File "f021_shell_exepat_pll_Both";
        __Path "./Patterns/Ascii";
    }
/*********************************************************/

    __Pattern ShellB_Tnum0x00100000 {
        __File "ShellB_Tnum0x00100000";
        __Path "./Patterns/Ascii";
    }
    __Pattern dmled_test_number_NoRPT2 {
        __File "dmled_test_number_NoRPT2";
        __Path "./Patterns/Ascii";
    }
    __Pattern dmled_test_number_NoRPT1 {
        __File "dmled_test_number_NoRPT1";
        __Path "./Patterns/Ascii";
    }
    __Pattern dmled_test_number_0x00100000 {
        __File "dmled_test_number_0x00100000";
        __Path "./Patterns/Ascii";
    }
    __Pattern dmled_test_number_0x00200000 {
        __File "dmled_test_number_0x00200000";
        __Path "./Patterns/Ascii";
    }
    __Pattern dmled_test_number_0x10000000 {
        __File "dmled_test_number_0x10000000";
        __Path "./Patterns/Ascii";
    }
    __Pattern dmled_test_number_0x11200000 {
        __File "dmled_test_number_0x11200000";
        __Path "./Patterns/Ascii";
    }
    __Pattern dmled_TstNum_0x11200000_trunc {
        __File "dmled_TstNum_0x11200000_trunc";
        __Path "./Patterns/Ascii";
    }
    __Pattern dmled_TstNum_0x10000000_trunc {
        __File "dmled_TstNum_0x10000000_trunc";
        __Path "./Patterns/Ascii";
    }
    __Pattern ldo_bypass_init_DSH {
        __File "ldo_bypass_init_DSH";
        __Path "./Patterns/Ascii";
    }
/*    __Pattern FF_InitCheck_v21 {
        __File "FF_InitCheck_v21";
        __Path "./Patterns/Ascii";
    }
    __Pattern FF_InitCheck_v23 {
        __File "FF_InitCheck_v23";
        __Path "./Patterns/Ascii";
    }*/
    __Pattern FF_InitCheck_eng_DPM {
        __File "FF_InitCheck_eng_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern FF_InitCheck_eng_DPM_NS {
        __File "FF_InitCheck_eng_DPM_NS";
        __Path "./Patterns/Ascii";
    }
//    __Pattern pb_pb_mapcol_1p_ENG_SH2 {
//        __File "pb_pb_mapcol_1p_ENG_SH2";
//        __Path "./Patterns/Ascii";
//    }
    __Pattern pb_pb_mapcol_1p_ENG {
        __File "pb_pb_mapcol_1p_ENG";
        __Path "./Patterns/Ascii";
    }
    __Pattern sysctldsldo_pioscpd {
        __File "sysctldsldo_pioscpd";
        __Path "./Patterns/Ascii";
    }
    __Pattern usbphy {
        __File "usbphy";
        __Path "./Patterns/Ascii";
    }
    __Pattern qei1dirintlpbk {
        __File "qei1dirintlpbk";
        __Path "./Patterns/Ascii";
    }
    __Pattern qei0dirintlpbk {
        __File "qei0dirintlpbk";
        __Path "./Patterns/Ascii";
    }
    __Pattern pwm_1_int_check {
        __File "pwm_1_int_check";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_precharge_2p_v23 {
        __File "pb_vl_precharge_2p_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern ssi0_loopback_pll_b {
        __File "ssi0_loopback_pll_b";
        __Path "./Patterns/Ascii";
    }
    __Pattern ssi1_loopback_pll_b {
        __File "ssi1_loopback_pll_b";
        __Path "./Patterns/Ascii";
    }
    __Pattern ssi2_loopback_pll_b {
        __File "ssi2_loopback_pll_b";
        __Path "./Patterns/Ascii";
    }
    __Pattern ssi3_loopback_pll_b {
        __File "ssi3_loopback_pll_b";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_down2_1p_v23 {
        __File "pb_vl_down2_1p_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_down2_2p_v23 {
        __File "pb_vl_down2_2p_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_dtxn2_1p_v23 {
        __File "pb_vl_dtxn2_1p_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_flip10_1p_v23 {
        __File "pb_vl_flip10_1p_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_ftr_read_v23 {
        __File "pb_vl_ftr_read_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_map_col_1p_v23 {
        __File "pb_vl_map_col_1p_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_map_col_2p_v23 {
        __File "pb_vl_map_col_2p_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_march13n_1p_v23 {
        __File "pb_vl_march13n_1p_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_march13n_2p_v23 {
        __File "pb_vl_march13n_2p_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_pmos_open_1p_v23 {
        __File "pb_vl_pmos_open_1p_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_pmos_open_2p_v23 {
        __File "pb_vl_pmos_open_2p_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_precharge_1p_v23 {
        __File "pb_vl_precharge_1p_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_ptr_read_v23 {
        __File "pb_vl_ptr_read_v23";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_fles_1_v22 {
        __File "a_st_tk_fles_1_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_iddq {
        __File "a_iddq";
        __Path "./Patterns/Ascii";
    }
    __Pattern FF_CheckROM_Mg0_DPM {
        __File "FF_CheckROM_Mg0_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern FF_CheckROM_Mg0_ENG {
        __File "FF_CheckROM_Mg0_ENG";
        __Path "./Patterns/Ascii";
    }
    __Pattern FF_CheckROM_norm_DPM {
        __File "FF_CheckROM_norm_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern FF_InitCheck_DPM {
        __File "FF_InitCheck_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern FF_LoadFuseData_0001_DPM {
        __File "FF_LoadFuseData_0001_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern FF_LoadFuseData_0011_DPM {
        __File "FF_LoadFuseData_0011_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern FF_LoadFuseData_1010_DPM {
        __File "FF_LoadFuseData_1010_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern FF_LoadFuseData_1110_DPM {
        __File "FF_LoadFuseData_1110_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern FF_RunAutoload_DPM {
        __File "FF_RunAutoload_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern FF_RunAutoload_ENG {
        __File "FF_RunAutoload_ENG";
        __Path "./Patterns/Ascii";
    }
    __Pattern OTG_ChgdischgVbusM_DPM {
        __File "OTG_ChgdischgVbusM_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern ahbm_write_buffer_v23_DPM {
        __File "ahbm_write_buffer_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern bg_temp_trim_DPM {
        __File "bg_temp_trim_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern bi_atpg7_DPM {
        __File "bi_atpg7_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern bi_atpg_a2_DPM {
        __File "bi_atpg_a2_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern candmalbtx0rx1_1beat_DPM {
        __File "candmalbtx0rx1_1beat_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern candmalbtx1rx0_1beat_DPM {
        __File "candmalbtx1rx0_1beat_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern dcpara_DPM {
        __File "dcpara_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern dcpara_ioz_DPM {
        __File "dcpara_ioz_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern dcpara_ioz_pd_DPM {
        __File "dcpara_ioz_pd_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern dcpara_ioz_pu_DPM {
        __File "dcpara_ioz_pu_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern deep_sleep_DPM {
        __File "deep_sleep_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern deep_sleep_ldo_byp_DPM {
        __File "deep_sleep_ldo_byp_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern deep_sleep_ldo_byp_v2_DPM {
        __File "deep_sleep_ldo_byp_v2_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern deep_sleep_ldo_en_DPM {
        __File "deep_sleep_ldo_en_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern deep_sleep_ldo_en_v2_DPM {
        __File "deep_sleep_ldo_en_v2_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern deep_sleep_v23_DPM {
        __File "deep_sleep_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern dmled_read_DPM {
        __File "dmled_read_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern dmled_test_number_DPM {
        __File "dmled_test_number_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern eeprom_wdone_int_DPM {
        __File "eeprom_wdone_int_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern fl_otp_loader_v21_DPM {
        __File "fl_otp_loader_v21_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern fl_sw_dl_a1a3_4_DPM {
        __File "fl_sw_dl_a1a3_4_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern fl_sw_dl_a2_2_DPM {
        __File "fl_sw_dl_a2_2_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern fl_sw_dl_dpse_DPM {
        __File "fl_sw_dl_dpse_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern fl_sw_dl_v30_DPM {
        __File "fl_sw_dl_v30_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern flash_int_check_DPM {
        __File "flash_int_check_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern hibana_hibn_DPM {
        __File "hibana_hibn_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern hibana_hysvreg_DPM {
        __File "hibana_hysvreg_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern hibana_lbc_vbat19_DPM {
        __File "hibana_lbc_vbat19_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern hibana_lbc_vbat21_DPM {
        __File "hibana_lbc_vbat21_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern hibana_lbc_vbat23_DPM {
        __File "hibana_lbc_vbat23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern hibana_lbc_vbat25_DPM {
        __File "hibana_lbc_vbat25_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern hibana_vbapiok_DPM {
        __File "hibana_vbapiok_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern hibernate_rtcGen_DPM {
        __File "hibernate_rtcGen_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern hibernate_rtcSec_DPM {
        __File "hibernate_rtcSec_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern hibernate_vabort_DPM {
        __File "hibernate_vabort_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern hibernate_vbatchk_DPM {
        __File "hibernate_vbatchk_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern hibosc_obs_DPM {
        __File "hibosc_obs_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern i2c0_dma_DPM {
        __File "i2c0_dma_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern i2c1_dma_DPM {
        __File "i2c1_dma_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern i2c2_dma_DPM {
        __File "i2c2_dma_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern i2c3_dma_DPM {
        __File "i2c3_dma_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern i2c4_dma_DPM {
        __File "i2c4_dma_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt0_1s_32_down {
        __File "gpt0_1s_32_down";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt1_1s_32_down {
        __File "gpt1_1s_32_down";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt2_1s_32_down {
        __File "gpt2_1s_32_down";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt3_1s_32_down {
        __File "gpt3_1s_32_down";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt4_1s_32_down {
        __File "gpt4_1s_32_down";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt5_1s_32_down_DBG {
        __File "gpt5_1s_32_down_DBG";
        __Path "./Patterns/Ascii";
    }
//This pattern should pass
    __Pattern gpt5_1s_32_down_DBGP {
        __File "gpt5_1s_32_down_DBGP";
        __Path "./Patterns/Ascii";
    }
//This pattern should fail because there are not enough matchvector cycles to see the cpu done signal
    __Pattern gpt5_1s_32_down_DBGF {
        __File "gpt5_1s_32_down_DBGF";
        __Path "./Patterns/Ascii";
    }
//This pattern should fail because there are not enough matchvector cycles to see the cpu done signal
//In this pattern the second MATCHVECTOR microinstruction has been replaced by a repeat & single strobe
    __Pattern gpt5_1s_32_down_DBGF1 {
        __File "gpt5_1s_32_down_DBGF1";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt5_1s_32_down {
        __File "gpt5_1s_32_down";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt6_per_32_down {
        __File "gpt6_per_32_down";
        __Path "./Patterns/Ascii";
    }

    __Pattern gpt7_per_32_down {
        __File "gpt7_per_32_down";
        __Path "./Patterns/Ascii";
    }

    __Pattern gpt8_per_32_down {
        __File "gpt8_per_32_down";
        __Path "./Patterns/Ascii";
    }

    __Pattern gpt9_per_32_down {
        __File "gpt9_per_32_down";
        __Path "./Patterns/Ascii";
    }

    __Pattern gpt10_per_32_down {
        __File "gpt10_per_32_down";
        __Path "./Patterns/Ascii";
    }

    __Pattern gpt11_per_32_down {
        __File "gpt11_per_32_down";
        __Path "./Patterns/Ascii";
    }

    __Pattern iosc_obs_DPM {
        __File "iosc_obs_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern otg_5vprotection_DPM {
        __File "otg_5vprotection_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern otg_SidMeasIddH_DPM {
        __File "otg_SidMeasIddH_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern otg_SvblhMs_endH_DPM {
        __File "otg_SvblhMs_endH_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern otg_SvblhMs_vldH_DPM {
        __File "otg_SvblhMs_vldH_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern otg_SvblhMvbvldH_DPM {
        __File "otg_SvblhMvbvldH_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_down2_1p_DPM {
        __File "pb_pb_down2_1p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_down2_1p_ENG {
        __File "pb_pb_down2_1p_ENG";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_down2_2p_DPM {
        __File "pb_pb_down2_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_dtxn2_1p_DPM {
        __File "pb_pb_dtxn2_1p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_dtxn2_1p_ENG {
        __File "pb_pb_dtxn2_1p_ENG";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_dtxn2_2p_DPM {
        __File "pb_pb_dtxn2_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_flip10_1p_DPM {
        __File "pb_pb_flip10_1p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_flip10_1p_ENG {
        __File "pb_pb_flip10_1p_ENG";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_flip10_2p_DPM {
        __File "pb_pb_flip10_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_ftr_DPM {
        __File "pb_pb_ftr_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_ftr_ENG {
        __File "pb_pb_ftr_ENG";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_mapcol_1p_DPM {
        __File "pb_pb_mapcol_1p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_mapcol_2p_DPM {
        __File "pb_pb_mapcol_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_march13n_1p_DPM {
        __File "pb_pb_march13n_1p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_march13n_1p_ENG {
        __File "pb_pb_march13n_1p_ENG";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_march13n_2p_DPM {
        __File "pb_pb_march13n_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_march13n_rep_DPM {
        __File "pb_pb_march13n_rep_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_pmos_open_1p_v22_DPM {
        __File "pb_pb_pmos_open_1p_v22_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_pmos_open_1p_v22_ENG {
        __File "pb_pb_pmos_open_1p_v22_ENG";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_pmos_open_2p_DPM {
        __File "pb_pb_pmos_open_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_precharge_1p_DPM {
        __File "pb_pb_precharge_1p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_precharge_1p_ENG {
        __File "pb_pb_precharge_1p_ENG";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_precharge_2p_DPM {
        __File "pb_pb_precharge_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_ptr_DPM {
        __File "pb_pb_ptr_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_ptr_ENG {
        __File "pb_pb_ptr_ENG";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_wrenz_DPM {
        __File "pb_pb_wrenz_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_FdpdmScv_DPM {
        __File "phy_FdpdmScv_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_Loopback_Rxdm_DPM {
        __File "phy_Loopback_Rxdm_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_Loopback_Rxdp_DPM {
        __File "phy_Loopback_Rxdp_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_MdHTxHZRxcv_DPM {
        __File "phy_MdHTxHZRxcv_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_MdHTxH_Rxdm_DPM {
        __File "phy_MdHTxH_Rxdm_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_MdHTxH_Rxdp_DPM {
        __File "phy_MdHTxH_Rxdp_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_MdHTxLZRxcv_DPM {
        __File "phy_MdHTxLZRxcv_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_MdHTxL_Rxdm_DPM {
        __File "phy_MdHTxL_Rxdm_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_MdHTxL_Rxdp_DPM {
        __File "phy_MdHTxL_Rxdp_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_MdLTxHZRxcv_DPM {
        __File "phy_MdLTxHZRxcv_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_MdLTxH_Rxdm_DPM {
        __File "phy_MdLTxH_Rxdm_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_MdLTxH_Rxdp_DPM {
        __File "phy_MdLTxH_Rxdp_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_MdLTxLZRxcv_DPM {
        __File "phy_MdLTxLZRxcv_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_MdLTxL_Rxdm_DPM {
        __File "phy_MdLTxL_Rxdm_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_MdLTxL_Rxdp_DPM {
        __File "phy_MdLTxL_Rxdp_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_Sdm__Tdm_DPM {
        __File "phy_Sdm__Tdm_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_Sdp__Tdp_DPM {
        __File "phy_Sdp__Tdp_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_SdpdmTcv_DPM {
        __File "phy_SdpdmTcv_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_SuHPdHpuLSwLImv_DPM {
        __File "phy_SuHPdHpuLSwLImv_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_SuHPdLPuHSwHImv_DPM {
        __File "phy_SuHPdLPuHSwHImv_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_SuHPdLPuHSwLImv_DPM {
        __File "phy_SuHPdLPuHSwLImv_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_SuHPdLPuLSwLImv_DPM {
        __File "phy_SuHPdLPuLSwLImv_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_SuLPdHPuHSwHSpi_DPM {
        __File "phy_SuLPdHPuHSwHSpi_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_SuLPdHPuLSwLSpi_DPM {
        __File "phy_SuLPdHPuLSwLSpi_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern phy_loopback_Rxcv_DPM {
        __File "phy_loopback_Rxcv_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern piosc_obs_DPM {
        __File "piosc_obs_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern piosc_trim_DPM {
        __File "piosc_trim_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern sleep_DPM {
        __File "sleep_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern sleep_ldo_byp_DPM {
        __File "sleep_ldo_byp_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern sleep_ldo_en_DPM {
        __File "sleep_ldo_en_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern switch_cell_can0_pd_DPM {
        __File "switch_cell_can0_pd_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern switch_cell_can1_pd_DPM {
        __File "switch_cell_can1_pd_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern switch_cell_usb_pd_DPM {
        __File "switch_cell_usb_pd_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern syspll_lock_DPM {
        __File "syspll_lock_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern syspll_lock_max_DPM {
        __File "syspll_lock_max_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern syspll_lock_min_DPM {
        __File "syspll_lock_min_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern u0u1_8bit_mode_DPM {
        __File "u0u1_8bit_mode_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern u0u2_8bit_mode_DPM {
        __File "u0u2_8bit_mode_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern u0u3_8bit_mode_DPM {
        __File "u0u3_8bit_mode_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern u0u4_8bit_mode_DPM {
        __File "u0u4_8bit_mode_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern u0u5_8bit_mode_DPM {
        __File "u0u5_8bit_mode_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern u0u6_8bit_mode_DPM {
        __File "u0u6_8bit_mode_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern u0u7_8bit_mode_DPM {
        __File "u0u7_8bit_mode_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern udma_ping_pong_DPM {
        __File "udma_ping_pong_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern usbpll_lock_DPM {
        __File "usbpll_lock_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_31 {
        __File "a_tft_tk_80_80_31";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_10_v22 {
        __File "a_st_tk_10_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_12_v22 {
        __File "a_st_tk_12_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_13_v22 {
        __File "a_st_tk_13_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_14_v22 {
        __File "a_st_tk_14_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_15_v22 {
        __File "a_st_tk_15_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_16_v22 {
        __File "a_st_tk_16_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_17_v22 {
        __File "a_st_tk_17_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_18_v22 {
        __File "a_st_tk_18_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_19_v22 {
        __File "a_st_tk_19_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_20_v22 {
        __File "a_st_tk_20_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_21_v22 {
        __File "a_st_tk_21_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_1_v22 {
        __File "a_st_tk_1_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_1_v22SH1 {
        __File "a_st_tk_1_v22SH1";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_2_v22 {
        __File "a_st_tk_2_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_3_v22 {
        __File "a_st_tk_3_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_4_v22 {
        __File "a_st_tk_4_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_5_v22 {
        __File "a_st_tk_5_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_6_v22 {
        __File "a_st_tk_6_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_7_v22 {
        __File "a_st_tk_7_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_8_v22 {
        __File "a_st_tk_8_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_9_v22 {
        __File "a_st_tk_9_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_st_tk_fles_2_v22 {
        __File "a_st_tk_fles_2_v22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_ntk_80_80_1 {
        __File "a_tft_ntk_80_80_1";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_ntk_80_80_10 {
        __File "a_tft_ntk_80_80_10";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_ntk_80_80_2 {
        __File "a_tft_ntk_80_80_2";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_ntk_80_80_3 {
        __File "a_tft_ntk_80_80_3";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_ntk_80_80_4 {
        __File "a_tft_ntk_80_80_4";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_ntk_80_80_5 {
        __File "a_tft_ntk_80_80_5";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_ntk_80_80_6 {
        __File "a_tft_ntk_80_80_6";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_ntk_80_80_7 {
        __File "a_tft_ntk_80_80_7";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_ntk_80_80_8 {
        __File "a_tft_ntk_80_80_8";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_ntk_80_80_9 {
        __File "a_tft_ntk_80_80_9";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_16_16_2 {
        __File "a_tft_tk_16_16_2";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_16_16_3 {
        __File "a_tft_tk_16_16_3";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_25_25_1 {
        __File "a_tft_tk_25_25_1";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_33_33_1 {
        __File "a_tft_tk_33_33_1";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_33_33_2 {
        __File "a_tft_tk_33_33_2";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_40_40_1 {
        __File "a_tft_tk_40_40_1";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_1 {
        __File "a_tft_tk_80_80_1";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_10 {
        __File "a_tft_tk_80_80_10";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_11 {
        __File "a_tft_tk_80_80_11";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_12 {
        __File "a_tft_tk_80_80_12";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_13 {
        __File "a_tft_tk_80_80_13";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_14 {
        __File "a_tft_tk_80_80_14";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_15 {
        __File "a_tft_tk_80_80_15";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_16 {
        __File "a_tft_tk_80_80_16";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_17 {
        __File "a_tft_tk_80_80_17";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_18 {
        __File "a_tft_tk_80_80_18";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_19 {
        __File "a_tft_tk_80_80_19";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_2 {
        __File "a_tft_tk_80_80_2";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_20 {
        __File "a_tft_tk_80_80_20";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_21 {
        __File "a_tft_tk_80_80_21";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_22 {
        __File "a_tft_tk_80_80_22";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_23 {
        __File "a_tft_tk_80_80_23";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_24 {
        __File "a_tft_tk_80_80_24";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_25 {
        __File "a_tft_tk_80_80_25";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_26 {
        __File "a_tft_tk_80_80_26";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_27 {
        __File "a_tft_tk_80_80_27";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_28 {
        __File "a_tft_tk_80_80_28";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_29 {
        __File "a_tft_tk_80_80_29";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_3 {
        __File "a_tft_tk_80_80_3";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_30 {
        __File "a_tft_tk_80_80_30";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_32 {
        __File "a_tft_tk_80_80_32";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_33 {
        __File "a_tft_tk_80_80_33";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_34 {
        __File "a_tft_tk_80_80_34";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_35 {
        __File "a_tft_tk_80_80_35";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_36 {
        __File "a_tft_tk_80_80_36";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_37 {
        __File "a_tft_tk_80_80_37";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_38 {
        __File "a_tft_tk_80_80_38";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_39 {
        __File "a_tft_tk_80_80_39";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_4 {
        __File "a_tft_tk_80_80_4";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_40 {
        __File "a_tft_tk_80_80_40";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_41 {
        __File "a_tft_tk_80_80_41";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_42 {
        __File "a_tft_tk_80_80_42";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_43 {
        __File "a_tft_tk_80_80_43";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_44 {
        __File "a_tft_tk_80_80_44";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_45 {
        __File "a_tft_tk_80_80_45";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_46 {
        __File "a_tft_tk_80_80_46";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_47 {
        __File "a_tft_tk_80_80_47";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_5 {
        __File "a_tft_tk_80_80_5";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_6 {
        __File "a_tft_tk_80_80_6";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_8 {
        __File "a_tft_tk_80_80_8";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_9 {
        __File "a_tft_tk_80_80_9";
        __Path "./Patterns/Ascii";
    }
}
