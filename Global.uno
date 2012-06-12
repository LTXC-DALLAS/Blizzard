Unison:U1.0c:S5.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/Global.evo                                     */
/* Creation Date  : Tue Jan  3 17:12:34 2012                                  */
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

/************************/
/*** Tester Variables ***/
/************************/
__OperatorVariable TIFocusCal {
    __Comment = "TRUE enables running of FocusCal, FALSE loads from disk";
    __Expression = __Expression { __String = "TRUE"; }
    __UserMode = Production;
}

/***************************/
/*** Test Type Variables ***/
/***************************/
__OperatorVariable TIAdapterBoard {
    __Comment = "An expression that will select the AdapterBoard based on TITestType, TIDeviceType, etc";
    __Expression = __Expression { __String = "select(TIDeviceType, 'Blizard_HybridEVA_DmdX_x1_AdapterBoard')"; }
    __UserMode = Production;
}

__OperatorVariable TIBinMap {
    __Comment = "An expression that will select the BinMap based on TITestType";
    __Expression = __Expression { __String = "select(TITestType, 'ATSite_BinMap_Probe','ATSite_BinMap_Final','ATSite_BinMap_Qual','ATSite_BinMap_DPSE','ATSite_BinMap_BoardChk')"; }
    __UserMode = Production;
}

__OperatorVariable TIFlow {
    __Comment = "An expression that will select the Testflow based on TITestType";
    __Expression = __Expression { __String = "select(TITestType, 'Probe_FLOW','Final_FLOW','Qual_FLOW','DPSE_FLOW','BoardChk_FLOW')"; }
    __UserMode = Production;
}

/*****************************/
/*** Engineering Variables ***/
/*****************************/

__OperatorVariable TIPrintTimings {
    __Comment = "";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable printTWPDL {
    __Comment = "Turns on TestWarePrintSpec";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable printTWLimits {
    __Comment = "Prints Test Ware variables and limits file in test program Directory";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable RunAllTests {
    __Comment = "Turns on ContinueOnFail";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable CharacterizeDevice {
    __Comment = "Turns on ContinueOnFail and Fsearch/Vsearch on every Nth device";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable charMem {
    __Comment = "Enables char microflows for memory GNG and diag tests";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable charMemVdd {
    __Comment = "Enables char of VDD supply in GNG and diag tests";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable charMemFreq {
    __Comment = "Enables char of Frequency in GNG and diag tests";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable FSearch_Vboxlo {
    __Comment = "Do Frequency Search for Vboxlo";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable VSearch_Vboxlo {
    __Comment = "Do Vmin Search for Vboxlo";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable FSearch_VboxloM {
    __Comment = "Do Frequency Search for VboxloM";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable VSearch_VboxloM {
    __Comment = "Do Vmin Search for VboxloM";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable FSearch_VboxloP {
    __Comment = "Do Frequency Search for VboxloP";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable VSearch_VboxloP {
    __Comment = "Do Vmin Search for VboxloP";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable FSearch_Vmin {
    __Comment = "Do Frequency Search for Vmin";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable VSearch_Vmin {
    __Comment = "Do Vmin Search for Vmin";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable FSearch_Vnom {
    __Comment = "Do Frequency Search for Vnom";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable VSearch_Vnom {
    __Comment = "Do Vmin Search for Vnom";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable FSearch_Vmax {
    __Comment = "Do Frequency Search for Vmax";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable VSearch_Vmax {
    __Comment = "Do Vmin Search for Vmax";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable FSearch_Vboxhi {
    __Comment = "Do Frequency Search for Vboxhi";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable VSearch_Vboxhi {
    __Comment = "Do Vmin Search for Vboxhi";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable FSearch_VboxhiM {
    __Comment = "Do Frequency Search for VboxhiM";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable VSearch_VboxhiM {
    __Comment = "Do Vmin Search for VboxhiM";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable FSearch_VboxhiP {
    __Comment = "Do Frequency Search for VboxhiP";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable VSearch_VboxhiP {
    __Comment = "Do Vmin Search for VboxhiP";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable FSearch_Vstress {
    __Comment = "Do Frequency Search for Vstress";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable VSearch_Vstress {
    __Comment = "Do Vmin Search for Vstress";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable FSearch_VEfuseP {
    __Comment = "Do Frequency Search for VEfuseP";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable VSearch_VEfuseP {
    __Comment = "Do Vmin Search for VEfuseP";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable FSearch_VEfuseR {
    __Comment = "Do Frequency Search for VEfuseR";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable VSearch_VEfuseR {
    __Comment = "Do Vmin Search for VEfuseR";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable FSearch_Vburnin {
    __Comment = "Do Frequency Search for Vburnin";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable VSearch_Vburnin {
    __Comment = "Do Vmin Search for Vburnin";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable EnaBistDlog {
    __Comment = "Enables verbose data dump mode for TIMemoryBIST test method.";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable EnaSolnDlog {
    __Comment = "Enables verbose data dump mode for TIRedundancy MicroFlow event.";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

__OperatorVariable EnaReadOnly {
    __Comment = "Enables READ-ONLY mode in TIEfuseRepair MicroFlow event. No Fuses Programmed";
    __Expression = __Expression { __String = "FALSE OR ContinueOnFail"; }
    __UserMode = Production;
}

__OperatorVariable EnaEfuseDlog {
    __Comment = "Enables verbose data dump mode for TIEfuseRepair MicroFlow event.";
    __Expression = __Expression { __String = "FALSE"; }
    __UserMode = Production;
}

/****************************************************************/
/*** Declare all "Constants" in the Globals_Typ Spec Object.  ***/
/*** Constants here means that the parameter's .Meas will not ***/
/*** be used, only the .Typ will be used.                     ***/
/****************************************************************/

__Spec Globals_Typ {
    __Category Constants {
        GlobalIndex = "0";
        DCDataSelect = "TITestTemp";
        jzCadenceExpr = "strcat(skip('',TIPrintf('jzCadenceExpr.Meas,s',jzCadenceExpr.Meas,'')),jzCadenceExpr.Meas)";
        jzCadenceReal = "0.0";
        jzCadencePinExpr = "strcat(skip('',TIPrintf('jzCadencePinExpr.Meas,s','%p',jzCadencePinExpr.Meas)),jzCadencePinExpr.Meas)";
        jzCadenceInt = "0";
        jzCadenceRealLoLimit = "0.0";
        jzCadenceRealHiLimit = "0.0";
        jzCadenceRealArr = "SimpleArray(8,0.0)";
        jzCadenceRealArr2 = "SimpleArray(4,0.0)";
        jzCadenceString = "''";
        jzCadenceString2 = "''";
        jzCadenceTWvar = "''";
        jzCadenceTWunits = "''";
        jzCadence2twMin.Min = "TWPDLDataLogVariable(jzCadenceTWvar.Meas,jzCadenceInt.Meas,TWDataType:TWMinimumData)";
        jzCadence2twMin.Typ = "TWPDLDataLogText(jzCadenceTWvar.Meas,jzCadenceString.Meas,TWDataType:TWMinimumData)";
        jzCadence2twMin.Max = "TWPDLDataLogRealVariable(jzCadenceTWvar.Meas,jzCadenceTWunits.Meas,jzCadenceReal.Meas,TWDataType:TWMinimumData)";
        jzCadence2twNom.Min = "TWPDLDataLogVariable(jzCadenceTWvar.Meas,jzCadenceInt.Meas,TWDataType:TWNominalData)";
        jzCadence2twNom.Typ = "TWPDLDataLogText(jzCadenceTWvar.Meas,jzCadenceString.Meas,TWDataType:TWNominalData)";
        jzCadence2twNom.Max = "TWPDLDataLogRealVariable(jzCadenceTWvar.Meas,jzCadenceTWunits.Meas,jzCadenceReal.Meas,TWDataType:TWNominalData)";
        jzCadence2twExt.Min = "TWPDLDataLogVariable(jzCadenceTWvar.Meas,jzCadenceInt.Meas,TWDataType:TWExtendedData)";
        jzCadence2twExt.Typ = "TWPDLDataLogText(jzCadenceTWvar.Meas,jzCadenceString.Meas,TWDataType:TWExtendedData)";
        jzCadence2twExt.Max = "TWPDLDataLogRealVariable(jzCadenceTWvar.Meas,jzCadenceTWunits.Meas,jzCadenceReal.Meas,TWDataType:TWExtendedData)";
        jzCadence2twExh.Min = "TWPDLDataLogVariable(jzCadenceTWvar.Meas,jzCadenceInt.Meas,TWDataType:TWExhaustiveData)";
        jzCadence2twExh.Typ = "TWPDLDataLogText(jzCadenceTWvar.Meas,jzCadenceString.Meas,TWDataType:TWExhaustiveData)";
        jzCadence2twExh.Max = "TWPDLDataLogRealVariable(jzCadenceTWvar.Meas,jzCadenceTWunits.Meas,jzCadenceReal.Meas,TWDataType:TWExhaustiveData)";
    }
    __ParamGlobals {
            GlobalIndex { __Type = SCALAR; }
            DCDataSelect { __Type = SCALAR; }
            jzCadenceExpr { __Type = STRING; __Comment = "used by Cadence modules to execute enVision expressions"; }
            jzCadenceReal { __Type = SCALAR; __Comment = "used by Cadence modules - holds values to be sent to TW"; }
            jzCadencePinExpr { __Type = STRING; __Comment = "used by Cadence modules to execute enVision expressions"; }
            jzCadencePin { __Type = PIN; __Comment = "used by Cadence modules"; }
            jzCadenceInt { __Type = INTEGER; __Comment = "used by Cadence modules - holds values to be sent to TW"; }
            jzCadenceRealLoLimit { __Type = SCALAR; __Comment = "used by Cadence modules - holds values to be sent to TW"; }
            jzCadenceRealHiLimit { __Type = SCALAR; __Comment = "used by Cadence modules - holds values to be sent to TW"; }
            jzCadenceRealArr { __Type = SCALAR[SCALAR]; __Comment = "used by Cadence modules - holds values to be sent to TW"; }
            jzCadenceRealArr2 { __Type = SCALAR[SCALAR]; __Comment = "used by Cadence modules - holds values to be sent to TW"; }
            jzCadenceString { __Type = STRING; __Comment = "used by Cadence modules - holds values to be sent to TW"; }
            jzCadenceString2 { __Type = STRING; __Comment = "used by Cadence modules - holds values to be sent to TW"; }
            jzCadenceTWvar { __Type = STRING; __Comment = "used by Cadence modules - holds twVar names to be sent to TW"; }
            jzCadenceTWunits { __Type = STRING; __Comment = "used by Cadence modules - holds twVar names to be sent to TW"; }
            jzCadence2twMin { __Type = BOOLEAN; __Comment = "used by Cadence modules to send data to testware"; }
            jzCadence2twNom { __Type = BOOLEAN; __Comment = "used by Cadence modules to send data to testware"; }
            jzCadence2twExt { __Type = BOOLEAN; __Comment = "used by Cadence modules to send data to testware"; }
            jzCadence2twExh { __Type = BOOLEAN; __Comment = "used by Cadence modules to send data to testware"; }
    }
}
/***************************************************************/
/*** Declare all "Variables" in the Globals_Meas Spec Object ***/
/*** Variables here means that the parameter's .Meas will    ***/
/*** be used; the .Typ will not be used. The associated Mask ***/
/*** object uses the .Meas.                                  ***/
/***                                                         ***/
/*** When adding new parameters to Globals, also need to add ***/
/*** appropriate mask assignment in masks.evo, and           ***/
/*** initialize in utility.evo.                              ***/
/***************************************************************/

__Spec Globals_Meas {
    __Category GlobalMeasDefaults {
        GlobalMeasIndex = "0";
        TestWareDataLog = "FALSE";
        ContinueOnFail = "FALSE OR CharacterizeDevice OR RunAllTests";
        TestWarePrintSpec = "FALSE OR printTWPDL";
        newVarsFile = "FALSE";
        CharNthDevice = "int(10)";
        CharDevCount = "int(-1)";
        GlobalNotBinned = "TRUE";
        BinName = "'GOOD_UNIT'";
        GlobalResult = "FALSE";
        CurThread = "-1";
        rowsPerThread = "0";
        CharCurColumnIndex = "0";
        CharCurTWPDLvarNameStr = "UNKNOWN_1";
        CharCurTWPDLvarNameBase = "UNKNOWN_";
        CharStepResult = "TRUE";
        ResetStressTime = "TRUE";
        CharPerColCountFsearch = "SimpleArray(291,0)";
        CharPerColCountVsearch = "SimpleArray(291,0)";
        CharAnySearch = "FALSE OR CharacterizeDevice";
        CharAnyFsearch = "TRUE";
        CharAnyVsearch = "TRUE";
        PerPinCharDC = "FALSE";
        CRES_worstpin_min = "AIN04_193";
        CRES_worstpin_min_read = "99Ohm";
        CRES_worstpin_max = "AIN04_193";
        CRES_worstpin_max_read = "99Ohm";
        CRES_mean_read = "99Ohm";
        OpensFailFlag = "FALSE";
        ShortsFailFlag = "FALSE";
        Pin2PinShortsFlag = "FALSE";
        AnalogOpensFailFlag = "FALSE";
        AnalogShortsFailFlag = "FALSE";
        SupplyOpensFailFlag = "FALSE";
        SupplyShortsFailFlag = "FALSE";
        GlobalRedFailFlag = "FALSE";
        PreRepair = "TRUE";
        FailsToCollect = "10000";
        binary_string = "''";
        ChkDiagsVboxhiFailFlag = "FALSE";
        LogDiagsVboxhiFailFlag = "FALSE";
        MemGNGVboxhiResultFlag = "FALSE";
        ChkDiagsVboxloFailFlag = "FALSE";
        LogDiagsVboxloFailFlag = "FALSE";
        MemGNGVboxloResultFlag = "FALSE";
        NonRepDiagFailFlag = "FALSE";
        MemRepaired = "FALSE";
        MemUnrepairable = "FALSE";
        TIReProbe = "FALSE";
        DataNDTimeOut = "2s";
        ESDAProgName = "'I1111M00'";
        twMCC = "strcat('_',twMCC_V,twMCC_F,twMCC_S,'_')";
        twMCC_S = "if( strlen(strstr(twTest,'Post'))>0,'A', if(strlen(strstr(twTest,'Pre'))>0,'B','') )";
        twBase = "strcat(twMCC, twMDC)";
        twVar = "strcat(twVar1, '_', twOPT)";
        twVar1 = "strcat(twMTC, twBase)";
        printf_str = "''";
        OCP_Res = "0.0";
        OCP_Res1 = "0.0";
        twVarsFile = "strcat(TestProgData.PathName, '/twVarLimits.vars,', if(newVarsFile, skip('n',FALSE->newVarsFile),'a'))";
        xtrSelStr = "''";
        xtrNum = "1";
        NullDutIMeas = "SimpleArray(26,0.0A)";
        NullDutErr = "SimpleArray(26,0.0V)";
        ODPResValues = "SimpleArray(100,0Ohm)";
        Iddq_Vboxlo_VDDAR_post = "SimpleArray(20, 999.99A)";
        Iddq_Vboxlo_VDDAR_pre = "SimpleArray(20, 999.99A)";
        Iddq_Vboxlo_VDDA_post = "SimpleArray(20, 999.99A)";
        Iddq_Vboxlo_VDDA_pre = "SimpleArray(20, 999.99A)";
        Iddq_Vboxlo_VDDS_post = "SimpleArray(20, 999.99A)";
        Iddq_Vboxlo_VDDS_pre = "SimpleArray(20, 999.99A)";
        Iddq_Vboxlo_VDD_post = "SimpleArray(20, 999.99A)";
        Iddq_Vboxlo_VDD_pre = "SimpleArray(20, 999.99A)";
        Iddq_Vburnin_VDD = "SimpleArray(20, 999.99A)";
        Iddq_Vburnin_VDDA = "SimpleArray(20, 999.99A)";
        Iddq_Vburnin_VDDAR = "SimpleArray(20, 999.99A)";
        Iddq_Vburnin_VDDS = "SimpleArray(20, 999.99A)";
        Iddq_Vmax_VDD = "SimpleArray(20, 999.99A)";
        Iddq_Vmax_VDDA = "SimpleArray(20, 999.99A)";
        Iddq_Vmax_VDDAR = "SimpleArray(20, 999.99A)";
        Iddq_Vmax_VDDS = "SimpleArray(20, 999.99A)";
    }
    __ParamGlobals {
            GlobalMeasIndex { __Type = SCALAR; }
            TestWareDataLog { __Type = BOOLEAN; __Comment = "Print TestWare variables at end"; }
            ContinueOnFail { __Type = BOOLEAN; __Comment = "Do I continue testing if I failed? - default (FALSE OR CharacterizeDevice OR RunAllTests)"; }
            TestWarePrintSpec { __Type = BOOLEAN; __Comment = "Print TestWare variable spec inline"; }
            newVarsFile { __Type = BOOLEAN; __Comment = "Creates new TestWare variables limits file"; }
            CharNthDevice { __Type = INTEGER; __Comment = "Characterize Every Nth Device"; }
            CharDevCount { __Type = INTEGER; __Comment = "Count to Nth device above"; }
            GlobalNotBinned { __Type = BOOLEAN; __Comment = "Track if binned yet - used for binning inside the flow"; }
            BinName { __Type = STRING; __Comment = "The Name of the Bin device will end up in.  Set upon the first fail?"; }
            GlobalResult { __Type = BOOLEAN; __Comment = "Whether we have already FAILED yet - globally."; }
            CurThread { __Type = INTEGER; __Comment = "The current thread for characterization, -1=no thread"; }
            rowsPerThread { __Type = INTEGER; __Comment = "The number of rows in a thread"; }
            CharCurColumnIndex { __Type = INTEGER; __Comment = "The id-number for the current column for characterization tracking"; }
            CharCurTWPDLvarNameStr { __Type = STRING; __Comment = "The variable name for the calculated testware variable"; }
            CharCurTWPDLvarNameBase { __Type = STRING; __Comment = "The variable used for as part of the calculated testware variable"; }
            CharStepResult { __Type = BOOLEAN; __Comment = "The variable used for to pass\/fail in each step of characterization searches"; }
            ResetStressTime { __Type = BOOLEAN; __Comment = "The variable used to Reset Timer 0 in Stress Test"; }
            CharPerColCountFsearch { __Type = SCALAR[INTEGER]; __Comment = "Fsearch count per column"; }
            CharPerColCountVsearch { __Type = SCALAR[INTEGER]; __Comment = "Vsearch count per column"; }
            CharRealVal { __Type = SCALAR; __Comment = "Real Characterization Value"; }
            CharRealLower { __Type = SCALAR; __Comment = "Lower Limit for Characterization Value"; }
            CharRealUpper { __Type = SCALAR; __Comment = "Upper Limit for Characterization Value"; }
            CharRealUnits { __Type = STRING; __Comment = "Unit String for Characterization Value"; }
            CharAnySearch { __Type = BOOLEAN; __Comment = "Whether to do Any per-pattern-list Characterization"; }
            CharAnyFsearch { __Type = BOOLEAN; __Comment = "Whether to do Any Frequency per-pattern-list Characterization"; }
            CharAnyVsearch { __Type = BOOLEAN; __Comment = "Whether to do Any Voltage per-pattern-list Characterization"; }
            PerPinCharDC { __Type = BOOLEAN; __Comment = "Whether to do per-pin DC Characterization"; }
            CRES_worstpin_min { __Type = PIN; }
            CRES_worstpin_min_read { __Type = Ohm; }
            CRES_worstpin_max { __Type = PIN; }
            CRES_worstpin_max_read { __Type = Ohm; }
            CRES_mean_read { __Type = Ohm; }
            OpensFailFlag { __Type = BOOLEAN; }
            ShortsFailFlag { __Type = BOOLEAN; }
            Pin2PinShortsFlag { __Type = BOOLEAN; }
            AnalogOpensFailFlag { __Type = BOOLEAN; }
            AnalogShortsFailFlag { __Type = BOOLEAN; }
            SupplyOpensFailFlag { __Type = BOOLEAN; }
            SupplyShortsFailFlag { __Type = BOOLEAN; }
            GlobalRedFailFlag { __Type = BOOLEAN; }
            PreRepair { __Type = BOOLEAN; }
            FailsToCollect { __Type = INTEGER; }
            binary_string { __Type = STRING; }
            ChkDiagsVboxhiFailFlag { __Type = BOOLEAN; }
            LogDiagsVboxhiFailFlag { __Type = BOOLEAN; }
            MemGNGVboxhiResultFlag { __Type = BOOLEAN; }
            ChkDiagsVboxloFailFlag { __Type = BOOLEAN; }
            LogDiagsVboxloFailFlag { __Type = BOOLEAN; }
            MemGNGVboxloResultFlag { __Type = BOOLEAN; }
            NonRepDiagFailFlag { __Type = BOOLEAN; }
            MemRepaired { __Type = BOOLEAN; }
            MemUnrepairable { __Type = BOOLEAN; }
            TIReProbe { __Type = BOOLEAN; }
            DataNDTimeOut { __Type = s; }
            ESDAProgName { __Type = STRING; }
            twTest { __Type = STRING; __Comment = "Indicates which test we are in"; }
            twMDC { __Type = STRING; __Comment = "Indicates Measurement Description Code"; }
            twMTC { __Type = STRING; __Comment = "Indicates Measurement __Type Code"; }
            twMCC { __Type = STRING; __Comment = "Indicates Measurement Condition Code"; }
            twMCC_S { __Type = STRING; __Comment = "Indicates Before or After Stress"; }
            twOPT { __Type = STRING; __Comment = "Indicates Optional field"; }
            twBase { __Type = STRING; __Comment = "TBD"; }
            twVar { __Type = STRING; __Comment = "TBD"; }
            twVar1 { __Type = STRING; __Comment = "TBD"; }
            printf_str { __Type = STRING; __Comment = "To store smartreflex datalog"; }
            OCP_Res { __Type = SCALAR; __Comment = "To store OCP Resistance"; }
            OCP_Res1 { __Type = SCALAR; __Comment = "To store OCP Resistance"; }
            twVarsFile { __Type = STRING; __Comment = "To store testware vars and limits"; }
            xtrSelStr { __Type = STRING; __Comment = "To store ODP Xtor Select"; }
            xtrNum { __Type = INTEGER; }
            NullDutIMeas { __Type = A[INTEGER]; }
            NullDutErr { __Type = V[INTEGER]; }
            ODPResValues { __Type = Ohm[INTEGER]; }
            Iddq_Vboxlo_VDDAR_post { __Type = A[INTEGER]; }
            Iddq_Vboxlo_VDDAR_pre { __Type = A[INTEGER]; }
            Iddq_Vboxlo_VDDA_post { __Type = A[INTEGER]; }
            Iddq_Vboxlo_VDDA_pre { __Type = A[INTEGER]; }
            Iddq_Vboxlo_VDDS_post { __Type = A[INTEGER]; }
            Iddq_Vboxlo_VDDS_pre { __Type = A[INTEGER]; }
            Iddq_Vboxlo_VDD_post { __Type = A[INTEGER]; }
            Iddq_Vboxlo_VDD_pre { __Type = A[INTEGER]; }
            Iddq_Vburnin_VDD { __Type = A[INTEGER]; }
            Iddq_Vburnin_VDDA { __Type = A[INTEGER]; }
            Iddq_Vburnin_VDDAR { __Type = A[INTEGER]; }
            Iddq_Vburnin_VDDS { __Type = A[INTEGER]; }
            Iddq_Vmax_VDD { __Type = A[INTEGER]; }
            Iddq_Vmax_VDDA { __Type = A[INTEGER]; }
            Iddq_Vmax_VDDAR { __Type = A[INTEGER]; }
            Iddq_Vmax_VDDS { __Type = A[INTEGER]; }
    }
}
