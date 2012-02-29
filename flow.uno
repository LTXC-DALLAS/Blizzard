Unison:U0.2:S4.3;

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
