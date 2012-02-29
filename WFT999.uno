__WaveformTable WFT999_scan {
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
            __Waveform { __EdgeMarker @ "0ns"; __DriveOff @ "0ns"; }
        }
        __Compare {
            __Waveform { __CompareData @ "0ns"; }
        }
    }
}

__WaveformTable WFT999_basic {
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
}
