Unison:U3.0:S5.3;

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
__FunctionCall FFDieIDRead_MF {
    __WrapCells = __True;
}


__FunctionCall Pin2PinConty_MF {
    __WrapCells = __True;
}


__FunctionCall CheckFROMPreRepair_MF {
}



__FunctionCall CalcAndSendDataTW_MF {
    __WrapCells = __True;
}



__FunctionCall CheckFROMPostRepair_MF {
    __WrapCells = __True;
}



/*************************************************************/
/*        Microflow to program DieID : FFDieIDProg_MF        */
/*************************************************************/
__FunctionCall FFDieIDProg_MF {
    __WrapCells = __True;
}



/*********************************************/
/*** IDDQ CONTINUE_PATTERNS_MF MicroFlow    */
/*********************************************/
__FunctionCall CONTINUE_PATTERNS_MF {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM1 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM1 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM2 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM2 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM3 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM3 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM4 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM4 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM5 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM5 {
}



/*******************************************/
/*** Iddq IddqDisconnect_PM6 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM6 {
}



/*******************************************/
/*** Iddq IddqDisconnect_PM7 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM7 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM8 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM8 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM9 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM9 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM10 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM10 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM11 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM11 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM12 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM12 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM263 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM263 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM420 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM420 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM266 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM266 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM417 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM417 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM269 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM269 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM414 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM414 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM272 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM272 {
    __WrapCells = __True;
}



/*******************************************/
/*** Iddq IddqDisconnect_PM411 MicroFlow     */
/*******************************************/
__FunctionCall IddqDisconnect_PM411 {
    __WrapCells = __True;
}


/************************************************************************
*
* The IddqDelta_mf calls a Cadence routine.
/************************************************************************/
__FunctionCall IddqDelta_mf {
    __WrapCells = __True;
}


/************************************************************************
*
* The IddqDrift_mf calls a Cadence routine.
/************************************************************************/
__FunctionCall IddqDrift_mf {
    __WrapCells = __True;
}


/**************************************/
/*** Initialize_EveryUnit MicroFlow ***/
/**************************************/

__FunctionCall Initialize_EveryUnit_MF {
    __WrapCells = __True;
}


/************************************************************************
* This Micro Flow is used to Initialize arrays for each Site *
/************************************************************************/
__FunctionCall Initialize_EverySite_Array_MF {
    __WrapCells = __True;
}


/**************************/
/***  Delay MicroFlow   ***/
/**************************/
__FunctionCall Delay_MF {
    __WrapCells = __True;
}



/***********************************************************************/
/***                                                                 ***/
/*** Start of all objects defined for the Fusion Curve Trace routine ***/
/***                                                                 ***/
/***********************************************************************/
__FunctionCall VoltageRange {
    __WrapCells = __True;
}


__FunctionCall SupplyTrace {
    __WrapCells = __True;
}


__FunctionCall CurveTrace {
    __WrapCells = __True;
}


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
  __Start "7980";
  __Stop "10";
  __Resolution "1.5nS";
  __Pins "ALLPINS-FLTP2-AIN04_193" {
	__Merge EVW_Merge_All;
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
  __Pins "RST_n_122+TCK_152+TDI_150+TDO_149+TMS_151+o_cpu_done_46+o_cpu_fail_47+OSC0_124+PA3_49+PA4_50+AIN10_183+PB6_10+PB0_129+ScanHeader2_PL" {
	__Merge EVW_Merge_Unmerged;
	__DriveSize "7";
	__ResponseSize "7";
	__ScopeDriveSize "7";
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
  __Pins "PF3_91" {
	__Bus __True;
	__Merge EVW_Merge_Unmerged;
	__DriveEnable __True;
	__DriveSize "7";
	__ResponseSize "7";
	__ScopeEnable __True;
	__ScopeDriveSize "7";
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
  __Pins "TRD0_90" {
	__Bus __True;
	__Merge EVW_Merge_Unmerged;
	__DriveEnable __True;
	__DriveSize "7";
	__ResponseSize "7";
	__ScopeEnable __True;
	__ScopeDriveSize "7";
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
  __Pins "TRD1_89" {
	__Bus __True;
	__Merge EVW_Merge_Unmerged;
	__DriveEnable __True;
	__DriveSize "7";
	__ResponseSize "7";
	__ScopeEnable __True;
	__ScopeDriveSize "7";
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
  __Pins "TRD2_88" {
	__Bus __True;
	__Merge EVW_Merge_Unmerged;
	__DriveEnable __True;
	__DriveSize "7";
	__ResponseSize "7";
	__ScopeEnable __True;
	__ScopeDriveSize "7";
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
  __Pins "TRD3_87" {
	__Bus __True;
	__Merge EVW_Merge_Unmerged;
	__DriveEnable __True;
	__DriveSize "7";
	__ResponseSize "7";
	__ScopeEnable __True;
	__ScopeDriveSize "7";
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
  __Pins "C0_n_42" {
	__Enable __True;
	__Bus __True;
	__Merge EVW_Merge_Unmerged;
	__DriveEnable __True;
	__DriveSize "7";
	__ResponseSize "7";
	__ScopeEnable __True;
	__ScopeDriveSize "7";
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
  __Pins "C0_p_43" {
	__Enable __True;
	__Bus __True;
	__Merge EVW_Merge_Unmerged;
	__DriveEnable __True;
	__DriveSize "7";
	__ResponseSize "7";
	__ScopeEnable __True;
	__ScopeDriveSize "7";
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
  __Pins "C1_p_44" {
	__Enable __True;
	__Bus __True;
	__Merge EVW_Merge_Unmerged;
	__DriveEnable __True;
	__DriveSize "7";
	__ResponseSize "7";
	__ScopeEnable __True;
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
  __Pins "C1_n_45" {
	__Enable __True;
	__Bus __True;
	__Merge EVW_Merge_Unmerged;
	__DriveEnable __True;
	__DriveSize "7";
	__ResponseSize "7";
	__ScopeEnable __True;
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
}


/************************************************************/
/*** Various microflows for easier debug with breakpoints ***/
/***   - Presented at 2001 LTX User's Conference          ***/
/************************************************************/

__FunctionCall Ev_Prompt_help {
    __WrapCells = __True;
}


__FunctionCall Ev_Break_off {
    __WrapCells = __True;
}

__FunctionCall Ev_Break_on {
    __WrapCells = __True;
}

__FunctionCall Ev_Break_on_fail {
}

__FunctionCall Ev_Break_on_trig {
    __WrapCells = __True;
}


__FunctionCall Ev_Trace_off {
    __WrapCells = __True;
}

__FunctionCall Ev_Trace_on {
    __WrapCells = __True;
}

__FunctionCall Ev_Trace_on_fail {
}

__FunctionCall Ev_Trace_on_trig {
    __WrapCells = __True;
}


__FunctionCall Ev_Dlog_off {
    __WrapCells = __True;
}

__FunctionCall Ev_Dlog_on {
    __WrapCells = __True;
}

__FunctionCall Ev_Dlog_on_fail {
}

__FunctionCall Ev_Dlog_on_trig {
    __WrapCells = __True;
}


__FunctionCall Ev_Override_off {
    __WrapCells = __True;
}

__FunctionCall Ev_Override_on {
    __WrapCells = __True;
}

__FunctionCall Ev_Override_on_trig {
    __WrapCells = __True;
}


__FunctionCall StressTimeMF {
    __WrapCells = __True;
}


__Axis CharAxis_VDD_PS {
    __Title = "CharAxis_VDD_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VDD_PS.V0.Stop-CharAxis_VDD_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VDD_PS;
        __Start = __Expression { __String = "VDD_PS.Max"; __Type = V; }
        __Stop = __Expression { __String = "VDD_PS.Min"; __Type = V; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_tper {
    __Title = "CharAxis_tper";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_tper.V0.Stop-CharAxis_tper.V0.Start)/charStep_tper))"; }
    __ParameterVariance {
        __Param tper;
        __Start = __Expression { __String = "tper.Max"; __Type = s; }
        __Stop = __Expression { __String = "tper.Min"; __Type = s; }
        __PinGroup = __Expression { __String = "ALLPINS"; }
    }
}

__FunctionCall Send_HexStrTW_MF {
    __WrapCells = __True;
}


__Axis CharAxis_VDDS_PS {
    __Title = "CharAxis_VDDS_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VDDS_PS.V0.Stop-CharAxis_VDDS_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VDDS_PS;
        __Start = __Expression { __String = "VDDS_PS.Max"; __Type = V; }
        __Stop = __Expression { __String = "VDDS_PS.Min"; __Type = V; }
        __PinGroup = __Expression { }
    }
}

/************************************************************************
* 
* The CharSearch_MF is where all per-thread characterization is done
* 
************************************************************************/
__FunctionCall CharSearch_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_tper_MF - 
************************************************************************/
__FunctionCall Char_tper_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_tperAsync_MF - 
************************************************************************/
__FunctionCall Char_tperAsync_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_tfreq_MF - 
************************************************************************/
__FunctionCall Char_tfreq_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_tfreqAsync_MF - 
************************************************************************/
__FunctionCall Char_tfreqAsync_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_V_1_2_PS_MF - 
************************************************************************/
__FunctionCall Char_V_1_2_PS_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_V_3_3_PS_MF - 
************************************************************************/
__FunctionCall Char_V_3_3_PS_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_VDD_PS_MF - 
************************************************************************/
__FunctionCall Char_VDD_PS_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_VDDEEPROM_PS_MF - 
************************************************************************/
__FunctionCall Char_VDDEEPROM_PS_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_VDDPGM_PS_MF - 
************************************************************************/
__FunctionCall Char_VDDPGM_PS_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_VNWA_PS_MF - 
************************************************************************/
__FunctionCall Char_VNWA_PS_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_VDDAR_PS_MF - 
************************************************************************/
__FunctionCall Char_VDDAR_PS_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_VBAT_PS_MF - 
************************************************************************/
__FunctionCall Char_VBAT_PS_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_VDDS_PS_MF - 
************************************************************************/
__FunctionCall Char_VDDS_PS_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_VDDA_PS_MF - 
************************************************************************/
__FunctionCall Char_VDDA_PS_MF {
    __WrapCells = __True;
}


/************************************************************************
* Char_VPP_PS_MF - 
************************************************************************/
__FunctionCall Char_VPP_PS_MF {
    __WrapCells = __True;
}


__FunctionCall SendBitCountTW_MF {
    __WrapCells = __True;
}


__Axis CharAxis_VBAT_PS {
    __Title = "CharAxis_VBAT_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VBAT_PS.V0.Stop-CharAxis_VBAT_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VBAT_PS;
        __Start = __Expression { __String = "VBAT_PS.Max"; __Type = V; }
        __Stop = __Expression { __String = "VBAT_PS.Min"; __Type = V; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_VDDAR_PS {
    __Title = "CharAxis_VDDAR_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VDDAR_PS.V0.Stop-CharAxis_VDDAR_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VDDAR_PS;
        __Start = __Expression { __String = "VDDAR_PS.Max"; __Type = V; }
        __Stop = __Expression { __String = "VDDAR_PS.Min"; __Type = V; }
        __PinGroup = __Expression { }
    }
}

/************************************************************************
*
* The OSpinsTestware_MF is used to send fail data from OSpins Test to Testware *
/************************************************************************/
__FunctionCall OSpinsTestware_MF {
    __WrapCells = __True;
}


__FunctionCall memChar_MF {
    __WrapCells = __True;
}


__FunctionCall mergeBitmapsMF {
    __WrapCells = __True;
}


__Axis CharAxis_VDDEEPROM_PS {
    __Title = "CharAxis_VDDEEPROM_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VDDEEPROM_PS.V0.Stop-CharAxis_VDDEEPROM_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VDDEEPROM_PS;
        __Start = __Expression { __String = "VDDEEPROM_PS.Max"; __Type = V; }
        __Stop = __Expression { __String = "VDDEEPROM_PS.Min"; __Type = V; }
        __PinGroup = __Expression { }
    }
}

__Axis FakeAxis {
    __Title = "Fake_Axis";
    __NumberSteps = __Expression { __String = "0"; }
    __ParameterVariance {
        __Param tref;
        __Start = __Expression { __String = "tref"; __Type = s; }
        __Stop = __Expression { __String = "tref"; __Type = s; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_VDDPGM_PS {
    __Title = "CharAxis_VDDPGM_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VDDPGM_PS.V0.Stop-CharAxis_VDDPGM_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VDDPGM_PS;
        __Start = __Expression { __String = "VDDPGM_PS.Max"; __Type = V; }
        __Stop = __Expression { __String = "VDDPGM_PS.Min"; __Type = V; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_V_1_2_PS {
    __Title = "CharAxis_V_1_2_PS";
    __NumberSteps = __Expression { __String = "1"; }
    __ParameterVariance {
        __Param V_1_2_PS, VDD_PS, VDDEEPROM_PS, VDDPGM_PS, VNWA_PS, VDDAR_PS, VPP_PS;
        __Start = __Expression { __String = "V_1_2_PS.Max"; __Type = V; }
        __Stop = __Expression { __String = "V_1_2_PS.Min"; __Type = V; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_VDDA_PS {
    __Title = "CharAxis_VDDA_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VDDA_PS.V0.Stop-CharAxis_VDDA_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VDDA_PS;
        __Start = __Expression { __String = "VDDA_PS.Max"; __Type = V; }
        __Stop = __Expression { __String = "VDDA_PS.Min"; __Type = V; }
        __PinGroup = __Expression { }
    }
}

__FunctionCall calcBistBinaryStr_MF {
    __WrapCells = __True;
}


/***************************************************************
** AllFailsSVM_MF
**   You can use this microflow to print out all the failing
**   vectors in a particular thread.  
** - Requires CurThread.Meas to be set to the correct Thread.
****************************************************************/
__FunctionCall AllFailsSVM_MF {
    __WrapCells = __True;
}


__Axis CharAxis_VPP_PS {
    __Title = "CharAxis_VPP_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VPP_PS.V0.Stop-CharAxis_VPP_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VPP_PS;
        __Start = __Expression { __String = "VPP_PS.Max"; __Type = V; }
        __Stop = __Expression { __String = "VPP_PS.Min"; __Type = V; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_tperAsync {
    __Title = "CharAxis_tperAsync";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_tperAsync.V0.Stop-CharAxis_tperAsync.V0.Start)/charStep_tperAsync))"; }
    __ParameterVariance {
        __Param tperAsync;
        __Start = __Expression { __String = "tperAsync.Max"; __Type = s; }
        __Stop = __Expression { __String = "tperAsync.Min"; __Type = s; }
        __PinGroup = __Expression { __String = "ALLPINS"; }
    }
}

__Axis CharAxis_V_3_3_PS {
    __Title = "CharAxis_V_3_3_PS";
    __NumberSteps = __Expression { __String = "1"; }
    __ParameterVariance {
        __Param V_3_3_PS, VBAT_PS, VDDS_PS, VDDA_PS;
        __Start = __Expression { __String = "V_3_3_PS.Max"; __Type = V; }
        __Stop = __Expression { __String = "V_3_3_PS.Min"; __Type = V; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_VNWA_PS {
    __Title = "CharAxis_VNWA_PS";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_VNWA_PS.V0.Stop-CharAxis_VNWA_PS.V0.Start)/CharVoltageStep))"; }
    __ParameterVariance {
        __Param VNWA_PS;
        __Start = __Expression { __String = "VNWA_PS.Max"; __Type = V; }
        __Stop = __Expression { __String = "VNWA_PS.Min"; __Type = V; }
        __PinGroup = __Expression { }
    }
}

__Axis CharAxis_tfreqAsync {
    __Title = "CharAxis_tfreqAsync";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_tfreqAsync.V0.Stop-CharAxis_tfreqAsync.V0.Start)/charStep_tfreqAsync))"; }
    __ParameterVariance {
        __Param tfreqAsync;
        __Start = __Expression { __String = "tfreqAsync.Min"; __Type = Hz; }
        __Stop = __Expression { __String = "tfreqAsync.Max"; __Type = Hz; }
        __PinGroup = __Expression { __String = "ALLPINS"; }
    }
}

__Axis CharAxis_tfreq {
    __Title = "CharAxis_tfreq";
    __NumberSteps = __Expression { __String = "floor(fabs((CharAxis_tfreq.V0.Stop-CharAxis_tfreq.V0.Start)/charStep_tfreq))"; }
    __ParameterVariance {
        __Param tfreq;
        __Start = __Expression { __String = "tfreq.Min"; __Type = Hz; }
        __Stop = __Expression { __String = "tfreq.Max"; __Type = Hz; }
        __PinGroup = __Expression { __String = "ALLPINS"; }
    }
}

/************************************************************************
* 
* The ExecuteCharStep_MF is executed at each step of characterization searches
* 
************************************************************************/
__FunctionCall ExecuteCharStep_MF {
    __WrapCells = __True;
}


/***************************************************************
** AllFailsDVM_MF
**   You can use this microflow to print out all the failing
**   vectors in a particular thread.  
**   *** To improve DVM failures, you should
**   *** have datalog set to > 2 fail vectors
**   *** as some vectors may be missed
** - Requires CurThread.Meas to be set to the correct Thread.
****************************************************************/
__FunctionCall AllFailsDVM_MF {
    __WrapCells = __True;
}


__FunctionCall RemoveAllVoltageMF {
}


/*************************************************************
* SetTyp_To_Meas_MF puts the typ values in the Meas field to *
* read the values when mask is set to Meas                   *
*************************************************************/
__FunctionCall SetTyp_To_Meas_MF {
}



/*************************************************************
* SetSpec_To_VMin_MF puts the typ values of VMin Category    *
* in ths Meas field to read  values when mask is set to Meas *
*************************************************************/
__FunctionCall SetSpec_To_VMin_MF {
    __WrapCells = __True;
}


__Axis CharAxis_SrchVdd_Vmin_ATPG_STUCK {
    __NumberSteps = __Expression { __String = "(1.18V-700mV)/12.5mV"; }
    __ParameterVariance {
        __Param VDD_PS, VDDPGM_PS, VDDAR_PS, VNWA_PS;
        __Start = __Expression { __String = "1.2mV"; __Type = V; }
        __Stop = __Expression { __String = "700mV"; __Type = V; }
        __PinGroup = __Expression { __String = "VDD+VDDPGM+VDDAR+VNWA"; }
    }
}

__Axis CharAxis_SrchVdd_Vmin_PBIST_VBOXL {
    __NumberSteps = __Expression { __String = "30"; }
    __ParameterVariance {
        __Param VDD_PS, VDDPGM_PS, VDDAR_PS, VNWA_PS;
        __Start = __Expression { __String = "600mV {810mV}"; __Type = V; }
        __Stop = __Expression { __String = "1.18V"; __Type = V; }
        __PinGroup = __Expression { __String = "VDD+VDDPGM+VDDAR+VNWA"; }
    }
}
__Axis CharAxis_SrchVdd_Vmin_PBIST_1P {
    __NumberSteps = __Expression { __String = "(1.18V-600mV)/12.5mV"; }
    __ParameterVariance {
        __Param VDD_PS, VDDPGM_PS, VDDAR_PS, VNWA_PS;
        __Start = __Expression { __String = "600mV"; __Type = V; }
        __Stop = __Expression { __String = "1.18V"; __Type = V; }
        __PinGroup = __Expression { __String = "VDD+VDDPGM+VDDAR+VNWA"; }
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
    __WrapCells = __True;
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'a_st_tk_1_v22_Thrd'"; }
}
__FunctionCall PBIST_1P_Srch_Fnctn {
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'BIST_PROD_PG_Srch_Thrd'"; }
}
__FunctionCall PBIST_2P_Srch_Fnctn {
    __WrapCells = __True;
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'PBIST_2P_PROD_PG_Srch_Thrd'"; }
}
__FunctionCall PBIST_RET_Srch_Fnctn {
    __WrapCells = __True;
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'Iddq_PM02_pb_iddq_ret_invchkr_Thrd'"; }
}
__FunctionCall PBIST_VBOXL_Srch_Fnctn {
    __WrapCells = __True;
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'BIST_PROD_PGDB_Thrd'"; }
}
__FunctionCall TRANSFLT_80_Srch_Fnctn {
    __WrapCells = __True;
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_1_PG_Thrd'"; }
}
__FunctionCall BIST_PROD_Srch_Fnctn {
    __WrapCells = __True;
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'SCAN_PATHDELAY_1_PG_Thrd'"; }
}
__FunctionCall FUNC_BIST_1_Srch_Fnctn {
    __WrapCells = __True;
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'BIST_PROD_PG_Srch_Thrd'"; }
}
__FunctionCall FUNC_BIST_Srch_Fnctn {
    __WrapCells = __True;
    __Function = LTXC::SearchStepPatterns;
    TestPatterns = __Expression { __String = "'PBIST_2P_PROD_PG_Srch_Thrd'"; }
}
__FunctionCall Clear_CPU_Flag {
    __WrapCells = __True;
    __Function = ClearCPUFlag;
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
    __NumberSteps = __Expression { __String = "30"; }
    __ParameterVariance {
        __Param Srch_tper;
        __Start = __Expression { __String = "21ns"; __Type = s; }
        __Stop = __Expression { __String = "10ns"; __Type = s; }
        __PinGroup = __Expression { __String = "DSH_PL"; }
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
    __LimitStruct 6 {
        __LowLimit = __Expression { __String = "-1V"; }
        __HighLimit = __Expression { }
        __Units = "V";
        __DlogText = "DigCont_AllDigPins_Open";
        __FailBin = F_OS_OPEN;
        __Name = DigCont_AllDigPins_Open;
        __SimulateValue = __Expression { __String = "-750mV"; }
    }
    __LimitStruct 7 {
        __LowLimit = __Expression { __String = "-1V"; }
        __HighLimit = __Expression { }
        __Units = "V";
        __DlogText = "DigCont_DigEvenPins_Open";
        __FailBin = F_OS_OPEN;
        __Name = DigCont_DigEvenPins_Open;
        __SimulateValue = __Expression { __String = "-750mV"; }
    }
    __LimitStruct 8 {
        __LowLimit = __Expression { __String = "-1V"; }
        __HighLimit = __Expression { }
        __Units = "V";
        __DlogText = "DigCont_DigOddPins_Open";
        __FailBin = F_OS_OPEN;
        __Name = DigCont_DigOddPins_Open;
        __SimulateValue = __Expression { __String = "-750mV"; }
    }
    __LimitStruct 9 {
        __HighLimit = __Expression { __String = "-.1V"; }
        __DlogText = "DigCont_AllDigPins_Short";
        __FailBin = F_OS_SHRT_PIN;
        __Name = DigCont_AllDigPins_Short;
        __SimulateValue = __Expression { __String = "-750mV"; }
    }
    __LimitStruct 10 {
        __HighLimit = __Expression { __String = "-.1V"; }
        __DlogText = "DigCont_DigEvenPins_Short";
        __FailBin = F_OS_SHRT_PIN;
        __Name = DigCont_DigEvenPins_Short;
        __SimulateValue = __Expression { __String = "-750mV"; }
    }
    __LimitStruct 11 {
        __HighLimit = __Expression { __String = "-.1V"; }
        __DlogText = "DigCont_DigOddPins_Short";
        __FailBin = F_OS_SHRT_PIN;
        __Name = DigCont_DigOddPins_Short;
        __SimulateValue = __Expression { __String = "-750mV"; }
    }
}
__GraphicalDebug Bliz_GDT {
    __Row "VI_HDVI" { 
        "ALLSUPPLIES+AnalogPower_Pins+DCREF_Pins"; 
    } 
    __Row "VI_DPS16" { 
        "ALLSUPPLIES+AnalogPower_Pins+DCREF_Pins"; 
    } 
}


__PatternSequence SPD_1_debug {
    __Thread[0] = a_tft_tk_80_80_1_Thrd;
    __Thread[1] = a_tft_tk_80_80_2_Thrd;
    __Thread[2] = a_tft_tk_80_80_3_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT7 = { WFT7 } }
    }
    __AutoBasePeriod = __True;
}
__Test SCAN_PATHDELAY_1_DBG_PG {
    __Mask[0] = ACSpecsMask;
    __Mask[1] = DCSpecsMask;
    __Mask[2] = PSSpecsMask;
    __Entry[0] = DCsetup_Loose;
    __Entry[1] = SPD_1_debug;
    __PortExpression[0] = __Expression { __String = ".Result = TM_RESULT:TM_PASS"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = a_tft_tk_80_80_1;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_1_Thrd'"; }
            MinorID = __Expression { __String = "0"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[1] = {
        __Title = a_tft_tk_80_80_2;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_2_Thrd'"; }
            MinorID = __Expression { __String = "10"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[2] = {
        __Title = a_tft_tk_80_80_3;
        __WrapCells = __True;
        __ContinueOnFail = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = TWFuncTest;
            TestPins = __Expression { __String = "DSH_PL"; }
            TestMode = __Expression { __String = "FUNC_MODE_ENUM:SETUP_AND_EXECUTE"; }
            TestPatterns = __Expression { __String = "'a_tft_tk_80_80_3_Thrd'"; }
            MinorID = __Expression { __String = "20"; }
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            DisablePatternDatalog = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
            FailBin = __Expression { __String = "'F_FUNC_PDELAY_VMIN'"; }
            use_testware = __Expression { __String = "TRUE"; }
            testware_datatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
}
//__FunctionCall DisconnectOpenPinList {
//    __Function = disconnect_digital_pins;
//    disconnect_pins = __Expression { __String = "IDDQ_a_iddq_PM1"; }
//}
__FunctionCall PowerCycleVmask_FC {
    __Function = CyclePower;
    powerDownLevels1 = __Expression { __String = "&DCsetup_ZeroPins_ZeroSupplies_RampDown"; }
    powerDownDelay = __Expression { __String = "5ms"; }
    powerUpLevels1 = __Expression { __String = "&PowerUpAtVmask"; }
    powerUpLevels2 = __Expression { __String = "&DCsetup_LooseVmask"; }
}
__FunctionCall ConnectOpenPinList {
    __Function = connect_digital_pins;
    connect_pins = __Expression { __String = "IDDQ_a_iddq_PM1"; }
}
__FunctionCall DisconnectOpenPinList {
    __Function = disconnect_digital_pins;
    disconnect_pins = __Expression { __String = "IDDQ_a_iddq_PM1"; }
}
__FunctionCall CGS_Leak_Vmax_Fn {
    __Function = CGS_Leak_Vmax_func;
}
__FunctionCall EGCG_Leak_Vmax_Fn {
}
__FunctionCall EGCSS_Leak_Vmax_Fn {
    __Function = EGCSS_Leak_Vmax_func;
}
__FunctionCall EGS_Leak_Vmax_Fn {
    __Function = EGS_Leak_Vmax_func;
}
__FunctionCall Pump_Leak_Vmax_Fn {
    __Function = Pump_Leak_Vmax_func;
}
