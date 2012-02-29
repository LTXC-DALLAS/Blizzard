Unison:U0.2:S4.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/Final_flow.evo                                 */
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
/*** SubFlow Final_SUB_FLOW                                               ***/
/****************************************************************************/
__SubFlow Final_SUB_FLOW {
	__Node  Final_ShrtAndDieID_S_313 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "452";
		__Exec =  Final_ShrtAndDieID_S;
	}
	__Node  Final_OpenShrt_S_314 {
		__XCoord = (180,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "453";
		__Exec =  Final_OpenShrt_S;
	}
	__Node  Final_PreStress_S_315 {
		__XCoord = (310,250);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "454";
		__Exec =  Final_PreStress_S;
	}
	__Node  Final_PreStressPostRepr_S_316 {
		__XCoord = (440,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "455";
		__Exec =  Final_PreStressPostRepr_S;
	}
	__Node  Final_PostStressFunc_S_317 {
		__XCoord = (570,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "456";
		__Exec =  Final_PostStressFunc_S;
	}
	__Node  Final_PostStressSrch_S_318 {
		__XCoord = (700,250);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "457";
		__Exec =  Final_PostStressSrch_S;
	}
	__Node  Final_PostStressIddq_S_319 {
		__XCoord = (830,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "458";
		__Exec =  Final_PostStressIddq_S;
	}
	__Node  Final_AtSpeed_S_320 {
		__XCoord = (960,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "459";
		__Exec =  Final_AtSpeed_S;
	}
	__Node  Final_Parametrics_S_321 {
		__XCoord = (1090,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "460";
		__Exec =  Final_Parametrics_S;
	}
	__Node  Final_SupplyShort_S_322 {
		__XCoord = (1220,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "461";
		__Exec =  Final_SupplyShort_S;
	}
	__Node  Final_CRES_S_323 {
		__XCoord = (1350,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "462";
		__Exec =  Final_CRES_S;
	}
	__Node FlowNode_324 {
		__XCoord = (1480,150);
		__Port[0] {
			__PortPosition = 160;
		}
		__InputPosition = 220;
		__TestID = "463";
		__PortSelect =  "if(GlobalNotBinned.Meas, 0, 1)";
	}
	__Node  GOOD_UNIT_325 {
		__XCoord = (1480,280);
		__InputPosition = 0;
		__TestID = "464";
		__Exec =  GOOD_UNIT;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  Final_ShrtAndDieID_S_313;
	__PortConnections {
	 Final_ShrtAndDieID_S_313 __Port[0] =  Final_OpenShrt_S_314;//To Port = 1;
	 Final_OpenShrt_S_314 __Port[0] =  Final_PreStressPostRepr_S_316;//To Port = 3;
	 Final_PreStress_S_315 __Port[0] =  Final_PreStressPostRepr_S_316;//To Port = 3;
	 Final_PreStressPostRepr_S_316 __Port[0] =  Final_PostStressFunc_S_317;//To Port = 4;
	 Final_PostStressFunc_S_317 __Port[0] =  Final_PostStressIddq_S_319;//To Port = 6;
	 Final_PostStressSrch_S_318 __Port[0] =  Final_PostStressIddq_S_319;//To Port = 6;
	 Final_PostStressIddq_S_319 __Port[0] =  Final_AtSpeed_S_320;//To Port = 7;
	 Final_AtSpeed_S_320 __Port[0] =  Final_Parametrics_S_321;//To Port = 8;
	 Final_Parametrics_S_321 __Port[0] =  Final_SupplyShort_S_322;//To Port = 9;
	 Final_SupplyShort_S_322 __Port[0] =  Final_CRES_S_323;//To Port = 10;
	 Final_CRES_S_323 __Port[0] = FlowNode_324;//To Port = 11;
	FlowNode_324 __Port[0] =  GOOD_UNIT_325;//To Port = 12;
	}
}
/*** END SubFlow Final_SUB_FLOW ***/

/****************************************************************************/
/*** SubFlow Final_ShrtAndDieID_S                                         ***/
/****************************************************************************/
__SubFlow Final_ShrtAndDieID_S {
	__Node  SupplyShorts1_326 {
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
		__TestID = "465";
		// __Calibration = Bllizar_Calibration;
		__Exec =  SupplyShorts1;
	}
	__Node  F_OS_SHRT_VDD_327 {
		__XCoord = (50,355);
		__InputPosition = 20;
		__TestID = "466";
		__Exec =  F_OS_SHRT_VDD;
	}
	__Node  FFDieIDRead_328 {
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
		__TestID = "467";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FFDieIDRead;
	}
	__Node  F_FUSE_DIEID_PRE_READ_329 {
		__XCoord = (200,325);
		__InputPosition = 20;
		__TestID = "468";
		__Exec =  F_FUSE_DIEID_PRE_READ;
	}
	__Node FlowNode_330 {
		__XCoord = (350,150);
		__InputPosition = 270;
		__TestID = "469";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  SupplyShorts1_326;
	__PortConnections {
	 SupplyShorts1_326 __Port[0] =  FFDieIDRead_328;//To Port = 2;
	 SupplyShorts1_326 __Port[1] =  F_OS_SHRT_VDD_327;//To Port = 1;
	 FFDieIDRead_328 __Port[0] = FlowNode_330;//To Port = 4;
	 FFDieIDRead_328 __Port[1] =  F_FUSE_DIEID_PRE_READ_329;//To Port = 3;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_ShrtAndDieID_S ***/

/****************************************************************************/
/*** SubFlow Final_OpenShrt_S                                             ***/
/****************************************************************************/
__SubFlow Final_OpenShrt_S {
	__Node  PinOpensTest_331 {
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
		__TestID = "470";
		// __Calibration = Bllizar_Calibration;
		__Exec =  PinOpensTest;
	}
	__Node  F_OS_OPEN_332 {
		__XCoord = (100,364);
		__InputPosition = 20;
		__TestID = "471";
		__Exec =  F_OS_OPEN;
	}
	__Node  F_OS_SHRT_PIN_333 {
		__XCoord = (21,364);
		__InputPosition = 20;
		__TestID = "472";
		__Exec =  F_OS_SHRT_PIN;
	}
	__Node  F_OS_SHRT_PTPS_334 {
		__XCoord = (-20,295);
		__InputPosition = 20;
		__TestID = "473";
		__Exec =  F_OS_SHRT_PTPS;
	}
	__Node  AnalogConty_335 {
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
		__TestID = "474";
		// __Calibration = Bllizar_Calibration;
		__Exec =  AnalogConty;
	}
	__Node  F_OS_OPEN_ANALOG_336 {
		__XCoord = (388,328);
		__InputPosition = 20;
		__TestID = "475";
		__Exec =  F_OS_OPEN_ANALOG;
	}
	__Node  F_OS_SHRT_ANALOG_337 {
		__XCoord = (325,355);
		__InputPosition = 20;
		__TestID = "476";
		__Exec =  F_OS_SHRT_ANALOG;
	}
	__Node  F_OS_OPEN_ANALOG_1_338 {
		__XCoord = (262,328);
		__InputPosition = 20;
		__TestID = "477";
		__Exec =  F_OS_OPEN_ANALOG_1;
	}
	__Node  F_OS_SHRT_ANALOG_2_339 {
		__XCoord = (235,265);
		__InputPosition = 20;
		__TestID = "478";
		__Exec =  F_OS_SHRT_ANALOG_2;
	}
	__Node  SupplyOpensTest_340 {
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
		__TestID = "479";
		// __Calibration = Bllizar_Calibration;
		__Exec =  SupplyOpensTest;
	}
	__Node  F_OS_OPEN_VDD_341 {
		__XCoord = (625,355);
		__InputPosition = 20;
		__TestID = "480";
		__Exec =  F_OS_OPEN_VDD;
	}
	__Node FlowNode_342 {
		__XCoord = (775,150);
		__InputPosition = 270;
		__TestID = "481";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  PinOpensTest_331;
	__PortConnections {
	 PinOpensTest_331 __Port[0] =  AnalogConty_335;//To Port = 4;
	 PinOpensTest_331 __Port[1] =  F_OS_OPEN_332;//To Port = 1;
	 PinOpensTest_331 __Port[2] =  F_OS_SHRT_PIN_333;//To Port = 2;
	 PinOpensTest_331 __Port[3] =  F_OS_SHRT_PTPS_334;//To Port = 3;
	 AnalogConty_335 __Port[0] =  SupplyOpensTest_340;//To Port = 9;
	 AnalogConty_335 __Port[1] =  F_OS_OPEN_ANALOG_336;//To Port = 5;
	 AnalogConty_335 __Port[2] =  F_OS_SHRT_ANALOG_337;//To Port = 6;
	 AnalogConty_335 __Port[3] =  F_OS_OPEN_ANALOG_1_338;//To Port = 7;
	 AnalogConty_335 __Port[4] =  F_OS_SHRT_ANALOG_2_339;//To Port = 8;
	 SupplyOpensTest_340 __Port[0] = FlowNode_342;//To Port = 11;
	 SupplyOpensTest_340 __Port[1] =  F_OS_OPEN_VDD_341;//To Port = 10;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,775,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_OpenShrt_S ***/

/****************************************************************************/
/*** SubFlow Final_Func_Vmin_Pre1_S                                       ***/
/****************************************************************************/
__SubFlow Final_Func_Vmin_Pre1_S {
	__Node  FuncVminPre1_343 {
		__XCoord = (50,250);
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
		__TestID = "482";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1;
	}
	__Node  PreBinFlow_S_344 {
		__XCoord = (50,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "483";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_345 {
		__XCoord = (50,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "484";
		__Exec =  F_FUNC_Vmin;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_1_346 {
		__XCoord = (200,250);
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
		__TestID = "485";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_1;
	}
	__Node  PreBinFlow_S_347 {
		__XCoord = (200,425);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "486";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_pre_348 {
		__XCoord = (200,555);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "487";
		__Exec =  F_FUNC_Vmin_GROS_100_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_2_349 {
		__XCoord = (350,250);
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
		__TestID = "488";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_2;
	}
	__Node  PreBinFlow_S_350 {
		__XCoord = (350,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "489";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_1_pre_351 {
		__XCoord = (350,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "490";
		__Exec =  F_FUNC_Vmin_GROS_100_1_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_3_352 {
		__XCoord = (500,250);
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
		__TestID = "491";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_3;
	}
	__Node  PreBinFlow_S_353 {
		__XCoord = (500,425);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "492";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_2_pre_354 {
		__XCoord = (500,555);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "493";
		__Exec =  F_FUNC_Vmin_GROS_100_2_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_4_355 {
		__XCoord = (650,250);
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
		__TestID = "494";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_4;
	}
	__Node  PreBinFlow_S_356 {
		__XCoord = (650,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "495";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_3_pre_357 {
		__XCoord = (650,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "496";
		__Exec =  F_FUNC_Vmin_GROS_100_3_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_5_358 {
		__XCoord = (800,250);
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
		__TestID = "497";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_5;
	}
	__Node  PreBinFlow_S_359 {
		__XCoord = (800,425);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "498";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_4_pre_360 {
		__XCoord = (800,555);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "499";
		__Exec =  F_FUNC_Vmin_GROS_100_4_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_6_361 {
		__XCoord = (950,250);
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
		__TestID = "500";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_6;
	}
	__Node  PreBinFlow_S_362 {
		__XCoord = (950,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "501";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_166p66_pre_363 {
		__XCoord = (950,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "502";
		__Exec =  F_FUNC_Vmin_GROS_166p66_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_7_364 {
		__XCoord = (1100,250);
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
		__TestID = "503";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_7;
	}
	__Node  PreBinFlow_S_365 {
		__XCoord = (1100,425);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "504";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_ANALOG_USB_OTG_100_366 {
		__XCoord = (1100,555);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "505";
		__Exec =  F_FUNC_Vmin_ANALOG_USB_OTG_100;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_8_367 {
		__XCoord = (1250,250);
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
		__TestID = "506";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_8;
	}
	__Node  PreBinFlow_S_368 {
		__XCoord = (1250,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "507";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_1_369 {
		__XCoord = (1250,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "508";
		__Exec =  F_FUNC_Vmin_1;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre1_9_370 {
		__XCoord = (1400,250);
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
		__TestID = "509";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre1_9;
	}
	__Node  PreBinFlow_S_371 {
		__XCoord = (1400,425);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "510";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_ANALOG_USB_CHG_100_372 {
		__XCoord = (1400,555);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "511";
		__Exec =  F_FUNC_Vmin_ANALOG_USB_CHG_100;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_373 {
		__XCoord = (1550,250);
		__InputPosition = 270;
		__TestID = "512";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  FuncVminPre1_343;
	__PortConnections {
	 FuncVminPre1_343 __Port[0] =  FuncVminPre1_1_346;//To Port = 3;
	 FuncVminPre1_343 __Port[1] =  PreBinFlow_S_344;//To Port = 1;
	 PreBinFlow_S_344 __Port[0] =  F_FUNC_Vmin_345;//To Port = 2;
	 F_FUNC_Vmin_345 __Port[0] =  FuncVminPre1_1_346;//To Port = 3;
	 FuncVminPre1_1_346 __Port[0] =  FuncVminPre1_2_349;//To Port = 6;
	 FuncVminPre1_1_346 __Port[1] =  PreBinFlow_S_347;//To Port = 4;
	 PreBinFlow_S_347 __Port[0] =  F_FUNC_Vmin_GROS_100_pre_348;//To Port = 5;
	 F_FUNC_Vmin_GROS_100_pre_348 __Port[0] =  FuncVminPre1_2_349;//To Port = 6;
	 FuncVminPre1_2_349 __Port[0] =  FuncVminPre1_3_352;//To Port = 9;
	 FuncVminPre1_2_349 __Port[1] =  PreBinFlow_S_350;//To Port = 7;
	 PreBinFlow_S_350 __Port[0] =  F_FUNC_Vmin_GROS_100_1_pre_351;//To Port = 8;
	 F_FUNC_Vmin_GROS_100_1_pre_351 __Port[0] =  FuncVminPre1_3_352;//To Port = 9;
	 FuncVminPre1_3_352 __Port[0] =  FuncVminPre1_4_355;//To Port = 12;
	 FuncVminPre1_3_352 __Port[1] =  PreBinFlow_S_353;//To Port = 10;
	 PreBinFlow_S_353 __Port[0] =  F_FUNC_Vmin_GROS_100_2_pre_354;//To Port = 11;
	 F_FUNC_Vmin_GROS_100_2_pre_354 __Port[0] =  FuncVminPre1_4_355;//To Port = 12;
	 FuncVminPre1_4_355 __Port[0] =  FuncVminPre1_5_358;//To Port = 15;
	 FuncVminPre1_4_355 __Port[1] =  PreBinFlow_S_356;//To Port = 13;
	 PreBinFlow_S_356 __Port[0] =  F_FUNC_Vmin_GROS_100_3_pre_357;//To Port = 14;
	 F_FUNC_Vmin_GROS_100_3_pre_357 __Port[0] =  FuncVminPre1_5_358;//To Port = 15;
	 FuncVminPre1_5_358 __Port[0] =  FuncVminPre1_6_361;//To Port = 18;
	 FuncVminPre1_5_358 __Port[1] =  PreBinFlow_S_359;//To Port = 16;
	 PreBinFlow_S_359 __Port[0] =  F_FUNC_Vmin_GROS_100_4_pre_360;//To Port = 17;
	 F_FUNC_Vmin_GROS_100_4_pre_360 __Port[0] =  FuncVminPre1_6_361;//To Port = 18;
	 FuncVminPre1_6_361 __Port[0] =  FuncVminPre1_7_364;//To Port = 21;
	 FuncVminPre1_6_361 __Port[1] =  PreBinFlow_S_362;//To Port = 19;
	 PreBinFlow_S_362 __Port[0] =  F_FUNC_Vmin_GROS_166p66_pre_363;//To Port = 20;
	 F_FUNC_Vmin_GROS_166p66_pre_363 __Port[0] =  FuncVminPre1_7_364;//To Port = 21;
	 FuncVminPre1_7_364 __Port[0] =  FuncVminPre1_8_367;//To Port = 24;
	 FuncVminPre1_7_364 __Port[1] =  PreBinFlow_S_365;//To Port = 22;
	 PreBinFlow_S_365 __Port[0] =  F_FUNC_Vmin_ANALOG_USB_OTG_100_366;//To Port = 23;
	 F_FUNC_Vmin_ANALOG_USB_OTG_100_366 __Port[0] =  FuncVminPre1_8_367;//To Port = 24;
	 FuncVminPre1_8_367 __Port[0] =  FuncVminPre1_9_370;//To Port = 27;
	 FuncVminPre1_8_367 __Port[1] =  PreBinFlow_S_368;//To Port = 25;
	 PreBinFlow_S_368 __Port[0] =  F_FUNC_Vmin_1_369;//To Port = 26;
	 F_FUNC_Vmin_1_369 __Port[0] =  FuncVminPre1_9_370;//To Port = 27;
	 FuncVminPre1_9_370 __Port[0] = FlowNode_373;//To Port = 30;
	 FuncVminPre1_9_370 __Port[1] =  PreBinFlow_S_371;//To Port = 28;
	 PreBinFlow_S_371 __Port[0] =  F_FUNC_Vmin_ANALOG_USB_CHG_100_372;//To Port = 29;
	 F_FUNC_Vmin_ANALOG_USB_CHG_100_372 __Port[0] = FlowNode_373;//To Port = 30;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,1550,235,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_Func_Vmin_Pre1_S ***/

/****************************************************************************/
/*** SubFlow Final_PreStress_S                                            ***/
/****************************************************************************/
__SubFlow Final_PreStress_S {
	__Node  Final_Func_Vmin_Pre1_S_374 {
		__XCoord = (50,250);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "513";
		__Exec =  Final_Func_Vmin_Pre1_S;
	}
	__Node FlowNode_375 {
		__XCoord = (200,50);
		__InputPosition = 270;
		__TestID = "514";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode = FlowNode_375;
	__PortConnections {
	 Final_Func_Vmin_Pre1_S_374 __Port[0] = FlowNode_375;//To Port = 1;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_PreStress_S ***/

/****************************************************************************/
/*** SubFlow Final_Func_Vmin_Pre2_S                                       ***/
/****************************************************************************/
__SubFlow Final_Func_Vmin_Pre2_S {
	__Node  FuncVminPre2_376 {
		__XCoord = (50,250);
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
		__TestID = "515";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre2;
	}
	__Node  PreBinFlow_S_377 {
		__XCoord = (50,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "516";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_BIST_PROD_33_pre_378 {
		__XCoord = (50,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "517";
		__Exec =  F_FUNC_Vmin_BIST_PROD_33_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPre2_1_379 {
		__XCoord = (200,250);
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
		__TestID = "518";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPre2_1;
	}
	__Node  PreBinFlow_S_380 {
		__XCoord = (200,425);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "519";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_BIST_PROD_33_1_pre_381 {
		__XCoord = (200,555);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "520";
		__Exec =  F_FUNC_Vmin_BIST_PROD_33_1_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_382 {
		__XCoord = (350,250);
		__InputPosition = 270;
		__TestID = "521";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  FuncVminPre2_376;
	__PortConnections {
	 FuncVminPre2_376 __Port[0] =  FuncVminPre2_1_379;//To Port = 3;
	 FuncVminPre2_376 __Port[1] =  PreBinFlow_S_377;//To Port = 1;
	 PreBinFlow_S_377 __Port[0] =  F_FUNC_Vmin_BIST_PROD_33_pre_378;//To Port = 2;
	 F_FUNC_Vmin_BIST_PROD_33_pre_378 __Port[0] =  FuncVminPre2_1_379;//To Port = 3;
	 FuncVminPre2_1_379 __Port[0] = FlowNode_382;//To Port = 6;
	 FuncVminPre2_1_379 __Port[1] =  PreBinFlow_S_380;//To Port = 4;
	 PreBinFlow_S_380 __Port[0] =  F_FUNC_Vmin_BIST_PROD_33_1_pre_381;//To Port = 5;
	 F_FUNC_Vmin_BIST_PROD_33_1_pre_381 __Port[0] = FlowNode_382;//To Port = 6;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,235,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_Func_Vmin_Pre2_S ***/

/****************************************************************************/
/*** SubFlow Final_Func_Vburnin_S                                         ***/
/****************************************************************************/
__SubFlow Final_Func_Vburnin_S {
	__Node  FuncVburnin_383 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 65;
		}
		__Port[1] {
			__PortPosition = 90;
		}
		__InputPosition = 295;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_13"; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vburnin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "522";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVburnin;
	}
	__Node  PreBinFlow_S_384 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "523";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vburnin_BURNIN_200_pre_385 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "524";
		__Exec =  F_FUNC_Vburnin_BURNIN_200_pre;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_386 {
		__XCoord = (200,150);
		__InputPosition = 270;
		__TestID = "525";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  FuncVburnin_383;
	__PortConnections {
	 FuncVburnin_383 __Port[0] = FlowNode_386;//To Port = 3;
	 FuncVburnin_383 __Port[1] =  PreBinFlow_S_384;//To Port = 1;
	 PreBinFlow_S_384 __Port[0] =  F_FUNC_Vburnin_BURNIN_200_pre_385;//To Port = 2;
	 F_FUNC_Vburnin_BURNIN_200_pre_385 __Port[0] = FlowNode_386;//To Port = 3;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_Func_Vburnin_S ***/

/****************************************************************************/
/*** SubFlow Final_PreStressPostRepr_S                                    ***/
/****************************************************************************/
__SubFlow Final_PreStressPostRepr_S {
	__Node  Final_Func_Vmin_Pre2_S_387 {
		__XCoord = (50,250);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "526";
		__Exec =  Final_Func_Vmin_Pre2_S;
	}
	__Node  Final_Func_Vburnin_S_388 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "527";
		__Exec =  Final_Func_Vburnin_S;
	}
	__Node FlowNode_389 {
		__XCoord = (350,50);
		__InputPosition = 270;
		__TestID = "528";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  Final_Func_Vburnin_S_388;
	__PortConnections {
	 Final_Func_Vmin_Pre2_S_387 __Port[0] =  Final_Func_Vburnin_S_388;//To Port = 1;
	 Final_Func_Vburnin_S_388 __Port[0] = FlowNode_389;//To Port = 2;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_PreStressPostRepr_S ***/

/****************************************************************************/
/*** SubFlow Final_Func_Vmax_Post_S                                       ***/
/****************************************************************************/
__SubFlow Final_Func_Vmax_Post_S {
	__Node  FuncVmaxPost_390 {
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
		__TestID = "529";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost;
	}
	__Node  PreBinFlow_S_391 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "530";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_392 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "531";
		__Exec =  F_FUNC_Vmax;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_1_393 {
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
		__TestID = "532";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_1;
	}
	__Node  PreBinFlow_S_394 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "533";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_GROS_100_post_395 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "534";
		__Exec =  F_FUNC_Vmax_GROS_100_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_2_396 {
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
		__TestID = "535";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_2;
	}
	__Node  PreBinFlow_S_397 {
		__XCoord = (350,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "536";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_GROS_100_1_post_398 {
		__XCoord = (350,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "537";
		__Exec =  F_FUNC_Vmax_GROS_100_1_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_3_399 {
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
		__TestID = "538";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_3;
	}
	__Node  PreBinFlow_S_400 {
		__XCoord = (500,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "539";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_GROS_100_2_post_401 {
		__XCoord = (500,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "540";
		__Exec =  F_FUNC_Vmax_GROS_100_2_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_4_402 {
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
		__TestID = "541";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_4;
	}
	__Node  PreBinFlow_S_403 {
		__XCoord = (650,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "542";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_GROS_100_3_post_404 {
		__XCoord = (650,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "543";
		__Exec =  F_FUNC_Vmax_GROS_100_3_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_5_405 {
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
		__TestID = "544";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_5;
	}
	__Node  PreBinFlow_S_406 {
		__XCoord = (800,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "545";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_GROS_100_4_post_407 {
		__XCoord = (800,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "546";
		__Exec =  F_FUNC_Vmax_GROS_100_4_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_6_408 {
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
		__TestID = "547";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_6;
	}
	__Node  PreBinFlow_S_409 {
		__XCoord = (950,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "548";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_GROS_166p66_post_410 {
		__XCoord = (950,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "549";
		__Exec =  F_FUNC_Vmax_GROS_166p66_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_7_411 {
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
		__TestID = "550";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_7;
	}
	__Node  PreBinFlow_S_412 {
		__XCoord = (1100,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "551";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_ANALOG_USB_OTG_100_413 {
		__XCoord = (1100,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "552";
		__Exec =  F_FUNC_Vmax_ANALOG_USB_OTG_100;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_8_414 {
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
		__TestID = "553";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_8;
	}
	__Node  PreBinFlow_S_415 {
		__XCoord = (1250,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "554";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_BIST_PROD_33_post_416 {
		__XCoord = (1250,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "555";
		__Exec =  F_FUNC_Vmax_BIST_PROD_33_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_9_417 {
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
		__TestID = "556";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_9;
	}
	__Node  PreBinFlow_S_418 {
		__XCoord = (1400,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "557";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_BIST_PROD_33_1_419 {
		__XCoord = (1400,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "558";
		__Exec =  F_FUNC_Vmax_BIST_PROD_33_1;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_10_420 {
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
		__TestID = "559";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_10;
	}
	__Node  PreBinFlow_S_421 {
		__XCoord = (1550,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "560";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_1_422 {
		__XCoord = (1550,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "561";
		__Exec =  F_FUNC_Vmax_1;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVmaxPost_11_423 {
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
		__TestID = "562";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVmaxPost_11;
	}
	__Node  PreBinFlow_S_424 {
		__XCoord = (1700,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "563";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmax_ANALOG_USB_CHG_100_425 {
		__XCoord = (1700,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "564";
		__Exec =  F_FUNC_Vmax_ANALOG_USB_CHG_100;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_426 {
		__XCoord = (1850,150);
		__InputPosition = 270;
		__TestID = "565";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  FuncVmaxPost_390;
	__PortConnections {
	 FuncVmaxPost_390 __Port[0] =  FuncVmaxPost_1_393;//To Port = 3;
	 FuncVmaxPost_390 __Port[1] =  PreBinFlow_S_391;//To Port = 1;
	 PreBinFlow_S_391 __Port[0] =  F_FUNC_Vmax_392;//To Port = 2;
	 F_FUNC_Vmax_392 __Port[0] =  FuncVmaxPost_1_393;//To Port = 3;
	 FuncVmaxPost_1_393 __Port[0] =  FuncVmaxPost_2_396;//To Port = 6;
	 FuncVmaxPost_1_393 __Port[1] =  PreBinFlow_S_394;//To Port = 4;
	 PreBinFlow_S_394 __Port[0] =  F_FUNC_Vmax_GROS_100_post_395;//To Port = 5;
	 F_FUNC_Vmax_GROS_100_post_395 __Port[0] =  FuncVmaxPost_2_396;//To Port = 6;
	 FuncVmaxPost_2_396 __Port[0] =  FuncVmaxPost_3_399;//To Port = 9;
	 FuncVmaxPost_2_396 __Port[1] =  PreBinFlow_S_397;//To Port = 7;
	 PreBinFlow_S_397 __Port[0] =  F_FUNC_Vmax_GROS_100_1_post_398;//To Port = 8;
	 F_FUNC_Vmax_GROS_100_1_post_398 __Port[0] =  FuncVmaxPost_3_399;//To Port = 9;
	 FuncVmaxPost_3_399 __Port[0] =  FuncVmaxPost_4_402;//To Port = 12;
	 FuncVmaxPost_3_399 __Port[1] =  PreBinFlow_S_400;//To Port = 10;
	 PreBinFlow_S_400 __Port[0] =  F_FUNC_Vmax_GROS_100_2_post_401;//To Port = 11;
	 F_FUNC_Vmax_GROS_100_2_post_401 __Port[0] =  FuncVmaxPost_4_402;//To Port = 12;
	 FuncVmaxPost_4_402 __Port[0] =  FuncVmaxPost_5_405;//To Port = 15;
	 FuncVmaxPost_4_402 __Port[1] =  PreBinFlow_S_403;//To Port = 13;
	 PreBinFlow_S_403 __Port[0] =  F_FUNC_Vmax_GROS_100_3_post_404;//To Port = 14;
	 F_FUNC_Vmax_GROS_100_3_post_404 __Port[0] =  FuncVmaxPost_5_405;//To Port = 15;
	 FuncVmaxPost_5_405 __Port[0] =  FuncVmaxPost_6_408;//To Port = 18;
	 FuncVmaxPost_5_405 __Port[1] =  PreBinFlow_S_406;//To Port = 16;
	 PreBinFlow_S_406 __Port[0] =  F_FUNC_Vmax_GROS_100_4_post_407;//To Port = 17;
	 F_FUNC_Vmax_GROS_100_4_post_407 __Port[0] =  FuncVmaxPost_6_408;//To Port = 18;
	 FuncVmaxPost_6_408 __Port[0] =  FuncVmaxPost_7_411;//To Port = 21;
	 FuncVmaxPost_6_408 __Port[1] =  PreBinFlow_S_409;//To Port = 19;
	 PreBinFlow_S_409 __Port[0] =  F_FUNC_Vmax_GROS_166p66_post_410;//To Port = 20;
	 F_FUNC_Vmax_GROS_166p66_post_410 __Port[0] =  FuncVmaxPost_7_411;//To Port = 21;
	 FuncVmaxPost_7_411 __Port[0] =  FuncVmaxPost_8_414;//To Port = 24;
	 FuncVmaxPost_7_411 __Port[1] =  PreBinFlow_S_412;//To Port = 22;
	 PreBinFlow_S_412 __Port[0] =  F_FUNC_Vmax_ANALOG_USB_OTG_100_413;//To Port = 23;
	 F_FUNC_Vmax_ANALOG_USB_OTG_100_413 __Port[0] =  FuncVmaxPost_8_414;//To Port = 24;
	 FuncVmaxPost_8_414 __Port[0] =  FuncVmaxPost_9_417;//To Port = 27;
	 FuncVmaxPost_8_414 __Port[1] =  PreBinFlow_S_415;//To Port = 25;
	 PreBinFlow_S_415 __Port[0] =  F_FUNC_Vmax_BIST_PROD_33_post_416;//To Port = 26;
	 F_FUNC_Vmax_BIST_PROD_33_post_416 __Port[0] =  FuncVmaxPost_9_417;//To Port = 27;
	 FuncVmaxPost_9_417 __Port[0] =  FuncVmaxPost_10_420;//To Port = 30;
	 FuncVmaxPost_9_417 __Port[1] =  PreBinFlow_S_418;//To Port = 28;
	 PreBinFlow_S_418 __Port[0] =  F_FUNC_Vmax_BIST_PROD_33_1_419;//To Port = 29;
	 F_FUNC_Vmax_BIST_PROD_33_1_419 __Port[0] =  FuncVmaxPost_10_420;//To Port = 30;
	 FuncVmaxPost_10_420 __Port[0] =  FuncVmaxPost_11_423;//To Port = 33;
	 FuncVmaxPost_10_420 __Port[1] =  PreBinFlow_S_421;//To Port = 31;
	 PreBinFlow_S_421 __Port[0] =  F_FUNC_Vmax_1_422;//To Port = 32;
	 F_FUNC_Vmax_1_422 __Port[0] =  FuncVmaxPost_11_423;//To Port = 33;
	 FuncVmaxPost_11_423 __Port[0] = FlowNode_426;//To Port = 36;
	 FuncVmaxPost_11_423 __Port[1] =  PreBinFlow_S_424;//To Port = 34;
	 PreBinFlow_S_424 __Port[0] =  F_FUNC_Vmax_ANALOG_USB_CHG_100_425;//To Port = 35;
	 F_FUNC_Vmax_ANALOG_USB_CHG_100_425 __Port[0] = FlowNode_426;//To Port = 36;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,1850,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_Func_Vmax_Post_S ***/

/****************************************************************************/
/*** SubFlow Final_Func_Vmin_Post_S                                       ***/
/****************************************************************************/
__SubFlow Final_Func_Vmin_Post_S {
	__Node  FuncVminPost_427 {
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
		__TestID = "566";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost;
	}
	__Node  PreBinFlow_S_428 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "567";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_2_429 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "568";
		__Exec =  F_FUNC_Vmin_2;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_1_430 {
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
		__TestID = "569";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_1;
	}
	__Node  PreBinFlow_S_431 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "570";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_post_432 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "571";
		__Exec =  F_FUNC_Vmin_GROS_100_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_2_433 {
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
		__TestID = "572";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_2;
	}
	__Node  PreBinFlow_S_434 {
		__XCoord = (350,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "573";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_1_post_435 {
		__XCoord = (350,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "574";
		__Exec =  F_FUNC_Vmin_GROS_100_1_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_3_436 {
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
		__TestID = "575";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_3;
	}
	__Node  PreBinFlow_S_437 {
		__XCoord = (500,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "576";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_2_post_438 {
		__XCoord = (500,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "577";
		__Exec =  F_FUNC_Vmin_GROS_100_2_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_4_439 {
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
		__TestID = "578";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_4;
	}
	__Node  PreBinFlow_S_440 {
		__XCoord = (650,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "579";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_3_post_441 {
		__XCoord = (650,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "580";
		__Exec =  F_FUNC_Vmin_GROS_100_3_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_5_442 {
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
		__TestID = "581";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_5;
	}
	__Node  PreBinFlow_S_443 {
		__XCoord = (800,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "582";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_4_post_444 {
		__XCoord = (800,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "583";
		__Exec =  F_FUNC_Vmin_GROS_100_4_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_6_445 {
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
		__TestID = "584";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_6;
	}
	__Node  PreBinFlow_S_446 {
		__XCoord = (950,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "585";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_166p66_post_447 {
		__XCoord = (950,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "586";
		__Exec =  F_FUNC_Vmin_GROS_166p66_post;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_7_448 {
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
		__TestID = "587";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_7;
	}
	__Node  PreBinFlow_S_449 {
		__XCoord = (1100,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "588";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_4_450 {
		__XCoord = (1100,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "589";
		__Exec =  F_FUNC_Vmin_4;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_8_451 {
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
		__TestID = "590";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_8;
	}
	__Node  PreBinFlow_S_452 {
		__XCoord = (1250,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "591";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_5_453 {
		__XCoord = (1250,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "592";
		__Exec =  F_FUNC_Vmin_5;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  FuncVminPost_9_454 {
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
		__TestID = "593";
		// __Calibration = Bllizar_Calibration;
		__Exec =  FuncVminPost_9;
	}
	__Node  PreBinFlow_S_455 {
		__XCoord = (1400,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "594";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_7_456 {
		__XCoord = (1400,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "595";
		__Exec =  F_FUNC_Vmin_7;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_457 {
		__XCoord = (1550,150);
		__InputPosition = 270;
		__TestID = "596";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  FuncVminPost_427;
	__PortConnections {
	 FuncVminPost_427 __Port[0] =  FuncVminPost_1_430;//To Port = 3;
	 FuncVminPost_427 __Port[1] =  PreBinFlow_S_428;//To Port = 1;
	 PreBinFlow_S_428 __Port[0] =  F_FUNC_Vmin_2_429;//To Port = 2;
	 F_FUNC_Vmin_2_429 __Port[0] =  FuncVminPost_1_430;//To Port = 3;
	 FuncVminPost_1_430 __Port[0] =  FuncVminPost_2_433;//To Port = 6;
	 FuncVminPost_1_430 __Port[1] =  PreBinFlow_S_431;//To Port = 4;
	 PreBinFlow_S_431 __Port[0] =  F_FUNC_Vmin_GROS_100_post_432;//To Port = 5;
	 F_FUNC_Vmin_GROS_100_post_432 __Port[0] =  FuncVminPost_2_433;//To Port = 6;
	 FuncVminPost_2_433 __Port[0] =  FuncVminPost_3_436;//To Port = 9;
	 FuncVminPost_2_433 __Port[1] =  PreBinFlow_S_434;//To Port = 7;
	 PreBinFlow_S_434 __Port[0] =  F_FUNC_Vmin_GROS_100_1_post_435;//To Port = 8;
	 F_FUNC_Vmin_GROS_100_1_post_435 __Port[0] =  FuncVminPost_3_436;//To Port = 9;
	 FuncVminPost_3_436 __Port[0] =  FuncVminPost_4_439;//To Port = 12;
	 FuncVminPost_3_436 __Port[1] =  PreBinFlow_S_437;//To Port = 10;
	 PreBinFlow_S_437 __Port[0] =  F_FUNC_Vmin_GROS_100_2_post_438;//To Port = 11;
	 F_FUNC_Vmin_GROS_100_2_post_438 __Port[0] =  FuncVminPost_4_439;//To Port = 12;
	 FuncVminPost_4_439 __Port[0] =  FuncVminPost_5_442;//To Port = 15;
	 FuncVminPost_4_439 __Port[1] =  PreBinFlow_S_440;//To Port = 13;
	 PreBinFlow_S_440 __Port[0] =  F_FUNC_Vmin_GROS_100_3_post_441;//To Port = 14;
	 F_FUNC_Vmin_GROS_100_3_post_441 __Port[0] =  FuncVminPost_5_442;//To Port = 15;
	 FuncVminPost_5_442 __Port[0] =  FuncVminPost_6_445;//To Port = 18;
	 FuncVminPost_5_442 __Port[1] =  PreBinFlow_S_443;//To Port = 16;
	 PreBinFlow_S_443 __Port[0] =  F_FUNC_Vmin_GROS_100_4_post_444;//To Port = 17;
	 F_FUNC_Vmin_GROS_100_4_post_444 __Port[0] =  FuncVminPost_6_445;//To Port = 18;
	 FuncVminPost_6_445 __Port[0] =  FuncVminPost_7_448;//To Port = 21;
	 FuncVminPost_6_445 __Port[1] =  PreBinFlow_S_446;//To Port = 19;
	 PreBinFlow_S_446 __Port[0] =  F_FUNC_Vmin_GROS_166p66_post_447;//To Port = 20;
	 F_FUNC_Vmin_GROS_166p66_post_447 __Port[0] =  FuncVminPost_7_448;//To Port = 21;
	 FuncVminPost_7_448 __Port[0] =  FuncVminPost_8_451;//To Port = 24;
	 FuncVminPost_7_448 __Port[1] =  PreBinFlow_S_449;//To Port = 22;
	 PreBinFlow_S_449 __Port[0] =  F_FUNC_Vmin_4_450;//To Port = 23;
	 F_FUNC_Vmin_4_450 __Port[0] =  FuncVminPost_8_451;//To Port = 24;
	 FuncVminPost_8_451 __Port[0] =  FuncVminPost_9_454;//To Port = 27;
	 FuncVminPost_8_451 __Port[1] =  PreBinFlow_S_452;//To Port = 25;
	 PreBinFlow_S_452 __Port[0] =  F_FUNC_Vmin_5_453;//To Port = 26;
	 F_FUNC_Vmin_5_453 __Port[0] =  FuncVminPost_9_454;//To Port = 27;
	 FuncVminPost_9_454 __Port[0] = FlowNode_457;//To Port = 30;
	 FuncVminPost_9_454 __Port[1] =  PreBinFlow_S_455;//To Port = 28;
	 PreBinFlow_S_455 __Port[0] =  F_FUNC_Vmin_7_456;//To Port = 29;
	 F_FUNC_Vmin_7_456 __Port[0] = FlowNode_457;//To Port = 30;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,1550,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_Func_Vmin_Post_S ***/

/****************************************************************************/
/*** SubFlow Final_PostStressFunc_S                                       ***/
/****************************************************************************/
__SubFlow Final_PostStressFunc_S {
	__Node  Final_Func_Vmax_Post_S_458 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "597";
		__Exec =  Final_Func_Vmax_Post_S;
	}
	__Node  Final_Func_Vmin_Post_S_459 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "598";
		__Exec =  Final_Func_Vmin_Post_S;
	}
	__Node FlowNode_460 {
		__XCoord = (350,50);
		__InputPosition = 270;
		__TestID = "599";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  Final_Func_Vmax_Post_S_458;
	__PortConnections {
	 Final_Func_Vmax_Post_S_458 __Port[0] =  Final_Func_Vmin_Post_S_459;//To Port = 1;
	 Final_Func_Vmin_Post_S_459 __Port[0] = FlowNode_460;//To Port = 2;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_PostStressFunc_S ***/

/****************************************************************************/
/*** SubFlow Final_SrchVdd_Post_S                                         ***/
/****************************************************************************/
__SubFlow Final_SrchVdd_Post_S {
	__Node  VminSearchPost_461 {
		__XCoord = (50,250);
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
		__TestID = "600";
		// __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost;
	}
	__Node  PreBinFlow_S_462 {
		__XCoord = (50,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "601";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_3_463 {
		__XCoord = (50,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "602";
		__Exec =  F_FUNC_Vmin_3;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_1_464 {
		__XCoord = (200,250);
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
		__TestID = "603";
		// __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_1;
	}
	__Node  PreBinFlow_S_465 {
		__XCoord = (200,425);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "604";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_post_4_466 {
		__XCoord = (200,555);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "605";
		__Exec =  F_FUNC_Vmin_GROS_100_post_4;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_2_467 {
		__XCoord = (350,250);
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
		__TestID = "606";
		// __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_2;
	}
	__Node  PreBinFlow_S_468 {
		__XCoord = (350,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "607";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_1_post_5_469 {
		__XCoord = (350,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "608";
		__Exec =  F_FUNC_Vmin_GROS_100_1_post_5;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_3_470 {
		__XCoord = (500,250);
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
		__TestID = "609";
		// __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_3;
	}
	__Node  PreBinFlow_S_471 {
		__XCoord = (500,425);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "610";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_2_post_6_472 {
		__XCoord = (500,555);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "611";
		__Exec =  F_FUNC_Vmin_GROS_100_2_post_6;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_4_473 {
		__XCoord = (650,250);
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
		__TestID = "612";
		// __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_4;
	}
	__Node  PreBinFlow_S_474 {
		__XCoord = (650,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "613";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_3_post_7_475 {
		__XCoord = (650,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "614";
		__Exec =  F_FUNC_Vmin_GROS_100_3_post_7;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_5_476 {
		__XCoord = (800,250);
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
		__TestID = "615";
		// __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_5;
	}
	__Node  PreBinFlow_S_477 {
		__XCoord = (800,425);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "616";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_100_4_post_8_478 {
		__XCoord = (800,555);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "617";
		__Exec =  F_FUNC_Vmin_GROS_100_4_post_8;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_6_479 {
		__XCoord = (950,250);
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
		__TestID = "618";
		// __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_6;
	}
	__Node  PreBinFlow_S_480 {
		__XCoord = (950,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "619";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_GROS_166p66_post_9_481 {
		__XCoord = (950,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "620";
		__Exec =  F_FUNC_Vmin_GROS_166p66_post_9;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_7_482 {
		__XCoord = (1100,250);
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
		__TestID = "621";
		// __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_7;
	}
	__Node  PreBinFlow_S_483 {
		__XCoord = (1100,425);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "622";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_11_484 {
		__XCoord = (1100,555);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "623";
		__Exec =  F_FUNC_Vmin_11;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_8_485 {
		__XCoord = (1250,250);
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
		__TestID = "624";
		// __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_8;
	}
	__Node  PreBinFlow_S_486 {
		__XCoord = (1250,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "625";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_12_487 {
		__XCoord = (1250,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "626";
		__Exec =  F_FUNC_Vmin_12;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VminSearchPost_9_488 {
		__XCoord = (1400,250);
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
		__TestID = "627";
		// __Calibration = Bllizar_Calibration;
		__Exec =  VminSearchPost_9;
	}
	__Node  PreBinFlow_S_489 {
		__XCoord = (1400,425);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "628";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_Vmin_14_490 {
		__XCoord = (1400,555);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "629";
		__Exec =  F_FUNC_Vmin_14;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_491 {
		__XCoord = (1550,250);
		__InputPosition = 270;
		__TestID = "630";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  VminSearchPost_461;
	__PortConnections {
	 VminSearchPost_461 __Port[0] =  VminSearchPost_1_464;//To Port = 3;
	 VminSearchPost_461 __Port[1] =  PreBinFlow_S_462;//To Port = 1;
	 PreBinFlow_S_462 __Port[0] =  F_FUNC_Vmin_3_463;//To Port = 2;
	 F_FUNC_Vmin_3_463 __Port[0] =  VminSearchPost_1_464;//To Port = 3;
	 VminSearchPost_1_464 __Port[0] =  VminSearchPost_2_467;//To Port = 6;
	 VminSearchPost_1_464 __Port[1] =  PreBinFlow_S_465;//To Port = 4;
	 PreBinFlow_S_465 __Port[0] =  F_FUNC_Vmin_GROS_100_post_4_466;//To Port = 5;
	 F_FUNC_Vmin_GROS_100_post_4_466 __Port[0] =  VminSearchPost_2_467;//To Port = 6;
	 VminSearchPost_2_467 __Port[0] =  VminSearchPost_3_470;//To Port = 9;
	 VminSearchPost_2_467 __Port[1] =  PreBinFlow_S_468;//To Port = 7;
	 PreBinFlow_S_468 __Port[0] =  F_FUNC_Vmin_GROS_100_1_post_5_469;//To Port = 8;
	 F_FUNC_Vmin_GROS_100_1_post_5_469 __Port[0] =  VminSearchPost_3_470;//To Port = 9;
	 VminSearchPost_3_470 __Port[0] =  VminSearchPost_4_473;//To Port = 12;
	 VminSearchPost_3_470 __Port[1] =  PreBinFlow_S_471;//To Port = 10;
	 PreBinFlow_S_471 __Port[0] =  F_FUNC_Vmin_GROS_100_2_post_6_472;//To Port = 11;
	 F_FUNC_Vmin_GROS_100_2_post_6_472 __Port[0] =  VminSearchPost_4_473;//To Port = 12;
	 VminSearchPost_4_473 __Port[0] =  VminSearchPost_5_476;//To Port = 15;
	 VminSearchPost_4_473 __Port[1] =  PreBinFlow_S_474;//To Port = 13;
	 PreBinFlow_S_474 __Port[0] =  F_FUNC_Vmin_GROS_100_3_post_7_475;//To Port = 14;
	 F_FUNC_Vmin_GROS_100_3_post_7_475 __Port[0] =  VminSearchPost_5_476;//To Port = 15;
	 VminSearchPost_5_476 __Port[0] =  VminSearchPost_6_479;//To Port = 18;
	 VminSearchPost_5_476 __Port[1] =  PreBinFlow_S_477;//To Port = 16;
	 PreBinFlow_S_477 __Port[0] =  F_FUNC_Vmin_GROS_100_4_post_8_478;//To Port = 17;
	 F_FUNC_Vmin_GROS_100_4_post_8_478 __Port[0] =  VminSearchPost_6_479;//To Port = 18;
	 VminSearchPost_6_479 __Port[0] =  VminSearchPost_7_482;//To Port = 21;
	 VminSearchPost_6_479 __Port[1] =  PreBinFlow_S_480;//To Port = 19;
	 PreBinFlow_S_480 __Port[0] =  F_FUNC_Vmin_GROS_166p66_post_9_481;//To Port = 20;
	 F_FUNC_Vmin_GROS_166p66_post_9_481 __Port[0] =  VminSearchPost_7_482;//To Port = 21;
	 VminSearchPost_7_482 __Port[0] =  VminSearchPost_8_485;//To Port = 24;
	 VminSearchPost_7_482 __Port[1] =  PreBinFlow_S_483;//To Port = 22;
	 PreBinFlow_S_483 __Port[0] =  F_FUNC_Vmin_11_484;//To Port = 23;
	 F_FUNC_Vmin_11_484 __Port[0] =  VminSearchPost_8_485;//To Port = 24;
	 VminSearchPost_8_485 __Port[0] =  VminSearchPost_9_488;//To Port = 27;
	 VminSearchPost_8_485 __Port[1] =  PreBinFlow_S_486;//To Port = 25;
	 PreBinFlow_S_486 __Port[0] =  F_FUNC_Vmin_12_487;//To Port = 26;
	 F_FUNC_Vmin_12_487 __Port[0] =  VminSearchPost_9_488;//To Port = 27;
	 VminSearchPost_9_488 __Port[0] = FlowNode_491;//To Port = 30;
	 VminSearchPost_9_488 __Port[1] =  PreBinFlow_S_489;//To Port = 28;
	 PreBinFlow_S_489 __Port[0] =  F_FUNC_Vmin_14_490;//To Port = 29;
	 F_FUNC_Vmin_14_490 __Port[0] = FlowNode_491;//To Port = 30;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,1550,235,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_SrchVdd_Post_S ***/

/****************************************************************************/
/*** SubFlow Final_PostStressSrch_S                                       ***/
/****************************************************************************/
__SubFlow Final_PostStressSrch_S {
	__Node  Final_SrchVdd_Post_S_492 {
		__XCoord = (50,250);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "631";
		__Exec =  Final_SrchVdd_Post_S;
	}
	__Node FlowNode_493 {
		__XCoord = (200,50);
		__InputPosition = 270;
		__TestID = "632";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode = FlowNode_493;
	__PortConnections {
	 Final_SrchVdd_Post_S_492 __Port[0] = FlowNode_493;//To Port = 1;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_PostStressSrch_S ***/

/****************************************************************************/
/*** SubFlow Final_Iddq_VboxLO_Post_S                                     ***/
/****************************************************************************/
__SubFlow Final_Iddq_VboxLO_Post_S {
	__Node  IddqVboxLOPost_494 {
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
		__TestID = "633";
		// __Calibration = Bllizar_Calibration;
		__Exec =  IddqVboxLOPost;
	}
	__Node  PreBinFlow_S_495 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "634";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IDDQ_Vboxlo_post_VDDS_496 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "635";
		__Exec =  F_LEAK_IDDQ_Vboxlo_post_VDDS;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  IddqVboxLOPost_1_497 {
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
		__TestID = "636";
		// __Calibration = Bllizar_Calibration;
		__Exec =  IddqVboxLOPost_1;
	}
	__Node  PreBinFlow_S_498 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "637";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IDDQ_Vboxlo_post_VDDS_1_499 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "638";
		__Exec =  F_LEAK_IDDQ_Vboxlo_post_VDDS_1;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_500 {
		__XCoord = (350,150);
		__InputPosition = 270;
		__TestID = "639";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  IddqVboxLOPost_494;
	__PortConnections {
	 IddqVboxLOPost_494 __Port[0] =  IddqVboxLOPost_1_497;//To Port = 3;
	 IddqVboxLOPost_494 __Port[1] =  PreBinFlow_S_495;//To Port = 1;
	 PreBinFlow_S_495 __Port[0] =  F_LEAK_IDDQ_Vboxlo_post_VDDS_496;//To Port = 2;
	 F_LEAK_IDDQ_Vboxlo_post_VDDS_496 __Port[0] =  IddqVboxLOPost_1_497;//To Port = 3;
	 IddqVboxLOPost_1_497 __Port[0] = FlowNode_500;//To Port = 6;
	 IddqVboxLOPost_1_497 __Port[1] =  PreBinFlow_S_498;//To Port = 4;
	 PreBinFlow_S_498 __Port[0] =  F_LEAK_IDDQ_Vboxlo_post_VDDS_1_499;//To Port = 5;
	 F_LEAK_IDDQ_Vboxlo_post_VDDS_1_499 __Port[0] = FlowNode_500;//To Port = 6;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_Iddq_VboxLO_Post_S ***/

/****************************************************************************/
/*** SubFlow Final_Iddq_Vburnin_Post_S                                    ***/
/****************************************************************************/
__SubFlow Final_Iddq_Vburnin_Post_S {
	__Node  IddqVburnin_501 {
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
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vburnin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "640";
		// __Calibration = Bllizar_Calibration;
		__Exec =  IddqVburnin;
	}
	__Node  PreBinFlow_S_502 {
		__XCoord = (50,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "641";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IDDQ_Vburnin_VDDS_PM12_503 {
		__XCoord = (50,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "642";
		__Exec =  F_LEAK_IDDQ_Vburnin_VDDS_PM12;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  IddqVburnin_1_504 {
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
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vburnin"; }
            DCSpecs = __Expression { __String = "DCDataSelect"; }
        }
		__TestID = "643";
		// __Calibration = Bllizar_Calibration;
		__Exec =  IddqVburnin_1;
	}
	__Node  PreBinFlow_S_505 {
		__XCoord = (200,425);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "644";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IDDQ_Vburnin_VDDS_PM411_506 {
		__XCoord = (200,555);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "645";
		__Exec =  F_LEAK_IDDQ_Vburnin_VDDS_PM411;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_507 {
		__XCoord = (350,250);
		__InputPosition = 270;
		__TestID = "646";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  IddqVburnin_501;
	__PortConnections {
	 IddqVburnin_501 __Port[0] =  IddqVburnin_1_504;//To Port = 3;
	 IddqVburnin_501 __Port[1] =  PreBinFlow_S_502;//To Port = 1;
	 PreBinFlow_S_502 __Port[0] =  F_LEAK_IDDQ_Vburnin_VDDS_PM12_503;//To Port = 2;
	 F_LEAK_IDDQ_Vburnin_VDDS_PM12_503 __Port[0] =  IddqVburnin_1_504;//To Port = 3;
	 IddqVburnin_1_504 __Port[0] = FlowNode_507;//To Port = 6;
	 IddqVburnin_1_504 __Port[1] =  PreBinFlow_S_505;//To Port = 4;
	 PreBinFlow_S_505 __Port[0] =  F_LEAK_IDDQ_Vburnin_VDDS_PM411_506;//To Port = 5;
	 F_LEAK_IDDQ_Vburnin_VDDS_PM411_506 __Port[0] = FlowNode_507;//To Port = 6;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,235,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_Iddq_Vburnin_Post_S ***/

/****************************************************************************/
/*** SubFlow Final_Iddq_Vmax_Post_S                                       ***/
/****************************************************************************/
__SubFlow Final_Iddq_Vmax_Post_S {
	__Node  IddqVmax_508 {
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
		__TestID = "647";
		// __Calibration = Bllizar_Calibration;
		__Exec =  IddqVmax;
	}
	__Node  PreBinFlow_S_509 {
		__XCoord = (50,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "648";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IDDQ_Vmax_VDDS_PM12_510 {
		__XCoord = (50,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "649";
		__Exec =  F_LEAK_IDDQ_Vmax_VDDS_PM12;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  IddqVmax_1_511 {
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
		__TestID = "650";
		// __Calibration = Bllizar_Calibration;
		__Exec =  IddqVmax_1;
	}
	__Node  PreBinFlow_S_512 {
		__XCoord = (200,425);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "651";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IDDQ_Vmax_VDDS_PM411_513 {
		__XCoord = (200,555);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "652";
		__Exec =  F_LEAK_IDDQ_Vmax_VDDS_PM411;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_514 {
		__XCoord = (350,250);
		__InputPosition = 270;
		__TestID = "653";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  IddqVmax_508;
	__PortConnections {
	 IddqVmax_508 __Port[0] =  IddqVmax_1_511;//To Port = 3;
	 IddqVmax_508 __Port[1] =  PreBinFlow_S_509;//To Port = 1;
	 PreBinFlow_S_509 __Port[0] =  F_LEAK_IDDQ_Vmax_VDDS_PM12_510;//To Port = 2;
	 F_LEAK_IDDQ_Vmax_VDDS_PM12_510 __Port[0] =  IddqVmax_1_511;//To Port = 3;
	 IddqVmax_1_511 __Port[0] = FlowNode_514;//To Port = 6;
	 IddqVmax_1_511 __Port[1] =  PreBinFlow_S_512;//To Port = 4;
	 PreBinFlow_S_512 __Port[0] =  F_LEAK_IDDQ_Vmax_VDDS_PM411_513;//To Port = 5;
	 F_LEAK_IDDQ_Vmax_VDDS_PM411_513 __Port[0] = FlowNode_514;//To Port = 6;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,235,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_Iddq_Vmax_Post_S ***/

/****************************************************************************/
/*** SubFlow Final_Iddq_Delta_S                                           ***/
/****************************************************************************/
__SubFlow Final_Iddq_Delta_S {
	__Node  IddqDelta_515 {
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
		__TestID = "654";
		// __Calibration = Bllizar_Calibration;
		__Exec =  IddqDelta;
	}
	__Node  PreBinFlow_S_516 {
		__XCoord = (50,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "655";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IDDQ_Delta_517 {
		__XCoord = (50,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "656";
		__Exec =  F_LEAK_IDDQ_Delta;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_518 {
		__XCoord = (200,250);
		__InputPosition = 270;
		__TestID = "657";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  IddqDelta_515;
	__PortConnections {
	 IddqDelta_515 __Port[0] = FlowNode_518;//To Port = 3;
	 IddqDelta_515 __Port[1] =  PreBinFlow_S_516;//To Port = 1;
	 PreBinFlow_S_516 __Port[0] =  F_LEAK_IDDQ_Delta_517;//To Port = 2;
	 F_LEAK_IDDQ_Delta_517 __Port[0] = FlowNode_518;//To Port = 3;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,235,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_Iddq_Delta_S ***/

/****************************************************************************/
/*** SubFlow Final_Iddq_Drift_S                                           ***/
/****************************************************************************/
__SubFlow Final_Iddq_Drift_S {
	__Node  IddqDrift_519 {
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
		__TestID = "658";
		// __Calibration = Bllizar_Calibration;
		__Exec =  IddqDrift;
	}
	__Node  PreBinFlow_S_520 {
		__XCoord = (50,455);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "659";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IDDQ_Drift_521 {
		__XCoord = (50,585);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "660";
		__Exec =  F_LEAK_IDDQ_Drift;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_522 {
		__XCoord = (200,250);
		__InputPosition = 270;
		__TestID = "661";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  IddqDrift_519;
	__PortConnections {
	 IddqDrift_519 __Port[0] = FlowNode_522;//To Port = 3;
	 IddqDrift_519 __Port[1] =  PreBinFlow_S_520;//To Port = 1;
	 PreBinFlow_S_520 __Port[0] =  F_LEAK_IDDQ_Drift_521;//To Port = 2;
	 F_LEAK_IDDQ_Drift_521 __Port[0] = FlowNode_522;//To Port = 3;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,235,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_Iddq_Drift_S ***/

/****************************************************************************/
/*** SubFlow Final_PostStressIddq_S                                       ***/
/****************************************************************************/
__SubFlow Final_PostStressIddq_S {
	__Node  Final_Iddq_VboxLO_Post_S_523 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "662";
		__Exec =  Final_Iddq_VboxLO_Post_S;
	}
	__Node  Final_Iddq_Vburnin_Post_S_524 {
		__XCoord = (200,250);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "663";
		__Exec =  Final_Iddq_Vburnin_Post_S;
	}
	__Node  Final_Iddq_Vmax_Post_S_525 {
		__XCoord = (350,250);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "664";
		__Exec =  Final_Iddq_Vmax_Post_S;
	}
	__Node  Final_Iddq_Delta_S_526 {
		__XCoord = (500,250);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "665";
		__Exec =  Final_Iddq_Delta_S;
	}
	__Node  Final_Iddq_Drift_S_527 {
		__XCoord = (650,250);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "666";
		__Exec =  Final_Iddq_Drift_S;
	}
	__Node FlowNode_528 {
		__XCoord = (800,50);
		__InputPosition = 270;
		__TestID = "667";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  Final_Iddq_VboxLO_Post_S_523;
	__PortConnections {
	 Final_Iddq_VboxLO_Post_S_523 __Port[0] = FlowNode_528;//To Port = 5;
	 Final_Iddq_Vburnin_Post_S_524 __Port[0] = FlowNode_528;//To Port = 5;
	 Final_Iddq_Vmax_Post_S_525 __Port[0] = FlowNode_528;//To Port = 5;
	 Final_Iddq_Delta_S_526 __Port[0] = FlowNode_528;//To Port = 5;
	 Final_Iddq_Drift_S_527 __Port[0] = FlowNode_528;//To Port = 5;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,800,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_PostStressIddq_S ***/

/****************************************************************************/
/*** SubFlow Final_AtSpeed_Vmin_S                                         ***/
/****************************************************************************/
__SubFlow Final_AtSpeed_Vmin_S {
	__Node  AtSpeed_529 {
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
		__TestID = "668";
		// __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed;
	}
	__Node  PreBinFlow_S_530 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "669";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmin_SCAN_AC_50_531 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "670";
		__Exec =  F_FUNC_FAST_Vmin_SCAN_AC_50;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_1_532 {
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
		__TestID = "671";
		// __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_1;
	}
	__Node  PreBinFlow_S_533 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "672";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmin_SCAN_AC_50_1_534 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "673";
		__Exec =  F_FUNC_FAST_Vmin_SCAN_AC_50_1;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_2_535 {
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
		__TestID = "674";
		// __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_2;
	}
	__Node  PreBinFlow_S_536 {
		__XCoord = (350,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "675";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmin_SCAN_AC_50_2_537 {
		__XCoord = (350,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "676";
		__Exec =  F_FUNC_FAST_Vmin_SCAN_AC_50_2;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_3_538 {
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
		__TestID = "677";
		// __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_3;
	}
	__Node  PreBinFlow_S_539 {
		__XCoord = (500,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "678";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmin_SCAN_AC_50_3_540 {
		__XCoord = (500,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "679";
		__Exec =  F_FUNC_FAST_Vmin_SCAN_AC_50_3;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_4_541 {
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
		__TestID = "680";
		// __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_4;
	}
	__Node  PreBinFlow_S_542 {
		__XCoord = (650,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "681";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmin_SCAN_AC_50_4_543 {
		__XCoord = (650,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "682";
		__Exec =  F_FUNC_FAST_Vmin_SCAN_AC_50_4;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_5_544 {
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
		__TestID = "683";
		// __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_5;
	}
	__Node  PreBinFlow_S_545 {
		__XCoord = (800,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "684";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmin_SCAN_AC_50_5_546 {
		__XCoord = (800,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "685";
		__Exec =  F_FUNC_FAST_Vmin_SCAN_AC_50_5;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_547 {
		__XCoord = (950,150);
		__InputPosition = 270;
		__TestID = "686";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  AtSpeed_529;
	__PortConnections {
	 AtSpeed_529 __Port[0] =  AtSpeed_1_532;//To Port = 3;
	 AtSpeed_529 __Port[1] =  PreBinFlow_S_530;//To Port = 1;
	 PreBinFlow_S_530 __Port[0] =  F_FUNC_FAST_Vmin_SCAN_AC_50_531;//To Port = 2;
	 F_FUNC_FAST_Vmin_SCAN_AC_50_531 __Port[0] =  AtSpeed_1_532;//To Port = 3;
	 AtSpeed_1_532 __Port[0] =  AtSpeed_2_535;//To Port = 6;
	 AtSpeed_1_532 __Port[1] =  PreBinFlow_S_533;//To Port = 4;
	 PreBinFlow_S_533 __Port[0] =  F_FUNC_FAST_Vmin_SCAN_AC_50_1_534;//To Port = 5;
	 F_FUNC_FAST_Vmin_SCAN_AC_50_1_534 __Port[0] =  AtSpeed_2_535;//To Port = 6;
	 AtSpeed_2_535 __Port[0] =  AtSpeed_3_538;//To Port = 9;
	 AtSpeed_2_535 __Port[1] =  PreBinFlow_S_536;//To Port = 7;
	 PreBinFlow_S_536 __Port[0] =  F_FUNC_FAST_Vmin_SCAN_AC_50_2_537;//To Port = 8;
	 F_FUNC_FAST_Vmin_SCAN_AC_50_2_537 __Port[0] =  AtSpeed_3_538;//To Port = 9;
	 AtSpeed_3_538 __Port[0] =  AtSpeed_4_541;//To Port = 12;
	 AtSpeed_3_538 __Port[1] =  PreBinFlow_S_539;//To Port = 10;
	 PreBinFlow_S_539 __Port[0] =  F_FUNC_FAST_Vmin_SCAN_AC_50_3_540;//To Port = 11;
	 F_FUNC_FAST_Vmin_SCAN_AC_50_3_540 __Port[0] =  AtSpeed_4_541;//To Port = 12;
	 AtSpeed_4_541 __Port[0] =  AtSpeed_5_544;//To Port = 15;
	 AtSpeed_4_541 __Port[1] =  PreBinFlow_S_542;//To Port = 13;
	 PreBinFlow_S_542 __Port[0] =  F_FUNC_FAST_Vmin_SCAN_AC_50_4_543;//To Port = 14;
	 F_FUNC_FAST_Vmin_SCAN_AC_50_4_543 __Port[0] =  AtSpeed_5_544;//To Port = 15;
	 AtSpeed_5_544 __Port[0] = FlowNode_547;//To Port = 18;
	 AtSpeed_5_544 __Port[1] =  PreBinFlow_S_545;//To Port = 16;
	 PreBinFlow_S_545 __Port[0] =  F_FUNC_FAST_Vmin_SCAN_AC_50_5_546;//To Port = 17;
	 F_FUNC_FAST_Vmin_SCAN_AC_50_5_546 __Port[0] = FlowNode_547;//To Port = 18;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,950,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_AtSpeed_Vmin_S ***/

/****************************************************************************/
/*** SubFlow Final_AtSpeed_Vmax_S                                         ***/
/****************************************************************************/
__SubFlow Final_AtSpeed_Vmax_S {
	__Node  AtSpeed_548 {
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
		__TestID = "687";
		// __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed;
	}
	__Node  PreBinFlow_S_549 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "688";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmax_SCAN_AC_50_550 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "689";
		__Exec =  F_FUNC_FAST_Vmax_SCAN_AC_50;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_1_551 {
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
		__TestID = "690";
		// __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_1;
	}
	__Node  PreBinFlow_S_552 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "691";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmax_SCAN_AC_50_1_553 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "692";
		__Exec =  F_FUNC_FAST_Vmax_SCAN_AC_50_1;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_2_554 {
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
		__TestID = "693";
		// __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_2;
	}
	__Node  PreBinFlow_S_555 {
		__XCoord = (350,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "694";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmax_SCAN_AC_50_2_556 {
		__XCoord = (350,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "695";
		__Exec =  F_FUNC_FAST_Vmax_SCAN_AC_50_2;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_3_557 {
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
		__TestID = "696";
		// __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_3;
	}
	__Node  PreBinFlow_S_558 {
		__XCoord = (500,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "697";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmax_SCAN_AC_50_3_559 {
		__XCoord = (500,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "698";
		__Exec =  F_FUNC_FAST_Vmax_SCAN_AC_50_3;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_4_560 {
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
		__TestID = "699";
		// __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_4;
	}
	__Node  PreBinFlow_S_561 {
		__XCoord = (650,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "700";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmax_SCAN_AC_50_4_562 {
		__XCoord = (650,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "701";
		__Exec =  F_FUNC_FAST_Vmax_SCAN_AC_50_4;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  AtSpeed_5_563 {
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
		__TestID = "702";
		// __Calibration = Bllizar_Calibration;
		__Exec =  AtSpeed_5;
	}
	__Node  PreBinFlow_S_564 {
		__XCoord = (800,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "703";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_FAST_Vmax_SCAN_AC_50_5_565 {
		__XCoord = (800,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "704";
		__Exec =  F_FUNC_FAST_Vmax_SCAN_AC_50_5;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_566 {
		__XCoord = (950,150);
		__InputPosition = 270;
		__TestID = "705";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  AtSpeed_548;
	__PortConnections {
	 AtSpeed_548 __Port[0] =  AtSpeed_1_551;//To Port = 3;
	 AtSpeed_548 __Port[1] =  PreBinFlow_S_549;//To Port = 1;
	 PreBinFlow_S_549 __Port[0] =  F_FUNC_FAST_Vmax_SCAN_AC_50_550;//To Port = 2;
	 F_FUNC_FAST_Vmax_SCAN_AC_50_550 __Port[0] =  AtSpeed_1_551;//To Port = 3;
	 AtSpeed_1_551 __Port[0] =  AtSpeed_2_554;//To Port = 6;
	 AtSpeed_1_551 __Port[1] =  PreBinFlow_S_552;//To Port = 4;
	 PreBinFlow_S_552 __Port[0] =  F_FUNC_FAST_Vmax_SCAN_AC_50_1_553;//To Port = 5;
	 F_FUNC_FAST_Vmax_SCAN_AC_50_1_553 __Port[0] =  AtSpeed_2_554;//To Port = 6;
	 AtSpeed_2_554 __Port[0] =  AtSpeed_3_557;//To Port = 9;
	 AtSpeed_2_554 __Port[1] =  PreBinFlow_S_555;//To Port = 7;
	 PreBinFlow_S_555 __Port[0] =  F_FUNC_FAST_Vmax_SCAN_AC_50_2_556;//To Port = 8;
	 F_FUNC_FAST_Vmax_SCAN_AC_50_2_556 __Port[0] =  AtSpeed_3_557;//To Port = 9;
	 AtSpeed_3_557 __Port[0] =  AtSpeed_4_560;//To Port = 12;
	 AtSpeed_3_557 __Port[1] =  PreBinFlow_S_558;//To Port = 10;
	 PreBinFlow_S_558 __Port[0] =  F_FUNC_FAST_Vmax_SCAN_AC_50_3_559;//To Port = 11;
	 F_FUNC_FAST_Vmax_SCAN_AC_50_3_559 __Port[0] =  AtSpeed_4_560;//To Port = 12;
	 AtSpeed_4_560 __Port[0] =  AtSpeed_5_563;//To Port = 15;
	 AtSpeed_4_560 __Port[1] =  PreBinFlow_S_561;//To Port = 13;
	 PreBinFlow_S_561 __Port[0] =  F_FUNC_FAST_Vmax_SCAN_AC_50_4_562;//To Port = 14;
	 F_FUNC_FAST_Vmax_SCAN_AC_50_4_562 __Port[0] =  AtSpeed_5_563;//To Port = 15;
	 AtSpeed_5_563 __Port[0] = FlowNode_566;//To Port = 18;
	 AtSpeed_5_563 __Port[1] =  PreBinFlow_S_564;//To Port = 16;
	 PreBinFlow_S_564 __Port[0] =  F_FUNC_FAST_Vmax_SCAN_AC_50_5_565;//To Port = 17;
	 F_FUNC_FAST_Vmax_SCAN_AC_50_5_565 __Port[0] = FlowNode_566;//To Port = 18;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,950,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_AtSpeed_Vmax_S ***/

/****************************************************************************/
/*** SubFlow Final_AtSpeed_S                                              ***/
/****************************************************************************/
__SubFlow Final_AtSpeed_S {
	__Node  Final_AtSpeed_Vmin_S_567 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "706";
		__Exec =  Final_AtSpeed_Vmin_S;
	}
	__Node  Final_AtSpeed_Vmax_S_568 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "707";
		__Exec =  Final_AtSpeed_Vmax_S;
	}
	__Node FlowNode_569 {
		__XCoord = (350,50);
		__InputPosition = 270;
		__TestID = "708";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  Final_AtSpeed_Vmin_S_567;
	__PortConnections {
	 Final_AtSpeed_Vmin_S_567 __Port[0] =  Final_AtSpeed_Vmax_S_568;//To Port = 1;
	 Final_AtSpeed_Vmax_S_568 __Port[0] = FlowNode_569;//To Port = 2;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_AtSpeed_S ***/

/****************************************************************************/
/*** SubFlow Final_SpecLevels_Vmin_S                                      ***/
/****************************************************************************/
__SubFlow Final_SpecLevels_Vmin_S {
	__Node  SpecLevels_570 {
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
		__TestID = "709";
		// __Calibration = Bllizar_Calibration;
		__Exec =  SpecLevels;
	}
	__Node  PreBinFlow_S_571 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "710";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_SPEC_Vmin_DC_PARA_100_572 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "711";
		__Exec =  F_FUNC_SPEC_Vmin_DC_PARA_100;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VoutVmin_573 {
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
		__TestID = "712";
		// __Calibration = Bllizar_Calibration;
		__Exec =  VoutVmin;
	}
	__Node  PreBinFlow_S_574 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "713";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_PARA_VIO_Vmin_PM86_DC_PM04_575 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "714";
		__Exec =  F_PARA_VIO_Vmin_PM86_DC_PM04;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_576 {
		__XCoord = (350,150);
		__InputPosition = 270;
		__TestID = "715";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  SpecLevels_570;
	__PortConnections {
	 SpecLevels_570 __Port[0] =  VoutVmin_573;//To Port = 3;
	 SpecLevels_570 __Port[1] =  PreBinFlow_S_571;//To Port = 1;
	 PreBinFlow_S_571 __Port[0] =  F_FUNC_SPEC_Vmin_DC_PARA_100_572;//To Port = 2;
	 F_FUNC_SPEC_Vmin_DC_PARA_100_572 __Port[0] =  VoutVmin_573;//To Port = 3;
	 VoutVmin_573 __Port[0] = FlowNode_576;//To Port = 6;
	 VoutVmin_573 __Port[1] =  PreBinFlow_S_574;//To Port = 4;
	 PreBinFlow_S_574 __Port[0] =  F_PARA_VIO_Vmin_PM86_DC_PM04_575;//To Port = 5;
	 F_PARA_VIO_Vmin_PM86_DC_PM04_575 __Port[0] = FlowNode_576;//To Port = 6;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_SpecLevels_Vmin_S ***/

/****************************************************************************/
/*** SubFlow Final_SpecLevels_Vmax_S                                      ***/
/****************************************************************************/
__SubFlow Final_SpecLevels_Vmax_S {
	__Node  SpecLevels_577 {
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
		__TestID = "716";
		// __Calibration = Bllizar_Calibration;
		__Exec =  SpecLevels;
	}
	__Node  PreBinFlow_S_578 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "717";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_FUNC_SPEC_Vmax_DC_PARA_100_579 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "718";
		__Exec =  F_FUNC_SPEC_Vmax_DC_PARA_100;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  VoutVmax_580 {
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
		__TestID = "719";
		// __Calibration = Bllizar_Calibration;
		__Exec =  VoutVmax;
	}
	__Node  PreBinFlow_S_581 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "720";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_PARA_VIO_Vmax_PM86_DC_PM04_582 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "721";
		__Exec =  F_PARA_VIO_Vmax_PM86_DC_PM04;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_583 {
		__XCoord = (350,150);
		__InputPosition = 270;
		__TestID = "722";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  SpecLevels_577;
	__PortConnections {
	 SpecLevels_577 __Port[0] =  VoutVmax_580;//To Port = 3;
	 SpecLevels_577 __Port[1] =  PreBinFlow_S_578;//To Port = 1;
	 PreBinFlow_S_578 __Port[0] =  F_FUNC_SPEC_Vmax_DC_PARA_100_579;//To Port = 2;
	 F_FUNC_SPEC_Vmax_DC_PARA_100_579 __Port[0] =  VoutVmax_580;//To Port = 3;
	 VoutVmax_580 __Port[0] = FlowNode_583;//To Port = 6;
	 VoutVmax_580 __Port[1] =  PreBinFlow_S_581;//To Port = 4;
	 PreBinFlow_S_581 __Port[0] =  F_PARA_VIO_Vmax_PM86_DC_PM04_582;//To Port = 5;
	 F_PARA_VIO_Vmax_PM86_DC_PM04_582 __Port[0] = FlowNode_583;//To Port = 6;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_SpecLevels_Vmax_S ***/

/****************************************************************************/
/*** SubFlow Final_Leakage_S                                              ***/
/****************************************************************************/
__SubFlow Final_Leakage_S {
	__Node  LeakIIn_584 {
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
		__TestID = "723";
		// __Calibration = Bllizar_Calibration;
		__Exec =  LeakIIn;
	}
	__Node  PreBinFlow_S_585 {
		__XCoord = (50,355);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "724";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IIN_Vmax_586 {
		__XCoord = (50,485);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "725";
		__Exec =  F_LEAK_IIN_Vmax;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node  LeakIO_587 {
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
		__TestID = "726";
		// __Calibration = Bllizar_Calibration;
		__Exec =  LeakIO;
	}
	__Node  PreBinFlow_S_588 {
		__XCoord = (200,325);
		__Port[0] {
			__PortPosition = 175;
		}
		__InputPosition = 20;
		__TestID = "727";
		__Exec =  PreBinFlow_S;
	}
	__Node  F_LEAK_IOZ_Vmax_PM85_589 {
		__XCoord = (200,455);
		__Port[0] {
			__PortPosition = 115;
		}
		__InputPosition = 20;
		__TestID = "728";
		__Exec =  F_LEAK_IOZ_Vmax_PM85;
		__PortSelect =  "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
	}
	__Node FlowNode_590 {
		__XCoord = (350,150);
		__InputPosition = 270;
		__TestID = "729";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  LeakIIn_584;
	__PortConnections {
	 LeakIIn_584 __Port[0] =  LeakIO_587;//To Port = 3;
	 LeakIIn_584 __Port[1] =  PreBinFlow_S_585;//To Port = 1;
	 PreBinFlow_S_585 __Port[0] =  F_LEAK_IIN_Vmax_586;//To Port = 2;
	 F_LEAK_IIN_Vmax_586 __Port[0] =  LeakIO_587;//To Port = 3;
	 LeakIO_587 __Port[0] = FlowNode_590;//To Port = 6;
	 LeakIO_587 __Port[1] =  PreBinFlow_S_588;//To Port = 4;
	 PreBinFlow_S_588 __Port[0] =  F_LEAK_IOZ_Vmax_PM85_589;//To Port = 5;
	 F_LEAK_IOZ_Vmax_PM85_589 __Port[0] = FlowNode_590;//To Port = 6;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_Leakage_S ***/

/****************************************************************************/
/*** SubFlow Final_Parametrics_S                                          ***/
/****************************************************************************/
__SubFlow Final_Parametrics_S {
	__Node  Final_SpecLevels_Vmin_S_591 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "730";
		__Exec =  Final_SpecLevels_Vmin_S;
	}
	__Node  Final_SpecLevels_Vmax_S_592 {
		__XCoord = (200,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "731";
		__Exec =  Final_SpecLevels_Vmax_S;
	}
	__Node  Final_Leakage_S_593 {
		__XCoord = (350,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "732";
		__Exec =  Final_Leakage_S;
	}
	__Node FlowNode_594 {
		__XCoord = (500,50);
		__InputPosition = 270;
		__TestID = "733";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  Final_SpecLevels_Vmin_S_591;
	__PortConnections {
	 Final_SpecLevels_Vmin_S_591 __Port[0] =  Final_SpecLevels_Vmax_S_592;//To Port = 1;
	 Final_SpecLevels_Vmax_S_592 __Port[0] =  Final_Leakage_S_593;//To Port = 2;
	 Final_Leakage_S_593 __Port[0] = FlowNode_594;//To Port = 3;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,500,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_Parametrics_S ***/

/****************************************************************************/
/*** SubFlow Final_SupplyShort_S                                          ***/
/****************************************************************************/
__SubFlow Final_SupplyShort_S {
	__Node  SupplyShorts2_595 {
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
		__TestID = "734";
		// __Calibration = Bllizar_Calibration;
		__Exec =  SupplyShorts2;
	}
	__Node  F_OS_SHRT_VDD_596 {
		__XCoord = (50,355);
		__InputPosition = 20;
		__TestID = "735";
		__Exec =  F_OS_SHRT_VDD;
	}
	__Node FlowNode_597 {
		__XCoord = (200,150);
		__InputPosition = 270;
		__TestID = "736";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  SupplyShorts2_595;
	__PortConnections {
	 SupplyShorts2_595 __Port[0] = FlowNode_597;//To Port = 2;
	 SupplyShorts2_595 __Port[1] =  F_OS_SHRT_VDD_596;//To Port = 1;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
/*** END SubFlow Final_SupplyShort_S ***/

/****************************************************************************/
/*** SubFlow Final_CRES_S                                                 ***/
/****************************************************************************/
__SubFlow Final_CRES_S {
	__Node FlowNode_598 {
		__XCoord = (0,50);
		__Port[0] {
			__PortPosition = 90;
		}
		__Port[1] {
			__PortPosition = 175;
		}
		__InputPosition = 220;
		__TestID = "737";
		__PortSelect =  "if ( fmod( TestProgData.CurSiteSerial, 50 ) = 0, 1, 0)";
	}
	__Node  Cres_599 {
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
		__TestID = "738";
		// __Calibration = Bllizar_Calibration;
		__Exec =  Cres;
	}
	__Node  F_OS_CRES_600 {
		__XCoord = (-15,295);
		__InputPosition = 20;
		__TestID = "739";
		__Exec =  F_OS_CRES;
	}
	__Node FlowNode_601 {
		__XCoord = (255,150);
		__InputPosition = 270;
		__TestID = "740";
		__PortSelect =  "0";
		__PortNumber = 0;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode = FlowNode_598;
	__PortConnections {
	FlowNode_598 __Port[0] = FlowNode_601;//To Port = 3;
	FlowNode_598 __Port[1] =  Cres_599;//To Port = 1;
	 Cres_599 __Port[0] = FlowNode_601;//To Port = 3;
	 Cres_599 __Port[1] =  F_OS_CRES_600;//To Port = 2;
	}
	__Background {
        __String = "Continue __Port 0";
        __Data = (0,0,255,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
                            
                          
