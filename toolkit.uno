Unison:U1.0d:S5.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizard                                         */
/*                                                                            */
/* Program Module : FusionProg/toolkit.uno                                    */
/* Creation Date  : Mon Jun 18 08:08:22 2012                                  */
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
/*  A0 : Initial version of the toolkit.uno file.         : cjp      :        */
/*                                                                            */
/******************************************************************************/
/*  Jazz Version used: /vobs/ASP/jazz/release */
/******************************************************************************/

/***************************/
/*** CaptureTool Objects ***/
/***************************/

__WaveformCapture ALLPINS_Capture {
  __ReferenceSegment "";
  __Start "7945";
  __Stop "50";
  __Resolution "1.5nS";
  __Pins "ALLPINS-FLTP2-AIN04_193" {
	__Merge EVW_Merge_All;
	__DriveEnable __True;
	__ScopeEnable __True;
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
  __Pins "RST_n_122+TCK_152+TDI_150+TDO_149+TMS_151+o_cpu_done_46+o_cpu_fail_47+OSC0_124+PA3_49+PA4_50+AIN10_183+PB6_10+PB0_129+ScanHeader2_PL" {
	__Enable __True;
	__Merge EVW_Merge_All;
	__DriveEnable __True;
	__DriveSize "7";
	__ResponseEnable __True;
	__ResponseSize "7";
	__ScopeDriveSize "7";
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
}

__WaveformCapture PBIST_Logout_Capture {
  __ReferenceSegment "";
  __Start "16300";
  __Stop "100";
  __Resolution "1.5nS";
  __Pins "OSC0_124+o_cpu_done_46+o_cpu_fail_47+PB2_131+TCK_152" {
	__Enable __True;
	__Merge EVW_Merge_All;
	__DriveEnable __True;
	__DriveSize "7";
	__ResponseSize "7";
	__ScopeEnable __True;
	__ScopeDriveSize "7";
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
}

__WaveformCapture PBIST_TestDone_Capture {
  __ReferenceSegment "";
  __Start "1";
  __Stop "40";
  __Resolution "1.5nS";
  __Pins "OSC0_124+o_cpu_done_46+o_cpu_fail_47+PB2_131+TCK_152" {
	__Enable __True;
	__Merge EVW_Merge_All;
	__DriveEnable __True;
	__DriveSize "7";
	__ResponseSize "7";
	__ScopeEnable __True;
	__ScopeDriveSize "7";
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
}

__WaveformCapture PBIST_TestFail_Capture {
  __ReferenceSegment "";
  __Start "1";
  __Stop "40";
  __Resolution "1.5nS";
  __Pins "OSC0_124+o_cpu_done_46+o_cpu_fail_47+PB2_131+TCK_152" {
	__Enable __True;
	__Merge EVW_Merge_All;
	__DriveEnable __True;
	__DriveSize "7";
	__ResponseSize "7";
	__ScopeEnable __True;
	__ScopeDriveSize "7";
	__ScopeHi "3.3V";
	__ScopeLo "0V";
  }
}
