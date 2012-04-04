Unison:U1.0c:S5.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/testflow.evo                                   */
/* Creation Date  : Tue Jan  3 17:12:52 2012                                  */
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

__Flow Probe_FLOW {
    OnStart = Probe_SUB_FLOW;
    OnLoad = TIOnLoad;
    OnUnload = TIOnUnload;
    OnReset = TIOnReset;
    OnFault = TermFault;
    OnPowerDown = TIOnPowerDown;
    OnInitFlow = TIOnInitFlow;
    UsrCal = UserCalibration;
    OnUsr9 = MiniDiags;
    __LoopNotify = __False;
}

/*__Flow Final_FLOW {
    OnStart = Final_SUB_FLOW;
    OnRestart = TIOnRestart;
    OnLoad = TIOnLoad;
    OnUnload = TIOnUnload;
    OnReset = TIOnReset;
    OnRunTimeError = TIOnRunTimeError;
    OnFault = TermFault;
    OnPowerDown = TIOnPowerDown;
    OnInitFlow = TIOnInitFlow;
    UsrCal = UserCalibration;
    OnUsr0 = BoardCheck;
    OnUsr9 = MiniDiags;
    __LoopNotify = __False;
}

__Flow Qual_FLOW {
    OnStart = Qual_SUB_FLOW;
    OnRestart = TIOnRestart;
    OnLoad = TIOnLoad;
    OnUnload = TIOnUnload;
    OnReset = TIOnReset;
    OnRunTimeError = TIOnRunTimeError;
    OnFault = TermFault;
    OnPowerDown = TIOnPowerDown;
    OnInitFlow = TIOnInitFlow;
    UsrCal = UserCalibration;
    OnUsr0 = BoardCheck;
    OnUsr9 = MiniDiags;
    __LoopNotify = __False;
}

__Flow DPSE_FLOW {
    OnStart = DPSE_SUB_FLOW;
    OnRestart = TIOnRestart;
    OnLoad = TIOnLoad;
    OnUnload = TIOnUnload;
    OnReset = TIOnReset;
    OnRunTimeError = TIOnRunTimeError;
    OnFault = TermFault;
    OnPowerDown = TIOnPowerDown;
    OnInitFlow = TIOnInitFlow;
    UsrCal = UserCalibration;
    OnUsr0 = BoardCheck;
    OnUsr9 = MiniDiags;
    __LoopNotify = __False;
}*/

__Flow BoardChk_FLOW {
    OnStart = BoardChk_SUB_FLOW;
    OnRestart = TIOnRestart;
    OnLoad = TIOnLoad;
    OnUnload = TIOnUnload;
    OnReset = TIOnReset;
    OnFault = TermFault;
    OnPowerDown = TIOnPowerDown;
    OnInitFlow = TIOnInitFlow;
    UsrCal = UserCalibration;
    OnUsr9 = MiniDiags;
    __LoopNotify = __False;
}

/***********************************************************************/
/***                                                                 ***/
/***  The following subflows are required by the interface to the TI ***/
/***  standard program.  They may be empty. The TI standard subflows ***/
/***  for each of the enVision entrypoints will call these subflows. ***/
/***                                                                 ***/
/***********************************************************************/

__Test InitializeModules {
    __PortExpression[0] = __Expression { __String = "TRUE"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = TWPDLInitialize;
            frequency = __Expression { __String = "0"; }
            TWdatatype = __Expression { __String = "TWDataType:TWMinimumData"; }
        }
    }
    __Block[1] = {
        __Title = Block1_3;
        __TestMethod {
            __Name = TWPDLInitialize;
            frequency = __Expression { __String = "0"; }
            TWdatatype = __Expression { __String = "TWDataType:TWNominalData"; }
        }
    }
    __Block[2] = {
        __Title = Block1_2;
        __TestMethod {
            __Name = TWPDLInitialize;
            frequency = __Expression { __String = "0"; }
            TWdatatype = __Expression { __String = "TWDataType:TWExtendedData"; }
        }
    }
    __Block[3] = {
        __Title = Block1_1;
        __TestMethod {
            __Name = TWPDLInitialize;
            frequency = __Expression { __String = "0"; }
            TWdatatype = __Expression { __String = "TWDataType:TWExhaustiveData"; }
        }
    }
}


/*************************/
/*** TermFault SubFlow ***/
/*************************/
__SubFlow TermFault {
    __NameFormat = "{Exec}_{GCounter}";
}
/**************************/
/*** UserOnInit SubFlow ***/
/**************************/
__SubFlow UserOnInitFlow {
    __Node ConnectDevice_1357 {
        __XCoord = (47,62);
        __Port[0] {
            __PortPosition = 90;
        }
        __InputPosition = 0;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "0"; __Type = INTEGER; }
        }
        __TestID = "0";
        __Exec = ConnectDevice;
    }
    __Node TW_NewUnit_1358 {
        __XCoord = (226,60);
        __Port[0] {
            __PortPosition = 97;
        }
        __InputPosition = 268;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "0"; __Type = INTEGER; }
        }
        __TestID = "1";
        __Exec = TW_NewUnit;
    }
    __Node FlowNode_1359 {
        __XCoord = (367,76);
        __InputPosition = 273;
        __TestID = "2";
        __PortSelect = "0";
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = ConnectDevice_1357;
    __PortConnections {
        ConnectDevice_1357 __Port[0] = TW_NewUnit_1358;
        TW_NewUnit_1358 __Port[0] = FlowNode_1359;
    }
}
/**************************/
/*** UserOnLoad SubFlow ***/
/**************************/
__SubFlow UserOnLoad {
    __Node SelectSpecs_1360 {
        __XCoord = (39,0);
        __Port[0] {
            __PortPosition = 160;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 278;
        __SpecPairs {
            Globals_Meas = __Expression { __String = "0"; __Type = INTEGER; }
        }
        __TestID = "4";
        __Exec = SelectSpecs;
    }
    __Node InitializeModules_1361 {
        __XCoord = (167,14);
        __Port[0] {
            __PortPosition = 87;
        }
        __Port[1] {
            __PortPosition = 64;
        }
        __InputPosition = 271;
        __TestID = "5";
        __Exec = InitializeModules;
    }
    __Node F021_FlashConfig_test_492 {
        __XCoord = (288,13);
        __Port[0] {
            __PortPosition = 160;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 271;
        __TestID = "62000000";
        __Exec = F021_FlashConfig_test;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = InitializeModules_1361;
    __PortConnections {
        SelectSpecs_1360 __Port[0] = InitializeModules_1361;
        SelectSpecs_1360 __Port[1] = InitializeModules_1361;
        InitializeModules_1361 __Port[0] = F021_FlashConfig_test_492;
        InitializeModules_1361 __Port[1] = F021_FlashConfig_test_492;
    }
}


/*****************************/
/*** UserOnPowerDown SubFlow ***/
/*****************************/
__SubFlow UserOnPowerDown {
    __Node DisconnectDevice_1362 {
        __XCoord = (47,62);
        __Port[0] {
            __PortPosition = 160;
        }
        __InputPosition = 0;
        __TestID = "6";
        __Exec = DisconnectDevice;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = DisconnectDevice_1362;
}

/*****************************/
/*** UserOnUnload SubFlow ***/
/*****************************/
__SubFlow UserOnUnload {
    __Node DisconnectDevice_1363 {
        __XCoord = (47,62);
        __Port[0] {
            __PortPosition = 160;
        }
        __InputPosition = 0;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vnom"; __Type = INTEGER; }
        }
        __TestID = "7";
        __Exec = DisconnectDevice;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = DisconnectDevice_1363;
}

/*****************************/
/*** UserOnReset SubFlow ***/
/*****************************/
__SubFlow UserOnReset {
    __NameFormat = "{Exec}_{GCounter}";
}

/*****************************************************/
/*** Venus requires an empty UserOnRestart SubFlow ***/
/*****************************************************/
__SubFlow UserOnRestart {
    __NameFormat = "{Exec}_{GCounter}";
}

/*****************************/
/*** UserCalibration SubFlow ***/
/*****************************/
__SubFlow UserCalibration {
    __Node FocusCalibration_1365 {
        __XCoord = (47,62);
        __Port[0] {
            __PortPosition = 160;
        }
        __InputPosition = 0;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vnom"; __Type = INTEGER; }
        }
        __TestID = "9";
        __Exec = FocusCalibration;
    }
    __Node FlowNode_317 {
        __XCoord = (166,83);
        __Port[0] {
            __PortPosition = 160;
        }
        __InputPosition = 0;
        __TestID = "";
        __PortSelect = "0";
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FlowNode_317;
    __PortConnections {
        FocusCalibration_1365 __Port[0] = FlowNode_317;
    }
}

/****************************************************************************/
/*** SubFlow PreBinFlow_S                                                 ***/
/****************************************************************************/
/*__SubFlow PreBinFlow_S {
    __Node Cres_1366 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.CommonPSdata"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "10";
        __Exec = Cres;
//        __Calibration = Bllizar_Calibration;
    }
    __Node F_OS_CRES_1367 {
        __XCoord = (-15,295);
        __InputPosition = 20;
        __TestID = "11";
        __Exec = F_OS_CRES;
    }
    __Node FlowNode_1368 {
        __XCoord = (235,150);
        __InputPosition = 270;
        __TestID = "12";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = Cres_1366;
    __PortConnections {
        Cres_1366 __Port[0] = FlowNode_1368;
        Cres_1366 __Port[1] = F_OS_CRES_1367;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,235,130,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
  */  
/****************************************************************************/
/*** SubFlow Continuity_S                                                 ***/
/****************************************************************************/
__SubFlow Continuity_S {
    __Node Digital_Continuity_616 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 90;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 270;
        __SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.CommonPSdata"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "26";
        __Exec = Digital_Continuity;
        __Block Conty_AllDigPins { 
            opens_limits[0] = __Expression { __String = "&DigCont_AllDigPins_Open"; __Type = EXPR_OBJECT_REF<LimitStruct>; }
            shorts_limits[0] = __Expression { __String = "&DigCont_AllDigPins_Short"; __Type = EXPR_OBJECT_REF<LimitStruct>; }
        }
        __Block Conty_DigEvenPins { 
            opens_limits[0] = __Expression { __String = "&DigCont_DigEvenPins_Open"; __Type = EXPR_OBJECT_REF<LimitStruct>; }
            shorts_limits[0] = __Expression { __String = "&DigCont_DigEvenPins_Short"; __Type = EXPR_OBJECT_REF<LimitStruct>; }
            test_limits[0] = __Expression { __String = "&DigCont_DigEvenPins_Open"; __Type = EXPR_OBJECT_REF<LimitStruct>; }
        }
        __Block Conty_DigOddPins { 
            opens_limits[0] = __Expression { __String = "&DigCont_DigOddPins_Open"; __Type = EXPR_OBJECT_REF<LimitStruct>; }
            shorts_limits[0] = __Expression { __String = "&DigCont_DigOddPins_Short"; __Type = EXPR_OBJECT_REF<LimitStruct>; }
            test_limits[0] = __Expression { __String = "&DigCont_DigOddPins_Open"; __Type = EXPR_OBJECT_REF<LimitStruct>; }
        }
    }
    __Node F_OS_OPEN_617 {
        __XCoord = (50,275);
        __InputPosition = 20;
        __TestID = "27";
        __Exec = F_OS_OPEN;
    }
    __Node SupplyShorts_620 {
        __XCoord = (150,150);
        __Port[0] {
            __PortPosition = 90;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 270;
        __SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.CommonPSdata"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "30";
        __Exec = SupplyShorts;
        __Block Block1 { 
            test_limits[0] = __Expression { __String = "&SupplyShorts_Vdd"; __Type = EXPR_OBJECT_REF<LimitStruct>; }
            test_limits[1] = __Expression { __String = "&SupplyShorts_VddA"; __Type = EXPR_OBJECT_REF<LimitStruct>; }
            test_limits[2] = __Expression { __String = "&SupplyShorts_VddAR"; __Type = EXPR_OBJECT_REF<LimitStruct>; }
            test_limits[3] = __Expression { __String = "&SupplyShorts_VddAS"; __Type = EXPR_OBJECT_REF<LimitStruct>; }
            test_limits[4] = __Expression { __String = "&SupplyShorts_VddNWA"; __Type = EXPR_OBJECT_REF<LimitStruct>; }
        }
    }
    __Node F_OS_SHRT_VDD_626 {
        __XCoord = (150,275);
        __InputPosition = 20;
        __TestID = "36";
        __Exec = F_OS_SHRT_VDD;
    }
    __Node FlowNode_629 {
        __XCoord = (300,150);
        __InputPosition = 270;
        __TestID = "39";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = Digital_Continuity_616;
    __PortConnections {
        Digital_Continuity_616 __Port[0] = SupplyShorts_620;
        Digital_Continuity_616 __Port[1] = F_OS_OPEN_617;
        SupplyShorts_620 __Port[0] = FlowNode_629;
        SupplyShorts_620 __Port[1] = F_OS_SHRT_VDD_626;
    }
}

/****************************************************************************/
/*** SubFlow ATPG_CPU_VboxHi_S                                                 ***/
/****************************************************************************/
__SubFlow ATPG_CPU_VboxHi_S {
    __Node ATPG_CPU_T_1824 {
        __XCoord = (64,79);
        __Port[0] {
            __PortPosition = 94;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vboxhi"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_3"; __Type = INTEGER; }
        }
        __TestID = "25000000";
        __Exec = ATPG_CPU_T;
    }
    __Node FlowNode_1738 {
        __XCoord = (180,90);
        __InputPosition = 271;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUNC_ATPG_VBOXHI_1823 {
        __XCoord = (61,224);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_ATPG_VBOXHI;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = ATPG_CPU_T_1824;
    __PortConnections {
        ATPG_CPU_T_1824 __Port[0] = FlowNode_1738;
        ATPG_CPU_T_1824 __Port[1] = F_FUNC_ATPG_VBOXHI_1823;
    }
}

/****************************************************************************/
/*** SubFlow ATPG_CPU_Vmin_S                                                 ***/
/****************************************************************************/
__SubFlow ATPG_CPU_Vmin_S {
    __Node Test_0_1702 {
        __XCoord = (64,93);
        __Port[0] {
            __PortPosition = 90;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_3"; __Type = INTEGER; }
        }
        __TestID = "22000000";
        __Exec = ATPG_CPU_T;
    }
    __Node FlowNode_1777 {
        __XCoord = (182,108);
        __InputPosition = 276;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUNC_ATPG_VMIN_1799 {
        __XCoord = (63,230);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_ATPG_VMIN;
    }
    __Node Test_0_305 {
        __XCoord = (348,42);
        __Port[0] {
            __PortPosition = 160;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_3"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
        }
        __TestID = "67000000";
        __Exec = DMLED_Debug_T;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = Test_0_1702;
    __PortConnections {
        Test_0_1702 __Port[0] = FlowNode_1777;
        Test_0_1702 __Port[1] = F_FUNC_ATPG_VMIN_1799;
    }
}
/****************************************************************************/
/*** SubFlow PathDelay_Vmin_S                                             ***/
/****************************************************************************/
__SubFlow PathDelay_Vmin_S {
    __Node SCAN_PATHDELAY_1_PG_1771 {
        __XCoord = (62,48);
        __Port[0] {
            __PortPosition = 92;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 274;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_2"; __Type = INTEGER; }
        }
        __TestID = "24000000";
        __Exec = SCAN_PATHDELAY_1_PG;
    }
    __Node SCAN_PATHDELAY_PG_1772 {
        __XCoord = (574,59);
        __Port[0] {
            __PortPosition = 88;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 277;
        __SpecPairs {
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
        }
        __TestID = "32000000";
        __Exec = SCAN_PATHDELAY_PG;
    }
    __Node SCAN_PATHDELAY_33_PG_1773 {
        __XCoord = (437,55);
        __Port[0] {
            __PortPosition = 91;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 270;
        __SpecPairs {
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
        }
        __TestID = "31000000";
        __Exec = SCAN_PATHDELAY_33_PG;
    }
    __Node SCAN_PATHDELAY_25_PG_1774 {
        __XCoord = (306,55);
        __Port[0] {
            __PortPosition = 91;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 274;
        __SpecPairs {
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_4"; __Type = INTEGER; }
        }
        __TestID = "30000000";
        __Exec = SCAN_PATHDELAY_25_PG;
    }
    __Node SCAN_PATHDELAY_16_PG_1775 {
        __XCoord = (185,51);
        __Port[0] {
            __PortPosition = 92;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 274;
        __SpecPairs {
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_3"; __Type = INTEGER; }
        }
        __TestID = "29000000";
        __Exec = SCAN_PATHDELAY_16_PG;
    }
    __Node FlowNode_1776 {
        __XCoord = (696,70);
        __InputPosition = 273;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUNC_PDELAY_VMIN_1803 {
        __XCoord = (309,277);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_PDELAY_VMIN;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = SCAN_PATHDELAY_1_PG_1771;
    __PortConnections {
        SCAN_PATHDELAY_1_PG_1771 __Port[0] = SCAN_PATHDELAY_16_PG_1775;
        SCAN_PATHDELAY_1_PG_1771 __Port[1] = F_FUNC_PDELAY_VMIN_1803;
        SCAN_PATHDELAY_PG_1772 __Port[0] = FlowNode_1776;
        SCAN_PATHDELAY_PG_1772 __Port[1] = F_FUNC_PDELAY_VMIN_1803;
        SCAN_PATHDELAY_33_PG_1773 __Port[0] = SCAN_PATHDELAY_PG_1772;
        SCAN_PATHDELAY_33_PG_1773 __Port[1] = F_FUNC_PDELAY_VMIN_1803;
        SCAN_PATHDELAY_25_PG_1774 __Port[0] = SCAN_PATHDELAY_33_PG_1773;
        SCAN_PATHDELAY_25_PG_1774 __Port[1] = F_FUNC_PDELAY_VMIN_1803;
        SCAN_PATHDELAY_16_PG_1775 __Port[0] = SCAN_PATHDELAY_25_PG_1774;
        SCAN_PATHDELAY_16_PG_1775 __Port[1] = F_FUNC_PDELAY_VMIN_1803;
    }
}

__SubFlow RAMBIST_Vmin_S {
    __Node BIST_PROD_PG_1759 {
        __XCoord = (58,62);
        __Port[0] {
            __PortPosition = 88;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_11"; __Type = INTEGER; }
        }
        __TestID = "23000000";
        __Exec = BIST_PROD_PG;
    }
    __Node PBIST_2P_PROD_PG_1760 {
        __XCoord = (173,61);
        __Port[0] {
            __PortPosition = 90;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 270;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_12"; __Type = INTEGER; }
        }
        __TestID = "26000000";
        __Exec = PBIST_2P_PROD_PG;
    }
    __Node FlowNode_1761 {
        __XCoord = (312,73);
        __InputPosition = 273;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUNC_RAM_VMIN_1807 {
        __XCoord = (114,221);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_RAM_VMIN;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = BIST_PROD_PG_1759;
    __PortConnections {
        BIST_PROD_PG_1759 __Port[0] = PBIST_2P_PROD_PG_1760;
        BIST_PROD_PG_1759 __Port[1] = F_FUNC_RAM_VMIN_1807;
        PBIST_2P_PROD_PG_1760 __Port[0] = FlowNode_1761;
        PBIST_2P_PROD_PG_1760 __Port[1] = F_FUNC_RAM_VMIN_1807;
    }
}
__SubFlow RAMBIST_VBoxHi_S {
    __Node BIST_PROD_PG_1987 {
        __XCoord = (66,53);
        __Port[0] {
            __PortPosition = 91;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vboxhi"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_11"; __Type = INTEGER; }
        }
        __TestID = "28000000";
        __Exec = BIST_PROD_PG;
    }
    __Node PBIST_2P_PROD_PG_1988 {
        __XCoord = (180,53);
        __Port[0] {
            __PortPosition = 92;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 271;
        __SpecPairs {
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vboxhi"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_12"; __Type = INTEGER; }
        }
        __TestID = "33000000";
        __Exec = PBIST_2P_PROD_PG;
    }
    __Node FlowNode_1989 {
        __XCoord = (303,62);
        __InputPosition = 267;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUNC_RAM_VBOXHI_1828 {
        __XCoord = (118,225);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_RAM_VBOXHI;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = BIST_PROD_PG_1987;
    __PortConnections {
        BIST_PROD_PG_1987 __Port[0] = PBIST_2P_PROD_PG_1988;
        BIST_PROD_PG_1987 __Port[1] = F_FUNC_RAM_VBOXHI_1828;
        PBIST_2P_PROD_PG_1988 __Port[0] = FlowNode_1989;
        PBIST_2P_PROD_PG_1988 __Port[1] = F_FUNC_RAM_VBOXHI_1828;
    }
}
__SubFlow Srchs_Vmin_Pre_S {
    __Node SrchVdd_Vmin_Pre1_S_1762 {
        __XCoord = (49,81);
        __Port[0] {
            __PortPosition = 91;
        }
        __InputPosition = 0;
        __TestID = "";
        __Exec = SrchVdd_Vmin_Pre1_S;
    }
    __Node SrchFrq_Vmin_Pre_S_1763 {
        __XCoord = (195,83);
        __Port[0] {
            __PortPosition = 94;
        }
        __InputPosition = 274;
        __TestID = "";
        __Exec = SrchFrq_Vmin_Pre_S;
    }
    __Node FlowNode_1764 {
        __XCoord = (341,95);
        __InputPosition = 270;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = SrchVdd_Vmin_Pre1_S_1762;
    __PortConnections {
        SrchVdd_Vmin_Pre1_S_1762 __Port[0] = SrchFrq_Vmin_Pre_S_1763;
        SrchFrq_Vmin_Pre_S_1763 __Port[0] = FlowNode_1764;
    }
}
__SubFlow SrchVdd_Vmin_Pre1_S {
    __Node FlowNode_1765 {
        __XCoord = (765,51);
        __InputPosition = 272;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUNC_SRCH_PRE_1811 {
        __XCoord = (372,195);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_SRCH_PRE;
    }
    __Node Test_0_1871 {
        __XCoord = (91,39);
        __Port[0] {
            __PortPosition = 91;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
        }
        __TestID = "45000000";
        __Exec = ATPG_STUCK_VminSearchPre1_T;
    }
    __Node PBIST_VBOXL_VminSearchPre1_T_1876 {
        __XCoord = (200,37);
        __Port[0] {
            __PortPosition = 95;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 267;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
        }
        __TestID = "46000000";
        __Exec = PBIST_VBOXL_VminSearchPre1_T;
    }
    __Node PBIST_1P_VminSearchPre1_T_1880 {
        __XCoord = (310,38);
        __Port[0] {
            __PortPosition = 91;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 268;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
        }
        __TestID = "47000000";
        __Exec = PBIST_1P_VminSearchPre1_T;
    }
    __Node PBIST_2P_VminSearchPre1_T_1884 {
        __XCoord = (432,39);
        __Port[0] {
            __PortPosition = 90;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 274;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
        }
        __TestID = "48000000";
        __Exec = PBIST_2P_VminSearchPre1_T;
    }
    __Node PBIST_RET_VminSearchPre1_T_1888 {
        __XCoord = (548,39);
        __Port[0] {
            __PortPosition = 88;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 272;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
        }
        __TestID = "49000000";
        __Exec = PBIST_RET_VminSearchPre1_T;
    }
    __Node TRANSFLT_80_VminSearchPre_T_1892 {
        __XCoord = (652,39);
        __Port[0] {
            __PortPosition = 91;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 270;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
        }
        __TestID = "50000000";
        __Exec = TRANSFLT_80_VminSearchPre_T;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = Test_0_1871;
    __PortConnections {
        Test_0_1871 __Port[0] = PBIST_VBOXL_VminSearchPre1_T_1876;
        Test_0_1871 __Port[1] = F_FUNC_SRCH_PRE_1811;
        PBIST_VBOXL_VminSearchPre1_T_1876 __Port[0] = PBIST_1P_VminSearchPre1_T_1880;
        PBIST_VBOXL_VminSearchPre1_T_1876 __Port[1] = F_FUNC_SRCH_PRE_1811;
        PBIST_1P_VminSearchPre1_T_1880 __Port[0] = PBIST_2P_VminSearchPre1_T_1884;
        PBIST_1P_VminSearchPre1_T_1880 __Port[1] = F_FUNC_SRCH_PRE_1811;
        PBIST_2P_VminSearchPre1_T_1884 __Port[0] = PBIST_RET_VminSearchPre1_T_1888;
        PBIST_2P_VminSearchPre1_T_1884 __Port[1] = F_FUNC_SRCH_PRE_1811;
        PBIST_RET_VminSearchPre1_T_1888 __Port[0] = TRANSFLT_80_VminSearchPre_T_1892;
        PBIST_RET_VminSearchPre1_T_1888 __Port[1] = F_FUNC_SRCH_PRE_1811;
        TRANSFLT_80_VminSearchPre_T_1892 __Port[0] = FlowNode_1765;
        TRANSFLT_80_VminSearchPre_T_1892 __Port[1] = F_FUNC_SRCH_PRE_1811;
    }
}
__SubFlow SrchFrq_Vmin_Pre_S {
    __Node FlowNode_1766 {
        __XCoord = (499,129);
        __InputPosition = 271;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUNC_FSRCH_PRE_1815 {
        __XCoord = (235,279);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_FSRCH_PRE;
    }
    __Node Test_0_1824 {
        __XCoord = (106,120);
        __Port[0] {
            __PortPosition = 85;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
        }
        __TestID = "51000000";
        __Exec = BIST_PROD_FreqSearchPre_T;
    }
    __Node FUNC_BIST_FreqSearchPre_T_1829 {
        __XCoord = (237,121);
        __Port[0] {
            __PortPosition = 88;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 274;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
        }
        __TestID = "52000000";
        __Exec = FUNC_BIST_FreqSearchPre_T;
    }
    __Node FUNC_BIST_1_FreqSearchPre_T_1833 {
        __XCoord = (355,120);
        __Port[0] {
            __PortPosition = 88;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 274;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
        }
        __TestID = "53000000";
        __Exec = FUNC_BIST_1_FreqSearchPre_T;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = Test_0_1824;
    __PortConnections {
        Test_0_1824 __Port[0] = FUNC_BIST_FreqSearchPre_T_1829;
        Test_0_1824 __Port[1] = F_FUNC_FSRCH_PRE_1815;
        FUNC_BIST_FreqSearchPre_T_1829 __Port[0] = FUNC_BIST_1_FreqSearchPre_T_1833;
        FUNC_BIST_FreqSearchPre_T_1829 __Port[1] = F_FUNC_FSRCH_PRE_1815;
        FUNC_BIST_1_FreqSearchPre_T_1833 __Port[0] = FlowNode_1766;
        FUNC_BIST_1_FreqSearchPre_T_1833 __Port[1] = F_FUNC_FSRCH_PRE_1815;
    }
}

__SubFlow Iddq0_VboxLO_S {
    __Node FlowNode_1767 {
        __XCoord = (13,12);
        __InputPosition = 0;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUNC_IDDQ_1819 {
        __XCoord = (36,119);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_IDDQ;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FlowNode_1767;
}

__SubFlow F021FlashFlow_S {
    __Node FlowNode_1768 {
        __XCoord = (848,85);
        __InputPosition = 265;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node Test_0_1834 {
        __XCoord = (623,85);
        __Port[0] {
            __PortPosition = 82;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __TestID = "58000000";
        __Exec = Flash_FUNC_LoadShellAndTestNum_T;
    }
    __Node F_FUNC_Vnom_1839 {
        __XCoord = (684,240);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_Vnom;
    }
    __Node F021_InitFLGlobalVars_317 {
        __XCoord = (35,65);
        __Port[0] {
            __PortPosition = 84;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __TestID = "59000000";
        __Exec = F021_InitFLGlobalVars;
    }
    __Node FlashEfuse_func_321 {
        __XCoord = (595,213);
        __Port[0] {
            __PortPosition = 160;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 277;
        __SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.PS_VEfuseR"; __Type = INTEGER; }
        }
        __TestID = "60000000";
        __Exec = FlashEfuse_func;
    }
    __Node Pump_Iref_Vnom_560 {
        __XCoord = (262,63);
        __Port[0] {
            __PortPosition = 91;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 272;
        __SpecPairs {
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vnom"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
        }
        __TestID = "63000000";
        __Exec = Pump_Iref_Vnom;
    }
    __Node FlashTestNum_T_321 {
        __XCoord = (740,85);
        __Port[0] {
            __PortPosition = 85;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 278;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vnom"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
        }
        __TestID = "61000000";
        __Exec = FlashTestNum_T;
    }
    __Node FTN_LoopCPU_T_303 {
        __XCoord = (962,19);
        __Port[0] {
            __PortPosition = 160;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vnom"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_FTN"; __Type = INTEGER; }
        }
        __TestID = "65000000";
        __Exec = FTN_LoopCPU_T;
    }
    __Node Pump_BGAP_Vnom_304 {
        __XCoord = (391,63);
        __Port[0] {
            __PortPosition = 160;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 272;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_FTN"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vnom"; __Type = INTEGER; }
        }
        __TestID = "66000000";
        __Exec = Pump_BGAP_Vnom;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = F021_InitFLGlobalVars_317;
    __PortConnections {
        Test_0_1834 __Port[0] = FlashTestNum_T_321;
        Test_0_1834 __Port[1] = F_FUNC_Vnom_1839;
        F021_InitFLGlobalVars_317 __Port[0] = Pump_BGAP_Vnom_304;
        Pump_Iref_Vnom_560 __Port[0] = Pump_BGAP_Vnom_304;
        FlashTestNum_T_321 __Port[0] = FlowNode_1768;
        FlashTestNum_T_321 __Port[1] = F_FUNC_Vnom_1839;
    }
}


__SubFlow SrchFrq_Vmin_Post_S {
    __Node FlowNode_1769 {
        __XCoord = (479,58);
        __InputPosition = 274;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUNC_FSRCH_PST_1832 {
        __XCoord = (224,205);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_FSRCH_PST;
    }
    __Node FUNC_BIST_1_FreqSearchPost_T_1827 {
        __XCoord = (225,48);
        __Port[0] {
            __PortPosition = 88;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 270;
        __TestID = "54000000";
        __Exec = FUNC_BIST_1_FreqSearchPost_T;
    }
    __Node FUNC_BIST_FreqSearchPost_T_1830 {
        __XCoord = (347,49);
        __Port[0] {
            __PortPosition = 87;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 270;
        __TestID = "55000000";
        __Exec = FUNC_BIST_FreqSearchPost_T;
    }
    __Node BIST_PROD_FreqSearchPost_T_1833 {
        __XCoord = (100,51);
        __Port[0] {
            __PortPosition = 87;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __TestID = "56000000";
        __Exec = BIST_PROD_FreqSearchPost_T;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = BIST_PROD_FreqSearchPost_T_1833;
    __PortConnections {
        FUNC_BIST_1_FreqSearchPost_T_1827 __Port[0] = FUNC_BIST_FreqSearchPost_T_1830;
        FUNC_BIST_1_FreqSearchPost_T_1827 __Port[1] = F_FUNC_FSRCH_PST_1832;
        FUNC_BIST_FreqSearchPost_T_1830 __Port[0] = FlowNode_1769;
        FUNC_BIST_FreqSearchPost_T_1830 __Port[1] = F_FUNC_FSRCH_PST_1832;
        BIST_PROD_FreqSearchPost_T_1833 __Port[0] = FUNC_BIST_1_FreqSearchPost_T_1827;
        BIST_PROD_FreqSearchPost_T_1833 __Port[1] = F_FUNC_FSRCH_PST_1832;
    }
}
__SubFlow SrchVdd_Post_S {
    __Node FlowNode_1770 {
        __XCoord = (97,53);
        __InputPosition = 0;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FlowNode_1770;
}
__SubFlow Srchs_Vmin_Post_S {
    __Node SrchVdd_Vmin_Post_S_1771 {
        __XCoord = (49,81);
        __Port[0] {
            __PortPosition = 91;
        }
        __InputPosition = 0;
        __TestID = "";
        __Exec = SrchVdd_Vmin_Pre1_S;
    }
    __Node SrchFrq_Vmin_Post_S_1772 {
        __XCoord = (195,83);
        __Port[0] {
            __PortPosition = 94;
        }
        __InputPosition = 274;
        __TestID = "";
        __Exec = SrchFrq_Vmin_Post_S;
    }
    __Node FlowNode_1773 {
        __XCoord = (341,95);
        __InputPosition = 270;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = SrchVdd_Vmin_Post_S_1771;
    __PortConnections {
        SrchVdd_Vmin_Post_S_1771 __Port[0] = SrchFrq_Vmin_Post_S_1772;
        SrchFrq_Vmin_Post_S_1772 __Port[0] = FlowNode_1773;
    }
}
__SubFlow Iddq_VboxLO_Post_S {
    __Node FlowNode_1772 {
        __XCoord = (13,12);
        __InputPosition = 0;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_LEAK_IDDQ_POST_1836 {
        __XCoord = (21,119);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_LEAK_IDDQ_POST;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FlowNode_1772;
}

/****************************************************************************/
/*** SubFlow ATPG_CPU_Vmax_S                                                 ***/
/****************************************************************************/
__SubFlow ATPG_CPU_Vmax_S {
    __Node ATPG_CPU_T_1766 {
        __XCoord = (45,61);
        __Port[0] {
            __PortPosition = 87;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_3"; __Type = INTEGER; }
        }
        __TestID = "34000000";
        __Exec = ATPG_CPU_T;
    }
    __Node FlowNode_1771 {
        __XCoord = (172,71);
        __InputPosition = 273;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUNC_ATPG_VMAX_1839 {
        __XCoord = (42,200);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_ATPG_VMAX;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = ATPG_CPU_T_1766;
    __PortConnections {
        ATPG_CPU_T_1766 __Port[0] = FlowNode_1771;
        ATPG_CPU_T_1766 __Port[1] = F_FUNC_ATPG_VMAX_1839;
    }
}

__SubFlow PathDelay_Vmax_S {
    __Node SCAN_PATHDELAY_1_PG_1823 {
        __XCoord = (54,37);
        __Port[0] {
            __PortPosition = 92;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 274;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_2"; __Type = INTEGER; }
        }
        __TestID = "35000000";
        __Exec = SCAN_PATHDELAY_1_PG;
    }
    __Node SCAN_PATHDELAY_PG_1824 {
        __XCoord = (700,46);
        __Port[0] {
            __PortPosition = 88;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 277;
        __SpecPairs {
            ACSpecs = __Expression { __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; __Type = INTEGER; }
        }
        __TestID = "36000000";
        __Exec = SCAN_PATHDELAY_PG;
    }
    __Node SCAN_PATHDELAY_33_PG_1825 {
        __XCoord = (429,42);
        __Port[0] {
            __PortPosition = 91;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 270;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_5"; __Type = INTEGER; }
        }
        __TestID = "37000000";
        __Exec = SCAN_PATHDELAY_33_PG;
    }
    __Node SCAN_PATHDELAY_25_PG_1826 {
        __XCoord = (298,42);
        __Port[0] {
            __PortPosition = 91;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 274;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_4"; __Type = INTEGER; }
        }
        __TestID = "38000000";
        __Exec = SCAN_PATHDELAY_25_PG;
    }
    __Node SCAN_PATHDELAY_16_PG_1827 {
        __XCoord = (177,40);
        __Port[0] {
            __PortPosition = 92;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 274;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_3"; __Type = INTEGER; }
        }
        __TestID = "39000000";
        __Exec = SCAN_PATHDELAY_16_PG;
    }
    __Node FlowNode_1828 {
        __XCoord = (836,58);
        __InputPosition = 273;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node SCAN_PATHDELAY_40_PG_1868 {
        __XCoord = (568,44);
        __Port[0] {
            __PortPosition = 87;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 274;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_6"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
        }
        __TestID = "57000000";
        __Exec = SCAN_PATHDELAY_40_PG;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = SCAN_PATHDELAY_1_PG_1823;
    __PortConnections {
        SCAN_PATHDELAY_1_PG_1823 __Port[0] = SCAN_PATHDELAY_16_PG_1827;
        SCAN_PATHDELAY_PG_1824 __Port[0] = FlowNode_1828;
        SCAN_PATHDELAY_33_PG_1825 __Port[0] = SCAN_PATHDELAY_40_PG_1868;
        SCAN_PATHDELAY_25_PG_1826 __Port[0] = SCAN_PATHDELAY_33_PG_1825;
        SCAN_PATHDELAY_16_PG_1827 __Port[0] = SCAN_PATHDELAY_25_PG_1826;
        SCAN_PATHDELAY_40_PG_1868 __Port[0] = SCAN_PATHDELAY_PG_1824;
    }
}
__SubFlow ATPG_CPU_VboxLo_S {
    __Node ATPG_CPU_T_1829 {
        __XCoord = (40,51);
        __Port[0] {
            __PortPosition = 87;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vboxlo"; __Type = INTEGER; }
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_3"; __Type = INTEGER; }
        }
        __TestID = "40000000";
        __Exec = ATPG_CPU_T;
    }
    __Node FlowNode_1830 {
        __XCoord = (167,61);
        __InputPosition = 273;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUNC_ATPG_VBOXLO_1843 {
        __XCoord = (38,188);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_ATPG_VBOXLO;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = ATPG_CPU_T_1829;
    __PortConnections {
        ATPG_CPU_T_1829 __Port[0] = FlowNode_1830;
        ATPG_CPU_T_1829 __Port[1] = F_FUNC_ATPG_VBOXLO_1843;
    }
}
__SubFlow RAMBIST_VBoxLo_S {
    __Node BIST_PROD_PG_1831 {
        __XCoord = (31,53);
        __Port[0] {
            __PortPosition = 91;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            ACSpecs = __Expression { __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vboxlo"; __Type = INTEGER; }
        }
        __TestID = "41000000";
        __Exec = BIST_PROD_PG;
    }
    __Node PBIST_2P_PROD_PG_1832 {
        __XCoord = (145,53);
        __Port[0] {
            __PortPosition = 92;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 271;
        __SpecPairs {
            ACSpecs = __Expression { __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vboxlo"; __Type = INTEGER; }
        }
        __TestID = "42000000";
        __Exec = PBIST_2P_PROD_PG;
    }
    __Node FlowNode_1833 {
        __XCoord = (268,62);
        __InputPosition = 267;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUNC_RAM_VBOXLO_1847 {
        __XCoord = (89,215);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_RAM_VBOXLO;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = BIST_PROD_PG_1831;
    __PortConnections {
        BIST_PROD_PG_1831 __Port[0] = PBIST_2P_PROD_PG_1832;
        BIST_PROD_PG_1831 __Port[1] = F_FUNC_RAM_VBOXLO_1847;
        PBIST_2P_PROD_PG_1832 __Port[0] = FlowNode_1833;
        PBIST_2P_PROD_PG_1832 __Port[1] = F_FUNC_RAM_VBOXLO_1847;
    }
}
__SubFlow Leakage_S {
    __Node FlowNode_1834 {
        __XCoord = (32,123);
        __InputPosition = 0;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_LEAK_IOZ_1851 {
        __XCoord = (39,48);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_LEAK_IOZ;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FlowNode_1834;
}
__SubFlow Levels_S {
    __Node FlowNode_1835 {
        __XCoord = (35,43);
        __InputPosition = 0;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_LEVEL_1855 {
        __XCoord = (39,133);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_LEVEL;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FlowNode_1835;
}
__SubFlow DieID_Prog_S {
    __Node FlowNode_1836 {
        __XCoord = (209,37);
        __InputPosition = 273;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUSE_DIEID_PRE_READ_1795 {
        __XCoord = (70,159);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUSE_DIEID_PROG;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FlowNode_1836;
}
__SubFlow DieID_PreRead_S {
    __Node FlowNode_1837 {
        __XCoord = (371,36);
        __InputPosition = 267;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUSE_DIEID_PRE_READ_1859 {
        __XCoord = (47,256);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUSE_DIEID_PRE_READ;
    }
    __Node Test_0_1862 {
        __XCoord = (49,27);
        __Port[0] {
            __PortPosition = 88;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vnom"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
        }
        __TestID = "44000000";
        __Exec = dieid_postread_func;
    }
    __Node Test_0_310 {
        __XCoord = (203,98);
        __Port[0] {
            __PortPosition = 87;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __TestID = "60000000";
        __Exec = FF_InitCheck_T;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = Test_0_1862;
    __PortConnections {
        Test_0_1862 __Port[0] = FlowNode_1837;
        Test_0_1862 __Port[1] = F_FUSE_DIEID_PRE_READ_1859;
        Test_0_310 __Port[0] = FlowNode_1837;
        Test_0_310 __Port[1] = F_FUSE_DIEID_PRE_READ_1859;
    }
}

__SubFlow FuncBIST_Vmin_S {
    __Node FuncBist_Vmin_func_T_314 {
        __XCoord = (67,56);
        __Port[0] {
            __PortPosition = 94;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.CommonPSdata"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
        }
        __TestID = "69000000";
        __Exec = FuncBist_Vmin_func_T;
    }
    __Node FlowNode_410 {
        __XCoord = (192,69);
        __InputPosition = 271;
        __TestID = "";
        __PortSelect = "";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FuncBist_Vmin_func_T_314;
    __PortConnections {
        FuncBist_Vmin_func_T_314 __Port[0] = FlowNode_410;
    }
}
__SubFlow FuseCtlr_S {
    __Node FuseCtlr_func_393 {
        __XCoord = (57,48);
        __Port[0] {
            __PortPosition = 88;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
        }
        __TestID = "68000000";
        __Exec = FuseCtlr_func;
    }
    __Node FlowNode_394 {
        __XCoord = (183,57);
        __InputPosition = 271;
        __TestID = "";
        __PortSelect = "";
        __PortNumber = 0;
    }
    __Node F_FUSE_ROM_READ_395 {
        __XCoord = (54,189);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUSE_ROM_READ;
    }
    __StartNode = FuseCtlr_func_393;
    __PortConnections {
        FuseCtlr_func_393 __Port[0] = FlowNode_394;
        FuseCtlr_func_393 __Port[1] = F_FUSE_ROM_READ_395;
    }
}
__SubFlow DieID_S {
    __Node FlowNode_396 {
        __XCoord = (408,63);
        __InputPosition = 273;
        __TestID = "";
        __PortSelect = "";
        __PortNumber = 0;
    }
    __Node DieIDPreRead_func_397 {
        __XCoord = (75,51);
        __Port[0] {
            __PortPosition = 87;
        }
        __Port[1] {
            __PortPosition = 125;
        }
        __InputPosition = 275;
        __TestID = "70000000";
        __PortNumber = 0;
        __Exec = DieIDPreRead_func;
    }
    __Node DieID_PartialProg_func_398 {
        __XCoord = (233,57);
        __Port[0] {
            __PortPosition = 88;
        }
        __Port[1] {
            __PortPosition = 122;
        }
        __InputPosition = 272;
        __TestID = "71000000";
        __PortNumber = 0;
        __Exec = DieID_PartialProg_func;
    }
    __StartNode = DieIDPreRead_func_397;
    __PortConnections {
        DieIDPreRead_func_397 __Port[0] = DieID_PartialProg_func_398;
        DieIDPreRead_func_397 __Port[1] = DieID_PartialProg_func_398;
        DieID_PartialProg_func_398 __Port[0] = FlowNode_396;
        DieID_PartialProg_func_398 __Port[1] = FlowNode_396;
    }
    __Background {
        __String = "Placeholder for";
        __Data = (0,0,72,16,0,0,22,0,0,5,0,0,1,0,0,0);
    }
    __Background {
        __String = "PreReadDieID";
        __Data = (0,0,67,136,0,0,23,0,0,4,0,0,1,0,0,0);
    }
    __Background {
        __String = "DieIDPreRead_func";
        __Data = (0,0,66,34,0,0,22,0,0,5,0,0,1,0,0,0);
    }
    __Background {
        __String = "Placeholder for";
        __Data = (0,0,226,20,0,0,22,0,0,5,0,0,1,0,0,0);
    }
    __Background {
        __String = "DieID_PartialProg_func";
        __Data = (0,0,220,38,0,0,22,0,0,5,0,0,1,0,0,0);
    }
    __Background {
        __String = "CompareDieIDToLotControl";
        __Data = (0,0,64,180,0,0,23,0,0,4,0,0,1,0,0,0);
    }
    __Background {
        __String = "CompareDieIDToProber";
        __Data = (0,0,64,193,0,0,23,0,0,4,0,0,1,0,0,0);
    }
    __Background {
        __String = "ReadFuseROM";
        __Data = (0,0,85,150,0,0,23,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "DecodeDieID";
        __Data = (0,0,84,165,0,0,23,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "ProgramPartialDieID";
        __Data = (0,0,233,145,0,0,23,0,0,4,0,0,1,0,0,0);
    }
    __Background {
        __String = "BuildDieIDString";
        __Data = (0,0,251,163,0,0,23,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "ProgramFuseROM";
        __Data = (0,0,251,179,0,0,23,0,0,3,0,0,1,0,0,0);
    }
}
__SubFlow Trim_S {
    __Node FlowNode_399 {
        __XCoord = (117,65);
        __InputPosition = 0;
        __TestID = "";
        __PortSelect = "";
        __PortNumber = 0;
    }
    __StartNode = FlowNode_399;
}
__SubFlow PgmAnalogTrims_S {
    __Node FlowNode_400 {
        __XCoord = (203,56);
        __InputPosition = 0;
        __TestID = "";
        __PortSelect = "";
        __PortNumber = 0;
    }
    __StartNode = FlowNode_400;
}
__SubFlow HiVoltageStress_S {
    __Node FlowNode_401 {
        __XCoord = (292,72);
        __InputPosition = 0;
        __TestID = "";
        __PortSelect = "";
        __PortNumber = 0;
    }
    __StartNode = FlowNode_401;
}
__SubFlow Iddq_Delta_S {
    __Node FlowNode_402 {
        __XCoord = (28,22);
        __InputPosition = 0;
        __TestID = "";
        __PortSelect = "";
        __PortNumber = 0;
    }
    __StartNode = FlowNode_402;
}
__SubFlow RAMBIST_Vmax_S {
    __Node BIST_PROD_PG_403 {
        __XCoord = (23,41);
        __Port[0] {
            __PortPosition = 88;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_11"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; __Type = INTEGER; }
        }
        __TestID = "72000000";
        __Exec = BIST_PROD_PG;
    }
    __Node PBIST_2P_PROD_PG_404 {
        __XCoord = (138,40);
        __Port[0] {
            __PortPosition = 90;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 270;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_12"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; __Type = INTEGER; }
        }
        __TestID = "73000000";
        __Exec = PBIST_2P_PROD_PG;
    }
    __Node FlowNode_405 {
        __XCoord = (277,52);
        __InputPosition = 273;
        __TestID = "";
        __PortSelect = "";
        __PortNumber = 0;
    }
    __Node F_FUNC_RAM_VMAX_406 {
        __XCoord = (79,200);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_RAM_VMAX;
    }
    __PortConnections {
        BIST_PROD_PG_403 __Port[0] = PBIST_2P_PROD_PG_404;
        BIST_PROD_PG_403 __Port[1] = F_FUNC_RAM_VMAX_406;
        PBIST_2P_PROD_PG_404 __Port[0] = FlowNode_405;
        PBIST_2P_PROD_PG_404 __Port[1] = F_FUNC_RAM_VMAX_406;
    }
}
__SubFlow FuncBIST_Vmax_S {
    __Node FuncBist_Vmax_func_T_407 {
        __XCoord = (38,40);
        __Port[0] {
            __PortPosition = 94;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 0;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmax"; __Type = INTEGER; }
        }
        __TestID = "74000000";
        __Exec = FuncBist_Vmax_func_T;
    }
    __Node FlowNode_408 {
        __XCoord = (163,53);
        __InputPosition = 271;
        __TestID = "";
        __PortSelect = "";
        __PortNumber = 0;
    }
    __StartNode = FuncBist_Vmax_func_T_407;
    __PortConnections {
        FuncBist_Vmax_func_T_407 __Port[0] = FlowNode_408;
    }
}
__SubFlow Currents_S {
    __Node FlowNode_409 {
        __XCoord = (97,52);
        __InputPosition = 0;
        __TestID = "";
        __PortSelect = "";
        __PortNumber = 0;
    }
    __StartNode = FlowNode_409;
}
