Unison:U1.0c:S5.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/utilities.evo                                  */
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
/*** MicroFlow FFDieIDRead_MF			     	                    ***/
/******************************************************************************/
__FunctionCall FFDieIDRead_MF {}


__FunctionCall Pin2PinConty_MF {}


__FunctionCall CheckFROMPreRepair_MF {}



__FunctionCall CalcAndSendDataTW_MF {}



__FunctionCall CheckFROMPostRepair_MF {}



/*************************************************************/
/*        Microflow to program DieID : FFDieIDProg_MF        */
/*************************************************************/
__FunctionCall FFDieIDProg_MF {}



/*********************************************/
/*** IDDQ CONTINUE_PATTERNS_MF MicroFlow    */
/*********************************************/
__FunctionCall CONTINUE_PATTERNS_MF {}



/*******************************************/
/*** Iddq IddqDisconnect_PM1 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM1 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM2 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM2 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM3 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM3 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM4 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM4 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM5 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM5 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM6 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM6 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM7 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM7 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM8 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM8 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM9 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM9 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM10 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM10 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM11 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM11 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM12 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM12 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM263 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM263 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM420 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM420 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM266 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM266 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM417 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM417 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM269 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM269 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM414 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM414 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM272 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM272 {}



/*******************************************/
/*** Iddq IddqDisconnect_PM411 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM411 {}


/************************************************************************
*
* The IddqDelta_mf calls a Cadence routine.
/************************************************************************/
__FunctionCall IddqDelta_mf {}


/************************************************************************
*
* The IddqDrift_mf calls a Cadence routine.
/************************************************************************/
__FunctionCall IddqDrift_mf {}


/**************************************/
/*** Initialize_EveryUnit MicroFlow ***/
/**************************************/

__FunctionCall Initialize_EveryUnit_MF {}


/************************************************************************
* This Micro Flow is used to Initialize arrays for each Site *
/************************************************************************/
__FunctionCall Initialize_EverySite_Array_MF {}


/**************************/
/***  Delay MicroFlow   ***/
/**************************/
__FunctionCall Delay_MF {}



/***********************************************************************/
/***                                                                 ***/
/*** Start of all objects defined for the Fusion Curve Trace routine ***/
/***                                                                 ***/
/***********************************************************************/
__FunctionCall VoltageRange {}


__FunctionCall SupplyTrace {}


__FunctionCall CurveTrace {}


/**********************************************************************/
/***                                                                ***/
/***  End of all objects defined for the Fusion Curve Trace routine ***/
/***                                                                ***/
/**********************************************************************/


/***************/
/*** Trigger ***/
/***************/

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 


/***************************/
/*** CaptureTool Objects ***/
/***************************/

__WaveformCapture ALLPINS_Capture {
  __ReferenceSegment "";
  __Start "1";
  __Stop "100";
  __Pins "ALLPINS" {
	__Enable __True;
	__Merge EVW_Merge_All;
	__DriveEnable __True;
	__ResponseEnable __True;
  }
}


/************************************************************/
/*** Various microflows for easier debug with breakpoints ***/
/***   - Presented at 2001 LTX User's Conference          ***/
/************************************************************/

__FunctionCall Ev_Prompt_help {}


__FunctionCall Ev_Break_off {}

__FunctionCall Ev_Break_on {}

__FunctionCall Ev_Break_on_fail {}

__FunctionCall Ev_Break_on_trig {}


__FunctionCall Ev_Trace_off {}

__FunctionCall Ev_Trace_on {}

__FunctionCall Ev_Trace_on_fail {}

__FunctionCall Ev_Trace_on_trig {}


__FunctionCall Ev_Dlog_off {}

__FunctionCall Ev_Dlog_on {}

__FunctionCall Ev_Dlog_on_fail {}

__FunctionCall Ev_Dlog_on_trig {}


__FunctionCall Ev_Override_off {}

__FunctionCall Ev_Override_on {}

__FunctionCall Ev_Override_on_trig {}


__FunctionCall StressTimeMF {}


__Axis CharAxis_VDD_PS {
    __Title = "CharAxis_VDD_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VDD_PS.V0.Stop-CharAxis_VDD_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VDD_PS;
        __Start = __Expression { __String = "VDD_PS.Max"; }
        __Stop = __Expression { __String = "VDD_PS.Min"; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_tper {
    __Title = "CharAxis_tper";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_tper.V0.Stop-CharAxis_tper.V0.Start)/charStep_tper))"; }
    __ParameterVariance {
        __Param tper;
        __Start = __Expression { __String = "tper.Max"; }
        __Stop = __Expression { __String = "tper.Min"; }
        __PinGroup = __Expression { __String = "ALLPINS"; }
    }
}

__FunctionCall Send_HexStrTW_MF {}


__Axis CharAxis_VDDS_PS {
    __Title = "CharAxis_VDDS_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VDDS_PS.V0.Stop-CharAxis_VDDS_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VDDS_PS;
        __Start = __Expression { __String = "VDDS_PS.Max"; }
        __Stop = __Expression { __String = "VDDS_PS.Min"; }
        __PinGroup = __Expression { }
    }
}

/************************************************************************
* 
* The CharSearch_MF is where all per-thread characterization is done
* 
************************************************************************/
__FunctionCall CharSearch_MF {}


/************************************************************************
* Char_tper_MF - 
************************************************************************/
__FunctionCall Char_tper_MF {}


/************************************************************************
* Char_tperAsync_MF - 
************************************************************************/
__FunctionCall Char_tperAsync_MF {}


/************************************************************************
* Char_tfreq_MF - 
************************************************************************/
__FunctionCall Char_tfreq_MF {}


/************************************************************************
* Char_tfreqAsync_MF - 
************************************************************************/
__FunctionCall Char_tfreqAsync_MF {}


/************************************************************************
* Char_V_1_2_PS_MF - 
************************************************************************/
__FunctionCall Char_V_1_2_PS_MF {}


/************************************************************************
* Char_V_3_3_PS_MF - 
************************************************************************/
__FunctionCall Char_V_3_3_PS_MF {}


/************************************************************************
* Char_VDD_PS_MF - 
************************************************************************/
__FunctionCall Char_VDD_PS_MF {}


/************************************************************************
* Char_VDDEEPROM_PS_MF - 
************************************************************************/
__FunctionCall Char_VDDEEPROM_PS_MF {}


/************************************************************************
* Char_VDDPGM_PS_MF - 
************************************************************************/
__FunctionCall Char_VDDPGM_PS_MF {}


/************************************************************************
* Char_VNWA_PS_MF - 
************************************************************************/
__FunctionCall Char_VNWA_PS_MF {}


/************************************************************************
* Char_VDDAR_PS_MF - 
************************************************************************/
__FunctionCall Char_VDDAR_PS_MF {}


/************************************************************************
* Char_VBAT_PS_MF - 
************************************************************************/
__FunctionCall Char_VBAT_PS_MF {}


/************************************************************************
* Char_VDDS_PS_MF - 
************************************************************************/
__FunctionCall Char_VDDS_PS_MF {}


/************************************************************************
* Char_VDDA_PS_MF - 
************************************************************************/
__FunctionCall Char_VDDA_PS_MF {}


/************************************************************************
* Char_VPP_PS_MF - 
************************************************************************/
__FunctionCall Char_VPP_PS_MF {}


__FunctionCall SendBitCountTW_MF {}


__Axis CharAxis_VBAT_PS {
    __Title = "CharAxis_VBAT_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VBAT_PS.V0.Stop-CharAxis_VBAT_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VBAT_PS;
        __Start = __Expression { __String = "VBAT_PS.Max"; }
        __Stop = __Expression { __String = "VBAT_PS.Min"; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_VDDAR_PS {
    __Title = "CharAxis_VDDAR_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VDDAR_PS.V0.Stop-CharAxis_VDDAR_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VDDAR_PS;
        __Start = __Expression { __String = "VDDAR_PS.Max"; }
        __Stop = __Expression { __String = "VDDAR_PS.Min"; }
        __PinGroup = __Expression { }
    }
}

/************************************************************************
*
* The OSpinsTestware_MF is used to send fail data from OSpins Test to Testware *
/************************************************************************/
__FunctionCall OSpinsTestware_MF {}


__FunctionCall memChar_MF {}


__FunctionCall mergeBitmapsMF {}


__Axis CharAxis_VDDEEPROM_PS {
    __Title = "CharAxis_VDDEEPROM_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VDDEEPROM_PS.V0.Stop-CharAxis_VDDEEPROM_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VDDEEPROM_PS;
        __Start = __Expression { __String = "VDDEEPROM_PS.Max"; }
        __Stop = __Expression { __String = "VDDEEPROM_PS.Min"; }
        __PinGroup = __Expression { }
    }
}

__Axis FakeAxis {
    __Title = "Fake_Axis";
    __NumberSteps = __Expression { __String = "0"; }
    __ParameterVariance {
        __Param tref;
        __Start = __Expression { __String = "tref"; }
        __Stop = __Expression { __String = "tref"; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_VDDPGM_PS {
    __Title = "CharAxis_VDDPGM_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VDDPGM_PS.V0.Stop-CharAxis_VDDPGM_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VDDPGM_PS;
        __Start = __Expression { __String = "VDDPGM_PS.Max"; }
        __Stop = __Expression { __String = "VDDPGM_PS.Min"; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_V_1_2_PS {
    __Title = "CharAxis_V_1_2_PS";
    __ParameterVariance {
        __Param V_1_2_PS, VDD_PS, VDDEEPROM_PS, VDDPGM_PS, VNWA_PS, VDDAR_PS, VPP_PS;
        __Start = __Expression { __String = "V_1_2_PS.Max"; }
        __Stop = __Expression { __String = "V_1_2_PS.Min"; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_VDDA_PS {
    __Title = "CharAxis_VDDA_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VDDA_PS.V0.Stop-CharAxis_VDDA_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VDDA_PS;
        __Start = __Expression { __String = "VDDA_PS.Max"; }
        __Stop = __Expression { __String = "VDDA_PS.Min"; }
        __PinGroup = __Expression { }
    }
}

__FunctionCall calcBistBinaryStr_MF {}


/***************************************************************
** AllFailsSVM_MF
**   You can use this microflow to print out all the failing
**   vectors in a particular thread.  
** - Requires CurThread.Meas to be set to the correct Thread.
****************************************************************/
__FunctionCall AllFailsSVM_MF {}


__Axis CharAxis_VPP_PS {
    __Title = "CharAxis_VPP_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VPP_PS.V0.Stop-CharAxis_VPP_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VPP_PS;
        __Start = __Expression { __String = "VPP_PS.Max"; }
        __Stop = __Expression { __String = "VPP_PS.Min"; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_tperAsync {
    __Title = "CharAxis_tperAsync";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_tperAsync.V0.Stop-CharAxis_tperAsync.V0.Start)/charStep_tperAsync))"; }
    __ParameterVariance {
        __Param tperAsync;
        __Start = __Expression { __String = "tperAsync.Max"; }
        __Stop = __Expression { __String = "tperAsync.Min"; }
        __PinGroup = __Expression { __String = "ALLPINS"; }
    }
}

__Axis CharAxis_V_3_3_PS {
    __Title = "CharAxis_V_3_3_PS";
    __ParameterVariance {
        __Param V_3_3_PS, VBAT_PS, VDDS_PS, VDDA_PS;
        __Start = __Expression { __String = "V_3_3_PS.Max"; }
        __Stop = __Expression { __String = "V_3_3_PS.Min"; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_VNWA_PS {
    __Title = "CharAxis_VNWA_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VNWA_PS.V0.Stop-CharAxis_VNWA_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VNWA_PS;
        __Start = __Expression { __String = "VNWA_PS.Max"; }
        __Stop = __Expression { __String = "VNWA_PS.Min"; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_tfreqAsync {
    __Title = "CharAxis_tfreqAsync";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_tfreqAsync.V0.Stop-CharAxis_tfreqAsync.V0.Start)/charStep_tfreqAsync))"; }
    __ParameterVariance {
        __Param tfreqAsync;
        __Start = __Expression { __String = "tfreqAsync.Min"; }
        __Stop = __Expression { __String = "tfreqAsync.Max"; }
        __PinGroup = __Expression { __String = "ALLPINS"; }
    }
}

__Axis CharAxis_tfreq {
    __Title = "CharAxis_tfreq";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_tfreq.V0.Stop-CharAxis_tfreq.V0.Start)/charStep_tfreq))"; }
    __ParameterVariance {
        __Param tfreq;
        __Start = __Expression { __String = "tfreq.Min"; }
        __Stop = __Expression { __String = "tfreq.Max"; }
        __PinGroup = __Expression { __String = "ALLPINS"; }
    }
}

/************************************************************************
* 
* The ExecuteCharStep_MF is executed at each step of characterization searches
* 
************************************************************************/
__FunctionCall ExecuteCharStep_MF {}


/***************************************************************
** AllFailsDVM_MF
**   You can use this microflow to print out all the failing
**   vectors in a particular thread.  
**   *** To improve DVM failures, you should
**   *** have datalog set to > 2 fail vectors
**   *** as some vectors may be missed
** - Requires CurThread.Meas to be set to the correct Thread.
****************************************************************/
__FunctionCall AllFailsDVM_MF {}


__FunctionCall RemoveAllVoltageMF {}


/*************************************************************
* SetTyp_To_Meas_MF puts the typ values in the Meas field to *
* read the values when mask is set to Meas                   *
*************************************************************/
__FunctionCall SetTyp_To_Meas_MF {}



/*************************************************************
* SetSpec_To_VMin_MF puts the typ values of VMin Category    *
* in ths Meas field to read  values when mask is set to Meas *
*************************************************************/
__FunctionCall SetSpec_To_VMin_MF {}


__Axis CharAxis_SrchVdd_Vmin_ATPG_STUCK {
    __NumberSteps = __Expression { __String = "(1.18V-810mV)/12.5mV"; }
    __ParameterVariance {
        __Param VDD_PS, VDDPGM_PS, VDDAR_PS, VNWA_PS;
        __Start = __Expression { __String = "810mV"; __Type = V; }
        __Stop = __Expression { __String = "1.18V"; __Type = V; }
    }
}

__Axis CharAxis_SrchVdd_Vmin_PBIST_VBOXL {
    __NumberSteps = __Expression { __String = "(1.18V-810mV)/12.5mV"; }
    __ParameterVariance {
        __Param VDD_PS, VDDPGM_PS, VDDAR_PS, VNWA_PS;
        __Start = __Expression { __String = "810mV"; __Type = V; }
        __Stop = __Expression { __String = "1.18V"; __Type = V; }
    }
}
__Axis CharAxis_SrchVdd_Vmin_PBIST_1P {
    __NumberSteps = __Expression { __String = "(1.18V-810mV)/12.5mV"; }
    __ParameterVariance {
        __Param VDD_PS, VDDPGM_PS, VDDAR_PS, VNWA_PS;
        __Start = __Expression { __String = "810mV"; __Type = V; }
        __Stop = __Expression { __String = "1.18V"; __Type = V; }
    }
}
__Axis CharAxis_SrchVdd_Vmin_PBIST_2P {
    __NumberSteps = __Expression { __String = "(1.18V-810mV)/12.5mV"; }
    __ParameterVariance {
        __Param VDD_PS, VDDPGM_PS, VDDAR_PS, VNWA_PS;
        __Start = __Expression { __String = "810mV"; __Type = V; }
        __Stop = __Expression { __String = "1.18V"; __Type = V; }
    }
}
__Axis CharAxis_SrchVdd_Vmin_PBIST_RET {
    __NumberSteps = __Expression { __String = "(1.18V-810mV)/12.5mV"; }
    __ParameterVariance {
        __Param VDD_PS, VDDPGM_PS, VDDAR_PS, VNWA_PS;
        __Start = __Expression { __String = "810mV"; __Type = V; }
        __Stop = __Expression { __String = "1.18V"; __Type = V; }
    }
}
__Axis CharAxis_SrchVdd_Vmin_TRANSFLT_80 {
    __NumberSteps = __Expression { __String = "(1.18V-810mV)/12.5mV"; }
    __ParameterVariance {
        __Param VDD_PS, VDDPGM_PS, VDDAR_PS, VNWA_PS;
        __Start = __Expression { __String = "810mV"; __Type = V; }
        __Stop = __Expression { __String = "1.18V"; __Type = V; }
    }
}
__FunctionCall ATPG_STUCK_Srch_Fnctn {
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'SCAN_SA_PG_Thrd'"; }
}
__FunctionCall PBIST_1P_Srch_Fnctn {
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'BIST_PROD_PG_Srch_Thrd'"; }
}
__FunctionCall PBIST_2P_Srch_Fnctn {
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'PBIST_2P_PROD_PG_Srch_Thrd'"; }
}
__FunctionCall PBIST_RET_Srch_Fnctn {
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'Iddq_PM02_pb_iddq_ret_invchkr_Thrd'"; }
}
__FunctionCall PBIST_VBOXL_Srch_Fnctn {
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'VBOXLO_MEMORY_PG_Thrd'"; }
}
__FunctionCall TRANSFLT_80_Srch_Fnctn {
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_1_PG_Thrd'"; }
}
__FunctionCall BIST_PROD_Srch_Fnctn {
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_1_PG_Thrd'"; }
}
__FunctionCall FUNC_BIST_1_Srch_Fnctn {
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'BIST_PROD_PG_Thrd'"; }
}
__FunctionCall FUNC_BIST_Srch_Fnctn {
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'PBIST_2P_PROD_PG_Thrd'"; }
}
__Axis CharAxis_SrchFrq_Vmin_BIST_PROD {
    __NumberSteps = __Expression { __String = "11"; }
    __ParameterVariance {
        __Param tfreq;
        __Start = __Expression { __String = "20mHz"; __Type = Hz; }
        __Stop = __Expression { __String = "190mHz"; __Type = Hz; }
    }
}
__Axis CharAxis_SrchFrq_Vmin_FUNC_BIST {
    __NumberSteps = __Expression { __String = "36"; }
    __ParameterVariance {
        __Param tfreq;
        __Start = __Expression { __String = "20MHz"; __Type = Hz; }
        __Stop = __Expression { __String = "200MHz"; __Type = Hz; }
    }
}
__Axis CharAxis_SrchFrq_Vmin_FUNC_BIST_1 {
    __NumberSteps = __Expression { __String = "36"; }
    __ParameterVariance {
        __Param tfreq;
        __Start = __Expression { __String = "20MHz"; __Type = Hz; }
        __Stop = __Expression { __String = "200MHz"; __Type = Hz; }
    }
}
__LimitTable Blizzard_LimitTable {
    __GBSetting = __Off;
    __LimitStruct 1 {
        __LowLimit = __Expression { __String = "-5mA"; }
        __HighLimit = __Expression { __String = "5mA"; }
        __Units = "A";
        __DlogText = "SupplyShorts_Vdd";
        __FailBin = F_OS_SHRT_VDD;
        __Name = SupplyShorts_Vdd;
        __SimulateValue = __Expression { __String = "10uA"; }
    }
    __LimitStruct 2 {
        __LowLimit = __Expression { __String = "-5mA"; }
        __HighLimit = __Expression { __String = "5mA"; }
        __Units = "A";
        __DlogText = "SupplyShorts_VddA";
        __FailBin = F_OS_SHRT_VDD;
        __Name = SupplyShorts_VddA;
        __SimulateValue = __Expression { __String = "10uA"; }
    }
    __LimitStruct 3 {
        __LowLimit = __Expression { __String = "-5mA"; }
        __HighLimit = __Expression { __String = "5mA"; }
        __Units = "A";
        __DlogText = "SupplyShorts_VddAR";
        __FailBin = F_OS_SHRT_VDD;
        __Name = SupplyShorts_VddAR;
        __SimulateValue = __Expression { __String = "10uA"; }
    }
    __LimitStruct 4 {
        __LowLimit = __Expression { __String = "-5mA"; }
        __HighLimit = __Expression { __String = "5mA"; }
        __Units = "A";
        __DlogText = "SupplyShorts_VddAS";
        __FailBin = F_OS_SHRT_VDD;
        __Name = SupplyShorts_VddAS;
        __SimulateValue = __Expression { __String = "10uA"; }
    }
    __LimitStruct 5 {
        __LowLimit = __Expression { __String = "-5mA"; }
        __HighLimit = __Expression { __String = "5mA"; }
        __Units = "A";
        __DlogText = "SupplyShorts_VddNWA";
        __FailBin = F_OS_SHRT_VDD;
        __Name = SupplyShorts_VddNWA;
        __SimulateValue = __Expression { __String = "10uA"; }
    }
    __LimitStruct 0 {
    }
}
