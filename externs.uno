Unison:U1.0d:S5.3;
/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/externs.evo                                    */
/* Creation Date  : Tue Jan  3 17:13:04 2012                                  */
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

/***********************************************************************/
/***  All test program files                                         ***/
/***********************************************************************/
__ExternalRef {
   __File = "bins.uno";
}


__ExternalRef {
   __File = "device.uno";
}


__ExternalRef {
   __File = "pinlists.uno";
}


__ExternalRef {
   __File = "dcdata.uno";
}


__ExternalRef {
   __File = "dctable.uno";
}


__ExternalRef {
   __File = "acdata.uno";
}


__ExternalRef {
   __File = "actable.uno";
}


__ExternalRef {
   __File = "masks.uno";
}


__ExternalRef {
   __File = "testflow.uno";
}


__ExternalRef {
   __File = "patterns.uno";
}


 __ExternalRef {
   __File = "testsets_Bliz.uno";
}


__ExternalRef {
   __File = "testware.uno";
}


__ExternalRef {
   __File = "Global.uno";
}


__ExternalRef {
   __File = "Probe_flow.uno";
}

// Added 18jun12 cjp
__ExternalRef {
   __File = "toolkit.uno";
}

//Only interested in probe --BJP
//__ExternalRef  {   __File = "Final_Flow.uno";   }


//Only interested in probe --BJP
//__ExternalRef  {   __File = "DPSE_Flow.uno";   }

__ExternalRef { __File = "boardcheck.uno"; }

__ExternalRef {
   __File = "cycletbl.uno";
}


__ExternalRef {
   __File = "utilities.uno";
}

  
/***********************************************************************/
/***  Call to TI standard modules. This is the only reference to     ***/
/***  the standards necessary.                                       ***/
/***********************************************************************/
__ExternalRef {
   __Path = "/u/TI_apps/enVision/stdprogram";
   __File = "TIexterns.uno";
}

/***********************************************************************/
/***                                                                 ***/
/***  Application library files                                      ***/
/***                                                                 ***/
/***********************************************************************/

__ApplicationLibrary TestWare_Library {
   __LibraryPath = "./Libraries/TestWare_Library";
   __BuildPath = "./Libraries/TestWare_Library";
   __LibraryType = __Debug;
   __Source = "./Libraries/TestWare_Library/TestwareSupport.cpp";
   __IncludePath = "./Libraries/TestWare_Library";
   __IncludePath = "/u/TI_apps/enVision/stdprogram";
   __Include = "TestwareSupport.h";
   __DependsOnLibrary = TIDependsLib;
}

__ApplicationLibrary Blizzard_Library {
   __LibraryPath = "./Libraries/Blizzard_Library";
   __BuildPath = "./Libraries/Blizzard_Library/tmpfiles";
   __LibraryType = __Debug;
   __Source = "./Libraries/Blizzard_Library/CbitCtrl.cpp";
   __Source = "./Libraries/Blizzard_Library/Blizzard.cpp";
   __Source = "./Libraries/Blizzard_Library/power_up.cpp";
   __Source = "./Libraries/Blizzard_Library/TI_DC.cpp";
   __Source = "./Libraries/Blizzard_Library/TWFuncTest.cpp";
   __Source = "./Libraries/Blizzard_Library/SearchUtilities.cpp";
   __Source = "./Libraries/Blizzard_Library/efuse.cpp";
   __IncludePath = "./Libraries/Blizzard_Library";
   __IncludePath = "./Libraries/TestWare_Library";
   __Include = "CbitCtrl.h";
   __Include = "globals.h";
   __Include = "power_up.h";
   __Include = "TI_DC.h";
   __Include = "TWFuncTest.h";
   __Include = "SearchUtilities.h";
   __Include = "efuse.h";
   __CompilerFlags = "-g";
   __DependsOnLibrary = TIDependsLib;
   __DependsOnLibrary = TestWare_Library;
   __DependsOnLibrary = STD_Library;
}

/* The F021_Library being converted is the F021 code 
   found in the Blizzard VLCT program V1PQ727C06 */
__ApplicationLibrary F021_Library {
   __LibraryPath = "./Libraries/F021_Library";
   __BuildPath = "./Libraries/F021_Library";
   __LibraryType = __Debug;
   __Source = "./Libraries/F021_Library/f021_flashglobal.cpp";
   __Source = "./Libraries/F021_Library/f021_flashvar.cpp";
   __Source = "./Libraries/F021_Library/f021_func.cpp";
   __Source = "./Libraries/F021_Library/f021_flashtests.cpp";
   __Source = "./Libraries/F021_Library/f021_config.cpp";
   __Source = "./Libraries/F021_Library/f021_cfginclude.cpp";
   __Source = "./Libraries/F021_Library/f021_pbist.cpp";
   __IncludePath = "./Libraries/F021_Library";
   __IncludePath = "./Libraries/TestWare_Library";
   __IncludePath = "./Libraries/STD_Library";
   __IncludePath = "./";
   __Include = "f021_flashglobal.h";
   __Include = "f021_flashtests.h";
   __Include = "f021_flashvar.h";
   __Include = "f021_func.h";
   __Include = "f021_pbist.h";
   __DependsOnLibrary = TIDependsLib;
   __DependsOnLibrary = TestWare_Library;
   __DependsOnLibrary = STD_Library;
   __DependsOnLibrary = Blizzard_Library;
}

__ApplicationLibrary STD_Library {
   __LibraryPath = "./Libraries/STD_Library";
   __BuildPath = "./Libraries/STD_Library";
   __LibraryType = __Debug;
   __Source = "./Libraries/STD_Library/SearchMod.cpp";
   __Source = "./Libraries/STD_Library/std_vi.cpp";
   __Source = "./Libraries/STD_Library/stdEfuse.cpp";
   __Source = "./Libraries/STD_Library/string_utils.cpp";
   __Source = "./Libraries/STD_Library/MultisiteUtils.cpp";
   __Source = "./Libraries/STD_Library/DspSendUtils.cpp";
   __IncludePath = "./Libraries/STD_Library";
   __Include = "std_vi.h";
   __Include = "SearchMod.h";
   __Include = "stdEfuse.h";
   __Include = "string_utils.h";
   __Include = "MultisiteUtils.h";
   __Include = "DspSendUtils.h";
}
