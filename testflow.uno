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
    OnUsr0 = BoardCheck;
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
    OnUsr0 = BoardCheck;
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
    __Entry[0] = TW_Init_MF;
    __Entry[1] = Initialize_EverySite_Array_MF;
    __PortExpression[0] = __Expression { __String = "TRUE"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = InitializeModules;
        __EnableExpression = __Expression { __String = "TRUE"; }
        __TestMethod {
            __Name = LTXC::GenericTest;
            ShowAdditionalArgs = __Expression { __String = "FALSE"; }
            SimulatedTestResult = __Expression { __String = "TM_RESULT:TM_PASS"; }
            SimulateRowResults = __Expression { __String = "FALSE"; }
            ExecuteSitesSerially = __Expression { __String = "FALSE"; }
            CharacterizationEnable = __Expression { __String = "FALSE"; }
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
        }
        __Port[1] {
        }
        __InputPosition = 278;
        __SpecPairs {
            Globals_Meas = __Expression { __String = "0"; __Type = INTEGER; }
        }
        __TestID = "4";
        __Exec = SelectSpecs;
    }
    __Node InitializeModules_1361 {
        __XCoord = (319,0);
        __Port[0] {
            __PortPosition = 160;
        }
        __InputPosition = 271;
        __TestID = "5";
        __Exec = InitializeModules;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = SelectSpecs_1360;
    __PortConnections {
        SelectSpecs_1360 __Port[0] = InitializeModules_1361;
        SelectSpecs_1360 __Port[1] = InitializeModules_1361;
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
//        __Calibration = Bllizar_Calibration;
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
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FocusCalibration_1365;
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
        __XCoord = (289,103);
        __InputPosition = 265;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node Test_0_1834 {
        __XCoord = (174,102);
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
        __XCoord = (172,244);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUNC_Vnom;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = Test_0_1834;
    __PortConnections {
        Test_0_1834 __Port[0] = FlowNode_1768;
        Test_0_1834 __Port[1] = F_FUNC_Vnom_1839;
    }
}__SubFlow SrchFrq_Vmin_Post_S {
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
        __XCoord = (172,34);
        __InputPosition = 267;
        __TestID = "";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __Node F_FUSE_DIEID_PRE_READ_1859 {
        __XCoord = (48,191);
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
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = Test_0_1862;
    __PortConnections {
        Test_0_1862 __Port[0] = FlowNode_1837;
        Test_0_1862 __Port[1] = F_FUSE_DIEID_PRE_READ_1859;
    }
}
