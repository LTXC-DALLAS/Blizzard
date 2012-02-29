Unison:U0.2:S4.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/DPSE_flow.evo                                  */
/* Creation Date  : Tue Jan  3 17:12:53 2012                                  */
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

/****************************************************************************/
/*** SubFlow DPSE_SUB_FLOW                                                ***/
/****************************************************************************/
__SubFlow DPSE_SUB_FLOW {
	__Node  DPSE_ShrtAndDieID_S_5 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1049";
		__Exec =  DPSE_ShrtAndDieID_S;
	}
	__Node  DPSE_OpenShrt_S_6 {
		__XCoord = (180,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1050";
		__Exec =  DPSE_OpenShrt_S;
	}
	__Node  DPSE_PreStress_S_7 {
		__XCoord = (310,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1051";
		__Exec =  DPSE_PreStress_S;
	}
	__Node  DPSE_PreStressPostRepr_S_8 {
		__XCoord = (440,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1052";
		__Exec =  DPSE_PreStressPostRepr_S;
	}
	__Node  DPSE_PostStressFunc_S_9 {
		__XCoord = (570,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1053";
		__Exec =  DPSE_PostStressFunc_S;
	}
	__Node  DPSE_PostStressSrch_S_10 {
		__XCoord = (700,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1054";
		__Exec =  DPSE_PostStressSrch_S;
	}
	__Node  DPSE_PostStressIddq_S_11 {
		__XCoord = (830,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1055";
		__Exec =  DPSE_PostStressIddq_S;
	}
	__Node  DPSE_AtSpeed_S_12 {
		__XCoord = (960,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1056";
		__Exec =  DPSE_AtSpeed_S;
	}
	__Node  DPSE_Parametrics_S_13 {
		__XCoord = (1090,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1057";
		__Exec =  DPSE_Parametrics_S;
	}
	__Node  DPSE_SupplyShort_S_14 {
		__XCoord = (1220,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1058";
		__Exec =  DPSE_SupplyShort_S;
	}
	__Node  DPSE_CRES_S_15 {
		__XCoord = (1350,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1059";
		__Exec =  DPSE_CRES_S;
	}
	__Node FlowNode_16 {
		__XCoord = (1480,150);
		__Port[0] {
			__PortPosition = 160;
		}
		__InputPosition = 220;
		__TestID = "1060";
		__PortSelect =  "if(GlobalNotBinned.Meas, 0, 1)";
	}
	__Node  GOOD_UNIT_17 {
		__XCoord = (1480,280);
		__InputPosition = 0;
		__TestID = "1061";
		__Exec =  GOOD_UNIT;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  DPSE_ShrtAndDieID_S_5;
	__PortConnections {
	 DPSE_ShrtAndDieID_S_5 __Port[0] =  DPSE_OpenShrt_S_6;//To Port = 1;
	 DPSE_OpenShrt_S_6 __Port[0] =  DPSE_PreStress_S_7;//To Port = 2;
	 DPSE_PreStress_S_7 __Port[0] =  DPSE_PreStressPostRepr_S_8;//To Port = 3;
	 DPSE_PreStressPostRepr_S_8 __Port[0] =  DPSE_PostStressFunc_S_9;//To Port = 4;
	 DPSE_PostStressFunc_S_9 __Port[0] =  DPSE_PostStressSrch_S_10;//To Port = 5;
	 DPSE_PostStressSrch_S_10 __Port[0] =  DPSE_PostStressIddq_S_11;//To Port = 6;
	 DPSE_PostStressIddq_S_11 __Port[0] =  DPSE_AtSpeed_S_12;//To Port = 7;
	 DPSE_AtSpeed_S_12 __Port[0] =  DPSE_Parametrics_S_13;//To Port = 8;
	 DPSE_Parametrics_S_13 __Port[0] =  DPSE_SupplyShort_S_14;//To Port = 9;
	 DPSE_SupplyShort_S_14 __Port[0] =  DPSE_CRES_S_15;//To Port = 10;
	 DPSE_CRES_S_15 __Port[0] = FlowNode_16;//To Port = 11;
	FlowNode_16 __Port[0] =  GOOD_UNIT_17;//To Port = 12;
	}
}
/*** END SubFlow DPSE_SUB_FLOW ***/

/****************************************************************************/
/*** SubFlow DPSE_ShrtAndDieID_S                                          ***/
/****************************************************************************/
__SubFlow DPSE_ShrtAndDieID_S {
	__Node  SupplyShorts1_18 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.CommonPSdata"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1062";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  SupplyShorts1;
	}
	__Node  F_OS_SHRT_VDD_19 {
		__XCoord = (50,355);
		__InputPosition = 20;
		__TestID = "1063";
		__Exec =  F_OS_SHRT_VDD;
	}
	__Node  FFDieIDRead_20 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_8"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_VEfuseR"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1064";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FFDieIDRead;
	}
	__Node  F_FUSE_DIEID_PRE_READ_21 {
		__XCoord = (200,325);
		__InputPosition = 20;
		__TestID = "1065";
		__Exec =  F_FUSE_DIEID_PRE_READ;
	}
	__Node FlowNode_22 {
		__XCoord = (350,150);
		__InputPosition = 270;
		__TestID = "1066";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  SupplyShorts1_18;
	__PortConnections {
	 SupplyShorts1_18 __Port[0] =  FFDieIDRead_20;//To Port = 2;
	 SupplyShorts1_18 __Port[1] =  F_OS_SHRT_VDD_19;//To Port = 1;
	 FFDieIDRead_20 __Port[0] = FlowNode_22;//To Port = 4;
	 FFDieIDRead_20 __Port[1] =  F_FUSE_DIEID_PRE_READ_21;//To Port = 3;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_ShrtAndDieID_S ***/

/****************************************************************************/
/*** SubFlow DPSE_OpenShrt_S                                              ***/
/****************************************************************************/
__SubFlow DPSE_OpenShrt_S {
	__Node  PinOpensTest_23 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__Port[2] {
			__PortPosition = 180;
		}
		__Port[3] {
			__PortPosition = 270;
		}
		__InputPosition = 295;
		__SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.CommonPSdata"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1067";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  PinOpensTest;
	}
	__Node  F_OS_OPEN_24 {
		__XCoord = (100,364);
		__InputPosition = 20;
		__TestID = "1068";
		__Exec =  F_OS_OPEN;
	}
	__Node  F_OS_SHRT_PIN_25 {
		__XCoord = (21,364);
		__InputPosition = 20;
		__TestID = "1069";
		__Exec =  F_OS_SHRT_PIN;
	}
	__Node  F_OS_SHRT_PTPS_26 {
		__XCoord = (-20,295);
		__InputPosition = 20;
		__TestID = "1070";
		__Exec =  F_OS_SHRT_PTPS;
	}
	__Node  AnalogConty_27 {
		__XCoord = (310,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__Port[2] {
			__PortPosition = 150;
		}
		__Port[3] {
			__PortPosition = 210;
		}
		__Port[4] {
			__PortPosition = 270;
		}
		__InputPosition = 295;
		__SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.CommonPSdata"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1071";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  AnalogConty;
	}
	__Node  F_OS_OPEN_ANALOG_28 {
		__XCoord = (388,328);
		__InputPosition = 20;
		__TestID = "1072";
		__Exec =  F_OS_OPEN_ANALOG;
	}
	__Node  F_OS_SHRT_ANALOG_29 {
		__XCoord = (325,355);
		__InputPosition = 20;
		__TestID = "1073";
		__Exec =  F_OS_SHRT_ANALOG;
	}
	__Node  F_OS_OPEN_ANALOG_1_30 {
		__XCoord = (262,328);
		__InputPosition = 20;
		__TestID = "1074";
		__Exec =  F_OS_OPEN_ANALOG_1;
	}
	__Node  F_OS_SHRT_ANALOG_2_31 {
		__XCoord = (235,265);
		__InputPosition = 20;
		__TestID = "1075";
		__Exec =  F_OS_SHRT_ANALOG_2;
	}
	__Node  SupplyOpensTest_32 {
		__XCoord = (625,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.CommonPSdata"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1076";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  SupplyOpensTest;
	}
	__Node  F_OS_OPEN_VDD_33 {
		__XCoord = (625,355);
		__InputPosition = 20;
		__TestID = "1077";
		__Exec =  F_OS_OPEN_VDD;
	}
	__Node FlowNode_34 {
		__XCoord = (775,150);
		__InputPosition = 270;
		__TestID = "1078";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  PinOpensTest_23;
	__PortConnections {
	 PinOpensTest_23 __Port[0] =  AnalogConty_27;//To Port = 4;
	 PinOpensTest_23 __Port[1] =  F_OS_OPEN_24;//To Port = 1;
	 PinOpensTest_23 __Port[2] =  F_OS_SHRT_PIN_25;//To Port = 2;
	 PinOpensTest_23 __Port[3] =  F_OS_SHRT_PTPS_26;//To Port = 3;
	 AnalogConty_27 __Port[0] =  SupplyOpensTest_32;//To Port = 9;
	 AnalogConty_27 __Port[1] =  F_OS_OPEN_ANALOG_28;//To Port = 5;
	 AnalogConty_27 __Port[2] =  F_OS_SHRT_ANALOG_29;//To Port = 6;
	 AnalogConty_27 __Port[3] =  F_OS_OPEN_ANALOG_1_30;//To Port = 7;
	 AnalogConty_27 __Port[4] =  F_OS_SHRT_ANALOG_2_31;//To Port = 8;
	 SupplyOpensTest_32 __Port[0] = FlowNode_34;//To Port = 11;
	 SupplyOpensTest_32 __Port[1] =  F_OS_OPEN_VDD_33;//To Port = 10;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,775,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_OpenShrt_S ***/

/****************************************************************************/
/*** SubFlow DPSE_SrchVdd_Vmin_Pre1_S                                     ***/
/****************************************************************************/
__SubFlow DPSE_SrchVdd_Vmin_Pre1_S {
	__Node  VminSearchPre1_35 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1079";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPre1;
	}
	__Node  PreBinFlow_S_36 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1080";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_37 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1081";
		__Exec =  F_FUNC_Vmin;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPre1_1_38 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1082";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPre1_1;
	}
	__Node  PreBinFlow_S_39 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1083";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_pre_40 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1084";
		__Exec =  F_FUNC_Vmin_GROS_100_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPre1_2_41 {
		__XCoord = (350,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_15"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1085";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPre1_2;
	}
	__Node  PreBinFlow_S_42 {
		__XCoord = (350,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1086";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_1_pre_43 {
		__XCoord = (350,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1087";
		__Exec =  F_FUNC_Vmin_GROS_100_1_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPre1_3_44 {
		__XCoord = (500,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_16"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1088";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPre1_3;
	}
	__Node  PreBinFlow_S_45 {
		__XCoord = (500,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1089";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_2_pre_46 {
		__XCoord = (500,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1090";
		__Exec =  F_FUNC_Vmin_GROS_100_2_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPre1_4_47 {
		__XCoord = (650,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1091";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPre1_4;
	}
	__Node  PreBinFlow_S_48 {
		__XCoord = (650,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1092";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_3_pre_49 {
		__XCoord = (650,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1093";
		__Exec =  F_FUNC_Vmin_GROS_100_3_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPre1_5_50 {
		__XCoord = (800,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_18"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1094";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPre1_5;
	}
	__Node  PreBinFlow_S_51 {
		__XCoord = (800,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1095";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_4_pre_52 {
		__XCoord = (800,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1096";
		__Exec =  F_FUNC_Vmin_GROS_100_4_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPre1_6_53 {
		__XCoord = (950,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_9"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1097";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPre1_6;
	}
	__Node  PreBinFlow_S_54 {
		__XCoord = (950,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1098";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_166p66_pre_55 {
		__XCoord = (950,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1099";
		__Exec =  F_FUNC_Vmin_GROS_166p66_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPre1_7_56 {
		__XCoord = (1100,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1100";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPre1_7;
	}
	__Node  PreBinFlow_S_57 {
		__XCoord = (1100,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1101";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_ANALOG_USB_OTG_100_58 {
		__XCoord = (1100,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1102";
		__Exec =  F_FUNC_Vmin_ANALOG_USB_OTG_100;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPre1_8_59 {
		__XCoord = (1250,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1103";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPre1_8;
	}
	__Node  PreBinFlow_S_60 {
		__XCoord = (1250,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1104";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_1_61 {
		__XCoord = (1250,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1105";
		__Exec =  F_FUNC_Vmin_1;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPre1_9_62 {
		__XCoord = (1400,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1106";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPre1_9;
	}
	__Node  PreBinFlow_S_63 {
		__XCoord = (1400,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1107";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_ANALOG_USB_CHG_100_64 {
		__XCoord = (1400,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1108";
		__Exec =  F_FUNC_Vmin_ANALOG_USB_CHG_100;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_65 {
		__XCoord = (1550,150);
		__InputPosition = 270;
		__TestID = "1109";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  VminSearchPre1_35;
	__PortConnections {
	 VminSearchPre1_35 __Port[0] =  VminSearchPre1_1_38;//To Port = 3;
	 VminSearchPre1_35 __Port[1] =  PreBinFlow_S_36;//To Port = 1;
	 PreBinFlow_S_36 __Port[0] =  F_FUNC_Vmin_37;//To Port = 2;
	 F_FUNC_Vmin_37 __Port[0] =  VminSearchPre1_1_38;//To Port = 3;
	 VminSearchPre1_1_38 __Port[0] =  VminSearchPre1_2_41;//To Port = 6;
	 VminSearchPre1_1_38 __Port[1] =  PreBinFlow_S_39;//To Port = 4;
	 PreBinFlow_S_39 __Port[0] =  F_FUNC_Vmin_GROS_100_pre_40;//To Port = 5;
	 F_FUNC_Vmin_GROS_100_pre_40 __Port[0] =  VminSearchPre1_2_41;//To Port = 6;
	 VminSearchPre1_2_41 __Port[0] =  VminSearchPre1_3_44;//To Port = 9;
	 VminSearchPre1_2_41 __Port[1] =  PreBinFlow_S_42;//To Port = 7;
	 PreBinFlow_S_42 __Port[0] =  F_FUNC_Vmin_GROS_100_1_pre_43;//To Port = 8;
	 F_FUNC_Vmin_GROS_100_1_pre_43 __Port[0] =  VminSearchPre1_3_44;//To Port = 9;
	 VminSearchPre1_3_44 __Port[0] =  VminSearchPre1_4_47;//To Port = 12;
	 VminSearchPre1_3_44 __Port[1] =  PreBinFlow_S_45;//To Port = 10;
	 PreBinFlow_S_45 __Port[0] =  F_FUNC_Vmin_GROS_100_2_pre_46;//To Port = 11;
	 F_FUNC_Vmin_GROS_100_2_pre_46 __Port[0] =  VminSearchPre1_4_47;//To Port = 12;
	 VminSearchPre1_4_47 __Port[0] =  VminSearchPre1_5_50;//To Port = 15;
	 VminSearchPre1_4_47 __Port[1] =  PreBinFlow_S_48;//To Port = 13;
	 PreBinFlow_S_48 __Port[0] =  F_FUNC_Vmin_GROS_100_3_pre_49;//To Port = 14;
	 F_FUNC_Vmin_GROS_100_3_pre_49 __Port[0] =  VminSearchPre1_5_50;//To Port = 15;
	 VminSearchPre1_5_50 __Port[0] =  VminSearchPre1_6_53;//To Port = 18;
	 VminSearchPre1_5_50 __Port[1] =  PreBinFlow_S_51;//To Port = 16;
	 PreBinFlow_S_51 __Port[0] =  F_FUNC_Vmin_GROS_100_4_pre_52;//To Port = 17;
	 F_FUNC_Vmin_GROS_100_4_pre_52 __Port[0] =  VminSearchPre1_6_53;//To Port = 18;
	 VminSearchPre1_6_53 __Port[0] =  VminSearchPre1_7_56;//To Port = 21;
	 VminSearchPre1_6_53 __Port[1] =  PreBinFlow_S_54;//To Port = 19;
	 PreBinFlow_S_54 __Port[0] =  F_FUNC_Vmin_GROS_166p66_pre_55;//To Port = 20;
	 F_FUNC_Vmin_GROS_166p66_pre_55 __Port[0] =  VminSearchPre1_7_56;//To Port = 21;
	 VminSearchPre1_7_56 __Port[0] =  VminSearchPre1_8_59;//To Port = 24;
	 VminSearchPre1_7_56 __Port[1] =  PreBinFlow_S_57;//To Port = 22;
	 PreBinFlow_S_57 __Port[0] =  F_FUNC_Vmin_ANALOG_USB_OTG_100_58;//To Port = 23;
	 F_FUNC_Vmin_ANALOG_USB_OTG_100_58 __Port[0] =  VminSearchPre1_8_59;//To Port = 24;
	 VminSearchPre1_8_59 __Port[0] =  VminSearchPre1_9_62;//To Port = 27;
	 VminSearchPre1_8_59 __Port[1] =  PreBinFlow_S_60;//To Port = 25;
	 PreBinFlow_S_60 __Port[0] =  F_FUNC_Vmin_1_61;//To Port = 26;
	 F_FUNC_Vmin_1_61 __Port[0] =  VminSearchPre1_9_62;//To Port = 27;
	 VminSearchPre1_9_62 __Port[0] = FlowNode_65;//To Port = 30;
	 VminSearchPre1_9_62 __Port[1] =  PreBinFlow_S_63;//To Port = 28;
	 PreBinFlow_S_63 __Port[0] =  F_FUNC_Vmin_ANALOG_USB_CHG_100_64;//To Port = 29;
	 F_FUNC_Vmin_ANALOG_USB_CHG_100_64 __Port[0] = FlowNode_65;//To Port = 30;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,1550,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_SrchVdd_Vmin_Pre1_S ***/

/****************************************************************************/
/*** SubFlow DPSE_Func_Vmin_Pre1_S                                        ***/
/****************************************************************************/
__SubFlow DPSE_Func_Vmin_Pre1_S {
	__Node  FuncVminPre1_66 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1110";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1;
	}
	__Node  PreBinFlow_S_67 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1111";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_2_68 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1112";
		__Exec =  F_FUNC_Vmin_2;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_1_69 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1113";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_1;
	}
	__Node  PreBinFlow_S_70 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1114";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_pre_3_71 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1115";
		__Exec =  F_FUNC_Vmin_GROS_100_pre_3;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_2_72 {
		__XCoord = (350,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_15"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1116";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_2;
	}
	__Node  PreBinFlow_S_73 {
		__XCoord = (350,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1117";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_1_pre_4_74 {
		__XCoord = (350,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1118";
		__Exec =  F_FUNC_Vmin_GROS_100_1_pre_4;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_3_75 {
		__XCoord = (500,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_16"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1119";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_3;
	}
	__Node  PreBinFlow_S_76 {
		__XCoord = (500,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1120";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_2_pre_5_77 {
		__XCoord = (500,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1121";
		__Exec =  F_FUNC_Vmin_GROS_100_2_pre_5;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_4_78 {
		__XCoord = (650,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1122";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_4;
	}
	__Node  PreBinFlow_S_79 {
		__XCoord = (650,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1123";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_3_pre_6_80 {
		__XCoord = (650,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1124";
		__Exec =  F_FUNC_Vmin_GROS_100_3_pre_6;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_5_81 {
		__XCoord = (800,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_18"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1125";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_5;
	}
	__Node  PreBinFlow_S_82 {
		__XCoord = (800,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1126";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_4_pre_7_83 {
		__XCoord = (800,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1127";
		__Exec =  F_FUNC_Vmin_GROS_100_4_pre_7;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_6_84 {
		__XCoord = (950,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_9"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1128";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_6;
	}
	__Node  PreBinFlow_S_85 {
		__XCoord = (950,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1129";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_166p66_pre_8_86 {
		__XCoord = (950,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1130";
		__Exec =  F_FUNC_Vmin_GROS_166p66_pre_8;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_7_87 {
		__XCoord = (1100,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1131";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_7;
	}
	__Node  PreBinFlow_S_88 {
		__XCoord = (1100,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1132";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_10_89 {
		__XCoord = (1100,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1133";
		__Exec =  F_FUNC_Vmin_10;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_8_90 {
		__XCoord = (1250,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1134";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_8;
	}
	__Node  PreBinFlow_S_91 {
		__XCoord = (1250,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1135";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_11_92 {
		__XCoord = (1250,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1136";
		__Exec =  F_FUNC_Vmin_11;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_9_93 {
		__XCoord = (1400,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1137";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_9;
	}
	__Node  PreBinFlow_S_94 {
		__XCoord = (1400,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1138";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_13_95 {
		__XCoord = (1400,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1139";
		__Exec =  F_FUNC_Vmin_13;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_96 {
		__XCoord = (1550,150);
		__InputPosition = 270;
		__TestID = "1140";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  FuncVminPre1_66;
	__PortConnections {
	 FuncVminPre1_66 __Port[0] =  FuncVminPre1_1_69;//To Port = 3;
	 FuncVminPre1_66 __Port[1] =  PreBinFlow_S_67;//To Port = 1;
	 PreBinFlow_S_67 __Port[0] =  F_FUNC_Vmin_2_68;//To Port = 2;
	 F_FUNC_Vmin_2_68 __Port[0] =  FuncVminPre1_1_69;//To Port = 3;
	 FuncVminPre1_1_69 __Port[0] =  FuncVminPre1_2_72;//To Port = 6;
	 FuncVminPre1_1_69 __Port[1] =  PreBinFlow_S_70;//To Port = 4;
	 PreBinFlow_S_70 __Port[0] =  F_FUNC_Vmin_GROS_100_pre_3_71;//To Port = 5;
	 F_FUNC_Vmin_GROS_100_pre_3_71 __Port[0] =  FuncVminPre1_2_72;//To Port = 6;
	 FuncVminPre1_2_72 __Port[0] =  FuncVminPre1_3_75;//To Port = 9;
	 FuncVminPre1_2_72 __Port[1] =  PreBinFlow_S_73;//To Port = 7;
	 PreBinFlow_S_73 __Port[0] =  F_FUNC_Vmin_GROS_100_1_pre_4_74;//To Port = 8;
	 F_FUNC_Vmin_GROS_100_1_pre_4_74 __Port[0] =  FuncVminPre1_3_75;//To Port = 9;
	 FuncVminPre1_3_75 __Port[0] =  FuncVminPre1_4_78;//To Port = 12;
	 FuncVminPre1_3_75 __Port[1] =  PreBinFlow_S_76;//To Port = 10;
	 PreBinFlow_S_76 __Port[0] =  F_FUNC_Vmin_GROS_100_2_pre_5_77;//To Port = 11;
	 F_FUNC_Vmin_GROS_100_2_pre_5_77 __Port[0] =  FuncVminPre1_4_78;//To Port = 12;
	 FuncVminPre1_4_78 __Port[0] =  FuncVminPre1_5_81;//To Port = 15;
	 FuncVminPre1_4_78 __Port[1] =  PreBinFlow_S_79;//To Port = 13;
	 PreBinFlow_S_79 __Port[0] =  F_FUNC_Vmin_GROS_100_3_pre_6_80;//To Port = 14;
	 F_FUNC_Vmin_GROS_100_3_pre_6_80 __Port[0] =  FuncVminPre1_5_81;//To Port = 15;
	 FuncVminPre1_5_81 __Port[0] =  FuncVminPre1_6_84;//To Port = 18;
	 FuncVminPre1_5_81 __Port[1] =  PreBinFlow_S_82;//To Port = 16;
	 PreBinFlow_S_82 __Port[0] =  F_FUNC_Vmin_GROS_100_4_pre_7_83;//To Port = 17;
	 F_FUNC_Vmin_GROS_100_4_pre_7_83 __Port[0] =  FuncVminPre1_6_84;//To Port = 18;
	 FuncVminPre1_6_84 __Port[0] =  FuncVminPre1_7_87;//To Port = 21;
	 FuncVminPre1_6_84 __Port[1] =  PreBinFlow_S_85;//To Port = 19;
	 PreBinFlow_S_85 __Port[0] =  F_FUNC_Vmin_GROS_166p66_pre_8_86;//To Port = 20;
	 F_FUNC_Vmin_GROS_166p66_pre_8_86 __Port[0] =  FuncVminPre1_7_87;//To Port = 21;
	 FuncVminPre1_7_87 __Port[0] =  FuncVminPre1_8_90;//To Port = 24;
	 FuncVminPre1_7_87 __Port[1] =  PreBinFlow_S_88;//To Port = 22;
	 PreBinFlow_S_88 __Port[0] =  F_FUNC_Vmin_10_89;//To Port = 23;
	 F_FUNC_Vmin_10_89 __Port[0] =  FuncVminPre1_8_90;//To Port = 24;
	 FuncVminPre1_8_90 __Port[0] =  FuncVminPre1_9_93;//To Port = 27;
	 FuncVminPre1_8_90 __Port[1] =  PreBinFlow_S_91;//To Port = 25;
	 PreBinFlow_S_91 __Port[0] =  F_FUNC_Vmin_11_92;//To Port = 26;
	 F_FUNC_Vmin_11_92 __Port[0] =  FuncVminPre1_9_93;//To Port = 27;
	 FuncVminPre1_9_93 __Port[0] = FlowNode_96;//To Port = 30;
	 FuncVminPre1_9_93 __Port[1] =  PreBinFlow_S_94;//To Port = 28;
	 PreBinFlow_S_94 __Port[0] =  F_FUNC_Vmin_13_95;//To Port = 29;
	 F_FUNC_Vmin_13_95 __Port[0] = FlowNode_96;//To Port = 30;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,1550,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_Func_Vmin_Pre1_S ***/

/****************************************************************************/
/*** SubFlow DPSE_PreStress_S                                             ***/
/****************************************************************************/
__SubFlow DPSE_PreStress_S {
	__Node  DPSE_SrchVdd_Vmin_Pre1_S_97 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1141";
		__Exec =  DPSE_SrchVdd_Vmin_Pre1_S;
	}
	__Node  DPSE_Func_Vmin_Pre1_S_98 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1142";
		__Exec =  DPSE_Func_Vmin_Pre1_S;
	}
	__Node FlowNode_99 {
		__XCoord = (350,50);
		__InputPosition = 270;
		__TestID = "1143";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  DPSE_SrchVdd_Vmin_Pre1_S_97;
	__PortConnections {
	 DPSE_SrchVdd_Vmin_Pre1_S_97 __Port[0] =  DPSE_Func_Vmin_Pre1_S_98;//To Port = 1;
	 DPSE_Func_Vmin_Pre1_S_98 __Port[0] = FlowNode_99;//To Port = 2;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_PreStress_S ***/

/****************************************************************************/
/*** SubFlow DPSE_Func_Vmin_Pre2_S                                        ***/
/****************************************************************************/
__SubFlow DPSE_Func_Vmin_Pre2_S {
	__Node  FuncVminPre2_100 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_11"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1144";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre2;
	}
	__Node  PreBinFlow_S_101 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1145";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_BIST_PROD_33_pre_102 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1146";
		__Exec =  F_FUNC_Vmin_BIST_PROD_33_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre2_1_103 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_12"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1147";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre2_1;
	}
	__Node  PreBinFlow_S_104 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1148";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_BIST_PROD_33_1_pre_105 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1149";
		__Exec =  F_FUNC_Vmin_BIST_PROD_33_1_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_106 {
		__XCoord = (350,150);
		__InputPosition = 270;
		__TestID = "1150";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  FuncVminPre2_100;
	__PortConnections {
	 FuncVminPre2_100 __Port[0] =  FuncVminPre2_1_103;//To Port = 3;
	 FuncVminPre2_100 __Port[1] =  PreBinFlow_S_101;//To Port = 1;
	 PreBinFlow_S_101 __Port[0] =  F_FUNC_Vmin_BIST_PROD_33_pre_102;//To Port = 2;
	 F_FUNC_Vmin_BIST_PROD_33_pre_102 __Port[0] =  FuncVminPre2_1_103;//To Port = 3;
	 FuncVminPre2_1_103 __Port[0] = FlowNode_106;//To Port = 6;
	 FuncVminPre2_1_103 __Port[1] =  PreBinFlow_S_104;//To Port = 4;
	 PreBinFlow_S_104 __Port[0] =  F_FUNC_Vmin_BIST_PROD_33_1_pre_105;//To Port = 5;
	 F_FUNC_Vmin_BIST_PROD_33_1_pre_105 __Port[0] = FlowNode_106;//To Port = 6;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_Func_Vmin_Pre2_S ***/

/****************************************************************************/
/*** SubFlow DPSE_PreStressPostRepr_S                                     ***/
/****************************************************************************/
__SubFlow DPSE_PreStressPostRepr_S {
	__Node  DPSE_Func_Vmin_Pre2_S_107 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1151";
		__Exec =  DPSE_Func_Vmin_Pre2_S;
	}
	__Node FlowNode_108 {
		__XCoord = (200,50);
		__InputPosition = 270;
		__TestID = "1152";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  DPSE_Func_Vmin_Pre2_S_107;
	__PortConnections {
	 DPSE_Func_Vmin_Pre2_S_107 __Port[0] = FlowNode_108;//To Port = 1;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_PreStressPostRepr_S ***/

/****************************************************************************/
/*** SubFlow DPSE_Func_Vmax_Post_S                                        ***/
/****************************************************************************/
__SubFlow DPSE_Func_Vmax_Post_S {
	__Node  FuncVmaxPost_109 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1153";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost;
	}
	__Node  PreBinFlow_S_110 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1154";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_111 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1155";
		__Exec =  F_FUNC_Vmax;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_1_112 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1156";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_1;
	}
	__Node  PreBinFlow_S_113 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1157";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_GROS_100_post_114 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1158";
		__Exec =  F_FUNC_Vmax_GROS_100_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_2_115 {
		__XCoord = (350,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_15"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1159";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_2;
	}
	__Node  PreBinFlow_S_116 {
		__XCoord = (350,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1160";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_GROS_100_1_post_117 {
		__XCoord = (350,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1161";
		__Exec =  F_FUNC_Vmax_GROS_100_1_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_3_118 {
		__XCoord = (500,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_16"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1162";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_3;
	}
	__Node  PreBinFlow_S_119 {
		__XCoord = (500,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1163";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_GROS_100_2_post_120 {
		__XCoord = (500,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1164";
		__Exec =  F_FUNC_Vmax_GROS_100_2_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_4_121 {
		__XCoord = (650,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1165";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_4;
	}
	__Node  PreBinFlow_S_122 {
		__XCoord = (650,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1166";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_GROS_100_3_post_123 {
		__XCoord = (650,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1167";
		__Exec =  F_FUNC_Vmax_GROS_100_3_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_5_124 {
		__XCoord = (800,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_18"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1168";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_5;
	}
	__Node  PreBinFlow_S_125 {
		__XCoord = (800,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1169";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_GROS_100_4_post_126 {
		__XCoord = (800,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1170";
		__Exec =  F_FUNC_Vmax_GROS_100_4_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_6_127 {
		__XCoord = (950,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_9"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1171";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_6;
	}
	__Node  PreBinFlow_S_128 {
		__XCoord = (950,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1172";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_GROS_166p66_post_129 {
		__XCoord = (950,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1173";
		__Exec =  F_FUNC_Vmax_GROS_166p66_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_7_130 {
		__XCoord = (1100,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1174";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_7;
	}
	__Node  PreBinFlow_S_131 {
		__XCoord = (1100,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1175";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_ANALOG_USB_OTG_100_132 {
		__XCoord = (1100,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1176";
		__Exec =  F_FUNC_Vmax_ANALOG_USB_OTG_100;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_8_133 {
		__XCoord = (1250,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_11"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1177";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_8;
	}
	__Node  PreBinFlow_S_134 {
		__XCoord = (1250,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1178";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_BIST_PROD_33_post_135 {
		__XCoord = (1250,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1179";
		__Exec =  F_FUNC_Vmax_BIST_PROD_33_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_9_136 {
		__XCoord = (1400,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_12"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1180";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_9;
	}
	__Node  PreBinFlow_S_137 {
		__XCoord = (1400,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1181";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_BIST_PROD_33_1_138 {
		__XCoord = (1400,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1182";
		__Exec =  F_FUNC_Vmax_BIST_PROD_33_1;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_10_139 {
		__XCoord = (1550,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1183";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_10;
	}
	__Node  PreBinFlow_S_140 {
		__XCoord = (1550,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1184";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_1_141 {
		__XCoord = (1550,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1185";
		__Exec =  F_FUNC_Vmax_1;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_11_142 {
		__XCoord = (1700,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1186";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_11;
	}
	__Node  PreBinFlow_S_143 {
		__XCoord = (1700,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1187";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_ANALOG_USB_CHG_100_144 {
		__XCoord = (1700,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1188";
		__Exec =  F_FUNC_Vmax_ANALOG_USB_CHG_100;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_145 {
		__XCoord = (1850,150);
		__InputPosition = 270;
		__TestID = "1189";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  FuncVmaxPost_109;
	__PortConnections {
	 FuncVmaxPost_109 __Port[0] =  FuncVmaxPost_1_112;//To Port = 3;
	 FuncVmaxPost_109 __Port[1] =  PreBinFlow_S_110;//To Port = 1;
	 PreBinFlow_S_110 __Port[0] =  F_FUNC_Vmax_111;//To Port = 2;
	 F_FUNC_Vmax_111 __Port[0] =  FuncVmaxPost_1_112;//To Port = 3;
	 FuncVmaxPost_1_112 __Port[0] =  FuncVmaxPost_2_115;//To Port = 6;
	 FuncVmaxPost_1_112 __Port[1] =  PreBinFlow_S_113;//To Port = 4;
	 PreBinFlow_S_113 __Port[0] =  F_FUNC_Vmax_GROS_100_post_114;//To Port = 5;
	 F_FUNC_Vmax_GROS_100_post_114 __Port[0] =  FuncVmaxPost_2_115;//To Port = 6;
	 FuncVmaxPost_2_115 __Port[0] =  FuncVmaxPost_3_118;//To Port = 9;
	 FuncVmaxPost_2_115 __Port[1] =  PreBinFlow_S_116;//To Port = 7;
	 PreBinFlow_S_116 __Port[0] =  F_FUNC_Vmax_GROS_100_1_post_117;//To Port = 8;
	 F_FUNC_Vmax_GROS_100_1_post_117 __Port[0] =  FuncVmaxPost_3_118;//To Port = 9;
	 FuncVmaxPost_3_118 __Port[0] =  FuncVmaxPost_4_121;//To Port = 12;
	 FuncVmaxPost_3_118 __Port[1] =  PreBinFlow_S_119;//To Port = 10;
	 PreBinFlow_S_119 __Port[0] =  F_FUNC_Vmax_GROS_100_2_post_120;//To Port = 11;
	 F_FUNC_Vmax_GROS_100_2_post_120 __Port[0] =  FuncVmaxPost_4_121;//To Port = 12;
	 FuncVmaxPost_4_121 __Port[0] =  FuncVmaxPost_5_124;//To Port = 15;
	 FuncVmaxPost_4_121 __Port[1] =  PreBinFlow_S_122;//To Port = 13;
	 PreBinFlow_S_122 __Port[0] =  F_FUNC_Vmax_GROS_100_3_post_123;//To Port = 14;
	 F_FUNC_Vmax_GROS_100_3_post_123 __Port[0] =  FuncVmaxPost_5_124;//To Port = 15;
	 FuncVmaxPost_5_124 __Port[0] =  FuncVmaxPost_6_127;//To Port = 18;
	 FuncVmaxPost_5_124 __Port[1] =  PreBinFlow_S_125;//To Port = 16;
	 PreBinFlow_S_125 __Port[0] =  F_FUNC_Vmax_GROS_100_4_post_126;//To Port = 17;
	 F_FUNC_Vmax_GROS_100_4_post_126 __Port[0] =  FuncVmaxPost_6_127;//To Port = 18;
	 FuncVmaxPost_6_127 __Port[0] =  FuncVmaxPost_7_130;//To Port = 21;
	 FuncVmaxPost_6_127 __Port[1] =  PreBinFlow_S_128;//To Port = 19;
	 PreBinFlow_S_128 __Port[0] =  F_FUNC_Vmax_GROS_166p66_post_129;//To Port = 20;
	 F_FUNC_Vmax_GROS_166p66_post_129 __Port[0] =  FuncVmaxPost_7_130;//To Port = 21;
	 FuncVmaxPost_7_130 __Port[0] =  FuncVmaxPost_8_133;//To Port = 24;
	 FuncVmaxPost_7_130 __Port[1] =  PreBinFlow_S_131;//To Port = 22;
	 PreBinFlow_S_131 __Port[0] =  F_FUNC_Vmax_ANALOG_USB_OTG_100_132;//To Port = 23;
	 F_FUNC_Vmax_ANALOG_USB_OTG_100_132 __Port[0] =  FuncVmaxPost_8_133;//To Port = 24;
	 FuncVmaxPost_8_133 __Port[0] =  FuncVmaxPost_9_136;//To Port = 27;
	 FuncVmaxPost_8_133 __Port[1] =  PreBinFlow_S_134;//To Port = 25;
	 PreBinFlow_S_134 __Port[0] =  F_FUNC_Vmax_BIST_PROD_33_post_135;//To Port = 26;
	 F_FUNC_Vmax_BIST_PROD_33_post_135 __Port[0] =  FuncVmaxPost_9_136;//To Port = 27;
	 FuncVmaxPost_9_136 __Port[0] =  FuncVmaxPost_10_139;//To Port = 30;
	 FuncVmaxPost_9_136 __Port[1] =  PreBinFlow_S_137;//To Port = 28;
	 PreBinFlow_S_137 __Port[0] =  F_FUNC_Vmax_BIST_PROD_33_1_138;//To Port = 29;
	 F_FUNC_Vmax_BIST_PROD_33_1_138 __Port[0] =  FuncVmaxPost_10_139;//To Port = 30;
	 FuncVmaxPost_10_139 __Port[0] =  FuncVmaxPost_11_142;//To Port = 33;
	 FuncVmaxPost_10_139 __Port[1] =  PreBinFlow_S_140;//To Port = 31;
	 PreBinFlow_S_140 __Port[0] =  F_FUNC_Vmax_1_141;//To Port = 32;
	 F_FUNC_Vmax_1_141 __Port[0] =  FuncVmaxPost_11_142;//To Port = 33;
	 FuncVmaxPost_11_142 __Port[0] = FlowNode_145;//To Port = 36;
	 FuncVmaxPost_11_142 __Port[1] =  PreBinFlow_S_143;//To Port = 34;
	 PreBinFlow_S_143 __Port[0] =  F_FUNC_Vmax_ANALOG_USB_CHG_100_144;//To Port = 35;
	 F_FUNC_Vmax_ANALOG_USB_CHG_100_144 __Port[0] = FlowNode_145;//To Port = 36;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,1850,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_Func_Vmax_Post_S ***/

/****************************************************************************/
/*** SubFlow DPSE_Func_Vmin_Post_S                                        ***/
/****************************************************************************/
__SubFlow DPSE_Func_Vmin_Post_S {
	__Node  FuncVminPost_146 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1190";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost;
	}
	__Node  PreBinFlow_S_147 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1191";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_3_148 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1192";
		__Exec =  F_FUNC_Vmin_3;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_1_149 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1193";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_1;
	}
	__Node  PreBinFlow_S_150 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1194";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_post_151 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1195";
		__Exec =  F_FUNC_Vmin_GROS_100_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_2_152 {
		__XCoord = (350,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_15"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1196";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_2;
	}
	__Node  PreBinFlow_S_153 {
		__XCoord = (350,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1197";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_1_post_154 {
		__XCoord = (350,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1198";
		__Exec =  F_FUNC_Vmin_GROS_100_1_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_3_155 {
		__XCoord = (500,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_16"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1199";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_3;
	}
	__Node  PreBinFlow_S_156 {
		__XCoord = (500,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1200";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_2_post_157 {
		__XCoord = (500,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1201";
		__Exec =  F_FUNC_Vmin_GROS_100_2_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_4_158 {
		__XCoord = (650,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1202";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_4;
	}
	__Node  PreBinFlow_S_159 {
		__XCoord = (650,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1203";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_3_post_160 {
		__XCoord = (650,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1204";
		__Exec =  F_FUNC_Vmin_GROS_100_3_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_5_161 {
		__XCoord = (800,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_18"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1205";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_5;
	}
	__Node  PreBinFlow_S_162 {
		__XCoord = (800,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1206";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_4_post_163 {
		__XCoord = (800,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1207";
		__Exec =  F_FUNC_Vmin_GROS_100_4_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_6_164 {
		__XCoord = (950,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_9"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1208";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_6;
	}
	__Node  PreBinFlow_S_165 {
		__XCoord = (950,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1209";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_166p66_post_166 {
		__XCoord = (950,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1210";
		__Exec =  F_FUNC_Vmin_GROS_166p66_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_7_167 {
		__XCoord = (1100,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1211";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_7;
	}
	__Node  PreBinFlow_S_168 {
		__XCoord = (1100,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1212";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_5_169 {
		__XCoord = (1100,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1213";
		__Exec =  F_FUNC_Vmin_5;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_8_170 {
		__XCoord = (1250,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1214";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_8;
	}
	__Node  PreBinFlow_S_171 {
		__XCoord = (1250,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1215";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_6_172 {
		__XCoord = (1250,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1216";
		__Exec =  F_FUNC_Vmin_6;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_9_173 {
		__XCoord = (1400,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1217";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_9;
	}
	__Node  PreBinFlow_S_174 {
		__XCoord = (1400,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1218";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_8_175 {
		__XCoord = (1400,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1219";
		__Exec =  F_FUNC_Vmin_8;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_176 {
		__XCoord = (1550,150);
		__InputPosition = 270;
		__TestID = "1220";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  FuncVminPost_146;
	__PortConnections {
	 FuncVminPost_146 __Port[0] =  FuncVminPost_1_149;//To Port = 3;
	 FuncVminPost_146 __Port[1] =  PreBinFlow_S_147;//To Port = 1;
	 PreBinFlow_S_147 __Port[0] =  F_FUNC_Vmin_3_148;//To Port = 2;
	 F_FUNC_Vmin_3_148 __Port[0] =  FuncVminPost_1_149;//To Port = 3;
	 FuncVminPost_1_149 __Port[0] =  FuncVminPost_2_152;//To Port = 6;
	 FuncVminPost_1_149 __Port[1] =  PreBinFlow_S_150;//To Port = 4;
	 PreBinFlow_S_150 __Port[0] =  F_FUNC_Vmin_GROS_100_post_151;//To Port = 5;
	 F_FUNC_Vmin_GROS_100_post_151 __Port[0] =  FuncVminPost_2_152;//To Port = 6;
	 FuncVminPost_2_152 __Port[0] =  FuncVminPost_3_155;//To Port = 9;
	 FuncVminPost_2_152 __Port[1] =  PreBinFlow_S_153;//To Port = 7;
	 PreBinFlow_S_153 __Port[0] =  F_FUNC_Vmin_GROS_100_1_post_154;//To Port = 8;
	 F_FUNC_Vmin_GROS_100_1_post_154 __Port[0] =  FuncVminPost_3_155;//To Port = 9;
	 FuncVminPost_3_155 __Port[0] =  FuncVminPost_4_158;//To Port = 12;
	 FuncVminPost_3_155 __Port[1] =  PreBinFlow_S_156;//To Port = 10;
	 PreBinFlow_S_156 __Port[0] =  F_FUNC_Vmin_GROS_100_2_post_157;//To Port = 11;
	 F_FUNC_Vmin_GROS_100_2_post_157 __Port[0] =  FuncVminPost_4_158;//To Port = 12;
	 FuncVminPost_4_158 __Port[0] =  FuncVminPost_5_161;//To Port = 15;
	 FuncVminPost_4_158 __Port[1] =  PreBinFlow_S_159;//To Port = 13;
	 PreBinFlow_S_159 __Port[0] =  F_FUNC_Vmin_GROS_100_3_post_160;//To Port = 14;
	 F_FUNC_Vmin_GROS_100_3_post_160 __Port[0] =  FuncVminPost_5_161;//To Port = 15;
	 FuncVminPost_5_161 __Port[0] =  FuncVminPost_6_164;//To Port = 18;
	 FuncVminPost_5_161 __Port[1] =  PreBinFlow_S_162;//To Port = 16;
	 PreBinFlow_S_162 __Port[0] =  F_FUNC_Vmin_GROS_100_4_post_163;//To Port = 17;
	 F_FUNC_Vmin_GROS_100_4_post_163 __Port[0] =  FuncVminPost_6_164;//To Port = 18;
	 FuncVminPost_6_164 __Port[0] =  FuncVminPost_7_167;//To Port = 21;
	 FuncVminPost_6_164 __Port[1] =  PreBinFlow_S_165;//To Port = 19;
	 PreBinFlow_S_165 __Port[0] =  F_FUNC_Vmin_GROS_166p66_post_166;//To Port = 20;
	 F_FUNC_Vmin_GROS_166p66_post_166 __Port[0] =  FuncVminPost_7_167;//To Port = 21;
	 FuncVminPost_7_167 __Port[0] =  FuncVminPost_8_170;//To Port = 24;
	 FuncVminPost_7_167 __Port[1] =  PreBinFlow_S_168;//To Port = 22;
	 PreBinFlow_S_168 __Port[0] =  F_FUNC_Vmin_5_169;//To Port = 23;
	 F_FUNC_Vmin_5_169 __Port[0] =  FuncVminPost_8_170;//To Port = 24;
	 FuncVminPost_8_170 __Port[0] =  FuncVminPost_9_173;//To Port = 27;
	 FuncVminPost_8_170 __Port[1] =  PreBinFlow_S_171;//To Port = 25;
	 PreBinFlow_S_171 __Port[0] =  F_FUNC_Vmin_6_172;//To Port = 26;
	 F_FUNC_Vmin_6_172 __Port[0] =  FuncVminPost_9_173;//To Port = 27;
	 FuncVminPost_9_173 __Port[0] = FlowNode_176;//To Port = 30;
	 FuncVminPost_9_173 __Port[1] =  PreBinFlow_S_174;//To Port = 28;
	 PreBinFlow_S_174 __Port[0] =  F_FUNC_Vmin_8_175;//To Port = 29;
	 F_FUNC_Vmin_8_175 __Port[0] = FlowNode_176;//To Port = 30;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,1550,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_Func_Vmin_Post_S ***/

/****************************************************************************/
/*** SubFlow DPSE_PostStressFunc_S                                        ***/
/****************************************************************************/
__SubFlow DPSE_PostStressFunc_S {
	__Node  DPSE_Func_Vmax_Post_S_177 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1221";
		__Exec =  DPSE_Func_Vmax_Post_S;
	}
	__Node  DPSE_Func_Vmin_Post_S_178 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1222";
		__Exec =  DPSE_Func_Vmin_Post_S;
	}
	__Node FlowNode_179 {
		__XCoord = (350,50);
		__InputPosition = 270;
		__TestID = "1223";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  DPSE_Func_Vmax_Post_S_177;
	__PortConnections {
	 DPSE_Func_Vmax_Post_S_177 __Port[0] =  DPSE_Func_Vmin_Post_S_178;//To Port = 1;
	 DPSE_Func_Vmin_Post_S_178 __Port[0] = FlowNode_179;//To Port = 2;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_PostStressFunc_S ***/

/****************************************************************************/
/*** SubFlow DPSE_SrchVdd_Post_S                                          ***/
/****************************************************************************/
__SubFlow DPSE_SrchVdd_Post_S {
	__Node  VminSearchPost_180 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1224";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost;
	}
	__Node  PreBinFlow_S_181 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1225";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_4_182 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1226";
		__Exec =  F_FUNC_Vmin_4;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_1_183 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1227";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_1;
	}
	__Node  PreBinFlow_S_184 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1228";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_post_5_185 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1229";
		__Exec =  F_FUNC_Vmin_GROS_100_post_5;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_2_186 {
		__XCoord = (350,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_15"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1230";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_2;
	}
	__Node  PreBinFlow_S_187 {
		__XCoord = (350,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1231";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_1_post_6_188 {
		__XCoord = (350,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1232";
		__Exec =  F_FUNC_Vmin_GROS_100_1_post_6;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_3_189 {
		__XCoord = (500,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_16"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1233";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_3;
	}
	__Node  PreBinFlow_S_190 {
		__XCoord = (500,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1234";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_2_post_7_191 {
		__XCoord = (500,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1235";
		__Exec =  F_FUNC_Vmin_GROS_100_2_post_7;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_4_192 {
		__XCoord = (650,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1236";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_4;
	}
	__Node  PreBinFlow_S_193 {
		__XCoord = (650,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1237";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_3_post_8_194 {
		__XCoord = (650,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1238";
		__Exec =  F_FUNC_Vmin_GROS_100_3_post_8;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_5_195 {
		__XCoord = (800,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_18"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1239";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_5;
	}
	__Node  PreBinFlow_S_196 {
		__XCoord = (800,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1240";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_4_post_9_197 {
		__XCoord = (800,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1241";
		__Exec =  F_FUNC_Vmin_GROS_100_4_post_9;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_6_198 {
		__XCoord = (950,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_9"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1242";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_6;
	}
	__Node  PreBinFlow_S_199 {
		__XCoord = (950,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1243";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_166p66_200 {
		__XCoord = (950,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1244";
		__Exec =  F_FUNC_Vmin_GROS_166p66;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_7_201 {
		__XCoord = (1100,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1245";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_7;
	}
	__Node  PreBinFlow_S_202 {
		__XCoord = (1100,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1246";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_12_203 {
		__XCoord = (1100,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1247";
		__Exec =  F_FUNC_Vmin_12;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_8_204 {
		__XCoord = (1250,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1248";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_8;
	}
	__Node  PreBinFlow_S_205 {
		__XCoord = (1250,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1249";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_14_206 {
		__XCoord = (1250,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1250";
		__Exec =  F_FUNC_Vmin_14;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_9_207 {
		__XCoord = (1400,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1251";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_9;
	}
	__Node  PreBinFlow_S_208 {
		__XCoord = (1400,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1252";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_16_209 {
		__XCoord = (1400,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1253";
		__Exec =  F_FUNC_Vmin_16;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_210 {
		__XCoord = (1550,150);
		__InputPosition = 270;
		__TestID = "1254";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  VminSearchPost_180;
	__PortConnections {
	 VminSearchPost_180 __Port[0] =  VminSearchPost_1_183;//To Port = 3;
	 VminSearchPost_180 __Port[1] =  PreBinFlow_S_181;//To Port = 1;
	 PreBinFlow_S_181 __Port[0] =  F_FUNC_Vmin_4_182;//To Port = 2;
	 F_FUNC_Vmin_4_182 __Port[0] =  VminSearchPost_1_183;//To Port = 3;
	 VminSearchPost_1_183 __Port[0] =  VminSearchPost_2_186;//To Port = 6;
	 VminSearchPost_1_183 __Port[1] =  PreBinFlow_S_184;//To Port = 4;
	 PreBinFlow_S_184 __Port[0] =  F_FUNC_Vmin_GROS_100_post_5_185;//To Port = 5;
	 F_FUNC_Vmin_GROS_100_post_5_185 __Port[0] =  VminSearchPost_2_186;//To Port = 6;
	 VminSearchPost_2_186 __Port[0] =  VminSearchPost_3_189;//To Port = 9;
	 VminSearchPost_2_186 __Port[1] =  PreBinFlow_S_187;//To Port = 7;
	 PreBinFlow_S_187 __Port[0] =  F_FUNC_Vmin_GROS_100_1_post_6_188;//To Port = 8;
	 F_FUNC_Vmin_GROS_100_1_post_6_188 __Port[0] =  VminSearchPost_3_189;//To Port = 9;
	 VminSearchPost_3_189 __Port[0] =  VminSearchPost_4_192;//To Port = 12;
	 VminSearchPost_3_189 __Port[1] =  PreBinFlow_S_190;//To Port = 10;
	 PreBinFlow_S_190 __Port[0] =  F_FUNC_Vmin_GROS_100_2_post_7_191;//To Port = 11;
	 F_FUNC_Vmin_GROS_100_2_post_7_191 __Port[0] =  VminSearchPost_4_192;//To Port = 12;
	 VminSearchPost_4_192 __Port[0] =  VminSearchPost_5_195;//To Port = 15;
	 VminSearchPost_4_192 __Port[1] =  PreBinFlow_S_193;//To Port = 13;
	 PreBinFlow_S_193 __Port[0] =  F_FUNC_Vmin_GROS_100_3_post_8_194;//To Port = 14;
	 F_FUNC_Vmin_GROS_100_3_post_8_194 __Port[0] =  VminSearchPost_5_195;//To Port = 15;
	 VminSearchPost_5_195 __Port[0] =  VminSearchPost_6_198;//To Port = 18;
	 VminSearchPost_5_195 __Port[1] =  PreBinFlow_S_196;//To Port = 16;
	 PreBinFlow_S_196 __Port[0] =  F_FUNC_Vmin_GROS_100_4_post_9_197;//To Port = 17;
	 F_FUNC_Vmin_GROS_100_4_post_9_197 __Port[0] =  VminSearchPost_6_198;//To Port = 18;
	 VminSearchPost_6_198 __Port[0] =  VminSearchPost_7_201;//To Port = 21;
	 VminSearchPost_6_198 __Port[1] =  PreBinFlow_S_199;//To Port = 19;
	 PreBinFlow_S_199 __Port[0] =  F_FUNC_Vmin_GROS_166p66_200;//To Port = 20;
	 F_FUNC_Vmin_GROS_166p66_200 __Port[0] =  VminSearchPost_7_201;//To Port = 21;
	 VminSearchPost_7_201 __Port[0] =  VminSearchPost_8_204;//To Port = 24;
	 VminSearchPost_7_201 __Port[1] =  PreBinFlow_S_202;//To Port = 22;
	 PreBinFlow_S_202 __Port[0] =  F_FUNC_Vmin_12_203;//To Port = 23;
	 F_FUNC_Vmin_12_203 __Port[0] =  VminSearchPost_8_204;//To Port = 24;
	 VminSearchPost_8_204 __Port[0] =  VminSearchPost_9_207;//To Port = 27;
	 VminSearchPost_8_204 __Port[1] =  PreBinFlow_S_205;//To Port = 25;
	 PreBinFlow_S_205 __Port[0] =  F_FUNC_Vmin_14_206;//To Port = 26;
	 F_FUNC_Vmin_14_206 __Port[0] =  VminSearchPost_9_207;//To Port = 27;
	 VminSearchPost_9_207 __Port[0] = FlowNode_210;//To Port = 30;
	 VminSearchPost_9_207 __Port[1] =  PreBinFlow_S_208;//To Port = 28;
	 PreBinFlow_S_208 __Port[0] =  F_FUNC_Vmin_16_209;//To Port = 29;
	 F_FUNC_Vmin_16_209 __Port[0] = FlowNode_210;//To Port = 30;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,1550,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_SrchVdd_Post_S ***/

/****************************************************************************/
/*** SubFlow DPSE_PostStressSrch_S                                        ***/
/****************************************************************************/
__SubFlow DPSE_PostStressSrch_S {
	__Node  DPSE_SrchVdd_Post_S_211 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1255";
		__Exec =  DPSE_SrchVdd_Post_S;
	}
	__Node FlowNode_212 {
		__XCoord = (200,50);
		__InputPosition = 270;
		__TestID = "1256";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  DPSE_SrchVdd_Post_S_211;
	__PortConnections {
	 DPSE_SrchVdd_Post_S_211 __Port[0] = FlowNode_212;//To Port = 1;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_PostStressSrch_S ***/

/****************************************************************************/
/*** SubFlow DPSE_Iddq_VboxLO_Post_S                                      ***/
/****************************************************************************/
__SubFlow DPSE_Iddq_VboxLO_Post_S {
	__Node  IddqVboxLOPost_213 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_3"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vboxlo"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1257";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  IddqVboxLOPost;
	}
	__Node  PreBinFlow_S_214 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1258";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IDDQ_Vboxlo_post_VDDS_215 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1259";
		__Exec =  F_LEAK_IDDQ_Vboxlo_post_VDDS;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  IddqVboxLOPost_1_216 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_10"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vboxlo"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1260";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  IddqVboxLOPost_1;
	}
	__Node  PreBinFlow_S_217 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1261";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IDDQ_Vboxlo_post_VDDS_1_218 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1262";
		__Exec =  F_LEAK_IDDQ_Vboxlo_post_VDDS_1;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_219 {
		__XCoord = (350,150);
		__InputPosition = 270;
		__TestID = "1263";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  IddqVboxLOPost_213;
	__PortConnections {
	 IddqVboxLOPost_213 __Port[0] =  IddqVboxLOPost_1_216;//To Port = 3;
	 IddqVboxLOPost_213 __Port[1] =  PreBinFlow_S_214;//To Port = 1;
	 PreBinFlow_S_214 __Port[0] =  F_LEAK_IDDQ_Vboxlo_post_VDDS_215;//To Port = 2;
	 F_LEAK_IDDQ_Vboxlo_post_VDDS_215 __Port[0] =  IddqVboxLOPost_1_216;//To Port = 3;
	 IddqVboxLOPost_1_216 __Port[0] = FlowNode_219;//To Port = 6;
	 IddqVboxLOPost_1_216 __Port[1] =  PreBinFlow_S_217;//To Port = 4;
	 PreBinFlow_S_217 __Port[0] =  F_LEAK_IDDQ_Vboxlo_post_VDDS_1_218;//To Port = 5;
	 F_LEAK_IDDQ_Vboxlo_post_VDDS_1_218 __Port[0] = FlowNode_219;//To Port = 6;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_Iddq_VboxLO_Post_S ***/

/****************************************************************************/
/*** SubFlow DPSE_Iddq_Vmax_Post_S                                        ***/
/****************************************************************************/
__SubFlow DPSE_Iddq_Vmax_Post_S {
	__Node  IddqVmax_220 {
		__XCoord = (50,250);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_3"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1264";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  IddqVmax;
	}
	__Node  PreBinFlow_S_221 {
		__XCoord = (50,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1265";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IDDQ_Vmax_VDDS_PM12_222 {
		__XCoord = (50,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1266";
		__Exec =  F_LEAK_IDDQ_Vmax_VDDS_PM12;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  IddqVmax_1_223 {
		__XCoord = (200,250);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_10"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1267";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  IddqVmax_1;
	}
	__Node  PreBinFlow_S_224 {
		__XCoord = (200,425);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1268";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IDDQ_Vmax_VDDS_PM411_225 {
		__XCoord = (200,555);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1269";
		__Exec =  F_LEAK_IDDQ_Vmax_VDDS_PM411;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_226 {
		__XCoord = (350,250);
		__InputPosition = 270;
		__TestID = "1270";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  IddqVmax_220;
	__PortConnections {
	 IddqVmax_220 __Port[0] =  IddqVmax_1_223;//To Port = 3;
	 IddqVmax_220 __Port[1] =  PreBinFlow_S_221;//To Port = 1;
	 PreBinFlow_S_221 __Port[0] =  F_LEAK_IDDQ_Vmax_VDDS_PM12_222;//To Port = 2;
	 F_LEAK_IDDQ_Vmax_VDDS_PM12_222 __Port[0] =  IddqVmax_1_223;//To Port = 3;
	 IddqVmax_1_223 __Port[0] = FlowNode_226;//To Port = 6;
	 IddqVmax_1_223 __Port[1] =  PreBinFlow_S_224;//To Port = 4;
	 PreBinFlow_S_224 __Port[0] =  F_LEAK_IDDQ_Vmax_VDDS_PM411_225;//To Port = 5;
	 F_LEAK_IDDQ_Vmax_VDDS_PM411_225 __Port[0] = FlowNode_226;//To Port = 6;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,235,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_Iddq_Vmax_Post_S ***/

/****************************************************************************/
/*** SubFlow DPSE_Iddq_Delta_S                                            ***/
/****************************************************************************/
__SubFlow DPSE_Iddq_Delta_S {
	__Node  IddqDelta_227 {
		__XCoord = (50,250);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.CommonPSdata"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1271";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  IddqDelta;
	}
	__Node  PreBinFlow_S_228 {
		__XCoord = (50,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1272";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IDDQ_Delta_229 {
		__XCoord = (50,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1273";
		__Exec =  F_LEAK_IDDQ_Delta;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_230 {
		__XCoord = (200,250);
		__InputPosition = 270;
		__TestID = "1274";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  IddqDelta_227;
	__PortConnections {
	 IddqDelta_227 __Port[0] = FlowNode_230;//To Port = 3;
	 IddqDelta_227 __Port[1] =  PreBinFlow_S_228;//To Port = 1;
	 PreBinFlow_S_228 __Port[0] =  F_LEAK_IDDQ_Delta_229;//To Port = 2;
	 F_LEAK_IDDQ_Delta_229 __Port[0] = FlowNode_230;//To Port = 3;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,235,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_Iddq_Delta_S ***/

/****************************************************************************/
/*** SubFlow DPSE_Iddq_Drift_S                                            ***/
/****************************************************************************/
__SubFlow DPSE_Iddq_Drift_S {
	__Node  IddqDrift_231 {
		__XCoord = (50,250);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.CommonPSdata"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1275";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  IddqDrift;
	}
	__Node  PreBinFlow_S_232 {
		__XCoord = (50,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1276";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IDDQ_Drift_233 {
		__XCoord = (50,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1277";
		__Exec =  F_LEAK_IDDQ_Drift;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_234 {
		__XCoord = (200,250);
		__InputPosition = 270;
		__TestID = "1278";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  IddqDrift_231;
	__PortConnections {
	 IddqDrift_231 __Port[0] = FlowNode_234;//To Port = 3;
	 IddqDrift_231 __Port[1] =  PreBinFlow_S_232;//To Port = 1;
	 PreBinFlow_S_232 __Port[0] =  F_LEAK_IDDQ_Drift_233;//To Port = 2;
	 F_LEAK_IDDQ_Drift_233 __Port[0] = FlowNode_234;//To Port = 3;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,235,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_Iddq_Drift_S ***/

/****************************************************************************/
/*** SubFlow DPSE_PostStressIddq_S                                        ***/
/****************************************************************************/
__SubFlow DPSE_PostStressIddq_S {
	__Node  DPSE_Iddq_VboxLO_Post_S_235 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1279";
		__Exec =  DPSE_Iddq_VboxLO_Post_S;
	}
	__Node  DPSE_Iddq_Vmax_Post_S_236 {
		__XCoord = (200,250);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1280";
		__Exec =  DPSE_Iddq_Vmax_Post_S;
	}
	__Node  DPSE_Iddq_Delta_S_237 {
		__XCoord = (350,250);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1281";
		__Exec =  DPSE_Iddq_Delta_S;
	}
	__Node  DPSE_Iddq_Drift_S_238 {
		__XCoord = (500,250);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1282";
		__Exec =  DPSE_Iddq_Drift_S;
	}
	__Node FlowNode_239 {
		__XCoord = (650,50);
		__InputPosition = 270;
		__TestID = "1283";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  DPSE_Iddq_VboxLO_Post_S_235;
	__PortConnections {
	 DPSE_Iddq_VboxLO_Post_S_235 __Port[0] = FlowNode_239;//To Port = 4;
	 DPSE_Iddq_Vmax_Post_S_236 __Port[0] = FlowNode_239;//To Port = 4;
	 DPSE_Iddq_Delta_S_237 __Port[0] = FlowNode_239;//To Port = 4;
	 DPSE_Iddq_Drift_S_238 __Port[0] = FlowNode_239;//To Port = 4;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,650,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_PostStressIddq_S ***/

/****************************************************************************/
/*** SubFlow DPSE_AtSpeed_Vmin_S                                          ***/
/****************************************************************************/
__SubFlow DPSE_AtSpeed_Vmin_S {
	__Node  AtSpeed_240 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_3"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1284";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed;
	}
	__Node  PreBinFlow_S_241 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1285";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmin_SCAN_AC_50_242 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1286";
		__Exec =  F_FUNC_FAST_Vmin_SCAN_AC_50;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_1_243 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_2"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1287";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_1;
	}
	__Node  PreBinFlow_S_244 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1288";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmin_SCAN_AC_50_1_245 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1289";
		__Exec =  F_FUNC_FAST_Vmin_SCAN_AC_50_1;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_2_246 {
		__XCoord = (350,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_3"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1290";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_2;
	}
	__Node  PreBinFlow_S_247 {
		__XCoord = (350,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1291";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmin_SCAN_AC_50_2_248 {
		__XCoord = (350,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1292";
		__Exec =  F_FUNC_FAST_Vmin_SCAN_AC_50_2;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_3_249 {
		__XCoord = (500,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_4"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1293";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_3;
	}
	__Node  PreBinFlow_S_250 {
		__XCoord = (500,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1294";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmin_SCAN_AC_50_3_251 {
		__XCoord = (500,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1295";
		__Exec =  F_FUNC_FAST_Vmin_SCAN_AC_50_3;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_4_252 {
		__XCoord = (650,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_5"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1296";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_4;
	}
	__Node  PreBinFlow_S_253 {
		__XCoord = (650,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1297";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmin_SCAN_AC_50_4_254 {
		__XCoord = (650,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1298";
		__Exec =  F_FUNC_FAST_Vmin_SCAN_AC_50_4;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_5_255 {
		__XCoord = (800,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_6"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1299";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_5;
	}
	__Node  PreBinFlow_S_256 {
		__XCoord = (800,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1300";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmin_SCAN_AC_50_5_257 {
		__XCoord = (800,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1301";
		__Exec =  F_FUNC_FAST_Vmin_SCAN_AC_50_5;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_258 {
		__XCoord = (950,150);
		__InputPosition = 270;
		__TestID = "1302";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  AtSpeed_240;
	__PortConnections {
	 AtSpeed_240 __Port[0] =  AtSpeed_1_243;//To Port = 3;
	 AtSpeed_240 __Port[1] =  PreBinFlow_S_241;//To Port = 1;
	 PreBinFlow_S_241 __Port[0] =  F_FUNC_FAST_Vmin_SCAN_AC_50_242;//To Port = 2;
	 F_FUNC_FAST_Vmin_SCAN_AC_50_242 __Port[0] =  AtSpeed_1_243;//To Port = 3;
	 AtSpeed_1_243 __Port[0] =  AtSpeed_2_246;//To Port = 6;
	 AtSpeed_1_243 __Port[1] =  PreBinFlow_S_244;//To Port = 4;
	 PreBinFlow_S_244 __Port[0] =  F_FUNC_FAST_Vmin_SCAN_AC_50_1_245;//To Port = 5;
	 F_FUNC_FAST_Vmin_SCAN_AC_50_1_245 __Port[0] =  AtSpeed_2_246;//To Port = 6;
	 AtSpeed_2_246 __Port[0] =  AtSpeed_3_249;//To Port = 9;
	 AtSpeed_2_246 __Port[1] =  PreBinFlow_S_247;//To Port = 7;
	 PreBinFlow_S_247 __Port[0] =  F_FUNC_FAST_Vmin_SCAN_AC_50_2_248;//To Port = 8;
	 F_FUNC_FAST_Vmin_SCAN_AC_50_2_248 __Port[0] =  AtSpeed_3_249;//To Port = 9;
	 AtSpeed_3_249 __Port[0] =  AtSpeed_4_252;//To Port = 12;
	 AtSpeed_3_249 __Port[1] =  PreBinFlow_S_250;//To Port = 10;
	 PreBinFlow_S_250 __Port[0] =  F_FUNC_FAST_Vmin_SCAN_AC_50_3_251;//To Port = 11;
	 F_FUNC_FAST_Vmin_SCAN_AC_50_3_251 __Port[0] =  AtSpeed_4_252;//To Port = 12;
	 AtSpeed_4_252 __Port[0] =  AtSpeed_5_255;//To Port = 15;
	 AtSpeed_4_252 __Port[1] =  PreBinFlow_S_253;//To Port = 13;
	 PreBinFlow_S_253 __Port[0] =  F_FUNC_FAST_Vmin_SCAN_AC_50_4_254;//To Port = 14;
	 F_FUNC_FAST_Vmin_SCAN_AC_50_4_254 __Port[0] =  AtSpeed_5_255;//To Port = 15;
	 AtSpeed_5_255 __Port[0] = FlowNode_258;//To Port = 18;
	 AtSpeed_5_255 __Port[1] =  PreBinFlow_S_256;//To Port = 16;
	 PreBinFlow_S_256 __Port[0] =  F_FUNC_FAST_Vmin_SCAN_AC_50_5_257;//To Port = 17;
	 F_FUNC_FAST_Vmin_SCAN_AC_50_5_257 __Port[0] = FlowNode_258;//To Port = 18;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,950,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_AtSpeed_Vmin_S ***/

/****************************************************************************/
/*** SubFlow DPSE_AtSpeed_Vmax_S                                          ***/
/****************************************************************************/
__SubFlow DPSE_AtSpeed_Vmax_S {
	__Node  AtSpeed_259 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_3"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1303";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed;
	}
	__Node  PreBinFlow_S_260 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1304";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmax_SCAN_AC_50_261 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1305";
		__Exec =  F_FUNC_FAST_Vmax_SCAN_AC_50;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_1_262 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_2"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1306";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_1;
	}
	__Node  PreBinFlow_S_263 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1307";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmax_SCAN_AC_50_1_264 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1308";
		__Exec =  F_FUNC_FAST_Vmax_SCAN_AC_50_1;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_2_265 {
		__XCoord = (350,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_3"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1309";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_2;
	}
	__Node  PreBinFlow_S_266 {
		__XCoord = (350,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1310";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmax_SCAN_AC_50_2_267 {
		__XCoord = (350,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1311";
		__Exec =  F_FUNC_FAST_Vmax_SCAN_AC_50_2;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_3_268 {
		__XCoord = (500,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_4"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1312";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_3;
	}
	__Node  PreBinFlow_S_269 {
		__XCoord = (500,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1313";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmax_SCAN_AC_50_3_270 {
		__XCoord = (500,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1314";
		__Exec =  F_FUNC_FAST_Vmax_SCAN_AC_50_3;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_4_271 {
		__XCoord = (650,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_5"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1315";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_4;
	}
	__Node  PreBinFlow_S_272 {
		__XCoord = (650,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1316";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmax_SCAN_AC_50_4_273 {
		__XCoord = (650,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1317";
		__Exec =  F_FUNC_FAST_Vmax_SCAN_AC_50_4;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_5_274 {
		__XCoord = (800,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_6"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1318";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_5;
	}
	__Node  PreBinFlow_S_275 {
		__XCoord = (800,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1319";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmax_SCAN_AC_50_5_276 {
		__XCoord = (800,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1320";
		__Exec =  F_FUNC_FAST_Vmax_SCAN_AC_50_5;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_277 {
		__XCoord = (950,150);
		__InputPosition = 270;
		__TestID = "1321";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  AtSpeed_259;
	__PortConnections {
	 AtSpeed_259 __Port[0] =  AtSpeed_1_262;//To Port = 3;
	 AtSpeed_259 __Port[1] =  PreBinFlow_S_260;//To Port = 1;
	 PreBinFlow_S_260 __Port[0] =  F_FUNC_FAST_Vmax_SCAN_AC_50_261;//To Port = 2;
	 F_FUNC_FAST_Vmax_SCAN_AC_50_261 __Port[0] =  AtSpeed_1_262;//To Port = 3;
	 AtSpeed_1_262 __Port[0] =  AtSpeed_2_265;//To Port = 6;
	 AtSpeed_1_262 __Port[1] =  PreBinFlow_S_263;//To Port = 4;
	 PreBinFlow_S_263 __Port[0] =  F_FUNC_FAST_Vmax_SCAN_AC_50_1_264;//To Port = 5;
	 F_FUNC_FAST_Vmax_SCAN_AC_50_1_264 __Port[0] =  AtSpeed_2_265;//To Port = 6;
	 AtSpeed_2_265 __Port[0] =  AtSpeed_3_268;//To Port = 9;
	 AtSpeed_2_265 __Port[1] =  PreBinFlow_S_266;//To Port = 7;
	 PreBinFlow_S_266 __Port[0] =  F_FUNC_FAST_Vmax_SCAN_AC_50_2_267;//To Port = 8;
	 F_FUNC_FAST_Vmax_SCAN_AC_50_2_267 __Port[0] =  AtSpeed_3_268;//To Port = 9;
	 AtSpeed_3_268 __Port[0] =  AtSpeed_4_271;//To Port = 12;
	 AtSpeed_3_268 __Port[1] =  PreBinFlow_S_269;//To Port = 10;
	 PreBinFlow_S_269 __Port[0] =  F_FUNC_FAST_Vmax_SCAN_AC_50_3_270;//To Port = 11;
	 F_FUNC_FAST_Vmax_SCAN_AC_50_3_270 __Port[0] =  AtSpeed_4_271;//To Port = 12;
	 AtSpeed_4_271 __Port[0] =  AtSpeed_5_274;//To Port = 15;
	 AtSpeed_4_271 __Port[1] =  PreBinFlow_S_272;//To Port = 13;
	 PreBinFlow_S_272 __Port[0] =  F_FUNC_FAST_Vmax_SCAN_AC_50_4_273;//To Port = 14;
	 F_FUNC_FAST_Vmax_SCAN_AC_50_4_273 __Port[0] =  AtSpeed_5_274;//To Port = 15;
	 AtSpeed_5_274 __Port[0] = FlowNode_277;//To Port = 18;
	 AtSpeed_5_274 __Port[1] =  PreBinFlow_S_275;//To Port = 16;
	 PreBinFlow_S_275 __Port[0] =  F_FUNC_FAST_Vmax_SCAN_AC_50_5_276;//To Port = 17;
	 F_FUNC_FAST_Vmax_SCAN_AC_50_5_276 __Port[0] = FlowNode_277;//To Port = 18;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,950,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_AtSpeed_Vmax_S ***/

/****************************************************************************/
/*** SubFlow DPSE_AtSpeed_S                                               ***/
/****************************************************************************/
__SubFlow DPSE_AtSpeed_S {
	__Node  DPSE_AtSpeed_Vmin_S_278 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1322";
		__Exec =  DPSE_AtSpeed_Vmin_S;
	}
	__Node  DPSE_AtSpeed_Vmax_S_279 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1323";
		__Exec =  DPSE_AtSpeed_Vmax_S;
	}
	__Node FlowNode_280 {
		__XCoord = (350,50);
		__InputPosition = 270;
		__TestID = "1324";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  DPSE_AtSpeed_Vmin_S_278;
	__PortConnections {
	 DPSE_AtSpeed_Vmin_S_278 __Port[0] =  DPSE_AtSpeed_Vmax_S_279;//To Port = 1;
	 DPSE_AtSpeed_Vmax_S_279 __Port[0] = FlowNode_280;//To Port = 2;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_AtSpeed_S ***/

/****************************************************************************/
/*** SubFlow DPSE_SpecLevels_Vmin_S                                       ***/
/****************************************************************************/
__SubFlow DPSE_SpecLevels_Vmin_S {
	__Node  SpecLevels_281 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1325";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  SpecLevels;
	}
	__Node  PreBinFlow_S_282 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1326";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_SPEC_Vmin_DC_PARA_100_283 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1327";
		__Exec =  F_FUNC_SPEC_Vmin_DC_PARA_100;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VoutVmin_284 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1328";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VoutVmin;
	}
	__Node  PreBinFlow_S_285 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1329";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_PARA_VIO_Vmin_PM86_DC_PM04_286 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1330";
		__Exec =  F_PARA_VIO_Vmin_PM86_DC_PM04;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_287 {
		__XCoord = (350,150);
		__InputPosition = 270;
		__TestID = "1331";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  SpecLevels_281;
	__PortConnections {
	 SpecLevels_281 __Port[0] =  VoutVmin_284;//To Port = 3;
	 SpecLevels_281 __Port[1] =  PreBinFlow_S_282;//To Port = 1;
	 PreBinFlow_S_282 __Port[0] =  F_FUNC_SPEC_Vmin_DC_PARA_100_283;//To Port = 2;
	 F_FUNC_SPEC_Vmin_DC_PARA_100_283 __Port[0] =  VoutVmin_284;//To Port = 3;
	 VoutVmin_284 __Port[0] = FlowNode_287;//To Port = 6;
	 VoutVmin_284 __Port[1] =  PreBinFlow_S_285;//To Port = 4;
	 PreBinFlow_S_285 __Port[0] =  F_PARA_VIO_Vmin_PM86_DC_PM04_286;//To Port = 5;
	 F_PARA_VIO_Vmin_PM86_DC_PM04_286 __Port[0] = FlowNode_287;//To Port = 6;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_SpecLevels_Vmin_S ***/

/****************************************************************************/
/*** SubFlow DPSE_SpecLevels_Vmax_S                                       ***/
/****************************************************************************/
__SubFlow DPSE_SpecLevels_Vmax_S {
	__Node  SpecLevels_288 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1332";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  SpecLevels;
	}
	__Node  PreBinFlow_S_289 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1333";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_SPEC_Vmax_DC_PARA_100_290 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1334";
		__Exec =  F_FUNC_SPEC_Vmax_DC_PARA_100;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VoutVmax_291 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1335";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  VoutVmax;
	}
	__Node  PreBinFlow_S_292 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1336";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_PARA_VIO_Vmax_PM86_DC_PM04_293 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1337";
		__Exec =  F_PARA_VIO_Vmax_PM86_DC_PM04;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_294 {
		__XCoord = (350,150);
		__InputPosition = 270;
		__TestID = "1338";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  SpecLevels_288;
	__PortConnections {
	 SpecLevels_288 __Port[0] =  VoutVmax_291;//To Port = 3;
	 SpecLevels_288 __Port[1] =  PreBinFlow_S_289;//To Port = 1;
	 PreBinFlow_S_289 __Port[0] =  F_FUNC_SPEC_Vmax_DC_PARA_100_290;//To Port = 2;
	 F_FUNC_SPEC_Vmax_DC_PARA_100_290 __Port[0] =  VoutVmax_291;//To Port = 3;
	 VoutVmax_291 __Port[0] = FlowNode_294;//To Port = 6;
	 VoutVmax_291 __Port[1] =  PreBinFlow_S_292;//To Port = 4;
	 PreBinFlow_S_292 __Port[0] =  F_PARA_VIO_Vmax_PM86_DC_PM04_293;//To Port = 5;
	 F_PARA_VIO_Vmax_PM86_DC_PM04_293 __Port[0] = FlowNode_294;//To Port = 6;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_SpecLevels_Vmax_S ***/

/****************************************************************************/
/*** SubFlow DPSE_Leakage_S                                               ***/
/****************************************************************************/
__SubFlow DPSE_Leakage_S {
	__Node  LeakIIn_295 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1339";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  LeakIIn;
	}
	__Node  PreBinFlow_S_296 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1340";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IIN_Vmax_297 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1341";
		__Exec =  F_LEAK_IIN_Vmax;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  LeakIO_298 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1342";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  LeakIO;
	}
	__Node  PreBinFlow_S_299 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "1343";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IOZ_Vmax_PM85_300 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "1344";
		__Exec =  F_LEAK_IOZ_Vmax_PM85;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_301 {
		__XCoord = (350,150);
		__InputPosition = 270;
		__TestID = "1345";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  LeakIIn_295;
	__PortConnections {
	 LeakIIn_295 __Port[0] =  LeakIO_298;//To Port = 3;
	 LeakIIn_295 __Port[1] =  PreBinFlow_S_296;//To Port = 1;
	 PreBinFlow_S_296 __Port[0] =  F_LEAK_IIN_Vmax_297;//To Port = 2;
	 F_LEAK_IIN_Vmax_297 __Port[0] =  LeakIO_298;//To Port = 3;
	 LeakIO_298 __Port[0] = FlowNode_301;//To Port = 6;
	 LeakIO_298 __Port[1] =  PreBinFlow_S_299;//To Port = 4;
	 PreBinFlow_S_299 __Port[0] =  F_LEAK_IOZ_Vmax_PM85_300;//To Port = 5;
	 F_LEAK_IOZ_Vmax_PM85_300 __Port[0] = FlowNode_301;//To Port = 6;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_Leakage_S ***/

/****************************************************************************/
/*** SubFlow DPSE_Parametrics_S                                           ***/
/****************************************************************************/
__SubFlow DPSE_Parametrics_S {
	__Node  DPSE_SpecLevels_Vmin_S_302 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1346";
		__Exec =  DPSE_SpecLevels_Vmin_S;
	}
	__Node  DPSE_SpecLevels_Vmax_S_303 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1347";
		__Exec =  DPSE_SpecLevels_Vmax_S;
	}
	__Node  DPSE_Leakage_S_304 {
		__XCoord = (350,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "1348";
		__Exec =  DPSE_Leakage_S;
	}
	__Node FlowNode_305 {
		__XCoord = (500,50);
		__InputPosition = 270;
		__TestID = "1349";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  DPSE_SpecLevels_Vmin_S_302;
	__PortConnections {
	 DPSE_SpecLevels_Vmin_S_302 __Port[0] =  DPSE_SpecLevels_Vmax_S_303;//To Port = 1;
	 DPSE_SpecLevels_Vmax_S_303 __Port[0] =  DPSE_Leakage_S_304;//To Port = 2;
	 DPSE_Leakage_S_304 __Port[0] = FlowNode_305;//To Port = 3;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,500,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_Parametrics_S ***/

/****************************************************************************/
/*** SubFlow DPSE_SupplyShort_S                                           ***/
/****************************************************************************/
__SubFlow DPSE_SupplyShort_S {
	__Node  SupplyShorts2_306 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.CommonPSdata"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1350";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  SupplyShorts2;
	}
	__Node  F_OS_SHRT_VDD_307 {
		__XCoord = (50,355);
		__InputPosition = 20;
		__TestID = "1351";
		__Exec =  F_OS_SHRT_VDD;
	}
	__Node FlowNode_308 {
		__XCoord = (200,150);
		__InputPosition = 270;
		__TestID = "1352";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  SupplyShorts2_306;
	__PortConnections {
	 SupplyShorts2_306 __Port[0] = FlowNode_308;//To Port = 2;
	 SupplyShorts2_306 __Port[1] =  F_OS_SHRT_VDD_307;//To Port = 1;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow DPSE_SupplyShort_S ***/

/****************************************************************************/
/*** SubFlow DPSE_CRES_S                                                  ***/
/****************************************************************************/
__SubFlow DPSE_CRES_S {
	__Node FlowNode_309 {
		__XCoord = (0,50);
		__Port[0] {
			__PortPosition = 90;
		}
		__Port[1] {
			__PortPosition = 175;
		}
		__InputPosition = 220;
		__TestID = "1353";
		__PortSelect =  "if ( fmod( TestProgData.CurSiteSerial, 50 ) = 0, 1, 0)";
	}
	__Node  Cres_310 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.CommonPSdata"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "1354";
		// // __Calibration = Bllizar_Calibration;
		__Exec =  Cres;
	}
	__Node  F_OS_CRES_311 {
		__XCoord = (-15,295);
		__InputPosition = 20;
		__TestID = "1355";
		__Exec =  F_OS_CRES;
	}
	__Node FlowNode_312 {
		__XCoord = (255,150);
		__InputPosition = 270;
		__TestID = "1356";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode = FlowNode_309;
	__PortConnections {
	FlowNode_309 __Port[0] = FlowNode_312;//To Port = 3;
	FlowNode_309 __Port[1] =  Cres_310;//To Port = 1;
	 Cres_310 __Port[0] = FlowNode_312;//To Port = 3;
	 Cres_310 __Port[1] =  F_OS_CRES_311;//To Port = 2;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,255,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
                            
