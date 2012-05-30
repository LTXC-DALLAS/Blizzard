Unison:U1.0c:S5.3;

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


/***********************************************************************/
/***                                                                 ***/
/***  The file dcdata.evo is the location in which all DC specs      ***/
/***  are stored. This is the only place in a test program in which  ***/
/***  numerical valued DC information should be. All other DC        ***/
/***  expressions should include references to the values in dcdata. ***/
/***                                                                 ***/
/***  The global declarations for all the DC specification variables ***/
/***  are also located here. This is handy, as adding additional     ***/
/***  specs can be done without having to update a separate global   ***/
/***  declarations file.                                             ***/
/***                                                                 ***/
/***  The global declararation also types the variable, so that      ***/
/***  enVision can check for correct assignments (seconds, Volts,    ***/
/***  Amps, and so on).                                              ***/
/***                                                                 ***/
/***  Final comment related to specs is that no value should be      ***/
/***  entered more than once. The "Inherit" capability allows a      ***/
/***  "common" Category to be built, which can then be referenced    ***/
/**   by other Categories                                            ***/
/***                                                                 ***/
/***********************************************************************/

/***********************************************************************/
/*** Correction Factors scf, dcf and ccf are used to compensate for  ***/
/*** the inaccuracy of the tester in setting the Supply voltage,     ***/
/*** comparator voltage and driver voltage. See JazzUsersGuide       ***/
/*** for more info                                                   ***/
/***********************************************************************/

        /***********************************************************/
        /***     Declare global variables with type info         ***/
        /***********************************************************/
        /***                                                     ***/
        /***  This section declares the Globally available       ***/
        /***  DC specifications that will be used in the program.***/
        /***  Type      = Type of value (SCALAR, V, A, s, etc)   ***/
        /***                                                     ***/
        /***********************************************************/

__Spec DCSpecs {
    __Category CommonDCdata {
        ccf = "TIccf";
        dcf = "TIdcf";
        scf = "12mV{TIscf VLCT program sets this to 12mV}";
        vihCal = "3V";
        vilCal = "0V";
        vohCal = "2V";
        volCal = "1V";
        vloadCal = "1.5V";
        iolCal = "20mA";
        iohCal = "-20mA";
        Domain_3P3V_VEfuseP = "3.63V";
        Domain_3P3V_VEfuseR = "3.63V";
        Domain_3P3V_Vboxhi = "3.8V";
        Domain_3P3V_VboxhiM = "3.78V";
        Domain_3P3V_VboxhiP = "3.82V";
        Domain_3P3V_Vboxlo = "2.68V";
        Domain_3P3V_VboxloM = "2.66V";
        Domain_3P3V_VboxloP = "2.7V";
        Domain_3P3V_Vburnin = "3.8V";
        Domain_3P3V_Vmax = "3.63V+scf";
        Domain_3P3V_Vmin = "2.97V-scf";
        Domain_3P3V_Vnom = "3.3V";
        Domain_3P3V_Vstress = "3.8V";
        ICLAMP_VBAT = "100mA";
        ICLAMP_VDD = "744mA";
        ICLAMP_VDDA = "100mA";
        ICLAMP_VDDAR = "82mA";
        ICLAMP_VDDEEPROM = "0pA";
        ICLAMP_VDDPGM = "100mA";
        ICLAMP_VDDS = "1.572A";
        ICLAMP_VNWA = "100mA";
        ICLAMP_VPP = "200mA";
        VBAT_VEfuseP = "3.63V";
        VBAT_VEfuseR = "3.63V";
        VBAT_Vboxhi = "3.8V";
        VBAT_VboxhiM = "3.78V";
        VBAT_VboxhiP = "3.82V";
        VBAT_Vboxlo = "2.68V";
        VBAT_VboxloM = "2.66V";
        VBAT_VboxloP = "2.7V";
        VBAT_Vburnin = "3.8V";
        VBAT_Vmax = "3.63V+scf";
        VBAT_Vmin = "2.97V-scf";
        VBAT_Vnom = "3.3V";
        VBAT_Vstress = "3.8V";
        VDDAR_VEfuseP = "1.7V";
        VDDAR_VEfuseR = "1.32V";
        VDDAR_Vboxhi = "1.7V";
        VDDAR_VboxhiM = "1.68V";
        VDDAR_VboxhiP = "1.72V";
        VDDAR_Vboxlo = "910mV";
        VDDAR_VboxloM = "890mV";
        VDDAR_VboxloP = "930mV";
        VDDAR_Vburnin = "1.6V";
        VDDAR_Vmax = "1.32V+scf";
        VDDAR_Vmin = "1.08V-scf";
        VDDAR_Vnom = "1.2V";
        VDDAR_Vstress = "1.7V";
        VDDA_VEfuseP = "3.63V";
        VDDA_VEfuseR = "3.63V";
        VDDA_Vboxhi = "3.8V";
        VDDA_VboxhiM = "3.78V";
        VDDA_VboxhiP = "3.82V";
        VDDA_Vboxlo = "2.68V";
        VDDA_VboxloM = "2.66V";
        VDDA_VboxloP = "2.7V";
        VDDA_Vburnin = "3.8V";
        VDDA_Vmax = "3.63V+scf";
        VDDA_Vmin = "2.97V-scf";
        VDDA_Vnom = "3.3V";
        VDDA_Vstress = "3.8V";
        VDDEEPROM_VEfuseP = "1.7V";
        VDDEEPROM_VEfuseR = "1.32V";
        VDDEEPROM_Vboxhi = "1.7V";
        VDDEEPROM_VboxhiM = "1.68V";
        VDDEEPROM_VboxhiP = "1.72V";
        VDDEEPROM_Vboxlo = "910mV";
        VDDEEPROM_VboxloM = "890mV";
        VDDEEPROM_VboxloP = "930mV";
        VDDEEPROM_Vburnin = "1.6V";
        VDDEEPROM_Vmax = "1.32V+scf";
        VDDEEPROM_Vmin = "1.08V-scf";
        VDDEEPROM_Vnom = "1.2V";
        VDDEEPROM_Vstress = "1.7V";
        VDDPGM_VEfuseP = "1.7V";
        VDDPGM_VEfuseR = "1.26V";
        VDDPGM_Vboxhi = "1.7V";
        VDDPGM_VboxhiM = "1.68V";
        VDDPGM_VboxhiP = "1.72V";
        VDDPGM_Vboxlo = "910mV";
        VDDPGM_VboxloM = "890mV";
        VDDPGM_VboxloP = "930mV";
        VDDPGM_Vburnin = "1.6V";
        VDDPGM_Vmax = "1.26V+scf";
        VDDPGM_Vmin = "1.08V-scf";
        VDDPGM_Vnom = "1.2V";
        VDDPGM_Vstress = "1.7V";
        VDDS_VEfuseP = "3.63V";
        VDDS_VEfuseR = "3.63V";
        VDDS_Vboxhi = "3.8V";
        VDDS_VboxhiM = "3.78V";
        VDDS_VboxhiP = "3.82V";
        VDDS_Vboxlo = "2.68V";
        VDDS_VboxloM = "2.66V";
        VDDS_VboxloP = "2.7V";
        VDDS_Vburnin = "3.8V";
        VDDS_Vmax = "3.63V+scf";
        VDDS_Vmin = "2.97V-scf";
        VDDS_Vnom = "3.3V";
        VDDS_Vstress = "3.8V";
        VDD_VEfuseP = "1.7V";
        VDD_VEfuseR = "1.32V";
        VDD_Vboxhi = "1.7V";
        VDD_VboxhiM = "1.68V";
        VDD_VboxhiP = "1.72V";
        VDD_Vboxlo = "910mV";
        VDD_VboxloM = "890mV";
        VDD_VboxloP = "930mV";
        VDD_Vburnin = "1.6V";
        VDD_Vmax = "1.32V+scf";
        VDD_Vmin = "1.08V-scf";
        VDD_Vnom = "1.2V";
        VDD_Vstress = "1.7V";
        VNWA_VEfuseP = "1.7V";
        VNWA_VEfuseR = "1.32V";
        VNWA_Vboxhi = "1.7V";
        VNWA_VboxhiM = "1.68V";
        VNWA_VboxhiP = "1.72V";
        VNWA_Vboxlo = "910mV";
        VNWA_VboxloM = "890mV";
        VNWA_VboxloP = "930mV";
        VNWA_Vburnin = "1.6V";
        VNWA_Vmax = "1.32V+scf";
        VNWA_Vmin = "1.08V-scf";
        VNWA_Vnom = "1.2V";
        VNWA_Vstress = "1.7V";
        VPP_VEfuseP = "1.9V";
        VPP_VEfuseR = "1.32V";
        VPP_Vboxhi = "1.7V";
        VPP_VboxhiM = "1.68V";
        VPP_VboxhiP = "1.72V";
        VPP_Vboxlo = "910mV";
        VPP_VboxloM = "890mV";
        VPP_VboxloP = "930mV";
        VPP_Vburnin = "1.6V";
        VPP_Vmax = "1.32V+scf";
        VPP_Vmin = "1.08V-scf";
        VPP_Vnom = "1.2V";
        VPP_Vstress = "1.7V";
        CRES_hilimit = "30Ohm";
        CRES_lolimit = "1Ohm";
        CRES_maxCurPerPin = "100mA";
        anaGndIForce = "-1mA";
        anaGndVForce = "-2V";
        anaGndVLimitHi = "-500mV";
        anaGndVLimitLo = "-1.85V";
        anaGndVRange = "2.5V";
        anaPwrIForce = "1mA";
        anaPwrVForce = "2V";
        anaPwrVLimitHi = "1.85V";
        anaPwrVLimitLo = "500mV";
        anaPwrVRange = "2.5V";
        iOSpins = "-1mA";
        iOSpinsPWR = "1mA";
        icres1 = "14mA";
        icres2 = "24mA";
        iopenssupply = "-1mA";
        iopenssupplymax = "5mA";
        ishortshi2VBAT = "12mA";
        ishortshi2VDD = "12mA";
        ishortshi2VDDA = "12mA";
        ishortshi2VDDAR = "12mA";
        ishortshi2VDDEEPROM = "12mA";
        ishortshi2VDDPGM = "12mA";
        ishortshi2VDDS = "12mA";
        ishortshi2VNWA = "12mA";
        ishortshi2VPP = "12mA";
        ishortshiVBAT = "10mA";
        ishortshiVDD = "10mA";
        ishortshiVDDA = "10mA";
        ishortshiVDDAR = "10mA";
        ishortshiVDDEEPROM = "10mA";
        ishortshiVDDPGM = "10mA";
        ishortshiVDDS = "10mA";
        ishortshiVNWA = "10mA";
        ishortshiVPP = "10mA";
        ishortslo2VBAT = "-20mA";
        ishortslo2VDD = "-20mA";
        ishortslo2VDDA = "-20mA";
        ishortslo2VDDAR = "-20mA";
        ishortslo2VDDEEPROM = "-20mA";
        ishortslo2VDDPGM = "-20mA";
        ishortslo2VDDS = "-20mA";
        ishortslo2VNWA = "-20mA";
        ishortslo2VPP = "-20mA";
        ishortsloVBAT = "-10mA";
        ishortsloVDD = "-10mA";
        ishortsloVDDA = "-10mA";
        ishortsloVDDAR = "-10mA";
        ishortsloVDDEEPROM = "-10mA";
        ishortsloVDDPGM = "-10mA";
        ishortsloVDDS = "-10mA";
        ishortsloVNWA = "-10mA";
        ishortsloVPP = "-10mA";
        vcres = "2V";
        vmaxOSpins = "-1.5V";
        vmaxOSpinsPWR = "1.5V";
        vopenslimit = "-1V";
        vopenslimitCML_RX_GND = "-180mV";
        vopenslimitCML_RX_PWR = "180mV";
        vopenslimitCML_TX_GND = "-600mV";
        vopenslimitCML_TX_PWR = "600mV";
        vopenslimitPWR = "1V";
        vopenssupply = "-1V";
        vshorts2VBAT = "50mV";
        vshorts2VDD = "50mV";
        vshorts2VDDA = "50mV";
        vshorts2VDDAR = "50mV";
        vshorts2VDDEEPROM = "50mV";
        vshorts2VDDPGM = "50mV";
        vshorts2VDDS = "50mV";
        vshorts2VNWA = "50mV";
        vshorts2VPP = "50mV";
        vshortsVBAT = "25mV";
        vshortsVDD = "25mV";
        vshortsVDDA = "25mV";
        vshortsVDDAR = "25mV";
        vshortsVDDEEPROM = "25mV";
        vshortsVDDPGM = "25mV";
        vshortsVDDS = "25mV";
        vshortsVNWA = "25mV";
        vshortsVPP = "25mV";
        vshortslimit = "-300mV";
        vshortslimitCML_RX_GND = "-40mV";
        vshortslimitCML_RX_PWR = "40mV";
        vshortslimitCML_TX_GND = "-25mV";
        vshortslimitCML_TX_PWR = "25mV";
        vshortslimitPWR = "300mV";
        VMSgb = "68mV";
        dcZeroCurrent = "0pA";
        dcZeroVoltage = "0uV";
        IOH_Iddq = "-1mA";
        IOH_Loose = "-1mA";
        IOH_Spec = "-1mA";
        IOL_Iddq = "1mA";
        IOL_Loose = "1mA";
        IOL_Spec = "1mA";
        VIH_Iddq_CMOS = "Domain_3P3V_PS";
        VIH_Iddq_OSC = "Domain_3P3V_PS";
        VIH_Iddq_SPFUN = "Domain_3P3V_PS";
        VIH_Iddq_TTL = "Domain_3P3V_PS";
        VIH_Iddq_WIRE = "Domain_3P3V_PS-0.05V";
        VIH_Loose = "Domain_3P3V_PS-0.05V";
        VIH_Spec = "Domain_3P3V_PS*0.7-dcf";
        VIL_Iddq = "0uV";
        VIL_Loose = "0uV";
        VIL_Spec = "Domain_3P3V_PS*0.3+dcf";
        VLoad = "Domain_3P3V_PS*0.5";
        VOH_Iddq = "(Domain_3P3V_PS/2)+0.2V";
        VOH_Loose = "(Domain_3P3V_PS/2)+0.2V";
        VOH_Spec = "Domain_3P3V_PS*0.8+ccf";
        VOL_Iddq = "(Domain_3P3V_PS/2)-0.2V";
        VOL_Loose = "(Domain_3P3V_PS/2)-0.2V";
        VOL_Spec = "Domain_3P3V_PS*0.2-ccf";
        IIHIO_Max = "350nA";
        IIHIO_Min = "-175nA";
        IIH_Max = "70nA";
        IIH_Min = "-35nA";
        IILIO_Max = "175nA";
        IILIO_Min = "-350nA";
        IIL_Max = "35nA";
        IIL_Min = "-70nA";
        IOZH_Max = "350nA";
        IOZH_Min = "-175nA";
        IOZL_Max = "175nA";
        IOZL_Min = "-350nA";
        MAX_RTERM = "55Ohm";
        MIN_RTERM = "45Ohm";
        Resistance__MAX_CML_Input = "-12Ohm";
        Resistance__MAX_CML_Output = "60Ohm";
        Resistance__MAX_DIFF = "120Ohm";
        Resistance__MAX_LVDS = "120Ohm";
        Resistance__MIN_CML_Input = "10Ohm";
        Resistance__MIN_CML_Output = "40Ohm";
        Resistance__MIN_DIFF = "80Ohm";
        Resistance__MIN_LVDS = "80Ohm";
        VForce_High_3P3V = "Domain_3P3V_PS";
        VForce_Low = "0uV";
        VForce_TermResistance = "400mV";
        VOH_Max_CMOS = "Domain_3P3V_PS";
        VOH_Max_SPFUN = "Domain_3P3V_PS";
        VOH_Min_CMOS = "Domain_3P3V_PS*0.8+ccf";
        VOH_Min_SPFUN = "Domain_3P3V_PS*0.8+ccf";
        VOL_Max_CMOS = "Domain_3P3V_PS*0.22-ccf";
        VOL_Max_SPFUN = "Domain_3P3V_PS*0.22-ccf";
        VOL_Min_CMOS = "0uV";
        VOL_Min_SPFUN = "0uV";
        IDDQ_MAX_VBAT_VBOXLO = "0.8uA";
        IDDQ_MAX_VBAT_VBURNIN = "0pA";
        IDDQ_MAX_VBAT_VMAX = "0pA";
        IDDQ_MAX_VDDAR_VBOXLO = "0pA";
        IDDQ_MAX_VDDAR_VBURNIN = "0pA";
        IDDQ_MAX_VDDAR_VMAX = "0pA";
        IDDQ_MAX_VDDA_VBOXLO = "500uA";
        IDDQ_MAX_VDDA_VBURNIN = "0pA";
        IDDQ_MAX_VDDA_VMAX = "0pA";
        IDDQ_MAX_VDDEEPROM_VBOXLO = "0pA";
        IDDQ_MAX_VDDEEPROM_VBURNIN = "0pA";
        IDDQ_MAX_VDDEEPROM_VMAX = "0pA";
        IDDQ_MAX_VDDPGM_VBOXLO = "0pA";
        IDDQ_MAX_VDDPGM_VBURNIN = "0pA";
        IDDQ_MAX_VDDPGM_VMAX = "0pA";
        IDDQ_MAX_VDDS_VBOXLO = "50uA";
        IDDQ_MAX_VDDS_VBURNIN = "0pA";
        IDDQ_MAX_VDDS_VMAX = "0pA";
        IDDQ_MAX_VDD_VBOXLO = "500uA";
        IDDQ_MAX_VDD_VBURNIN = "0pA";
        IDDQ_MAX_VDD_VMAX = "0pA";
        IDDQ_MAX_VNWA_VBOXLO = "50uA";
        IDDQ_MAX_VNWA_VBURNIN = "0pA";
        IDDQ_MAX_VNWA_VMAX = "0pA";
        IDDQ_MAX_VPP_VBOXLO = "0pA";
        IDDQ_MAX_VPP_VBURNIN = "0pA";
        IDDQ_MAX_VPP_VMAX = "0pA";
        IDDQ_MIN_VBAT_VBOXLO = "-1uA";
        IDDQ_MIN_VBAT_VBURNIN = "0pA";
        IDDQ_MIN_VBAT_VMAX = "0pA";
        IDDQ_MIN_VDDAR_VBOXLO = "0pA";
        IDDQ_MIN_VDDAR_VBURNIN = "0pA";
        IDDQ_MIN_VDDAR_VMAX = "0pA";
        IDDQ_MIN_VDDA_VBOXLO = "-1uA";
        IDDQ_MIN_VDDA_VBURNIN = "0pA";
        IDDQ_MIN_VDDA_VMAX = "0pA";
        IDDQ_MIN_VDDEEPROM_VBOXLO = "0pA";
        IDDQ_MIN_VDDEEPROM_VBURNIN = "0pA";
        IDDQ_MIN_VDDEEPROM_VMAX = "0pA";
        IDDQ_MIN_VDDPGM_VBOXLO = "0pA";
        IDDQ_MIN_VDDPGM_VBURNIN = "0pA";
        IDDQ_MIN_VDDPGM_VMAX = "0pA";
        IDDQ_MIN_VDDS_VBOXLO = "-1uA";
        IDDQ_MIN_VDDS_VBURNIN = "0pA";
        IDDQ_MIN_VDDS_VMAX = "0pA";
        IDDQ_MIN_VDD_VBOXLO = "-1uA";
        IDDQ_MIN_VDD_VBURNIN = "0pA";
        IDDQ_MIN_VDD_VMAX = "0pA";
        IDDQ_MIN_VNWA_VBOXLO = "-1uA";
        IDDQ_MIN_VNWA_VBURNIN = "0pA";
        IDDQ_MIN_VNWA_VMAX = "0pA";
        IDDQ_MIN_VPP_VBOXLO = "0pA";
        IDDQ_MIN_VPP_VBURNIN = "0pA";
        IDDQ_MIN_VPP_VMAX = "0pA";
        supplySeqStepSize = "300mV";
        supplySeqStepDelay = "100uS";
        Vsr = "25mV";
        SR_ntarget_nand = "2000";
        SR_ntarget_nor = "2000";
        Iddq_DeltaLimit_VDD = "1uA";
        Iddq_DeltaLimit_VDDA = "1uA";
        Iddq_DeltaLimit_VDDAR = "1uA";
        Iddq_DeltaLimit_VDDS = "1uA";
        Iddq_DriftLimit_VDD = "1uA";
        Iddq_DriftLimit_VDDA = "1uA";
        Iddq_DriftLimit_VDDAR = "1uA";
        Iddq_DriftLimit_VDDS = "1uA";
    }
    __Category TempTEMP_N45_DEGDCdata {
        __Inherit CommonDCdata;
    }
    __Category TempTEMP_N40_DEGDCdata {
        __Inherit CommonDCdata;
    }
    __Category TempTEMP_0_DEGDCdata {
        __Inherit CommonDCdata;
    }
    __Category TempTEMP_25_DEGDCdata {
        __Inherit CommonDCdata;
    }
    __Category TempTEMP_27_DEGDCdata {
        __Inherit CommonDCdata;
    }
    __Category TempTEMP_30_DEGDCdata {
        __Inherit CommonDCdata;
    }
    __Category TempTEMP_50_DEGDCdata {
        __Inherit CommonDCdata;
    }
    __Category TempTEMP_75_DEGDCdata {
        __Inherit CommonDCdata;
    }
    __Category TempTEMP_85_DEGDCdata {
        __Inherit CommonDCdata;
    }
    __Category TempTEMP_90_DEGDCdata {
        __Inherit CommonDCdata;
    }
    __Category TempTEMP_100_DEGDCdata {
        __Inherit CommonDCdata;
    }
    __Category TempTEMP_105_DEGDCdata {
        __Inherit CommonDCdata;
    }
    __Category TempTEMP_125_DEGDCdata {
        __Inherit CommonDCdata;
    }
    __Category TempTEMP_135_DEGDCdata {
        __Inherit CommonDCdata;
    }
    __ParamGlobals {
            ccf { __Type = V; __Comment = "Comparator voltage correction factor(15mV), decided by USP to compensate for Comparator voltage accuracy"; }
            dcf { __Type = V; __Comment = "Driver voltage correction factor(15mV), decided by USP to compensate for Driver voltage accuracy"; }
            scf { __Type = V; __Comment = "Supply voltage correction factor(10mV), decided by USP to compensate for tester supply accuracy"; }
            vihCal { __Type = V; }
            vilCal { __Type = V; }
            vohCal { __Type = V; }
            volCal { __Type = V; }
            vloadCal { __Type = V; }
            iolCal { __Type = A; }
            iohCal { __Type = A; }
            Domain_3P3V_VEfuseP { __Type = V; __Comment = "Domain_3P3V supply at VEfuseP corner - the value of the power supply variable Domain_3P3V_PS in PSSpecs"; }
            Domain_3P3V_VEfuseR { __Type = V; __Comment = "Domain_3P3V supply at VEfuseR corner - the value of the power supply variable Domain_3P3V_PS in PSSpecs"; }
            Domain_3P3V_Vboxhi { __Type = V; __Comment = "Domain_3P3V supply at Vboxhi corner - the value of the power supply variable Domain_3P3V_PS in PSSpecs"; }
            Domain_3P3V_VboxhiM { __Type = V; __Comment = "Domain_3P3V supply at VboxhiM corner - the value of the power supply variable Domain_3P3V_PS in PSSpecs"; }
            Domain_3P3V_VboxhiP { __Type = V; __Comment = "Domain_3P3V supply at VboxhiP corner - the value of the power supply variable Domain_3P3V_PS in PSSpecs"; }
            Domain_3P3V_Vboxlo { __Type = V; __Comment = "Domain_3P3V supply at Vboxlo corner - the value of the power supply variable Domain_3P3V_PS in PSSpecs"; }
            Domain_3P3V_VboxloM { __Type = V; __Comment = "Domain_3P3V supply at VboxloM corner - the value of the power supply variable Domain_3P3V_PS in PSSpecs"; }
            Domain_3P3V_VboxloP { __Type = V; __Comment = "Domain_3P3V supply at VboxloP corner - the value of the power supply variable Domain_3P3V_PS in PSSpecs"; }
            Domain_3P3V_Vburnin { __Type = V; __Comment = "Domain_3P3V supply at Vburnin corner - the value of the power supply variable Domain_3P3V_PS in PSSpecs"; }
            Domain_3P3V_Vmax { __Type = V; __Comment = "Domain_3P3V supply at Vmax corner - the value of the power supply variable Domain_3P3V_PS in PSSpecs"; }
            Domain_3P3V_Vmin { __Type = V; __Comment = "Domain_3P3V supply at Vmin corner - the value of the power supply variable Domain_3P3V_PS in PSSpecs"; }
            Domain_3P3V_Vnom { __Type = V; __Comment = "Domain_3P3V supply at Vnom corner - the value of the power supply variable Domain_3P3V_PS in PSSpecs"; }
            Domain_3P3V_Vstress { __Type = V; __Comment = "Domain_3P3V supply at Vstress corner - the value of the power supply variable Domain_3P3V_PS in PSSpecs"; }
            ICLAMP_VBAT { __Type = A; __Comment = ""; }
            ICLAMP_VDD { __Type = A; __Comment = ""; }
            ICLAMP_VDDA { __Type = A; __Comment = ""; }
            ICLAMP_VDDAR { __Type = A; __Comment = ""; }
            ICLAMP_VDDEEPROM { __Type = A; __Comment = ""; }
            ICLAMP_VDDPGM { __Type = A; __Comment = ""; }
            ICLAMP_VDDS { __Type = A; __Comment = ""; }
            ICLAMP_VNWA { __Type = A; __Comment = ""; }
            ICLAMP_VPP { __Type = A; __Comment = ""; }
            VBAT_VEfuseP { __Type = V; __Comment = "VBAT supply at VEfuseP corner - the value of the power supply variable VBAT_PS in PSSpecs"; }
            VBAT_VEfuseR { __Type = V; __Comment = "VBAT supply at VEfuseR corner - the value of the power supply variable VBAT_PS in PSSpecs"; }
            VBAT_Vboxhi { __Type = V; __Comment = "VBAT supply at Vboxhi corner - the value of the power supply variable VBAT_PS in PSSpecs"; }
            VBAT_VboxhiM { __Type = V; __Comment = "VBAT supply at VboxhiM corner - the value of the power supply variable VBAT_PS in PSSpecs"; }
            VBAT_VboxhiP { __Type = V; __Comment = "VBAT supply at VboxhiP corner - the value of the power supply variable VBAT_PS in PSSpecs"; }
            VBAT_Vboxlo { __Type = V; __Comment = "VBAT supply at Vboxlo corner - the value of the power supply variable VBAT_PS in PSSpecs"; }
            VBAT_VboxloM { __Type = V; __Comment = "VBAT supply at VboxloM corner - the value of the power supply variable VBAT_PS in PSSpecs"; }
            VBAT_VboxloP { __Type = V; __Comment = "VBAT supply at VboxloP corner - the value of the power supply variable VBAT_PS in PSSpecs"; }
            VBAT_Vburnin { __Type = V; __Comment = "VBAT supply at Vburnin corner - the value of the power supply variable VBAT_PS in PSSpecs"; }
            VBAT_Vmax { __Type = V; __Comment = "VBAT supply at Vmax corner - the value of the power supply variable VBAT_PS in PSSpecs"; }
            VBAT_Vmin { __Type = V; __Comment = "VBAT supply at Vmin corner - the value of the power supply variable VBAT_PS in PSSpecs"; }
            VBAT_Vnom { __Type = V; __Comment = "VBAT supply at Vnom corner - the value of the power supply variable VBAT_PS in PSSpecs"; }
            VBAT_Vstress { __Type = V; __Comment = "VBAT supply at Vstress corner - the value of the power supply variable VBAT_PS in PSSpecs"; }
            VDDAR_VEfuseP { __Type = V; __Comment = "VDDAR supply at VEfuseP corner - the value of the power supply variable VDDAR_PS in PSSpecs"; }
            VDDAR_VEfuseR { __Type = V; __Comment = "VDDAR supply at VEfuseR corner - the value of the power supply variable VDDAR_PS in PSSpecs"; }
            VDDAR_Vboxhi { __Type = V; __Comment = "VDDAR supply at Vboxhi corner - the value of the power supply variable VDDAR_PS in PSSpecs"; }
            VDDAR_VboxhiM { __Type = V; __Comment = "VDDAR supply at VboxhiM corner - the value of the power supply variable VDDAR_PS in PSSpecs"; }
            VDDAR_VboxhiP { __Type = V; __Comment = "VDDAR supply at VboxhiP corner - the value of the power supply variable VDDAR_PS in PSSpecs"; }
            VDDAR_Vboxlo { __Type = V; __Comment = "VDDAR supply at Vboxlo corner - the value of the power supply variable VDDAR_PS in PSSpecs"; }
            VDDAR_VboxloM { __Type = V; __Comment = "VDDAR supply at VboxloM corner - the value of the power supply variable VDDAR_PS in PSSpecs"; }
            VDDAR_VboxloP { __Type = V; __Comment = "VDDAR supply at VboxloP corner - the value of the power supply variable VDDAR_PS in PSSpecs"; }
            VDDAR_Vburnin { __Type = V; __Comment = "VDDAR supply at Vburnin corner - the value of the power supply variable VDDAR_PS in PSSpecs"; }
            VDDAR_Vmax { __Type = V; __Comment = "VDDAR supply at Vmax corner - the value of the power supply variable VDDAR_PS in PSSpecs"; }
            VDDAR_Vmin { __Type = V; __Comment = "VDDAR supply at Vmin corner - the value of the power supply variable VDDAR_PS in PSSpecs"; }
            VDDAR_Vnom { __Type = V; __Comment = "VDDAR supply at Vnom corner - the value of the power supply variable VDDAR_PS in PSSpecs"; }
            VDDAR_Vstress { __Type = V; __Comment = "VDDAR supply at Vstress corner - the value of the power supply variable VDDAR_PS in PSSpecs"; }
            VDDA_VEfuseP { __Type = V; __Comment = "VDDA supply at VEfuseP corner - the value of the power supply variable VDDA_PS in PSSpecs"; }
            VDDA_VEfuseR { __Type = V; __Comment = "VDDA supply at VEfuseR corner - the value of the power supply variable VDDA_PS in PSSpecs"; }
            VDDA_Vboxhi { __Type = V; __Comment = "VDDA supply at Vboxhi corner - the value of the power supply variable VDDA_PS in PSSpecs"; }
            VDDA_VboxhiM { __Type = V; __Comment = "VDDA supply at VboxhiM corner - the value of the power supply variable VDDA_PS in PSSpecs"; }
            VDDA_VboxhiP { __Type = V; __Comment = "VDDA supply at VboxhiP corner - the value of the power supply variable VDDA_PS in PSSpecs"; }
            VDDA_Vboxlo { __Type = V; __Comment = "VDDA supply at Vboxlo corner - the value of the power supply variable VDDA_PS in PSSpecs"; }
            VDDA_VboxloM { __Type = V; __Comment = "VDDA supply at VboxloM corner - the value of the power supply variable VDDA_PS in PSSpecs"; }
            VDDA_VboxloP { __Type = V; __Comment = "VDDA supply at VboxloP corner - the value of the power supply variable VDDA_PS in PSSpecs"; }
            VDDA_Vburnin { __Type = V; __Comment = "VDDA supply at Vburnin corner - the value of the power supply variable VDDA_PS in PSSpecs"; }
            VDDA_Vmax { __Type = V; __Comment = "VDDA supply at Vmax corner - the value of the power supply variable VDDA_PS in PSSpecs"; }
            VDDA_Vmin { __Type = V; __Comment = "VDDA supply at Vmin corner - the value of the power supply variable VDDA_PS in PSSpecs"; }
            VDDA_Vnom { __Type = V; __Comment = "VDDA supply at Vnom corner - the value of the power supply variable VDDA_PS in PSSpecs"; }
            VDDA_Vstress { __Type = V; __Comment = "VDDA supply at Vstress corner - the value of the power supply variable VDDA_PS in PSSpecs"; }
            VDDEEPROM_VEfuseP { __Type = V; __Comment = "VDDEEPROM supply at VEfuseP corner - the value of the power supply variable VDDEEPROM_PS in PSSpecs"; }
            VDDEEPROM_VEfuseR { __Type = V; __Comment = "VDDEEPROM supply at VEfuseR corner - the value of the power supply variable VDDEEPROM_PS in PSSpecs"; }
            VDDEEPROM_Vboxhi { __Type = V; __Comment = "VDDEEPROM supply at Vboxhi corner - the value of the power supply variable VDDEEPROM_PS in PSSpecs"; }
            VDDEEPROM_VboxhiM { __Type = V; __Comment = "VDDEEPROM supply at VboxhiM corner - the value of the power supply variable VDDEEPROM_PS in PSSpecs"; }
            VDDEEPROM_VboxhiP { __Type = V; __Comment = "VDDEEPROM supply at VboxhiP corner - the value of the power supply variable VDDEEPROM_PS in PSSpecs"; }
            VDDEEPROM_Vboxlo { __Type = V; __Comment = "VDDEEPROM supply at Vboxlo corner - the value of the power supply variable VDDEEPROM_PS in PSSpecs"; }
            VDDEEPROM_VboxloM { __Type = V; __Comment = "VDDEEPROM supply at VboxloM corner - the value of the power supply variable VDDEEPROM_PS in PSSpecs"; }
            VDDEEPROM_VboxloP { __Type = V; __Comment = "VDDEEPROM supply at VboxloP corner - the value of the power supply variable VDDEEPROM_PS in PSSpecs"; }
            VDDEEPROM_Vburnin { __Type = V; __Comment = "VDDEEPROM supply at Vburnin corner - the value of the power supply variable VDDEEPROM_PS in PSSpecs"; }
            VDDEEPROM_Vmax { __Type = V; __Comment = "VDDEEPROM supply at Vmax corner - the value of the power supply variable VDDEEPROM_PS in PSSpecs"; }
            VDDEEPROM_Vmin { __Type = V; __Comment = "VDDEEPROM supply at Vmin corner - the value of the power supply variable VDDEEPROM_PS in PSSpecs"; }
            VDDEEPROM_Vnom { __Type = V; __Comment = "VDDEEPROM supply at Vnom corner - the value of the power supply variable VDDEEPROM_PS in PSSpecs"; }
            VDDEEPROM_Vstress { __Type = V; __Comment = "VDDEEPROM supply at Vstress corner - the value of the power supply variable VDDEEPROM_PS in PSSpecs"; }
            VDDPGM_VEfuseP { __Type = V; __Comment = "VDDPGM supply at VEfuseP corner - the value of the power supply variable VDDPGM_PS in PSSpecs"; }
            VDDPGM_VEfuseR { __Type = V; __Comment = "VDDPGM supply at VEfuseR corner - the value of the power supply variable VDDPGM_PS in PSSpecs"; }
            VDDPGM_Vboxhi { __Type = V; __Comment = "VDDPGM supply at Vboxhi corner - the value of the power supply variable VDDPGM_PS in PSSpecs"; }
            VDDPGM_VboxhiM { __Type = V; __Comment = "VDDPGM supply at VboxhiM corner - the value of the power supply variable VDDPGM_PS in PSSpecs"; }
            VDDPGM_VboxhiP { __Type = V; __Comment = "VDDPGM supply at VboxhiP corner - the value of the power supply variable VDDPGM_PS in PSSpecs"; }
            VDDPGM_Vboxlo { __Type = V; __Comment = "VDDPGM supply at Vboxlo corner - the value of the power supply variable VDDPGM_PS in PSSpecs"; }
            VDDPGM_VboxloM { __Type = V; __Comment = "VDDPGM supply at VboxloM corner - the value of the power supply variable VDDPGM_PS in PSSpecs"; }
            VDDPGM_VboxloP { __Type = V; __Comment = "VDDPGM supply at VboxloP corner - the value of the power supply variable VDDPGM_PS in PSSpecs"; }
            VDDPGM_Vburnin { __Type = V; __Comment = "VDDPGM supply at Vburnin corner - the value of the power supply variable VDDPGM_PS in PSSpecs"; }
            VDDPGM_Vmax { __Type = V; __Comment = "VDDPGM supply at Vmax corner - the value of the power supply variable VDDPGM_PS in PSSpecs"; }
            VDDPGM_Vmin { __Type = V; __Comment = "VDDPGM supply at Vmin corner - the value of the power supply variable VDDPGM_PS in PSSpecs"; }
            VDDPGM_Vnom { __Type = V; __Comment = "VDDPGM supply at Vnom corner - the value of the power supply variable VDDPGM_PS in PSSpecs"; }
            VDDPGM_Vstress { __Type = V; __Comment = "VDDPGM supply at Vstress corner - the value of the power supply variable VDDPGM_PS in PSSpecs"; }
            VDDS_VEfuseP { __Type = V; __Comment = "VDDS supply at VEfuseP corner - the value of the power supply variable VDDS_PS in PSSpecs"; }
            VDDS_VEfuseR { __Type = V; __Comment = "VDDS supply at VEfuseR corner - the value of the power supply variable VDDS_PS in PSSpecs"; }
            VDDS_Vboxhi { __Type = V; __Comment = "VDDS supply at Vboxhi corner - the value of the power supply variable VDDS_PS in PSSpecs"; }
            VDDS_VboxhiM { __Type = V; __Comment = "VDDS supply at VboxhiM corner - the value of the power supply variable VDDS_PS in PSSpecs"; }
            VDDS_VboxhiP { __Type = V; __Comment = "VDDS supply at VboxhiP corner - the value of the power supply variable VDDS_PS in PSSpecs"; }
            VDDS_Vboxlo { __Type = V; __Comment = "VDDS supply at Vboxlo corner - the value of the power supply variable VDDS_PS in PSSpecs"; }
            VDDS_VboxloM { __Type = V; __Comment = "VDDS supply at VboxloM corner - the value of the power supply variable VDDS_PS in PSSpecs"; }
            VDDS_VboxloP { __Type = V; __Comment = "VDDS supply at VboxloP corner - the value of the power supply variable VDDS_PS in PSSpecs"; }
            VDDS_Vburnin { __Type = V; __Comment = "VDDS supply at Vburnin corner - the value of the power supply variable VDDS_PS in PSSpecs"; }
            VDDS_Vmax { __Type = V; __Comment = "VDDS supply at Vmax corner - the value of the power supply variable VDDS_PS in PSSpecs"; }
            VDDS_Vmin { __Type = V; __Comment = "VDDS supply at Vmin corner - the value of the power supply variable VDDS_PS in PSSpecs"; }
            VDDS_Vnom { __Type = V; __Comment = "VDDS supply at Vnom corner - the value of the power supply variable VDDS_PS in PSSpecs"; }
            VDDS_Vstress { __Type = V; __Comment = "VDDS supply at Vstress corner - the value of the power supply variable VDDS_PS in PSSpecs"; }
            VDD_VEfuseP { __Type = V; __Comment = "VDD supply at VEfuseP corner - the value of the power supply variable VDD_PS in PSSpecs"; }
            VDD_VEfuseR { __Type = V; __Comment = "VDD supply at VEfuseR corner - the value of the power supply variable VDD_PS in PSSpecs"; }
            VDD_Vboxhi { __Type = V; __Comment = "VDD supply at Vboxhi corner - the value of the power supply variable VDD_PS in PSSpecs"; }
            VDD_VboxhiM { __Type = V; __Comment = "VDD supply at VboxhiM corner - the value of the power supply variable VDD_PS in PSSpecs"; }
            VDD_VboxhiP { __Type = V; __Comment = "VDD supply at VboxhiP corner - the value of the power supply variable VDD_PS in PSSpecs"; }
            VDD_Vboxlo { __Type = V; __Comment = "VDD supply at Vboxlo corner - the value of the power supply variable VDD_PS in PSSpecs"; }
            VDD_VboxloM { __Type = V; __Comment = "VDD supply at VboxloM corner - the value of the power supply variable VDD_PS in PSSpecs"; }
            VDD_VboxloP { __Type = V; __Comment = "VDD supply at VboxloP corner - the value of the power supply variable VDD_PS in PSSpecs"; }
            VDD_Vburnin { __Type = V; __Comment = "VDD supply at Vburnin corner - the value of the power supply variable VDD_PS in PSSpecs"; }
            VDD_Vmax { __Type = V; __Comment = "VDD supply at Vmax corner - the value of the power supply variable VDD_PS in PSSpecs"; }
            VDD_Vmin { __Type = V; __Comment = "VDD supply at Vmin corner - the value of the power supply variable VDD_PS in PSSpecs"; }
            VDD_Vnom { __Type = V; __Comment = "VDD supply at Vnom corner - the value of the power supply variable VDD_PS in PSSpecs"; }
            VDD_Vstress { __Type = V; __Comment = "VDD supply at Vstress corner - the value of the power supply variable VDD_PS in PSSpecs"; }
            VNWA_VEfuseP { __Type = V; __Comment = "VNWA supply at VEfuseP corner - the value of the power supply variable VNWA_PS in PSSpecs"; }
            VNWA_VEfuseR { __Type = V; __Comment = "VNWA supply at VEfuseR corner - the value of the power supply variable VNWA_PS in PSSpecs"; }
            VNWA_Vboxhi { __Type = V; __Comment = "VNWA supply at Vboxhi corner - the value of the power supply variable VNWA_PS in PSSpecs"; }
            VNWA_VboxhiM { __Type = V; __Comment = "VNWA supply at VboxhiM corner - the value of the power supply variable VNWA_PS in PSSpecs"; }
            VNWA_VboxhiP { __Type = V; __Comment = "VNWA supply at VboxhiP corner - the value of the power supply variable VNWA_PS in PSSpecs"; }
            VNWA_Vboxlo { __Type = V; __Comment = "VNWA supply at Vboxlo corner - the value of the power supply variable VNWA_PS in PSSpecs"; }
            VNWA_VboxloM { __Type = V; __Comment = "VNWA supply at VboxloM corner - the value of the power supply variable VNWA_PS in PSSpecs"; }
            VNWA_VboxloP { __Type = V; __Comment = "VNWA supply at VboxloP corner - the value of the power supply variable VNWA_PS in PSSpecs"; }
            VNWA_Vburnin { __Type = V; __Comment = "VNWA supply at Vburnin corner - the value of the power supply variable VNWA_PS in PSSpecs"; }
            VNWA_Vmax { __Type = V; __Comment = "VNWA supply at Vmax corner - the value of the power supply variable VNWA_PS in PSSpecs"; }
            VNWA_Vmin { __Type = V; __Comment = "VNWA supply at Vmin corner - the value of the power supply variable VNWA_PS in PSSpecs"; }
            VNWA_Vnom { __Type = V; __Comment = "VNWA supply at Vnom corner - the value of the power supply variable VNWA_PS in PSSpecs"; }
            VNWA_Vstress { __Type = V; __Comment = "VNWA supply at Vstress corner - the value of the power supply variable VNWA_PS in PSSpecs"; }
            VPP_VEfuseP { __Type = V; __Comment = "VPP supply at VEfuseP corner - the value of the power supply variable VPP_PS in PSSpecs"; }
            VPP_VEfuseR { __Type = V; __Comment = "VPP supply at VEfuseR corner - the value of the power supply variable VPP_PS in PSSpecs"; }
            VPP_Vboxhi { __Type = V; __Comment = "VPP supply at Vboxhi corner - the value of the power supply variable VPP_PS in PSSpecs"; }
            VPP_VboxhiM { __Type = V; __Comment = "VPP supply at VboxhiM corner - the value of the power supply variable VPP_PS in PSSpecs"; }
            VPP_VboxhiP { __Type = V; __Comment = "VPP supply at VboxhiP corner - the value of the power supply variable VPP_PS in PSSpecs"; }
            VPP_Vboxlo { __Type = V; __Comment = "VPP supply at Vboxlo corner - the value of the power supply variable VPP_PS in PSSpecs"; }
            VPP_VboxloM { __Type = V; __Comment = "VPP supply at VboxloM corner - the value of the power supply variable VPP_PS in PSSpecs"; }
            VPP_VboxloP { __Type = V; __Comment = "VPP supply at VboxloP corner - the value of the power supply variable VPP_PS in PSSpecs"; }
            VPP_Vburnin { __Type = V; __Comment = "VPP supply at Vburnin corner - the value of the power supply variable VPP_PS in PSSpecs"; }
            VPP_Vmax { __Type = V; __Comment = "VPP supply at Vmax corner - the value of the power supply variable VPP_PS in PSSpecs"; }
            VPP_Vmin { __Type = V; __Comment = "VPP supply at Vmin corner - the value of the power supply variable VPP_PS in PSSpecs"; }
            VPP_Vnom { __Type = V; __Comment = "VPP supply at Vnom corner - the value of the power supply variable VPP_PS in PSSpecs"; }
            VPP_Vstress { __Type = V; __Comment = "VPP supply at Vstress corner - the value of the power supply variable VPP_PS in PSSpecs"; }
            CRES_hilimit { __Type = Ohm; }
            CRES_lolimit { __Type = Ohm; }
            CRES_maxCurPerPin { __Type = A; }
            anaGndIForce { __Type = A; }
            anaGndVForce { __Type = V; }
            anaGndVLimitHi { __Type = V; }
            anaGndVLimitLo { __Type = V; }
            anaGndVRange { __Type = V; }
            anaPwrIForce { __Type = A; }
            anaPwrVForce { __Type = V; }
            anaPwrVLimitHi { __Type = V; }
            anaPwrVLimitLo { __Type = V; }
            anaPwrVRange { __Type = V; }
            iOSpins { __Type = A; }
            iOSpinsPWR { __Type = A; }
            icres1 { __Type = A; }
            icres2 { __Type = A; }
            iopenssupply { __Type = A; }
            iopenssupplymax { __Type = A; }
            ishortshi2VBAT { __Type = A; }
            ishortshi2VDD { __Type = A; }
            ishortshi2VDDA { __Type = A; }
            ishortshi2VDDAR { __Type = A; }
            ishortshi2VDDEEPROM { __Type = A; }
            ishortshi2VDDPGM { __Type = A; }
            ishortshi2VDDS { __Type = A; }
            ishortshi2VNWA { __Type = A; }
            ishortshi2VPP { __Type = A; }
            ishortshiVBAT { __Type = A; }
            ishortshiVDD { __Type = A; }
            ishortshiVDDA { __Type = A; }
            ishortshiVDDAR { __Type = A; }
            ishortshiVDDEEPROM { __Type = A; }
            ishortshiVDDPGM { __Type = A; }
            ishortshiVDDS { __Type = A; }
            ishortshiVNWA { __Type = A; }
            ishortshiVPP { __Type = A; }
            ishortslo2VBAT { __Type = A; }
            ishortslo2VDD { __Type = A; }
            ishortslo2VDDA { __Type = A; }
            ishortslo2VDDAR { __Type = A; }
            ishortslo2VDDEEPROM { __Type = A; }
            ishortslo2VDDPGM { __Type = A; }
            ishortslo2VDDS { __Type = A; }
            ishortslo2VNWA { __Type = A; }
            ishortslo2VPP { __Type = A; }
            ishortsloVBAT { __Type = A; }
            ishortsloVDD { __Type = A; }
            ishortsloVDDA { __Type = A; }
            ishortsloVDDAR { __Type = A; }
            ishortsloVDDEEPROM { __Type = A; }
            ishortsloVDDPGM { __Type = A; }
            ishortsloVDDS { __Type = A; }
            ishortsloVNWA { __Type = A; }
            ishortsloVPP { __Type = A; }
            vcres { __Type = V; }
            vmaxOSpins { __Type = V; }
            vmaxOSpinsPWR { __Type = V; }
            vopenslimit { __Type = V; }
            vopenslimitCML_RX_GND { __Type = V; }
            vopenslimitCML_RX_PWR { __Type = V; }
            vopenslimitCML_TX_GND { __Type = V; }
            vopenslimitCML_TX_PWR { __Type = V; }
            vopenslimitPWR { __Type = V; }
            vopenssupply { __Type = V; }
            vshorts2VBAT { __Type = V; }
            vshorts2VDD { __Type = V; }
            vshorts2VDDA { __Type = V; }
            vshorts2VDDAR { __Type = V; }
            vshorts2VDDEEPROM { __Type = V; }
            vshorts2VDDPGM { __Type = V; }
            vshorts2VDDS { __Type = V; }
            vshorts2VNWA { __Type = V; }
            vshorts2VPP { __Type = V; }
            vshortsVBAT { __Type = V; }
            vshortsVDD { __Type = V; }
            vshortsVDDA { __Type = V; }
            vshortsVDDAR { __Type = V; }
            vshortsVDDEEPROM { __Type = V; }
            vshortsVDDPGM { __Type = V; }
            vshortsVDDS { __Type = V; }
            vshortsVNWA { __Type = V; }
            vshortsVPP { __Type = V; }
            vshortslimit { __Type = V; }
            vshortslimitCML_RX_GND { __Type = V; }
            vshortslimitCML_RX_PWR { __Type = V; }
            vshortslimitCML_TX_GND { __Type = V; }
            vshortslimitCML_TX_PWR { __Type = V; }
            vshortslimitPWR { __Type = V; }
            VMSgb { __Type = V; __Comment = ""; }
            dcZeroCurrent { __Type = A; __Comment = ""; }
            dcZeroVoltage { __Type = V; __Comment = ""; }
            IOH_Iddq { __Type = A; __Comment = ""; }
            IOH_Loose { __Type = A; __Comment = ""; }
            IOH_Spec { __Type = A; __Comment = ""; }
            IOL_Iddq { __Type = A; __Comment = ""; }
            IOL_Loose { __Type = A; __Comment = ""; }
            IOL_Spec { __Type = A; __Comment = ""; }
            VIH_Iddq_CMOS { __Type = V; __Comment = ""; }
            VIH_Iddq_OSC { __Type = V; __Comment = ""; }
            VIH_Iddq_SPFUN { __Type = V; __Comment = ""; }
            VIH_Iddq_TTL { __Type = V; __Comment = ""; }
            VIH_Iddq_WIRE { __Type = V; __Comment = ""; }
            VIH_Loose { __Type = V; __Comment = ""; }
            VIH_Spec { __Type = V; __Comment = ""; }
            VIL_Iddq { __Type = V; __Comment = ""; }
            VIL_Loose { __Type = V; __Comment = ""; }
            VIL_Spec { __Type = V; __Comment = ""; }
            VLoad { __Type = V; __Comment = ""; }
            VOH_Iddq { __Type = V; __Comment = ""; }
            VOH_Loose { __Type = V; __Comment = ""; }
            VOH_Spec { __Type = V; __Comment = ""; }
            VOL_Iddq { __Type = V; __Comment = ""; }
            VOL_Loose { __Type = V; __Comment = ""; }
            VOL_Spec { __Type = V; __Comment = ""; }
            IIHIO_Max { __Type = A; }
            IIHIO_Min { __Type = A; }
            IIH_Max { __Type = A; }
            IIH_Min { __Type = A; }
            IILIO_Max { __Type = A; }
            IILIO_Min { __Type = A; }
            IIL_Max { __Type = A; }
            IIL_Min { __Type = A; }
            IOZH_Max { __Type = A; }
            IOZH_Min { __Type = A; }
            IOZL_Max { __Type = A; }
            IOZL_Min { __Type = A; }
            MAX_RTERM { __Type = Ohm; }
            MIN_RTERM { __Type = Ohm; }
            Resistance__MAX_CML_Input { __Type = Ohm; }
            Resistance__MAX_CML_Output { __Type = Ohm; }
            Resistance__MAX_DIFF { __Type = Ohm; }
            Resistance__MAX_LVDS { __Type = Ohm; }
            Resistance__MIN_CML_Input { __Type = Ohm; }
            Resistance__MIN_CML_Output { __Type = Ohm; }
            Resistance__MIN_DIFF { __Type = Ohm; }
            Resistance__MIN_LVDS { __Type = Ohm; }
            VForce_High_3P3V { __Type = V; }
            VForce_Low { __Type = V; }
            VForce_TermResistance { __Type = V; }
            VOH_Max_CMOS { __Type = V; }
            VOH_Max_SPFUN { __Type = V; }
            VOH_Min_CMOS { __Type = V; }
            VOH_Min_SPFUN { __Type = V; }
            VOL_Max_CMOS { __Type = V; }
            VOL_Max_SPFUN { __Type = V; }
            VOL_Min_CMOS { __Type = V; }
            VOL_Min_SPFUN { __Type = V; }
            IDDQ_MAX_VBAT_VBOXLO { __Type = A; }
            IDDQ_MAX_VBAT_VBURNIN { __Type = A; }
            IDDQ_MAX_VBAT_VMAX { __Type = A; }
            IDDQ_MAX_VDDAR_VBOXLO { __Type = A; }
            IDDQ_MAX_VDDAR_VBURNIN { __Type = A; }
            IDDQ_MAX_VDDAR_VMAX { __Type = A; }
            IDDQ_MAX_VDDA_VBOXLO { __Type = A; }
            IDDQ_MAX_VDDA_VBURNIN { __Type = A; }
            IDDQ_MAX_VDDA_VMAX { __Type = A; }
            IDDQ_MAX_VDDEEPROM_VBOXLO { __Type = A; }
            IDDQ_MAX_VDDEEPROM_VBURNIN { __Type = A; }
            IDDQ_MAX_VDDEEPROM_VMAX { __Type = A; }
            IDDQ_MAX_VDDPGM_VBOXLO { __Type = A; }
            IDDQ_MAX_VDDPGM_VBURNIN { __Type = A; }
            IDDQ_MAX_VDDPGM_VMAX { __Type = A; }
            IDDQ_MAX_VDDS_VBOXLO { __Type = A; }
            IDDQ_MAX_VDDS_VBURNIN { __Type = A; }
            IDDQ_MAX_VDDS_VMAX { __Type = A; }
            IDDQ_MAX_VDD_VBOXLO { __Type = A; }
            IDDQ_MAX_VDD_VBURNIN { __Type = A; }
            IDDQ_MAX_VDD_VMAX { __Type = A; }
            IDDQ_MAX_VNWA_VBOXLO { __Type = A; }
            IDDQ_MAX_VNWA_VBURNIN { __Type = A; }
            IDDQ_MAX_VNWA_VMAX { __Type = A; }
            IDDQ_MAX_VPP_VBOXLO { __Type = A; }
            IDDQ_MAX_VPP_VBURNIN { __Type = A; }
            IDDQ_MAX_VPP_VMAX { __Type = A; }
            IDDQ_MIN_VBAT_VBOXLO { __Type = A; }
            IDDQ_MIN_VBAT_VBURNIN { __Type = A; }
            IDDQ_MIN_VBAT_VMAX { __Type = A; }
            IDDQ_MIN_VDDAR_VBOXLO { __Type = A; }
            IDDQ_MIN_VDDAR_VBURNIN { __Type = A; }
            IDDQ_MIN_VDDAR_VMAX { __Type = A; }
            IDDQ_MIN_VDDA_VBOXLO { __Type = A; }
            IDDQ_MIN_VDDA_VBURNIN { __Type = A; }
            IDDQ_MIN_VDDA_VMAX { __Type = A; }
            IDDQ_MIN_VDDEEPROM_VBOXLO { __Type = A; }
            IDDQ_MIN_VDDEEPROM_VBURNIN { __Type = A; }
            IDDQ_MIN_VDDEEPROM_VMAX { __Type = A; }
            IDDQ_MIN_VDDPGM_VBOXLO { __Type = A; }
            IDDQ_MIN_VDDPGM_VBURNIN { __Type = A; }
            IDDQ_MIN_VDDPGM_VMAX { __Type = A; }
            IDDQ_MIN_VDDS_VBOXLO { __Type = A; }
            IDDQ_MIN_VDDS_VBURNIN { __Type = A; }
            IDDQ_MIN_VDDS_VMAX { __Type = A; }
            IDDQ_MIN_VDD_VBOXLO { __Type = A; }
            IDDQ_MIN_VDD_VBURNIN { __Type = A; }
            IDDQ_MIN_VDD_VMAX { __Type = A; }
            IDDQ_MIN_VNWA_VBOXLO { __Type = A; }
            IDDQ_MIN_VNWA_VBURNIN { __Type = A; }
            IDDQ_MIN_VNWA_VMAX { __Type = A; }
            IDDQ_MIN_VPP_VBOXLO { __Type = A; }
            IDDQ_MIN_VPP_VBURNIN { __Type = A; }
            IDDQ_MIN_VPP_VMAX { __Type = A; }
            supplySeqStepSize { __Type = V; }
            supplySeqStepDelay { __Type = s; }
            Vsr { __Type = V; }
            SR_ntarget_nand { __Type = SCALAR; }
            SR_ntarget_nor { __Type = SCALAR; }
            Iddq_DeltaLimit_VDD { __Type = A; }
            Iddq_DeltaLimit_VDDA { __Type = A; }
            Iddq_DeltaLimit_VDDAR { __Type = A; }
            Iddq_DeltaLimit_VDDS { __Type = A; }
            Iddq_DriftLimit_VDD { __Type = A; }
            Iddq_DriftLimit_VDDA { __Type = A; }
            Iddq_DriftLimit_VDDAR { __Type = A; }
            Iddq_DriftLimit_VDDS { __Type = A; }
    }
}

        /***********************************************************/
        /***     Declare global PS variables with type info      ***/
        /***********************************************************/
        /***                                                     ***/
        /***  This section declares the Globally available       ***/
        /***  PS specifications that will be used in the program.***/
        /***  Type      = Type of value (SCALAR, V, A, s, etc)   ***/
        /***                                                     ***/
        /***********************************************************/

__Spec PSSpecs {
    __Category CommonPSdata {
        twMCC_V = "''";
        vddCond = "''";
        fakeV = "0V";
        VDD_PS = "0V + fakeV {for fake char axis}";
        VDDEEPROM_PS = "0V + fakeV {for fake char axis}";
        VDDPGM_PS = "0V + fakeV {for fake char axis}";
        VNWA_PS = "0V + fakeV {for fake char axis}";
        VDDAR_PS = "0V + fakeV {for fake char axis}";
        VBAT_PS = "0V + fakeV {for fake char axis}";
        VDDS_PS = "0V + fakeV {for fake char axis}";
        VDDA_PS = "0V + fakeV {for fake char axis}";
        VPP_PS = "0V + fakeV {for fake char axis}";
        Domain_3P3V_PS = "0V + fakeV {for fake char axis}";
        charEn_V_1_2_PS = "FALSE";
        charID_V_1_2_PS = "'A'";
        charEn_V_3_3_PS = "FALSE";
        charID_V_3_3_PS = "'B'";
        charEn_VDD_PS = "FALSE";
        charID_VDD_PS = "'C'";
        charEn_VDDEEPROM_PS = "FALSE";
        charID_VDDEEPROM_PS = "'D'";
        charEn_VDDPGM_PS = "FALSE";
        charID_VDDPGM_PS = "'E'";
        charEn_VNWA_PS = "FALSE";
        charID_VNWA_PS = "'F'";
        charEn_VDDAR_PS = "FALSE";
        charID_VDDAR_PS = "'G'";
        charEn_VBAT_PS = "FALSE";
        charID_VBAT_PS = "'H'";
        charEn_VDDS_PS = "FALSE";
        charID_VDDS_PS = "'I'";
        charEn_VDDA_PS = "FALSE";
        charID_VDDA_PS = "'J'";
        charEn_VPP_PS = "FALSE";
        charID_VPP_PS = "'K'";
        charEn_Domain_3P3V_PS = "FALSE";
        charID_Domain_3P3V_PS = "'L'";
        CharVoltageStep = "10mV";
    }
    __Category PS_VEfuseP {
        __Inherit CommonPSdata;
        twMCC_V = "'B'";
        vddCond = "'VEfuseP'";
        VDD_PS.Min = "0V";
        VDD_PS.Typ = "VDD_VEfuseP + fakeV {for fake char axis}";
        VDD_PS.Max = "VDD_VEfuseP";
        VDDEEPROM_PS.Min = "0V";
        VDDEEPROM_PS.Typ = "VDDEEPROM_VEfuseP + fakeV {for fake char axis}";
        VDDEEPROM_PS.Max = "VDDEEPROM_VEfuseP";
        VDDPGM_PS.Min = "0V";
        VDDPGM_PS.Typ = "VDDPGM_VEfuseP + fakeV {for fake char axis}";
        VDDPGM_PS.Max = "VDDPGM_VEfuseP";
        VNWA_PS.Min = "0V";
        VNWA_PS.Typ = "VNWA_VEfuseP + fakeV {for fake char axis}";
        VNWA_PS.Max = "VNWA_VEfuseP";
        VDDAR_PS.Min = "0V";
        VDDAR_PS.Typ = "VDDAR_VEfuseP + fakeV {for fake char axis}";
        VDDAR_PS.Max = "VDDAR_VEfuseP";
        VBAT_PS.Min = "0V";
        VBAT_PS.Typ = "VBAT_VEfuseP + fakeV {for fake char axis}";
        VBAT_PS.Max = "VBAT_VEfuseP";
        VDDS_PS.Min = "0V";
        VDDS_PS.Typ = "VDDS_VEfuseP + fakeV {for fake char axis}";
        VDDS_PS.Max = "VDDS_VEfuseP";
        VDDA_PS.Min = "0V";
        VDDA_PS.Typ = "VDDA_VEfuseP + fakeV {for fake char axis}";
        VDDA_PS.Max = "VDDA_VEfuseP";
        VPP_PS.Min = "0V";
        VPP_PS.Typ = "VPP_VEfuseP + fakeV {for fake char axis}";
        VPP_PS.Max = "VPP_VEfuseP";
        Domain_3P3V_PS.Min = "0V";
        Domain_3P3V_PS.Typ = "Domain_3P3V_VEfuseP + fakeV {for fake char axis}";
        Domain_3P3V_PS.Max = "Domain_3P3V_VEfuseP";
        charEn_V_1_2_PS = "TRUE";
        charEn_V_3_3_PS = "TRUE";
    }
    __Category PS_VEfuseR {
        __Inherit CommonPSdata;
        twMCC_V = "'D'";
        vddCond = "'VEfuseR'";
        VDD_PS.Min = "0V";
        VDD_PS.Typ = "VDD_VEfuseR + fakeV {for fake char axis}";
        VDD_PS.Max = "VDD_VEfuseR";
        VDDEEPROM_PS.Min = "0V";
        VDDEEPROM_PS.Typ = "VDDEEPROM_VEfuseR + fakeV {for fake char axis}";
        VDDEEPROM_PS.Max = "VDDEEPROM_VEfuseR";
        VDDPGM_PS.Min = "0V";
        VDDPGM_PS.Typ = "VDDPGM_VEfuseR + fakeV {for fake char axis}";
        VDDPGM_PS.Max = "VDDPGM_VEfuseR";
        VNWA_PS.Min = "0V";
        VNWA_PS.Typ = "VNWA_VEfuseR + fakeV {for fake char axis}";
        VNWA_PS.Max = "VNWA_VEfuseR";
        VDDAR_PS.Min = "0V";
        VDDAR_PS.Typ = "VDDAR_VEfuseR + fakeV {for fake char axis}";
        VDDAR_PS.Max = "VDDAR_VEfuseR";
        VBAT_PS.Min = "0V";
        VBAT_PS.Typ = "VBAT_VEfuseR + fakeV {for fake char axis}";
        VBAT_PS.Max = "VBAT_VEfuseR";
        VDDS_PS.Min = "0V";
        VDDS_PS.Typ = "VDDS_VEfuseR + fakeV {for fake char axis}";
        VDDS_PS.Max = "VDDS_VEfuseR";
        VDDA_PS.Min = "0V";
        VDDA_PS.Typ = "VDDA_VEfuseR + fakeV {for fake char axis}";
        VDDA_PS.Max = "VDDA_VEfuseR";
        VPP_PS.Min = "0V";
        VPP_PS.Typ = "VPP_VEfuseR + fakeV {for fake char axis}";
        VPP_PS.Max = "VPP_VEfuseR";
        Domain_3P3V_PS.Min = "0V";
        Domain_3P3V_PS.Typ = "Domain_3P3V_VEfuseR + fakeV {for fake char axis}";
        Domain_3P3V_PS.Max = "Domain_3P3V_VEfuseR";
        charEn_V_1_2_PS = "TRUE";
        charEn_V_3_3_PS = "TRUE";
    }
    __Category PS_Vboxhi {
        __Inherit CommonPSdata;
        twMCC_V = "'H'";
        vddCond = "'Vboxhi'";
        VDD_PS.Min = "0V";
        VDD_PS.Typ = "VDD_Vboxhi + fakeV {for fake char axis}";
        VDD_PS.Max = "VDD_Vboxhi";
        VDDEEPROM_PS.Min = "0V";
        VDDEEPROM_PS.Typ = "VDDEEPROM_Vboxhi + fakeV {for fake char axis}";
        VDDEEPROM_PS.Max = "VDDEEPROM_Vboxhi";
        VDDPGM_PS.Min = "0V";
        VDDPGM_PS.Typ = "VDDPGM_Vboxhi + fakeV {for fake char axis}";
        VDDPGM_PS.Max = "VDDPGM_Vboxhi";
        VNWA_PS.Min = "0V";
        VNWA_PS.Typ = "VNWA_Vboxhi + fakeV {for fake char axis}";
        VNWA_PS.Max = "VNWA_Vboxhi";
        VDDAR_PS.Min = "0V";
        VDDAR_PS.Typ = "VDDAR_Vboxhi + fakeV {for fake char axis}";
        VDDAR_PS.Max = "VDDAR_Vboxhi";
        VBAT_PS.Min = "0V";
        VBAT_PS.Typ = "VBAT_Vboxhi + fakeV {for fake char axis}";
        VBAT_PS.Max = "VBAT_Vboxhi";
        VDDS_PS.Min = "0V";
        VDDS_PS.Typ = "VDDS_Vboxhi + fakeV {for fake char axis}";
        VDDS_PS.Max = "VDDS_Vboxhi";
        VDDA_PS.Min = "0V";
        VDDA_PS.Typ = "VDDA_Vboxhi + fakeV {for fake char axis}";
        VDDA_PS.Max = "VDDA_Vboxhi";
        VPP_PS.Min = "0V";
        VPP_PS.Typ = "VPP_Vboxhi + fakeV {for fake char axis}";
        VPP_PS.Max = "VPP_Vboxhi";
        Domain_3P3V_PS.Min = "0V";
        Domain_3P3V_PS.Typ = "Domain_3P3V_Vboxhi + fakeV {for fake char axis}";
        Domain_3P3V_PS.Max = "Domain_3P3V_Vboxhi";
        charEn_V_1_2_PS = "TRUE";
        charEn_V_3_3_PS = "TRUE";
    }
    __Category PS_VboxhiM {
        __Inherit CommonPSdata;
        twMCC_V = "'I'";
        vddCond = "'VboxhiM'";
        VDD_PS.Min = "0V";
        VDD_PS.Typ = "VDD_VboxhiM + fakeV {for fake char axis}";
        VDD_PS.Max = "VDD_VboxhiM";
        VDDEEPROM_PS.Min = "0V";
        VDDEEPROM_PS.Typ = "VDDEEPROM_VboxhiM + fakeV {for fake char axis}";
        VDDEEPROM_PS.Max = "VDDEEPROM_VboxhiM";
        VDDPGM_PS.Min = "0V";
        VDDPGM_PS.Typ = "VDDPGM_VboxhiM + fakeV {for fake char axis}";
        VDDPGM_PS.Max = "VDDPGM_VboxhiM";
        VNWA_PS.Min = "0V";
        VNWA_PS.Typ = "VNWA_VboxhiM + fakeV {for fake char axis}";
        VNWA_PS.Max = "VNWA_VboxhiM";
        VDDAR_PS.Min = "0V";
        VDDAR_PS.Typ = "VDDAR_VboxhiM + fakeV {for fake char axis}";
        VDDAR_PS.Max = "VDDAR_VboxhiM";
        VBAT_PS.Min = "0V";
        VBAT_PS.Typ = "VBAT_VboxhiM + fakeV {for fake char axis}";
        VBAT_PS.Max = "VBAT_VboxhiM";
        VDDS_PS.Min = "0V";
        VDDS_PS.Typ = "VDDS_VboxhiM + fakeV {for fake char axis}";
        VDDS_PS.Max = "VDDS_VboxhiM";
        VDDA_PS.Min = "0V";
        VDDA_PS.Typ = "VDDA_VboxhiM + fakeV {for fake char axis}";
        VDDA_PS.Max = "VDDA_VboxhiM";
        VPP_PS.Min = "0V";
        VPP_PS.Typ = "VPP_VboxhiM + fakeV {for fake char axis}";
        VPP_PS.Max = "VPP_VboxhiM";
        Domain_3P3V_PS.Min = "0V";
        Domain_3P3V_PS.Typ = "Domain_3P3V_VboxhiM + fakeV {for fake char axis}";
        Domain_3P3V_PS.Max = "Domain_3P3V_VboxhiM";
        charEn_V_1_2_PS = "TRUE";
        charEn_V_3_3_PS = "TRUE";
    }
    __Category PS_VboxhiP {
        __Inherit CommonPSdata;
        twMCC_V = "'J'";
        vddCond = "'VboxhiP'";
        VDD_PS.Min = "0V";
        VDD_PS.Typ = "VDD_VboxhiP + fakeV {for fake char axis}";
        VDD_PS.Max = "VDD_VboxhiP";
        VDDEEPROM_PS.Min = "0V";
        VDDEEPROM_PS.Typ = "VDDEEPROM_VboxhiP + fakeV {for fake char axis}";
        VDDEEPROM_PS.Max = "VDDEEPROM_VboxhiP";
        VDDPGM_PS.Min = "0V";
        VDDPGM_PS.Typ = "VDDPGM_VboxhiP + fakeV {for fake char axis}";
        VDDPGM_PS.Max = "VDDPGM_VboxhiP";
        VNWA_PS.Min = "0V";
        VNWA_PS.Typ = "VNWA_VboxhiP + fakeV {for fake char axis}";
        VNWA_PS.Max = "VNWA_VboxhiP";
        VDDAR_PS.Min = "0V";
        VDDAR_PS.Typ = "VDDAR_VboxhiP + fakeV {for fake char axis}";
        VDDAR_PS.Max = "VDDAR_VboxhiP";
        VBAT_PS.Min = "0V";
        VBAT_PS.Typ = "VBAT_VboxhiP + fakeV {for fake char axis}";
        VBAT_PS.Max = "VBAT_VboxhiP";
        VDDS_PS.Min = "0V";
        VDDS_PS.Typ = "VDDS_VboxhiP + fakeV {for fake char axis}";
        VDDS_PS.Max = "VDDS_VboxhiP";
        VDDA_PS.Min = "0V";
        VDDA_PS.Typ = "VDDA_VboxhiP + fakeV {for fake char axis}";
        VDDA_PS.Max = "VDDA_VboxhiP";
        VPP_PS.Min = "0V";
        VPP_PS.Typ = "VPP_VboxhiP + fakeV {for fake char axis}";
        VPP_PS.Max = "VPP_VboxhiP";
        Domain_3P3V_PS.Min = "0V";
        Domain_3P3V_PS.Typ = "Domain_3P3V_VboxhiP + fakeV {for fake char axis}";
        Domain_3P3V_PS.Max = "Domain_3P3V_VboxhiP";
        charEn_V_1_2_PS = "TRUE";
        charEn_V_3_3_PS = "TRUE";
    }
    __Category PS_Vboxlo {
        __Inherit CommonPSdata;
        twMCC_V = "'L'";
        vddCond = "'Vboxlo'";
        VDD_PS.Min = "0V";
        VDD_PS.Typ = "VDD_Vboxlo + fakeV {for fake char axis}";
        VDD_PS.Max = "VDD_Vboxlo";
        VDDEEPROM_PS.Min = "0V";
        VDDEEPROM_PS.Typ = "VDDEEPROM_Vboxlo + fakeV {for fake char axis}";
        VDDEEPROM_PS.Max = "VDDEEPROM_Vboxlo";
        VDDPGM_PS.Min = "0V";
        VDDPGM_PS.Typ = "VDDPGM_Vboxlo + fakeV {for fake char axis}";
        VDDPGM_PS.Max = "VDDPGM_Vboxlo";
        VNWA_PS.Min = "0V";
        VNWA_PS.Typ = "VNWA_Vboxlo + fakeV {for fake char axis}";
        VNWA_PS.Max = "VNWA_Vboxlo";
        VDDAR_PS.Min = "0V";
        VDDAR_PS.Typ = "VDDAR_Vboxlo + fakeV {for fake char axis}";
        VDDAR_PS.Max = "VDDAR_Vboxlo";
        VBAT_PS.Min = "0V";
        VBAT_PS.Typ = "VBAT_Vboxlo + fakeV {for fake char axis}";
        VBAT_PS.Max = "VBAT_Vboxlo";
        VDDS_PS.Min = "0V";
        VDDS_PS.Typ = "VDDS_Vboxlo + fakeV {for fake char axis}";
        VDDS_PS.Max = "VDDS_Vboxlo";
        VDDA_PS.Min = "0V";
        VDDA_PS.Typ = "VDDA_Vboxlo + fakeV {for fake char axis}";
        VDDA_PS.Max = "VDDA_Vboxlo";
        VPP_PS.Min = "0V";
        VPP_PS.Typ = "VPP_Vboxlo + fakeV {for fake char axis}";
        VPP_PS.Max = "VPP_Vboxlo";
        Domain_3P3V_PS.Min = "0V";
        Domain_3P3V_PS.Typ = "Domain_3P3V_Vboxlo + fakeV {for fake char axis}";
        Domain_3P3V_PS.Max = "Domain_3P3V_Vboxlo";
        charEn_V_1_2_PS = "TRUE";
        charEn_V_3_3_PS = "TRUE";
    }
    __Category PS_VboxloM {
        __Inherit CommonPSdata;
        twMCC_V = "'K'";
        vddCond = "'VboxloM'";
        VDD_PS.Min = "0V";
        VDD_PS.Typ = "VDD_VboxloM + fakeV {for fake char axis}";
        VDD_PS.Max = "VDD_VboxloM";
        VDDEEPROM_PS.Min = "0V";
        VDDEEPROM_PS.Typ = "VDDEEPROM_VboxloM + fakeV {for fake char axis}";
        VDDEEPROM_PS.Max = "VDDEEPROM_VboxloM";
        VDDPGM_PS.Min = "0V";
        VDDPGM_PS.Typ = "VDDPGM_VboxloM + fakeV {for fake char axis}";
        VDDPGM_PS.Max = "VDDPGM_VboxloM";
        VNWA_PS.Min = "0V";
        VNWA_PS.Typ = "VNWA_VboxloM + fakeV {for fake char axis}";
        VNWA_PS.Max = "VNWA_VboxloM";
        VDDAR_PS.Min = "0V";
        VDDAR_PS.Typ = "VDDAR_VboxloM + fakeV {for fake char axis}";
        VDDAR_PS.Max = "VDDAR_VboxloM";
        VBAT_PS.Min = "0V";
        VBAT_PS.Typ = "VBAT_VboxloM + fakeV {for fake char axis}";
        VBAT_PS.Max = "VBAT_VboxloM";
        VDDS_PS.Min = "0V";
        VDDS_PS.Typ = "VDDS_VboxloM + fakeV {for fake char axis}";
        VDDS_PS.Max = "VDDS_VboxloM";
        VDDA_PS.Min = "0V";
        VDDA_PS.Typ = "VDDA_VboxloM + fakeV {for fake char axis}";
        VDDA_PS.Max = "VDDA_VboxloM";
        VPP_PS.Min = "0V";
        VPP_PS.Typ = "VPP_VboxloM + fakeV {for fake char axis}";
        VPP_PS.Max = "VPP_VboxloM";
        Domain_3P3V_PS.Min = "0V";
        Domain_3P3V_PS.Typ = "Domain_3P3V_VboxloM + fakeV {for fake char axis}";
        Domain_3P3V_PS.Max = "Domain_3P3V_VboxloM";
        charEn_V_1_2_PS = "TRUE";
        charEn_V_3_3_PS = "TRUE";
    }
    __Category PS_VboxloP {
        __Inherit CommonPSdata;
        twMCC_V = "'O'";
        vddCond = "'VboxloP'";
        VDD_PS.Min = "0V";
        VDD_PS.Typ = "VDD_VboxloP + fakeV {for fake char axis}";
        VDD_PS.Max = "VDD_VboxloP";
        VDDEEPROM_PS.Min = "0V";
        VDDEEPROM_PS.Typ = "VDDEEPROM_VboxloP + fakeV {for fake char axis}";
        VDDEEPROM_PS.Max = "VDDEEPROM_VboxloP";
        VDDPGM_PS.Min = "0V";
        VDDPGM_PS.Typ = "VDDPGM_VboxloP + fakeV {for fake char axis}";
        VDDPGM_PS.Max = "VDDPGM_VboxloP";
        VNWA_PS.Min = "0V";
        VNWA_PS.Typ = "VNWA_VboxloP + fakeV {for fake char axis}";
        VNWA_PS.Max = "VNWA_VboxloP";
        VDDAR_PS.Min = "0V";
        VDDAR_PS.Typ = "VDDAR_VboxloP + fakeV {for fake char axis}";
        VDDAR_PS.Max = "VDDAR_VboxloP";
        VBAT_PS.Min = "0V";
        VBAT_PS.Typ = "VBAT_VboxloP + fakeV {for fake char axis}";
        VBAT_PS.Max = "VBAT_VboxloP";
        VDDS_PS.Min = "0V";
        VDDS_PS.Typ = "VDDS_VboxloP + fakeV {for fake char axis}";
        VDDS_PS.Max = "VDDS_VboxloP";
        VDDA_PS.Min = "0V";
        VDDA_PS.Typ = "VDDA_VboxloP + fakeV {for fake char axis}";
        VDDA_PS.Max = "VDDA_VboxloP";
        VPP_PS.Min = "0V";
        VPP_PS.Typ = "VPP_VboxloP + fakeV {for fake char axis}";
        VPP_PS.Max = "VPP_VboxloP";
        Domain_3P3V_PS.Min = "0V";
        Domain_3P3V_PS.Typ = "Domain_3P3V_VboxloP + fakeV {for fake char axis}";
        Domain_3P3V_PS.Max = "Domain_3P3V_VboxloP";
        charEn_V_1_2_PS = "TRUE";
        charEn_V_3_3_PS = "TRUE";
    }
    __Category PS_Vburnin {
        __Inherit CommonPSdata;
        twMCC_V = "'P'";
        vddCond = "'Vburnin'";
        VDD_PS.Min = "0V";
        VDD_PS.Typ = "VDD_Vburnin + fakeV {for fake char axis}";
        VDD_PS.Max = "VDD_Vburnin";
        VDDEEPROM_PS.Min = "0V";
        VDDEEPROM_PS.Typ = "VDDEEPROM_Vburnin + fakeV {for fake char axis}";
        VDDEEPROM_PS.Max = "VDDEEPROM_Vburnin";
        VDDPGM_PS.Min = "0V";
        VDDPGM_PS.Typ = "VDDPGM_Vburnin + fakeV {for fake char axis}";
        VDDPGM_PS.Max = "VDDPGM_Vburnin";
        VNWA_PS.Min = "0V";
        VNWA_PS.Typ = "VNWA_Vburnin + fakeV {for fake char axis}";
        VNWA_PS.Max = "VNWA_Vburnin";
        VDDAR_PS.Min = "0V";
        VDDAR_PS.Typ = "VDDAR_Vburnin + fakeV {for fake char axis}";
        VDDAR_PS.Max = "VDDAR_Vburnin";
        VBAT_PS.Min = "0V";
        VBAT_PS.Typ = "VBAT_Vburnin + fakeV {for fake char axis}";
        VBAT_PS.Max = "VBAT_Vburnin";
        VDDS_PS.Min = "0V";
        VDDS_PS.Typ = "VDDS_Vburnin + fakeV {for fake char axis}";
        VDDS_PS.Max = "VDDS_Vburnin";
        VDDA_PS.Min = "0V";
        VDDA_PS.Typ = "VDDA_Vburnin + fakeV {for fake char axis}";
        VDDA_PS.Max = "VDDA_Vburnin";
        VPP_PS.Min = "0V";
        VPP_PS.Typ = "VPP_Vburnin + fakeV {for fake char axis}";
        VPP_PS.Max = "VPP_Vburnin";
        Domain_3P3V_PS.Min = "0V";
        Domain_3P3V_PS.Typ = "Domain_3P3V_Vburnin + fakeV {for fake char axis}";
        Domain_3P3V_PS.Max = "Domain_3P3V_Vburnin";
        charEn_V_1_2_PS = "TRUE";
        charEn_V_3_3_PS = "TRUE";
    }
    __Category PS_Vmax {
        __Inherit CommonPSdata;
        twMCC_V = "'X'";
        vddCond = "'Vmax'";
        VDD_PS.Min = "0V";
        VDD_PS.Typ = "VDD_Vmax + fakeV {for fake char axis}";
        VDD_PS.Max = "VDD_Vmax";
        VDDEEPROM_PS.Min = "0V";
        VDDEEPROM_PS.Typ = "VDDEEPROM_Vmax + fakeV {for fake char axis}";
        VDDEEPROM_PS.Max = "VDDEEPROM_Vmax";
        VDDPGM_PS.Min = "0V";
        VDDPGM_PS.Typ = "VDDPGM_Vmax + fakeV {for fake char axis}";
        VDDPGM_PS.Max = "VDDPGM_Vmax";
        VNWA_PS.Min = "0V";
        VNWA_PS.Typ = "VNWA_Vmax + fakeV {for fake char axis}";
        VNWA_PS.Max = "VNWA_Vmax";
        VDDAR_PS.Min = "0V";
        VDDAR_PS.Typ = "VDDAR_Vmax + fakeV {for fake char axis}";
        VDDAR_PS.Max = "VDDAR_Vmax";
        VBAT_PS.Min = "0V";
        VBAT_PS.Typ = "VBAT_Vmax + fakeV {for fake char axis}";
        VBAT_PS.Max = "VBAT_Vmax";
        VDDS_PS.Min = "0V";
        VDDS_PS.Typ = "VDDS_Vmax + fakeV {for fake char axis}";
        VDDS_PS.Max = "VDDS_Vmax";
        VDDA_PS.Min = "0V";
        VDDA_PS.Typ = "VDDA_Vmax + fakeV {for fake char axis}";
        VDDA_PS.Max = "VDDA_Vmax";
        VPP_PS.Min = "0V";
        VPP_PS.Typ = "VPP_Vmax + fakeV {for fake char axis}";
        VPP_PS.Max = "VPP_Vmax";
        Domain_3P3V_PS.Min = "0V";
        Domain_3P3V_PS.Typ = "Domain_3P3V_Vmax + fakeV {for fake char axis}";
        Domain_3P3V_PS.Max = "Domain_3P3V_Vmax";
        charEn_V_1_2_PS = "TRUE";
        charEn_V_3_3_PS = "TRUE";
    }
    __Category PS_Vmin {
        __Inherit CommonPSdata;
        twMCC_V = "'M'";
        vddCond = "'Vmin'";
        VDD_PS.Min = "0V";
        VDD_PS.Typ = "VDD_Vmin + fakeV {for fake char axis}";
        VDD_PS.Max = "VDD_Vmin";
        VDDEEPROM_PS.Min = "0V";
        VDDEEPROM_PS.Typ = "VDDEEPROM_Vmin + fakeV {for fake char axis}";
        VDDEEPROM_PS.Max = "VDDEEPROM_Vmin";
        VDDPGM_PS.Min = "0V";
        VDDPGM_PS.Typ = "VDDPGM_Vmin + fakeV {for fake char axis}";
        VDDPGM_PS.Max = "VDDPGM_Vmin";
        VNWA_PS.Min = "0V";
        VNWA_PS.Typ = "VNWA_Vmin + fakeV {for fake char axis}";
        VNWA_PS.Max = "VNWA_Vmin";
        VDDAR_PS.Min = "0V";
        VDDAR_PS.Typ = "VDDAR_Vmin + fakeV {for fake char axis}";
        VDDAR_PS.Max = "VDDAR_Vmin";
        VBAT_PS.Min = "0V";
        VBAT_PS.Typ = "VBAT_Vmin + fakeV {for fake char axis}";
        VBAT_PS.Max = "VBAT_Vmin";
        VDDS_PS.Min = "0V";
        VDDS_PS.Typ = "VDDS_Vmin + fakeV {for fake char axis}";
        VDDS_PS.Max = "VDDS_Vmin";
        VDDA_PS.Min = "0V";
        VDDA_PS.Typ = "VDDA_Vmin + fakeV {for fake char axis}";
        VDDA_PS.Max = "VDDA_Vmin";
        VPP_PS.Min = "0V";
        VPP_PS.Typ = "VPP_Vmin + fakeV {for fake char axis}";
        VPP_PS.Max = "VPP_Vmin";
        Domain_3P3V_PS.Min = "0V";
        Domain_3P3V_PS.Typ = "Domain_3P3V_Vmin + fakeV {for fake char axis}";
        Domain_3P3V_PS.Max = "Domain_3P3V_Vmin";
        charEn_V_1_2_PS = "TRUE";
        charEn_V_3_3_PS = "TRUE";
    }
    __Category PS_Vnom {
        __Inherit CommonPSdata;
        twMCC_V = "'N'";
        vddCond = "'Vnom'";
        VDD_PS.Min = "0V";
        VDD_PS.Typ = "VDD_Vnom + fakeV {for fake char axis}";
        VDD_PS.Max = "VDD_Vnom";
        VDDEEPROM_PS.Min = "0V";
        VDDEEPROM_PS.Typ = "VDDEEPROM_Vnom + fakeV {for fake char axis}";
        VDDEEPROM_PS.Max = "VDDEEPROM_Vnom";
        VDDPGM_PS.Min = "0V";
        VDDPGM_PS.Typ = "VDDPGM_Vnom + fakeV {for fake char axis}";
        VDDPGM_PS.Max = "VDDPGM_Vnom";
        VNWA_PS.Min = "0V";
        VNWA_PS.Typ = "VNWA_Vnom + fakeV {for fake char axis}";
        VNWA_PS.Max = "VNWA_Vnom";
        VDDAR_PS.Min = "0V";
        VDDAR_PS.Typ = "VDDAR_Vnom + fakeV {for fake char axis}";
        VDDAR_PS.Max = "VDDAR_Vnom";
        VBAT_PS.Min = "0V";
        VBAT_PS.Typ = "VBAT_Vnom + fakeV {for fake char axis}";
        VBAT_PS.Max = "VBAT_Vnom";
        VDDS_PS.Min = "0V";
        VDDS_PS.Typ = "VDDS_Vnom + fakeV {for fake char axis}";
        VDDS_PS.Max = "VDDS_Vnom";
        VDDA_PS.Min = "0V";
        VDDA_PS.Typ = "VDDA_Vnom + fakeV {for fake char axis}";
        VDDA_PS.Max = "VDDA_Vnom";
        VPP_PS.Min = "0V";
        VPP_PS.Typ = "VPP_Vnom + fakeV {for fake char axis}";
        VPP_PS.Max = "VPP_Vnom";
        Domain_3P3V_PS.Min = "0V";
        Domain_3P3V_PS.Typ = "Domain_3P3V_Vnom + fakeV {for fake char axis}";
        Domain_3P3V_PS.Max = "Domain_3P3V_Vnom";
        charEn_V_1_2_PS = "TRUE";
        charEn_V_3_3_PS = "TRUE";
    }
    __Category PS_Vstress {
        __Inherit CommonPSdata;
        twMCC_V = "'Q'";
        vddCond = "'Vstress'";
        VDD_PS.Min = "0V";
        VDD_PS.Typ = "VDD_Vstress + fakeV {for fake char axis}";
        VDD_PS.Max = "VDD_Vstress";
        VDDEEPROM_PS.Min = "0V";
        VDDEEPROM_PS.Typ = "VDDEEPROM_Vstress + fakeV {for fake char axis}";
        VDDEEPROM_PS.Max = "VDDEEPROM_Vstress";
        VDDPGM_PS.Min = "0V";
        VDDPGM_PS.Typ = "VDDPGM_Vstress + fakeV {for fake char axis}";
        VDDPGM_PS.Max = "VDDPGM_Vstress";
        VNWA_PS.Min = "0V";
        VNWA_PS.Typ = "VNWA_Vstress + fakeV {for fake char axis}";
        VNWA_PS.Max = "VNWA_Vstress";
        VDDAR_PS.Min = "0V";
        VDDAR_PS.Typ = "VDDAR_Vstress + fakeV {for fake char axis}";
        VDDAR_PS.Max = "VDDAR_Vstress";
        VBAT_PS.Min = "0V";
        VBAT_PS.Typ = "VBAT_Vstress + fakeV {for fake char axis}";
        VBAT_PS.Max = "VBAT_Vstress";
        VDDS_PS.Min = "0V";
        VDDS_PS.Typ = "VDDS_Vstress + fakeV {for fake char axis}";
        VDDS_PS.Max = "VDDS_Vstress";
        VDDA_PS.Min = "0V";
        VDDA_PS.Typ = "VDDA_Vstress + fakeV {for fake char axis}";
        VDDA_PS.Max = "VDDA_Vstress";
        VPP_PS.Min = "0V";
        VPP_PS.Typ = "VPP_Vstress + fakeV {for fake char axis}";
        VPP_PS.Max = "VPP_Vstress";
        Domain_3P3V_PS.Min = "0V";
        Domain_3P3V_PS.Typ = "Domain_3P3V_Vstress + fakeV {for fake char axis}";
        Domain_3P3V_PS.Max = "Domain_3P3V_Vstress";
        charEn_V_1_2_PS = "TRUE";
        charEn_V_3_3_PS = "TRUE";
    }
    __ParamGlobals {
            twMCC_V { __Type = STRING; __Comment = "Voltage portion of testware variable"; }
            vddCond { __Type = STRING; __Comment = "VDD condition output to the dataViewer"; }
            fakeV { __Type = V; __Comment = "Voltage used in a fake axis to allow characterization searches"; }
            V_1_2_PS { __Type = V; }
            V_3_3_PS { __Type = V; }
            VDD_PS { __Type = V; }
            VDDEEPROM_PS { __Type = V; }
            VDDPGM_PS { __Type = V; }
            VNWA_PS { __Type = V; }
            VDDAR_PS { __Type = V; }
            VBAT_PS { __Type = V; }
            VDDS_PS { __Type = V; }
            VDDA_PS { __Type = V; }
            VPP_PS { __Type = V; }
            Domain_3P3V_PS { __Type = V; }
            charEn_V_1_2_PS { __Type = BOOLEAN; __Comment = "TBD"; }
            charID_V_1_2_PS { __Type = STRING; __Comment = "TBD"; }
            charEn_V_3_3_PS { __Type = BOOLEAN; __Comment = "TBD"; }
            charID_V_3_3_PS { __Type = STRING; __Comment = "TBD"; }
            charEn_VDD_PS { __Type = BOOLEAN; __Comment = "TBD"; }
            charID_VDD_PS { __Type = STRING; __Comment = "TBD"; }
            charEn_VDDEEPROM_PS { __Type = BOOLEAN; __Comment = "TBD"; }
            charID_VDDEEPROM_PS { __Type = STRING; __Comment = "TBD"; }
            charEn_VDDPGM_PS { __Type = BOOLEAN; __Comment = "TBD"; }
            charID_VDDPGM_PS { __Type = STRING; __Comment = "TBD"; }
            charEn_VNWA_PS { __Type = BOOLEAN; __Comment = "TBD"; }
            charID_VNWA_PS { __Type = STRING; __Comment = "TBD"; }
            charEn_VDDAR_PS { __Type = BOOLEAN; __Comment = "TBD"; }
            charID_VDDAR_PS { __Type = STRING; __Comment = "TBD"; }
            charEn_VBAT_PS { __Type = BOOLEAN; __Comment = "TBD"; }
            charID_VBAT_PS { __Type = STRING; __Comment = "TBD"; }
            charEn_VDDS_PS { __Type = BOOLEAN; __Comment = "TBD"; }
            charID_VDDS_PS { __Type = STRING; __Comment = "TBD"; }
            charEn_VDDA_PS { __Type = BOOLEAN; __Comment = "TBD"; }
            charID_VDDA_PS { __Type = STRING; __Comment = "TBD"; }
            charEn_VPP_PS { __Type = BOOLEAN; __Comment = "TBD"; }
            charID_VPP_PS { __Type = STRING; __Comment = "TBD"; }
            charEn_Domain_3P3V_PS { __Type = BOOLEAN; __Comment = "TBD"; }
            charID_Domain_3P3V_PS { __Type = STRING; __Comment = "TBD"; }
            CharVoltageStep { __Type = V; }
    }
}
__Spec CTSpec {
    __Category CTData {
        VStart = "-1.5V";
        VStop = "1.5V";
        VStep = "25mV";
        PinNum = "0";
    }
    __ParamGlobals {
            VStart { __Type = V; }
            VStop { __Type = V; }
            VStep { __Type = V; }
            PinNum { __Type = SCALAR; }
    }
}
