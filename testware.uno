Unison:U0.2:S4.3;

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
		__EnableExpression = __Expression { __String = "TRUE"; }
		__Result = __Expression { __String = "#"; __Mode = Output; }
		__Title = TW_NewUnit_st;
		__TestMethod {
			__Name = LTXC::GenericTest;
		}
	}
	__Block[1] = {
		__EnableExpression = __Expression { __String = "if(CharacterizeDevice OR (CharDevCount != CharDevCount.Typ),TRUE,FALSE)"; }
		__Result = __Expression { __String = "#"; __Mode = Output; }
		__Title = TW_NewUnit_CharStuff_st;
		__TestMethod {
			__Name = LTXC::GenericTest;
		}
	}
}


__FunctionCall TW_Init_MF {/* --A MicroFlow was here... */}


__FunctionCall TW_Print_MF {/* --A MicroFlow was here... */}


__FunctionCall TW_NewUnit_MF {/* --A MicroFlow was here... */}

                            
