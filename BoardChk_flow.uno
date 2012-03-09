Unison:U1.0c:S5.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/BoardChk_flow.evo                              */
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
/*** SubFlow BoardChk_SUB_FLOW                                            ***/
/****************************************************************************/
__SubFlow BoardChk_SUB_FLOW {
    __Node BoardChk_BoardCheck_S_1 {
        __XCoord = (50,150);
        __Port[0] {
            __PortPosition = 55;
        }
        __InputPosition = 290;
        __TestID = "1357";
        __Exec = BoardChk_BoardCheck_S;
    }
    __Node FlowNode_1 {
        __XCoord = (180,150);
        __Port[0] {
            __PortPosition = 160;
        }
        __InputPosition = 220;
        __TestID = "1358";
        __PortSelect = "if(GlobalNotBinned.Meas, 0, 1)";
    }
    __Node GOOD_UNIT_2 {
        __XCoord = (180,280);
        __InputPosition = 0;
        __TestID = "1359";
        __Exec = GOOD_UNIT;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = BoardChk_BoardCheck_S_1;
    __PortConnections {
        BoardChk_BoardCheck_S_1 __Port[0] = FlowNode_1;
        FlowNode_1 __Port[0] = GOOD_UNIT_2;
    }
}
/*** END SubFlow BoardChk_SUB_FLOW ***/

/****************************************************************************/
/*** SubFlow BoardChk_BoardCheck_S                                        ***/
/****************************************************************************/
__SubFlow BoardChk_BoardCheck_S {
    __Node BoardCheck_3 {
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
        __TestID = "1360";
        __Exec = BoardCheck;
    }
    __Node FlowNode_4 {
        __XCoord = (255,150);
        __InputPosition = 270;
        __TestID = "1361";
        __PortSelect = "0";
        __PortNumber = 0;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = BoardCheck_3;
    __PortConnections {
        BoardCheck_3 __Port[0] = FlowNode_4;
        BoardCheck_3 __Port[1] = FlowNode_4;
    }
    __Background {
        __String = "Continue __Port 0";
        __Data = (0,0,255,135,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
