Unison:U0.2:S4.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/boardcheck.evo                                 */
/* Creation Date  : Tue Jan  3 17:12:06 2012                                  */
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


//***
//*** The following must be modified by the user based on device
//*** hardware specific data:
//***
//*** ETest UserCheckLoadBoardID :: Revision_Spec and Part_Number_Spec
//*** ETest SupplyCapChk :: capacitor_value per TestSupply
//***


/*********************************/
/*** UserCheckLoadBoardID Test ***/
/*********************************/
__Test UserCheckLoadBoardID_Bllizar_PB1 {
	//Was ETest

	__Mask[0] = TIGlobalVarsMask;
	__PortExpression[0] = __Expression { __String = ".Result = TMResultM:TM_PASS"; }
	__PortExpression[1] = __Expression { __String = "TRUE"; }
	__PortAction[1] = __Expression { __String = "skip(0, FALSE -> TIBoardCheckResult, Warning_message('Did not find a valid loadboard.  Please reload the program after making sure that a valid loadboard is being used.'))"; }
	__GlobalResult = __Expression { __String = "#"; __Mode = Output; }
//	__Block[0] = {
//			//__Value(meas) & __Result(TMResultM) are the returns of cpp Execute()
//        __Value = __Expression { __String = "#"; __Mode = Output; }
//        __Result = __Expression { __String = "..Value"; }
//        __ContinueOnFail = __Expression { __String = "NOT TestProgData.evFastBinning"; }
//        __TestMethod {
//            __Name = USER::TILoadBoardID;//fixtmod
//
//            Revision_Spec = __Expression { __String = "'A'"; }
//            Part_Number_Spec = __Expression { __String = "1"; }
//            Serial_Number = __Expression { __String = "#"; __Mode = Output; }
//            Revision = __Expression { __String = "#"; __Mode = Output; }
//            Programmed_Date = __Expression { __String = "#"; __Mode = Output; }
//            Part_Number = __Expression { __String = "#"; __Mode = Output; }
//            Variation = __Expression { __String = "#"; __Mode = Output; }
//            board_check = __Expression { __String = "#"; __Mode = Output; }
//        }
//    }
}
//end of __ETest


/******************************/
/*** Supply Capacitor Check ***/
/******************************/

__Test SupplyCapChk_Bllizar_PB1 {
	//Was ETest

	__PortExpression[0] = __Expression { __String = ".Result = TMResultM:TM_PASS"; }
	__PortExpression[1] = __Expression { __String = "skip( SupplyCapChk_Bllizar_PB1.VDD.Result = TMResultM:TM_FAIL, FALSE->TIBoardCheckResult,Warning_message('Supply capacitance check failed. Please notify EE that VDD is not at correct value.'))"; }
	__PortExpression[2] = __Expression { __String = "skip( SupplyCapChk_Bllizar_PB1.VDDAR.Result = TMResultM:TM_FAIL, FALSE->TIBoardCheckResult,Warning_message('Supply capacitance check failed. Please notify EE that VDDAR is not at correct value.'))"; }
	__PortExpression[3] = __Expression { __String = "skip( SupplyCapChk_Bllizar_PB1.VDDS.Result = TMResultM:TM_FAIL, FALSE->TIBoardCheckResult,Warning_message('Supply capacitance check failed. Please notify EE that VDDS is not at correct value.'))"; }
	__PortExpression[4] = __Expression { __String = "skip( TRUE {.Test_result.VDDA = TMResultM:TM_FAIL}, FALSE->TIBoardCheckResult,Warning_message('Supply capacitance check failed. Please notify EE that VDDA is not at correct value.'))"; }
	__PortAction[0] = __Expression { __String = "skip(0, TRUE->TIBoardCheckResult)"; }
	__GlobalResult = __Expression { __String = "#"; __Mode = Output; }
	__Block[0] = {
        __Title = VDD;
			//__Value(meas) & __Result(TMResultM) are the returns of cpp Execute()
        __Value = __Expression { __String = "#"; __Mode = Output; }
//        __Result = __Expression { __String = "if(SupplyCapChk_Bllizar_PB1.VDD.Value = TRUE, TMResultM:TM_PASS, TMResultM:TM_FAIL)"; }
        __ContinueOnFail = __Expression { __String = "TRUE"; }
        __TestMethod {
//            __Name = USER::TISupplyCapChk;//fixtmod
//
//            capacitor_value = __Expression { __String = "2uF"; }
//            capacitor_delta = __Expression { __String = "20"; }
//            final_measurement = __Expression { __String = "#"; __Mode = Output; }
//            CPS_NAME = __Expression { __String = "VDD"; }
        }
    }
}
//end of __ETest


/**************************/
/*** BoardCheck SubFlow ***/
/**************************/

__SubFlow BoardCheck_Bllizar_PB1 {
	__Node FlowNode_1350 {
		__XCoord = (50,55);
		__Port[0] {
			__PortPosition = 96;
		}
		__InputPosition = 266;
		__TestID = "";
		__PortSelect =  "0";
	}
	__Node  ConnectDevice_1351 {
		__XCoord = (200,50);
		__Port[0] {
			__PortPosition = 91;
		}
		__InputPosition = 270;
		__TestID = "1000000";
		// __Calibration = Bllizar_Calibration;
		__Exec =  ConnectDevice;
	}
	__Node  UserCheckLoadBoardID_Bllizar_PB1_1352 {
		__XCoord = (350,50);
		__Port[0] {
			__PortPosition = 86;
		}
		__Port[1] {
			__PortPosition = 180;
		}
		__InputPosition = 272;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; }
            Globals_Meas = __Expression { __String = "0"; }
        }
		__TestID = "2000000";
		// __Calibration = Bllizar_Calibration;
		__Exec =  UserCheckLoadBoardID_Bllizar_PB1;
	}
	__Node  SupplyCapChk_Bllizar_PB1_1353 {
		__XCoord = (500,50);
		__Port[0] {
			__PortPosition = 81;
		}
		__Port[1] {
			__PortPosition = 195;
		}
		__Port[2] {
			__PortPosition = 190;
		}
		__Port[3] {
			__PortPosition = 185;
		}
		__Port[4] {
			__PortPosition = 180;
		}
		__InputPosition = 274;
		__SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; }
            Globals_Meas = __Expression { __String = "0"; }
        }
		__TestID = "3000000";
		// __Calibration = Bllizar_Calibration;
		__Exec =  SupplyCapChk_Bllizar_PB1;
	}
	__Node  DisconnectDevice_1354 {
		__XCoord = (800,50);
		__Port[0] {
			__PortPosition = 81;
		}
		__InputPosition = 270;
		__TestID = "4000000";
		// __Calibration = Bllizar_Calibration;
		__Exec =  DisconnectDevice;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode = FlowNode_1350;
	__PortConnections {
	FlowNode_1350 __Port[0] =  ConnectDevice_1351;//To Port = 1;
	 ConnectDevice_1351 __Port[0] =  UserCheckLoadBoardID_Bllizar_PB1_1352;//To Port = 2;
	 UserCheckLoadBoardID_Bllizar_PB1_1352 __Port[0] =  SupplyCapChk_Bllizar_PB1_1353;//To Port = 3;
	 UserCheckLoadBoardID_Bllizar_PB1_1352 __Port[1] =  DisconnectDevice_1354;//To Port = 4;
	 SupplyCapChk_Bllizar_PB1_1353 __Port[0] =  DisconnectDevice_1354;//To Port = 4;
	 SupplyCapChk_Bllizar_PB1_1353 __Port[1] =  DisconnectDevice_1354;//To Port = 4;
	 SupplyCapChk_Bllizar_PB1_1353 __Port[2] =  DisconnectDevice_1354;//To Port = 4;
	 SupplyCapChk_Bllizar_PB1_1353 __Port[3] =  DisconnectDevice_1354;//To Port = 4;
	 SupplyCapChk_Bllizar_PB1_1353 __Port[4] =  DisconnectDevice_1354;//To Port = 4;
	}
	__Background {
        __String = "Execute SubFlow only once regardless of number of sites";
        __Data = (0,0,8,15,0,0,26,0,0,4,0,0,1,0,0,0);
    }
}

/**************************/
/*** BoardCheck SubFlow ***/
/**************************/

__SubFlow BoardCheck {
	__Node  BoardCheck_Bllizar_PB1_1355 {
		__XCoord = (112,169);
		__InputPosition = 0;
		__TestID = "";
		__Exec =  BoardCheck_Bllizar_PB1;
	}
	__Node FlowNode_1356 {
		__XCoord = (114,42);
		__Port[0] {
			__PortPosition = 184;
		}
		__InputPosition = 268;
		__TestID = "";
//This program will always be Bllizar_PB1 --BJP
//		__PortSelect =  "if(TIDeviceType = value(TIDeviceType:Bllizar_PB1),0,1)";
//		__PortSelect =  "if(TIDeviceType = value(TIDeviceType:Bllizar_PB1),0,1)";
		__PortSelect =  "0";
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode = FlowNode_1356;
	__PortConnections {
	FlowNode_1356 __Port[0] =  BoardCheck_Bllizar_PB1_1355;//To Port = 0;
	}
	__Background {
        __String = "TIDeviceType = Bllizar_PB1";
        __Data = (0,0,100,18,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
