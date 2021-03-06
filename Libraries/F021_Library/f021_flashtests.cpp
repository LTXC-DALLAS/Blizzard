 /****************************************************************************/
 /*  F021 VLCT STD LIB                                                         */
 /*  A01 : Initial version of F021 Flash VLCT Codes.            KChau 08/03/09 */
 /*                                                                            */
 /* 11/03/09  KChau                                                            */
 /*           -Use TNUM_BANK_ERS_PRECON_SW instead of TNUM_BANK_ERS_PRECON due */
 /*            to bank sm issue.                                               */
 /*                                                                            */
 /*  A1.1 : Released with VT/BCC enable.                        KChau 11/10/09 */
 /*                                                                            */
 /* 11/12/09  KChau                                                            */
 /*           -Added selective site in EraseRefArray_func so not to run on     */
 /*            re-probe site.                                                  */
 /* 11/16/09  KChau                                                            */
 /*           -Added Charz_Icmp10_Iref,Charz_TCR84_Stress4,Charz_TCR84_Stress4b*/
 /*            Charz_TCR52_Stress10,Charz_TCR52_Stress11,Charz_TCR53_Stress2,  */
 /*            Charz_TCR54_Stress3 for validation.                             */
 /*                                                                            */
 /*  A1.2 : Released with using new OTP format.                 KChau 11/19/09 */
 /*                                                                            */
 /*  A1.3 : Released with new OTP format with 8us ppw.          KChau 11/30/09 */
 /*                                                                            */
 /* 12/09/09  KChau                                                            */
 /*           -Added Charz_EraseRefArray,Charz_EraseRefArray_Main and enable   */
 /*            in EraseRefArray_func.                                          */
 /*           -Added Charz_ProgramPW and enable in PgmMain_func (vnom),        */
 /*            PgmMain_PreEGFG_LF1_func (vmax),PgmMain_PreEGFG_LF3_func (vmin).*/
 /*           -Added Charz_BCC0/1 and enable in PreEGFGVT0_LF1_func and        */
 /*            PreFGWLVT1_func.                                                */
 /*           -Added Charz_Iref_Repeat and enable in all Iref/IPMOS_*_func.    */
 /*           -Added configurable to select either tcr5,6,39 for VT, and       */
 /*            tcr6,38,39 for BCC tests via GL_DO_VT/BCC_WITH_TCRNUM.          */
 /*           -Modified EraseRefArray_func so retest site is taken care in     */
 /*            F021_RefArr_Erase_func (f021_func) instead here.                */
 /*                                                                            */
 /*  A1.4 : Released for Charz Enable.                          KChau 12/18/09 */
 /* 01/13/10  KChau                                                            */
 /*           -Bug fix WebID Flash_Test.BTS_F021_VLCTSTD.1 .                   */
 /*            Used correct testname (for precon) in bank erase tests.         */
 /*           -Added Charz_VBG_VRD_Soft to collect data in MainBG_Trim_func.   */
 /*           -Added ESDA in Cycle9X, PgmMain, BankErs tests.                  */
 /*                                                                            */
 /*  A1.5 : Released for bug fix.                               KChau 01/21/10 */
 /*                                                                            */
 /* 02/17/10  KChau                                                            */
 /*           -Added and enable direct bgap trim method.                       */
 /*           -Added and enable RdSCycle, Pipe min/max tests.                  */
 /*           -Added and enable PgmRCode test to pgm echk at mp3 as RCode not  */
 /*            yet available.                                                  */
 /*           -Changed all pre-stress prog/ers to Vnom, all VT/BCC to Vmax.    */
 /* 03/12/10  KChau                                                            */
 /*           -Modified DRL_Flowbyte_WR_func to disable site failed drl test   */
 /*            due to addition of WEBS:Flash_Test.BTS_F021_VLCTSTD.4 .         */
 /*                                                                            */
 /*  A1.6 : Released with PMOS Trim.                            KChau 03/15/10 */
 /*                                                                            */
 /* 03/19/10  KChau                                                            */
 /*           -Modified PgmOTPTemplate to upload/update fake repair solution.  */
 /*           -Added gl_fakerep_count tracking in WrEngRow.                    */
 /*                                                                            */
 /*  A1.7 : Released with Redundancy, fake repair, flash PBIST. KChau 04/09/10 */
 /*                                                                            */
 /* 05/17/10  KChau                                                            */
 /*           -Update EGFG1/2 to datalog only and removed soft bins.           */
 /*                                                                            */
 /* 05/25/10  KChau                                                            */
 /*           -Added FOSC soft trim datalog test only.                         */
 /*                                                                            */
 /*  A1.8 : Released for EFR.                                   KChau 05/25/10 */
 /*                                                                            */
 /* 06/04/10  KChau                                                            */
 /*           -Added masking data 1s in echk/ochk on BCC0 PBIST tests.         */
 /*           -Added FlashCyle1X w/ temporary prog limit 50, ers limit 300.    */
 /*           -Added TP1/TP2 Leak Delta (datalog only).                        */
 /* 06/10/10  KChau                                                            */
 /*           -Removed precon in BankErs_PreTunOx/PrePGMFF tests.              */
 /*                                                                            */
 /*  A1.9 : Released for Yield Learning.                        KChau 06/08/10 */
 /*                                                                            */
 /* 06/25/10  KChau                                                            */
 /*           -Corrected PgmOTP_func to remove shell reload which overwrite    */
 /*            pmos & vhv ct soft trim values in RAM.                          */
 /*                                                                            */
 /****************************************************************************/
 /* 07/22/10  KChau                                                            */
 /*           -Making changes for TV2.0                                        */
 /*           -Modified Pump_Iref_Vnom_func,pgmff,tunox,csfg,fgwl              */
 /*           -Implemented esda for bcc & delta tests.                         */
 /*                                                                            */
 /* 09/21/10  KChau                                                            */
 /*           -Modified to use TNUM_OTP_ERS_PRECON (tv1 was _PRECON_SW), and   */
 /*            use TNUM_BANK_ERS_PRECON (tv1 was _PRECON_SW).                  */
 /* 11/11/10  KChau                                                            */
 /*           -Added data collection internal vt0 precsfg, predrl mp1.         */
 /*           -Modified IrefPMOS_Trim_func to perform ipmos trim based on pmos,*/
 /*            nmos irefRd, nmos irefEv.                                       */
 /*                                                                            */
 /*  A2.3.2 : Released with baseline ipmos trim.                KChau 11/22/10 */
 /*                                                                            */
 /* 01/12/11  KChau                                                            */
 /*           -Updated FlashEfuse_MP1, FlashEfuse_Trim, EraseRefArray_func,    */
 /*            IrefPMOS_Trim_func to do one pass efuse programming.            */
 /*                                                                            */
 /*  A2.4 : Released with one pass flash efuse pgm.             KChau 01/15/11 */
 /*                                                                            */
 /*                                                                            */
 /* 02/24/11  psk                                                              */
 /*           -Changed PMOS trim to use NMOS read current instead of PMOS      */
 /*                                                                            */
 /* 03/07/11  KChau                                                            */
 /*           -Enabled iref PMOS/NMOS charz at vmin for qual.                  */
 /*           -Implemented FOSC DCC (post-trim) test.                          */
 /*                                                                            */
 /*  A2.5 : Released with changes for qual.                     KChau 03/14/11 */
 /*                                                                            */
 /* 03/15/11  KChau                                                            */
 /*           -Modified stress tests to use MMS tcr mode as running CSFG stress*/
 /*            with both TCR84 & TCR110.                                       */
 /* 03/30/11  KChau                                                            */
 /*           -Added esda in RdM0/1DRL tests.                                  */
 /* 04/05/11  KChau                                                            */
 /*           -Added data collection pre/post DRL BCC0 w/ VCG=1.8v .           */
 /* 04/07/11  KChau                                                            */
 /*           -Changed RdM0DRL to Vnom (was Vmin).                             */
 /* 04/13/11  KChau                                                            */
 /*           -Changed data collection pre/post DRL BCC0 w/ VCG=1.825v .       */
 /*                                                                            */
 /*  A2.7 : Released with changes for qual revG.                KChau 04/15/11 */
 /*                                                                            */
 /* 04/21/11  KChau                                                            */
 /*           -Modified BankErs_PreRandCode_func,RdM1_PreRandCode_func,        */
 /*            and various functions to support non-auto device and/or device  */
 /*            with 1S state at the end of MP3 (via GL_MP3PKG_FLOW=false).     */
 /* 04/28/11  KChau                                                            */
 /*           -Added option for Stellaris/C2000 so not doing sector ers.       */
 /* 04/29/11  KChau                                                            */
 /*           -Changed flash efuse read/prog reference by NonMBist type        */
 /*            instead of Custom type, and using device specific rd/pg option  */
 /*            defined in f021_config.p, i.e. GL_EFUSE_RD/PG_CODEOPTION.       */
 /*                                                                            */
 /****************************************************************************/
 /*                                                                            */
 /* 05/25/11  KChau                                                            */
 /*           -Added SenAmpNoise_Screen_func.                                  */
 /*           -Added special screen of PPmax=1 and softbin in 1st cycle9x.     */
 /*           -Removed precon in PreThinOx/PunchThru/TunOx/PgmFF erase.        */
 /*                                                                            */
 /*  B1.0 : Released for qual with internal VT0 enabled.        KChau 05/27/11 */
 /*                                                                            */
 /* 05/31/11  KChau                                                            */
 /*           -Added VT/BCC for Random code.                                   */
 /* 06/21/11  KChau                                                            */
 /*           -Added Charz_Ers_StairStep_* for stair step erase DOE.           */
 /*           -WEBS: VLCTSTD.36 -- disable IPMOS Odd tests on FLES bank.       */
 /* 07/08/11  KChau                                                            */
 /*           -Added Charz_FreqSchmoo_RandCode in PgmChkboard_func.            */
 /*           -Added Charz_SenAmpNoise_RPC_EF (rd precharge vs. efuse).        */
 /*                                                                            */
 /*  B1.1 : Released to support C2000 and Stellaris platforms.  KChau 06/29/11 */
 /*                                                                            */
 /* 07/13/11  KChau                                                            */
 /*           -Used TNUM_OTP_PRECON instead of TNUM_OTP_PROG(sm) for TTR.      */
 /* 07/20/11  KChau                                                            */
 /*           -Updated Charz_SenAmpNoise_RPC_EF with override efuse22/17.      */
 /* 07/29/11  KChau                                                            */
 /*           -Changed sense amp noise charz to do at VMX, ef22, pc1 only.     */
 /* 08/01/11  KChau                                                            */
 /*           -Added Charz_RDM0_NMOS ratio sweep w/ efuse 17.                  */
 /*                                                                            */
 /*  B2.2 : Released for revI qual.                             KChau 07/28/11 */
 /*                                                                            */
 /* 08/04/11  KChau                                                            */
 /*           -WEBS: VLCTSTD.40 -- added check efuse error status reg and fail */
 /*            if errorCode = 0x15/0x5 even ECC is correcting single bit error.*/
 /* 08/11/11  KChau                                                            */
 /*           -Added main array precon before pump vhv trim on retest unit.    */
 /*                                                                            */
 /*  B2.3 : Released for revI qual.                             KChau 08/12/11 */
 /*                                                                            */
 /* 09/20/11  KChau                                                            */
 /*           -Modified EraseRefArray_func to do refarr boost on retest.       */
 /*           -Added LPO_AutoTrim_func for LF/HF trim.                         */
 /*                                                                            */
 /*  B2.4 : Released for revK wafers.                           KChau 09/20/11 */
 /*                                                                            */
 /* 09/28/11  KChau                                                            */
 /*           -Modified to use various esda image number based on test type.   */
 /* 10/06/11  KChau                                                            */
 /*           -Added PgmOtpSCPL test for Stellaris.                            */
 /*           -Modified FlashEfuse_Trim to support external pin FOSC trim.     */
 /*           -Added FOSC_VCO_Vmin_func for external FOSC post trim test.      */
 /*                                                                            */
 /*  B3.0 : Released for Catalog Flow.                          KChau 11/24/11 */
 /*  B3.0.2 : Added Cycle 1X for OTP                          JSheikh 02/03/12 */
 /*                                                                            */
 /****************************************************************************/

#include <f021_func.h>
#include <string_utils.h>
#include <efuse.h>
#include <f021_flashvar.h>
#include <DebugVars.h>
#include <enums.evo>
#include <MultisiteUtils.h>

using namespace std; 

//#include "$TYPES"
//#include "var.h"
//#include "utility.h"
// /*#include "func.h"*/
//#include "power.h"
//#include "$STD_PATH/stdMeas.h"
//
//#include "efuse.h"
// /*#include "$STD_PATH/stdEfuse.h"*/
//
//#include "f021_func.h"
//
//
//void PwrupAtVnom_1()
//{
//   FloatS tdelay, offset;
//   FloatS volt_pgm, curr_pgm;
//   option igain_mode, pgm_mode;
//   IntS site;
//
//   if(v_any_dev_active)  
//   {
//      tdelay = 2ms;
//      offset = 12mV;
//
//      STDGetVI(VDD,volt_pgm,curr_pgm);
//      
//      if((abs(volt_pgm-v[vdd_vnom])) >== offset)  
//      {
//         PowerUpAtVnom(DCsetup_LooseVnom, norm_fmsu);
//         ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[VIH_Loose_OSC_Vnom],v[vil_loose]);
//          clockpinset(s_clk_1a, s_clock);
//         TIME.Wait(tdelay);
//         if(tistdscreenprint)  
//            cout << "POWER UP AT VNOM" << endl;
//      } 
//
//      PrintDUTSetup;
//   } 
//
//}   /* PwrupAtVnom_1 */
//
//
//void PwrupAtVmin_1()
//{
//   FloatS tdelay, offset;
//   FloatS volt_pgm, curr_pgm;
//   option igain_mode, pgm_mode;
//   IntS site;
//
//   if(v_any_dev_active)  
//   {
//      tdelay = 2ms;
//      offset = 12mV;
//
//      STDGetVI(VDD,volt_pgm,curr_pgm);
//
//      if((abs(volt_pgm-v[vdd_vmin])) >== offset)  
//      {      
//         PowerUpAtVmin(DCsetup_LooseVmin, norm_fmsu);
//         ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vmin],v[vil_loose]);
//     clockpinset(s_clk_1a, s_clock);
//         TIME.Wait(tdelay);
//         if(tistdscreenprint)  
//            cout << "POWER UP AT VMIN" << endl;
//      } 
//      
//      PrintDUTSetup;
//   } 
//
//}   /* PwrupAtVmin_1 */
//
//
//void PwrupAtVmax_1()
//{
//   FloatS tdelay, offset;
//   FloatS volt_pgm, curr_pgm;
//   option igain_mode, pgm_mode;
//   IntS site;
//
//   if(v_any_dev_active)  
//   {
//      tdelay = 2ms;
//      offset = 12mV;
//
//      STDGetVI(VDD,volt_pgm,curr_pgm);
//
//      if((abs(volt_pgm-v[vdd_vmax])) >== offset)  
//      {      
//         PowerUpAtVmax(DCsetup_LooseVmax, norm_fmsu);
//         ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vmax],v[vil_loose]);
//     clockpinset(s_clk_1a, s_clock);
//         TIME.Wait(tdelay);
//         if(tistdscreenprint)  
//            cout << "POWER UP AT VMAX" << endl;
//      } 
//      
//      PrintDUTSetup;
//   } 
//
//}   /* PwrupAtVmax_1 */
//
// /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
//   
// /*usage: charz_EraseRefArray(VNM,10ms,50ms,5ms,9v,9v,1v,-114ua,true,"RefArr_Ers_")*/
// /*       charz_EraseRefArray(VNM,10ms,50ms,5ms,13v,13v,1v,-114ua,true,"")*/
// /*       charz_EraseRefArray(VNM,10ms,50ms,5ms,13v,13v,1v,-114ua,true,"")*/
//BoolS Charz_EraseRefArray(VCornerType vcorner,
//                             FloatS erspw_start,
//                             FloatS erspw_stop,
//                             FloatS erspw_inc,
//                             FloatS ersvolt_start,
//                             FloatS ersvolt_stop,
//                             FloatS ersvolt_inc,
//                             FloatS itarget,
//                             BoolS logena,
//                             StringS logstr)
//{
//   IntS site,bank,count,loop;
//   IntS tcrnum,tcrnum_src,tcrnum_ipmos,testnum;
//   TPModeType tcrmode,tcrmode_src,tcrmode_ipmos;
//   PinM testpad,tp3,tp4,pgmMode;
//   FloatS maxtime,tdelay,tdelay2,ttimer1;
//   FloatS llim,ulim,llim_pre,ulim_pre;
//   FloatS llim_pf,ulim_pf;
//   FloatM meas_value,meas_value2,tt_timer;
//   FloatM ipmos_even,ipmos_odd,ers_pwtotal;
//   StringS str1,str2,str3,str4,str5,current_shell;
//   IntS1D tnum_ipmos(2);
//   FloatM FloatSval;
//   TWunit unitval;
//   FloatS pwidth,vforce,pwinc;
//   FloatS FloatS1,FloatS2;
//   IntS int1,int2,minloop,maxloop;
//   StringS vstr,tstr;
//   BoolM savesites,activesites,tmp_results;
//   BoolM erssites,retestsites,final_results;
//   FloatM1D ieven_pre(8),iodd_pre(8),ieven_fn(8),iodd_fn(8);
//   BoolS bool1,bool2,firstpulsed;
//
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//      {
//         cout << endl;
//         cout << "**** Charz_EraseRefArray ****" << endl;
//         cout << endl;
//      } 
//      
//      maxtime = GL_F021_MAXTIME;
//      tdelay  = 100ms;
//      tdelay2 = 10ms;
//
//      switch(vcorner) {
//        case  VMN: case VMNO: case VMNE :   
//           PowerUpAtVmin(dcsetup_loosevmin,norm_fmsu);
//           ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                    v[vih_loose_osc_vmin],v[vil_loose]);
//         break; 
//        case  VNM: case VNMO: case VNME :   
//           PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
//           ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                    v[vih_loose_osc_vnom],v[vil_loose]);
//         break; 
//        case  VMX: case VMXO: case VMXE :   
//           PowerUpAtVmax(dcsetup_loosevmax,norm_fmsu);
//           ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                    v[vih_loose_osc_vmax],v[vil_loose]);
//         break; 
//        default:  
//           PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
//           ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                    v[vih_loose_osc_vnom],v[vil_loose]);
//         break;            
//      }   /* case */
//
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(tdelay2);
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      savesites = v_dev_active;
//      final_results = v_dev_active;
//      tmp_results = v_dev_active;
//      retestsites = v_dev_active;
//      
//      tcrnum_ipmos  = 40;
//      tcrmode_ipmos = EvfyMode;
//      tnum_ipmos[0] = TNUM_BANK_IPMOS_READ_EVEN;
//      tnum_ipmos[1] = TNUM_BANK_IPMOS_READ_ODD;
//      testpad = FLTP2;
//      llim = TCR.TP2_LLim[TCRnum_ipmos][TCRMode_ipmos];
//      ulim = TCR.TP2_ULim[TCRnum_ipmos][TCRMode_ipmos];
//
//      llim_pre = itarget+(itarget*0.06);
//      ulim_pre = itarget-(itarget*0.06);
//
//       /*2Ibit group <-85ua*/
//      if(itarget<ulim)  
//     ulim_pf = ulim;
//      else
//     ulim_pf = ulim_pre;
//
//      llim_pf = llim;
//
//      minloop = 0;  /*even*/
//      if(GL_BANKTYPE == FLESBANK)  
//         maxloop = 0;
//      else
//         maxloop = 1;  /*odd*/
//      
//      if(tistdscreenprint)  
//         PrintHeaderParam(GL_PLELL_FORMAT);
//      for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//      {
//          /*--- read ipmos evfy even/odd Pre ers ---*/
//         writestring(str1,bank:1);
//         str1 = "_B" + str1;
//         if(logstr == "")  
//            str2 = "Z_IP";
//         else
//            str2 = logstr;
//
//         ieven_pre[bank] = 0uA;
//         iodd_pre[bank] = 0uA;
//         
//         for (loop = minloop;loop <= maxloop;loop++)
//         {
//            testnum = tnum_ipmos[loop]+(bank<<4);
//            F021_TurnOff_AllTpads;
//            TIME.Wait(tdelay2);
//            F021_Set_TPADS(tcrnum_ipmos,tcrmode_ipmos);
//            F021_RunTestNumber_PMEX(testnum,maxtime,spare_msbool1);
//            TIME.Wait(tdelay);
//            discard(F021_Meas_TPAD_PMEX(testpad,tcrnum_ipmos,tcrmode_ipmos,
//                    llim,ulim,meas_value,spare_msbool2));
//            F021_TurnOff_AllTpads;
//            Disable(s_pmexit);
//            TIME.Wait(tdelay2);
//
//            if(loop==0)  
//            {
//               str3 = str2 + "E_Pre";
//               for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//                  if(v_dev_active[site])  
//                     ieven_pre[bank][site] = meas_value[site];
//            }
//            else
//            {
//               str3 = str2 + "O_Pre";
//               for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//                  if(v_dev_active[site])  
//                     iodd_pre[bank][site] = meas_value[site];
//            } 
//
//            str3 = str3 + str1;
//
//            if(logena)  
//            {
//               TWTRealToRealMS(meas_value,realval,unitval);
//               TWPDLDataLogRealVariable(str3,unitval,realval,TWMinimumData);
//            } 
//            
//            if(tistdscreenprint)  
//               PrintResultParam(str3,testnum,spare_msbool2,llim,ulim,meas_value,GL_PLELL_FORMAT);
//         }   /*for loop*/
//      }   /*bank*/
//
//      
//       /*check if already erased w/in limits, i.e. retested unit*/
//      for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//      {
//         for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//            if(v_dev_active[site])  
//            {
//               if(ieven_pre[bank][site] <== ulim_pre)  
//                  bool1 = true;
//               else
//                  bool1 = false;
//               
//               if(iodd_pre[bank][site] <== ulim_pre)  
//                  bool2 = true;
//               else
//                  bool2 = false;
//
//               if(GL_BANKTYPE == FLESBANK)  
//                  bool2 = true;
//               
//               retestsites[site] = retestsites[site] and bool1 and bool2;
//
//           if(retestsites[site])  
//           {
//          ieven_fn[bank][site] = ieven_pre[bank][site];
//                  if(GL_BANKTYPE == FLESBANK)  
//                     iodd_fn[bank][site]  = ieven_pre[bank][site] ; /*duplicate w/ even value*/
//                  else
//                     iodd_fn[bank][site]  = iodd_pre[bank][site];
//           } 
//            } 
//      }   /*bank*/
//      
//      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//         if(v_dev_active[site] and retestsites[site])  
//         {
//            devsetholdstate(site,false);
//            if(tistdscreenprint)  
//               cout << "Site" << site:-4 << " RefArray Already Erased w/in limits " << 
//                       llim_pre:-6:3 << "  " << ulim_pre:-6:3 << "  So Disable" << endl;
//         } 
//
//      
//      if(v_any_dev_active)  
//      {
//         if(tistdscreenprint)  
//            PrintHeaderParam(GL_PLELL_FORMAT);
//
//         erssites = v_dev_active;
//         
//         for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//         {
//            activesites = v_dev_active;
//            ers_pwtotal = 0ms;
//            
//            if(logstr == "")  
//               str1 = "Z_IP";
//            else
//               str1 = logstr;
//            writestring(str2,bank:1);
//            str2 = "_B" + str2;
//            str2 = str2 + "_";
//
//            
//             /*--- apply ers volt/pulse ---*/
//            for vforce = ersvolt_start to ersvolt_stop by ersvolt_inc do
//            {
//               treal1 = single(vforce/1v);
//               writestring(vstr,treal1:1);
//               int1 = instr(vstr,".");
//               if(int1!=0)  
//                  vstr[int1] = "P";
//               int1 = len(vstr);
//               vstr = mid(vstr,1,int1-1);  /*remove trailing space*/
//               vstr = vstr + "V_";
//               
//           firstpulsed = true;
//
//           for pwidth = erspw_start to erspw_stop by erspw_inc do
//               {
//                  treal2 = single(pwidth/1ms);
//                  writestring(tstr,treal2:1);
//                  int1 = instr(tstr,".");
//                  if(int1!=0)  
//                     tstr[int1] = "P";
//                  int1 = len(tstr);
//                  tstr = mid(tstr,1,int1-1);
//                  tstr = tstr + "MS";
//                  
//          tcrnum_src  = 56;
//          tcrmode_src = ErsMode;
//          tcrnum  = 128;
//          tcrmode = ErsMode;
//          CloneTCR_To_TCR128(tcrmode,tcrmode_src,tcrnum_src);
//          TCR.TP1_VRange[tcrnum][tcrmode] = vforce;
//
//                  F021_Turnoff_AllTpads;
//                  testnum = TNUM_BANK_REFARR_ERS + (bank<<4);
//                  F021_RunTestNumber_PMEX(testnum,maxtime,spare_msbool1);
//                  F021_Set_TPADS(tcrnum,tcrmode);
//                  if(firstpulsed)  
//                     TIME.Wait(erspw_start);
//                  else
//                     TIME.Wait(erspw_inc);
//                  F021_Turnoff_AllTpads;
//                  Disable(s_pmexit);
//
//                  F021_RunTestNumber(tnum_always_pass,maxtime,spare_mstreal1,spare_msbool1);
//                  TIME.Wait(tdelay2);
//                  
//                   /*tally up total applied pwidth*/
//                  if(firstpulsed)  
//                  {
//                     firstpulsed = false;
//                     pwinc = erspw_start;
//                  }
//                  else
//                     pwinc = erspw_inc;
//                     
//                  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//                     if(v_dev_active[site])  
//                        ers_pwtotal[site] = ers_pwtotal[site] + pwinc;  /*erspw_inc;*/
//                  
//                  for (loop = minloop;loop <= maxloop;loop++)
//                  {
//                     tcrnum_ipmos  = 40;
//                     tcrmode_ipmos = EvfyMode;
//                     tcrnum        = 128;
//                     tcrmode       = EvfyMode;
//                     testpad = FLTP2;
//                     CloneTCR_To_TCR128(tcrmode,tcrmode_ipmos,tcrnum_ipmos);
//                     TCR.TP2_LLim[TCRnum][TCRMode] = itarget+(itarget*0.06);
//                     TCR.TP2_ULim[TCRnum][TCRMode] = itarget-(itarget*0.06);
//                     llim = TCR.TP2_LLim[TCRnum][TCRMode];
//                     ulim = TCR.TP2_ULim[TCRnum][TCRMode];
//                     
//                     testnum = tnum_ipmos[loop]+(bank<<4);
//                     F021_Turnoff_AllTpads;
//                     F021_Set_TPADS(tcrnum,tcrmode);
//                     F021_RunTestNumber_PMEX(testnum,maxtime,spare_msbool1);
//                     TIME.Wait(tdelay);
//                     discard(F021_Meas_TPAD_PMEX(testpad,tcrnum,tcrmode,
//                             llim,ulim,meas_value,spare_msbool2));
//                     F021_Turnoff_AllTpads;
//                     Disable(s_pmexit);
//                     TIME.Wait(tdelay2);
//                     
//                     if(loop==0)  
//                     {
//                        ipmos_even = meas_value;
//                        str3 = str1 + "E";
//                     }
//                     else
//                     {
//                        ipmos_odd = meas_value;
//                        str3 = str1 + "O";
//                     } 
//                     
//                     str3 = str3 + str2;
//                     str4 = str3;
//                     str3 = str3 + vstr;
//                     str3 = str3 + tstr;
//                     
//                     if(logena)  
//                     {
//                        TWTRealToRealMS(meas_value,realval,unitval);
//                        TWPDLDataLogRealVariable(str3,unitval,realval,TWMinimumData);
//                     } 
//                     
//                     if(tistdscreenprint)  
//                        PrintResultParam(str3,testnum,spare_msbool2,llim,ulim,meas_value,GL_PLELL_FORMAT);
//                  }   /*for loop*/
//                  
//                   /*--- check even/odd against target/limits ---*/
//                  for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//                     if(v_dev_active[site])  
//                     {
//                        if(ipmos_even[site] <== ulim)  
//                           bool1 = true;
//                        else
//                           bool1 = false;
//                        
//                        if(ipmos_odd[site] <== ulim)  
//                           bool2 = true;
//                        else
//                           bool2 = false;
//
//                        if(GL_BANKTYPE == FLESBANK)  
//                           bool2 = true;
//
//                        if(bool1 and bool2)  
//                        {
//                           activesites[site] = false;  /*done erasing*/
//                           if(tistdscreenprint and ti_flashdebug)  
//                              cout << "Site " << site:-5 << " Done Erasing so dis-able" << endl;
//            } 
//
//             /*store final meas*/
//            ieven_fn[bank][site] = ipmos_even[site];
//                        if(GL_BANKTYPE == FLESBANK)  
//                           iodd_fn[bank][site]  = ipmos_even[site] ; /*duplicate w/ even value*/
//                        else
//                           iodd_fn[bank][site]  = ipmos_odd[site];
//                     } 
//                  
//                   /*disable site done erasing*/
//                  devsetholdstates(activesites);
//                  
//                  if(not v_any_dev_active)  
//                     break;
//               }   /*for pwidth*/
//               
//               if(not v_any_dev_active)  
//                  break;
//            }   /*for vforce*/
//
//            devsetholdstates(erssites);
//            
//            str4 = str4 + "TOTPW";
//            if(logena)  
//            {
//               TWTRealToRealMS(ers_pwtotal,realval,unitval);
//               TWPDLDataLogRealVariable(str4, unitval,realval,TWMinimumData);
//            } 
//            
//            if(tistdscreenprint)  
//               PrintResultParam(str4,testnum,savesites,0ms,0ms,ers_pwtotal,GL_PLELL_FORMAT);
//            
//         }   /*bank*/
//      }   /*if v_any_dev_active*/
//      
//      devsetholdstates(savesites);
//      F021_TurnOff_AllTpads;
//
//       /*final check and binout*/
//      for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//      {
//     for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//        if(v_dev_active[site])  
//        {
//           if not((ieven_fn[bank][site] >== llim_pf) and (ieven_fn[bank][site] <== ulim_pf) and
//              (iodd_fn[bank][site]  >== llim_pf) and (iodd_fn[bank][site]  <== ulim_pf))  
//          final_results[site] = false;
//           if(tistdscreenprint and (not final_results[site]))  
//          cout << "Site" << site:-5 << " Bank" << bank:-5 << " Failed Limits " << llim_pf << "  " << ulim_pf << endl;
//        } 
//      } 
//
//      if(tistdscreenprint)  
//      {
//         PrintHeaderBool(GL_PLELL_FORMAT);
//     if(logstr=="")  
//        str1 = "Z_IP_Ev";
//     else
//        str1 = logstr;
//         PrintResultBool(str1,0,final_results,GL_PLELL_FORMAT);
//      } 
//
//      TestOpen(RefArr_Ers_Test);
//      ResultsRecordActive(final_results, S_NULL);
//      TestClose;
//
//      if((not TIIgnoreFail) and (not TI_FlashCOFEna))  
//     Devsetholdstates(final_results);
//      
//   }   /*if v_any_dev_active*/
//
//   Charz_EraseRefArray = v_any_dev_active;
//}   /* Charz_EraseRefArray */
//
//
// /*usage: charz_ProgramPW(VNM,8us,true,"Z_PPW")*/
//BoolS Charz_ProgramPW(VCornerType vcorner,
//                         FloatS pgmpw_start,
//                         FloatS pgmpw_stop,
//                         FloatS pgmpw_inc,
//                         BoolS logena,
//                         StringS logstr)
//{
//   const IntS PW4U_INT = 8; 
//   const  PW4U = 4us;  /* :MANUAL FIX REQUIRED: Unknown const type */
//
//   IntS site,bank,count,loop,stnum;
//   IntS tcrnum,tcrnum_src,tcrnum_ipmos,testnum;
//   TPModeType tcrmode,tcrmode_src,tcrmode_ipmos;
//   option testpad,tp3,tp4,pgmMode;
//   FloatS maxtime,tdelay,tdelay2,ttimer1;
//   StringS str1,str2,str3,str4,str5,str6,str7;
//   StringS current_shell,tstr;
//   IntM pgmpulse,totpulse,totpulselo,erspulse;
//   BoolM tmp_results,final_results,logsites;
//   IntS loc_maxpls,loc_totpls,ulim,loc_erspls;
//   FloatS pwidth;
//   IntS pwint,int1,int2;
//   StringM failpatstr;
//   FloatS pgmpw,FloatS2,ires,vres,llimit,ulimit;
//   IntM msw_addr,lsw_addr,msw_data,lsw_data;
//   FloatM vt_values,istart,istop,vforce;
//   FloatM vstart,vstop,iforce,vt_intvalues;
//   FloatM FloatSval;
//   TWunit unitval;
//
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//      {
//         cout << endl;
//         cout << "**** Charz_ProgramPW ****" << endl;
//         cout << endl;
//      } 
//
//      timernstart(ttimer1);
//      
//      maxtime = GL_F021_MAXTIME;
//      tdelay  = 10ms;
//      tdelay2 = 100ms;
//      loc_maxpls = ADDR_PROG_MAX_PULSE>>2;
//      loc_totpls = ADDR_PROG_TOT_PULSE>>2;
//      loc_erspls = ADDR_ERS_PULSE>>2;
//
//      switch(vcorner) {
//        case  VMN: case VMNO: case VMNE :   
//           PowerUpAtVmin(dcsetup_loosevmin,norm_fmsu);
//           ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                    v[vih_loose_osc_vmin],v[vil_loose]);
//         break; 
//        case  VNM: case VNMO: case VNME :   
//           PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
//           ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                    v[vih_loose_osc_vnom],v[vil_loose]);
//         break; 
//        case  VMX: case VMXO: case VMXE :   
//           PowerUpAtVmax(dcsetup_loosevmax,norm_fmsu);
//           ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                    v[vih_loose_osc_vmax],v[vil_loose]);
//         break; 
//        default:  
//           PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
//           ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                    v[vih_loose_osc_vnom],v[vil_loose]);
//         break;            
//      }   /* case */
//
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(tdelay);
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         f021_loadflashshell_func;
//
//      for pgmpw = pgmpw_start to pgmpw_stop by pgmpw_inc do
//      {
//         treal2 = single(pgmpw/1us);
//         writestring(tstr,treal2:1);
//         int1 = instr(tstr,".");
//         if(int1!=0)  
//            tstr[int1] = "P";
//         int1 = len(tstr);
//         tstr = mid(tstr,1,int1-1);  /*remove trailing space*/
//         tstr = tstr + "US";
//         
//         if(logstr == "")  
//            str1 = "Z_PPW_" + tstr;
//         else
//            str1 = logstr + tstr;
//
//          /*+++ erasing +++*/
//         if(tistdscreenprint)  
//            PrintHeaderErsProg(0,ulim,0,0,0,0,(not GL_PLELL_FORMAT));
//         for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//         {
//            testnum = TNUM_BANK_ERS_PRECON_SW + (bank<<4);
//            F021_RunTestNumber(testnum,maxtime,spare_mstreal1,tmp_results);
//            erspulse = 0;
//            GetRamContentDec_16bit(ramread_nburst_lsw,loc_erspls,erspulse);
//            writestring(str2,bank:1);
//            str2 = "_B" + str2;
//            str3 = str1 + str2;
//            str3 = str3 + "_ERSPLS";
//            
//            if(logena)  
//               TWPDLDataLogVariable(str3,erspulse,TWMinimumData);
//            
//            if(tistdscreenprint)  
//               PrintResultInt(str3,testnum,erspulse,0,ulim,GL_PLELL_FORMAT);
//         }   /*bank ers*/
//
//          /*+++ program +++*/
//         ulim = 1000;
//         pwidth = single(pgmpw/PW4U);
//         pwint = trunc(pwidth*PW4U_INT);
//         
//         final_results = v_dev_active;
//         for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//            if(v_dev_active[site])  
//               failpatstr[site] = "P";
//         
//         if(tistdscreenprint)  
//            PrintHeaderErsProg(0,ulim,0,0,0,0,(not GL_PLELL_FORMAT));
//         for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//         {
//            tmp_results = v_dev_active;
//            logsites = v_dev_active;
//            TL_EngOvride_PPW_MAXPP(pwint,2000);
//            testnum = TNUM_BANK_PROG_SM + (bank<<4);
//            F021_RunTestNumber(testnum,maxtime,spare_mstreal1,tmp_results);
//            pgmpulse = 0;
//            totpulse = 0;
//            totpulselo = 0;
//            GetRamContentDec_16bit(ramread_nburst_lsw,loc_maxpls,pgmpulse);
//            GetRamContentDec_16bit(ramread_nburst_lsw,loc_totpls,totpulselo);
//            GetRamContentDec_16bit(ramread_nburst_msw,loc_totpls,totpulse);
//            arrayandintegervalue(totpulse,totpulse,0x7FFF,v_sites);
//            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//               if(v_dev_active[site])  
//                  totpulse[site] = totpulse[site]<<0x10;
//            arrayaddinteger(totpulse,totpulse,totpulselo,v_sites);
//            
//            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//               if(v_dev_active[site])  
//                  if(pgmpulse[site] > ulim)  
//                     tmp_results[site] = false;
//            
//            arrayandboolean(final_results,final_results,tmp_results,v_sites);
//            
//            writestring(str2,bank:1);
//            str2 = "_B" + str2;
//            str3 = str1 + str2;
//            str4 = str3;
//            str5 = str3;
//            str3 = str3 + "_MAXPLS";
//            str4 = str4 + "_TOTPLS";
//            
//            if(logena)  
//            {
//               TWPDLDataLogVariable(str3,pgmpulse,TWMinimumData);
//               TWPDLDataLogVariable(str4,totpulse,TWMinimumData);
//            } 
//            
//            if(tistdscreenprint)  
//            {
//               PrintResultInt(str3,testnum,pgmpulse,0,ulim,GL_PLELL_FORMAT);
//               PrintResultInt(str4,testnum,totpulse,0,ulim,GL_PLELL_FORMAT);
//            } 
//
//             /*get fail data on fail*/
//            if((not ArrayCompareBoolean(logsites,tmp_results,v_sites)) and logena)  
//            {
//               str3 = str5 + "_FADDR";
//               str4 = str5 + "_FDATA";
//               GetRamContentDec_16bit(ramread_nburst_msw,ADDR_FAIL_ADDR>>2,msw_addr);
//               GetRamContentDec_16bit(ramread_nburst_lsw,ADDR_FAIL_ADDR>>2,lsw_addr);
//               GetRamContentDec_16bit(ramread_nburst_msw,ADDR_FAIL_DATA>>2,msw_data);
//               GetRamContentDec_16bit(ramread_nburst_lsw,ADDR_FAIL_DATA>>2,lsw_data);
//               for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//                  if(v_dev_active[site] and (not tmp_results[site]))  
//                  {
//                     int1 = (msw_addr[site]<<16) + lsw_addr[site];
//                     writestring(str6,int1:s_hex:1);
//                     if(logena)  
//                        TWPDLDatalogTextSite(str3,str6,site,TWMinimumData);
//                     int2 = (msw_data[site]<<16) + lsw_data[site];
//                     writestring(str7,int2:s_hex:1);
//                     if(logena)  
//                        TWPDLDatalogTextSite(str4,str7,site,TWMinimumData);
//                     if(tistdscreenprint)  
//                        cout << "Site" << site:-5 << str3 << "  " << str6 << "  " << str4 << "  " << str7 << endl;
//                  } 
//            }   /*if not arraycompare*/
//         }   /*bank pgm*/
//
//          /*+++ bcc +++*/
//         istart = MainBCC.SSTART[ONOVT0][pre];
//         istop = MainBCC.SSTOP[ONOVT0][pre];
//         ires = MainBCC.SRESOL[ONOVT0][pre];
//         llimit = MainBCC.LLIM[ONOVT0][pre];
//         ulimit = MainBCC.ULIM[ONOVT0][pre];
//         switch(MainBCC.TCRNUM[ONOVT0][pre]) {
//           case 5  :  
//                   stnum = TNUM_TCR5;
//                   Vforce = TCR.TP1_VRange[5][Readmode];
//                 break; 
//           case 6  :  
//                   stnum = TNUM_TCR6;
//                   Vforce = TCR.TP1_VRange[6][Readmode];
//                 break; 
//           case 38 :  
//                   stnum = TNUM_TCR38;
//                   Vforce = TCR.TP1_VRange[38][Readmode];
//                 break; 
//           default:  
//              stnum = TNUM_TCR39;
//              Vforce = TCR.TP2_VRange[39][Readmode];
//            break; 
//         }   /* case */
//
//         if(tistdscreenprint)  
//            PrintHeaderParam(GL_PLELL_FORMAT);
//         
//         stnum = stnum+MainBCC.IRATIO[ONOVT0][pre]+MainBCC.RDOPTION[ONOVT0][pre];
//         for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//         {
//            testnum = stnum + (bank<<4);
//            F021_BCC_BinSearch_TTR(testnum,Istart,Istop,ires,Vforce,maxtime,spare_mstreal1,vt_values);
//            writestring(str2,bank:1);
//            str2 = "_B" + str2;
//            str3 = str1 + str2;
//            str3 = str3 + "_BCC0MX";
//            if(tistdscreenprint)  
//            {
//               tmp_results = v_dev_active;
//               for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//                  if(v_dev_active[site])  
//                     if((vt_values[site]>==llimit) and (vt_values[site]<==ulimit))  
//                        tmp_results[site] = true;
//               PrintResultParam(str3,testnum,tmp_results,LLimit,ULimit,vt_values,GL_PLELL_FORMAT);
//            } 
//            if(logena)  
//            {
//                /*translate to internal value*/
//               if(MainBCC.IRATIO[ONOVT0][pre]==TNUM_MULT2)  
//               {
//                  ArrayAddTReal(vt_intvalues,vt_values,vt_values,v_sites);
//                  vt_values = vt_intvalues;
//           }
//           else if(MainBCC.IRATIO[ONOVT0][pre]==TNUM_MULT4)  
//           {
//                  ArrayAddTReal(vt_intvalues,vt_values,vt_values,v_sites);
//                  ArrayAddTReal(vt_intvalues,vt_intvalues,vt_values,v_sites);
//                  ArrayAddTReal(vt_intvalues,vt_intvalues,vt_values,v_sites);
//                  vt_values = vt_intvalues;
//           }
//           else if(MainBCC.IRATIO[ONOVT0][pre]==TNUM_DIV2)  
//           {
//          for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//             if(v_dev_active[site])  
//            vt_values[site] = 0.5*vt_values[site];
//           } 
//               TWTRealToRealMS(vt_values,realval,unitval);
//               TWPDLDataLogRealVariable(str3,unitval,realval,TWMinimumData);
//            } 
//            
//         }   /*bank bcc*/
//            
//          /*+++ vt +++*/
//         vstart = MainVT.SSTART[ONOVT0][pre];
//         vstop = MainVT.SSTOP[ONOVT0][pre];
//         vres = MainVT.SRESOL[ONOVT0][pre];
//         llimit = MainVT.LLIM[ONOVT0][pre];
//         ulimit = MainVT.ULIM[ONOVT0][pre];
//         Iforce = 20uA;
//         switch(MainVT.TCRNUM[ONOVT0][pre]) {
//           case 5  : stnum = TNUM_TCR5;
//           case 6  : stnum = TNUM_TCR6;
//           case 38 : stnum = TNUM_TCR38;
//           default: stnum = TNUM_TCR39;
//         }   /* case */
//
//         if(tistdscreenprint)  
//            PrintHeaderParam(GL_PLELL_FORMAT);
//         
//         stnum = stnum+MainVT.IRATIO[ONOVT0][pre]+MainVT.RDOPTION[ONOVT0][pre];
//         for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//         {
//            testnum = stnum+ (bank<<4);
//            F021_VT_BinSearch_TTR(testnum,vstart,vstop,vres,Iforce,maxtime,spare_mstreal1,vt_values);
//            writestring(str2,bank:1);
//            str2 = "_B" + str2;
//            str3 = str1 + str2;
//            str3 = str3 + "_VT0MN";
//            if(tistdscreenprint)  
//            {
//               tmp_results = v_dev_active;
//               for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//                  if(v_dev_active[site])  
//                     if((vt_values[site]>==llimit) and (vt_values[site]<==ulimit))  
//                        tmp_results[site] = true;
//               PrintResultParam(str3,testnum,tmp_results,LLimit,ULimit,vt_values,GL_PLELL_FORMAT);
//            } 
//
//            TWTRealToRealMS(vt_values,realval,unitval);
//            TWPDLDataLogRealVariable(str3,unitval,realval,TWMinimumData);
//
//            
//         }   /*bank vt*/
//            
//         if(logena)  
//         {
//            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//               if(v_dev_active[site] and (not final_results[site]))  
//                  failpatstr[site] = "F";
//            str3 = str1 + "_STAT";
//            TWPDLDataLogText(str3,failpatstr,TWMinimumData);
//         } 
//
//      }   /*for pgmpw*/
//   }   /*if v_any_dev_active*/
//
//   if(tistdscreenprint)  
//      cout << "TT " << timernread(ttimer1) << endl;
//
//   Charz_ProgramPW = v_any_dev_active;
//} 
//
//BoolS Charz_Iref_Repeat(VCornerType vcorner,
//                           IntS tcrnum,
//                           TPModeType tcrmode,
//                           IntS tnum_even,
//                           IntS tnum_odd,
//                           IntS samplecount,
//                           BoolS logena,
//                           StringS logstr)
//{
//   IntS site,bank,count,loop,minloop,maxloop;
//   IntS tcrnum_ipmos,testnum;
//   TPModeType tcrmode_ipmos;
//   PinM testpad,cg_tpad,pgmMode;
//   FloatS maxtime,tdelay,tdelay2,ttimer1;
//   FloatS llim,ulim,llim2,ulim2,llim4,ulim4;
//   FloatM meas_value,meas_value2,tt_timer;
//   StringS str1,str2,str3,str4,str5,str6;
//   IntS1D tnum_ipmos(2);
//   FloatM FloatSval;
//   TWunit unitval;
//   FloatS FloatS1,FloatS2;
//   BoolM savesites,tmp_results,tmp2_results;
//   StringS current_shell;
//   BoolS cg_ena;
//
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//      {
//         cout << endl;
//         cout << "**** Charz_Iref_Repeatability ****" << endl;
//         cout << endl;
//         timernstart(ttimer1);
//      } 
//
//      maxtime = GL_F021_MAXTIME;
//      tdelay  = 100ms;
//      tdelay2 = 10ms;
//
//      minloop = 0;
//      maxloop = 1;
//      
//      if(GL_BANKTYPE == FLESBANK)  
//         maxloop = 0;  /*do even only*/
//
//      switch(vcorner) {
//        case  VMN: case VMNO: case VMNE :   
//           PowerUpAtVmin(dcsetup_loosevmin,norm_fmsu);
//           ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                    v[vih_loose_osc_vmin],v[vil_loose]);
//         break; 
//        case  VNM: case VNMO: case VNME :   
//           PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
//           ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                    v[vih_loose_osc_vnom],v[vil_loose]);
//         break; 
//        case  VMX: case VMXO: case VMXE :   
//           PowerUpAtVmax(dcsetup_loosevmax,norm_fmsu);
//           ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                    v[vih_loose_osc_vmax],v[vil_loose]);
//         break; 
//        default:  
//           PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
//           ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                    v[vih_loose_osc_vnom],v[vil_loose]);
//         break;            
//      }   /* case */
//
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(tdelay2);
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      savesites = v_dev_active;
//      tmp_results = v_dev_active;
//      tmp2_results = v_dev_active;
//      
//      tcrnum_ipmos = 128;
//      tcrmode_ipmos = EvfyMode;
//      tnum_ipmos[0] = tnum_even;
//      tnum_ipmos[1] = tnum_odd;
//      testpad = FLTP2;
//      CloneTCR_To_TCR128(tcrmode_ipmos,tcrmode,tcrnum);
//      llim = TCR.TP2_LLim[TCRnum_ipmos][TCRMode_ipmos];
//      ulim = TCR.TP2_ULim[TCRnum_ipmos][TCRMode_ipmos];
//
//      switch(tcrnum) {
//        case  28: case 29: case 30: case 43: case 44: case 45 :   
//           cg_ena = true;
//           cg_tpad = FLTP1;
//           llim2 = TCR.TP1_LLim[TCRnum_ipmos][TCRMode_ipmos];
//           ulim2 = TCR.TP1_ULim[TCRnum_ipmos][TCRMode_ipmos];
//           str5 = "_VCG";
//         break; 
//        default:  
//           cg_ena = false;
//         break; 
//      }   /* case */
//
//      if(tistdscreenprint)  
//         PrintHeaderParam(GL_PLELL_FORMAT);
//      for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//      {
//          /*--- read ipmos evfy even/odd Pre ers ---*/
//         writestring(str1,bank:1);
//         str1 = "_B" + str1;
//
//         for (loop = minloop;loop <= maxloop;loop++)
//         {
//            for (count = 1;count <= samplecount;count++)
//            {
//               testnum = tnum_ipmos[loop]+(bank<<4);
//               F021_TurnOff_AllTpads;
//               TIME.Wait(tdelay2);
//               F021_Set_TPADS(tcrnum_ipmos,tcrmode_ipmos);
//               F021_RunTestNumber_PMEX(testnum,maxtime,spare_msbool1);
//               TIME.Wait(tdelay);
//               discard(F021_Meas_TPAD_PMEX(testpad,tcrnum_ipmos,tcrmode_ipmos,
//                       llim,ulim,meas_value,tmp_results));
//               if(cg_ena)  
//                  discard(F021_Meas_TPAD_PMEX(cg_tpad,tcrnum_ipmos,tcrmode_ipmos,
//                          llim2,ulim2,meas_value2,tmp2_results));
//               F021_TurnOff_AllTpads;
//               Disable(s_pmexit);
//               TIME.Wait(tdelay2);
//               
//               if(logstr == "")  
//               {
//                  writestring(str2,testnum:s_hex:1);
//                  str2 = "Z_IREF_" + str2;
//               } 
//
//               if(loop==0)  
//               {
//                  if(logstr == "")  
//                     str3 = str2 + "E";
//                  else
//                     str3 = logstr + "E";
//               }
//               else
//               {
//                  if(logstr == "")  
//                     str3 = str2 + "O";
//                  else
//                     str3 = logstr + "O";
//               } 
//               
//               str3 = str3 + str1;
//               if(samplecount>1)  
//               {
//                  str3 = str3 + "_L";
//                  writestring(str4,count:1);
//                  str3 = str3 + str4;
//               } 
//               
//               if(logena)  
//               {
//                  TWTRealToRealMS(meas_value,realval,unitval);
//                  TWPDLDataLogRealVariable(str3,unitval,realval,TWMinimumData);
//                  if(cg_ena)  
//                  {
//                     str6 = str3 + str5;
//                     TWTRealToRealMS(meas_value2,realval,unitval);
//                     TWPDLDataLogRealVariable(str6,unitval,realval,TWMinimumData);
//                  }                      
//               } 
//               
//               if(tistdscreenprint)  
//               {
//                  PrintResultParam(str3,testnum,tmp_results,llim,ulim,meas_value,GL_PLELL_FORMAT);
//                  if(cg_ena)  
//                  {
//                     str6 = str3 + str5;
//                     PrintResultParam(str6,testnum,tmp2_results,llim2,ulim2,meas_value2,GL_PLELL_FORMAT);
//                  } 
//               } 
//                     
//            }   /*for count*/
//         }   /*for loop*/
//      }   /*bank*/
//      if(tistdscreenprint)  
//         cout << "Charz_Iref_Repeatability TT == " << timernread(ttimer1) << endl;
//   }   /*if v_any_dev_active*/
//
//   Charz_Iref_Repeat = v_any_dev_active;
//}   /* Charz_Iref_Repeat */

 /*bcc charz w/ histogram. tcr38 bcc0max/bcc1min. to be expanded for other tcrmode later.*/
void Charz_BCC(VCornerType vcorner,
                   IntS tnum,
                   IntS pattype,
                   FloatS bccstart,
                   FloatS bccstop,
                   FloatS bccres,
                   BoolS logena,
                   StringS logstr)
{
   const IntS PW4U_INT = 8; 
   const FloatS PW4U = 4us;

   IntS site,bank,count,loop,blkstart,blkstop;
   IntS tcrnum,tcrnum_src,tcrnum_ipmos,testnum;
   TPModeType tcrmode,tcrmode_src,tcrmode_ipmos;
//   option testpad,tp3,tp4,pgmMode;
   FloatS maxtime,tdelay,tdelay2,ttimer1;
   StringS str1,str2,str3,str4,str5,str6,str7;
   StringS current_shell,tstr;
   IntM pgmpulse,totpulse,totpulselo,erspulse;
   BoolM tmp_results,final_results,logsites;
   IntS loc_maxpls,loc_totpls,ulim,loc_erspls;
   FloatS pwidth;
   IntS pwint,int1,int2;
   StringM failpatstr;
   FloatS pgmpw,FloatS2,ires,vres,llimit,ulimit;
   IntM msw_addr,lsw_addr,msw_data,lsw_data;
   FloatM vt_values,istart,istop,vforce;
   FloatM vstart,vstop,iforce,vt_intvalues;
   FloatM FloatSval;
   Levels PS_Vmin = "PowerUpAtVmask";
   Levels PS_Vnom = "PowerUpAtVmask";
   Levels PS_Vmax = "PowerUpAtVmask";
   
//   TWunit unitval;

   if (tistdscreenprint)  {
      cout << endl;
      cout << "**** Charz_BCC ****" << endl;
      cout << endl;
   } 

   TIME.StartTimer();
   
   maxtime = GL_F021_MAXTIME;
   tdelay  = 10ms;
   tdelay2 = 100ms;
   loc_maxpls = ADDR_PROG_MAX_PULSE>>2;
   loc_totpls = ADDR_PROG_TOT_PULSE>>2;
   loc_erspls = ADDR_ERS_PULSE>>2;

   switch (vcorner) {
      case  VMN: case VMNO: case VMNE :
         PS_Vmin.Execute();
         break; 
      case  VNM: case VNMO: case VNME :
         PS_Vnom.Execute();
         break; 
      case  VMX: case VMXO: case VMXE :
         PS_Vmax.Execute();
         break; 
      default:
         PS_Vnom.Execute();
         break;            
   }   // case

   TIME.Wait(tdelay);

   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   if (logstr == "")  
      str1 = "Z_BCC";
   else
      str1 = logstr;

   // +++ bcc +++
   int2 = (tnum&0x0000f000)>>12;
   if (int2==0) {
      llimit = MainBCC.LLIM[ONOVT0][pre];
      ulimit = MainBCC.ULIM[ONOVT0][pre];
      int1 = 0;
      int2 = MainBCC.TCRNUM[ONOVT0][pre];
      if (int2!=39)  
         vforce = TCR.TP1_VRange[int2][ReadMode];
      else
         vforce = TCR.TP2_VRange[int2][ReadMode];
   }
   else {
      llimit = MainBCC.LLIM[FGWLVT1][pre];
      ulimit = MainBCC.ULIM[FGWLVT1][pre];
      int1 = 1;
      int2 = MainBCC.TCRNUM[FGWLVT1][pre];
      if (int2!=39)  
         vforce = TCR.TP1_VRange[int2][ReadMode];
      else
         vforce = TCR.TP2_VRange[int2][ReadMode];
   } 
   
   istart = bccstart;
   istop = bccstop;
   ires = bccres;

   if (tistdscreenprint)  
      PrintHeaderParam(GL_PLELL_FORMAT);

   for (bank = 0; bank <= F021_Flash.MAXBANK; ++bank) {
      if ((pattype==BANKTYPE) or (pattype==OTPTYPE)) {
         blkstart = bank;
         blkstop  = bank;
      }
      else if (pattype==BLOCKTYPE) {
         blkstart = 0;
         blkstop  = F021_Flash.MAXBLOCK[bank];
      }
      else {
         blkstart = 0;
         blkstop  = F021_Flash.MAXSECT[bank];
      } 
      
      testnum = tnum + (bank<<4);

      for (count = blkstart; count <= blkstop; ++count) {
         F021_BCC_BinSearch_TTR(testnum,istart,istop,ires,vforce,maxtime,ttimer1,vt_values);

         str2 = "_B";
         // str3 += CONV.IntToString(bank);  // Bug IntToStr can't convert zero (SPR142812)
         if ( bank == 0 ) str2 += "0";
         else             str2 += CONV.IntToString(bank);
         str3 = str1 + str2;

         if (pattype!=BANKTYPE) {

            if(pattype==SECTTYPE)  
               str4 = "S" + str4;
            else
               str4 = "BLK" + str4;

            // str4 += CONV.IntToString(count);  // Bug IntToStr can't convert zero (SPR142812)
            if ( count == 0 ) str4 += "0";
            else              str4 += CONV.IntToString(count);

            str3 = str3 + str4;
         } 

//       if (tistdscreenprint) {
//          tmp_results = v_dev_active;
//          for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//             if(v_dev_active[site])  
//                if((vt_values[site]>==llimit) and (vt_values[site]<==ulimit))  
//                   tmp_results[site] = true;
//          PrintResultParam(str3,testnum,tmp_results,LLimit,ULimit,vt_values,GL_PLELL_FORMAT);
//       } 

         if (logena) {
            if (int1==0)  {
               // translate to internal value
               if (MainBCC.IRATIO[ONOVT0][pre]==TNUM_MULT2) {
                  vt_intvalues += vt_values;
               }
               else if (MainBCC.IRATIO[ONOVT0][pre]==TNUM_MULT4) {
                  vt_intvalues += vt_values;
                  vt_intvalues *= 3;
               }
               else if (MainBCC.IRATIO[ONOVT0][pre]==TNUM_DIV2) {
                  vt_intvalues = vt_values * 0.5;
               } 
            }
            else {
               if (MainBCC.IRATIO[FGWLVT1][pre]==TNUM_MULT2) {
                  vt_intvalues += vt_values;
               }
               else if (MainBCC.IRATIO[FGWLVT1][pre]==TNUM_MULT4)  {
                  vt_intvalues += vt_values;
                  vt_intvalues *= 3;
               }
               else if (MainBCC.IRATIO[FGWLVT1][pre]==TNUM_DIV2) {
                  vt_intvalues = vt_values * 0.5;
               } 
            } 
               
//          TWTRealToRealMS(vt_intvalues,realval,unitval);
//          TWPDLDataLogRealVariable(str3,unitval,realval,TWMinimumData);
         } 

//       TL_BitHistogram(pattype,testnum,4.4v,4.4v,1v,bccstart,bccstop,ires,logena,str3);
                         
         testnum = testnum+1;
      }   // count
   }   // bank bcc
            
   if (tistdscreenprint)  
      cout << "TT " << TIME.GetTimer() << endl;

}   // Charz_BCC 

//
//BoolS Charz_OvrTempl_W89()
//{
//   IntS catnum,pmratio,pvratio,evratio;
//   IntS rm0ratio,rm1ratio,rdratio;
//
//   if(v_any_dev_active and TI_FlashCharEna and GL_DO_CHARZ_ERSREFARR and
//      GL_DO_CHARZ_OVRTEMPL_W89)  
//   {
//      switch(GL_CHARZ_ERSREFARR_SAVECOUNT) {
//        case 1..7 :  
//            /*2ibit target -55ua*/
//           catnum   = 1;
//           pmratio  = 24;
//           pvratio  = 30;
//           evratio  = 8;
//           rm0ratio = 20;
//           rm1ratio = 13;
//           rdratio  = 16;
//         break; 
//        default:  
//            /*2ibit target -114ua*/
//           catnum   = 5;
//           pmratio  = -1;
//           pvratio  = -1;
//           evratio  = -1;
//           rm0ratio = -1;
//           rm1ratio = -1;
//           rdratio  = -1;
//         break; 
//      }   /* case */
//
//       /*catnum=5 then ROM default so no need to override*/
//      if(catnum<5)  
//         TL_EngOvride_W89_RAM(catnum,pmratio,pvratio,evratio,rm0ratio,rm1ratio,rdratio);
//   } 
//   
//   Charz_OvrTempl_W89 = v_any_dev_active;
//}   /* Charz_OvrTempl_W89 */
//
//
//BoolS Charz_VBG_VRD_Soft(BoolS logena)
//{
//   IntS site,loop,tnum_bg,tnum_vrd;
//   IntS tcrnum_bg,tcrnum_vrd,tcrnum;
//   TPModeType tcrmode_bg,tcrmode_vrd,tcrmode;
//   PinM tpad_bg,tpad_vrd;
//   FloatS maxtime,tdelay,tdelay2,ttimer1;
//   FloatS llim_bg,ulim_bg,llim_vrd,ulim_vrd;
//   FloatM meas_value,meas_value2,tt_timer;
//   StringS str1,str2,str3,str4,str5;
//   FloatM FloatSval;
//   TWunit unitval;
//   FloatS FloatS1,FloatS2;
//   BoolM spbool1,spbool2;
//   IntS BGVal,IRVal,FOSCVal;
//   IntS minloop,maxloop;
//
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//      {
//         cout << endl;
//         cout << "**** Charz_VBG_VRD_Soft ****" << endl;
//         cout << endl;
//      } 
//      
//      maxtime = GL_F021_PARAM_MAXTIME;
//      tdelay  = 50ms;
//      tdelay2 = 5ms;
//
//      tcrnum_bg   = 124;
//      tcrmode_bg  = ReadMode;
//      tpad_bg     = FLTP2;
//      tnum_bg     = TNUM_PUMP_MAINBG;
//      llim_bg     = TCR.TP2_LLim[tcrnum_bg][tcrmode_bg];
//      ulim_bg     = TCR.TP2_ULim[tcrnum_bg][tcrmode_bg];
//
//      tcrnum_vrd  = 117;
//      tcrmode_vrd = ProgMode;  /*readmode w/ relax limits*/
//      tpad_vrd    = FLTP1;
//      tnum_vrd    = TNUM_PUMP_VREAD;
//      llim_vrd    = TCR.TP1_LLim[tcrnum_vrd][tcrmode_vrd];
//      ulim_vrd    = TCR.TP1_ULim[tcrnum_vrd][tcrmode_vrd];
//
//      
//      if(tistdscreenprint)  
//         PrintHeaderParam(GL_PLELL_FORMAT);
//
//      minloop = 0;
//      maxloop = 63;
//      IRVal   = 0;
//      FOSCVal = 0;
//   
//      for (loop = minloop;loop <= maxloop;loop++)
//      {
//         F021_TurnOff_AllTpads;
//         TIME.Wait(tdelay2);
//
//         BGVal = loop;
//         RAM_Upload_SoftTrim_All(BGVal,IRVal,FOSCVal,FOSCVal,FOSCVal);
//         
//          /*bgap*/
//         F021_RunTestNumber_PMEX(tnum_bg,maxtime,spbool1);
//         TIME.Wait(tdelay);
//         F021_Set_TPADS(tcrnum_bg,tcrmode_bg);
//         discard(F021_Meas_TPAD_PMEX(tpad_bg,tcrnum_bg,tcrmode_bg,
//                 llim_bg,ulim_bg,meas_value,spbool1));
//         F021_TurnOff_AllTpads;
//         Disable(s_pmexit);
//         TIME.Wait(tdelay2);
//
//          /*vrd*/
//         F021_RunTestNumber_PMEX(tnum_vrd,maxtime,spbool2);
//         TIME.Wait(tdelay);
//         F021_Set_TPADS(tcrnum_vrd,tcrmode_vrd);
//         discard(F021_Meas_TPAD_PMEX(tpad_vrd,tcrnum_vrd,tcrmode_vrd,
//                 llim_vrd,ulim_vrd,meas_value2,spbool2));
//         F021_TurnOff_AllTpads;
//         Disable(s_pmexit);
//         TIME.Wait(tdelay2);
//
//         writestring(str1,loop:1);
//         str2 = "Z_MBG_SFT_";
//         str2 = str2 + str1;
//         str3 = "Z_VRD_SFT_";
//         str3 = str3 + str1;
//
//         if(logena)  
//         {
//            TWTRealToRealMS(meas_value,realval,unitval);
//            TWPDLDataLogRealVariable(str2,unitval,realval,TWMinimumData);
//            TWTRealToRealMS(meas_value2,realval,unitval);
//            TWPDLDataLogRealVariable(str3,unitval,realval,TWMinimumData);
//         }             
//
//         if(tistdscreenprint)  
//         {
//            PrintResultParam(str2,tnum_bg,spbool1,llim_bg,ulim_bg,meas_value,GL_PLELL_FORMAT);
//            PrintResultParam(str3,tnum_vrd,spbool2,llim_vrd,ulim_vrd,meas_value2,GL_PLELL_FORMAT);
//         } 
//      }   /*for loop*/
//
//      RAM_Clear_SoftTrim_All;
//      
//   }   /*if v_any_dev_active*/
//
//   Charz_VBG_VRD_Soft = v_any_dev_active;
//}   /* Charz_VBG_VRD_Soft */
//
//
//BoolS Charz_TunOx()
//{
//   IntS site,count,tcrnum,tnum;
//   TPModeType tcrmode;
//   FloatS2D stresscond(6,6); 
//   FloatS1D stresstime(6);
//   FloatS imax;
//   prepostcorner prepost;
//   StringS str1,str2,str3,str4,current_shell;
//   StringS1D logstr(6);
//   vttype vtcat;
//   BoolS savebool;
//   BoolM tmp_results;
// 
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//         cout << "**** Charz_TunOx Stress ****" << endl;
//      cout << "**** Charz_TunOx Stress ****" << endl;
//
//#if $TP3_TO_TP5_PRESENT  
//      tcrnum = 52;;
//#else
//      tcrnum = 108;
//#endif
//      
//      tcrmode = EvfyMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode,tcrnum);
//
//       /*tcr 52*/
//       /*[tpad#,index]*/
//      stresscond[1][1] = 13.0V;  /*CG TP1*/
//      stresscond[2][1] = 0V;     /*EG/CS TP2*/
//      stresscond[3][1] = 0V;     /*BL TP3*/
//      stresscond[4][1] = 1.3V;   /*WL TP4*/
//      stresscond[5][1] = 0V;     /*dummy TP5*/
//      stresstime[1]   = 400ms;
//#if $TP3_TO_TP5_PRESENT  
//      logstr[1] = "ZO_TUNOX1_BCC1_";;
//#else
//      logstr[1] = "Z_TUNOX1_BCC1_";
//#endif
//      
//      stresscond[1][2] = 13.0V;  /*CG TP1*/
//      stresscond[2][2] = 0V;     /*EG/CS TP2*/
//      stresscond[3][2] = 0V;     /*BL TP3*/
//      stresscond[4][2] = 1.3V;   /*WL TP4*/
//      stresscond[5][2] = 0V;     /*dummy TP5*/
//      stresstime[2]   = 200ms;
//#if $TP3_TO_TP5_PRESENT  
//      logstr[2] = "ZO_TUNOX1A_BCC1_";;
//#else
//      logstr[2] = "Z_TUNOX1A_BCC1_";
//#endif
//
//      stresscond[1][3] = 13.0V;  /*CG TP1*/
//      stresscond[2][3] = 0V;     /*EG/CS TP2*/
//      stresscond[3][3] = 0V;     /*BL TP3*/
//      stresscond[4][3] = 1.3V;   /*WL TP4*/
//      stresscond[5][3] = 0V;     /*dummy TP5*/
//      stresstime[3]   = 800ms;
//#if $TP3_TO_TP5_PRESENT  
//      logstr[3] = "ZO_TUNOX1B_BCC1_";;
//#else
//      logstr[3] = "Z_TUNOX1B_BCC1_";
//#endif
//
//      stresscond[1][4] = 12.0V;  /*CG TP1*/
//      stresscond[2][4] = 0V;     /*EG/CS TP2*/
//      stresscond[3][4] = 0V;     /*BL TP3*/
//      stresscond[4][4] = 1.3V;   /*WL TP4*/
//      stresscond[5][4] = 0V;     /*dummy TP5*/
//      stresstime[4]   = 400ms;
//#if $TP3_TO_TP5_PRESENT  
//      logstr[4] = "ZO_TUNOX1C_BCC1_";;
//#else
//      logstr[4] = "Z_TUNOX1C_BCC1_";
//#endif
//      
//      stresscond[1][5] = 11.0V;  /*CG TP1*/
//      stresscond[2][5] = 0V;     /*EG/CS TP2*/
//      stresscond[3][5] = 0V;     /*BL TP3*/
//      stresscond[4][5] = 1.3V;   /*WL TP4*/
//      stresscond[5][5] = 0V;     /*dummy TP5*/
//      stresstime[5]   = 400ms;
//#if $TP3_TO_TP5_PRESENT  
//      logstr[5] = "ZO_TUNOX1D_BCC1_";;
//#else
//      logstr[5] = "Z_TUNOX1D_BCC1_";
//#endif
//      
//      Pwrupatvnom_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      str2 = "";
//      imax = 100mA;
//      
//      for (count = 1;count <= 5;count++)
//      {
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "+++++  " << logstr[count] << "  +++++" << endl;
//         } 
//         
//         Pwrupatvnom_1;
//          /*precon*/
//         tnum = TNUM_OTP_PROG;
//         TL_RunTestNum(tnum,str2);
//          /*erase*/
//     tnum = TNUM_OTP_ERS_PRECON;
//         TL_RunTestNum(tnum,str2);
//
//          /*precon*/
//         tnum = TNUM_BANK_PROG_SM;
//         TL_RunTestNum(tnum,str2);
//          /*erase*/
//         tnum = TNUM_BANK_ERS_PRECON_SW;
//         TL_RunTestNum(tnum,str2);
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PRE";
//         TL_Run_BCCVT(Null_TestName,TUNOXVT1,pre,IsMainArray,IsBcc,str1,tmp_results);
//
//         TCR.TP1_VRange[tcrnum][tcrmode] = stresscond[1][count];
//         TCR.TP1_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP1_VCharHi[tcrnum][tcrmode]= stresscond[1][count];
//         TCR.TP2_VRange[tcrnum][tcrmode] = stresscond[2][count];
//         TCR.TP2_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP2_VCharHi[tcrnum][tcrmode]= stresscond[2][count];
//         TCR.TP3_VRange[tcrnum][tcrmode] = stresscond[3][count];
//         TCR.TP3_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP3_VCharHi[tcrnum][tcrmode]= stresscond[3][count];
//         TCR.TP4_VRange[tcrnum][tcrmode] = stresscond[4][count];
//         TCR.TP4_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP4_VCharHi[tcrnum][tcrmode]= stresscond[4][count];
//         TCR.TP5_VRange[tcrnum][tcrmode] = stresscond[5][count];
//         TCR.TP5_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP5_VCharHi[tcrnum][tcrmode]= stresscond[5][count];
//
//         Pwrupatvnom_1;
//         savebool = TIIgnoreFail;
//         TIIgnoreFail = true;
//         F021_Stress_func(TNUM_BANK_TUNOX_STRESS,TunOx_Stress_Test,tcrnum,tcrmode,tmp_results);
//         TIIgnoreFail = savebool;
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PST";
//         TL_Run_BCCVT(Null_TestName,TUNOXVT1,post,IsMainArray,IsBcc,str1,tmp_results);
//      }   /*count*/
//
//      RestoreTCR_Fr_TCR128(tcrmode,tcrmode,tcrnum);
//   }   /*any_dev_active*/
//
//   Charz_TunOx = v_any_dev_active;
//}   /* Charz_TunOx */
//
//BoolS Charz_ONO()
//{
//   IntS site,count,tcrnum,tnum;
//   TPModeType tcrmode;
//   FloatS2D stresscond(6,6); 
//   FloatS1D stresstime(6);
//   FloatS imax;
//   prepostcorner prepost;
//   StringS str1,str2,str3,str4,current_shell;
//   StringS1D logstr(6);
//   vttype vtcat;
//   BoolS savebool;
//   BoolM tmp_results;
// 
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//         cout << "**** Charz_ONO Stress ****" << endl;
//      cout << "**** Charz_ONO Stress ****" << endl;
//
//      tcrnum = 53;
//      tcrmode = PvfyMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode,tcrnum);
//
//       /*[tpad#,index]*/
//      stresscond[1][1] = 13.0V;  /*CG TP1*/
//      stresscond[2][1] = 3.3V;   /*BL TP2*/
//      stresstime[1]   = 200ms;
//      logstr[1] = "Z_ONO2_BCC0_";
//
//      stresscond[1][2] = 13.0V;  /*CG TP1*/
//      stresscond[2][2] = 3.3V;   /*BL TP2*/
//      stresstime[2]   = 100ms;
//      logstr[2] = "Z_ONO2A_BCC0_";
//
//      stresscond[1][3] = 13.0V;  /*CG TP1*/
//      stresscond[2][3] = 3.3V;   /*BL TP2*/
//      stresstime[3]   = 400ms;
//      logstr[3] = "Z_ONO2B_BCC0_";
//
//      stresscond[1][4] = 12.0V;  /*CG TP1*/
//      stresscond[2][4] = 3.3V;   /*BL TP2*/
//      stresstime[4]   = 200ms;
//      logstr[4] = "Z_ONO2C_BCC0_";
//
//      stresscond[1][5] = 11.0V;  /*CG TP1*/
//      stresscond[2][5] = 3.3V;   /*BL TP2*/
//      stresstime[5]   = 200ms;
//      logstr[5] = "Z_ONO2D_BCC0_";
//
//      Pwrupatvnom_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      str2 = "";
//      imax = 100mA;
//      
//      for (count = 1;count <= 5;count++)
//      {
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "+++++  " << logstr[count] << "  +++++" << endl;
//         } 
//         
//         Pwrupatvnom_1;
//          /*erase*/
//     tnum = TNUM_OTP_ERS_PRECON;
//         TL_RunTestNum(tnum,str2);
//          /*precon*/
//         tnum = TNUM_OTP_PROG;
//         TL_RunTestNum(tnum,str2);
//
//          /*erase*/
//         tnum = TNUM_BANK_ERS_PRECON_SW;
//         TL_RunTestNum(tnum,str2);
//      /*precon*/
//         tnum = TNUM_BANK_PROG_SM;
//         TL_RunTestNum(tnum,str2);
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PRE";
//         TL_Run_BCCVT(Null_TestName,ONOVT0,pre,IsMainArray,IsBcc,str1,tmp_results);
//
//         TCR.TP1_VRange[tcrnum][tcrmode] = stresscond[1][count];
//         TCR.TP1_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP1_VCharHi[tcrnum][tcrmode]= stresscond[1][count];
//         TCR.TP2_VRange[tcrnum][tcrmode] = stresscond[2][count];
//         TCR.TP2_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP2_VCharHi[tcrnum][tcrmode]= stresscond[2][count];
//
//         Pwrupatvnom_1;
//         savebool = TIIgnoreFail;
//         TIIgnoreFail = true;
//         F021_Stress_func(TNUM_BANK_ONO_STRESS,ONO_Stress_Test,tcrnum,tcrmode,tmp_results);
//         TIIgnoreFail = savebool;
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PST";
//         TL_Run_BCCVT(Null_TestName,ONOVT0,post,IsMainArray,IsBcc,str1,tmp_results);
//      }   /*count*/
//
//      RestoreTCR_Fr_TCR128(tcrmode,tcrmode,tcrnum);
//   }   /*any_dev_active*/
//
//   Charz_ONO = v_any_dev_active;
//}   /* Charz_ONO */
//   
//BoolS Charz_ThinOx()
//{
//   IntS site,count,tcrnum,tnum;
//   TPModeType tcrmode;
//   FloatS2D stresscond(6,6); 
//   FloatS1D stresstime(6);
//   FloatS imax;
//   prepostcorner prepost;
//   StringS str1,str2,str3,str4;
//   StringS1D logstr(6);
//   vttype vtcat;
//   BoolS savebool;
//   BoolM tmp_results;
//   StringS current_shell;
// 
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//         cout << "**** Charz_ThinOx Stress ****" << endl;
//      cout << "**** Charz_ThinOx Stress ****" << endl;
//
//      tcrnum = 54;
//      tcrmode = ErsMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode,tcrnum);
//
//       /*[tpad#,index]*/
//      stresscond[1][1] = 6.5V;  /*EG/CS*/
//      stresscond[2][1] = 3.3V;  /*BL*/
//      stresstime[1]   = 1s;
//      logstr[1] = "Z_THINOX3_BCC1_";
//
//      stresscond[1][2] = 6.5V;  /*EG/CS*/
//      stresscond[2][2] = 3.3V;  /*BL*/
//      stresstime[2]   = 500ms;
//      logstr[2] = "Z_THINOX3A_BCC1_";
//
//      stresscond[1][3] = 6.5V;  /*EG/CS*/
//      stresscond[2][3] = 3.3V;  /*BL*/
//      stresstime[3]   = 2s;
//      logstr[3] = "Z_THINOX3B_BCC1_";
//
//      stresscond[1][4] = 5.5V;  /*EG/CS*/
//      stresscond[2][4] = 3.3V;  /*BL*/
//      stresstime[4]   = 1s;
//      logstr[4] = "Z_THINOX3C_BCC1_";
//
//      stresscond[1][5] = 5.0V;  /*EG/CS*/
//      stresscond[2][5] = 3.3V;  /*BL*/
//      stresstime[5]   = 1s;
//      logstr[5] = "Z_THINOX3D_BCC1_";
//
//      Pwrupatvnom_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      str2 = "";
//      imax = 100mA;
//      
//      for (count = 1;count <= 5;count++)
//      {
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "+++++  " << logstr[count] << "  +++++" << endl;
//         } 
//         
//         Pwrupatvnom_1;
//          /*precon*/
//         tnum = TNUM_OTP_PROG;
//         TL_RunTestNum(tnum,str2);
//          /*erase*/
//     tnum = TNUM_OTP_ERS_PRECON;
//         TL_RunTestNum(tnum,str2);
//
//          /*precon*/
//         tnum = TNUM_BANK_PROG_SM;
//         TL_RunTestNum(tnum,str2);
//          /*erase*/
//         tnum = TNUM_BANK_ERS_PRECON_SW;
//         TL_RunTestNum(tnum,str2);
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PRE";
//         TL_Run_BCCVT(Null_TestName,THINOXVT1,pre,IsMainArray,IsBcc,str1,tmp_results);
//
//         TCR.TP1_VRange[tcrnum][tcrmode] = stresscond[1][count];
//         TCR.TP1_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP1_VCharHi[tcrnum][tcrmode]= stresscond[1][count];
//         TCR.TP2_VRange[tcrnum][tcrmode] = stresscond[2][count];
//         TCR.TP2_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP2_VCharHi[tcrnum][tcrmode]= stresscond[2][count];
//
//         Pwrupatvnom_1;
//         savebool = TIIgnoreFail;
//         TIIgnoreFail = true;
//         F021_Stress_func(TNUM_BANK_THINOX_STRESS,ThinOx_Stress_Test,tcrnum,tcrmode,tmp_results);
//         TIIgnoreFail = savebool;
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PST";
//         TL_Run_BCCVT(Null_TestName,THINOXVT1,post,IsMainArray,IsBcc,str1,tmp_results);
//      }   /*count*/
//
//      RestoreTCR_Fr_TCR128(tcrmode,tcrmode,tcrnum);
//   }   /*any_dev_active*/
//
//   Charz_ThinOx = v_any_dev_active;
//}   /* Charz_ThinOx */
// /* KChau -- A08 temp comment out as using mix modes   
// function Charz_CSFG : boolean; export;
// var
//    site,count,tcrnum,tnum : integer;
//    tcrmode                : TPModeType;
//    stresscond             : array[1..5,1..5] of treal; 
//    stresstime             : array[1..5] of treal;
//    imax                   : treal;
//    prepost                : prepostcorner;
//    str1,str2,str3,str4    : tistring80;
//    logstr                 : array[1..5] of tistring80;
//    vtcat                  : vttype;
//    savebool               : boolean;
//    tmp_results            : msboolarray;
//    current_shell          : tistring80;
// begin 
//    if(v_any_dev_active) then
//    begin
//       if(tistdscreenprint) then
//          writeln(tiwindow,"**** Charz_CSFG Stress ****");
//       writeln("**** Charz_CSFG Stress ****");
// 
// #if $TP3_TO_TP5_PRESENT then
//       tcrnum := 84;
// #else
//       tcrnum := 110;
// #endif
//       
//       tcrmode := ProgMode;
// 
//       CloneTCR_To_TCR128(tcrmode,tcrmode,tcrnum);
// 
//       {[tpad#,index]}
//       stresscond[1,1] := 5.0V; {CG}
//       stresscond[2,1] := 5.0V; {CS}
//       stresscond[3,1] := 3.3V; {BL}
//       stresscond[4,1] := 0V;   {EG}
//       stresscond[5,1] := 0V;   {WL}
//       stresstime[1]   := 1s;
// #if $TP3_TO_TP5_PRESENT then
//       logstr[1] := "ZO_CSFG4_BCC0_";
// #else
//       logstr[1] := "Z_CSFG4_BCC0_";
// #endif
//       
//       stresscond[1,2] := 5.0V; {CG}
//       stresscond[2,2] := 5.0V; {CS}
//       stresscond[3,2] := 3.3V; {BL}
//       stresscond[4,2] := 0V;   {EG}
//       stresscond[5,2] := 0V;   {WL}
//       stresstime[2]   := 500ms;
// #if $TP3_TO_TP5_PRESENT then
//       logstr[2] := "ZO_CSFG4A_BCC0_";
// #else
//       logstr[2] := "Z_CSFG4A_BCC0_";
// #endif
//       
//       stresscond[1,3] := 5.0V; {CG}
//       stresscond[2,3] := 5.0V; {CS}
//       stresscond[3,3] := 3.3V; {BL}
//       stresscond[4,3] := 0V;   {EG}
//       stresscond[5,3] := 0V;   {WL}
//       stresstime[3]   := 2s;
// #if $TP3_TO_TP5_PRESENT then
//       logstr[3] := "ZO_CSFG4B_BCC0_";
// #else
//       logstr[3] := "Z_CSFG4B_BCC0_";
// #endif
//       
//       stresscond[1,4] := 4.5V; {CG}
//       stresscond[2,4] := 4.5V; {CS}
//       stresscond[3,4] := 3.3V; {BL}
//       stresscond[4,4] := 0V;   {EG}
//       stresscond[5,4] := 0V;   {WL}
//       stresstime[4]   := 1s;
// #if $TP3_TO_TP5_PRESENT then
//       logstr[4] := "ZO_CSFG4C_BCC0_";
// #else
//       logstr[4] := "Z_CSFG4C_BCC0_";
// #endif
//       
//       stresscond[1,5] := 4.0V; {CG}
//       stresscond[2,5] := 4.0V; {CS}
//       stresscond[3,5] := 3.3V; {BL}
//       stresscond[4,5] := 0V;   {EG}
//       stresscond[5,5] := 0V;   {WL}
//       stresstime[5]   := 1s;
// #if $TP3_TO_TP5_PRESENT then
//       logstr[5] := "ZO_CSFG4D_BCC0_";
// #else
//       logstr[5] := "Z_CSFG4D_BCC0_";
// #endif
//       
//       Pwrupatvnom_1;
//       current_shell := "FlashShell";
//       if(GL_PREVIOUS_SHELL <> current_shell) then      
//          discard(F021_LoadFlashShell_func);
//       
//       str2 := "";
//       imax := 100mA;
//       
//       for count := 1 to 5 do
//       begin
//          if(tistdscreenprint) then
//          begin
//             writeln(tiwindow);
//             writeln(tiwindow,"+++++  ",logstr[count],"  +++++");
//          end;
//          
//          Pwrupatvnom_1;
//          {erase}
//      tnum := TNUM_OTP_ERS_PRECON;
//          TL_RunTestNum(tnum,str2);
//          {precon}
//          tnum := TNUM_OTP_PROG;
//          TL_RunTestNum(tnum,str2);
// 
//      {erase}
//          tnum := TNUM_BANK_ERS_PRECON_SW;
//          TL_RunTestNum(tnum,str2);
//          {precon}
//          tnum := TNUM_BANK_PROG_SM;
//          TL_RunTestNum(tnum,str2);
// 
//          Pwrupatvmax_1;
//          str1 := concat(logstr[count],"PRE");
//          discard(TL_Run_BCCVT(Null_TestName,CSFGVT0,pre,IsMainArray,IsBcc,str1,tmp_results));
// 
//          TCR.TP1_VRange[tcrnum,tcrmode] := stresscond[1,count];
//          TCR.TP1_FTime[tcrnum,tcrmode]  := stresstime[count];
//          TCR.TP1_VCharHi[tcrnum,tcrmode]:= stresscond[1,count];
//          TCR.TP2_VRange[tcrnum,tcrmode] := stresscond[2,count];
//          TCR.TP2_FTime[tcrnum,tcrmode]  := stresstime[count];
//          TCR.TP2_VCharHi[tcrnum,tcrmode]:= stresscond[2,count];
//          TCR.TP3_VRange[tcrnum,tcrmode] := stresscond[3,count];
//          TCR.TP3_FTime[tcrnum,tcrmode]  := stresstime[count];
//          TCR.TP3_VCharHi[tcrnum,tcrmode]:= stresscond[3,count];
//          TCR.TP4_VRange[tcrnum,tcrmode] := stresscond[4,count];
//          TCR.TP4_FTime[tcrnum,tcrmode]  := stresstime[count];
//          TCR.TP4_VCharHi[tcrnum,tcrmode]:= stresscond[4,count];
//          TCR.TP5_VRange[tcrnum,tcrmode] := stresscond[5,count];
//          TCR.TP5_FTime[tcrnum,tcrmode]  := stresstime[count];
//          TCR.TP5_VCharHi[tcrnum,tcrmode]:= stresscond[5,count];
// 
//          Pwrupatvnom_1;
//          savebool := TIIgnoreFail;
//          TIIgnoreFail := true;
//          discard(F021_Stress_func(TNUM_BANK_CSFG_STRESS,CSFG_Stress_Test,tcrnum,tcrmode,tmp_results));
//          TIIgnoreFail := savebool;
// 
//          Pwrupatvmax_1;
//          str1 := concat(logstr[count],"PST");
//          discard(TL_Run_BCCVT(Null_TestName,CSFGVT0,post,IsMainArray,IsBcc,str1,tmp_results));
//       end; {count}
// 
//       RestoreTCR_Fr_TCR128(tcrmode,tcrmode,tcrnum);
//    end; {any_dev_active}
// 
//    Charz_CSFG := v_any_dev_active;
// end; { Charz_CSFG }
// */
//
// /*
// {KChau -- A08 using mix mode}
// function Charz_CSFG : boolean; export;
// var
//    site,count,tcrnum,tnum,bank : integer;
//    tcrmode                     : TPModeType;
//    stresscond                  : array[1..5,1..5] of treal; 
//    stresstime                  : array[1..5] of treal;
//    imax,llim,ulim              : treal;
//    prepost                     : prepostcorner;
//    str1,str2,str3,str4         : tistring80;
//    logstr                      : array[1..5] of tistring80;
//    vtcat                       : vttype;
//    savebool                    : boolean;
//    tmp_results                 : msboolarray;
//    current_shell               : tistring80;
//    deltaval                    : mstrealarray;
//    realval                     : MSRealArray;
//    unitval                     : TWunit;   
// begin 
//    if(v_any_dev_active) then
//    begin
//       if(tistdscreenprint) then
//          writeln(tiwindow,"**** Charz_CSFG Stress ****");
// 
//       tcrnum := 84;
//       tcrmode := ProgMode;
// 
//       logstr[1] := "CSFGBCC0_TCR84";
//       
//       Pwrupatvnom_1;
//       current_shell := "FlashShell";
//       if(GL_PREVIOUS_SHELL <> current_shell) then      
//          discard(F021_LoadFlashShell_func);
//       
//       str2 := "";
//       imax := 100mA;
//       
//       for count := 1 to 1 do
//       begin
//          if(tistdscreenprint) then
//          begin
//             writeln(tiwindow);
//             writeln(tiwindow,"+++++  ",logstr[count],"  +++++");
//          end;
//          
//          Pwrupatvnom_1;
//          {precon}
//          tnum := TNUM_FASTPRECON;
//          if(GL_DO_REDENA) then
//             tnum := tnum+TNUM_REDUNDENA;
//          TL_RunTestNum(tnum,str2);
// 
//          {precon}
//          tnum := TNUM_OTP_PROG;
//          TL_RunTestNum(tnum,str2);
// 
//          Pwrupatvmax_1;
//          str1 := concat("Pre",logstr[count]);
//          discard(TL_Run_BCCVT(Null_TestName,CSFGVT0,pre,IsMainArray,IsBcc,str1,tmp_results));
// 
//          Pwrupatvnom_1;
//          savebool := TIIgnoreFail;
//          TIIgnoreFail := true;
//          discard(F021_Stress_func(TNUM_BANK_CSFG_STRESS,CSFG_Stress_Test,tcrnum,tcrmode,tmp_results));
//          TIIgnoreFail := savebool;
// 
//          Pwrupatvmax_1;
//          str1 := concat("Pst",logstr[count]);
//          discard(TL_Run_BCCVT(Null_TestName,CSFGVT0,post,IsMainArray,IsBcc,str1,tmp_results));
// 
//          PrintHeaderParam(GL_PLELL_FORMAT);
// 
//          llim := MainBCC.LDELTA[CSFGVT0];
//          ulim := MainBCC.UDELTA[CSFGVT0];
//          str1 := "CSFGBCC0DLT_TCR84";
//          
//          for bank := 0 to F021_Flash.MAXBANK do
//          begin
//             for site := 1 to v_sites do
//                if(v_dev_active[site]) then
//                begin
//                   deltaval[site] := BANK_BCC_VALUE[bank,0,CSFGVT0,post,site]-BANK_BCC_VALUE[bank,0,CSFGVT0,pre,site];
//                   if((deltaval[site]<=llim) or (deltaval[site]>=ulim)) then
//                      tmp_results[site] := false
//                   else
//                      tmp_results[site] := true;
//                end;
//             writestring(str3,bank:1);
//             str3 := concat("_B",str3);
//             str3 := concat(str1,str3);
//             PrintResultParam(str3,0,tmp_results,LLim,ULim,deltaval,GL_PLELL_FORMAT);
//             TWTRealToRealMS(deltaval,realval,unitval);
//             TWPDLDatalogRealVariableMS(str3, unitval,realval,TWMinimumData);
//          end;
//                   
//          {erase}
//          Pwrupatvnom_1;
//          tnum := TNUM_BANK_ERS_NOPRECON;
//          TL_RunTestNum(tnum,str2);
//       end; {count}
// 
//    end; {any_dev_active}
// 
//    Charz_CSFG := v_any_dev_active;
// end; { Charz_CSFG }
//    */
//
// /*KChau 05/21/11 - changed to use vt0 instead of bcc0*/
//BoolS Charz_CSFG()
//{
//   IntS site,count,tcrnum,tnum,bank;
//   TPModeType tcrmode;
//   FloatS2D stresscond(6,6); 
//   FloatS1D stresstime(6);
//   FloatS imax,llim,ulim;
//   prepostcorner prepost;
//   StringS str1,str2,str3,str4;
//   StringS1D logstr(6);
//   vttype vtcat;
//   BoolS savebool;
//   BoolM tmp_results;
//   StringS current_shell;
//   FloatM deltaval;
//   FloatM FloatSval;
//   TWunit unitval;   
// 
//#if $TP3_TO_TP5_PRESENT  
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//         cout << "**** Charz_CSFG Stress ****" << endl;
//
//      tcrnum = 84;
//      tcrmode = ProgMode;
//
//      logstr[1] = "CSFGVT0_TCR84";
//      
//      Pwrupatvnom_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      str2 = "";
//      imax = 100mA;
//      
//      for (count = 1;count <= 1;count++)
//      {
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "+++++  " << logstr[count] << "  +++++" << endl;
//         } 
//         
//         Pwrupatvnom_1;
//          /*precon*/
//         tnum = TNUM_FASTPRECON;
//         if(GL_DO_REDENA)  
//            tnum = tnum+TNUM_REDUNDENA;
//         TL_RunTestNum(tnum,str2);
//
//          /*precon*/
//         tnum = TNUM_OTP_PROG;
//         TL_RunTestNum(tnum,str2);
//
//         Pwrupatvmax_1;
//         str1 = "Pre" + logstr[count];
//         TL_Run_BCCVT(Null_TestName,CSFGVT0,pre,IsMainArray,not IsBcc,str1,tmp_results);
//
//         Pwrupatvnom_1;
//         savebool = TIIgnoreFail;
//         TIIgnoreFail = true;
//         F021_Stress_func(TNUM_BANK_CSFG_STRESS,CSFG_Stress_Test,tcrnum,tcrmode,tmp_results);
//         TIIgnoreFail = savebool;
//
//         Pwrupatvmax_1;
//         str1 = "Pst" + logstr[count];
//         TL_Run_BCCVT(Null_TestName,CSFGVT0,post,IsMainArray,not IsBcc,str1,tmp_results);
//
//         PrintHeaderParam(GL_PLELL_FORMAT);
//
//         llim = MainVT.LDELTA[CSFGVT0];
//         ulim = MainVT.UDELTA[CSFGVT0];
//         str1 = "CSFGVT0DLT_TCR84";
//         
//         for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//         {
//            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//               if(v_dev_active[site])  
//               {
//                  deltaval[site] = BANK_VT_VALUE[bank][0][CSFGVT0][post][site]-BANK_VT_VALUE[bank][0][CSFGVT0][pre][site];
//                  if((deltaval[site]<==llim) or (deltaval[site]>==ulim))  
//                     tmp_results[site] = false;
//                  else
//                     tmp_results[site] = true;
//               } 
//            writestring(str3,bank:1);
//            str3 = "_B" + str3;
//            str3 = str1 + str3;
//            PrintResultParam(str3,0,tmp_results,LLim,ULim,deltaval,GL_PLELL_FORMAT);
//            TWTRealToRealMS(deltaval,realval,unitval);
//            TWPDLDataLogRealVariable(str3, unitval,realval,TWMinimumData);
//         } 
//                  
//          /*erase*/
//         Pwrupatvnom_1;
//         tnum = TNUM_BANK_ERS_NOPRECON;
//         TL_RunTestNum(tnum,str2);
//      }   /*count*/
//
//   }   /*any_dev_active*/
//#endif
//   Charz_CSFG = v_any_dev_active;
//}   /* Charz_CSFG */
//
//
//BoolS Charz_EGFG()
//{
//   IntS site,count,tcrnum,tnum;
//   TPModeType tcrmode;
//   FloatS2D stresscond(6,8); 
//   FloatS1D stresstime(8);
//   FloatS imax;
//   prepostcorner prepost;
//   StringS str1,str2,str3,str4;
//   StringS1D logstr(8);
//   vttype vtcat;
//   BoolS savebool;
//   BoolM tmp_results;
//   StringS current_shell;
// 
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//         cout << "**** Charz_EGFG Stress ****" << endl;
//      cout << "**** Charz_EGFG Stress ****" << endl;
//
//      tcrnum = 23;
//      tcrmode = ReadMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode,tcrnum);
//
//       /*[tpad#,index]*/
//      stresscond[1][1] = 5.0V;  /*EG*/
//      stresstime[1]   = 1s;
//      logstr[1] = "Z_EGFG5_BCC0_";
//
//      stresscond[1][2] = 4.5V;  /*EG*/
//      stresstime[2]   = 1s;
//      logstr[2] = "Z_EGFG6_BCC0_";
//
//      stresscond[1][3] = 4.0V;  /*EG*/
//      stresstime[3]   = 1s;
//      logstr[3] = "Z_EGFG7_BCC0_";
//
//      stresscond[1][4] = 4.0V;  /*EG*/
//      stresstime[4]   = 500ms;
//      logstr[4] = "Z_EGFG7A_BCC0_";
//
//      stresscond[1][5] = 4.0V;  /*EG*/
//      stresstime[5]   = 2s;
//      logstr[5] = "Z_EGFG7B_BCC0_";
//
//      stresscond[1][6] = 3.5V;  /*EG*/
//      stresstime[6]   = 1s;
//      logstr[6] = "Z_EGFG8_BCC0_";
//
//      stresscond[1][7] = 3.0V;  /*EG*/
//      stresstime[7]   = 1s;
//      logstr[7] = "Z_EGFG9_BCC0_";
//
//      Pwrupatvnom_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      str2 = "";
//      imax = 100mA;
//      
//      for (count = 1;count <= 7;count++)
//      {
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "+++++  " << logstr[count] << "  +++++" << endl;
//         } 
//         
//         Pwrupatvnom_1;
//          /*erase*/
//     tnum = TNUM_OTP_ERS_PRECON;
//         TL_RunTestNum(tnum,str2);
//          /*precon*/
//         tnum = TNUM_OTP_PROG;
//         TL_RunTestNum(tnum,str2);
//
//      /*erase*/
//         tnum = TNUM_BANK_ERS_PRECON_SW;
//         TL_RunTestNum(tnum,str2);
//          /*precon*/
//         tnum = TNUM_BANK_PROG_SM;
//         TL_RunTestNum(tnum,str2);
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PRE";
//         TL_Run_BCCVT(Null_TestName,EGFG1VT0,pre,IsMainArray,IsBcc,str1,tmp_results);
//
//         TCR.TP1_VRange[tcrnum][tcrmode] = stresscond[1][count];
//         TCR.TP1_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP1_VCharHi[tcrnum][tcrmode]= stresscond[1][count];
//         TCR.TP2_VRange[tcrnum][tcrmode] = stresscond[2][count];
//         TCR.TP2_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP2_VCharHi[tcrnum][tcrmode]= stresscond[2][count];
//
//         Pwrupatvnom_1;
//         savebool = TIIgnoreFail;
//         TIIgnoreFail = true;
//         F021_Stress_func(TNUM_BANK_EGS,EGFG1_Stress_Test,tcrnum,tcrmode,tmp_results);
//         TIIgnoreFail = savebool;
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PST";
//         TL_Run_BCCVT(Null_TestName,EGFG1VT0,post,IsMainArray,IsBcc,str1,tmp_results);
//      }   /*count*/
//
//      RestoreTCR_Fr_TCR128(tcrmode,tcrmode,tcrnum);
//   }   /*any_dev_active*/
//
//   Charz_EGFG = v_any_dev_active;
//}   /* Charz_EGFG */
//   
//BoolS Charz_PgmFF()
//{
//   IntS site,count,tcrnum,tnum;
//   TPModeType tcrmode;
//   FloatS2D stresscond(6,6); 
//   FloatS1D stresstime(6);
//   FloatS imax;
//   prepostcorner prepost;
//   StringS str1,str2,str3,str4;
//   StringS1D logstr(6);
//   vttype vtcat;
//   BoolS savebool;
//   BoolM tmp_results;
//   StringS current_shell;
// 
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//         cout << "**** Charz_PgmFF Stress ****" << endl;
//      cout << "**** Charz_PgmFF Stress ****" << endl;
//      
//#if $TP3_TO_TP5_PRESENT  
//      tcrnum = 52;
//      logstr[1] = "ZO_PGMFF10_BCC1_";
//#else
//      tcrnum = 107;
//      logstr[1] = "Z_PGMFF10_BCC1_";
//#endif
//      
//      tcrmode = ProgMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode,tcrnum);
//
//       /*tcr 52*/
//       /*[tpad#,index]*/
//      stresscond[1][1] = 12.2V;  /*CG TP1*/
//      stresscond[2][1] = 5.1V;     /*EG/CS TP2*/
//      stresscond[3][1] = 3.3V;     /*BL TP3*/
//      stresscond[4][1] = 1.3V;   /*WL TP4*/
//      stresscond[5][1] = 0V;     /*dummy TP5*/
//      stresstime[1]   = 41ms;
//
//      Pwrupatvnom_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      str2 = "";
//      imax = 100mA;
//      
//      for (count = 1;count <= 1;count++)
//      {
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "+++++  " << logstr[count] << "  +++++" << endl;
//         } 
//         
//         Pwrupatvnom_1;
//          /*precon*/
//         tnum = TNUM_OTP_PROG;
//         TL_RunTestNum(tnum,str2);
//          /*erase*/
//     tnum = TNUM_OTP_ERS_PRECON;
//         TL_RunTestNum(tnum,str2);
//
//          /*precon*/
//         tnum = TNUM_BANK_PROG_SM;
//         TL_RunTestNum(tnum,str2);
//          /*erase*/
//         tnum = TNUM_BANK_ERS_PRECON_SW;
//         TL_RunTestNum(tnum,str2);
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PRE";
//         TL_Run_BCCVT(Null_TestName,PGMFFVT1,pre,IsMainArray,IsBcc,str1,tmp_results);
//
//         TCR.TP1_VRange[tcrnum][tcrmode] = stresscond[1][count];
//         TCR.TP1_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP1_VCharHi[tcrnum][tcrmode]= stresscond[1][count];
//         TCR.TP2_VRange[tcrnum][tcrmode] = stresscond[2][count];
//         TCR.TP2_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP2_VCharHi[tcrnum][tcrmode]= stresscond[2][count];
//         TCR.TP3_VRange[tcrnum][tcrmode] = stresscond[3][count];
//         TCR.TP3_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP3_VCharHi[tcrnum][tcrmode]= stresscond[3][count];
//         TCR.TP4_VRange[tcrnum][tcrmode] = stresscond[4][count];
//         TCR.TP4_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP4_VCharHi[tcrnum][tcrmode]= stresscond[4][count];
//         TCR.TP5_VRange[tcrnum][tcrmode] = stresscond[5][count];
//         TCR.TP5_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP5_VCharHi[tcrnum][tcrmode]= stresscond[5][count];
//
//         Pwrupatvnom_1;
//         savebool = TIIgnoreFail;
//         TIIgnoreFail = true;
//         F021_Stress_func(TNUM_BANK_PGMFF_STRESS,PGMFF_Stress_Test,tcrnum,tcrmode,tmp_results);
//         TIIgnoreFail = savebool;
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PST";
//         TL_Run_BCCVT(Null_TestName,PGMFFVT1,post,IsMainArray,IsBcc,str1,tmp_results);
//      }   /*count*/
//
//      RestoreTCR_Fr_TCR128(tcrmode,tcrmode,tcrnum);
//   }   /*any_dev_active*/
//
//   Charz_PgmFF = v_any_dev_active;
//}   /* Charz_PgmFF */
//   
//BoolS Charz_FGWL()
//{
//   IntS site,count,tcrnum,tnum;
//   TPModeType tcrmode;
//   FloatS2D stresscond(6,7); 
//   FloatS1D stresstime(7);
//   FloatS imax;
//   prepostcorner prepost;
//   StringS str1,str2,str3,str4;
//   StringS1D logstr(7);
//   vttype vtcat;
//   BoolS savebool;
//   BoolM tmp_results;
//   StringS current_shell;
// 
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//         cout << "**** Charz_FGWL Stress ****" << endl;
//      cout << "**** Charz_FGWL Stress ****" << endl;
//
//#if $TP3_TO_TP5_PRESENT  
//      tcrnum = 52;;
//#else
//      tcrnum = 107;
//#endif
//   
//      tcrmode = PvfyMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode,tcrnum);
//
//       /*[tpad#,index]*/
//      stresscond[1][1] = 13.5V;  /*CG TP1*/
//      stresscond[2][1] = 3.1V;     /*EG/CS TP2*/
//      stresscond[3][1] = 3.3V;     /*BL TP3*/
//      stresscond[4][1] = 1.3V;   /*WL TP4*/
//      stresscond[5][1] = 0V;     /*dummy TP5*/
//      stresstime[1]   = 512ms;
//#if $TP3_TO_TP5_PRESENT  
//      logstr[1] = "ZO_FGWL11_BCC1_";;
//#else
//      logstr[1] = "Z_FGWL11_BCC1_";
//#endif
//      
//      stresscond[1][2] = 13.5V;  /*CG TP1*/
//      stresscond[2][2] = 3.1V;     /*EG/CS TP2*/
//      stresscond[3][2] = 3.3V;     /*BL TP3*/
//      stresscond[4][2] = 1.3V;   /*WL TP4*/
//      stresscond[5][2] = 0V;     /*dummy TP5*/
//      stresstime[2]   = 8.2s;
//#if $TP3_TO_TP5_PRESENT  
//      logstr[2] = "ZO_FGWL12_BCC1_";;
//#else
//      logstr[2] = "Z_FGWL12_BCC1_";
//#endif
//      
//      stresscond[1][3] = 13.5V;  /*CG TP1*/
//      stresscond[2][3] = 3.1V;     /*EG/CS TP2*/
//      stresscond[3][3] = 3.3V;     /*BL TP3*/
//      stresscond[4][3] = 1.3V;   /*WL TP4*/
//      stresscond[5][3] = 0V;     /*dummy TP5*/
//      stresstime[3]   = 82ms;
//#if $TP3_TO_TP5_PRESENT  
//      logstr[3] = "ZO_FGWL12A_BCC1_";;
//#else
//      logstr[3] = "Z_FGWL12A_BCC1_";
//#endif
//      
//      stresscond[1][4] = 13.5V;  /*CG TP1*/
//      stresscond[2][4] = 3.1V;     /*EG/CS TP2*/
//      stresscond[3][4] = 3.3V;     /*BL TP3*/
//      stresscond[4][4] = 1.3V;   /*WL TP4*/
//      stresscond[5][4] = 0V;     /*dummy TP5*/
//      stresstime[4]   = 164ms;
//#if $TP3_TO_TP5_PRESENT  
//      logstr[4] = "ZO_FGWL12B_BCC1_";;
//#else
//      logstr[4] = "Z_FGWL12B_BCC1_";
//#endif
//
//      stresscond[1][5] = 13.0V;  /*CG TP1*/
//      stresscond[2][5] = 3.1V;     /*EG/CS TP2*/
//      stresscond[3][5] = 3.3V;     /*BL TP3*/
//      stresscond[4][5] = 1.3V;   /*WL TP4*/
//      stresscond[5][5] = 0V;     /*dummy TP5*/
//      stresstime[5]   = 41ms;
//      logstr[5] = "Z_FGWL12C_BCC1_";
//
//      stresscond[1][6] = 13.0V;  /*CG TP1*/
//      stresscond[2][6] = 3.1V;     /*EG/CS TP2*/
//      stresscond[3][6] = 3.3V;     /*BL TP3*/
//      stresscond[4][6] = 1.3V;   /*WL TP4*/
//      stresscond[5][6] = 0V;     /*dummy TP5*/
//      stresstime[6]   = 82ms;
//#if $TP3_TO_TP5_PRESENT  
//      logstr[6] = "ZO_FGWL12D_BCC1_";;
//#else
//      logstr[6] = "Z_FGWL12D_BCC1_";
//#endif
//      
//      Pwrupatvnom_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      str2 = "";
//      imax = 100mA;
//      
//      for (count = 1;count <= 6;count++)
//      {
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "+++++  " << logstr[count] << "  +++++" << endl;
//         } 
//         
//         Pwrupatvnom_1;
//          /*precon*/
//         tnum = TNUM_OTP_PROG;
//         TL_RunTestNum(tnum,str2);
//          /*erase*/
//     tnum = TNUM_OTP_ERS_PRECON;
//         TL_RunTestNum(tnum,str2);
//
//          /*precon*/
//         tnum = TNUM_BANK_PROG_SM;
//         TL_RunTestNum(tnum,str2);
//          /*erase*/
//         tnum = TNUM_BANK_ERS_PRECON_SW;
//         TL_RunTestNum(tnum,str2);
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PRE";
//         TL_Run_BCCVT(Null_TestName,FGWLVT1,pre,IsMainArray,IsBcc,str1,tmp_results);
//
//         TCR.TP1_VRange[tcrnum][tcrmode] = stresscond[1][count];
//         TCR.TP1_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP1_VCharHi[tcrnum][tcrmode]= stresscond[1][count];
//         TCR.TP2_VRange[tcrnum][tcrmode] = stresscond[2][count];
//         TCR.TP2_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP2_VCharHi[tcrnum][tcrmode]= stresscond[2][count];
//         TCR.TP3_VRange[tcrnum][tcrmode] = stresscond[3][count];
//         TCR.TP3_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP3_VCharHi[tcrnum][tcrmode]= stresscond[3][count];
//         TCR.TP4_VRange[tcrnum][tcrmode] = stresscond[4][count];
//         TCR.TP4_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP4_VCharHi[tcrnum][tcrmode]= stresscond[4][count];
//         TCR.TP5_VRange[tcrnum][tcrmode] = stresscond[5][count];
//         TCR.TP5_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP5_VCharHi[tcrnum][tcrmode]= stresscond[5][count];
//
//         Pwrupatvnom_1;
//         savebool = TIIgnoreFail;
//         TIIgnoreFail = true;
//         F021_Stress_func(TNUM_BANK_PGMFF_STRESS,FGWL_Stress_Test,tcrnum,tcrmode,tmp_results);
//         TIIgnoreFail = savebool;
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PST";
//         TL_Run_BCCVT(Null_TestName,FGWLVT1,post,IsMainArray,IsBcc,str1,tmp_results);
//      }   /*count*/
//
//      RestoreTCR_Fr_TCR128(tcrmode,tcrmode,tcrnum);
//
//   }   /*any_dev_active*/
//
//   Charz_FGWL = v_any_dev_active;
//}   /* Charz_FGWL */
//   
//BoolS Charz_RdDisturb()
//{
//   IntS site,count,tcrnum,tnum;
//   TPModeType tcrmode;
//   FloatS2D stresscond(6,8); 
//   FloatS1D stresstime(8);
//   FloatS imax;
//   prepostcorner prepost;
//   StringS str1,str2,str3,str4;
//   StringS1D logstr(8);
//   vttype vtcat;
//   BoolS savebool;
//   BoolM tmp_results;
//   StringS current_shell;
// 
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//         cout << "**** Charz_RDISTB Stress ****" << endl;
//      cout << "**** Charz_RDISTB Stress ****" << endl;
//
//      tcrnum = 58;
//      tcrmode = ReadMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode,tcrnum);
//
//       /*[tpad#,index]*/
//      stresscond[1][1] = 4.5V;  /*EG*/
//      stresstime[1]   = 50ms;
//      logstr[1] = "Z_RDISTB13_BCC0_";
//
//      stresscond[1][2] = 4.5V;  /*EG*/
//      stresstime[2]   = 100ms;
//      logstr[2] = "Z_RDISTB13A_BCC0_";
//
//      stresscond[1][3] = 4.5V;  /*EG*/
//      stresstime[3]   = 25ms;
//      logstr[3] = "Z_RDISTB13B_BCC0_";
//
//      stresscond[1][4] = 4.5V;  /*EG*/
//      stresstime[4]   = 150ms;
//      logstr[4] = "Z_RDISTB13C_BCC0_";
//
//      stresscond[1][5] = 4.75V;  /*EG*/
//      stresstime[5]   = 50ms;
//      logstr[5] = "Z_RDISTB13D_BCC0_";
//
//      stresscond[1][6] = 4.0V;  /*EG*/
//      stresstime[6]   = 50ms;
//      logstr[6] = "Z_RDISTB13E_BCC0_";
//
//      Pwrupatvnom_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      str2 = "";
//      imax = 100mA;
//      
//      for (count = 1;count <= 6;count++)
//      {
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "+++++  " << logstr[count] << "  +++++" << endl;
//         } 
//         
//         Pwrupatvnom_1;
//          /*erase*/
//     tnum = TNUM_OTP_ERS_PRECON;
//         TL_RunTestNum(tnum,str2);
//          /*precon*/
//         tnum = TNUM_OTP_PROG;
//         TL_RunTestNum(tnum,str2);
//
//          /*erase*/
//     tnum = TNUM_OTP_ERS_PRECON;
//         TL_RunTestNum(tnum,str2);
//          /*precon*/
//         tnum = TNUM_BANK_PROG_SM;
//         TL_RunTestNum(tnum,str2);
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PRE";
//         TL_Run_BCCVT(Null_TestName,RDDISTBVT0,pre,IsMainArray,IsBcc,str1,tmp_results);
//
//         TCR.TP1_VRange[tcrnum][tcrmode] = stresscond[1][count];
//         TCR.TP1_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP1_VCharHi[tcrnum][tcrmode]= stresscond[1][count];
//
//         Pwrupatvnom_1;
//         savebool = TIIgnoreFail;
//         TIIgnoreFail = true;
//         F021_Stress_func(TNUM_BANK_RDDIST_STRESS,RdDistb_Stress_Test,tcrnum,tcrmode,tmp_results);
//         TIIgnoreFail = savebool;
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PST";
//         TL_Run_BCCVT(Null_TestName,RDDISTBVT0,post,IsMainArray,IsBcc,str1,tmp_results);
//      }   /*count*/
//
//      RestoreTCR_Fr_TCR128(tcrmode,tcrmode,tcrnum);
//   }   /*any_dev_active*/
//
//   Charz_RdDisturb = v_any_dev_active;
//}   /* Charz_RdDisturb */
//   
//BoolS Charz_RdDisturb2_Time()
//{
//   IntS site,count,tcrnum,tnum,bank;
//   TPModeType tcrmode;
//   FloatS2D stresscond(6,8); 
//   FloatS1D stresstime(8);
//   FloatS imax,llimit,ulimit;
//   prepostcorner prepost;
//   StringS str1,str2,str3,str4;
//   StringS1D logstr(8);
//   vttype vtcat;
//   BoolS savebool;
//   BoolM tmp_results;
//   FloatM1D save_bccmain(8),save_bccred(8);
//   FloatM main_dltval,red_dltval;
//   FloatM FloatSval;
//   TWunit unitval;
// 
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//         cout << "**** Charz_RDISTB2 Time Stress ****" << endl;
//
//      tcrnum = 58;
//      tcrmode = PvfyMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode,tcrnum);
//
//       /*[tpad#,index]*/
//      stresscond[1][1] = 5.0V;  /*EG*/
//      stresstime[1]   = 1.95s;
//      logstr[1] = "Z_RDISTB2_1P95S_BCC0_";
//
//      for (count = 1;count <= 1;count++)
//      {
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "+++++  " << logstr[count] << "  +++++" << endl;
//         } 
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PRE";
//         TL_Run_BCCVT(Null_TestName,RDDISTB2VT0,pre,IsMainArray,IsBcc,str1,tmp_results);
//
//          /*save normal post-rddistvt0 as pre*/
//         for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            save_bccmain[bank] = BANK_BCC_VALUE[bank][0][RDDISTB2VT0][pre];
//
//         TCR.TP1_VRange[tcrnum][tcrmode] = stresscond[1][count];
//         TCR.TP1_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP1_VCharHi[tcrnum][tcrmode]= stresscond[1][count];
//
//         Pwrupatvnom_1;
//         savebool = TIIgnoreFail;
//         TIIgnoreFail = true;
//         F021_Stress_func(TNUM_BANK_RDDIST_STRESS,RdDistb2_Stress_Test,tcrnum,tcrmode,tmp_results);
//         TIIgnoreFail = savebool;
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PST";
//         TL_Run_BCCVT(Null_TestName,RDDISTB2VT0,post,IsMainArray,IsBcc,str1,tmp_results);
//
//          /*calc delta*/
//         if(tistdscreenprint)  
//         {
//            PrintHeaderParam(GL_PLELL_FORMAT);
//            llimit = MainBCC.LDELTA[RDDISTB2VT0];
//            ulimit = MainBCC.UDELTA[RDDISTB2VT0];
//         } 
//
//         for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//         {
//            arraysubtreal(main_dltval,BANK_BCC_VALUE[bank][0][RDDISTB2VT0][post],save_bccmain[bank],v_sites);
//            writestring(str2,bank:1);
//            str2 = "_B" + str2;
//            str3 = logstr[count] + "DLT";
//            str4 = str3 + str2;
//            TWTRealToRealMS(main_dltval,realval,unitval);
//            TWPDLDataLogRealVariable(str4, unitval,realval,TWMinimumData);
//            if(tistdscreenprint)  
//               PrintResultParam(str4,0,tmp_results,LLimit,ULimit,main_dltval,GL_PLELL_FORMAT);
//         } 
//         
//      }   /*count*/
//
//      RestoreTCR_Fr_TCR128(tcrmode,tcrmode,tcrnum);
//   }   /*any_dev_active*/
//
//   Charz_RdDisturb2_Time = v_any_dev_active;
//}   /* Charz_RdDisturb2_Time */
//   
//   
//BoolS Charz_PunThru()
//{
//   IntS site,count,tcrnum,tnum;
//   TPModeType tcrmode;
//   FloatS2D stresscond(6,6); 
//   FloatS1D stresstime(6);
//   FloatS imax;
//   prepostcorner prepost;
//   StringS str1,str2,str3,str4;
//   StringS1D logstr(6);
//   vttype vtcat;
//   BoolS savebool;
//   BoolM tmp_results;
//   StringS current_shell;
// 
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//         cout << "**** Charz_PunThru Stress ****" << endl;
//      cout << "**** Charz_PunThru Stress ****" << endl;
//
//      tcrnum = 54;
//      tcrmode = PvfyMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode,tcrnum);
//
//       /*[tpad#,index]*/
//      stresscond[1][1] = 5.1V;  /*EG/CS*/
//      stresscond[2][1] = 0.6V;  /*BL*/
//      stresstime[1]   = 560us;
//      logstr[1] = "Z_PUNTHRU15_BCC1_";
//
//      stresscond[1][2] = 5.1V;  /*EG/CS*/
//      stresscond[2][2] = 0.6V;  /*BL*/
//      stresstime[2]   = 1.2ms;
//      logstr[2] = "Z_PUNTHRU15A_BCC1_";
//
//      stresscond[1][3] = 5.1V;  /*EG/CS*/
//      stresscond[2][3] = 0.6V;  /*BL*/
//      stresstime[3]   = 2.4ms;
//      logstr[3] = "Z_PUNTHRU15B_BCC1_";
//
//      stresscond[1][4] = 5.1V;  /*EG/CS*/
//      stresscond[2][4] = 0.6V;  /*BL*/
//      stresstime[4]   = 5ms;
//      logstr[4] = "Z_PUNTHRU15C_BCC1_";
//
//      Pwrupatvnom_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      str2 = "";
//      imax = 100mA;
//      
//      for (count = 1;count <= 4;count++)
//      {
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "+++++  " << logstr[count] << "  +++++" << endl;
//         } 
//         
//         Pwrupatvnom_1;
//          /*precon*/
//         tnum = TNUM_OTP_PROG;
//         TL_RunTestNum(tnum,str2);
//          /*erase*/
//     tnum = TNUM_OTP_ERS_PRECON;
//         TL_RunTestNum(tnum,str2);
//
//      /*precon*/
//         tnum = TNUM_BANK_PROG_SM;
//         TL_RunTestNum(tnum,str2);
//          /*erase*/
//         tnum = TNUM_BANK_ERS_PRECON_SW;
//         TL_RunTestNum(tnum,str2);
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PRE";
//         TL_Run_BCCVT(Null_TestName,PUNTHRUVT1,pre,IsMainArray,IsBcc,str1,tmp_results);
//
//         TCR.TP1_VRange[tcrnum][tcrmode] = stresscond[1][count];
//         TCR.TP1_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP1_VCharHi[tcrnum][tcrmode]= stresscond[1][count];
//         TCR.TP2_VRange[tcrnum][tcrmode] = stresscond[2][count];
//         TCR.TP2_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP2_VCharHi[tcrnum][tcrmode]= stresscond[2][count];
//
//         Pwrupatvnom_1;
//         savebool = TIIgnoreFail;
//         TIIgnoreFail = true;
//         F021_Stress_func(TNUM_BANK_PTHRU_STRESS,PunThru_Stress_Test,tcrnum,tcrmode,tmp_results);
//         TIIgnoreFail = savebool;
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PST";
//         TL_Run_BCCVT(Null_TestName,PUNTHRUVT1,post,IsMainArray,IsBcc,str1,tmp_results);
//      }   /*count*/
//
//      RestoreTCR_Fr_TCR128(tcrmode,tcrmode,tcrnum);
//   }   /*any_dev_active*/
//
//   Charz_PunThru = v_any_dev_active;
//}   /* Charz_PunThru */
//   
//BoolS Charz_RevTun()
//{
//   IntS site,count,tcrnum,tnum;
//   TPModeType tcrmode;
//   FloatS2D stresscond(6,6); 
//   FloatS1D stresstime(6);
//   FloatS imax;
//   prepostcorner prepost;
//   StringS str1,str2,str3,str4;
//   StringS1D logstr(6);
//   vttype vtcat;
//   BoolS savebool;
//   BoolM tmp_results;
//   StringS current_shell;
// 
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//         cout << "**** Charz_RevTun Stress ****" << endl;
//      cout << "**** Charz_RevTun Stress ****" << endl;
//
//      tcrnum = 54;
//      tcrmode = ProgMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode,tcrnum);
//
//       /*[tpad#,index]*/
//      stresscond[1][1] = 5.1V;  /*EG/CS*/
//      stresscond[2][1] = 3.3V;  /*BL*/
//      stresstime[1]   = 286ms;
//      logstr[1] = "Z_REVTUN16_BCC1_";
//
//      stresscond[1][2] = 5.1V;  /*EG/CS*/
//      stresscond[2][2] = 3.3V;  /*BL*/
//      stresstime[2]   = 512ms;
//      logstr[2] = "Z_REVTUN16A_BCC1_";
//
//      stresscond[1][3] = 5.1V;  /*EG/CS*/
//      stresscond[2][3] = 3.3V;  /*BL*/
//      stresstime[3]   = 1s;
//      logstr[3] = "Z_REVTUN16B_BCC1_";
//
//      stresscond[1][4] = 5.1V;  /*EG/CS*/
//      stresscond[2][4] = 3.3V;  /*BL*/
//      stresstime[4]   = 2s;
//      logstr[4] = "Z_REVTUN16C_BCC1_";
//
//
//      Pwrupatvnom_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      str2 = "";
//      imax = 100mA;
//      
//      for (count = 1;count <= 4;count++)
//      {
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "+++++  " << logstr[count] << "  +++++" << endl;
//         } 
//         
//         Pwrupatvnom_1;
//          /*precon*/
//         tnum = TNUM_OTP_PROG;
//         TL_RunTestNum(tnum,str2);
//          /*erase*/
//     tnum = TNUM_OTP_ERS_PRECON;
//         TL_RunTestNum(tnum,str2);
//
//      /*precon*/
//         tnum = TNUM_BANK_PROG_SM;
//         TL_RunTestNum(tnum,str2);
//          /*erase*/
//         tnum = TNUM_BANK_ERS_PRECON_SW;
//         TL_RunTestNum(tnum,str2);
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PRE";
//         TL_Run_BCCVT(Null_TestName,REVTUNVT1,pre,IsMainArray,IsBcc,str1,tmp_results);
//
//         TCR.TP1_VRange[tcrnum][tcrmode] = stresscond[1][count];
//         TCR.TP1_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP1_VCharHi[tcrnum][tcrmode]= stresscond[1][count];
//         TCR.TP2_VRange[tcrnum][tcrmode] = stresscond[2][count];
//         TCR.TP2_FTime[tcrnum][tcrmode]  = stresstime[count];
//         TCR.TP2_VCharHi[tcrnum][tcrmode]= stresscond[2][count];
//
//         Pwrupatvnom_1;
//         savebool = TIIgnoreFail;
//         TIIgnoreFail = true;
//         F021_Stress_func(TNUM_BANK_REVTUNN_STRESS,RevTun_Stress_Test,tcrnum,tcrmode,tmp_results);
//         TIIgnoreFail = savebool;
//
//         Pwrupatvmax_1;
//         str1 = logstr[count] + "PST";
//         TL_Run_BCCVT(Null_TestName,REVTUNVT1,post,IsMainArray,IsBcc,str1,tmp_results);
//      }   /*count*/
//
//      RestoreTCR_Fr_TCR128(tcrmode,tcrmode,tcrnum);
//   }   /*any_dev_active*/
//
//   Charz_RevTun = v_any_dev_active;
//}   /* Charz_RevTun */
//
//BoolS Charz_CSFG_IVT()
//{
//   IntS site,bank,stnum,tnum;
//   FloatS llim,ulim,ttimer1,ttimer2;
//   FloatM vtval,tt_timer;
//   StringS str1,str2,str3,str4;
//   BoolM tmp_results;
//   StringS current_shell;
//   FloatM FloatSval;
//   TWunit unitval;
//   BoolS logena;
// 
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//         cout << "**** Charz_CSFG_IVT ****" << endl;
//      
//      Pwrupatvmax_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      str1 = "Z_PRECSFGIVT0";
//      stnum = 0x52800000;
//      llim = 3.5V;
//      ulim = 6.5V;
//
//      timernstart(ttimer1);
//
//      PrintHeaderParam(GL_PLELL_FORMAT);
//      
//      for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//      {
//         timernstart(ttimer2);
//         tnum = stnum+(bank<<4);
//         MeasInternalVT(tnum,llim,ulim,tmp_results,vtval);
//         ttimer2 = timernread(ttimer2);
//
//         writestring(str2,bank:1);
//         str2 = "_B" + str2;
//         str2 = str1 + str2;
//         PrintResultParam(str2,tnum,tmp_results,LLim,ULim,vtval,GL_PLELL_FORMAT);
//         
//         if(logena)  
//         {
//            TWTRealToRealMS(vtval,realval,unitval);
//            TWPDLDataLogRealVariable(str2, unitval,realval,TWMinimumData);
//            str3 = str2 + "_TT";
//            tt_timer = ttimer2;
//            TWTRealToRealMS(tt_timer,realval,unitval);
//            TWPDLDataLogRealVariable(str3, unitval,realval,TWMinimumData);
//         } 
//      } 
//
//      ttimer1 = timernread(ttimer1);
//      if(logena)  
//      {
//         str3 = str1 + "_TT";
//         tt_timer = ttimer1;
//         TWTRealToRealMS(tt_timer,realval,unitval);
//         TWPDLDataLogRealVariable(str3, unitval,realval,TWMinimumData);
//      } 
//
//      if(tistdscreenprint)  
//         cout << str1 << " TT " << ttimer1 << endl;
//   }   /*any_dev_active*/
//
//   Charz_CSFG_IVT = v_any_dev_active;
//}   /* Charz_CSFG_IVT */
//
//BoolS Charz_PreDRL_IVT()
//{
//   IntS site,bank,stnum,tnum;
//   IntS count,sblk,eblk;
//   FloatS llim,ulim,ttimer1,ttimer2;
//   FloatM vtval,tt_timer;
//   StringS str1,str2,str3,str4,str5;
//   BoolM tmp_results;
//   StringS current_shell;
//   FloatM FloatSval;
//   TWunit unitval;
//   BoolS logena;
// 
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//         cout << "**** Charz_PreDRL_IVT ****" << endl;
//      
//      Pwrupatvmax_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      str1 = "Z_PREDRLIVT0";
//      stnum = 0x52002100;
//      llim = 3.5V;
//      ulim = 6.5V;
//      logena = true;
//
//      timernstart(ttimer1);
//
//      PrintHeaderParam(GL_PLELL_FORMAT);
//      
//      for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//      {
//         sblk = 0;
//         eblk = F021_Flash.MAXSECT[bank];
//         tnum = stnum+(bank<<4);
//         writestring(str2,bank:1);
//         str2 = "_B" + str2;
//
//         for (count = sblk;count <= eblk;count++)
//         {
//            timernstart(ttimer2);
//            MeasInternalVT(tnum,llim,ulim,tmp_results,vtval);
//            ttimer2 = timernread(ttimer2);
//            
//            writestring(str3,count:1);
//            str3 = "S" + str3;
//            str4 = str1 + str2;
//            str4 = str4 + str3;
//            PrintResultParam(str4,tnum,tmp_results,LLim,ULim,vtval,GL_PLELL_FORMAT);
//            
//            if(logena)  
//            {
//               TWTRealToRealMS(vtval,realval,unitval);
//               TWPDLDataLogRealVariable(str4, unitval,realval,TWMinimumData);
//               str5 = str4 + "_TT";
//               tt_timer = ttimer2;
//               TWTRealToRealMS(tt_timer,realval,unitval);
//               TWPDLDataLogRealVariable(str5, unitval,realval,TWMinimumData);
//            } 
//            tnum = tnum+1;
//         }   /*for count*/
//      } 
//
//      ttimer1 = timernread(ttimer1);
//      if(logena)  
//      {
//         str3 = str1 + "_TT";
//         tt_timer = ttimer1;
//         TWTRealToRealMS(tt_timer,realval,unitval);
//         TWPDLDataLogRealVariable(str3, unitval,realval,TWMinimumData);
//      } 
//
//      if(tistdscreenprint)  
//         cout << str1 << " TT " << ttimer1 << endl;
//   }   /*any_dev_active*/
//
//   Charz_PreDRL_IVT = v_any_dev_active;
//}   /* Charz_PreDRL_IVT */
//
// /*internal measure iref nmos/pmos & vcg*/
//BoolS Charz_Internal_Iref_VCG()
//{
//   IntS tcrnum,ssample;
//   TPModeType tcrmode;
//   StringS str1;
//   Vcornertype vcorner;
//
//   if(v_any_dev_active)  
//   {
//      ssample = 1;
//      vcorner = VMN;
//      
//      tcrnum  = 28;
//      tcrmode = ReadMode;
//      str1 = "Z_INTER_IREFRD_MN";
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_INTERNAL_IREF_READ_EVEN,
//              TNUM_BANK_INTERNAL_IREF_READ_ODD,ssample,true,str1));
//      tcrmode = PvfyMode;
//      str1 = "Z_INTER_IREFPV_MN";
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_INTERNAL_IREF_PVFY_EVEN,
//              TNUM_BANK_INTERNAL_IREF_PVFY_ODD,ssample,true,str1));
//      tcrmode = EvfyMode;
//      str1 = "Z_INTER_IREFEV_MN";
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_INTERNAL_IREF_EVFY_EVEN,
//              TNUM_BANK_INTERNAL_IREF_EVFY_ODD,ssample,true,str1));
//      tcrmode = CvfyMode;
//      str1 = "Z_INTER_IREFCV_MN";
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_INTERNAL_IREF_CVFY_EVEN,
//              TNUM_BANK_INTERNAL_IREF_CVFY_ODD,ssample,true,str1));
//
//      tcrnum  = 29;
//      tcrmode = ReadMode;
//      str1 = "Z_INTER_IREFM0_MN";
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_INTERNAL_IREF_RDM0_EVEN,
//              TNUM_BANK_INTERNAL_IREF_RDM0_ODD,ssample,true,str1));
//      
//      tcrnum  = 30;
//      tcrmode = ReadMode;
//      str1 = "Z_INTER_IREFM1_MN";
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_INTERNAL_IREF_RDM1_EVEN,
//              TNUM_BANK_INTERNAL_IREF_RDM1_ODD,ssample,true,str1));
//      
//      tcrnum  = 43;
//      tcrmode = ReadMode;
//      str1 = "Z_INTER_IPMOSRD_MN";
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_INTERNAL_IPMOS_READ_EVEN,
//              TNUM_BANK_INTERNAL_IPMOS_READ_ODD,ssample,true,str1));
//      tcrmode = PvfyMode;
//      str1 = "Z_INTER_IPMOSPV_MN";
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_INTERNAL_IPMOS_PVFY_EVEN,
//              TNUM_BANK_INTERNAL_IPMOS_PVFY_ODD,ssample,true,str1));
//      tcrmode = EvfyMode;
//      str1 = "Z_INTER_IPMOSEV_MN";
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_INTERNAL_IPMOS_EVFY_EVEN,
//              TNUM_BANK_INTERNAL_IPMOS_EVFY_ODD,ssample,true,str1));
//      tcrmode = CvfyMode;
//      str1 = "Z_INTER_IPMOSCV_MN";
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_INTERNAL_IPMOS_CVFY_EVEN,
//              TNUM_BANK_INTERNAL_IPMOS_CVFY_ODD,ssample,true,str1));
//
//      tcrnum  = 44;
//      tcrmode = ReadMode;
//      str1 = "Z_INTER_IPMOSM0_MN";
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_INTERNAL_IPMOS_RDM0_EVEN,
//              TNUM_BANK_INTERNAL_IPMOS_RDM0_ODD,ssample,true,str1));
//      
//      tcrnum  = 45;
//      tcrmode = ReadMode;
//      str1 = "Z_INTER_IPMOSM1_MN";
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_INTERNAL_IPMOS_RDM1_EVEN,
//              TNUM_BANK_INTERNAL_IPMOS_RDM1_ODD,ssample,true,str1));
//      
//   } 
//   Charz_Internal_Iref_VCG = v_any_dev_active;
//}   /* Charz_Internal_Iref_VCG */
//   
//BoolS Charz_Ers_StairStep(IntS splitnum)
//{
//   const IntS ONESTEPCT = 32; 
//
//   IntM start_ct,stop_ct;
//   IntS ctoffset,maxep;
//   IntS banknum,sectnum,tnum;
//   FloatS maxtime;
//   BoolS logena;
//   StringS logstr,current_shell,str1,str2,str3;
//
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//      {
//         cout << "**** Charz_Ers_StairStep_";
//         cout << splitnum:-2 << " ****" << endl;
//      } 
//
//      Pwrupatvnom_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      logena   = true;
//      maxtime  = GL_F021_SECT_PGM_MAXTIME;
//      
//       /*ArrayCopyInteger(start_ct,VHV_ER_CT_STARTSAVED,v_sites);*/
//      start_ct = VHV_ER_CT_TRIMSAVED;
//      stop_ct = VHV_ER_CT_TRIMSAVED;
//
//      switch(splitnum) {
//        case 1 :  
//               ctoffset = 5*ONESTEPCT;
//               maxep    = 1;
//               str1 = "Z_ESS1_B0S0";
//               str2 = "Z_ESS1_B1S0";
//             break; 
//        case 2 :  
//               ctoffset = 4*ONESTEPCT;
//               maxep    = 1;
//               str1 = "Z_ESS2_B0S0";
//               str2 = "Z_ESS2_B1S0";
//             break; 
//        case 3 :  
//               ctoffset = 3*ONESTEPCT;
//               maxep    = 1;
//               str1 = "Z_ESS3_B0S0";
//               str2 = "Z_ESS3_B1S0";
//             break; 
//        case 4 :  
//               ctoffset = 5*ONESTEPCT;
//               maxep    = 2;
//               str1 = "Z_ESS4_B0S0";
//               str2 = "Z_ESS4_B1S0";
//             break; 
//        case 5 :  
//               ctoffset = 4*ONESTEPCT;
//               maxep    = 2;
//               str1 = "Z_ESS5_B0S0";
//               str2 = "Z_ESS5_B1S0";
//             break; 
//        case 6 :  
//               ctoffset = 3*ONESTEPCT;
//               maxep    = 2;
//               str1 = "Z_ESS6_B0S0";
//               str2 = "Z_ESS6_B1S0";
//             break; 
//        case 7 :  
//               ctoffset = 5*ONESTEPCT;
//               maxep    = 4;
//               str1 = "Z_ESS7_B0S0";
//               str2 = "Z_ESS7_B1S0";
//             break; 
//        case 8 :  
//               ctoffset = 4*ONESTEPCT;
//               maxep    = 4;
//               str1 = "Z_ESS8_B0S0";
//               str2 = "Z_ESS8_B1S0";
//             break; 
//        case 9 :  
//               ctoffset = 3*ONESTEPCT;
//               maxep    = 4;
//               str1 = "Z_ESS9_B0S0";
//               str2 = "Z_ESS9_B1S0";
//            } 
//        otherwise {
//               ctoffset = 5*ONESTEPCT;
//               maxep    = 1;
//               str1 = "Z_ESS1_B0S0";
//               str2 = "Z_ESS1_B1S0";
//            } 
//      }   /* case */
//               
//      banknum  = 0;
//      sectnum  = 0;
//      tnum = TNUM_SECT_PRECON + (banknum<<4) + sectnum;
//      f021_runtestnumber(tnum,maxtime,spare_mstreal1,spare_msbool1);
//      str3 = str1 + "_PRECON";
//      PrintHeaderBool(GL_PLELL_FORMAT);
//      PrintResultBool(str3,tnum,spare_msbool1,GL_PLELL_FORMAT);
//      logstr = str1;
//      TL_StairStep_Erase(banknum,sectnum,start_ct,stop_ct,ctoffset,maxep,logena,logstr);
//
//      banknum  = 1;
//      sectnum  = 0;
//      tnum = TNUM_SECT_PRECON + (banknum<<4) + sectnum;
//      f021_runtestnumber(tnum,maxtime,spare_mstreal1,spare_msbool1);
//      str3 = str2 + "_PRECON";
//      PrintHeaderBool(GL_PLELL_FORMAT);
//      PrintResultBool(str3,tnum,spare_msbool1,GL_PLELL_FORMAT);
//      logstr   = str2;
//      TL_StairStep_Erase(banknum,sectnum,start_ct,stop_ct,ctoffset,maxep,logena,logstr);
//
//      GL_CHARZ_ESTAIRSTEP_SAVECOUNT = GL_CHARZ_ESTAIRSTEP_COUNT;
//      GL_CHARZ_ESTAIRSTEP_COUNT = GL_CHARZ_ESTAIRSTEP_COUNT + 1;
//      if(GL_CHARZ_ESTAIRSTEP_COUNT>9)  
//         GL_CHARZ_ESTAIRSTEP_COUNT = 1;
//   } 
//   Charz_Ers_StairStep = v_any_dev_active;
//}   /* Charz_Ers_StairStep */
//   
//BoolS Charz_Ers_StairStep_1()
//{
//   Charz_Ers_StairStep(1);
//   Charz_Ers_StairStep_1 = v_any_dev_active;
//}   /* Charz_Ers_StairStep_1 */
//   
//BoolS Charz_Ers_StairStep_2()
//{
//   Charz_Ers_StairStep(2);
//   Charz_Ers_StairStep_2 = v_any_dev_active;
//}   /* Charz_Ers_StairStep_2 */
//   
//BoolS Charz_Ers_StairStep_3()
//{
//   Charz_Ers_StairStep(3);
//   Charz_Ers_StairStep_3 = v_any_dev_active;
//}   /* Charz_Ers_StairStep_3 */
//   
//BoolS Charz_Ers_StairStep_4()
//{
//   Charz_Ers_StairStep(4);
//   Charz_Ers_StairStep_4 = v_any_dev_active;
//}   /* Charz_Ers_StairStep_4 */
//   
//BoolS Charz_Ers_StairStep_5()
//{
//   Charz_Ers_StairStep(5);
//   Charz_Ers_StairStep_5 = v_any_dev_active;
//}   /* Charz_Ers_StairStep_5 */
//   
//BoolS Charz_Ers_StairStep_6()
//{
//   Charz_Ers_StairStep(6);
//   Charz_Ers_StairStep_6 = v_any_dev_active;
//}   /* Charz_Ers_StairStep_6 */
//   
//BoolS Charz_Ers_StairStep_7()
//{
//   Charz_Ers_StairStep(7);
//   Charz_Ers_StairStep_7 = v_any_dev_active;
//}   /* Charz_Ers_StairStep_7 */
//   
//BoolS Charz_Ers_StairStep_8()
//{
//   Charz_Ers_StairStep(8);
//   Charz_Ers_StairStep_8 = v_any_dev_active;
//}   /* Charz_Ers_StairStep_8 */
//   
//BoolS Charz_Ers_StairStep_9()
//{
//   Charz_Ers_StairStep(9);
//   Charz_Ers_StairStep_9 = v_any_dev_active;
//}   /* Charz_Ers_StairStep_9 */
   
TMResultM Charz_FreqSchmoo_RandCode(VCornerType vcorner) {
   TMResultM final_results;
   IntS stnum,tnum,bank,wstate;
   IntS loop,minloop,maxloop;
   FloatS fstart,fstop,finc;
   BoolS autoWstate,enapll,enapipe;
   BoolS doena,twlogena;
   StringS str1,filestr,current_shell;
//   DCSetUp prevDCSU;

//   SetupGet(prevDCSU);
   final_results = TM_PASS;
   minloop = 0;
   maxloop = 2;
   twlogena = true;
   filestr = "";  /*dump schmoo to file. not yet implemented*/
   doena = true;

   for (bank = 0; bank <= F021_Flash.MAXBANK; ++bank) {
   
      if (F021_Flash.EMUBANK[bank]) stnum = 0x4C11BA00  ; // rd psa
      else                          stnum = TNUM_EXEC_RANDCODE;

      if (doena) {
         tnum = stnum+(bank<<4);
         for (loop = minloop; loop <= maxloop; ++loop) {
            switch(loop) {
               case 0 :  
                  if (F021_Flash.EMUBANK[bank]) { 
                     switch(vcorner) {
                        case VMN: case VMNO: case VMNE:   
                           fstart = 100MHz;
                           fstop  = 250MHz;
                           finc   = 5MHz;
                           break; 
                        default:  
                           fstart = 200MHz;
                           fstop  = 250MHz;
                           finc   = 5MHz;
                           break;
                     }      
                  } 
                  else {
                     switch(vcorner) {
                        case VMN: case VMNO: case VMNE :   
                           fstart = 30MHz;
                           fstop  = 80MHz;
                           finc   = 1MHz;
                           break; 
                        default:  
                           fstart = 40MHz;
                           fstop  = 100MHz;
                           finc   = 1MHz;
                         break; 
                     }
                  }
                  autoWstate = false;
                  wstate = 0;
                  enapll = true;
                  enapipe = false;
                  str1 = "Z_RCOD_0WS";
               case 1:
                  if (F021_Flash.EMUBANK[bank]) {
                     switch(vcorner) {
                        case VMN: case VMNO: case VMNE:   
                           fstart = 100MHz;
                           fstop  = 250MHz;
                           finc   = 5MHz;
                           break; 
                        default:  
                           fstart = 100MHz;
                           fstop  = 250MHz;
                           finc   = 5MHz;
                           break; 
                     }
                  }
                  else {
                     switch(vcorner) {
                        case VMN: case VMNO: case VMNE:   
                           fstart = 70MHz;
                           fstop  = 170MHz;
                           finc   = 5MHz;
                           break; 
                        default:  
                           fstart = 100MHz;
                           fstop  = 200MHz;
                           finc   = 5MHz;
                           break; 
                     }
                  } 
                  autoWstate = false;
                  wstate = 1;
                  enapll = true;
                  enapipe = true;
                  str1 = "Z_RCOD_1WS";
               case 2:
                  if (F021_Flash.EMUBANK[bank]) {
                     switch(vcorner) {
                        case VMN: case VMNO: case VMNE:   
                           fstart = 100MHz;
                           fstop  = 250MHz;
                           finc   = 5MHz;
                           break; 
                        default:  
                           fstart = 100MHz;
                           fstop  = 250MHz;
                           finc   = 5MHz;
                           break; 
                     }
                  }
                  else {
                     switch(vcorner) {
                        case VMN: case VMNO: case VMNE:   
                           fstart = 100MHz;
                           fstop  = 200MHz;
                           finc   = 5MHz;
                           break; 
                        default:  
                           fstart = 100MHz;
                           fstop  = 250MHz;
                           finc   = 5MHz;
                           break; 
                     }
                  } 
                  autoWstate = false;
                  wstate = 2;
                  enapll = true;
                  enapipe = true;
                  str1 = "Z_RCOD_2WS";
            }   // switch loop
          TL_Schmoo_Freq(vcorner,tnum,fstart,fstop,finc,enapll,autoWstate,wstate,enapipe,twlogena,str1,filestr);
            // The next 7 lines were commented out in the original VLCT code
            // powerdownall;
            // wait(1ms);
            // PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
            // ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,v[vih_loose_osc_vnom],v[vil_loose]);
            // clockpinset(s_clk_1a,s_clock);
            // discard(patternexecute(spareint1,f021_shell_loadpat));
            // discard(f021_runtestnumber(tnum_always_pass,1s,spare_mstreal1,spare_msbool1));*/
         }   // for loop
      }   // doena
   }   // bank

//   SetupSelect(prevDCSU,norm_fmsu);
   return(final_results);
}  //  Charz_FreqSchmoo_RandCode
   
//BoolS FreqSchmoo_RandCode()
//{
//   BoolS dovmin,dovmax;
//
//   if(v_any_dev_active)  
//   {
//      dovmin = true;
//      dovmax = true;
//      if(dovmin)  
//         Charz_FreqSchmoo_RandCode(VMN);
//      if(dovmax)  
//         Charz_FreqSchmoo_RandCode(VMX);
//   } 
//   
//   FreqSchmoo_RandCode = v_any_dev_active;
//}   /* FreqSchmoo_RandCode */

TMResultM Charz_SenAmpNoise_RPC_EF(VCornerType vcorner, BoolS pgmena) {
   TMResultM final_results;
   StringS current_shell,str1,str2;
   StringS tname;
   IntS tcrnum,tdata,ttarget;
   FloatS vcg;
   BoolS redundena,dopgm;
   IntS i,sindex,eindex,tnum;
   IntS ovr_efind,ovr_efval;
   StringS1D logstr(16);
   BoolS donoef,doef17,doef22,doef22_17;
   Levels PS_Vmin = "PowerUpAtVmask";
   Levels PS_Vnom = "PowerUpAtVmask";
   Levels PS_Vmax = "PowerUpAtVmask";

   tcrnum  = 6;
   tdata   = TNUM_DATA_ECHK;
   ttarget = TNUM_TARGET_QUAD;
   vcg     = 0V;
   tname   = "NULL_TestName";
   redundena = false;
   dopgm = pgmena ;   // true

   if (dopgm) {
      PS_Vnom.Execute();
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      tnum = TNUM_BANK_PROG_SM + tdata;
      if (redundena)  
         tnum = tnum + TNUM_REDUNDENA;
      TL_RunTestNum(tnum,"");
   } 

   switch(vcorner) {
      case  VMN: case VMNO: case VMNE :   
         PS_Vmin.Execute();
         str2 = "Z_SAN_VMN_";
         break; 
      case  VNM: case VNMO: case VNME :   
         PS_Vnom.Execute();
         str2 = "Z_SAN_VNM_";
         break; 
      case  VMX: case VMXO: case VMXE :   
         PS_Vmax.Execute();
         str2 = "Z_SAN_VMX_";
         break; 
      default:  
         PS_Vnom.Execute();
         str2 = "Z_SAN_VNM_";
         break;            
   }   // case

   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      final_results = F021_LoadFlashShell_func();

   dopgm = false;
   sindex = 1;  // was 0
   eindex = 1;  // was 7;

   donoef = true;
   if (donoef) {
      // vary rpc, EF17=0
      logstr[0] = "PC0";
      logstr[1] = "PC1";
      logstr[2] = "PC2";
      logstr[3] = "PC3";
      logstr[4] = "PC4";
      logstr[5] = "PC5";
      logstr[6] = "PC6";
      logstr[7] = "PC7";
      ovr_efind = 0x0;
      ovr_efval = 0x0;
      for (i = sindex;i <= eindex;i++) {
         str1 = str2 + logstr[i];
 //        discard(SAMP_Noise_Screen_func(tname,tcrnum,tdata,ttarget,vcg,redundena,final_results,dopgm,i,ovr_efind,ovr_efval,str1));
      } 
   } 
   
   doef17 = false;
   if (doef17) {
      // vary rpc, EF17=1
      logstr[0] = "F17PC0";
      logstr[1] = "F17PC1";
      logstr[2] = "F17PC2";
      logstr[3] = "F17PC3";
      logstr[4] = "F17PC4";
      logstr[5] = "F17PC5";
      logstr[6] = "F17PC6";
      logstr[7] = "F17PC7";
      ovr_efind = 0x00020000;
      ovr_efval = 0x00020000;
      for (i = sindex;i <= eindex;i++) {
         str1 = str2 + logstr[i];
 //        discard(SAMP_Noise_Screen_func(tname,tcrnum,tdata,ttarget,vcg,redundena,final_results,dopgm,i,ovr_efind,ovr_efval,str1));
      } 
   } 

   doef22 = false;
   if (doef22) {
      // vary rpc, EF22=1
      logstr[0] = "F22PC0";
      logstr[1] = "F22PC1";
      logstr[2] = "F22PC2";
      logstr[3] = "F22PC3";
      logstr[4] = "F22PC4";
      logstr[5] = "F22PC5";
      logstr[6] = "F22PC6";
      logstr[7] = "F22PC7";
      ovr_efind = 0x00400000;
      ovr_efval = 0x00400000;
      for (i = sindex;i <= eindex;i++) {
         str1 = str2 + logstr[i];
//         discard(SAMP_Noise_Screen_func(tname,tcrnum,tdata,ttarget,vcg,redundena,final_results,dopgm,i,ovr_efind,ovr_efval,str1));
      } 
   } 

   doef22_17 = false;
   if (doef22_17) {
      // vary rpc, EF22=1, EF17=1
      logstr[0] = "F22F17PC0";
      logstr[1] = "F22F17PC1";
      logstr[2] = "F22F17PC2";
      logstr[3] = "F22F17PC3";
      logstr[4] = "F22F17PC4";
      logstr[5] = "F22F17PC5";
      logstr[6] = "F22F17PC6";
      logstr[7] = "F22F17PC7";
      ovr_efind = 0x00420000;
      ovr_efval = 0x00420000;
      for (i = sindex;i <= eindex;i++) {
         str1 = str2 + logstr[i];
//         discard(SAMP_Noise_Screen_func(tname,tcrnum,tdata,ttarget,vcg,redundena,final_results,dopgm,i,ovr_efind,ovr_efval,str1));
      } 
   } 
   return(final_results);
}   /* Charz_SenAmpNoise_RPC_EF */

TMResultM Charz_Run_BCC_SAMP_ACCY(vttype vt_type) {
   IntS site,bank,testnum,stnum;
   FloatM Istart,Istop,vforce,vt_values,spare_mstreal1;
   FloatS ires,maxtime,llimit,ulimit;
   StringS str1,str2;
   TMResultM tmp_results;
   FloatM FloatSval;
//   TWunit unitval;

   maxtime = GL_F021_BANK_VT_MAXTIME;
   Istart = MainBCC.SSTART[vt_type][pre];
   Istop = MainBCC.SSTOP[vt_type][pre];
   ires = MainBCC.SRESOL[vt_type][pre];
   vforce = 5V;
   stnum = TNUM_TCR6+MainBCC.IRATIO[vt_type][pre]+MainBCC.TDATA[vt_type]+MainBCC.RDOPTION[vt_type][pre]+TNUM_TARGET_QUAD;
   llimit = MainBCC.LLIM[vt_type][pre];
   ulimit = MainBCC.ULIM[vt_type][pre];
   str1 = "Z_SAACCY_BCC0";

//   PrintHeaderParam(GL_PLELL_FORMAT);
   GL_DO_SAVE_SAMP_ACCY_DATA = true;
   for (bank = 0; bank <= F021_Flash.MAXBANK; ++bank) {
      testnum = stnum+(bank<<4);
      F021_BCC_BinSearch_TTR(testnum,Istart,Istop,ires,vforce,maxtime,spare_mstreal1,vt_values);
      
      str2 = "_B" + str2;
//      str2 = CONV.IntToString(bankcount);  // Bug IntToStr can't convert zero (SPR142812)
      if ( bank == 0 ) str2 += "0";
      else             str2 += CONV.IntToString(bank);
      str2 = str1 + str2;
      
//      TWTRealToRealMS(vt_values,realval,unitval);
//      TWPDLDataLogRealVariable(str2, unitval,realval,TWMinimumData);
      if(tistdscreenprint) {
         tmp_results = TM_NOTEST;
         for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
//            if(v_dev_active[site])  
               if((vt_values[*si]>=llimit) and (vt_values[*si]<=ulimit))  
                  tmp_results[*si] = TM_PASS;
         }
//         PrintResultParam(str2,testnum,tmp_results,LLimit,ULimit,vt_values,GL_PLELL_FORMAT);
      } 
   }   /*for bank*/
   GL_DO_SAVE_SAMP_ACCY_DATA = false;
   return(tmp_results);
}   /* Charz_Run_BCC_SAMP_ACCY */

TMResultM Charz_Run_IVT_SAMP_ACCY(vttype vt_type) {
   IntS site,bank,testnum,stnum;
   FloatM Istart,Istop,vforce,vt_values;
   FloatS ires,maxtime,llimit,ulimit;
   StringS str1,str2;
   TMResultM tmp_results;

   maxtime = GL_F021_BANK_VT_MAXTIME;
   Istart = MainVT.SSTART[vt_type][pre];
   Istop = MainVT.SSTOP[vt_type][pre];
   ires = MainVT.SRESOL[vt_type][pre];
   vforce = 20uA;
   llimit = MainVT.LLIM[vt_type][pre];
   ulimit = MainVT.ULIM[vt_type][pre];
   // stnum := TNUM_TCR5+MainVT.IRATIO[vt_type,pre]+MainVT.TDATA[vt_type]+MainVT.RDOPTION[vt_type,pre]+TNUM_TARGET_QUAD;
   stnum = TNUM_TCR72+MainVT.TDATA[vt_type]+MainVT.RDOPTION[vt_type][pre]+TNUM_TARGET_QUAD;
   str1 = "Z_SAACCY_IVT0";

//   PrintHeaderParam(GL_PLELL_FORMAT);
   GL_DO_SAVE_SAMP_ACCY_DATA = true;
   for (bank = 0; bank <= F021_Flash.MAXBANK; ++bank) {
      testnum = stnum+(bank<<4);
      MeasInternalVT(testnum,llimit,ulimit,tmp_results, vt_values);
      if (tistdscreenprint) {
//         tmp_results = false;
//         for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//               if((vt_values[site]>==llimit) and (vt_values[site]<==ulimit))  
//                  tmp_results[site] = true;
//               else
//                  tmp_results[site] = false;
//                  
         str2 = "_B";
//       tmpstr2 = CONV.IntToString(bankcount);  // Bug IntToStr can't convert zero (SPR142812)
         if ( bank == 0 ) str2 += "0";
         else             str2 += CONV.IntToString(bank);
         str2 = str1 + str2;
//         PrintResultParam(str2,testnum,tmp_results,LLimit,ULimit,vt_values,GL_PLELL_FORMAT);
      } 
   }  // for bank
   GL_DO_SAVE_SAMP_ACCY_DATA = false;
   return(tmp_results);
}   // Charz_Run_IVT_SAMP_ACCY

//BoolS Charz_RDM0_NMOS(VCornerType vcorner,
//                         IntS bkgnddata)
//{
//   BoolM final_results;
//   StringS current_shell,str1,str2;
//   IntS ovr_efind,ovr_efval;
//
//   if(v_any_dev_active)  
//   {
//      switch(vcorner) {
//        case  VMN: case VMNO: case VMNE :   
//           pwrupatvmin_1;
//         break; 
//        case  VNM: case VNMO: case VNME :   
//           pwrupatvnom_1;
//         break; 
//        case  VMX: case VMXO: case VMXE :   
//           pwrupatvmax_1;
//         break; 
//        default:  
//           pwrupatvnom_1;
//         break;            
//      }   /* case */
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      str1 = "Z_RDM0";
//      ovr_efind = 0x00020000;
//      ovr_efval = 0x00020000;
//      TL_SWEEP_RDM0_NMOS_EF(bkgnddata,false,ovr_efind,ovr_efval,true,true,str1);
//
//      str2 = "Z_RDM0_F17";
//      ovr_efind = 0x00020000;
//      ovr_efval = 0x00020000;
//      TL_SWEEP_RDM0_NMOS_EF(bkgnddata,true,ovr_efind,ovr_efval,false,true,str2);
//   } 
//   Charz_RDM0_NMOS = v_any_dev_active;
//}   /* Charz_RDM0_NMOS */
//   
//BoolS Charz_PVFY(VCornerType vcorner,
//                    IntS bkgnddata)
//{
//   BoolM final_results;
//   StringS current_shell,str1,str2;
//   IntS ovr_efind,ovr_efval;
//
//   if(v_any_dev_active)  
//   {
//      switch(vcorner) {
//        case  VMN: case VMNO: case VMNE :   
//           pwrupatvmin_1;
//         break; 
//        case  VNM: case VNMO: case VNME :   
//           pwrupatvnom_1;
//         break; 
//        case  VMX: case VMXO: case VMXE :   
//           pwrupatvmax_1;
//         break; 
//        default:  
//           pwrupatvnom_1;
//         break;            
//      }   /* case */
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      str1 = "Z_PV";
//      TL_PVFY_EF(bkgnddata,false,0,0,true,str1);
//
//      str2 = "Z_PV_F22";
//      ovr_efind = 0x00400000;
//      ovr_efval = 0x00400000;
//      TL_PVFY_EF(bkgnddata,true,ovr_efind,ovr_efval,true,str2);
//   } 
//   Charz_PVFY = v_any_dev_active;
//} 
//   
//                         
// /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

//TMResultM Flash_ISleep_func()
//{
//   // use levels objects
//   //PowerUpDn(PWRUP_VMAX);
//
//   return TM_PASS;
//}   /* Flash_ISleep_func */
   

//TMResultM Flash_IStdby_func()
//{
////   function did absolutely nothing in VLCT either
//   return TM_PASS;
//}   /* Flash_IStdby_func */

TMResultM FlashEfuse_MP1_func()
{
   const IntS BANK_EF_LEN = 32; 
   const IntS PUMP_EF_LEN = 30; 
   const IntS IND_VBG_MSB = 1; // reduced by 1
   const IntS IND_VBG_LSB = 6; // reduced by 1
   const IntS IND_FOSC_MSB = 8; // reduced by 1
   const IntS IND_FOSC_LSB = 13; // reduced by 1
   const IntS IND_IREF_USB = 15; // reduced by 1
   const IntS IND_IREF_LSB = 19; // reduced by 1
   const IntS IND_IREF_MSB = 21; // reduced by 1
   const IntS IND_VHVSLCT_MSB = 22; // reduced by 1
   const IntS IND_VHVSLCT_LSB = 25; // reduced by 1
   const IntS IND_VSA5CT_MSB = 26; // reduced by 1
   const IntS IND_VSA5CT_LSB = 29; // reduced by 1
   const IntS FOSC_MAXEFUSE = 6; 

   TMResultM tmp_results,final_results;
   TMResultM marg_results,cmp_results;
   Sites savesites;
   FloatS tdelay,ttimer;
   StringS tname;
//   StringS tmpstr3,tmpstr1,tmpstr2;
   IntS banklen,auxlen,mainlen,count;
   StringS hex_actstr,hex_expstr;
   StringS actlabel,explabel;
   StringS bit0_4_str,bit5_9_str,bit10_23_str;
   StringS bit24_28_str,bit29_31_str;
   StringS tmp_str,tmpstr1, tmp_expstr;
   IntS pmos_trimsol,tvalue;
   TMResultM ipmos_cmp_results;
//   BoolS all_bank_trimmed;
   StringS bank_expstr,main_expstr;
   StringS bank_str,main_str;
   StringS read_code_option;
//   StringS dummstr1,dummstr2,dummstr3,dummstr4;
   StringM reverse_expStr,rdStr,flnullstr;
   IntM eferrcode;

   TI_FlashCOFEna = GL_SAVEFLCOFENA;
   F021_InitFLEfuseStr();
      
   tdelay = 2ms;
   TIME.StartTimer();

   tname = "FlashEfuseRd_Test";

   final_results = TM_NOTEST;
   tmp_results = TM_PASS; // set to FAIL later, if needed

   savesites = ActiveSites;
   GL_FLASH_RETEST = false;
   SITE_IPMOS_TRIMMED = false;
   MAINBG_TRIMSAVED = 0;
   MAINIREF_TRIMSAVED = 0;
   FOSC_TRIMSAVED = 0;
   VHV_SLPCT_TRIMSAVED = 0;
   VSA5CT_TRIMSAVED = 0;

// delay probably not needed since we set levels in Levels object 
// instead of here
//   TIME.Wait(tdelay);

   flnullstr = instData[NonMBist].nullChainStr[0][0][0];  /*[ctlr,blk,seg]*/
   
   if(GL_EFUSE_RD_CODEOPTION != "")  
   {
      read_code_option = GL_EFUSE_RD_CODEOPTION;
   }
   else
   {
      read_code_option = "F021";
      if(tistdscreenprint)  
      {
         cout << endl;
         cout << "!!! WARNING: GL_EFUSE_RD_CODEOPTION is not defined !!!" << endl;
         cout << "!!! Setting it to \"F021\" not using SCRAM option    !!!" << endl;
         cout << endl;
      } 
   } 
   eferrcode = ReadFuseROM(read_code_option, NonMBist, Mg1A, flnullstr, margFlashChainStr, tmp_results);

   for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
      if((eferrcode[*si] == 0x15) || (eferrcode[*si] == 0x5))    /*single/double bit error*/
         tmp_results[*si] = TM_FAIL;
         
   // No need to accumulate yet since final_results hasn't been set yet
   final_results = tmp_results;

    /*reverse and save efuse str (lsb-msb) for later use*/
   SaveFlashProgString = margFlashChainStr;
   for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
   {
      if(tmp_results[*si]==TM_PASS)  
         for (count = 0;count <= F021_Flash.MAXBANK;count++)
            BANK_TO_PMOS_TRIM[*si][count] = true;  /*set for trim later*/
      if(tistdscreenprint and TI_FlashDebug)  
         cout << "Site" << *si << " margFlashChainStr = " << margFlashChainStr[*si] << endl;
   }

    /*if any site fail, then extract & determine if failing site has*/
    /*valid trim solution & must passing marg rd as well.*/
    /*efuse bits can be either 0s or 1s are: main/aux bandgap,iref.*/
    /*remaining efuse bits should be 0s so compare them.*/
   if (tmp_results.AnyEqual(TM_FAIL))  
   {
      Sites new_active_sites = ActiveSites;
      new_active_sites.DisableFailingSites(tmp_results.Equal(TM_FAIL));
      // no need to use non-Runtime SetActiveSites since we don't care about the return
      // value. There should be no way to get here and have all sites disabled
      // since we know at least one site has to be TM_FAIL.
      RunTime.SetActiveSites(new_active_sites);

      // set to fail later if they fail
      marg_results = TM_PASS;
      cmp_results = TM_PASS;
      ipmos_cmp_results = TM_PASS;
      
      if(tistdscreenprint)  
         cout << "Checking Flash eFuse Chain that has already" << 
                 " trimmed for valid value and margin read ... " << endl;
      
      banklen = (F021_Flash.MAXBANK+1)*BANK_EF_LEN;
      mainlen = PUMP_EF_LEN;  /*hdpump*/
      
      reverse_expStr = margFlashChainStr;
      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
      {
         SITE site = si.GetValue();

         if(tistdscreenprint and TI_FlashDebug)  
            cout << "Site : " << site << "  Flash Chain (msb-lsb) : " << reverse_expStr[site] << endl;
         

          /*----- extract & compare BANK STR -----*/
         bank_expstr = BANK_EFSTR[site];  /*all 0s*/
         bank_str = reverse_expStr[site].Substring(mainlen, banklen); // removed +1...pascal starts strings at 1
         
          /*check if virgin bank*/
         if(bank_str==bank_expstr)  
         {
             /*+++ all banks=0s +++*/
            for (count = 0;count <= F021_Flash.MAXBANK;count++)
               BANK_TO_PMOS_TRIM[site][count] = true;  /*set for trim later*/
         }
         else if(!GL_DO_IREF_PMOS_TRIM)  
         {
             /*+++ all banks<>0s so failed +++*/
            ipmos_cmp_results[site] = TM_FAIL;
            final_results[site] = TM_FAIL;
            SITE_IPMOS_TRIMMED[site] = true;   /*set as already trimmed*/
            for (count = 0;count <= F021_Flash.MAXBANK;count++)
               BANK_TO_PMOS_TRIM[site][count] = false;
         }
         else
         {
             /*+++ all banks<>0s but do pmos trim so check bit0:4, bit10:23, and bit5:9, bit24:28, bit29:31 for each bank +++*/
            for (count = 0;count <= F021_Flash.MAXBANK;count++)
            {
               tmp_str = bank_str.Substring(count*BANK_EF_LEN, BANK_EF_LEN); /*extract indiv bank actual bits*/
       
               if(tistdscreenprint)  
                  cout << "Site" << site << "Bank " << count << " efstr " << tmp_str << endl;
                  
               tmp_expstr = bank_expstr.Substring(count*BANK_EF_LEN, BANK_EF_LEN); /*32 bits of 0s*/

                /*+++ individual bank has not trimmed, i.e. all 0s +++*/
               if(tmp_str==tmp_expstr)  
                  BANK_TO_PMOS_TRIM[site][count] = true  ; /*set for trim later*/
               else
               {
                  /*+++ non-0s so check for trim correctness +++*/
                  /*bit31=msb,bit0=lsb*/
                  bit0_4_str = bank_str.Substring(count*BANK_EF_LEN+27, 5);
                  bit5_9_str = bank_str.Substring(count*BANK_EF_LEN+22, 5);
                  bit10_23_str = bank_str.Substring(count*BANK_EF_LEN+8, 14);
                  bit24_28_str = bank_str.Substring(count*BANK_EF_LEN+3, 5);
                  bit29_31_str = bank_str.Substring(count*BANK_EF_LEN, 3);
                  tmp_str = bit5_9_str; /*msb-lsb*/
                   
                   /*tmp_str:=stringreverse(bit5_9_str);} {msb-lsb*/
                  pmos_trimsol =  int(BinStringToUnsigned(tmp_str, true));
                  
                  if((bit0_4_str==BANKEF_BIT0_4) && ((bit10_23_str==BANKEF_BIT10_23) || (bit10_23_str==BANKEF_BIT10_23_BANKNUM[count])) &&
                     (bit29_31_str==BANKEF_BIT29_31))  
                  {
                     BANK_TO_PMOS_TRIM[site][count] = false;
                  }
                  else
                  {
                     SITE_IPMOS_TRIMMED[site] = true;   /*set as already trimmed*/
                     BANK_TO_PMOS_TRIM[site][count] = false;
                     ipmos_cmp_results[site] = TM_FAIL;
                     final_results[site] = TM_FAIL;
                     if(not RunAllTests)  
                        break;  /*out of for count loop*/
                  }   /*if-else trim correctness*/
               }   /*if-else tmp_str/tmp_expstr*/
            }   /*for count*/

             /*determine if all banks trimmed*/
            if((!SITE_IPMOS_TRIMMED[site]) && (ipmos_cmp_results[site] == TM_PASS))  
            {
               bool all_bank_trimmed = true;
               for (count = 0;count <= F021_Flash.MAXBANK;count++)
                  if(BANK_TO_PMOS_TRIM[site][count])  
                  {
                     all_bank_trimmed = false;
                     break;
                  } 
               if(all_bank_trimmed)  
                  SITE_IPMOS_TRIMMED[site] = true;
            } 
         }   /*if-else banks<>0 & gl_do_iref_pmos_trim*/
         
         
          /*----- extract & compare PUMP STR -----*/
         main_expstr = MAINBG_EFSTR[site];
         main_str = reverse_expStr[site].Substring(0, mainlen);
     
         if(tistdscreenprint)  
            cout << "Pump efstr " << main_str << endl;
            
          /*bgap: bit0 is bgap soft trim enable, bit[1:6]=vbg*/
         for (count = IND_VBG_MSB;count <= IND_VBG_LSB;count++)
            main_expstr[count] = main_str[count];
         tvalue = int(BinStringToUnsigned(main_str.Substring(IND_VBG_MSB, GL_MAINBG_MAXEFUSE), true));
         MAINBG_TRIMSAVED[site] = tvalue;
         
         
          /*iref: bit[15:19,21]*/
         for (count = IND_IREF_USB;count <= IND_IREF_LSB;count++)
            main_expstr[count] = main_str[count];
         main_expstr[IND_IREF_MSB] = main_str[IND_IREF_MSB];
         tmpstr1 = main_str.Substring(IND_IREF_MSB, 1) + main_str.Substring(IND_IREF_USB, GL_MAINIREF_MAXEFUSE-1);
         tvalue = int(BinStringToUnsigned(tmpstr1, true));
         MAINIREF_TRIMSAVED[site] = tvalue;

          /*need to add vhvslopect & vsa5ct check here*/
         for (count = IND_VHVSLCT_MSB;count <= IND_VHVSLCT_LSB;count++)
            main_expstr[count] = main_str[count];
         tvalue = int(BinStringToUnsigned(main_str.Substring(IND_VHVSLCT_MSB, GL_VHV_SLPCT_MAXEFUSE), true));
         VHV_SLPCT_TRIMSAVED[site] = tvalue;

         for (count = IND_VSA5CT_MSB;count <= IND_VSA5CT_LSB;count++)
            main_expstr[count] = main_str[count];
         tvalue = int(BinStringToUnsigned(main_str.Substring(IND_VSA5CT_MSB, GL_VSA5CT_MAXEFUSE), true));
         VSA5CT_TRIMSAVED[site] = tvalue;

          /*fosc: bit[8:13]*/
         for (count = IND_FOSC_MSB;count <= IND_FOSC_LSB;count++)
            main_expstr[count] = main_str[count];
         tvalue = int(BinStringToUnsigned(main_str.Substring(IND_FOSC_MSB, FOSC_MAXEFUSE), true));
         FOSC_TRIMSAVED[site] = tvalue;

         if(tistdscreenprint)  
            cout << "Site" << site << " MAINBG_TRIMSAVED == " << MAINBG_TRIMSAVED[site] << 
                    " MAINIREF_TRIMSAVED == " << MAINIREF_TRIMSAVED[site] << 
                    " FOSC_TRIMSAVED == " << FOSC_TRIMSAVED[site] << 
                    " VHVSLPCT_TRIMSAVED == " << VHV_SLPCT_TRIMSAVED[site] << 
                    " VSA5CT_TRIMSAVED == " << VSA5CT_TRIMSAVED[site] << endl;
         
         if(main_str!=main_expstr)  
         {
            final_results[site] = TM_FAIL;
            cmp_results[site] = TM_FAIL;
         } 

          /*log to TW*/
         actlabel = "FL_EFRD_ACT";
         explabel = "FL_EFRD_EXP";

         hex_actstr = "0x" + StringBinToHex(margFlashChainStr[site]);         
         
         hex_expstr = "0x" + StringBinToHex(main_expstr + bank_expstr); /*Msb-Lsb*/
         
         if(tistdscreenprint and (cmp_results[site]==TM_FAIL))  
         {
            cout << "Site : " << site << " Failed String Compare " << endl;
            cout << "   Expect : " << hex_expstr << endl;
            cout << "   Actual : " << hex_actstr << endl;
         } 
      }

      // Moved outside of site loop
      TWPDLDataLogText(actlabel,hex_actstr,TWMinimumData);
      TWPDLDataLogText(explabel,hex_expstr,TWMinimumData);

// Don't know why they re-powered up...may need to init part?
//      PowerUpAtEfuseRead(DCsetup_LooseVEfuseR, NORM_FMSU); 
//      ClockSet(S_CLOCK1A, false, FreqArr[ DMA ],
//               v[vih_loose_osc_VEfuseR],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(tdelay);
      
      if(GL_EFUSE_RD_CODEOPTION != "")  
      {
         read_code_option = GL_EFUSE_RD_CODEOPTION;
      }
      else
      {
         read_code_option = "F021";
         if(tistdscreenprint)  
         {
            cout << endl;
            cout << "!!! WARNING: GL_EFUSE_RD_CODEOPTION is not defined !!!" << endl;
            cout << "!!! Setting it to \"F021\" not using SCRAM option    !!!" << endl;
            cout << endl;
         } 
      } 

      eferrcode = ReadFuseROM(read_code_option, NonMBist, Mg1A, reverse_expStr,rdStr,marg_results);

      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
         if((eferrcode[*si] == 0x15) or (eferrcode[*si] == 0x5))  
            marg_results[*si] = TM_FAIL;

      // At this point, VLCT ignores previous value of final_results and 
      // only cares about the following 3 to set pass/fail on active sites here
      final_results = TM_NOTEST;
      final_results = DLOG.AccumulateResults(final_results, marg_results);
      final_results = DLOG.AccumulateResults(final_results, cmp_results);
      final_results = DLOG.AccumulateResults(final_results, ipmos_cmp_results);

      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
         if (final_results[*si] == TM_PASS)
         {
            GL_FLASH_RETEST[*si] = true;
            if(tistdscreenprint)  
               cout << "Site : " << *si << 
                       " Flash Already Trimmed.  PASSED." << endl;
         }

      RunTime.SetActiveSites(savesites);

   }   /*if not arraycmp*/

   ttimer = TIME.StopTimer();
   
   if(tistdscreenprint)  
   {
      DLOG.Value(ttimer, 0., UTL_VOID, "ms", "FlashEfuseRd_Test_TT");
   } 

//:TODO: Come back and implement when F021_Log_FailPat_ToTW is done -- low priority
//   if(final_results.AnyEqual(TM_FAIL))  
//      F021_Log_FailPat_To_TW(tmpstr3,final_results,tname);

    /*null out gl_previous_shell*/
   GL_PREVIOUS_SHELL = "";

   return(final_results);
}   /* FlashEfuse_MP1_func */

//BoolS FlashEfuse_MPx_func()
//{
//   BoolM tmp_results,final_results;
//   IntS site;
//   FloatS tdelay,ttimer1;
//   StringS tname;
//   StringS tmpstr3,str1;
//   StringM hex_actstr;
//   StringS dummstr1,dummstr2;
//   StringM rdStr,flnullstr;
//   IntM eferrcode;
//
//   if(v_any_dev_active)  
//   {
//      tdelay = 2ms;
//      timernstart(ttimer1);
//
//      tname = FlashEfuseRd_Test;
//      writestring(tmpstr3,tname);
//      TestOpen(tname);
//
//      final_results = v_dev_active;
//      tmp_results = v_dev_active;
//
//      PowerUpAtEfuseRead(DCsetup_LooseVEfuseR, NORM_FMSU);
//      ClockSet(S_CLOCK1A, false, FreqArr[ DMA ],
//               v[vih_loose_osc_VEfuseR],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(tdelay);
//
//      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//         if(v_dev_active[site])  
//            flnullstr[site] = instData[NonMBist].nullChainStr[1][0][1];  /*[ctlr,blk,seg]*/
//      
//      if(GL_EFUSE_RD_CODEOPTION != "")  
//      {
//         readData.codeOption = GL_EFUSE_RD_CODEOPTION;
//      }
//      else
//      {
//         readData.codeOption = "F021";
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "!!! WARNING: GL_EFUSE_RD_CODEOPTION is not defined !!!" << endl;
//            cout << "!!! Setting it to "F021" not using SCRAM option    !!!" << endl;
//            cout << endl;
//         } 
//      } 
//
//      ReadFuseROM(NonMBist, MgN, flnullstr,rdStr,tmp_results);
//
//      eferrcode = readData.errorCode;
//      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//         if(v_dev_active[site])  
//            if((eferrcode[site] == 0x15) or (eferrcode[site] == 0x5))  
//               final_results[site] = false;
//
//       /*save efuse str for later use*/
//      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//         if(v_dev_active[site])  
//         {
//            dummstr1 = rdStr[site];
//            SaveFlashProgString[site] = dummstr1;
//            hex_actstr[site] = stringbintohex(dummstr1,s_pad_msb);
//            if(tistdscreenprint)  
//               cout << "Site" << site:-5 << " EFSTR == " << hex_actstr[site] << endl;
//         } 
//
//      ResultsRecordActive(final_results, S_NULL);
//      TestClose;
//
//      switch(TITestType) {
//        case MP2         : str1 = "FL_EFSTR_MP2";
//        case MP3         : str1 = "FL_EFSTR_MP3";
//        case PreBurnIn   : str1 = "FL_EFSTR_PREBI";
//        case PostBurnIn1 : str1 = "FL_EFSTR_PSTBI1";
//        case FT2         : str1 = "FL_EFSTR_FT2";
//        default: str1 = "FL_EFSTR";
//      }   /* case */
//
//      TWPDLDataLogText(str1,hex_actstr,TWMinimumData);
//
//      PowerUpAtVnom(DCsetup_LooseVnom, norm_fmsu);
//      ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vnom],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(tdelay);
//
//      if(tistdscreenprint)  
//         cout << tmpstr3 << " TTT == " <<  timernread(ttimer1) << endl;
//   } 
//
//    /*null out gl_previous_shell*/
//   GL_PREVIOUS_SHELL = "";
//
//   FlashEfuse_MPx_func = v_any_dev_active;
//}   /* FlashEfuse_MPx_func */

TMResultM FlashEfuse_func()
{
   const IntS TESTID = 5; 
   
   TMResultM final_results;

   GL_FLTESTID = TESTID;
   switch(SelectedTITestType) {
     case MP1 : final_results = FlashEfuse_MP1_func();
                break;
     default: 
               // :TODO: Implement FlashEfuse_MPx_func!
               //final_results = FlashEfuse_MPx_func();
              break;
   }   /* case */
   
    /*null out gl_previous_shell*/
   GL_PREVIOUS_SHELL = "";
   return final_results;
} 

// /*old function - use for engineering debug purpose*/
//BoolS MainBG_Trim_ENG_func()
//{
//   const IntS TESTID = 6; 
//
//   BoolM tmp_results,final_results;
//   BoolM savesites,alldisable;
//   BoolS bg_adapttrim_ena;
//   BoolS bg_chartrim_ena;
//   IntS site;
//   FloatS ttimer1;
//   FloatM tt_timer;
//   FloatM FloatSval;
//   TWunit unitval;
//   StringS tmpstr1,tmpstr4;
//   StringS current_shell;
//   StringS dummstr1,dummstr2;
//
//   GL_FLTESTID = TESTID;
//   savesites = v_dev_active;
//   alldisable = false;
//    /*init site to flash trim to false. it gets update in *SoftTrim_func*/
//   SITE_TO_FTRIM = false;
//
//   timernstart(ttimer1);
//   
//   if(GL_DO_FLASHTRIM)  
//   {
//      bg_adapttrim_ena   = GL_DO_BG_ADAPT_TRIM;
//      bg_chartrim_ena    = GL_DO_BG_CHAR_TRIM;
//
//       /*dis-able retest (already trimmed) site*/
//      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//         if(v_dev_active[site] and GL_FLASH_RETEST[site])  
//         {
//            Devsetholdstate(site,false);
//            if(tistdscreenprint)  
//               cout << "Site : " << site:2 << "  Already Trimmed so Disable." << endl;
//         } 
//      
//      PowerUpAtVnom(DCsetup_LooseVnom, norm_fmsu);
//      ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vnom],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(2ms);
//
//      F021_LoadFlashShell_func;
//
//      if(GL_DO_BG_DIRECT_TRIM)  
//         F021_MainBG_SoftTrim_Direct_func(bg_adapttrim_ena,bg_chartrim_ena,final_results);
//      else
//         F021_MainBG_SoftTrim_func(bg_adapttrim_ena,bg_chartrim_ena,final_results);
//      
//       /*determine any site need to be trimmed*/
//      if not(ArrayCompareBoolean(SITE_TO_FTRIM,alldisable,v_sites))  
//      {
//          /*build efuse string MSB-LSB*/
//         for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//            if(v_dev_active[site])  
//            {
//               FlashProgString[site] = "";
//               FlashProgString[site] = FlashProgString[site] + MAINBG_EFSTR[site];
//               FlashProgString[site] = FlashProgString[site] + BANK_EFSTR[site];
//
//                /*update SaveFlashProgString for later use*/
//               SaveFlashProgString[site] = FlashProgString[site];   /*MSB-LSB*/
//               MargFlashChainStr[site] = FlashProgString[site];
//
//               if(tistdscreenprint)  
//               {
//                  dummstr1 = flashprogstring[site];
//                  dummstr2 = stringreverse(dummstr1);
//                  dummstr1 = stringbintohex(dummstr1,s_pad_msb);
//                  cout << "Site " << site:3 << "  MSB-LSB : " << dummstr1 << endl;
//                  if(ti_flashdebug)  
//                  {
//                     cout << "Site " << site:3 << "  To Be Trimmed (MSB-LSB) : " << 
//                             FlashProgString[site] << endl;
//                     cout << "Site " << site:3 << "  LSB-MSB : " << dummstr2 << endl;
//                  } 
//               } 
//            } 
//         
//         ProgramFlashTrim(FTrimProg_st,FTrimPstRd_st,FTrimPstRdMg_st,
//                          FlashProgString,MargFlashChainStr); 
//
//      }   /*if not(arraycompare)*/
//
//       /*re-activate retest sites*/
//      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//         if((not v_dev_active[site]) and GL_FLASH_RETEST[site])  
//            devsetholdstate(site,true);
//      
//   }   /*if gl_do_flashtrim*/
//
//   ttimer1 = timernread(ttimer1);
//   tt_timer = ttimer1;
//
//   tmpstr1 = "MainBGTrim_Test";
//   tmpstr4 = tmpstr1 + "_TT";
//   TWTRealToRealMS(tt_timer,realval,unitval);
//   TWPDLDataLogRealVariable(tmpstr4, unitval,realval,TWMinimumData);
//
//   if(tistdscreenprint)  
//   {
//      arrayandboolean(tmp_results,savesites,v_dev_active,v_sites);
//      cout << endl;
//      PrintHeaderBool(GL_PLELL_FORMAT);
//      PrintResultBool(tmpstr1,0,tmp_results,GL_PLELL_FORMAT);
//      cout << "    TT " << ttimer1 << endl;
//      cout << endl;
//   } 
//
//    /*null out gl_previous_shell*/
//   GL_PREVIOUS_SHELL = "";
//
//   MainBG_Trim_ENG_func = v_any_dev_active;
//}   /* MainBG_Trim_ENG_func */
//
 /*dummy function for jazz binout*/
 // should we even be keeping these?
//TMResultM MainIref_Trim_func()
//{
//   return (TM_PASS);
//}   /* MainIref_Trim_func */

// /*old function - use for engineering debug purpose*/
//BoolS MainIref_Trim_ENG_func()
//{
//   const IntS TESTID = 7; 
//
//   BoolM tmp_results,final_results;
//   BoolM savesites,alldisable;
//   BoolS bg_adapttrim_ena;
//   BoolS bg_chartrim_ena;
//   BoolS iref_adapttrim_ena;
//   BoolS iref_chartrim_ena;
//   IntS site;
//   FloatS ttimer1;
//   FloatM tt_timer;
//   FloatM FloatSval;
//   TWunit unitval;
//   StringS tmpstr1,tmpstr4;
//   StringS current_shell;
//   StringS dummstr1,dummstr2;
//
//   
//   GL_FLTESTID = TESTID;
//   savesites = v_dev_active;
//   alldisable = false;
//    /*init site to flash trim to false. it gets update in *SoftTrim_func*/
//   SITE_TO_FTRIM = false;
//
//   timernstart(ttimer1);
//   
//   if(GL_DO_FLASHTRIM)  
//   {
//      iref_adapttrim_ena = GL_DO_IREF_ADAPT_TRIM;
//      iref_chartrim_ena  = GL_DO_IREF_CHAR_TRIM;
//
//       /*dis-able retest (already trimmed) site*/
//      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//         if(v_dev_active[site] and GL_FLASH_RETEST[site])  
//         {
//            Devsetholdstate(site,false);
//            if(tistdscreenprint)  
//               cout << "Site : " << site:2 << "  Already Trimmed so Disable." << endl;
//         } 
//      
//      PowerUpAtVnom(DCsetup_LooseVnom, norm_fmsu);
//      ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vnom],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(2ms);
//
//      F021_LoadFlashShell_func;
//
//      F021_MainIREF_SoftTrim_func(iref_adapttrim_ena,iref_chartrim_ena,final_results);
//         
//       /*determine any site need to be trimmed*/
//      if not(ArrayCompareBoolean(SITE_TO_FTRIM,alldisable,v_sites))  
//      {
//          /*build efuse string MSB-LSB*/
//         for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//            if(v_dev_active[site])  
//            {
//               FlashProgString[site] = "";
//               FlashProgString[site] = FlashProgString[site] + MAINBG_EFSTR[site];
//               FlashProgString[site] = FlashProgString[site] + BANK_EFSTR[site];
//
//                /*update SaveFlashProgString for later use*/
//               SaveFlashProgString[site] = FlashProgString[site];   /*MSB-LSB*/
//               MargFlashChainStr[site] = FlashProgString[site];
//
//               if(tistdscreenprint)  
//               {
//                  dummstr1 = flashprogstring[site];
//                  dummstr2 = stringreverse(dummstr1);
//                  dummstr1 = stringbintohex(dummstr1,s_pad_msb);
//                  cout << "Site " << site:3 << "  MSB-LSB : " << dummstr1 << endl;
//                  if(ti_flashdebug)  
//                  {
//                     cout << "Site " << site:3 << "  To Be Trimmed (MSB-LSB) : " << 
//                             FlashProgString[site] << endl;
//                     cout << "Site " << site:3 << "  LSB-MSB : " << dummstr2 << endl;
//                  } 
//               } 
//            } 
//            
//            ProgramFlashTrim(FTrimProg2_st,FTrimPstRd2_st,FTrimPstRdMg2_st,
//                             FlashProgString,MargFlashChainStr); 
//
//      }   /*if not(arraycompare)*/
//
//
//       /*re-activate retest sites*/
//      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//         if((not v_dev_active[site]) and GL_FLASH_RETEST[site])  
//            devsetholdstate(site,true);
//
//   }   /*if gl_do_flashtrim*/
//
//   ttimer1 = timernread(ttimer1);
//   tt_timer = ttimer1;
//
//   tmpstr1 = "MainIrefTrim_Test";
//   tmpstr4 = tmpstr1 + "_TT";
//   TWTRealToRealMS(tt_timer,realval,unitval);
//   TWPDLDataLogRealVariable(tmpstr4, unitval,realval,TWMinimumData);
//
//   if(tistdscreenprint)  
//   {
//      arrayandboolean(tmp_results,savesites,v_dev_active,v_sites);
//      cout << endl;
//      PrintHeaderBool(GL_PLELL_FORMAT);
//      PrintResultBool(tmpstr1,0,tmp_results,GL_PLELL_FORMAT);
//      cout << "    TT " << ttimer1 << endl;
//      cout << endl;
//   } 
//
//    /*null out gl_previous_shell*/
//   GL_PREVIOUS_SHELL = "";
//
//   
//   MainIref_Trim_ENG_func = v_any_dev_active;
//}   /* MainIref_Trim_func */
//
//
// /*dummy function for jazz binout*/
//BoolS FOSC_Trim_func()
//{
//   const IntS TESTID = 8; 
//
//   FOSC_Trim_func = v_any_dev_active;
//} 

 /*Combined BGap, IREF, VHV_SLPCT, VS5ACT Trim*/
TMResultM FlashEfuse_Trim_func()
{
   TMResultM tmp_results, final_results;
   Sites savesites, new_active_sites;
   IntM slpct,vsa5ct;
   BoolS bg_chartrim_ena;
   BoolS iref_chartrim_ena;
   FloatS tt_timer;
   StringS tmpstr1;
   StringS dummstr1,dummstr2;

   savesites = ActiveSites;
   new_active_sites = ActiveSites;
    /*init site to flash trim to false. it gets update in *SoftTrim_func*/
   SITE_TO_FTRIM = false;

   TIME.StartTimer();

   TIME.Wait(2ms);
   F021_LoadFlashShell_func();
   RAM_Clear_SoftTrim_All();
   RAM_Clear_MailBox_Key();

   /*dis-able retest (already trimmed) site*/
   if (tistdscreenprint)
      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
         if(GL_FLASH_RETEST[*si])  
            cout << "Site : " << *si << "  Already Trimmed so Disable." << endl;
   new_active_sites.DisableFailingSites(!GL_FLASH_RETEST);
  
   if(SetActiveSites(new_active_sites))  
   {
      bg_chartrim_ena    = GL_DO_BG_CHAR_TRIM;
      if(GL_DO_BG_DIRECT_TRIM)  
      {
         tmp_results = F021_MainBG_SoftTrim_Direct_func(bg_chartrim_ena);
         final_results = tmp_results;
      }
// else clause unneeded by Blizzard. :TODO: evaluate if ever needed and convert if necessary.
//      else
//         F021_MainBG_SoftTrim_func(bg_adapttrim_ena,bg_chartrim_ena,tmp_results);

      new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
      if(SetActiveSites(new_active_sites))  
      {
         iref_chartrim_ena  = true;//GL_DO_IREF_CHAR_TRIM;
         tmp_results = F021_MainIREF_SoftTrim_func(iref_chartrim_ena);
         final_results = DLOG.AccumulateResults(final_results, tmp_results);

         new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
         if(SetActiveSites(new_active_sites) && GL_DO_FOSC_TRIM)  
         {
      #if $FL_USE_DCC_TRIM_FOSC  
      //  :TODO: Unneeded for Blizzard, fix later.
      //      F021_FOSC_SoftTrim_func(tmp_results);
      #else
            tmp_results = F021_FOSC_SoftTrim_External_func();
            final_results = DLOG.AccumulateResults(final_results, tmp_results);
      #endif
         
            new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
            if(SetActiveSites(new_active_sites))  
            {
               tmp_results = F021_VHV_SLOPECT_SoftTrim_func(slpct);
               final_results = DLOG.AccumulateResults(final_results, tmp_results);
            
               new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
               if(SetActiveSites(new_active_sites)) 
               {
                  tmp_results = F021_VSA5CT_SoftTrim_func(vsa5ct);
                  final_results = DLOG.AccumulateResults(final_results, tmp_results);

                  new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
                  if(SetActiveSites(new_active_sites) && SITE_TO_FTRIM.AnyEqual(true))  
                  {
                     new_active_sites.DisableFailingSites(SITE_TO_FTRIM);
                     if (SetActiveSites(new_active_sites)) 
                     {
                        FlashProgString = MAINBG_EFSTR + BANK_EFSTR;

                          /*update SaveFlashProgString for later use*/
                        SaveFlashProgString = FlashProgString;   /*MSB-LSB*/
                        margFlashChainStr = FlashProgString;

                        if(tistdscreenprint)  
                        {
                           for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
                           {
                              dummstr2 = FlashProgString[*si];
                              ReverseStringInPlace(dummstr2);
                              dummstr1 = StringBinToHex(FlashProgString[*si]);
                              cout << "Site " << *si << "  MSB-LSB : " << dummstr1 << endl;
                              if(true)   /*ti_flashdebug*/
                              {
                                 cout << "Site " << *si << "  To Be Trimmed (MSB-LSB) : " << 
                                         FlashProgString[*si] << endl;
                                 cout << "Site " << *si << "  LSB-MSB : " << dummstr2 << endl;
                              } 
                           }  
                        }  /*ti_stdscreenprint*/
                     } // if active sites to ftrim
                     // NOTE: Programming the Flash trim moved to one pass efuse pgm (KChau 01/12/11)
                  }   // if SITE_TO_FTRIM
               } // if any_site_active VSA5CT trim
            } // if any_site_active VHV SLOPECT trim
         } // if any_site_active OSC trim
      } // if any_site_active Iref trim
   } // if any_site_active BG Trim
   
   /*re-activate sites*/
   RunTime.SetActiveSites(savesites);
   
   tt_timer = TIME.StopTimer();

   tmpstr1 = "FlashEfuseTrim_Test_TT";
   TIDlog.Value(tt_timer, UTL_VOID, 0.0, UTL_VOID, "s", tmpstr1, 
                UTL_VOID, UTL_VOID, true, TWMinimumData);
   
    /*null out gl_previous_shell*/
   GL_PREVIOUS_SHELL = "";
   
   return (final_results);
}   /* FlashEfuse_Trim_func */
   
TMResultM MainBG_Trim_func()
{
   return (FlashEfuse_Trim_func());
}   /* MainBG_Trim_func */

TMResultM Pump_Iref_Vnom_func()
{
   const IntS TESTID = 15; 

   TMResultM final_results, tmp_results;
   FloatS tdelay;
   IntS tcrnum;
   TPModeType tcrmode;
   VCornerType vcorner;
   Sites initial_sites(ActiveSites);
   Sites new_active_sites(ActiveSites);
   FloatM temp_floatm;

   GL_FLTESTID = TESTID;
   tdelay = 2ms;
   TIME.Wait(tdelay);

   F021_LoadFlashShell_func();

   RAM_Clear_SoftTrim_All();  /*KChau 09/10/10*/
   
   tcrnum = 126;
   tcrmode = ReadMode;
   vcorner = VNM;
   final_results = F021_Pump_Para_func(TNUM_PUMP_MAINIREF,post,vcorner,tcrnum,tcrmode);

   // disable failing sites (disables sites w/ false).
   new_active_sites = ActiveSites;
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   if(SetActiveSites(new_active_sites))  
   {
      tcrnum = 125;
      tmp_results = F021_Pump_Para_func(TNUM_PUMP_MAINICMP10U,post,vcorner,tcrnum,tcrmode);
      final_results = DLOG.AccumulateResults(final_results, tmp_results);
   }    
   
   // re-enable any sites we've messed around with 
   // to report the results properly
   RunTime.SetActiveSites(initial_sites);
   return final_results;
}   /* Pump_Iref_Vnom_func */

//BoolS Pump_BGap_Vmin_func()
//{
//   BoolM final_results;
//   BoolM tmp_results;
//   StringS current_shell;
//   FloatS tdelay;
//   IntS tcrnum;
//   TPModeType tcrmode;
//   VcornerType vcorner;
//
//   tdelay = 2ms;
//   tcrnum = 124;
//   tcrmode = ReadMode;
//   vcorner = VMN;
//
//   PowerUpAtVmin(DCsetup_LooseVmin, norm_fmsu);
//   ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vmin],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//   TIME.Wait(tdelay);
//
//   F021_LoadFlashShell_func;
//   
//   F021_Pump_Para_func(TNUM_PUMP_MAINBG,post,vcorner,tcrnum,tcrmode,final_results);
//
//   Pump_BGap_Vmin_func = v_any_dev_active;
//}   /* Pump_BGap_Vmin_func */

TMResultM Pump_BGap_Vnom_func()
{
   const IntS TESTID = 16; 

   TMResultM final_results;
   StringS current_shell;
   FloatS tdelay;
   IntS tcrnum;
   TPModeType tcrmode;
   VCornerType vcorner;

   GL_FLTESTID = TESTID;
   tdelay = 2ms;
   tcrnum = 124;
   tcrmode = ReadMode;
   vcorner = VNM;
   
   // PowerUpDn(PWRUP_VNOM);

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   final_results = F021_Pump_Para_func(TNUM_PUMP_MAINBG,post,vcorner,tcrnum,tcrmode);

   return(final_results);
}   /* Pump_BGap_Vnom_func */

TMResultM Pump_VHV_Vmin_func(Levels postTrimLevels1, Levels postTrimLevels2)
{
   const IntS TESTID = 17; 

   TMResultM final_results,tmp_results;
   Sites savesites, new_active_sites, initial_sites;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   IntM ctval;
   
   initial_sites = ActiveSites;

    /*vhv ct trimming*/
   if(GL_DO_VHV_CT_TRIM)  
   {

      // PowerUpDn(PWRUP_VNOM);
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();

      if (!(GL_FLASH_RETEST == false))   // all sites must match for this to be true (then negated by the !)
      {
         savesites = ActiveSites;
         new_active_sites = ActiveSites;
         // Disable sites that have retest of false
         new_active_sites.DisableFailingSites(GL_FLASH_RETEST); 
               
         if(SetActiveSites(new_active_sites))   //if there is an active site
         {
            TL_RunTestNum(TNUM_BANK_PRECON,"");
            TL_RunTestNum(TNUM_OTP_PRECON ,""); /*PROG*/
         } 
         RunTime.SetActiveSites(savesites);
      } 

      tmp_results = F021_VHV_PG_CT_Trim_func(ctval);
      VHV_PG_CT_TRIMSAVED = ctval;
      
#if $FL_USE_NEW_VHV_TEMPL_ADDR        
      VHV_PG_CT_TRIMSAVED_EMU = ctval;
#endif
      
      tmp_results = F021_VHV_ER_CT_Trim_func(ctval);
      VHV_ER_CT_TRIMSAVED = ctval;
#if $FL_USE_NEW_VHV_TEMPL_ADDR        
      VHV_ER_CT_TRIMSAVED_EMU = ctval;
#endif
      
      tmp_results = F021_VHV_PV_CT_Trim_func(ctval);
      VHV_PV_CT_TRIMSAVED = ctval;
#if $FL_USE_NEW_VHV_TEMPL_ADDR        
      VHV_PV_CT_TRIMSAVED_EMU = ctval;
#endif

      RAM_Upload_VHV_CT_TrimVal();  /*KChau 09/10/10*/
   } 
   
   // Flow should set category to VMin
   if (postTrimLevels1.Valid())
      postTrimLevels1.Execute();
   if (postTrimLevels2.Valid())
      postTrimLevels2.Execute();   
   
   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   vcorner = VMN;

   reload_flashshell = true; /* added to reload the flash shell for "stability" JRR 0515012 */

   tcrnum = 115;
   tcrmode = ProgMode;
   final_results = F021_Pump_Para_func(TNUM_PUMP_VHVPROG,post,vcorner,tcrnum,tcrmode);

   new_active_sites = ActiveSites;
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS)); 
   if(SetActiveSites(new_active_sites))   //we have an active site
   {
      tcrmode = PvfyMode;
      // can reuse the final_results b/c sites disabled won't get new values
      tmp_results = F021_Pump_Para_func(TNUM_PUMP_VHVPVFY,post,vcorner,tcrnum,tcrmode);
      final_results = DLOG.AccumulateResults(final_results, tmp_results);
   
      new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
      if(SetActiveSites(new_active_sites))  
      {
         tcrmode = ErsMode;
         /* PatternLoad(f021_shell_loadpat, 'VVS/PAT_F771727_PBx16/Garnet_Shell064_T072C009S007_A3_v1p4'); 
           {added because of LDO bypass issue JRR}
             discard(patternexecute(num_clks,f021_shell_loadpat));
             wait(5mS); */
         tmp_results = F021_Pump_Para_func(TNUM_PUMP_VHVERS,post,vcorner,tcrnum,tcrmode);
         final_results = DLOG.AccumulateResults(final_results, tmp_results);
         RAM_Upload_VHV_CT_TrimVal(); /*added to reload the softtrims for VHV JRR*/
      } 
   }
   
   RunTime.SetActiveSites(initial_sites);
   return (final_results);
}   /* Pump_VHV_Vmin_func */

TMResultM Pump_VHV_Vmax_func()
{
   const IntS TESTID = 18; 

   TMResultM final_results, tmp_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   Sites initial_sites(ActiveSites);
   Sites new_active_sites(ActiveSites);
   
   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMX;

   tcrnum = 115;
   tcrmode = ProgMode;
   final_results = F021_Pump_Para_func(TNUM_PUMP_VHVPROG,post,vcorner,tcrnum,tcrmode);

   // disable failing sites (disables sites w/ false).
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   if(SetActiveSites(new_active_sites))  
   {
      tcrmode = PvfyMode;
      tmp_results = F021_Pump_Para_func(TNUM_PUMP_VHVPVFY,post,vcorner,tcrnum,tcrmode);
      final_results = DLOG.AccumulateResults(final_results, tmp_results);
   
      new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
      if(SetActiveSites(new_active_sites))  
      {
         tcrmode = ErsMode;
         tmp_results = F021_Pump_Para_func(TNUM_PUMP_VHVERS,post,vcorner,tcrnum,tcrmode);
         final_results = DLOG.AccumulateResults(final_results, tmp_results);
      } 
   }
   
   RunTime.SetActiveSites(initial_sites);
   return (final_results);
}   /* Pump_VHV_Vmax_func */


TMResultM Pump_VSL_Vmin_func()
{
   const IntS TESTID = 19; 

   TMResultM final_results, tmp_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   Sites initial_sites(ActiveSites);
   Sites new_active_sites(ActiveSites);

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMN;

   tcrnum = 116;
   tcrmode = ProgMode;
   final_results = F021_Pump_Para_func(TNUM_PUMP_VSL,post,vcorner,tcrnum,tcrmode);

   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   if(SetActiveSites(new_active_sites))  
   {
      tcrmode = PvfyMode;
      tmp_results = F021_Pump_Para_func(TNUM_PUMP_VSL,post,vcorner,tcrnum,tcrmode);
      final_results = DLOG.AccumulateResults(final_results, tmp_results);
   } 
   
   RunTime.SetActiveSites(initial_sites);
   return (final_results);
}   /* Pump_VSL_Vmin_func */


TMResultM Pump_VSL_Vmax_func()
{
   const IntS TESTID = 20; 

   TMResultM final_results, tmp_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   Sites initial_sites(ActiveSites);
   Sites new_active_sites(ActiveSites);

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMX;

   tcrnum = 116;
   tcrmode = ProgMode;
   final_results = F021_Pump_Para_func(TNUM_PUMP_VSL,post,vcorner,tcrnum,tcrmode);
   
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   if(SetActiveSites(new_active_sites))  
   {
      tcrmode = PvfyMode;
      tmp_results = F021_Pump_Para_func(TNUM_PUMP_VSL,post,vcorner,tcrnum,tcrmode);
      final_results = DLOG.AccumulateResults(final_results, tmp_results);
   } 

   RunTime.SetActiveSites(initial_sites);
   return (final_results);
}   /* Pump_VSL_Vmax_func */


TMResultM Pump_Vread_Vmin_func()
{
   const IntS TESTID = 21; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMN;
   tcrnum = 117;
   tcrmode = EvfyMode;  /*note: actual mode is ReadMode*/
   final_results = F021_Pump_Para_func(TNUM_PUMP_VREAD,post,vcorner,tcrnum,tcrmode);

   return (final_results);
}   /* Pump_Vread_Vmin_func */


TMResultM Pump_Vread_Vmax_func()
{
   const IntS TESTID = 22; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMX;
   tcrnum = 117;
   tcrmode = CvfyMode;  /*note: actual mode is ReadMode*/
   final_results = F021_Pump_Para_func(TNUM_PUMP_VREAD,post,vcorner,tcrnum,tcrmode);

   return (final_results);
}   /* Pump_Vread_Vmax_func */


TMResultM Pump_VSA5_Vmin_func()
{
   const IntS TESTID = 23; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMN;

   tcrnum = 118;
   tcrmode = ReadMode;
   final_results = F021_Pump_Para_func(TNUM_PUMP_VSA5_READ,post,vcorner,tcrnum,tcrmode);

   return (final_results);
}   /* Pump_VSA5_Vmin_func */


TMResultM Pump_VSA5_Vmax_func()
{
   const IntS TESTID = 24; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMX;

   tcrnum = 118;
   tcrmode = ReadMode;
   final_results = F021_Pump_Para_func(TNUM_PUMP_VSA5_READ,post,vcorner,tcrnum,tcrmode);

   return (final_results);
}   /* Pump_VSA5_Vmax_func */


TMResultM Pump_VWL_Vmin_func()
{
   const IntS TESTID = 25; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMN;

   tcrnum = 119;
   tcrmode = ReadMode;
   final_results = F021_Pump_Para_func(TNUM_PUMP_VWL_READ,post,vcorner,tcrnum,tcrmode);

   return (final_results);
}   /* Pump_VWL_Vmin_func */


TMResultM Pump_VWL_Vmax_func()
{
   const IntS TESTID = 26; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMX;

   tcrnum = 119;
   tcrmode = ReadMode;
   final_results = F021_Pump_Para_func(TNUM_PUMP_VWL_READ,post,vcorner,tcrnum,tcrmode);

   return (final_results);
}   /* Pump_VWL_Vmax_func */


TMResultM Pump_VCG2P5_Vmin_func()
{
   const IntS TESTID = 27; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMN;

   tcrnum = 120;
   tcrmode = ReadMode;
   final_results = F021_Pump_Para_func(TNUM_PUMP_VCG2P5_READ,post,vcorner,tcrnum,tcrmode);

   return (final_results);
}   /* Pump_VCG2P5_Vmin_func */


TMResultM Pump_VCG2P5_Vmax_func()
{
   const IntS TESTID = 28; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMX;

   tcrnum = 120;
   tcrmode = ReadMode;
   final_results = F021_Pump_Para_func(TNUM_PUMP_VCG2P5_READ,post,vcorner,tcrnum,tcrmode);

   return (final_results);
}   /* Pump_VCG2P5_Vmax_func */


TMResultM Pump_VINH_Vmin_func()
{
   const IntS TESTID = 29; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMN;

   tcrnum = 121;
   tcrmode = EvfyMode;
   final_results = F021_Pump_Para_func(TNUM_PUMP_VINH_READ,post,vcorner,tcrnum,tcrmode);

   return (final_results);
}   /* Pump_VINH_Vmin_func */


TMResultM Pump_VINH_Vmax_func()
{
   const IntS TESTID = 30; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMX;

   tcrnum = 121;
   tcrmode = CvfyMode;
   final_results = F021_Pump_Para_func(TNUM_PUMP_VINH_READ,post,vcorner,tcrnum,tcrmode);

   return (final_results);
}   /* Pump_VINH_Vmax_func */


TMResultM Pump_VHV2X_Vmin_func()
{
   const IntS TESTID = 31; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMN;

   tcrnum = 122;
   tcrmode = ProgMode;
   final_results = F021_Pump_Para_func(TNUM_PUMP_VHV2X_PROG,post,vcorner,tcrnum,tcrmode);

   return (final_results);
}   /* Pump_VHV2X_Vmin_func */


TMResultM Pump_VHV2X_Vmax_func()
{
   const IntS TESTID = 32; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vcorner = VMX;

   tcrnum = 122;
   tcrmode = ProgMode;
   final_results = F021_Pump_Para_func(TNUM_PUMP_VHV2X_PROG,post,vcorner,tcrnum,tcrmode);

   return (final_results);
}   /* Pump_VHV2X_Vmax_func */


TMResultM VReadBUF_Vmin_func()
{
   const IntS TESTID = 37; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   vcorner = VMN;
   tcrnum = 83;
   tcrmode = ProgMode;
   final_results = F021_Bank_Para_func(TNUM_BANK_VRDBUF,post,vcorner,tcrnum,tcrmode);

   return (final_results);
}   /* VReadBUF_Vmin_func */


TMResultM VReadBUF_Vmax_func()
{
   const IntS TESTID = 38; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   vcorner = VMX;
   tcrnum = 83;
   tcrmode = PvfyMode;   /*use pvfy to select different limit/cond. actual mode is ProgMode*/
   final_results = F021_Bank_Para_func(TNUM_BANK_VRDBUF,post,vcorner,tcrnum,tcrmode);

   return (final_results);
}   /* VReadBUF_Vmax_func */

TMResultM Iref_Read_Vnom_func()
{
   const IntS TESTID = 50; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   Sites savesites, new_active_sites;

   GL_FLTESTID = TESTID;
   tcrnum = 25;
   tcrmode = ReadMode;
   savesites = ActiveSites;
  
// :TODO: Implement Char stuff
//   if(TI_FlashCharEna and GL_DO_CHARZ_IREF_RD)  
//   {
//      ssample = 1 ; /*10*/
//       /*vcorner := VNM;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_READ_EVEN,
//               TNUM_BANK_IREF_READ_ODD,ssample,true,"Z_IREFRD_NM"));*/
//      vcorner = VMN;
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_READ_EVEN,
//              TNUM_BANK_IREF_READ_ODD,ssample,true,"Z_IREFRD_MN"));
//       /*vcorner := VMX;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_READ_EVEN,
//               TNUM_BANK_IREF_READ_ODD,ssample,true,"Z_IREFRD_MX"));*/
//   } 
//   
//    /*PwrupAtVmin_1;*/
//   PwrupAtVnom_1;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   vcorner = VNME;
   final_results = F021_Bank_Para_func(TNUM_BANK_IREF_READ_EVEN,post,vcorner,tcrnum,tcrmode);

   new_active_sites = ActiveSites;
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   
   if(SetActiveSites(new_active_sites) and (GL_BANKTYPE != FLESBANK))  
   {
      vcorner = VNMO;
      final_results = F021_Bank_Para_func(TNUM_BANK_IREF_READ_ODD,post,vcorner,tcrnum,tcrmode);
   } 
   
   //cleanup
   RunTime.SetActiveSites(savesites);
   
   return (final_results);
}   /* Iref_Read_Vnom_func */


TMResultM Iref_Pvfy_Vnom_func()
{
   const IntS TESTID = 51; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   Sites savesites, new_active_sites;

   GL_FLTESTID = TESTID;
   tcrnum = 25;
   tcrmode = PvfyMode;
   savesites = ActiveSites;

// :TODO: Implement Char stuff   
//   if(TI_FlashCharEna and GL_DO_CHARZ_IREF_PVFY)  
//   {
//      ssample = 1;
//       /*vcorner := VNM;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_PVFY_EVEN,
//               TNUM_BANK_IREF_PVFY_ODD,ssample,true,"Z_IREFPV_NM"));*/
//      vcorner = VMN;
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_PVFY_EVEN,
//              TNUM_BANK_IREF_PVFY_ODD,ssample,true,"Z_IREFPV_MN"));
//       /*vcorner := VMX;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_PVFY_EVEN,
//               TNUM_BANK_IREF_PVFY_ODD,ssample,true,"Z_IREFPV_MX"));*/
//   } 
//   
//    /*PwrupAtVmin_1;*/
//   PwrupAtVnom_1;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   vcorner = VNME;
   final_results = F021_Bank_Para_func(TNUM_BANK_IREF_PVFY_EVEN,post,vcorner,tcrnum,tcrmode);

   new_active_sites = ActiveSites;
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   
   if(SetActiveSites(new_active_sites) and (GL_BANKTYPE != FLESBANK))   
   {
      vcorner = VNMO;
      final_results = F021_Bank_Para_func(TNUM_BANK_IREF_PVFY_ODD,post,vcorner,tcrnum,tcrmode);
   } 
   
   //cleanup
   RunTime.SetActiveSites(savesites);
   
   return (final_results);
}   /* Iref_Pvfy_Vnom_func */


TMResultM Iref_Evfy_Vnom_func()
{
   const IntS TESTID = 52; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   Sites savesites, new_active_sites;

   GL_FLTESTID = TESTID;
   tcrnum = 25;
   tcrmode = EvfyMode;
   savesites = ActiveSites;

// :TODO: Implement Char stuff   
//   if(TI_FlashCharEna and GL_DO_CHARZ_IREF_EVFY)  
//   {
//      ssample = 1;
//       /*vcorner := VNM;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_EVFY_EVEN,
//               TNUM_BANK_IREF_EVFY_ODD,ssample,true,"Z_IREFEV_NM"));*/
//      vcorner = VMN;
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_EVFY_EVEN,
//              TNUM_BANK_IREF_EVFY_ODD,ssample,true,"Z_IREFEV_MN"));
//       /*vcorner := VMX;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_EVFY_EVEN,
//               TNUM_BANK_IREF_EVFY_ODD,ssample,true,"Z_IREFEV_MX"));*/
//   } 
//   
//    /*PwrupAtVmax_1;*/
//   PwrupAtVnom_1;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   vcorner = VNME;
   final_results = F021_Bank_Para_func(TNUM_BANK_IREF_EVFY_EVEN,post,vcorner,tcrnum,tcrmode);

   new_active_sites = ActiveSites;
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   
   if(SetActiveSites(new_active_sites) and (GL_BANKTYPE != FLESBANK))  
   {
      vcorner = VNMO;
      final_results = F021_Bank_Para_func(TNUM_BANK_IREF_EVFY_ODD,post,vcorner,tcrnum,tcrmode);
   } 
   
   //cleanup
   RunTime.SetActiveSites(savesites);
   
   return (final_results);
}   /* Iref_Evfy_Vnom_func */


TMResultM Iref_Cvfy_Vnom_func()
{
   const IntS TESTID = 53; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   Sites savesites, new_active_sites;
   savesites = ActiveSites;

   GL_FLTESTID = TESTID;
   tcrnum = 25;
   tcrmode = CvfyMode;

// :TODO: Implement Char stuff   
//   if(TI_FlashCharEna and GL_DO_CHARZ_IREF_CVFY)  
//   {
//      ssample = 1;
//       /*vcorner := VNM;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_CVFY_EVEN,
//               TNUM_BANK_IREF_CVFY_ODD,ssample,true,"Z_IREFCV_NM"));*/
//      vcorner = VMN;
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_CVFY_EVEN,
//              TNUM_BANK_IREF_CVFY_ODD,ssample,true,"Z_IREFCV_MN"));
//       /*vcorner := VMX;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_CVFY_EVEN,
//               TNUM_BANK_IREF_CVFY_ODD,ssample,true,"Z_IREFCV_MX"));*/
//   } 
//   
//    /*PwrupAtVmin_1;*/
//   PwrupAtVnom_1;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   vcorner = VNME;
   final_results = F021_Bank_Para_func(TNUM_BANK_IREF_CVFY_EVEN,post,vcorner,tcrnum,tcrmode);

   new_active_sites = ActiveSites;
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   
   if(SetActiveSites(new_active_sites) and (GL_BANKTYPE != FLESBANK))  
   {
      vcorner = VNMO;
      final_results = F021_Bank_Para_func(TNUM_BANK_IREF_CVFY_ODD,post,vcorner,tcrnum,tcrmode);
   } 
   
   //cleanup
   RunTime.SetActiveSites(savesites);
   
   return (final_results);
}   /* Iref_Cvfy_Vnom_func */


TMResultM Iref_RM01_Vnom_func()
{
   const IntS TESTID = 54; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   Sites savesites, new_active_sites;
   
   savesites = ActiveSites;

// :TODO: Fix Char stuff
//   if(TI_FlashCharEna and GL_DO_CHARZ_IREF_RM01)  
//   {
//      ssample = 1;
//      tcrnum  = 26;
//      tcrmode = ReadMode;
//       /*vcorner := VNM;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_RDM0_EVEN,
//               TNUM_BANK_IREF_RDM0_ODD,ssample,true,"Z_IREFM0_NM"));*/
//      vcorner = VMN;
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_RDM0_EVEN,
//              TNUM_BANK_IREF_RDM0_ODD,ssample,true,"Z_IREFM0_MN"));
//       /*vcorner := VMX;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_RDM0_EVEN,
//               TNUM_BANK_IREF_RDM0_ODD,ssample,true,"Z_IREFM0_MX"));*/
//      tcrnum  = 27;
//       /*vcorner := VNM;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_RDM1_EVEN,
//               TNUM_BANK_IREF_RDM1_ODD,ssample,true,"Z_IREFM1_NM"));*/
//      vcorner = VMN;
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_RDM1_EVEN,
//              TNUM_BANK_IREF_RDM1_ODD,ssample,true,"Z_IREFM1_MN"));
//       /*vcorner := VMX;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IREF_RDM1_EVEN,
//               TNUM_BANK_IREF_RDM1_ODD,ssample,true,"Z_IREFM1_MX"));*/
//   } 
//   
//   PwrupAtVnom_1;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   tcrnum = 26;
   tcrmode = ReadMode;
   
   vcorner = VNME;
   final_results = F021_Bank_Para_func(TNUM_BANK_IREF_RDM0_EVEN,post,vcorner,tcrnum,tcrmode);

   new_active_sites = ActiveSites;
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   
   if(SetActiveSites(new_active_sites) and (GL_BANKTYPE != FLESBANK))  
   {
      vcorner = VNMO;
      final_results = F021_Bank_Para_func(TNUM_BANK_IREF_RDM0_ODD,post,vcorner,tcrnum,tcrmode);
   } 

   new_active_sites = ActiveSites;
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   
   if(SetActiveSites(new_active_sites))   
   {
      tcrnum = 27;
      vcorner = VNME;
      final_results = F021_Bank_Para_func(TNUM_BANK_IREF_RDM1_EVEN,post,vcorner,tcrnum,tcrmode);
   } 

   new_active_sites = ActiveSites;
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   
   if(SetActiveSites(new_active_sites) and (GL_BANKTYPE != FLESBANK))  
   {
      tcrnum = 27;
      vcorner = VNMO;
      final_results = F021_Bank_Para_func(TNUM_BANK_IREF_RDM1_ODD,post,vcorner,tcrnum,tcrmode);
   } 
   
   RunTime.SetActiveSites(new_active_sites);
   
   return (final_results);
}   /* Iref_RM01_Vnom_func */


TMResultM IPMOS_Read_Vnom_func()
{
   const IntS TESTID = 46; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum,ssample;
   TPModeType tcrmode;
   Sites savesites, new_active_sites;

   GL_FLTESTID = TESTID;
   tcrnum = 40;
   tcrmode = ReadMode;

// :TODO: Implement characterization code.
//   if(TI_FlashCharEna and GL_DO_CHARZ_INTERNAL_IREF_VCG)  
//      Charz_Internal_Iref_VCG;
//   
//   if(TI_FlashCharEna and GL_DO_CHARZ_IPMOS_RD)  
//   {
//      ssample = 1;
//       /*vcorner := VNM;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IPMOS_READ_EVEN,
//               TNUM_BANK_IPMOS_READ_ODD,ssample,true,"Z_IPMOSRD_NM"));*/
//      vcorner = VMN;
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IPMOS_READ_EVEN,
//              TNUM_BANK_IPMOS_READ_ODD,ssample,true,"Z_IPMOSRD_MN"));
//       /*vcorner := VMX;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IPMOS_READ_EVEN,
//               TNUM_BANK_IPMOS_READ_ODD,ssample,true,"Z_IPMOSRD_MX"));*/
//   } 

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   vcorner = VNME;
   final_results = F021_Bank_Para_func(TNUM_BANK_IPMOS_READ_EVEN,post,vcorner,tcrnum,tcrmode);

   savesites = ActiveSites;
   new_active_sites = ActiveSites;
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   
   if(SetActiveSites(new_active_sites) and (GL_BANKTYPE != FLESBANK))  
   {
      vcorner = VNMO;
      final_results = F021_Bank_Para_func(TNUM_BANK_IPMOS_READ_ODD,post,vcorner,tcrnum,tcrmode);
   } 
   
   // cleanup
   RunTime.SetActiveSites(savesites);
   
   return (final_results);
}   /* IPMOS_Read_Vnom_func */


TMResultM IPMOS_Pvfy_Vnom_func()
{
   const IntS TESTID = 47; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum,ssample;
   TPModeType tcrmode;
   Sites savesites, new_active_sites;

   tcrnum = 40;
   tcrmode = PvfyMode;
   
// :TODO: Implement characterization code.
//   if(TI_FlashCharEna and GL_DO_CHARZ_IPMOS_PVFY)  
//   {
//      ssample = 1;
//       /*vcorner := VNM;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IPMOS_PVFY_EVEN,
//               TNUM_BANK_IPMOS_PVFY_ODD,ssample,true,"Z_IPMOSPV_NM"));*/
//      vcorner = VMN;
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IPMOS_PVFY_EVEN,
//              TNUM_BANK_IPMOS_PVFY_ODD,ssample,true,"Z_IPMOSPV_MN"));
//       /*vcorner := VMX;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IPMOS_PVFY_EVEN,
//               TNUM_BANK_IPMOS_PVFY_ODD,ssample,true,"Z_IPMOSPV_MX"));*/
//   } 
//   
//    /*PwrupAtVmin_1;*/
//   PwrupAtVnom_1;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   vcorner = VNME;
   final_results = F021_Bank_Para_func(TNUM_BANK_IPMOS_PVFY_EVEN,post,vcorner,tcrnum,tcrmode);

   savesites = ActiveSites;
   new_active_sites = ActiveSites;
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   
   if(SetActiveSites(new_active_sites) and (GL_BANKTYPE != FLESBANK))  
   {
      vcorner = VNMO;
      final_results = F021_Bank_Para_func(TNUM_BANK_IPMOS_PVFY_ODD,post,vcorner,tcrnum,tcrmode);
   }    
   
   // cleanup
   RunTime.SetActiveSites(savesites);
   
   return (final_results);
}   /* IPMOS_Pvfy_Vnom_func */


TMResultM IPMOS_Evfy_Vnom_func()
{
   const IntS TESTID = 48; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum,ssample;
   TPModeType tcrmode;
   Sites savesites, new_active_sites;

   GL_FLTESTID = TESTID;
   tcrnum = 40;
   tcrmode = EvfyMode;
   
// :TODO: Implement characterization code.
//   if(TI_FlashCharEna and GL_DO_CHARZ_IPMOS_EVFY)  
//   {
//      ssample = 1;
//       /*vcorner := VNM;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IPMOS_EVFY_EVEN,
//               TNUM_BANK_IPMOS_EVFY_ODD,ssample,true,"Z_IPMOSEV_NM"));*/
//      vcorner = VMN;
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IPMOS_EVFY_EVEN,
//              TNUM_BANK_IPMOS_EVFY_ODD,ssample,true,"Z_IPMOSEV_MN"));
//       /*vcorner := VMX;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IPMOS_EVFY_EVEN,
//               TNUM_BANK_IPMOS_EVFY_ODD,ssample,true,"Z_IPMOSEV_MX"));*/
//   } 
//   
//    /*PwrupAtVmax_1;*/
//   PwrupAtVnom_1;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   vcorner = VNME;
   final_results = F021_Bank_Para_func(TNUM_BANK_IPMOS_EVFY_EVEN,post,vcorner,tcrnum,tcrmode);

   savesites = ActiveSites;
   new_active_sites = ActiveSites;
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   
   if(SetActiveSites(new_active_sites) and (GL_BANKTYPE != FLESBANK))  
   {
      vcorner = VNMO;
      final_results = F021_Bank_Para_func(TNUM_BANK_IPMOS_EVFY_ODD,post,vcorner,tcrnum,tcrmode);
   } 
   
   // cleanup
   RunTime.SetActiveSites(savesites);
   
   return (final_results);

}   /* IPMOS_Evfy_Vnom_func */


TMResultM IPMOS_Cvfy_Vnom_func()
{
   const IntS TESTID = 49; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum,ssample;
   TPModeType tcrmode;
   Sites savesites, new_active_sites;

   GL_FLTESTID = TESTID;
   tcrnum = 40;
   tcrmode = CvfyMode;
   
// :TODO: Implement characterization code.
//   if(TI_FlashCharEna and GL_DO_CHARZ_IPMOS_CVFY)  
//   {
//      ssample = 1;
//       /*vcorner := VNM;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IPMOS_CVFY_EVEN,
//               TNUM_BANK_IPMOS_CVFY_ODD,ssample,true,"Z_IPMOSCV_NM"));*/
//      vcorner = VMN;
//      discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IPMOS_CVFY_EVEN,
//              TNUM_BANK_IPMOS_CVFY_ODD,ssample,true,"Z_IPMOSCV_MN"));
//       /*vcorner := VMX;
//       discard(Charz_Iref_Repeat(vcorner,tcrnum,tcrmode,TNUM_BANK_IPMOS_CVFY_EVEN,
//               TNUM_BANK_IPMOS_CVFY_ODD,ssample,true,"Z_IPMOSCV_MX"));*/
//   } 
//   
//    /*PwrupAtVmin_1;*/
//   PwrupAtVnom_1;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   vcorner = VNME;
   final_results = F021_Bank_Para_func(TNUM_BANK_IPMOS_CVFY_EVEN,post,vcorner,tcrnum,tcrmode);

   savesites = ActiveSites;
   new_active_sites = ActiveSites;
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
   
   if(SetActiveSites(new_active_sites) and (GL_BANKTYPE != FLESBANK))  
   {
      vcorner = VNMO;
      final_results = F021_Bank_Para_func(TNUM_BANK_IPMOS_CVFY_ODD,post,vcorner,tcrnum,tcrmode);
   } 
   
   // cleanup
   RunTime.SetActiveSites(savesites);
   
   return (final_results);

}   /* IPMOS_Cvfy_Vnom_func */


//BoolS SA_Iref_Load_Read_Vmin_func()
//{
//   const IntS TESTID = 55; 
//
//   BoolM final_results;
//   Vcornertype vcorner;
//   StringS current_shell;
//   IntS tcrnum;
//   TPModeType tcrmode;
//   BoolS savebool;
//
//   PwrupAtVmin_1;
//
//   savebool = ti_flashdebug;
//   ti_flashdebug = false;
//   
//   current_shell = "FlashShell";
//   if(GL_PREVIOUS_SHELL != current_shell)        
//      F021_LoadFlashShell_func;
//   
//   GL_FLTESTID = TESTID;
//   tcrnum = 70;
//   tcrmode = ReadMode;
//   
//   vcorner = VMNE;
//   F021_Bank_Para_MBox_func(TNUM_SA_IREF_LOAD_READ_EVEN,post,vcorner,tcrnum,tcrmode,final_results);
// /*
//    if(v_any_dev_active) then
//    begin
//       vcorner := VMNO;
//       discard(F021_Bank_Para_MBox_func(TNUM_SA_IREF_LOAD_READ_ODD,post,vcorner,tcrnum,tcrmode,final_results));
//    end;
//    */
//   ti_flashdebug = savebool;
//   
//   SA_Iref_Load_Read_Vmin_func = v_any_dev_active;
//}   /* SA_Iref_Load_Read_Vmin_func */

TMResultM SA_Iref_NoLoad_Read_Vmin_func()
{
   const IntS TESTID = 56; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS savebool;

   savebool = TI_FlashDebug;
   TI_FlashDebug = false;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   tcrnum = 71;
   tcrmode = ReadMode;
   
   vcorner = VMNE;
   final_results = F021_Bank_Para_MBox_func(TNUM_SA_IREF_NOLOAD_READ_EVEN,post,vcorner,tcrnum,tcrmode);
 /*
    if(v_any_dev_active) then
    begin
       vcorner := VMNO;
       discard(F021_Bank_Para_MBox_func(TNUM_SA_IREF_NOLOAD_READ_ODD,post,vcorner,tcrnum,tcrmode,final_results));
    end;
    */
   TI_FlashDebug = savebool;
   
   return (final_results);
}   /* SA_Iref_NoLoad_Read_Vmin_func */

TMResultM IWLDRV_Prog_Vmin_func()
{
   const IntS TESTID = 57; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS savebool;

   savebool = TI_FlashDebug;
   TI_FlashDebug = false;
   
   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   tcrnum = 69;
   tcrmode = ProgMode;
   vcorner = VMNE;
   final_results = F021_Bank_Para_MBox_func(TNUM_IWLDRV_PROG_EVEN,post,vcorner,tcrnum,tcrmode);
 /*
    if(v_any_dev_active) then
    begin
       vcorner := VMNO;
       discard(F021_Bank_Para_MBox_func(TNUM_IWLDRV_PROG_ODD,post,vcorner,tcrnum,tcrmode,final_results));
    end;
    */
   TI_FlashDebug = savebool;
   
   return (final_results);
}   /* IWLDRV_Prog_Vmin_func */


TMResultM IWLDRV_Prog_Vmax_func()
{
   const IntS TESTID = 58; 

   TMResultM final_results;
   VCornerType vcorner;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS savebool;

   savebool = TI_FlashDebug;
   TI_FlashDebug = false;
   
   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   tcrnum = 69;
   tcrmode = ProgMode;
   vcorner = VMXE;
   final_results = F021_Bank_Para_MBox_func(TNUM_IWLDRV_PROG_EVEN,post,vcorner,tcrnum,tcrmode);
 /*
    if(v_any_dev_active) then
    begin
       vcorner := VMXO;
       discard(F021_Bank_Para_MBox_func(TNUM_IWLDRV_PROG_ODD,post,vcorner,tcrnum,tcrmode,final_results));
    end;
    */
   TI_FlashDebug = savebool;
   
   return (final_results);
}   /* IWLDRV_Prog_Vmax_func */


TMResultM WLS_Leak_Vmax_func()
{
   const IntS TESTID = 72; 

   TMResultM final_results = TM_PASS; //runena could cause skips
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   VCornerType vcorner;
   BoolS runena;
   Sites savesites = ActiveSites;

   if(SelectedTITestType==MP1)  
      runena = true;
   else
      runena = false;

   if(runena)  
   {      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      
      if(GL_DO_WLS_LEAK_OPTION==BANK_GANG)  
      {
         tcrnum = 58;
         tcrmode = ProgMode;
         vcorner = VMX;      
         final_results = F021_Flash_Leak_func(TNUM_BANK_WLS,"WLS_Leak_Test",post,vcorner,tcrnum,tcrmode);
      }
      else  /*if(GL_DO_WLS_LEAK_OPTION=BANK_ODDEVEN) then*/
      {
         if(GL_BANKTYPE!=FLESBANK)  
         {
            tcrnum = 59;
            tcrmode = ProgMode;
            vcorner = VMXO;      
            final_results = F021_Flash_Leak_func(TNUM_BANK_WLS_ODD,"WLSO_Leak_Test",post,vcorner,tcrnum,tcrmode);
         } 
         
         Sites new_active_sites = ActiveSites;
         new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
         if(SetActiveSites(new_active_sites))  
         {
            tcrnum = 60;
            tcrmode = ProgMode;
            vcorner = VMXE;
            final_results = F021_Flash_Leak_func(TNUM_BANK_WLS_EVEN,"WLSE_Leak_Test",post,vcorner,tcrnum,tcrmode);
         }
         
         // re-enable any sites disabled
         RunTime.SetActiveSites(savesites);
      } 
   } 
   
   return (final_results);
}   /* WLS_Leak_Vmax_func */


TMResultM BLS_Leak_Vmax_func()
{
   const IntS TESTID = 73; 

   TMResultM final_results = TM_PASS;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   VCornerType vcorner;
   BoolS runena;
   Sites savesites = ActiveSites;

   if(SelectedTITestType==MP1)  
      runena = true;
   else
      runena = false;

   if(runena)  
   {      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      
      if(GL_DO_BLS_LEAK_OPTION==BANK_GANG)  
      {
         tcrnum = 15;
         tcrmode = ProgMode;
         vcorner = VMX;
         final_results = F021_Flash_Leak_func(TNUM_BANK_BLS,"BLS_Leak_Test",post,vcorner,tcrnum,tcrmode);
      }
      else  /*if(GL_DO_BLS_LEAK_OPTION=BANK_ODDEVEN) then*/
      {
         if(GL_BANKTYPE!=FLESBANK)  
         {
            tcrnum = 17;
            tcrmode = ProgMode;
            vcorner = VMXO;
            final_results = F021_Flash_Leak_func(TNUM_BANK_BLS_ODD,"BLSO_Leak_Test",post,vcorner,tcrnum,tcrmode);
         } 
         
         Sites new_active_sites = ActiveSites;
         new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
         if(SetActiveSites(new_active_sites))          
         {
            tcrnum = 16;
            tcrmode = ProgMode;
            vcorner = VMXE;
            final_results = F021_Flash_Leak_func(TNUM_BANK_BLS_EVEN,"BLSE_Leak_Test",post,vcorner,tcrnum,tcrmode);
         } 
         
         // re-enable any sites disabled
         RunTime.SetActiveSites(savesites);      
      } 
   } 
   
   return (final_results);
}   /* BLS_Leak_Vmax_func */


TMResultM Pump_Leak_Vmax_func()
{
   TMResultM final_results;
   BoolS tstBin;
   StringS current_shell,str1;
   IntS tcrnum,loop,testnum;
   TPModeType tcrmode;
   VCornerType vcorner;
   TPMeasType savemeastype;
   FloatS tdelay,maxtime,llim,ulim;
   FloatS rampstart,rampstop,iProg;
//required for ramp_tpad call, which is currently commented out
// option is a VLCT Type that can be one of many different things
//F021_Ramp_TPAD has pgmMode as it's last argument, but the implementation
//of F021_Ramp_TPAD does not even us the pgmMode input
//   option pgmMode;
   PinM testpad;
   FloatM FloatSval;
//  unitval is the units (seconds, amps, etc) associated with a variable
//  Unison can use GetUints for this.  No need for unitval.
//   TWunit unitval;
   FloatM meas_value;

//   if(v_any_dev_active)  
   if (ActiveSites.GetPassingSites().AnyEqual(true))
   {
      //This function not yet implemented
      //PwrupAtVmax_1(); 
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdelay  = 10ms;
      maxtime = GL_F021_PARAM_MAXTIME;
      testnum = TNUM_PUMP_VHV_FORCE_ERS;
      vcorner = VMX;
      tcrnum  = 86;
      testpad = FLTP1;

      savemeastype = TCR.TP1_MeasType[tcrnum];
      TCR.TP1_MeasType[tcrnum] = MeasCurrType;
      
      for (loop = 1;loop <= 2;loop++)
      {
         if(loop==1)  
         {
            tcrmode = CvfyMode;
            str1 = "PUMP_CG_LEAK";
         }
         else
         {
            tcrmode = EvfyMode;
            str1 = "PUMP_EG_LEAK";
         } 
         
         llim      = TCR.TP1_LLim[tcrnum][tcrmode];
         ulim      = TCR.TP1_ULim[tcrnum][tcrmode];
         rampstart = TCR.TP1_VCharLo[tcrnum][tcrmode];
         rampstop  = TCR.TP1_VCharHi[tcrnum][tcrmode];
         iProg     = 1.2*TCR.TP1_IRange[tcrnum][tcrmode];
 //F021_Ramp_TPAD has pgmMode as it's last argument, but the implementation
//of F021_Ramp_TPAD does not even us the pgmMode input
//        pgmMode   = S_VI_Mode;
            
         F021_TurnOff_AllTPADS();
//TMResultM F021_RunTestNumber_PMEX(    IntS testnum,
//                                     FloatS maxtimeout,
 //                                    BoolS testPassPin)
         final_results = F021_RunTestNumber_PMEX(testnum,maxtime,tstBin);
         TIME.Wait(tdelay);
//void F021_Ramp_TPAD(PinM TPAD,
//                         FloatS rampstart,
//                         FloatS rampstop,
//                         FloatS iProg)
         F021_Ramp_TPAD(testpad,rampstart,rampstop,iProg);
         TIME.Wait(tdelay);
//FloatM F021_Meas_TPAD_PMEX(   PinM TPAD,
//                                 IntS TCRnum,
//                                 TPModeType TCRMode)
         meas_value = F021_Meas_TPAD_PMEX(testpad,tcrnum,tcrmode); //,llim,ulim,meas_value,final_results));
         F021_Ramp_TPAD(testpad,rampstop,rampstart,iProg);
         TIME.Wait(tdelay);
         //disabling pm exits do not apply in Unison
//         Disable(s_pmexit);

         PUMP_LEAK_VALUE.SetValue(tcrmode,vcorner,meas_value);

         //need to implement testware locally
//         TWTRealToRealMS(meas_value,realval,unitval);
//         TWPDLDataLogRealVariable(str1, unitval,realval,TWMinimumData);
         TWPDLDataLogRealVariable(str1, meas_value.GetUnits(),meas_value,TWMinimumData);
//
//         if(tistdscreenprint)  
//         {
//            PrintHeaderParam(GL_PLELL_FORMAT);
//            PrintResultParam(str1,testnum,final_results,LLim,ULim,meas_value,GL_PLELL_FORMAT);
//         } 
      }   /*for loop*/

      TCR.TP1_MeasType[tcrnum] = savemeastype;      
   }   /*if (ActiveSites.GetPassingSites().AnyEqual(true))*/
//   
//   Pump_Leak_Vmax_func = v_any_dev_active;
//   Pump_Leak_Vmax_func = ActiveSites.GetPassingSites().AnyEqual(true);
   return(final_results);
}   /* Pump_Leak_Vmax_func */
//
// /*CG lkg minus pump cg lkg*/
//TMResultM CGS_Leak_Vmax_func()
TMResultM CGS_Leak_Vmax_func()
{
   const IntS TESTID = 74; 

   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   VCornerType vcorner; //vcorner gets assigned to one of VCornerType.  So it can't be a string.
   //StringS vcorner;
   BoolS runena;

   if(SelectedTITestType==MP1)  
      runena = true;
   else
      runena = false;

//   if(v_any_dev_active and runena)  
   if (ActiveSites.GetPassingSites().AnyEqual(true))
   {
//      PwrupAtVmax_1;
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
       //get pump lkg
      Pump_Leak_Vmax_func();
      GL_FLTESTID = TESTID;
      
      if(GL_DO_CGS_LEAK_OPTION==BANK_GANG)  
      {
         tcrnum = 7;
         tcrmode = ProgMode;
         vcorner = VMX;
         //CGSE_Leak_Test is a VLCT-defined test name.  Treat it as a string in this context.
         final_results = F021_Flash_Leak_func(TNUM_BANK_CGS,"CGS_Leak_Test",post,vcorner,tcrnum,tcrmode);
      }
      else  //if(GL_DO_CGS_LEAK_OPTION=BANK_ODDEVEN) then
      {
         if(GL_BANKTYPE!=FLESBANK)  
         {
            tcrnum = 8;
            tcrmode = ProgMode;
 //           vcorner = VMXO;
//            F021_Flash_Leak_func(TNUM_BANK_CGS_ODD,CGSO_Leak_Test,post,vcorner,tcrnum,tcrmode,final_results);
         } 
         
//         if(v_any_dev_active)  
         if(true)  
         {
            tcrnum = 9;
            tcrmode = ProgMode;
            vcorner = VMXE;
//            F021_Flash_Leak_func(TNUM_BANK_CGS_EVEN,CGSE_Leak_Test,post,vcorner,tcrnum,tcrmode,final_results);
//CGSE_Leak_Test is a VLCT-defined test name.  Treat it as a string in this context.
            final_results = F021_Flash_Leak_func(TNUM_BANK_CGS_EVEN,"CGSE_Leak_Test",post,vcorner,tcrnum,tcrmode);
         } 
      } 
   } 
   
//   CGS_Leak_Vmax_func = v_any_dev_active;
   return(final_results);
}   /* CGS_Leak_Vmax_func */


TMResultM EGCSS_Leak_Vmax_func()
{
   const IntS TESTID = 75; 

   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   VCornerType vcorner;
   BoolS runena;

   if( SelectedTITestType == MP1)  
      runena = true;
   else
      runena = false;

//   if(v_any_dev_active and runena)  
     if (ActiveSites.GetPassingSites().AnyEqual(true))
     {
//      PwrupAtVmax_1; //This code has not yet been implemente
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tcrnum = 13;
      tcrmode = ProgMode;
      vcorner = VMXE;
      
      final_results = F021_Flash_Leak_func(TNUM_BANK_EGCSS,"EGCSS_Leak_Test",post,vcorner,tcrnum,tcrmode);
     } 
//   
//   EGCSS_Leak_Vmax_func = v_any_dev_active;
   return(final_results);
}   /* EGCSS_Leak_Vmax_func */
//
//
// /*bank ers stress lkg minus pump eg lkg*/
TMResultM EGS_Leak_Vmax_func()
{
   const IntS TESTID = 76; 

   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   VCornerType vcorner;
   BoolS runena;

   if(SelectedTITestType==MP1)  
      runena = true;
   else
      runena = false;

//   if(v_any_dev_active and runena)  
     if (ActiveSites.GetPassingSites().AnyEqual(true))
   {
      //PwrupAtVmax_1; //This code has not yet been implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tcrnum = 23;
      tcrmode = ErsMode;
      vcorner = VMXE;
      
      final_results = F021_Flash_Leak_func(TNUM_BANK_EGS,"EGS_Leak_Test",post,vcorner,tcrnum,tcrmode);
   } 
   
//   EGS_Leak_Vmax_func = v_any_dev_active;
   return(final_results);
}   /* EGS_Leak_Vmax_func */
//
// /*KChau 03/10/11 - will need to update test name & jazz config later*/
// /*CGEG 1s stress/lkg include pump cg lkg. this is different than CGS_Leak_Vmax_func*/
// /*sequence: cg lkg @11.3v tcr7, stress 100ms, lkg, stress 400ms, lkg, stress 500ms, lkg*/
//Changed the return type from BoolS to BoolM.  Maybe needs to be TMResultM?  --BJP
TMResultM EGCG_Leak_Vmax_func()
{
   const IntS TESTID = 77; 

   BoolM savesites;
   BoolM dlta_results;
   StringS current_shell,str1,str2,str3;
   IntS tcrnum,site,bank,testnum,stnum,count;
   TPModeType tcrmode,tcrmode_stress;
   VCornerType vcorner;
   FloatS tdelay,maxtime;
   FloatM ttimer1,llim,ulim,dltlim;
   FloatS strtime0,strtime;
   FloatS rampstart,rampstop,iProg;
   FloatS rampstart_lkg,rampstop_lkg,iprog_lkg;
   FloatS rampstart_str,rampstop_str,iprog_str;
//required for ramp_tpad call, which is currently commented out
//   option pgmMode;
   PinM testpad;
   FloatM FloatSval;
// Code is defined, need to implement testware locally
//   TWunit unitval;
   FloatM tt_timer,meas_val,dlta,meas_pre;
   BoolS dlogonly;
   FloatS1D stresstime(5);
   TPMeasType savetpmeastype;
   Levels PS_Vmax = "PowerUpAtVmax";
   TMResultM TestRslt,tmp_results,final_results;
   
//Unison is sited
//   if(v_any_dev_active)  
//   {
      PS_Vmax.Execute();
//      PwrupAtVmax_1;
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
//Unison is sited      
//      savesites = v_dev_active;
//      final_results = v_dev_active;
   
      GL_FLTESTID = TESTID;
      tdelay  = 10ms;
      maxtime = GL_F021_PARAM_MAXTIME;
      stnum   = TNUM_BANK_CGS;
      testpad = FLTP1;
      tcrnum  = 7;   /*bank CG stress*/
      vcorner = VMX;

      savetpmeastype = TCR.TP1_MeasType[tcrnum];  /*lkg*/
      tcrmode = ProgMode;  /*lkg*/
      llim      = TCR.TP1_LLim[tcrnum][tcrmode];
      ulim      = TCR.TP1_ULim[tcrnum][tcrmode];
      dltlim    = CGEG_VCG_LEAK_Pvfy_Delta;
      rampstart_lkg = TCR.TP1_VCharLo[tcrnum][tcrmode];
      rampstop_lkg  = TCR.TP1_VCharHi[tcrnum][tcrmode];
      iprog_lkg     = 1.2*TCR.TP1_IRange[tcrnum][tcrmode];
//required for ramp_tpad call, which is currently commented out
//      pgmMode   = S_VI_Mode;

       /*total stress time is 1s*/
      stresstime[1] = 100ms;
      stresstime[2] = 400ms;
      stresstime[3] = 500ms;
      tcrmode_stress = PvfyMode;
      rampstart_str = TCR.TP1_VCharLo[tcrnum][tcrmode_stress];
      rampstop_str  = TCR.TP1_VCharHi[tcrnum][tcrmode_stress];
      iprog_str     = TCR.TP1_IRange[tcrnum][tcrmode_stress];

      dlogonly  = not (PUMP_BANK_PARA_BINOUT[tcrnum][tcrmode_stress][1]);
//just use our own dlog code
//      PrintHeaderParam(GL_PLELL_FORMAT);

      TIME.StartTimer();
//     timernstart(ttimer1);      
//We don't need no steenkin TestOpen
 //     TestOpen(EGCG_Leak_Test);

      for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
      {
         testnum = stnum+(bank<<4);
         str1 = CONV.IntToString(bank);
//         writestring(str1,bank:1);
         str1 = "CGStrs_Leak_B" + str1;
         str3 = str1 + "_DLT";

         for (count = 1;count <= 4;count++)
         {
//Unison is sited
//            tmp_results = v_dev_active;
             /*meas lkg*/
            F021_TurnOff_AllTPADS();
 //original code           TestRslt = F021_RunTestNumber_PMEX(testnum,maxtime,tmp_results);
//          Ignore the pass pin as a first pass
            TestRslt = F021_RunTestNumber_PMEX(testnum,maxtime);
            TCR.TP1_MeasType[tcrnum] = savetpmeastype;  /*meascurrtype*/
//This tries to force 11.3V, which is out of range
//            F021_Set_TPADS(tcrnum,tcrmode);
            TIME.Wait(tdelay);
//original code            F021_Meas_TPAD_PMEX(testpad,tcrnum,tcrmode,llim,ulim,meas_val,tmp_results);
//          Our implemntation of F021_Meas_TPAD_PMEX doesn't have that many arguments
            meas_val = F021_Meas_TPAD_PMEX(testpad,tcrnum,tcrmode);
//Original code            F021_Ramp_TPAD(testpad,rampstop_lkg,rampstart_lkg,iProg_lkg,pgmMode);
//This tries to force 7.5333V, which is out of range
 //           F021_Ramp_TPAD(testpad,rampstop_lkg,rampstart_lkg,iprog_lkg);
//            VLCT need a special procedure to and boolean arrays
//            arrayandboolean(final_results,final_results,tmp_results,v_sites);
            if (SYS.TesterSimulated())
               meas_val = ((ulim - llim) / 2.) + llim;
            tmp_results = TIDlog.Value(meas_val,testpad,llim,ulim,meas_val.GetUnits(),str3,UTL_VOID,UTL_VOID,true,TWMinimumData);
            final_results = DLOG.AccumulateResults(final_results, tmp_results);            
            
            if (count==1)
            {
              str2 = str1 + "_0S";
              meas_pre = meas_val;
            }
            else if (count==2)
              str2 = str1 + "_100MS";
            else if (count==3)
              str2 = str1 + "_400MS";
            else if (count==4)
              str2 = str1 + "_500MS";
            
            //switch statement doesn't seem to work
            /*switch(count) {
              case 1 :  
                     str2 = str1 + "_0S";
                     meas_pre = meas_val;
                   break; 
              case 2 : str2 = str1 + "_100MS";
              case 3 : str2 = str1 + "_400MS";
              case 4 : str2 = str1 + "_500MS";
            } */  /* case */
            
// Code is defined, need to implement testware locally
//            TWTRealToRealMS(meas_val,realval,unitval);
            TWPDLDataLogRealVariable(str2, meas_val.GetUnits(),meas_val,TWMinimumData);
//            PrintResultParam is not defined yet
//            PrintResultParam(str2,testnum,tmp_results,LLim,ULim,meas_val,GL_PLELL_FORMAT);

             /*stressing*/
            if(count<4)  
            {
               strtime = stresstime[count];
               TCR.TP1_MeasType[tcrnum] = ForceVoltType;

//               F021_Ramp_TPAD(testpad,rampstart_str,rampstop_str,iProg_str,pgmMode);
// This tries to ramp voltage to 8.6667V which is out of range
//               F021_Ramp_TPAD(testpad,rampstart_str,rampstop_str,iprog_str);
               TIME.Wait(strtime);
// This tries to ramp voltage to 8.667V which is out of range
//               F021_Ramp_TPAD(testpad,rampstop_str,rampstart_str,iprog_str);
               if(tistdscreenprint)  
                  cout<<"Stressing @ "<<rampstop_str<<"  "<<strtime<<endl;
            } 
//          VLCT artifact
//            Disable(s_pmexit);
            F021_TurnOff_AllTPADS();

            if(count>1)  
            {
//             Unison is sited
//               dlta_results = v_dev_active;
//             VLCT requires special procedure to do array math
//               arraysubtreal(dlta,meas_val,meas_pre,v_sites);
               dlta = meas_val - meas_pre;
//Unison is sited
//               for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//                  if(v_dev_active[site])  
//                        if(abs(dlta[site]) > dltlim)  
//                        {
//                            dlta_results[site] = false;
//                            final_results[site] = false;
//                        } 

               if (SYS.TesterSimulated())
                  dlta = 0;
               tmp_results = TIDlog.Value(dlta,testpad,-dltlim,dltlim,dlta.GetUnits(), str2,UTL_VOID,UTL_VOID,true,TWMinimumData);               
               final_results = DLOG.AccumulateResults(final_results,tmp_results);            
               if (count==2)
                  str2 = str3 + "_100MS";
               else if (count==3)
                  str2 = str3 + "_400MS";
               else if (count==4)
                  str2 = str3 + "_500MS";
                  
               /*switch(count) {
                 case 2 : str2 = str3 + "_100MS";
                 case 3 : str2 = str3 + "_400MS";
                 case 4 : str2 = str3 + "_500MS";
              } */  /* case */

// Code is defined, need to implement testware locally
//               TWTRealToRealMS(dlta,realval,unitval);
               TWPDLDataLogRealVariable(str2, dlta.GetUnits(),dlta,TWMinimumData);
//            PrintResultParam is not defined yet
//               PrintResultParam(str2,testnum,dlta_results,LLim,ULim,dlta,GL_PLELL_FORMAT);
            }   /*if count*/
               
         }   /*for count*/
// This is a VLCT Devsetholdstates which explicitly turns off sites based on the contents
// of the final_results array.  Don't think this is required since Unison is sited
//         if((not TIIgnoreFail) and (not TI_FlashCOFEna) and (not dlogonly))  
//            Devsetholdstates(final_results);

//Unison is sited         
//         if(not v_any_dev_active)  
//            break;
//      }   /*for bank*/

// This is a VLCT Devsetholdstates which explicitly turns off sites based on the contents
// of the final_results array.  Don't think this is required since Unison is sited
//      Devsetholdstates(savesites);
      
// Allows VLCT program to record pass/fail results without keeping track of sites that aren't
// active.  Since Unison is sited this probably isn't required.
//      if(not dlogonly)  
//         ResultsRecordActive(final_results, S_NULL);
//      else
//         ResultsRecordActive(savesites, S_NULL);         
//      TestClose;

      ttimer1 = TIME.StopTimer();
      tt_timer = ttimer1;

      str1 = "CGStrs_Leak";
      str2 = str1 + "_TTT";

// Code is defined, need to implement testware locally
//      TWTRealToRealMS(tt_timer,realval,unitval);
      TWPDLDataLogRealVariable(str2, "S",ttimer1,TWMinimumData);

      if(tistdscreenprint)  
      {
// There is no code for this procedure
//         PrintResultBool(str1,stnum,final_results,GL_PLELL_FORMAT);
         cout << "   TT " << ttimer1 << endl;
         cout << endl;
      }         /*if tistdscreenprint*/
      
// This is a VLCT Devsetholdstates which explicitly turns off sites based on the contents
// of the final_results array.  Don't think this is required since Unison is sited
//      if((not TIIgnoreFail) and (not TI_FlashCOFEna) and (not dlogonly))  
//         DevSetHoldStates(final_results);
   } 

//   EGCG_Leak_Vmax_func = v_any_dev_active;
     return final_results;
}   /* EGCG_Leak_Vmax_func */
//
//
//BoolS Charz_EraseRefArray_Main()
//{
//   BoolM final_results;
//   BoolM savesites,activesites;
//   StringS current_shell,str1,str2;
//   BoolS adaptena;
//   IntS site;
//   FloatS pwstart,pwstop,pwinc;
//   FloatS startv,stopv,stepv;
//   FloatS itarget;
//   VcornerType vcorner;
//
//   if(TI_FlashCharEna and GL_DO_CHARZ_ERSREFARR)  
//   {
//      vcorner = VNM;
//      switch(GL_CHARZ_ERSREFARR_COUNT) {
//        case 1   :  
//        case str1 = "----- CHARZ REFARR ERS EXP1 : ";
//         str2 = "Z_IP";
//         pwstart = 2ms;
//         pwstop  = 10ms;
//         pwinc   = 2ms;
//         startv  = 9V;
//         stopv   = 10V;
//         stepv   = 1V;
//         itarget = -56uA;
//           break; 
//        case 2   :  
//        case str1 = "----- CHARZ REFARR ERS EXP2 : ";
//         str2 = "Z_IP";
//         pwstart = 2ms;
//         pwstop  = 10ms;
//         pwinc   = 2ms;
//         startv  = 10V;
//         stopv   = 10V;
//         stepv   = 1V;
//         itarget = -56uA;
//           break; 
//        default:  
//        case str1 = "----- CHARZ REFARR ERS DEEP : ";
//       str2 = "Z_IP";
//       pwstart = 50ms;
//       pwstop  = 50ms;
//       pwinc   = 10ms;
//       startv  = 13V;
//       stopv   = 13V;
//       stepv   = 1V;
//           itarget = -114uA;
//         break; 
//      }   /* case */
//
//      if(tistdscreenprint)  
//      {
//         cout << endl;
//     cout << str1 << startv:-5 << "  PW Start " << pwstart:-7 << " PWINC " << pwinc:-7 << "  -----" << endl;
//      } 
//      
//      Charz_EraseRefArray(vcorner,pwstart,pwstop,pwinc,startv,stopv,stepv,itarget,true,str2);
//      GL_CHARZ_BCC_COUNT = GL_CHARZ_ERSREFARR_COUNT;
//      GL_CHARZ_ERSREFARR_SAVECOUNT = GL_CHARZ_ERSREFARR_COUNT;
//      GL_CHARZ_ERSREFARR_COUNT = GL_CHARZ_ERSREFARR_COUNT+1;
//      if(GL_CHARZ_ERSREFARR_COUNT>1)  
//         GL_CHARZ_ERSREFARR_COUNT = 0;
//   } 
//   
//   Charz_EraseRefArray_Main = v_any_dev_active;
//}  /* Charz_EraseRefArray_Main */

 /*do erase refarray 1st then boost refarray on retest sites if any*/
TMResultM EraseRefArray_func()
{
   const IntS TESTID = 41; 

   Sites savesites, virgin_sites, boost_sites;
   BoolM virgin_device, boost_device;
   bool any_site_active;
   TMResultM final_results = TM_PASS;
   BoolS adaptena,boostena;

//  :TODO: come back and implement Char stuff...for now, unimportant
//   if(TI_FlashCharEna and GL_DO_CHARZ_ERSREFARR and (GL_CHARZ_ERSREFARR_COUNT>0))  
//   {
//      Charz_EraseRefArray_Main;
//   }
//   else
//   {

      F021_LoadFlashShell_func();

      RAM_Upload_SoftTrim(0xAA55,MAINBG_TRIMSAVED,MAINIREF_TRIMSAVED,FOSC_TRIMSAVED,
              VHV_SLPCT_TRIMSAVED,VSA5CT_TRIMSAVED);  /*KChau 09/10/10*/
      RAM_Clear_MailBox_Key();
      
      GL_FLTESTID = TESTID;
      boostena = false;
      savesites = ActiveSites;
      any_site_active = true;
      
      // only works on active sites
      virgin_device = !SITE_IPMOS_TRIMMED; 
      boost_device = SITE_IPMOS_TRIMMED;

      if (boost_device.AnyEqual(true))
      {
         boostena = true;
         virgin_sites = ActiveSites;
         virgin_sites.DisableFailingSites(virgin_device);
         any_site_active = SetActiveSites(virgin_sites);
      }
     
      if(any_site_active)  
      {
         adaptena = GL_DO_REFARR_ERS_ADAPTIVE;
         final_results = F021_RefArr_Erase_func("RefArr_Ers_Test",adaptena);
            
         if(GL_DO_CHARZ_ERSREFARR)  
         {
            GL_CHARZ_ERSREFARR_SAVECOUNT = 0;
            GL_CHARZ_ERSREFARR_COUNT = 1;
            GL_CHARZ_BCC_COUNT = 0;
         } 
      } 

      if(boostena)  
      {
         boost_sites = savesites;
         boost_sites.DisableFailingSites(boost_device);
         any_site_active = SetActiveSites(boost_sites);
         if(any_site_active && GL_DO_IREF_PMOS_TRIM && GL_DO_BOOST_REFARR)  
         {
            GetTrimCode_On_EFStr();
            RAM_Upload_PMOS_TrimCode();
            TL_Boost_RefArray();
            RAM_Clear_PMOS_SoftTrim();
         } 
      } 

//   }   /*non-charz*/

   RunTime.SetActiveSites(savesites);

    /*enable W8/W9 template override in RAM*/
   if(TI_FlashCharEna and GL_DO_CHARZ_ERSREFARR)  
      GL_DO_CHARZ_OVRTEMPL_W89 = true;
   
   return (final_results);
}   /* EraseRefArray_func */

//BoolS VHV_Stress_Prog_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS tcrnum;
//   TPModeType tcrmode;
//
//   PwrupAtVmax_1;
//
//   current_shell = "FlashShell";
//   if(GL_PREVIOUS_SHELL != current_shell)        
//      F021_LoadFlashShell_func;
//
//   tcrnum = 86;
//   tcrmode = ProgMode;
//   F021_Stress_func(TNUM_PUMP_VHV_FORCE_PROG,VHVStrProg_Test,tcrnum,tcrmode,final_results);
//
//   VHV_Stress_Prog_func = v_any_dev_active;
//}   /* VHV_Stress_Prog_func */
//   
//
//BoolS VHV_Stress_Pvfy_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS tcrnum;
//   TPModeType tcrmode;
//
//   PwrupAtVmax_1;
//
//   current_shell = "FlashShell";
//   if(GL_PREVIOUS_SHELL != current_shell)        
//      F021_LoadFlashShell_func;
//
//   tcrnum = 86;
//   tcrmode = PvfyMode;
//   F021_Stress_func(TNUM_PUMP_VHV_FORCE_PVFY,VHVStrPvfy_Test,tcrnum,tcrmode,final_results);
//
//   VHV_Stress_Pvfy_func = v_any_dev_active;
//}   /* VHV_Stress_Pvfy_func */


TMResultM VHV_Stress_Ers_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   tcrnum = 86;
   tcrmode = ErsMode;
   final_results = F021_Stress_func(TNUM_PUMP_VHV_FORCE_ERS,"VHVStrErs_Test",tcrnum,tcrmode);

   return (final_results);
}   /* VHV_Stress_Ers_func */
   

// /*oxide btween WL and FG stress*/
TMResultM RevTunnel_Stress_func()
{
   const IntS TESTID = 167; 

   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS do_ena;

   if(MainBCC.ENA[REVTUNVT1][post] or MainVT.ENA[REVTUNVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1; //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tcrnum = 54;
      tcrmode = ProgMode;
      
      final_results=F021_Stress_func(TNUM_BANK_REVTUNN_STRESS,"RevTun_Stress_Test",tcrnum,tcrmode);
   } 
   
//   RevTunnel_Stress_func = v_any_dev_active;
   return(final_results);
}   /* RevTunnel_Stress_func */


// oxide below FG stress
TMResultM PgmFF_Stress_func() {
   const IntS TESTID = 158; 

   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS do_ena;

   if (MainBCC.ENA[PGMFFVT1][post] or MainVT.ENA[PGMFFVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {
   
#if $TP3_TO_TP5_PRESENT  
   tcrnum =  52;
#else
   tcrnum = 107;
#endif

      // KChau -- A08 mix mode - use mms
      tcrnum = 107;
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tcrmode = ProgMode;
      
      final_results = F021_Stress_func(TNUM_BANK_PGMFF_STRESS,"PGMFF_Stress_Test",tcrnum,tcrmode);
   } 
   return(final_results);

}   // PgmFF_Stress_func

//
// /*oxide below FG stress*/
TMResultM PunchThru_Stress_func()
{
   const IntS TESTID = 176; 

   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS do_ena;

   if(MainBCC.ENA[PUNTHRUVT1][post] or MainVT.ENA[PUNTHRUVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1; //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tcrnum = 54;
      tcrmode = PvfyMode;   /*Note: actual mode is ProgMode but use PvfyMode for different bias cond w/ same tcr#*/
      
      final_results = F021_Stress_func(TNUM_BANK_PTHRU_STRESS,"PunThru_Stress_Test",tcrnum,tcrmode);
   } 
   
//   PunchThru_Stress_func = v_any_dev_active;
   return(final_results);
}   /* PunchThru_Stress_func */

//
TMResultM FGWL_Stress_func() {
   const IntS TESTID = 149; 

   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS do_ena;

   if (MainBCC.ENA[FGWLVT1][post] or MainVT.ENA[FGWLVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;

#if $TP3_TO_TP5_PRESENT  
      tcrnum = 52;;
#else
      tcrnum = 107;
#endif
   
      // KChau -- A08 mix mode - use mms
      tcrnum = 107;
      tcrmode = PvfyMode; // Note: actual mode is ProgMode but use PvfyMode for different bias cond w/ same tcr#
      final_results = F021_Stress_func(TNUM_BANK_PGMFF_STRESS,"FGWL_Stress_Test",tcrnum,tcrmode);
   } 
     return(final_results);

}   // FGWL_Stress_func


// oxide below FG stress
TMResultM TunOxide_Stress_func() {
   const IntS TESTID = 185; 

   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS do_ena;

   if (MainBCC.ENA[TUNOXVT1][post] or MainVT.ENA[TUNOXVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {  
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
#if $TP3_TO_TP5_PRESENT  
      tcrnum = 52;
#else
      tcrnum = 108;
#endif
   
      // KChau -- A08 mix mode - use mms
      tcrnum = 108;
      tcrmode = EvfyMode;   // actual mode is ProgMode
      
      final_results = F021_Stress_func(TNUM_BANK_TUNOX_STRESS, "TunOx_Stress_Test", tcrnum, tcrmode);
   }
   
   return (final_results);
}   // TunOxide_Stress_func


TMResultM ONO_Stress_func()
{
   const IntS TESTID = 207; 

   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if(MainBCC.ENA[ONOVT0][post] or MainVT.ENA[ONOVT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tcrnum = 53;
      tcrmode = PvfyMode;  /*Note: actual mode is ProgMode but use PvfyMode for different bias cond w/ same tcr#*/
      
      final_results=F021_Stress_func(TNUM_BANK_ONO_STRESS,"ONO_Stress_Test",tcrnum,tcrmode);
   } 
   
//   ONO_Stress_func = v_any_dev_active;
   return(final_results);
}   /* ONO_Stress_func */
//
//
// /*oxide btween FG and EG stress*/
TMResultM ThinOxide_Stress_func()
{
   const IntS TESTID = 194; 

   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS do_ena;

   if(MainBCC.ENA[THINOXVT1][post] or MainVT.ENA[THINOXVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1(); 
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tcrnum = 54;
      tcrmode = ErsMode;   /*Note: actual mode is ProgMode but use ErsMode for different bias cond w/ same tcr#*/
      
      final_results = F021_Stress_func(TNUM_BANK_THINOX_STRESS,"ThinOx_Stress_Test",tcrnum,tcrmode);
   } 
   
//   ThinOxide_Stress_func = v_any_dev_active;
   return(final_results);
}   /* ThinOxide_Stress_func */
//
//
// /*oxide btween WL and FG stress*/
TMResultM ReadDisturb_Stress_func()
{
   const IntS TESTID = 229; 

   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if(MainBCC.ENA[RDDISTBVT0][post] or MainVT.ENA[RDDISTBVT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tcrnum = 58;  /*use wls*/
      tcrmode = ReadMode;   /*Note: use ReadMode for different bias cond w/ same tcr#*/
      
      final_results=F021_Stress_func(TNUM_BANK_RDDIST_STRESS,"RdDistb_Stress_Test",tcrnum,tcrmode);
   } 
   
//   ReadDisturb_Stress_func = v_any_dev_active;
   return(final_results);
}   /* ReadDisturb_Stress_func */
//
//
//
// /*++++++++++*/
//BoolS FlowCheck_func()
//{
//   const IntS TESTID = 4; 
//
//   BoolM final_results;
//
//   GL_FLTESTID = TESTID;
//   if(v_any_dev_active)  
//   {
//      powerupatvnom(dcsetup_loosevnom,norm_fmsu);
//      clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vnom],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(2ms);      
//      F021_LoadFlashShell_func;
//      RAM_Clear_SoftTrim_All;
//      RAM_Clear_PMOS_SoftTrim;
//      RAM_Clear_MailBox_Key;
//      F021_FlowCheck_func(final_results);
//   } 
//
//   FlowCheck_func = v_any_dev_active;
//}   /* FlowCheck_func */

TMResultM FOSC_VCO_Vmin_func()
{
   TMResultM final_results;
   StringS current_shell, testpattern;
   IntS tnum;
   PinM tpin;
   FloatS ttimer1,llim,ulim;
   FloatM meas_value, sim_val;
   IntM msw_tnum,lsw_tnum;
   UnsignedM pulse_count;
   TMU_MEASURE_TYPE measopt;

   final_results = TM_NOTEST;

#if !$FL_USE_DCC_TRIM_FOSC

    /*KChau - temp test at vnom until get proper limits*/
   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   llim = FOSC_LLimit;
   ulim = FOSC_ULimit;
   sim_val = (ulim - llim) / 2. + llim;
   tpin = FL_FOSC_EXTERNAL_PIN;
   testpattern = FL_FOSC_EXTERNAL_PATTERN;
   measopt = TMU_MEASURE_FREQUENCY_COUNTER;  /*clkwidth*/
   pulse_count = 1000;

   TIME.StartTimer();

    /*dummy run*/
   meas_value = MeasPinTMU_func(tpin, testpattern, measopt, ulim, sim_val, pulse_count);

   meas_value = MeasPinTMU_func(tpin, testpattern, measopt, ulim, sim_val, pulse_count);
   
   final_results = TIDlog.Value(meas_value, tpin, llim, ulim, "MHz", 
                   "FOSC_DCC_MN", UTL_VOID, UTL_VOID, false, TWMinimumData);

   Get_TLogSpace_TNUM(msw_tnum,lsw_tnum);

   ttimer1 = TIME.StopTimer();
   
   if(tistdscreenprint)  
   {
      tnum = (msw_tnum[ActiveSites.Begin().GetValue()] << 16) + lsw_tnum[ActiveSites.Begin().GetValue()];
      cout << "F021 test number 0x" << hex << tnum << endl;
      cout << "   TT " << ttimer1 << endl;
      cout << endl;
   } 

#endif

   return (final_results);
} /* FOSC_VCO_Vmin_func */

// dummy test...not even bothering.
//BoolS FOSC_VCO_Vmax_func()
//{
//   BoolM final_results;
//
//   FOSC_VCO_Vmax_func = v_any_dev_active;
//} 

//BoolS FOSC_DCC_Vmin_func()
//{
//   BoolM final_results,savesites;
//   BoolM tmp_results;
//   StringS current_shell,str1,str2;
//   FloatS maxtime,ttimer1;
//   IntS site,tnum,llim,ulim;
//   IntM fvalhi,fvallo,fmeas;
//
//#if $FL_USE_DCC_TRIM_FOSC  
//   if(v_any_dev_active)  
//   {
//       /*PwrupAtVmin_1;*/
//       /*KChau - temp test at vnom until get proper limits*/
//      PwrupAtVnom_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      savesites = v_dev_active;
//      final_results = v_dev_active;
//      tmp_results = v_dev_active;
//
//      maxtime = GL_F021_PARAM_MAXTIME;
//      tnum = TNUM_PUMP_MAINOSC;
//      llim = 17100;  /*in khz*/
//      ulim = 18900;  /*in khz*/
//
//      timernstart(ttimer1);
//      TestOpen(FOSC_DCC_MN_Test);
//      
//      F021_RunTestNumber(tnum,maxtime,spare_mstreal1,tmp_results);
//      Get_TLogSpace_MeasFreq(fvalhi,fvallo);
//
//      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//         if(v_dev_active[site])  
//         {
//            fmeas[site] = (fvalhi[site]<<16) + fvallo[site];  /*in khz*/
//            if((fmeas[site] < llim) or (fmeas[site] > ulim))  
//               final_results[site] = false;
//         } 
//
//      if(GL_DO_FOSC_TRIM)  
//         ResultsRecordActive(final_results, S_NULL);
//      else
//         ResultsRecordActive(savesites, S_NULL);
//      TestClose;
//
//      ttimer1 = timernread(ttimer1);
//      
//      str1 = "FOSC_DCC_MN";
//      TWPDLDataLogVariable(str1,fmeas, TWMinimumData);
//      
//      if(tistdscreenprint)  
//      {
//         PrintHeaderBool(GL_PLELL_FORMAT);
//         PrintResultInt(str1,tnum,fmeas,llim,ulim,GL_PLELL_FORMAT);
//         PrintResultBool(str1,tnum,final_results,GL_PLELL_FORMAT);
//         cout << "   TT " << ttimer1 << endl;
//         cout << endl;
//      } 
//
//      if((not TIIgnoreFail) and (not TI_FlashCOFEna) and GL_DO_FOSC_TRIM)  
//         DevSetHoldStates(final_results);      
//   } 
//#endif
//   
//   FOSC_DCC_Vmin_func = v_any_dev_active;
//}   /* FOSC_DCC_Vmin_func */
//   
//
//BoolS FOSC_DCC_Vmax_func()
//{
//   BoolM final_results;
//
//   FOSC_DCC_Vmax_func = v_any_dev_active;
//} 
//

TMResultM Pump_VHV_Stress_func()
{
   const IntS TESTID = 39; 

   TMResultM final_results;

   GL_FLTESTID = TESTID;
 /*   discard(VHV_Stress_Prog_func);
    discard(VHV_Stress_Pvfy_func);*/
   final_results = VHV_Stress_Ers_func();
   
   return (final_results);
}   /* Pump_VHV_Stress_func */
   

TMResultM TP1TP2_Leak_Pre_func()
{
   const IntS TESTID = 40; 

   TMResultM final_results;
   StringS current_shell;
   FloatS tdelay;
   IntS tcrnum,tnum;
   TPModeType tcrmode;
   VCornerType vcorner;
   Sites savesites, new_active_sites;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   tcrnum  = 0;
   tcrmode = ReadMode;
   vcorner = VMX;
   tnum    = TNUM_ALWAYS_PASS;
   final_results = F021_Pump_Para_func(tnum,pre,vcorner,tcrnum,tcrmode);

   savesites = ActiveSites;
   new_active_sites = ActiveSites;
   new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
  
   if(SetActiveSites(new_active_sites))  
   {
      tcrmode = ProgMode;
      final_results = F021_Pump_Para_func(tnum,pre,vcorner,tcrnum,tcrmode);
   } 
   
   // cleanup
   RunTime.SetActiveSites(savesites);

   return (final_results);
}   /* TP1TP2_Leak_Pre_func */


TMResultM IrefPMOS_Trim_func()
{
   const IntS TESTID = 43; 
   const IntS PUMP_EF_LEN = 30; 
   const IntS BANK_EF_LEN = 32; 

   TMResultM final_results = TM_PASS;
   Sites savesites,untrimmed_sites;
   IntS count,totbanklen,length;
   StringS1D bank_str(8);
   StringS dummstr1,dummstr2;
   IntS pump_sind,pump_len,bank_sind,bank_len;

   if(GL_DO_FLASHTRIM and GL_DO_IREF_PMOS_TRIM)  
   {
      GL_FLTESTID = TESTID;
      savesites = ActiveSites;
      untrimmed_sites = ActiveSites;
       /*init site to flash trim to false. it gets update in *SoftTrim_func*/
       /*ArraySetBoolean(SITE_TO_FTRIM,false);} {KChau 01/12/11 - one pass efuse pgm*/

       /*dis-able retest (already trimmed) site*/
      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
      {
         if(GL_FLASH_RETEST[*si] and SITE_IPMOS_TRIMMED[*si])  
         {
            untrimmed_sites -= *si;
            if(tistdscreenprint)  
               cout << "Site : " << *si << "  Already PMOS Trimmed so Disable." << endl;
         }
      }

      if(SetActiveSites(untrimmed_sites))  
      {
         pump_sind = 0;  // string index
         pump_len  = PUMP_EF_LEN;
         bank_sind = pump_len; // string index
         bank_len  = BANK_EF_LEN;
         totbanklen = (F021_Flash.MAXBANK+1)*bank_len;

         F021_LoadFlashShell_func();
         RAM_Upload_SoftTrim(0xAA55,MAINBG_TRIMSAVED,MAINIREF_TRIMSAVED,FOSC_TRIMSAVED,
              VHV_SLPCT_TRIMSAVED,VSA5CT_TRIMSAVED);  /*KChau 01/12/11*/
         RAM_Clear_PMOS_SoftTrim();

 /*psk022411: Enabling IPMOS trim based on NMOS Read current*/

         /* discard(F021_IPMOS_SoftTrim_func); } {old method*/
         
          /*new method nmos based - 0=ipmos, 1=nmos rd, 2=nmos ev*/
         
         F021_IPMOS_NMOS_SoftTrim_func(GL_PMOS_TRIM_COUNT);
//         if(GL_PMOS_TRIM_COUNT==0)  
//            str1 = "PMOS";
//         else if(GL_PMOS_TRIM_COUNT==1)  
//            str1 = "NMOS_RD";
//         else
//            str1 = "NMOS_EV";
         /* GL_PMOS_TRIM_COUNT := GL_PMOS_TRIM_COUNT+1;
          if(GL_PMOS_TRIM_COUNT>2) then
             GL_PMOS_TRIM_COUNT := 0;*/
          

          /*determine any site need to be trimmed*/
         if (SITE_TO_FTRIM.AnyEqual(true))  
         {
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
            {
               SITE site = *si;
               if(SITE_TO_FTRIM[site])  
               {
                   /*update efuse string with trim code*/
                  dummstr1 = SaveFlashProgString[site].Substring(pump_sind,pump_len);
                  FlashProgString[site] = dummstr1;

                  dummstr2 = SaveFlashProgString[site].Substring(bank_sind,totbanklen);

                  for (count = 0;count <= F021_Flash.MAXBANK;++count)
                  {
                     if(BANK_TO_PMOS_TRIM[count][site])  
                        bank_str[count] = IREF_PMOSTRIMCODE_STR[count][site];
                     else
                        bank_str[count] = dummstr2.Substring(0,bank_len);

                     length = dummstr2.Length()-bank_len;
                     if(length>=bank_len)  
                        dummstr2 = dummstr2.Substring(bank_len,length);
                  } 

                  for (count = 0;count <= F021_Flash.MAXBANK;++count)
                     FlashProgString[site] = FlashProgString[site] + bank_str[count];

                   /*save for later use*/
                  SaveFlashProgString[site] = FlashProgString[site];  /*lsb-msb*/

                  if(tistdscreenprint)  
                  {
                     dummstr1 = FlashProgString[site];
                     dummstr2 = ReverseString(dummstr1);
                     dummstr1 = StringBinToHex(dummstr1);
                     cout << "Site " << site << 
                             "  MSB-LSB : " << dummstr1 << endl;
                     if(TI_FlashDebug)  
                     {
                        cout << "Site " << site << 
                                "  To Be Trimmed (MSB-LSB) : " << 
                                FlashProgString[site] << endl;
                        cout << "Site " << site << 
                                "  LSB-MSB : " << dummstr2 << endl;
                     } 
                  }   /*tistdscreenprint*/
               }
            } /* end site loop */

             /*TWPDLDatalogTextMS("TRIM_PMOS_BY",logstr,twminimumdata);*/
            
            final_results = ProgramFlashTrim("FTrimProg3_st","FTrimPstRd3_st","FTrimPstRdMg3_st",
                                             FlashProgString,margFlashChainStr);
         }            /*if not(arraycompare)*/
      }   /*if v_any_active*/

      RunTime.SetActiveSites(savesites);
   } 
         
    /*null out gl_previous_shell*/
   GL_PREVIOUS_SHELL = "";

   return (final_results);
} 

//BoolS BLCharge_Signal_func()
//{
//   BoolM final_results;
//
//   BLCharge_Signal_func = v_any_dev_active;
//} 
//
//BoolS SAPreCharge_Signal_func()
//{
//   BoolM final_results;
//
//   SAPreCharge_Signal_func = v_any_dev_active;
//} 
//
//BoolS SALATENZ_Signal_func()
//{
//   BoolM final_results;
//
//   SALATENZ_Signal_func = v_any_dev_active;
//} 
//
//

TMResultM PreconOTP_func() {
   const IntS TESTID = 245; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;

   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   testnum = TNUM_OTP_PRECON;

   tname = "PreconOTP_Test";
   
   final_results = F021_Program_func(testnum,tname);

   return(final_results);

}   /* PreconOTP_func */
   

TMResultM RdM0OTP_func() {
   const IntS TESTID = 246; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;

   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   if (GL_DO_FL_PBIST)  
      testnum = TNUM_PBIST_RDM0S+TNUM_TARGET_OTP;
   else
      testnum = TNUM_OTP_RDM0S;

   tname = "RdM0OTP_Test";
   final_results = F021_Read_func(testnum,tname);

   return(final_results);

}   // RdM0OTP_func
   

TMResultM EraseOTP_func() {
   const IntS TESTID = 247; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;

   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   testnum = TNUM_OTP_ERS_PRECON;  // sm ers

   tname = "ErsOTP_Test";
   final_results = F021_Erase_func(testnum,tname);
   
   return(final_results);

}   // EraseOTP_func
   

TMResultM RdM1OTP_func() {
   const IntS TESTID = 248; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;

   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   if (GL_DO_FL_PBIST)  
      testnum = TNUM_PBIST_RDM1S+TNUM_TARGET_OTP;
   else
      testnum = TNUM_OTP_RDM1S;

   tname = "RdM1OTP_Test";
   final_results = F021_Read_func(testnum,tname);
   
   return(final_results);

}   // RdM1OTP_func
   

TMResultM PgmOTPTemplate_func() {
   const IntS TESTID = 249; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS tmpbool,dlogonly;

   GL_FLTESTID = TESTID;

   if (SelectedTITestType!=MP3) {
      if (TI_FlashCharEna and GL_DO_CHARZ_ERSREFARR) {
         tmpbool = GL_DO_CHARZ_OVRTEMPL_W89;
         GL_DO_CHARZ_OVRTEMPL_W89 = false;
         F021_LoadFlashShell_func();
         GL_DO_CHARZ_OVRTEMPL_W89 = tmpbool;
      }
      else {
         current_shell = "FlashShell";
         if (GL_PREVIOUS_SHELL != current_shell)        
            F021_LoadFlashShell_func();
      } 

//    final_results = v_dev_active;
      tname = "PgmOTPTmplt_Test";
      dlogonly = false;

       /*added fake repair*/
      if (GL_DO_REPAIR and (GL_FAKEREP_COUNT == GL_FAKEREP_SAMPLING)) {
//         final_results = Run_Update_FakeRepair(tname,dlogonly);
      }
      else {
         testnum = TNUM_OTP_PROG_TEMPLATE;
         final_results = F021_Program_func(testnum,tname);
      } 
      if (GL_DO_IREF_PMOS_TRIM)
         ;
//         RAM_Clear_PMOS_SoftTrim();
   }
   else {
      // restore otp template @mp3
      RAM_Upload_PMOS_TrimCode();
      tname = "PgmOTPRestore_Test";
      dlogonly = false;
//      final_results = F021_RestoreOTPInfo_func(tname,dlogonly);
      if (GL_DO_IREF_PMOS_TRIM)  
//         RAM_Clear_PMOS_SoftTrim;
      GL_DO_RESTORE_OTP_ON_FAIL = false;
   }
   return(final_results);

// PgmOTPTemplate_func = v_any_dev_active;
}   // PgmOTPTemplate_func
   
TMResultM RdM1OTPTemplate_func() {
   const IntS TESTID = 250; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;

   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   testnum = TNUM_OTP_RDM1S_TEMPLATE;
   tname = "RdM1OTPTmplt_Test";
   final_results = F021_Read_func(testnum,tname);
   
   return(final_results);

} 

TMResultM RdM0OTPTemplate_func() {
   const IntS TESTID = 251; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;

   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   testnum = TNUM_OTP_RDM0S_TEMPLATE;
   tname = "RdM0OTPTmplt_Test";
   final_results = F021_Read_func(testnum,tname);

   return(final_results);
   
} 

//
//BoolS Bank_Cvfy_func()
//{
//   const IntS TESTID = 78; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//
//   TI_FlashCOFEna = false;
//   
//   PwrupAtVmax_1;
//
//   current_shell = "FlashShell";
//   if(GL_PREVIOUS_SHELL != current_shell)        
//      F021_LoadFlashShell_func;
//
//   GL_FLTESTID = TESTID;
//   testnum = TNUM_BANK_CVFY;
//   tname = Bank_Cvfy_Test;
//   F021_Read_func(testnum,tname,final_results);
//
//   Bank_Cvfy_func = v_any_dev_active;
//}   /* Bank_Cvfy_func */
//   

// dummy empty function to separate binning for 9X pgm fail
TMResultM Flash_Cycle9X_Pgm_func() {
   TMResultM dummy_results;

   dummy_results = TM_PASS;
   return(dummy_results);
// Flash_Cycle9X_Pgm_func = v_any_dev_active;
}   // Flash_Cycle9X_Pgm_func

TMResultM Flash_Cycle9X_func() {
   const IntS TESTID = 79; 
   const IntS MINITER = 1; 
   const IntS MAXITER = 9; 

   TMResultM final_results;
   BoolM logsites,soft_results;
   StringS current_shell;
   IntS testnum,loop,tid,PPULim,minloop,maxloop;
   StringS tname;
   StringS1D tname_pg,tname_er; // :MANUAL FIX REQUIRED: array dimensions are : MINITER..MAXITER
   BoolS runpgm,runers;

#if $FL_USE_AUTO_FLOW  
   minloop = MINITER;
   maxloop = MAXITER;
   runpgm  = true;
   runers  = true;
#else
   minloop = MINITER;
   maxloop = MINITER;
   runpgm  = false;
   runers  = true;
#endif
   
   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)       
      F021_LoadFlashShell_func();

   tname_pg[1] = "Cyc9X_Pgm1_Test";
   tname_pg[2] = "Cyc9X_Pgm2_Test";
   tname_pg[3] = "Cyc9X_Pgm3_Test";
   tname_pg[4] = "Cyc9X_Pgm4_Test";
   tname_pg[5] = "Cyc9X_Pgm5_Test";
   tname_pg[6] = "Cyc9X_Pgm6_Test";
   tname_pg[7] = "Cyc9X_Pgm7_Test";
   tname_pg[8] = "Cyc9X_Pgm8_Test";
   tname_pg[9] = "Cyc9X_Pgm9_Test";

   tname_er[1] = "Cyc9X_Ers1_Test";
   tname_er[2] = "Cyc9X_Ers2_Test";
   tname_er[3] = "Cyc9X_Ers3_Test";
   tname_er[4] = "Cyc9X_Ers4_Test";
   tname_er[5] = "Cyc9X_Ers5_Test";
   tname_er[6] = "Cyc9X_Ers6_Test";
   tname_er[7] = "Cyc9X_Ers7_Test";
   tname_er[8] = "Cyc9X_Ers8_Test";
   tname_er[9] = "Cyc9X_Ers9_Test";

   GL_FLTESTID = TESTID;

// final_results = v_dev_active;
// soft_results = v_dev_active;
   
   for (loop = minloop; loop <= maxloop; ++loop) {
      // pgm
      if (runpgm)  {
//       logsites = v_dev_active;
         tname   = tname_pg[loop];

         if(GL_DO_PGM_USING_PBIST)
            testnum = TNUM_FASTPRECON;
         else
            testnum = TNUM_BANK_PROG_SM;

         if (GL_DO_REDENA)  
            testnum = testnum+TNUM_REDUNDENA;

         if (loop==1) {
            PPULim = 1;
//            final_results = F021_Special_Program_func(testnum,tname,PPULim,soft_results);
            // softbinning
//          TestOpen(GoodHiPP_Test);
//          ResultsRecordActive(soft_results, S_NULL);
//          TestClose;
         }
         else {
            final_results = F021_Program_func(testnum,tname);
         } 
         
//          if(not arraycompareboolean(logsites,final_results,v_sites))  
         if (TI_FlashESDAEna) {  
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
               if ( final_results[*si] != TM_PASS ) {
                  FLEsda.Tnum = TNUM_BANK_RDM0S;
                  FLEsda.ImageNum = ESDA_IMG_CYC9X_PGM0S;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
            }   // TI_FlashESDAEna
         }
      }

      // ers
      if (runers) {
//       logsites = v_dev_active;
         tname   = tname_er[loop];
         
         if(GL_DO_ERS_BY_SECTOR)
            testnum = TNUM_SECT_ERS_NOPRECON_SM;
         else
            testnum = TNUM_BANK_ERS_NOPRECON;
            
         if (GL_DO_REDENA)  
            testnum = testnum+TNUM_REDUNDENA;

         final_results = F021_Erase_func(testnum,tname);

//       if(not arraycompareboolean(logsites,final_results,v_sites))  
         if (TI_FlashESDAEna) {
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
               if ( final_results[*si] != TM_PASS ) {
                  FLEsda.Tnum = TNUM_BANK_RDM1S;
                  if (GL_DO_ERS_BY_SECTOR)  
                     FLEsda.Tnum = FLEsda.Tnum+TNUM_TARGET_SECT;
                  FLEsda.ImageNum = ESDA_IMG_CYC9X_ERS;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
            }
         }
      }

//    if(not v_any_dev_active)  
//       break;
   }   // loop
   return(final_results);
   
// Flash_Cycle9X_func = v_any_dev_active;
}


TMResultM RdMChk_func(StringS tname, IntS testnum) {
   TMResultM final_results;

//   final_results = F021_Read_func(testnum,tname);
   return(final_results);
   
}   // RdMChk_func
   
//
//BoolS RdM0DRL_func()
//{
//   const IntS TESTID = 60; 
//
//   StringS tname;
//   IntS testnum,site;
//   BoolM savesites,activesites;
//   BoolM disallsites;
//   StringS current_shell;
//   BoolM logsites;
//   BoolS runena;
//
//#if $FL_USE_AUTO_FLOW==false  
//   runena = false;;
//#else
//   runena = true;
//#endif
//   
//   GL_FLTESTID = TESTID;
//   if(v_any_dev_active and runena)  
//   {
//      Update_FLASH_RETEST_Var;
//      
//      PwrupAtVnom_1;
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      savesites = v_dev_active;
//      logsites = v_dev_active;
//      disallsites = false;
//      
//      ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//      ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//      if(not Arraycompareboolean(activesites,disallsites,v_sites))  
//      {
//         devsetholdstates(activesites);
//         tname   = RdM0ChkDRL_Test;
//         
//         switch(TITestType) {
//           case MP2 :  
//                    testnum = TNUM_BANK_RDM0ECHK;      
//                  break; 
//           case MP3 :  
//                    testnum = TNUM_BANK_RDM0OCHK;      
//                    if(GL_SKIP_MP2_FLASHFLOW)  
//                       testnum = TNUM_BANK_RDM0ECHK;      
//                  break; 
//           default: testnum = TNUM_BANK_RDM0ECHK;
//         }   /* case */
//
//         if(GL_DO_RD_WITH_TOPTION==1)  
//            testnum = testnum+TNUM_TOPTION_PSARD;
//         
//         RdMChk_func(tname,testnum);
//
//         ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//         ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//         devsetholdstates(activesites);
//
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,activesites,v_sites))  
//            {
//               FLEsda.ImageNum = ESDA_IMG_DRL_RDM0S_PST;
//               switch(TITestType) {
//                 case MP2 :  
//                          FLEsda.Tnum = TNUM_BANK_RDM0ECHK;
//                        break; 
//                 case MP3 :  
//                          FLEsda.Tnum = TNUM_BANK_RDM0OCHK;
//                          if(GL_SKIP_MP2_FLASHFLOW)  
//                           
//                             FLEsda.Tnum = TNUM_BANK_RDM0ECHK;
//                           break;                              
//                        break; 
//                 default:  
//                          FLEsda.Tnum = TNUM_BANK_RDM0ECHK;
//                        break; 
//               }   /* case */
//               
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      }
//      else
//      {
//         if(tistdscreenprint)  
//            cout << "All sites are retested -- Bypass RdM0DRL_func" << endl;
//      } 
//   } 
//   
//   RdM0DRL_func = v_any_dev_active;
//}   /* RdM0DRL_func */
//   
//
//BoolS RdM1DRL_func()
//{
//   const IntS TESTID = 61; 
//
//   StringS tname;
//   IntS testnum,site;
//   BoolM savesites,activesites;
//   BoolM disallsites;
//   StringS current_shell;
//   BoolM logsites;
//
//   GL_FLTESTID = TESTID;
//   if(v_any_dev_active)  
//   {
//      PwrupAtVmax_1;
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      savesites = v_dev_active;
//      logsites = v_dev_active;
//      disallsites = false;
//      
//      ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//      ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//      if(not Arraycompareboolean(activesites,disallsites,v_sites))  
//      {
//         devsetholdstates(activesites);
//         tname   = RdM1ChkDRL_Test;
//
//#if $FL_USE_AUTO_FLOW==false  
//         testnum = TNUM_BANK_RDM1s;;
//#else
//         switch(TITestType) {
//           case MP2 :  
//                    testnum = TNUM_BANK_RDM1ECHK;      
//                  break; 
//           case MP3 :  
//                    testnum = TNUM_BANK_RDM1OCHK;      
//                    if(GL_SKIP_MP2_FLASHFLOW)  
//                       testnum = TNUM_BANK_RDM1ECHK;
//                  break; 
//           default:  testnum = TNUM_BANK_RDM1ECHK;      
//         }   /* case */
//#endif
//         
//         if(GL_DO_RD_WITH_TOPTION==1)  
//            testnum = testnum+TNUM_TOPTION_PSARD;
//         
//         RdMChk_func(tname,testnum);
//
//         ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//         ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//         devsetholdstates(activesites);
//         
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,activesites,v_sites))  
//            {
//#if $FL_USE_AUTO_FLOW==false  
//               FLEsda.Tnum = TNUM_BANK_RDM1s;;
//#else
//               switch(TITestType) {
//                 case MP2 :  
//                          FLEsda.Tnum = TNUM_BANK_RDM1ECHK;
//                        break; 
//                 case MP3 :  
//                          FLEsda.Tnum = TNUM_BANK_RDM1OCHK;
//                          if(GL_SKIP_MP2_FLASHFLOW)  
//                           
//                             FLEsda.Tnum = TNUM_BANK_RDM1ECHK;
//                           break; 
//                        break; 
//                 default:  
//                          FLEsda.Tnum = TNUM_BANK_RDM1ECHK;
//                        break; 
//               }   /* case */
//#endif               
//               FLEsda.ImageNum = ESDA_IMG_DRL_RDM1S_PST;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      }
//      else
//      {
//         if(tistdscreenprint)  
//            cout << "All sites are retested -- Bypass RdM0DRL_func" << endl;
//      } 
//   } 
//   
//   RdM1DRL_func = v_any_dev_active;
//}   /* RdM1DRL_func */
//
//BoolS DRLDeltaVT0_func()
//{
//   const IntS TESTID = 63; 
//
//   BoolM final_results;
//   BoolM logsites;
//   IntS pattype;
//   StringS tname;
//   BoolM savesites,activesites;
//   BoolM disallsites;
//   BoolS dlogonly,runena;
//
//#if $FL_USE_AUTO_FLOW==false  
//   if(TITestType==PreBurnIn)  
//      runena = true;
//   else
//      runena = false;
//#else
//   runena = true;
//#endif
//   
//   GL_FLTESTID = TESTID;
//   if(v_any_dev_active and runena)  
//   {
//      savesites = v_dev_active;
//      disallsites = false;
//      
//      ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//      ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//      if(not Arraycompareboolean(activesites,disallsites,v_sites))  
//      {
//         devsetholdstates(activesites);
//     logsites = v_dev_active;
//     final_results = v_dev_active;
//
//         if(MainVT.ENA[CHKVT0DRL][post] and v_any_dev_active and GL_DO_DRL0_USING_VT)  
//         {
//            dlogonly = MainVT.DLOGONLY[CHKVT0DRL][post];
//            tname = DRLDLTVT0_Test;
//            pattype = MainVT.MEMCFG[CHKVT0DRL];
//            F021_VT_Delta_func(pattype,CHKVT0DRL,tname,final_results,dlogonly);
//         } 
//
//         if(MainBCC.ENA[CHKVT0DRL][post] and v_any_dev_active and (not GL_DO_DRL0_USING_VT))  
//         {
//            dlogonly = MainBCC.DLOGONLY[CHKVT0DRL][post];
//            tname = DRLDLTBCC0_Test;
//            pattype = MainBCC.MEMCFG[CHKVT0DRL];
//            F021_BCC_Delta_func(pattype,CHKVT0DRL,tname,final_results,dlogonly);
//         } 
//
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.ImageNum = ESDA_IMG_DRL_VT0_DLT;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//
//         ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//         ArrayAndboolean(activesites,activesites,savesites,v_sites);
//         devsetholdstates(activesites);
//      }
//      else
//      {
//         if(tistdscreenprint)  
//            cout << "All sites are retested -- Bypass DRLDeltaVT0_func" << endl;
//      } 
//   } 
//
//   DRLDeltaVT0_func = v_any_dev_active;
//}   /* DRLDeltaVT0_func */
//   
//
//BoolS DRLDeltaVT1_func()
//{
//   const IntS TESTID = 65; 
//
//   BoolM final_results;
//   BoolM logsites;
//   IntS pattype;
//   StringS tname;
//   BoolM savesites,activesites;
//   BoolM disallsites;
//   BoolS dlogonly;
//
//   GL_FLTESTID = TESTID;
//   if(v_any_dev_active)  
//   {
//      savesites = v_dev_active;
//      disallsites = false;
//      
//      ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//      ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//      if(not Arraycompareboolean(activesites,disallsites,v_sites))  
//      {
//         devsetholdstates(activesites);
//
//         if(MainVT.ENA[CHKVT1DRL][post] and v_any_dev_active and GL_DO_DRL1_USING_VT)  
//         {
//            dlogonly = MainVT.DLOGONLY[CHKVT1DRL][post];
//            tname = DRLDLTVT1_Test;
//            pattype = MainVT.MEMCFG[CHKVT1DRL];
//            F021_VT_Delta_func(pattype,CHKVT1DRL,tname,final_results,dlogonly);
//         } 
//
//         logsites = v_dev_active;
//         
//         if(MainBCC.ENA[CHKVT1DRL][post] and v_any_dev_active and (not GL_DO_DRL1_USING_VT))  
//         {
//            dlogonly = MainBCC.DLOGONLY[CHKVT1DRL][post];
//            tname = DRLDLTBCC1_Test;
//            pattype = MainBCC.MEMCFG[CHKVT1DRL];
//            F021_BCC_Delta_func(pattype,CHKVT1DRL,tname,final_results,dlogonly);
//            if(TI_FlashESDAEna)  
//               if(not arraycompareboolean(logsites,final_results,v_sites))  
//               {
//                  FLEsda.ImageNum = ESDA_IMG_DRL_VT1_DLT;
//                  F021_CollectESDA(FLEsda.ImageNum);
//               } 
//         } 
//
//         ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//         ArrayAndboolean(activesites,activesites,savesites,v_sites);
//         devsetholdstates(activesites);
//      }
//      else
//      {
//         if(tistdscreenprint)  
//            cout << "All sites are retested -- Bypass DRLDeltaVT1_func" << endl;
//      } 
//   } 
//
//   DRLDeltaVT1_func = v_any_dev_active;
//}   /* DRLDeltaVT1_func */
//   
//
//BoolS PstDRLVT0MinOTP_func()
//{
//   const IntS TESTID = 66; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolM savesites,activesites;
//   BoolM disallsites;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS sbool1,sbool2,runena;
//
//#if $FL_USE_AUTO_FLOW==false  
//   runena = false;;
//#else
//   runena = true;
//#endif
//
//   GL_FLTESTID = TESTID;
//   if(v_any_dev_active and runena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      savesites = v_dev_active;
//      disallsites = false;
//      
//      ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//      ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//      if(not Arraycompareboolean(activesites,disallsites,v_sites))  
//      {
//         devsetholdstates(activesites);
//         
//         tdata = OTPTYPE;
//         vtcat = CHKVT0DRL;
//         prepost = post;
//         
//          /*not using pbist on chkb until new shell release*/
//          /*sbool1 := GL_DO_VT_OTP_USING_PBIST;
//          sbool2 := GL_DO_BCC_OTP_USING_PBIST;
//          GL_DO_VT_OTP_USING_PBIST := false;
//          GL_DO_BCC_OTP_USING_PBIST := false;*/
//         
//         if(GL_DO_VT_FIRST)  
//         {
//            tname = PstDRLVT0MinOTP_Test;
//            TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//            tname = PstDRLBCC0MaxOTP_Test;
//            TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//         }
//         else
//         {
//            tname = PstDRLBCC0MaxOTP_Test;
//            TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//            tname = PstDRLVT0MinOTP_Test;
//            TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//         } 
//
//         ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//         ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//         devsetholdstates(activesites);
//          /*GL_DO_VT_OTP_USING_PBIST := sbool1;
//          GL_DO_BCC_OTP_USING_PBIST := sbool2;*/
//      }
//      else
//      {
//         if(tistdscreenprint)  
//            cout << "All sites are retested -- Bypass PstDRLVT0MinOTP_func" << endl;
//      } 
//   } 
//   
//   PstDRLVT0MinOTP_func = v_any_dev_active;
//}   /* PstDRLVT0MinOTP_func */
//   
//
//BoolS DRLDeltaVT0OTP_func()
//{
//   const IntS TESTID = 67; 
//
//   BoolM final_results;
//   IntS pattype;
//   StringS tname;
//   BoolM savesites,activesites;
//   BoolM disallsites;
//   BoolS dlogonly,runena;
//
//#if $FL_USE_AUTO_FLOW==false  
//   runena = false;;
//#else
//   runena = true;
//#endif
//
//   GL_FLTESTID = TESTID;
//   if(v_any_dev_active and runena)  
//   {
//      savesites = v_dev_active;
//      disallsites = false;
//      
//      ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//      ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//      if(not Arraycompareboolean(activesites,disallsites,v_sites))  
//      {
//         devsetholdstates(activesites);
//
//         if(OtpVT.ENA[CHKVT0DRL][post] and v_any_dev_active and GL_DO_DRL0_USING_VT)  
//         {
//            dlogonly = OtpVT.DLOGONLY[CHKVT0DRL][post];
//            tname = DRLDLTVT0OTP_Test;
//            pattype = OTPTYPE;
//            F021_VT_Delta_func(pattype,CHKVT0DRL,tname,final_results,dlogonly);
//         }  
//
//
//         if(OtpBCC.ENA[CHKVT0DRL][post] and v_any_dev_active and (not GL_DO_DRL0_USING_VT))  
//         {
//            dlogonly = OtpBCC.DLOGONLY[CHKVT0DRL][post];
//            tname = DRLDLTBCC0OTP_Test;
//            pattype = OTPTYPE;
//            F021_BCC_Delta_func(pattype,CHKVT0DRL,tname,final_results,dlogonly);
//         } 
//         
//         ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//         ArrayAndboolean(activesites,activesites,savesites,v_sites);
//         devsetholdstates(activesites);
//      }
//      else
//      {
//         if(tistdscreenprint)  
//            cout << "All sites are retested -- Bypass DRLDeltaVT0OTP_func" << endl;
//      } 
//   } 
//
//   DRLDeltaVT0OTP_func = v_any_dev_active;
//}   /* DRLDeltaVT0OTP_func */
//   
//
//BoolS PstDRLVT1MaxOTP_func()
//{
//   const IntS TESTID = 68; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolM savesites,activesites;
//   BoolM disallsites;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS sbool1,sbool2;
//
//   GL_FLTESTID = TESTID;
//   if(v_any_dev_active)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      savesites = v_dev_active;
//      disallsites = false;
//      
//      ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//      ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//      if(not Arraycompareboolean(activesites,disallsites,v_sites))  
//      {
//         devsetholdstates(activesites);
//         
//         tdata = OTPTYPE;
//         vtcat = CHKVT1DRL;
//         prepost = post;
//         
//          /*not using pbist on chkb until new shell release*/
//          /*sbool1 := GL_DO_VT_OTP_USING_PBIST;
//          sbool2 := GL_DO_BCC_OTP_USING_PBIST;
//          GL_DO_VT_OTP_USING_PBIST := false;
//          GL_DO_BCC_OTP_USING_PBIST := false;*/
//         
//         if(GL_DO_VT_FIRST)  
//         {
//            tname = PstDRLVT1MaxOTP_Test;
//            TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//            tname = PstDRLBCC1MinOTP_Test;
//            TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//         }
//         else
//         {
//            tname = PstDRLBCC1MinOTP_Test;
//            TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//            tname = PstDRLVT1MaxOTP_Test;
//            TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//         } 
//
//         ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//         ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//         devsetholdstates(activesites);
//          /*GL_DO_VT_OTP_USING_PBIST := sbool1;
//          GL_DO_BCC_OTP_USING_PBIST := sbool2;*/
//      }
//      else
//      {
//         if(tistdscreenprint)  
//            cout << "All sites are retested -- Bypass PstDRLVT1MaxOTP_func" << endl;
//      } 
//   } 
//   
//   PstDRLVT1MaxOTP_func = v_any_dev_active;
//}   /* PstDRLVT1MaxOTP_func */
//   
//
//BoolS DRLDeltaVT1OTP_func()
//{
//   const IntS TESTID = 69; 
//
//   BoolM final_results;
//   IntS pattype;
//   StringS tname;
//   BoolM savesites,activesites;
//   BoolM disallsites;
//   BoolS dlogonly;
//
//   GL_FLTESTID = TESTID;
//   if(v_any_dev_active)  
//   {
//      savesites = v_dev_active;
//      disallsites = false;
//      
//      ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//      ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//      if(not Arraycompareboolean(activesites,disallsites,v_sites))  
//      {
//         devsetholdstates(activesites);
//
//         if(OtpVT.ENA[CHKVT1DRL][post] and v_any_dev_active and GL_DO_DRL1_USING_VT)  
//         {
//            dlogonly = OtpVT.DLOGONLY[CHKVT1DRL][post];
//            tname = DRLDLTVT1OTP_Test;
//            pattype = OTPTYPE;
//            F021_VT_Delta_func(pattype,CHKVT1DRL,tname,final_results,dlogonly);
//         }  
//
//         if(OtpBCC.ENA[CHKVT1DRL][post] and v_any_dev_active and (not GL_DO_DRL1_USING_VT))  
//         {
//            dlogonly = OtpBCC.DLOGONLY[CHKVT1DRL][post];
//            tname = DRLDLTBCC1OTP_Test;
//            pattype = OTPTYPE;
//            F021_BCC_Delta_func(pattype,CHKVT1DRL,tname,final_results,dlogonly);
//         } 
//         
//         ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//         ArrayAndboolean(activesites,activesites,savesites,v_sites);
//         devsetholdstates(activesites);
//      }
//      else
//      {
//         if(tistdscreenprint)  
//            cout << "All sites are retested -- Bypass DRLDeltaVT1OTP_func" << endl;
//      } 
//   } 
//
//   DRLDeltaVT1OTP_func = v_any_dev_active;
//}   /* DRLDeltaVT1OTP_func */
//   

TMResultM RdM1_PstCycle9X_func() {
   const IntS TESTID = 80; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum,tid;
   StringS tname;

#if $FL_USE_AUTO_FLOW  
   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   tname = "RdM1_PstCyc9X_Test";

   // when using pbist then read func do 1) redund if gl_do_redena=true; 2) main&ecc
   if (GL_DO_FL_PBIST)  
      testnum = TNUM_PBIST_RDM1S;
   else {
      testnum = TNUM_BANK_RDM1S;
      if (GL_DO_RD_WITH_TOPTION==1)  
         testnum = testnum+TNUM_TOPTION_PSARD;
      if (GL_DO_REDENA)  
         testnum = testnum+TNUM_REDUNDENA;
   } 
   
// logsites = v_dev_active;
   final_results = F021_Read_func(testnum,tname);
   
//   if(not arraycompareboolean(logsites,final_results,v_sites))  
   if (TI_FlashESDAEna) {  
      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
         if ( final_results[*si] != TM_PASS ) {
            FLEsda.ImageNum = ESDA_IMG_CYC9X_RDM1S;
            FLEsda.Tnum = TNUM_BANK_RDM1S;
            F021_CollectESDA(FLEsda.ImageNum);
         } 
      }
   }

   // KChau 03/29/10 - added for stress charz
   if (TI_FlashCharEna and GL_DO_CHARZ_STRESS) {
      Charz_TunOx;
      Charz_ONO;
      Charz_ThinOx;
      Charz_CSFG;
      Charz_EGFG;
      Charz_PgmFF;
      Charz_FGWL;
      Charz_RdDisturb;
      Charz_PunThru;
      Charz_RevTun;
      TL_RunTestNum(TNUM_OTP_PROG,"");
   } 
#endif
   return(final_results);
   
}   /* RdM1_PstCycle9X_func */

// /*dummy empty function to separate binning for 1X pgm fail*/
TMResultM Flash_Cycle1X_Pgm_func()
{
   TMResultM final_results = TM_NOTEST;
   
   for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
      if(ActiveSites.GetPassingSites()[*si] == true) final_results[*si] = TM_PASS;
      else final_results[*si] = TM_FAIL;
   return(final_results);
}   /* Flash_Cycle1X_Pgm_func */

TMResultM Flash_Cycle1X_func()
{
   const IntS TESTID = 289; 

   TMResultM final_results = TM_NOTEST;
   TMResultM test_results = TM_NOTEST;
   BoolM logsites, savedsites;
   StringS current_shell;
   IntS testnum,savelimit;
   StringS tname;
   BoolS savebool;
   Levels PS_Vnom = "PowerUpAtVmask";

//   PwrupAtVnom_1; //This code not yet implemented

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)      
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;

//    /*KChau 11/30/11 - added to COF testing all banks then disable failing sites*/
   savebool = TI_FlashCOFEna;
   TI_FlashCOFEna = true;
   
    /*pgm*/
   if(ActiveSites.GetPassingSites().AnyEqual(true))  
   {
       /*KChau 06/10/10 - temporary changed prog limit for Cycle1X*/
      savelimit = BANK_PROG_ULimit;
      BANK_PROG_ULimit = 50;
      
//      logsites = v_dev_active;
      logsites = ActiveSites.GetPassingSites().AnyEqual(true);
      tname   = "Cyc1X_Pgm_Test";
      
#if $GL_USE_DMLED_RAMPMT  
   testnum = TNUM_BANK_PROG_ITERSECTOR;;
#else
      if(GL_DO_PGM_USING_PBIST)  
      {
         testnum = TNUM_FASTPRECON;
      }
      else
         testnum = TNUM_BANK_PROG_SM;
#endif      
      if(GL_DO_REDENA)  

     testnum = testnum+TNUM_REDUNDENA;

//     TMResultM F021_Program_func(    IntS start_testnum,
//                               StringS tname,
//                               BoolM test_results)

      final_results = F021_Program_func(testnum,tname);
//      ArrayAndBoolean(test_results,test_results,final_results,v_sites);
      test_results = DLOG.AccumulateResults(test_results,final_results);
      
      if(TI_FlashESDAEna)  
        //If any site fails
         //if(not arraycompareboolean(logsites,final_results,v_sites))
         if(ActiveSites.GetPassingSites().AnyEqual(false))
         {
             /*if(GL_DO_FL_PBIST) then
                FLEsda.Tnum := TNUM_PBIST_RDM0S
             else*/
               FLEsda.Tnum = TNUM_BANK_RDM0S;
            FLEsda.ImageNum = ESDA_IMG_CYC1X_PGM0S;
            F021_CollectESDA(FLEsda.ImageNum);
         }   /* if */

       /*KChau 06/10/10 - temporary changed prog limit for Cycle1X*/
      BANK_PROG_ULimit = savelimit;
   } 

#if $FL_USE_AUTO_FLOW==false  
    /*rdm0 bank for catalog*/
//   if(v_any_dev_active)  
   if(ActiveSites.GetPassingSites().AnyEqual(true))
   {
      tname = "Cyc1X_RdM0_Test";
      testnum = TNUM_BANK_RDM0S;
      if(GL_DO_REDENA)  
         testnum = testnum+TNUM_REDUNDENA;
      final_results= F021_Read_func(testnum,tname); 
      //ArrayAndBoolean(test_results,test_results,final_results,v_sites);
      test_results = DLOG.AccumulateResults(test_results,final_results);
   } 

    /*pgm otp*/
   //if(v_any_dev_active)  
   if(ActiveSites.GetPassingSites().AnyEqual(true))
   {
      savelimit = BANK_PROG_ULimit;
      BANK_PROG_ULimit = 50;
      tname = "Cyc1XOTP_Pgm_Test";
      testnum = TNUM_OTP_PROG;
      final_results = F021_Program_func(testnum,tname);
      //ArrayAndBoolean(test_results,test_results,final_results,v_sites);
      test_results = DLOG.AccumulateResults(test_results,final_results);
      BANK_PROG_ULimit = savelimit;
   } 
//   
//    /*rdm0 otp for catalog*/
//   if(v_any_dev_active)  
   if(ActiveSites.GetPassingSites().AnyEqual(true))
   {
      tname = "Cyc1XOTP_RdM0_Test";
      testnum = TNUM_OTP_RDM0S;
      final_results = F021_Read_func(testnum,tname); 
      //ArrayAndBoolean(test_results,test_results,final_results,v_sites);
      
      test_results = DLOG.AccumulateResults(test_results,final_results);
   } 
#endif
//   
//    /*ers*/
//   if(v_any_dev_active)  
   if(ActiveSites.GetPassingSites().AnyEqual(true))
   {
       /*KChau 06/10/10 - temporary changed erase limit for Cycle1X*/
      savelimit = BANK_ERS_ULimit;
      BANK_ERS_ULimit = 100;
      
      logsites = ActiveSites.GetPassingSites();
      tname   = "Cyc1X_Ers_Test";
         
      if(GL_DO_ERS_BY_SECTOR)  
      {
         testnum = TNUM_SECT_ERS_NOPRECON_SM;
      }
      else
         testnum = TNUM_BANK_ERS_NOPRECON;
      
      if(GL_DO_REDENA)  
     testnum = testnum+TNUM_REDUNDENA;
      final_results = F021_Erase_func(testnum,tname); 
      //ArrayAndBoolean(test_results,test_results,final_results,v_sites);
      test_results = DLOG.AccumulateResults(test_results,final_results);
      
      if(TI_FlashESDAEna)  
         //if(not arraycompareboolean(logsites,final_results,v_sites))  
         if (ActiveSites.GetPassingSites().AnyEqual(false))
         {
             /*if(GL_DO_FL_PBIST) then
                FLEsda.Tnum := TNUM_PBIST_RDM1S+TNUM_TARGET_SECT
             else*/
               FLEsda.Tnum = TNUM_BANK_RDM1S;
        if(GL_DO_ERS_BY_SECTOR)  
           FLEsda.Tnum = FLEsda.Tnum+TNUM_TARGET_SECT;
            FLEsda.ImageNum = ESDA_IMG_CYC1X_ERS;
            F021_CollectESDA(FLEsda.ImageNum);
         } 

       /*KChau 06/10/10 - temporary changed erase limit for Cycle1X*/
      BANK_ERS_ULimit = savelimit;
   } //if(ActiveSites.GetPassingSites().AnyEqual(true))

#if $FL_USE_AUTO_FLOW==false  
    /*ers otp for catalog*/
//   if(v_any_dev_active)
   if(ActiveSites.GetPassingSites().AnyEqual(true))  
   {
      savelimit = BANK_ERS_ULimit;
      BANK_ERS_ULimit = 100;
      tname = "Cyc1XOTP_Ers_Test";
      testnum = TNUM_OTP_ERS_NOPRECON;
      //F021_Erase_func(testnum,tname,final_results); final_results currently BoolM
      //ArrayAndBoolean(test_results,test_results,final_results,v_sites);
      test_results = DLOG.AccumulateResults(test_results,final_results);
      BANK_ERS_ULimit = savelimit;
   } //if(ActiveSites.GetPassingSites().AnyEqual(true))
#endif
//   
//   TI_FlashCOFEna = savebool;
//   if((not TIIgnoreFail) and (not TI_FlashCOFEna))  
//      Devsetholdstates(test_results);
//   
//   Flash_Cycle1X_func = v_any_dev_active;
   return(test_results);
} 
//
TMResultM RdM1_PstCycle1X_func()
{
   const IntS TESTID = 80; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum,tid;
   StringS tname;
   Levels PS_Vmax = "PowerUpAtVmask";

//   PwrupAtVmax_1; code not yet implemented
   PS_Vmax.Execute();

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   tname = "RdM1_PstCyc1X_Test";

    /*when using pbist then read func do 1) redund if gl_do_redena=true; 2) main&ecc*/
   if(GL_DO_FL_PBIST)  
      testnum = TNUM_PBIST_RDM1S;
   else
   {
      testnum = TNUM_BANK_RDM1S;
      if(GL_DO_RD_WITH_TOPTION==1)  
         testnum = testnum+TNUM_TOPTION_PSARD;
      if(GL_DO_REDENA)  
         testnum = testnum+TNUM_REDUNDENA;
   } 
   
   //logsites = v_dev_active;
   logsites = ActiveSites.GetPassingSites().AnyEqual(true);
   //F021_Read_func(testnum,tname,final_results); not implemented yet
   
   if(TI_FlashESDAEna)  
 //     if(not arraycompareboolean(logsites,final_results,v_sites))
      if(ActiveSites.GetPassingSites().AnyEqual(false))
      {
         FLEsda.ImageNum = ESDA_IMG_CYC1X_RDM1S;
         FLEsda.Tnum = TNUM_BANK_RDM1S;
         F021_CollectESDA(FLEsda.ImageNum);
      } 

#if $FL_USE_AUTO_FLOW==false  
    /*rdm1 otp for catalog*/
//   if(v_any_dev_active)
   if (ActiveSites.GetPassingSites().AnyEqual(true))  
   {
      tname = "RdM1OTP_PstCyc1X_Test";
      testnum = TNUM_OTP_RDM1S;
      final_results = F021_Read_func(testnum,tname); 
   } 
#endif
   
 //  RdM1_PstCycle1X_func = v_any_dev_active;
     return(final_results);
}   /* RdM1_PstCycle1X_func */


TMResultM PgmMain_func()
{
   const IntS TESTID = 81; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum,tid;
   StringS tname;
   VCornerType vcorner;
   FloatS pwstart,pwstop,pwinc;
   BoolS runena;

#if $FL_USE_AUTO_FLOW==false  
   runena = false;;
#else
   runena = true;
#endif

   if(ActiveSites.GetPassingSites().AnyEqual(true) && runena)  
   {
      if(TI_FlashCharEna and GL_DO_CHARZ_PPW)  
      {
         vcorner = VNM;
         pwstart = 4us;
         pwstop  = 10us;
         pwinc   = 1us;
//         Charz_ProgramPW(vcorner,pwstart,pwstop,pwinc,true,"Z_PPW_NM"); //not yet defined
         vcorner = VMX;
         pwstart = 4us;
         pwstop  = 10us;
         pwinc   = 1us;
//         Charz_ProgramPW(vcorner,pwstart,pwstop,pwinc,true,"Z_PPW_MX");  //not yet defined
         vcorner = VMN;
         pwstart = 4us;
         pwstop  = 10us;
         pwinc   = 1us;
//         Charz_ProgramPW(vcorner,pwstart,pwstop,pwinc,true,"Z_PPW_MN"); //not yet defined
      } 
      
//      PwrupAtVnom_1; code not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "PgmMain_Test";
      
      if(GL_DO_PGM_USING_PBIST)  
      {
         testnum = TNUM_FASTPRECON;
      }
      else
         testnum = TNUM_BANK_PROG_SM;
      
      if(GL_DO_REDENA)  
         testnum = testnum+TNUM_REDUNDENA;
      
      final_results = F021_Program_func(testnum,tname);
   
      if(TI_FlashESDAEna)  
      {
         FLEsda.Tnum     = TNUM_BANK_RDM0S;
         FLEsda.ImageNum = ESDA_IMG_PGM0S;
         F021_CollectESDA(FLEsda.ImageNum);
      } 
   } 
//   
//   PgmMain_func = v_any_dev_active;
    return (final_results);
}   /* PgmMain_func */
   

TMResultM RdM0_func()
{
   const IntS TESTID = 82; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum,tid;
   StringS tname;
   BoolS savered,runena;

#if $FL_USE_AUTO_FLOW==false  
   runena = false;;
#else
   runena = true;
#endif
//
//   if(v_any_dev_active and runena)
     if(ActiveSites.GetPassingSites().AnyEqual(true) && runena)
  
   {
//      PwrupAtVnom_1; //code not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "RdM0_Test";
      
      if(GL_DO_FL_PBIST)  
      {
         testnum = TNUM_PBIST_RDM0S;
      }
      else
      {
         testnum = TNUM_BANK_RDM0S;
         if(GL_DO_RD_WITH_TOPTION==1)  
            testnum = testnum+TNUM_TOPTION_PSARD;
         if(GL_DO_REDENA)  
            testnum = testnum+TNUM_REDUNDENA;
      } 
      
      final_results = F021_Read_func(testnum,tname); //not yet implemented
   } 
   
 //  RdM0_func = v_any_dev_active;
    return (final_results);
}   /* RdM0_func */
//   
//
//BoolS BankErsWeak_func()
//{
//   const IntS TESTID = 83; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum,tid;
//   StringS tname;
//   IntS tcrnum,tcrnum_src;
//   TPModeType tcrmode;
//   BoolS runena;
//
//   runena = false;
//
//   if(v_any_dev_active and runena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tcrnum_src = 23;
//      tcrnum = 128;
//      tcrmode = ErsMode;
//      
//      CloneTCR_To_TCR128(tcrmode,tcrmode,tcrnum_src);
//      
//      TCR.TP1_IRange[tcrnum][tcrmode] = 100mA;
//      TCR.TP1_FTime[tcrnum][tcrmode] = 10ms;
//      
//      testnum = TNUM_BANK_EGS;  /*TNUM_BANK_ERS_WEAK;*/
//      tname = ErsWeak_Test;
//      F021_Stress_func(testnum,tname,tcrnum,tcrmode,final_results);
//   } 
//   
//   BankErsWeak_func = v_any_dev_active;
//}   /* BankErsWeak_func */
//   
//
//BoolS RdM1_ErsWeak_func()
//{
//   const IntS TESTID = 84; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum,tid;
//   StringS tname;
//   BoolS runena;
//
//   runena = false;
//
//   if(v_any_dev_active and runena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      if(GL_DO_FL_PBIST)  
//         testnum = TNUM_PBIST_RDM1s;
//      else
//      {
//         testnum = TNUM_BANK_RDM1s;
//         if(GL_DO_RD_WITH_TOPTION==1)  
//            testnum = testnum+TNUM_TOPTION_PSARD;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//      } 
//      
//      tname = RdM1_ErsWeak_Test;
//      F021_Read_func(testnum,tname,final_results);
//   } 
//
//   RdM1_ErsWeak_func = v_any_dev_active;
//}   /* RdM1_ErsWeak_func */
//   
//
//BoolS PgmOneRowMain_func()
//{
//   BoolM final_results;
//
//   PgmOneRowMain_func = v_any_dev_active;
//} 
//
//BoolS BankErs_func()
//{
//   const IntS TESTID = 163; 
//
//   BoolM final_results,logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[REVTUNVT1][pre] and (MainBCC.PREVTYPE[REVTUNVT1]==REVTUNVT1)) or
//      (MainVT.ENA[REVTUNVT1][pre] and (MainVT.PREVTYPE[REVTUNVT1]==REVTUNVT1)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = Ers_Test;
//      
//      if(v_any_dev_active)  
//      {
//         logsites = v_dev_active;
//         if(GL_DO_ERS_BY_SECTOR)  
//         {
//            testnum = TNUM_SECT_ERS_NOPRECON_SM;
//         }
//         else
//            testnum = TNUM_BANK_ERS_PRECON;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//         F021_Erase_func(testnum,tname,final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.Tnum = TNUM_BANK_RDM1s;
//               if(GL_DO_ERS_BY_SECTOR)  
//                  FLEsda.Tnum = FLEsda.Tnum+TNUM_TARGET_SECT;
//               FLEsda.ImageNum = ESDA_IMG_ERS;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      } 
//   } 
//   
//   BankErs_func = v_any_dev_active;
//}   /* BankErs_func */
//   
//
//BoolS PreRevTunVT1_func()
//{
//   const IntS TESTID = 165; 
//
//   BoolM final_results;
//   BoolM logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[REVTUNVT1][pre] and (MainBCC.PREVTYPE[REVTUNVT1]==REVTUNVT1)) or
//      (MainVT.ENA[REVTUNVT1][pre] and (MainVT.PREVTYPE[REVTUNVT1]==REVTUNVT1)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tdata   = BANKTYPE;
//      vtcat   = REVTUNVT1;
//      prepost = pre;
//
//      logsites = v_dev_active;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PreRevTunVT1_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//         tname = PreRevTunBCC1_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.ImageNum = ESDA_IMG_REVTUN_VT1_PRE;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      }
//      else
//      {
//         tname = PreRevTunBCC1_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         tname = PreRevTunVT1_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PreRevTunVT1_func = v_any_dev_active;
//}   /* PreRevTunVT1_func */
//   
//
//BoolS PreRevTunVT1OTP_func()
//{
//   const IntS TESTID = 166; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if((OtpBCC.ENA[REVTUNVT1][pre] and (OtpBCC.PREVTYPE[REVTUNVT1]==REVTUNVT1)) or
//      (OtpVT.ENA[REVTUNVT1][pre] and (OtpVT.PREVTYPE[REVTUNVT1]==REVTUNVT1)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tdata   = OTPTYPE;
//      vtcat   = REVTUNVT1;
//      prepost = pre;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PreRevTunVT1OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//         tname = PreRevTunBCC1OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//      }
//      else
//      {
//         tname = PreRevTunBCC1OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//         tname = PreRevTunVT1OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PreRevTunVT1OTP_func = v_any_dev_active;
//} 
//
//
TMResultM PstRevTunVT1_func()
{
   const IntS TESTID = 168; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if(MainBCC.ENA[REVTUNVT1][post] or MainVT.ENA[REVTUNVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1; //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata   = BANKTYPE;
      vtcat   = REVTUNVT1;
      prepost = post;
      
//      logsites = v_dev_active;
      
      if(GL_DO_VT_FIRST)  
     {
         tname = "PstRevTunVT1_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PstRevTunBCC1_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
            {
               FLEsda.ImageNum = ESDA_IMG_REVTUN_VT1_PST;
               F021_CollectESDA(FLEsda.ImageNum);
            } 
      }
      else
      {
         tname = "PstRevTunBCC1_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PstRevTunVT1_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
   } 
   
//   PstRevTunVT1_func = v_any_dev_active;
   return(final_results);
}   /* PstRevTunVT1_func */
//   
//
TMResultM PstRevTunVT1OTP_func()
{
   const IntS TESTID = 169; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if(OtpBCC.ENA[REVTUNVT1][post] or OtpVT.ENA[REVTUNVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1; //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata   = OTPTYPE;
      vtcat   = REVTUNVT1;
      prepost = post;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstRevTunVT1OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PstRevTunBCC1OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PstRevTunBCC1OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PstRevTunVT1OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PstRevTunVT1OTP_func = v_any_dev_active;
   return(final_results);
}   /* PstRevTunVT1OTP_func */


TMResultM RevTunVT1Delta_func()
{
   const IntS TESTID = 170; 

   TMResultM final_results;
   BoolM logsites;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

   GL_FLTESTID = TESTID;

//   logsites = v_dev_active;

   if(MainVT.ENA[REVTUNVT1][post])  
   {
      dlogonly = MainVT.DLOGONLY[REVTUNVT1][post];
      tname = "RevTunVT1DLT_Test";
      pattype = MainVT.MEMCFG[REVTUNVT1];
      final_results=F021_VT_Delta_func(pattype,REVTUNVT1,tname,dlogonly);
   } 
   
   if(MainBCC.ENA[REVTUNVT1][post])  
   {
      dlogonly = MainBCC.DLOGONLY[REVTUNVT1][post];
      tname = "RevTunBCC1DLT_Test";
      pattype = MainBCC.MEMCFG[REVTUNVT1];
      final_results=F021_BCC_Delta_func(pattype,REVTUNVT1,tname,dlogonly);
      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
         {
            FLEsda.ImageNum = ESDA_IMG_REVTUN_VT1_DLT;
            F021_CollectESDA(FLEsda.ImageNum);
         } 
   } 
   
//   RevTunVT1Delta_func = v_any_dev_active;
  return(final_results);
}   /* RevTunVT1Delta_func */
   

TMResultM RevTunVT1DeltaOTP_func()
{
   const IntS TESTID = 171; 

   TMResultM final_results;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

   GL_FLTESTID = TESTID;
   if(OtpVT.ENA[REVTUNVT1][post])  
   {
      dlogonly = OtpVT.DLOGONLY[REVTUNVT1][post];
      tname = "RevTunVT1DLTOTP_Test";
      pattype = OTPTYPE;
      final_results=F021_VT_Delta_func(pattype,REVTUNVT1,tname,dlogonly);
   } 
   
   if(OtpBCC.ENA[REVTUNVT1][post])  
   {
      dlogonly = OtpBCC.DLOGONLY[REVTUNVT1][post];
      tname = "RevTunBCC1DLTOTP_Test";
      pattype = OTPTYPE;
      final_results=F021_BCC_Delta_func(pattype,REVTUNVT1,tname,dlogonly);
   } 
   
//   RevTunVT1DeltaOTP_func = v_any_dev_active;
  return(final_results);
}   /* RevTunVT1DeltaOTP_func */
//   
TMResultM BankErs_PrePgmFF_func() {
   const IntS TESTID = 154; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;

   if ((MainBCC.ENA[PGMFFVT1][pre] and (MainBCC.PREVTYPE[PGMFFVT1]==PGMFFVT1)) or
      (MainVT.ENA[PGMFFVT1][pre] and (MainVT.PREVTYPE[PGMFFVT1]==PGMFFVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)       
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "Ers_PrePgmFF_Test";
      
//      logsites = v_dev_active;
      if (GL_DO_ERS_BY_SECTOR) {
         testnum = TNUM_SECT_ERS_NOPRECON_SM;
      }
      else
         testnum = TNUM_BANK_ERS_NOPRECON;
         
      if (GL_DO_REDENA)  
         testnum = testnum+TNUM_REDUNDENA;
         
      final_results = F021_Erase_func(testnum,tname);
      
//      if(not arraycompareboolean(logsites,final_results,v_sites))  
      if (TI_FlashESDAEna) {
         for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
            if ( final_results[*si] != TM_PASS ) {
               FLEsda.Tnum = TNUM_BANK_RDM1S;
               FLEsda.ImageNum = ESDA_IMG_BLK1;
               F021_CollectESDA(FLEsda.ImageNum);
            }
         }
      }
   } 
   return(final_results);

}  //  BankErs_PrePgmFF_func
   

TMResultM PrePgmFFVT1_func() {
   const IntS TESTID = 156; 

   TMResultM final_results,tmp_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if ((MainBCC.ENA[PGMFFVT1][pre] and (MainBCC.PREVTYPE[PGMFFVT1]==PGMFFVT1)) or
      (MainVT.ENA[PGMFFVT1][pre] and (MainVT.PREVTYPE[PGMFFVT1]==PGMFFVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata   = BANKTYPE;
      vtcat   = PGMFFVT1;
      prepost = pre;
      
//      logsites = v_dev_active;
      
      if (GL_DO_VT_FIRST) {
         tname = "PrePgmFFVT1_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PrePgmFFBCC1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
         if (TI_FlashESDAEna) { 
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
               if ( final_results[*si] != TM_PASS ) {
                  FLEsda.ImageNum = ESDA_IMG_BLK1;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
            } 
         }
      }
      else {
         tname = "PrePgmFFBCC1_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PrePgmFFVT1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      }
      final_results = DLOG.AccumulateResults(final_results,tmp_results);
   } 
   return(final_results);

}   // PrePgmFFVT1_func
   

TMResultM PrePgmFFVT1OTP_func() {
   const IntS TESTID = 157; 

   TMResultM final_results,tmp_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if ((OtpBCC.ENA[PGMFFVT1][pre] and (OtpBCC.PREVTYPE[PGMFFVT1]==PGMFFVT1)) or
      (OtpVT.ENA[PGMFFVT1][pre] and (OtpVT.PREVTYPE[PGMFFVT1]==PGMFFVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {   
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata   = OTPTYPE;
      vtcat   = PGMFFVT1;
      prepost = pre;
      
      if (GL_DO_VT_FIRST) {
         tname = "PrePgmFFVT1OTP_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PrePgmFFBCC1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else {
         tname = "PrePgmFFBCC1OTP_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PrePgmFFVT1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      }
      final_results = DLOG.AccumulateResults(final_results,tmp_results);
   } 
   return(final_results);

}   // PrePgmFFVT1OTP_func


TMResultM PstPgmFFVT1_func() {
   const IntS TESTID = 159; 

   TMResultM final_results,tmp_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if (MainBCC.ENA[PGMFFVT1][post] or MainVT.ENA[PGMFFVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata   = BANKTYPE;
      vtcat   = PGMFFVT1;
      prepost = post;
      
//      logsites = v_dev_active;
      
      if (GL_DO_VT_FIRST) {
         tname = "PstPgmFFVT1_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PstPgmFFBCC1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
         if (TI_FlashESDAEna) {
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
               if ( final_results[*si] != TM_PASS ) {
                  FLEsda.ImageNum = ESDA_IMG_BLK1;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
            }
         }
      }
      else {
         tname = "PstPgmFFBCC1_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PstPgmFFVT1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      }
      final_results = DLOG.AccumulateResults(final_results,tmp_results);
   } 
   return(final_results);

}   // PstPgmFFVT1_func
   

TMResultM PstPgmFFVT1OTP_func() {
   TMResultM final_results,tmp_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if (OtpBCC.ENA[PGMFFVT1][post] or OtpVT.ENA[PGMFFVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = PGMFFVT1;
      prepost = post;
      
      if (GL_DO_VT_FIRST) {
         tname = "PstPgmFFVT1OTP_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PstPgmFFBCC1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else {
         tname = "PstPgmFFBCC1OTP_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PstPgmFFVT1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      }
      final_results = DLOG.AccumulateResults(final_results,tmp_results);
   } 
   return(final_results);

}   // PstPgmFFVT1OTP_func
   

TMResultM PgmFFVT1Delta_func() {
   TMResultM final_results,tmp_results;
   BoolM logsites;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

//   logsites = v_dev_active;

   if (MainVT.ENA[PGMFFVT1][post]) {
      dlogonly = MainVT.DLOGONLY[PGMFFVT1][post];
      tname = "PgmFFVT1DLT_Test";
      pattype = MainVT.MEMCFG[PGMFFVT1];
      tmp_results = F021_VT_Delta_func(pattype,PGMFFVT1,tname,dlogonly);
   } 

   if (MainBCC.ENA[PGMFFVT1][post]) {
      dlogonly = MainBCC.DLOGONLY[PGMFFVT1][post];
      tname = "PgmFFBCC1DLT_Test";
      pattype = MainBCC.MEMCFG[PGMFFVT1];
      final_results = F021_BCC_Delta_func(pattype,PGMFFVT1,tname,dlogonly);
//      if(not arraycompareboolean(logsites,final_results,v_sites))  
      if (TI_FlashESDAEna) {  
         for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
            if ( final_results[*si] != TM_PASS ) {
               FLEsda.ImageNum = ESDA_IMG_BLK1;
               F021_CollectESDA(FLEsda.ImageNum);
            }
         }
      }
   }
   final_results = DLOG.AccumulateResults(final_results,tmp_results);
   return(final_results);

}   // PgmFFVT1Delta_func
   

TMResultM PgmFFVT1DeltaOTP_func() {
   TMResultM final_results,tmp_results;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

   if (OtpVT.ENA[PGMFFVT1][post]) {
      dlogonly = OtpVT.DLOGONLY[PGMFFVT1][post];
      tname = "PgmFFVT1DLTOTP_Test";
      pattype = OTPTYPE;
      tmp_results = F021_VT_Delta_func(pattype,PGMFFVT1,tname,dlogonly);
   } 
   
   if (OtpBCC.ENA[PGMFFVT1][post])  
   {
      dlogonly = OtpBCC.DLOGONLY[PGMFFVT1][post];
      tname = "PgmFFBCC1DLTOTP_Test";
      pattype = OTPTYPE;
      final_results = F021_BCC_Delta_func(pattype,PGMFFVT1,tname,dlogonly);
   }
   final_results = DLOG.AccumulateResults(final_results,tmp_results);
   return(final_results);

}   // PgmFFVT1DeltaOTP_func
   
//
TMResultM BankErs_PrePunchThru_func()
{
   const IntS TESTID = 172; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;

   if((MainBCC.ENA[PUNTHRUVT1][pre] and (MainBCC.PREVTYPE[PUNTHRUVT1]==PUNTHRUVT1)) or
      (MainVT.ENA[PUNTHRUVT1][pre] and (MainVT.PREVTYPE[PUNTHRUVT1]==PUNTHRUVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1; //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "Ers_PrePunThru_Test";
      
      if(ActiveSites.GetPassingSites().AnyEqual(true))  
      {
         //logsites = v_dev_active;
         logsites = ActiveSites.GetPassingSites().AnyEqual(true);
         if(GL_DO_ERS_BY_SECTOR)  
         {
            testnum = TNUM_SECT_ERS_NOPRECON_SM;
         }
         else
            testnum = TNUM_BANK_ERS_NOPRECON;
         if(GL_DO_REDENA)  
            testnum = testnum+TNUM_REDUNDENA;
         final_results = F021_Erase_func(testnum,tname);
         if(TI_FlashESDAEna)  
            //if(not arraycompareboolean(logsites,final_results,v_sites))  
            if(ActiveSites.GetPassingSites().AnyEqual(false))
            {
               FLEsda.Tnum = TNUM_BANK_RDM1S;
               FLEsda.ImageNum = ESDA_IMG_PUNTHRU_ERS;
               F021_CollectESDA(FLEsda.ImageNum);
            } 
      } 
   } 
   
//   BankErs_PrePunchThru_func = v_any_dev_active;
   return (final_results);
}   /* BankErs_PrePunchThru_func */
//   
//
TMResultM PrePunchThruVT1_func()
{
   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if((MainBCC.ENA[PUNTHRUVT1][pre] and (MainBCC.PREVTYPE[PUNTHRUVT1]==PUNTHRUVT1)) or
      (MainVT.ENA[PUNTHRUVT1][pre] and (MainVT.PREVTYPE[PUNTHRUVT1]==PUNTHRUVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1; //code not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = BANKTYPE;
      vtcat   = PUNTHRUVT1;
      prepost = pre;
      
      //logsites = v_dev_active;
      logsites = ActiveSites.GetPassingSites().AnyEqual(true);
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PrePunThruVT1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PrePunThruBCC1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         if(TI_FlashESDAEna)  
            //if(not arraycompareboolean(logsites,final_results,v_sites))  
            if(ActiveSites.GetPassingSites().AnyEqual(false))
            {
               FLEsda.ImageNum = ESDA_IMG_PUNTHRU_VT1_PRE;
               F021_CollectESDA(FLEsda.ImageNum);
            } 
      }
      else
      {
         tname = "PrePunThruBCC1_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PrePunThruVT1_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
   } 
   
//   PrePunchThruVT1_func = v_any_dev_active;
   return(final_results);
}   /* PrePunchThruVT1_func */
//   
//
TMResultM PrePunchThruVT1OTP_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if((OtpBCC.ENA[PUNTHRUVT1][pre] and (OtpBCC.PREVTYPE[PUNTHRUVT1]==PUNTHRUVT1)) or
      (OtpVT.ENA[PUNTHRUVT1][pre] and (OtpVT.PREVTYPE[PUNTHRUVT1]==PUNTHRUVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1; //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = PUNTHRUVT1;
      prepost = pre;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PrePunThruVT1OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PrePunThruBCC1OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PrePunThruBCC1OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PrePunThruVT1OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PrePunchThruVT1OTP_func = v_any_dev_active;
   return(final_results);
}   /* PrePunchThruVT1OTP_func */
//
//
TMResultM PstPunchThruVT1_func()
{
   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if(MainBCC.ENA[PUNTHRUVT1][post] or MainVT.ENA[PUNTHRUVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1; //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = BANKTYPE;
      vtcat   = PUNTHRUVT1;
      prepost = post;
      
      //logsites = v_dev_active;
      logsites = ActiveSites.GetPassingSites().AnyEqual(true);     
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstPunThruVT1_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PstPunThruBCC1_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
            {
               FLEsda.ImageNum = ESDA_IMG_PUNTHRU_VT1_PST;
               F021_CollectESDA(FLEsda.ImageNum);
            } 
      }
      else
      {
         tname = "PstPunThruBCC1_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PstPunThruVT1_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
   } 
   
//   PstPunchThruVT1_func = v_any_dev_active;
   return(final_results);
}   /* PstPunchThruVT1_func */
//
//
TMResultM PstPunchThruVT1OTP_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if(OtpBCC.ENA[PUNTHRUVT1][post] or OtpVT.ENA[PUNTHRUVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1; //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = PUNTHRUVT1;
      prepost = post;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstPunThruVT1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PstPunThruBCC1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PstPunThruBCC1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PstPunThruVT1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PstPunchThruVT1OTP_func = v_any_dev_active;
   return(final_results);
}   /* PstPunchThruVT1OTP_func */
//   
//
TMResultM PunchThruVT1Delta_func()
{
   TMResultM final_results;
   BoolM logsites;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

//   logsites = v_dev_active;
   
   if(MainVT.ENA[PUNTHRUVT1][post])  
   {
      dlogonly = MainVT.DLOGONLY[PUNTHRUVT1][post];
      tname = "PunThruVT1DLT_Test";
      pattype = MainVT.MEMCFG[PUNTHRUVT1];
      final_results=F021_VT_Delta_func(pattype,PUNTHRUVT1,tname,dlogonly);
   } 
   
   if(MainBCC.ENA[PUNTHRUVT1][post])  
   {
      dlogonly = MainBCC.DLOGONLY[PUNTHRUVT1][post];
      tname = "PunThruBCC1DLT_Test";
      pattype = MainVT.MEMCFG[PUNTHRUVT1];
      final_results=F021_BCC_Delta_func(pattype,PUNTHRUVT1,tname,dlogonly);
      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
         {
            FLEsda.ImageNum = ESDA_IMG_PUNTHRU_VT1_DLT;
            F021_CollectESDA(FLEsda.ImageNum);
         } 
   } 
   
//   PunchthruVT1Delta_func = v_any_dev_active;
   return(final_results);
}   /* PunchThruVT1Delta_func */
//   
//
TMResultM PunchThruVT1DeltaOTP_func()
{
   TMResultM final_results;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

   if(OtpVT.ENA[PUNTHRUVT1][post])  
   {
      dlogonly = OtpVT.DLOGONLY[PUNTHRUVT1][post];
      tname = "PunThruVT1DLTOTP_Test";
      pattype = OTPTYPE;
      final_results=F021_VT_Delta_func(pattype,PUNTHRUVT1,tname,dlogonly);
   } 

   if(OtpBCC.ENA[PUNTHRUVT1][post])  
   {
      dlogonly = OtpBCC.DLOGONLY[PUNTHRUVT1][post];
      tname = "PunThruBCC1DLTOTP_Test";
      pattype = OTPTYPE;
      final_results=F021_BCC_Delta_func(pattype,PUNTHRUVT1,tname,dlogonly);
   } 
   
//   PunchThruVT1DeltaOTP_func = v_any_dev_active;
   return(final_results);
}   /* PunchThruVT1DeltaOTP_func */
   
TMResultM BankErs_PreFGWL_func() {
   const IntS TESTID = 145; 

   TMResultM final_results,logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;

   if ((MainBCC.ENA[FGWLVT1][pre] and (MainBCC.PREVTYPE[FGWLVT1]==FGWLVT1)) or
      (MainVT.ENA[FGWLVT1][pre] and (MainVT.PREVTYPE[FGWLVT1]==FGWLVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "Ers_PreFGWL_Test";
      
//    logsites = v_dev_active;
      if (GL_DO_ERS_BY_SECTOR) {
         testnum = TNUM_SECT_ERS_NOPRECON_SM;
      }
      else
         testnum = TNUM_BANK_ERS_PRECON;

      if (GL_DO_REDENA)  
         testnum = testnum+TNUM_REDUNDENA;
      final_results = F021_Erase_func(testnum,tname);

//      if(not arraycompareboolean(logsites,final_results,v_sites))  
      if (TI_FlashESDAEna)  {
         for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
            if ( final_results[*si] != TM_PASS ) {
               FLEsda.Tnum = TNUM_BANK_RDM1S;
               if (GL_DO_ERS_BY_SECTOR)  
                  FLEsda.Tnum = FLEsda.Tnum+TNUM_TARGET_SECT;
               FLEsda.ImageNum = ESDA_IMG_FGWL_ERS;
               F021_CollectESDA(FLEsda.ImageNum);
            }
         }
      }
   } 
   return(final_results);
   
}   // BankErs_PreFGWL_func
   

TMResultM ErsOTP_PreFGWL_func() {
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;

   if ((OtpBCC.ENA[FGWLVT1][pre] and (OtpBCC.PREVTYPE[FGWLVT1]==FGWLVT1)) or
      (OtpVT.ENA[FGWLVT1][pre] and (OtpVT.PREVTYPE[FGWLVT1]==FGWLVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      testnum = TNUM_OTP_ERS_NOPRECON;
      tname = "ErsOTP_PreFGWL_Test";
      final_results = F021_Erase_func(testnum,tname);
   } 
   return(final_results);
   
}   // ErsOTP_PreFGWL_func
   
TMResultM PreFGWLVT1_func() {
   const IntS TESTID = 147; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   FloatS istart,istop,ires;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if ((MainBCC.ENA[FGWLVT1][pre] and (MainBCC.PREVTYPE[FGWLVT1]==FGWLVT1)) or
      (MainVT.ENA[FGWLVT1][pre] and (MainVT.PREVTYPE[FGWLVT1]==FGWLVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {
      if (TI_FlashCharEna and GL_DO_CHARZ_BCC)  {
         istart = MainBCC.SSTART[FGWLVT1][pre];
         istop  = MainBCC.SSTOP[FGWLVT1][pre];
         ires   = 1uA;
         testnum = TNUM_TCR38+MainBCC.IRATIO[FGWLVT1][pre]+MainBCC.RDOPTION[FGWLVT1][pre]+TNUM_DATA_1S;
//         Charz_BCC(VMX,testnum,BANKTYPE,istart,istop,ires,true,"Z_FGWL_BC1MX");
      } 
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata   = BANKTYPE;
      vtcat   = FGWLVT1;
      prepost = pre;
      
//    logsites = v_dev_active;
      
      if (GL_DO_VT_FIRST) {
         tname = "PreFGWLVT1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PreFGWLBCC1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
//         if(not arraycompareboolean(logsites,v_sites))  
         if (TI_FlashESDAEna) {
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
               if ( final_results[*si] != TM_PASS ) {
                  FLEsda.ImageNum = ESDA_IMG_FGWL_VT1_PRE;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
            }
         }
      }
      else {
         tname = "PreFGWLBCC1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PreFGWLVT1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
   } 
   return(final_results);

}   // PreFGWLVT1_func
   

TMResultM PreFGWLVT1OTP_func() {
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if ((OtpBCC.ENA[FGWLVT1][pre] and (OtpBCC.PREVTYPE[FGWLVT1]==FGWLVT1)) or
      (OtpVT.ENA[FGWLVT1][pre] and (OtpVT.PREVTYPE[FGWLVT1]==FGWLVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = FGWLVT1;
      prepost = pre;
      
      if (GL_DO_VT_FIRST) {
         tname = "PreFGWLVT1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PreFGWLBCC1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else {
         tname = "PreFGWLBCC1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PreFGWLVT1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   return(final_results);

}   // PreFGWLVT1OTP_func

  
TMResultM PstFGWLVT1_func() {
   const IntS TESTID = 150; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if (MainBCC.ENA[FGWLVT1][post] or MainVT.ENA[FGWLVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata   = BANKTYPE;
      vtcat   = FGWLVT1;
      prepost = post;
      
//    logsites = v_dev_active;
      
      if (GL_DO_VT_FIRST)  {
         tname = "PstFGWLVT1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PstFGWLBCC1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
         if (TI_FlashESDAEna) {
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
               if ( final_results[*si] != TM_PASS ) {
                  FLEsda.ImageNum = ESDA_IMG_FGWL_VT1_PST;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
            }
         }
      }
      else {
         tname = "PstFGWLBCC1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PstFGWLVT1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
   } 
   return(final_results);
}   // PstFGWLVT1_func
   

TMResultM PstFGWLVT1OTP_func() {
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if (OtpBCC.ENA[FGWLVT1][post] or OtpVT.ENA[FGWLVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena)  {
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = FGWLVT1;
      prepost = post;
      
      if (GL_DO_VT_FIRST) {
         tname = "PstFGWLVT1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PstFGWLBCC1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else {
         tname = "PstFGWLBCC1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PstFGWLVT1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   }
   return(final_results);
   
}   // PstFGWLVT1OTP_func
   

TMResultM FGWLVT1Delta_func() {
   TMResultM final_results;
   BoolM logsites;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

   if(MainVT.ENA[FGWLVT1][post]) {
      dlogonly = MainVT.DLOGONLY[FGWLVT1][post];
      tname = "FGWLVT1DLT_Test";
      pattype = MainVT.MEMCFG[FGWLVT1];
      final_results = F021_VT_Delta_func(pattype,FGWLVT1,tname,dlogonly);
   } 

// logsites = v_dev_active;
   
   if (MainBCC.ENA[FGWLVT1][post])  {
      dlogonly = MainBCC.DLOGONLY[FGWLVT1][post];
      tname = "FGWLBCC1DLT_Test";
      pattype = MainBCC.MEMCFG[FGWLVT1];
      final_results = F021_BCC_Delta_func(pattype,FGWLVT1,tname,dlogonly);

//      if(not arraycompareboolean(logsites,final_results,v_sites))  
      if (TI_FlashESDAEna) {
         for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
            if ( final_results[*si] != TM_PASS ) {
               FLEsda.ImageNum = ESDA_IMG_FGWL_VT1_DLT;
               F021_CollectESDA(FLEsda.ImageNum);
            }
         }
      }
   }
   return(final_results);
}   // FGWLVT1Delta_func
   

TMResultM FGWLVT1DeltaOTP_func() {
   TMResultM final_results;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

   if (OtpVT.ENA[FGWLVT1][post]) {
      dlogonly = OtpVT.DLOGONLY[FGWLVT1][post];
      tname = "FGWLVT1DLTOTP_Test";
      pattype = OTPTYPE;
      final_results = F021_VT_Delta_func(pattype,FGWLVT1,tname,dlogonly);
   } 
   
   if (OtpBCC.ENA[FGWLVT1][post]) {
      dlogonly = OtpBCC.DLOGONLY[FGWLVT1][post];
      tname = "FGWLBCC1DLTOTP_Test";
      pattype = OTPTYPE;
      final_results = F021_BCC_Delta_func(pattype,FGWLVT1,tname,dlogonly);
   }
   return(final_results);
   
//   FGWLVT1DeltaOTP_func = v_any_dev_active;
}   // FGWLVT1DeltaOTP_func
   

TMResultM BankErs_PreTunOxide_func() {
   const IntS TESTID = 181; 

   TMResultM final_results,logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   
   if((MainBCC.ENA[TUNOXVT1][pre] and (MainBCC.PREVTYPE[TUNOXVT1]==TUNOXVT1)) or
      (MainVT.ENA[TUNOXVT1][pre] and (MainVT.PREVTYPE[TUNOXVT1]==TUNOXVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena) {
#if $GL_USE_DMLED_RAMPMT  
      /*KChau 11/22/11 -- Blizzard temporary work around device lock up problem -- to be removed when design is fixed*/
//    PowerDownAll;   (Done as Levels Entry Object)
      TIME.Wait(2ms);
      GL_PREVIOUS_SHELL = "";
#endif
//    PwrupAtVnom_1;  (Done as Levels Entry Object)      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)   
         F021_LoadFlashShell_func();
      
#if $GL_USE_DMLED_RAMPMT  
      /*KChau 11/22/11 -- Blizzard temporary work around device lock up problem -- to be removed when design is fixed*/
      RAM_Upload_PMOS_TrimCode();
      RAM_Upload_VHV_CT_TrimVal();
#endif
      GL_FLTESTID = TESTID;
      tname = "Ers_PreTunOx_Test";
      
      if(GL_DO_ERS_BY_SECTOR) {
         testnum = TNUM_SECT_ERS_NOPRECON_SM;
      }
      else
         testnum = TNUM_BANK_ERS_NOPRECON;
         
      if(GL_DO_REDENA) testnum = testnum+TNUM_REDUNDENA;
      
      final_results = F021_Erase_func(testnum,tname);
      
      if (TI_FlashESDAEna) {
         for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
            if ( final_results[*si] != TM_PASS ) {
               FLEsda.Tnum = TNUM_BANK_RDM1S;
               FLEsda.ImageNum = ESDA_IMG_TUNOX_ERS;
               F021_CollectESDA(FLEsda.ImageNum);
            }
         } 
      }
   }
   
   return (final_results);
}   // BankErs_PreTunOxide_func
   

TMResultM PreTunOxideVT1_func() {
   TMResultM final_results, tmp_results, test_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if ((MainBCC.ENA[TUNOXVT1][pre] and (MainBCC.PREVTYPE[TUNOXVT1]==TUNOXVT1)) or
      (MainVT.ENA[TUNOXVT1][pre] and (MainVT.PREVTYPE[TUNOXVT1]==TUNOXVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)      
         F021_LoadFlashShell_func();
      
      tdata   = BANKTYPE;
      vtcat   = TUNOXVT1;
      prepost = pre;
      
      if (GL_DO_VT_FIRST) {
         tname = "PreTunOxVT1_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PreTunOxBCC1_Test";
         test_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         
         if (TI_FlashESDAEna) {
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
               if ( final_results[*si] != TM_PASS ) {
                  FLEsda.ImageNum = ESDA_IMG_TUNOX_VT1_PRE;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
            }
         } 
      }
      else {
         tname = "PreTunOxBCC1_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PreTunOxVT1_Test";
         test_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      }
      final_results = DLOG.AccumulateResults(tmp_results, test_results);
   } 
      
   return (final_results);
}   /* PreTunOxideVT1_func */
   

TMResultM PreTunOxideVT1OTP_func() {
   TMResultM final_results, tmp_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if ((OtpBCC.ENA[TUNOXVT1][pre] and (OtpBCC.PREVTYPE[TUNOXVT1]==TUNOXVT1)) or
      (OtpVT.ENA[TUNOXVT1][pre] and (OtpVT.PREVTYPE[TUNOXVT1]==TUNOXVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {  
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = TUNOXVT1;
      prepost = pre;
      
      if (GL_DO_VT_FIRST) {
         tname = "PreTunOxVT1OTP_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PreTunOxBCC1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else {
         tname = "PreTunOxBCC1OTP_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PreTunOxVT1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      }
      final_results = DLOG.AccumulateResults(final_results, tmp_results);
   } 
   
   return(final_results);
}   /* PreTunOxideVT1OTP_func */

//
TMResultM PstTunOxideVT1_func() {
   TMResultM final_results,tmp_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if(MainBCC.ENA[TUNOXVT1][post] or MainVT.ENA[TUNOXVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {
//      PwrupAtVmax_1;
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)       
         F021_LoadFlashShell_func();
      
      tdata   = BANKTYPE;
      vtcat   = TUNOXVT1;
      prepost = post;
      
//      logsites = v_dev_active;
      
      if (GL_DO_VT_FIRST) {
         tname = "PstTunOxVT1_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PstTunOxBCC1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         
         if (TI_FlashESDAEna) {
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
               if ( final_results[*si] != TM_PASS ) {
                  FLEsda.ImageNum = ESDA_IMG_TUNOX_VT1_PST;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
            }
         }   
      }
      else {
         tname = "PstTunOxBCC1_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PstTunOxVT1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      }
      final_results = DLOG.AccumulateResults(final_results, tmp_results);
   } 
   
   return(final_results);

}   /* PstTunOxideVT1_func */
   

TMResultM PstTunOxideVT1OTP_func() {
   TMResultM final_results,tmp_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if(OtpBCC.ENA[TUNOXVT1][post] or OtpVT.ENA[TUNOXVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena) {
//      PwrupAtVmax_1;    
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = TUNOXVT1;
      prepost = post;
      
      if(GL_DO_VT_FIRST) {
         tname = "PstTunOxVT1OTP_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PstTunOxBCC1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else {
         tname = "PstTunOxBCC1OTP_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PstTunOxVT1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      }
      final_results = DLOG.AccumulateResults(final_results, tmp_results);
   } 
   return(final_results);

}   // PstTunOxideVT1OTP_func
   

TMResultM TunOxideVT1Delta_func() {
   TMResultM final_results;
   BoolM logsites;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

   if(MainVT.ENA[TUNOXVT1][post]) {
      dlogonly = MainVT.DLOGONLY[TUNOXVT1][post];
      tname = "TunOxVT1DLT_Test";
      pattype = MainVT.MEMCFG[TUNOXVT1];
      final_results = F021_VT_Delta_func(pattype,TUNOXVT1,tname,dlogonly);
   } 

//   logsites = v_dev_active;
   
   if (MainBCC.ENA[TUNOXVT1][post]) {
      dlogonly = MainBCC.DLOGONLY[TUNOXVT1][post];
      tname = "TunOxBCC1DLT_Test";
      pattype = MainBCC.MEMCFG[TUNOXVT1];
      final_results = F021_BCC_Delta_func(pattype,TUNOXVT1,tname,dlogonly);
      
      if (TI_FlashESDAEna) {
         for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
            if ( final_results[*si] != TM_PASS ) {
               FLEsda.ImageNum = ESDA_IMG_TUNOX_VT1_DLT;
               F021_CollectESDA(FLEsda.ImageNum);
            }
         }
      }
   } 
   return(final_results);

}  // TunOxideVT1Delta_func
   

TMResultM TunOxideVT1DeltaOTP_func() {
   TMResultM final_results;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

   if(OtpVT.ENA[TUNOXVT1][post]) {
      dlogonly = OtpVT.DLOGONLY[TUNOXVT1][post];
      tname = "TunOxVT1DLTOTP_Test";
      pattype = OTPTYPE;
      final_results = F021_VT_Delta_func(pattype,TUNOXVT1,tname,dlogonly);
   } 
   
   if(OtpBCC.ENA[TUNOXVT1][post]) {
      dlogonly = OtpBCC.DLOGONLY[TUNOXVT1][post];
      tname = "TunOxBCC1DLTOTP_Test";
      pattype = OTPTYPE;
      final_results = F021_BCC_Delta_func(pattype,TUNOXVT1,tname,dlogonly);
   }
   return(final_results);
   

}  // TunOxideVT1DeltaOTP_func
   
//
TMResultM BankErs_PreThinOxide_func()
{
   const IntS TESTID = 190; 

   //BoolM final_results,logsites;
   TMResultM final_results;
   Sites logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;

   if((MainBCC.ENA[THINOXVT1][pre] and (MainBCC.PREVTYPE[THINOXVT1]==THINOXVT1)) or
      (MainVT.ENA[THINOXVT1][pre] and (MainVT.PREVTYPE[THINOXVT1]==THINOXVT1)))  
      do_ena = true;
   else
      do_ena = false;
//
   if(do_ena)  
   {
//      PwrupAtVnom_1; //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "Ers_PreThinOx_Test";
      
//      if(v_any_dev_active)  
      if (ActiveSites.GetPassingSites().AnyEqual(true))
      {
         logsites = ActiveSites;
         if(GL_DO_ERS_BY_SECTOR)  
         {
            testnum = TNUM_SECT_ERS_NOPRECON_SM;
         }
         else
            testnum = TNUM_BANK_ERS_NOPRECON;
         if(GL_DO_REDENA)  
            testnum = testnum+TNUM_REDUNDENA;
         final_results = F021_Erase_func(testnum,tname);
          /*if(TI_FlashESDAEna) then
              if(not arraycompareboolean(logsites,final_results,v_sites)) then
              begin
                 FLEsda.Tnum := TNUM_BANK_RDM1s;
                 FLEsda.ImageNum := ESDA_IMG_THINOX_ERS;
                 F021_CollectESDA(FLEsda.ImageNum);
              end;*/
      } 
   } 
   
//   BankErs_PreThinOxide_func = v_any_dev_active;
   return(final_results);
}   /* BankErs_PreThinOxide_func */
//   
//
TMResultM PreThinOxideVT1_func()
{
   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if((MainBCC.ENA[THINOXVT1][pre] and (MainBCC.PREVTYPE[THINOXVT1]==THINOXVT1)) or
      (MainVT.ENA[THINOXVT1][pre] and (MainVT.PREVTYPE[THINOXVT1]==THINOXVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1(); //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)       
         F021_LoadFlashShell_func();
      
      tdata   = BANKTYPE;
      vtcat   = THINOXVT1;
      prepost = pre;
      
      logsites = ActiveSites.GetPassingSites();
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PreThinOxVT1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PreThinOxBCC1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         if(TI_FlashESDAEna)  
            //if(not arraycompareboolean(logsites,final_results,v_sites))  
            if(not (final_results.Equal(TM_PASS))==(logsites))  
            {
               FLEsda.ImageNum = ESDA_IMG_THINOX_VT1_PRE;
               F021_CollectESDA(FLEsda.ImageNum);
            } 
      }
      else
      {
         tname = "PreThinOxBCC1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PreThinOxVT1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
   } 
   
//   PreThinOxideVT1_func = v_any_dev_active;
   return(final_results);
}   /* PreThinOxideVT1_func */
//   
//
TMResultM PreThinOxideVT1OTP_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if((OtpBCC.ENA[THINOXVT1][pre] and (OtpBCC.PREVTYPE[THINOXVT1]==THINOXVT1)) or
      (OtpVT.ENA[THINOXVT1][pre] and (OtpVT.PREVTYPE[THINOXVT1]==THINOXVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1();  //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();      
      tdata   = OTPTYPE;
      vtcat   = THINOXVT1;
      prepost = pre;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PreThinOxVT1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname =" PreThinOxBCC1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PreThinOxBCC1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PreThinOxVT1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PreThinOxideVT1OTP_func = v_any_dev_active;
   return(final_results);
}   /* PreThinOxideVT1OTP_func */
   

TMResultM PstThinOxideVT1_func()
{
   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if(MainBCC.ENA[THINOXVT1][post] or MainVT.ENA[THINOXVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1; //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)      
         F021_LoadFlashShell_func();
      
      tdata   = BANKTYPE;
      vtcat   = THINOXVT1;
      prepost = post;
      
      logsites = ActiveSites.GetPassingSites();
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstThinOxVT1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PstThinOxBCC1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
            if(!((final_results.Equal(TM_PASS)) == logsites))
            {
               FLEsda.ImageNum = ESDA_IMG_THINOX_VT1_PST;
               F021_CollectESDA(FLEsda.ImageNum);
            } 
      }
      else
      {
         tname = "PstThinOxBCC1_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PstThinOxVT1_Test";
         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
   } 
   
//   PstThinOxideVT1_func = v_any_dev_active;
   return(final_results);
}   /* PstThinOxideVT1_func */
   

TMResultM PstThinOxideVT1OTP_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;

   if(OtpBCC.ENA[THINOXVT1][post] or OtpVT.ENA[THINOXVT1][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1(); //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = THINOXVT1;
      prepost = post;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstThinOxVT1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PstThinOxBCC1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PstThinOxBCC1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PstThinOxVT1OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PstThinOxideVT1OTP_func = v_any_dev_active;
   return(final_results);
}   /* PstThinOxideVT1OTP_func */
   

TMResultM ThinOxideVT1Delta_func()
{
   TMResultM final_results;
   BoolM logsites;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

   if(MainVT.ENA[THINOXVT1][post])  
   {
      dlogonly = MainVT.DLOGONLY[THINOXVT1][post];
      tname = "ThinOxVT1DLT_Test";
      pattype = MainVT.MEMCFG[THINOXVT1];
//      final_results = F021_VT_Delta_func(pattype,THINOXVT1,tname,dlogonly); not yet implemented
   } 
   
   logsites = ActiveSites.GetPassingSites();
   
   if(MainBCC.ENA[THINOXVT1][post])  
   {
      dlogonly = MainBCC.DLOGONLY[THINOXVT1][post];
      tname = "ThinOxBCC1DLT_Test";
      pattype = MainBCC.MEMCFG[THINOXVT1];
//      final_results = F021_BCC_Delta_func(pattype,THINOXVT1,tname,dlogonly); //not yet implemented
      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
         if(!(final_results.Equal(TM_PASS)==logsites))  
         {
            FLEsda.ImageNum = ESDA_IMG_THINOX_VT1_DLT;
            F021_CollectESDA(FLEsda.ImageNum);
         } 
   } 
   
//   ThinOxideVT1Delta_func = v_any_dev_active;
   return(final_results);
}   /* ThinOxideVT1Delta_func */
//   
//
TMResultM ThinOxideVT1DeltaOTP_func()
{
   TMResultM final_results;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

   if(OtpVT.ENA[THINOXVT1][post])  
   {
      dlogonly = OtpVT.DLOGONLY[THINOXVT1][post];   
      tname = "ThinOxVT1DLTOTP_Test";
      pattype = OTPTYPE;
      final_results = F021_VT_Delta_func(pattype,THINOXVT1,tname,dlogonly);
   } 
   
   if(OtpBCC.ENA[THINOXVT1][post])  
   {
      dlogonly = OtpBCC.DLOGONLY[THINOXVT1][post];
      tname = "ThinOxBCC1DLTOTP_Test";
      pattype = OTPTYPE;
      final_results = F021_BCC_Delta_func(pattype,THINOXVT1,tname,dlogonly);
   } 
   
//   ThinOxideVT1DeltaOTP_func = v_any_dev_active;
   return(final_results);
}   /* ThinOxideVT1DeltaOTP_func */
//   
//
//BoolS BankErs_PreONO_func()
//{
//   const IntS TESTID = 199; 
//
//   BoolM final_results,logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = Ers_PreONO_Test;
//      
//      if(v_any_dev_active)  
//      {
//         logsites = v_dev_active;
//         if(GL_DO_ERS_BY_SECTOR)  
//         {
//            testnum = TNUM_SECT_ERS_NOPRECON_SM;
//         }
//         else
//            testnum = TNUM_BANK_ERS_PRECON;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//         F021_Erase_func(testnum,tname,final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.Tnum = TNUM_BANK_RDM1s;
//               if(GL_DO_ERS_BY_SECTOR)  
//                  FLEsda.Tnum = FLEsda.Tnum+TNUM_TARGET_SECT;
//               FLEsda.ImageNum = ESDA_IMG_BLK1;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      } 
//   } 
//   
//   BankErs_PreONO_func = v_any_dev_active;
//}   /* BankErs_PreONO_func */
//   
//
//BoolS RdM1_PreONO_func()
//{
//   const IntS TESTID = 200; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = RdM1_PreONO_Test;
//      
//      if(GL_DO_FL_PBIST)  
//         testnum = TNUM_PBIST_RDM1s;
//      else
//      {
//         testnum = TNUM_BANK_RDM1s;
//         if(GL_DO_RD_WITH_TOPTION==1)  
//            testnum = testnum+TNUM_TOPTION_PSARD;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//      } 
//      
//      F021_Read_func(testnum,tname,final_results);
//   } 
//   
//   RdM1_PreONO_func = v_any_dev_active;
//}   /* RdM1_PreONO_func */
//   
//
TMResultM PgmMain_PreONO_func()
{
   const IntS TESTID = 201; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if((MainBCC.ENA[ONOVT0][pre] and (MainBCC.PREVTYPE[ONOVT0]==ONOVT0)) or
      (MainVT.ENA[ONOVT0][pre] and (MainVT.PREVTYPE[ONOVT0]==ONOVT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "PgmMain_PreONO_Test";
      
      if(GL_DO_PGM_USING_PBIST)  
      {
         if(SelectedTITestType==MP1)  
            testnum = TNUM_FASTPRECON;
         else
            testnum = TNUM_BANK_PROG_SM;  /*use after already repaired*/
      }
      else
          if(SelectedTITestType == MP1)  
              testnum = TNUM_BANK_PROG_ITERSECTOR ; /*C06 CHANGED based Audit Spec Jamal Sheikh modified Fri, Feb  3 2012*/
          else
              testnum = TNUM_BANK_PROG_SM;
       
      if(GL_DO_REDENA)  
         testnum = testnum+TNUM_REDUNDENA;
      final_results=F021_Program_func(testnum,tname);
   } 
   
//   PgmMain_PreONO_func = v_any_dev_active;
   return(final_results);
}   /* PgmMain_PreONO_func */
//   
//
TMResultM RdM0_PreONO_func()
{
   const IntS TESTID = 202; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if((MainBCC.ENA[ONOVT0][pre] and (MainBCC.PREVTYPE[ONOVT0]==ONOVT0)) or
      (MainVT.ENA[ONOVT0][pre] and (MainVT.PREVTYPE[ONOVT0]==ONOVT0)))  
      do_ena = true;
   else
      do_ena = false;
   
#if $FL_USE_AUTO_FLOW==false  
   do_ena = false;
#endif

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "RdM0_PreONO_Test";
      
      if(GL_DO_FL_PBIST)  
         testnum = TNUM_PBIST_RDM0S;
      else
      {
         testnum = TNUM_BANK_RDM0S;
         if(GL_DO_RD_WITH_TOPTION==1)  
            testnum = testnum+TNUM_TOPTION_PSARD;
         if(GL_DO_REDENA)  
            testnum = testnum+TNUM_REDUNDENA;
      } 
      
      final_results=F021_Read_func(testnum,tname);
   } 
   
//   RdM0_PreONO_func = v_any_dev_active;
   return(final_results);
}   /* RdM0_PreONO_func */
//   
//
TMResultM PgmOTP_PreONO_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if((OtpBCC.ENA[ONOVT0][pre] and (OtpBCC.PREVTYPE[ONOVT0]==ONOVT0)) or
      (OtpVT.ENA[ONOVT0][pre] and (OtpVT.PREVTYPE[ONOVT0]==ONOVT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1; //not yet implemented
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();

       if (SelectedTITestType == MP1)  
           testnum = TNUM_OTP_PROG ; /*C06 CHANGED to match spec Jamal Sheikh modified Fri, Feb  3 2012*/
       else
           testnum = TNUM_OTP_PRECON;           
      
      tname = "PgmOTP_PreONO_Test";
      
      final_results=F021_Program_func(testnum,tname);
   } 
   
//   PgmOTP_PreONO_func = v_any_dev_active;
   return(final_results);
}   /* PgmOTP_PreONO_func */
//   
//
//BoolS RdM0OTP_PreONO_func()
//{
//   const IntS TESTID = 204; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   if((OtpBCC.ENA[ONOVT0][pre] and (OtpBCC.PREVTYPE[ONOVT0]==ONOVT0)) or
//      (OtpVT.ENA[ONOVT0][pre] and (OtpVT.PREVTYPE[ONOVT0]==ONOVT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//#if $FL_USE_AUTO_FLOW==false  
//   do_ena = false;
//#endif
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      if(GL_DO_FL_PBIST)  
//         testnum = TNUM_PBIST_RDM0S+TNUM_TARGET_OTP;
//      else
//         testnum = TNUM_OTP_RDM0s;
//      
//      tname = RdM0OTP_PreONO_Test;
//      
//      F021_Read_func(testnum,tname,final_results);
//   } 
//   
//   RdM0OTP_PreONO_func = v_any_dev_active;
//}   /* RdM0OTP_PreONO_func */
//   
//
//BoolS PreONOVT0_func()
//{
//   BoolM final_results;
//   BoolM logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[ONOVT0][pre] and (MainBCC.PREVTYPE[ONOVT0]==ONOVT0)) or
//      (MainVT.ENA[ONOVT0][pre] and (MainVT.PREVTYPE[ONOVT0]==ONOVT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      tdata   = BANKTYPE;
//      vtcat   = ONOVT0;
//      prepost = pre;
//      
//      logsites = v_dev_active;
//      final_results = v_dev_active;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PreONOVT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//         tname = PreONOBCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//      }
//      else
//      {
//         tname = PreONOBCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         tname = PreONOVT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//      } 
//      
//      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
//         {
//            FLEsda.ImageNum = ESDA_IMG_ONO_VT0_PRE;
//            F021_CollectESDA(FLEsda.ImageNum);
//         } 
//   } 
//   
//   PreONOVT0_func = v_any_dev_active;
//}   /* PreONOVT0_func */
//   
//
//BoolS PreONOVT0OTP_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if((OtpBCC.ENA[ONOVT0][pre] and (OtpBCC.PREVTYPE[ONOVT0]==ONOVT0)) or
//      (OtpVT.ENA[ONOVT0][pre] and (OtpVT.PREVTYPE[ONOVT0]==ONOVT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      tdata   = OTPTYPE;
//      vtcat   = ONOVT0;
//      prepost = pre;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PreONOVT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//         tname = PreONOBCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//      }
//      else
//      {
//         tname = PreONOBCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//         tname = PreONOVT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PreONOVT0OTP_func = v_any_dev_active;
//}   /* PreONOVT0OTP_func */
//
//
TMResultM PstONOVT0_func()
{
   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if(MainBCC.ENA[ONOVT0][post] or MainVT.ENA[ONOVT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1;
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = BANKTYPE;
      vtcat   = ONOVT0;
      prepost = post;
      
//      logsites = v_dev_active;
//      final_results = v_dev_active;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstONOVT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PstONOBCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
      }
      else
      {
         tname = "PstONOBCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PstONOVT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
      
      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
         {
            FLEsda.ImageNum = ESDA_IMG_ONO_VT0_PST;
            F021_CollectESDA(FLEsda.ImageNum);
         } 
   } 
   
//   PstONOVT0_func = v_any_dev_active;
   return(final_results);
}   /* PstONOVT0_func */
//   
//
TMResultM PstONOVT0OTP_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmax";

   if(OtpBCC.ENA[ONOVT0][post] or OtpVT.ENA[ONOVT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1;
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = ONOVT0;
      prepost = post;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstONOVT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PstONOBCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PstONOBCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PstONOVT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PstONOVT0OTP_func = v_any_dev_active;
   return(final_results);
}   /* PstONOVT0OTP_func */
//   
//
TMResultM ONOVT0Delta_func()
{
   TMResultM final_results;
   BoolM logsites;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

//   logsites = v_dev_active;
//   final_results = v_dev_active;

   if(MainVT.ENA[ONOVT0][post])  
   {
      dlogonly = MainVT.DLOGONLY[ONOVT0][post];
      tname = "ONOVT0DLT_Test";
      pattype = MainVT.MEMCFG[ONOVT0];
      final_results=F021_VT_Delta_func(pattype,ONOVT0,tname,dlogonly);
   } 

   if(MainBCC.ENA[ONOVT0][post])  
   {
      dlogonly = MainBCC.DLOGONLY[ONOVT0][post];
      tname = "ONOBCC0DLT_Test";
      pattype = MainBCC.MEMCFG[ONOVT0];
      final_results=F021_BCC_Delta_func(pattype,ONOVT0,tname,dlogonly);
   } 
   
   if(TI_FlashESDAEna)  
//      if(not arraycompareboolean(logsites,final_results,v_sites))  
      {
         FLEsda.ImageNum = ESDA_IMG_ONO_VT0_DLT;
         F021_CollectESDA(FLEsda.ImageNum);
      } 

//   ONOVT0Delta_func = v_any_dev_active;
   return(final_results);
}   /* ONOVT0Delta_func */
//   
//
TMResultM ONOVT0DeltaOTP_func()
{
   TMResultM final_results;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

   if(OtpVT.ENA[ONOVT0][post])  
   {
      dlogonly = OtpVT.DLOGONLY[ONOVT0][post];
      tname = "ONOVT0DLTOTP_Test";
      pattype = OTPTYPE;
      final_results=F021_VT_Delta_func(pattype,ONOVT0,tname,dlogonly);
   } 
   
   if(OtpBCC.ENA[ONOVT0][post])  
   {
      dlogonly = OtpBCC.DLOGONLY[ONOVT0][post];
      tname = "ONOBCC0DLTOTP_Test";
      pattype = OTPTYPE;
      final_results=F021_BCC_Delta_func(pattype,ONOVT0,tname,dlogonly);
   } 

//   ONOVT0DeltaOTP_func = v_any_dev_active;
   return(final_results);
}   /* ONOVT0DeltaOTP_func */
//   
//
//BoolS BankErs_PreCSFG_func()
//{
//   const IntS TESTID = 212; 
//
//   BoolM final_results,logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      if(v_any_dev_active)  
//      {
//         logsites = v_dev_active;
//         if(GL_DO_ERS_BY_SECTOR)  
//         {
//            testnum = TNUM_SECT_ERS_NOPRECON_SM;
//         }
//         else
//            testnum = TNUM_BANK_ERS_PRECON;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//         tname = Ers_PreCSFG_Test;
//         F021_Erase_func(testnum,tname,final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.Tnum = TNUM_BANK_RDM1s;
//               if(GL_DO_ERS_BY_SECTOR)  
//                  FLEsda.Tnum = FLEsda.Tnum+TNUM_TARGET_SECT;
//               FLEsda.ImageNum = ESDA_IMG_BLK1;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      } 
//   } 
//   
//   BankErs_PreCSFG_func = v_any_dev_active;
//}   /* BankErs_PreCSFG_func */
//   
//
TMResultM PgmMain_PreCSFG_func()
{
   const IntS TESTID = 213; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;

   if((MainBCC.ENA[CSFGVT0][pre] and (MainBCC.PREVTYPE[CSFGVT0]==CSFGVT0)) or
      (MainVT.ENA[CSFGVT0][pre] and (MainVT.PREVTYPE[CSFGVT0]==CSFGVT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
 //     PwrupAtVnom_1; //not yet implemented
      
      current_shell = "FlashShell";
             /*if(GL_PREVIOUS_SHELL <> current_shell) then*/
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "PgmMain_PreCSFG_Test";
      
      if(GL_DO_PGM_USING_PBIST)  
      {
         if(SelectedTITestType==MP1)  
            testnum = TNUM_FASTPRECON;
         else
            testnum = TNUM_BANK_PROG_SM;  /*use after already repaired*/
      }
      else
          if(SelectedTITestType == MP1)  
              testnum = TNUM_BANK_PROG_ITERSECTOR;
          else
              testnum = TNUM_BANK_PROG_SM;
      
      if(GL_DO_REDENA)  
         testnum = testnum+TNUM_REDUNDENA;
      final_results=F021_Program_func(testnum,tname);
   } 
   
//   PgmMain_PreCSFG_func = v_any_dev_active;
   return(final_results);
}   /* PgmMain_PreCSFG_func */
//   
//
TMResultM RdM0_PreCSFG_func()
{
   const IntS TESTID = 214; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";
   
   if((MainBCC.ENA[CSFGVT0][pre] and (MainBCC.PREVTYPE[CSFGVT0]==CSFGVT0)) or
      (MainVT.ENA[CSFGVT0][pre] and (MainVT.PREVTYPE[CSFGVT0]==CSFGVT0)))  
      do_ena = true;
   else
      do_ena = false;
   
#if $FL_USE_AUTO_FLOW==false  
   do_ena = false;
#endif

   if(do_ena)  
   {
//      PwrupAtVnom_1; //not yet implemented
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "RdM0_PreCSFG_Test";
      
      if(GL_DO_FL_PBIST)  
         testnum = TNUM_PBIST_RDM0S;
      else
      {
         testnum = TNUM_BANK_RDM0S;
         if(GL_DO_RD_WITH_TOPTION==1)  
            testnum = testnum+TNUM_TOPTION_PSARD;
         if(GL_DO_REDENA)  
            testnum = testnum+TNUM_REDUNDENA;
      } 
      
      final_results=F021_Read_func(testnum,tname);
   } 
   
//   RdM0_PreCSFG_func = v_any_dev_active;
   return(final_results);
}   /* RdM0_PreCSFG_func */
   

TMResultM PreCSFGVT0_func()
{
   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if((MainBCC.ENA[CSFGVT0][pre] and (MainBCC.PREVTYPE[CSFGVT0]==CSFGVT0)) or
      (MainVT.ENA[CSFGVT0][pre] and (MainVT.PREVTYPE[CSFGVT0]==CSFGVT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1; //not yet implemented
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = BANKTYPE;
      vtcat   = CSFGVT0;
      prepost = pre;
      
//      logsites = v_dev_active;
//      final_results = v_dev_active;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PreCSFGVT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PreCSFGBCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
      }
      else
      {
         tname = "PreCSFGBCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PreCSFGVT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
      
      if(TI_FlashESDAEna)  
 //        if(not arraycompareboolean(logsites,final_results,v_sites))  
         {
            FLEsda.ImageNum = ESDA_IMG_CSFG_VT0_PRE;
            F021_CollectESDA(FLEsda.ImageNum);
         } 
   } 
   
//   PreCSFGVT0_func = v_any_dev_active;
   return(final_results);
}   /* PreCSFGVT0_func */
//   
//
TMResultM PreCSFGVT0OTP_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if((OtpBCC.ENA[CSFGVT0][pre] and (OtpBCC.PREVTYPE[CSFGVT0]==CSFGVT0)) or
      (OtpVT.ENA[CSFGVT0][pre] and (OtpVT.PREVTYPE[CSFGVT0]==CSFGVT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1; //not yet implemented
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = CSFGVT0;
      prepost = pre;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PreCSFGVT0OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PreCSFGBCC0OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PreCSFGBCC0OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PreCSFGVT0OTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PreCSFGVT0OTP_func = v_any_dev_active;
   return(final_results);
}   /* PreCSFGVT0OTP_func */
//   
//
TMResultM CSFG_Stress_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if(MainBCC.ENA[CSFGVT0][post] or MainVT.ENA[CSFGVT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
   
#if $TP3_TO_TP5_PRESENT  
   tcrnum = 84;  ; /*5-terminal stress*/
#else
   tcrnum = 110;
#endif
   
       /*KChau -- A08 mix mode - use mms*/
      tcrnum = 110;
      tcrmode = ProgMode;
      final_results=F021_Stress_func(TNUM_BANK_CSFG_STRESS,"CSFG_Stress_Test",tcrnum,tcrmode);
   } 

//   CSFG_Stress_func = v_any_dev_active;
   return(final_results);
}   /* CSFG_Stress_func */
   

TMResultM PstCSFGVT0_func()
{
   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if(MainBCC.ENA[CSFGVT0][post] or MainVT.ENA[CSFGVT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1; //not yet implemented
        PS_Vmax.Execute();     
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = BANKTYPE;
      vtcat   = CSFGVT0;
      prepost = post;
      
//      logsites = v_dev_active;
//      final_results = v_dev_active;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstCSFGVT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PstCSFGBCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
      }
      else
      {
         tname = "PstCSFGBCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PstCSFGVT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
      
      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
         {
            FLEsda.ImageNum = ESDA_IMG_CSFG_VT0_PST;
            F021_CollectESDA(FLEsda.ImageNum);
         } 
   } 

//   PstCSFGVT0_func = v_any_dev_active;
   return(final_results);
}   /* PstCSFGVT0_func */
//   
//
TMResultM PstCSFGVT0OTP_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if(OtpBCC.ENA[CSFGVT0][post] or OtpVT.ENA[CSFGVT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1; //not yet implemented
        PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = CSFGVT0;
      prepost = post;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstCSFGVT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PstCSFGBCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PstCSFGBCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PstCSFGVT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PstCSFGVT0OTP_func = v_any_dev_active;
   return(final_results);
}   /* PstCSFGVT0OTP_func */
   

TMResultM CSFGVT0Delta_func()
{
   TMResultM final_results;
   BoolM logsites;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

//   logsites = v_dev_active;
//   final_results = v_dev_active;
   
   if(MainVT.ENA[CSFGVT0][post])  
   {
      dlogonly = MainVT.DLOGONLY[CSFGVT0][post];
      tname = "CSFGVT0DLT_Test";
      pattype = MainVT.MEMCFG[CSFGVT0];
      final_results=F021_VT_Delta_func(pattype,CSFGVT0,tname,dlogonly);
   } 

   if(MainBCC.ENA[CSFGVT0][post])  
   {
      dlogonly = MainBCC.DLOGONLY[CSFGVT0][post];
      tname = "CSFGBCC0DLT_Test";
      pattype = MainBCC.MEMCFG[CSFGVT0];
      final_results=F021_BCC_Delta_func(pattype,CSFGVT0,tname,dlogonly);
   } 
   
   if(TI_FlashESDAEna)  
      //if(not arraycompareboolean(logsites,final_results,v_sites))  
      {
         FLEsda.ImageNum = ESDA_IMG_CSFG_VT0_DLT;
         F021_CollectESDA(FLEsda.ImageNum);
      } 

//   CSFGVT0Delta_func = v_any_dev_active;
   return(final_results);
}   /* CSFGVT0Delta_func */
   

TMResultM CSFGVT0DeltaOTP_func()
{
   TMResultM final_results;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

   if(OtpVT.ENA[CSFGVT0][post])  
   {
      dlogonly = OtpVT.DLOGONLY[CSFGVT0][post];
      tname = "CSFGVT0DLTOTP_Test";
      pattype = OTPTYPE;
      final_results=F021_VT_Delta_func(pattype,CSFGVT0,tname,dlogonly);
   } 
   
   if(OtpBCC.ENA[CSFGVT0][post])  
   {
      dlogonly = OtpBCC.DLOGONLY[CSFGVT0][post];
      tname = "CSFGBCC0DLTOTP_Test";
      pattype = OTPTYPE;
      final_results=F021_BCC_Delta_func(pattype,CSFGVT0,tname,dlogonly);
   } 

//   CSFGVT0DeltaOTP_func = v_any_dev_active;
   return(final_results);
}   /* CSFGVT0DeltaOTP_func */
//   
//
//BoolS BankErs_PreEGFG_LF1_func()
//{
//   const IntS TESTID = 86; 
//
//   BoolM final_results,logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//
//      if(v_any_dev_active)  
//      {
//         logsites = v_dev_active;
//         if(GL_DO_ERS_BY_SECTOR)  
//         {
//            testnum = TNUM_SECT_ERS_NOPRECON_SM;
//         }
//         else
//        testnum = TNUM_BANK_ERS_PRECON;
//     if(GL_DO_REDENA)  
//        testnum = testnum+TNUM_REDUNDENA;
//     tname = Ers_PreEGFG1_Test;
//         F021_Erase_func(testnum,tname,final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.Tnum = TNUM_BANK_RDM1s;
//           if(GL_DO_ERS_BY_SECTOR)  
//          FLEsda.Tnum = FLEsda.Tnum+TNUM_TARGET_SECT;
//               FLEsda.ImageNum = ESDA_IMG_BLK1;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      } 
//   } 
//
//   BankErs_PreEGFG_LF1_func = v_any_dev_active;
//}   /* BankErs_PreEGFG_LF1_func */
//   
//
//BoolS PgmMain_PreEGFG_LF1_func()
//{
//   const IntS TESTID = 87; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum,tid;
//   StringS tname;
//   Vcornertype vcorner;
//   FloatS pwstart,pwstop,pwinc;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[EGFG1VT0][pre] and (MainBCC.PREVTYPE[EGFG1VT0]==EGFG1VT0)) or
//      (MainVT.ENA[EGFG1VT0][pre] and (MainVT.PREVTYPE[EGFG1VT0]==EGFG1VT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = PgmMain_PreEGFG1_Test;
//      
//      if(GL_DO_PGM_USING_PBIST)  
//      {
//         if(TITestType==MP1)  
//            testnum = TNUM_FASTPRECON;
//         else
//            testnum = TNUM_BANK_PROG_SM;  /*use after already repaired*/
//      }
//      else
//         testnum = TNUM_BANK_PROG_SM;
//      
//      if(GL_DO_REDENA)  
//         testnum = testnum+TNUM_REDUNDENA;
//      F021_Program_func(testnum,tname,final_results);
//   } 
//   
//   PgmMain_PreEGFG_LF1_func = v_any_dev_active;
//}   /* PgmMain_PreEGFG_LF1_func */
//   
//
//BoolS RdM0_PreEGFG_LF1_func()
//{
//   const IntS TESTID = 80; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum,tid;
//   StringS tname;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[EGFG1VT0][pre] and (MainBCC.PREVTYPE[EGFG1VT0]==EGFG1VT0)) or
//      (MainVT.ENA[EGFG1VT0][pre] and (MainVT.PREVTYPE[EGFG1VT0]==EGFG1VT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = RdM0_PreEGFG1_Test;
//      
//      if(GL_DO_FL_PBIST)  
//         testnum = TNUM_PBIST_RDM0s;
//      else
//      {
//         testnum = TNUM_BANK_RDM0s;
//         if(GL_DO_RD_WITH_TOPTION==1)  
//            testnum = testnum+TNUM_TOPTION_PSARD;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//      } 
//      
//      F021_Read_func(testnum,tname,final_results);
//   } 
//   
//   RdM0_PreEGFG_LF1_func = v_any_dev_active;
//}   /* RdM0_PreEGFG_LF1_func */
//   
//
//BoolS PreEGFGVT0_LF1_func()
//{
//   const IntS TESTID = 90; 
//
//   BoolM final_results;
//   BoolM logsites;
//   StringS current_shell;
//   IntS testnum,tid;
//   StringS tname;
//   FloatS istart,istop,ires;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[EGFG1VT0][pre] and (MainBCC.PREVTYPE[EGFG1VT0]==EGFG1VT0)) or
//      (MainVT.ENA[EGFG1VT0][pre] and (MainVT.PREVTYPE[EGFG1VT0]==EGFG1VT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      if(TI_FlashCharEna and GL_DO_CHARZ_BCC)  
//      {
//         istart = MainBCC.SSTART[ONOVT0][pre];
//         istop  = MainBCC.SSTOP[ONOVT0][pre];
//         ires   = 1uA;
//         testnum = TNUM_TCR6+MainBCC.IRATIO[ONOVT0][pre]+MainBCC.RDOPTION[ONOVT0][pre];
//         Charz_BCC(VMX,testnum,BANKTYPE,istart,istop,ires,true,"Z_EGFG_BC0MX");
//      } 
//      
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tdata   = BANKTYPE;
//      vtcat   = EGFG1VT0;
//      prepost = pre;
//      
//      logsites = v_dev_active;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PreEGFG1VT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//         tname = PreEGFG1BCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.ImageNum = ESDA_IMG_BLK0;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      }
//      else
//      {
//         tname = PreEGFG1BCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         tname = PreEGFG1VT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PreEGFGVT0_LF1_func = v_any_dev_active;
//}   /* PreEGFGVT0_LF1_func */
//   
//
//BoolS PreEGFGVT0_LF1_OTP_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum,tid;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if((OtpBCC.ENA[EGFG1VT0][pre] and (OtpBCC.PREVTYPE[EGFG1VT0]==EGFG1VT0)) or
//      (OtpVT.ENA[EGFG1VT0][pre] and (OtpVT.PREVTYPE[EGFG1VT0]==EGFG1VT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      tid = 91;
//      GL_FLTESTID = tid;
//      tdata   = OTPTYPE;
//      vtcat   = EGFG1VT0;
//      prepost = pre;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PreEGFG1VT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//         tname = PreEGFG1BCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//      }
//      else
//      {
//         tname = PreEGFG1BCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//         tname = PreEGFG1VT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PreEGFGVT0_LF1_OTP_func = v_any_dev_active;
//}   /* PreEGFGVT0_LF1_OTP_func */
//   
//
//BoolS EGFG_LF1_Stress_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS tcrnum,tid;
//   TPModeType tcrmode;
//   BoolS do_ena;
//
//   if(MainBCC.ENA[EGFG1VT0][post] or MainVT.ENA[EGFG1VT0][post])  
//      do_ena = true;
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)  
//         F021_LoadFlashShell_func;
//      
//      tid = 92;
//      GL_FLTESTID = tid;
//      tcrnum = 23;   /*EGS leak/stress*/
//      tcrmode = ReadMode;   /*Note: actual mode is ErsMode but use ReadMode for different bias cond w/ same tcr#*/
//      
//      F021_Stress_func(TNUM_BANK_EGS,EGFG1_Stress_Test,tcrnum,tcrmode,final_results);
//   } 
//
//   EGFG_LF1_Stress_func = v_any_dev_active;
//}   /* EGFG_LF1_Stress_func */
//   
//
//BoolS PstEGFGVT0_LF1_func()
//{
//   BoolM final_results;
//   BoolM logsites;
//   StringS current_shell;
//   IntS testnum,tid;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if(MainBCC.ENA[EGFG1VT0][post] or MainVT.ENA[EGFG1VT0][post])  
//      do_ena = true;
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      tid = 93;
//      GL_FLTESTID = tid;
//      tdata   = BANKTYPE;
//      vtcat   = EGFG1VT0;
//      prepost = post;
//      
//      logsites = v_dev_active;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PstEGFG1VT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//         tname = PstEGFG1BCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.ImageNum = ESDA_IMG_BLK0;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      }
//      else
//      {
//         tname = PstEGFG1BCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         tname = PstEGFG1VT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//      } 
//   } 
//
//   PstEGFGVT0_LF1_func = v_any_dev_active;
//}   /* PstEGFGVT0_LF1_func */
//   
//
//BoolS PstEGFGVT0_LF1_OTP_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum,tid;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if(OtpBCC.ENA[EGFG1VT0][post] or OtpVT.ENA[EGFG1VT0][post])  
//      do_ena = true;
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//      F021_LoadFlashShell_func;
//      
//      tid = 94;
//      GL_FLTESTID = tid;
//      tdata   = OTPTYPE;
//      vtcat   = EGFG1VT0;
//      prepost = post;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PstEGFG1VT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//         tname = PstEGFG1BCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//      }
//      else
//      {
//         tname = PstEGFG1BCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//         tname = PstEGFG1VT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PstEGFGVT0_LF1_OTP_func = v_any_dev_active;
//}   /* PstEGFGVT0_LF1_OTP_func */
//   
//
//BoolS EGFGVT0_LF1_Delta_func()
//{
//   const IntS TESTID = 94; 
//
//   BoolM final_results;
//   BoolM logsites;
//   IntS pattype,tid;
//   StringS tname;
//   BoolS dlogonly;
//
//   GL_FLTESTID = TESTID;
//   
//   if(MainVT.ENA[EGFG1VT0][post])  
//   {
//      dlogonly = MainVT.DLOGONLY[EGFG1VT0][post];
//      tname = EGFG1VT0DLT_Test;
//      pattype = MainVT.MEMCFG[EGFG1VT0];
//      F021_VT_Delta_func(pattype,EGFG1VT0,tname,final_results,dlogonly);
//   } 
//
//   logsites = v_dev_active;
//   
//   if(MainBCC.ENA[EGFG1VT0][post])  
//   {
//      dlogonly = MainBCC.DLOGONLY[EGFG1VT0][post];
//      tname = EGFG1BCC0DLT_Test;
//      pattype = MainBCC.MEMCFG[EGFG1VT0];
//      F021_BCC_Delta_func(pattype,EGFG1VT0,tname,final_results,dlogonly);
//      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
//         {
//            FLEsda.ImageNum = ESDA_IMG_BLK0;
//            F021_CollectESDA(FLEsda.ImageNum);
//         } 
//   } 
//
//    /*ArrayCopyBoolean(GL_FLASH_EGSTRESS_STATUS,final_results,v_sites);} {KChau 05/17/10 - removed EGFG1/2 soft bins*/
//   
//   EGFGVT0_LF1_Delta_func = v_any_dev_active;
//}   /* EGFGVT0_LF1_Delta_func */
//
//
//BoolS EGFG1GoodVmax2_func()
//{
//   BoolM final_results;
//
//    /*KChau 05/17/10 - removed EGFG1/2 soft bins*/
//    /*negative logic binning*/
// /*  ArrayCopyBoolean(final_results,GL_FLASH_EGSTRESS_STATUS,v_sites);
//    TestOpen(EGFG1_FailGood_Test);
//    ResultsRecordActive(final_results, S_NULL);
//    TestClose;
// */
//   EGFG1GoodVmax2_func = v_any_dev_active;
//}   /* EGFG1GoodVmax2_func */
//   
//
//BoolS EGFGVT0_LF1_DeltaOTP_func()
//{
//   BoolM final_results;
//   IntS pattype,tid;
//   StringS tname;
//   BoolS dlogonly;
//
//   tid = 98;
//   GL_FLTESTID = tid;
//   
//   if(OtpVT.ENA[EGFG1VT0][post])  
//   {
//      dlogonly = OtpVT.DLOGONLY[EGFG1VT0][post];
//      tname = EGFG1VT0DLTOTP_Test;
//      pattype = OTPTYPE;
//      F021_VT_Delta_func(pattype,EGFG1VT0,tname,final_results,dlogonly);
//   } 
//   
//   if(OtpBCC.ENA[EGFG1VT0][post])  
//   {
//      dlogonly = OtpBCC.DLOGONLY[EGFG1VT0][post];
//      tname = EGFG1BCC0DLTOTP_Test;
//      pattype = OTPTYPE;
//      F021_BCC_Delta_func(pattype,EGFG1VT0,tname,final_results,dlogonly);
//   } 
//
//   EGFGVT0_LF1_DeltaOTP_func = v_any_dev_active;
//}   /* EGFGVT0_LF1_DeltaOTP_func */
//   
//
//BoolS BankErs_PreEGFG_LF2_func()
//{
//   const IntS TESTID = 99; 
//
//   BoolM final_results,logsites;
//   StringS current_shell;
//   IntS testnum,tid;
//   StringS tname;
//   BoolS do_ena;
//
//   do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      
//      if(v_any_dev_active)  
//      {
//         logsites = v_dev_active;
//         if(GL_DO_ERS_BY_SECTOR)  
//         {
//            testnum = TNUM_SECT_ERS_NOPRECON_SM;
//         }
//         else
//            testnum = TNUM_BANK_ERS_PRECON;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//         tname = Ers_PreEGFG2_Test;
//         F021_Erase_func(testnum,tname,final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.Tnum = TNUM_BANK_RDM1s;
//               if(GL_DO_ERS_BY_SECTOR)  
//                  FLEsda.Tnum = FLEsda.Tnum+TNUM_TARGET_SECT;
//               FLEsda.ImageNum = ESDA_IMG_BLK1;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      } 
//   } 
//   
//   BankErs_PreEGFG_LF2_func = v_any_dev_active;
//}   /* BankErs_PreEGFG_LF2_func */
//   
//
//BoolS PgmMain_PreEGFG_LF2_func()
//{
//   const IntS TESTID = 100; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum,tid;
//   StringS tname;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[EGFG2VT0][pre] and (MainBCC.PREVTYPE[EGFG2VT0]==EGFG2VT0)) or
//      (MainVT.ENA[EGFG2VT0][pre] and (MainVT.PREVTYPE[EGFG2VT0]==EGFG2VT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = PgmMain_PreEGFG2_Test;
//      
//      if(GL_DO_PGM_USING_PBIST)  
//      {
//         if(TITestType==MP1)  
//            testnum = TNUM_FASTPRECON;
//         else
//            testnum = TNUM_BANK_PROG_SM;  /*use after already repaired*/
//      }
//      else
//         testnum = TNUM_BANK_PROG_SM;
//      
//      if(GL_DO_REDENA)  
//         testnum = testnum+TNUM_REDUNDENA;
//      F021_Program_func(testnum,tname,final_results);
//   } 
//   
//   PgmMain_PreEGFG_LF2_func = v_any_dev_active;
//}   /* PgmMain_PreEGFG_LF2_func */
//   
//
//BoolS RdM0_PreEGFG_LF2_func()
//{
//   const IntS TESTID = 101; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum,tid;
//   StringS tname;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[EGFG2VT0][pre] and (MainBCC.PREVTYPE[EGFG2VT0]==EGFG2VT0)) or
//      (MainVT.ENA[EGFG2VT0][pre] and (MainVT.PREVTYPE[EGFG2VT0]==EGFG2VT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = RdM0_PreEGFG2_Test;
//      
//      if(GL_DO_FL_PBIST)  
//         testnum = TNUM_PBIST_RDM0s;
//      else
//      {
//         testnum = TNUM_BANK_RDM0s;
//         if(GL_DO_RD_WITH_TOPTION==1)  
//            testnum = testnum+TNUM_TOPTION_PSARD;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//      } 
//      
//      F021_Read_func(testnum,tname,final_results);
//   } 
//   
//   RdM0_PreEGFG_LF2_func = v_any_dev_active;
//}   /* RdM0_PreEGFG_LF2_func */
//   
//
//BoolS PreEGFGVT0_LF2_func()
//{
//   const IntS TESTID = 103; 
//
//   BoolM final_results;
//   BoolM logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[EGFG2VT0][pre] and (MainBCC.PREVTYPE[EGFG2VT0]==EGFG2VT0)) or
//      (MainVT.ENA[EGFG2VT0][pre] and (MainVT.PREVTYPE[EGFG2VT0]==EGFG2VT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tdata   = BANKTYPE;
//      vtcat   = EGFG2VT0;
//      prepost = pre;
//      
//      logsites = v_dev_active;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PreEGFG2VT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//         tname = PreEGFG2BCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.ImageNum = ESDA_IMG_BLK0;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      }
//      else
//      {
//         tname = PreEGFG2BCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         tname = PreEGFG2VT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PreEGFGVT0_LF2_func = v_any_dev_active;
//}   /* PreEGFGVT0_LF2_func */
//   
//
//BoolS PreEGFGVT0_LF2_OTP_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if((OtpBCC.ENA[EGFG2VT0][pre] and (OtpBCC.PREVTYPE[EGFG2VT0]==EGFG2VT0)) or
//      (OtpVT.ENA[EGFG2VT0][pre] and (OtpVT.PREVTYPE[EGFG2VT0]==EGFG2VT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      tdata   = OTPTYPE;
//      vtcat   = EGFG2VT0;
//      prepost = pre;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PreEGFG2VT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//         tname = PreEGFG2BCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//      }
//      else
//      {
//         tname = PreEGFG2BCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//         tname = PreEGFG2VT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PreEGFGVT0_LF2_OTP_func = v_any_dev_active;
//}   /* PreEGFGVT0_LF2_OTP_func */
//   
//
//BoolS EGFG_LF2_Stress_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS tcrnum;
//   TPModeType tcrmode;
//   BoolS do_ena;
//
//   if(MainBCC.ENA[EGFG2VT0][post] or MainVT.ENA[EGFG2VT0][post])  
//      do_ena = true;
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)  
//         F021_LoadFlashShell_func;
//      
//      tcrnum = 23;  
//      tcrmode = ProgMode;   /*Note: actual mode is ErsMode but use ProgMode for different bias cond w/ same tcr#*/
//      
//      F021_Stress_func(TNUM_BANK_EGS,EGFG2_Stress_Test,tcrnum,tcrmode,final_results);
//   } 
//   
//   EGFG_LF2_Stress_func = v_any_dev_active;
//}   /* EGFG_LF2_Stress_func */
//   
//
//BoolS PstEGFGVT0_LF2_func()
//{
//   BoolM final_results;
//   BoolM logsites;
//   StringS current_shell;
//   IntS testnum,tid;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if(MainBCC.ENA[EGFG2VT0][post] or MainVT.ENA[EGFG2VT0][post])  
//      do_ena = true;
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      tid = 106;
//      GL_FLTESTID = tid;
//      tdata   = BANKTYPE;
//      vtcat   = EGFG2VT0;
//      prepost = post;
//      
//      logsites = v_dev_active;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PstEGFG2VT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//         tname = PstEGFG2BCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.ImageNum = ESDA_IMG_BLK0;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      }
//      else
//      {
//         tname = PstEGFG2BCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         tname = PstEGFG2VT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PstEGFGVT0_LF2_func = v_any_dev_active;
//}   /* PstEGFGVT0_LF2_func */
//   
//
//BoolS PstEGFGVT0_LF2_OTP_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if(OtpBCC.ENA[EGFG2VT0][post] or OtpVT.ENA[EGFG2VT0][post])  
//      do_ena = true;
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      tdata   = OTPTYPE;
//      vtcat   = EGFG2VT0;
//      prepost = post;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PstEGFG2VT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//         tname = PstEGFG2BCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//      }
//      else
//      {
//         tname = PstEGFG2BCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//         tname = PstEGFG2VT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PstEGFGVT0_LF2_OTP_func = v_any_dev_active;
//}   /* PstEGFGVT0_LF2_OTP_func */
//   
//
//BoolS EGFGVT0_LF2_Delta_func()
//{
//   BoolM final_results;
//   BoolM logsites;
//   IntS pattype;
//   StringS tname;
//   BoolS dlogonly;
//
//   if(MainVT.ENA[EGFG2VT0][post])  
//   {
//      dlogonly = MainVT.DLOGONLY[EGFG2VT0][post];
//      tname = EGFG2VT0DLT_Test;
//      pattype = MainVT.MEMCFG[EGFG2VT0];
//      F021_VT_Delta_func(pattype,EGFG2VT0,tname,final_results,dlogonly);
//   } 
//
//   logsites = v_dev_active;
//   
//   if(MainBCC.ENA[EGFG2VT0][post])  
//   {
//      dlogonly = MainBCC.DLOGONLY[EGFG2VT0][post];
//      tname = EGFG2BCC0DLT_Test;
//      pattype = MainBCC.MEMCFG[EGFG2VT0];
//      F021_BCC_Delta_func(pattype,EGFG2VT0,tname,final_results,dlogonly);
//      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
//         {
//            FLEsda.ImageNum = ESDA_IMG_BLK0;
//            F021_CollectESDA(FLEsda.ImageNum);
//         } 
//   } 
//
//   GL_FLASH_EGSTRESS_STATUS = final_results;
//   
//   EGFGVT0_LF2_Delta_func = v_any_dev_active;
//}   /* EGFGVT0_LF2_Delta_func */
//   
//
//BoolS EGFG2GoodVmax2_func()
//{
//   BoolM final_results;
//
//    /*KChau 05/17/10 - removed EGFG1/2 soft bins*/
//    /*negative logic binning*/
// /*  ArrayCopyBoolean(final_results,GL_FLASH_EGSTRESS_STATUS,v_sites);
//    TestOpen(EGFG2_FailGood_Test);
//    ResultsRecordActive(final_results, S_NULL);
//    TestClose;
// */
//   EGFG2GoodVmax2_func = v_any_dev_active;
//}   /* EGFG2GoodVmax2_func */
//   
//
//BoolS EGFGVT0_LF2_DeltaOTP_func()
//{
//   BoolM final_results;
//   IntS pattype;
//   StringS tname;
//   BoolS dlogonly;
//
//
//   if(OtpVT.ENA[EGFG2VT0][post])  
//   {
//      dlogonly = OtpVT.DLOGONLY[EGFG2VT0][post];
//      tname = EGFG2VT0DLTOTP_Test;
//      pattype = OTPTYPE;
//      F021_VT_Delta_func(pattype,EGFG2VT0,tname,final_results,dlogonly);
//   } 
//   
//   if(OtpBCC.ENA[EGFG2VT0][post])  
//   {
//      dlogonly = OtpBCC.DLOGONLY[EGFG2VT0][post];
//      tname = EGFG2BCC0DLTOTP_Test;
//      pattype = OTPTYPE;
//      F021_BCC_Delta_func(pattype,EGFG2VT0,tname,final_results,dlogonly);
//   } 
//
//   EGFGVT0_LF2_DeltaOTP_func = v_any_dev_active;
//}   /* EGFGVT0_LF2_DeltaOTP_func */
//   
//
//BoolS BankErs_PreEGFG_LF3_func()
//{
//   const IntS TESTID = 112; 
//
//   BoolM final_results,logsites;
//   StringS current_shell;
//   IntS testnum,tid;
//   StringS tname;
//   BoolS do_ena;
//
//   do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      
//      if(v_any_dev_active)  
//      {
//         logsites = v_dev_active;
//         if(GL_DO_ERS_BY_SECTOR)  
//         {
//            testnum = TNUM_SECT_ERS_NOPRECON_SM;
//         }
//         else
//            testnum = TNUM_BANK_ERS_PRECON;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//         tname = Ers_PreEGFG3_Test;
//         F021_Erase_func(testnum,tname,final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.Tnum = TNUM_BANK_RDM1s;
//               if(GL_DO_ERS_BY_SECTOR)  
//                  FLEsda.Tnum = FLEsda.Tnum+TNUM_TARGET_SECT;
//               FLEsda.ImageNum = ESDA_IMG_BLK1;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      } 
//   } 
//   
//   BankErs_PreEGFG_LF3_func = v_any_dev_active;
//}   /* BankErs_PreEGFG_LF3_func */
//   
//
TMResultM PgmMain_PreEGFG_LF3_func()
{
   const IntS TESTID = 113; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum,tid;
   StringS tname;
   FloatS pwstart,pwstop,pwinc;
   VCornerType vcorner;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if((MainBCC.ENA[EGFG3VT0][pre] and (MainBCC.PREVTYPE[EGFG3VT0]==EGFG3VT0)) or
      (MainVT.ENA[EGFG3VT0][pre] and (MainVT.PREVTYPE[EGFG3VT0]==EGFG3VT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1; //not yet implemented
      PS_Vnom.Execute();
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "PgmMain_PreEGFG3_Test";
      
      if(GL_DO_PGM_USING_PBIST)  
      {
         if(SelectedTITestType==MP1)  
            testnum = TNUM_FASTPRECON;
         else
            testnum = TNUM_BANK_PROG_SM;  /*use after already repaired*/
      }
      else
         testnum = TNUM_BANK_PROG_SM;
      
      if(GL_DO_REDENA)  
         testnum = testnum+TNUM_REDUNDENA;
      final_results=F021_Program_func(testnum,tname);
   } 
   
//   PgmMain_PreEGFG_LF3_func = v_any_dev_active;
   return(final_results);
}   /* PgmMain_PreEGFG_LF3_func */
   

TMResultM RdM0_PreEGFG_LF3_func()
{
   const IntS TESTID = 114; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if((MainBCC.ENA[EGFG3VT0][pre] and (MainBCC.PREVTYPE[EGFG3VT0]==EGFG3VT0)) or
      (MainVT.ENA[EGFG3VT0][pre] and (MainVT.PREVTYPE[EGFG3VT0]==EGFG3VT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "RdM0_PreEGFG3_Test";
      
      if(GL_DO_FL_PBIST)  
         testnum = TNUM_PBIST_RDM0S;
      else
      {
         testnum = TNUM_BANK_RDM0S;
         if(GL_DO_RD_WITH_TOPTION==1)  
            testnum = testnum+TNUM_TOPTION_PSARD;
         if(GL_DO_REDENA)  
            testnum = testnum+TNUM_REDUNDENA;
      } 
      
      final_results=F021_Read_func(testnum,tname);
   } 
   
//   RdM0_PreEGFG_LF3_func = v_any_dev_active;
   return(final_results);
}   /* RdM0_PreEGFG_LF3_func */
   

TMResultM PreEGFGVT0_LF3_func()
{
   const IntS TESTID = 116; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if((MainBCC.ENA[EGFG3VT0][pre] and (MainBCC.PREVTYPE[EGFG3VT0]==EGFG3VT0)) or
      (MainVT.ENA[EGFG3VT0][pre] and (MainVT.PREVTYPE[EGFG3VT0]==EGFG3VT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1;
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata   = BANKTYPE;
      vtcat   = EGFG3VT0;
      prepost = pre;
      
//      logsites = v_dev_active;
//      final_results = v_dev_active;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PreEGFG3VT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PreEGFG3BCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
      }
      else
      {
         tname = "PreEGFG3BCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PreEGFG3VT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
      
      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
         {
            for(SiteIter si=ActiveSites.Begin(); !si.End(); ++si)
               if (final_results[*si] == TM_FAIL)
               {
                  FLEsda.ImageNum = ESDA_IMG_EGFG3_VT0_PRE;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
         } 
   } 
   
//   PreEGFGVT0_LF3_func = v_any_dev_active;
   return(final_results);
}   /* PreEGFGVT0_LF3_func */
   

TMResultM PreEGFGVT0_LF3_OTP_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if((OtpBCC.ENA[EGFG3VT0][pre] and (OtpBCC.PREVTYPE[EGFG3VT0]==EGFG3VT0)) or
      (OtpVT.ENA[EGFG3VT0][pre] and (OtpVT.PREVTYPE[EGFG3VT0]==EGFG3VT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1;
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = EGFG3VT0;
      prepost = pre;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PreEGFG3VT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PreEGFG3BCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PreEGFG3BCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PreEGFG3VT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PreEGFGVT0_LF3_OTP_func = v_any_dev_active;
   return (final_results);
}   /* PreEGFGVT0_LF3_OTP_func */
   

TMResultM EGFG_LF3_Stress_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if(MainBCC.ENA[EGFG3VT0][post] or MainVT.ENA[EGFG3VT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      tcrnum = 23;  
      tcrmode = PvfyMode;   /*Note: actual mode is ErsMode but use PvfyMode for different bias cond w/ same tcr#*/
      
      final_results=F021_Stress_func(TNUM_BANK_EGS,"EGFG3_Stress_Test",tcrnum,tcrmode);
   } 
   
//   EGFG_LF3_Stress_func = v_any_dev_active;
   return(final_results);
}   /* EGFG_LF3_Stress_func */
//   
//
TMResultM PstEGFGVT0_LF3_func()
{
   const IntS TESTID = 119; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if(MainBCC.ENA[EGFG3VT0][post] or MainVT.ENA[EGFG3VT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1;
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata   = BANKTYPE;
      vtcat   = EGFG3VT0;
      prepost = post;
      
//     logsites = v_dev_active;
//      final_results = v_dev_active;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstEGFG3VT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PstEGFG3BCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
      }
      else
      {
         tname = "PstEGFG3BCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PstEGFG3VT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
      
      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
         {
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
            {
               if (final_results[*si] == TM_FAIL)
               {
                  FLEsda.ImageNum = ESDA_IMG_EGFG3_VT0_PST;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
            }
         } 
   } 
   
//   PstEGFGVT0_LF3_func = v_any_dev_active;
   return(final_results);
}   /* PstEGFGVT0_LF3_func */
//   
//
TMResultM PstEGFGVT0_LF3_OTP_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if(OtpBCC.ENA[EGFG3VT0][post] or OtpVT.ENA[EGFG3VT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1;
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = EGFG3VT0;
      prepost = post;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstEGFG3VT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PstEGFG3BCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PstEGFG3BCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PstEGFG3VT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PstEGFGVT0_LF3_OTP_func = v_any_dev_active;
   return(final_results);
}   /* PstEGFGVT0_LF3_OTP_func */
   

TMResultM EGFGVT0_LF3_Delta_func()
{
   TMResultM final_results;
   BoolM logsites;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

//   logsites = v_dev_active;
//   final_results = v_dev_active;
   
   if(MainVT.ENA[EGFG3VT0][post])  
   {
      dlogonly = MainVT.DLOGONLY[EGFG3VT0][post];
      tname = "EGFG3VT0DLT_Test";
      pattype = MainVT.MEMCFG[EGFG3VT0];
      final_results=F021_VT_Delta_func(pattype,EGFG3VT0,tname,dlogonly);
   } 

   if(MainBCC.ENA[EGFG3VT0][post])  
   {
      dlogonly = MainBCC.DLOGONLY[EGFG3VT0][post];
      tname = "EGFG3BCC0DLT_Test";
      pattype = MainBCC.MEMCFG[EGFG3VT0];
      final_results=F021_BCC_Delta_func(pattype,EGFG3VT0,tname,dlogonly);
   } 
   
   if(TI_FlashESDAEna)  
//      if(not arraycompareboolean(logsites,final_results,v_sites))  
      {
         for(SiteIter si=ActiveSites.Begin(); !si.End(); ++si)
         {
            if(final_results[*si]==TM_FAIL)
            {
               FLEsda.ImageNum = ESDA_IMG_EGFG3_VT0_DLT;
               F021_CollectESDA(FLEsda.ImageNum);
            }
         }
      } 

//   EGFGVT0_LF3_Delta_func = v_any_dev_active;
   return(final_results);
}   /* EGFGVT0_LF3_Delta_func */
//   
//
TMResultM EGFGVT0_LF3_DeltaOTP_func()
{
   TMResultM final_results;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;


   if(OtpVT.ENA[EGFG3VT0][post])  
   {
      dlogonly = OtpVT.DLOGONLY[EGFG3VT0][post];
      tname = "EGFG3VT0DLTOTP_Test";
      pattype = OTPTYPE;
      final_results=F021_VT_Delta_func(pattype,EGFG3VT0,tname,dlogonly);
   } 
   
   if(OtpBCC.ENA[EGFG3VT0][post])  
   {
      dlogonly = OtpBCC.DLOGONLY[EGFG3VT0][post];
      tname = "EGFG3BCC0DLTOTP_Test";
      pattype = OTPTYPE;
      final_results=F021_BCC_Delta_func(pattype,EGFG3VT0,tname,dlogonly);
   } 

//   EGFGVT0_LF3_DeltaOTP_func = v_any_dev_active;
   return(final_results);
}   /* EGFGVT0_LF3_DeltaOTP_func */
//   
//
//BoolS BankErs_PreEGFG_LF4_func()
//{
//   const IntS TESTID = 123; 
//
//   BoolM final_results,logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      
//      if(v_any_dev_active)  
//      {
//         logsites = v_dev_active;
//         if(GL_DO_ERS_BY_SECTOR)  
//         {
//            testnum = TNUM_SECT_ERS_NOPRECON_SM;
//         }
//         else
//            testnum = TNUM_BANK_ERS_PRECON;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//         tname = Ers_PreEGFG4_Test;
//         F021_Erase_func(testnum,tname,final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.Tnum = TNUM_BANK_RDM1s;
//               if(GL_DO_ERS_BY_SECTOR)  
//                  FLEsda.Tnum = FLEsda.Tnum+TNUM_TARGET_SECT;
//               FLEsda.ImageNum = ESDA_IMG_BLK1;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      } 
//   } 
//   
//   BankErs_PreEGFG_LF4_func = v_any_dev_active;
//}   /* BankErs_PreEGFG_LF4_func */
//   
//
TMResultM PgmMain_PreEGFG_LF4_func()
{
   const IntS TESTID = 124; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if((MainBCC.ENA[EGFG4VT0][pre] and (MainBCC.PREVTYPE[EGFG4VT0]==EGFG4VT0)) or
      (MainVT.ENA[EGFG4VT0][pre] and (MainVT.PREVTYPE[EGFG4VT0]==EGFG4VT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "PgmMain_PreEGFG4_Test";
      
      if(GL_DO_PGM_USING_PBIST)  
      {
         if(SelectedTITestType==MP1)  
            testnum = TNUM_FASTPRECON;
         else
            testnum = TNUM_BANK_PROG_SM;  /*use after already repaired*/
      }
      else
         testnum = TNUM_BANK_PROG_SM;
      
      if(GL_DO_REDENA)  
         testnum = testnum+TNUM_REDUNDENA;
      final_results=F021_Program_func(testnum,tname);
   } 
   
//   PgmMain_PreEGFG_LF4_func = v_any_dev_active;
   return(final_results);
}   /* PgmMain_PreEGFG_LF4_func */
//
//   
TMResultM RdM0_PreEGFG_LF4_func()
{
   const IntS TESTID = 125; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if((MainBCC.ENA[EGFG4VT0][pre] and (MainBCC.PREVTYPE[EGFG4VT0]==EGFG4VT0)) or
      (MainVT.ENA[EGFG4VT0][pre] and (MainVT.PREVTYPE[EGFG4VT0]==EGFG4VT0)))  
      do_ena = true;
   else
      do_ena = false;

#if $FL_USE_AUTO_FLOW==false  
   do_ena = false;
#endif

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "RdM0_PreEGFG4_Test";
      
      if(GL_DO_FL_PBIST)  
         testnum = TNUM_PBIST_RDM0S;
      else
      {
         testnum = TNUM_BANK_RDM0S;
         if(GL_DO_RD_WITH_TOPTION==1)  
            testnum = testnum+TNUM_TOPTION_PSARD;
         if(GL_DO_REDENA)  
            testnum = testnum+TNUM_REDUNDENA;
      } 
      
      final_results=F021_Read_func(testnum,tname);
   } 
   
//   RdM0_PreEGFG_LF4_func = v_any_dev_active;
   return(final_results);
}   /* RdM0_PreEGFG_LF4_func */


TMResultM PreEGFGVT0_LF4_func()
{
   const IntS TESTID = 127; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if((MainBCC.ENA[EGFG4VT0][pre] and (MainBCC.PREVTYPE[EGFG4VT0]==EGFG4VT0)) or
      (MainVT.ENA[EGFG4VT0][pre] and (MainVT.PREVTYPE[EGFG4VT0]==EGFG4VT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1; //not yet implemented
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata   = BANKTYPE;
      vtcat   = EGFG4VT0;
      prepost = pre;
      
//      logsites = v_dev_active;
//      final_results = v_dev_active;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PreEGFG4VT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PreEGFG4BCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
      }
      else
      {
         tname = "PreEGFG4BCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PreEGFG4VT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
      
      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
         {
            FLEsda.ImageNum = ESDA_IMG_EGFG4_VT0_PRE;
            F021_CollectESDA(FLEsda.ImageNum);
         } 
   } 
   
//   PreEGFGVT0_LF4_func = v_any_dev_active;
   return(final_results);
}   /* PreEGFGVT0_LF4_func */
   

TMResultM PreEGFGVT0_LF4_OTP_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if((OtpBCC.ENA[EGFG4VT0][pre] and (OtpBCC.PREVTYPE[EGFG4VT0]==EGFG4VT0)) or
      (OtpVT.ENA[EGFG4VT0][pre] and (OtpVT.PREVTYPE[EGFG4VT0]==EGFG4VT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1; //not yet implemented
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = EGFG4VT0;
      prepost = pre;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PreEGFG4VT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PreEGFG4BCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PreEGFG4BCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PreEGFG4VT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PreEGFGVT0_LF4_OTP_func = v_any_dev_active;
   return(final_results);
}   /* PreEGFGVT0_LF4_OTP_func */
//   
//
TMResultM EGFG_LF4_Stress_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if(MainBCC.ENA[EGFG4VT0][post] or MainVT.ENA[EGFG4VT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute(); 
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      tcrnum = 23;  
      tcrmode = EvfyMode;   /*Note: actual mode is ErsMode but use EvfyMode for different bias cond w/ same tcr#*/
      
      final_results=F021_Stress_func(TNUM_BANK_EGS,"EGFG4_Stress_Test",tcrnum,tcrmode);
   } 
   
//   EGFG_LF4_Stress_func = v_any_dev_active;
   return(final_results);
}   /* EGFG_LF4_Stress_func */
   

TMResultM PstEGFGVT0_LF4_func()
{
   const IntS TESTID = 130; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if(MainBCC.ENA[EGFG4VT0][post] or MainVT.ENA[EGFG4VT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1; //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata   = BANKTYPE;
      vtcat   = EGFG4VT0;
      prepost = post;
      
//      logsites = v_dev_active;
//      final_results = v_dev_active;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstEGFG4VT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PstEGFG4BCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
      }
      else
      {
         tname = "PstEGFG4BCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PstEGFG4VT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
      
      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
         {
            FLEsda.ImageNum = ESDA_IMG_EGFG4_VT0_PST;
            F021_CollectESDA(FLEsda.ImageNum);
         } 
   } 
   
//   PstEGFGVT0_LF4_func = v_any_dev_active;
   return(final_results);
}   /* PstEGFGVT0_LF4_func */
   

TMResultM PstEGFGVT0_LF4_OTP_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if(OtpBCC.ENA[EGFG4VT0][post] or OtpVT.ENA[EGFG4VT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1;
      PS_Vmax.Execute();      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = EGFG4VT0;
      prepost = post;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstEGFG4VT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PstEGFG4BCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PstEGFG4BCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PstEGFG4VT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PstEGFGVT0_LF4_OTP_func = v_any_dev_active;
   return(final_results);
}   /* PstEGFGVT0_LF4_OTP_func */
//   
//
TMResultM EGFGVT0_LF4_Delta_func()
{
   TMResultM final_results;
   BoolM logsites;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

//   logsites = v_dev_active;
//   final_results = v_dev_active;
   
   if(MainVT.ENA[EGFG4VT0][post])  
   {
      dlogonly = MainVT.DLOGONLY[EGFG4VT0][post];
      tname = "EGFG4VT0DLT_Test";
      pattype = MainVT.MEMCFG[EGFG4VT0];
      final_results=F021_VT_Delta_func(pattype,EGFG4VT0,tname,dlogonly);
   } 

   if(MainBCC.ENA[EGFG4VT0][post])  
   {
      dlogonly = MainBCC.DLOGONLY[EGFG4VT0][post];
      tname = "EGFG4BCC0DLT_Test";
      pattype = MainBCC.MEMCFG[EGFG4VT0];
      final_results=F021_BCC_Delta_func(pattype,EGFG4VT0,tname,dlogonly);
   } 
   
   if(TI_FlashESDAEna)  
//      if(not arraycompareboolean(logsites,final_results,v_sites))  
      {
         FLEsda.ImageNum = ESDA_IMG_EGFG4_VT0_DLT;
         F021_CollectESDA(FLEsda.ImageNum);
      } 

//   EGFGVT0_LF4_Delta_func = v_any_dev_active;
   return(final_results);
}   /* EGFGVT0_LF4_Delta_func */
   

TMResultM EGFGVT0_LF4_DeltaOTP_func()
{
   TMResultM final_results;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;


   if(OtpVT.ENA[EGFG4VT0][post])  
   {
      dlogonly = OtpVT.DLOGONLY[EGFG4VT0][post];
      tname = "EGFG4VT0DLTOTP_Test";
      pattype = OTPTYPE;
      final_results=F021_VT_Delta_func(pattype,EGFG4VT0,tname,dlogonly);
   } 
   
   if(OtpBCC.ENA[EGFG4VT0][post])  
   {
      dlogonly = OtpBCC.DLOGONLY[EGFG4VT0][post];
      tname = "EGFG4BCC0DLTOTP_Test";
      pattype = OTPTYPE;
      final_results=F021_BCC_Delta_func(pattype,EGFG4VT0,tname,dlogonly);
   } 

//   EGFGVT0_LF4_DeltaOTP_func = v_any_dev_active;
  return(final_results);
}   /* EGFGVT0_LF4_DeltaOTP_func */
//
//
//BoolS BankErs_PreEGFG_LF5_func()
//{
//   const IntS TESTID = 134; 
//
//   BoolM final_results,logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//
//      if(v_any_dev_active)  
//      {
//         logsites = v_dev_active;
//         if(GL_DO_ERS_BY_SECTOR)  
//         {
//            testnum = TNUM_SECT_ERS_NOPRECON_SM;
//         }
//         else
//            testnum = TNUM_BANK_ERS_PRECON;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//         tname = Ers_PreEGFG5_Test;
//         F021_Erase_func(testnum,tname,final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.Tnum = TNUM_BANK_RDM1s;
//               if(GL_DO_ERS_BY_SECTOR)  
//                  FLEsda.Tnum = FLEsda.Tnum+TNUM_TARGET_SECT;
//               FLEsda.ImageNum = ESDA_IMG_BLK1;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      } 
//   } 
//   
//   BankErs_PreEGFG_LF5_func = v_any_dev_active;
//}   /* BankErs_PreEGFG_LF5_func */
//   
//
//BoolS PgmMain_PreEGFG_LF5_func()
//{
//   const IntS TESTID = 135; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[EGFG5VT0][pre] and (MainBCC.PREVTYPE[EGFG5VT0]==EGFG5VT0)) or
//      (MainVT.ENA[EGFG5VT0][pre] and (MainVT.PREVTYPE[EGFG5VT0]==EGFG5VT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = PgmMain_PreEGFG5_Test;
//      
//      if(GL_DO_PGM_USING_PBIST)  
//      {
//         if(TITestType==MP1)  
//            testnum = TNUM_FASTPRECON;
//         else
//            testnum = TNUM_BANK_PROG_SM;  /*use after already repaired*/
//      }
//      else
//         testnum = TNUM_BANK_PROG_SM;
//      
//      if(GL_DO_REDENA)  
//         testnum = testnum+TNUM_REDUNDENA;
//      F021_Program_func(testnum,tname,final_results);
//   } 
//   
//   PgmMain_PreEGFG_LF5_func = v_any_dev_active;
//}   /* PgmMain_PreEGFG_LF5_func */
//
//   
//BoolS RdM0_PreEGFG_LF5_func()
//{
//   const IntS TESTID = 136; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[EGFG5VT0][pre] and (MainBCC.PREVTYPE[EGFG5VT0]==EGFG5VT0)) or
//      (MainVT.ENA[EGFG5VT0][pre] and (MainVT.PREVTYPE[EGFG5VT0]==EGFG5VT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = RdM0_PreEGFG5_Test;
//      
//      if(GL_DO_FL_PBIST)  
//         testnum = TNUM_PBIST_RDM0s;
//      else
//      {
//         testnum = TNUM_BANK_RDM0s;
//         if(GL_DO_RD_WITH_TOPTION==1)  
//            testnum = testnum+TNUM_TOPTION_PSARD;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//      } 
//      
//      F021_Read_func(testnum,tname,final_results);
//   } 
//   
//   RdM0_PreEGFG_LF5_func = v_any_dev_active;
//}   /* RdM0_PreEGFG_LF5_func */
//
//
//BoolS PreEGFGVT0_LF5_func()
//{
//   const IntS TESTID = 138; 
//
//   BoolM final_results;
//   BoolM logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[EGFG5VT0][pre] and (MainBCC.PREVTYPE[EGFG5VT0]==EGFG5VT0)) or
//      (MainVT.ENA[EGFG5VT0][pre] and (MainVT.PREVTYPE[EGFG5VT0]==EGFG5VT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tdata   = BANKTYPE;
//      vtcat   = EGFG5VT0;
//      prepost = pre;
//      
//      logsites = v_dev_active;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PreEGFG5VT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//         tname = PreEGFG5BCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.ImageNum = ESDA_IMG_BLK0;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      }
//      else
//      {
//         tname = PreEGFG5BCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         tname = PreEGFG5VT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PreEGFGVT0_LF5_func = v_any_dev_active;
//}   /* PreEGFGVT0_LF5_func */
//   
//
//BoolS PreEGFGVT0_LF5_OTP_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if((OtpBCC.ENA[EGFG5VT0][pre] and (OtpBCC.PREVTYPE[EGFG5VT0]==EGFG5VT0)) or
//      (OtpVT.ENA[EGFG5VT0][pre] and (OtpVT.PREVTYPE[EGFG5VT0]==EGFG5VT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      tdata   = OTPTYPE;
//      vtcat   = EGFG5VT0;
//      prepost = pre;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PreEGFG5VT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//         tname = PreEGFG5BCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//      }
//      else
//      {
//         tname = PreEGFG5BCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//         tname = PreEGFG5VT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PreEGFGVT0_LF5_OTP_func = v_any_dev_active;
//}   /* PreEGFGVT0_LF5_OTP_func */
//   
//
//BoolS EGFG_LF5_Stress_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS tcrnum;
//   TPModeType tcrmode;
//   BoolS do_ena;
//
//   if(MainBCC.ENA[EGFG5VT0][post] or MainVT.ENA[EGFG5VT0][post])  
//      do_ena = true;
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)  
//         F021_LoadFlashShell_func;
//      
//      tcrnum = 23;  
//      tcrmode = CvfyMode;   /*Note: actual mode is ErsMode but use CvfyMode for different bias cond w/ same tcr#*/
//      
//      F021_Stress_func(TNUM_BANK_EGS,EGFG5_Stress_Test,tcrnum,tcrmode,final_results);
//   } 
//   
//   EGFG_LF5_Stress_func = v_any_dev_active;
//}   /* EGFG_LF5_Stress_func */
//   
//
//BoolS PstEGFGVT0_LF5_func()
//{
//   const IntS TESTID = 141; 
//
//   BoolM final_results;
//   BoolM logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if(MainBCC.ENA[EGFG5VT0][post] or MainVT.ENA[EGFG5VT0][post])  
//      do_ena = true;
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tdata   = BANKTYPE;
//      vtcat   = EGFG5VT0;
//      prepost = post;
//      
//      logsites = v_dev_active;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PstEGFG5VT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//         tname = PstEGFG5BCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.ImageNum = ESDA_IMG_BLK0;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      }
//      else
//      {
//         tname = PstEGFG5BCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         tname = PstEGFG5VT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PstEGFGVT0_LF5_func = v_any_dev_active;
//}   /* PstEGFGVT0_LF5_func */
//   
//
//BoolS PstEGFGVT0_LF5_OTP_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if(OtpBCC.ENA[EGFG5VT0][post] or OtpVT.ENA[EGFG5VT0][post])  
//      do_ena = true;
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      tdata   = OTPTYPE;
//      vtcat   = EGFG5VT0;
//      prepost = post;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PstEGFG5VT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//         tname = PstEGFG5BCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//      }
//      else
//      {
//         tname = PstEGFG5BCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//         tname = PstEGFG5VT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PstEGFGVT0_LF5_OTP_func = v_any_dev_active;
//}   /* PstEGFGVT0_LF5_OTP_func */
//   
//
//BoolS EGFGVT0_LF5_Delta_func()
//{
//   BoolM final_results;
//   BoolM logsites;
//   IntS pattype;
//   StringS tname;
//   BoolS dlogonly;
//
//   if(MainVT.ENA[EGFG5VT0][post])  
//   {
//      dlogonly = MainVT.DLOGONLY[EGFG5VT0][post];
//      tname = EGFG5VT0DLT_Test;
//      pattype = MainVT.MEMCFG[EGFG5VT0];
//      F021_VT_Delta_func(pattype,EGFG5VT0,tname,final_results,dlogonly);
//   } 
//
//   logsites = v_dev_active;
//   
//   if(MainBCC.ENA[EGFG5VT0][post])  
//   {
//      dlogonly = MainBCC.DLOGONLY[EGFG5VT0][post];
//      tname = EGFG5BCC0DLT_Test;
//      pattype = MainBCC.MEMCFG[EGFG5VT0];
//      F021_BCC_Delta_func(pattype,EGFG5VT0,tname,final_results,dlogonly);
//      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
//         {
//            FLEsda.ImageNum = ESDA_IMG_BLK0;
//            F021_CollectESDA(FLEsda.ImageNum);
//         } 
//   } 
//   
//   EGFGVT0_LF5_Delta_func = v_any_dev_active;
//}   /* EGFGVT0_LF5_Delta_func */
//   
//
//BoolS EGFGVT0_LF5_DeltaOTP_func()
//{
//   BoolM final_results;
//   IntS pattype;
//   StringS tname;
//   BoolS dlogonly;
//
//
//   if(OtpVT.ENA[EGFG5VT0][post])  
//   {
//      dlogonly = OtpVT.DLOGONLY[EGFG5VT0][post];
//      tname = EGFG5VT0DLTOTP_Test;
//      pattype = OTPTYPE;
//      F021_VT_Delta_func(pattype,EGFG5VT0,tname,final_results,dlogonly);
//   } 
//   
//   if(OtpBCC.ENA[EGFG5VT0][post])  
//   {
//      dlogonly = OtpBCC.DLOGONLY[EGFG5VT0][post];
//      tname = EGFG5BCC0DLTOTP_Test;
//      pattype = OTPTYPE;
//      F021_BCC_Delta_func(pattype,EGFG5VT0,tname,final_results,dlogonly);
//   } 
//
//   EGFGVT0_LF5_DeltaOTP_func = v_any_dev_active;
//}   /* EGFGVT0_LF5_DeltaOTP_func */
//
//
//BoolS BankErs_PreRdDisturb_func()
//{
//   const IntS TESTID = 223; 
//
//   BoolM final_results,logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      if(v_any_dev_active)  
//      {
//         logsites = v_dev_active;
//         if(GL_DO_ERS_BY_SECTOR)  
//         {
//            testnum = TNUM_SECT_ERS_NOPRECON_SM;
//         }
//         else
//            testnum = TNUM_BANK_ERS_PRECON;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//         tname = Ers_PreRdDistb_Test;
//         F021_Erase_func(testnum,tname,final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.Tnum = TNUM_BANK_RDM1s;
//               if(GL_DO_ERS_BY_SECTOR)  
//                  FLEsda.Tnum = FLEsda.Tnum+TNUM_TARGET_SECT;
//               FLEsda.ImageNum = ESDA_IMG_BLK1;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      } 
//   } 
//   
//   BankErs_PreRdDisturb_func = v_any_dev_active;
//}   /* BankErs_PreRdDisturb_func */
//   
//
TMResultM PgmMain_PreRdDisturb_func()
{
   const IntS TESTID = 224; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if((MainBCC.ENA[RDDISTBVT0][pre] and (MainBCC.PREVTYPE[RDDISTBVT0]==RDDISTBVT0)) or
      (MainVT.ENA[RDDISTBVT0][pre] and (MainVT.PREVTYPE[RDDISTBVT0]==RDDISTBVT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "PgmMain_PreRdDistb_Test";
      
      if(GL_DO_PGM_USING_PBIST)  
      {
         if(SelectedTITestType==MP1)  
            testnum = TNUM_FASTPRECON;
         else
            testnum = TNUM_BANK_PROG_SM;  /*use after already repaired*/
      }
      else
          if(SelectedTITestType == MP1)  
              testnum = TNUM_BANK_PROG_ITERSECTOR ; /*C06 Changed to match spec Jamal Sheikh modified Fri, Feb  3 2012*/
          else
              testnum = TNUM_BANK_PROG_SM;           
      
      if(GL_DO_REDENA)  
        testnum = testnum+TNUM_REDUNDENA;
      final_results=F021_Program_func(testnum,tname);
   } 
   
//   PgmMain_PreRdDisturb_func = v_any_dev_active;
   return(final_results);
}   /* PgmMain_PreRdDisturb_func */
//   
//
//BoolS RdM0_PreRdDisturb_func()
//{
//   const IntS TESTID = 225; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[RDDISTBVT0][pre] and (MainBCC.PREVTYPE[RDDISTBVT0]==RDDISTBVT0)) or
//      (MainVT.ENA[RDDISTBVT0][pre] and (MainVT.PREVTYPE[RDDISTBVT0]==RDDISTBVT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//#if $FL_USE_AUTO_FLOW==false  
//   do_ena = false;
//#endif
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = RdM0_PreRdDistb_Test;
//      
//      if(GL_DO_FL_PBIST)  
//         testnum = TNUM_PBIST_RDM0s;
//      else
//      {
//         testnum = TNUM_BANK_RDM0s;
//         if(GL_DO_RD_WITH_TOPTION==1)  
//            testnum = testnum+TNUM_TOPTION_PSARD;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//      } 
//      
//      F021_Read_func(testnum,tname,final_results);
//   } 
//   
//   RdM0_PreRdDisturb_func = v_any_dev_active;
//}   /* RdM0_PreRdDisturb_func */
//   
//
//BoolS PreRdDisturbVT0_func()
//{
//   BoolM final_results;
//   BoolM logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[RDDISTBVT0][pre] and (MainBCC.PREVTYPE[RDDISTBVT0]==RDDISTBVT0)) or
//      (MainVT.ENA[RDDISTBVT0][pre] and (MainVT.PREVTYPE[RDDISTBVT0]==RDDISTBVT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      tdata   = BANKTYPE;
//      vtcat   = RDDISTBVT0;
//      prepost = pre;
//      
//      logsites = v_dev_active;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PreRDDISTBVT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//         tname = PreRDDISTBBCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.ImageNum = ESDA_IMG_BLK0;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      }
//      else
//      {
//         tname = PreRDDISTBBCC0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//         tname = PreRDDISTBVT0_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PreRdDisturbVT0_func = v_any_dev_active;
//}   /* PreRdDisturbVT0_func */
//   
//
//BoolS PreRdDisturbVT0OTP_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if((OtpBCC.ENA[RDDISTBVT0][pre] and (OtpBCC.PREVTYPE[RDDISTBVT0]==RDDISTBVT0)) or
//      (OtpVT.ENA[RDDISTBVT0][pre] and (OtpVT.PREVTYPE[RDDISTBVT0]==RDDISTBVT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      tdata   = OTPTYPE;
//      vtcat   = RDDISTBVT0;
//      prepost = pre;
//      
//      if(GL_DO_VT_FIRST)  
//      {
//         tname = PreRDDISTBVT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//         tname = PreRDDISTBBCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//      }
//      else
//      {
//         tname = PreRDDISTBBCC0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//         tname = PreRDDISTBVT0OTP_Test;
//         TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"",final_results);
//      } 
//   } 
//   
//   PreRdDisturbVT0OTP_func = v_any_dev_active;
//}   /* PreRdDisturbVT0OTP_func */
//
//
TMResultM PstRdDisturbVT0_func()
{
   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if(MainBCC.ENA[RDDISTBVT0][post] or MainVT.ENA[RDDISTBVT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1;
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = BANKTYPE;
      vtcat   = RDDISTBVT0;
      prepost = post;
      
//      logsites = v_dev_active;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstRDDISTBVT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PstRDDISTBBCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
            {
               for(SiteIter si=ActiveSites.Begin(); !si.End(); ++si)
               {
                  if(final_results[*si] == TM_FAIL)
                  {
                     FLEsda.ImageNum = ESDA_IMG_BLK0;
                     F021_CollectESDA(FLEsda.ImageNum);
                  }
               }
            } 
      }
      else
      {
         tname = "PstRDDISTBBCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PstRDDISTBVT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
   } 
   
//   PstRdDisturbVT0_func = v_any_dev_active;
   return(final_results);
}   /* PstRdDisturbVT0_func */
   

TMResultM PstRdDisturbVT0OTP_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if(OtpBCC.ENA[RDDISTBVT0][post] or OtpVT.ENA[RDDISTBVT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1;
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = RDDISTBVT0;
      prepost = post;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstRdDISTBVT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PstRdDISTBBCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PstRdDISTBBCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PstRdDISTBVT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PstrdDisturbVT0OTP_func = v_any_dev_active;
   return(final_results);
}   /* PstrdDisturbVT0OTP_func */
//   
//
//BoolS RdDisturbVT0Delta_func()
//{
//   BoolM final_results;
//   BoolM logsites;
//   IntS pattype;
//   StringS tname;
//   BoolS dlogonly;
//
//   if(MainVT.ENA[RDDISTBVT0][post])  
//   {
//      dlogonly = MainVT.DLOGONLY[RDDISTBVT0][post];
//      tname = RdDistbVT0DLT_Test;
//      pattype = MainVT.MEMCFG[RDDISTBVT0];
//      F021_VT_Delta_func(pattype,RDDISTBVT0,tname,final_results,dlogonly);
//   } 
//
//   logsites = v_dev_active;
//   
//   if(MainBCC.ENA[RDDISTBVT0][post])  
//   {
//      dlogonly = MainBCC.DLOGONLY[RDDISTBVT0][post];
//      tname = RdDistbBCC0DLT_Test;
//      pattype = MainBCC.MEMCFG[RDDISTBVT0];
//      F021_BCC_Delta_func(pattype,RDDISTBVT0,tname,final_results,dlogonly);
//      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
//         {
//            FLEsda.ImageNum = ESDA_IMG_BLK0;
//            F021_CollectESDA(FLEsda.ImageNum);
//         } 
//   } 
//   
//   RdDisturbVT0Delta_func = v_any_dev_active;
//}   /* RdDisturbVT0Delta_func */
//   
//
//BoolS RdDisturbVT0DeltaOTP_func()
//{
//   BoolM final_results;
//   IntS pattype;
//   StringS tname;
//   BoolS dlogonly;
//
//
//   if(OtpVT.ENA[RDDISTBVT0][post])  
//   {
//      dlogonly = OtpVT.DLOGONLY[RDDISTBVT0][post];
//      tname = RdDistbVT0DLTOTP_Test;
//      pattype = OTPTYPE;
//      F021_VT_Delta_func(pattype,RDDISTBVT0,tname,final_results,dlogonly);
//   } 
//   
//   if(OtpBCC.ENA[RDDISTBVT0][post])  
//   {
//      dlogonly = OtpBCC.DLOGONLY[RDDISTBVT0][post];
//      tname = RdDistbBCC0DLTOTP_Test;
//      pattype = OTPTYPE;
//      F021_BCC_Delta_func(pattype,RDDISTBVT0,tname,final_results,dlogonly);
//   } 
//
//   RdDisturbVT0DeltaOTP_func = v_any_dev_active;
//}   /* RdDisturbVT0DeltaOTP_func */
//   
//
TMResultM ReadDisturb2_Stress_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS tcrnum;
   TPModeType tcrmode;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if(MainBCC.ENA[RDDISTB2VT0][post] or MainVT.ENA[RDDISTB2VT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      tcrnum = 58;  /*use wls*/
      tcrmode = PvfyMode;   /*Note: use PvfyMode for different bias cond w/ same tcr#*/
      
      final_results=F021_Stress_func(TNUM_BANK_RDDIST_STRESS,"RdDistb2_Stress_Test",tcrnum,tcrmode);
   } 
   
//   ReadDisturb2_Stress_func = v_any_dev_active;
   return(final_results);
}   /* ReadDisturb2_Stress_func */
//
//BoolS BankErs_PreRdDisturb2_func()
//{
//   const IntS TESTID = 234; 
//
//   BoolM final_results,logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = Ers_PreRdDistb2_Test;
//      
//      if(GL_DO_PGM_USING_PBIST)  
//      {
//         testnum = TNUM_FASTPRECON;
//      }
//      else
//         testnum = TNUM_BANK_PROG_SM;
//      if(GL_DO_REDENA)  
//         testnum = testnum+TNUM_REDUNDENA;
//      f021_program_func(testnum,tname,final_results);
//      
//      if(v_any_dev_active)  
//      {
//         logsites = v_dev_active;
//         if(GL_DO_ERS_BY_SECTOR and GL_DO_REDENA)  
//            testnum = TNUM_SECT_ERS_NOPRECON_SM;
//         else
//            testnum = TNUM_BANK_ERS_PRECON;
//         F021_Erase_func(testnum,tname,final_results);
//         if(TI_FlashESDAEna)  
//            if(not arraycompareboolean(logsites,final_results,v_sites))  
//            {
//               FLEsda.Tnum = TNUM_BANK_RDM1s;
//               FLEsda.ImageNum = ESDA_IMG_BLK1;
//               F021_CollectESDA(FLEsda.ImageNum);
//            } 
//      } 
//   } 
//   
//   BankErs_PreRdDisturb2_func = v_any_dev_active;
//}   /* BankErs_PreRdDisturb_func */
//   
//
TMResultM PgmMain_PreRdDisturb2_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if((MainBCC.ENA[RDDISTB2VT0][pre] and (MainBCC.PREVTYPE[RDDISTB2VT0]==RDDISTB2VT0)) or
      (MainVT.ENA[RDDISTB2VT0][pre] and (MainVT.PREVTYPE[RDDISTB2VT0]==RDDISTB2VT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)       
         F021_LoadFlashShell_func();
      
      tname = "PgmMain_PreRdDistb2_Test";
      
      if(GL_DO_PGM_USING_PBIST)  
      {
         if(SelectedTITestType==MP1)  
            testnum = TNUM_FASTPRECON;
         else
            testnum = TNUM_BANK_PROG_SM;  /*use after already repaired*/
      }
      else
         testnum = TNUM_BANK_PROG_SM;
      
      if(GL_DO_REDENA)  
         testnum = testnum+TNUM_REDUNDENA;
      final_results=F021_Program_func(testnum,tname);
   } 
   
//   PgmMain_PreRdDisturb2_func = v_any_dev_active;
   return(final_results);
}   /* PgmMain_PreRdDisturb2_func */
//   
//
//BoolS RdM0_PreRdDisturb2_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[RDDISTB2VT0][pre] and (MainBCC.PREVTYPE[RDDISTB2VT0]==RDDISTB2VT0)) or
//      (MainVT.ENA[RDDISTB2VT0][pre] and (MainVT.PREVTYPE[RDDISTB2VT0]==RDDISTB2VT0)))  
//      do_ena = false  /*true*/
//   else
//      do_ena = false;
//
//#if $FL_USE_AUTO_FLOW==false  
//   do_ena = false;
//#endif
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      testnum = TNUM_BANK_RDM0s;
//      if(GL_DO_RD_WITH_TOPTION==1)  
//         testnum = testnum+TNUM_TOPTION_PSARD;
//      if(GL_DO_REDENA)  
//         testnum = testnum+TNUM_REDUNDENA;
//      tname = RdM0_PreRdDistb2_Test;
//      
//      F021_Read_func(testnum,tname,final_results);
//   } 
//   
//   RdM0_PreRdDisturb2_func = v_any_dev_active;
//}   /* RdM0_PreRdDisturb2_func */
//   
//
TMResultM PreRdDisturb2VT0_func()
{
   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if((MainBCC.ENA[RDDISTB2VT0][pre] and (MainBCC.PREVTYPE[RDDISTB2VT0]==RDDISTB2VT0)) or
      (MainVT.ENA[RDDISTB2VT0][pre] and (MainVT.PREVTYPE[RDDISTB2VT0]==RDDISTB2VT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1;
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = BANKTYPE;
      vtcat   = RDDISTB2VT0;
      prepost = pre;
      
//      logsites = v_dev_active;
//      final_results = v_dev_active;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PreRDDISTB2VT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PreRDDISTB2BCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
      }
      else
      {
         tname = "PreRDDISTB2BCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PreRDDISTB2VT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
      
      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
         {
            for(SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
            {
               if(final_results[*si] == TM_FAIL)
               {
                  FLEsda.ImageNum = ESDA_IMG_RDDISTB2_VT0_PRE;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
            } //for(SiteIter si
         } //if(TI_FlashESDAEna)
   } //if(do_ena)
   
//   PreRdDisturb2VT0_func = v_any_dev_active;
   return(final_results);
}   /* PreRdDisturb2VT0_func */
   

TMResultM PreRdDisturb2VT0OTP_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if((OtpBCC.ENA[RDDISTB2VT0][pre] and (OtpBCC.PREVTYPE[RDDISTB2VT0]==RDDISTB2VT0)) or
      (OtpVT.ENA[RDDISTB2VT0][pre] and (OtpVT.PREVTYPE[RDDISTB2VT0]==RDDISTB2VT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1;
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = RDDISTB2VT0;
      prepost = pre;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PreRDDISTB2VT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PreRDDISTB2BCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PreRDDISTB2BCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PreRDDISTB2VT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PreRdDisturb2VT0OTP_func = v_any_dev_active;
   return(final_results);
}   /* PreRdDisturb2VT0OTP_func */


TMResultM PstRdDisturb2VT0_func()
{
   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if(MainBCC.ENA[RDDISTB2VT0][post] or MainVT.ENA[RDDISTB2VT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1;
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = BANKTYPE;
      vtcat   = RDDISTB2VT0;
      prepost = post;
      
//      logsites = v_dev_active;
//      final_results = v_dev_active;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstRDDISTB2VT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PstRDDISTB2BCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
      }
      else
      {
         tname = "PstRDDISTB2BCC0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PstRDDISTB2VT0_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
      
      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
      {
           for(SiteIter si=ActiveSites.Begin(); !si.End(); ++si)
           {
              if(final_results[*si] == TM_FAIL)
              {
                  FLEsda.ImageNum = ESDA_IMG_RDDISTB2_VT0_PST;
                  F021_CollectESDA(FLEsda.ImageNum);
              } //if(final_results[*si]
           } //for(SiteIter si=ActiveSites
      } //if(TI_FlashESDAEna)
   } 
   
//   PstRdDisturb2VT0_func = v_any_dev_active;
   return(final_results);
}   /* PstRdDisturb2VT0_func */
   

TMResultM PstRdDisturb2VT0OTP_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS do_ena;
   Levels PS_Vmax = "PowerUpAtVmask";

   if(OtpBCC.ENA[RDDISTB2VT0][post] or OtpVT.ENA[RDDISTB2VT0][post])  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVmax_1;
      PS_Vmax.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      tdata   = OTPTYPE;
      vtcat   = RDDISTB2VT0;
      prepost = post;
      
      if(GL_DO_VT_FIRST)  
      {
         tname = "PstRDDISTB2VT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PstRDDISTB2BCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PstRDDISTB2BCC0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PstRDDISTB2VT0OTP_Test";
         final_results=TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
   } 
   
//   PstRdDisturb2VT0OTP_func = v_any_dev_active;
   return(final_results);
}   /* PstRdDisturb2VT0OTP_func */
   

TMResultM RdDisturb2VT0Delta_func()
{
   TMResultM final_results;
   BoolM logsites;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;

//   logsites = v_dev_active;
//   final_results = v_dev_active;
 
   if(MainVT.ENA[RDDISTB2VT0][post])  
   {
      dlogonly = MainVT.DLOGONLY[RDDISTB2VT0][post];
      tname = "RdDistb2VT0DLT_Test";
      pattype = MainVT.MEMCFG[RDDISTB2VT0];
      final_results=F021_VT_Delta_func(pattype,RDDISTB2VT0,tname,dlogonly);
   } 

   if(MainBCC.ENA[RDDISTB2VT0][post])  
   {
      dlogonly = MainBCC.DLOGONLY[RDDISTB2VT0][post];
      tname = "RdDistb2BCC0DLT_Test";
      pattype = MainBCC.MEMCFG[RDDISTB2VT0];
      final_results=F021_BCC_Delta_func(pattype,RDDISTB2VT0,tname,dlogonly);
   } 

   if(TI_FlashESDAEna)  
//      if(not arraycompareboolean(logsites,final_results,v_sites))  
   {
      for(SiteIter si=ActiveSites.Begin(); !si.End(); ++si)
      {
         if(final_results[*si] = TM_FAIL)
         {
            FLEsda.ImageNum = ESDA_IMG_RDDISTB2_VT0_DLT;
            F021_CollectESDA(FLEsda.ImageNum);
         } //if(final_results[*si]
      } //for(SiteIter si=ActiveSites.Begin
   } //if(TI_FlashESDAEna)

//   RdDisturb2VT0Delta_func = v_any_dev_active;
   return(final_results);
}   /* RdDisturb2VT0Delta_func */
   

TMResultM RdDisturb2VT0DeltaOTP_func()
{
   TMResultM final_results;
   IntS pattype;
   StringS tname;
   BoolS dlogonly;


   if(OtpVT.ENA[RDDISTB2VT0][post])  
   {
      dlogonly = OtpVT.DLOGONLY[RDDISTB2VT0][post];
      tname = "RdDistb2VT0DLTOTP_Test";
      pattype = OTPTYPE;
      final_results=F021_VT_Delta_func(pattype,RDDISTB2VT0,tname,dlogonly);
   } 
   
   if(OtpBCC.ENA[RDDISTB2VT0][post])  
   {
      dlogonly = OtpBCC.DLOGONLY[RDDISTB2VT0][post];
      tname = "RdDistb2BCC0DLTOTP_Test";
      pattype = OTPTYPE;
      final_results=F021_BCC_Delta_func(pattype,RDDISTB2VT0,tname,dlogonly);
   } 

//   RdDisturb2VT0DeltaOTP_func = v_any_dev_active;
   return(final_results);
}   /* RdDisturb2VT0DeltaOTP_func */
//   
//
//BoolS RdM1EngRow_func()
//{
//   BoolM final_results;
//
//   RdM1EngRow_func = v_any_dev_active;
//} 
//
//BoolS RdM0EngRow_func()
//{
//   BoolM final_results;
//
//   RdM0EngRow_func = v_any_dev_active;
//} 
//
//BoolS SlowErsScreen_func()
//{
//   BoolM final_results;
//
//   SlowErsScreen_func = v_any_dev_active;
//} 
//
//BoolS SlowErsRepair_func()
//{
//   BoolM final_results;
//
//   SlowErsRepair_func = v_any_dev_active;
//} 
//
//BoolS BankErs_PreRandCode_func()
//{
//   const IntS TESTID = 254; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS runena;
//
//#if $FL_USE_AUTO_FLOW==false  
//   if(TITestType==MP3)  
//      runena = true;
//   else
//      runena = false;
//#else
//   if(TITestType==MP3)  
//      runena = true;
//   else
//      runena = false;
//#endif
//   
//   if(runena)  
//   {
//#if $FL_USE_AUTO_FLOW==false  
//         PwrupAtVnom_1;;
//#else
//      if(TITestType==MP3)  
//         PwrupAtVmin_1;
//      else
//         PwrupAtVnom_1;
//#endif 
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = Ers_PreRCod_Test;
//      testnum = TNUM_BANK_ERS_PRECON;
//      F021_Erase_func(testnum,tname,final_results);
//   } 
//   
//   BankErs_PreRandCode_func = v_any_dev_active;
//}   /* BankErs_PreRandCode_func */
//   
//
//BoolS RdM1_PreRandCode_func()
//{
//   const IntS TESTID = 255; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS savebool,runena;
//
//#if $FL_USE_AUTO_FLOW==false  
//   runena = false;;
//#else
//   if(TITestType==MP3)  
//      runena = true;
//   else
//      runena = false;
//#endif
//   
//   savebool = GL_DO_REDENA;
//   GL_DO_REDENA = false;
//   GL_FLTESTID = TESTID;
//   tname = RdM1_PreRCod_Test;
//   
//   if(runena)  
//   {
//      PwrupAtVmin_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      if(GL_DO_FL_PBIST)  
//         testnum = TNUM_PBIST_RDM1s;
//      else
//      {
//         testnum = TNUM_BANK_RDM1s;
//         if(GL_DO_RD_WITH_TOPTION==1)  
//            testnum = testnum+TNUM_TOPTION_PSARD;
//      } 
//      F021_Read_func(testnum,tname,final_results);
//   } 
//
//   GL_DO_REDENA = savebool;
//   RdM1_PreRandCode_func = v_any_dev_active;
//}   /* RdM1_PreRandCode_func */
//   
//
//BoolS PgmRandCode_func()
//{
//   const IntS TESTID = 256; 
//
//   BoolM final_results;
//   StringS tname;
//   IntS testnum;
//   StringS current_shell;
//   FlashCodeType ccodetype;
//   BoolS runena;
//
//#if $FL_USE_AUTO_FLOW==false  
//   runena = false;;
//#else
//   if(TITestType==MP3)  
//      runena = true;
//   else
//      runena = false;
//#endif
//   
//   if(v_any_dev_active and runena)  
//   {
//      GL_FLTESTID = TESTID;
//      tname   = PgmRCod_Test;
//      ccodetype = Random;
//      FlashCode_WR_EXE_func(tname,ccodetype,final_results);
//      GL_PREVIOUS_SHELL = "";
//   } 
//   
//   PgmRandCode_func = v_any_dev_active;
//} 
//
//BoolS ExecRandCode_Vmin_func()
//{
//   BoolM final_results;
//
//   ExecRandCode_Vmin_func = v_any_dev_active;
//} 
//
//BoolS ExecRandCode_Vmax_func()
//{
//   BoolM final_results;
//
//   ExecRandCode_Vmax_func = v_any_dev_active;
//} 

TMResultM PstDRLRandCodeVT0Min_func() {
   const IntS TESTID = 62; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   StringS tname;
   BoolM savesites,activesites;
   BoolM disallsites;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS save_redena;
   BoolS charzena,runena;
   IntS tcrnum;
   TPModeType tcrmode;
   FloatS vcg;
   StringS logstr,vstr;
   BoolM tmp_results;
   BoolS runcode;

   runcode = MainBCC.ENA[RCODEVT0][post] or MainVT.ENA[RCODEVT0][post];
   GL_FLTESTID = TESTID;
   
   if (runcode)  {
//    PwrupAtVmax_1;
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();

      save_redena = GL_DO_VT_USING_INTERNAL;
      GL_DO_VT_USING_INTERNAL = false;

//    savesites = v_dev_active;
//    disallsites = false;
      
//    ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//    ArrayAndboolean(activesites,activesites,savesites,v_sites);

//    if(not Arraycompareboolean(activesites,disallsites,v_sites))  
//       devsetholdstates(activesites);
      if (1) {
         tdata = BANKTYPE;
         vtcat = RCODEVT0;
         prepost = post;

//       logsites = v_dev_active;
//       final_results = v_dev_active;
         
         if (GL_DO_VT_FIRST)  {
            tname = "PstDRLVT0Min_Test";
            final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
            tname = "PstDRLBCC0Max_Test";
            final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         }
         else
         {
            tname = "PstDRLBCC0Max_Test";
            final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
            tname = "PstDRLVT0Min_Test";
            final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         } 

//       ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//       ArrayAndboolean(activesites,activesites,savesites,v_sites);
//       devsetholdstates(activesites);
      }
      else {
         if (tistdscreenprint)  
            cout << "All sites are retested -- Bypass PstDRLRandCodeVT0Min_func" << endl;
      } 

      GL_DO_VT_USING_INTERNAL = save_redena;
   }
   return(final_results);

}   // PstDRLRandCodeVT0Min_func 

//BoolS DRLDeltaVT0RandCode_func()
//{
//   BoolM final_results;
//
//   DRLDeltaVT0RandCode_func = v_any_dev_active;
//} 
TMResultM PstDRLRandCodeVT1Max_func() {
   const IntS TESTID = 64; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   StringS tname;
   BoolM savesites,activesites;
   BoolM disallsites;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS save_redena;
   BoolS runcode;

   GL_FLTESTID = TESTID;
   runcode = MainBCC.ENA[RCODEVT1][post] or MainVT.ENA[RCODEVT1][post];

   if (runcode)  {
//    PwrupAtVmax_1;
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();

//    savesites = v_dev_active;
//    disallsites = false;
      
//    ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//    ArrayAndboolean(activesites,activesites,savesites,v_sites);

//    if(not Arraycompareboolean(activesites,disallsites,v_sites))  
//       devsetholdstates(activesites);

      if (1) {
         tdata = BANKTYPE;
         vtcat = CHKVT1DRL;
         prepost = post;

//       logsites = v_dev_active;
         save_redena = GL_DO_VT_USING_INTERNAL;
         GL_DO_VT_USING_INTERNAL = false;
         
         if (GL_DO_VT_FIRST) {
            tname = "PstDRLVT1Max_Test";
          final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
            tname = "PstDRLBCC1Min_Test";
          final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         }
         else {
            tname = "PstDRLBCC1Min_Test";
          final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
            tname = "PstDRLVT1Max_Test";
          final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         } 

//          if(not arraycompareboolean(logsites,final_results,v_sites))  
         if (TI_FlashESDAEna) {
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
               if ( final_results[*si] != TM_PASS ) {
                  FLEsda.ImageNum = ESDA_IMG_DRL_VT1_PST;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
            }
         }

         GL_DO_VT_USING_INTERNAL = save_redena;
         
//       ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//       ArrayAndboolean(activesites,activesites,savesites,v_sites);
//       devsetholdstates(activesites);
      }
      else {
         if (tistdscreenprint)  
            cout << "All sites are retested -- Bypass PstDRLRandCodeVT1Max_func" << endl;
      } 
   } 
   return(final_results);
   
}   // PstDRLRandCodeVT1Max_func 

//BoolS DRLDeltaVT1RandCode_func()
//{
//   BoolM final_results;
//
//   DRLDeltaVT1RandCode_func = v_any_dev_active;
//} 
//
//BoolS PstFTDRLVT0MinOTP_func()
//{
//   BoolM final_results;
//
//   PstFTDRLVT0MinOTP_func = v_any_dev_active;
//} 
//
//BoolS FTDRLDeltaVT0OTP_func()
//{
//   BoolM final_results;
//
//   FTDRLDeltaVT0OTP_func = v_any_dev_active;
//} 
//
//BoolS PstFTDRLVT1MaxOTP_func()
//{
//   BoolM final_results;
//
//   PstFTDRLVT1MaxOTP_func = v_any_dev_active;
//} 
//
//BoolS FTDRLDeltaVT1OTP_func()
//{
//   BoolM final_results;
//
//   FTDRLDeltaVT1OTP_func = v_any_dev_active;
//} 
//
//
//BoolS SectErs_func()
//{
//   const IntS TARGET_SECT = 0x00000100; 
//   const IntS TESTID = 259; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS runena;
//
// /* KChau 10/21 -- bypass for now since no RPO test --   */
//   runena = false;
//
//   if(runena)  
//   {
//      PwrupAtVmin_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = SectErs_Test;
//#if $GL_USE_JTAG_RAMPMT or $GL_USE_DMLED_RAMPMT  
//   testnum = TNUM_BANK_ERS_NOPRECON;;
//#else
//   testnum = TNUM_BANK_ERS_NOPRECON+TARGET_SECT;
//#endif
//      F021_Erase_func(testnum,tname,final_results);
//   } 
//   
//   SectErs_func = v_any_dev_active;
//}   /* SectErs_func */
//   

TMResultM RdM1_func() {
   const IntS TESTID = 260; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS savebool;

   // KChau 10/21 -- bypass for now since no RPO test @MP1 --
   savebool = GL_DO_REDENA;
   GL_DO_REDENA = false;
   GL_FLTESTID = TESTID;
   tname = "RdM1_Test";

   if (SelectedTITestType != MP1)  {      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();

      if(GL_DO_FL_PBIST)  
         testnum = TNUM_PBIST_RDM1S;
      else {
         testnum = TNUM_BANK_RDM1S;
         if (GL_DO_RD_WITH_TOPTION==1)  
            testnum = testnum+TNUM_TOPTION_PSARD;
         if(GL_DO_REDENA)  
            testnum = testnum+TNUM_REDUNDENA;
      }

      final_results = F021_Read_func(testnum,tname);
   } 
   GL_DO_REDENA = savebool;
   
   return(final_results);
}   // RdM1_func
   
// /*post repaired*/
//BoolS PgmMain_2_func()
//{
//   const IntS TESTID = 261; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS runena;
//
//#if $FL_USE_AUTO_FLOW==false  
//   runena = false;;
//#else
//   if(TITestType==FT2)  
//      runena = true;
//   else
//      runena = false;
//#endif
//
//   if(v_any_dev_active and runena)  
//   {
//      PwrupAtVmin_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)  
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      testnum = TNUM_BANK_PROG_SM;
//      tname = PgmMain_2_Test;
//      
//      F021_Program_func(testnum,tname,final_results);
//   } 
//   
//   PgmMain_2_func = v_any_dev_active;
//}   /* PgmMain_2_func */
//   
//
//BoolS RdM0_2_func()
//{
//   const IntS TESTID = 262; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS savebool;
//   BoolS runena;
//
//#if $FL_USE_AUTO_FLOW==false  
//   runena = false;;
//#else
//   if(TITestType==FT2)  
//      runena = true;
//   else
//      runena = false;
//#endif
//
//   if(v_any_dev_active and runena)  
//   {
//      PwrupAtVmin_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      savebool = GL_DO_REDENA;
//      GL_DO_REDENA = false;
//      GL_FLTESTID = TESTID;
//      tname = RdM0_2_Test;
//      
//      if(GL_DO_FL_PBIST)  
//         testnum = TNUM_PBIST_RDM0s;
//      else
//      {
//         testnum = TNUM_BANK_RDM0s;
//         if(GL_DO_RD_WITH_TOPTION==1)  
//            testnum = testnum+TNUM_TOPTION_PSARD;
//      } 
//      
//      F021_Read_func(testnum,tname,final_results);
//      
//      GL_DO_REDENA = savebool;
//   } 
//   
//   RdM0_2_func = v_any_dev_active;
//}   /* RdM0_2_func */
//   
//
//BoolS SectErs_2_func()
//{
//   const IntS TARGET_SECT = 0x00000100; 
//   const IntS TESTID = 263; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//
//   PwrupAtVmin_1;
//
//   current_shell = "FlashShell";
//   if(GL_PREVIOUS_SHELL != current_shell)        
//      F021_LoadFlashShell_func;
//
//   GL_FLTESTID = TESTID;
//   tname = SectErs_2_Test;
//#if $FL_USE_AUTO_FLOW==false  
//   testnum = TNUM_BANK_ERS_NOPRECON;;
//#else
//   testnum = TNUM_BANK_ERS_NOPRECON+TARGET_SECT;
//#endif
//   F021_Erase_func(testnum,tname,final_results);
//
//   SectErs_2_func = v_any_dev_active;
//}   /* SectErs_2_func */
//   
//
//BoolS PreconRPO_func()
//{
//   BoolM final_results;
//
//   PreconRPO_func = v_any_dev_active;
//} 
//
//BoolS RPO_IRDrop_Vmin_func()
//{
//   BoolM final_results;
//
//   RPO_IRDrop_Vmin_func = v_any_dev_active;
//} 
//
//BoolS RPO_IRDrop_Vmax_func()
//{
//   BoolM final_results;
//
//   RPO_IRDrop_Vmax_func = v_any_dev_active;
//} 
//
//
//BoolS SectErs_3_func()
//{
//   const IntS TARGET_SECT = 0x00000100; 
//   const IntS TESTID = 267; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS runena;
//
//   runena = false;
//
//   if(runena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = SectErs_3_Test;
//#if $GL_USE_JTAG_RAMPMT or $GL_USE_DMLED_RAMPMT  
//   testnum = TNUM_BANK_ERS_PRECON;;
//#else
//   testnum = TNUM_BANK_ERS_PRECON+TARGET_SECT;
//#endif
//      F021_Erase_func(testnum,tname,final_results);
//   } 
//   
//   SectErs_3_func = v_any_dev_active;
//}   /* SectErs_3_func */
//   
//
//BoolS RdM1_2_func()
//{
//   const IntS TESTID = 268; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS savebool,runena;
//
//   if((TITestType==MP2) or (TITestType==FT2))  
//      runena = true;
//   else
//      runena = false;
//
//   if(runena)  
//   {
//      PwrupAtVmin_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      savebool = GL_DO_REDENA;
//      GL_DO_REDENA = false;
//      GL_FLTESTID = TESTID;
//      tname = RdM1_2_Test;
//      
//      if(GL_DO_FL_PBIST)  
//         testnum = TNUM_PBIST_RDM1s;
//      else
//      {
//         testnum = TNUM_BANK_RDM1s;
//         if(GL_DO_RD_WITH_TOPTION==1)  
//            testnum = testnum+TNUM_TOPTION_PSARD;
//      } 
//      
//      F021_Read_func(testnum,tname,final_results);
//      
//      GL_DO_REDENA = savebool;
//   } 
//
//   RdM1_2_func = v_any_dev_active;
//}   /* RdM1_2_func */
//

TMResultM RefreshOTP_func() {
   const IntS TESTID = 269; 

   TMResultM final_results;
   BoolS activesites;
   StringS current_shell;
   IntS testnum,site;
   StringS tname;
   BoolM savesites,disallsites;
   BoolS runena;

#if $FL_USE_AUTO_FLOW==false  
   runena = true;;
#else
   if (SelectedTITestType==MP3)  
      runena = false;
   else
      runena = true;
#endif

   if(runena) {
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      testnum = TNUM_OTP_REFRESH;
      tname = "RefreshOTP_Test";
   
      if (SelectedTITestType==MP2) {
//       savesites = v_dev_active;
//       disallsites = false;
//       ArrayAndboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
         
//       devsetholdstates(activesites);
         TL_RunTestNum(TNUM_OTP_ERS_NOPRECON,"");
//         final_results = F021_RestoreOTPInfo_func(tname,false);
//         if ((not TIIgnoreFail) or (not TI_FlashCOFEna)) {
         if ((not TI_FlashCOFEna)) {
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
               if(savesites[*si] and (not GL_FLASH_RETEST[*si]))  
                  final_results[*si] = TM_PASS;
//          devsetholdstates(final_results);
         }
         else
            ;
//          devsetholdstates(savesites);
      } 
      
      final_results = F021_Erase_func(testnum,tname);
   } 
   return(final_results);
   
}   // RefreshOTP_func
   
//
//BoolS Block_Cvfy_func()
//{
//   const IntS TARGET_SECT = 0x00000100; 
//   const IntS TARGET_BLOCK = 0x00000200; 
//   const IntS TESTID = 270; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmin_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      testnum = TNUM_BANK_CVFY+TARGET_BLOCK;  /*TARGET_SECT;*/
//      tname = Block_Cvfy_Test;
//      F021_Read_func(testnum,tname,final_results);
//   } 
//   
//   Block_Cvfy_func = v_any_dev_active;
//}   /* Block_Cvfy_func */
//   

TMResultM PgmChkboard_func() {
   const IntS TESTID = 271; 

   TMResultM final_results, tmp_results;
   FloatM ret_timer;
   StringS tname;
   IntS testnum;
   StringS current_shell;

   if ((SelectedTITestType==MP1) and GL_DO_CHARZ_FREQ_RANDCODE) {
      if (GL_CHARZ_FREQ_RANDCODE_COUNT == 1) {
         final_results = FlashCode_WR_EXE_func("PgmRCod_Test",Random);
//         FreqSchmoo_RandCode();
//         powerdownall();
         TIME.Wait(1ms);
//       PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
//       ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,v[vih_loose_osc_vnom],v[vil_loose]);
//       clockpinset(s_clk_1a,s_clock);
//       patternexecute(spareint1,f021_shell_loadpat);
         tmp_results = F021_RunTestNumber(TNUM_ALWAYS_PASS,1s,ret_timer);
         TL_RunTestNum(TNUM_BANK_ERS_NOPRECON,"");
      } 
      GL_CHARZ_FREQ_RANDCODE_COUNT = GL_CHARZ_FREQ_RANDCODE_COUNT + 1;
      if (GL_CHARZ_FREQ_RANDCODE_COUNT > GL_CHARZ_FREQ_RANDCODE_SAMPLING)  
         GL_CHARZ_FREQ_RANDCODE_COUNT = 1;
   }
   
// PwrupAtVnom_1;

   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   tname = "PgmChk_Test";

   switch (SelectedTITestType) {
     case MP1 : testnum = TNUM_BANK_PROG_ECHK_DISTURB; break; 
     case MP2 : testnum = TNUM_BANK_PROG_OCHK_DISTURB; break; 
     default:   testnum = TNUM_BANK_PROG_OCHK_DISTURB; break; 
   }   // case

   final_results = F021_Program_func(testnum,tname);
   return(final_results);

}   // PgmChkboard_func
   

TMResultM RdM0Chkboard_func() {
   const IntS TESTID = 272; 

   TMResultM final_results;
   StringS tname;
   IntS testnum;
   StringS current_shell;
   BoolS runena;

#if $FL_USE_AUTO_FLOW==false  
   if (SelectedTITestType==MP1)  
      runena = false;
   else
      runena = false;
#else
   if (SelectedTITestType==MP3)  
      runena = false;
   else
      runena = true;
#endif

   if (runena) {
//    PwrupAtVmin_1;
   
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "RdM0Chk_Test";
      
      switch (SelectedTITestType) {
        case MP1: testnum = TNUM_BANK_RDM0ECHK; break; 
        case MP2: testnum = TNUM_BANK_RDM0OCHK; break; 
        default:  testnum = TNUM_BANK_RDM0OCHK; break;
      }   // case
      if (GL_DO_RD_WITH_TOPTION == 1)  
         testnum = testnum+TNUM_TOPTION_PSARD;

      final_results = RdMChk_func(tname,testnum);
   }
   return(final_results);
   
}   // RdM0Chkboard_func
   

TMResultM RdM1Chkboard_func() {
   const IntS TESTID = 273; 

   TMResultM final_results;
   StringS tname;
   IntS testnum;
   StringS current_shell;
   BoolS runena;

#if $FL_USE_AUTO_FLOW==false  
   if (SelectedTITestType==MP1)  
      runena = false;
   else
      runena = false;
#else
   if (SelectedTITestType==MP3)  
      runena = false;
   else
      runena = true;
#endif

   if (runena) {
//    PwrupAtVmax_1;
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "RdM1Chk_Test";
      
      switch(SelectedTITestType) {
        case MP1: testnum = TNUM_BANK_RDM1ECHK; break; 
        case MP2: testnum = TNUM_BANK_RDM1OCHK; break; 
        default:  testnum = TNUM_BANK_RDM1OCHK; break;
      }   // case

      if (GL_DO_RD_WITH_TOPTION==1)  
         testnum = testnum+TNUM_TOPTION_PSARD;
      final_results = RdMChk_func(tname,testnum);
   } 
   return(final_results);

}   // RdM1Chkboard_func
   
TMResultM PgmChkboardOTP_func() {
   const IntS TESTID = 274; 

   TMResultM final_results;
   StringS tname;
   IntS testnum;
   StringS current_shell;
   BoolS runena;

#if $FL_USE_AUTO_FLOW==false  
   if (SelectedTITestType==MP1)  
      runena = true;
   else
      runena = false;
#else
   if (SelectedTITestType==MP3)  
      runena = false;
   else
      runena = true;
#endif

   if(runena)  {
//    PwrupAtVnom_1;
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tname = "PgmChkSemiOTP_Test";
      
      switch(SelectedTITestType) {
        case MP1:
        case MP3: testnum = TNUM_OTP_PROG_ECHK_DISTURB_SEMI; break; 
        case MP2: testnum = TNUM_OTP_PROG_OCHK_DISTURB_SEMI; break; 
      }   // case

      final_results = F021_Program_func(testnum,tname);
   }
   return(final_results);
   
// PgmChkboardOTP_func
}
   
TMResultM PreDRLVT0MinOTP_func() {
   const IntS TESTID = 277; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS sbool1,sbool2;
   BoolS runena;

#if $FL_USE_AUTO_FLOW==false  
   runena = false;;
#else
   if (TITestType==MP3)  
      runena = false;
   else
      runena = true;
#endif

   if (runena)  {
//      PwrupAtVmax_1;
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata = OTPTYPE;
      vtcat = CHKVT0;
      prepost = pre;
      
      // not using pbist on chkb until new shell release*/
      // sbool1 := GL_DO_VT_OTP_USING_PBIST;
      // sbool2 := GL_DO_BCC_OTP_USING_PBIST;
      // GL_DO_VT_OTP_USING_PBIST := false;
      // GL_DO_BCC_OTP_USING_PBIST := false;
      
      if (GL_DO_VT_FIRST) {
         tname = "PreDRLVT0MinOTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PreDRLBCC0MaxOTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else {
         tname = "PreDRLBCC0MaxOTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PreDRLVT0MinOTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 
      
      // GL_DO_VT_OTP_USING_PBIST := sbool1;
      // GL_DO_BCC_OTP_USING_PBIST := sbool2;

   }   // if runena
   return(final_results);
   
}   // PreDRLVT0MinOTP_func
   

TMResultM PreDRLVT1MaxOTP_func() {
   const IntS TESTID = 278; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS sbool1,sbool2;
   BoolS runena;

   runena = OtpBCC.ENA[CHKVT1][pre] or OtpVT.ENA[CHKVT1][pre];

   if (runena)  {
//    PwrupAtVmax_1;
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata = OTPTYPE;
      vtcat = CHKVT1;
      prepost = pre;
      
      // not using pbist on chkb until new shell release
      // sbool1 := GL_DO_VT_OTP_USING_PBIST;
      // sbool2 := GL_DO_BCC_OTP_USING_PBIST;
      // GL_DO_VT_OTP_USING_PBIST := false;
      // GL_DO_BCC_OTP_USING_PBIST := false;
      
      if (GL_DO_VT_FIRST) {
         tname = "PreDRLVT1MaxOTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
         tname = "PreDRLBCC1MinOTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
      }
      else
      {
         tname = "PreDRLBCC1MinOTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"");
         tname = "PreDRLVT1MaxOTP_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),not(IsBcc),"");
      } 

      // GL_DO_VT_OTP_USING_PBIST := sbool1;
      //GL_DO_BCC_OTP_USING_PBIST := sbool2;
   } 
   return(final_results);

}   // PreDRLVT1MaxOTP_func
   

TMResultM RdNormSCyc_Vmin_func() {
   const IntS TESTID = 279; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum,i;
   StringS tname;
   BoolS runena;

#if $FL_USE_AUTO_FLOW==false  
   if (SelectedTITestType==MP3)  
      runena = true;
   else
      runena = false;
#else
   if (TITestType==MP2)  
      runena = true;
   else
      runena = false;
#endif

// PwrupAtVmin_1;
   
   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   tname = "RdNSCyc_Vmin_Test";
   i = 0x04000000;  // max single-cycle freq

#if $FL_USE_AUTO_FLOW==false  
   testnum = TNUM_BANK_RDOCHK + i;
#else
   testnum = TNUM_BANK_RDOCHK + i;
#endif

   final_results = F021_Read_func(testnum,tname);
   return(final_results);

}   // RdNormSCyc_Vmin_func

TMResultM RdNormSCyc_Vmax_func() {
   const IntS TESTID = 280; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum,i;
   StringS tname;
   BoolS runena;

#if $FL_USE_AUTO_FLOW==false  
   if (SelectedTITestType==MP3)  
      runena = true;
   else
      runena = false;
#else
   if (TITestType==MP2)  
      runena = true;
   else
      runena = false;
#endif

// PwrupAtVmax_1;
   
   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   tname = "RdNSCyc_Vmax_Test";
   i = 0x04000000;  // max single-cycle freq

#if $FL_USE_AUTO_FLOW==false  
   testnum = TNUM_BANK_RDOCHK + i;;
#else
   testnum = TNUM_BANK_RDOCHK + i;
#endif

   final_results = F021_Read_func(testnum,tname);
   return(final_results);

}   // RdNormSCyc_Vmax_func

TMResultM RdPipe_Vmin_func() {
   const IntS TESTID = 281; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum,i;
   StringS tname;
   BoolS runena;

#if $FL_USE_AUTO_FLOW==false  
   if (SelectedTITestType==MP3)  
      runena = true;
   else
      runena = false;
#else
   if (TITestType==MP2)  
      runena = true;
   else
      runena = false;
#endif

// PwrupAtVmin_1;
   
   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   tname = "RdPipe_Vmin_Test";
   i = 0x08000000;  /*max cpu freq*/

#if $FL_USE_AUTO_FLOW==false  
   testnum = TNUM_BANK_RDOCHK + i;;
#else   
   testnum = TNUM_BANK_RDOCHK + i;
#endif
   
   final_results = F021_Read_func(testnum,tname);
   return(final_results);

}   // RdPipe_Vmin_func

TMResultM RdPipe_Vmax_func() {
   const IntS TESTID = 282; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum,i;
   StringS tname;
   BoolS runena;

#if $FL_USE_AUTO_FLOW==false  
   if (SelectedTITestType==MP3)  
      runena = true;
   else
      runena = false;
#else
   if (TITestType==MP2)  
      runena = true;
   else
      runena = false;
#endif

//   PwrupAtVmax_1;
   
   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   tname = "RdPipe_Vmax_Test";
   i = 0x08000000;  // max cpu freq

#if $FL_USE_AUTO_FLOW==false  
   testnum = TNUM_BANK_RDOCHK + i;;
#else   
   testnum = TNUM_BANK_RDOCHK + i;
#endif
   
   final_results = F021_Read_func(testnum,tname);
   return(final_results);
   
}   // RdPipe_Vmax_func

TMResultM RdNormSCyc_FreqSrch_func() {
   TMResultM final_results;

   return(final_results);
}   // RdNormSCyc_FreqSrch_func

//
//BoolS SectErs_4_func()
//{
//   const IntS TARGET_SECT = 0x00000100; 
//   const IntS TESTID = 284; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//
//   PwrupAtVmax_1;
//
//   current_shell = "FlashShell";
//   if(GL_PREVIOUS_SHELL != current_shell)        
//      F021_LoadFlashShell_func;
//
//   GL_FLTESTID = TESTID;
//   tname = SectErs_4_Test;
//#if $GL_USE_JTAG_RAMPMT or $GL_USE_DMLED_RAMPMT  
//   testnum = TNUM_BANK_ERS_PRECON;;
//#else
//   testnum = TNUM_BANK_ERS_PRECON+TARGET_SECT;
//#endif
//   F021_Erase_func(testnum,tname,final_results);
//
//   SectErs_4_func = v_any_dev_active;
//}   /* SectErs_4_func */
//   
//
//BoolS RdM1_3_func()
//{
//   const IntS TESTID = 285; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS savebool;
//
//   PwrupAtVmax_1;
//
//   current_shell = "FlashShell";
//   if(GL_PREVIOUS_SHELL != current_shell)        
//      F021_LoadFlashShell_func;
//
//   savebool = GL_DO_REDENA;
//   GL_DO_REDENA = false;
//   GL_FLTESTID = TESTID;
//   tname = RdM1_3_Test;
//
//   if(GL_DO_FL_PBIST)  
//      testnum = TNUM_BANK_RDM1s;
//   else
//   {
//      testnum = TNUM_BANK_RDM1s;
//      if(GL_DO_RD_WITH_TOPTION==1)  
//         testnum = testnum+TNUM_TOPTION_PSARD;
//      if(GL_DO_REDENA)  
//     testnum = testnum+TNUM_REDUNDENA;
//   } 
//   
//   F021_Read_func(testnum,tname,final_results);
//
//   GL_DO_REDENA = savebool;
//   RdM1_3_func = v_any_dev_active;
//}   /* RdM1_3_func */
//   

TMResultM Flash_ISleep_Pst_func() {
   TMResultM final_results;

   return(final_results);
}   //Flash_ISleep_Pst_func 

//BoolS Flash_IStdby_Pst_func()
//{
//   BoolM final_results;
//
//    /*added pwrdown*/
//   PowerDownAll;
//   Flash_IStdby_Pst_func = v_any_dev_active;
//} 


TMResultM TP1TP2_Leak_Pst_func()
{
   const IntS TESTID = 288; 

   TMResultM final_results = TM_PASS;
   TMResultM tmp_results;
   StringS current_shell;
   FloatS tdelay;
   IntS tcrnum,tnum;
   TPModeType tcrmode;
   VCornerType vcorner;
   FloatM deltaval;
   IntS i;
   StringS str1;
   Sites savesites, new_active_sites;

   bool any_device_active = true;
   savesites = ActiveSites;
   
   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   tcrnum  = 0;
   tcrmode = ReadMode;
   vcorner = VMX;
   tnum    = TNUM_ALWAYS_PASS;
   final_results = F021_Pump_Para_func(tnum,post,vcorner,tcrnum,tcrmode);

    /*calc delta*/
    // yes, this loop needs to start at 1 because the tpads do
   for (i = 1;i <= 2;i++)
   {
      if (any_device_active)
      {
         if(PUMP_BANK_PARA_ENABLE[tcrnum][tcrmode][i])  
         {
            deltaval = TPAD_LEAK_VALUE[tcrmode][pre][i] - TPAD_LEAK_VALUE[tcrmode][post][i];
            
            if(i==1)  
               str1 = "TP1_LKG_LO_DLT";
            else
               str1 = "TP2_LKG_LO_DLT";
            
            tmp_results = TIDlog.Value(deltaval, UTL_VOID, TP1TP2_DELTA_LLIM, TP1TP2_DELTA_ULIM, "A", str1, 
                                       UTL_VOID, UTL_VOID, true, TWMinimumData);

            final_results = DLOG.AccumulateResults(final_results, tmp_results);
          
            if(PUMP_BANK_PARA_BINOUT[tcrnum][tcrmode][i])  
            {
               if((not RunAllTests) and (not TI_FlashCOFEna))  
               {
                  new_active_sites = ActiveSites;
                  new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
                  any_device_active = SetActiveSites(new_active_sites);
               }
            } 
         }   /*if PUMP enable*/
      }
   }    /*for i*/

   if(any_device_active)  
   {
      tcrmode = ProgMode;
      tmp_results = F021_Pump_Para_func(tnum,post,vcorner,tcrnum,tcrmode);
      DLOG.AccumulateResults(final_results, tmp_results);
   } 

    /*calc delta*/
   for (i = 1;i <= 2;i++)
   {
      if(any_device_active)  
      {
         if(PUMP_BANK_PARA_ENABLE[tcrnum][tcrmode][i])  
         {
            deltaval = TPAD_LEAK_VALUE[tcrmode][pre][i]-TPAD_LEAK_VALUE[tcrmode][post][i];
            
            if(i==1)  
               str1 = "TP1_LKG_HI_DLT";
            else
               str1 = "TP2_LKG_HI_DLT";
            
            tmp_results = TIDlog.Value(deltaval, UTL_VOID, TP1TP2_DELTA_LLIM, TP1TP2_DELTA_ULIM, "A", str1, 
                                       UTL_VOID, UTL_VOID, true, TWMinimumData);

            final_results = DLOG.AccumulateResults(final_results, tmp_results);

            if(PUMP_BANK_PARA_BINOUT[tcrnum][tcrmode][i])  
            {
               if((not RunAllTests) and (not TI_FlashCOFEna))  
               {
                  new_active_sites = ActiveSites;
                  new_active_sites.DisableFailingSites(final_results.Equal(TM_PASS));
                  any_device_active = SetActiveSites(new_active_sites);
               }
            } 
         }   /*if PUMP enable*/
      }   
   } /*for i*/ 
      
   // cleanup
   RunTime.SetActiveSites(savesites);
   
   return (final_results);
}   /* TP1TP2_Leak_Pst_func */

//BoolS WrEngRow_func()
//{
//   const IntS TESTID = 300; 
//
//   BoolM final_results,rd_results;
//   BoolM savesites,tmp_results;
//   IntS site,rd_opt;
//
//
//   TI_FlashCOFEna = GL_SAVEFLCOFENA;
//
//   if(v_any_dev_active)  
//   {
//      final_results = v_dev_active;
//      savesites = v_dev_active;
//      
//      powerupatvnom(dcsetup_loosevnom,norm_fmsu);
//      clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vnom],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(2ms);      
//      F021_LoadFlashShell_func;
//      RAM_Clear_SoftTrim_All;
//      RAM_Clear_PMOS_SoftTrim;
//      RAM_Clear_MailBox_Key;
//      f021_runtestnumber(tnum_always_pass,1s,spare_mstreal1,spare_msbool1);
//      GL_FLTESTID = TESTID;
//      F021_OTP_WrEngRow_func(final_results);
//
//       /*added for fake repair*/
//      if((TITestType==MP1) and GL_DO_REPAIR and v_any_dev_active)  
//      {
//         GL_FAKEREP_COUNT = GL_FAKEREP_COUNT + 1;
//         if(GL_FAKEREP_COUNT > GL_FAKEREP_SAMPLING)  
//            GL_FAKEREP_COUNT = 1;
//      } 
//   } 
//
//    /*read back & log tw*/
//   if(v_any_dev_active)  
//   {
//      savesites = v_dev_active;
//      rd_results = v_dev_active;
//       /*PowerDown;*/
//      powerupatvnom(dcsetup_loosevnom,norm_fmsu);
//      clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vnom],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(2ms);
//      patternexecute(site,f021_shell_loadpat);
//      tmp_results = v_pf_status;
//      arrayandboolean(rd_results,rd_results,tmp_results,v_sites);
//      if(ti_flashdebug and tistdscreenprint)  
//         rd_opt = 0;
//      else
//         rd_opt = 1;
//      F021_ReadLog1OTP_func(tmp_results,rd_opt);
//      arrayandboolean(rd_results,rd_results,tmp_results,v_sites);
//      F021_ReadIDOTP_func(tmp_results,false);
//      arrayandboolean(rd_results,rd_results,tmp_results,v_sites);
//      devsetholdstates(savesites);
//      TestOpen(RdEngRow_Test);
//      ResultsRecordActive(rd_results, S_NULL);
//      TestClose;
//
//      if(tistdscreenprint and ti_flashdebug)  
//      {
//         if(GL_DO_DRL0_USING_VT and (not GL_DO_DRL1_USING_VT))  
//            F021_ReadVT0BCC1OTP_func(spare_msbool1,false)
//             /*discard(F021_ReadVTOTP_func(spare_msbool1,false))*/
//         else
//            F021_ReadBCCOTP_func(spare_msbool1,false);
//
//         F021_ReadLog3OTP_func(spare_msbool1,0);
//         TL_Display_Word8_9;
//      } 
//         
//      tmp_results = v_dev_active;
//      GetShellInfo_func;
//      arrayandboolean(tmp_results,tmp_results,v_dev_active,v_sites);
//      devsetholdstates(savesites);
//      F021_Log_OTP_To_TW_Final;
//      arrayandboolean(rd_results,rd_results,tmp_results,v_sites);
//      arrayandboolean(rd_results,rd_results,savesites,v_sites);
//      devsetholdstates(rd_results);
//   } 
//   
//   clockstopfreerun(s_clock1a);
//
//   WrEngRow_func = v_any_dev_active;
//}   /* WrEngRow_func */
//
//
//BoolS DRL_Flowbyte_WR_func()
//{
//   const IntS WR_FLWB_MP2_DRL = 1; 
//   const IntS WR_FLWB_MP3_DRL = 3; 
//   const IntS WR_FLWB_PREBI_DRL = 5; 
//   const IntS TESTID = 70; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS wr_option,site;
//   StringS tname;
//   BoolM savesites,activesites;
//   BoolM disallsites;
//
//   if(v_any_dev_active)  
//   {
//       /*added to disable site failed drl due to addition of webs BTS_F021_VLCTSTD.4*/
//      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//         if(v_dev_active[site])  
//            if((not GL_VT0DRL_RESULT[site]) or (not GL_VT1DRL_RESULT[site]) or
//               (not GL_BCC0DRL_RESULT[site]) or (not GL_BCC1DRL_RESULT[site]))  
//            {
//               Devsetholdstate(site,false);
//               if(tistdscreenprint)  
//                  cout << "Site" << site:-5 << " Failed previous DRL test so DISABLE!!" << endl;
//            } 
//      
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      savesites = v_dev_active;
//      disallsites = false;
//      
//      ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//      ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//      if(not Arraycompareboolean(activesites,disallsites,v_sites))  
//      {
//         devsetholdstates(activesites);
//         tname = OTP_WrDRLFLWB_Test;
//         GL_FLTESTID = TESTID;
//         
//         switch(TITestType) {
//           case wr_option = WR_FLWB_MP2_DRL  :  MP2 ;
//           case wr_option = WR_FLWB_MP3_DRL  :  MP3 ;
//           case wr_option = WR_FLWB_PREBI_DRL  :  PreBurnIn ;
//         } 
//   
//         F021_Write_OTP_MBox_func(tname,wr_option,final_results);         
//         Update_FLWBYTE_Var;
//         
//         ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//         ArrayAndboolean(activesites,activesites,savesites,v_sites);
//         devsetholdstates(activesites);
//      }
//      else
//      {
//         if(tistdscreenprint)  
//            cout << "All sites are retested -- Bypass DRL_Flowbyte_WR_func" << endl;
//      } 
//   } 
//
//   if(TITestType==MP3)  
//      GL_DO_RESTORE_OTP_ON_FAIL = true;
//   
//   DRL_Flowbyte_WR_func = v_any_dev_active;
//}   /* DRL_Flowbyte_WR_func */
//   
//
//BoolS DRL_Flowbyte_WR2_func()
//{
//   const IntS WR_FLWB_MP2_DRL = 1; 
//   const IntS WR_FLWB_MP3_DRL = 3; 
//   const IntS WR_FLWB_PREBI_DRL = 5; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS wr_option;
//   StringS tname;
//   BoolM savesites,activesites;
//   BoolM disallsites;
//
// /*   
//    if(v_any_dev_active) then
//    begin
//       PwrupAtVnom_1;
//       
//       current_shell := "FlashShell";
//       if(GL_PREVIOUS_SHELL <> current_shell) then      
//          discard(F021_LoadFlashShell_func);
// 
//       Arraycopyboolean(savesites,v_dev_active,v_sites);
//       Arraysetboolean(disallsites,false);
//       
//       ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//       ArrayAndboolean(activesites,activesites,savesites,v_sites);
// 
//       if(not Arraycompareboolean(activesites,disallsites,v_sites)) then
//       begin
//          devsetholdstates(activesites);
//          tname := OTP_WrDRLFLWB_Test;
//          
//          case TITestType of
//            MP2       : wr_option := WR_FLWB_MP2_DRL;
//            MP3       : wr_option := WR_FLWB_MP3_DRL;
//            PreBurnIn : wr_option := WR_FLWB_PREBI_DRL;
//          end;
//    
//          discard(F021_Write_OTP_MBox_func(tname,wr_option,final_results));         
//          Update_FLWBYTE_Var;
//          
//          ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//          ArrayAndboolean(activesites,activesites,savesites,v_sites);
//          devsetholdstates(activesites);
//       end
//       else
//       begin
//          if(tistdscreenprint) then
//             writeln(tiwindow,"All sites are retested -- Bypass DRL_Flowbyte_WR_func");
//       end;
//    end;
// */
//   DRL_Flowbyte_WR2_func = v_any_dev_active;
//}   /* DRL_Flowbyte_WR2_func */
//   
//
// /*++++++++++*/
//
//BoolS PgmOTP_func()
//{
//   const IntS TESTID = 44; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//
//   PwrupAtVnom_1;
//
//   current_shell = "FlashShell";
//   if(GL_PREVIOUS_SHELL != current_shell)        
//      F021_LoadFlashShell_func;
//
//   GL_FLTESTID = TESTID;
//   testnum = TNUM_OTP_PRECON;
//   tname = PgmOTP_PsTrim_Test;
//   F021_Program_func(testnum,tname,final_results);
//
//   PgmOTP_func = v_any_dev_active;
//}   /* PgmOTP_func */
//
//BoolS PgmOTP_PreEGFG_LF1_func()
//{
//   const IntS TESTID = 89; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum,tid;
//   StringS tname;
//
//   PwrupAtVnom_1;
//
//   current_shell = "FlashShell";
//   if(GL_PREVIOUS_SHELL != current_shell)        
//      F021_LoadFlashShell_func;
//   GL_FLTESTID = TESTID;
//   testnum = TNUM_OTP_PRECON;
//   tname = PgmOTP_PreEGFG1_Test;
//   F021_Program_func(testnum,tname,final_results);
//
//   PgmOTP_PreEGFG_LF1_func = v_any_dev_active;
//}   /* PgmOTP_PreEGFG_LF1_func */
//
//BoolS PgmOTP_PreEGFG_LF2_func()
//{
//   const IntS TESTID = 102; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//
//   PwrupAtVnom_1;
//
//   current_shell = "FlashShell";
//   if(GL_PREVIOUS_SHELL != current_shell)        
//      F021_LoadFlashShell_func;
//   GL_FLTESTID = TESTID;
//   testnum = TNUM_OTP_PRECON;
//   tname = PgmOTP_PreEGFG2_Test;
//   F021_Program_func(testnum,tname,final_results);
//
//   PgmOTP_PreEGFG_LF2_func = v_any_dev_active;
//}   /* PgmOTP_PreEGFG_LF2_func */
//
TMResultM PgmOTP_PreEGFG_LF3_func()
{
   const IntS TESTID = 115; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if((OtpBCC.ENA[EGFG3VT0][pre] and (OtpBCC.PREVTYPE[EGFG3VT0]==EGFG3VT0)) or
      (OtpVT.ENA[EGFG3VT0][pre] and (OtpVT.PREVTYPE[EGFG3VT0]==EGFG3VT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      GL_FLTESTID = TESTID;
      testnum = TNUM_OTP_PRECON;
      tname = "PgmOTP_PreEGFG3_Test";
      final_results = F021_Program_func(testnum,tname);
   } 
   
//   PgmOTP_PreEGFG_LF3_func = v_any_dev_active;
   return(final_results);
}   /* PgmOTP_PreEGFG_LF3_func */
//
TMResultM PgmOTP_PreEGFG_LF4_func()
{
   const IntS TESTID = 126; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if((OtpBCC.ENA[EGFG4VT0][pre] and (OtpBCC.PREVTYPE[EGFG4VT0]==EGFG4VT0)) or
      (OtpVT.ENA[EGFG4VT0][pre] and (OtpVT.PREVTYPE[EGFG4VT0]==EGFG4VT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      GL_FLTESTID = TESTID;
      testnum = TNUM_OTP_PRECON;
      tname = "PgmOTP_PreEGFG4_Test";
      final_results=F021_Program_func(testnum,tname);
   } 
   
//   PgmOTP_PreEGFG_LF4_func = v_any_dev_active;
   return(final_results);
}   /* PgmOTP_PreEGFG_LF4_func */
//
//BoolS PgmOTP_PreEGFG_LF5_func()
//{
//   const IntS TESTID = 137; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//
//   PwrupAtVnom_1;
//
//   current_shell = "FlashShell";
//   if(GL_PREVIOUS_SHELL != current_shell)        
//      F021_LoadFlashShell_func;
//   GL_FLTESTID = TESTID;
//   testnum = TNUM_OTP_PRECON;
//   tname = PgmOTP_PreEGFG5_Test;
//   F021_Program_func(testnum,tname,final_results);
//
//   PgmOTP_PreEGFG_LF5_func = v_any_dev_active;
//}   /* PgmOTP_PreEGFG_LF5_func */
//
TMResultM PgmOTP_PreCSFG_func()
{
   const IntS TESTID = 215; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";
   
   if((OtpBCC.ENA[CSFGVT0][pre] and (OtpBCC.PREVTYPE[CSFGVT0]==CSFGVT0)) or
      (OtpVT.ENA[CSFGVT0][pre] and (OtpVT.PREVTYPE[CSFGVT0]==CSFGVT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1; //not yet implemented
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      GL_FLTESTID = TESTID;
      if (SelectedTITestType == MP1)   
         testnum = TNUM_OTP_PROG  ; /*TNUM_OTP_PRECON} {C06 CHANGED: based on Audit */
      else
           testnum = "TNUM_OTP_PRECON";
      tname = "PgmOTP_PreCSFG_Test";
      final_results=F021_Program_func(testnum,tname);
   } 
   
//   PgmOTP_PreCSFG_func = v_any_dev_active;
   return(final_results);
}   /* PgmOTP_PreCSFG_func */
//
//BoolS PgmOTP_PreRdDisturb_func()
//{
//   const IntS TESTID = 226; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   if((OtpBCC.ENA[RDDISTBVT0][pre] and (OtpBCC.PREVTYPE[RDDISTBVT0]==RDDISTBVT0)) or
//      (OtpVT.ENA[RDDISTBVT0][pre] and (OtpVT.PREVTYPE[RDDISTBVT0]==RDDISTBVT0)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      GL_FLTESTID = TESTID;
//
//       if (TITestType == MP1)  
//           testnum = TNUM_OTP_PROG ; /*C06 CHANGED to match spec Jamal Sheikh modified Fri, Feb  3 2012 */
//       else
//           testnum = TNUM_OTP_PRECON;
//           
//       tname = PgmOTP_PreRdDistb_Test;
//      F021_Program_func(testnum,tname,final_results);
//   } 
//   
//   PgmOTP_PreRdDisturb_func = v_any_dev_active;
//}   /* PgmOTP_PreRdDisturb_func */
//
TMResultM PgmOTP_PreRdDisturb2_func()
{
   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if((OtpBCC.ENA[RDDISTB2VT0][pre] and (OtpBCC.PREVTYPE[RDDISTB2VT0]==RDDISTB2VT0)) or
      (OtpVT.ENA[RDDISTB2VT0][pre] and (OtpVT.PREVTYPE[RDDISTB2VT0]==RDDISTB2VT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();

       if (SelectedTITestType == MP1)  
           testnum = TNUM_OTP_PROG ; /*C06 CHANGED to match spec Jamal Sheikh modified Fri, Feb  3 2012 */
       else
           testnum = TNUM_OTP_PRECON;
           
      tname = "PgmOTP_PreRdDistb2_Test";
      final_results=F021_Program_func(testnum,tname);
   } 
   
//   PgmOTP_PreRdDisturb2_func = v_any_dev_active;
   return(final_results);
}   /* PgmOTP_PreRdDisturb2_func */

TMResultM ErsOTP_PrePgmFF_func() {
   const IntS TESTID = 155; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;

   if ((OtpBCC.ENA[PGMFFVT1][pre] and (OtpBCC.PREVTYPE[PGMFFVT1]==PGMFFVT1)) or
      (OtpVT.ENA[PGMFFVT1][pre] and (OtpVT.PREVTYPE[PGMFFVT1]==PGMFFVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      testnum = TNUM_OTP_ERS_NOPRECON;
      tname = "ErsOTP_PrePgmFF_Test";
      final_results = F021_Erase_func(testnum,tname);
   } 
   return(final_results);

}   // ErsOTP_PrePgmFF_func
   
//BoolS ErsOTP_PreRevTun_func()
//{
//   const IntS TESTID = 164; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   if((OtpBCC.ENA[REVTUNVT1][pre] and (OtpBCC.PREVTYPE[REVTUNVT1]==REVTUNVT1)) or
//      (OtpVT.ENA[REVTUNVT1][pre] and (OtpVT.PREVTYPE[REVTUNVT1]==REVTUNVT1)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)  
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      testnum = TNUM_OTP_ERS_NOPRECON;
//      tname = ErsOTP_PreRevTun_Test;
//      F021_Erase_func(testnum,tname,final_results);
//   } 
//   
//   ErsOTP_PreRevTun_func = v_any_dev_active;
//}   /* ErsOTP_PreRevTun_func */
//   
TMResultM ErsOTP_PrePunchThru_func()
{
   const IntS TESTID = 173; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;

   if((OtpBCC.ENA[PUNTHRUVT1][pre] and (OtpBCC.PREVTYPE[PUNTHRUVT1]==PUNTHRUVT1)) or
      (OtpVT.ENA[PUNTHRUVT1][pre] and (OtpVT.PREVTYPE[PUNTHRUVT1]==PUNTHRUVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1; //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      testnum = TNUM_OTP_ERS_NOPRECON;  /*was precon*/
      tname = "ErsOTP_PrePunThru_Test";
      final_results = F021_Erase_func(testnum,tname);
   } 
   
//   ErsOTP_PrePunchThru_func = v_any_dev_active;
   return (final_results);
}   /* ErsOTP_PrePunchThru_func */
  
TMResultM ErsOTP_PreTunOxide_func() {
   const IntS TESTID = 182; 

   TMResultM final_results = TM_NOTEST;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;

   if ((OtpBCC.ENA[TUNOXVT1][pre] and (OtpBCC.PREVTYPE[TUNOXVT1]==TUNOXVT1)) or
      (OtpVT.ENA[TUNOXVT1][pre] and (OtpVT.PREVTYPE[TUNOXVT1]==TUNOXVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if (do_ena) {  
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      testnum = TNUM_OTP_ERS_NOPRECON;
      tname = "ErsOTP_PreTunOx_Test";
      final_results = F021_Erase_func(testnum,tname);
   }    
    return(final_results);
}   /* ErsOTP_PreTunOxide_func */
   
TMResultM ErsOTP_PreThinOxide_func()
{
   const IntS TESTID = 191; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;

   if((OtpBCC.ENA[THINOXVT1][pre] and (OtpBCC.PREVTYPE[THINOXVT1]==THINOXVT1)) or
      (OtpVT.ENA[THINOXVT1][pre] and (OtpVT.PREVTYPE[THINOXVT1]==THINOXVT1)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
 //     PwrupAtVnom_1(); //not yet implemented
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)  
         F021_LoadFlashShell_func();
      
      testnum = TNUM_OTP_ERS_NOPRECON;
      tname = "ErsOTP_PreThinOx_Test";
      final_results = F021_Erase_func(testnum,tname);
   } 
 
//   ErsOTP_PreThinOxide_func = v_any_dev_active;
   return(final_results);
}   /* ErsOTP_PreThinOxide_func */
   

TMResultM IPMOS_TCode_Upload_func()
{
   F021_LoadFlashShell_func();
   if(GL_DO_IREF_PMOS_TRIM)  
   {
      GetTrimCode_On_EFStr();
      RAM_Upload_PMOS_TrimCode();
   } 

// I can't tell if there is a real test here

   return (TM_PASS);
   
}   /* IPMOS_TCode_Upload_func */
//   
//BoolS IPMOS_TCode_Upload2_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//
//   powerupatvnom(dcsetup_loosevnom,norm_fmsu);
//   clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//            v[vih_loose_osc_vnom],v[vil_loose]);
//   clockpinset(s_clk_1a,s_clock);
//   TIME.Wait(2ms);      
//   F021_LoadFlashShell_func;
//   if(GL_DO_IREF_PMOS_TRIM)  
//   {
//      GetTrimCode_On_EFStr;
//      RAM_Upload_PMOS_TrimCode;
//   } 
//
//   RAM_Upload_VHV_CT_TrimVal;
//
//   final_results = v_dev_active;
//   tname = IPMOS_TCode_Upload2_Test;
//   TestOpen(tname);
//   ResultsRecordActive(final_results, S_NULL);
//   TestClose;
//   
//   IPMOS_TCode_Upload2_func = v_any_dev_active;
//}   /* IPMOS_TCode_Upload2_func */
//   
//BoolS RdChkSumOTP_func()
//{
//   const IntS TESTID = 59; 
//
//   BoolM final_results;
//   StringS tname;
//   IntS testnum,site;
//   BoolM savesites,activesites;
//   BoolM disallsites;
//   StringS current_shell;
//
//   if(v_any_dev_active)  
//   {
//      Update_FLASH_RETEST_Var;
//
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      savesites = v_dev_active;
//      disallsites = false;
//      
//      ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//      ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//      if(not Arraycompareboolean(activesites,disallsites,v_sites))  
//      {
//         devsetholdstates(activesites);
//
//         GL_FLTESTID = TESTID;
//         testnum = TNUM_OTP_CHKSUM;
//         tname = RdChkSumOTP_Test;
//         F021_Read_func(testnum,tname,final_results);
//
//         ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//         ArrayAndboolean(activesites,activesites,savesites,v_sites);
//
//         devsetholdstates(activesites);
//      }
//      else
//      {
//         if(tistdscreenprint)  
//            cout << "All sites are retested -- Bypass RdChkSumOTP_func" << endl;
//      } 
//   } 
//
//   RdChkSumOTP_func = v_any_dev_active;
//}   /* RdChkSumOTP_func */
//   
//
//
//
// /*++++++++++*/
//
//void Charz_Vrd_Force_VBG()
//{
//   IntS site,count;
//   IntS tcrnum,testnum;
//   TPModeType tcrmode;
//   PinM testpad;
//   FloatS vstart,vstop,vresol;
//   FloatS voffset,vforce;
//   FloatS ild_tp1,ild_tp2;
//   FloatS maxtime,tdelay,ttimer1;
//   FloatS llim,ulim;
//   FloatM meas_value,tt_timer;
//   BoolM tmp_results;
//   StringS labstr,twlabstr;
//   StringS str1,str2,unitstr;
//   FloatS force_FloatSval;
//   IntS unitlen,force_intval;
//   FloatM FloatSval;
//   TWunit unitval;
//
//   if(v_any_dev_active)  
//   {
//      maxtime = 2s;
//      tdelay  = 50ms;
//      
//      vstart  = 1.1V; 
//      vstop   = 1.3V; 
//      vresol  = 3mV;
//      voffset = 1V;
//
//      ild_tp1 = 10nA;
//      ild_tp2 = 10nA;
//
//      tcrnum  = 128;
//      tcrmode = ReadMode;
//      testnum = TNUM_MAINBG_FORCE_MEASVRD0;
//      testpad = FLTP1;
//      
//      TCR.TP1_Ena[tcrnum] = true;
//      TCR.TP1_MeasType[tcrnum] = MeasVoltType;
//      TCR.TP1_VRange[tcrnum][tcrmode] = Vread_ULim+voffset;
//      TCR.TP1_IRange[tcrnum][tcrmode] = ild_tp1;
//      TCR.TP1_ULim[tcrnum][tcrmode]   = Vread_ULim+voffset;
//      TCR.TP1_LLim[tcrnum][tcrmode]   = Vread_LLim-voffset;
//      
//      TCR.TP2_Ena[tcrnum] = true;
//      TCR.TP2_MeasType[tcrnum] = ForceVoltType;
//      TCR.TP2_IRange[tcrnum][tcrmode] = ild_tp2;
//      
//      TCR.TP3_Ena[tcrnum] = false;
//      TCR.TP4_Ena[tcrnum] = false;
//      TCR.TP5_Ena[tcrnum] = false;
//      TCR.TADC_Ena[tcrnum] = false;
//
//      ulim = TCR.TP1_ULim[tcrnum][tcrmode];
//      llim = TCR.TP1_LLim[tcrnum][tcrmode];
//
//      timernstart(ttimer1);
//      
//      for (count = 2;count <= 2;count++) /*1 to 3 do*/
//      {
//         if(count==1)  
//         {
//            PowerupatVmin(dcsetup_loosevmin,norm_fmsu);
//            clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//                     v[vih_loose_osc_vmin],v[vil_loose]);
//            labstr = "VRD_MN_FORCEBG_";
//         }
//         else if(count==2)  
//         {
//            PowerupatVnom(dcsetup_loosevnom,norm_fmsu);
//            clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//                     v[vih_loose_osc_vnom],v[vil_loose]);
//            labstr = "VRD_NM_FORCEBG_";
//         }
//         else
//         {
//            PowerupatVmax(dcsetup_loosevmax,norm_fmsu);
//            clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//                     v[vih_loose_osc_vmax],v[vil_loose]);
//            labstr = "VRD_MX_FORCEBG_";
//         } 
//            
//         clockpinset(s_clk_1a,s_clock);
//         TIME.Wait(2ms);
//      
//         if(patternexecute(site,f021_shell_loadpat))  
//         {
//            PrintHeaderParam(GL_PLELL_FORMAT);
//            
//            for vforce = vstart to vstop by vresol do
//            {
//               TCR.TP2_VRange[tcrnum][tcrmode] = vforce;
//               
//               F021_Set_TPADS(tcrnum,tcrmode);
//               F021_RunTestNumber_PMEX(testnum,maxtime,tmp_results);
//               TIME.Wait(tdelay);
//               discard(F021_Meas_TPAD_PMEX(testpad,tcrnum,tcrmode,
//                       llim,ulim,meas_value,tmp_results));
//               Disable(s_pmexit);
//
//               GetTreal_Unit_Info(vforce,force_realval,unitlen,unitstr);
//               force_intval = trunc(force_realval*1000);
//               writestring(str1,force_intval:1);
//               twlabstr = labstr + str1;
// /*
//                TWTRealToRealMS(meas_value,realval,unitval);
//                TWPDLDatalogRealVariableMS(twlabstr,unitval,realval,TWMinimumData);
//                */
//               PrintResultParam(twlabstr,testnum,tmp_results,llim,ulim,meas_value,GL_PLELL_FORMAT);
//            }   /*for vforce*/
//         }   /*if patternexec*/
//      }   /*for count*/
//
//      f021_runtestnumber(tnum_always_pass,1s,spare_mstreal1,tmp_results);
//      F021_UnSet_TPADS(97);
//      ttimer1 = timernread(ttimer1);
//      tt_timer = ttimer1;
//      str2 = "Charz_Vrd_Frc_BG_TT";
// /*      TWTRealToRealMS(tt_timer,realval,unitval);
//       TWPDLDatalogRealVariableMS(str2, unitval,realval,TWMinimumData);
// */
//      if(tistdscreenprint)  
//         cout << str2 << " " << ttimer1 << endl;
//      
//   }   /*if v_any_dev_active*/
//}   /* Charz_Vrd_Force_VBG */
//
//void Charz_EG_Leak()
//{
//   IntS site,count,bank;
//   IntS tcrnum,testnum,start_testnum;
//   TPModeType tcrmode;
//   PinM testpad;
//   FloatS vstart,vstop,vresol;
//   FloatS voffset,vforce,ioffset;
//   FloatS ild_tp1,ild_tp2;
//   FloatS maxtime,tdelay,ttimer1;
//   FloatS llim,ulim;
//   FloatM meas_value,tt_timer;
//   BoolM tmp_results;
//   StringS labstr,twlabstr;
//   StringS str1,str2,unitstr;
//   FloatS force_FloatSval;
//   IntS unitlen,force_intval;
//   FloatM FloatSval;
//   TWunit unitval;
//
//   if(v_any_dev_active)  
//   {
//      maxtime = 2s;
//      tdelay  = 100ms;
//      
//      vstart  = 1.5V; 
//      vstop   = 13.3V; 
//      vresol  = 100mV;
//      ioffset = 10uA;
//
//      ild_tp1 = 10nA;
//      ild_tp2 = 10nA;
//
//      tcrnum  = 128;   /*actual tcrnum=23, ersmode*/
//      tcrmode = ReadMode;
//      start_testnum = TNUM_BANK_EGS;
//      testpad = FLTP1;
//
//      TCR.TP1_Ena[tcrnum] = true;
//      TCR.TP1_MeasType[tcrnum] = MeasCurrType;
//      TCR.TP1_VRange[tcrnum][Tcrmode ] = EGS_VEG_LEAK_Ers;
//      TCR.TP1_IRange[tcrnum][Tcrmode ] = EGS_VEG_LEAK_Ers_ULim+ioffset;
//      TCR.TP1_ULim[tcrnum][Tcrmode ]   = EGS_VEG_LEAK_Ers_ULim+ioffset;
//      TCR.TP1_LLim[tcrnum][Tcrmode ]   = EGS_VEG_LEAK_Ers_LLim-ioffset;
//      TCR.TP1_FTime[tcrnum][Tcrmode ]  = EGS_VEG_LEAK_TStress_Ers;
//      TCR.TP1_VCharLo[tcrnum][Tcrmode ]= VHV_Ers_Target;  /*use for ramping*/
//      TCR.TP1_VCharHi[tcrnum][Tcrmode ]= EGS_VEG_LEAK_Ers;  /*use for ramping*/
//
//      TCR.TP2_Ena[tcrnum] = false;
//      TCR.TP3_Ena[tcrnum] = false;
//      TCR.TP4_Ena[tcrnum] = false;
//      TCR.TP5_Ena[tcrnum] = false;
//      TCR.TADC_Ena[tcrnum] = false;
//      
//
//      ulim = TCR.TP1_ULim[tcrnum][tcrmode];
//      llim = TCR.TP1_LLim[tcrnum][tcrmode];
//
//      timernstart(ttimer1);
//
//      for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//      {
//         testnum  = start_testnum+(bank<<4);
//         
//         for (count = 1;count <= 3;count++)
//         {
//            if(count==1)  
//            {
//               PowerupatVmin(dcsetup_loosevmin,norm_fmsu);
//               clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//                        v[vih_loose_osc_vmin],v[vil_loose]);
//               labstr = "EG_LEAK_MN_";
//            }
//            else if(count==2)  
//            {
//               PowerupatVnom(dcsetup_loosevnom,norm_fmsu);
//               clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//                        v[vih_loose_osc_vnom],v[vil_loose]);
//               labstr = "EG_LEAK_NM_";
//            }
//            else
//            {
//               PowerupatVmax(dcsetup_loosevmax,norm_fmsu);
//               clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//                        v[vih_loose_osc_vmax],v[vil_loose]);
//               labstr = "EG_LEAK_MX_";
//            } 
//            
//            clockpinset(s_clk_1a,s_clock);
//            TIME.Wait(2ms);
//            
//            if(patternexecute(site,f021_shell_loadpat))  
//            {
//               PrintHeaderParam(GL_PLELL_FORMAT);
//               
//               for vforce = vstart to vstop by vresol do
//               {
//                  TCR.TP1_VRange[tcrnum][tcrmode] = vforce;
//                  
//                  F021_Set_TPADS(tcrnum,tcrmode);
//                  F021_RunTestNumber_PMEX(testnum,maxtime,tmp_results);
//                  TIME.Wait(tdelay);
//                  discard(F021_Meas_TPAD_PMEX(testpad,tcrnum,tcrmode,
//                          llim,ulim,meas_value,tmp_results));
//                  Disable(s_pmexit);
//                  
//                  GetTreal_Unit_Info(vforce,force_realval,unitlen,unitstr);
//                  force_intval = trunc(force_realval*1000);
//                  writestring(str1,force_intval:1);
//                  twlabstr = labstr + str1;
//                  twlabstr = twlabstr + "_B";
//                  writestring(str1,bank:1);
//                  twlabstr = twlabstr + str1;
//                  
//                  TWTRealToRealMS(meas_value,realval,unitval);
//                  TWPDLDataLogRealVariable(twlabstr,unitval,realval,TWMinimumData);
//                  
//                  PrintResultParam(twlabstr,testnum,tmp_results,llim,ulim,meas_value,GL_PLELL_FORMAT);
//               }   /*for vforce*/
//            }   /*if patternexec*/
//         }   /*for count*/
//      }   /*for bank*/
//      
//      f021_runtestnumber(tnum_always_pass,1s,spare_mstreal1,tmp_results);
//      F021_UnSet_TPADS(tcrnum);
//      ttimer1 = timernread(ttimer1);
//      tt_timer = ttimer1;
//      str2 = "Charz_EG_Leak_TT";
//      TWTRealToRealMS(tt_timer,realval,unitval);
//      TWPDLDataLogRealVariable(str2, unitval,realval,TWMinimumData);
//
//      if(tistdscreenprint)  
//         cout << str2 << " " << ttimer1 << endl;
//      
//   }   /*if v_any_dev_active*/
//}   /* Charz_EG_Leak */
//
//void Charz_CG_Leak_All()
//{
//   IntS site,count,bank;
//   IntS tcrnum,testnum,start_testnum;
//   TPModeType tcrmode;
//   PinM testpad;
//   FloatS vstart,vstop,vresol;
//   FloatS voffset,vforce,ioffset;
//   FloatS ild_tp1,ild_tp2;
//   FloatS maxtime,tdelay,ttimer1;
//   FloatS llim,ulim;
//   FloatM meas_value,tt_timer;
//   BoolM tmp_results;
//   StringS labstr,twlabstr;
//   StringS str1,str2,unitstr;
//   FloatS force_FloatSval;
//   IntS unitlen,force_intval;
//   FloatM FloatSval;
//   TWunit unitval;
//
//   if(v_any_dev_active)  
//   {
//      maxtime = 2s;
//      tdelay  = 100ms;
//      
//      vstart  = 1.5V; 
//      vstop   = 11.5V; 
//      vresol  = 100mV;
//      ioffset = 10uA;
//
//      ild_tp1 = 10nA;
//      ild_tp2 = 10nA;
//
//      tcrnum  = 128;   /*actual tcrnum=7, progmode*/
//      tcrmode = ReadMode;
//      start_testnum = TNUM_BANK_CGS;
//      testpad = FLTP1;
//
//      TCR.TP1_Ena[tcrnum] = true;
//      TCR.TP1_MeasType[tcrnum] = MeasCurrType;
//      TCR.TP1_VRange[tcrnum][Tcrmode] = CGS_VCG_LEAK_Prog;
//      TCR.TP1_IRange[tcrnum][Tcrmode] = CGS_VCG_LEAK_Prog_ULim+ioffset;
//      TCR.TP1_ULim[tcrnum][Tcrmode]   = CGS_VCG_LEAK_Prog_ULim+ioffset;
//      TCR.TP1_LLim[tcrnum][Tcrmode]   = CGS_VCG_LEAK_Prog_LLim-ioffset;
//      TCR.TP1_FTime[tcrnum][Tcrmode]  = CGS_VCG_LEAK_TStress_Prog;
//      TCR.TP1_VCharLo[tcrnum][Tcrmode]= VHV_Prog_Target;  /*use for ramping*/
//      TCR.TP1_VCharHi[tcrnum][Tcrmode]= CGS_VCG_LEAK_Prog;  /*use for ramping*/
//
//      TCR.TP2_Ena[tcrnum] = false;
//      TCR.TP3_Ena[tcrnum] = false;
//      TCR.TP4_Ena[tcrnum] = false;
//      TCR.TP5_Ena[tcrnum] = false;
//      TCR.TADC_Ena[tcrnum] = false;
//      
//
//      ulim = TCR.TP1_ULim[tcrnum][tcrmode];
//      llim = TCR.TP1_LLim[tcrnum][tcrmode];
//
//      timernstart(ttimer1);
//
//      for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//      {
//         testnum  = start_testnum+(bank<<4);
//         
//         for (count = 1;count <= 3;count++)
//         {
//            if(count==1)  
//            {
//               PowerupatVmin(dcsetup_loosevmin,norm_fmsu);
//               clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//                        v[vih_loose_osc_vmin],v[vil_loose]);
//               labstr = "CG_LEAK_ALL_MN_";
//            }
//            else if(count==2)  
//            {
//               PowerupatVnom(dcsetup_loosevnom,norm_fmsu);
//               clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//                        v[vih_loose_osc_vnom],v[vil_loose]);
//               labstr = "CG_LEAK_ALL_NM_";
//            }
//            else
//            {
//               PowerupatVmax(dcsetup_loosevmax,norm_fmsu);
//               clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//                        v[vih_loose_osc_vmax],v[vil_loose]);
//               labstr = "CG_LEAK_ALL_MX_";
//            } 
//            
//            clockpinset(s_clk_1a,s_clock);
//            TIME.Wait(2ms);
//            
//            if(patternexecute(site,f021_shell_loadpat))  
//            {
//               PrintHeaderParam(GL_PLELL_FORMAT);
//               
//               for vforce = vstart to vstop by vresol do
//               {
//                  TCR.TP1_VRange[tcrnum][tcrmode] = vforce;
//                  
//                  F021_Set_TPADS(tcrnum,tcrmode);
//                  F021_RunTestNumber_PMEX(testnum,maxtime,tmp_results);
//                  TIME.Wait(tdelay);
//                  discard(F021_Meas_TPAD_PMEX(testpad,tcrnum,tcrmode,
//                          llim,ulim,meas_value,tmp_results));
//                  Disable(s_pmexit);
//                  
//                  GetTreal_Unit_Info(vforce,force_realval,unitlen,unitstr);
//                  force_intval = trunc(force_realval*1000);
//                  writestring(str1,force_intval:1);
//                  twlabstr = labstr + str1;
//                  twlabstr = twlabstr + "_B";
//                  writestring(str1,bank:1);
//                  twlabstr = twlabstr + str1;
//                  
//                  TWTRealToRealMS(meas_value,realval,unitval);
//                  TWPDLDataLogRealVariable(twlabstr,unitval,realval,TWMinimumData);
//                  
//                  PrintResultParam(twlabstr,testnum,tmp_results,llim,ulim,meas_value,GL_PLELL_FORMAT);
//               }   /*for vforce*/
//            }   /*if patternexec*/
//         }   /*for count*/
//      }   /*for bank*/
//      
//      f021_runtestnumber(tnum_always_pass,1s,spare_mstreal1,tmp_results);
//      F021_UnSet_TPADS(tcrnum);
//      ttimer1 = timernread(ttimer1);
//      tt_timer = ttimer1;
//      str2 = "Charz_CG_Leak_All_TT";
//      TWTRealToRealMS(tt_timer,realval,unitval);
//      TWPDLDataLogRealVariable(str2, unitval,realval,TWMinimumData);
//
//      if(tistdscreenprint)  
//         cout << str2 << " " << ttimer1 << endl;
//      
//   }   /*if v_any_dev_active*/
//}   /* Charz_CG_Leak_All */
//   
//
//BoolS Charz_Icmp10_Iref()
//{
//   const IntS CORNER_VMIN = 1; 
//   const IntS CORNER_VNOM = 2; 
//   const IntS CORNER_VMAX = 3; 
//   const IntS CORNER_VN5 = 4; 
//   const IntS CORNER_VP15 = 5; 
//
//   IntS site,bank,count;
//   IntS tcrnum,tcrnum_src,testnum;
//   TPModeType tcrmode,tcrmode_src;
//   PinM testpad,tp3,tp4;
//   FloatS maxtime,tdelay,tdelay2,ttimer1;
//   FloatS llim,ulim,llim3,ulim3,llim4,ulim4;
//   FloatM meas_value,tt_timer;
//   BoolM tmp_results;
//   StringS str1,str2,str3,str4,current_shell;
//
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//      {
//         cout << endl;
//         cout << "**** Charz_Icmp10_Iref ****" << endl;
//         cout << endl;
//      } 
//      
//      maxtime = 2s;
//      tdelay  = 10ms;
//      tdelay2 = 100ms;
//      
//      testpad = FLTP1;
//      
//       /*Iref*/
//      tcrnum  = 125;
//      tcrmode = ReadMode;
//      ulim4 = TCR.TP1_ULim[tcrnum][tcrmode];
//      llim4 = TCR.TP1_LLim[tcrnum][tcrmode];
//      str1  = "MAIN_IREF_";
//      
//       /*Icmp10*/
//      tcrnum_src  = 126;
//      tcrmode_src = ReadMode;
//      ulim3 = TCR.TP1_ULim[tcrnum_src][tcrmode_src];
//      llim3 = TCR.TP1_LLim[tcrnum_src][tcrmode_src];
//      str2  = "MAIN_ICMP10_";
//
//      for (count = 1;count <= 5;count++)
//      {
//         switch(count) {
//           case CORNER_VMIN :  
//              PowerUpAtVmin(dcsetup_loosevmin,norm_fmsu);
//              ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vmin],v[vil_loose]);
//              str3 = "VMIN";
//            break; 
//           case CORNER_VNOM :  
//              PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
//              ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vnom],v[vil_loose]);
//              str3 = "VNOM";
//            break; 
//           case CORNER_VMAX :  
//              PowerUpAtVmax(dcsetup_loosevmax,norm_fmsu);
//              ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vmax],v[vil_loose]);
//              str3 = "VMAX";
//            break; 
//           case CORNER_VN5 :  
//              PowerUpAtVmax(dcsetup_loosevmax,norm_fmsu);
//              ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vmax],v[vil_loose]);
//              str3 = "VN5";
//            break; 
//           case CORNER_VP15 :  
//              PowerUpAtVmax(dcsetup_loosevmax,norm_fmsu);
//              ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vmax],v[vil_loose]);
//              str3 = "VP15";
//            break; 
//         }   /* case */
//           
//         clockpinset(s_clk_1a,s_clock);
//         TIME.Wait(tdelay);
//         current_shell = "FlashShell";
//         if(GL_PREVIOUS_SHELL != current_shell)        
//            F021_LoadFlashShell_func;
//
//          /*iref tp4*/
//         testnum = TNUM_PUMP_MAINIREF;
//         ulim = ulim4;
//         llim = llim4;
//         str4 = str1 + str3;
//         F021_RunTestNumber_PMEX(testnum,maxtime,tmp_results);
//         TIME.Wait(tdelay2);
//         F021_Set_TPADS(tcrnum,tcrmode);
//         TIME.Wait(tdelay);
//         discard(F021_Meas_TPAD_PMEX(testpad,tcrnum,tcrmode,
//                    llim,ulim,meas_value,tmp_results));
//         Disable(s_pmexit);
//         F021_TurnOff_AllTPADS;
//         if(tistdscreenprint)  
//         {
//            PrintHeaderParam(GL_PLELL_FORMAT);
//            PrintResultParam(str4,testnum,tmp_results,llim,ulim,meas_value,GL_PLELL_FORMAT);
//         } 
//      
//          /*icmp10 tp3*/
//         testnum = TNUM_PUMP_MAINICMP10U;
//         ulim = ulim3;
//         llim = llim3;
//         str4 = str2 + str3;
//         F021_RunTestNumber_PMEX(testnum,maxtime,tmp_results);
//         TIME.Wait(tdelay2);
//         F021_Set_TPADS(tcrnum_src,tcrmode_src);
//         TIME.Wait(tdelay);
//         discard(F021_Meas_TPAD_PMEX(testpad,tcrnum_src,tcrmode_src,
//                    llim,ulim,meas_value,tmp_results));
//         Disable(s_pmexit);
//         F021_TurnOff_AllTPADS;
//         if(tistdscreenprint)  
//            PrintResultParam(str4,testnum,tmp_results,llim,ulim,meas_value,GL_PLELL_FORMAT);
//      }   /*for*/
//   } 
//
//   Charz_Icmp10_Iref = v_any_dev_active;
//} 
//
//
// /*purpose: evaluate effect of VINH for MMS*/
//BoolS Charz_TCR84_Stress4()
//{
//   IntS site,bank,count;
//   IntS tcrnum,tcrnum_src,testnum;
//   TPModeType tcrmode,tcrmode_src;
//   option testpad,tp3,tp4;
//   FloatS maxtime,tdelay,tdelay2,ttimer1;
//   FloatS llim,ulim,llim3,ulim3,llim4,ulim4;
//   FloatM meas_value,meas_value2,tt_timer;
//   FloatM1D IRval(8),IRval2(8);
//   FloatM Istart,Istop,VforceArr;
//   FloatM VCGstart,VCGstop;
//   FloatS Iresol,VCGresol;
//   FloatS iref_start,iref_stop,iref_inc;
//   FloatS vcg_start,vcg_stop,vcg_inc;
//   FloatS stresstime,vinh_force;
//   BoolM tmp_results;
//   StringS str1,str2,str3,str4,current_shell;
//   BoolS ersena,pgmena,prebitmap,pstbitmap,stressena;
//
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//      {
//         cout << endl;
//         cout << "**** Charz_TCR84_Stress4 ****" << endl;
//         cout << endl;
//      } 
//      
//      maxtime = GL_F021_MAXTIME;
//      tdelay  = 10ms;
//      tdelay2 = 100ms;
//      
//      PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
//      ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vnom],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(tdelay);
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      tcrnum_src  = 84;
//      tcrmode_src = ProgMode;
//      tcrnum  = 128;
//      tcrmode = ProgMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode_src,tcrnum_src);
//
//                  
//      for (count = 1;count <= 6;count++)
//      {
//         ersena = false;
//         pgmena = false;
//         prebitmap = true;
//         pstbitmap = true;
//         stressena = true;
//         
//         switch(count) {
//           case 1 :  
//                  stresstime = 1s;
//                  vinh_force = 3.2V;
//                  pgmena = true;
//                break; 
//           case 2 :  
//                  stresstime = 2s;
//                  vinh_force = 3.2V;
//                break; 
//           case 3 :  
//                  stresstime = 1s;
//                  vinh_force = 3.3V;
//                  ersena = true;
//                  pgmena = true;
//                break; 
//           case 4 :  
//                  stresstime = 2s;
//                  vinh_force = 3.3V;
//                break; 
//           case 5 :  
//                  stresstime = 1s;
//                  vinh_force = 3.4V;
//                  ersena = true;
//                  pgmena = true;
//                break; 
//           case 6 :  
//                  stresstime = 2s;
//                  vinh_force = 3.4V;
//                break; 
//         }   /* case */
//
//         TCR.TP3_VRange[tcrnum][tcrmode] = vinh_force;
//
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "*** STEP " << count:-4 << "***" << endl;
//         } 
//         
//           
//          /*+++ erase +++*/
//         if(ersena)  
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_ERS_NOPRECON + (bank<<4);
//               f021_runtestnumber(testnum,maxtime,spare_mstreal1,tmp_results);
//            } 
//
//          /*+++ prog blk0 +++*/
//         if(pgmena)  
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_PROG_SM + (bank<<4);
//               f021_runtestnumber(testnum,maxtime,spare_mstreal1,tmp_results);
//            } 
//         
//          /*+++ find ir0max/bitmap +++*/
//         Istart = 0uA;
//         Istop = 30uA;
//         VforceArr = 1.2V;
//         Iresol = 1uA;
//         VCGstart = 0V;
//         VCGstop = 0V;
//         VCGresol = 100mV;
//          /*bithistogram*/
//         iref_start = 0uA;
//         iref_stop  = 30uA;
//         iref_inc   = 1uA;
//         vcg_start  = 0V;
//         vcg_stop   = 0V;
//         vcg_inc    = 100mV;
//         
//         if(prebitmap)  
//         {
//            if(tistdscreenprint)  
//               PrintHeaderParam(GL_PLELL_FORMAT);
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_BCC_0S + (bank<<4);
//               F021_BCC_BinSearch_TTR(testnum,Istart,Istop,Iresol,VforceArr,maxtime,spare_mstreal1,meas_value);
//               IRval[bank] = meas_value;
//               arraymulttrealvalue(meas_value2,meas_value,0.5,v_sites);
//               IRval2[bank] = meas_value2;  /*ir0max/2*/
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR0max_B" + str1;
//                  PrintResultParam(str2,testnum,tmp_results,0a,0a,meas_value,GL_PLELL_FORMAT);
//                  str2 = "IR0maxHalf_B" + str1;
//                  PrintResultParam(str2,testnum,tmp_results,0a,0a,meas_value2,GL_PLELL_FORMAT);
//               } 
//            } 
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR0max Histogram B" + str1;
//                  str2 = str2 + " PreStress";
//                  cout << endl;
//                  cout << str2 << endl;
//               } 
//               
//               testnum = TNUM_BANK_BCC_0S + (bank<<4);
//               TL_BitHistogram(BANKTYPE,testnum,vcg_start,vcg_stop,vcg_inc,iref_start,iref_stop,iref_inc,false,"");
//            } 
//         }   /*if prebitmap*/
//
//
//          /*+++ stress +++*/
//         if(stressena)  
//         {
//#if $TP3_TO_TP5_PRESENT  
//            if(tistdscreenprint)  
//               cout << "Stressing VINH @ " << vinh_force:-6:3 << " " << stresstime:-6:3 << endl;
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_CSFG_STRESS + (bank<<4);
//               F021_TurnOff_AllTpads;
//               F021_RunTestNumber_PMEX(testnum,maxtime,tmp_results);
//               F021_Set_TPADS(tcrnum,tcrmode);
//               TIME.Wait(stresstime);
//               F021_TurnOff_AllTpads;
//               Disable(s_pmexit);
//               F021_RunTestNumber(TNUM_ALWAYS_PASS,maxtime,spare_mstreal1,tmp_results);
//               TIME.Wait(tdelay);
//            } 
//#endif
//         }   /*if stressena*/
//
//         if(pstbitmap)  
//         {
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR0max Histogram B" + str1;
//                  str2 = str2 + " PstStress";
//                  cout << endl;
//                  cout << str2 << "  VINH @ " << vinh_force:-6:3 << " " << stresstime:-6:3 << endl;
//               } 
//               
//               testnum = TNUM_BANK_BCC_0S + (bank<<4);
//               TL_BitHistogram(BANKTYPE,testnum,vcg_start,vcg_stop,vcg_inc,iref_start,iref_stop,iref_inc,false,"");
//            } 
//         }   /*pstbitmap*/
//
//      }   /*for count*/
//      
//   }   /*if v_any_dev_active*/
//
//   Charz_TCR84_Stress4 = v_any_dev_active;
//} 
//
//
// /*purpose: evaluate effect of VINH for MMS*/
//BoolS Charz_TCR52_Stress10()
//{
//   IntS site,bank,count;
//   IntS tcrnum,tcrnum_src,testnum;
//   TPModeType tcrmode,tcrmode_src;
//   PinM testpad,tp3,tp4;
//   option pgmMode;
//   FloatS maxtime,tdelay,tdelay2,ttimer1;
//   FloatS llim,ulim,llim3,ulim3,llim4,ulim4;
//   FloatM meas_value,meas_value2,tt_timer;
//   FloatM1D IRval(8),IRval2(8);
//   FloatM Istart,Istop,VforceArr;
//   FloatM VCGstart,VCGstop;
//   FloatS Iresol,VCGresol;
//   FloatS stresstime,vinh_force;
//   FloatS iref_start,iref_stop,iref_inc;
//   FloatS vcg_start,vcg_stop,vcg_inc;
//   BoolM tmp_results;
//   StringS str1,str2,str3,str4,current_shell;
//   BoolS ersena,pgmena,prebitmap,pstbitmap,stressena;
//   VcornerType stressvcorner;
//   FloatS rampstart,rampstop,iProg;
//
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//      {
//         cout << endl;
//         cout << "**** Charz_TCR52_Stress10 ****" << endl;
//         cout << endl;
//      } 
//      
//      maxtime = GL_F021_MAXTIME;
//      tdelay  = 10ms;
//      tdelay2 = 100ms;
//
//      PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
//      ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vnom],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(tdelay);
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      tcrnum_src  = 52;
//      tcrmode_src = ProgMode;
//      tcrnum  = 128;
//      tcrmode = ProgMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode_src,tcrnum_src);
//
//      testpad     = FLTP1;
//      pgmMode     = S_VI_Mode;
//      rampstart   = TCR.TP1_VCharLo[TCRnum][TCRmode];
//      rampstop    = TCR.TP1_VCharHi[TCRnum][TCRmode];
//      iProg       = TCR.TP1_IRange[TCRnum][TCRmode];      
//      
//                  
//      for (count = 1;count <= 18;count++)
//      {
//         ersena = false;
//         pgmena = false;
//         prebitmap = true;
//         pstbitmap = true;
//         stressena = true;
//         
//         switch(count) {
//           case 1  :  
//                  stresstime = 41ms;
//                  vinh_force = 3.2V;
//                  pgmena = true;
//                  ersena = true;
//                  stressvcorner = VMN;
//                break; 
//           case 2  :  
//                  stresstime = 82ms;
//                  vinh_force = 3.2V;
//                  stressvcorner = VMN;
//                break; 
//           case 3  :  
//                  stresstime = 164ms;
//                  vinh_force = 3.2V;
//                  stressvcorner = VMN;
//                break; 
//           case 4  :  
//                  stresstime = 41ms;
//                  vinh_force = 3.3V;
//                  pgmena = true;
//                  ersena = true;
//                  stressvcorner = VMN;
//                break; 
//           case 5  :  
//                  stresstime = 82ms;
//                  vinh_force = 3.3V;
//                  stressvcorner = VMN;
//                break; 
//           case 6  :  
//                  stresstime = 164ms;
//                  vinh_force = 3.3V;
//                  stressvcorner = VMN;
//                break; 
//           case 7  :  
//                  stresstime = 41ms;
//                  vinh_force = 3.4V;
//                  pgmena = true;
//                  ersena = true;
//                  stressvcorner = VMN;
//                break; 
//           case 8  :  
//                  stresstime = 82ms;
//                  vinh_force = 3.4V;
//                  stressvcorner = VMN;
//                break; 
//           case 9  :  
//                  stresstime = 164ms;
//                  vinh_force = 3.4V;
//                  stressvcorner = VMN;
//               } 
//           10 : {
//                  stresstime = 41ms;
//                  vinh_force = 3.2V;
//                  pgmena = true;
//                  ersena = true;
//                  stressvcorner = VMX;
//               } 
//           11 : {
//                  stresstime = 82ms;
//                  vinh_force = 3.2V;
//                  stressvcorner = VMX;
//               } 
//           12 : {
//                  stresstime = 164ms;
//                  vinh_force = 3.2V;
//                  stressvcorner = VMX;
//               } 
//           13 : {
//                  stresstime = 41ms;
//                  vinh_force = 3.3V;
//                  pgmena = true;
//                  ersena = true;
//                  stressvcorner = VMX;
//               } 
//           14 : {
//                  stresstime = 82ms;
//                  vinh_force = 3.3V;
//                  stressvcorner = VMX;
//               } 
//           15 : {
//                  stresstime = 164ms;
//                  vinh_force = 3.3V;
//                  stressvcorner = VMX;
//               } 
//           16 : {
//                  stresstime = 41ms;
//                  vinh_force = 3.4V;
//                  pgmena = true;
//                  ersena = true;
//                  stressvcorner = VMX;
//               } 
//           17 : {
//                  stresstime = 82ms;
//                  vinh_force = 3.4V;
//                  stressvcorner = VMX;
//               } 
//           18 : {
//                  stresstime = 164ms;
//                  vinh_force = 3.4V;
//                  stressvcorner = VMX;
//               } 
//         }   /* case */
//
//         TCR.TP3_VRange[tcrnum][tcrmode] = vinh_force;
//
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "*** STEP " << count:-4 << "***" << endl;
//         } 
//         
//           
//          /*+++ prog blk0 +++*/
//         if(pgmena)  
//         {
//            pwrupatvnom_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_PROG_SM + (bank<<4);
//               f021_runtestnumber(testnum,maxtime,spare_mstreal1,tmp_results);
//            } 
//         } 
//         
//          /*+++ erase +++*/
//         if(ersena)  
//         {
//            pwrupatvnom_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_ERS_NOPRECON + (bank<<4);
//               f021_runtestnumber(testnum,maxtime,spare_mstreal1,tmp_results);
//            } 
//         } 
//
//          /*+++ find ir0max/bitmap +++*/
//         Istart = 0uA;
//         Istop = 100uA;
//         VforceArr = 1.32V;
//         Iresol = 1uA;
//         VCGstart = 0V;
//         VCGstop = 0V;
//         VCGresol = 100mV;
//          /*bithistogram*/
//         iref_start = 0uA;
//         iref_stop  = 100uA;
//         iref_inc   = 1uA;
//         vcg_start  = 0V;
//         vcg_stop   = 0V;
//         vcg_inc    = 100mV;
//         
//         
//         if(prebitmap)  
//         {
//            pwrupatvmax_1;
//            if(tistdscreenprint)  
//               PrintHeaderParam(GL_PLELL_FORMAT);
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_BCC_1S + (bank<<4);
//               F021_BCC_BinSearch_TTR(testnum,Istart,Istop,Iresol,VforceArr,maxtime,spare_mstreal1,meas_value);
//               IRval[bank] = meas_value;
//               arraymulttrealvalue(meas_value2,meas_value,2,v_sites);
//               IRval2[bank] = meas_value2;  /*ir1min*2*/
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR1min_B" + str1;
//                  PrintResultParam(str2,testnum,tmp_results,0a,0a,meas_value,GL_PLELL_FORMAT);
//                  str2 = "IR1min*2_B" + str1;
//                  PrintResultParam(str2,testnum,tmp_results,0a,0a,meas_value2,GL_PLELL_FORMAT);
//               } 
//            } 
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR1min Histogram B" + str1;
//                  str2 = str2 + " PreStress";
//                  cout << endl;
//                  cout << str2 << endl;
//               } 
//               
//               testnum = TNUM_BANK_BCC_1S + (bank<<4);
//               TL_BitHistogram(BANKTYPE,testnum,vcg_start,vcg_stop,vcg_inc,iref_start,iref_stop,iref_inc,false,"");
//            } 
//         }   /*if prebitmap*/
//
//
//          /*+++ stress +++*/
//         if(stressena)  
//         {
//#if $TP3_TO_TP5_PRESENT  
//            if(stressvcorner==VMN)  
//            {
//               pwrupatvmin_1;
//               if(tistdscreenprint)  
//                  cout << "Stressing VMIN <<  VINH @ " << vinh_force:-6:3 << " " << stresstime:-6:3 << endl;
//            }
//            else
//            {
//               pwrupatvmax_1;
//               if(tistdscreenprint)  
//                  cout << "Stressing VMAX <<  VINH @ " << vinh_force:-6:3 << " " << stresstime:-6:3 << endl;
//            } 
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_PGMFF_STRESS + (bank<<4);
//               F021_TurnOff_AllTpads;
//               F021_RunTestNumber_PMEX(testnum,maxtime,tmp_results);
//               F021_Ramp_TPAD(testpad,rampstart,rampstop,iProg,pgmMode);
//               F021_Set_TPADS(tcrnum,tcrmode);
//               TIME.Wait(stresstime);
//               F021_Ramp_TPAD(testpad,rampstop,rampstart,iProg,pgmMode);
//               F021_TurnOff_AllTpads;
//               Disable(s_pmexit);
//               F021_RunTestNumber(TNUM_ALWAYS_PASS,maxtime,spare_mstreal1,tmp_results);
//               TIME.Wait(tdelay);
//            } 
//#endif
//         }   /*if stressena*/
//
//         if(pstbitmap)  
//         {
//            pwrupatvmax_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR1min Histogram B" + str1;
//                  str2 = str2 + " PstStress";
//                  cout << endl;
//                  cout << str2 << "  VINH @ " << vinh_force:-6:3 << " " << stresstime:-6:3 << endl;
//               } 
//               
//               testnum = TNUM_BANK_BCC_1S + (bank<<4);
//               TL_BitHistogram(BANKTYPE,testnum,vcg_start,vcg_stop,vcg_inc,iref_start,iref_stop,iref_inc,false,"");
//            } 
//         }   /*pstbitmap*/
//
//      }   /*for count*/
//      
//   }   /*if v_any_dev_active*/
//
//   Charz_TCR52_Stress10 = v_any_dev_active;
//} 
//
//
// /*purpose: evaluate effect of VINH for MMS*/
//BoolS Charz_TCR52_Stress11()
//{
//   IntS site,bank,count;
//   IntS tcrnum,tcrnum_src,testnum;
//   TPModeType tcrmode,tcrmode_src;
//   PinM testpad,tp3,tp4;
//   option pgmMode;
//   FloatS maxtime,tdelay,tdelay2,ttimer1;
//   FloatS llim,ulim,llim3,ulim3,llim4,ulim4;
//   FloatM meas_value,meas_value2,tt_timer;
//   FloatM1D IRval(8),IRval2(8);
//   FloatM Istart,Istop,VforceArr;
//   FloatM VCGstart,VCGstop;
//   FloatS Iresol,VCGresol;
//   FloatS iref_start,iref_stop,iref_inc;
//   FloatS vcg_start,vcg_stop,vcg_inc;
//   FloatS stresstime,vinh_force;
//   BoolM tmp_results;
//   StringS str1,str2,str3,str4,current_shell;
//   BoolS ersena,pgmena,prebitmap,pstbitmap,stressena;
//   VcornerType stressvcorner;
//   FloatS rampstart,rampstop,iProg;
//
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//      {
//         cout << endl;
//         cout << "**** Charz_TCR52_Stress11 ****" << endl;
//         cout << endl;
//      } 
//      
//      maxtime = GL_F021_MAXTIME;
//      tdelay  = 10ms;
//      tdelay2 = 100ms;
//
//      PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
//      ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vnom],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(tdelay);
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      tcrnum_src  = 52;
//      tcrmode_src = PvfyMode;
//      tcrnum  = 128;
//      tcrmode = PvfyMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode_src,tcrnum_src);
//
//      testpad     = FLTP1;
//      pgmMode     = S_VI_Mode;
//      rampstart   = TCR.TP1_VCharLo[TCRnum][TCRmode];
//      rampstop    = TCR.TP1_VCharHi[TCRnum][TCRmode];
//      iProg       = TCR.TP1_IRange[TCRnum][TCRmode];      
//      
//                  
//      for (count = 1;count <= 6;count++)
//      {
//         ersena = false;
//         pgmena = false;
//         prebitmap = true;
//         pstbitmap = true;
//         stressena = true;
//         stressvcorner = VNM;
//         
//         switch(count) {
//           case 1  :  
//                  stresstime = 512ms;
//                  vinh_force = 3.2V;
//                  pgmena = true;
//                  ersena = true;
//                break; 
//           case 2  :  
//                  stresstime = 1024ms;
//                  vinh_force = 3.2V;
//                break; 
//           case 3  :  
//                  stresstime = 512ms;
//                  vinh_force = 3.3V;
//                  pgmena = true;
//                  ersena = true;
//                break; 
//           case 4  :  
//                  stresstime = 1024ms;
//                  vinh_force = 3.3V;
//                break; 
//           case 5  :  
//                  stresstime = 512ms;
//                  vinh_force = 3.4V;
//                  pgmena = true;
//                  ersena = true;
//                break; 
//           case 6  :  
//                  stresstime = 1024ms;
//                  vinh_force = 3.4V;
//                break; 
//         }   /* case */
//
//         TCR.TP3_VRange[tcrnum][tcrmode] = vinh_force;
//
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "*** STEP " << count:-4 << "***" << endl;
//         } 
//         
//           
//          /*+++ prog blk0 +++*/
//         if(pgmena)  
//         {
//            pwrupatvnom_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_PROG_SM + (bank<<4);
//               f021_runtestnumber(testnum,maxtime,spare_mstreal1,tmp_results);
//            } 
//         } 
//         
//          /*+++ erase +++*/
//         if(ersena)  
//         {
//            pwrupatvnom_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_ERS_NOPRECON + (bank<<4);
//               f021_runtestnumber(testnum,maxtime,spare_mstreal1,tmp_results);
//            } 
//         } 
//
//          /*+++ find ir0max/bitmap +++*/
//         Istart = 0uA;
//         Istop = 100uA;
//         VforceArr = 1.32V;
//         Iresol = 1uA;
//         VCGstart = 0V;
//         VCGstop = 0V;
//         VCGresol = 100mV;
//          /*bithistogram*/
//         iref_start = 0uA;
//         iref_stop  = 100uA;
//         iref_inc   = 1uA;
//         vcg_start  = 0V;
//         vcg_stop   = 0V;
//         vcg_inc    = 100mV;
//         
//         
//         if(prebitmap)  
//         {
//            pwrupatvmax_1;
//            if(tistdscreenprint)  
//               PrintHeaderParam(GL_PLELL_FORMAT);
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_BCC_1S + (bank<<4);
//               F021_BCC_BinSearch_TTR(testnum,Istart,Istop,Iresol,VforceArr,maxtime,spare_mstreal1,meas_value);
//               IRval[bank] = meas_value;
//               arraymulttrealvalue(meas_value2,meas_value,2,v_sites);
//               IRval2[bank] = meas_value2;  /*ir1min*2*/
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR1min_B" + str1;
//                  PrintResultParam(str2,testnum,tmp_results,0a,0a,meas_value,GL_PLELL_FORMAT);
//                  str2 = "IR1min*2_B" + str1;
//                  PrintResultParam(str2,testnum,tmp_results,0a,0a,meas_value2,GL_PLELL_FORMAT);
//               } 
//            } 
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR1min Histogram B" + str1;
//                  str2 = str2 + " PreStress";
//                  cout << endl;
//                  cout << str2 << endl;
//               } 
//               
//               testnum = TNUM_BANK_BCC_1S + (bank<<4);
//               TL_BitHistogram(BANKTYPE,testnum,vcg_start,vcg_stop,vcg_inc,iref_start,iref_stop,iref_inc,false,"");
//            } 
//         }   /*if prebitmap*/
//
//
//          /*+++ stress +++*/
//         if(stressena)  
//         {
//#if $TP3_TO_TP5_PRESENT  
//            pwrupatvnom_1;
//            if(tistdscreenprint)  
//               cout << "Stressing VNOM <<  VINH @ " << vinh_force:-6:3 << " " << stresstime:-6:3 << endl;
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_PGMFF_STRESS + (bank<<4);
//               F021_TurnOff_AllTpads;
//               F021_RunTestNumber_PMEX(testnum,maxtime,tmp_results);
//               F021_Ramp_TPAD(testpad,rampstart,rampstop,iProg,pgmMode);
//               F021_Set_TPADS(tcrnum,tcrmode);
//               TIME.Wait(stresstime);
//               F021_Ramp_TPAD(testpad,rampstop,rampstart,iProg,pgmMode);
//               F021_TurnOff_AllTpads;
//               Disable(s_pmexit);
//               F021_RunTestNumber(TNUM_ALWAYS_PASS,maxtime,spare_mstreal1,tmp_results);
//               TIME.Wait(tdelay);
//            } 
//#endif
//         }   /*if stressena*/
//
//         if(pstbitmap)  
//         {
//            pwrupatvmax_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR1min Histogram B" + str1;
//                  str2 = str2 + " PstStress";
//                  cout << endl;
//                  cout << str2 << "  VINH @ " << vinh_force:-6:3 << " " << stresstime:-6:3 << endl;
//               } 
//               
//               testnum = TNUM_BANK_BCC_1S + (bank<<4);
//               TL_BitHistogram(BANKTYPE,testnum,vcg_start,vcg_stop,vcg_inc,iref_start,iref_stop,iref_inc,false,"");
//            } 
//         }   /*pstbitmap*/
//
//      }   /*for count*/
//      
//   }   /*if v_any_dev_active*/
//
//   Charz_TCR52_Stress11 = v_any_dev_active;
//} 
//
//
// /*purpose: evaluate effect of VCG for MMS*/
//BoolS Charz_TCR53_Stress2()
//{
//   IntS site,bank,count;
//   IntS tcrnum,tcrnum_src,testnum;
//   TPModeType tcrmode,tcrmode_src;
//   PinM testpad,tp3,tp4;
//   option pgmMode;
//   FloatS maxtime,tdelay,tdelay2,ttimer1;
//   FloatS llim,ulim,llim3,ulim3,llim4,ulim4;
//   FloatM meas_value,meas_value2,tt_timer;
//   FloatM1D IRval(8),IRval2(8);
//   FloatM Istart,Istop,VforceArr;
//   FloatM VCGstart,VCGstop;
//   FloatS Iresol,VCGresol;
//   FloatS iref_start,iref_stop,iref_inc;
//   FloatS vcg_start,vcg_stop,vcg_inc;
//   FloatS stresstime,vcg_force;
//   BoolM tmp_results;
//   StringS str1,str2,str3,str4,current_shell;
//   BoolS ersena,pgmena,prebitmap,pstbitmap,stressena;
//   VcornerType stressvcorner;
//   FloatS rampstart,rampstop,iProg;
//
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//      {
//         cout << endl;
//         cout << "**** Charz_TCR53_Stress2 ****" << endl;
//         cout << endl;
//      } 
//      
//      maxtime = GL_F021_MAXTIME;
//      tdelay  = 10ms;
//      tdelay2 = 100ms;
//
//      PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
//      ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vnom],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(tdelay);
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      tcrnum_src  = 53;
//      tcrmode_src = PvfyMode;
//      tcrnum  = 128;
//      tcrmode = PvfyMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode_src,tcrnum_src);
//
//      testpad     = FLTP1;
//      pgmMode     = S_VI_Mode;
//      rampstart   = TCR.TP1_VCharLo[TCRnum][TCRmode];
//      rampstop    = TCR.TP1_VCharHi[TCRnum][TCRmode];
//      iProg       = TCR.TP1_IRange[TCRnum][TCRmode];      
//      
//                  
//      for (count = 1;count <= 16;count++)
//      {
//         ersena = false;
//         pgmena = false;
//         prebitmap = true;
//         pstbitmap = true;
//         stressena = true;
//         
//         switch(count) {
//           case 1  :  
//                   stresstime = 200ms;
//                   vcg_force = 13V;
//                   pgmena = true;
//                   ersena = true;
//                   stressvcorner = VMN;
//                break; 
//           case 2  :  
//                   stresstime = 300ms;
//                   vcg_force = 13V;
//                   stressvcorner = VMN;
//                break; 
//           case 3  :  
//                   stresstime = 400ms;
//                   vcg_force = 13V;
//                   stressvcorner = VMN;
//                break; 
//           case 4  :  
//                   stresstime = 500ms;
//                   vcg_force = 13V;
//                   stressvcorner = VMN;
//                break; 
//           case 5  :  
//                   stresstime = 200ms;
//                   vcg_force = 13.5V;
//                   pgmena = true;
//                   ersena = true;
//                   stressvcorner = VMN;
//                break; 
//           case 6  :  
//                   stresstime = 300ms;
//                   vcg_force = 13.5V;
//                   stressvcorner = VMN;
//                 break; 
//           case 7  :  
//                   stresstime = 400ms;
//                   vcg_force = 13.5V;
//                   stressvcorner = VMN;
//                break; 
//           case 8  :  
//                   stresstime = 500ms;
//                   vcg_force = 13.5V;
//                   stressvcorner = VMN;
//                break; 
//           case 9  :  
//                   stresstime = 200ms;
//                   vcg_force = 13V;
//                   pgmena = true;
//                   ersena = true;
//                   stressvcorner = VMX;
//               } 
//           10  : {
//                   stresstime = 300ms;
//                   vcg_force = 13V;
//                   stressvcorner = VMX;
//               } 
//           11  : {
//                   stresstime = 400ms;
//                   vcg_force = 13V;
//                   stressvcorner = VMX;
//               } 
//           12  : {
//                   stresstime = 500ms;
//                   vcg_force = 13V;
//                   stressvcorner = VMX;
//               } 
//           13  : {
//                   stresstime = 200ms;
//                   vcg_force = 13.5V;
//                   pgmena = true;
//                   ersena = true;
//                   stressvcorner = VMX;
//               } 
//           14  : {
//                   stresstime = 300ms;
//                   vcg_force = 13.5V;
//                   stressvcorner = VMX;
//                } 
//           15  : {
//                   stresstime = 400ms;
//                   vcg_force = 13.5V;
//                   stressvcorner = VMX;
//               } 
//           16  : {
//                   stresstime = 500ms;
//                   vcg_force = 13.5V;
//                   stressvcorner = VMX;
//               } 
//         }   /* case */
//
//         TCR.TP1_VRange[tcrnum][tcrmode] = vcg_force;
//
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "*** STEP " << count:-4 << "***" << endl;
//         } 
//         
//           
//          /*+++ erase +++*/
//         if(ersena)  
//         {
//            pwrupatvnom_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_ERS_NOPRECON + (bank<<4);
//               f021_runtestnumber(testnum,maxtime,spare_mstreal1,tmp_results);
//            } 
//         } 
//
//          /*+++ prog blk0 +++*/
//         if(pgmena)  
//         {
//            pwrupatvnom_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_PROG_SM + (bank<<4);
//               f021_runtestnumber(testnum,maxtime,spare_mstreal1,tmp_results);
//            } 
//         } 
//         
//          /*+++ find ir0max/bitmap +++*/
//         Istart = 0uA;
//         Istop = 30uA;
//         VforceArr = 1.32V;
//         Iresol = 1uA;
//         VCGstart = 0V;
//         VCGstop = 0V;
//         VCGresol = 100mV;
//          /*bithistogram*/
//         iref_start = 0uA;
//         iref_stop  = 30uA;
//         iref_inc   = 1uA;
//         vcg_start  = 0V;
//         vcg_stop   = 0V;
//         vcg_inc    = 100mV;
//         
//         
//         if(prebitmap)  
//         {
//            pwrupatvmax_1;
//            if(tistdscreenprint)  
//               PrintHeaderParam(GL_PLELL_FORMAT);
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_BCC_0S + (bank<<4);
//               F021_BCC_BinSearch_TTR(testnum,Istart,Istop,Iresol,VforceArr,maxtime,spare_mstreal1,meas_value);
//               IRval[bank] = meas_value;
//               arraymulttrealvalue(meas_value2,meas_value,0.5,v_sites);
//               IRval2[bank] = meas_value2;  /*ir1min*2*/
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR0max_B" + str1;
//                  PrintResultParam(str2,testnum,tmp_results,0a,0a,meas_value,GL_PLELL_FORMAT);
//                  str2 = "IR0maxHalf_B" + str1;
//                  PrintResultParam(str2,testnum,tmp_results,0a,0a,meas_value2,GL_PLELL_FORMAT);
//               } 
//            } 
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR0max Histogram B" + str1;
//                  str2 = str2 + " PreStress";
//                  cout << endl;
//                  cout << str2 << endl;
//               } 
//               
//               testnum = TNUM_BANK_BCC_0S + (bank<<4);
//               TL_BitHistogram(BANKTYPE,testnum,vcg_start,vcg_stop,vcg_inc,iref_start,iref_stop,iref_inc,false,"");
//            } 
//         }   /*if prebitmap*/
//
//
//          /*+++ stress +++*/
//         if(stressena)  
//         {
//            if(stressvcorner==VMN)  
//            {
//               pwrupatvmin_1;
//               if(tistdscreenprint)  
//                  cout << "Stressing VMIN <<  VCG @ " << vcg_force:-6:3 << " " << stresstime:-6:3 << endl;
//            }
//            else
//            {
//               pwrupatvmax_1;
//               if(tistdscreenprint)  
//                  cout << "Stressing VMAX <<  VCG @ " << vcg_force:-6:3 << " " << stresstime:-6:3 << endl;
//            } 
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_ONO_STRESS + (bank<<4);
//               F021_TurnOff_AllTpads;
//               F021_RunTestNumber_PMEX(testnum,maxtime,tmp_results);
//               F021_Ramp_TPAD(testpad,rampstart,rampstop,iProg,pgmMode);
//               F021_Set_TPADS(tcrnum,tcrmode);
//               TIME.Wait(stresstime);
//               F021_Ramp_TPAD(testpad,rampstop,rampstart,iProg,pgmMode);
//               F021_TurnOff_AllTpads;
//               Disable(s_pmexit);
//               F021_RunTestNumber(TNUM_ALWAYS_PASS,maxtime,spare_mstreal1,tmp_results);
//               TIME.Wait(tdelay);
//            } 
//         }   /*if stressena*/
//
//         if(pstbitmap)  
//         {
//            pwrupatvmax_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR0max Histogram B" + str1;
//                  str2 = str2 + " PstStress";
//                  cout << endl;
//                  cout << str2 << "  VCG @ " << vcg_force:-6:3 << " " << stresstime:-6:3 << endl;
//               } 
//               
//               testnum = TNUM_BANK_BCC_0S + (bank<<4);
//               TL_BitHistogram(BANKTYPE,testnum,vcg_start,vcg_stop,vcg_inc,iref_start,iref_stop,iref_inc,false,"");
//            } 
//         }   /*pstbitmap*/
//
//      }   /*for count*/
//      
//   }   /*if v_any_dev_active*/
//
//   Charz_TCR53_Stress2 = v_any_dev_active;
//} 
//   
//
//BoolS Charz_TCR54_Stress3()
//{
//   IntS site,bank,count;
//   IntS tcrnum,tcrnum_src,testnum;
//   TPModeType tcrmode,tcrmode_src;
//   PinM testpad,tp3,tp4;
//   option pgmMode;
//   FloatS maxtime,tdelay,tdelay2,ttimer1;
//   FloatS llim,ulim,llim3,ulim3,llim4,ulim4;
//   FloatM meas_value,meas_value2,tt_timer;
//   FloatM1D IRval(8),IRval2(8);
//   FloatM Istart,Istop,VforceArr;
//   FloatM VCGstart,VCGstop;
//   FloatS Iresol,VCGresol;
//   FloatS iref_start,iref_stop,iref_inc;
//   FloatS vcg_start,vcg_stop,vcg_inc;
//   FloatS stresstime,vegcs_force;
//   BoolM tmp_results;
//   StringS str1,str2,str3,str4,current_shell;
//   BoolS ersena,pgmena,prebitmap,pstbitmap,stressena;
//   VcornerType stressvcorner;
//   FloatS rampstart,rampstop,iProg;
//
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//      {
//         cout << endl;
//         cout << "**** Charz_TCR54_Stress3 ****" << endl;
//         cout << endl;
//      } 
//      
//      maxtime = GL_F021_MAXTIME;
//      tdelay  = 10ms;
//      tdelay2 = 100ms;
//
//      PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
//      ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vnom],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(tdelay);
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      tcrnum_src  = 54;
//      tcrmode_src = ProgMode;
//      tcrnum  = 128;
//      tcrmode = ProgMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode_src,tcrnum_src);
//
//      testpad     = FLTP1;
//      pgmMode     = S_VI_Mode;
//      rampstart   = TCR.TP1_VCharLo[TCRnum][TCRmode];
//      rampstop    = TCR.TP1_VCharHi[TCRnum][TCRmode];
//      iProg       = TCR.TP1_IRange[TCRnum][TCRmode];      
//      
//                  
//      for (count = 1;count <= 4;count++)
//      {
//         ersena = false;
//         pgmena = false;
//         prebitmap = true;
//         pstbitmap = true;
//         stressena = true;
//         
//         switch(count) {
//           case 1  :  
//                  stresstime = 1s;
//                   vegcs_force = 6.5V;
//                  pgmena = true;
//                  ersena = true;
//                   stressvcorner = VMN;
//                break; 
//           case 2  :  
//                  stresstime = 2s;
//                   vegcs_force = 6.5V;
//                   stressvcorner = VMN;
//                break; 
//           case 3  :  
//                  stresstime = 1s;
//                   vegcs_force = 6.5V;
//                  pgmena = true;
//                  ersena = true;
//                   stressvcorner = VMX;
//                break; 
//           case 4  :  
//                  stresstime = 2s;
//                   vegcs_force = 6.5V;
//                   stressvcorner = VMX;
//                break; 
//         }   /* case */
//
//         TCR.TP1_VRange[tcrnum][tcrmode] = vegcs_force;
//
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "*** STEP " << count:-4 << "***" << endl;
//         } 
//         
//           
//          /*+++ prog blk0 +++*/
//         if(pgmena)  
//         {
//            pwrupatvnom_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_PROG_SM + (bank<<4);
//               f021_runtestnumber(testnum,maxtime,spare_mstreal1,tmp_results);
//            } 
//         } 
//         
//          /*+++ erase +++*/
//         if(ersena)  
//         {
//            pwrupatvnom_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_ERS_NOPRECON + (bank<<4);
//               f021_runtestnumber(testnum,maxtime,spare_mstreal1,tmp_results);
//            } 
//         } 
//
//          /*+++ find ir0max/bitmap +++*/
//         Istart = 0uA;
//         Istop = 100uA;
//         VforceArr = 2.5V;
//         Iresol = 1uA;
//         VCGstart = 0V;
//         VCGstop = 0V;
//         VCGresol = 100mV;
//          /*bithistogram*/
//         iref_start = 0uA;
//         iref_stop  = 100uA;
//         iref_inc   = 1uA;
//         vcg_start  = 0V;
//         vcg_stop   = 0V;
//         vcg_inc    = 100mV;
//         
//         
//         if(prebitmap)  
//         {
//            pwrupatvmax_1;
//            if(tistdscreenprint)  
//               PrintHeaderParam(GL_PLELL_FORMAT);
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_BCC_1S + (bank<<4);
//               F021_BCC_BinSearch_TTR(testnum,Istart,Istop,Iresol,VforceArr,maxtime,spare_mstreal1,meas_value);
//               IRval[bank] = meas_value;
//               arraymulttrealvalue(meas_value2,meas_value,2,v_sites);
//               IRval2[bank] = meas_value2;  /*ir1min*2*/
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR1min_B" + str1;
//                  PrintResultParam(str2,testnum,tmp_results,0a,0a,meas_value,GL_PLELL_FORMAT);
//                  str2 = "IR1min*2_B" + str1;
//                  PrintResultParam(str2,testnum,tmp_results,0a,0a,meas_value2,GL_PLELL_FORMAT);
//               } 
//            } 
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR1min Histogram B" + str1;
//                  str2 = str2 + " PreStress";
//                  cout << endl;
//                  cout << str2 << endl;
//               } 
//               
//               testnum = TNUM_BANK_BCC_1S + (bank<<4);
//               TL_BitHistogram(BANKTYPE,testnum,vcg_start,vcg_stop,vcg_inc,iref_start,iref_stop,iref_inc,false,"");
//            } 
//         }   /*if prebitmap*/
//
//
//          /*+++ stress +++*/
//         if(stressena)  
//         {
//            if(stressvcorner==VMN)  
//            {
//               pwrupatvmin_1;
//               if(tistdscreenprint)  
//                  cout << "Stressing VMIN <<  VEGCS @ " << vegcs_force:-6:3 << " " << stresstime:-6:3 << endl;
//            }
//            else
//            {
//               pwrupatvmax_1;
//               if(tistdscreenprint)  
//                  cout << "Stressing VMAX <<  VEGCS @ " << vegcs_force:-6:3 << " " << stresstime:-6:3 << endl;
//            } 
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_REVTUNN_STRESS + (bank<<4);
//               F021_TurnOff_AllTpads;
//               F021_RunTestNumber_PMEX(testnum,maxtime,tmp_results);
//               F021_Ramp_TPAD(testpad,rampstart,rampstop,iProg,pgmMode);
//               F021_Set_TPADS(tcrnum,tcrmode);
//               TIME.Wait(stresstime);
//               F021_Ramp_TPAD(testpad,rampstop,rampstart,iProg,pgmMode);
//               F021_TurnOff_AllTpads;
//               Disable(s_pmexit);
//               F021_RunTestNumber(TNUM_ALWAYS_PASS,maxtime,spare_mstreal1,tmp_results);
//               TIME.Wait(tdelay);
//            } 
//         }   /*if stressena*/
//
//         if(pstbitmap)  
//         {
//            pwrupatvmax_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR1min Histogram B" + str1;
//                  str2 = str2 + " PstStress";
//                  cout << endl;
//                  cout << str2 << "  VEGCS @ " << vegcs_force:-6:3 << " " << stresstime:-6:3 << endl;
//               } 
//               
//               testnum = TNUM_BANK_BCC_1S + (bank<<4);
//               TL_BitHistogram(BANKTYPE,testnum,vcg_start,vcg_stop,vcg_inc,iref_start,iref_stop,iref_inc,false,"");
//            } 
//         }   /*pstbitmap*/
//
//      }   /*for count*/
//      
//   }   /*if v_any_dev_active*/
//
//   Charz_TCR54_Stress3 = v_any_dev_active;
//} 
//
// /*similar as Charz_TCR84_Stress4 except VBL=3.3v*/
//BoolS Charz_TCR84_Stress4b()
//{
//   IntS site,bank,count;
//   IntS tcrnum,tcrnum_src,testnum;
//   TPModeType tcrmode,tcrmode_src;
//   option testpad,tp3,tp4,pgmMode;
//   FloatS maxtime,tdelay,tdelay2,ttimer1;
//   FloatS llim,ulim,llim3,ulim3,llim4,ulim4;
//   FloatM meas_value,meas_value2,tt_timer;
//   FloatM1D IRval(8),IRval2(8);
//   FloatM Istart,Istop,VforceArr;
//   FloatM VCGstart,VCGstop;
//   FloatS Iresol,VCGresol;
//   FloatS iref_start,iref_stop,iref_inc;
//   FloatS vcg_start,vcg_stop,vcg_inc;
//   FloatS stresstime,vcg_force;
//   BoolM tmp_results;
//   StringS str1,str2,str3,str4,current_shell;
//   BoolS ersena,pgmena,prebitmap,pstbitmap,stressena;
//   VcornerType stressvcorner;
//   FloatS rampstart,rampstop,iProg;
//
//   if(v_any_dev_active)  
//   {
//      if(tistdscreenprint)  
//      {
//         cout << endl;
//         cout << "**** Charz_TCR84_Stress4b ****" << endl;
//         cout << endl;
//      } 
//      
//      maxtime = GL_F021_MAXTIME;
//      tdelay  = 10ms;
//      tdelay2 = 100ms;
//
//      PowerUpAtVnom(dcsetup_loosevnom,norm_fmsu);
//      ClockSet(S_CLOCK1A,false,GL_F021_PLLENA_SPEED1,
//                  v[vih_loose_osc_vnom],v[vil_loose]);
//      clockpinset(s_clk_1a,s_clock);
//      TIME.Wait(tdelay);
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      tcrnum_src  = 84;
//      tcrmode_src = ProgMode;
//      tcrnum  = 128;
//      tcrmode = ProgMode;
//
//      CloneTCR_To_TCR128(tcrmode,tcrmode_src,tcrnum_src);
//
//      for (count = 1;count <= 4;count++)
//      {
//         ersena = false;
//         pgmena = false;
//         prebitmap = true;
//         pstbitmap = true;
//         stressena = true;
//         
//         switch(count) {
//           case 1  :  
//                   stresstime = 1s;
//                   pgmena = true;
//                   ersena = true;
//                   stressvcorner = VMN;
//                break; 
//           case 2  :  
//                   stresstime = 2s;
//                   stressvcorner = VMN;
//                break; 
//           case 3  :  
//                   stresstime = 1s;
//                   pgmena = true;
//                   ersena = true;
//                   stressvcorner = VMX;
//                break; 
//           case 4  :  
//                   stresstime = 2s;
//                   stressvcorner = VMX;
//                break; 
//         }   /* case */
//
//         if(tistdscreenprint)  
//         {
//            cout << endl;
//            cout << "*** STEP " << count:-4 << "***" << endl;
//         } 
//         
//           
//          /*+++ erase +++*/
//         if(ersena)  
//         {
//            pwrupatvnom_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_ERS_NOPRECON + (bank<<4);
//               f021_runtestnumber(testnum,maxtime,spare_mstreal1,tmp_results);
//            } 
//         } 
//
//          /*+++ prog blk0 +++*/
//         if(pgmena)  
//         {
//            pwrupatvnom_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_PROG_SM + (bank<<4);
//               f021_runtestnumber(testnum,maxtime,spare_mstreal1,tmp_results);
//            } 
//         } 
//         
//          /*+++ find ir0max/bitmap +++*/
//         Istart = 0uA;
//         Istop = 30uA;
//         VforceArr = 2.5V;
//         Iresol = 1uA;
//         VCGstart = 0V;
//         VCGstop = 0V;
//         VCGresol = 100mV;
//          /*bithistogram*/
//         iref_start = 0uA;
//         iref_stop  = 30uA;
//         iref_inc   = 1uA;
//         vcg_start  = 0V;
//         vcg_stop   = 0V;
//         vcg_inc    = 100mV;
//         
//         
//         if(prebitmap)  
//         {
//            pwrupatvmax_1;
//            if(tistdscreenprint)  
//               PrintHeaderParam(GL_PLELL_FORMAT);
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_BCC_0S + (bank<<4);
//               F021_BCC_BinSearch_TTR(testnum,Istart,Istop,Iresol,VforceArr,maxtime,spare_mstreal1,meas_value);
//               IRval[bank] = meas_value;
//               arraymulttrealvalue(meas_value2,meas_value,0.5,v_sites);
//               IRval2[bank] = meas_value2;  /*ir1min*2*/
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR0max_B" + str1;
//                  PrintResultParam(str2,testnum,tmp_results,0a,0a,meas_value,GL_PLELL_FORMAT);
//                  str2 = "IR0maxHalf_B" + str1;
//                  PrintResultParam(str2,testnum,tmp_results,0a,0a,meas_value2,GL_PLELL_FORMAT);
//               } 
//            } 
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR0max Histogram B" + str1;
//                  str2 = str2 + " PreStress";
//                  cout << endl;
//                  cout << str2 << endl;
//               } 
//               
//               testnum = TNUM_BANK_BCC_0S + (bank<<4);
//               TL_BitHistogram(BANKTYPE,testnum,vcg_start,vcg_stop,vcg_inc,iref_start,iref_stop,iref_inc,false,"");
//            } 
//         }   /*if prebitmap*/
//
//
//          /*+++ stress +++*/
//         if(stressena)  
//         {
//#if $TP3_TO_TP5_PRESENT  
//            if(stressvcorner==VMN)  
//            {
//               pwrupatvmin_1;
//               if(tistdscreenprint)  
//                  cout << "Stressing VMIN @ " << stresstime:-6:3 << endl;
//            }
//            else
//            {
//               pwrupatvmax_1;
//               if(tistdscreenprint)  
//                  cout << "Stressing VMAX @ " << stresstime:-6:3 << endl;
//            } 
//            
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               testnum = TNUM_BANK_CSFG_STRESS + (bank<<4);
//               F021_TurnOff_AllTpads;
//               F021_RunTestNumber_PMEX(testnum,maxtime,tmp_results);
//               F021_Set_TPADS(tcrnum,tcrmode);
//               TIME.Wait(stresstime);
//               F021_TurnOff_AllTpads;
//               Disable(s_pmexit);
//               F021_RunTestNumber(TNUM_ALWAYS_PASS,maxtime,spare_mstreal1,tmp_results);
//               TIME.Wait(tdelay);
//            } 
//#endif
//         }   /*if stressena*/
//
//         if(pstbitmap)  
//         {
//            pwrupatvmax_1;
//            for (bank = 0;bank <= F021_Flash.MAXBANK;bank++)
//            {
//               if(tistdscreenprint)  
//               {
//                  writestring(str1,bank:-1);
//                  str2 = "IR0max Histogram B" + str1;
//                  str2 = str2 + " PstStress";
//                  cout << endl;
//                  cout << str2 << " " << stresstime:-6:3 << endl;
//               } 
//               
//               testnum = TNUM_BANK_BCC_0S + (bank<<4);
//               TL_BitHistogram(BANKTYPE,testnum,vcg_start,vcg_stop,vcg_inc,iref_start,iref_stop,iref_inc,false,"");
//            } 
//         }   /*pstbitmap*/
//
//      }   /*for count*/
//      
//   }   /*if v_any_dev_active*/
//
//   Charz_TCR84_Stress4b = v_any_dev_active;
//} 
//
//
//BoolS Test_SDD_func()
//{
//   StringS str1;
//   StringS firstpatt,lastpatt;
//   FloatS tfreq;
//
// /*   str1 := "TEST_SDD";
//    firstpatt := X16_SdADmxTr_H1_1;
//    lastpatt := X16_DevRecSDD_H1_1;
//    tfreq := FreqArr[DEBUG_GRP_1_OSCIN];
//    
//    MyPATTEST_COF(str1,firstpatt,lastpatt,tfreq,VMN);
//    MyPATTEST_COF(str1,firstpatt,lastpatt,tfreq,VNM);
//    MyPATTEST_COF(str1,firstpatt,lastpatt,tfreq,VMX);
// */
//   Test_SDD_func = v_any_dev_active;
//}   /* Test_SDD_func */
//
//
// /*Added TMSC TUNOX conditions/tests*/
//BoolS BankErs_PreTunOxide_TSMC_func()
//{
//   const IntS TESTID = 181; 
//
//   BoolM final_results,logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[TUNOXTSMCVT1][pre] and (MainBCC.PREVTYPE[TUNOXTSMCVT1]==TUNOXTSMCVT1)) or
//      (MainVT.ENA[TUNOXTSMCVT1][pre] and (MainVT.PREVTYPE[TUNOXTSMCVT1]==TUNOXTSMCVT1)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      tname = Ers_PreTunOx_TSMC_Test;
//      
//      if(v_any_dev_active)  
//      {
//         logsites = v_dev_active;
//         if(GL_DO_ERS_BY_SECTOR)  
//         {
//            testnum = TNUM_SECT_ERS_NOPRECON_SM;
//         }
//         else
//            testnum = TNUM_BANK_ERS_PRECON;
//         if(GL_DO_REDENA)  
//            testnum = testnum+TNUM_REDUNDENA;
//         F021_Erase_func(testnum,tname,final_results);
//          /*if(TI_FlashESDAEna) then
//              if(not arraycompareboolean(logsites,final_results,v_sites)) then
//              begin
//                 FLEsda.Tnum := TNUM_BANK_RDM1s;
//                 FLEsda.ImageNum := ESDA_IMG_BLK1;
//                 F021_CollectESDA(FLEsda.ImageNum);
//              end;*/
//      } 
//   } 
//   
//   BankErs_PreTunOxide_TSMC_func = v_any_dev_active;
//}   /* BankErs_PreTunOxide_TSMC_func */
//
//BoolS ErsOTP_PreTunOxide_TSMC_func()
//{
//   const IntS TESTID = 182; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   BoolS do_ena;
//
//   if((OtpBCC.ENA[TUNOXTSMCVT1][pre] and (OtpBCC.PREVTYPE[TUNOXTSMCVT1]==TUNOXTSMCVT1)) or
//      (OtpVT.ENA[TUNOXTSMCVT1][pre] and (OtpVT.PREVTYPE[TUNOXTSMCVT1]==TUNOXTSMCVT1)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)  
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//      testnum = TNUM_OTP_ERS_PRECON;
//      tname = ErsOTP_PreTunOx_TSMC_Test;
//      F021_Erase_func(testnum,tname,final_results);
//   } 
//   
//   ErsOTP_PreTunOxide_TSMC_func = v_any_dev_active;
//}   /* ErsOTP_PreTunOxide_TSMC_func */
//
//BoolS PreTunOxideVT1_TSMC_func()
//{
//   BoolM final_results;
//   BoolM logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if((MainBCC.ENA[TUNOXTSMCVT1][pre] and (MainBCC.PREVTYPE[TUNOXTSMCVT1]==TUNOXTSMCVT1)) or
//      (MainVT.ENA[TUNOXTSMCVT1][pre] and (MainVT.PREVTYPE[TUNOXTSMCVT1]==TUNOXTSMCVT1)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      logsites = v_dev_active;
//      
//      tdata   = BANKTYPE;
//      vtcat   = TUNOXTSMCVT1;
//      prepost = pre;
//      
//      tname = PreTunOxBCC1_TSMC_Test;
//      TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
//         {
//            FLEsda.ImageNum = ESDA_IMG_BLK1;
//            F021_CollectESDA(FLEsda.ImageNum);
//         } 
//   } 
//   
//   PreTunOxideVT1_TSMC_func = v_any_dev_active;
//}   /* PreTunOxideVT1_TSMC_func */
//
//BoolS PreTunOxideVT1OTP_TSMC_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if((OtpBCC.ENA[TUNOXTSMCVT1][pre] and (OtpBCC.PREVTYPE[TUNOXTSMCVT1]==TUNOXTSMCVT1)) or
//      (OtpVT.ENA[TUNOXTSMCVT1][pre] and (OtpVT.PREVTYPE[TUNOXTSMCVT1]==TUNOXTSMCVT1)))  
//      do_ena = true
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      tdata   = OTPTYPE;
//      vtcat   = TUNOXTSMCVT1;
//      prepost = pre;
//      
//      tname = PreTunOxBCC1OTP_TSMC_Test;
//      TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//   } 
//   
//   PreTunOxideVT1OTP_TSMC_func = v_any_dev_active;
//}   /* PreTunOxideVT1OTP_TSMC_func */
//
//BoolS TunOxide_TSMC_Stress_func()
//{
//   const IntS TESTID = 185; 
//
//   BoolM final_results;
//   StringS current_shell;
//   IntS tcrnum;
//   TPModeType tcrmode;
//   BoolS do_ena;
//
//   if(MainBCC.ENA[TUNOXTSMCVT1][post] or MainVT.ENA[TUNOXTSMCVT1][post])  
//      do_ena = true;
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVnom_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)  
//         F021_LoadFlashShell_func;
//      
//      GL_FLTESTID = TESTID;
//#if $TP3_TO_TP5_PRESENT  
//   tcrnum = 52;;
//#else
//   tcrnum = 108;
//#endif
//      tcrmode = CvfyMode;   /*actual mode is ProgMode*/
//      
//      F021_Stress_func(TNUM_BANK_TUNOX_STRESS,TunOx_Stress_TSMC_Test,tcrnum,tcrmode,final_results);
//   } 
//   
//   TunOxide_TSMC_Stress_func = v_any_dev_active;
//}   /* TunOxide_TSMC_Stress_func */
//
//BoolS PstTunOxideVT1_TSMC_func()
//{
//   BoolM final_results;
//   BoolM logsites;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if(MainBCC.ENA[TUNOXTSMCVT1][post] or MainVT.ENA[TUNOXTSMCVT1][post])  
//      do_ena = true;
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      logsites = v_dev_active;
//      
//      tdata   = BANKTYPE;
//      vtcat   = TUNOXTSMCVT1;
//      prepost = post;
//      
//      tname = PstTunOxBCC1_TSMC_Test;
//      TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"",final_results);
//      if(TI_FlashESDAEna)  
//         if(not arraycompareboolean(logsites,final_results,v_sites))  
//         {
//            FLEsda.ImageNum = ESDA_IMG_BLK1;
//            F021_CollectESDA(FLEsda.ImageNum);
//         } 
//   } 
//   
//   PstTunOxideVT1_TSMC_func = v_any_dev_active;
//}   /* PstTunOxideVT1_TSMC_func */
//
//BoolS PstTunOxideVT1OTP_TSMC_func()
//{
//   BoolM final_results;
//   StringS current_shell;
//   IntS testnum;
//   StringS tname;
//   IntS tdata,bgdata;
//   vttype vtcat;
//   prepostcorner prepost;
//   BoolS do_ena;
//
//   if(OtpBCC.ENA[TUNOXTSMCVT1][post] or OtpVT.ENA[TUNOXTSMCVT1][post])  
//      do_ena = true;
//   else
//      do_ena = false;
//
//   if(do_ena)  
//   {
//      PwrupAtVmax_1;
//      
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//      
//      tdata   = OTPTYPE;
//      vtcat   = TUNOXTSMCVT1;
//      prepost = post;
//      
//      tname = PstTunOxBCC1OTP_TSMC_Test;
//      TL_Run_BCCVT(tname,vtcat,prepost,not(IsMainArray),IsBcc,"",final_results);
//   } 
//   
//   PstTunOxideVT1OTP_TSMC_func = v_any_dev_active;
//}   /* PstTunOxideVT1OTP_TSMC_func */
//
//BoolS TunOxideVT1Delta_TSMC_func()
//{
//   BoolM final_results;
//   IntS pattype;
//   StringS tname;
//   BoolS dlogonly;
//
//   if(v_any_dev_active)  
//   {
//      if(MainBCC.ENA[TUNOXTSMCVT1][post])  
//      {
//         dlogonly = MainBCC.DLOGONLY[TUNOXTSMCVT1][post];
//         tname = TunOxBCC1DLT_TSMC_Test;
//         pattype = MainBCC.MEMCFG[TUNOXTSMCVT1];
//         F021_BCC_Delta_func(pattype,TUNOXTSMCVT1,tname,final_results,dlogonly);
//         
//          /*temporary use egfg testname for softbin tunoxtmsc*/
//         TestOpen(EGFG1_FailGood_Test);
//         ResultsRecordActive(final_results, S_NULL);
//         TestClose;
//      } 
//   } 
//   
//   TunOxideVT1Delta_TSMC_func = v_any_dev_active;
//}   /* TunOxideVT1Delta_TSMC_func */
//   
//BoolS TunOxideVT1DeltaOTP_TSMC_func()
//{
//   BoolM final_results;
//   IntS pattype;
//   StringS tname;
//   BoolS dlogonly;
//
//   if(OtpBCC.ENA[TUNOXTSMCVT1][post])  
//   {
//      dlogonly = OtpBCC.DLOGONLY[TUNOXTSMCVT1][post];
//      tname = TunOxBCC1DLTOTP_TSMC_Test;
//      pattype = OTPTYPE;
//      F021_BCC_Delta_func(pattype,TUNOXTSMCVT1,tname,final_results,dlogonly);
//   } 
//   
//   TunOxideVT1DeltaOTP_TSMC_func = v_any_dev_active;
//}   /* TunOxideVT1DeltaOTP_TSMC_func */
//   
//
TMResultM RdM0OTP_PreCSFG_func()
{
   const IntS TESTID = 204; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if((OtpBCC.ENA[CSFGVT0][pre] and (OtpBCC.PREVTYPE[CSFGVT0]==CSFGVT0)) or
      (OtpVT.ENA[CSFGVT0][pre] and (OtpVT.PREVTYPE[CSFGVT0]==CSFGVT0)))  
      do_ena = true;
   else
      do_ena = false;

#if $FL_USE_AUTO_FLOW==false  
   do_ena = false;
#endif
   
   if(do_ena)  
   {
//      PwrupAtVnom_1; //not yet implemented
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      if(GL_DO_FL_PBIST)  
         testnum = TNUM_PBIST_RDM0S+TNUM_TARGET_OTP;
      else
         testnum = TNUM_OTP_RDM0S;
      
      tname = "RdM0OTP_PreCSFG_Test";
      
      final_results=F021_Read_func(testnum,tname);
   } 
   
//   RdM0OTP_PreCSFG_func = v_any_dev_active;
   return(final_results);
}   /* RdM0OTP_PreCSFG_func */
   
   
TMResultM RdM0OTP_PreEGFG_LF4_func()
{
   const IntS TESTID = 204; 

   TMResultM final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";
   
   if((OtpBCC.ENA[EGFG4VT0][pre] and (OtpBCC.PREVTYPE[EGFG4VT0]==EGFG4VT0)) or
      (OtpVT.ENA[EGFG4VT0][pre] and (OtpVT.PREVTYPE[EGFG4VT0]==EGFG4VT0)))  
      do_ena = true;
   else
      do_ena = false;

#if $FL_USE_AUTO_FLOW==false  
   do_ena = false;
#endif

   if(do_ena)  
   {
//      PwrupAtVnom_1; //not yet implemented
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      if(GL_DO_FL_PBIST)  
         testnum = TNUM_PBIST_RDM0S+TNUM_TARGET_OTP;
      else
         testnum = TNUM_OTP_RDM0S;
      
      tname = "RdM0OTP_PreEGFG_LF4_Test";
      
      final_results=F021_Read_func(testnum,tname);
   } 
   
//   RdM0OTP_PreEGFG_LF4_func = v_any_dev_active;
   return(final_results);
}   /* RdM0OTP_PreEGFG_LF4_func */

TMResultM RdM0OTP_PreEGFG_LF3_func()
{
   const IntS TESTID = 204; 

   TMResultM  final_results;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   BoolS do_ena;
   Levels PS_Vnom = "PowerUpAtVmask";

   if((OtpBCC.ENA[EGFG3VT0][pre] and (OtpBCC.PREVTYPE[EGFG3VT0]==EGFG3VT0)) or
      (OtpVT.ENA[EGFG3VT0][pre] and (OtpVT.PREVTYPE[EGFG3VT0]==EGFG3VT0)))  
      do_ena = true;
   else
      do_ena = false;

   if(do_ena)  
   {
//      PwrupAtVnom_1;
      PS_Vnom.Execute();
      
      current_shell = "FlashShell";
      if(GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      if(GL_DO_FL_PBIST)  
         testnum = TNUM_PBIST_RDM0S+TNUM_TARGET_OTP;
      else
         testnum = TNUM_OTP_RDM0S;
      
      tname = "RdM0OTP_PreEGFG_LF3_Test";
      
      final_results=F021_Read_func(testnum,tname);
   } 
   
//   RdM0OTP_PreEGFG_LF3_func = v_any_dev_active;
   return(final_results);
}   /* RdM0OTP_PreEGFG_LF3_func */


TMResultM SenAmpNoise_Screen_func() {
   const IntS TESTID = 300; 

   TMResultM final_results;
   StringS current_shell;
   StringS tname;
   IntS tcrnum,tdata,ttarget;
   FloatS vcg;
   BoolS redundena,dopgm,do_ena;

   if (GL_BANKTYPE==FLESBANK)  
      do_ena = false;
   else
      do_ena = true;

   if (do_ena) {
      dopgm = false;
//    Charz_SenAmpNoise_RPC_EF(VMX,dopgm);
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      
      tcrnum  = 6;
      tdata   = TNUM_DATA_ECHK;
      ttarget = TNUM_TARGET_QUAD;
      vcg     = 0V;
      tname   = "SAMP_Screen_Test";
      redundena = false;
      dopgm = false;  // already pgm in new mp1 flow
      
//      final_results = SAMP_Noise_Screen_func(tname,tcrnum,tdata,ttarget,vcg,redundena,dopgm,0,0,0,"");
   }
   return(final_results);
   
// SenAmpNoise_Screen_func = v_any_dev_active;
}   // SenAmpNoise_Screen_func

TMResultM PreDRLRandCodeVT0Min_func() {
   const IntS TESTID = 275; 

   TMResultM final_results, test_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   vttype vtcat;
   prepostcorner prepost;
   BoolS save_redena;
   BoolS save_vtinter,save_bccpbist;
   BoolS charzena;
   IntS tcrnum;
   TPModeType tcrmode;
   FloatS vcg;
   StringS logstr,vstr;
   TMResultM tmp_results;
   Levels PS_Vmax = "PowerUpAtVmask";
   FloatM spare_mstreal1;

   PS_Vmax.Execute();
   
   F021_LoadFlashShell_func();
   RAM_Clear_SoftTrim_All();
   RAM_Clear_PMOS_SoftTrim();
   RAM_Clear_MailBox_Key();

   tmp_results = F021_RunTestNumber(TNUM_ALWAYS_PASS,1s,spare_mstreal1);
   
   GL_FLTESTID = TESTID;
   vtcat = RCODEVT0;
   prepost = pre;

   save_redena = GL_DO_REDENA;
   GL_DO_REDENA = false;
   save_vtinter = GL_DO_VT_USING_INTERNAL;
   // if using internal vt psa for random code then comment line below
   // GL_DO_VT_USING_INTERNAL := false;
   save_bccpbist = GL_DO_VT_MAIN_USING_PBIST;
   GL_DO_VT_MAIN_USING_PBIST = false;

// logsites = v_dev_active;
// final_results = v_dev_active;
   
   if (GL_DO_VT_FIRST) {
      tname = "PreDRLVT0Min_Test";
      final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      DLOG.AccumulateResults(final_results, tmp_results);
      tname = "PreDRLBCC0Max_Test";
      test_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
      DLOG.AccumulateResults(test_results, final_results);
   }
   else
   {
      tname = "PreDRLBCC0Max_Test";
      final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
      DLOG.AccumulateResults(final_results, tmp_results);
      tname = "PreDRLVT0Min_Test";
      test_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      DLOG.AccumulateResults(test_results, final_results);
   } 

   GL_DO_REDENA = save_redena;
   GL_DO_VT_USING_INTERNAL = save_vtinter;
   GL_DO_VT_MAIN_USING_PBIST = save_bccpbist;
   
   return(test_results);
}   // PreDRLRandCodeVT0Min_func
   
TMResultM PreDRLRandCodeVT1Max_func() {
   const IntS TESTID = 275; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   vttype vtcat;
   prepostcorner prepost;
   BoolS save_redena;
   BoolS save_vtinter,save_bccpbist;
   BoolS charzena;
   IntS tcrnum;
   TPModeType tcrmode;
   FloatS vcg;
   StringS logstr,vstr;
   BoolM tmp_results;

// PwrupAtVmax_1;
   
   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();
   
   GL_FLTESTID = TESTID;
   vtcat = RCODEVT1;
   prepost = pre;

   save_redena = GL_DO_REDENA;
   GL_DO_REDENA = false;
   save_vtinter = GL_DO_VT_USING_INTERNAL;
   GL_DO_VT_USING_INTERNAL = false;
   save_bccpbist = GL_DO_BCC_MAIN_USING_PBIST;
   GL_DO_BCC_MAIN_USING_PBIST = false;
   
// logsites = v_dev_active;
// final_results = v_dev_active;
   
   if (GL_DO_VT_FIRST)  {
      tname = "PreDRLVT1Max_Test";
      final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      tname = "PreDRLBCC1Min_Test";
      final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
   }
   else {
      tname = "PreDRLBCC1Min_Test";
      final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
      tname = "PreDRLVT1Max_Test";
      final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
   } 

   GL_DO_REDENA = save_redena;
   GL_DO_VT_USING_INTERNAL = save_vtinter;
   GL_DO_BCC_MAIN_USING_PBIST = save_bccpbist;
   return(final_results);
   
}   // PreDRLRandCodeVT1Max_func
   
//BoolS LPO_AutoTrim_func()
//{
//   IntS site;
//   BoolS dlogonly,retestena;
//   BoolM final_results,tmp_results;
//   BoolM savesites,alldisable;
//   BoolM restoresites,virginsites;
//   StringS current_shell;
//   StringS fl_tname;
//
//   if(GL_DO_LPO_TRIM and v_any_dev_active)  
//   {
//      pwrupatvnom_1;
//      current_shell = "FlashShell";
//      if(GL_PREVIOUS_SHELL != current_shell)        
//         F021_LoadFlashShell_func;
//
//      alldisable = false;
//      savesites = v_dev_active;
//      arrayxorboolean(virginsites,savesites,SITE_LPO_TRIMMED,v_sites);
//      arrayandboolean(virginsites,virginsites,savesites,v_sites);
//      arrayandboolean(restoresites,savesites,SITE_LPO_TRIMMED,v_sites);
//      retestena = false;
//
//      if(not arraycompareboolean(restoresites,alldisable,v_sites))  
//      {
//         devsetholdstates(virginsites);
//         retestena = true;
//      } 
//
//      if(v_any_dev_active)  
//      {
//         fl_tname = LPO_Trim_Test;
//         dlogonly = false;
//         F021_LPO_Trim_func(fl_tname,dlogonly,tmp_results);
//         arrayandboolean(virginsites,virginsites,v_dev_active,v_sites);
//      } 
//
//      if(retestena)  
//      {
//         arrayorboolean(final_results,restoresites,virginsites,v_sites);
//         arrayandboolean(final_results,final_results,savesites,v_sites);
//         devsetholdstates(final_results);
//      } 
//   } 
//   LPO_AutoTrim_func = v_any_dev_active;
//}   /* LPO_AutoTrim_func */
//
//
//
// /*custom code for Stellaris -- program SCPL into customer Otp & read psa chksum of written contents*/
//BoolS PgmOtpSCPL_ChkSum_func()
//{
//   const IntS TESTID = 257; 
//
//   BoolM final_results;
//   StringS tname;
//   IntS testnum;
//   StringS current_shell;
//   FlashCodeType ccodetype;
//   BoolS runena;
//
//#if $GL_USE_DMLED_RAMPMT  
//   runena = F021_RunCode.DO_RUNCODE_ENA[OtpSCPL];
//   
//   if(v_any_dev_active and runena)  
//   {
//      GL_FLTESTID = TESTID;
//      tname   = PgmOtpSCPL_Test;
//      ccodetype = OtpSCPL;
//      FlashCode_WR_EXE_func(tname,ccodetype,final_results);
//      GL_PREVIOUS_SHELL = "";
//   } 
//
//   runena = F021_RunCode.DO_RDPSA_ENA[OtpSCPL];
//   
//   if(v_any_dev_active and runena)  
//   {
//      tname   = ChksumOtpSCPL_Test;
//      ccodetype = OtpSCPL;
//      FlashCode_RdPsa_func(tname,ccodetype,final_results);
//   }    
//#endif
//
//   PgmOtpSCPL_Chksum_func = v_any_dev_active;
//}   /* PgmOtpSCPL_ChkSum_func */
//
// /* BEK 18Jun2011 Added for programming SCPL into OTP */
// /*overhauled initial function 20110620 JRR*/
//BoolS pgmotpscpl_func()
//
// {
//  BoolM final_results,logsites;
//  StringS tname;
//  FloatM tmp_FloatSarr;
//  IntS site,testnum;
//  FloatS ttimer1,ttimer2;
//  FloatM tt_timer;
//  StringS tmpstr1,tmpstr2,tmpstr3,tmpstr4;
//  StringM site_cof_inst_str;
//  FloatM FloatSval;
//  TWunit unitval;
//  
//  
// 
// 
//  PwrUpatVnom_1;
//  
//  testnum = 0x0;
//  tmpstr3 = "PGMSCPL";
//  tmpstr4 = "PGMSCPL_TT";
//  tname = pgmotpscpl_test;
//  
//   final_results =  v_dev_active;
//  
//  if(tistdscreenprint and ti_flashdebug)   
//     cout <<  tiwindow <<  "Programming SCPL into OTP..."  << endl;
//  
//  if(tistdscreenprint)   
//  {
//    cout << endl;
//    PrintHeaderBool(GL_PLELL_FORMAT);  
//  } 
//  
//  testopen( pgmotpscpl_test );
//  
//  if(TI_FlashCOFEna)  
//         F021_Init_COF_Inst_Str(site_cof_inst_str);
//  
//  timernstart(ttimer2);
//  
//  discard( f021_matchloopbypmu_ms_loader( fl_otp_loader, F021_PASSPIN, F021_DONEPIN,
//                                    F021_NDONEPIN, GL_F021_MAXTIME, 1, tmp_trealarr,
//                       final_results ) );
//  Disable(s_pmexit);
//                   
//  ttimer2 = timernread(ttimer2);
//  tt_timer = ttimer2;
//  TWTRealToRealMS(tt_timer,realval,unitval);
//  TWPDLDataLogRealVariable(tmpstr4, unitval,realval,TWMinimumData);
//  
//  if(tistdscreenprint)  
//  {
//     PrintResultBool(tmpstr3,testnum,final_results,GL_PLELL_FORMAT);
//     cout << tmpstr4 << ttimer2 << endl;
//     cout << endl;
//  } 
//   /*log failed test to tw*/
//    /*KChau 12/21/07 - determine if any site is failing to log to TW.*/
//  if(not ArrayCompareBoolean(logsites,final_results,v_sites))  
//  {
//     F021_Log_FailPat_To_TW(tmpstr3,final_results,tname);
//     
//     if(TI_FlashCOFEna)  
//        F021_Update_COF_Inst_Str(tmpstr3,site_cof_inst_str,final_results);
//  } 
//                   
//  clockstopfreerun( s_clock1a );
//
//  if tistdscreenprint and ti_flashdebug    
//   {
//    cout <<  tiwindow <<  "SCPL Results: "  << endl;
//    for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//     if v_dev_active[site]  
//      readramaddress( site, 0x80, 0x80 );
//   }   /* if tistdscreenprint then */
//  
//  DevSetHoldStates(final_results);
//  ResultsRecordActive(final_results, S_NULL);    
//
//  testclose;
//  
//  pgmotpscpl_func = v_any_dev_active;
//  
// }   /* pgmotpscpl_func */
// 
//BoolS PgmAnalogTrim( IntS addr) /*created for Analog Trims JRR*/
//{
//  FloatS maxtime;
//  FloatM tt_timer;
//  IntS testnum,arbaddr,arblength,
//  mailboxaddr,mailbox_data,site;
//  IntS msw_addr,lsw_addr,msw_length,
//  lsw_length,cnt;
//  BoolM final_results,logsites;
//  IntM msw_data,lsw_data;
//  IntS2D msw_str; /* :MANUAL FIX REQUIRED: array dimensions are : 0..15,1..NumSites */
//  IntS2D lsw_str; /* :MANUAL FIX REQUIRED: array dimensions are : 0..15,1..NumSites */
//  BoolS bcd_format,hexvalue;
//  IntS MB_WRFLAG,OVRNUMWORD;
//  FloatS ttimer1,ttimer2;
//  StringS tmpstr1,tmpstr2,tmpstr3,tmpstr4;
//  StringM site_cof_inst_str;
//  FloatM FloatSval;
//  TWunit unitval;
//  StringS tname;
//  StringS current_shell;
//
//
//   testnum     = 0x2000AA00;
//   mailboxaddr = 0x200;
//   msw_addr    =  addr >> 16; /*0x0210;*/
//   lsw_addr    =  addr & 0xffff; /*0x03C0;*/
//   msw_length  = 0x0;
//   lsw_length  = 0x40;  /*64 bytes*/
//   MB_WRFLAG   = 0x1234;
//   OVRNUMWORD  = 0x0020;
//   maxtime     = 5s;
//   bcd_format  = true;
//   hexvalue    = true;
//   tname       = analogtrimscpl_test;
//    final_results =  v_dev_active;
//   tmpstr4     = "PGMANATRIM_TT";
//   
//   PwrupAtVnom_1;
//   
//   current_shell = "FlashShell";
//   
// /*   if(GL_PREVIOUS_SHELL <> current_shell) then      */
//      F021_LoadFlashShell_func;
//   
//   if(tistdscreenprint)   
//   {
//    cout << endl;
//    PrintHeaderBool(GL_PLELL_FORMAT);  
//   } 
//  
//   if(TI_FlashCOFEna)  
//         F021_Init_COF_Inst_Str(site_cof_inst_str);
//  
//   timernstart(ttimer2);
//   testopen(tname);
//   
//   TL_SetARBADDR   (msw_addr,   lsw_addr   );
//   TL_SetARBLENGTH (msw_length, lsw_length );
//   
//   msw_data = MB_WRFLAG;
//   lsw_data = OVRNUMWORD;
//   WriteRamContentDec_32Bit(mailboxaddr,lsw_data,hexvalue,msw_data,hexvalue,bcd_format);
// 
//   
//   for cnt = 0x3c0 to 0x400 by 4 do
//    {
//     for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
//      {
//       msw_data[site] = scpltrim[cnt][site] >> 16;
//       lsw_data[site] = scpltrim[cnt][site] & 0xffff;
//      }   /* for site := 1 to v_sites do */
//     mailboxaddr = mailboxaddr + 0x4;
//     WriteRamContentDec_32Bit(mailboxaddr,msw_data,hexvalue,lsw_data,hexvalue,bcd_format);  /*temp flipped msw with lsw till Adam fixes shell JRR*/
//    }   /* for cnt := 0x3c0 to 0x400 by 4 do */
// 
//   reload_flashshell = false; /* added because analog trims can't have the shell reloaded or it will overwrite
//   the trim locations 0515012 JRR */
//   F021_RunTestNumber(testnum,maxtime,tt_timer,final_results);
//   Disable(s_pmexit);              
//   ttimer2 = timernread(ttimer2);
//   tt_timer = ttimer2;
//   TWTRealToRealMS(tt_timer,realval,unitval);
//   TWPDLDataLogRealVariable(tmpstr4, unitval,realval,TWMinimumData);
//   
//   if(tistdscreenprint)  
//   {
//     PrintResultBool(tmpstr3,testnum,final_results,GL_PLELL_FORMAT);
//     cout << tmpstr4 << ttimer2 << endl;
//     cout << endl;
//   } 
//   
//   if(not ArrayCompareBoolean(logsites,final_results,v_sites))  
//    {
//     F021_Log_FailPat_To_TW(tmpstr3,final_results,tname);
//     
//     if(TI_FlashCOFEna)  
//        F021_Update_COF_Inst_Str(tmpstr3,site_cof_inst_str,final_results);
//    } 
//   
//   DevSetHoldStates(final_results);
//   ResultsRecordActive(final_results, S_NULL);    
//
//   testclose;
//   
//   PgmAnalogTrim = v_any_dev_active;
//   
//}   /*PgmAnalogTrim*/
//
//
//BoolS SCPLCheckSum() /*created for Analog Trims JRR*/
//{
//  FloatS maxtime;
//  FloatM tt_timer;
//  IntS testnum,arbaddr,arblength,
//  mailboxaddr,mailbox_data,site;
//  IntS msw_addr,lsw_addr,msw_length,
//  lsw_length,cnt;
//  BoolM final_results,logsites;
//  IntM msw_data,lsw_data;
//  IntS2D msw_str; /* :MANUAL FIX REQUIRED: array dimensions are : 0..15,1..NumSites */
//  IntS2D lsw_str; /* :MANUAL FIX REQUIRED: array dimensions are : 0..15,1..NumSites */
//  BoolS bcd_format,hexvalue;
//  IntS MB_WRFLAG,OVRNUMWORD;
//  FloatS ttimer1,ttimer2;
//  StringS tmpstr1,tmpstr2,tmpstr3,tmpstr4;
//  StringM site_cof_inst_str;
//  FloatM FloatSval;
//  TWunit unitval;
//  StringS tname;
//  
//
//
//   testnum     = 0x4001A700;
//   mailboxaddr = 0x200;
//   msw_addr    = 0x0210;
//   lsw_addr    = 0x03C0;
//   msw_length  = 0x0;
//   lsw_length  = 0x40;  /*64 bytes*/
//   MB_WRFLAG   = 0x1234;
//   OVRNUMWORD  = 0x0002;
//   maxtime     = 5s;
//   bcd_format  = true;
//   hexvalue    = true;
//   tmpstr3 = "SCPLCHKSUM";
//  tmpstr4 = "SCPLCHKSUM_TT";
//   tname       = scpl_checksum_test;
//    final_results =  v_dev_active;
//   pwrupatvnom_1;
//   TIME.Wait(10mS);
//   F021_LoadFlashShell_func;  /*reload shell since the loader code is in RAM from SCPL programming JRR*/
//   
//   if(tistdscreenprint)   
//   {
//    cout << endl;
//    PrintHeaderBool(GL_PLELL_FORMAT);  
//   } 
//  
//   if(TI_FlashCOFEna)  
//         F021_Init_COF_Inst_Str(site_cof_inst_str);
//     
//   timernstart(ttimer2);
//   testopen(tname);
//   
//   msw_data = MB_WRFLAG;
//   lsw_data = OVRNUMWORD;
//   WriteRamContentDec_32Bit(mailboxaddr,lsw_data,hexvalue,msw_data,hexvalue,bcd_format);
//   if (TIDesignRev == "B")  
//   {
//     msw_data = 0x6bfe;  /*flipped for endianness, previous was 0xf08d JRR*/
//     lsw_data = 0x691f;  /*flipped for endianness previous was  0x7563 JRR*/
//   }
//   else if (TIDesignRev == "C")  
//   {
//      msw_data = 0x6c00;  /*flipped for endianness, previous was 0xf08d JRR*/
//      lsw_data = 0x7427;  /*flipped for endianness previous was  0x7563 JRR*/
//   } 
//   WriteRamContentDec_32Bit(0x204,lsw_data,hexvalue,msw_data,hexvalue,bcd_format);
//  
// 
//  
//   F021_RunTestNumber(testnum,maxtime,tt_timer,final_results);
//   Disable(s_pmexit);              
//   ttimer2 = timernread(ttimer2);
//   tt_timer = ttimer2;
//   TWTRealToRealMS(tt_timer,realval,unitval);
//   TWPDLDataLogRealVariable(tmpstr4, unitval,realval,TWMinimumData);
//
//   
//   if(tistdscreenprint)  
//   {
//     PrintResultBool(tmpstr3,testnum,final_results,GL_PLELL_FORMAT);
//     cout << tmpstr4 << ttimer2 << endl;
//     cout << endl;
//   } 
//   
//   if(not ArrayCompareBoolean(logsites,final_results,v_sites))  
//    {
//     F021_Log_FailPat_To_TW(tmpstr3,final_results,tname);
//     
//     if(TI_FlashCOFEna)  
//        F021_Update_COF_Inst_Str(tmpstr3,site_cof_inst_str,final_results);
//    } 
//   
//   DevSetHoldStates(final_results);
//   ResultsRecordActive(final_results, S_NULL);    
//
//   testclose;
//   
//   SCPLCheckSum = v_any_dev_active;
//   
//}   /*PgmAnalogTrim*/
//
// +++++ for catalog flow use only +++++
// #if $FL_USE_AUTO_FLOW=false then
// pgmchkodd main array no disturb for catalog flow
     
TMResultM PgmChkOdd_func() {
   const IntS TESTID = 271; 

   TMResultM final_results;
   StringS tname;
   IntS testnum;
   StringS current_shell;

//   PwrupAtVnom_1;

   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   tname   = "PgmChkO_Test";
   testnum = TNUM_BANK_PROG_OCHK;
   final_results = F021_Program_func(testnum,tname);
   
   return(final_results);
} 

// pgmchkodd semiOtp no disturb for catalog flow
TMResultM PgmChkOddOTP_func() {
   const IntS TESTID = 271; 

   TMResultM final_results;
   StringS tname;
   IntS testnum;
   StringS current_shell;

//   PwrupAtVnom_1;

   current_shell = "FlashShell";
   if(GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   tname   = "PgmChkOSemiOTP_Test";
   testnum = TNUM_OTP_PROG_OCHK_SEMI;
   final_results = F021_Program_func(testnum,tname);
   
   return(final_results);
} 

// iterated sector erase for catalog flow  
TMResultM IterSectErs_func() {
   const IntS TESTID = 271; 

   TMResultM final_results;
   StringS tname;
   IntS testnum;
   StringS current_shell;

//  PwrupAtVmin_1;  /*CHANGED: PwrupAtVmin_1 from PwrUpAtVnom as per steve comen request Jamal Sheikh modified Mon, Jan  9 2012 */

   current_shell = "FlashShell";
   if (GL_PREVIOUS_SHELL != current_shell)        
      F021_LoadFlashShell_func();

   GL_FLTESTID = TESTID;
   tname   = "IterSectErs_Test";
   testnum = TNUM_BANK_ERS_ITERSECTOR+TNUM_DATA_ECHK;  /*bkgrnd data was echk*/
   final_results = F021_Erase_func(testnum,tname);
   
   return(final_results);
}   // IterSectErs_func
   
// /*refresh Otp for catalog flow*/
//BoolS CatRefreshOTP_func()
//{
//   const IntS TESTID = 269; 
//
//   BoolM final_results,activesites;
//   StringS current_shell;
//   IntS testnum,site;
//   StringS tname;
//
//   PwrupAtVnom_1;
//
//   current_shell = "FlashShell";
//   if(GL_PREVIOUS_SHELL != current_shell)  
//      F021_LoadFlashShell_func;
//   
//   GL_FLTESTID = TESTID;
//   testnum = 0x70000000;  /*TNUM_OTP_REFRESH;*/
//   tname = CatRefreshOTP_Test;
//   
//   F021_Erase_func(testnum,tname,final_results);
//   
//   CatRefreshOTP_func = v_any_dev_active;
//}   /* CatRefreshOTP_func */
//#endif
// /*+++++++++++++++++++++++++++++++*/
  
// /*note: this PreDRLVT0Min is special function that do multi-testing for catalog & auto flow*/
// /*catalog flow: @mp1 -- not doing vt0, but do pgmchkodd main&semiotp, iterated secters, otprefresh*/
// /*              @mp3 -- do vt0 on oddchk*/
// /*auto flow: @mp1 -- do vt0 on evenchk*/
// /*           @mp2 -- do vt0 on oddchk*/
// /*           @mp3 -- do vt0 on random code*/
TMResultM PreDRLVT0Min_func() {
   const IntS TESTID = 275; 

   TMResultM final_results;
   TMResultM tmp_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS save_redena, IsBCC;
   BoolS save_vtpbist,save_bccpbist;
   BoolS charzena,runena,runrcode;
   IntS tcrnum;
   TPModeType tcrmode;
   FloatS vcg;
   StringS logstr,vstr;

#if $FL_USE_AUTO_FLOW==false  
   // @mp1 -- not doing vt0, but do pgmchkodd main&semiotp, iterated secters, otprefresh
   if (SelectedTITestType==MP1) {
      runena = false;
      runrcode = false;
      // discard(PgmChkOdd_func);
      // discard(PgmChkOddOTP_func);
      F021_LoadFlashShell_func();  // temp JRR
      TIME.Wait(5ms);
      IterSectErs_func();
      // discard(CatRefreshOTP_func); CHANGED: Removed this line as semi otp is removed
   }
   else {
      // @mp3 -- do vt0 on chkodd
      runena = MainBCC.ENA[CHKVT0][pre] or MainVT.ENA[CHKVT0][pre];
      runrcode = MainBCC.ENA[RCODEVT0][pre] or MainVT.ENA[RCODEVT0][pre];
   } 
#else
   runena = MainBCC.ENA[CHKVT0][pre] or MainVT.ENA[CHKVT0][pre];
   runrcode = MainBCC.ENA[RCODEVT0][pre] or MainVT.ENA[RCODEVT0][pre];
#endif

   if (runena) {
//    PwrupAtVmax_1;
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata = BANKTYPE;
      vtcat = CHKVT0;
      prepost = pre;
      
      save_redena = GL_DO_REDENA;
      GL_DO_REDENA = false;
      
      // KChau - place holder... uncomment these out if don"t want to use pbist
      // if(GL_DO_FL_PBIST) then
      // begin
      //    save_vtpbist := GL_DO_VT_MAIN_USING_PBIST;
      //    GL_DO_VT_MAIN_USING_PBIST := false;
      //    save_bccpbist := GL_DO_BCC_MAIN_USING_PBIST;
      //    GL_DO_BCC_MAIN_USING_PBIST := false;
      // end;
      
      // +++ added to collect bcc data with vcg=1.8v +++
      charzena = false;
      if (charzena)  {
         tcrnum = 6;
         tcrmode = ReadMode;
         CloneTCR_To_TCR128(tcrmode,tcrmode,tcrnum);
         vcg = 1.825V;
         TCR.TP1_VRange[tcrnum][tcrmode] = vcg;
         TCR.TP1_ULim[tcrnum][tcrmode]   = vcg;
         tname = "NULL_TestName";
         vstr = CONV.FloatToString(vcg);
         logstr = "Z_PreDRLBCC0_VCG" + vstr;
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,logstr);
         RestoreTCR_Fr_TCR128(tcrmode,tcrmode,tcrnum);
      }       
      
//    logsites = v_dev_active;
//    final_results = v_dev_active;
      
      if (GL_DO_VT_FIRST) {
         tname = "PreDRLVT0Min_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PreDRLBCC0Max_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         
      }
      else {
         tname = "PreDRLBCC0Max_Test";
         tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PreDRLVT0Min_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
      DLOG.AccumulateResults(final_results,tmp_results);
      
      // if(not arraycompareboolean(logsites,final_results,v_sites))  
      if (TI_FlashESDAEna)  {
         for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
            if ( final_results[*si] != TM_PASS ) {
               FLEsda.ImageNum = ESDA_IMG_DRL_VT0_PRE;
               F021_CollectESDA(FLEsda.ImageNum);
            }
         }
      }

      if (GL_DO_CHARZ_SAMP_ACCY) {
         if (GL_DO_CHARZ_SAMP_ACCY_COUNT==1) {
         // PwrupAtVnom_1;
            current_shell = "FlashShell";
            if (GL_PREVIOUS_SHELL != current_shell)        
               F021_LoadFlashShell_func();

            GL_DO_SAVE_SAMP_ACCY_DATA = true;
//            Charz_Run_IVT_SAMP_ACCY(CHKVT0);
            TL_SAMP_ACCY_IV(not IsBCC,"Z_SAACCY_IVT",true);
//            Charz_Run_BCC_SAMP_ACCY(CHKVT0);
            GL_DO_SAVE_SAMP_ACCY_DATA = false;
            TL_SAMP_ACCY_IV(IsBCC,"Z_SAACCY_BCC",true);
         }
         
         GL_DO_CHARZ_SAMP_ACCY_COUNT = GL_DO_CHARZ_SAMP_ACCY_COUNT+1;
         if(GL_DO_CHARZ_SAMP_ACCY_COUNT > GL_DO_CHARZ_SAMP_ACCY_SAMPLING)  
            GL_DO_CHARZ_SAMP_ACCY_COUNT = 1;
      } 
      
      GL_DO_REDENA = save_redena;
      
      // KChau - place holder...
      // if(GL_DO_FL_PBIST) then
      // begin
      //    GL_DO_VT_MAIN_USING_PBIST  := save_vtpbist;
      //    GL_DO_BCC_MAIN_USING_PBIST := save_bccpbist;
      // end;

   }   // if runena

   if (runrcode)  {
//      final_results = PreDRLRandCodeVT0Min_func();
   } 
   return(final_results);

}   // PreDRLVT0Min_func
   
// /*note: this PreDRLVT1Max is special function that do multi-testing for catalog & auto flow*/
// /*catalog flow: @mp1 -- do vt1 on 1s*/
// /*              @mp3 -- do vt1 on oddchk*/
// /*auto flow: @mp1 -- do vt1 on evenchk*/
// /*           @mp2 -- do vt1 on oddchk*/
// /*           @mp3 -- do vt1 on random code*/
TMResultM PreDRLVT1Max_func()
{
   const IntS TESTID = 276; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   IntS testnum;
   StringS tname;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS save_redena;
   BoolS save_vtpbist,save_bccpbist;
   BoolS runena,runrcode;

   runena = MainBCC.ENA[CHKVT1][pre] or MainVT.ENA[CHKVT1][pre];
   runrcode = MainBCC.ENA[RCODEVT1][pre] or MainVT.ENA[RCODEVT1][pre];

   if (runena) {
//      PwrupAtVmax_1;
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();
      
      GL_FLTESTID = TESTID;
      tdata = BANKTYPE;
      vtcat = CHKVT1;
      prepost = pre;
      
      save_redena = GL_DO_REDENA;
      GL_DO_REDENA = false;
      
      // KChau - place holder... uncomment these out if don"t want to use pbist
      // if(GL_DO_FL_PBIST) then
      // begin
      //    save_vtpbist := GL_DO_VT_MAIN_USING_PBIST;
      //    GL_DO_VT_MAIN_USING_PBIST := false;
      //    save_bccpbist := GL_DO_BCC_MAIN_USING_PBIST;
      //    GL_DO_BCC_MAIN_USING_PBIST := false;
      // end;

//      logsites = v_dev_active;
      save_vtpbist = GL_DO_VT_USING_INTERNAL;
      GL_DO_VT_USING_INTERNAL = false;
      
      if (GL_DO_VT_FIRST) {
         tname = "PreDRLVT1Max_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         tname = "PreDRLBCC1Min_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
//         if(not arraycompareboolean(logsites,final_results,v_sites))

         if (TI_FlashESDAEna) {
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
               if ( final_results[*si] != TM_PASS ) {
                  FLEsda.ImageNum = ESDA_IMG_DRL_VT1_PRE;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
            }
         }
      }
      else {
         tname = "PreDRLBCC1Min_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         tname = "PreDRLVT1Max_Test";
         final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
      } 
      
      GL_DO_VT_USING_INTERNAL = save_vtpbist;
      GL_DO_REDENA = save_redena;
      
       /*KChau - place holder...
        if(GL_DO_FL_PBIST) then
        begin
           GL_DO_VT_MAIN_USING_PBIST  := save_vtpbist;
           GL_DO_BCC_MAIN_USING_PBIST := save_bccpbist;
        end;
        ...*/
   }   /*if runena*/

   if (runrcode) {
      final_results = PreDRLRandCodeVT1Max_func();
   } 
   return(final_results);

}   /* PreDRLVT1Max_func */
   
TMResultM PstDRLVT0Min_func() {
   const IntS TESTID = 62; 

   TMResultM final_results;
   TMResultM tmp_results;
   BoolM logsites;
   StringS current_shell;
   StringS tname;
   BoolM savesites,activesites;
   BoolM disallsites;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS save_redena;
   BoolS charzena,runena,runrcode;
   IntS tcrnum;
   TPModeType tcrmode;
   FloatS vcg;
   StringS logstr,vstr;

   GL_FLTESTID = TESTID;
   runena = MainBCC.ENA[CHKVT0DRL][post] or MainVT.ENA[CHKVT0DRL][post];
   runrcode = MainBCC.ENA[RCODEVT0][post] or MainVT.ENA[RCODEVT0][post];
   
   if (runena)  {
//    PwrupAtVmax_1;
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();

//    savesites = v_dev_active;
//    disallsites = false;
      
//    ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//    ArrayAndboolean(activesites,activesites,savesites,v_sites);

//    if(not Arraycompareboolean(activesites,disallsites,v_sites))  
//       devsetholdstates(activesites);

      if (1) {
         tdata = BANKTYPE;
         vtcat = CHKVT0DRL;
         prepost = post;

         // +++ added to collect bcc data with vcg=1.8v +++
         charzena = false;
         if(charzena) {
            tcrnum = 6;
            tcrmode = ReadMode;
            CloneTCR_To_TCR128(tcrmode,tcrmode,tcrnum);
            vcg = 1.825V;
            TCR.TP1_VRange[tcrnum][tcrmode] = vcg;
            TCR.TP1_ULim[tcrnum][tcrmode]   = vcg;
            tname = "NULL_TestName";
            vstr = CONV.FloatToString(vcg);
            logstr = "Z_PstDRLBCC0_VCG" + vstr;
            tmp_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,logstr);
            RestoreTCR_Fr_TCR128(tcrmode,tcrmode,tcrnum);
         }       
   
//       logsites = v_dev_active;
//       final_results = v_dev_active;
         
         if (GL_DO_VT_FIRST)  {
            tname = "PstDRLVT0Min_Test";
            final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
            tname = "PstDRLBCC0Max_Test";
            final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         }
         else
         {
            tname = "PstDRLBCC0Max_Test";
            final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
            tname = "PstDRLVT0Min_Test";
            final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         } 

         if (TI_FlashESDAEna) {
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
               if ( final_results[*si] != TM_PASS ) {
                  FLEsda.ImageNum = ESDA_IMG_DRL_VT0_PST;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
            }
         }

//       ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//       ArrayAndboolean(activesites,activesites,savesites,v_sites);
//       devsetholdstates(activesites);
         DLOG.AccumulateResults(final_results, tmp_results);
      }
      else {
         if (tistdscreenprint)  
            cout << "All sites are retested -- Bypass PstDRLVT0Min_func" << endl;
      } 
   } 

   if (runrcode)  {
      final_results = PstDRLRandCodeVT0Min_func();
   }
   return(final_results);
   
}   // PstDRLVT0Min_func 

TMResultM PstDRLVT1Max_func() {
   const IntS TESTID = 64; 

   TMResultM final_results;
   BoolM logsites;
   StringS current_shell;
   StringS tname;
   BoolM savesites,activesites;
   BoolM disallsites;
   IntS tdata,bgdata;
   vttype vtcat;
   prepostcorner prepost;
   BoolS save_redena;
   BoolS runena,runrcode;

   GL_FLTESTID = TESTID;
   runena = MainBCC.ENA[CHKVT1DRL][post] or MainVT.ENA[CHKVT1DRL][post];
   runrcode = MainBCC.ENA[RCODEVT1][post] or MainVT.ENA[RCODEVT1][post];

   if (runena)  {
//    PwrupAtVmax_1;
      
      current_shell = "FlashShell";
      if (GL_PREVIOUS_SHELL != current_shell)        
         F021_LoadFlashShell_func();

//    savesites = v_dev_active;
//    disallsites = false;
      
//    ArrayXORboolean(activesites,savesites,GL_FLASH_RETEST,v_sites);
//    ArrayAndboolean(activesites,activesites,savesites,v_sites);

//    if(not Arraycompareboolean(activesites,disallsites,v_sites))  
//       devsetholdstates(activesites);

      if (1) {
         tdata = BANKTYPE;
         vtcat = CHKVT1DRL;
         prepost = post;

//       logsites = v_dev_active;
         save_redena = GL_DO_VT_USING_INTERNAL;
         GL_DO_VT_USING_INTERNAL = false;
         
         if (GL_DO_VT_FIRST)  {
            tname = "PstDRLVT1Max_Test";
            final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
            tname = "PstDRLBCC1Min_Test";
            final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
         }
         else
         {
            tname = "PstDRLBCC1Min_Test";
            final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,IsBcc,"");
            tname = "PstDRLVT1Max_Test";
            final_results = TL_Run_BCCVT(tname,vtcat,prepost,IsMainArray,not(IsBcc),"");
         } 

         if (TI_FlashESDAEna) {
            for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
               if ( final_results[*si] != TM_PASS ) {
                  FLEsda.ImageNum = ESDA_IMG_DRL_VT1_PST;
                  F021_CollectESDA(FLEsda.ImageNum);
               }
            }
         } 

         GL_DO_VT_USING_INTERNAL = save_redena;
         
//       ArrayXORboolean(activesites,GL_FLASH_RETEST,v_dev_active,v_sites);
//       ArrayAndboolean(activesites,activesites,savesites,v_sites);
//       devsetholdstates(activesites);
      }
      else {
         if (tistdscreenprint)  
            cout << "All sites are retested -- Bypass PstDRLVT1Max_func" << endl;
      } 
   } 
   
   if (runrcode) {
      final_results = PstDRLRandCodeVT1Max_func();
   } 
   return(final_results);
   
}   // PstDRLVT1Max_func
 
// {SAI}procedure Charz_EG_Bank_Leak; export;
// var
//    site,count,bank              : integer;
//    tcrnum,testnum,start_testnum : integer;
//    tcrmode                      : TPModeType;
//    testpad                      : STDVIPinType;
//    TP1Vforce,TP1Vstart,TP1Vstop : treal;
//    TP1Vstep  			: treal;
//    maxtime,tdelay,ttimer1       : treal;
//    llim,ulim                    : treal;
//    meas_value,tt_timer          : mstrealarray;
//    tmp_results                  : msboolarray;
//    labstr,twlabstr              : tistring80;
//    str1,str2,unitstr            : tistring80;
//    force_realval                : real;
//    unitlen,force_intval         : integer;
//    realval                      : MSRealArray;
//    unitval                      : TWunit;
// begin
//    if(v_any_dev_active) then
//    begin
//       maxtime := 2s;
//       tdelay  := 100ms;
//       
//       TP1Vstart  := 12.0V; 
//       TP1Vstop   := 14.0V; 
//       TP1Vstep   := 0.5V;
// 
//       tcrnum  := 23;  
//       tcrmode := ErsMode;
//       start_testnum := TNUM_BANK_EGS;
//       testpad := FLTP1;
// 
//       TCR.TP1_Ena[23] := true;
//       TCR.TP1_MeasType[23] := MeasCurrType;
//       TCR.TP1_VRange[23,ErsMode ] := EGS_VEG_LEAK_Ers;
//       TCR.TP1_IRange[23,ErsMode ] := 500uA{EGS_VEG_LEAK_Ers_ULim+93uA};
//       TCR.TP1_ULim[23,ErsMode ]   := 500uA{EGS_VEG_LEAK_Ers_ULim+93uA};
//       TCR.TP1_LLim[23,ErsMode ]   := EGS_VEG_LEAK_Ers_LLim-9uA;
//       TCR.TP1_FTime[23,ErsMode ]  := EGS_VEG_LEAK_TStress_Ers;
//       TCR.TP1_VCharLo[23,ErsMode ]:= {0V;} VHV_Ers_Target; {use for ramping}
//       TCR.TP1_VCharHi[23,ErsMode ]:= EGS_VEG_LEAK_Ers; {use for ramping}
//       TCR.TP2_Ena[tcrnum] := false;
//       TCR.TP3_Ena[tcrnum] := false;
//       TCR.TP4_Ena[tcrnum] := false;
//       TCR.TP5_Ena[tcrnum] := false;
//       TCR.TADC_Ena[tcrnum] := false;
//       
// 
//       ulim := TCR.TP1_ULim[tcrnum,tcrmode];
//       llim := TCR.TP1_LLim[tcrnum,tcrmode];
// 
//       timernstart(ttimer1);
//       
//       PowerupatVnom(dcsetup_loosevnom,norm_fmsu);
//       discard(F021_LoadFlashShell_func);
// 
//       PowerupatVmax(dcsetup_loosevmax,norm_fmsu);
//       clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//                v[vih_loose_osc_vmax],v[vil_loose]);
//       labstr := "EG_LEAK_VMX_";
// 
//       clockpinset(s_clk_1a,s_clock);
//       wait(2ms);
// 
//       for bank := 0 to F021_Flash.MAXBANK do
//       begin
//          testnum  := start_testnum+(bank<<4);
//                         
//          PrintHeaderParam(GL_PLELL_FORMAT);
//                
//           for TP1Vforce := TP1Vstart to TP1Vstop by TP1Vstep do
//           begin
//              TCR.TP1_VRange[tcrnum,tcrmode] := TP1Vforce;
//              F021_Set_TPADS(tcrnum,tcrmode);
//              
// 	     discard(F021_RunTestNumber_PMEX(testnum,maxtime,tmp_results));
//              wait(tdelay);
//              discard(F021_Meas_TPAD_PMEX(testpad,tcrnum,tcrmode,
//           	     llim,ulim,meas_value,tmp_results));
//              Disable(s_pmexit);
//              
//              GetTreal_Unit_Info(TP1Vforce,force_realval,unitlen,unitstr);
//              force_intval := trunc(force_realval*1000);
//              writestring(str1,force_intval:1);
//              twlabstr := concat(labstr,str1);
//              twlabstr := concat(twlabstr,"_B");
//              writestring(str1,bank:1);
//              twlabstr := concat(twlabstr,str1);
//              
//              TWTRealToRealMS(meas_value,realval,unitval);
//              TWPDLDatalogRealVariableMS(twlabstr,unitval,realval,TWMinimumData);
//              
//              PrintResultParam(twlabstr,testnum,tmp_results,llim,ulim,meas_value,GL_PLELL_FORMAT);
//           end; {for TP1Vforce}
//       end; {for bank}
//       
//       discard(f021_runtestnumber(tnum_always_pass,1s,spare_mstreal1,tmp_results));
//       F021_UnSet_TPADS(tcrnum);
//       ttimer1 := timernread(ttimer1);
//       Arraysettreal(tt_timer,ttimer1);
//       str2 := "Charz_EG_Bank_Leak_TT";
//       TWTRealToRealMS(tt_timer,realval,unitval);
//       TWPDLDatalogRealVariableMS(str2, unitval,realval,TWMinimumData);
// 
//       if(tistdscreenprint) then
//          writeln(tiwindow,str2," ",ttimer1);
//       
//    end; {if v_any_dev_active}
// end; { Charz_EG_Bank_Leak }
// *****/
//
// /*SAI}{SAI*/
// /*****
// procedure Charz_EG_Sect_Leak; export;
// const
//    OVRNUMWORD  = 0x0002;
//    MB_WRFLAG   = 0x1234;
// var
//    site,count,bank              : integer;
//    tcrnum,testnum,start_testnum : integer;
//    tcrmode                      : TPModeType;
//    testpad                      : STDVIPinType;
//    TP1Vforce,TP1Vstart,TP1Vstop : treal;
//    TP1Vstep  			: treal;
//    maxtime,tdelay,ttimer1       : treal;
//    llim,ulim                    : treal;
//    meas_value,tt_timer          : mstrealarray;
//    tmp_results                  : msboolarray;
//    labstr,twlabstr              : tistring80;
//    str1,str2,unitstr            : tistring80;
//    force_realval                : real;
//    unitlen,force_intval         : integer;
//    realval                      : MSRealArray;
//    unitval                      : TWunit;
//    msw_data,lsw_data            : msintarray;
//    hexvalue,bcd_format          : boolean;
//    addr_loc                     : integer;
//    SECT_ADDR,SECT_ADDR_MSW, SECT_ADDR_LSW : array[0..256] of integer;
//    sectnum                      : integer;
// begin
//    if(v_any_dev_active) then
//    begin
//       maxtime := 2s;
//       tdelay  := 100ms;
//       
//       TP1Vstart  := 12.0V; 
//       TP1Vstop   := 14.0V; 
//       TP1Vstep   := 0.5V;
// 
//       tcrnum  := 23;  
//       tcrmode := ErsMode;
//       start_testnum := 0x13120A00;
//       testpad := FLTP1;
// 
//       TCR.TP1_Ena[23] := true;
//       TCR.TP1_MeasType[23] := MeasCurrType;
//       TCR.TP1_VRange[23,ErsMode ] := EGS_VEG_LEAK_Ers;
//       TCR.TP1_IRange[23,ErsMode ] := 500uA{EGS_VEG_LEAK_Ers_ULim+93uA};
//       TCR.TP1_ULim[23,ErsMode ]   := 500uA{EGS_VEG_LEAK_Ers_ULim+93uA};
//       TCR.TP1_LLim[23,ErsMode ]   := EGS_VEG_LEAK_Ers_LLim-9uA;
//       TCR.TP1_FTime[23,ErsMode ]  := EGS_VEG_LEAK_TStress_Ers;
//       TCR.TP1_VCharLo[23,ErsMode ]:= {0V;} VHV_Ers_Target; {use for ramping}
//       TCR.TP1_VCharHi[23,ErsMode ]:= EGS_VEG_LEAK_Ers; {use for ramping}
//       TCR.TP2_Ena[tcrnum] := false;
//       TCR.TP3_Ena[tcrnum] := false;
//       TCR.TP4_Ena[tcrnum] := false;
//       TCR.TP5_Ena[tcrnum] := false;
//       TCR.TADC_Ena[tcrnum] := false;
//       
// 
//       ulim := TCR.TP1_ULim[tcrnum,tcrmode];
//       llim := TCR.TP1_LLim[tcrnum,tcrmode];
// 
//       timernstart(ttimer1);
//       
//       PowerupatVnom(dcsetup_loosevnom,norm_fmsu);
//       discard(F021_LoadFlashShell_func);
// 
//       PowerupatVmax(dcsetup_loosevmax,norm_fmsu);
//       clockset(s_clock1a,false,GL_F021_PLLENA_SPEED1,
//                v[vih_loose_osc_vmax],v[vil_loose]);
//       labstr := "EG_LEAK_VMX_";
// 
//       clockpinset(s_clk_1a,s_clock);
//       wait(2ms);
// 
// {SAI}
// F021_Flash.MAXSECT[0] := 255;
// F021_Flash.MAXSECT[1] :=  15;
// 
//       for bank := 0 to F021_Flash.MAXBANK do
//       begin
//        {for sectnum := 0 to F021_Flash.MAXSECT[bank] do}
//        for sectnum := F021_Flash.MAXSECT[bank] downto 0 do
//        begin
//        
// {SAI}
//      case bank of
//      0: begin
//        case sectnum of
//        0: begin
// 		SECT_ADDR[0] := 0x00000000;
// 		SECT_ADDR_MSW[0] := 0x0000;
// 		SECT_ADDR_LSW[0] := 0x0000;
// 	  end;
//   1..254: begin
// 	  	SECT_ADDR[sectnum] := SECT_ADDR[sectnum - 1] + 0x00000400;
// 	  	SECT_ADDR_MSW[sectnum] := ((SECT_ADDR[sectnum]&0xffff0000) >> 16)&0x0000ffff;
//           	SECT_ADDR_LSW[sectnum] := (SECT_ADDR[sectnum]&0x0000ffff);
// 	  end;
// 	  255: begin
// 		SECT_ADDR[0] := 0x00000000;
// 		SECT_ADDR_MSW[0] := 0x0000;
// 		SECT_ADDR_LSW[0] := 0x0000;
// 	  end;
//        end;
//        end;
//    1: begin
//       case sectnum of
//       0: begin
// 		SECT_ADDR[0] := 0x020f0000;
// 		SECT_ADDR_MSW[0] := 0x020f;
// 		SECT_ADDR_LSW[0] := 0x0000;
//          end;		
//    1..15: begin
// 		SECT_ADDR[sectnum] := SECT_ADDR[sectnum - 1] + 0x00000400;
// 		SECT_ADDR_MSW[sectnum] := ((SECT_ADDR[sectnum]&0xffff0000)>>16)&0x0000ffff;
// 		SECT_ADDR_LSW[0] := SECT_ADDR[sectnum] & 0x0000ffff;
// 	   end;     
//        end;{case sectnum}	     
//       end; 
//     end;{case bank}
//          testnum  := start_testnum;
// 
//          PrintHeaderParam(GL_PLELL_FORMAT);
//                
//           for TP1Vforce := TP1Vstart to TP1Vstop by TP1Vstep do
//           begin
//              
// 	     bcd_format := true;
//              hexvalue := true;
// 
// 	     addr_loc := ADDR_RAM_ARB_TGADDR;
//              ArraySetInteger(msw_data,SECT_ADDR_MSW[sectnum]);
//              ArraySetInteger(lsw_data,SECT_ADDR_LSW[sectnum]);
//              WriteRamContentDec_32Bit(addr_loc,lsw_data,hexvalue,msw_data,hexvalue,bcd_format);
// 	     {TL_SetARBADDR(SECT_ADDR_MSW,SECT_ADDR_LSW);}
// 
// 	     addr_loc := ADDR_RAM_ARB_TGLEN;
//              ArraySetInteger(msw_data,0x0010);
//              ArraySetInteger(lsw_data,0x0000);
//              WriteRamContentDec_32Bit(addr_loc,lsw_data,hexvalue,msw_data,hexvalue,bcd_format);
// 
//              addr_loc := ADDR_RAM_MAILBOX;
//              ArraySetInteger(msw_data,MB_WRFLAG);
//              ArraySetInteger(lsw_data,OVRNUMWORD);
//              WriteRamContentDec_32Bit(addr_loc,lsw_data,hexvalue,msw_data,hexvalue,bcd_format);
// 
//              ArraySetInteger(msw_data,0x0056);
//              ArraySetInteger(lsw_data,0x0004);
//              addr_loc := addr_loc+ADDR_RAM_INC;
//              WriteRamContentDec_32Bit(addr_loc,lsw_data,hexvalue,msw_data,hexvalue,bcd_format);
//            	     
//              ArraySetInteger(msw_data,0xFFFF);
//              ArraySetInteger(lsw_data,0xFFFF);
//              addr_loc := addr_loc+ADDR_RAM_INC;
//              WriteRamContentDec_32Bit(addr_loc,lsw_data,hexvalue,msw_data,hexvalue,bcd_format);
// 	     
//              ArraySetInteger(msw_data,0xFFFF);
//              ArraySetInteger(lsw_data,0xFFFF);
//              addr_loc := addr_loc+ADDR_RAM_INC;
//              WriteRamContentDec_32Bit(addr_loc,lsw_data,hexvalue,msw_data,hexvalue,bcd_format);
// 
//              ArraySetInteger(msw_data,0xFFFF);
//              ArraySetInteger(lsw_data,0xFFFF);
//              addr_loc := addr_loc+ADDR_RAM_INC;
//              WriteRamContentDec_32Bit(addr_loc,lsw_data,hexvalue,msw_data,hexvalue,bcd_format);
// 
//              ArraySetInteger(msw_data,0xFFFF);
//              ArraySetInteger(lsw_data,0xFFFF);
//              addr_loc := addr_loc+ADDR_RAM_INC;
//              WriteRamContentDec_32Bit(addr_loc,lsw_data,hexvalue,msw_data,hexvalue,bcd_format);
// 
//              ArraySetInteger(msw_data,0xFFFF);
//              ArraySetInteger(lsw_data,0xFFFF);
//              addr_loc := addr_loc+ADDR_RAM_INC;
//              WriteRamContentDec_32Bit(addr_loc,lsw_data,hexvalue,msw_data,hexvalue,bcd_format);
// 
//  {SAI}    {if(tistdscreenprint) then
//             for site := 1 to 1{v_sites} do
//                if(v_dev_active[site]) then
//                begin
//                   readramaddress(site,0,0xff);
//                   readramaddress(site,ADDR_RAM_ARB_TGADDR,(ADDR_RAM_ARB_TGADDR+ADDR_RAM_INC));
// 		  DumpRamMailbox;
//                end;}
//  {SAI} if(tistdscreenprint) then
//              for site := 7 to 7{v_sites} do
//                if(v_dev_active[site]) then
//                  readramaddress(site,ADDR_RAM_ARB_TGADDR,(ADDR_RAM_ARB_TGADDR+ADDR_RAM_INC));
// 	     		  
//              TCR.TP1_VRange[tcrnum,tcrmode] := TP1Vforce;
//              F021_Set_TPADS(tcrnum,tcrmode);
// 
// 	     discard(F021_RunTestNumber_PMEX(testnum,maxtime,tmp_results));
//              wait(tdelay);
//              discard(F021_Meas_TPAD_PMEX(testpad,tcrnum,tcrmode,
//           	     llim,ulim,meas_value,tmp_results));
//              Disable(s_pmexit);
//              
//              GetTreal_Unit_Info(TP1Vforce,force_realval,unitlen,unitstr);
//              force_intval := trunc(force_realval*1000);
//              writestring(str1,force_intval:1);
//              twlabstr := concat(labstr,str1);
//              twlabstr := concat(twlabstr,"_B");
//              writestring(str1,bank:1);
//              twlabstr := concat(twlabstr,str1);
//              twlabstr := concat(twlabstr,"S");
//              writestring(str1,sectnum:1);
//              twlabstr := concat(twlabstr,str1);
//              
//              TWTRealToRealMS(meas_value,realval,unitval);
//              TWPDLDatalogRealVariableMS(twlabstr,unitval,realval,TWMinimumData);
//              
//              PrintResultParam(twlabstr,testnum,tmp_results,llim,ulim,meas_value,GL_PLELL_FORMAT);
//           end; {for TP1Vforce}
// 	  end; {for sectnum}
//       end; {for bank}
//       
//       discard(f021_runtestnumber(tnum_always_pass,1s,spare_mstreal1,tmp_results));
//       F021_UnSet_TPADS(tcrnum);
//       ttimer1 := timernread(ttimer1);
//       Arraysettreal(tt_timer,ttimer1);
//       str2 := "Charz_EG_Bank_Leak_TT";
//       TWTRealToRealMS(tt_timer,realval,unitval);
//       TWPDLDatalogRealVariableMS(str2, unitval,realval,TWMinimumData);
// 
//       if(tistdscreenprint) then
//          writeln(tiwindow,str2," ",ttimer1);
//       
//    end; {if v_any_dev_active}
// end; { Charz_EG_Sect_Leak }
// *****/
//
