 /****************************************************************************/
 /*  A01 : Initial version of f021_flashglobal.cpp for Unison   JAT 02/28/12 */
 /*                                                                          */
 /****************************************************************************/

#include <f021_flashglobal.h>

StringS1D TestOptFieldArr;
StringS NULL_TestName = "";
BoolS tistdscreenprint = false;
BoolS tiprintpass = false;
BoolS ti_flashdebug = false;

BoolS  TI_FlashDebug;
BoolS  TI_FlashCharEna; 
BoolS  TI_FlashESDAEna; 
BoolS  TI_FlashCOFEna; 
BoolM  v_dev_active;

StringS f021_shell_exepat = "this_needs_to_be_the_thread_name";

PinM F021_DONEPIN = "PB0_129";
PinM F021_NDONEPIN = "o_cpu_done_46";
PinM F021_PASSPIN = "o_cpu_fail_47";
PinM F021_VCTRLPIN = "PB1_130";
PinM F021_VSTATPIN = "PB2_131";
PinM nporrst = "RST_n_122";
