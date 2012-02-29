Unison:U0.2:S4.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/testsets.evo                                   */
/* Creation Date  : Tue Jan  3 17:12:56 2012                                  */
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
/*** SupplyShorts1                                                          ***/
/******************************************************************************/

__Test SupplyShorts1 {
	__Mask[0] = ACSpecsMask;
	__Mask[1] = PSSpecsMask;
	__Mask[2] = DCSpecsMask;
	__Entry[0] = DCsetup_allZero;
	__PortExpression[0] = __Expression { __String = "skip( .Result = TM_RESULT:TM_PASS, if(TIScreenPrint, TIPrintf('DLOG', '=> PASSED SupplyShorts1.\n', ''),0) )"; }
	__PortExpression[1] = __Expression { __String = "skip( TRUE {.Test_result.SupplyShorts1_VDD_st = TM_RESULT:TM_FAIL}, if(TIScreenPrint, TIPrintf('DLOG', '=> FAILED SupplyShorts1_VDD_st.\n', ''),0) )"; }
	__Block[0] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#->CurResult"; __Mode = Output; }
		__Title = SupplyShorts1_VDDS_st;
		__TestMethod {
			__Name = LTXC::PowerTest;
			ExecuteSitesSerially = __Expression { __String = "FALSE"; }
			ForcedVoltage = __Expression { __String = "vshortsVDDS"; }
			HighLimit = __Expression { __String = "ishortshiVDDS"; }
			LevelsSetup = __Expression { __String = "&DCsetup_ZeroPins_ZeroSupplies_RampDown"; }
			LowLimit = __Expression { __String = "ishortsloVDDS"; }
			MaxAllowedCurrent = __Expression { __String = "max(5mA,1.25*ishortshiVDDS)"; }
			MaxExpectedCurrent = __Expression { __String = "max(1uA,1.1*ishortshiVDDS)"; }
			MeasurementAverages = __Expression { __String = "10"; }
			MeasurementDelay = __Expression { __String = "100ms"; }
			SetupRangeAfterPreset = __Expression { __String = "TRUE"; }
			SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
			TestPins = __Expression { __String = "VDDS"; }
		}
	}
	__Block[1] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#->CurResult"; __Mode = Output; }
		__Title = SupplyShorts1_VDDAR_st;
		__TestMethod {
			__Name = LTXC::PowerTest;
			ExecuteSitesSerially = __Expression { __String = "FALSE"; }
			ForcedVoltage = __Expression { __String = "vshortsVDDAR"; }
			HighLimit = __Expression { __String = "ishortshiVDDAR"; }
			LevelsSetup = __Expression { __String = "&DCsetup_ZeroPins_ZeroSupplies_RampDown"; }
			LowLimit = __Expression { __String = "ishortsloVDDAR"; }
			MaxAllowedCurrent = __Expression { __String = "max(5mA,1.25*ishortshiVDDAR)"; }
			MaxExpectedCurrent = __Expression { __String = "max(1uA,1.1*ishortshiVDDAR)"; }
			MeasurementAverages = __Expression { __String = "10"; }
			MeasurementDelay = __Expression { __String = "100ms"; }
			MethodOfTest = __Expression { __String = "Ptest_Method:STATIC"; }
			SetupRangeAfterPreset = __Expression { __String = "TRUE"; }
			SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
			TestPins = __Expression { __String = "VDDAR"; }
		}
	}
	__Block[2] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#->CurResult"; __Mode = Output; }
		__Title = SupplyShorts1_VDDA_st;
		__TestMethod {
			__Name = LTXC::PowerTest;
			ExecuteSitesSerially = __Expression { __String = "FALSE"; }
			ForcedVoltage = __Expression { __String = "vshortsVDDA"; }
			HighLimit = __Expression { __String = "ishortshiVDDA"; }
			LevelsSetup = __Expression { __String = "&DCsetup_ZeroPins_ZeroSupplies_RampDown"; }
			LowLimit = __Expression { __String = "ishortsloVDDA"; }
			MaxAllowedCurrent = __Expression { __String = "max(5mA,1.25*ishortshiVDDA)"; }
			MaxExpectedCurrent = __Expression { __String = "max(1uA,1.1*ishortshiVDDA)"; }
			MeasurementAverages = __Expression { __String = "10"; }
			MeasurementDelay = __Expression { __String = "100ms"; }
			MethodOfTest = __Expression { __String = "Ptest_Method:STATIC"; }
			SetupRangeAfterPreset = __Expression { __String = "TRUE"; }
			SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
			TestPins = __Expression { __String = "VDDA"; }
		}
	}
	__Block[3] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#->CurResult"; __Mode = Output; }
		__Title = SupplyShorts1_VDD_st;
		__TestMethod {
			__Name = LTXC::PowerTest;
			ExecuteSitesSerially = __Expression { __String = "FALSE"; }
			ForcedVoltage = __Expression { __String = "vshortsVDD"; }
			HighLimit = __Expression { __String = "ishortshiVDD"; }
			LevelsSetup = __Expression { __String = "&DCsetup_ZeroPins_ZeroSupplies_RampDown"; }
			LowLimit = __Expression { __String = "ishortsloVDD"; }
			MaxAllowedCurrent = __Expression { __String = "max(5mA,1.25*ishortshiVDD)"; }
			MaxExpectedCurrent = __Expression { __String = "max(1uA,1.1*ishortshiVDD)"; }
			MeasurementAverages = __Expression { __String = "10"; }
			MeasurementDelay = __Expression { __String = "100ms"; }
			MethodOfTest = __Expression { __String = "Ptest_Method:STATIC"; }
			SetupRangeAfterPreset = __Expression { __String = "TRUE"; }
			SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
			TestPins = __Expression { __String = "VDD"; }
		}
	}
	__Block[4] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#->CurResult"; __Mode = Output; }
		__Title = SupplyShorts1_VDDS_st_2;
		__TestMethod {
			__Name = LTXC::PowerTest;
			ExecuteSitesSerially = __Expression { __String = "FALSE"; }
			ForcedVoltage = __Expression { __String = "vshorts2VDDS"; }
			HighLimit = __Expression { __String = "ishortshi2VDDS"; }
			LevelsSetup = __Expression { __String = "&DCsetup_ZeroPins_ZeroSupplies_RampDown"; }
			LowLimit = __Expression { __String = "ishortslo2VDDS"; }
			MaxAllowedCurrent = __Expression { __String = "max(5mA,1.25*ishortshi2VDDS)"; }
			MaxExpectedCurrent = __Expression { __String = "max(1uA,1.1*ishortshi2VDDS)"; }
			MeasurementAverages = __Expression { __String = "10"; }
			MeasurementDelay = __Expression { __String = "100ms"; }
			MethodOfTest = __Expression { __String = "Ptest_Method:STATIC"; }
			SetupRangeAfterPreset = __Expression { __String = "TRUE"; }
			SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
			TestPins = __Expression { __String = "VDDS"; }
		}
	}
	__Block[5] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#->CurResult"; __Mode = Output; }
		__Title = SupplyShorts1_VDDAR_st_2;
		__TestMethod {
			__Name = LTXC::PowerTest;
			ExecuteSitesSerially = __Expression { __String = "FALSE"; }
			ForcedVoltage = __Expression { __String = "vshorts2VDDAR"; }
			HighLimit = __Expression { __String = "ishortshi2VDDAR"; }
			LevelsSetup = __Expression { __String = "&DCsetup_ZeroPins_ZeroSupplies_RampDown"; }
			LowLimit = __Expression { __String = "ishortslo2VDDAR"; }
			MaxAllowedCurrent = __Expression { __String = "max(5mA,1.25*ishortshi2VDDAR)"; }
			MaxExpectedCurrent = __Expression { __String = "max(1uA,1.1*ishortshi2VDDAR)"; }
			MeasurementAverages = __Expression { __String = "10"; }
			MeasurementDelay = __Expression { __String = "100ms"; }
			MethodOfTest = __Expression { __String = "Ptest_Method:STATIC"; }
			SetupRangeAfterPreset = __Expression { __String = "TRUE"; }
			SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
			TestPins = __Expression { __String = "VDDAR"; }
		}
	}
	__Block[6] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#->CurResult"; __Mode = Output; }
		__Title = SupplyShorts1_VDDA_st_2;
		__TestMethod {
			__Name = LTXC::PowerTest;
			ExecuteSitesSerially = __Expression { __String = "FALSE"; }
			ForcedVoltage = __Expression { __String = "vshorts2VDDA"; }
			HighLimit = __Expression { __String = "ishortshi2VDDA"; }
			LevelsSetup = __Expression { __String = "&DCsetup_ZeroPins_ZeroSupplies_RampDown"; }
			LowLimit = __Expression { __String = "ishortslo2VDDA"; }
			MaxAllowedCurrent = __Expression { __String = "max(5mA,1.25*ishortshi2VDDA)"; }
			MaxExpectedCurrent = __Expression { __String = "max(1uA,1.1*ishortshi2VDDA)"; }
			MeasurementAverages = __Expression { __String = "10"; }
			MeasurementDelay = __Expression { __String = "100ms"; }
			MethodOfTest = __Expression { __String = "Ptest_Method:STATIC"; }
			SetupRangeAfterPreset = __Expression { __String = "TRUE"; }
			SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
			TestPins = __Expression { __String = "VDDA"; }
		}
	}
	__Block[7] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#->CurResult"; __Mode = Output; }
		__Title = SupplyShorts1_VDD_st_2;
		__TestMethod {
			__Name = LTXC::PowerTest;
			ExecuteSitesSerially = __Expression { __String = "FALSE"; }
			ForcedVoltage = __Expression { __String = "vshorts2VDD"; }
			HighLimit = __Expression { __String = "ishortshi2VDD"; }
			LevelsSetup = __Expression { __String = "&DCsetup_ZeroPins_ZeroSupplies_RampDown"; }
			LowLimit = __Expression { __String = "ishortslo2VDD"; }
			MaxAllowedCurrent = __Expression { __String = "max(5mA,1.25*ishortshi2VDD)"; }
			MaxExpectedCurrent = __Expression { __String = "max(1uA,1.1*ishortshi2VDD)"; }
			MeasurementAverages = __Expression { __String = "10"; }
			MeasurementDelay = __Expression { __String = "100ms"; }
			MethodOfTest = __Expression { __String = "Ptest_Method:STATIC"; }
			SetupRangeAfterPreset = __Expression { __String = "TRUE"; }
			SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
			TestPins = __Expression { __String = "VDD"; }
		}
	}
}

/*** END SupplyShorts1 ***/

__Test SelectSpecs {
	__Mask[0] = Globals_Typ_Mask;
	__Mask[1] = Globals_Meas_Mask;
	__Mask[2] = DCSpecsMask;
	__Mask[3] = ACSpecsMask;
	__Entry[0] = SetTyp_To_Meas_MF;
	__PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
	__PortExpression[1] = __Expression { __String = "TRUE"; }
	__Block[0] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#"; __Mode = Output; }
		__Title = MyBlock0;
		__TestMethod {
			__Name = LTXC::GenericTest;
			/*CallAfterSetup = __Expression { __String = "&Initialize_EveryUnit_MF"; }*/
			/* Test_pins[] = __Expression { __String = "ALLPINS"; }*/
		}
	}
}


__Test DisconnectDevice {
	__Mask[0] = DCSpecsMask;
	__Entry[0] = DCsetup_ZeroPins_ZeroSupplies_RampDown;
	__PortExpression[0] = __Expression { __String = "TRUE"; }
	__PortExpression[1] = __Expression { __String = "TRUE"; }
	__Block[0] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#"; __Mode = Output; }
		__Title = Disconnect_DCRefPins;
		__TestMethod {
			__Name = LTXC::Connections;
			PinControl = __Expression { __String = "CONNECTION_ENUM:DISCONNECT_FROM_DUT"; }
			TestPins = __Expression { __String = "DCREF_PINS"; }
		}
	}
	__Block[1] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#"; __Mode = Output; }
		__Title = Disconnect_Pins;
		__TestMethod {
			__Name = LTXC::Connections;
			PinControl = __Expression { __String = "CONNECTION_ENUM:DISCONNECT_FROM_DUT"; }
			TestPins = __Expression { __String = "ALLPINS"; }
		}
	}
	__Block[2] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#"; __Mode = Output; }
		__Title = Disconnect_Supplies;
		__TestMethod {
			__Name = LTXC::Connections;
			CallAfterSetup = __Expression { __String = "&Delay_MF"; }
			PinControl = __Expression { __String = "CONNECTION_ENUM:DISCONNECT_FROM_DUT"; }
			TestPins = __Expression { __String = "ALLSUPPLIES"; }
		}
	}
}


__Test DisconnectDevice {
	__Mask[0] = DCSpecsMask;
	__Entry[0] = DCsetup_ZeroPins_ZeroSupplies_RampDown;
	__PortExpression[0] = __Expression { __String = "TRUE"; }
	__PortExpression[1] = __Expression { __String = "TRUE"; }
	__Block[0] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#"; __Mode = Output; }
		__Title = Disconnect_DCRefPins;
		__TestMethod {
			__Name = LTXC::Connections;
			PinControl = __Expression { __String = "CONNECTION_ENUM:DISCONNECT_FROM_DUT"; }
			TestPins = __Expression { __String = "DCREF_PINS"; }
		}
	}
	__Block[1] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#"; __Mode = Output; }
		__Title = Disconnect_Pins;
		__TestMethod {
			__Name = LTXC::Connections;
			PinControl = __Expression { __String = "CONNECTION_ENUM:DISCONNECT_FROM_DUT"; }
			TestPins = __Expression { __String = "ALLPINS"; }
		}
	}
	__Block[2] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#"; __Mode = Output; }
		__Title = Disconnect_Supplies;
		__TestMethod {
			__Name = LTXC::Connections;
			CallAfterSetup = __Expression { __String = "&Delay_MF"; }
			PinControl = __Expression { __String = "CONNECTION_ENUM:DISCONNECT_FROM_DUT"; }
			TestPins = __Expression { __String = "ALLSUPPLIES"; }
		}
	}
}

__Test ConnectDevice {
	__Entry[0] = DCsetup_ZeroPins_ZeroSupplies_RampDown;
	__Entry[1] = Initialize_EveryUnit_MF;
	__PortExpression[0] = __Expression { __String = "TRUE"; }
	__PortExpression[1] = __Expression { __String = "TRUE"; }
	__Block[0] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#"; __Mode = Output; }
		__Title = Connect_Supplies;
		__TestMethod {
			__Name = LTXC::Connections;
			PinControl = __Expression { __String = "CONNECTION_ENUM:CONNECT_TO_DUT"; }
			TestPins = __Expression { __String = "ALLSUPPLIES"; }
		}
	}
	__Block[1] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#"; __Mode = Output; }
		__Title = Connect_Pins;
		__TestMethod {
			__Name = LTXC::Connections;
			PinControl = __Expression { __String = "CONNECTION_ENUM:CONNECT_TO_DUT"; }
			TestPins = __Expression { __String = "ALLPINS"; }
		}
	}
	__Block[2] = {
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#"; __Mode = Output; }
		__Title = Connect_DCRefPins;
		__TestMethod {
			__Name = LTXC::Connections;
			PinControl = __Expression { __String = "CONNECTION_ENUM:CONNECT_TO_DUT"; }
			TestPins = __Expression { __String = "DCREF_PINS"; }
		}
	}
}

/*****************************/
/*** FocusCalibration Test ***/
/*****************************/
__Test FocusCalibration {
	__Mask[0] = DCSpecsMask;
	__Mask[1] = ACSpecsMask;
	__Entry[0] = CalibrationLevels;
	__PortExpression[0] = __Expression { __String = "TRUE"; }
	__PortExpression[1] = __Expression { __String = "TRUE"; }
}



