 /****************************************************************************/
 /*  A01 : Initial version of f021_flashglobal.cpp for Unison   JAT 02/28/12 */
 /*                                                                          */
 /****************************************************************************/

#include <f021_flashglobal.h>

IntS SelectedTITestTemp;
IntS SelectedTITestType;

//double HVFEM_FACTOR;

StringS1D TestOptFieldArr(21);
BoolS tistdscreenprint = true; // for now, we're printing what we can
BoolS tiprintpass = true; // for now, we're printing what we can

BoolS RunAllTests;

// VLCT 'Window' vars
BoolS  TI_FlashDebug = true;  // for now, we're debugging    
BoolS  TI_FlashCharEna = false; 
BoolS  TI_FlashESDAEna = false; 
BoolS  TI_FlashCOFEna = false; 

StringS f021_shell_loadpat = "Garnet_Shell064_T072C009S007_A3_v2p0_Thrd"; //"Garnet_Shell064_T072C008S007_A2_Thrd";
StringS f021_shell_exepat = "f021_shell_exepat_pll_v4p0_Thrd"; //"f021_shell_exepat_pll_v3p0_Thrd";
StringS ldo_bypass_init_thread = "ldo_bypass_init_v20";
StringS f021_shell_rcodepat = "This is an unknown pattern thread";
StringS f021_shell_exepat_vco_kc = "This is an unknown pattern thread";

PinM F021_DONEPIN = "PB0_129";
PinM F021_NDONEPIN = "o_cpu_done_46";
PinM F021_PASSPIN = "o_cpu_fail_47";
PinM F021_VCTRLPIN = "PB1_130";
PinM F021_VSTATPIN = "PB2_131";
PinM nporrst = "RST_n_122";

PinM FLTP1 = "FLTP1";
PinM FLTP2 = "FLTP2";
#if $TP3_TO_TP5_PRESENT
PinM FLTP3 = "FLTP3";
PinM FLTP4 = "FLTP4";
PinM FLTP5 = "FLTP5";
#endif
#if $TADC_PRESENT
PinM P_TADC = "P_TADC";
#endif
