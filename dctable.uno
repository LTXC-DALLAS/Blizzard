Unison:U0.2:S4.3;

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
    	__LevelsColumnType = evDigitalType;
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
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "1"; }
    	evRefValue = __Expression { __String = "0V"; }
    	evRefRange = __Expression { __String = "0V"; }
    }
    __Column[2] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "4"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[3] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "4"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[4] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "3"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[5] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "3"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[6] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "2"; }
    	evRefValue = __Expression { __String = "0V"; }
    	evRefRange = __Expression { __String = "0V"; }
    }
    __Column[7] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	evRefValue = __Expression { __String = "0V"; }
    	evRefRange = __Expression { __String = "0V"; }
    }
    __Column[8] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VDDEEPROM"; }
    	ExecSeq = __Expression { __String = "2"; }
    	evRefValue = __Expression { __String = "0V"; }
    	evRefRange = __Expression { __String = "0V"; }
    }
    __Column[9] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "2"; }
    	evRefValue = __Expression { __String = "0V"; }
    	evRefRange = __Expression { __String = "0V"; }
    }
}

/**************************************/
/* DCsetup_allZero                    */
/**************************************/
__Levels DCsetup_allZero {
    __Column[0] {
    	__LevelsColumnType = evDigitalType;
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
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[2] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDDAR_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[3] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDS_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[4] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[5] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VDDPGM_PS"; }
    	evRefRange = __Expression { __String = "VDDPGM_PS"; }
    }
    __Column[6] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VDDEEPROM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VDDEEPROM_PS"; }
    	evRefRange = __Expression { __String = "VDDEEPROM_PS"; }
    }
    __Column[7] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VNWA_PS"; }
    	evRefRange = __Expression { __String = "VNWA_PS"; }
    }
    __Column[8] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VPP_PS"; }
    	evRefRange = __Expression { __String = "VPP_PS"; }
    }
    __Column[9] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "4"; }
    	evRefValue = __Expression { __String = "VBAT_PS"; }
    	evRefRange = __Expression { __String = "VBAT_PS"; }
    }
    __Column[10] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "ALLPINS"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "dcZeroVoltage"; }
    	Vih = __Expression { __String = "dcZeroVoltage"; }
    	Vol = __Expression { __String = "dcZeroVoltage"; }
    	Voh = __Expression { __String = "dcZeroVoltage"; }
    	Iol = __Expression { __String = "10mA"; }
    	Ioh = __Expression { __String = "-10mA"; }
    	Vref = __Expression { __String = "dcZeroVoltage"; }
    	__Delay = __Expression { __String = "0mS"; }
    }
}

/**************************************/
/* DCsetup_Iddq                       */
/**************************************/
__Levels DCsetup_Iddq {
    __Column[0] {
    	__LevelsColumnType = evDigitalType;
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
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[2] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDDAR_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[3] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDS_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[4] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[5] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VDDPGM_PS"; }
    	evRefRange = __Expression { __String = "VDDPGM_PS"; }
    }
    __Column[6] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VDDEEPROM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VDDEEPROM_PS"; }
    	evRefRange = __Expression { __String = "VDDEEPROM_PS"; }
    }
    __Column[7] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VNWA_PS"; }
    	evRefRange = __Expression { __String = "VNWA_PS"; }
    }
    __Column[8] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VPP_PS"; }
    	evRefRange = __Expression { __String = "VPP_PS"; }
    }
    __Column[9] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "4"; }
    	evRefValue = __Expression { __String = "VBAT_PS"; }
    	evRefRange = __Expression { __String = "VBAT_PS"; }
    }
    __Column[10] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_CMOS"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_CMOS"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[11] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IN_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_OSC"; }
    	Vol = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_OSC)-0.05*(VIH_Iddq_OSC-VIL_Iddq) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_OSC)+0.05*(VIH_Iddq_OSC-VIL_Iddq) {for debug in capture tool}"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[12] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[13] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IN_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_SPFUN"; }
    	Vol = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_SPFUN)-0.05*(VIH_Iddq_SPFUN-VIL_Iddq) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_SPFUN)+0.05*(VIH_Iddq_SPFUN-VIL_Iddq) {for debug in capture tool}"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[14] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_SPFUN"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[15] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[16] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_TTL"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_TTL"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[17] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_WIRE"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_WIRE"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
}

/**************************************/
/* DCsetup_Iddq_PostExecution         */
/**************************************/
__Levels DCsetup_Iddq_PostExecution {
    __Column[0] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "6-1"; }
    	PowerSupply = __Expression { __String = "VDD_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[1] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "6-1"; }
    	PowerSupply = __Expression { __String = "VDDAR_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[2] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "6-2"; }
    	PowerSupply = __Expression { __String = "VDDS_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[3] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "6-2"; }
    	PowerSupply = __Expression { __String = "VDDA_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[4] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "6-3"; }
    	evRefValue = __Expression { __String = "VDDPGM_PS"; }
    	evRefRange = __Expression { __String = "VDDPGM_PS"; }
    }
    __Column[5] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VDDEEPROM"; }
    	ExecSeq = __Expression { __String = "6-3"; }
    	evRefValue = __Expression { __String = "VDDEEPROM_PS"; }
    	evRefRange = __Expression { __String = "VDDEEPROM_PS"; }
    }
    __Column[6] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "6-3"; }
    	evRefValue = __Expression { __String = "VNWA_PS"; }
    	evRefRange = __Expression { __String = "VNWA_PS"; }
    }
    __Column[7] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "6-3"; }
    	evRefValue = __Expression { __String = "VPP_PS"; }
    	evRefRange = __Expression { __String = "VPP_PS"; }
    }
    __Column[8] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "6-4"; }
    	evRefValue = __Expression { __String = "VBAT_PS"; }
    	evRefRange = __Expression { __String = "VBAT_PS"; }
    }
    __Column[9] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_CMOS"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_CMOS"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[10] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IN_OSC"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_OSC"; }
    	Vol = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_OSC)-0.05*(VIH_Iddq_OSC-VIL_Iddq) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_OSC)+0.05*(VIH_Iddq_OSC-VIL_Iddq) {for debug in capture tool}"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[11] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_OSC"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[12] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IN_SPFUN"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_SPFUN"; }
    	Vol = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_SPFUN)-0.05*(VIH_Iddq_SPFUN-VIL_Iddq) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Iddq+VIH_Iddq_SPFUN)+0.05*(VIH_Iddq_SPFUN-VIL_Iddq) {for debug in capture tool}"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[13] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_SPFUN"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_SPFUN"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[14] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_SPFUN"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[15] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_TTL"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_TTL"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[16] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_WIRE"; }
    	ExecSeq = __Expression { __String = "6-5"; }
    	Vil = __Expression { __String = "VIL_Iddq"; }
    	Vih = __Expression { __String = "VIH_Iddq_WIRE"; }
    	Vol = __Expression { __String = "VOL_Iddq"; }
    	Voh = __Expression { __String = "VOH_Iddq"; }
    	Iol = __Expression { __String = "IOL_Iddq"; }
    	Ioh = __Expression { __String = "IOH_Iddq"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
}

/**************************************/
/* DCsetup_Loose                      */
/**************************************/
__Levels DCsetup_Loose {
    __Column[0] {
    	__LevelsColumnType = evDigitalType;
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
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[2] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDDAR_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[3] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDS_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[4] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[5] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VDDPGM_PS"; }
    	evRefRange = __Expression { __String = "VDDPGM_PS"; }
    }
    __Column[6] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VDDEEPROM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VDDEEPROM_PS"; }
    	evRefRange = __Expression { __String = "VDDEEPROM_PS"; }
    }
    __Column[7] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VNWA_PS"; }
    	evRefRange = __Expression { __String = "VNWA_PS"; }
    }
    __Column[8] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VPP_PS"; }
    	evRefRange = __Expression { __String = "VPP_PS"; }
    }
    __Column[9] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "4"; }
    	evRefValue = __Expression { __String = "VBAT_PS"; }
    	evRefRange = __Expression { __String = "VBAT_PS"; }
    }
    __Column[10] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_CMOS"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[11] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IN_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)-0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)+0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[12] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[13] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IN_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)-0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)+0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[14] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[15] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[16] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_TTL"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[17] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_WIRE"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
}

/***************************************/
/*** CalibrationLevels Levels Object ***/
/***************************************/
__Levels CalibrationLevels {
    __Column[0] {
    	__LevelsColumnType = evDigitalType;
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
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_CMOS"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "iolCal"; }
    	Ioh = __Expression { __String = "iohCal"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[2] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IN_OSC"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)-0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)+0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[3] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_OSC"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VOL_Loose"; }
    	Vih = __Expression { __String = "VOH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "iolCal"; }
    	Ioh = __Expression { __String = "iohCal"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[4] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IN_SPFUN"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)-0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Loose+VIH_Loose)+0.05*(VIH_Loose-VIL_Loose) {for debug in capture tool}"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[5] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_SPFUN"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "iolCal"; }
    	Ioh = __Expression { __String = "iohCal"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[6] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_SPFUN"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VOL_Loose"; }
    	Vih = __Expression { __String = "VOH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "iolCal"; }
    	Ioh = __Expression { __String = "iohCal"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[7] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_TTL"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "iolCal"; }
    	Ioh = __Expression { __String = "iohCal"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[8] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_WIRE"; }
    	ExecSeq = __Expression { __String = "1"; }
    	Vil = __Expression { __String = "VIL_Loose"; }
    	Vih = __Expression { __String = "VIH_Loose"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "iolCal"; }
    	Ioh = __Expression { __String = "iohCal"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
}

/**************************************/
/* DCsetup_Spec                       */
/**************************************/
__Levels DCsetup_Spec {
    __Column[0] {
    	__LevelsColumnType = evDigitalType;
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
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[2] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDDAR_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[3] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDS_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[4] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[5] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VDDPGM_PS"; }
    	evRefRange = __Expression { __String = "VDDPGM_PS"; }
    }
    __Column[6] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VDDEEPROM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VDDEEPROM_PS"; }
    	evRefRange = __Expression { __String = "VDDEEPROM_PS"; }
    }
    __Column[7] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VNWA_PS"; }
    	evRefRange = __Expression { __String = "VNWA_PS"; }
    }
    __Column[8] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VPP_PS"; }
    	evRefRange = __Expression { __String = "VPP_PS"; }
    }
    __Column[9] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "4"; }
    	evRefValue = __Expression { __String = "VBAT_PS"; }
    	evRefRange = __Expression { __String = "VBAT_PS"; }
    }
    __Column[10] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_CMOS"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Spec"; }
    	Voh = __Expression { __String = "VOH_Spec"; }
    	Iol = __Expression { __String = "IOL_Spec"; }
    	Ioh = __Expression { __String = "IOH_Spec"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[11] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IN_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)-0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)+0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[12] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Spec"; }
    	Voh = __Expression { __String = "VOH_Spec"; }
    	Iol = __Expression { __String = "IOL_Spec"; }
    	Ioh = __Expression { __String = "IOH_Spec"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[13] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IN_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)-0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)+0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[14] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Spec"; }
    	Voh = __Expression { __String = "VOH_Spec"; }
    	Iol = __Expression { __String = "IOL_Spec"; }
    	Ioh = __Expression { __String = "IOH_Spec"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[15] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Spec"; }
    	Voh = __Expression { __String = "VOH_Spec"; }
    	Iol = __Expression { __String = "IOL_Spec"; }
    	Ioh = __Expression { __String = "IOH_Spec"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[16] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_TTL"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Spec"; }
    	Voh = __Expression { __String = "VOH_Spec"; }
    	Iol = __Expression { __String = "IOL_Spec"; }
    	Ioh = __Expression { __String = "IOH_Spec"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[17] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_WIRE"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Spec"; }
    	Voh = __Expression { __String = "VOH_Spec"; }
    	Iol = __Expression { __String = "IOL_Spec"; }
    	Ioh = __Expression { __String = "IOH_Spec"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
}

/**************************************/
/* DCsetup_SpecIn                     */
/**************************************/
__Levels DCsetup_SpecIn {
    __Column[0] {
    	__LevelsColumnType = evDigitalType;
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
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDD"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDD_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[2] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDAR"; }
    	ExecSeq = __Expression { __String = "1"; }
    	PowerSupply = __Expression { __String = "VDDAR_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[3] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDS"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDS_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[4] {
    	__LevelsColumnType = evSeqPowerType;
    	__Group = __Expression { __String = "VDDA"; }
    	ExecSeq = __Expression { __String = "2"; }
    	PowerSupply = __Expression { __String = "VDDA_PS"; }
    	StepSize = __Expression { __String = "supplySeqStepSize"; }
    	StepDelay = __Expression { __String = "supplySeqStepDelay"; }
    }
    __Column[5] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VDDPGM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VDDPGM_PS"; }
    	evRefRange = __Expression { __String = "VDDPGM_PS"; }
    }
    __Column[6] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VDDEEPROM"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VDDEEPROM_PS"; }
    	evRefRange = __Expression { __String = "VDDEEPROM_PS"; }
    }
    __Column[7] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VNWA"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VNWA_PS"; }
    	evRefRange = __Expression { __String = "VNWA_PS"; }
    }
    __Column[8] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VPP"; }
    	ExecSeq = __Expression { __String = "3"; }
    	evRefValue = __Expression { __String = "VPP_PS"; }
    	evRefRange = __Expression { __String = "VPP_PS"; }
    }
    __Column[9] {
    	__LevelsColumnType = evDCRefType;
    	__Group = __Expression { __String = "VBAT"; }
    	ExecSeq = __Expression { __String = "4"; }
    	evRefValue = __Expression { __String = "VBAT_PS"; }
    	evRefRange = __Expression { __String = "VBAT_PS"; }
    }
    __Column[10] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_CMOS"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[11] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IN_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)-0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)+0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[12] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_OSC"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[13] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IN_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)-0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    	Voh = __Expression { __String = "0.5*(VIL_Spec+VIH_Spec)+0.05*(VIH_Spec-VIL_Spec) {for debug in capture tool}"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[14] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[15] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_OUT_SPFUN"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[16] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_TTL"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[17] {
    	__LevelsColumnType = evDigitalType;
    	__Group = __Expression { __String = "FUNC_IO_WIRE"; }
    	ExecSeq = __Expression { __String = "5"; }
    	Vil = __Expression { __String = "VIL_Spec"; }
    	Vih = __Expression { __String = "VIH_Spec"; }
    	Vol = __Expression { __String = "VOL_Loose"; }
    	Voh = __Expression { __String = "VOH_Loose"; }
    	Iol = __Expression { __String = "IOL_Loose"; }
    	Ioh = __Expression { __String = "IOH_Loose"; }
    	Vref = __Expression { __String = "VLoad"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_IOZ_PD_LeakIO_1 */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_IOZ_PD_LeakIO_1 {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "LEAK_IOZ_ODD_dcpara_ioz_pd_PM4"; }
    	evForceValue = __Expression { __String = "VForce_Low"; }
    	evForceRange = __Expression { __String = "VForce_Low"; }
    	evMeasureRange = __Expression { __String = "IOZL_Max"; }
    	evLowClamp = __Expression { __String = "IOZL_Min - fabs(IOZL_Min * 5%)"; }
    	evHighClamp = __Expression { __String = "IOZL_Max + fabs(IOZL_Max * 5%)"; }
    	evLowLimit = __Expression { __String = "IOZL_Min"; }
    	evHighLimit = __Expression { __String = "IOZL_Max"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_IOZ_PD_LeakIO_2 */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_IOZ_PD_LeakIO_2 {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "LEAK_IOZ_ODD_dcpara_ioz_pd_PM4"; }
    	evForceValue = __Expression { __String = "VForce_High_3P3V"; }
    	evForceRange = __Expression { __String = "VForce_High_3P3V"; }
    	evMeasureRange = __Expression { __String = "IOZH_Max"; }
    	evLowClamp = __Expression { __String = "IOZH_Min - fabs(IOZH_Min * 5%)"; }
    	evHighClamp = __Expression { __String = "IOZH_Max + fabs(IOZH_Max * 5%)"; }
    	evLowLimit = __Expression { __String = "IOZH_Min"; }
    	evHighLimit = __Expression { __String = "IOZH_Max"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_IOZ_PD_LeakIO */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_IOZ_PD_LeakIO {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "LEAK_IIHPD_UNK_dcpara_ioz_pd_PM3"; }
    	evForceValue = __Expression { __String = "VIH_Loose"; }
    	evForceRange = __Expression { __String = "VIH_Loose"; }
    	evMeasureRange = __Expression { __String = "dcZeroCurrent"; }
    	evLowClamp = __Expression { __String = "dcZeroCurrent - fabs(dcZeroCurrent * 5%)"; }
    	evHighClamp = __Expression { __String = "dcZeroCurrent + fabs(dcZeroCurrent * 5%)"; }
    	evLowLimit = __Expression { __String = "dcZeroCurrent"; }
    	evHighLimit = __Expression { __String = "dcZeroCurrent"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_LeakIO_4    */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_LeakIO_4 {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "LEAK_IILPU_UNK_TTL_dcpara_PM1"; }
    	evForceValue = __Expression { __String = "VIL_Loose"; }
    	evForceRange = __Expression { __String = "VIL_Loose"; }
    	evMeasureRange = __Expression { __String = "dcZeroCurrent"; }
    	evLowClamp = __Expression { __String = "dcZeroCurrent - fabs(dcZeroCurrent * 5%)"; }
    	evHighClamp = __Expression { __String = "dcZeroCurrent + fabs(dcZeroCurrent * 5%)"; }
    	evLowLimit = __Expression { __String = "dcZeroCurrent"; }
    	evHighLimit = __Expression { __String = "dcZeroCurrent"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_LeakIO_5    */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_LeakIO_5 {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "LEAK_IILPU_UNK_CMOS_dcpara_PM1"; }
    	evForceValue = __Expression { __String = "VIL_Loose"; }
    	evForceRange = __Expression { __String = "VIL_Loose"; }
    	evMeasureRange = __Expression { __String = "dcZeroCurrent"; }
    	evLowClamp = __Expression { __String = "dcZeroCurrent - fabs(dcZeroCurrent * 5%)"; }
    	evHighClamp = __Expression { __String = "dcZeroCurrent + fabs(dcZeroCurrent * 5%)"; }
    	evLowLimit = __Expression { __String = "dcZeroCurrent"; }
    	evHighLimit = __Expression { __String = "dcZeroCurrent"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_LeakIO_6    */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_LeakIO_6 {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "LEAK_IIOH_dcpara_PM3"; }
    	evForceValue = __Expression { __String = "VIH_Loose"; }
    	evForceRange = __Expression { __String = "VIH_Loose"; }
    	evMeasureRange = __Expression { __String = "IIHIO_Max"; }
    	evLowClamp = __Expression { __String = "IIHIO_Min - fabs(IIHIO_Min * 5%)"; }
    	evHighClamp = __Expression { __String = "IIHIO_Max + fabs(IIHIO_Max * 5%)"; }
    	evLowLimit = __Expression { __String = "IIHIO_Min"; }
    	evHighLimit = __Expression { __String = "IIHIO_Max"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_LeakIO_7    */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_LeakIO_7 {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "LEAK_IIHPD_UNK_CMOS_dcpara_PM3"; }
    	evForceValue = __Expression { __String = "VIH_Loose"; }
    	evForceRange = __Expression { __String = "VIH_Loose"; }
    	evMeasureRange = __Expression { __String = "dcZeroCurrent"; }
    	evLowClamp = __Expression { __String = "dcZeroCurrent - fabs(dcZeroCurrent * 5%)"; }
    	evHighClamp = __Expression { __String = "dcZeroCurrent + fabs(dcZeroCurrent * 5%)"; }
    	evLowLimit = __Expression { __String = "dcZeroCurrent"; }
    	evHighLimit = __Expression { __String = "dcZeroCurrent"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_LeakIO_8    */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_LeakIO_8 {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "LEAK_IIHPD_UNK_TTL_dcpara_PM3"; }
    	evForceValue = __Expression { __String = "VIH_Loose"; }
    	evForceRange = __Expression { __String = "VIH_Loose"; }
    	evMeasureRange = __Expression { __String = "dcZeroCurrent"; }
    	evLowClamp = __Expression { __String = "dcZeroCurrent - fabs(dcZeroCurrent * 5%)"; }
    	evHighClamp = __Expression { __String = "dcZeroCurrent + fabs(dcZeroCurrent * 5%)"; }
    	evLowLimit = __Expression { __String = "dcZeroCurrent"; }
    	evHighLimit = __Expression { __String = "dcZeroCurrent"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_DCPARA_LeakIO      */
/**************************************/
__Levels DCsetup_PinLeak_DCPARA_LeakIO {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "LEAK_IIOL_dcpara_PM1"; }
    	evForceValue = __Expression { __String = "VIL_Loose"; }
    	evForceRange = __Expression { __String = "VIL_Loose"; }
    	evMeasureRange = __Expression { __String = "IILIO_Max"; }
    	evLowClamp = __Expression { __String = "IILIO_Min - fabs(IILIO_Min * 5%)"; }
    	evHighClamp = __Expression { __String = "IILIO_Max + fabs(IILIO_Max * 5%)"; }
    	evLowLimit = __Expression { __String = "IILIO_Min"; }
    	evHighLimit = __Expression { __String = "IILIO_Max"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_LeakIInHi          */
/**************************************/
__Levels DCsetup_PinLeak_LeakIInHi {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "LEAK_IIN_EVEN_OSC"; }
    	evForceValue = __Expression { __String = "VIH_Loose"; }
    	evForceRange = __Expression { __String = "VIH_Loose"; }
    	evMeasureRange = __Expression { __String = "IIH_Max"; }
    	evLowClamp = __Expression { __String = "IIH_Min - fabs(IIH_Min * 5%)"; }
    	evHighClamp = __Expression { __String = "IIH_Max + fabs(IIH_Max * 5%)"; }
    	evLowLimit = __Expression { __String = "IIH_Min"; }
    	evHighLimit = __Expression { __String = "IIH_Max"; }
    }
    __Column[1] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "LEAK_IIN_EVEN_SPFUN"; }
    	evForceValue = __Expression { __String = "VIH_Loose"; }
    	evForceRange = __Expression { __String = "VIH_Loose"; }
    	evMeasureRange = __Expression { __String = "IIH_Max"; }
    	evLowClamp = __Expression { __String = "IIH_Min - fabs(IIH_Min * 5%)"; }
    	evHighClamp = __Expression { __String = "IIH_Max + fabs(IIH_Max * 5%)"; }
    	evLowLimit = __Expression { __String = "IIH_Min"; }
    	evHighLimit = __Expression { __String = "IIH_Max"; }
    }
}

/**************************************/
/* DCsetup_PinLeak_LeakIInLo          */
/**************************************/
__Levels DCsetup_PinLeak_LeakIInLo {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "LEAK_IIN_EVEN_OSC"; }
    	evForceValue = __Expression { __String = "VIL_Loose"; }
    	evForceRange = __Expression { __String = "VIL_Loose"; }
    	evMeasureRange = __Expression { __String = "IIL_Max"; }
    	evLowClamp = __Expression { __String = "IIL_Min - fabs(IIL_Min * 5%)"; }
    	evHighClamp = __Expression { __String = "IIL_Max + fabs(IIL_Max * 5%)"; }
    	evLowLimit = __Expression { __String = "IIL_Min"; }
    	evHighLimit = __Expression { __String = "IIL_Max"; }
    }
    __Column[1] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "LEAK_IIN_EVEN_SPFUN"; }
    	evForceValue = __Expression { __String = "VIL_Loose"; }
    	evForceRange = __Expression { __String = "VIL_Loose"; }
    	evMeasureRange = __Expression { __String = "IIL_Max"; }
    	evLowClamp = __Expression { __String = "IIL_Min - fabs(IIL_Min * 5%)"; }
    	evHighClamp = __Expression { __String = "IIL_Max + fabs(IIL_Max * 5%)"; }
    	evLowLimit = __Expression { __String = "IIL_Min"; }
    	evHighLimit = __Expression { __String = "IIL_Max"; }
    }
}

/**************************************/
/* DCsetup_OutputVoltage_PARA_VOL_dcpara_ioz_pd_PM2 */
/**************************************/
__Levels DCsetup_OutputVoltage_PARA_VOL_dcpara_ioz_pd_PM2 {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "PARA_VOL_dcpara_ioz_pd_PM2"; }
    	evForceValue = __Expression { __String = "0A"; }
    	evForceRange = __Expression { __String = "0A"; }
    	evMeasureRange = __Expression { __String = "VOL_Max_CMOS"; }
    	evLowClamp = __Expression { __String = "max(-3.25V, VOL_Min_CMOS - max(500mV, fabs(VOL_Min_CMOS * 5%)))"; }
    	evHighClamp = __Expression { __String = "min(7.75V, VOL_Max_CMOS + max(500mV, fabs(VOL_Max_CMOS * 5%)))"; }
    	evLowLimit = __Expression { __String = "VOL_Min_CMOS"; }
    	evHighLimit = __Expression { __String = "VOL_Max_CMOS"; }
    }
}

/**************************************/
/* DCsetup_OutputVoltage_PARA_VOH_dcpara_ioz_pd_PM1 */
/**************************************/
__Levels DCsetup_OutputVoltage_PARA_VOH_dcpara_ioz_pd_PM1 {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "PARA_VOH_dcpara_ioz_pd_PM1"; }
    	evForceValue = __Expression { __String = "0A"; }
    	evForceRange = __Expression { __String = "0A"; }
    	evMeasureRange = __Expression { __String = "VOH_Max_CMOS"; }
    	evLowClamp = __Expression { __String = "max(-3.25V, VOH_Min_CMOS - max(500mV, fabs(VOH_Min_CMOS * 5%)))"; }
    	evHighClamp = __Expression { __String = "min(7.75V, VOH_Max_CMOS + max(500mV, fabs(VOH_Max_CMOS * 5%)))"; }
    	evLowLimit = __Expression { __String = "VOH_Min_CMOS"; }
    	evHighLimit = __Expression { __String = "VOH_Max_CMOS"; }
    }
}

/**************************************/
/* DCsetup_OutputVoltage_PARA_VOL_SPFUN_dcpara_PM2 */
/**************************************/
__Levels DCsetup_OutputVoltage_PARA_VOL_SPFUN_dcpara_PM2 {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "PARA_VOL_SPFUN_dcpara_PM2"; }
    	evForceValue = __Expression { __String = "0A"; }
    	evForceRange = __Expression { __String = "0A"; }
    	evMeasureRange = __Expression { __String = "VOL_Max_SPFUN"; }
    	evLowClamp = __Expression { __String = "max(-3.25V, VOL_Min_SPFUN - max(500mV, fabs(VOL_Min_SPFUN * 5%)))"; }
    	evHighClamp = __Expression { __String = "min(7.75V, VOL_Max_SPFUN + max(500mV, fabs(VOL_Max_SPFUN * 5%)))"; }
    	evLowLimit = __Expression { __String = "VOL_Min_SPFUN"; }
    	evHighLimit = __Expression { __String = "VOL_Max_SPFUN"; }
    }
}

/**************************************/
/* DCsetup_OutputVoltage_PARA_VOH_SPFUN_dcpara_PM4 */
/**************************************/
__Levels DCsetup_OutputVoltage_PARA_VOH_SPFUN_dcpara_PM4 {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "PARA_VOH_SPFUN_dcpara_PM4"; }
    	evForceValue = __Expression { __String = "0A"; }
    	evForceRange = __Expression { __String = "0A"; }
    	evMeasureRange = __Expression { __String = "VOH_Max_SPFUN"; }
    	evLowClamp = __Expression { __String = "max(-3.25V, VOH_Min_SPFUN - max(500mV, fabs(VOH_Min_SPFUN * 5%)))"; }
    	evHighClamp = __Expression { __String = "min(7.75V, VOH_Max_SPFUN + max(500mV, fabs(VOH_Max_SPFUN * 5%)))"; }
    	evLowLimit = __Expression { __String = "VOH_Min_SPFUN"; }
    	evHighLimit = __Expression { __String = "VOH_Max_SPFUN"; }
    }
}

/**************************************/
/* DCsetup_OutputVoltage_PARA_VOH_CMOS_dcpara_PM4 */
/**************************************/
__Levels DCsetup_OutputVoltage_PARA_VOH_CMOS_dcpara_PM4 {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "PARA_VOH_CMOS_dcpara_PM4"; }
    	evForceValue = __Expression { __String = "0A"; }
    	evForceRange = __Expression { __String = "0A"; }
    	evMeasureRange = __Expression { __String = "VOH_Max_CMOS"; }
    	evLowClamp = __Expression { __String = "max(-3.25V, VOH_Min_CMOS - max(500mV, fabs(VOH_Min_CMOS * 5%)))"; }
    	evHighClamp = __Expression { __String = "min(7.75V, VOH_Max_CMOS + max(500mV, fabs(VOH_Max_CMOS * 5%)))"; }
    	evLowLimit = __Expression { __String = "VOH_Min_CMOS"; }
    	evHighLimit = __Expression { __String = "VOH_Max_CMOS"; }
    }
}

/**************************************/
/* DCsetup_OutputVoltage_PARA_VOL_CMOS_dcpara_PM2 */
/**************************************/
__Levels DCsetup_OutputVoltage_PARA_VOL_CMOS_dcpara_PM2 {
    __Column[0] {
    	__LevelsColumnType = evDCTestType;
    	__Group = __Expression { __String = "PARA_VOL_CMOS_dcpara_PM2"; }
    	evForceValue = __Expression { __String = "0A"; }
    	evForceRange = __Expression { __String = "0A"; }
    	evMeasureRange = __Expression { __String = "VOL_Max_CMOS"; }
    	evLowClamp = __Expression { __String = "max(-3.25V, VOL_Min_CMOS - max(500mV, fabs(VOL_Min_CMOS * 5%)))"; }
    	evHighClamp = __Expression { __String = "min(7.75V, VOL_Max_CMOS + max(500mV, fabs(VOL_Max_CMOS * 5%)))"; }
    	evLowLimit = __Expression { __String = "VOL_Min_CMOS"; }
    	evHighLimit = __Expression { __String = "VOL_Max_CMOS"; }
    }
}

__Levels CTLevels {
    __Column[0] {
    	__LevelsColumnType = evPowerType;
    	__Title = Power;
    	__Group = __Expression { __String = "ALLSUPPLIES+VREFAN"; }
    	ExecSeq = __Expression { __String = "0"; }
    	PowerSupply = __Expression { __String = "0V"; }
    	__Delay = __Expression { __String = "1ms"; }
    }
    __Column[1] {
    	__LevelsColumnType = evDigitalType;
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
    	__Delay = __Expression { __String = "0s"; }
    }
}
 
