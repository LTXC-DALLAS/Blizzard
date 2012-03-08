 /****************************************************************************/
 /* Jazz Integrated Program : PACE6TF021                                     */
 /*                                                                          */
 /* Program Module   : VLCTProg/f021_config.p                                */
 /* Creation Date    : Mon Mar  1 23:01:54 2010                              */
 /* Jazz Version Used: /apps/chipcreate/jazz/v4.11                           */
 /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
 /*                                                                          */
 /*                              Revision Comments                           */
 /*                                                                          */
 /* 1st char of Rev (0-Z) - major revisions                                  */
 /* 2nd char of Rev (0-Z) - minor revisions                                  */
 /*                                                                          */
 /* Rev : Comment                                     : UserID        : Date */
 /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
 /*                                                                          */
 /*  A0 : Initial version of the VLCT Test Program    : chau          :      */
 /*                                                                          */
 /****************************************************************************/
 /*  A1.5 : Released for bug fix.                               KChau 01/21/10 */
 /*  A1.6 : Released with PMOS Trim.                            KChau 03/15/10 */
 /*  A2.0 : TV2.0                                               KChau 07/28/10 */
 /*  A2.3.2 : TV2 revD.                                         KChau 11/22/10 */
 /*  A2.4 : Released with one pass flash efuse pgm.             KChau 01/15/11 */
 /*  A2.6 : Released with changes for qual revG.                KChau 03/15/11 */
 /*  A3.0 : Added efuse rd/pg code option.                      KChau 04/29/11 */
 /*  B1.1 : Released to support C2000 and Stellaris platforms.  KChau 06/29/11 */


#include <Unison.h>
#include <f021_flashvar.h>
using namespace std; 

StringS debug1 = "This is a debug pattern name";
StringS debug2 = "This is a debug pattern name";

void F021_FlashConfigInclude(); // prototype to link in the include function
                                // I didn't want to make a header file for 1 prototype
//#include "$TYPES"
//#include "var.h" 

void F021_FlashConfig()
{
   IntM test_type("TITestType");
   IntM test_temp("TITestTemp");
   
   SelectedTITestType = test_type[ActiveSites.Begin().GetValue()];
   SelectedTITestTemp = test_temp[ActiveSites.Begin().GetValue()];
   
    /*Device Specific*/

    /*+++ Bank/Sector info +++*/
   F021_Flash.MAXBANK     =  1;  /*base 0 so total 3 banks} {blizzard has 2 banks 0 & 1 JRR*/
   F021_Flash.MAXBLOCK[0] =  3;
   F021_Flash.MAXBLOCK[1] =  5;
   F021_Flash.MAXBLOCK[2] =  0;
   F021_Flash.MAXBLOCK[3] = -1;
   F021_Flash.MAXBLOCK[4] = -1;
   F021_Flash.MAXBLOCK[5] = -1;
   F021_Flash.MAXBLOCK[6] = -1;
   F021_Flash.MAXBLOCK[7] = -1;
   F021_Flash.MAXSECT[0]  =  7;  /*base 0 so total 9 sectors*/
   F021_Flash.MAXSECT[1]  =  5;  /*base 0 so total 6 sectors*/
   F021_Flash.MAXSECT[2]  =  1;  /*base 0 so total 2 sectors*/
   F021_Flash.MAXSECT[3]  = -1; 
   F021_Flash.MAXSECT[4]  = -1; 
   F021_Flash.MAXSECT[5]  = -1; 
   F021_Flash.MAXSECT[6]  = -1; 
   F021_Flash.MAXSECT[7]  = -1; 

   F021_Flash.ECC_PARITY     = 1;   /*0=PARITY, 1=ECC*/
   F021_Flash.DATAWIDTH      = 64;  /*144 or 288}{changed to 64 for blizzard 20110507 JRR*/

   F021_Flash.MUXFACT[0]     = 16;
   F021_Flash.MUXFACT[1]     = 32;
   F021_Flash.MUXFACT[2]     = 16;
   
   F021_Flash.BANKSIZE[0]    =  512*1024;  /*512KByte*/
   F021_Flash.BANKSIZE[1]    = 1536*1024;  /*1536KByte*/
   F021_Flash.BANKSIZE[2]    =   32*1024;  /*32KByte*/

   F021_Flash.SECTSIZE[0][0]  =  16*1024;   /*16Kbyte*/
   F021_Flash.SECTSIZE[0][1]  =  16*1024;   /*16Kbyte*/
   F021_Flash.SECTSIZE[0][2]  =  32*1024;   /*32Kbyte*/
   F021_Flash.SECTSIZE[0][3]  =  32*1024;   /*32Kbyte*/
   F021_Flash.SECTSIZE[0][4]  =  32*1024;   /*32Kbyte*/
   F021_Flash.SECTSIZE[0][5]  = 128*1024;   /*128Kbyte*/
   F021_Flash.SECTSIZE[0][6]  = 128*1024;   /*128Kbyte*/
   F021_Flash.SECTSIZE[0][7]  = 128*1024;   /*128Kbyte*/

   F021_Flash.SECTSIZE[1][0]  = 256*1024;   /*256Kbyte*/
   F021_Flash.SECTSIZE[1][1]  = 256*1024;   /*256Kbyte*/
   F021_Flash.SECTSIZE[1][2]  = 256*1024;   /*256Kbyte*/
   F021_Flash.SECTSIZE[1][3]  = 256*1024;   /*256Kbyte*/
   F021_Flash.SECTSIZE[1][4]  = 256*1024;   /*256Kbyte*/
   F021_Flash.SECTSIZE[1][5]  = 256*1024;   /*256Kbyte*/

   F021_Flash.SECTSIZE[2][0]  =  16*1024;   /*16Kbyte*/
   F021_Flash.SECTSIZE[2][1]  =  16*1024;   /*16Kbyte*/

   F021_Flash.EMUBANK[0] = false;
   F021_Flash.EMUBANK[1] = true;   /*we only have 2 banks so 1 is EMU.  JRR*/
   F021_Flash.EMUBANK[2] = false;   /*true=emulation bank*/
   
   GL_ASICHI = 0x7717;   /*asic# 751521*/
   GL_ASICLO = 0x2702;   /*02 A2 material is silicon rev*/

   GL_DEV_PKG_ID = 0xffff;  /*0x0100}; {device pkg id*/
   GL_DEV_MEMSZ  = 0x0300;  /*device memsize*/

   
   switch(SelectedTITestType) {
     case MP1         : GL_PGMREV = 0x0001; break;  /*program revision*/
     case MP2         : GL_PGMREV = 0x0001; break;  /*program revision*/
     case MP3         : GL_PGMREV = 0x0001; break;  /*program revision*/
     case PreBurnIn   : GL_PGMREV = 0x0001; break;  /*program revision*/
     case PostBurnIn1 : GL_PGMREV = 0x0001; break;  /*program revision*/
     case FT2         : GL_PGMREV = 0x0001; break;  /*program revision*/
   } 

   GL_MULTISHELL  = false;  /*true}; {device with single shell. if set then multi-shell*/
   GL_MBoxRAMTYPE = RAMType1;  /*for smaller ram device like sirius/pace5=RAMType2*/
                                /*for device w/ big ram set it to RAMType1*/

   GL_MP3PKG_FLOW = true;   /*device w/ pgk mp3. if false then KGD flow*/
   GL_DO_TNI_CODE = true;   /*to run customer/TNI code. NOTE: if set true then*/
                             /*must set F021_RunCode.RUNCODE_NUMPASS must be either 1,2,3*/

   GL_VPP_PRESENT = true;  /*false=no vpp on hardware,true=vpp on hardware*/
                             /*used in VoltSweep_Efuse_func to pwrup vpp if exist*/

   GL_PUMPTYPE = ESPUMP;    /*either HDPUMP or ESPUMP} {blizzard has ESPUMP JRR*/
   GL_BANKTYPE = FLESBANK;  /*either FLEPBANK or FLESBANK} {blizzard has FLESBANK JRR*/
   

   GL_F021_PLLENA_SPEED1 = 16MHz;
   GL_F021_PLLDIS_SPEED1 = 16MHz;

    /*+++ Global maxtime +++*/
   GL_F021_MAXTIME = 15s;

   GL_F021_BANK_MAXTIME = 10s;
   GL_F021_BANK_ERS_MAXTIME = 30s;
   GL_F021_BANK_PGM_MAXTIME = 10s;
   GL_F021_BANK_SWPGM_MAXTIME = 90s;
   GL_F021_BANK_VT_MAXTIME = 5s;

   GL_F021_SECT_MAXTIME = 10s;
   GL_F021_SECT_ERS_MAXTIME = 15s;
   GL_F021_SECT_PGM_MAXTIME = 10s;
   GL_F021_SECT_VT_MAXTIME = 5s;

   GL_ESDA_PROGID = "A7576M03";   /*F# and prog revision*/


    /*+++++++++++++++++++++++++++++++++++++++*/
    /*define Runcode number of code types to be run and testing order*/
    /*Example: TNI, Random, SingleCycle*/
   
    /*+++++  Random Code Record  +++++*/
   F021_RunCode.DO_RUNCODE_ENA[Random] = true;     /*true=enable Random code pgm/rd/exe in test flow*/
   F021_RunCode.FIRST_PROGPAT[Random]  = f021_shell_rcodepat;  /*debug1};  {1st write pattern, e.g. Random_Code_0*/
   F021_RunCode.LAST_PROGPAT[Random]   = f021_shell_rcodepat;  /*debug1};  {last write pattern, e.g Random_Code_2*/
   F021_RunCode.PROG_FREQ[Random]      = 16MHz;   /*write freq*/
   F021_RunCode.PROG_VDDCORNER[Random] = VNM;    /*write Vdd core voltage corner, e.g. VMN/VNM/VMX*/
   
    /*+++++ arbitrary psa Read and VT Random info +++++*/
    /*define each bank to do vt0/vt1*/
   F021_RunCode.DO_RUNCODE_VT0_ENA[Random][0]  = true;    /*true=enable VT0 on Random code][ bank0*/
   F021_RunCode.DO_RUNCODE_VT0_ENA[Random][1]  = true;    /*true=enable VT0 on Random code][ bank1*/
   F021_RunCode.DO_RUNCODE_VT0_ENA[Random][2]  = true;    /*true=enable VT0 on Random code][ bank2*/
   F021_RunCode.DO_RUNCODE_VT1_ENA[Random][0]  = true;    /*true=enable VT1 on Random code][ bank0*/
   F021_RunCode.DO_RUNCODE_VT1_ENA[Random][1]  = true;    /*true=enable VT1 on Random code][ bank1*/
   F021_RunCode.DO_RUNCODE_VT1_ENA[Random][2]  = true;    /*true=enable VT1 on Random code][ bank2*/
    /*+++ bank0 info +++*/
   F021_RunCode.BANK_START_ADDR_MSW[Random][0] = 0x0800;  /*16-bit word msb addr*/
   F021_RunCode.BANK_START_ADDR_LSW[Random][0] = 0x0000;  /*16-bit word lsb addr*/
   F021_RunCode.BANK_LEN_MSW[Random][0]        = 0x0008;  /*16-bit word msb*/
   F021_RunCode.BANK_LEN_LSW[Random][0]        = 0x0000;  /*16-bit word lsb*/
   F021_RunCode.BANK_PSA_MSW[Random][0]        = 0xACAF;  /*16-bit word msb expect psa} {w/ ecc*/
   F021_RunCode.BANK_PSA_LSW[Random][0]        = 0x1293;  /*16-bit word lsb expect psa*/
                        /*+++ bank1 info +++*/
   F021_RunCode.BANK_START_ADDR_MSW[Random][1] = 0x0808;  /*16-bit word msb addr*/
   F021_RunCode.BANK_START_ADDR_LSW[Random][1] = 0x0000;  /*16-bit word lsb addr*/
   F021_RunCode.BANK_LEN_MSW[Random][1]        = 0x0018;  /*16-bit word msb*/
   F021_RunCode.BANK_LEN_LSW[Random][1]        = 0x0000;  /*16-bit word lsb*/
   F021_RunCode.BANK_PSA_MSW[Random][1]        = 0x9198;  /*16-bit word msb expect psa} {w/ ecc*/
   F021_RunCode.BANK_PSA_LSW[Random][1]        = 0x589c;  /*16-bit word lsb expect psa*/
                        /*+++ bank2 info +++*/
   F021_RunCode.BANK_START_ADDR_MSW[Random][2] = 0xF020;  /*16-bit word msb addr*/
   F021_RunCode.BANK_START_ADDR_LSW[Random][2] = 0x0000;  /*16-bit word lsb addr*/
   F021_RunCode.BANK_LEN_MSW[Random][2]        = 0x0000;  /*16-bit word msb*/
   F021_RunCode.BANK_LEN_LSW[Random][2]        = 0x8000;  /*16-bit word lsb*/
   F021_RunCode.BANK_PSA_MSW[Random][2]        = 0x5084;  /*16-bit word msb expect psa} {w/ ecc*/
   F021_RunCode.BANK_PSA_LSW[Random][2]        = 0x499C;  /*16-bit word lsb expect psa*/

   
   
   
    /*+++++  MBI Record  +++++*/
   F021_MBI.DO_MBI_ENA      = false;     /*true=enable MBI execute in test flow*/
   F021_MBI.TNI_EXE_ENA     = true;     /*true=enable TNI code execute*/
   F021_MBI.TNI_EXE_PAT     = debug1;   /*TNI execute pattern, e.g. TNI_Killer_exe*/
   F021_MBI.TNI_EXE_FREQ    = 16MHz;   /*TNI execute freq*/
   F021_MBI.TNI_EXE_RAM_ERRLOG_PAT = debug1;   /*ram pmt read code error log psa pattern*/
   F021_MBI.PBIST_EXE_ENA   = true;     /*true=enable PBIST/SRAM execution*/
   F021_MBI.PBIST_FIRST_PAT = debug1;   /*pbist/sram 1st pattern*/
   F021_MBI.PBIST_LAST_PAT  = debug2;   /*pbist/sram last pattern*/
   F021_MBI.PBIST_EXE_FREQ  = 16MHz;   /*pbist freq*/
   F021_MBI.BIST_EXE_ENA    = true;     /*true=enable bist execution*/
   F021_MBI.BIST_FIRST_PAT  = debug1;   /*bist 1st pattern*/
   F021_MBI.BIST_LAST_PAT   = debug2;   /*bist last pattern*/
   F021_MBI.BIST_EXE_FREQ   = 16MHz;   /*bist freq*/

#if $GL_USE_JTAG_RAMPMT  
#define $GL_USE_DMLED_RAMPMT false
#endif

#if $GL_USE_DMLED_RAMPMT  
#define $GL_USE_JTAG_RAMPMT false
#endif

   /*+++ define whether to use source/capture ram +++*/
   GL_DO_ESDA_WITH_SCRAM   = true;   /*true=using capture ram to read esda/tlog/mbox data*/
   GL_DO_SOURCE_WITH_SCRAM = false;   /*true=using source ram to modify address/tnum data*/

    /*+++ define efuse read/program option +++*/
    /*F021             = read flash efuse not using SCRAM*/
    /*F021_SCRAM       = read flash efuse using SCRAM*/
    /*F021             = program flash efuse, no efuse ECC, not using SCRAM*/
    /*F021_SCRAM_1     = program flash efuse, no efuse ECC, using SCRAM*/
    /*F021_ECC         = program flash efuse, with efuse ECC, not using SCRAM*/
    /*F021_ECC_SCRAM_1 = program flash efuse, with efuse ECC, using SCRAM*/

   GL_EFUSE_RD_CODEOPTION = "F021";  /*changed because we don't have ECC JRR*/
   GL_EFUSE_PG_CODEOPTION = "F021";  /*changed because we don't have ECC JRR*/
   
   F021_FlashConfigInclude();


}   /* F021_FlashConfig */

