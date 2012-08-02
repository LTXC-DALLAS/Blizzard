Unison:U1.0c:S5.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/Probe_flow.evo                                 */
/* Creation Date  : Tue Jan  3 17:12:53 2012                                  */
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


/****************************************************************************/
/*** SubFlow Probe_SUB_FLOW                                               ***/
/****************************************************************************/
__SubFlow Probe_SUB_FLOW {
    __Node Continuity_1785 {
        __XCoord = (51,28);
        __Port[0] {
            __PortPosition = 90;
        }
        __InputPosition = 0;
        __TestID = "";
        __Exec = Continuity_S;
    }
    __Node ATPG_CPU_Vmin_S_1699 {
        __XCoord = (180,28);
        __Port[0] {
            __PortPosition = 90;
        }
        __InputPosition = 270;
        __TestID = "";
        __Exec = ATPG_CPU_Vmin_S;
    }
    __Node PathDelay_Vmin_S_1743 {
        __XCoord = (324,29);
        __Port[0] {
            __PortPosition = 90;
        }
        __InputPosition = 270;
        __TestID = "";
        __Exec = PathDelay_Vmin_S;
    }
    __Node RAMBIST_Vmin_S_1711 {
        __XCoord = (728,29);
        __Port[0] {
            __PortPosition = 91;
        }
        __InputPosition = 272;
        __TestID = "";
        __Exec = RAMBIST_Vmin_S;
    }
    __Node Srchs_Vmin_Pre_S_1726 {
        __XCoord = (745,158);
        __Port[0] {
            __PortPosition = 280;
        }
        __InputPosition = 91;
        __TestID = "";
        __Exec = Srchs_Vmin_Pre_S;
    }
    __Node Iddq0_VboxLO_S_1747 {
        __XCoord = (508,151);
        __Port[0] {
            __PortPosition = 264;
        }
        __InputPosition = 91;
        __TestID = "";
        __Exec = Iddq0_VboxLO_S;
    }
    __Node F021FlashFlow_S_1753 {
        __XCoord = (383,153);
        __Port[0] {
            __PortPosition = 270;
        }
        __InputPosition = 91;
        __TestID = "";
        __Exec = F021FlashFlow_S;
    }
    __Node Test_0_1758 {
        __XCoord = (649,414);
        __Port[0] {
            __PortPosition = 278;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 84;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vnom"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
        }
        __TestID = "27000000";
//        __Exec = WrEngRow_func;
    }
    __Node ATPG_CPU_VboxHi_S_1732 {
        __XCoord = (25,151);
        __Port[0] {
            __PortPosition = 181;
        }
        __InputPosition = 91;
        __TestID = "";
        __Exec = ATPG_CPU_VboxHi_S;
    }
    __Node RAMBIST_VBoxHi_S_1980 {
        __XCoord = (28,266);
        __Port[0] {
            __PortPosition = 91;
        }
        __InputPosition = 355;
        __TestID = "";
        __Exec = RAMBIST_VBoxHi_S;
    }
    __Node SrchFrq_Vmin_Post_S_1755 {
        __XCoord = (402,269);
        __Port[0] {
            __PortPosition = 95;
        }
        __InputPosition = 270;
        __TestID = "";
        __Exec = SrchFrq_Vmin_Post_S;
    }
    __Node Iddq_VboxLO_Post_S_1758 {
        __XCoord = (523,273);
        __Port[0] {
            __PortPosition = 91;
        }
        __InputPosition = 271;
        __TestID = "";
        __Exec = Iddq_VboxLO_Post_S;
    }
    __Node ATPG_CPU_Vmax_S_1761 {
        __XCoord = (763,272);
        __Port[0] {
            __PortPosition = 95;
        }
        __InputPosition = 271;
        __TestID = "";
        __Exec = ATPG_CPU_Vmax_S;
    }
    __Node RAMBIST_Vmax_S_366 {
        __XCoord = (889,278);
        __Port[0] {
            __PortPosition = 181;
        }
        __InputPosition = 274;
        __TestID = "";
        __Exec = RAMBIST_Vmax_S;
    }
    __Node ATPG_CPU_VboxLo_S_1777 {
        __XCoord = (153,266);
        __Port[0] {
            __PortPosition = 92;
        }
        __InputPosition = 273;
        __TestID = "";
        __Exec = ATPG_CPU_VboxLo_S;
    }
    __Node RAMBIST_VBoxLo_S_1781 {
        __XCoord = (277,265);
        __Port[0] {
            __PortPosition = 96;
        }
        __InputPosition = 271;
        __TestID = "";
        __Exec = RAMBIST_VBoxLo_S;
    }
    __Node Currents_S_387 {
        __XCoord = (761,411);
        __Port[0] {
            __PortPosition = 271;
        }
        __InputPosition = 91;
        __TestID = "";
        __Exec = Currents_S;
    }
    __Node DieID_Prog_S_1803 {
        __XCoord = (621,151);
        __Port[0] {
            __PortPosition = 267;
        }
        __InputPosition = 91;
        __TestID = "";
        __Exec = DieID_Prog_S;
    }
    __Node FuncBIST_Vmax_S_378 {
        __XCoord = (884,410);
        __Port[0] {
            __PortPosition = 268;
        }
        __InputPosition = 0;
        __TestID = "";
        __Exec = FuncBIST_Vmax_S;
    }
    __Node SupplyShorts_1818 {
        __XCoord = (518,410);
        __Port[0] {
            __PortPosition = 271;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 84;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vnom"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
        }
        __TestID = "43000000";
        __Exec = SupplyShorts;
    }
    __Node GOOD_UNIT_1822 {
        __XCoord = (398,436);
        __InputPosition = 83;
        __TestID = "";
        __Exec = GOOD_UNIT;
    }
    __Node F_OS_SHRT_VDD_1868 {
        __XCoord = (517,545);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_OS_SHRT_VDD;
    }
    __Node GOOD_UNIT_319 {
        __XCoord = (1960,44);
        __InputPosition = 271;
        __TestID = "";
        __Exec = GOOD_UNIT;
    }
    __Node Digital_Continuity_321 {
        __XCoord = (1609,31);
        __Port[0] {
            __PortPosition = 90;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 270;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vnom"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
        }
        __TestID = "63000000";
        __Exec = Digital_Continuity;
    }
    __Node FF_InitCheck_T_315 {
        __XCoord = (1846,25);
        __Port[0] {
            __PortPosition = 87;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 265;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vnom"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
        }
        __TestID = "62000000";
        __Exec = FF_InitCheck_T;
    }
    __Node F_FUSE_DIEID_PRE_READ_318 {
        __XCoord = (1844,173);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_FUSE_DIEID_PRE_READ;
    }
    __Node F_OS_OPEN_324 {
        __XCoord = (1596,167);
        __InputPosition = 20;
        __TestID = "";
        __Exec = F_OS_OPEN;
    }
    __Node SupplyShorts_327 {
        __XCoord = (1723,29);
        __Port[0] {
            __PortPosition = 90;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 270;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            CTSpec = __Expression { __String = "CTSpec.CTData"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vnom"; __Type = INTEGER; }
            TIGlobalVars = __Expression { __String = "TIGlobalVars.TIVariables"; __Type = INTEGER; }
            TIGlobals = __Expression { __String = "TIGlobals.TIGlobalTypes"; __Type = INTEGER; }
            Globals_Typ = __Expression { __String = "Globals_Typ.Constants"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "Globals_Meas.GlobalMeasDefaults"; __Type = INTEGER; }
        }
        __TestID = "64000000";
        __Exec = SupplyShorts;
    }
    __Node F_OS_SHRT_VDD_330 {
        __XCoord = (1711,174);
        __InputPosition = 20;
        __TestID = "";
        __Exec = F_OS_SHRT_VDD;
    }
    __Node FuseCtlr_S_309 {
        __XCoord = (458,28);
        __Port[0] {
            __PortPosition = 91;
        }
        __InputPosition = 270;
        __TestID = "";
        __Exec = FuseCtlr_S;
    }
    __Node DieID_S_321 {
        __XCoord = (586,27);
        __Port[0] {
            __PortPosition = 92;
        }
        __InputPosition = 271;
        __TestID = "";
        __Exec = DieID_S;
    }
    __Node Trim_S_331 {
        __XCoord = (867,29);
        __Port[0] {
            __PortPosition = 181;
        }
        __InputPosition = 271;
        __TestID = "";
        __Exec = Trim_S;
    }
    __Node FuncBIST_Vmin_S_336 {
        __XCoord = (867,165);
        __Port[0] {
            __PortPosition = 277;
        }
        __InputPosition = 358;
        __TestID = "";
        __Exec = FuncBIST_Vmin_S;
    }
    __Node PgmAnalogTrims_S_348 {
        __XCoord = (272,151);
        __Port[0] {
            __PortPosition = 271;
        }
        __InputPosition = 94;
        __TestID = "";
        __Exec = PgmAnalogTrims_S;
    }
    __Node HiVoltageStress_S_352 {
        __XCoord = (148,152);
        __Port[0] {
            __PortPosition = 271;
        }
        __InputPosition = 91;
        __TestID = "";
        __Exec = HiVoltageStress_S;
    }
    __Node Iddq_Delta_S_360 {
        __XCoord = (637,273);
        __Port[0] {
            __PortPosition = 91;
        }
        __InputPosition = 271;
        __TestID = "";
        __Exec = Iddq_Delta_S;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = Continuity_1785;
    __PortConnections {
        Continuity_1785 __Port[0] = ATPG_CPU_Vmin_S_1699;
        ATPG_CPU_Vmin_S_1699 __Port[0] = PathDelay_Vmin_S_1743;
        PathDelay_Vmin_S_1743 __Port[0] = FuseCtlr_S_309;
        RAMBIST_Vmin_S_1711 __Port[0] = Trim_S_331;
        Srchs_Vmin_Pre_S_1726 __Port[0] = DieID_Prog_S_1803;
        Iddq0_VboxLO_S_1747 __Port[0] = F021FlashFlow_S_1753;
        F021FlashFlow_S_1753 __Port[0] = PgmAnalogTrims_S_348;
        Test_0_1758 __Port[0] = SupplyShorts_1818;
        ATPG_CPU_VboxHi_S_1732 __Port[0] = RAMBIST_VBoxHi_S_1980;
        RAMBIST_VBoxHi_S_1980 __Port[0] = ATPG_CPU_VboxLo_S_1777;
        SrchFrq_Vmin_Post_S_1755 __Port[0] = Iddq_VboxLO_Post_S_1758;
        Iddq_VboxLO_Post_S_1758 __Port[0] = Iddq_Delta_S_360;
        ATPG_CPU_Vmax_S_1761 __Port[0] = RAMBIST_Vmax_S_366;
        RAMBIST_Vmax_S_366 __Port[0] = FuncBIST_Vmax_S_378;
        ATPG_CPU_VboxLo_S_1777 __Port[0] = RAMBIST_VBoxLo_S_1781;
        RAMBIST_VBoxLo_S_1781 __Port[0] = SrchFrq_Vmin_Post_S_1755;
        Currents_S_387 __Port[0] = Test_0_1758;
        DieID_Prog_S_1803 __Port[0] = Iddq0_VboxLO_S_1747;
        FuncBIST_Vmax_S_378 __Port[0] = Currents_S_387;
        SupplyShorts_1818 __Port[0] = GOOD_UNIT_1822;
        SupplyShorts_1818 __Port[1] = F_OS_SHRT_VDD_1868;
        Digital_Continuity_321 __Port[0] = SupplyShorts_327;
        Digital_Continuity_321 __Port[1] = F_OS_OPEN_324;
        FF_InitCheck_T_315 __Port[0] = GOOD_UNIT_319;
        FF_InitCheck_T_315 __Port[1] = F_FUSE_DIEID_PRE_READ_318;
        SupplyShorts_327 __Port[0] = FF_InitCheck_T_315;
        SupplyShorts_327 __Port[1] = F_OS_SHRT_VDD_330;
        FuseCtlr_S_309 __Port[0] = DieID_S_321;
        DieID_S_321 __Port[0] = RAMBIST_Vmin_S_1711;
        Trim_S_331 __Port[0] = FuncBIST_Vmin_S_336;
        FuncBIST_Vmin_S_336 __Port[0] = Srchs_Vmin_Pre_S_1726;
        PgmAnalogTrims_S_348 __Port[0] = HiVoltageStress_S_352;
        HiVoltageStress_S_352 __Port[0] = ATPG_CPU_VboxHi_S_1732;
        Iddq_Delta_S_360 __Port[0] = ATPG_CPU_Vmax_S_1761;
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,1300,265,0,0,30,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,785,397,0,0,30,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,533,139,0,0,30,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,550,258,0,0,30,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Needs Work";
        __Data = (0,0,398,141,0,0,31,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,646,139,0,0,30,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Needs Work";
        __Data = (0,0,651,400,0,0,31,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Needs Work";
        __Data = (0,0,68,0,0,0,31,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,620,18,0,0,30,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,894,18,0,0,30,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Needs Work";
        __Data = (0,0,875,145,0,0,31,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,301,136,0,0,30,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,177,140,0,0,30,0,0,3,0,0,1,0,0,0);
    }
}
//Commented out preliminarily for x-series to diamond program conversion -BJP
/*	__Node  Probe_OpenShrt_S_602 {
		__XCoord = (50,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "13";
		__Exec =  Probe_OpenShrt_S;
	}
	__Node  Probe_PreStress_S_603 {
		__XCoord = (180,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "14";
		__Exec =  Probe_PreStress_S;
	}
	__Node  Probe_MemRepair_S_604 {
		__XCoord = (310,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "15";
		__Exec =  Probe_MemRepair_S;
	}
	__Node  Probe_PreStressPostRepr_S_605 {
		__XCoord = (440,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "16";
		__Exec =  Probe_PreStressPostRepr_S;
	}
	__Node  Probe_PostStressFunc_S_606 {
		__XCoord = (570,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "17";
		__Exec =  Probe_PostStressFunc_S;
	}
	__Node  Probe_PostStressSrch_S_607 {
		__XCoord = (700,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "18";
		__Exec =  Probe_PostStressSrch_S;
	}
	__Node  Probe_PostStressIddq_S_608 {
		__XCoord = (830,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "19";
		__Exec =  Probe_PostStressIddq_S;
	}
	__Node  Probe_AtSpeed_S_609 {
		__XCoord = (960,250);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "20";
		__Exec =  Probe_AtSpeed_S;
	}
	__Node  Probe_Parametrics_S_610 {
		__XCoord = (1090,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "21";
		__Exec =  Probe_Parametrics_S;
	}
	__Node  Probe_SupplyShort_S_611 {
		__XCoord = (1220,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "22";
		__Exec =  Probe_SupplyShort_S;
	}
	__Node  Probe_CRES_S_612 {
		__XCoord = (1350,150);
		__Port[0] {
			__PortPosition = 55;
		}
		__InputPosition = 290;
		__TestID = "23";
		__Exec =  Probe_CRES_S;
	}
	__Node FlowNode_613 {
		__XCoord = (1480,150);
		__Port[0] {
			__PortPosition = 160;
		}
		__InputPosition = 220;
		__TestID = "24";
		__PortSelect =  "if(GlobalNotBinned.Meas, 0, 1)";
	}
	__Node  GOOD_UNIT_614 {
		__XCoord = (1480,280);
		__InputPosition = 0;
		__TestID = "25";
		__Exec =  GOOD_UNIT;
	}
	__Node  F021_10XCycle_S_615 {
		__XCoord = (73,313);
		__Port[0] {
			__PortPosition = 2060;
		}
		__InputPosition = 0;
		__TestID = "";
		__Exec =  F021_10XCycle_S;
	}
	__NameFormat = "{Exec}_{GCounter}";
	__StartNode =  Probe_OpenShrt_S_602;
	__PortConnections {
	 Probe_OpenShrt_S_602 __Port[0] =  Probe_PreStress_S_603;//To Port = 1;
	 Probe_PreStress_S_603 __Port[0] =  Probe_MemRepair_S_604;//To Port = 2;
	 Probe_MemRepair_S_604 __Port[0] =  Probe_PreStressPostRepr_S_605;//To Port = 3;
	 Probe_PreStressPostRepr_S_605 __Port[0] =  Probe_PostStressFunc_S_606;//To Port = 4;
	 Probe_PostStressFunc_S_606 __Port[0] =  Probe_PostStressSrch_S_607;//To Port = 5;
	 Probe_PostStressSrch_S_607 __Port[0] =  Probe_PostStressIddq_S_608;//To Port = 6;
	 Probe_PostStressIddq_S_608 __Port[0] =  Probe_Parametrics_S_610;//To Port = 8;
	 Probe_AtSpeed_S_609 __Port[0] =  Probe_Parametrics_S_610;//To Port = 8;
	 Probe_Parametrics_S_610 __Port[0] =  Probe_SupplyShort_S_611;//To Port = 9;
	 Probe_SupplyShort_S_611 __Port[0] =  Probe_CRES_S_612;//To Port = 10;
	 Probe_CRES_S_612 __Port[0] = FlowNode_613;//To Port = 11;
	FlowNode_613 __Port[0] =  GOOD_UNIT_614;//To Port = 12;
	}
}*/
/*** END SubFlow Probe_SUB_FLOW ***/

/****************************************************************************/
/*** SubFlow Probe_OpenShrt_S                                             ***/
/****************************************************************************/
/*** END SubFlow Probe_OpenShrt_S ***/

/****************************************************************************/
/*** SubFlow Probe_SrchVdd_Vmin_Pre1_S                                    ***/
/****************************************************************************/
__SubFlow Probe_SrchVdd_Vmin_Pre1_S {
    __NameFormat = "{Exec}_{GCounter}";
}
/*** END SubFlow Probe_SrchVdd_Vmin_Pre1_S ***/

/****************************************************************************/
/*** SubFlow Probe_Func_Vmin_Pre1_S                                       ***/
/****************************************************************************/
__SubFlow Probe_Func_Vmin_Pre1_S {
    __NameFormat = "{Exec}_{GCounter}";
}
/*** END SubFlow Probe_Func_Vmin_Pre1_S ***/

/****************************************************************************/
/*** SubFlow Probe_DieID_Read_Pre_S                                       ***/
/****************************************************************************/
__SubFlow Probe_DieID_Read_Pre_S {
    __NameFormat = "{Exec}_{GCounter}";
}
/*** END SubFlow Probe_DieID_Read_Pre_S ***/

/****************************************************************************/
/*** SubFlow Probe_PreStress_S                                            ***/
/****************************************************************************/
__SubFlow Probe_PreStress_S {
    __NameFormat = "{Exec}_{GCounter}";
}
/*** END SubFlow Probe_PreStress_S ***/

/****************************************************************************/
/*** SubFlow Probe_PreMemRepair_S                                         ***/
/****************************************************************************/
__SubFlow Probe_PreMemRepair_S {
    __NameFormat = "{Exec}_{GCounter}";
}
/*** END SubFlow Probe_PreMemRepair_S ***/

/****************************************************************************/
/*** SubFlow Probe_MemDatalog_S                                           ***/
/****************************************************************************/
__SubFlow Probe_MemDatalog_S {
    __NameFormat = "{Exec}_{GCounter}";
}
/*** END SubFlow Probe_MemDatalog_S ***/

/****************************************************************************/
/*** SubFlow Probe_CheckNonDiags_S                                        ***/
/****************************************************************************/
__SubFlow Probe_CheckNonDiags_S {
    __NameFormat = "{Exec}_{GCounter}";
}
/*** END SubFlow Probe_CheckNonDiags_S ***/

/****************************************************************************/
/*** SubFlow Probe_CheckRedDiags_S                                        ***/
/****************************************************************************/
__SubFlow Probe_CheckRedDiags_S {
    __NameFormat = "{Exec}_{GCounter}";
}
/*** END SubFlow Probe_CheckRedDiags_S ***/

/****************************************************************************/
/*** SubFlow Probe_MemEfusePgm_S                                          ***/
/****************************************************************************/
__SubFlow Probe_MemEfusePgm_S {
    __NameFormat = "{Exec}_{GCounter}";
}
/*** END SubFlow Probe_MemEfusePgm_S ***/

/****************************************************************************/
/*** SubFlow Probe_PostMemRepair_S                                        ***/
/****************************************************************************/
__SubFlow Probe_PostMemRepair_S {
    __NameFormat = "{Exec}_{GCounter}";
}
/*** END SubFlow Probe_PostMemRepair_S ***/

/****************************************************************************/
/*** SubFlow Probe_MemRepair_S                                            ***/
/****************************************************************************/
__SubFlow Probe_MemRepair_S {
    __NameFormat = "{Exec}_{GCounter}";
}
/*** END SubFlow Probe_MemRepair_S ***/

/****************************************************************************/
/*** SubFlow Probe_Func_Vmin_Pre2_S                                       ***/
/****************************************************************************/
__SubFlow Probe_Func_Vmin_Pre2_S {
    __NameFormat = "{Exec}_{GCounter}";
}
/*** END SubFlow Probe_Func_Vmin_Pre2_S ***/

/****************************************************************************/
/*** SubFlow Probe_DieID_Prog_S                                           ***/
/****************************************************************************/
__SubFlow Probe_DieID_Prog_S {
    __NameFormat = "{Exec}_{GCounter}";
}
/*** END SubFlow Probe_DieID_Prog_S ***/

/****************************************************************************/
/*** SubFlow Probe_Iddq0_VboxLO_S                                         ***/
/****************************************************************************/
__SubFlow Probe_Iddq0_VboxLO_S {
    __NameFormat = "{Exec}_{GCounter}";
}
/*** END SubFlow Probe_Iddq0_VboxLO_S ***/

/*** END SubFlow Probe_Func_NonVbox_S ***/
/****************************************************************************/
/*** SubFlow Probe_PreStressPostRepr_S                                    ***/
/****************************************************************************/
__SubFlow Probe_PreStressPostRepr_S {
    __NameFormat = "{Exec}_{GCounter}";
}
