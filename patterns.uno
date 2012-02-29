Unison:U0.2:S4.3;

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
__SignalHeader allFuncPins { //Added for pattern compile debug
        __Signals {AIN15_1 AIN14_2 AIN13_3 AIN12_4 PQ0_5 PQ1_6 rbias_9 PB6_10 PB7_15 PQ2_16 AIN16_23 AIN17_24 AIN18_25 AIN19_26 PN2_27 PH7_28}   
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

__PatternMap DefaultPatternMap {
    __DefaultSourcePath = "./Patterns/Ascii";
    __DefaultBinaryPath = "./Patterns/Binary/$TESTER";
    __DefaultPatternGroup = "TDLStdPatGrp";

    __Pattern TestPatScan {
        __File "TestPatScan";
        __Path "./Patterns/Ascii";
    }
//    __Pattern Test {
//        __File "Test";
//        __Path "./Patterns/Ascii";
//    }

//  Begin hand translated patterns 

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
    __Pattern ssi0_loopback_pll_b {   //FUNC_BIST_PG_Thrd
        __File "ssi0_loopback_pll_b";
        __Path "./Patterns/Ascii";
    }
    __Pattern ssi1_loopback_pll_b {   //FUNC_BIST_PG_Thrd
        __File "ssi1_loopback_pll_b";
        __Path "./Patterns/Ascii";
    }
    __Pattern ssi2_loopback_pll_b {   //FUNC_BIST_PG_Thrd
        __File "ssi2_loopback_pll_b";
        __Path "./Patterns/Ascii";
    }
    __Pattern ssi3_loopback_pll_b {   //FUNC_BIST_PG_Thrd
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
    __Pattern pb_pb_down2_2p_DPM {
        __File "pb_pb_down2_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_dtxn2_1p_DPM {
        __File "pb_pb_dtxn2_1p_DPM";
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
    __Pattern pb_pb_flip10_2p_DPM {
        __File "pb_pb_flip10_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_ftr_DPM {
        __File "pb_pb_ftr_DPM";
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
    __Pattern pb_pb_pmos_open_2p_DPM {
        __File "pb_pb_pmos_open_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_pb_precharge_1p_DPM {
        __File "pb_pb_precharge_1p_DPM";
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
    __Pattern u0u1_8bit_mode_DPM {    //FUNC_BIST_PG_Thrd, FUNC_BIST_PG_1_Thrd
        __File "u0u1_8bit_mode_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern u0u2_8bit_mode_DPM {    //FUNC_BIST_PG_Thrd, FUNC_BIST_PG_1_Thrd
        __File "u0u2_8bit_mode_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern u0u3_8bit_mode_DPM {    //FUNC_BIST_PG_Thrd, FUNC_BIST_PG_1_Thrd
        __File "u0u3_8bit_mode_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern u0u4_8bit_mode_DPM {    //FUNC_BIST_PG_Thrd, FUNC_BIST_PG_1_Thrd
        __File "u0u4_8bit_mode_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern u0u5_8bit_mode_DPM {    //FUNC_BIST_PG_Thrd, FUNC_BIST_PG_1_Thrd
        __File "u0u5_8bit_mode_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern u0u6_8bit_mode_DPM {    //FUNC_BIST_PG_Thrd, FUNC_BIST_PG_1_Thrd
        __File "u0u6_8bit_mode_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern u0u7_8bit_mode_DPM {    //FUNC_BIST_PG_Thrd, FUNC_BIST_PG_1_Thrd
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
//    __Pattern a_st_tk_11_v22 {
//        __File "a_st_tk_11_v22";
//        __Path "./Patterns/Ascii";
//    }
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
//  THIS PATTERN IS NOT INCLUDED IN THE JAZZ-GENERATED PATTERN DIRECTORY
//    __Pattern a_tft_tk_16_16_1 {
//        __File "a_tft_tk_16_16_1";
//        __Path "./Patterns/Ascii";
//    }
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
/**  End hand translated patterns **/

/******************************************/

/*    __Pattern scan_base1 {
        __File "scan_base1";
        __Path "./Patterns/Ascii";
    }
    __Pattern scan_base2 {
        __File "scan_base2";
        __Path "./Patterns/Ascii";
    }

*/
/************************************************/

/********************************************/
/** SCAN_PATHDELAY_1_PG patterns originally**/
/** implemented as cpm-calling-dpm.  These **/
/** are the translated generic patterns.   **/
/********************************************/

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

/********************************************/
/**END SCAN_PATHDELAY_1_PG translated patts**/
/********************************************/

/*    __Pattern a_tft_tk_80_80_1_CPM {
        __File "a_tft_tk_80_80_1_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_1_DPM {
        __File "a_tft_tk_80_80_1_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_10_CPM {
        __File "a_tft_tk_80_80_10_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_10_DPM {
        __File "a_tft_tk_80_80_10_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_11_CPM {
        __File "a_tft_tk_80_80_11_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_11_DPM {
        __File "a_tft_tk_80_80_11_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_12_CPM {
        __File "a_tft_tk_80_80_12_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_12_DPM {
        __File "a_tft_tk_80_80_12_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_13_CPM {
        __File "a_tft_tk_80_80_13_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_13_DPM {
        __File "a_tft_tk_80_80_13_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_14_CPM {
        __File "a_tft_tk_80_80_14_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_14_DPM {
        __File "a_tft_tk_80_80_14_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_15_CPM {
        __File "a_tft_tk_80_80_15_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_15_DPM {
        __File "a_tft_tk_80_80_15_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_16_CPM {
        __File "a_tft_tk_80_80_16_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_16_DPM {
        __File "a_tft_tk_80_80_16_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_17_CPM {
        __File "a_tft_tk_80_80_17_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_17_DPM {
        __File "a_tft_tk_80_80_17_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_18_CPM {
        __File "a_tft_tk_80_80_18_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_18_DPM {
        __File "a_tft_tk_80_80_18_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_19_CPM {
        __File "a_tft_tk_80_80_19_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_19_DPM {
        __File "a_tft_tk_80_80_19_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_2_CPM {
        __File "a_tft_tk_80_80_2_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_2_DPM {
        __File "a_tft_tk_80_80_2_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_20_CPM {
        __File "a_tft_tk_80_80_20_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_20_DPM {
        __File "a_tft_tk_80_80_20_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_21_CPM {
        __File "a_tft_tk_80_80_21_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_21_DPM {
        __File "a_tft_tk_80_80_21_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_22_CPM {
        __File "a_tft_tk_80_80_22_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_22_DPM {
        __File "a_tft_tk_80_80_22_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_23_CPM {
        __File "a_tft_tk_80_80_23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_23_DPM {
        __File "a_tft_tk_80_80_23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_24_CPM {
        __File "a_tft_tk_80_80_24_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_24_DPM {
        __File "a_tft_tk_80_80_24_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_25_CPM {
        __File "a_tft_tk_80_80_25_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_25_DPM {
        __File "a_tft_tk_80_80_25_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_26_CPM {
        __File "a_tft_tk_80_80_26_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_26_DPM {
        __File "a_tft_tk_80_80_26_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_27_CPM {
        __File "a_tft_tk_80_80_27_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_27_DPM {
        __File "a_tft_tk_80_80_27_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_28_CPM {
        __File "a_tft_tk_80_80_28_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_28_DPM {
        __File "a_tft_tk_80_80_28_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_29_CPM {
        __File "a_tft_tk_80_80_29_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_29_DPM {
        __File "a_tft_tk_80_80_29_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_3_CPM {
        __File "a_tft_tk_80_80_3_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_3_DPM {
        __File "a_tft_tk_80_80_3_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_30_CPM {
        __File "a_tft_tk_80_80_30_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_30_DPM {
        __File "a_tft_tk_80_80_30_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_32_CPM {
        __File "a_tft_tk_80_80_32_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_32_DPM {
        __File "a_tft_tk_80_80_32_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_33_CPM {
        __File "a_tft_tk_80_80_33_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_33_DPM {
        __File "a_tft_tk_80_80_33_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_34_CPM {
        __File "a_tft_tk_80_80_34_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_34_DPM {
        __File "a_tft_tk_80_80_34_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_35_CPM {
        __File "a_tft_tk_80_80_35_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_35_DPM {
        __File "a_tft_tk_80_80_35_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_36_CPM {
        __File "a_tft_tk_80_80_36_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_36_DPM {
        __File "a_tft_tk_80_80_36_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_37_CPM {
        __File "a_tft_tk_80_80_37_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_37_DPM {
        __File "a_tft_tk_80_80_37_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_38_CPM {
        __File "a_tft_tk_80_80_38_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_38_DPM {
        __File "a_tft_tk_80_80_38_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_39_CPM {
        __File "a_tft_tk_80_80_39_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_39_DPM {
        __File "a_tft_tk_80_80_39_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_4_CPM {
        __File "a_tft_tk_80_80_4_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_4_DPM {
        __File "a_tft_tk_80_80_4_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_40_CPM {
        __File "a_tft_tk_80_80_40_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_40_DPM {
        __File "a_tft_tk_80_80_40_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_41_CPM {
        __File "a_tft_tk_80_80_41_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_41_DPM {
        __File "a_tft_tk_80_80_41_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_42_CPM {
        __File "a_tft_tk_80_80_42_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_42_DPM {
        __File "a_tft_tk_80_80_42_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_43_CPM {
        __File "a_tft_tk_80_80_43_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_43_DPM {
        __File "a_tft_tk_80_80_43_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_44_CPM {
        __File "a_tft_tk_80_80_44_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_44_DPM {
        __File "a_tft_tk_80_80_44_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_45_CPM {
        __File "a_tft_tk_80_80_45_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_45_DPM {
        __File "a_tft_tk_80_80_45_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_46_CPM {
        __File "a_tft_tk_80_80_46_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_46_DPM {
        __File "a_tft_tk_80_80_46_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_47_CPM {
        __File "a_tft_tk_80_80_47_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_47_DPM {
        __File "a_tft_tk_80_80_47_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_5_CPM {
        __File "a_tft_tk_80_80_5_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_5_DPM {
        __File "a_tft_tk_80_80_5_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_6_CPM {
        __File "a_tft_tk_80_80_6_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_6_DPM {
        __File "a_tft_tk_80_80_6_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_8_CPM {
        __File "a_tft_tk_80_80_8_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_8_DPM {
        __File "a_tft_tk_80_80_8_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_9_CPM {
        __File "a_tft_tk_80_80_9_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern a_tft_tk_80_80_9_DPM {
        __File "a_tft_tk_80_80_9_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt0_1s_32_down_CPM {
        __File "gpt0_1s_32_down_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt0_1s_32_down_DPM {
        __File "gpt0_1s_32_down_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt10_per_32_down_CPM {
        __File "gpt10_per_32_down_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt10_per_32_down_DPM {
        __File "gpt10_per_32_down_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt11_per_32_down_CPM {
        __File "gpt11_per_32_down_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt11_per_32_down_DPM {
        __File "gpt11_per_32_down_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt1_1s_32_down_CPM {
        __File "gpt1_1s_32_down_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt1_1s_32_down_DPM {
        __File "gpt1_1s_32_down_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt2_1s_32_down_CPM {
        __File "gpt2_1s_32_down_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt2_1s_32_down_DPM {
        __File "gpt2_1s_32_down_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt3_1s_32_down_CPM {
        __File "gpt3_1s_32_down_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt3_1s_32_down_DPM {
        __File "gpt3_1s_32_down_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt4_1s_32_down_CPM {
        __File "gpt4_1s_32_down_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt4_1s_32_down_DPM {
        __File "gpt4_1s_32_down_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt5_1s_32_down_CPM {
        __File "gpt5_1s_32_down_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt5_1s_32_down_DPM {
        __File "gpt5_1s_32_down_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt6_per_32_down_CPM {
        __File "gpt6_per_32_down_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt6_per_32_down_DPM {
        __File "gpt6_per_32_down_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt7_per_32_down_CPM {
        __File "gpt7_per_32_down_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt7_per_32_down_DPM {
        __File "gpt7_per_32_down_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt8_per_32_down_CPM {
        __File "gpt8_per_32_down_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt8_per_32_down_DPM {
        __File "gpt8_per_32_down_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt9_per_32_down_CPM {
        __File "gpt9_per_32_down_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern gpt9_per_32_down_DPM {
        __File "gpt9_per_32_down_DPM";
        __Path "./Patterns/Ascii";
    }

    __Pattern fancontrol_reg_rdwr_CPM {
        __File "fancontrol_reg_rdwr_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern fancontrol_reg_rdwr_DPM {
        __File "fancontrol_reg_rdwr_DPM";
        __Path "./Patterns/Ascii";
    }

    __Pattern lpc_reg_access_CPM {
        __File "lpc_reg_access_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern lpc_reg_access_DPM {
        __File "lpc_reg_access_DPM";
        __Path "./Patterns/Ascii";
    }

    __Pattern pb_vl_down2_1p_CPM {
        __File "pb_vl_down2_1p_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_down2_1p_DPM {
        __File "pb_vl_down2_1p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_down2_1p_v23_CPM {
        __File "pb_vl_down2_1p_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_down2_1p_v23_DPM {
        __File "pb_vl_down2_1p_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_down2_2p_CPM {
        __File "pb_vl_down2_2p_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_down2_2p_DPM {
        __File "pb_vl_down2_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_down2_2p_v23_CPM {
        __File "pb_vl_down2_2p_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_down2_2p_v23_DPM {
        __File "pb_vl_down2_2p_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_dtxn2_1p_CPM {
        __File "pb_vl_dtxn2_1p_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_dtxn2_1p_DPM {
        __File "pb_vl_dtxn2_1p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_dtxn2_1p_v23_CPM {
        __File "pb_vl_dtxn2_1p_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_dtxn2_1p_v23_DPM {
        __File "pb_vl_dtxn2_1p_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_dtxn2_2p_CPM {
        __File "pb_vl_dtxn2_2p_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_dtxn2_2p_DPM {
        __File "pb_vl_dtxn2_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_dtxn2_2p_v23_CPM {
        __File "pb_vl_dtxn2_2p_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_dtxn2_2p_v23_DPM {
        __File "pb_vl_dtxn2_2p_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_flip10_1p_CPM {
        __File "pb_vl_flip10_1p_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_flip10_1p_DPM {
        __File "pb_vl_flip10_1p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_flip10_1p_v23_CPM {
        __File "pb_vl_flip10_1p_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_flip10_1p_v23_DPM {
        __File "pb_vl_flip10_1p_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_flip10_2p_CPM {
        __File "pb_vl_flip10_2p_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_flip10_2p_DPM {
        __File "pb_vl_flip10_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_flip10_2p_v23_CPM {
        __File "pb_vl_flip10_2p_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_flip10_2p_v23_DPM {
        __File "pb_vl_flip10_2p_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_ftr_read_CPM {
        __File "pb_vl_ftr_read_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_ftr_read_DPM {
        __File "pb_vl_ftr_read_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_ftr_read_v23_CPM {
        __File "pb_vl_ftr_read_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_ftr_read_v23_DPM {
        __File "pb_vl_ftr_read_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_map_col_1p_CPM {
        __File "pb_vl_map_col_1p_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_map_col_1p_DPM {
        __File "pb_vl_map_col_1p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_map_col_1p_v23_CPM {
        __File "pb_vl_map_col_1p_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_map_col_1p_v23_DPM {
        __File "pb_vl_map_col_1p_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_map_col_2p_CPM {
        __File "pb_vl_map_col_2p_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_map_col_2p_DPM {
        __File "pb_vl_map_col_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_map_col_2p_v23_CPM {
        __File "pb_vl_map_col_2p_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_map_col_2p_v23_DPM {
        __File "pb_vl_map_col_2p_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_march13n_1p_CPM {
        __File "pb_vl_march13n_1p_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_march13n_1p_DPM {
        __File "pb_vl_march13n_1p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_march13n_1p_v23_CPM {
        __File "pb_vl_march13n_1p_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_march13n_1p_v23_DPM {
        __File "pb_vl_march13n_1p_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_march13n_2p_CPM {
        __File "pb_vl_march13n_2p_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_march13n_2p_DPM {
        __File "pb_vl_march13n_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_march13n_2p_v23_CPM {
        __File "pb_vl_march13n_2p_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_march13n_2p_v23_DPM {
        __File "pb_vl_march13n_2p_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_pmos_open_1p_CPM {
        __File "pb_vl_pmos_open_1p_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_pmos_open_1p_DPM {
        __File "pb_vl_pmos_open_1p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_pmos_open_1p_v23_CPM {
        __File "pb_vl_pmos_open_1p_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_pmos_open_1p_v23_DPM {
        __File "pb_vl_pmos_open_1p_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_pmos_open_2p_CPM {
        __File "pb_vl_pmos_open_2p_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_pmos_open_2p_DPM {
        __File "pb_vl_pmos_open_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_pmos_open_2p_v23_CPM {
        __File "pb_vl_pmos_open_2p_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_pmos_open_2p_v23_DPM {
        __File "pb_vl_pmos_open_2p_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_precharge_1p_CPM {
        __File "pb_vl_precharge_1p_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_precharge_1p_DPM {
        __File "pb_vl_precharge_1p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_precharge_1p_v23_CPM {
        __File "pb_vl_precharge_1p_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_precharge_1p_v23_DPM {
        __File "pb_vl_precharge_1p_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_precharge_2p_CPM {
        __File "pb_vl_precharge_2p_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_precharge_2p_DPM {
        __File "pb_vl_precharge_2p_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_precharge_2p_v23_CPM {
        __File "pb_vl_precharge_2p_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_precharge_2p_v23_DPM {
        __File "pb_vl_precharge_2p_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_ptr_read_CPM {
        __File "pb_vl_ptr_read_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_ptr_read_DPM {
        __File "pb_vl_ptr_read_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_ptr_read_v23_CPM {
        __File "pb_vl_ptr_read_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_vl_ptr_read_v23_DPM {
        __File "pb_vl_ptr_read_v23_DPM";
        __Path "./Patterns/Ascii";
    }

    __Pattern pwm_0_int_check_CPM {
        __File "pwm_0_int_check_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pwm_0_int_check_DPM {
        __File "pwm_0_int_check_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pwm_1_int_check_CPM {
        __File "pwm_1_int_check_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pwm_1_int_check_DPM {
        __File "pwm_1_int_check_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern qei0dirintlpbk_CPM {
        __File "qei0dirintlpbk_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern qei0dirintlpbk_DPM {
        __File "qei0dirintlpbk_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern qei1dirintlpbk_CPM {
        __File "qei1dirintlpbk_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern qei1dirintlpbk_DPM {
        __File "qei1dirintlpbk_DPM";
        __Path "./Patterns/Ascii";
    }

    __Pattern ssi0_loopback_pll_b_CPM {
        __File "ssi0_loopback_pll_b_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern ssi0_loopback_pll_b_DPM {
        __File "ssi0_loopback_pll_b_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern ssi1_loopback_pll_b_CPM {
        __File "ssi1_loopback_pll_b_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern ssi1_loopback_pll_b_DPM {
        __File "ssi1_loopback_pll_b_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern ssi2_loopback_pll_b_CPM {
        __File "ssi2_loopback_pll_b_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern ssi2_loopback_pll_b_DPM {
        __File "ssi2_loopback_pll_b_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern ssi3_loopback_pll_b_CPM {
        __File "ssi3_loopback_pll_b_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern ssi3_loopback_pll_b_DPM {
        __File "ssi3_loopback_pll_b_DPM";
        __Path "./Patterns/Ascii";
    }

    __Pattern sysctldsldo_pioscpd_CPM {
        __File "sysctldsldo_pioscpd_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern sysctldsldo_pioscpd_DPM {
        __File "sysctldsldo_pioscpd_DPM";
        __Path "./Patterns/Ascii";
    }

    __Pattern usbphy_CPM {
        __File "usbphy_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern usbphy_DPM {
        __File "usbphy_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_chkr_CPM {  //SCAN_IDDQ_1_PG_PS
        __File "pb_iddq_ret_chkr_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_chkr_DPM {
        __File "pb_iddq_ret_chkr_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_chkr_v23_CPM {
        __File "pb_iddq_ret_chkr_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_chkr_v23_DPM {
        __File "pb_iddq_ret_chkr_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_invchkr_CPM {  //SCAN_IDDQ_1_PG_PS
        __File "pb_iddq_ret_invchkr_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_invchkr_DPM {
        __File "pb_iddq_ret_invchkr_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_invchkr_v23_CPM {
        __File "pb_iddq_ret_invchkr_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_invchkr_v23_DPM {
        __File "pb_iddq_ret_invchkr_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_ones_CPM {  //SCAN_IDDQ_1_PG_PS
        __File "pb_iddq_ret_ones_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_ones_DPM {
        __File "pb_iddq_ret_ones_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_ones_v23_CPM {
        __File "pb_iddq_ret_ones_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_ones_v23_DPM {
        __File "pb_iddq_ret_ones_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_zeroes_CPM {
        __File "pb_iddq_ret_zeroes_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_zeroes_DPM {
        __File "pb_iddq_ret_zeroes_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_zeroes_v23_CPM {
        __File "pb_iddq_ret_zeroes_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern pb_iddq_ret_zeroes_v23_DPM {
        __File "pb_iddq_ret_zeroes_v23_DPM";
        __Path "./Patterns/Ascii";
    }

    __Pattern wdtimer0_reset_pll_v23_CPM {
        __File "wdtimer0_reset_pll_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern wdtimer0_reset_pll_v23_DPM {
        __File "wdtimer0_reset_pll_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern wdtimer1_reset_pll_v23_CPM {
        __File "wdtimer1_reset_pll_v23_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern wdtimer1_reset_pll_v23_DPM {
        __File "wdtimer1_reset_pll_v23_DPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern wdtimer1_reset_pll_v24_CPM {
        __File "wdtimer1_reset_pll_v24_CPM";
        __Path "./Patterns/Ascii";
    }
    __Pattern wdtimer1_reset_pll_v24_DPM {
        __File "wdtimer1_reset_pll_v24_DPM";
        __Path "./Patterns/Ascii";
    }
*/
// This pattern has SLOG microinstructions
//    __Pattern iref_trim_DPM {
//        __File "iref_trim_DPM";
//        __Path "./Patterns/Ascii";
//    }
// This pattern has SLOG microinstructions
//    __Pattern FF_Program_Mg1A_DPM {
//        __File "FF_Program_Mg1A_DPM";
//        __Path "./Patterns/Ascii";
//    }
// This pattern has SLOG microinstructions
//    __Pattern FF_Program_Mg1B_DPM {
//        __File "FF_Program_Mg1B_DPM";
//        __Path "./Patterns/Ascii";
//    }
// This pattern has SLOG microinstructions
//    __Pattern FF_Read_Mg0_DPM {
//        __File "FF_Read_Mg0_DPM";
//        __Path "./Patterns/Ascii";
//    }
// This pattern has SLOG microinstructions
//    __Pattern FF_Read_Mg1A_DPM {
//        __File "FF_Read_Mg1A_DPM";
//        __Path "./Patterns/Ascii";
//    }
// This pattern has SLOG microinstructions
//    __Pattern FF_Read_Mg1B_DPM {
//        __File "FF_Read_Mg1B_DPM";
//        __Path "./Patterns/Ascii";
//    }
// This pattern has SLOG microinstructions
//    __Pattern FF_Read_Norm_DPM {
//        __File "FF_Read_Norm_DPM";
//        __Path "./Patterns/Ascii";
//    }
// This pattern is commented out of the V1PQ727C04 VLCT program
// (see lin 1010 of global.h of the VLCT program) -- BJP
//    __Pattern hibernate_reg_rw_DPM {
//        __File "hibernate_reg_rw_DPM";
//        __Path "./Patterns/Ascii";
//    }
// This pattern is commented out of the V1PQ727C04 VLCT program
// (see lin 1009 of global.h of the VLCT program) -- BJP
//    __Pattern hib_rtcsec_subsec_DPM {
//        __File "hib_rtcsec_subsec_DPM";
//        __Path "./Patterns/Ascii";
//    }

}

