Unison:U1.0c:S5.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/boardcheck.evo                                 */
/* Creation Date  : Tue Jan  3 17:12:06 2012                                  */
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


//***
//*** The following must be modified by the user based on device
//*** hardware specific data:
//***
//*** ETest UserCheckLoadBoardID :: Revision_Spec and Part_Number_Spec
//*** ETest SupplyCapChk :: capacitor_value per TestSupply
//***


/*********************************/
/*** UserCheckLoadBoardID Test ***/
/*********************************/
__Test UserCheckLoadBoardID_Bllizar_PB1 {
}
//end of __ETest


/******************************/
/*** Supply Capacitor Check ***/
/******************************/

__Test SupplyCapChk_Bllizar_PB1 {
}
//end of __ETest


/**************************/
/*** BoardCheck SubFlow ***/
/**************************/

__SubFlow BoardCheck_Bllizar_PB1 {
    __Node FlowNode_1350 {
        __XCoord = (50,55);
        __Port[0] {
            __PortPosition = 96;
        }
        __InputPosition = 266;
        __TestID = "";
        __PortSelect = "0";
    }
    __Node ConnectDevice_1351 {
        __XCoord = (200,50);
        __Port[0] {
            __PortPosition = 91;
        }
        __InputPosition = 270;
        __TestID = "1000000";
        __Exec = ConnectDevice;
    }
    __Node UserCheckLoadBoardID_Bllizar_PB1_1352 {
        __XCoord = (350,50);
        __Port[0] {
            __PortPosition = 86;
        }
        __Port[1] {
            __PortPosition = 180;
        }
        __InputPosition = 272;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "0"; __Type = INTEGER; }
        }
        __TestID = "2000000";
        __Exec = UserCheckLoadBoardID_Bllizar_PB1;
    }
    __Node SupplyCapChk_Bllizar_PB1_1353 {
        __XCoord = (500,50);
        __Port[0] {
            __PortPosition = 81;
        }
        __Port[1] {
            __PortPosition = 195;
        }
        __Port[2] {
            __PortPosition = 190;
        }
        __Port[3] {
            __PortPosition = 185;
        }
        __Port[4] {
            __PortPosition = 180;
        }
        __InputPosition = 274;
        __SpecPairs {
            ACSpecs = __Expression { __String = "ACSpecs.CommonACdata"; __Type = INTEGER; }
            DCSpecs = __Expression { __String = "DCSpecs.CommonDCdata"; __Type = INTEGER; }
            Globals_Meas = __Expression { __String = "0"; __Type = INTEGER; }
        }
        __TestID = "3000000";
        __Exec = SupplyCapChk_Bllizar_PB1;
    }
    __Node DisconnectDevice_1354 {
        __XCoord = (800,50);
        __Port[0] {
            __PortPosition = 81;
        }
        __InputPosition = 270;
        __TestID = "4000000";
        __Exec = DisconnectDevice;
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FlowNode_1350;
    __PortConnections {
        FlowNode_1350 __Port[0] = ConnectDevice_1351;
        ConnectDevice_1351 __Port[0] = UserCheckLoadBoardID_Bllizar_PB1_1352;
        UserCheckLoadBoardID_Bllizar_PB1_1352 __Port[0] = SupplyCapChk_Bllizar_PB1_1353;
        UserCheckLoadBoardID_Bllizar_PB1_1352 __Port[1] = DisconnectDevice_1354;
        SupplyCapChk_Bllizar_PB1_1353 __Port[0] = DisconnectDevice_1354;
        SupplyCapChk_Bllizar_PB1_1353 __Port[1] = DisconnectDevice_1354;
        SupplyCapChk_Bllizar_PB1_1353 __Port[2] = DisconnectDevice_1354;
        SupplyCapChk_Bllizar_PB1_1353 __Port[3] = DisconnectDevice_1354;
        SupplyCapChk_Bllizar_PB1_1353 __Port[4] = DisconnectDevice_1354;
    }
    __Background {
        __String = "Execute SubFlow only once regardless of number of sites";
        __Data = (0,0,8,15,0,0,26,0,0,4,0,0,1,0,0,0);
    }
}

/**************************/
/*** BoardCheck SubFlow ***/
/**************************/

__SubFlow BoardCheck {
    __Node BoardCheck_Bllizar_PB1_1355 {
        __XCoord = (112,169);
        __InputPosition = 0;
        __TestID = "";
        __Exec = BoardCheck_Bllizar_PB1;
    }
    __Node FlowNode_1356 {
        __XCoord = (114,42);
        __Port[0] {
            __PortPosition = 184;
        }
        __InputPosition = 268;
        __TestID = "";
        __PortSelect = "0";
    }
    __NameFormat = "{Exec}_{GCounter}";
    __StartNode = FlowNode_1356;
    __PortConnections {
        FlowNode_1356 __Port[0] = BoardCheck_Bllizar_PB1_1355;
    }
    __Background {
        __String = "TIDeviceType = Bllizar_PB1";
        __Data = (0,0,100,18,0,0,23,0,0,4,0,0,1,0,0,0);
    }
}
