Unison:U1.0c:S5.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/dctable.evo                                    */
/* Creation Date  : Tue Jan  3 17:12:18 2012                                  */
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

/****************************************************/
/*** ZeroPins_ZeroSupplies_RampDown Levels Object ***/
/****************************************************/
__Levels DCsetup_ZeroPins_ZeroSupplies_RampDown {
    __Column[0] {
    	__LevelsColumnType = __DigitalType;
    	__Title = SetPins_ZeroLevels;
    	__Group = __Expression { __String = "ALLPINS"; }
    	ExecSeq = __Expression { __String = "0"; }
    	Vil = __Expression { __String = "0V"; }
    	Vih = __Expression { __String = "0V"; }
    	Vol = __Expression { __String = "0V"; }
    	Voh = __Expression { __String = "0V"; }
    	Iol = __Expression { __String = "10mA"; }
    	Ioh = __Expression { __String = "-10mA"; }
    	Vref = __Expression { __String = "0V"; }
    }
    __Column[1] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "1"; }
    	__ForceValue = __Expression { __String = "0V"; }
    	__ForceRange = __Expression { __String = "0V"; }
    }
    __Column[2] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "4"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[3] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "4"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[4] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "3"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[5] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "3"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[6] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "2"; }
    	__ForceValue = __Expression { __String = "0V"; }
    	__ForceRange = __Expression { __String = "0V"; }
    }
    __Column[7] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	__ForceValue = __Expression { __String = "0V"; }
    	__ForceRange = __Expression { __String = "0V"; }
    }
    __Column[8] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VDDEEPROM"; }
    	ExecSeq = __Expression { __String = "2"; }
    	__ForceValue = __Expression { __String = "0V"; }
    	__ForceRange = __Expression { __String = "0V"; }
    }
    __Column[9] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "2"; }
    	__ForceValue = __Expression { __String = "0V"; }
    	__ForceRange = __Expression { __String = "0V"; }
    }
}

/**************************************/
/* DCsetup_allZero                    */
/**************************************/
__Levels DCsetup_allZero {
    __Column[0] {
    	__LevelsColumnType = __DigitalType;
    	__Title = SetPins_ZeroLevels;
    	__Group = __Expression { __String = "ALLPINS"; }
    	ExecSeq = __Expression { __String = "0"; }
    	Vil = __Expression { __String = "0V"; }
    	Vih = __Expression { __String = "0V"; }
    	Vol = __Expression { __String = "0V"; }
    	Voh = __Expression { __String = "0V"; }
    	Iol = __Expression { __String = "0mA"; }
    	Ioh = __Expression { __String = "-0mA"; }
    	Vref = __Expression { __String = "0V"; }
    }
    __Column[1] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[2] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDDAR_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[3] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDS_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[4] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[5] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VDDPGM_PS"; }
    	__ForceRange = __Expression { __String = "VDDPGM_PS"; }
    }
    __Column[6] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VDDEEPROM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VDDEEPROM_PS"; }
    	__ForceRange = __Expression { __String = "VDDEEPROM_PS"; }
    }
    __Column[7] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VNWA_PS"; }
    	__ForceRange = __Expression { __String = "VNWA_PS"; }
    }
    __Column[8] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VPP_PS"; }
    	__ForceRange = __Expression { __String = "VPP_PS"; }
    }
    __Column[9] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "4"; }
    	__ForceValue = __Expression { __String = "VBAT_PS"; }
    	__ForceRange = __Expression { __String = "VBAT_PS"; }
    }
    __Column[10] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "ALLPINS"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "dcZeroVoltage"; }
    	Vih = __Expression { __String = "dcZeroVoltage"; }
    	Vol = __Expression { __String = "dcZeroVoltage"; }
    	Voh = __Expression { __String = "dcZeroVoltage"; }
    	Iol = __Expression { __String = "10mA"; }
    	Ioh = __Expression { __String = "-10mA"; }
    	Vref = __Expression { __String = "dcZeroVoltage"; }
    }
}

/**************************************/
/* DCsetup_Iddq                       */
/**************************************/
__Levels DCsetup_Iddq {
    __Column[0] {
    	__LevelsColumnType = __DigitalType;
    	__Title = SetPins_ZeroLevels;
    	__Group = __Expression { __String = "ALLPINS"; }
    	ExecSeq = __Expression { __String = "0"; }
    	Vil = __Expression { __String = "0V"; }
    	Vih = __Expression { __String = "0V"; }
    	Vol = __Expression { __String = "0V"; }
    	Voh = __Expression { __String = "0V"; }
    	Iol = __Expression { __String = "0mA"; }
    	Ioh = __Expression { __String = "-0mA"; }
    	Vref = __Expression { __String = "0V"; }
    }
    __Column[1] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[2] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDDAR_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[3] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDS_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[4] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[5] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VDDPGM_PS"; }
    	__ForceRange = __Expression { __String = "VDDPGM_PS"; }
    }
    __Column[6] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VDDEEPROM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VDDEEPROM_PS"; }
    	__ForceRange = __Expression { __String = "VDDEEPROM_PS"; }
    }
    __Column[7] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VNWA_PS"; }
    	__ForceRange = __Expression { __String = "VNWA_PS"; }
    }
    __Column[8] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VPP_PS"; }
    	__ForceRange = __Expression { __String = "VPP_PS"; }
    }
    __Column[9] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "4"; }
    	__ForceValue = __Expression { __String = "VBAT_PS"; }
    	__ForceRange = __Expression { __String = "VBAT_PS"; }
    }
    __Column[10] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_CMOS"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_CMOS"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[11] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IN_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_OSC"; }
    	Vol = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_OSC)-0.05*(VIH_Iddq_OSC-VIL_Iddq) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_OSC)+0.05*(VIH_Iddq_OSC-VIL_Iddq) {for debug in capture tool}"; }
    }
    __Column[12] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[13] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IN_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_SPFUN"; }
    	Vol = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_SPFUN)-0.05*(VIH_Iddq_SPFUN-VIL_Iddq) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_SPFUN)+0.05*(VIH_Iddq_SPFUN-VIL_Iddq) {for debug in capture tool}"; }
    }
    __Column[14] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_SPFUN"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[15] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[16] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_TTL"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_TTL"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[17] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_WIRE"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_WIRE"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
}

/**************************************/
/* DCsetup_Iddq_PostExecution         */
/**************************************/
__Levels DCsetup_Iddq_PostExecution {
    __Column[0] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "6-1"; }
    	PowerSupply = __Expression { __String = "VDD_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[1] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "6-1"; }
    	PowerSupply = __Expression { __String = "VDDAR_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[2] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "6-2"; }
    	PowerSupply = __Expression { __String = "VDDS_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[3] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "6-2"; }
    	PowerSupply = __Expression { __String = "VDDA_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[4] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "6-3"; }
    	__ForceValue = __Expression { __String = "VDDPGM_PS"; }
    	__ForceRange = __Expression { __String = "VDDPGM_PS"; }
    }
    __Column[5] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VDDEEPROM"; }
    	ExecSeq = __Expression { __String = "6-3"; }
    	__ForceValue = __Expression { __String = "VDDEEPROM_PS"; }
    	__ForceRange = __Expression { __String = "VDDEEPROM_PS"; }
    }
    __Column[6] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "6-3"; }
    	__ForceValue = __Expression { __String = "VNWA_PS"; }
    	__ForceRange = __Expression { __String = "VNWA_PS"; }
    }
    __Column[7] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "6-3"; }
    	__ForceValue = __Expression { __String = "VPP_PS"; }
    	__ForceRange = __Expression { __String = "VPP_PS"; }
    }
    __Column[8] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "6-4"; }
    	__ForceValue = __Expression { __String = "VBAT_PS"; }
    	__ForceRange = __Expression { __String = "VBAT_PS"; }
    }
    __Column[9] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_CMOS"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_CMOS"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[10] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IN_OSC"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_OSC"; }
    	Vol = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_OSC)-0.05*(VIH_Iddq_OSC-VIL_Iddq) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_OSC)+0.05*(VIH_Iddq_OSC-VIL_Iddq) {for debug in capture tool}"; }
    }
    __Column[11] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_OSC"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[12] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IN_SPFUN"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_SPFUN"; }
    	Vol = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_SPFUN)-0.05*(VIH_Iddq_SPFUN-VIL_Iddq) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_SPFUN)+0.05*(VIH_Iddq_SPFUN-VIL_Iddq) {for debug in capture tool}"; }
    }
    __Column[13] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_SPFUN"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_SPFUN"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[14] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_SPFUN"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[15] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_TTL"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_TTL"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[16] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_WIRE"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_WIRE"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
}

/**************************************/
/* DCsetup_Loose                      */
/**************************************/
__Levels DCsetup_Loose {
    __Column[0] {
    	__LevelsColumnType = __DigitalType;
    	__Title = SetPins_ZeroLevels;
    	__Group = __Expression { __String = "ALLPINS"; }
    	ExecSeq = __Expression { __String = "0"; }
    	Vil = __Expression { __String = "0V"; }
    	Vih = __Expression { __String = "0V"; }
    	Vol = __Expression { __String = "0V"; }
    	Voh = __Expression { __String = "0V"; }
    	Iol = __Expression { __String = "0mA"; }
    	Ioh = __Expression { __String = "-0mA"; }
    	Vref = __Expression { __String = "0V"; }
    }
    __Column[1] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[2] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDDAR_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[3] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDS_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[4] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[5] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VDDPGM_PS"; }
    	__ForceRange = __Expression { __String = "VDDPGM_PS"; }
    }
    __Column[6] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VDDEEPROM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VDDEEPROM_PS"; }
    	__ForceRange = __Expression { __String = "VDDEEPROM_PS"; }
    }
    __Column[7] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VNWA_PS"; }
    	__ForceRange = __Expression { __String = "VNWA_PS"; }
    }
    __Column[8] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VPP_PS"; }
    	__ForceRange = __Expression { __String = "VPP_PS"; }
    }
    __Column[9] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VREFAP"; }
    	__ForceValue = __Expression { __String = "3.0V"; }
    	__ForceRange = __Expression { __String = "3.0V"; }
    }
    __Column[10] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "4"; }
    	__ForceValue = __Expression { __String = "VBAT_PS"; }
    	__ForceRange = __Expression { __String = "VBAT_PS"; }
    }
    __Column[11] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_CMOS"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[12] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IN_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)-0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)+0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    }
    __Column[13] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[14] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IN_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)-0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)+0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    }
    __Column[15] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[16] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[17] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_TTL"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[18] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_WIRE"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
}

/***************************************/
/*** CalibrationLevels Levels Object ***/
/***************************************/
__Levels CalibrationLevels {
    __Column[0] {
    	__LevelsColumnType = __DigitalType;
    	__Title = SetPins_ZeroLevels;
    	__Group = __Expression { __String = "CALPINS"; }
    	ExecSeq = __Expression { __String = "0"; }
    	Vil = __Expression { __String = "0V"; }
    	Vih = __Expression { __String = "0V"; }
    	Vol = __Expression { __String = "0V"; }
    	Voh = __Expression { __String = "0V"; }
    	Iol = __Expression { __String = "0mA"; }
    	Ioh = __Expression { __String = "-0mA"; }
    	Vref = __Expression { __String = "0V"; }
    }
    __Column[1] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_CMOS"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "iolCal"; }
    	Ioh = __Expression { __String = "iohCal"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[2] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IN_OSC"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)-0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)+0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    }
    __Column[3] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_OSC"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VOL_Loose"; }
    	Vih = __Expression { __String = "VOH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "iolCal"; }
    	Ioh = __Expression { __String = "iohCal"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[4] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IN_SPFUN"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)-0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)+0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    }
    __Column[5] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_SPFUN"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "iolCal"; }
    	Ioh = __Expression { __String = "iohCal"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[6] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_SPFUN"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VOL_Loose"; }
    	Vih = __Expression { __String = "VOH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "iolCal"; }
    	Ioh = __Expression { __String = "iohCal"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[7] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_TTL"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "iolCal"; }
    	Ioh = __Expression { __String = "iohCal"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[8] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_WIRE"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "iolCal"; }
    	Ioh = __Expression { __String = "iohCal"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
}

/**************************************/
/* DCsetup_Spec                       */
/**************************************/
__Levels DCsetup_Spec {
    __Column[0] {
    	__LevelsColumnType = __DigitalType;
    	__Title = SetPins_ZeroLevels;
    	__Group = __Expression { __String = "ALLPINS"; }
    	ExecSeq = __Expression { __String = "0"; }
    	Vil = __Expression { __String = "0V"; }
    	Vih = __Expression { __String = "0V"; }
    	Vol = __Expression { __String = "0V"; }
    	Voh = __Expression { __String = "0V"; }
    	Iol = __Expression { __String = "0mA"; }
    	Ioh = __Expression { __String = "-0mA"; }
    	Vref = __Expression { __String = "0V"; }
    }
    __Column[1] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[2] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDDAR_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[3] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDS_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[4] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[5] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VDDPGM_PS"; }
    	__ForceRange = __Expression { __String = "VDDPGM_PS"; }
    }
    __Column[6] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VDDEEPROM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VDDEEPROM_PS"; }
    	__ForceRange = __Expression { __String = "VDDEEPROM_PS"; }
    }
    __Column[7] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VNWA_PS"; }
    	__ForceRange = __Expression { __String = "VNWA_PS"; }
    }
    __Column[8] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VPP_PS"; }
    	__ForceRange = __Expression { __String = "VPP_PS"; }
    }
    __Column[9] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "4"; }
    	__ForceValue = __Expression { __String = "VBAT_PS"; }
    	__ForceRange = __Expression { __String = "VBAT_PS"; }
    }
    __Column[10] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_CMOS"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Spec"; }
    	Voh = __Expression { __String = "VOH_Spec"; }
    	Iol = __Expression { __String = "IOL_Spec"; }
    	Ioh = __Expression { __String = "IOH_Spec"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[11] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IN_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)-0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)+0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    }
    __Column[12] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Spec"; }
    	Voh = __Expression { __String = "VOH_Spec"; }
    	Iol = __Expression { __String = "IOL_Spec"; }
    	Ioh = __Expression { __String = "IOH_Spec"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[13] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IN_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)-0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)+0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    }
    __Column[14] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Spec"; }
    	Voh = __Expression { __String = "VOH_Spec"; }
    	Iol = __Expression { __String = "IOL_Spec"; }
    	Ioh = __Expression { __String = "IOH_Spec"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[15] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Spec"; }
    	Voh = __Expression { __String = "VOH_Spec"; }
    	Iol = __Expression { __String = "IOL_Spec"; }
    	Ioh = __Expression { __String = "IOH_Spec"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[16] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_TTL"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Spec"; }
    	Voh = __Expression { __String = "VOH_Spec"; }
    	Iol = __Expression { __String = "IOL_Spec"; }
    	Ioh = __Expression { __String = "IOH_Spec"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[17] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_WIRE"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Spec"; }
    	Voh = __Expression { __String = "VOH_Spec"; }
    	Iol = __Expression { __String = "IOL_Spec"; }
    	Ioh = __Expression { __String = "IOH_Spec"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
}

/**************************************/
/* DCsetup_SpecIn                     */
/**************************************/
__Levels DCsetup_SpecIn {
    __Column[0] {
    	__LevelsColumnType = __DigitalType;
    	__Title = SetPins_ZeroLevels;
    	__Group = __Expression { __String = "ALLPINS"; }
    	ExecSeq = __Expression { __String = "0"; }
    	Vil = __Expression { __String = "0V"; }
    	Vih = __Expression { __String = "0V"; }
    	Vol = __Expression { __String = "0V"; }
    	Voh = __Expression { __String = "0V"; }
    	Iol = __Expression { __String = "0mA"; }
    	Ioh = __Expression { __String = "-0mA"; }
    	Vref = __Expression { __String = "0V"; }
    }
    __Column[1] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[2] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDDAR_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[3] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDS_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[4] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[5] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VDDPGM_PS"; }
    	__ForceRange = __Expression { __String = "VDDPGM_PS"; }
    }
    __Column[6] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VDDEEPROM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VDDEEPROM_PS"; }
    	__ForceRange = __Expression { __String = "VDDEEPROM_PS"; }
    }
    __Column[7] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VNWA_PS"; }
    	__ForceRange = __Expression { __String = "VNWA_PS"; }
    }
    __Column[8] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "3"; }
    	__ForceValue = __Expression { __String = "VPP_PS"; }
    	__ForceRange = __Expression { __String = "VPP_PS"; }
    }
    __Column[9] {
    	__LevelsColumnType = __VIType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "4"; }
    	__ForceValue = __Expression { __String = "VBAT_PS"; }
    	__ForceRange = __Expression { __String = "VBAT_PS"; }
    }
    __Column[10] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_CMOS"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[11] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IN_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)-0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)+0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    }
    __Column[12] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[13] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IN_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)-0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)+0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    }
    __Column[14] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[15] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[16] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_TTL"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
    __Column[17] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "FUNC_IO_WIRE"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_IOZ_PD_LeakIO_1 */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_IOZ_PD_LeakIO_1 {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "LEAK_IOZ_ODD_dcpara_ioz_pd_PM4"; }
    	__ForceValue = __Expression { __String = "VForce_Low"; }
    	__ForceRange = __Expression { __String = "VForce_Low"; }
    	__MeasureRange = __Expression { __String = "IOZL_Max"; }
    	__LowClamp = __Expression { __String = "IOZL_Min - fabs(IOZL_Min * 5%)"; }
    	__HighClamp = __Expression { __String = "IOZL_Max + fabs(IOZL_Max * 5%)"; }
    	__LowLimit = __Expression { __String = "IOZL_Min"; }
    	__HighLimit = __Expression { __String = "IOZL_Max"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_IOZ_PD_LeakIO_2 */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_IOZ_PD_LeakIO_2 {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "LEAK_IOZ_ODD_dcpara_ioz_pd_PM4"; }
    	__ForceValue = __Expression { __String = "VForce_High_3P3V"; }
    	__ForceRange = __Expression { __String = "VForce_High_3P3V"; }
    	__MeasureRange = __Expression { __String = "IOZH_Max"; }
    	__LowClamp = __Expression { __String = "IOZH_Min - fabs(IOZH_Min * 5%)"; }
    	__HighClamp = __Expression { __String = "IOZH_Max + fabs(IOZH_Max * 5%)"; }
    	__LowLimit = __Expression { __String = "IOZH_Min"; }
    	__HighLimit = __Expression { __String = "IOZH_Max"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_IOZ_PD_LeakIO */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_IOZ_PD_LeakIO {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "LEAK_IIHPD_UNK_dcpara_ioz_pd_PM3"; }
    	__ForceValue = __Expression { __String = "VIH_Loose"; }
    	__ForceRange = __Expression { __String = "VIH_Loose"; }
    	__MeasureRange = __Expression { __String = "dcZeroCurrent"; }
    	__LowClamp = __Expression { __String = "dcZeroCurrent - fabs(dcZeroCurrent * 5%)"; }
    	__HighClamp = __Expression { __String = "dcZeroCurrent + fabs(dcZeroCurrent * 5%)"; }
    	__LowLimit = __Expression { __String = "dcZeroCurrent"; }
    	__HighLimit = __Expression { __String = "dcZeroCurrent"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_LeakIO_4    */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_LeakIO_4 {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "LEAK_IILPU_UNK_TTL_dcpara_PM1"; }
    	__ForceValue = __Expression { __String = "VIL_Loose"; }
    	__ForceRange = __Expression { __String = "VIL_Loose"; }
    	__MeasureRange = __Expression { __String = "dcZeroCurrent"; }
    	__LowClamp = __Expression { __String = "dcZeroCurrent - fabs(dcZeroCurrent * 5%)"; }
    	__HighClamp = __Expression { __String = "dcZeroCurrent + fabs(dcZeroCurrent * 5%)"; }
    	__LowLimit = __Expression { __String = "dcZeroCurrent"; }
    	__HighLimit = __Expression { __String = "dcZeroCurrent"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_LeakIO_5    */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_LeakIO_5 {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "LEAK_IILPU_UNK_CMOS_dcpara_PM1"; }
    	__ForceValue = __Expression { __String = "VIL_Loose"; }
    	__ForceRange = __Expression { __String = "VIL_Loose"; }
    	__MeasureRange = __Expression { __String = "dcZeroCurrent"; }
    	__LowClamp = __Expression { __String = "dcZeroCurrent - fabs(dcZeroCurrent * 5%)"; }
    	__HighClamp = __Expression { __String = "dcZeroCurrent + fabs(dcZeroCurrent * 5%)"; }
    	__LowLimit = __Expression { __String = "dcZeroCurrent"; }
    	__HighLimit = __Expression { __String = "dcZeroCurrent"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_LeakIO_6    */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_LeakIO_6 {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "LEAK_IIOH_dcpara_PM3"; }
    	__ForceValue = __Expression { __String = "VIH_Loose"; }
    	__ForceRange = __Expression { __String = "VIH_Loose"; }
    	__MeasureRange = __Expression { __String = "IIHIO_Max"; }
    	__LowClamp = __Expression { __String = "IIHIO_Min - fabs(IIHIO_Min * 5%)"; }
    	__HighClamp = __Expression { __String = "IIHIO_Max + fabs(IIHIO_Max * 5%)"; }
    	__LowLimit = __Expression { __String = "IIHIO_Min"; }
    	__HighLimit = __Expression { __String = "IIHIO_Max"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_LeakIO_7    */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_LeakIO_7 {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "LEAK_IIHPD_UNK_CMOS_dcpara_PM3"; }
    	__ForceValue = __Expression { __String = "VIH_Loose"; }
    	__ForceRange = __Expression { __String = "VIH_Loose"; }
    	__MeasureRange = __Expression { __String = "dcZeroCurrent"; }
    	__LowClamp = __Expression { __String = "dcZeroCurrent - fabs(dcZeroCurrent * 5%)"; }
    	__HighClamp = __Expression { __String = "dcZeroCurrent + fabs(dcZeroCurrent * 5%)"; }
    	__LowLimit = __Expression { __String = "dcZeroCurrent"; }
    	__HighLimit = __Expression { __String = "dcZeroCurrent"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_LeakIO_8    */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_LeakIO_8 {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "LEAK_IIHPD_UNK_TTL_dcpara_PM3"; }
    	__ForceValue = __Expression { __String = "VIH_Loose"; }
    	__ForceRange = __Expression { __String = "VIH_Loose"; }
    	__MeasureRange = __Expression { __String = "dcZeroCurrent"; }
    	__LowClamp = __Expression { __String = "dcZeroCurrent - fabs(dcZeroCurrent * 5%)"; }
    	__HighClamp = __Expression { __String = "dcZeroCurrent + fabs(dcZeroCurrent * 5%)"; }
    	__LowLimit = __Expression { __String = "dcZeroCurrent"; }
    	__HighLimit = __Expression { __String = "dcZeroCurrent"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_LeakIO      */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_LeakIO {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "LEAK_IIOL_dcpara_PM1"; }
    	__ForceValue = __Expression { __String = "VIL_Loose"; }
    	__ForceRange = __Expression { __String = "VIL_Loose"; }
    	__MeasureRange = __Expression { __String = "IILIO_Max"; }
    	__LowClamp = __Expression { __String = "IILIO_Min - fabs(IILIO_Min * 5%)"; }
    	__HighClamp = __Expression { __String = "IILIO_Max + fabs(IILIO_Max * 5%)"; }
    	__LowLimit = __Expression { __String = "IILIO_Min"; }
    	__HighLimit = __Expression { __String = "IILIO_Max"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_LeakIInHi          */
/**************************************/
__Levels DCsetup_PinLeak_LeakIInHi {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "LEAK_IIN_EVEN_OSC"; }
    	__ForceValue = __Expression { __String = "VIH_Loose"; }
    	__ForceRange = __Expression { __String = "VIH_Loose"; }
    	__MeasureRange = __Expression { __String = "IIH_Max"; }
    	__LowClamp = __Expression { __String = "IIH_Min - fabs(IIH_Min * 5%)"; }
    	__HighClamp = __Expression { __String = "IIH_Max + fabs(IIH_Max * 5%)"; }
    	__LowLimit = __Expression { __String = "IIH_Min"; }
    	__HighLimit = __Expression { __String = "IIH_Max"; }
    }
    __Column[1] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "LEAK_IIN_EVEN_SPFUN"; }
    	__ForceValue = __Expression { __String = "VIH_Loose"; }
    	__ForceRange = __Expression { __String = "VIH_Loose"; }
    	__MeasureRange = __Expression { __String = "IIH_Max"; }
    	__LowClamp = __Expression { __String = "IIH_Min - fabs(IIH_Min * 5%)"; }
    	__HighClamp = __Expression { __String = "IIH_Max + fabs(IIH_Max * 5%)"; }
    	__LowLimit = __Expression { __String = "IIH_Min"; }
    	__HighLimit = __Expression { __String = "IIH_Max"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_LeakIInLo          */
/**************************************/
__Levels DCsetup_PinLeak_LeakIInLo {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "LEAK_IIN_EVEN_OSC"; }
    	__ForceValue = __Expression { __String = "VIL_Loose"; }
    	__ForceRange = __Expression { __String = "VIL_Loose"; }
    	__MeasureRange = __Expression { __String = "IIL_Max"; }
    	__LowClamp = __Expression { __String = "IIL_Min - fabs(IIL_Min * 5%)"; }
    	__HighClamp = __Expression { __String = "IIL_Max + fabs(IIL_Max * 5%)"; }
    	__LowLimit = __Expression { __String = "IIL_Min"; }
    	__HighLimit = __Expression { __String = "IIL_Max"; }
    }
    __Column[1] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "LEAK_IIN_EVEN_SPFUN"; }
    	__ForceValue = __Expression { __String = "VIL_Loose"; }
    	__ForceRange = __Expression { __String = "VIL_Loose"; }
    	__MeasureRange = __Expression { __String = "IIL_Max"; }
    	__LowClamp = __Expression { __String = "IIL_Min - fabs(IIL_Min * 5%)"; }
    	__HighClamp = __Expression { __String = "IIL_Max + fabs(IIL_Max * 5%)"; }
    	__LowLimit = __Expression { __String = "IIL_Min"; }
    	__HighLimit = __Expression { __String = "IIL_Max"; }
    }
}

/**************************************/
/* DCsetup_OutputVoltage_PARA_VOL_dcpara_ioz_pd_PM2 */
/**************************************/
__Levels DCsetup_OutputVoltage_PARA_VOL_dcpara_ioz_pd_PM2 {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "PARA_VOL_dcpara_ioz_pd_PM2"; }
    	__ForceValue = __Expression { __String = "0A"; }
    	__ForceRange = __Expression { __String = "0A"; }
    	__MeasureRange = __Expression { __String = "VOL_Max_CMOS"; }
    	__LowClamp = __Expression { __String = "max(-3.25V, VOL_Min_CMOS - max(500mV, fabs(VOL_Min_CMOS * 5%)))"; }
    	__HighClamp = __Expression { __String = "min(7.75V, VOL_Max_CMOS + max(500mV, fabs(VOL_Max_CMOS * 5%)))"; }
    	__LowLimit = __Expression { __String = "VOL_Min_CMOS"; }
    	__HighLimit = __Expression { __String = "VOL_Max_CMOS"; }
    }
}

/**************************************/
/* DCsetup_OutputVoltage_PARA_VOH_dcpara_ioz_pd_PM1 */
/**************************************/
__Levels DCsetup_OutputVoltage_PARA_VOH_dcpara_ioz_pd_PM1 {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "PARA_VOH_dcpara_ioz_pd_PM1"; }
    	__ForceValue = __Expression { __String = "0A"; }
    	__ForceRange = __Expression { __String = "0A"; }
    	__MeasureRange = __Expression { __String = "VOH_Max_CMOS"; }
    	__LowClamp = __Expression { __String = "max(-3.25V, VOH_Min_CMOS - max(500mV, fabs(VOH_Min_CMOS * 5%)))"; }
    	__HighClamp = __Expression { __String = "min(7.75V, VOH_Max_CMOS + max(500mV, fabs(VOH_Max_CMOS * 5%)))"; }
    	__LowLimit = __Expression { __String = "VOH_Min_CMOS"; }
    	__HighLimit = __Expression { __String = "VOH_Max_CMOS"; }
    }
}

/**************************************/
/* DCsetup_OutputVoltage_PARA_VOL_SPFUN_dcpara_PM2 */
/**************************************/
__Levels DCsetup_OutputVoltage_PARA_VOL_SPFUN_dcpara_PM2 {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "PARA_VOL_SPFUN_dcpara_PM2"; }
    	__ForceValue = __Expression { __String = "0A"; }
    	__ForceRange = __Expression { __String = "0A"; }
    	__MeasureRange = __Expression { __String = "VOL_Max_SPFUN"; }
    	__LowClamp = __Expression { __String = "max(-3.25V, VOL_Min_SPFUN - max(500mV, fabs(VOL_Min_SPFUN * 5%)))"; }
    	__HighClamp = __Expression { __String = "min(7.75V, VOL_Max_SPFUN + max(500mV, fabs(VOL_Max_SPFUN * 5%)))"; }
    	__LowLimit = __Expression { __String = "VOL_Min_SPFUN"; }
    	__HighLimit = __Expression { __String = "VOL_Max_SPFUN"; }
    }
}

/**************************************/
/* DCsetup_OutputVoltage_PARA_VOH_SPFUN_dcpara_PM4 */
/**************************************/
__Levels DCsetup_OutputVoltage_PARA_VOH_SPFUN_dcpara_PM4 {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "PARA_VOH_SPFUN_dcpara_PM4"; }
    	__ForceValue = __Expression { __String = "0A"; }
    	__ForceRange = __Expression { __String = "0A"; }
    	__MeasureRange = __Expression { __String = "VOH_Max_SPFUN"; }
    	__LowClamp = __Expression { __String = "max(-3.25V, VOH_Min_SPFUN - max(500mV, fabs(VOH_Min_SPFUN * 5%)))"; }
    	__HighClamp = __Expression { __String = "min(7.75V, VOH_Max_SPFUN + max(500mV, fabs(VOH_Max_SPFUN * 5%)))"; }
    	__LowLimit = __Expression { __String = "VOH_Min_SPFUN"; }
    	__HighLimit = __Expression { __String = "VOH_Max_SPFUN"; }
    }
}

/**************************************/
/* DCsetup_OutputVoltage_PARA_VOH_CMOS_dcpara_PM4 */
/**************************************/
__Levels DCsetup_OutputVoltage_PARA_VOH_CMOS_dcpara_PM4 {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "PARA_VOH_CMOS_dcpara_PM4"; }
    	__ForceValue = __Expression { __String = "0A"; }
    	__ForceRange = __Expression { __String = "0A"; }
    	__MeasureRange = __Expression { __String = "VOH_Max_CMOS"; }
    	__LowClamp = __Expression { __String = "max(-3.25V, VOH_Min_CMOS - max(500mV, fabs(VOH_Min_CMOS * 5%)))"; }
    	__HighClamp = __Expression { __String = "min(7.75V, VOH_Max_CMOS + max(500mV, fabs(VOH_Max_CMOS * 5%)))"; }
    	__LowLimit = __Expression { __String = "VOH_Min_CMOS"; }
    	__HighLimit = __Expression { __String = "VOH_Max_CMOS"; }
    }
}

/**************************************/
/* DCsetup_OutputVoltage_PARA_VOL_CMOS_dcpara_PM2 */
/**************************************/
__Levels DCsetup_OutputVoltage_PARA_VOL_CMOS_dcpara_PM2 {
    __Column[0] {
    	__LevelsColumnType = __DCTestType;
    	__Group = __Expression { __String = "PARA_VOL_CMOS_dcpara_PM2"; }
    	__ForceValue = __Expression { __String = "0A"; }
    	__ForceRange = __Expression { __String = "0A"; }
    	__MeasureRange = __Expression { __String = "VOL_Max_CMOS"; }
    	__LowClamp = __Expression { __String = "max(-3.25V, VOL_Min_CMOS - max(500mV, fabs(VOL_Min_CMOS * 5%)))"; }
    	__HighClamp = __Expression { __String = "min(7.75V, VOL_Max_CMOS + max(500mV, fabs(VOL_Max_CMOS * 5%)))"; }
    	__LowLimit = __Expression { __String = "VOL_Min_CMOS"; }
    	__HighLimit = __Expression { __String = "VOL_Max_CMOS"; }
    }
}

__Levels CTLevels {
    __Column[0] {
    	__LevelsColumnType = __VIType;
    	__Title = Power;
    	__Group = __Expression { __String = "ALLSUPPLIES+VREFAN"; }
    	ExecSeq = __Expression { __String = "0"; }
    	__ForceValue = __Expression { __String = "0V"; }
    }
    __Column[1] {
    	__LevelsColumnType = __DigitalType;
    	__Title = ALL_PINS;
    	__Group = __Expression { __String = "ALL_PINS"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "0V"; }
    	Vih = __Expression { __String = "0V"; }
    	Vol = __Expression { __String = "0V"; }
    	Voh = __Expression { __String = "0V"; }
    	Iol = __Expression { __String = "0A"; }
    	Ioh = __Expression { __String = "0A"; }
    	Vref = __Expression { __String = "0V"; }
    }
}
__Levels DCsetup_LooseVmin {
    __Column[0] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "ALLPINS"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Voc = __Expression { __String = "VLoad"; }
    	Iol = __Expression { __String = "0pA"; }
    	Ioh = __Expression { __String = "0pA"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
}
__Levels PowerDownWithoutRead {
    __Column[0] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "0"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
    __Column[1] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
    __Column[2] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
    __Column[3] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "3"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
    __Column[4] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "4"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
    __Column[5] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "5"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
    __Column[6] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "6"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
    __Column[7] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "7"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
}
__Levels PowerUpAtEfuseRead {
    __Column[0] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	PowerSupply = __Expression { __String = "VDDS_VEfuseR"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "1mS"; }
    }
    __Column[1] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_Vnom"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[2] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_VEfuseR"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[3] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "3"; }
    	PowerSupply = __Expression { __String = "VBAT_VEfuseR"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[4] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "4"; }
    	PowerSupply = __Expression { __String = "VPP_Vnom"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[5] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "5"; }
    	PowerSupply = __Expression { __String = "VNWA_Vnom"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[6] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "6"; }
    	PowerSupply = __Expression { __String = "VDDAR_Vnom"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[7] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "7"; }
    	PowerSupply = __Expression { __String = "VDDPGM_Vnom"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
}

__Levels PowerUpAtVmin {
    __Column[0] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	PowerSupply = __Expression { __String = "VBAT_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "1mS"; }
    }
    __Column[1] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[2] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[3] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "3"; }
    	PowerSupply = __Expression { __String = "VBAT_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[4] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "4"; }
    	PowerSupply = __Expression { __String = "VPP_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[5] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "5"; }
    	PowerSupply = __Expression { __String = "VNWA_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[6] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "6"; }
    	PowerSupply = __Expression { __String = "VDDAR_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[7] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "7"; }
    	PowerSupply = __Expression { __String = "VDDPGM_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
}
__Levels PowerUpAtVmax {
    __Column[0] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	PowerSupply = __Expression { __String = "VBAT_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "1mS"; }
    }
    __Column[1] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[2] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[3] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "3"; }
    	PowerSupply = __Expression { __String = "VBAT_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[4] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "4"; }
    	PowerSupply = __Expression { __String = "VPP_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[5] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "5"; }
    	PowerSupply = __Expression { __String = "VNWA_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[6] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "6"; }
    	PowerSupply = __Expression { __String = "VDDAR_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[7] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "7"; }
    	PowerSupply = __Expression { __String = "VDDPGM_Vmax"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
}
__Levels PowerUpAtVboxhi {
    __Column[0] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	PowerSupply = __Expression { __String = "VBAT_Vboxhi"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "1mS"; }
    }
    __Column[1] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_Vboxhi"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[2] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_Vboxhi"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[3] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "3"; }
    	PowerSupply = __Expression { __String = "VBAT_Vboxhi"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[4] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "4"; }
    	PowerSupply = __Expression { __String = "VPP_Vboxhi"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[5] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "5"; }
    	PowerSupply = __Expression { __String = "VNWA_Vboxhi"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[6] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "6"; }
    	PowerSupply = __Expression { __String = "VDDAR_Vboxhi"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[7] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "7"; }
    	PowerSupply = __Expression { __String = "VDDPGM_Vboxhi"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
}
__Levels DCsetup_LooseVboxHi {
    __Column[0] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "ALLPINS"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "Domain_3P3V_Vboxhi - 0.05V"; }
    	Vol = __Expression { __String = "Domain_3P3V_Vboxhi/2+0.2V"; }
    	Voh = __Expression { __String = "Domain_3P3V_Vboxhi/2-0.2V"; }
    	Voc = __Expression { __String = "Domain_3P3V_Vboxhi*0.5"; }
    	Iol = __Expression { __String = "0pA"; }
    	Ioh = __Expression { __String = "0pA"; }
    	Vref = __Expression { __String = "Domain_3P3V_Vboxhi*0.5"; }
    }
}

__Levels PowerDownWORead_PowerUpAtVmin {
    __Column[0] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VDDS_PwrDown;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "0"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
    __Column[1] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VDDA_PwrDown;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
    __Column[2] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VDD_PwrDown;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
    __Column[3] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VBAT_PwrDown;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "3"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
    __Column[4] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VNWA_PwrDown;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "4"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
    __Column[5] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VPP_PwrDown;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "5"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
    __Column[6] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VDDAR_PwrDown;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "6"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "1us"; }
    }
    __Column[7] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VDDPGM_PwrDown;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "7"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "900mV"; }
    	StepDelay = __Expression { __String = "1us"; }
    	Delay = __Expression { __String = "100us"; }
    }
    __Column[8] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VDDS_PwrUp;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "8"; }
    	PowerSupply = __Expression { __String = "VBAT_Vmin"; }
    	StepSize = __Expression { __String = "300mV"; }
    }
    __Column[9] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VDD_PwrUp;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "9"; }
    	PowerSupply = __Expression { __String = "VDD_Vmin"; }
    	StepSize = __Expression { __String = "300mV"; }
    }
    __Column[10] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VDDA_PwrUp;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "10"; }
    	PowerSupply = __Expression { __String = "VDDA_Vmin"; }
    	StepSize = __Expression { __String = "300mV"; }
    }
    __Column[11] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VBAT_PwrUp;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "11"; }
    	PowerSupply = __Expression { __String = "VBAT_Vmin"; }
    	StepSize = __Expression { __String = "300mV"; }
    }
    __Column[12] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VPP_PwrUp;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "12"; }
    	PowerSupply = __Expression { __String = "VPP_Vmin"; }
    	StepSize = __Expression { __String = "300mV"; }
    }
    __Column[13] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VNWA_PwrUp;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "13"; }
    	PowerSupply = __Expression { __String = "VNWA_Vmin"; }
    	StepSize = __Expression { __String = "300mV"; }
    }
    __Column[14] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VDDAR_PwrUp;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "14"; }
    	PowerSupply = __Expression { __String = "VDDAR_Vmin"; }
    	StepSize = __Expression { __String = "300mV"; }
    }
    __Column[15] {
    	__LevelsColumnType = __SeqPowerType;
    	__Title = VDDPGM_PwrUp;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "15"; }
    	PowerSupply = __Expression { __String = "VDDPGM_Vmin"; }
    	StepSize = __Expression { __String = "300mV"; }
    }
}
__Levels DCsetup_LooseVmask {
    __Column[0] {
    	__LevelsColumnType = __DigitalType;
    	__Group = __Expression { __String = "ALLPINS"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Voc = __Expression { __String = "VLoad"; }
    	Iol = __Expression { __String = "0pA"; }
    	Ioh = __Expression { __String = "0pA"; }
    	Vref = __Expression { __String = "VLoad"; }
    }
}
__Levels PowerUpAtVmask {
    __Column[0] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "0"; }
    	PowerSupply = __Expression { __String = "VDDS_PS"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "1mS"; }
    }
    __Column[1] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_PS"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[2] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_PS"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[3] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "3"; }
    	PowerSupply = __Expression { __String = "VBAT_PS"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[4] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "4"; }
    	PowerSupply = __Expression { __String = "VPP_PS"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
    __Column[5] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "5"; }
    	PowerSupply = __Expression { __String = "VNWA_PS"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0s"; }
    }
    __Column[6] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "6"; }
    	PowerSupply = __Expression { __String = "VDDAR_PS"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0s"; }
    }
    __Column[7] {
    	__LevelsColumnType = __SeqPowerType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "7"; }
    	PowerSupply = __Expression { __String = "VDDPGM_PS"; }
    	StepSize = __Expression { __String = "300mV"; }
    	StepDelay = __Expression { __String = "10us"; }
    	Delay = __Expression { __String = "0mS"; }
    }
}
