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
        __XCoord = (45,50);
        __Port[0] {
            __PortPosition = 90;
        }
        __InputPosition = 0;
        __TestID = "";
        __Exec = Continuity_S;
    }
    __Node ATPG_CPU_Vmin_S_1699 {
        __XCoord = (182,49);
        __Port[0] {
            __PortPosition = 90;
        }
        __InputPosition = 270;
        __TestID = "";
        __Exec = ATPG_CPU_Vmin_S;
    }
    __Node PathDelay_Vmin_S_1743 {
        __XCoord = (328,51);
        __Port[0] {
            __PortPosition = 90;
        }
        __InputPosition = 270;
        __TestID = "";
        __Exec = PathDelay_Vmin_S;
    }
    __Node RAMBIST_Vmin_S_1711 {
        __XCoord = (474,53);
        __Port[0] {
            __PortPosition = 93;
        }
        __InputPosition = 272;
        __TestID = "";
        __Exec = RAMBIST_Vmin_S;
    }
    __Node Srchs_Vmin_Pre_S_1726 {
        __XCoord = (617,55);
        __Port[0] {
            __PortPosition = 183;
        }
        __InputPosition = 271;
        __TestID = "";
        __Exec = Srchs_Vmin_Pre_S;
    }
    __Node Iddq0_VboxLO_S_1747 {
        __XCoord = (615,174);
        __Port[0] {
            __PortPosition = 267;
        }
        __InputPosition = 0;
        __TestID = "";
        __Exec = Iddq0_VboxLO_S;
    }
    __Node F021FlashFlow_S_1753 {
        __XCoord = (491,175);
        __Port[0] {
            __PortPosition = 270;
        }
        __InputPosition = 91;
        __TestID = "";
        __Exec = F021FlashFlow_S;
    }
    __Node Test_0_1758 {
        __XCoord = (391,176);
        __Port[0] {
            __PortPosition = 270;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 88;
        __TestID = "27000000";
        __Exec = WrEngRow_func;
    }
    __Node ATPG_CPU_VboxHi_S_1732 {
        __XCoord = (272,177);
        __Port[0] {
            __PortPosition = 270;
        }
        __InputPosition = 88;
        __TestID = "";
        __Exec = ATPG_CPU_VboxHi_S;
    }
    __Node RAMBIST_VBoxHi_S_1980 {
        __XCoord = (152,176);
        __Port[0] {
            __PortPosition = 271;
        }
        __InputPosition = 91;
        __TestID = "";
        __Exec = RAMBIST_VBoxHi_S;
    }
    __Node SrchFrq_Vmin_Post_S_1755 {
        __XCoord = (31,177);
        __Port[0] {
            __PortPosition = 181;
        }
        __InputPosition = 90;
        __TestID = "";
        __Exec = SrchFrq_Vmin_Post_S;
    }
    __Node Iddq_VboxLO_Post_S_1758 {
        __XCoord = (31,304);
        __Port[0] {
            __PortPosition = 91;
        }
        __InputPosition = 357;
        __TestID = "";
        __Exec = Iddq_VboxLO_Post_S;
    }
    __Node ATPG_CPU_Vmax_S_1761 {
        __XCoord = (153,304);
        __Port[0] {
            __PortPosition = 95;
        }
        __InputPosition = 271;
        __TestID = "";
        __Exec = ATPG_CPU_Vmax_S;
    }
    __Node PathDelay_Vmax_S_1761 {
        __XCoord = (280,305);
        __Port[0] {
            __PortPosition = 92;
        }
        __InputPosition = 267;
        __TestID = "";
        __Exec = PathDelay_Vmax_S;
    }
    __Node ATPG_CPU_VboxLo_S_1777 {
        __XCoord = (398,304);
        __Port[0] {
            __PortPosition = 92;
        }
        __InputPosition = 273;
        __TestID = "";
        __Exec = ATPG_CPU_VboxLo_S;
    }
    __Node RAMBIST_VBoxLo_S_1781 {
        __XCoord = (522,305);
        __Port[0] {
            __PortPosition = 96;
        }
        __InputPosition = 271;
        __TestID = "";
        __Exec = RAMBIST_VBoxLo_S;
    }
    __Node Leakage_S_1795 {
        __XCoord = (647,303);
        __Port[0] {
            __PortPosition = 181;
        }
        __InputPosition = 266;
        __TestID = "";
        __Exec = Leakage_S;
    }
    __Node Levels_S_1799 {
        __XCoord = (651,438);
        __Port[0] {
            __PortPosition = 271;
        }
        __InputPosition = 0;
        __TestID = "";
        __Exec = Levels_S;
    }
    __Node DieID_Prog_S_1803 {
        __XCoord = (531,436);
        __Port[0] {
            __PortPosition = 267;
        }
        __InputPosition = 91;
        __TestID = "";
        __Exec = DieID_Prog_S;
    }
    __Node DieID_PreRead_S_1807 {
        __XCoord = (406,437);
        __Port[0] {
            __PortPosition = 271;
        }
        __InputPosition = 91;
        __TestID = "";
        __Exec = DieID_PreRead_S;
    }
    __Node SupplyShorts_1818 {
        __XCoord = (294,440);
        __Port[0] {
            __PortPosition = 271;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 84;
        __TestID = "43000000";
        __Exec = SupplyShorts;
    }
    __Node GOOD_UNIT_1822 {
        __XCoord = (174,466);
        __InputPosition = 83;
        __TestID = "";
        __Exec = GOOD_UNIT;
    }
    __Node F_OS_SHRT_VDD_1868 {
        __XCoord = (293,575);
        __InputPosition = 0;
        __TestID = "";
        __Exec = F_OS_SHRT_VDD;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = Continuity_1785;
    __PortConnections {
        Continuity_1785 __Port[0] = ATPG_CPU_Vmin_S_1699;
        ATPG_CPU_Vmin_S_1699 __Port[0] = PathDelay_Vmin_S_1743;
        PathDelay_Vmin_S_1743 __Port[0] = RAMBIST_Vmin_S_1711;
        RAMBIST_Vmin_S_1711 __Port[0] = Srchs_Vmin_Pre_S_1726;
        Srchs_Vmin_Pre_S_1726 __Port[0] = Iddq0_VboxLO_S_1747;
        Iddq0_VboxLO_S_1747 __Port[0] = F021FlashFlow_S_1753;
        F021FlashFlow_S_1753 __Port[0] = Test_0_1758;
        Test_0_1758 __Port[0] = ATPG_CPU_VboxHi_S_1732;
        ATPG_CPU_VboxHi_S_1732 __Port[0] = RAMBIST_VBoxHi_S_1980;
        RAMBIST_VBoxHi_S_1980 __Port[0] = SrchFrq_Vmin_Post_S_1755;
        SrchFrq_Vmin_Post_S_1755 __Port[0] = Iddq_VboxLO_Post_S_1758;
        Iddq_VboxLO_Post_S_1758 __Port[0] = ATPG_CPU_Vmax_S_1761;
        ATPG_CPU_Vmax_S_1761 __Port[0] = PathDelay_Vmax_S_1761;
        PathDelay_Vmax_S_1761 __Port[0] = ATPG_CPU_VboxLo_S_1777;
        ATPG_CPU_VboxLo_S_1777 __Port[0] = RAMBIST_VBoxLo_S_1781;
        RAMBIST_VBoxLo_S_1781 __Port[0] = Leakage_S_1795;
        Leakage_S_1795 __Port[0] = Levels_S_1799;
        Levels_S_1799 __Port[0] = DieID_Prog_S_1803;
        DieID_Prog_S_1803 __Port[0] = DieID_PreRead_S_1807;
        DieID_PreRead_S_1807 __Port[0] = SupplyShorts_1818;
        SupplyShorts_1818 __Port[0] = GOOD_UNIT_1822;
        SupplyShorts_1818 __Port[1] = F_OS_SHRT_VDD_1868;
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,675,291,0,0,30,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,660,421,0,0,30,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,558,420,0,0,30,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,35,292,0,0,30,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,517,163,0,0,30,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Empty";
        __Data = (0,0,621,155,0,0,30,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Needs Work";
        __Data = (0,0,394,163,0,0,31,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Needs Work";
        __Data = (0,0,62,22,0,0,31,0,0,3,0,0,1,0,0,0);
    }
    __Background {
        __String = "Flow order may be screwed up here.";
        __Data = (0,0,194,392,0,0,26,0,0,3,0,0,1,0,0,0);
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
__SubFlow Probe_SrchVdd_Vmin_Pre1_S {/*
    __Node VminSearchPre1_630 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "40";
        __Exec = VminSearchPre1;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_631 {
        __XCoord = (50,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "41";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_632 {
        __XCoord = (50,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "42";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin;
    }
    __Node VminSearchPre1_1_633 {
        __XCoord = (200,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "43";
        __Exec = VminSearchPre1_1;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_634 {
        __XCoord = (200,325);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "44";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_GROS_100_pre_635 {
        __XCoord = (200,455);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "45";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_GROS_100_pre;
    }
    __Node VminSearchPre1_2_636 {
        __XCoord = (350,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_15"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "46";
        __Exec = VminSearchPre1_2;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_637 {
        __XCoord = (350,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "47";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_GROS_100_1_pre_638 {
        __XCoord = (350,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "48";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_GROS_100_1_pre;
    }
    __Node VminSearchPre1_3_639 {
        __XCoord = (500,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_16"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "49";
        __Exec = VminSearchPre1_3;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_640 {
        __XCoord = (500,325);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "50";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_GROS_100_2_pre_641 {
        __XCoord = (500,455);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "51";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_GROS_100_2_pre;
    }
    __Node VminSearchPre1_4_642 {
        __XCoord = (650,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "52";
        __Exec = VminSearchPre1_4;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_643 {
        __XCoord = (650,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "53";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_GROS_100_3_pre_644 {
        __XCoord = (650,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "54";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_GROS_100_3_pre;
    }
    __Node VminSearchPre1_5_645 {
        __XCoord = (800,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_18"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "55";
        __Exec = VminSearchPre1_5;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_646 {
        __XCoord = (800,325);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "56";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_GROS_100_4_pre_647 {
        __XCoord = (800,455);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "57";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_GROS_100_4_pre;
    }
    __Node VminSearchPre1_6_648 {
        __XCoord = (950,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_9"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "58";
        __Exec = VminSearchPre1_6;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_649 {
        __XCoord = (950,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "59";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_GROS_166p66_pre_650 {
        __XCoord = (950,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "60";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_GROS_166p66_pre;
    }
    __Node VminSearchPre1_7_651 {
        __XCoord = (1100,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "61";
        __Exec = VminSearchPre1_7;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_652 {
        __XCoord = (1100,325);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "62";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_ANALOG_USB_OTG_100_653 {
        __XCoord = (1100,455);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "63";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_ANALOG_USB_OTG_100;
    }
    __Node VminSearchPre1_8_654 {
        __XCoord = (1250,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "64";
        __Exec = VminSearchPre1_8;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_655 {
        __XCoord = (1250,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "65";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_1_656 {
        __XCoord = (1250,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "66";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_1;
    }
    __Node VminSearchPre1_9_657 {
        __XCoord = (1400,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "67";
        __Exec = VminSearchPre1_9;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_658 {
        __XCoord = (1400,325);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "68";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_ANALOG_USB_CHG_100_659 {
        __XCoord = (1400,455);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "69";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_ANALOG_USB_CHG_100;
    }
    __Node FlowNode_660 {
        __XCoord = (1550,150);
        __InputPosition = 270;
        __TestID = "70";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = VminSearchPre1_630;
    __PortConnections {
        VminSearchPre1_630 __Port[0] = VminSearchPre1_1_633;
        VminSearchPre1_630 __Port[1] = PreBinFlow_S_631;
        PreBinFlow_S_631 __Port[0] = F_FUNC_Vmin_632;
        F_FUNC_Vmin_632 __Port[0] = VminSearchPre1_1_633;
        VminSearchPre1_1_633 __Port[0] = VminSearchPre1_2_636;
        VminSearchPre1_1_633 __Port[1] = PreBinFlow_S_634;
        PreBinFlow_S_634 __Port[0] = F_FUNC_Vmin_GROS_100_pre_635;
        F_FUNC_Vmin_GROS_100_pre_635 __Port[0] = VminSearchPre1_2_636;
        VminSearchPre1_2_636 __Port[0] = VminSearchPre1_3_639;
        VminSearchPre1_2_636 __Port[1] = PreBinFlow_S_637;
        PreBinFlow_S_637 __Port[0] = F_FUNC_Vmin_GROS_100_1_pre_638;
        F_FUNC_Vmin_GROS_100_1_pre_638 __Port[0] = VminSearchPre1_3_639;
        VminSearchPre1_3_639 __Port[0] = VminSearchPre1_4_642;
        VminSearchPre1_3_639 __Port[1] = PreBinFlow_S_640;
        PreBinFlow_S_640 __Port[0] = F_FUNC_Vmin_GROS_100_2_pre_641;
        F_FUNC_Vmin_GROS_100_2_pre_641 __Port[0] = VminSearchPre1_4_642;
        VminSearchPre1_4_642 __Port[0] = VminSearchPre1_5_645;
        VminSearchPre1_4_642 __Port[1] = PreBinFlow_S_643;
        PreBinFlow_S_643 __Port[0] = F_FUNC_Vmin_GROS_100_3_pre_644;
        F_FUNC_Vmin_GROS_100_3_pre_644 __Port[0] = VminSearchPre1_5_645;
        VminSearchPre1_5_645 __Port[0] = VminSearchPre1_6_648;
        VminSearchPre1_5_645 __Port[1] = PreBinFlow_S_646;
        PreBinFlow_S_646 __Port[0] = F_FUNC_Vmin_GROS_100_4_pre_647;
        F_FUNC_Vmin_GROS_100_4_pre_647 __Port[0] = VminSearchPre1_6_648;
        VminSearchPre1_6_648 __Port[0] = VminSearchPre1_7_651;
        VminSearchPre1_6_648 __Port[1] = PreBinFlow_S_649;
        PreBinFlow_S_649 __Port[0] = F_FUNC_Vmin_GROS_166p66_pre_650;
        F_FUNC_Vmin_GROS_166p66_pre_650 __Port[0] = VminSearchPre1_7_651;
        VminSearchPre1_7_651 __Port[0] = VminSearchPre1_8_654;
        VminSearchPre1_7_651 __Port[1] = PreBinFlow_S_652;
        PreBinFlow_S_652 __Port[0] = F_FUNC_Vmin_ANALOG_USB_OTG_100_653;
        F_FUNC_Vmin_ANALOG_USB_OTG_100_653 __Port[0] = VminSearchPre1_8_654;
        VminSearchPre1_8_654 __Port[0] = VminSearchPre1_9_657;
        VminSearchPre1_8_654 __Port[1] = PreBinFlow_S_655;
        PreBinFlow_S_655 __Port[0] = F_FUNC_Vmin_1_656;
        F_FUNC_Vmin_1_656 __Port[0] = VminSearchPre1_9_657;
        VminSearchPre1_9_657 __Port[0] = FlowNode_660;
        VminSearchPre1_9_657 __Port[1] = PreBinFlow_S_658;
        PreBinFlow_S_658 __Port[0] = F_FUNC_Vmin_ANALOG_USB_CHG_100_659;
        F_FUNC_Vmin_ANALOG_USB_CHG_100_659 __Port[0] = FlowNode_660;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,1550,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_SrchVdd_Vmin_Pre1_S ***/

/****************************************************************************/
/*** SubFlow Probe_Func_Vmin_Pre1_S                                       ***/
/****************************************************************************/
__SubFlow Probe_Func_Vmin_Pre1_S {/*
    __Node FuncVminPre1_661 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "71";
        __Exec = FuncVminPre1;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_662 {
        __XCoord = (50,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "72";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_2_663 {
        __XCoord = (50,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "73";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_2;
    }
    __Node FuncVminPre1_1_664 {
        __XCoord = (200,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "74";
        __Exec = FuncVminPre1_1;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_665 {
        __XCoord = (200,325);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "75";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_GROS_100_pre_3_666 {
        __XCoord = (200,455);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "76";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_GROS_100_pre_3;
    }
    __Node FuncVminPre1_2_667 {
        __XCoord = (350,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_15"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "77";
        __Exec = FuncVminPre1_2;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_668 {
        __XCoord = (350,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "78";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_GROS_100_1_pre_4_669 {
        __XCoord = (350,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "79";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_GROS_100_1_pre_4;
    }
    __Node FuncVminPre1_3_670 {
        __XCoord = (500,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_16"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "80";
        __Exec = FuncVminPre1_3;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_671 {
        __XCoord = (500,325);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "81";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_GROS_100_2_pre_5_672 {
        __XCoord = (500,455);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "82";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_GROS_100_2_pre_5;
    }
    __Node FuncVminPre1_4_673 {
        __XCoord = (650,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "83";
        __Exec = FuncVminPre1_4;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_674 {
        __XCoord = (650,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "84";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_GROS_100_3_pre_6_675 {
        __XCoord = (650,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "85";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_GROS_100_3_pre_6;
    }
    __Node FuncVminPre1_5_676 {
        __XCoord = (800,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_18"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "86";
        __Exec = FuncVminPre1_5;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_677 {
        __XCoord = (800,325);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "87";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_GROS_100_4_pre_7_678 {
        __XCoord = (800,455);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "88";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_GROS_100_4_pre_7;
    }
    __Node FuncVminPre1_6_679 {
        __XCoord = (950,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_9"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "89";
        __Exec = FuncVminPre1_6;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_680 {
        __XCoord = (950,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "90";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_GROS_166p66_pre_8_681 {
        __XCoord = (950,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "91";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_GROS_166p66_pre_8;
    }
    __Node FuncVminPre1_7_682 {
        __XCoord = (1100,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "92";
        __Exec = FuncVminPre1_7;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_683 {
        __XCoord = (1100,325);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "93";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_10_684 {
        __XCoord = (1100,455);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "94";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_10;
    }
    __Node FuncVminPre1_8_685 {
        __XCoord = (1250,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "95";
        __Exec = FuncVminPre1_8;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_686 {
        __XCoord = (1250,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "96";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_11_687 {
        __XCoord = (1250,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "97";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_11;
    }
    __Node FuncVminPre1_9_688 {
        __XCoord = (1400,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_17"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "98";
        __Exec = FuncVminPre1_9;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_689 {
        __XCoord = (1400,325);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "99";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_13_690 {
        __XCoord = (1400,455);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "100";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_13;
    }
    __Node FlowNode_691 {
        __XCoord = (1550,150);
        __InputPosition = 270;
        __TestID = "101";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FuncVminPre1_661;
    __PortConnections {
        FuncVminPre1_661 __Port[0] = FuncVminPre1_1_664;
        FuncVminPre1_661 __Port[1] = PreBinFlow_S_662;
        PreBinFlow_S_662 __Port[0] = F_FUNC_Vmin_2_663;
        F_FUNC_Vmin_2_663 __Port[0] = FuncVminPre1_1_664;
        FuncVminPre1_1_664 __Port[0] = FuncVminPre1_2_667;
        FuncVminPre1_1_664 __Port[1] = PreBinFlow_S_665;
        PreBinFlow_S_665 __Port[0] = F_FUNC_Vmin_GROS_100_pre_3_666;
        F_FUNC_Vmin_GROS_100_pre_3_666 __Port[0] = FuncVminPre1_2_667;
        FuncVminPre1_2_667 __Port[0] = FuncVminPre1_3_670;
        FuncVminPre1_2_667 __Port[1] = PreBinFlow_S_668;
        PreBinFlow_S_668 __Port[0] = F_FUNC_Vmin_GROS_100_1_pre_4_669;
        F_FUNC_Vmin_GROS_100_1_pre_4_669 __Port[0] = FuncVminPre1_3_670;
        FuncVminPre1_3_670 __Port[0] = FuncVminPre1_4_673;
        FuncVminPre1_3_670 __Port[1] = PreBinFlow_S_671;
        PreBinFlow_S_671 __Port[0] = F_FUNC_Vmin_GROS_100_2_pre_5_672;
        F_FUNC_Vmin_GROS_100_2_pre_5_672 __Port[0] = FuncVminPre1_4_673;
        FuncVminPre1_4_673 __Port[0] = FuncVminPre1_5_676;
        FuncVminPre1_4_673 __Port[1] = PreBinFlow_S_674;
        PreBinFlow_S_674 __Port[0] = F_FUNC_Vmin_GROS_100_3_pre_6_675;
        F_FUNC_Vmin_GROS_100_3_pre_6_675 __Port[0] = FuncVminPre1_5_676;
        FuncVminPre1_5_676 __Port[0] = FuncVminPre1_6_679;
        FuncVminPre1_5_676 __Port[1] = PreBinFlow_S_677;
        PreBinFlow_S_677 __Port[0] = F_FUNC_Vmin_GROS_100_4_pre_7_678;
        F_FUNC_Vmin_GROS_100_4_pre_7_678 __Port[0] = FuncVminPre1_6_679;
        FuncVminPre1_6_679 __Port[0] = FuncVminPre1_7_682;
        FuncVminPre1_6_679 __Port[1] = PreBinFlow_S_680;
        PreBinFlow_S_680 __Port[0] = F_FUNC_Vmin_GROS_166p66_pre_8_681;
        F_FUNC_Vmin_GROS_166p66_pre_8_681 __Port[0] = FuncVminPre1_7_682;
        FuncVminPre1_7_682 __Port[0] = FuncVminPre1_8_685;
        FuncVminPre1_7_682 __Port[1] = PreBinFlow_S_683;
        PreBinFlow_S_683 __Port[0] = F_FUNC_Vmin_10_684;
        F_FUNC_Vmin_10_684 __Port[0] = FuncVminPre1_8_685;
        FuncVminPre1_8_685 __Port[0] = FuncVminPre1_9_688;
        FuncVminPre1_8_685 __Port[1] = PreBinFlow_S_686;
        PreBinFlow_S_686 __Port[0] = F_FUNC_Vmin_11_687;
        F_FUNC_Vmin_11_687 __Port[0] = FuncVminPre1_9_688;
        FuncVminPre1_9_688 __Port[0] = FlowNode_691;
        FuncVminPre1_9_688 __Port[1] = PreBinFlow_S_689;
        PreBinFlow_S_689 __Port[0] = F_FUNC_Vmin_13_690;
        F_FUNC_Vmin_13_690 __Port[0] = FlowNode_691;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,1550,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_Func_Vmin_Pre1_S ***/

/****************************************************************************/
/*** SubFlow Probe_DieID_Read_Pre_S                                       ***/
/****************************************************************************/
__SubFlow Probe_DieID_Read_Pre_S {/*
    __Node CheckFromPre_692 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_8"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vnom"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "102";
        __Exec = CheckFromPre;
//        __Calibration = Bllizar_Calibration;
    }
    __Node F_FUSE_ROM_READ_693 {
        __XCoord = (50,355);
        __InputPosition = 20;
        __TestID = "103";
        __Exec = F_FUSE_ROM_READ;
    }
    __Node FFDieIDRead_694 {
        __XCoord = (200,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_8"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_VEfuseR"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "104";
        __Exec = FFDieIDRead;
//        __Calibration = Bllizar_Calibration;
    }
    __Node F_FUSE_DIEID_PRE_READ_695 {
        __XCoord = (200,325);
        __InputPosition = 20;
        __TestID = "105";
        __Exec = F_FUSE_DIEID_PRE_READ;
    }
    __Node FlowNode_696 {
        __XCoord = (350,150);
        __InputPosition = 270;
        __TestID = "106";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = CheckFromPre_692;
    __PortConnections {
        CheckFromPre_692 __Port[0] = FFDieIDRead_694;
        CheckFromPre_692 __Port[1] = F_FUSE_ROM_READ_693;
        FFDieIDRead_694 __Port[0] = FlowNode_696;
        FFDieIDRead_694 __Port[1] = F_FUSE_DIEID_PRE_READ_695;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_DieID_Read_Pre_S ***/

/****************************************************************************/
/*** SubFlow Probe_PreStress_S                                            ***/
/****************************************************************************/
__SubFlow Probe_PreStress_S {/*
    __Node Probe_SrchVdd_Vmin_Pre1_S_697 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 55;
        }
        __InputPosition = 290;
        __TestID = "107";
        __Exec = Probe_SrchVdd_Vmin_Pre1_S;
    }
    __Node Probe_Func_Vmin_Pre1_S_698 {
        __XCoord = (200,150);
        __Port[0] {
            __PortPosition = 55;
        }
        __InputPosition = 290;
        __TestID = "108";
        __Exec = Probe_Func_Vmin_Pre1_S;
    }
    __Node Probe_DieID_Read_Pre_S_699 {
        __XCoord = (350,150);
        __Port[0] {
            __PortPosition = 55;
        }
        __InputPosition = 290;
        __TestID = "109";
        __Exec = Probe_DieID_Read_Pre_S;
    }
    __Node FlowNode_700 {
        __XCoord = (500,50);
        __InputPosition = 270;
        __TestID = "110";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = Probe_SrchVdd_Vmin_Pre1_S_697;
    __PortConnections {
        Probe_SrchVdd_Vmin_Pre1_S_697 __Port[0] = Probe_Func_Vmin_Pre1_S_698;
        Probe_Func_Vmin_Pre1_S_698 __Port[0] = Probe_DieID_Read_Pre_S_699;
        Probe_DieID_Read_Pre_S_699 __Port[0] = FlowNode_700;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,500,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_PreStress_S ***/

/****************************************************************************/
/*** SubFlow Probe_PreMemRepair_S                                         ***/
/****************************************************************************/
__SubFlow Probe_PreMemRepair_S {/*
    __Node MemGNGVboxLO_701 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_14"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vboxlo"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "111";
        __Exec = MemGNGVboxLO;
//        __Calibration = Bllizar_Calibration;
    }
    __Node FlowNode_702 {
        __XCoord = (200,150);
        __InputPosition = 270;
        __TestID = "112";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = MemGNGVboxLO_701;
    __PortConnections {
        MemGNGVboxLO_701 __Port[0] = FlowNode_702;
        MemGNGVboxLO_701 __Port[1] = FlowNode_702;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_PreMemRepair_S ***/

/****************************************************************************/
/*** SubFlow Probe_MemDatalog_S                                           ***/
/****************************************************************************/
__SubFlow Probe_MemDatalog_S {/*
    __Node FuncDiagsVboxLO_DIAG_VLO_200_703 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_13"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vboxlo"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "113";
        __Exec = FuncDiagsVboxLO_DIAG_VLO_200;
//        __Calibration = Bllizar_Calibration;
    }
    __Node FuncDiagsVboxHI_DIAG_VHI_200_704 {
        __XCoord = (200,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_13"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vboxhi"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "114";
        __Exec = FuncDiagsVboxHI_DIAG_VHI_200;
//        __Calibration = Bllizar_Calibration;
    }
    __Node SendESDA_705 {
        __XCoord = (350,150);
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
        __TestID = "115";
        __Exec = SendESDA;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_706 {
        __XCoord = (350,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "116";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_REPAIR_ESDA_707 {
        __XCoord = (350,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "117";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_REPAIR_ESDA;
    }
    __Node FlowNode_708 {
        __XCoord = (500,150);
        __InputPosition = 270;
        __TestID = "118";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FuncDiagsVboxLO_DIAG_VLO_200_703;
    __PortConnections {
        FuncDiagsVboxLO_DIAG_VLO_200_703 __Port[0] = FuncDiagsVboxHI_DIAG_VHI_200_704;
        FuncDiagsVboxLO_DIAG_VLO_200_703 __Port[1] = FuncDiagsVboxHI_DIAG_VHI_200_704;
        FuncDiagsVboxHI_DIAG_VHI_200_704 __Port[0] = SendESDA_705;
        FuncDiagsVboxHI_DIAG_VHI_200_704 __Port[1] = SendESDA_705;
        SendESDA_705 __Port[0] = FlowNode_708;
        SendESDA_705 __Port[1] = PreBinFlow_S_706;
        PreBinFlow_S_706 __Port[0] = F_FUNC_REPAIR_ESDA_707;
        F_FUNC_REPAIR_ESDA_707 __Port[0] = FlowNode_708;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,500,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_MemDatalog_S ***/

/****************************************************************************/
/*** SubFlow Probe_CheckNonDiags_S                                        ***/
/****************************************************************************/
__SubFlow Probe_CheckNonDiags_S {/*
    __Node CheckNonDiagsFlag_709 {
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
        __TestID = "119";
        __Exec = CheckNonDiagsFlag;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_710 {
        __XCoord = (50,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "120";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_REPAIR_NONREPAIR_711 {
        __XCoord = (50,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "121";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_REPAIR_NONREPAIR;
    }
    __Node FlowNode_712 {
        __XCoord = (200,150);
        __InputPosition = 270;
        __TestID = "122";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = CheckNonDiagsFlag_709;
    __PortConnections {
        CheckNonDiagsFlag_709 __Port[0] = FlowNode_712;
        CheckNonDiagsFlag_709 __Port[1] = PreBinFlow_S_710;
        PreBinFlow_S_710 __Port[0] = F_FUNC_REPAIR_NONREPAIR_711;
        F_FUNC_REPAIR_NONREPAIR_711 __Port[0] = FlowNode_712;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_CheckNonDiags_S ***/

/****************************************************************************/
/*** SubFlow Probe_CheckRedDiags_S                                        ***/
/****************************************************************************/
__SubFlow Probe_CheckRedDiags_S {
/*    __Node CheckRedundancy_713 {
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
        __TestID = "123";
        __Exec = CheckRedundancy;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_714 {
        __XCoord = (50,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "124";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_REPAIR_REDUNDANCY_715 {
        __XCoord = (50,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "125";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_REPAIR_REDUNDANCY;
    }
    __Node FlowNode_716 {
        __XCoord = (200,150);
        __InputPosition = 270;
        __TestID = "126";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = CheckRedundancy_713;
    __PortConnections {
        CheckRedundancy_713 __Port[0] = FlowNode_716;
        CheckRedundancy_713 __Port[1] = PreBinFlow_S_714;
        PreBinFlow_S_714 __Port[0] = F_FUNC_REPAIR_REDUNDANCY_715;
        F_FUNC_REPAIR_REDUNDANCY_715 __Port[0] = FlowNode_716;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_CheckRedDiags_S ***/

/****************************************************************************/
/*** SubFlow Probe_MemEfusePgm_S                                          ***/
/****************************************************************************/
__SubFlow Probe_MemEfusePgm_S {/*
    __Node ProgFuseFarm_717 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_8"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vnom"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "127";
        __Exec = ProgFuseFarm;
//        __Calibration = Bllizar_Calibration;
    }
    __Node F_FUSE_MEM_UNREPAIRABLE_718 {
        __XCoord = (50,355);
        __InputPosition = 20;
        __TestID = "128";
        __Exec = F_FUSE_MEM_UNREPAIRABLE;
    }
    __Node FlowNode_719 {
        __XCoord = (200,150);
        __InputPosition = 270;
        __TestID = "129";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = ProgFuseFarm_717;
    __PortConnections {
        ProgFuseFarm_717 __Port[0] = FlowNode_719;
        ProgFuseFarm_717 __Port[1] = F_FUSE_MEM_UNREPAIRABLE_718;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_MemEfusePgm_S ***/

/****************************************************************************/
/*** SubFlow Probe_PostMemRepair_S                                        ***/
/****************************************************************************/
__SubFlow Probe_PostMemRepair_S {/*
    __Node MemGNGVboxLO_720 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_14"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vboxlo"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "130";
        __Exec = MemGNGVboxLO;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_721 {
        __XCoord = (50,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "131";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vboxlo_722 {
        __XCoord = (50,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "132";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vboxlo;
    }
    __Node FlowNode_723 {
        __XCoord = (200,150);
        __InputPosition = 270;
        __TestID = "133";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = MemGNGVboxLO_720;
    __PortConnections {
        MemGNGVboxLO_720 __Port[0] = FlowNode_723;
        MemGNGVboxLO_720 __Port[1] = PreBinFlow_S_721;
        PreBinFlow_S_721 __Port[0] = F_FUNC_Vboxlo_722;
        F_FUNC_Vboxlo_722 __Port[0] = FlowNode_723;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_PostMemRepair_S ***/

/****************************************************************************/
/*** SubFlow Probe_MemRepair_S                                            ***/
/****************************************************************************/
__SubFlow Probe_MemRepair_S {/*
    __Node Probe_PreMemRepair_S_724 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 55;
        }
        __Port[1] {
            __PortPosition = 125;
        }
        __InputPosition = 290;
        __TestID = "134";
        __Exec = Probe_PreMemRepair_S;
    }
    __Node Probe_MemDatalog_S_725 {
        __XCoord = (200,150);
        __Port[0] {
            __PortPosition = 55;
        }
        __InputPosition = 290;
        __TestID = "135";
        __Exec = Probe_MemDatalog_S;
    }
    __Node Probe_CheckNonDiags_S_726 {
        __XCoord = (350,150);
        __Port[0] {
            __PortPosition = 55;
        }
        __InputPosition = 290;
        __TestID = "136";
        __Exec = Probe_CheckNonDiags_S;
    }
    __Node Probe_CheckRedDiags_S_727 {
        __XCoord = (500,150);
        __Port[0] {
            __PortPosition = 55;
        }
        __InputPosition = 290;
        __TestID = "137";
        __Exec = Probe_CheckRedDiags_S;
    }
    __Node Probe_MemEfusePgm_S_728 {
        __XCoord = (650,150);
        __Port[0] {
            __PortPosition = 55;
        }
        __InputPosition = 290;
        __TestID = "138";
        __Exec = Probe_MemEfusePgm_S;
    }
    __Node Probe_PostMemRepair_S_729 {
        __XCoord = (800,150);
        __Port[0] {
            __PortPosition = 55;
        }
        __InputPosition = 290;
        __TestID = "139";
        __Exec = Probe_PostMemRepair_S;
    }
    __Node FlowNode_730 {
        __XCoord = (950,50);
        __InputPosition = 270;
        __TestID = "140";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = Probe_PreMemRepair_S_724;
    __PortConnections {
        Probe_PreMemRepair_S_724 __Port[0] = FlowNode_730;
        Probe_PreMemRepair_S_724 __Port[1] = FlowNode_730;
        Probe_MemDatalog_S_725 __Port[0] = Probe_CheckNonDiags_S_726;
        Probe_CheckNonDiags_S_726 __Port[0] = Probe_CheckRedDiags_S_727;
        Probe_CheckRedDiags_S_727 __Port[0] = Probe_MemEfusePgm_S_728;
        Probe_MemEfusePgm_S_728 __Port[0] = Probe_PostMemRepair_S_729;
        Probe_PostMemRepair_S_729 __Port[0] = FlowNode_730;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,950,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_MemRepair_S ***/

/****************************************************************************/
/*** SubFlow Probe_Func_Vmin_Pre2_S                                       ***/
/****************************************************************************/
__SubFlow Probe_Func_Vmin_Pre2_S {/*
    __Node FuncVminPre2_731 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_11"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "141";
        __Exec = FuncVminPre2;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_732 {
        __XCoord = (50,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "142";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_BIST_PROD_33_pre_733 {
        __XCoord = (50,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "143";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_BIST_PROD_33_pre;
    }
    __Node FuncVminPre2_1_734 {
        __XCoord = (200,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_12"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vmin"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "144";
        __Exec = FuncVminPre2_1;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_735 {
        __XCoord = (200,325);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "145";
        __Exec = PreBinFlow_S;
    }
    __Node F_FUNC_Vmin_BIST_PROD_33_1_pre_736 {
        __XCoord = (200,455);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "146";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_FUNC_Vmin_BIST_PROD_33_1_pre;
    }
    __Node FlowNode_737 {
        __XCoord = (350,150);
        __InputPosition = 270;
        __TestID = "147";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FuncVminPre2_731;
    __PortConnections {
        FuncVminPre2_731 __Port[0] = FuncVminPre2_1_734;
        FuncVminPre2_731 __Port[1] = PreBinFlow_S_732;
        PreBinFlow_S_732 __Port[0] = F_FUNC_Vmin_BIST_PROD_33_pre_733;
        F_FUNC_Vmin_BIST_PROD_33_pre_733 __Port[0] = FuncVminPre2_1_734;
        FuncVminPre2_1_734 __Port[0] = FlowNode_737;
        FuncVminPre2_1_734 __Port[1] = PreBinFlow_S_735;
        PreBinFlow_S_735 __Port[0] = F_FUNC_Vmin_BIST_PROD_33_1_pre_736;
        F_FUNC_Vmin_BIST_PROD_33_1_pre_736 __Port[0] = FlowNode_737;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_Func_Vmin_Pre2_S ***/

/****************************************************************************/
/*** SubFlow Probe_DieID_Prog_S                                           ***/
/****************************************************************************/
__SubFlow Probe_DieID_Prog_S {/*
    __Node FFDieIDProg_738 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_8"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_VEfuseP"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "148";
        __Exec = FFDieIDProg;
//        __Calibration = Bllizar_Calibration;
    }
    __Node F_FUSE_DIEID_PROG_739 {
        __XCoord = (50,355);
        __InputPosition = 20;
        __TestID = "149";
        __Exec = F_FUSE_DIEID_PROG;
    }
    __Node FlowNode_740 {
        __XCoord = (200,150);
        __InputPosition = 270;
        __TestID = "150";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FFDieIDProg_738;
    __PortConnections {
        FFDieIDProg_738 __Port[0] = FlowNode_740;
        FFDieIDProg_738 __Port[1] = F_FUSE_DIEID_PROG_739;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,200,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_DieID_Prog_S ***/

/****************************************************************************/
/*** SubFlow Probe_Iddq0_VboxLO_S                                         ***/
/****************************************************************************/
__SubFlow Probe_Iddq0_VboxLO_S {/*
    __Node IddqVboxLOPre_741 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_3"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vboxlo"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "151";
        __Exec = IddqVboxLOPre;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_742 {
        __XCoord = (50,355);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "152";
        __Exec = PreBinFlow_S;
    }
    __Node F_LEAK_IDDQ_Vboxlo_pre_VDDS_743 {
        __XCoord = (50,485);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "153";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_LEAK_IDDQ_Vboxlo_pre_VDDS;
    }
    __Node IddqVboxLOPre_1_744 {
        __XCoord = (200,150);
        __Port[0] {
            __PortPosition = 65;
        }
        __Port[1] {
            __PortPosition = 90;
        }
        __InputPosition = 295;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.AC_cat_10"; __Type = INTEGER; }
            PSSpecs = __Expression { __String = "PSSpecs.PS_Vboxlo"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCDataSelect"; __Type = INTEGER; }
        }
        __TestID = "154";
        __Exec = IddqVboxLOPre_1;
//        __Calibration = Bllizar_Calibration;
    }
    __Node PreBinFlow_S_745 {
        __XCoord = (200,325);
        __Port[0] {
            __PortPosition = 175;
        }
        __InputPosition = 20;
        __TestID = "155";
        __Exec = PreBinFlow_S;
    }
    __Node F_LEAK_IDDQ_Vboxlo_pre_VDDS_1_746 {
        __XCoord = (200,455);
        __Port[0] {
            __PortPosition = 115;
        }
        __InputPosition = 20;
        __TestID = "156";
        __PortSelect = "skip( if(ContinueOnFail, 0, 1), FALSE->GlobalNotBinned )";
        __Exec = F_LEAK_IDDQ_Vboxlo_pre_VDDS_1;
    }
    __Node FlowNode_747 {
        __XCoord = (350,150);
        __InputPosition = 270;
        __TestID = "157";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = IddqVboxLOPre_741;
    __PortConnections {
        IddqVboxLOPre_741 __Port[0] = IddqVboxLOPre_1_744;
        IddqVboxLOPre_741 __Port[1] = PreBinFlow_S_742;
        PreBinFlow_S_742 __Port[0] = F_LEAK_IDDQ_Vboxlo_pre_VDDS_743;
        F_LEAK_IDDQ_Vboxlo_pre_VDDS_743 __Port[0] = IddqVboxLOPre_1_744;
        IddqVboxLOPre_1_744 __Port[0] = FlowNode_747;
        IddqVboxLOPre_1_744 __Port[1] = PreBinFlow_S_745;
        PreBinFlow_S_745 __Port[0] = F_LEAK_IDDQ_Vboxlo_pre_VDDS_1_746;
        F_LEAK_IDDQ_Vboxlo_pre_VDDS_1_746 __Port[0] = FlowNode_747;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,350,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_Iddq0_VboxLO_S ***/

/*** END SubFlow Probe_Func_NonVbox_S ***/
/****************************************************************************/
/*** SubFlow Probe_PreStressPostRepr_S                                    ***/
/****************************************************************************/
__SubFlow Probe_PreStressPostRepr_S {/*
    __Node Probe_Func_Vmin_Pre2_S_748 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 55;
        }
        __InputPosition = 290;
        __TestID = "158";
        __Exec = Probe_Func_Vmin_Pre2_S;
    }
    __Node Probe_DieID_Prog_S_749 {
        __XCoord = (200,150);
        __Port[0] {
            __PortPosition = 55;
        }
        __InputPosition = 290;
        __TestID = "159";
        __Exec = Probe_DieID_Prog_S;
    }
    __Node Probe_Iddq0_VboxLO_S_750 {
        __XCoord = (350,150);
        __Port[0] {
            __PortPosition = 55;
        }
        __InputPosition = 290;
        __TestID = "160";
        __Exec = Probe_Iddq0_VboxLO_S;
    }
    __Node FlowNode_751 {
        __XCoord = (500,50);
        __InputPosition = 270;
        __TestID = "161";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = Probe_Func_Vmin_Pre2_S_748;
    __PortConnections {
        Probe_Func_Vmin_Pre2_S_748 __Port[0] = Probe_DieID_Prog_S_749;
        Probe_DieID_Prog_S_749 __Port[0] = Probe_Iddq0_VboxLO_S_750;
        Probe_Iddq0_VboxLO_S_750 __Port[0] = FlowNode_751;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,500,35,0,0,23,0,0,4,0,0,1,0,0,0);
    }*/
}
/*** END SubFlow Probe_PreStressPostRepr_S ***/

