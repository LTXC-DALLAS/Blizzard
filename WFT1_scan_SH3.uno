Unison:U0.2:S4.3;

/*******************************************************************************
WFT:Test_scan_SH3 used to verify general scan pattern & waveform:
*******************************************************************************/
__WaveformTable Test_scan_SH3 {
    __Period "tper";
//    __Cell "PA2_48+PA3_49+C1_p_44+PA4_50+C0_p_43+PA5_51+C0_n_42+PA6_54 +TRD2_88+PA7_55+TRD1_89+PB0_129+  TRD0_90+PB1_130+F3_91" 0/1 Test_NR1_scan {
    __Cell "PA2_48+PA3_49+C1_p_44+PA4_50+C0_p_43+PA5_51+C0_n_42+PA6_54+TRD2_88+PA7_55+TRD1_89+PB0_129+TRD0_90+PB1_130" 0/1 Test_NR1_scan {
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
//    __Cell "ScanHeader3_PL" M scan_M_ {
//        __Data 2;
//        __Color 7;
//        __Drive {
//            __Waveform { __DriveOff; }
//        }
//    }
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
            __Waveform { __EdgeMarker @ "0ns"; __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}
