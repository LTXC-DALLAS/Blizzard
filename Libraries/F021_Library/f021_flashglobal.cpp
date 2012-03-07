 /****************************************************************************/
 /*  A01 : Initial version of f021_flashglobal.cpp for Unison   JAT 02/28/12 */
 /*                                                                          */
 /****************************************************************************/

#include <f021_flashglobal.h>

StringS1D TestOptFieldArr;
StringS NULL_TestName = "";
BoolS tistdscreenprint = false;
BoolS tiprintpass = false;

// VLCT 'Window' vars
BoolS  TI_FlashDebug = false;     
BoolS  TI_FlashCharEna = false; 
BoolS  TI_FlashESDAEna = false; 
BoolS  TI_FlashCOFEna = false; 
//BoolM  v_dev_active;

StringS f021_shell_loadpat = "Flash_Load_Thrd";
StringS f021_shell_exepat = "Flash_Load_TestNum_Thrd";
StringS ldo_bypass_init_thread = "ldo_bypass_init_v20";

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

BoolS IsFastBinning;
