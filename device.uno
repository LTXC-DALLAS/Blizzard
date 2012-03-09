Unison:U1.0c:S5.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/FX1/device.evo                                 */
/* Creation Date  : Tue Jan  3 17:12:22 2012                                  */
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


/******************************************************************************/
/***                                                                        ***/
/***    The file device.evo provides the information about what tester      ***/
/***    resources are to be used, how they are to be used, and the          ***/
/***    connection map of tester resources to device pins                   ***/
/***                                                                        ***/
/******************************************************************************/

/*****************/
/*** Pin Types ***/
/*****************/
__PinType I {
    __Type = DigitalPin;
    __Direction = Input;
    __Termination = NoTermination;
}
__PinType O {
    __Type = DigitalPin;
    __Direction = Output;
    __Termination = NoTermination;
}
__PinType IO {
    __Type = DigitalPin;
    __Direction = Bidirect;
    __Termination = NoTermination;
}
__PinType NC {
    __Type = NullPin;
}
__PinType NCI {
    __Type = NullPin;
}
__PinType NCO {
    __Type = NullPin;
}
__PinType NCIO {
    __Type = NullPin;
}
__PinType ANALOG_I {
    __Type = DSPPin;
    __Direction = Input;
}
__PinType ANALOG_O {
    __Type = DSPPin;
    __Direction = Output;
}
__PinType ANALOG_IO {
    __Type = DSPPin;
    __Direction = Bidirect;
}
__PinType ANALOG_IO_PWR {
    __Type = VIPin;
    __ControlFlags ReloadAtTest = __True;
}
__PinType MixedSignal_I {
    __Type = ResourcePin;
}
__PinType MixedSignal_O {
    __Type = ResourcePin;
}
__PinType MixedSignal_IO {
    __Type = ResourcePin;
}
__PinType Resource {
    __Type = ResourcePin;
}
__PinType DCREF {
    __Type = VIPin;
    __ControlFlags ReloadAtTest = __True;
}
__PinType CBIT {
    __Type = CBitPin;
}
__PinType DPRO_Pin {
    __Type = ResourcePin;
}

__PinType PWR_VDD_Bllizar_PB1 {
    __Type = VIPin;
    __ControlFlags ReloadAtTest = __True;
    Min {
        PinCurrent = __Expression { __String = "-744mA"; }
        PinVoltage = __Expression { __String = "-1000mV"; }
        LoadCapacitance = __Expression { __String = "2uF"; }
    }
    Max {
        PinCurrent = __Expression { __String = "744mA"; }
        PinVoltage = __Expression { __String = " 6.0V"; }
        LoadCapacitance = __Expression { __String = "2uF"; }
    }
}

__PinType PWR_VREFAN_Bllizar_PB1 {
    __Type = VIPin;
    __ControlFlags ReloadAtTest = __True;
}
__PinType PWR_VDDAR_Bllizar_PB1 {
    __Type = VIPin;
    __ControlFlags ReloadAtTest = __True;
    Min {
        PinCurrent = __Expression { __String = "-82mA"; }
    }
    Max {
        PinCurrent = __Expression { __String = "82mA"; }
        LoadCapacitance = __Expression { __String = "50uF"; }
    }
}

__PinType PWR_VDDS_Bllizar_PB1 {
    __Type = VIPin;
    __ControlFlags ReloadAtTest = __True;
    Min {
        PinCurrent = __Expression { __String = "-1.572A"; }
    }
    Max {
        PinCurrent = __Expression { __String = "1.572A"; }
        LoadCapacitance = __Expression { __String = "1uF"; }
    }
}

__PinType PWR_VDDA_Bllizar_PB1 {
    __Type = VIPin;
    __ControlFlags ReloadAtTest = __True;
    Min {
        PinCurrent = __Expression { __String = "-100mA"; }
    }
    Max {
        PinCurrent = __Expression { __String = "100mA"; }
        LoadCapacitance = __Expression { __String = "1uF"; }
    }
}
__PinType PWR_VPP_Bllizar_PB1 {
    __Type = VIPin;
    __ControlFlags ReloadAtTest = __True;
    Min {
        PinCurrent = __Expression { __String = "-1mA"; }
    }
    Max {
        PinCurrent = __Expression { __String = "199mA"; }
        LoadCapacitance = __Expression { __String = "1uF"; }
    }
}

__PinType PWR_VSS_Bllizar_PB1 {
    __Type = VIPin;
    __ControlFlags ReloadAtTest = __True;
}

__PinType PWR_GND_Bllizar_PB1 {
    __Type = NullPin;
}


//Channel assignments conform to DiamondX EVA assembly --BJP
//Channel assignments conform to DiamondX EVA assembly --BJP
__AdapterBoard Blizard_HybridEVA_DmdX_x1_AdapterBoard {
	__Pin { __Name = rbias_9; __Ppid = "   9"; __XCoord = (400,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1290; }
	}
	__Pin { __Name = FLASH3_70; __Ppid = "  70"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1291; }
	}
	__Pin { __Name = FLASH4_71; __Ppid = "  71"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1292; }
	}
	__Pin { __Name = FLASH5_72; __Ppid = "  72"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1293; }
	}
	__Pin { __Name = PG3_78; __Ppid = "  K8"; __XCoord = (800,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1294; }
	}
	__Pin { __Name = PG2_79; __Ppid = "  79"; __XCoord = (800,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1295; }
	}
	__Pin { __Name = XOSC1_102; __Ppid = " N10"; __XCoord = (1000,1300); __Shape = 15; __PinType = O; 
		__Connection[0] { __TesterChannel[1] = 1296; }
	}
	__Pin { __Name = OSC1_125; __Ppid = " G13"; __XCoord = (1300,700); __Shape = 15; __PinType = O; 
		__Connection[0] { __TesterChannel[1] = 1297; }
	}
	__Pin { __Name = PJ0_158; __Ppid = " 158"; __XCoord = (1000,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1298; }
	}
	__Pin { __Name = PJ2_160; __Ppid = " 160"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1299; }
	}
	__Pin { __Name = PJ3_161; __Ppid = " 161"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1300; }
	}
	__Pin { __Name = RAWPOR_N_TEST_162; __Ppid = " 162"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1301; }
	}
	__Pin { __Name = PP6_163; __Ppid = " 163"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1302; }
	}
	__Pin { __Name = POR_ORIDE_164; __Ppid = " 164"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1303; }
	}
	__Pin { __Name = AIN23_178; __Ppid = "  B8"; __XCoord = (800,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1304; }
	}
	__Pin { __Name = AIN15_1; __Ppid = "  B2"; __XCoord = (200,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1152; }
	}
	__Pin { __Name = AIN14_2; __Ppid = "  B1"; __XCoord = (100,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1153; }
	}
	__Pin { __Name = AIN13_3; __Ppid = "  C2"; __XCoord = (200,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1154; }
	}
	__Pin { __Name = AIN12_4; __Ppid = "  C1"; __XCoord = (100,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1155; }
	}
	__Pin { __Name = PQ0_5; __Ppid = "  D4"; __XCoord = (400,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1156; }
	}
	__Pin { __Name = PQ1_6; __Ppid = "  E4"; __XCoord = (400,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1157; }
	}
	__Pin { __Name = PB6_10; __Ppid = "  F4"; __XCoord = (400,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1158; }
	}
	__Pin { __Name = PB7_15; __Ppid = "  F3"; __XCoord = (300,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1159; }
	}
	__Pin { __Name = PQ2_16; __Ppid = "  F5"; __XCoord = (500,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1160; }
	}
	__Pin { __Name = AIN00_17; __Ppid = "  E2"; __XCoord = (200,500); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI1163; }
	}
	__Pin { __Name = AIN01_18; __Ppid = "  E1"; __XCoord = (100,500); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI1164; }
	}
	__Pin { __Name = AIN02_19; __Ppid = "  F2"; __XCoord = (200,600); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI1215; }
	}
	__Pin { __Name = ATEST; __Ppid = "  F1"; __XCoord = (100,600); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI1161; }
	}
	__Pin { __Name = AIN16_23; __Ppid = "  G2"; __XCoord = (200,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1161; }
	}
	__Pin { __Name = AIN17_24; __Ppid = "  G1"; __XCoord = (100,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1162; }
	}
	__Pin { __Name = AIN18_25; __Ppid = "  H1"; __XCoord = (100,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1163; }
	}
	__Pin { __Name = AIN19_26; __Ppid = "  H2"; __XCoord = (200,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1164; }
	}
	__Pin { __Name = PN2_27; __Ppid = "  G3"; __XCoord = (300,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1165; }
	}
	__Pin { __Name = PH7_28; __Ppid = "  G4"; __XCoord = (400,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1166; }
	}
	__Pin { __Name = PH6_29; __Ppid = "  H3"; __XCoord = (300,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1167; }
	}
	__Pin { __Name = PH5_30; __Ppid = "  H4"; __XCoord = (400,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1168; }
	}
	__Pin { __Name = PH4_35; __Ppid = "  J3"; __XCoord = (300,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1169; }
	}
	__Pin { __Name = PH3_36; __Ppid = "  J2"; __XCoord = (200,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1170; }
	}
	__Pin { __Name = PH2_37; __Ppid = "  J4"; __XCoord = (400,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1171; }
	}
	__Pin { __Name = PH1_40; __Ppid = "  K4"; __XCoord = (400,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1172; }
	}
	__Pin { __Name = PH0_41; __Ppid = "  K3"; __XCoord = (300,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1173; }
	}
	__Pin { __Name = C0_n_42; __Ppid = "  K2"; __XCoord = (200,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1174; }
	}
	__Pin { __Name = C0_p_43; __Ppid = "  K1"; __XCoord = (100,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1175; }
	}
	__Pin { __Name = C1_p_44; __Ppid = "  L1"; __XCoord = (100,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1176; }
	}
	__Pin { __Name = C1_n_45; __Ppid = "  L2"; __XCoord = (200,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1177; }
	}
	__Pin { __Name = o_cpu_done_46; __Ppid = "  L3"; __XCoord = (300,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1178; }
	}
	__Pin { __Name = o_cpu_fail_47; __Ppid = "  M1"; __XCoord = (100,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1179; }
	}
	__Pin { __Name = PA2_48; __Ppid = "  M2"; __XCoord = (200,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1180; }
	}
	__Pin { __Name = PA3_49; __Ppid = "  M3"; __XCoord = (300,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1181; }
	}
	__Pin { __Name = PA4_50; __Ppid = "  L4"; __XCoord = (400,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1182; }
	}
	__Pin { __Name = PA5_51; __Ppid = "  N1"; __XCoord = (100,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1183; }
	}
	__Pin { __Name = PA6_54; __Ppid = "  M4"; __XCoord = (400,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1184; }
	}
	__Pin { __Name = PA7_55; __Ppid = "  N2"; __XCoord = (200,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1185; }
	}
	__Pin { __Name = PG7_56; __Ppid = "  N3"; __XCoord = (300,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1186; }
	}
	__Pin { __Name = PG6_57; __Ppid = "  N4"; __XCoord = (400,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1187; }
	}
	__Pin { __Name = PP2_58; __Ppid = "  M5"; __XCoord = (500,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1188; }
	}
	__Pin { __Name = PP5_59; __Ppid = "  L5"; __XCoord = (500,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1189; }
	}
	__Pin { __Name = RAWPOR_n_60; __Ppid = "  K6"; __XCoord = (600,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1190; }
	}
	__Pin { __Name = PQ3_61; __Ppid = "  N5"; __XCoord = (500,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1191; }
	}
	__Pin { __Name = PQ4_62; __Ppid = "  N6"; __XCoord = (600,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1192; }
	}
	__Pin { __Name = PQ5_63; __Ppid = "  K5"; __XCoord = (500,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1193; }
	}
	__Pin { __Name = PQ6_64; __Ppid = "  M6"; __XCoord = (600,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1194; }
	}
	__Pin { __Name = PQ7_65; __Ppid = "  L6"; __XCoord = (600,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1195; }
	}
	__Pin { __Name = FLTP1; __Ppid = "  M7"; __XCoord = (700,1200); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI1160; }
	}
	__Pin { __Name = FLTP2; __Ppid = "  N7"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1196; }
	}
	__Pin { __Name = PG5_76; __Ppid = "  L7"; __XCoord = (700,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1197; }
	}
	__Pin { __Name = PG4_77; __Ppid = "  K7"; __XCoord = (700,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1198; }
	}
	__Pin { __Name = PG1_80; __Ppid = "  80"; __XCoord = (800,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1199; }
	}
	__Pin { __Name = PG0_81; __Ppid = "  L8"; __XCoord = (800,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1200; }
	}
	__Pin { __Name = PF7_84; __Ppid = "  M8"; __XCoord = (800,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1201; }
	}
	__Pin { __Name = PF6_85; __Ppid = "  N8"; __XCoord = (800,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1202; }
	}
	__Pin { __Name = PF5_86; __Ppid = "  K9"; __XCoord = (900,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1203; }
	}
	__Pin { __Name = TRD3_87; __Ppid = "  L9"; __XCoord = (900,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1204; }
	}
	__Pin { __Name = TRD2_88; __Ppid = "  M9"; __XCoord = (900,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1205; }
	}
	__Pin { __Name = TRD1_89; __Ppid = "  N9"; __XCoord = (900,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1206; }
	}
	__Pin { __Name = TRD0_90; __Ppid = " L10"; __XCoord = (1000,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1207; }
	}
	__Pin { __Name = PF3_91; __Ppid = " K10"; __XCoord = (1000,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1208; }
	}
	__Pin { __Name = PN7_94; __Ppid = " M11"; __XCoord = (1100,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1209; }
	}
	__Pin { __Name = PN6_95; __Ppid = " N11"; __XCoord = (1100,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1210; }
	}
	__Pin { __Name = PN5_96; __Ppid = " N12"; __XCoord = (1200,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1211; }
	}
	__Pin { __Name = PN4_97; __Ppid = " L11"; __XCoord = (1100,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1212; }
	}
	__Pin { __Name = wake_n_98; __Ppid = " N13"; __XCoord = (1300,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1213; }
	}
	__Pin { __Name = hib_n_99; __Ppid = " M12"; __XCoord = (1200,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1214; }
	}
	__Pin { __Name = XOSC0_100; __Ppid = " M10"; __XCoord = (1000,1200); __Shape = 15; __PinType = I; 
		__Connection[0] { __TesterChannel[1] = 1215; }
	}
	__Pin { __Name = PP3_106; __Ppid = " J12"; __XCoord = (1200,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1216; }
	}
	__Pin { __Name = PP4_107; __Ppid = " J13"; __XCoord = (1300,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1217; }
	}
	__Pin { __Name = PP1_108; __Ppid = " L12"; __XCoord = (1200,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1218; }
	}
	__Pin { __Name = PP0_109; __Ppid = " M13"; __XCoord = (1300,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1219; }
	}
	__Pin { __Name = PM7_110; __Ppid = " L13"; __XCoord = (1300,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1220; }
	}
	__Pin { __Name = PM6_111; __Ppid = " H11"; __XCoord = (1100,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1221; }
	}
	__Pin { __Name = LPC0CLK_116; __Ppid = " H12"; __XCoord = (1200,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1222; }
	}
	__Pin { __Name = LPC0SERIRQ_117; __Ppid = " H13"; __XCoord = (1300,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1223; }
	}
	__Pin { __Name = LPC0A20_118; __Ppid = " H10"; __XCoord = (1000,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1224; }
	}
	__Pin { __Name = LPC0CLKRUN_n_119; __Ppid = " G11"; __XCoord = (1100,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1225; }
	}
	__Pin { __Name = LPC0SCI_n_120; __Ppid = " F12"; __XCoord = (1200,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1226; }
	}
	__Pin { __Name = LPC0PD_n_121; __Ppid = " F13"; __XCoord = (1300,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1227; }
	}
	__Pin { __Name = RST_n_122; __Ppid = " G10"; __XCoord = (1000,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1228; }
	}
	__Pin { __Name = OSC0_124; __Ppid = " G12"; __XCoord = (1200,700); __Shape = 15; __PinType = I; 
		__Connection[0] { __TesterChannel[1] = 1229; }
	}
	__Pin { __Name = USB0DM_127; __Ppid = " E13"; __XCoord = (1300,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1230; }
	}
	__Pin { __Name = USB0DP_128; __Ppid = " E12"; __XCoord = (1200,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1231; }
	}
	__Pin { __Name = PB0_129; __Ppid = " F11"; __XCoord = (1100,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1232; }
	}
	__Pin { __Name = PB1_130; __Ppid = " E11"; __XCoord = (1100,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1233; }
	}
	__Pin { __Name = PB2_131; __Ppid = " E10"; __XCoord = (1000,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1234; }
	}
	__Pin { __Name = ia_ftestadc_132; __Ppid = " D13"; __XCoord = (1300,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1235; }
	}
	__Pin { __Name = LPC0RESET_n_135; __Ppid = " C13"; __XCoord = (1300,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1248; }
	}
	__Pin { __Name = LPC0FRAME_n_136; __Ppid = " D12"; __XCoord = (1200,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1249; }
	}
	__Pin { __Name = LPC0AD0_137; __Ppid = " B13"; __XCoord = (1300,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1250; }
	}
	__Pin { __Name = LPC0AD1_138; __Ppid = " A13"; __XCoord = (1300,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1251; }
	}
	__Pin { __Name = LPC0AD2_139; __Ppid = " C12"; __XCoord = (1200,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1252; }
	}
	__Pin { __Name = LPC0AD3_140; __Ppid = " D11"; __XCoord = (1100,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1253; }
	}
	__Pin { __Name = PK7_141; __Ppid = " A12"; __XCoord = (1200,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1254; }
	}
	__Pin { __Name = PK6_142; __Ppid = " C11"; __XCoord = (1100,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1255; }
	}
	__Pin { __Name = PK5_143; __Ppid = " B12"; __XCoord = (1200,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1256; }
	}
	__Pin { __Name = PK4_144; __Ppid = " B11"; __XCoord = (1100,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1257; }
	}
	__Pin { __Name = TDO_149; __Ppid = " A11"; __XCoord = (1100,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1258; }
	}
	__Pin { __Name = TDI_150; __Ppid = " B10"; __XCoord = (1000,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1259; }
	}
	__Pin { __Name = TMS_151; __Ppid = " A10"; __XCoord = (1000,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1260; }
	}
	__Pin { __Name = TCK_152; __Ppid = " C10"; __XCoord = (1000,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1261; }
	}
	__Pin { __Name = PN3_153; __Ppid = " D10"; __XCoord = (1000,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1262; }
	}
	__Pin { __Name = PJ1_159; __Ppid = "  B9"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1263; }
	}
	__Pin { __Name = C2_p_174; __Ppid = "  D5"; __XCoord = (500,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1264; }
	}
	__Pin { __Name = C2_n_175; __Ppid = "  C5"; __XCoord = (500,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1265; }
	}
	__Pin { __Name = PJ6_176; __Ppid = "  C6"; __XCoord = (600,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1266; }
	}
	__Pin { __Name = PJ7_177; __Ppid = "  C4"; __XCoord = (400,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1267; }
	}
	__Pin { __Name = AIN22_179; __Ppid = "  A7"; __XCoord = (700,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1268; }
	}
	__Pin { __Name = AIN21_180; __Ppid = "  B7"; __XCoord = (700,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1269; }
	}
	__Pin { __Name = AIN20_181; __Ppid = "  A6"; __XCoord = (600,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1270; }
	}
	__Pin { __Name = AIN11_182; __Ppid = "  B6"; __XCoord = (600,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1271; }
	}
	__Pin { __Name = AIN10_183; __Ppid = "  E5"; __XCoord = (500,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1272; }
	}
	__Pin { __Name = AIN09_188; __Ppid = "  A5"; __XCoord = (500,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1273; }
	}
	__Pin { __Name = AIN08_189; __Ppid = "  B5"; __XCoord = (500,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1274; }
	}
	__Pin { __Name = AIN07_190; __Ppid = "  A4"; __XCoord = (400,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1275; }
	}
	__Pin { __Name = AIN06_191; __Ppid = "  B4"; __XCoord = (400,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1276; }
	}
	__Pin { __Name = AIN05_192; __Ppid = "  A3"; __XCoord = (300,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1277; }
	}
	__Pin { __Name = AIN04_193; __Ppid = "  B3"; __XCoord = (300,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1278; }
	}
	__Pin { __Name = VDDPGM; __Ppid = " 171"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI1157; }
	}
	__Pin { __Name = VDDEEPROM; __Ppid = " 194"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = DPS16_307; }
	}
//	__Pin { __Name = VDD; __Ppid = "  33"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDD_Bllizar_PB1; 
//		__Connection[0] { __TesterChannel[1] = HDVI1166; }
//	}
	__Pin { __Name = VDD; __Ppid = "  33"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDD_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = DPS16_306; }
	}
	__Pin { __Name = VREFAN; __Ppid = "  13"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_GND_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI1159; }
	}
	__Pin { __Name = VNWA; __Ppid = " 165"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI1156; }
	}
	__Pin { __Name = VDDAR; __Ppid = " 166"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDAR_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI1168; }
	}
	__Pin { __Name = VBAT; __Ppid = " 103"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI1154; }
	}
	__Pin { __Name = VDDS; __Ppid = "   7"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDS_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = DPS16_305; }
	}
	__Pin { __Name = VSS; __Ppid = "   8"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_GND_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = GND; }
	}
	__Pin { __Name = VDDA; __Ppid = "  11"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDA_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI1167; }
	}
	__Pin { __Name = VPP; __Ppid = " 154"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VPP_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI1155; }
	}
	__Pin { __Name = VREFAP; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI1158; }
	}
	__Pin { __Name = AIN01_DIAG; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI307; }
	}
	__Pin { __Name = AIN00_DIAG; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI308; }
	}
	__Pin { __Name = ATEST_N; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI1216; }
	}
}
