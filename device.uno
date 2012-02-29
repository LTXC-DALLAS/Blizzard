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
    __Type = Digital;
    __Direction = Input;
    __Mode = NoTerm;
    __Mux = __False;
}
__PinType O {
    __Type = Digital;
    __Direction = Output;
    __Mode = NoTerm;
    __Mux = __False;
}
__PinType IO {
    __Type = Digital;
    __Direction = Bidirect;
    __Mode = NoTerm;
    __Mux = __False;
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
    __Type = AnalogPin;
    __Direction = Input;
}
__PinType ANALOG_O {
    __Type = AnalogPin;
    __Direction = Output;
}
__PinType ANALOG_IO {
    __Type = AnalogPin;
    __Direction = Bidirect;
}
__PinType ANALOG_IO_PWR {
    __Type = Power;
}
__PinType MixedSignal_I {
    __Type = Res;
}
__PinType MixedSignal_O {
    __Type = Res;
}
__PinType MixedSignal_IO {
    __Type = Res;
}
__PinType Resource {
    __Type = Res;
}
__PinType DCREF {
    __Type = DCRef;
}
__PinType CBIT {
    __Type = CBit;
}
__PinType DPRO_Pin {
    __Type = Res;
}

__PinType PWR_VDD_Bllizar_PB1 {
    __Type = Power;
    Min {
        PinCurrent = __Expression { __String = "-744mA"; }
        PinVoltage = __Expression { __String = "-1000mV"; }
        LoadComp = __Expression { __String = "2uF"; }
    }
    Max {
        PinCurrent = __Expression { __String = "744mA"; }
        PinVoltage = __Expression { __String = " 6.0V"; }
        LoadComp = __Expression { __String = "2uF"; }
    }
    __SetupSelection = __Expression { __String = "PWR_VDD_Bllizar_PB1.Select.Safe.e4"; }
                                                                 
}

__PinType PWR_VREFAN_Bllizar_PB1 {
    __Type = Power;
}
__PinType PWR_VDDAR_Bllizar_PB1 {
    __Type = Power;
    Min {
        PinCurrent = __Expression { __String = "-82mA"; }
    }
    Max {
        PinCurrent = __Expression { __String = "82mA"; }
        LoadComp = __Expression { __String = "50uF"; }
    }
    __SetupSelection = __Expression { __String = "PWR_VDDAR_Bllizar_PB1.Select.Safe.e4"; }
                                                                 
}

__PinType PWR_VDDS_Bllizar_PB1 {
    __Type = Power;
    Min {
        PinCurrent = __Expression { __String = "-1.572A"; }
    }
    Max {
        PinCurrent = __Expression { __String = "1.572A"; }
        LoadComp = __Expression { __String = "1uF"; }
    }
    __SetupSelection = __Expression { __String = "PWR_VDDS_Bllizar_PB1.Select.Safe.e4"; }
                                                                 
}

__PinType PWR_VDDA_Bllizar_PB1 {
    __Type = Power;
    Min {
        PinCurrent = __Expression { __String = "-100mA"; }
    }
    Max {
        PinCurrent = __Expression { __String = "100mA"; }
        LoadComp = __Expression { __String = "1uF"; }
    }
    __SetupSelection = __Expression { __String = "PWR_VDDA_Bllizar_PB1.Select.Safe.e4"; }
                                                                 
}
__PinType PWR_VPP_Bllizar_PB1 {
    __Type = Power;
    Min {
        PinCurrent = __Expression { __String = "-1mA"; }
    }
    Max {
        PinCurrent = __Expression { __String = "200mA"; }
        LoadComp = __Expression { __String = "1uF"; }
    }
    __SetupSelection = __Expression { __String = "PWR_VPP_Bllizar_PB1.Select.Safe.e4"; }
                                                                 
}

__PinType PWR_VSS_Bllizar_PB1 {
    __Type = Power;
}

__PinType PWR_GND_Bllizar_PB1 {
    __Type = NullPin;
}

//Hand generated adapterboard for Unison DiamondX platform.  Channel assignments are syntactically
//correct but probably not ideal for hardware layout.  --BJP
__AdapterBoard Bllizar_PB1_DmdX_x1_AdapterBoard {
	__Pin { __Name = AIN15_1; __Ppid = "  B2"; __XCoord = (200,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 576; }
	}
	__Pin { __Name = AIN14_2; __Ppid = "  B1"; __XCoord = (100,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 577; }
	}
	__Pin { __Name = AIN13_3; __Ppid = "  C2"; __XCoord = (200,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 578; }
	}
	__Pin { __Name = AIN12_4; __Ppid = "  C1"; __XCoord = (100,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 579; }
	}
	__Pin { __Name = PQ0_5; __Ppid = "  D4"; __XCoord = (400,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 580; }
	}
	__Pin { __Name = PQ1_6; __Ppid = "  E4"; __XCoord = (400,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 581; }
	}
	__Pin { __Name = rbias_9; __Ppid = "   9"; __XCoord = (400,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 582; }
	}
	__Pin { __Name = PB6_10; __Ppid = "  F4"; __XCoord = (400,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 583; }
	}
	__Pin { __Name = PB7_15; __Ppid = "  F3"; __XCoord = (300,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 584; }
	}
	__Pin { __Name = PQ2_16; __Ppid = "  F5"; __XCoord = (500,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 585; }
	}
	__Pin { __Name = AIN00_17; __Ppid = "  E2"; __XCoord = (200,500); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI289; }
	}
	__Pin { __Name = AIN01_18; __Ppid = "  E1"; __XCoord = (100,500); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI290; }
	}
	__Pin { __Name = AIN02_19; __Ppid = "  F2"; __XCoord = (200,600); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI291; }
	}
	__Pin { __Name = ATEST; __Ppid = "  F1"; __XCoord = (100,600); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI292; }
	}
	__Pin { __Name = AIN16_23; __Ppid = "  G2"; __XCoord = (200,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 586; }
	}
	__Pin { __Name = AIN17_24; __Ppid = "  G1"; __XCoord = (100,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 587; }
	}
	__Pin { __Name = AIN18_25; __Ppid = "  H1"; __XCoord = (100,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 588; }
	}
	__Pin { __Name = AIN19_26; __Ppid = "  H2"; __XCoord = (200,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 589; }
	}
	__Pin { __Name = PN2_27; __Ppid = "  G3"; __XCoord = (300,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 590; }
	}
	__Pin { __Name = PH7_28; __Ppid = "  G4"; __XCoord = (400,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 591; }
	}
	__Pin { __Name = PH6_29; __Ppid = "  H3"; __XCoord = (300,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 592; }
	}
	__Pin { __Name = PH5_30; __Ppid = "  H4"; __XCoord = (400,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 593; }
	}
	__Pin { __Name = PH4_35; __Ppid = "  J3"; __XCoord = (300,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 594; }
	}
	__Pin { __Name = PH3_36; __Ppid = "  J2"; __XCoord = (200,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 595; }
	}
	__Pin { __Name = PH2_37; __Ppid = "  J4"; __XCoord = (400,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 596; }
	}
	__Pin { __Name = PH1_40; __Ppid = "  K4"; __XCoord = (400,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 597; }
	}
	__Pin { __Name = PH0_41; __Ppid = "  K3"; __XCoord = (300,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 598; }
	}
	__Pin { __Name = C0_n_42; __Ppid = "  K2"; __XCoord = (200,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 599; }
	}
	__Pin { __Name = C0_p_43; __Ppid = "  K1"; __XCoord = (100,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 600; }
	}
	__Pin { __Name = C1_p_44; __Ppid = "  L1"; __XCoord = (100,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 601; }
	}
	__Pin { __Name = C1_n_45; __Ppid = "  L2"; __XCoord = (200,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 602; }
	}
	__Pin { __Name = o_cpu_done_46; __Ppid = "  L3"; __XCoord = (300,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 603; }
	}
	__Pin { __Name = o_cpu_fail_47; __Ppid = "  M1"; __XCoord = (100,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 604; }
	}
	__Pin { __Name = PA2_48; __Ppid = "  M2"; __XCoord = (200,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 605; }
	}
	__Pin { __Name = PA3_49; __Ppid = "  M3"; __XCoord = (300,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 606; }
	}
	__Pin { __Name = PA4_50; __Ppid = "  L4"; __XCoord = (400,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 607; }
	}
	__Pin { __Name = PA5_51; __Ppid = "  N1"; __XCoord = (100,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 608; }
	}
	__Pin { __Name = PA6_54; __Ppid = "  M4"; __XCoord = (400,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 609; }
	}
	__Pin { __Name = PA7_55; __Ppid = "  N2"; __XCoord = (200,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 610; }
	}
	__Pin { __Name = PG7_56; __Ppid = "  N3"; __XCoord = (300,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 611; }
	}
	__Pin { __Name = PG6_57; __Ppid = "  N4"; __XCoord = (400,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 612; }
	}
	__Pin { __Name = PP2_58; __Ppid = "  M5"; __XCoord = (500,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 613; }
	}
	__Pin { __Name = PP5_59; __Ppid = "  L5"; __XCoord = (500,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 614; }
	}
	__Pin { __Name = RAWPOR_n_60; __Ppid = "  K6"; __XCoord = (600,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 615; }
	}
	__Pin { __Name = PQ3_61; __Ppid = "  N5"; __XCoord = (500,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 616; }
	}
	__Pin { __Name = PQ4_62; __Ppid = "  N6"; __XCoord = (600,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 617; }
	}
	__Pin { __Name = PQ5_63; __Ppid = "  K5"; __XCoord = (500,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 618; }
	}
	__Pin { __Name = PQ6_64; __Ppid = "  M6"; __XCoord = (600,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 619; }
	}
	__Pin { __Name = PQ7_65; __Ppid = "  L6"; __XCoord = (600,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 620; }
	}
	__Pin { __Name = FLTP1; __Ppid = "  M7"; __XCoord = (700,1200); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI293; }
	}
	__Pin { __Name = FLTP2; __Ppid = "  N7"; __XCoord = (700,1300); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI294; }
	}
	__Pin { __Name = FLASH3_70; __Ppid = "  70"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 621; }
	}
	__Pin { __Name = FLASH4_71; __Ppid = "  71"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 622; }
	}
	__Pin { __Name = FLASH5_72; __Ppid = "  72"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 623; }
	}
	__Pin { __Name = PG5_76; __Ppid = "  L7"; __XCoord = (700,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 624; }
	}
	__Pin { __Name = PG4_77; __Ppid = "  K7"; __XCoord = (700,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 625; }
	}
	__Pin { __Name = PG3_78; __Ppid = "  K8"; __XCoord = (800,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 626; }
	}
	__Pin { __Name = PG2_79; __Ppid = "  79"; __XCoord = (800,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 627; }
	}
	__Pin { __Name = PG1_80; __Ppid = "  80"; __XCoord = (800,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 628; }
	}
	__Pin { __Name = PG0_81; __Ppid = "  L8"; __XCoord = (800,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 629; }
	}
	__Pin { __Name = PF7_84; __Ppid = "  M8"; __XCoord = (800,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 630; }
	}
	__Pin { __Name = PF6_85; __Ppid = "  N8"; __XCoord = (800,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 631; }
	}
	__Pin { __Name = PF5_86; __Ppid = "  K9"; __XCoord = (900,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 632; }
	}
	__Pin { __Name = TRD3_87; __Ppid = "  L9"; __XCoord = (900,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 633; }
	}
	__Pin { __Name = TRD2_88; __Ppid = "  M9"; __XCoord = (900,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 634; }
	}
	__Pin { __Name = TRD1_89; __Ppid = "  N9"; __XCoord = (900,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 635; }
	}
	__Pin { __Name = TRD0_90; __Ppid = " L10"; __XCoord = (1000,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 636; }
	}
	__Pin { __Name = PF3_91; __Ppid = " K10"; __XCoord = (1000,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 637; }
	}
	__Pin { __Name = PN7_94; __Ppid = " M11"; __XCoord = (1100,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 638; }
	}
	__Pin { __Name = PN6_95; __Ppid = " N11"; __XCoord = (1100,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 639; }
	}
	__Pin { __Name = PN5_96; __Ppid = " N12"; __XCoord = (1200,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 640; }
	}
	__Pin { __Name = PN4_97; __Ppid = " L11"; __XCoord = (1100,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 641; }
	}
	__Pin { __Name = wake_n_98; __Ppid = " N13"; __XCoord = (1300,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 642; }
	}
	__Pin { __Name = hib_n_99; __Ppid = " M12"; __XCoord = (1200,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 643; }
	}
	__Pin { __Name = XOSC0_100; __Ppid = " M10"; __XCoord = (1000,1200); __Shape = 15; __PinType = I; 
		__Connection[0] { __TesterChannel[1] = 644; }
	}
	__Pin { __Name = XOSC1_102; __Ppid = " N10"; __XCoord = (1000,1300); __Shape = 15; __PinType = O; 
		__Connection[0] { __TesterChannel[1] = 645; }
	}
	__Pin { __Name = PP3_106; __Ppid = " J12"; __XCoord = (1200,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 646; }
	}
	__Pin { __Name = PP4_107; __Ppid = " J13"; __XCoord = (1300,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 647; }
	}
	__Pin { __Name = PP1_108; __Ppid = " L12"; __XCoord = (1200,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 648; }
	}
	__Pin { __Name = PP0_109; __Ppid = " M13"; __XCoord = (1300,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 649; }
	}
	__Pin { __Name = PM7_110; __Ppid = " L13"; __XCoord = (1300,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 650; }
	}
	__Pin { __Name = PM6_111; __Ppid = " H11"; __XCoord = (1100,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 651; }
	}
	__Pin { __Name = LPC0CLK_116; __Ppid = " H12"; __XCoord = (1200,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 652; }
	}
	__Pin { __Name = LPC0SERIRQ_117; __Ppid = " H13"; __XCoord = (1300,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 653; }
	}
	__Pin { __Name = LPC0A20_118; __Ppid = " H10"; __XCoord = (1000,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 654; }
	}
	__Pin { __Name = LPC0CLKRUN_n_119; __Ppid = " G11"; __XCoord = (1100,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 655; }
	}
	__Pin { __Name = LPC0SCI_n_120; __Ppid = " F12"; __XCoord = (1200,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 656; }
	}
	__Pin { __Name = LPC0PD_n_121; __Ppid = " F13"; __XCoord = (1300,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 657; }
	}
	__Pin { __Name = RST_n_122; __Ppid = " G10"; __XCoord = (1000,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 658; }
	}
	__Pin { __Name = OSC0_124; __Ppid = " G12"; __XCoord = (1200,700); __Shape = 15; __PinType = I; 
		__Connection[0] { __TesterChannel[1] = 659; }
	}
	__Pin { __Name = OSC1_125; __Ppid = " G13"; __XCoord = (1300,700); __Shape = 15; __PinType = O; 
		__Connection[0] { __TesterChannel[1] = 660; }
	}
	__Pin { __Name = USB0DM_127; __Ppid = " E13"; __XCoord = (1300,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 661; }
	}
	__Pin { __Name = USB0DP_128; __Ppid = " E12"; __XCoord = (1200,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 662; }
	}
	__Pin { __Name = PB0_129; __Ppid = " F11"; __XCoord = (1100,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 663; }
	}
	__Pin { __Name = PB1_130; __Ppid = " E11"; __XCoord = (1100,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 664; }
	}
	__Pin { __Name = PB2_131; __Ppid = " E10"; __XCoord = (1000,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 665; }
	}
	__Pin { __Name = ia_ftestadc_132; __Ppid = " D13"; __XCoord = (1300,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 666; }
	}
	__Pin { __Name = LPC0RESET_n_135; __Ppid = " C13"; __XCoord = (1300,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 667; }
	}
	__Pin { __Name = LPC0FRAME_n_136; __Ppid = " D12"; __XCoord = (1200,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 668; }
	}
	__Pin { __Name = LPC0AD0_137; __Ppid = " B13"; __XCoord = (1300,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 669; }
	}
	__Pin { __Name = LPC0AD1_138; __Ppid = " A13"; __XCoord = (1300,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 670; }
	}
	__Pin { __Name = LPC0AD2_139; __Ppid = " C12"; __XCoord = (1200,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 671; }
	}
	__Pin { __Name = LPC0AD3_140; __Ppid = " D11"; __XCoord = (1100,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 672; }
	}
	__Pin { __Name = PK7_141; __Ppid = " A12"; __XCoord = (1200,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 673; }
	}
	__Pin { __Name = PK6_142; __Ppid = " C11"; __XCoord = (1100,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 674; }
	}
	__Pin { __Name = PK5_143; __Ppid = " B12"; __XCoord = (1200,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 675; }
	}
	__Pin { __Name = PK4_144; __Ppid = " B11"; __XCoord = (1100,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 676; }
	}
	__Pin { __Name = TDO_149; __Ppid = " A11"; __XCoord = (1100,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 677; }
	}
	__Pin { __Name = TDI_150; __Ppid = " B10"; __XCoord = (1000,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 678; }
	}
	__Pin { __Name = TMS_151; __Ppid = " A10"; __XCoord = (1000,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 679; }
	}
	__Pin { __Name = TCK_152; __Ppid = " C10"; __XCoord = (1000,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 680; }
	}
	__Pin { __Name = PN3_153; __Ppid = " D10"; __XCoord = (1000,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 681; }
	}
	__Pin { __Name = PJ0_158; __Ppid = " 158"; __XCoord = (1000,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 682; }
	}
	__Pin { __Name = PJ1_159; __Ppid = "  B9"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 683; }
	}
	__Pin { __Name = PJ2_160; __Ppid = " 160"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 684; }
	}
	__Pin { __Name = PJ3_161; __Ppid = " 161"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 685; }
	}
	__Pin { __Name = RAWPOR_N_TEST_162; __Ppid = " 162"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 686; }
	}
	__Pin { __Name = PP6_163; __Ppid = " 163"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 687; }
	}
	__Pin { __Name = POR_ORIDE_164; __Ppid = " 164"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 688; }
	}
	__Pin { __Name = C2_p_174; __Ppid = "  D5"; __XCoord = (500,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 689; }
	}
	__Pin { __Name = C2_n_175; __Ppid = "  C5"; __XCoord = (500,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 690; }
	}
	__Pin { __Name = PJ6_176; __Ppid = "  C6"; __XCoord = (600,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 691; }
	}
	__Pin { __Name = PJ7_177; __Ppid = "  C4"; __XCoord = (400,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 692; }
	}
	__Pin { __Name = AIN23_178; __Ppid = "  B8"; __XCoord = (800,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 693; }
	}
	__Pin { __Name = AIN22_179; __Ppid = "  A7"; __XCoord = (700,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 694; }
	}
	__Pin { __Name = AIN21_180; __Ppid = "  B7"; __XCoord = (700,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 695; }
	}
	__Pin { __Name = AIN20_181; __Ppid = "  A6"; __XCoord = (600,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 696; }
	}
	__Pin { __Name = AIN11_182; __Ppid = "  B6"; __XCoord = (600,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 697; }
	}
	__Pin { __Name = AIN10_183; __Ppid = "  E5"; __XCoord = (500,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 698; }
	}
	__Pin { __Name = AIN09_188; __Ppid = "  A5"; __XCoord = (500,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 699; }
	}
	__Pin { __Name = AIN08_189; __Ppid = "  B5"; __XCoord = (500,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 700; }
	}
	__Pin { __Name = AIN07_190; __Ppid = "  A4"; __XCoord = (400,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 701; }
	}
	__Pin { __Name = AIN06_191; __Ppid = "  B4"; __XCoord = (400,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 702; }
	}
	__Pin { __Name = AIN05_192; __Ppid = "  A3"; __XCoord = (300,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 703; }
	}
	__Pin { __Name = AIN04_193; __Ppid = "  B3"; __XCoord = (300,200); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI295; }
	}
	__Pin { __Name = VDDPGM; __Ppid = " 171"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI296; }
	}
	__Pin { __Name = VDDEEPROM; __Ppid = " 194"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI298; }
	}
	__Pin { __Name = VDD; __Ppid = "  33"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDD_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI301; }
	}
	__Pin { __Name = VREFAN; __Ppid = "  13"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_GND_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = GND; }
	}
	__Pin { __Name = VNWA; __Ppid = " 165"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI310; }
	}
	__Pin { __Name = VDDAR; __Ppid = " 166"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDAR_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI299; }
	}
	__Pin { __Name = VBAT; __Ppid = " 103"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI311; }
	}
	__Pin { __Name = VDDS; __Ppid = "   7"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDS_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = DPS16_33; }
	}
	__Pin { __Name = VSS; __Ppid = "   8"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_GND_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = GND; }
	}
	__Pin { __Name = VDDA; __Ppid = "  11"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDA_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI297; }
	}
	__Pin { __Name = VPP; __Ppid = " 154"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VPP_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI305; }
	}
	__Pin { __Name = VREFAP; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI306; }
	}
	__Pin { __Name = AIN01_DIAG; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI307; }
	}
	__Pin { __Name = AIN00_DIAG; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI308; }
	}
	__Pin { __Name = ATEST_N; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI309; }
	}
//	__Pin { __Name = CBIT_10; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
//		__Connection[0] { __TesterChannel[1] = CBIT10; }
//	}
//	__Pin { __Name = CBIT_27; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
//		__Connection[0] { __TesterChannel[1] = CBIT27; }
//	}
//	__Pin { __Name = CBIT_15; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
//		__Connection[0] { __TesterChannel[1] = CBIT15; }
//	}
//	__Pin { __Name = CBIT_23; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
//		__Connection[0] { __TesterChannel[1] = CBIT23; }
//	}
//	__Pin { __Name = CBIT_19; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
//		__Connection[0] { __TesterChannel[1] = CBIT19; }
//	}
//	__Pin { __Name = CBIT_25; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
//		__Connection[0] { __TesterChannel[1] = CBIT25; }
//	}
//	__Pin { __Name = CBIT_17; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
//		__Connection[0] { __TesterChannel[1] = CBIT17; }
//	}
//	__Pin { __Name = CBIT_21; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
//		__Connection[0] { __TesterChannel[1] = CBIT21; }
//	}
//	__Pin { __Name = CBIT_9; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
//		__Connection[0] { __TesterChannel[1] = CBIT9; }
//	}
//	__Pin { __Name = CBIT_3; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
//		__Connection[0] { __TesterChannel[1] = CBIT3; }
//	}
//	__Pin { __Name = CBIT_4; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
//		__Connection[0] { __TesterChannel[1] = CBIT4; }
//	}
//	__Pin { __Name = CBI_31; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
//		__Connection[0] { __TesterChannel[1] = CBIT31; }
//	}

}

//Channel assignments conform to DiamondX EVA assembly --BJP
__AdapterBoard Blizard_HybridEVA_DmdX_x1_AdapterBoard {
/**************************************************************************************************************/
// These pins aren't bonded on the engineering device.  Left in for pattern coherency. --BJP
      __Pin { __Name = rbias_9; __Ppid = "   9"; __XCoord = (400,500); __Shape = 15; __PinType = IO; 
	      __Connection[0] { __TesterChannel[1] = 582; }
      }
      __Pin { __Name = FLASH3_70; __Ppid = "  70"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
	      __Connection[0] { __TesterChannel[1] = 621; }
      }
      __Pin { __Name = FLASH4_71; __Ppid = "  71"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
	      __Connection[0] { __TesterChannel[1] = 622; }
      }
      __Pin { __Name = FLASH5_72; __Ppid = "  72"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
	      __Connection[0] { __TesterChannel[1] = 623; }
      }
      __Pin { __Name = PG3_78; __Ppid = "  K8"; __XCoord = (800,1000); __Shape = 15; __PinType = IO; 
	      __Connection[0] { __TesterChannel[1] = 626; }
      }
      __Pin { __Name = PG2_79; __Ppid = "  79"; __XCoord = (800,1000); __Shape = 15; __PinType = IO; 
	      __Connection[0] { __TesterChannel[1] = 627; }
      }
//DNC on EVA --BJP
      __Pin { __Name = XOSC1_102; __Ppid = " N10"; __XCoord = (1000,1300); __Shape = 15; __PinType = O; 
	      __Connection[0] { __TesterChannel[1] = 645; }
      }
//DNC on EVA --BJP
      __Pin { __Name = OSC1_125; __Ppid = " G13"; __XCoord = (1300,700); __Shape = 15; __PinType = O; 
	      __Connection[0] { __TesterChannel[1] = 660; }
      }
      __Pin { __Name = PJ0_158; __Ppid = " 158"; __XCoord = (1000,400); __Shape = 15; __PinType = IO; 
	      __Connection[0] { __TesterChannel[1] = 682; }
      }
      __Pin { __Name = PJ2_160; __Ppid = " 160"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
	      __Connection[0] { __TesterChannel[1] = 684; }
      }
      __Pin { __Name = PJ3_161; __Ppid = " 161"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
	      __Connection[0] { __TesterChannel[1] = 685; }
      }
      __Pin { __Name = RAWPOR_N_TEST_162; __Ppid = " 162"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
	      __Connection[0] { __TesterChannel[1] = 686; }
      }
      __Pin { __Name = PP6_163; __Ppid = " 163"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
	      __Connection[0] { __TesterChannel[1] = 687; }
      }
      __Pin { __Name = POR_ORIDE_164; __Ppid = " 164"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
	      __Connection[0] { __TesterChannel[1] = 688; }
      }
      __Pin { __Name = AIN23_178; __Ppid = "  B8"; __XCoord = (800,200); __Shape = 15; __PinType = IO; 
	      __Connection[0] { __TesterChannel[1] = 693; }
      }
/**************************************************************************************************************/
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
		__Connection[0] { __TesterChannel[1] = HDVI289; }
	}
	__Pin { __Name = AIN01_18; __Ppid = "  E1"; __XCoord = (100,500); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI290; }
	}
	__Pin { __Name = AIN02_19; __Ppid = "  F2"; __XCoord = (200,600); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI291; }
	}
	__Pin { __Name = ATEST; __Ppid = "  F1"; __XCoord = (100,600); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI292; }
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
		__Connection[0] { __TesterChannel[1] = HDVI293; }
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
		__Connection[0] { __TesterChannel[1] = 1266; }
	}
	__Pin { __Name = PK4_144; __Ppid = " B11"; __XCoord = (1100,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1267; }
	}
	__Pin { __Name = TDO_149; __Ppid = " A11"; __XCoord = (1100,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1268; }
	}
	__Pin { __Name = TDI_150; __Ppid = " B10"; __XCoord = (1000,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1269; }
	}
	__Pin { __Name = TMS_151; __Ppid = " A10"; __XCoord = (1000,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1270; }
	}
	__Pin { __Name = TCK_152; __Ppid = " C10"; __XCoord = (1000,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1271; }
	}
	__Pin { __Name = PN3_153; __Ppid = " D10"; __XCoord = (1000,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1272; }
	}
	__Pin { __Name = PJ1_159; __Ppid = "  B9"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1273; }
	}
	__Pin { __Name = C2_p_174; __Ppid = "  D5"; __XCoord = (500,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1274; }
	}
	__Pin { __Name = C2_n_175; __Ppid = "  C5"; __XCoord = (500,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1275; }
	}
	__Pin { __Name = PJ6_176; __Ppid = "  C6"; __XCoord = (600,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1276; }
	}
	__Pin { __Name = PJ7_177; __Ppid = "  C4"; __XCoord = (400,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1277; }
	}
	__Pin { __Name = AIN22_179; __Ppid = "  A7"; __XCoord = (700,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1278; }
	}
	__Pin { __Name = AIN21_180; __Ppid = "  B7"; __XCoord = (700,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1279; }
	}
	__Pin { __Name = AIN20_181; __Ppid = "  A6"; __XCoord = (600,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1280; }
	}
	__Pin { __Name = AIN11_182; __Ppid = "  B6"; __XCoord = (600,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1281; }
	}
	__Pin { __Name = AIN10_183; __Ppid = "  E5"; __XCoord = (500,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1282; }
	}
	__Pin { __Name = AIN09_188; __Ppid = "  A5"; __XCoord = (500,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1283; }
	}
	__Pin { __Name = AIN08_189; __Ppid = "  B5"; __XCoord = (500,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1284; }
	}
	__Pin { __Name = AIN07_190; __Ppid = "  A4"; __XCoord = (400,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1285; }
	}
	__Pin { __Name = AIN06_191; __Ppid = "  B4"; __XCoord = (400,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1286; }
	}
	__Pin { __Name = AIN05_192; __Ppid = "  A3"; __XCoord = (300,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1287; }
	}
	__Pin { __Name = AIN04_193; __Ppid = "  B3"; __XCoord = (300,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1288; }
	}
	__Pin { __Name = VDDPGM; __Ppid = " 171"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI296; }
	}
	__Pin { __Name = VDDEEPROM; __Ppid = " 194"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI298; }
	}
	__Pin { __Name = VDD; __Ppid = "  33"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDD_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI301; }
	}
	__Pin { __Name = VREFAN; __Ppid = "  13"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_GND_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = GND; }
	}
	__Pin { __Name = VNWA; __Ppid = " 165"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI310; }
	}
	__Pin { __Name = VDDAR; __Ppid = " 166"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDAR_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI299; }
	}
	__Pin { __Name = VBAT; __Ppid = " 103"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI311; }
	}
	__Pin { __Name = VDDS; __Ppid = "   7"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDS_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = DPS16_33; }
	}
	__Pin { __Name = VSS; __Ppid = "   8"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_GND_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = GND; }
	}
	__Pin { __Name = VDDA; __Ppid = "  11"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDA_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI297; }
	}
	__Pin { __Name = VPP; __Ppid = " 154"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VPP_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI305; }
	}
	__Pin { __Name = VREFAP; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI306; }
	}
	__Pin { __Name = AIN01_DIAG; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI307; }
	}
	__Pin { __Name = AIN00_DIAG; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI308; }
	}
	__Pin { __Name = ATEST_N; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI309; }
	}

}

//Channel assignments conform to DiamondX EVA assembly --BJP
__AdapterBoard Bllizar_EVA_DmdX_x1_AdapterBoard {
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
//	__Pin { __Name = rbias_9; __Ppid = "   9"; __XCoord = (400,500); __Shape = 15; __PinType = IO; 
//		__Connection[0] { __TesterChannel[1] = 582; }
//	}
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
		__Connection[0] { __TesterChannel[1] = HDVI289; }
	}
	__Pin { __Name = AIN01_18; __Ppid = "  E1"; __XCoord = (100,500); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI290; }
	}
	__Pin { __Name = AIN02_19; __Ppid = "  F2"; __XCoord = (200,600); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI291; }
	}
	__Pin { __Name = ATEST; __Ppid = "  F1"; __XCoord = (100,600); __Shape = 15; __PinType = ANALOG_IO_PWR; 
		__Connection[0] { __TesterChannel[1] = HDVI292; }
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
		__Connection[0] { __TesterChannel[1] = HDVI293; }
	}
	__Pin { __Name = FLTP2; __Ppid = "  N7"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1196; }
	}
//	__Pin { __Name = FLASH3_70; __Ppid = "  70"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
//		__Connection[0] { __TesterChannel[1] = 621; }
//	}
//	__Pin { __Name = FLASH4_71; __Ppid = "  71"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
//		__Connection[0] { __TesterChannel[1] = 622; }
//	}
//	__Pin { __Name = FLASH5_72; __Ppid = "  72"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
//		__Connection[0] { __TesterChannel[1] = 623; }
//	}
	__Pin { __Name = PG5_76; __Ppid = "  L7"; __XCoord = (700,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1197; }
	}
	__Pin { __Name = PG4_77; __Ppid = "  K7"; __XCoord = (700,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1198; }
	}
//	__Pin { __Name = PG3_78; __Ppid = "  K8"; __XCoord = (800,1000); __Shape = 15; __PinType = IO; 
//		__Connection[0] { __TesterChannel[1] = 626; }
//	}
//	__Pin { __Name = PG2_79; __Ppid = "  79"; __XCoord = (800,1000); __Shape = 15; __PinType = IO; 
//		__Connection[0] { __TesterChannel[1] = 627; }
//	}
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
//DNC on EVA --BJP
//	__Pin { __Name = XOSC1_102; __Ppid = " N10"; __XCoord = (1000,1300); __Shape = 15; __PinType = O; 
//		__Connection[0] { __TesterChannel[1] = 645; }
//	}
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
//DNC on EVA --BJP
//	__Pin { __Name = OSC1_125; __Ppid = " G13"; __XCoord = (1300,700); __Shape = 15; __PinType = O; 
//		__Connection[0] { __TesterChannel[1] = 660; }
//	}
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
		__Connection[0] { __TesterChannel[1] = 1266; }
	}
	__Pin { __Name = PK4_144; __Ppid = " B11"; __XCoord = (1100,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1267; }
	}
	__Pin { __Name = TDO_149; __Ppid = " A11"; __XCoord = (1100,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1268; }
	}
	__Pin { __Name = TDI_150; __Ppid = " B10"; __XCoord = (1000,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1269; }
	}
	__Pin { __Name = TMS_151; __Ppid = " A10"; __XCoord = (1000,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1270; }
	}
	__Pin { __Name = TCK_152; __Ppid = " C10"; __XCoord = (1000,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1271; }
	}
	__Pin { __Name = PN3_153; __Ppid = " D10"; __XCoord = (1000,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1272; }
	}
//	__Pin { __Name = PJ0_158; __Ppid = " 158"; __XCoord = (1000,400); __Shape = 15; __PinType = IO; 
//		__Connection[0] { __TesterChannel[1] = 682; }
//	}
	__Pin { __Name = PJ1_159; __Ppid = "  B9"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1273; }
	}
//	__Pin { __Name = PJ2_160; __Ppid = " 160"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
//		__Connection[0] { __TesterChannel[1] = 684; }
//	}
//	__Pin { __Name = PJ3_161; __Ppid = " 161"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
//		__Connection[0] { __TesterChannel[1] = 685; }
//	}
//	__Pin { __Name = RAWPOR_N_TEST_162; __Ppid = " 162"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
//		__Connection[0] { __TesterChannel[1] = 686; }
//	}
//	__Pin { __Name = PP6_163; __Ppid = " 163"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
//		__Connection[0] { __TesterChannel[1] = 687; }
//	}
//	__Pin { __Name = POR_ORIDE_164; __Ppid = " 164"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
//		__Connection[0] { __TesterChannel[1] = 688; }
//	}
	__Pin { __Name = C2_p_174; __Ppid = "  D5"; __XCoord = (500,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1274; }
	}
	__Pin { __Name = C2_n_175; __Ppid = "  C5"; __XCoord = (500,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1275; }
	}
	__Pin { __Name = PJ6_176; __Ppid = "  C6"; __XCoord = (600,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1276; }
	}
	__Pin { __Name = PJ7_177; __Ppid = "  C4"; __XCoord = (400,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1277; }
	}
//	__Pin { __Name = AIN23_178; __Ppid = "  B8"; __XCoord = (800,200); __Shape = 15; __PinType = IO; 
//		__Connection[0] { __TesterChannel[1] = 693; }
//	}
	__Pin { __Name = AIN22_179; __Ppid = "  A7"; __XCoord = (700,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1278; }
	}
	__Pin { __Name = AIN21_180; __Ppid = "  B7"; __XCoord = (700,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1279; }
	}
	__Pin { __Name = AIN20_181; __Ppid = "  A6"; __XCoord = (600,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1280; }
	}
	__Pin { __Name = AIN11_182; __Ppid = "  B6"; __XCoord = (600,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1281; }
	}
	__Pin { __Name = AIN10_183; __Ppid = "  E5"; __XCoord = (500,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1282; }
	}
	__Pin { __Name = AIN09_188; __Ppid = "  A5"; __XCoord = (500,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1283; }
	}
	__Pin { __Name = AIN08_189; __Ppid = "  B5"; __XCoord = (500,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1284; }
	}
	__Pin { __Name = AIN07_190; __Ppid = "  A4"; __XCoord = (400,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1285; }
	}
	__Pin { __Name = AIN06_191; __Ppid = "  B4"; __XCoord = (400,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1286; }
	}
	__Pin { __Name = AIN05_192; __Ppid = "  A3"; __XCoord = (300,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1287; }
	}
	__Pin { __Name = AIN04_193; __Ppid = "  B3"; __XCoord = (300,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1288; }
	}
	__Pin { __Name = VDDPGM; __Ppid = " 171"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI296; }
	}
	__Pin { __Name = VDDEEPROM; __Ppid = " 194"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI298; }
	}
	__Pin { __Name = VDD; __Ppid = "  33"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDD_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI301; }
	}
	__Pin { __Name = VREFAN; __Ppid = "  13"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_GND_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = GND; }
	}
	__Pin { __Name = VNWA; __Ppid = " 165"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI310; }
	}
	__Pin { __Name = VDDAR; __Ppid = " 166"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDAR_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI299; }
	}
	__Pin { __Name = VBAT; __Ppid = " 103"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI311; }
	}
	__Pin { __Name = VDDS; __Ppid = "   7"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDS_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = DPS16_33; }
	}
	__Pin { __Name = VSS; __Ppid = "   8"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_GND_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = GND; }
	}
	__Pin { __Name = VDDA; __Ppid = "  11"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDA_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI297; }
	}
	__Pin { __Name = VPP; __Ppid = " 154"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VPP_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HDVI305; }
	}
	__Pin { __Name = VREFAP; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI306; }
	}
	__Pin { __Name = AIN01_DIAG; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI307; }
	}
	__Pin { __Name = AIN00_DIAG; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI308; }
	}
	__Pin { __Name = ATEST_N; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = HDVI309; }
	}

}
//This is the Jazz generated, enVision X-series adapterboard.  Left for reference only.  --BJP
/*__AdapterBoard Bllizar_PB1_XSeries_x1_AdapterBoard {
	__Pin { __Name = AIN15_1; __Ppid = "  B2"; __XCoord = (200,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 1; }
	}
	__Pin { __Name = AIN14_2; __Ppid = "  B1"; __XCoord = (100,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 2; }
	}
	__Pin { __Name = AIN13_3; __Ppid = "  C2"; __XCoord = (200,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 3; }
	}
	__Pin { __Name = AIN12_4; __Ppid = "  C1"; __XCoord = (100,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 4; }
	}
	__Pin { __Name = PQ0_5; __Ppid = "  D4"; __XCoord = (400,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 5; }
	}
	__Pin { __Name = PQ1_6; __Ppid = "  E4"; __XCoord = (400,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 6; }
	}
	__Pin { __Name = rbias_9; __Ppid = "   9"; __XCoord = (400,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 7; }
	}
	__Pin { __Name = PB6_10; __Ppid = "  F4"; __XCoord = (400,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 8; }
	}
	__Pin { __Name = PB7_15; __Ppid = "  F3"; __XCoord = (300,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 9; }
	}
	__Pin { __Name = PQ2_16; __Ppid = "  F5"; __XCoord = (500,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 10; }
	}
	__Pin { __Name = AIN00_17; __Ppid = "  E2"; __XCoord = (200,500); __Shape = 15; __PinType = ANALOG_IO; 
		__Connection[0] { __TesterChannel[1] = VI16_1; }
	}
	__Pin { __Name = AIN01_18; __Ppid = "  E1"; __XCoord = (100,500); __Shape = 15; __PinType = ANALOG_IO; 
		__Connection[0] { __TesterChannel[1] = VI16_2; }
	}
	__Pin { __Name = AIN02_19; __Ppid = "  F2"; __XCoord = (200,600); __Shape = 15; __PinType = ANALOG_IO; 
		__Connection[0] { __TesterChannel[1] = VI16_257; }
	}
	__Pin { __Name = ATEST; __Ppid = "  F1"; __XCoord = (100,600); __Shape = 15; __PinType = ANALOG_IO; 
		__Connection[0] { __TesterChannel[1] = VI16_3; }
	}
	__Pin { __Name = AIN16_23; __Ppid = "  G2"; __XCoord = (200,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 11; }
	}
	__Pin { __Name = AIN17_24; __Ppid = "  G1"; __XCoord = (100,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 12; }
	}
	__Pin { __Name = AIN18_25; __Ppid = "  H1"; __XCoord = (100,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 13; }
	}
	__Pin { __Name = AIN19_26; __Ppid = "  H2"; __XCoord = (200,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 114; }
	}
	__Pin { __Name = PN2_27; __Ppid = "  G3"; __XCoord = (300,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 15; }
	}
	__Pin { __Name = PH7_28; __Ppid = "  G4"; __XCoord = (400,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 16; }
	}
	__Pin { __Name = PH6_29; __Ppid = "  H3"; __XCoord = (300,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 17; }
	}
	__Pin { __Name = PH5_30; __Ppid = "  H4"; __XCoord = (400,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 18; }
	}
	__Pin { __Name = PH4_35; __Ppid = "  J3"; __XCoord = (300,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 129; }
	}
	__Pin { __Name = PH3_36; __Ppid = "  J2"; __XCoord = (200,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 19; }
	}
	__Pin { __Name = PH2_37; __Ppid = "  J4"; __XCoord = (400,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 20; }
	}
	__Pin { __Name = PH1_40; __Ppid = "  K4"; __XCoord = (400,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 21; }
	}
	__Pin { __Name = PH0_41; __Ppid = "  K3"; __XCoord = (300,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 22; }
	}
	__Pin { __Name = C0_n_42; __Ppid = "  K2"; __XCoord = (200,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 23; }
	}
	__Pin { __Name = C0_p_43; __Ppid = "  K1"; __XCoord = (100,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 24; }
	}
	__Pin { __Name = C1_p_44; __Ppid = "  L1"; __XCoord = (100,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 25; }
	}
	__Pin { __Name = C1_n_45; __Ppid = "  L2"; __XCoord = (200,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 26; }
	}
	__Pin { __Name = o_cpu_done_46; __Ppid = "  L3"; __XCoord = (300,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 27; }
	}
	__Pin { __Name = o_cpu_fail_47; __Ppid = "  M1"; __XCoord = (100,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 28; }
	}
	__Pin { __Name = PA2_48; __Ppid = "  M2"; __XCoord = (200,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 29; }
	}
	__Pin { __Name = PA3_49; __Ppid = "  M3"; __XCoord = (300,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 30; }
	}
	__Pin { __Name = PA4_50; __Ppid = "  L4"; __XCoord = (400,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 31; }
	}
	__Pin { __Name = PA5_51; __Ppid = "  N1"; __XCoord = (100,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 32; }
	}
	__Pin { __Name = PA6_54; __Ppid = "  M4"; __XCoord = (400,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 33; }
	}
	__Pin { __Name = PA7_55; __Ppid = "  N2"; __XCoord = (200,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 34; }
	}
	__Pin { __Name = PG7_56; __Ppid = "  N3"; __XCoord = (300,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 35; }
	}
	__Pin { __Name = PG6_57; __Ppid = "  N4"; __XCoord = (400,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 36; }
	}
	__Pin { __Name = PP2_58; __Ppid = "  M5"; __XCoord = (500,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 37; }
	}
	__Pin { __Name = PP5_59; __Ppid = "  L5"; __XCoord = (500,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 38; }
	}
	__Pin { __Name = RAWPOR_n_60; __Ppid = "  K6"; __XCoord = (600,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 39; }
	}
	__Pin { __Name = PQ3_61; __Ppid = "  N5"; __XCoord = (500,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 40; }
	}
	__Pin { __Name = PQ4_62; __Ppid = "  N6"; __XCoord = (600,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 41; }
	}
	__Pin { __Name = PQ5_63; __Ppid = "  K5"; __XCoord = (500,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 42; }
	}
	__Pin { __Name = PQ6_64; __Ppid = "  M6"; __XCoord = (600,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 43; }
	}
	__Pin { __Name = PQ7_65; __Ppid = "  L6"; __XCoord = (600,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 44; }
	}
	__Pin { __Name = FLTP1; __Ppid = "  M7"; __XCoord = (700,1200); __Shape = 15; __PinType = ANALOG_IO; 
		__Connection[0] { __TesterChannel[1] = VI16_4; }
	}
	__Pin { __Name = FLTP2; __Ppid = "  N7"; __XCoord = (700,1300); __Shape = 15; __PinType = ANALOG_IO; 
		__Connection[0] { __TesterChannel[1] = VI16_5; }
	}
	__Pin { __Name = FLASH3_70; __Ppid = "  70"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 45; }
	}
	__Pin { __Name = FLASH4_71; __Ppid = "  71"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 47; }
	}
	__Pin { __Name = FLASH5_72; __Ppid = "  72"; __XCoord = (700,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 48; }
	}
	__Pin { __Name = PG5_76; __Ppid = "  L7"; __XCoord = (700,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 49; }
	}
	__Pin { __Name = PG4_77; __Ppid = "  K7"; __XCoord = (700,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 50; }
	}
	__Pin { __Name = PG3_78; __Ppid = "  K8"; __XCoord = (800,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 51; }
	}
	__Pin { __Name = PG2_79; __Ppid = "  79"; __XCoord = (800,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 52; }
	}
	__Pin { __Name = PG1_80; __Ppid = "  80"; __XCoord = (800,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 53; }
	}
	__Pin { __Name = PG0_81; __Ppid = "  L8"; __XCoord = (800,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 54; }
	}
	__Pin { __Name = PF7_84; __Ppid = "  M8"; __XCoord = (800,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 55; }
	}
	__Pin { __Name = PF6_85; __Ppid = "  N8"; __XCoord = (800,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 56; }
	}
	__Pin { __Name = PF5_86; __Ppid = "  K9"; __XCoord = (900,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 57; }
	}
	__Pin { __Name = TRD3_87; __Ppid = "  L9"; __XCoord = (900,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 58; }
	}
	__Pin { __Name = TRD2_88; __Ppid = "  M9"; __XCoord = (900,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 59; }
	}
	__Pin { __Name = TRD1_89; __Ppid = "  N9"; __XCoord = (900,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 60; }
	}
	__Pin { __Name = TRD0_90; __Ppid = " L10"; __XCoord = (1000,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 61; }
	}
	__Pin { __Name = PF3_91; __Ppid = " K10"; __XCoord = (1000,1000); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 62; }
	}
	__Pin { __Name = PN7_94; __Ppid = " M11"; __XCoord = (1100,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 63; }
	}
	__Pin { __Name = PN6_95; __Ppid = " N11"; __XCoord = (1100,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 64; }
	}
	__Pin { __Name = PN5_96; __Ppid = " N12"; __XCoord = (1200,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 65; }
	}
	__Pin { __Name = PN4_97; __Ppid = " L11"; __XCoord = (1100,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 66; }
	}
	__Pin { __Name = wake_n_98; __Ppid = " N13"; __XCoord = (1300,1300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 67; }
	}
	__Pin { __Name = hib_n_99; __Ppid = " M12"; __XCoord = (1200,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 128; }
	}
	__Pin { __Name = XOSC0_100; __Ppid = " M10"; __XCoord = (1000,1200); __Shape = 15; __PinType = I; 
		__Connection[0] { __TesterChannel[1] = 69; }
	}
	__Pin { __Name = XOSC1_102; __Ppid = " N10"; __XCoord = (1000,1300); __Shape = 15; __PinType = O; 
		__Connection[0] { __TesterChannel[1] = 70; }
	}
	__Pin { __Name = PP3_106; __Ppid = " J12"; __XCoord = (1200,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 71; }
	}
	__Pin { __Name = PP4_107; __Ppid = " J13"; __XCoord = (1300,900); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 72; }
	}
	__Pin { __Name = PP1_108; __Ppid = " L12"; __XCoord = (1200,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 73; }
	}
	__Pin { __Name = PP0_109; __Ppid = " M13"; __XCoord = (1300,1200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 74; }
	}
	__Pin { __Name = PM7_110; __Ppid = " L13"; __XCoord = (1300,1100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 75; }
	}
	__Pin { __Name = PM6_111; __Ppid = " H11"; __XCoord = (1100,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 76; }
	}
	__Pin { __Name = LPC0CLK_116; __Ppid = " H12"; __XCoord = (1200,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 77; }
	}
	__Pin { __Name = LPC0SERIRQ_117; __Ppid = " H13"; __XCoord = (1300,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 78; }
	}
	__Pin { __Name = LPC0A20_118; __Ppid = " H10"; __XCoord = (1000,800); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 79; }
	}
	__Pin { __Name = LPC0CLKRUN_n_119; __Ppid = " G11"; __XCoord = (1100,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 80; }
	}
	__Pin { __Name = LPC0SCI_n_120; __Ppid = " F12"; __XCoord = (1200,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 81; }
	}
	__Pin { __Name = LPC0PD_n_121; __Ppid = " F13"; __XCoord = (1300,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 82; }
	}
	__Pin { __Name = RST_n_122; __Ppid = " G10"; __XCoord = (1000,700); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 83; }
	}
	__Pin { __Name = OSC0_124; __Ppid = " G12"; __XCoord = (1200,700); __Shape = 15; __PinType = I; 
		__Connection[0] { __TesterChannel[1] = 200; }
	}
	__Pin { __Name = OSC1_125; __Ppid = " G13"; __XCoord = (1300,700); __Shape = 15; __PinType = O; 
		__Connection[0] { __TesterChannel[1] = 84; }
	}
	__Pin { __Name = USB0DM_127; __Ppid = " E13"; __XCoord = (1300,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 85; }
	}
	__Pin { __Name = USB0DP_128; __Ppid = " E12"; __XCoord = (1200,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 86; }
	}
	__Pin { __Name = PB0_129; __Ppid = " F11"; __XCoord = (1100,600); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 87; }
	}
	__Pin { __Name = PB1_130; __Ppid = " E11"; __XCoord = (1100,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 88; }
	}
	__Pin { __Name = PB2_131; __Ppid = " E10"; __XCoord = (1000,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 89; }
	}
	__Pin { __Name = ia_ftestadc_132; __Ppid = " D13"; __XCoord = (1300,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 90; }
	}
	__Pin { __Name = LPC0RESET_n_135; __Ppid = " C13"; __XCoord = (1300,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 91; }
	}
	__Pin { __Name = LPC0FRAME_n_136; __Ppid = " D12"; __XCoord = (1200,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 92; }
	}
	__Pin { __Name = LPC0AD0_137; __Ppid = " B13"; __XCoord = (1300,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 93; }
	}
	__Pin { __Name = LPC0AD1_138; __Ppid = " A13"; __XCoord = (1300,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 94; }
	}
	__Pin { __Name = LPC0AD2_139; __Ppid = " C12"; __XCoord = (1200,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 95; }
	}
	__Pin { __Name = LPC0AD3_140; __Ppid = " D11"; __XCoord = (1100,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 96; }
	}
	__Pin { __Name = PK7_141; __Ppid = " A12"; __XCoord = (1200,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 97; }
	}
	__Pin { __Name = PK6_142; __Ppid = " C11"; __XCoord = (1100,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 98; }
	}
	__Pin { __Name = PK5_143; __Ppid = " B12"; __XCoord = (1200,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 99; }
	}
	__Pin { __Name = PK4_144; __Ppid = " B11"; __XCoord = (1100,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 100; }
	}
	__Pin { __Name = TDO_149; __Ppid = " A11"; __XCoord = (1100,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 101; }
	}
	__Pin { __Name = TDI_150; __Ppid = " B10"; __XCoord = (1000,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 102; }
	}
	__Pin { __Name = TMS_151; __Ppid = " A10"; __XCoord = (1000,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 103; }
	}
	__Pin { __Name = TCK_152; __Ppid = " C10"; __XCoord = (1000,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 104; }
	}
	__Pin { __Name = PN3_153; __Ppid = " D10"; __XCoord = (1000,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 105; }
	}
	__Pin { __Name = PJ0_158; __Ppid = " 158"; __XCoord = (1000,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 106; }
	}
	__Pin { __Name = PJ1_159; __Ppid = "  B9"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 107; }
	}
	__Pin { __Name = PJ2_160; __Ppid = " 160"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 108; }
	}
	__Pin { __Name = PJ3_161; __Ppid = " 161"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 109; }
	}
	__Pin { __Name = RAWPOR_N_TEST_162; __Ppid = " 162"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 110; }
	}
	__Pin { __Name = PP6_163; __Ppid = " 163"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 111; }
	}
	__Pin { __Name = POR_ORIDE_164; __Ppid = " 164"; __XCoord = (900,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 112; }
	}
	__Pin { __Name = C2_p_174; __Ppid = "  D5"; __XCoord = (500,400); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 113; }
	}
	__Pin { __Name = C2_n_175; __Ppid = "  C5"; __XCoord = (500,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 126; }
	}
	__Pin { __Name = PJ6_176; __Ppid = "  C6"; __XCoord = (600,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 115; }
	}
	__Pin { __Name = PJ7_177; __Ppid = "  C4"; __XCoord = (400,300); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 116; }
	}
	__Pin { __Name = AIN23_178; __Ppid = "  B8"; __XCoord = (800,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 117; }
	}
	__Pin { __Name = AIN22_179; __Ppid = "  A7"; __XCoord = (700,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 118; }
	}
	__Pin { __Name = AIN21_180; __Ppid = "  B7"; __XCoord = (700,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 119; }
	}
	__Pin { __Name = AIN20_181; __Ppid = "  A6"; __XCoord = (600,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 120; }
	}
	__Pin { __Name = AIN11_182; __Ppid = "  B6"; __XCoord = (600,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 68; }
	}
	__Pin { __Name = AIN10_183; __Ppid = "  E5"; __XCoord = (500,500); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 121; }
	}
	__Pin { __Name = AIN09_188; __Ppid = "  A5"; __XCoord = (500,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 127; }
	}
	__Pin { __Name = AIN08_189; __Ppid = "  B5"; __XCoord = (500,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 122; }
	}
	__Pin { __Name = AIN07_190; __Ppid = "  A4"; __XCoord = (400,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 123; }
	}
	__Pin { __Name = AIN06_191; __Ppid = "  B4"; __XCoord = (400,200); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 124; }
	}
	__Pin { __Name = AIN05_192; __Ppid = "  A3"; __XCoord = (300,100); __Shape = 15; __PinType = IO; 
		__Connection[0] { __TesterChannel[1] = 125; }
	}
	__Pin { __Name = AIN04_193; __Ppid = "  B3"; __XCoord = (300,200); __Shape = 15; __PinType = ANALOG_IO; 
		__Connection[0] { __TesterChannel[1] = VI16_14; }
	}
	__Pin { __Name = VDDPGM; __Ppid = " 171"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = VI16_12; }
	}
	__Pin { __Name = VDDEEPROM; __Ppid = " 194"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = VI16_258; }
	}
	__Pin { __Name = VDD; __Ppid = "  33"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDD_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HCOVI13; }
	}
	__Pin { __Name = VREFAN; __Ppid = "  13"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VREFAN_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = GND; }
	}
	__Pin { __Name = VNWA; __Ppid = " 165"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = VI16_11; }
	}
	__Pin { __Name = VDDAR; __Ppid = " 166"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDAR_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HCOVI17; }
	}
	__Pin { __Name = VBAT; __Ppid = " 103"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = VI16_6; }
	}
	__Pin { __Name = VDDS; __Ppid = "   7"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDS_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HCOVI9; }
	}
	__Pin { __Name = VSS; __Ppid = "   8"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VSS_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = GND; }
	}
	__Pin { __Name = VDDA; __Ppid = "  11"; __XCoord = (300,200); __Shape = 15; __PinType = PWR_VDDA_Bllizar_PB1; 
		__Connection[0] { __TesterChannel[1] = HCOVI11; }
	}
	__Pin { __Name = VPP; __Ppid = " 154"; __XCoord = (300,200); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = VI16_10; }
	}
	__Pin { __Name = VREFAP; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = VI16_13; }
	}
	__Pin { __Name = AIN01_DIAG; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = VI16_259; }
	}
	__Pin { __Name = AIN00_DIAG; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = VI16_16; }
	}
	__Pin { __Name = ATEST_N; __XCoord = (0,0); __Shape = 15; __PinType = DCREF; 
		__Connection[0] { __TesterChannel[1] = VI16_15; }
	}
	__Pin { __Name = CBIT_10; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
		__Connection[0] { __TesterChannel[1] = CBIT10; }
	}
	__Pin { __Name = CBIT_27; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
		__Connection[0] { __TesterChannel[1] = CBIT27; }
	}
	__Pin { __Name = CBIT_15; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
		__Connection[0] { __TesterChannel[1] = CBIT15; }
	}
	__Pin { __Name = CBIT_23; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
		__Connection[0] { __TesterChannel[1] = CBIT23; }
	}
	__Pin { __Name = CBIT_19; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
		__Connection[0] { __TesterChannel[1] = CBIT19; }
	}
	__Pin { __Name = CBIT_25; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
		__Connection[0] { __TesterChannel[1] = CBIT25; }
	}
	__Pin { __Name = CBIT_17; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
		__Connection[0] { __TesterChannel[1] = CBIT17; }
	}
	__Pin { __Name = CBIT_21; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
		__Connection[0] { __TesterChannel[1] = CBIT21; }
	}
	__Pin { __Name = CBIT_9; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
		__Connection[0] { __TesterChannel[1] = CBIT9; }
	}
	__Pin { __Name = CBIT_3; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
		__Connection[0] { __TesterChannel[1] = CBIT3; }
	}
	__Pin { __Name = CBIT_4; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
		__Connection[0] { __TesterChannel[1] = CBIT4; }
	}
	__Pin { __Name = CBI_31; __XCoord = (0,0); __Shape = 15; __PinType = CBIT; 
		__Connection[0] { __TesterChannel[1] = CBIT31; }
	}
}*/
