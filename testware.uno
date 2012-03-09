Unison:U1.0c:S5.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/testware.evo                                   */
/* Creation Date  : Tue Jan  3 17:13:02 2012                                  */
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


__Test TW_NewUnit {
    __PortExpression[0] = __Expression { __String = "TRUE"; }
    __PortExpression[1] = __Expression { __String = "TRUE"; }
    __Block[0] = {
        __Title = Block1;
        __TestMethod {
            __Name = TWPDLDataLogNewUnit;
            unitnum = __Expression { __String = "0"; }
        }
    }
}


__FunctionCall TW_Init_MF {
}


__FunctionCall TW_Print_MF {
    __WrapCells = __True;
}


__FunctionCall TW_NewUnit_MF {
    __WrapCells = __True;
}
