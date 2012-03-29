Unison:U1.0c:S5.3;


__WaveformTable WFT1 {
    __Period "tper";
    __Cell "AC1_NR+AC1_NR_STB-o_cpu_done_46" L/H WFT1_NR1 {
        __Data 6/7;
        __Color 3/6;
        __Drive {
            __Waveform { __DriveOn @ "tref +0ps"; __DriveData @ "tref +0ps +1.5ns"; }
        }
    }
    __Cell "OSC0_124+AIN10_183+TCK_152+o_cpu_done_46" L/C WFT1_RZ {
        __Data 6/7;
        __Color 3/4;
        __Drive {
            __Waveform { __DriveOn @ "tref +9ns*(.Period/50ns)-1.5ns"; __DriveData @ "tref +9ns*(.Period/50ns)"; __DriveLow @ "tref +23ns*(.Period/50ns)"; }
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
