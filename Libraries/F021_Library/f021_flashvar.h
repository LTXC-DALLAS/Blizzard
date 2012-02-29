 /****************************************************************************/
 /*  A01 : Initial version of F021 Flash VLCT STD LIB.          KChau 10/09/09 */
 /*                                                                            */
 /*  A1.1 : Released with VT/BCC enable.                        KChau 11/10/09 */
 /*                                                                            */
 /*  A1.2 : Released with using new OTP format.                 KChau 11/19/09 */
 /*                                                                            */
 /*  A1.3 : Released with new OTP format with 8us ppw.          KChau 11/30/09 */
 /*                                                                            */
 /*  A1.4 : Released with Charz routines.                       KChau 12/18/09 */
 /*                                                                            */
 /*  A1.5 : Released for bug fix.                               KChau 01/21/10 */
 /*                                                                            */
 /*  A1.6 : Released with PMOS Trim.                            KChau 03/15/10 */
 /*                                                                            */
 /*  A1.7 : Released with Redundancy, fake repair, flash PBIST. KChau 04/09/10 */
 /*                                                                            */
 /*  B1.1 : Released to support C2000 and Stellaris platforms.  KChau 06/29/11 */
 /*                                                                            */
 /****************************************************************************/

#ifndef F021_FLASHVAR_H
#define F021_FLASHVAR_H

#include <Unison.h>
#include <f021_flashglobal.h>

extern      F021_FlashRec F021_Flash;
extern      F021_RunCodeRec F021_RunCode;
extern      F021_MBIRec F021_MBI;
extern      Flash_TCR_Rec TCR;
extern      Flash_ESDA_Rec FLEsda;
extern      FlashVTBCCRec MainVT,OtpVT;
extern      FlashVTBCCRec MainBCC,OtpBCC;
extern      FlashStressRec TPadSeq;

extern      IntM1D FL_TESTLOG_ARR; /* array dimensions were : 1..136,1..NumSites */
extern      IntM1D FL_SCRAM_CAPT_ARR; /* array dimensions were : 1..4096,1..NumSites */


extern      IntS GL_FLTESTID;
extern      BoolS TI_FLASHDEBUG_PRINT;

extern      StringS GL_VLC_LIBREV;
extern      IntM GL_SHELL_LIBREV;
extern      IntM GL_SHELL_TAPIREV;
extern      IntM GL_SHELL_FAPIREV;
extern      IntM GL_SHELL_CONFIGREV;
extern      IntM GL_SHELL_SUPPORTREV;

extern      BoolS GL_USE_RAMPMT_X64;
extern      BoolS GL_DO_ESDA_WITH_SCRAM, GL_DUMP_RAWESDA_TOFILE, GL_DO_SOURCE_WITH_SCRAM;
extern      BoolM GL_SITE_TO_ESDA;
extern      BoolM2D GL_BANK_TO_ESDA; /* array dimensions were : 0..7,0..15 */

extern      FloatS Main_Icmp10_Target, Main_Icmp10_LLim, Main_Icmp10_ULim;

extern      FloatS Aux_Iref_Target;
extern      FloatS Main_Iref_Target;
extern      FloatS AuxBG_VLLim;
extern      FloatS AuxBG_VULim;
extern      FloatS Aux_Iref_LLim;
extern      FloatS Aux_Iref_ULim;
extern      FloatS Main_Iref_LLim;
extern      FloatS Main_Iref_ULim;
extern      FloatS VDD5V0_Target;
extern      FloatS VDD5V0_LLim;
extern      FloatS VDD5V0_ULim;
extern      FloatS VDD5V1_Target;
extern      FloatS VDD5V1_LLim;
extern      FloatS VDD5V1_ULim;
extern      FloatS Vread01_LLim;
extern      FloatS Vread01_ULim;
extern      FloatS Vread23_LLim;
extern      FloatS Vread23_ULim;
extern      FloatS Vread45_LLim;
extern      FloatS Vread45_ULim;
extern      FloatS Vread67_LLim;
extern      FloatS Vread67_ULim;
extern      FloatS VppErs_Target;
extern      FloatS VppErs_LLim;
extern      FloatS VppErs_ULim;
extern      FloatS VppCmpt_Target;
extern      FloatS VppCmpt_LLim;
extern      FloatS VppCmpt_ULim;
extern      FloatS VppProg_Target;
extern      FloatS VppProg_LLim;
extern      FloatS VppProg_ULim;

extern      FloatS BG_tolerance;
extern      FloatS Iref_tolerance;

extern      FloatS IPMOS_Trim_Target, IPMOS_Trim_ULim, IPMOS_Trim_LLim, IPMOS_Trim_Toler;
extern      FloatS IrefRd_Trim_Target, IrefRd_Trim_ULim, IrefRd_Trim_LLim, IrefRd_Trim_Toler;
extern      FloatS IrefEv_Trim_Target, IrefEv_Trim_ULim, IrefEv_Trim_LLim, IrefEv_Trim_Toler;
extern      FloatS MainBG_Target, MainBG_ULim, MainBG_LLim;
extern      FloatS VHV_Prog_Target, VHV_Prog_ULim, VHV_Prog_LLim;
extern      FloatS VHV_Prog_SlopeCT_Target;
extern      FloatS VHV_Prog_SlopeCT_Toler, VSA5CT_Toler;
extern      FloatS VHV_Pvfy_Target, VHV_Pvfy_ULim, VHV_Pvfy_LLim;
extern      FloatS VHV_Ers_Target, VHV_Ers_ULim, VHV_Ers_LLim;
extern      FloatS VHVVregRef_Prog_Target, VHVVregRef_Prog_LLim, VHVVregRef_Prog_ULim;
extern      FloatS VHVVregRef_Pvfy_Target, VHVVregRef_Pvfy_LLim, VHVVregRef_Pvfy_ULim;
extern      FloatS VHVVregRef_Ers_Target, VHVVregRef_Ers_LLim, VHVVregRef_Ers_ULim;
extern      FloatS VHalfRef_Prog_Target, VHalfRef_Prog_LLim, VHalfRef_Prog_ULim;
extern      FloatS VHalfRef_Pvfy_Target, VHalfRef_Pvfy_LLim, VHalfRef_Pvfy_ULim;
extern      FloatS VHalfRef_Ers_Target, VHalfRef_Ers_LLim, VHalfRef_Ers_ULim;
extern      FloatS VHV_TADC_Prog_Target, VHV_TADC_Prog_LLim, VHV_TADC_Prog_ULim;
extern      FloatS VHV_TADC_Pvfy_Target, VHV_TADC_Pvfy_LLim, VHV_TADC_Pvfy_ULim;
extern      FloatS VHV_TADC_Ers_Target, VHV_TADC_Ers_LLim, VHV_TADC_Ers_ULim;
extern      FloatS VSL_Target, VSL_ULim, VSL_LLim;
extern      FloatS VSLNREF_Target, VSLNREF_ULim, VSLNREF_LLim;
extern      FloatS VSL_TADC_Target, VSL_TADC_ULim, VSL_TADC_LLim;
extern      FloatS VRead_Target, VRead_ULim, VRead_LLim,
     VRead_Target_VMIN, VRead_ULim_VMIN, VRead_LLim_VMIN,
     VRead_Target_VMAX, VRead_ULim_VMAX, VRead_LLim_VMAX;
extern      FloatS VReadNREF_Target, VReadNREF_ULim, VReadNREF_LLim;
extern      FloatS VRead_TADC_Target, VRead_TADC_ULim, VRead_TADC_LLim;
extern      FloatS VSA5_Read_Target, VSA5_Read_ULim, VSA5_Read_LLim;
extern      FloatS VSA5Pump_Read_Target, VSA5Pump_Read_ULim, VSA5Pump_Read_LLim;
extern      FloatS VSA5NREF_Read_Target, VSA5NREF_Read_ULim, VSA5NREF_Read_LLim;
extern      FloatS VSA5_TADC_Read_Target, VSA5_TADC_Read_ULim, VSA5_TADC_Read_LLim;
extern      FloatS VSA5_Prog_Target, VSA5_Prog_ULim, VSA5_Prog_LLim;
extern      FloatS VSA5Pump_Prog_Target, VSA5Pump_Prog_ULim, VSA5Pump_Prog_LLim;
extern      FloatS VSA5NREF_Prog_Target, VSA5NREF_Prog_ULim, VSA5NREF_Prog_LLim;
extern      FloatS VSA5_TADC_Prog_Target, VSA5_TADC_Prog_ULim, VSA5_TADC_Prog_LLim;
extern      FloatS VSA5_Pvfy_Target, VSA5_Pvfy_ULim, VSA5_Pvfy_LLim;
extern      FloatS VSA5Pump_Pvfy_Target, VSA5Pump_Pvfy_ULim, VSA5Pump_Pvfy_LLim;
extern      FloatS VSA5NREF_Pvfy_Target, VSA5NREF_Pvfy_ULim, VSA5NREF_Pvfy_LLim;
extern      FloatS VSA5_TADC_Pvfy_Target, VSA5_TADC_Pvfy_ULim, VSA5_TADC_Pvfy_LLim;
extern      FloatS VSA5_Ers_Target, VSA5_Ers_ULim, VSA5_Ers_LLim;
extern      FloatS VSA5Pump_Ers_Target, VSA5Pump_Ers_ULim, VSA5Pump_Ers_LLim;
extern      FloatS VSA5NREF_Ers_Target, VSA5NREF_Ers_ULim, VSA5NREF_Ers_LLim;
extern      FloatS VSA5_TADC_Ers_Target, VSA5_TADC_Ers_ULim, VSA5_TADC_Ers_LLim;
extern      FloatS VSA5_Evfy_Target, VSA5_Evfy_ULim, VSA5_Evfy_LLim;
extern      FloatS VSA5Pump_Evfy_Target, VSA5Pump_Evfy_ULim, VSA5Pump_Evfy_LLim;
extern      FloatS VSA5NREF_Evfy_Target, VSA5NREF_Evfy_ULim, VSA5NREF_Evfy_LLim;
extern      FloatS VSA5_TADC_Evfy_Target, VSA5_TADC_Evfy_ULim, VSA5_TADC_Evfy_LLim;
extern      FloatS VSA5_Cvfy_Target, VSA5_Cvfy_ULim, VSA5_Cvfy_LLim;
extern      FloatS VSA5Pump_Cvfy_Target, VSA5Pump_Cvfy_ULim, VSA5Pump_Cvfy_LLim;
extern      FloatS VSA5NREF_Cvfy_Target, VSA5NREF_Cvfy_ULim, VSA5NREF_Cvfy_LLim;
extern      FloatS VSA5_TADC_Cvfy_Target, VSA5_TADC_Cvfy_ULim, VSA5_TADC_Cvfy_LLim;
extern      FloatS VWL_Read_Target, VWL_Read_ULim, VWL_Read_LLim;
extern      FloatS VWLNREF_Read_Target, VWLNREF_Read_ULim, VWLNREF_Read_LLim;
extern      FloatS VWL_TADC_Read_Target, VWL_TADC_Read_ULim, VWL_TADC_Read_LLim;
extern      FloatS VWL_Prog_Target, VWL_Prog_ULim, VWL_Prog_LLim;
extern      FloatS VWLNREF_Prog_Target, VWLNREF_Prog_ULim, VWLNREF_Prog_LLim;
extern      FloatS VWL_TADC_Prog_Target, VWL_TADC_Prog_ULim, VWL_TADC_Prog_LLim;
extern      FloatS VWL_Pvfy_Target, VWL_Pvfy_ULim, VWL_Pvfy_LLim;
extern      FloatS VWLNREF_Pvfy_Target, VWLNREF_Pvfy_ULim, VWLNREF_Pvfy_LLim;
extern      FloatS VWL_TADC_Pvfy_Target, VWL_TADC_Pvfy_ULim, VWL_TADC_Pvfy_LLim;
extern      FloatS VWL_Ers_Target, VWL_Ers_ULim, VWL_Ers_LLim;
extern      FloatS VWLNREF_Ers_Target, VWLNREF_Ers_ULim, VWLNREF_Ers_LLim;
extern      FloatS VWL_TADC_Ers_Target, VWL_TADC_Ers_ULim, VWL_TADC_Ers_LLim;
extern      FloatS VWL_Evfy_Target, VWL_Evfy_ULim, VWL_Evfy_LLim;
extern      FloatS VWLNREF_Evfy_Target, VWLNREF_Evfy_ULim, VWLNREF_Evfy_LLim;
extern      FloatS VWL_TADC_Evfy_Target, VWL_TADC_Evfy_ULim, VWL_TADC_Evfy_LLim;
extern      FloatS VWL_Cvfy_Target, VWL_Cvfy_ULim, VWL_Cvfy_LLim;
extern      FloatS VWLNREF_Cvfy_Target, VWLNREF_Cvfy_ULim, VWLNREF_Cvfy_LLim;
extern      FloatS VWL_TADC_Cvfy_Target, VWL_TADC_Cvfy_ULim, VWL_TADC_Cvfy_LLim;
extern      FloatS VCG2P5_Read_Target, VCG2P5_Read_ULim, VCG2P5_Read_LLim;
extern      FloatS VCG2P5NREF_Read_Target, VCG2P5NREF_Read_ULim, VCG2P5NREF_Read_LLim;
extern      FloatS VCG2P5_TADC_Read_Target, VCG2P5_TADC_Read_ULim, VCG2P5_TADC_Read_LLim;
extern      FloatS VCG2P5_Prog_Target, VCG2P5_Prog_ULim, VCG2P5_Prog_LLim;
extern      FloatS VCG2P5NREF_Prog_Target, VCG2P5NREF_Prog_ULim, VCG2P5NREF_Prog_LLim;
extern      FloatS VCG2P5_TADC_Prog_Target, VCG2P5_TADC_Prog_ULim, VCG2P5_TADC_Prog_LLim;
extern      FloatS VCG2P5_Pvfy_Target, VCG2P5_Pvfy_ULim, VCG2P5_Pvfy_LLim;
extern      FloatS VCG2P5NREF_Pvfy_Target, VCG2P5NREF_Pvfy_ULim, VCG2P5NREF_Pvfy_LLim;
extern      FloatS VCG2P5_TADC_Pvfy_Target, VCG2P5_TADC_Pvfy_ULim, VCG2P5_TADC_Pvfy_LLim;
extern      FloatS VCG2P5_Ers_Target, VCG2P5_Ers_ULim, VCG2P5_Ers_LLim;
extern      FloatS VCG2P5NREF_Ers_Target, VCG2P5NREF_Ers_ULim, VCG2P5NREF_Ers_LLim;
extern      FloatS VCG2P5_TADC_Ers_Target, VCG2P5_TADC_Ers_ULim, VCG2P5_TADC_Ers_LLim;
extern      FloatS VCG2P5_Evfy_Target, VCG2P5_Evfy_ULim, VCG2P5_Evfy_LLim;
extern      FloatS VCG2P5NREF_Evfy_Target, VCG2P5NREF_Evfy_ULim, VCG2P5NREF_Evfy_LLim;
extern      FloatS VCG2P5_TADC_Evfy_Target, VCG2P5_TADC_Evfy_ULim, VCG2P5_TADC_Evfy_LLim;
extern      FloatS VCG2P5_Cvfy_Target, VCG2P5_Cvfy_ULim, VCG2P5_Cvfy_LLim;
extern      FloatS VCG2P5NREF_Cvfy_Target, VCG2P5NREF_Cvfy_ULim, VCG2P5NREF_Cvfy_LLim;
extern      FloatS VCG2P5_TADC_Cvfy_Target, VCG2P5_TADC_Cvfy_ULim, VCG2P5_TADC_Cvfy_LLim;
extern      FloatS VINH_Read_Target, VINH_Read_ULim, VINH_Read_LLim;
extern      FloatS VINH_Target_VMIN, VINH_ULim_VMIN, VINH_LLim_VMIN, VINH_Target_VMAX, VINH_ULim_VMAX, VINH_LLim_VMAX;
extern      FloatS VINHNREF_Read_Target, VINHNREF_Read_ULim, VINHNREF_Read_LLim;
extern      FloatS VINH_TADC_Read_Target, VINH_TADC_Read_ULim, VINH_TADC_Read_LLim;
extern      FloatS VINH_Prog_Target, VINH_Prog_ULim, VINH_Prog_LLim;
extern      FloatS VINHNREF_Prog_Target, VINHNREF_Prog_ULim, VINHNREF_Prog_LLim;
extern      FloatS VINH_TADC_Prog_Target, VINH_TADC_Prog_ULim, VINH_TADC_Prog_LLim;
extern      FloatS VINH_Pvfy_Target, VINH_Pvfy_ULim, VINH_Pvfy_LLim;
extern      FloatS VINHNREF_Pvfy_Target, VINHNREF_Pvfy_ULim, VINHNREF_Pvfy_LLim;
extern      FloatS VINH_TADC_Pvfy_Target, VINH_TADC_Pvfy_ULim, VINH_TADC_Pvfy_LLim;
extern      FloatS VINH_Ers_Target, VINH_Ers_ULim, VINH_Ers_LLim;
extern      FloatS VINHNREF_Ers_Target, VINHNREF_Ers_ULim, VINHNREF_Ers_LLim;
extern      FloatS VINH_TADC_Ers_Target, VINH_TADC_Ers_ULim, VINH_TADC_Ers_LLim;
extern      FloatS VINH_Evfy_Target, VINH_Evfy_ULim, VINH_Evfy_LLim;
extern      FloatS VINHNREF_Evfy_Target, VINHNREF_Evfy_ULim, VINHNREF_Evfy_LLim;
extern      FloatS VINH_TADC_Evfy_Target, VINH_TADC_Evfy_ULim, VINH_TADC_Evfy_LLim;
extern      FloatS VINH_Cvfy_Target, VINH_Cvfy_ULim, VINH_Cvfy_LLim;
extern      FloatS VINHNREF_Cvfy_Target, VINHNREF_Cvfy_ULim, VINHNREF_Cvfy_LLim;
extern      FloatS VINH_TADC_Cvfy_Target, VINH_TADC_Cvfy_ULim, VINH_TADC_Cvfy_LLim;
extern      FloatS VHV2XPump_Prog_Target, VHV2XPump_Prog_ULim, VHV2XPump_Prog_LLim;
extern      FloatS VHV2XPump_TADC_Prog_Target, VHV2XPump_TADC_Prog_ULim, VHV2XPump_TADC_Prog_LLim;


extern      FloatS VHV_VStress_Prog, VHV_VStress_Pvfy, VHV_VStress_Ers;
extern      FloatS VHV_TStress_Prog, VHV_TStress_Pvfy, VHV_TStress_Ers;
extern      FloatS VHV_Leak_Target,VHV_Leak_ULim,VHV_Leak_LLim;

extern      FloatS VReadBUF_Prog_Target, VReadBUF_Prog_ULim, VReadBUF_Prog_LLim,
     VReadBUF_Pvfy_Target, VReadBUF_Pvfy_ULim, VReadBUF_Pvfy_LLim;
extern      FloatS Bank_Iref_Read_Target, Bank_Iref_Read_ULim, Bank_Iref_Read_LLim,
     Bank_Iref_Pvfy_Target, Bank_Iref_Pvfy_ULim, Bank_Iref_Pvfy_LLim,
     Bank_Iref_Evfy_Target, Bank_Iref_Evfy_ULim, Bank_Iref_Evfy_LLim, Bank_Iref_Evfy_Target_EMU, Bank_Iref_Evfy_ULim_EMU, Bank_Iref_Evfy_LLim_EMU,
     Bank_Iref_Cvfy_Target, Bank_Iref_Cvfy_ULim, Bank_Iref_Cvfy_LLim,
     Bank_Iref_VCG_Read, Bank_Iref_VCG_Pvfy, Bank_Iref_VCG_Evfy, Bank_Iref_VCG_Cvfy,
     Bank_Iref_VBL_Read, Bank_Iref_VBL_Pvfy, Bank_Iref_VBL_Evfy, Bank_Iref_VBL_Cvfy;
extern      FloatS Bank_Iref_RDM0_Target, Bank_Iref_RDM0_ULim, Bank_Iref_RDM0_LLim;
extern      FloatS Bank_Iref_RDM1_Target, Bank_Iref_RDM1_ULim, Bank_Iref_RDM1_LLim;
extern      FloatS Bank_IPMOS_Read_Target, Bank_IPMOS_Read_ULim, Bank_IPMOS_Read_LLim,
     Bank_IPMOS_Pvfy_Target, Bank_IPMOS_Pvfy_ULim, Bank_IPMOS_Pvfy_LLim,
     Bank_IPMOS_Evfy_Target, Bank_IPMOS_Evfy_ULim, Bank_IPMOS_Evfy_LLim,
     Bank_IPMOS_Cvfy_Target, Bank_IPMOS_Cvfy_ULim, Bank_IPMOS_Cvfy_LLim,
     Bank_IPMOS_VCG_Read, Bank_IPMOS_VCG_Pvfy, Bank_IPMOS_VCG_Evfy, Bank_IPMOS_VCG_Cvfy,
     Bank_IPMOS_VBL_Read, Bank_IPMOS_VBL_Pvfy, Bank_IPMOS_VBL_Evfy, Bank_IPMOS_VBL_Cvfy;
extern      FloatS Bank_IPMOS_Prog_Target, Bank_IPMOS_Prog_ULim, Bank_IPMOS_Prog_LLim,
     Bank_IPMOS_VBL_Prog, Bank_IPMOS_VCG_Prog;
extern      FloatS Bank_IPMOS_Ers_Target, Bank_IPMOS_Ers_ULim, Bank_IPMOS_Ers_LLim,
     Bank_IPMOS_ErsPst_ULim,Bank_IPMOS_ErsPst_LLim,
     Bank_IPMOS_VBL_Ers, Bank_IPMOS_VCG_Ers;
extern      FloatS IPMOS_Adaptive_Target, RefArr_Ers_Adaptive_VStart, RefArr_Ers_Adaptive_VStop, RefArr_Ers_Adaptive_RESOL, RefArr_Ers_Adaptive_PWIDTH;
extern      FloatS Bank_Internal_Iref_VBL, Bank_Internal_IPMOS_VBL;

extern      FloatS Bank_RefArr_VEG_Ers, Bank_RefArr_VEG_IMAX_Ers, Bank_RefArr_VEG_Ers_PWidth;
extern      FloatS SA_Iref_BLLoad_Read_Target, SA_Iref_BLLoad_Read_ULim, SA_Iref_BLLoad_Read_LLim, SA_Iref_VBLLoad_Read;
extern      FloatS SA_Iref_BLLoadDis_Read_Target, SA_Iref_BLLoadDis_Read_ULim, SA_Iref_BLLoadDis_Read_LLim, SA_Iref_VBLLoadDis_Read;
extern      FloatS IVWLDRV_Prog_Target, IVWLDRV_Prog_LLim, IVWLDRV_Prog_ULim, IVWLDRV_Prog;
extern      FloatS WLS_VWL_LEAK_Prog_Target, WLS_VWL_LEAK_Prog_ULim, WLS_VWL_LEAK_Prog_LLim, WLS_VWL_LEAK_Prog, WLS_VWL_LEAK_TStress_Prog;
extern      FloatS BLS_VBL_LEAK_Prog_Target, BLS_VBL_LEAK_Prog_ULim, BLS_VBL_LEAK_Prog_LLim, BLS_VBL_LEAK_Prog, BLS_VBL_LEAK_TStress_Prog;
extern      FloatS BLS_VBL_LEAK_Prog_ULim_Retest, BLS_VBL_LEAK_Prog_LLim_Retest;
extern      FloatS CGS_VCG_LEAK_Prog_Target, CGS_VCG_LEAK_Prog_ULim, CGS_VCG_LEAK_Prog_LLim, CGS_VCG_LEAK_Prog, CGS_VCG_LEAK_TStress_Prog;
extern      FloatS CGEG_VCG_LEAK_Pvfy_Target, CGEG_VCG_LEAK_Pvfy_ULim, CGEG_VCG_LEAK_Pvfy_LLim, CGEG_VCG_LEAK_Pvfy, CGEG_VCG_LEAK_TStress_Pvfy, CGEG_VCG_LEAK_Pvfy_Delta;
extern      FloatS EGCSS_VEGCS_LEAK_Prog_Target, EGCSS_VEGCS_LEAK_Prog_ULim, EGCSS_VEGCS_LEAK_Prog_LLim, EGCSS_VEGCS_LEAK_Prog, EGCSS_VEGCS_LEAK_TStress_Prog;
extern      FloatS EGS_VEG_LEAK_Ers_Target, EGS_VEG_LEAK_Ers_ULim, EGS_VEG_LEAK_Ers_LLim, EGS_VEG_LEAK_Ers, EGS_VEG_LEAK_TStress_Ers;

extern      FloatS RevTunnel_VEGCS_Prog, RevTunnel_VEGCS_IMAX_Prog, RevTunnel_VEGCS_TStress_Prog,
     RevTunnel_VBL_Prog, RevTunnel_VBL_IMAX_Prog, RevTunnel_VBL_TStress_Prog;
extern      FloatS PunchThru_VEGCS_Pvfy, PunchThru_VEGCS_IMAX_Pvfy, PunchThru_VEGCS_TStress_Pvfy,
     PunchThru_VBL_Pvfy, PunchThru_VBL_IMAX_Pvfy, PunchThru_VBL_TStress_Pvfy;
extern      FloatS ThinOxide_VEGCS_Ers, ThinOxide_VEGCS_IMAX_Ers, ThinOxide_VEGCS_TStress_Ers,
     ThinOxide_VBL_Ers, ThinOxide_VBL_IMAX_Ers, ThinOxide_VBL_TStress_Ers;

extern      FloatS TunOxide_VCG_Prog, TunOxide_VCG_IMAX_Prog, TunOxide_VCG_TStress_Prog,
     TunOxide_VBL_Prog, TunOxide_VBL_IMAX_Prog, TunOxide_VBL_TStress_Prog;
extern      FloatS ONO_VCG_Pvfy, ONO_VCG_IMAX_Pvfy, ONO_VCG_TStress_Pvfy,
     ONO_VBL_Pvfy, ONO_VBL_IMAX_Pvfy, ONO_VBL_TStress_Pvfy;

extern      FloatS PgmFF_VCG_Prog, PgmFF_VCG_IMAX_Prog, PgmFF_VCG_TStress_Prog,
     PgmFF_VEGCS_Prog, PgmFF_VEGCS_IMAX_Prog, PgmFF_VEGCS_TStress_Prog,
     PgmFF_VBL_Prog, PgmFF_VBL_IMAX_Prog, PgmFF_VBL_TStress_Prog,
     PgmFF_VWL_Prog, PgmFF_VWL_IMAX_Prog, PgmFF_VWL_TStress_Prog;

extern      FloatS FGWL_VCG_Pvfy, FGWL_VCG_IMAX_Pvfy, FGWL_VCG_TStress_Pvfy,
     FGWL_VEGCS_Pvfy, FGWL_VEGCS_IMAX_Pvfy, FGWL_VEGCS_TStress_Pvfy,
     FGWL_VBL_Pvfy, FGWL_VBL_IMAX_Pvfy, FGWL_VBL_TStress_Pvfy,
     FGWL_VWL_Pvfy, FGWL_VWL_IMAX_Pvfy, FGWL_VWL_TStress_Pvfy;

extern      FloatS TunOx_VCG_Evfy, TunOx_VCG_IMAX_Evfy, TunOx_VCG_TStress_Evfy,
     TunOx_VEGCS_Evfy, TunOx_VEGCS_IMAX_Evfy, TunOx_VEGCS_TStress_Evfy, TunOx_VEGCS_Cvfy,
     TunOx_VBL_Evfy, TunOx_VBL_IMAX_Evfy, TunOx_VBL_TStress_Evfy,
     TunOx_VWL_Evfy, TunOx_VWL_IMAX_Evfy, TunOx_VWL_TStress_Evfy;

extern      FloatS CSFG_VCG_Ers, CSFG_VCG_IMAX_Ers, CSFG_VCG_TStress_Ers,
     CSFG_VEGCS_Ers, CSFG_VEGCS_IMAX_Ers, CSFG_VEGCS_TStress_Ers,
     CSFG_VBL_Ers, CSFG_VBL_IMAX_Ers, CSFG_VBL_TStress_Ers,
     CSFG_VWL_Ers, CSFG_VWL_IMAX_Ers, CSFG_VWL_TStress_Ers;

extern      FloatS CSFG_VCG_Prog, CSFG_VCG_IMAX_Prog, CSFG_VCG_TStress_Prog,
     CSFG_VCS_Prog, CSFG_VCS_IMAX_Prog, CSFG_VCS_TStress_Prog,
     CSFG_VBL_Prog, CSFG_VBL_IMAX_Prog, CSFG_VBL_TStress_Prog,
     CSFG_VEG_Prog, CSFG_VEG_IMAX_Prog, CSFG_VEG_TStress_Prog,
     CSFG_VWL_Prog, CSFG_VWL_IMAX_Prog, CSFG_VWL_TStress_Prog;


extern      FloatS EGFG_VEG_Read, EGFG_VEG_IMAX_Read, EGFG_VEG_TStress_Read,
     EGFG_VEG_Prog, EGFG_VEG_IMAX_Prog, EGFG_VEG_TStress_Prog,
     EGFG_VEG_Pvfy, EGFG_VEG_IMAX_Pvfy, EGFG_VEG_TStress_Pvfy,
     EGFG_VEG_Evfy, EGFG_VEG_IMAX_Evfy, EGFG_VEG_TStress_Evfy,
     EGFG_VEG_Cvfy, EGFG_VEG_IMAX_Cvfy, EGFG_VEG_TStress_Cvfy;

extern      FloatS RDISTURB_VWL_STRESS_Read, RDISTURB_VWL_STRESS_IMAX_Read, RDISTURB_VWL_TStress_Read;
extern      FloatS RDISTURB_VWL_STRESS_Pvfy, RDISTURB_VWL_STRESS_IMAX_Pvfy, RDISTURB_VWL_TStress_Pvfy;

extern      FloatS VSNS_VCG_Read;

extern      FloatS TP1_LEAK_VLO, TP1_LEAK_VHI, TP1_LEAK_VLO_ULim, TP1_LEAK_VLO_LLim, TP1_LEAK_VHI_ULim, TP1_LEAK_VHI_LLim,
     TP2_LEAK_VLO, TP2_LEAK_VHI, TP2_LEAK_VLO_ULim, TP2_LEAK_VLO_LLim, TP2_LEAK_VHI_ULim, TP2_LEAK_VHI_LLim;
extern      FloatS TP1TP2_DELTA_LLIM, TP1TP2_DELTA_ULIM;


extern      FloatS VWLCmpt_Target;
extern      FloatS VWLCmpt_LLim;
extern      FloatS VWLCmpt_ULim;
extern      FloatS VWLEvfy_Target;
extern      FloatS VWLEvfy_LLim;
extern      FloatS VWLEvfy_ULim;
extern      FloatS VWLErs_Target;
extern      FloatS VWLErs_LLim;
extern      FloatS VWLErs_ULim;


extern      FloatS MainBG_SoftTrim_VForce;
extern      FloatS MainBG_Adapt_Delta_ULim;
extern      FloatS MainIref_Adapt_Delta_ULim;
extern      FloatS MainBG_Const_VStep;
extern      FloatS MainBG_Const_VMin;
extern      FloatS MainBG_Const_VMax;
extern      FloatS MainIref_Const_IStep;
extern      FloatS AuxBG_SoftTrim_VForce;
extern      FloatS AuxBG_Adapt_Delta_ULim;
extern      FloatS AuxIref_Adapt_Delta_ULim;
extern      FloatS AuxBG_Const_VStep;
extern      FloatS AuxBG_Const_VMin;
extern      FloatS AuxBG_Const_VMax;
extern      FloatS AuxIref_Const_IStep;
extern      FloatS BG_Adapt_Delta_AbsLim;   /*absolute delta limit*/
extern      FloatS Iref_Adapt_Delta_AbsLim;   /*absolute delta limit*/

   

     /*+++ Leakage Conditions/Limits +++*/
extern     FloatS BL_LEAK_ULim;
extern     FloatS BL_LEAK_LLim;
extern     FloatS BL_LEAK_Voltage;
extern     FloatS WL_LEAK_ULim;
extern     FloatS WL_LEAK_LLim;
extern     FloatS WL_LEAK_Voltage;
extern     FloatS SL_LEAK_ULim;
extern     FloatS SL_LEAK_LLim;
extern     FloatS SL_LEAK_Voltage;

extern     FloatS BL_VRD_ULim;
extern     FloatS BL_VRD_LLim;
extern     FloatS WL_VCVFY_ULim;
extern     FloatS WL_VCVFY_LLim;
extern     FloatS SL_VCMPT_ULim;
extern     FloatS SL_VCMPT_LLim;
   
   
       /*+++ Pulse Limit +++*/
extern     IntS SECT_PRECON_ULimit;
extern     IntS SECT_ERS_ULimit;
extern     IntS SECT_CMPT_ULimit;
extern     IntS SECT_PROG_ULimit;
extern     IntS BANK_PRECON_ULimit;
extern     IntS BANK_ERS_ULimit;
extern     IntS BANK_CMPT_ULimit;
extern     IntS BANK_PROG_ULimit;
extern     IntS OTP_PRECON_ULimit;
extern     IntS OTP_ERS_ULimit;
extern     IntS OTP_CMPT_ULimit;
extern     IntS OTP_PROG_ULimit;
extern     IntS BANK_ERS_AVNV_CAT1_ULimit;
extern     IntS BANK_ERS_AVNV_CAT2_ULimit;
extern     IntS BANK_ERS_AVNV_CAT3_ULimit;
extern     IntS BANK_ERS_AVNV_CAT1_SET;
extern     IntS BANK_ERS_AVNV_CAT2_SET;
extern     IntS BANK_ERS_AVNV_CAT3_SET;
extern     IntS BANK_PROGONEPLS_ULimit;
   

    /*+++ Datalog/Pulse Address info +++*/
extern     IntS ADDR_API_STAT1;
extern     IntS ADDR_API_STAT2;
extern     IntS ADDR_API_STAT3;
extern     IntS ADDR_API_STAT4;

extern     IntS ADDR_FAIL_ADDR;
extern     IntS ADDR_FAIL_DATA;

extern     IntS ADDR_PF_BIN;
extern     IntS ADDR_TEST_INFO;
   
extern     IntS ADDR_MSTAT;
extern     IntS ADDR_ERS_PULSE;
extern     IntS ADDR_PROG_MAX_PULSE;
extern     IntS ADDR_PROG_TOT_PULSE;
extern     IntS ADDR_MEASFREQ, ADDR_RTITIMER, ADDR_TRIMSOL, ADDR_TESTFREQ;

extern     IntS ADDR_RAM_MAILBOX;
extern     IntS ADDR_RAM_REPAIR_SOL;
extern     IntS ADDR_RAM_SHELLREV;

extern     IntS ADDR_RAM_IPMOS_MAILBOX;

extern     IntS ADDR_RAM_ESDA;
extern     IntS ADDR_RAM_ARB_FREQ, ADDR_RAM_ARB_WAIT, ADDR_RAM_ARB_TGADDR,
    ADDR_RAM_ARB_TGLEN, ADDR_RAM_FMW;
extern     IntS ADDR_RAM_EFSOFTTRIM, ADDR_RAM_BGAP_TRIM, ADDR_RAM_PUMP_IREF_TRIM,
    ADDR_RAM_FOSC_TRIM, ADDR_RAM_SLOPECT_TRIM, ADDR_RAM_IGNOREOTP;

extern     IntS1D ADDR_TIOTP_HI,ADDR_TIOTP_LO; /* array dimensions were : 0..7 */

extern     IntS ADDR_RAM_OTP_TEMP_W8;
extern     IntS ADDR_RAM_TEMPL_VHVE_PMT, ADDR_RAM_TEMPL_VHVE_SM, ADDR_RAM_TEMPL_VHVPV_PMT;
extern     IntS ADDR_RAM_TEMPL_VHVE_PMT_EMU, ADDR_RAM_TEMPL_VHVE_SM_EMU, ADDR_RAM_TEMPL_VHVPV_PMT_EMU;
   
    /*+++ Stress Limit +++*/
extern     FloatS BLS_ULim;
extern     FloatS BLS_LLim;
extern     FloatS WLS_ULim;
extern     FloatS WLS_LLim;
extern     FloatS SLS_ULim;
extern     FloatS SLS_LLim;
extern     FloatS DRL0S_ULim;
extern     FloatS DRL0S_LLim;
extern     FloatS DRL1S_ULim;
extern     FloatS DRL1S_LLim;
extern     FloatS BLS_Voltage;
extern     FloatS WLS_Voltage;
extern     FloatS SLS_Voltage;
extern     FloatS UVVT_Voltage;
     /*delta limit of block median*/
extern     FloatS DRL0S_Block_LLim;
extern     FloatS DRL0S_Block_ULim;
extern     FloatS DRL1S_Block_LLim;
extern     FloatS DRL1S_Block_ULim;


    /*+++ VT Limit +++*/
extern     FloatS UVVT_ULim;
extern     FloatS UVVT_LLim;
extern     FloatS VT0_ULim;
extern     FloatS VT0_LLim;
extern     FloatS VT1_ULim;
extern     FloatS VT1_LLim;
extern     FloatS VT1min_ULim;
extern     FloatS VT1min_LLim;
extern     FloatS VT0min_ULim;
extern     FloatS VT0min_LLim;
extern     FloatS VT0min_PstDRL_LLim;
extern     FloatS VT0max_ULim;
extern     FloatS VT0max_LLim;
extern     FloatS VT0MinMax_ULim;
extern     FloatS VT0MinMax_LLim;
extern     FloatS VT0ErsStr_ULim;
extern     FloatS VT0ErsStr_LLim;
extern     FloatS VT0ErsStr_Delta_ULim;
extern     FloatS VT0ErsStr_Delta_LLim;
extern     FloatS VT1ErsStr_ULim;
extern     FloatS ErsStrSlowScrn_Lim;
extern     FloatS LOWVT0_ULim;
extern     FloatS LOWVT0_LLim;

   
    /*+++ Base test number +++*/
extern    IntS TNUM_SECT_ERS_PRECON_SM;
extern    IntS TNUM_SECT_ERS_PRECON;
extern    IntS TNUM_SECT_ERS_NOPRECON_SM;
extern    IntS TNUM_SECT_ERS_NOPRECON;
extern    IntS TNUM_SECT_PROG;
extern    IntS TNUM_SECT_PROG_OCHK;
extern    IntS TNUM_SECT_PROG_ECHK;
extern    IntS TNUM_SECT_PROG_WOCHK;
extern    IntS TNUM_SECT_PROG_WECHK;
extern    IntS TNUM_SECT_PROG_SW;
extern    IntS TNUM_SECT_PROG_CSW;
extern    IntS TNUM_SECT_PROG_OCHK_SW;
extern    IntS TNUM_SECT_PROG_OCHK_CSW;
extern    IntS TNUM_SECT_PROG_ECHK_SW;
extern    IntS TNUM_SECT_PROG_ECHK_CSW;
extern    IntS TNUM_SECT_PROG_ONEPLS;
extern    IntS TNUM_SECT_PROG_LOWVT;
extern    IntS TNUM_SECT_PROG_RESTORE;
extern    IntS TNUM_SECT_PROG_SBDG;
extern    IntS TNUM_SECT_PRECON;
extern    IntS TNUM_SECT_PVFY_SM;
extern    IntS TNUM_SECT_EVFY_SM;
extern    IntS TNUM_SECT_CVFY_SM;
extern    IntS TNUM_SECT_BLS_SEL;
extern    IntS TNUM_SECT_BL_LEAK_SEL;
extern    IntS TNUM_SECT_BLS;
extern    IntS TNUM_SECT_BL_LEAK;
extern    IntS TNUM_SECT_BLS_ODD;
extern    IntS TNUM_SECT_BL_LEAK_ODD;
extern    IntS TNUM_SECT_BLS_EVEN;
extern    IntS TNUM_SECT_BL_LEAK_EVEN;
extern    IntS TNUM_SECT_WLS;
extern    IntS TNUM_SECT_WL_LEAK;
extern    IntS TNUM_SECT_WLS_ODD;
extern    IntS TNUM_SECT_WL_LEAK_ODD;
extern    IntS TNUM_SECT_WLS_EVEN;
extern    IntS TNUM_SECT_WL_LEAK_EVEN;
extern    IntS TNUM_SECT_SLI;
extern    IntS TNUM_SECT_SL_LEAK;
extern    IntS TNUM_SECT_ERS_ONEPLS;
extern    IntS TNUM_SECT_ERS_SLOWBIT;
extern    IntS TNUM_SECT_EVFY;
extern    IntS TNUM_SECT_PVFY;
extern    IntS TNUM_SECT_CVFY;
extern    IntS TNUM_SECT_EVFY_PIPE;
extern    IntS TNUM_SECT_PVFY_PIPE;
extern    IntS TNUM_SECT_CVFY_PIPE;
extern    IntS TNUM_SECT_RD1S;
extern    IntS TNUM_SECT_RD0S;
extern    IntS TNUM_SECT_RDOCHK;
extern    IntS TNUM_SECT_RDECHK;
extern    IntS TNUM_SECT_RD1S_PIPE;
extern    IntS TNUM_SECT_RD0S_PIPE;
extern    IntS TNUM_SECT_RDOCHK_PIPE;
extern    IntS TNUM_SECT_RDECHK_PIPE;
extern    IntS TNUM_SECT_RDM1S;
extern    IntS TNUM_SECT_RDM0S;
extern    IntS TNUM_SECT_RDMOCHK;
extern    IntS TNUM_SECT_RDMECHK;
extern    IntS TNUM_SECT_RDM1S_PIPE;
extern    IntS TNUM_SECT_RDM0S_PIPE;
extern    IntS TNUM_SECT_RDMOCHK_PIPE;
extern    IntS TNUM_SECT_RDMECHK_PIPE;
extern    IntS TNUM_SECT_RD1S_RED;
extern    IntS TNUM_SECT_RD0S_RED;
extern    IntS TNUM_SECT_RDOCHK_RED;
extern    IntS TNUM_SECT_RDECHK_RED;
extern    IntS TNUM_SECT_RD1S_PIPE_RED;
extern    IntS TNUM_SECT_RD0S_PIPE_RED;
extern    IntS TNUM_SECT_RDOCHK_PIPE_RED;
extern    IntS TNUM_SECT_RDECHK_PIPE_RED;
extern    IntS TNUM_SECT_RDM1S_RED;
extern    IntS TNUM_SECT_RDM0S_RED;
extern    IntS TNUM_SECT_RDMOCHK_RED;
extern    IntS TNUM_SECT_RDMECHK_RED;
extern    IntS TNUM_SECT_RDM1S_PIPE_RED;
extern    IntS TNUM_SECT_RDM0S_PIPE_RED;
extern    IntS TNUM_SECT_RDMOCHK_PIPE_RED;
extern    IntS TNUM_SECT_RDMECHK_PIPE_RED;
extern    IntS TNUM_SECT_VTMAX_NO_ESDA;
extern    IntS TNUM_SECT_VTMIN_NO_ESDA;
extern    IntS TNUM_SECT_VT_OCHK;
extern    IntS TNUM_SECT_VT_ECHK;
extern    IntS TNUM_SECT_VTMAX_PIPE;
extern    IntS TNUM_SECT_VTMIN_PIPE;
extern    IntS TNUM_SECT_VT_OCHK_PIPE;
extern    IntS TNUM_SECT_VT_ECHK_PIPE;

extern    IntS TNUM_SECT_VTMIN_INTER_1S;
extern    IntS TNUM_SECT_VTMIN_INTER_0S;
extern    IntS TNUM_SECT_VTMIN_INTER_OCHK;
extern    IntS TNUM_SECT_VTMIN_INTER_ECHK;
extern    IntS TNUM_SECT_VTMAX_INTER_1S;
extern    IntS TNUM_SECT_VTMAX_INTER_0S;
extern    IntS TNUM_SECT_VTMAX_INTER_OCHK;
extern    IntS TNUM_SECT_VTMAX_INTER_ECHK;

extern    IntS TNUM_SECT_VTMAX_INTER_1S_RED;
extern    IntS TNUM_SECT_VTMAX_RED;
extern    IntS TNUM_SECT_VTMIN_RED;
extern    IntS TNUM_SECT_VTMIN_INTER_0S_RED;

extern    IntS TNUM_SECT_PVFY_SW;
extern    IntS TNUM_SECT_EVFY_SW;
extern    IntS TNUM_SECT_CVFY_SW;


extern    IntS TNUM_SECT_PROG_TM;
extern    IntS TNUM_SECT_PROG_OCHK_TM;
extern    IntS TNUM_SECT_PROG_ECHK_TM;
extern    IntS TNUM_SECT_VTMAX_ESDA;
extern    IntS TNUM_SECT_VTMIN_ESDA;

   
extern    IntS TNUM_BANK_ERS_PRECON;
extern    IntS TNUM_BANK_ERS_NOPRECON;
extern    IntS TNUM_BANK_ERS_PRECON_SW;
extern    IntS TNUM_BANK_ERS_NOPRECON_SW;
extern    IntS TNUM_BANK_ERS_SW_SCREEN;
extern    IntS TNUM_BANK_ERS_SCMD_PRECON;
extern    IntS TNUM_BANK_ERS_SCMD_NOPRECON;
extern    IntS TNUM_BANK_ERS_SCMD_PRECON_SW;
extern    IntS TNUM_BANK_ERS_SCMD_NOPRECON_SW;
extern    IntS TNUM_BANK_PROG_SM;
extern    IntS TNUM_BANK_PROG_OCHK;
extern    IntS TNUM_BANK_PROG_ECHK;
extern    IntS TNUM_BANK_PROG_SM_DISTURB;
extern    IntS TNUM_BANK_PROG_OCHK_DISTURB;
extern    IntS TNUM_BANK_PROG_ECHK_DISTURB;
extern    IntS TNUM_BANK_PROG_WORD;
extern    IntS TNUM_BANK_PROG_OCHK_WORD;
extern    IntS TNUM_BANK_PROG_ECHK_WORD;
extern    IntS TNUM_BANK_PROG_WOCHK;
extern    IntS TNUM_BANK_PROG_WECHK;
extern    IntS TNUM_BANK_PROG_ONEPLS;
extern    IntS TNUM_BANK_PROG_LOWVT;
extern    IntS TNUM_BANK_PROG_RESTORE;
extern    IntS TNUM_BANK_PROG_SBDG;
extern    IntS TNUM_BANK_PRECON;
extern    IntS TNUM_BANK_PROG_SW;
extern    IntS TNUM_BANK_PROG_OCHK_SW;
extern    IntS TNUM_BANK_PROG_ECHK_SW;
extern    IntS TNUM_BANK_PROG_WOCHK_SW;
extern    IntS TNUM_BANK_PROG_WECHK_SW;
extern    IntS TNUM_BANK_PROG_CSW;
extern    IntS TNUM_BANK_PROG_OCHK_CSW;
extern    IntS TNUM_BANK_PROG_ECHK_CSW;
extern    IntS TNUM_BANK_PROG_WOCHK_CSW;
extern    IntS TNUM_BANK_PROG_WECHK_CSW;
extern    IntS TNUM_BANK_BL_LEAK;
extern    IntS TNUM_BANK_BL_LEAK_ODD;
extern    IntS TNUM_BANK_BL_LEAK_EVEN;
extern    IntS TNUM_BANK_WL_LEAK;
extern    IntS TNUM_BANK_WL_LEAK_ODD;
extern    IntS TNUM_BANK_WL_LEAK_EVEN;
extern    IntS TNUM_BANK_SLI;
extern    IntS TNUM_BANK_SL_LEAK;
extern    IntS TNUM_BANK_ERS_STRESS_FAST;
extern    IntS TNUM_BANK_ERS_STRESS_SLOW;
extern    IntS TNUM_BANK_RD1S;
extern    IntS TNUM_BANK_RD0S;
extern    IntS TNUM_BANK_RDOCHK;
extern    IntS TNUM_BANK_RDECHK;
extern    IntS TNUM_BANK_RD1S_PIPE;
extern    IntS TNUM_BANK_RD0S_PIPE;
extern    IntS TNUM_BANK_RDOCHK_PIPE;
extern    IntS TNUM_BANK_RDECHK_PIPE;
extern    IntS TNUM_BANK_RDM1S;
extern    IntS TNUM_BANK_RDM0S;
extern    IntS TNUM_BANK_RDMOCHK;
extern    IntS TNUM_BANK_RDMECHK;
extern    IntS TNUM_BANK_RDM1S_PIPE;
extern    IntS TNUM_BANK_RDM0S_PIPE;
extern    IntS TNUM_BANK_RDMOCHK_PIPE;
extern    IntS TNUM_BANK_RDMECHK_PIPE;
extern    IntS TNUM_BANK_RD1S_RED;
extern    IntS TNUM_BANK_RD0S_RED;
extern    IntS TNUM_BANK_RDOCHK_RED;
extern    IntS TNUM_BANK_RDECHK_RED;
extern    IntS TNUM_BANK_RD1S_PIPE_RED;
extern    IntS TNUM_BANK_RD0S_PIPE_RED;
extern    IntS TNUM_BANK_RDOCHK_PIPE_RED;
extern    IntS TNUM_BANK_RDECHK_PIPE_RED;
extern    IntS TNUM_BANK_RDM1S_RED;
extern    IntS TNUM_BANK_RDM0S_RED;
extern    IntS TNUM_BANK_RDMOCHK_RED;
extern    IntS TNUM_BANK_RDMECHK_RED;
extern    IntS TNUM_BANK_RDM1S_PIPE_RED;
extern    IntS TNUM_BANK_RDM0S_PIPE_RED;
extern    IntS TNUM_BANK_RDMOCHK_PIPE_RED;
extern    IntS TNUM_BANK_RDMECHK_PIPE_RED;
extern    IntS TNUM_BANK_VTMAX;
extern    IntS TNUM_BANK_VTMIN;
extern    IntS TNUM_BANK_VTOCHK;
extern    IntS TNUM_BANK_VTECHK;
extern    IntS TNUM_BANK_VTMAX_PIPE;
extern    IntS TNUM_BANK_VTMIN_PIPE;
extern    IntS TNUM_BANK_VTOCHK_PIPE;
extern    IntS TNUM_BANK_VTECHK_PIPE;

extern    IntS TNUM_BANK_VTMIN_INTER_1S;
extern    IntS TNUM_BANK_VTMIN_INTER_0S;
extern    IntS TNUM_BANK_VTMIN_INTER_OCHK;
extern    IntS TNUM_BANK_VTMIN_INTER_ECHK;
extern    IntS TNUM_BANK_VTMAX_INTER_1S;
extern    IntS TNUM_BANK_VTMAX_INTER_0S;
extern    IntS TNUM_BANK_VTMAX_INTER_OCHK;
extern    IntS TNUM_BANK_VTMAX_INTER_ECHK;

extern    IntS TNUM_BANK_VTMAX_RED;
extern    IntS TNUM_BANK_VTMIN_RED;
extern    IntS TNUM_BANK_VTOCHK_RED;
extern    IntS TNUM_BANK_VTECHK_RED;
extern    IntS TNUM_BANK_VTMAX_PIPE_RED;
extern    IntS TNUM_BANK_VTMIN_PIPE_RED;
extern    IntS TNUM_BANK_VTOCHK_PIPE_RED;
extern    IntS TNUM_BANK_VTECHK_PIPE_RED;

extern    IntS TNUM_BANK_VTMIN_INTER_1S_RED;
extern    IntS TNUM_BANK_VTMIN_INTER_0S_RED;
extern    IntS TNUM_BANK_VTMIN_INTER_OCHK_RED;
extern    IntS TNUM_BANK_VTMIN_INTER_ECHK_RED;
extern    IntS TNUM_BANK_VTMAX_INTER_1S_RED;
extern    IntS TNUM_BANK_VTMAX_INTER_0S_RED;
extern    IntS TNUM_BANK_VTMAX_INTER_OCHK_RED;
extern    IntS TNUM_BANK_VTMAX_INTER_ECHK_RED;

    /*arbitrary psa vt*/
extern    IntS TNUM_BANK_ARB_RD;
extern    IntS TNUM_BANK_ARB_WR;
extern    IntS TNUM_BANK_VT_ARB_PSA;
extern    IntS TNUM_BANK_RD_ARB_PSA;

extern    IntS TNUM_BANK_PVFY;
extern    IntS TNUM_BANK_EVFY;
extern    IntS TNUM_BANK_VTVFY;
extern    IntS TNUM_BANK_CVFY;
extern    IntS TNUM_BANK_PVFY_PIPE;
extern    IntS TNUM_BANK_EVFY_PIPE;
extern    IntS TNUM_BANK_VTVFY_PIPE;
extern    IntS TNUM_BANK_CVFY_PIPE;
extern    IntS TNUM_BANK_CVFY_RED;
extern    IntS TNUM_BANK_RD1S_NOCOLRED;
extern    IntS TNUM_BANK_RD0S_NOCOLRED;
extern    IntS TNUM_BANK_RDOCHK_NOCOLRED;
extern    IntS TNUM_BANK_RDECHK_NOCOLRED;
extern    IntS TNUM_BANK_RD1S_PIPE_NOCOLRED;
extern    IntS TNUM_BANK_RD0S_PIPE_NOCOLRED;
extern    IntS TNUM_BANK_RDOCHK_PIPE_NOCOLRED;
extern    IntS TNUM_BANK_RDECHK_PIPE_NOCOLRED;
extern    IntS TNUM_BANK_RDM1S_NOCOLRED;
extern    IntS TNUM_BANK_RDM0S_NOCOLRED;
extern    IntS TNUM_BANK_RDMOCHK_NOCOLRED;
extern    IntS TNUM_BANK_RDMECHK_NOCOLRED;
extern    IntS TNUM_BANK_RDM1S_PIPE_NOCOLRED;
extern    IntS TNUM_BANK_RDM0S_PIPE_NOCOLRED;
extern    IntS TNUM_BANK_RDMOCHK_PIPE_NOCOLRED;
extern    IntS TNUM_BANK_RDMECHK_PIPE_NOCOLRED;
extern    IntS TNUM_BANK_VTMAX_LOGICSECT;
extern    IntS TNUM_BANK_VTMIN_LOGICSECT;
extern    IntS TNUM_BANK_VTOCHK_LOGICSECT;
extern    IntS TNUM_BANK_VTECHK_LOGICSECT;
extern    IntS TNUM_BANK_VTMAX_LOGICSECT_RED;
extern    IntS TNUM_BANK_VTMIN_LOGICSECT_RED;
extern    IntS TNUM_BANK_VTOCHK_LOGICSECT_RED;
extern    IntS TNUM_BANK_VTECHK_LOGICSECT_RED;
extern    IntS TNUM_BANK_VTMAX_SCRN_LOGICSECT;
extern    IntS TNUM_BANK_VTMIN_SCRN_LOGICSECT;
extern    IntS TNUM_BANK_VTOCHK_SCRN_LOGICSECT;
extern    IntS TNUM_BANK_VTECHK_SCRN_LOGICSECT;
extern    IntS TNUM_BANK_RD1S_LOGICSECT;
extern    IntS TNUM_BANK_RD0S_LOGICSECT;
extern    IntS TNUM_BANK_RDOCHK_LOGICSECT;
extern    IntS TNUM_BANK_RDECHK_LOGICSECT;
extern    IntS TNUM_BANK_RD1S_LOGICSECT_RED;
extern    IntS TNUM_BANK_RD0S_LOGICSECT_RED;
extern    IntS TNUM_BANK_RDOCHK_LOGICSECT_RED;
extern    IntS TNUM_BANK_RDECHK_LOGICSECT_RED;

extern    IntS TNUM_BANK_REPAIR_PROG_SOLUTION;
extern    IntS TNUM_BANK_REPAIR_CALC_SOLUTION_VT0S;
extern    IntS TNUM_BANK_REPAIR_CALC_SOLUTION_VT1S;
extern    IntS TNUM_BANK_REPAIR_UPDATE_SOLUTION;

extern    IntS TNUM_BANK_VTMIN_INTER_1S_LOGICSECT;
extern    IntS TNUM_BANK_VTMIN_INTER_0S_LOGICSECT;
extern    IntS TNUM_BANK_VTMIN_INTER_OCHK_LOGICSECT;
extern    IntS TNUM_BANK_VTMIN_INTER_ECHK_LOGICSECT;
extern    IntS TNUM_BANK_VTMAX_INTER_1S_LOGICSECT;
extern    IntS TNUM_BANK_VTMAX_INTER_0S_LOGICSECT;
extern    IntS TNUM_BANK_VTMAX_INTER_OCHK_LOGICSECT;
extern    IntS TNUM_BANK_VTMAX_INTER_ECHK_LOGICSECT;

extern    IntS TNUM_BANK_VTMAX_FAST;
extern    IntS TNUM_BANK_VTMIN_FAST;
extern    IntS TNUM_BANK_VTOCHK_FAST;
extern    IntS TNUM_BANK_VTECHK_FAST;
extern    IntS TNUM_BANK_VTMAX_DIRECT;
extern    IntS TNUM_BANK_VTMIN_DIRECT;
extern    IntS TNUM_BANK_VTOCHK_DIRECT;
extern    IntS TNUM_BANK_VTECHK_DIRECT;
extern    IntS TNUM_BANK_RD0S_BURST;
extern    IntS TNUM_BANK_RD1S_BURST;
extern    IntS TNUM_BANK_RDOCHK_BURST;
extern    IntS TNUM_BANK_RDECHK_BURST;
extern    IntS TNUM_BANK_RDM0S_BURST;
extern    IntS TNUM_BANK_RDM1S_BURST;
extern    IntS TNUM_BANK_RDMOCHK_BURST;
extern    IntS TNUM_BANK_RDMECHK_BURST;
extern    IntS TNUM_BANK_ERS_SMTCR31;
extern    IntS TNUM_BANK_WLS_100;
extern    IntS TNUM_BANK_WLS_ODD_100;
extern    IntS TNUM_BANK_WLS_EVEN_100;
extern    IntS TNUM_BANK_SLL;



extern    IntS TNUM_OTP_ERS_PRECON_SEMI;
extern    IntS TNUM_OTP_ERS_PRECON_SW;
extern    IntS TNUM_OTP_ERS_PRECON;
extern    IntS TNUM_OTP_ERS_NOPRECON;
extern    IntS TNUM_OTP_ERS_PRECON_MP1SET;
extern    IntS TNUM_OTP_ERS_NOPRECON_MP1SET;
extern    IntS TNUM_OTP_PROG;
extern    IntS TNUM_OTP_PROG_OCHK;
extern    IntS TNUM_OTP_PROG_ECHK;
extern    IntS TNUM_OTP_PROG_MP1SET;
extern    IntS TNUM_OTP_PROG_SEMI;
extern    IntS TNUM_OTP_PROG_OCHK_SEMI;
extern    IntS TNUM_OTP_PROG_ECHK_SEMI;
extern    IntS TNUM_OTP_PROG_SW;
extern    IntS TNUM_OTP_PROG_OCHK_SW;
extern    IntS TNUM_OTP_PROG_ECHK_SW;
extern    IntS TNUM_OTP_PROG_MP1SET_SW;
extern    IntS TNUM_OTP_PROG_TEMP_SW;
extern    IntS TNUM_OTP_PROG_SEMI_SW;
extern    IntS TNUM_OTP_PROG_OCHK_SEMI_SW;
extern    IntS TNUM_OTP_PROG_ECHK_SEMI_SW;
extern    IntS TNUM_OTP_PROG_SEMI_CSW;
extern    IntS TNUM_OTP_PROG_OCHK_SEMI_CSW;
extern    IntS TNUM_OTP_PROG_ECHK_SEMI_CSW;
extern    IntS TNUM_OTP_PROG_ONEPLS;
extern    IntS TNUM_OTP_PROG_TEMPLATE,TNUM_OTP_PROG_TEMPLATE_ENGOVRD;
extern    IntS TNUM_OTP_REFRESH;
extern    IntS TNUM_OTP_REFRESH_VT;
extern    IntS TNUM_OTP_PROG_CHKSUM_CBITS;
extern    IntS TNUM_OTP_PROG_PMOS_SETTING;
extern    IntS TNUM_OTP_PROG_AVNV_SETTING;
extern    IntS TNUM_OTP_PROG_ECC_BITS;
extern    IntS TNUM_OTP_PROG_FSPEED_BITS;
extern    IntS TNUM_OTP_PROG_EFCHKSUM;
extern    IntS TNUM_OTP_BLS;
extern    IntS TNUM_OTP_BLS_ODD;
extern    IntS TNUM_OTP_BLS_EVEN;
extern    IntS TNUM_OTP_WLS;
extern    IntS TNUM_OTP_WLS_ODD;
extern    IntS TNUM_OTP_WLS_EVEN;
extern    IntS TNUM_OTP_SLI;
extern    IntS TNUM_OTP_RD1S;
extern    IntS TNUM_OTP_RD0S;
extern    IntS TNUM_OTP_RDOCHK;
extern    IntS TNUM_OTP_RDECHK;
extern    IntS TNUM_OTP_RDM1S;
extern    IntS TNUM_OTP_RDM0S;
extern    IntS TNUM_OTP_RDM1S_TEMPLATE;
extern    IntS TNUM_OTP_RDM0S_TEMPLATE;
extern    IntS TNUM_OTP_RDMOCHK;
extern    IntS TNUM_OTP_RDMECHK;
extern    IntS TNUM_OTP_VFY_TEMPLATE;
extern    IntS TNUM_OTP_VFY_DATA;
extern    IntS TNUM_OTP_RDM0S_SEMI;
extern    IntS TNUM_OTP_RDOCHK_SEMI;
extern    IntS TNUM_OTP_RDECHK_SEMI;
extern    IntS TNUM_OTP_VTMAX;
extern    IntS TNUM_OTP_VTMIN;
extern    IntS TNUM_OTP_VTOCHK;
extern    IntS TNUM_OTP_VTECHK;
extern    IntS TNUM_OTP_VTMAX_PIPE;
extern    IntS TNUM_OTP_VTMIN_PIPE;
extern    IntS TNUM_OTP_VTOCHK_PIPE;
extern    IntS TNUM_OTP_VTECHK_PIPE;

extern    IntS TNUM_OTP_VTMIN_INTER_1S;
extern    IntS TNUM_OTP_VTMIN_INTER_0S;
extern    IntS TNUM_OTP_VTMIN_INTER_OCHK;
extern    IntS TNUM_OTP_VTMIN_INTER_ECHK;
extern    IntS TNUM_OTP_VTMAX_INTER_1S;
extern    IntS TNUM_OTP_VTMAX_INTER_0S;
extern    IntS TNUM_OTP_VTMAX_INTER_OCHK;
extern    IntS TNUM_OTP_VTMAX_INTER_ECHK;

extern    IntS TNUM_OTP_VTMAX_SEMI;
extern    IntS TNUM_OTP_VTMIN_SEMI;
extern    IntS TNUM_OTP_VTOCHK_SEMI;
extern    IntS TNUM_OTP_VTECHK_SEMI;
extern    IntS TNUM_OTP_VTMIN_SEMI_INTER_1S;
extern    IntS TNUM_OTP_VTMIN_SEMI_INTER_0S;
extern    IntS TNUM_OTP_VTMIN_SEMI_INTER_OCHK;
extern    IntS TNUM_OTP_VTMIN_SEMI_INTER_ECHK;
extern    IntS TNUM_OTP_VTMAX_SEMI_INTER_1S;
extern    IntS TNUM_OTP_VTMAX_SEMI_INTER_0S;
extern    IntS TNUM_OTP_VTMAX_SEMI_INTER_OCHK;
extern    IntS TNUM_OTP_VTMAX_SEMI_INTER_ECHK;

extern    IntS TNUM_OTP_WD9LATCH_COMPARE;
extern    IntS TNUM_OTP_RESET_BANK;
extern    IntS TNUM_OTP_WD9LATCH_CLEAR;
extern    IntS TNUM_OTP_WD9LATCH_WR;
extern    IntS TNUM_OTP_RD_VT_MBOX;
extern    IntS TNUM_OTP_RD_ID_MBOX;
extern    IntS TNUM_OTP_RD_LOG1_MBOX;
extern    IntS TNUM_OTP_RD_LOG3_MBOX;
extern    IntS TNUM_OTP_CHKSUM;
extern    IntS TNUM_OTP_CHKSUM_NO_CBIT;
extern    IntS TNUM_OTP_API_CHKSUM;
extern    IntS TNUM_OTP_WR_BLK_PREDRL_VT_MBOX;
extern    IntS TNUM_OTP_WR_BLK_POSTDRL1_VT_MBOX;
extern    IntS TNUM_OTP_WR_BLK_POSTDRL2_VT_MBOX;
extern    IntS TNUM_OTP_WR_BLK_PREDRL_VT1_MBOX;
extern    IntS TNUM_OTP_WR_BLK_POSTDRL1_VT1_MBOX;
extern    IntS TNUM_OTP_WR_BLK_POSTDRL2_VT1_MBOX;
extern    IntS TNUM_OTP_WR_OTP_PREDRL_VT1_MBOX;
extern    IntS TNUM_OTP_WR_OTP_POSTDRL1_VT1_MBOX;
extern    IntS TNUM_OTP_WR_OTP_POSTDRL2_VT1_MBOX;
extern    IntS TNUM_OTP_WR_BANK_PREDRL_VT_MBOX;
extern    IntS TNUM_OTP_WR_BANK_POSTDRL1_VT_MBOX;
extern    IntS TNUM_OTP_WR_BANK_POSTDRL2_VT_MBOX;
extern    IntS TNUM_OTP_WR_MP1_FLWBYTE;
extern    IntS TNUM_OTP_WR_MP2_FLWBYTE;
extern    IntS TNUM_OTP_WR_MP3_FLWBYTE;
extern    IntS TNUM_OTP_WR_MP4_FLWBYTE;
extern    IntS TNUM_OTP_WR_FT1_FLWBYTE;
extern    IntS TNUM_OTP_WR_FT2_FLWBYTE;
extern    IntS TNUM_OTP_WR_FT3_FLWBYTE;
extern    IntS TNUM_OTP_WR_DRL_FLWBYTE;
extern    IntS TNUM_OTP_WR_FUNC1_FLWBYTE;
extern    IntS TNUM_OTP_WR_FUNC2_FLWBYTE;
extern    IntS TNUM_OTP_WR_FUNC3_FLWBYTE;
extern    IntS TNUM_OTP_WR_REPAIR_FLWBYTE;
extern    IntS TNUM_OTP_WR_BURNIN_FLWBYTE;
extern    IntS TNUM_OTP_WR_EXEC_FLWBYTE;
extern    IntS TNUM_OTP_WR_CUST_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_MP1_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_MP2_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_MP3_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_MP1_3_DRL_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_FT1_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_FT1_MP1_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_FT2_FT1_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_FT3_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_DRL_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_FUNC1_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_FUNC2_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_FUNC3_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_REPAIR_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_BURNIN_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_EXEC_FLWBYTE;
extern    IntS TNUM_OTP_CHECK_USER_FLWBYTE;

extern    IntS TNUM_OTP_WR_PREDRL_VT_MBOX;
extern    IntS TNUM_OTP_WR_POSTDRL_VT_MBOX;
extern    IntS TNUM_OTP_WR_BANK_POSTDRL_VT_MBOX;
extern    IntS TNUM_OTP_WR_DIEID_MBOX;
extern    IntS TNUM_OTP_WR_DIEID_FBYTE_MBOX;
extern    IntS TNUM_OTP_WR_DIEID_FBYTE_MP1_MBOX;
extern    IntS TNUM_OTP_WR_DIEID_FBYTE_MP1_PKG_MBOX;
extern    IntS TNUM_OTP_WR_OTP_CHKSUM_MBOX;
extern    IntS TNUM_OTP_WR_PKG_MEMSIZE_MBOX;
extern    IntS TNUM_OTP_WR_MP3DRL_FLWBYTE;
extern    IntS TNUM_OTP_PRECON;

extern    IntS TNUM_OTP_WR_MP1_REV;
extern    IntS TNUM_OTP_WR_MP2_REV;
extern    IntS TNUM_OTP_WR_MP3_REV;
extern    IntS TNUM_OTP_WR_FT1_REV;
extern    IntS TNUM_OTP_WR_FT2_REV;
extern    IntS TNUM_OTP_WR_FT3_REV;

extern    IntS TNUM_OTP_ERS_TCR44;
extern    IntS TNUM_OTP_ERS_RAM;

extern    IntS TNUM_OTP_WR_PGMREV_MBOX;
extern    IntS TNUM_OTP_WR_FLWBYTE_MBOX;
extern    IntS TNUM_OTP_WR_VT_MBOX;

extern    IntS TNUM_PUMP_AUXBG;
extern    IntS TNUM_PUMP_AUXIREF;
extern    IntS TNUM_PUMP_AUXOSC;
extern    IntS TNUM_PUMP_AUXV5V0;
extern    IntS TNUM_PUMP_AUXV5V1;
extern    IntS TNUM_PUMP_MAINIREF,TNUM_PUMP_MAINICMP10U;
extern    IntS TNUM_PUMP_MAINOSC;

extern    IntS TNUM_PUMP_VRD01;
extern    IntS TNUM_PUMP_VRD23;
extern    IntS TNUM_PUMP_VRD45;
extern    IntS TNUM_PUMP_VRD67;


extern    IntS TNUM_PUMP_BANDGAP;
extern    IntS TNUM_PUMP_PARA;
extern    IntS TNUM_BANK_IREF;
extern    IntS TNUM_SECT_VDEPLETE;
extern    IntS TNUM_BANK_BLV_RD;
extern    IntS TNUM_BANK_WLV_CVFY;
extern    IntS TNUM_BANK_SLV_CMPT;
   
extern    IntS TNUM_MAINBG_FORCE_MEASVRD0;
extern    IntS TNUM_MAINBG_MEASVRD0;
extern    IntS TNUM_MAINBG_MEAS;
extern    IntS TNUM_AUXBG_FORCE_MEASVDD5V;
extern    IntS TNUM_AUXBG_MEASVDD5V;
extern    IntS TNUM_AUXBG_MEAS;
extern    IntS TNUM_AUXIREF_MEAS;
extern    IntS TNUM_MAINIREF_MEAS,TNUM_MAINICMP10U_MEAS;
extern    IntS TNUM_ALWAYS_PASS;
extern    IntS TNUM_SHELL_INFO;
   
extern    IntS TNUM_IBIT_LEFT;
extern    IntS TNUM_IBIT_RIGHT;
extern    IntS TNUM_IREFPMOS_RD;

extern    IntS TNUM_DUMP_FMW_MBOX;
extern    IntS TNUM_OTP_WR_MISCLOC1;
extern    IntS TNUM_OTP_WR_MISCLOC2;
extern    IntS TNUM_BANK_RDSUPERM1S;

    /* array[0..128,TPModeType,1..6,pre..post,VCornerType] of */
extern    StringS PUMP_BANK_PARA_TESTNAME[129][6][6][2][9]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /* array[0..128,TPModeType,1..6] of */
extern    BoolS PUMP_BANK_PARA_ENABLE[129][6][6]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /* array[0..128,TPModeType,1..6] of */
extern    BoolS PUMP_BANK_PARA_BINOUT[129][6][6]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
extern    FloatM2D PUMP_PARA_VALUE; /* :MANUAL FIX REQUIRED: array dimensions are : TPModeType,pre..post */
    /* array[0..7,0..128,TPModeType,1..6,pre..post,VCornerType] of */
extern    FloatM BANK_PARA_VALUE[8][129][6][6][2][9]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /* array[0..128,TPModeType,1..6,pre..post,VCornerType] of */
extern    StringS BANK_PARA_TWSTR[129][6][6][2][9]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    
     /*[bank,block,tcrnum,tcrmode,tpnum,prepost,vcorner]*/
    /*array[0..7,0..7,0..128,TPModeType,1..6,pre..post,VCornerType] of */
extern    FloatM BLOCK_PARA_VALUE[8][8][129][6][6][2][9]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    
     /*[bank,even..odd,tcrnum,tcrmode,prepost,vcorner]*/
    /*array[0..7,0..1,TPModeType,pre..post,VCornerType] of */
extern    FloatM BANK_IREFARR_VALUE[8][2][6][2][9]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */

extern    FloatM2D PUMP_LEAK_VALUE; /* :MANUAL FIX REQUIRED: array dimensions are : TPModeType,VCornerType */
    /*array[TPModeType,pre..post,1..2] of */
extern    FloatM TPAD_LEAK_VALUE[6][2][2]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */

    /*array[0..7,0..15,vttype,prepostcorner] of */
extern    FloatM BANK_VT_VALUE[8][16][6][2]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /*array[0..7,0..15,vttype,prepostcorner] of */
extern    FloatM RED_VT_VALUE[8][16][6][2]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /*array[0..7,0..15,vttype] of */
extern    FloatM BANK_VT_DELTA_VALUE[8][16][6]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /*array[0..7,vttype,prepostcorner] of */
extern    FloatM OTP_VT_VALUE[8][6][2]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
extern    FloatM2D OTP_VT_DELTA_VALUE; /* :MANUAL FIX REQUIRED: array dimensions are : 0..7,vttype */

    /*array[0..7,0..15,vttype,prepostcorner] of */
extern    FloatM BANK_BCC_VALUE[8][16][6][2]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /*array[0..7,0..15,vttype,prepostcorner] of */
extern    FloatM RED_BCC_VALUE[8][16][6][2]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /*array[0..7,0..15,vttype] of */
extern    FloatM BANK_BCC_DELTA_VALUE[8][16][6]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /*array[0..7,vttype,prepostcorner] of */
extern    FloatM OTP_BCC_VALUE[8][6][2]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
extern    FloatM2D OTP_BCC_DELTA_VALUE; /* :MANUAL FIX REQUIRED: array dimensions are : 0..7,vttype */

extern     BoolM GL_VT0DRL_RESULT, GL_VT1DRL_RESULT, GL_BCC0DRL_RESULT, GL_BCC1DRL_RESULT;


extern     IntM2D BANK_ERS_PULSE; /* array dimensions were : 0..7,0..15 */
extern     IntM2D BANK_PRECON_PULSE; /* array dimensions were : 0..7,0..15 */

                        /*bank,row#,word#,site*/
extern     StringM2D OTP_ID_INFO; /* array[0..7,0..128,1..NUMSITES] of string[4] OTP_ID_INFO; */
extern     IntM2D OTP_ID_INFO_VAL; /* array dimensions were : 0..7,0..128 */
extern     StringM2D OTP_VT_INFO; /* array[0..7,0..128,1..NUMSITES] of string[4] OTP_VT_INFO; */
extern     FloatM2D OTP_VT_INFO_VAL; /* array dimensions were : 0..7,0..128 */
extern     StringM2D OTP_BCC_INFO; /* array[0..7,0..128,1..NUMSITES] of string[4] OTP_BCC_INFO; */
extern     FloatM2D OTP_BCC_INFO_VAL; /* array dimensions were : 0..7,0..128 */
extern     IntM2D OTP_BCC_INFO_INTVAL; /* array dimensions were : 0..7,0..128 */
extern     IntM2D OTP_LOG1_INFO_VAL; /* array dimensions were : 0..7,0..128 */
extern     IntM2D OTP_LOG3_INFO_VAL; /* array dimensions were : 0..7,0..128 */

extern     IntM EFCHKSUM_MSW, EFCHKSUM_LSW;
extern     StringM1D FRM_OTP_BANK_EFSUM_HI_BCD, FRM_OTP_BANK_EFSUM_LO_BCD; /* array dimensions were : 0..7 */
extern     IntM1D FRM_OTP_BANK_EFSUM_HI_VAL, FRM_OTP_BANK_EFSUM_LO_VAL; /* array dimensions were : 0..7 */
extern     StringM1D FRM_OTP_BANK_FOSC_HI_BCD, FRM_OTP_BANK_FOSC_LO_BCD; /* array dimensions were : 0..7 */
extern     IntM1D FRM_OTP_BANK_FOSC_HI_VAL, FRM_OTP_BANK_FOSC_LO_VAL; /* array dimensions were : 0..7 */


    /*+++ Global test frequency +++*/
extern    FloatS GL_F021_PLLENA_SPEED1;
extern    FloatS GL_F021_PLLDIS_SPEED1;


    /*+++ Global maxtime +++*/
extern    FloatS GL_F021_MAXTIME,GL_F021_PARAM_MAXTIME;

extern    FloatS GL_F021_BANK_MAXTIME;
extern    FloatS GL_F021_BANK_ERS_MAXTIME;
extern    FloatS GL_F021_BANK_PGM_MAXTIME;
extern    FloatS GL_F021_BANK_SWPGM_MAXTIME;
extern    FloatS GL_F021_BANK_VT_MAXTIME;

extern    FloatS GL_F021_SECT_MAXTIME;
extern    FloatS GL_F021_SECT_ERS_MAXTIME;
extern    FloatS GL_F021_SECT_PGM_MAXTIME;
extern    FloatS GL_F021_SECT_VT_MAXTIME;

extern    FloatS GL_VT1_UV_SEARCH_START;
extern    FloatS GL_VT1_UV_SEARCH_STOP;
extern    FloatS GL_VT1_UV_SEARCH_RESOL;
extern    FloatS GL_VT1_SEARCH_START;
extern    FloatS GL_VT1_SEARCH_STOP;
extern    FloatS GL_VT1_SEARCH_RESOL;
extern    FloatS GL_VT0_SEARCH_START;
extern    FloatS GL_VT0_SEARCH_STOP;
extern    FloatS GL_VT0_SEARCH_RESOL;
extern    FloatS GL_VT1_SHIP_SEARCH_START;
extern    FloatS GL_VT1_SHIP_SEARCH_STOP;
extern    FloatS GL_VT1_SHIP_SEARCH_RESOL;
extern    FloatS GL_VT0_ERSSTR_SEARCH_START;
extern    FloatS GL_VT0_ERSSTR_SEARCH_STOP;
extern    FloatS GL_VT1_ERSSTR_SEARCH_STOP;

    /*+++ Global misc +++*/
extern    BoolS GL_MULTISHELL,GL_SAVEFLCOFENA;
extern    BoolS GL_MP3PKG_FLOW;
extern    BoolS GL_VPP_PRESENT;
extern    FlashPumpType GL_PUMPTYPE;
extern    FlashBankType GL_BANKTYPE;
extern    StringM GL_F021_FAIL_PATT;
extern    BoolM GL_F021_LOG_FAIL_PATT;
extern    BoolM GL_F021_COF_PASS;
extern    StringM GL_F021_COF_1STFAILTEST; /* array dimensions were : 1..NUMSITES */
    /*for continue-on-fail*/
extern    StringM1D GL_F021_COF_INFOS; /* array dimensions were : 1..40 */
extern    BoolM1D GL_F021_COF_INFOS_FULL; /* array dimensions were : 1..40 */
    /*for esda delta-vt*/
extern    IntS GL_PREV_TNUM_VT;
extern    BoolM GL_FLASH_RETEST;
extern    BoolM GL_FLASH_RETEST_GEC;
extern    BoolM GL_FLASH_SAVESITES; 
extern    BoolM GL_FLASH_EGSTRESS_STATUS;
extern    StringM GL_F021_LOG_SOFTBIN_STAT;
extern    StringM GL_F021_LOG_SOFTBIN_PATT;

extern    IntS GL_TPADMIN,GL_TPADMAX;

extern    BoolS GL_DO_REFARR_ERS_ADAPTIVE;

extern    BoolS GL_DO_RESTORE_OTP_ON_FAIL;
extern    BoolM SITE_TO_RESTORE_OTP;

extern    BoolS GL_DO_TWLOGALL_IPROG_DRV,GL_DO_TWLOGALL_ISA_LD,GL_DO_TWLOGALL_ISA_NLD;

extern    IntS GL_DO_RD_WITH_TOPTION;
extern    BoolS GL_DO_VT_MAIN_USING_PBIST, GL_DO_VT_OTP_USING_PBIST, GL_DO_VT_USING_BIDI, GL_DO_VT_USING_INTERNAL;
extern    BoolS GL_DO_BCC_MAIN_USING_PBIST, GL_DO_BCC_OTP_USING_PBIST;
extern    BoolS GL_DO_FL_PBIST, GL_DO_PGM_USING_PBIST, GL_DO_ERS_BY_SECTOR, GL_DO_REDENA;
extern    BoolS GL_DO_MASK_1S_BCC0_DRL_PBIST;
extern    BoolS GL_DO_BCCVT_RCODE_ENA;
extern    IntS GL_DO_BCCVT_RCODE_BANK;

extern    BoolS GL_DO_TNI_CODE;
extern    BoolS GL_DO_VT_HISTOGRAM;

extern    FlashLeakType GL_DO_WLS_LEAK_OPTION, GL_DO_BLS_LEAK_OPTION,
   GL_DO_CGS_LEAK_OPTION, GL_DO_EGCSS_LEAK_OPTION, GL_DO_EGS_LEAK_OPTION;

extern    BoolS GL_DO_VT_FIRST, GL_DO_DRL0_USING_VT, GL_DO_DRL1_USING_VT;


extern    IntS GL_ASICHI, GL_ASICLO;
extern    IntS GL_PGMREV;

extern    BoolS GL_IGNORE_FLOWBYTE;
extern    StringS GL_MP1_FLWBYTE;
extern    StringS GL_MP1REP_FLWBYTE;
extern    StringS GL_MP2_FLWBYTE;
extern    StringS GL_MP2DRL_FLWBYTE;
extern    StringS GL_MP3DRL_FLWBYTE;
extern    StringS GL_MP3_FLWBYTE;
extern    StringS GL_FT1DRL_FLWBYTE;
extern    StringS GL_FT1_FLWBYTE;
extern    StringS GL_FT2_FLWBYTE;
extern    StringS GL_FT3_FLWBYTE;

extern    BoolM GL_FLWBIT0_PGM,GL_FLWBIT1_PGM,GL_FLWBIT2_PGM,GL_FLWBIT3_PGM,
   GL_FLWBIT4_PGM,GL_FLWBIT5_PGM,GL_FLWBIT6_PGM,GL_FLWBIT7_PGM,
   GL_FLWBIT8_PGM,GL_FLWBIT9_PGM,GL_FLWBIT10_PGM,GL_FLWBIT11_PGM,
   GL_FLWBIT12_PGM,GL_FLWBIT13_PGM,GL_FLWBIT14_PGM,GL_FLWBIT15_PGM;


extern    IntS GL_DEV_PKG_ID;
extern    IntS GL_DEV_MEMSZ;

    /*added for soft trim*/
extern    IntS GL_AUXBG_MAXEFUSE;
extern    IntS GL_AUXIREF_MAXEFUSE;
extern    IntS GL_MAINBG_MAXEFUSE;
extern    IntS GL_MAINIREF_MAXEFUSE;
extern    IntS GL_VHV_SLPCT_MAXEFUSE, GL_VSA5CT_MAXEFUSE;
extern    BoolS GL_DO_FLASHTRIM;
extern    BoolS GL_DO_BG_DIRECT_TRIM;
extern    BoolS GL_DO_BG_ADAPT_TRIM;
extern    BoolS GL_DO_BG_CHAR_TRIM;
extern    BoolS GL_DO_IREF_ADAPT_TRIM;
extern    BoolS GL_DO_IREF_CHAR_TRIM;
extern    BoolS GL_DO_IREF_PMOS_TRIM;
extern    BoolM SITE_TO_FTRIM;
extern    BoolS GL_DO_FOSC_TRIM;
extern    BoolS GL_DO_EFBIT22_TRIM;

    /*added for repair*/
extern    BoolS GL_DO_REPAIR;
extern    BoolM SITE_TO_REPAIR;
extern    BoolM2D BLOCK_TO_REPAIR; /* array dimensions were : 0..7,0..15 */
extern    BoolM1D BANK_TO_REPAIR; /* array dimensions were : 0..7 */
extern    BoolM SITE_TO_REPAIR_FAST;
extern    BoolM SITE_GOOD_REPAIR_FAST;
extern    BoolM SITE_TO_REPAIR_SLOW;
extern    BoolM SITE_GOOD_REPAIR_SLOW;
extern    IntS FAKEREP_SOL[8][16][4]; /*array[0..7,0..15,0..3] of IntS FAKEREP_SOL;*/ /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */ /*hold pre-defined artificial rep solution*/
extern    IntS GL_FAKEREP_SAMPLING, GL_FAKEREP_COUNT;
extern    BoolS GL_FAKEREP_ENA;
extern    IntS GL_PMOS_TRIM_COUNT;

extern    StringM1D FRM_OTP_WD8, FRM_OTP_WD9; /* array dimensions were : 0..7 */
extern    StringM FRM_OTP_VERSION_BCD;

extern    StringM FRM_OTP_ASICHI_BCD, FRM_OTP_ASICLO_BCD,
   FRM_OTP_LOTHI_BCD,  FRM_OTP_LOTLO_BCD,
   FRM_OTP_FLWBYTE_BCD,
   FRM_OTP_WAFER_BCD,  FRM_OTP_XPOS_BCD, FRM_OTP_YPOS_BCD;

extern    IntM FRM_OTP_FLWBYTE_VALUE;

extern    StringM FRM_OTP_PKGID_BCD, FRM_OTP_MEMSZ_BCD;

extern    StringM FRM_OTP_OTPCHKSUM_HI_BCD,FRM_OTP_OTPCHKSUM_LO_BCD,FRM_OTP_NUMSECT_BCD,FRM_OTP_NUMBANK_BCD,
   FRM_OTP_PSU_ESU_BCD,FRM_OTP_PVSU_EVSU_BCD,FRM_OTP_RVSU_PVACC_BCD,FRM_OTP_EXEZ_CVSU_BCD,
   FRM_OTP_PH_RH_BCD,FRM_OTP_PVH_PVH2_BCD,FRM_OTP_EH_SEQ_BCD,FRM_OTP_VSTAT_SMFREQ_BCD,
   FRM_OTP_VHVESTART_BCD,FRM_OTP_VHVESTEP_BCD,FRM_OTP_VHVESTOP_BCD,FRM_OTP_MAXPP_BCD,
   FRM_OTP_MAXEP_BCD,FRM_OTP_PPW_BCD,FRM_OTP_EPW_HI_BCD,FRM_OTP_EPW_LO_BCD,FRM_OTP_VHVP_BCD,
   FRM_OTP_VHVE_BCD,FRM_OTP_VHVPV_BCD,FRM_OTP_VCG_VINH_BCD,FRM_OTP_VSL_VWL_BCD,FRM_OTP_VRD_VSA5_BCD,
   FRM_OTP_APICHKSUM_HI_BCD,FRM_OTP_APICHKSUM_LO_BCD,FRM_OTP_BUSWIDTH_BCD,FRM_OTP_EEWIDTH_BCD,
   FRM_OTP_CPU1CPU2_BCD,FRM_OTP_CPU3CPU4_BCD,FRM_OTP_LPO_CAL_BCD,FRM_OTP_SPEEDBIN_BCD,
   FRM_OTP_FOSC_BCD,FRM_OTP_MP1REV_BCD,FRM_OTP_MP2REV_BCD,FRM_OTP_MP3REV_BCD,
   FRM_OTP_MP4FT1REV_BCD,FRM_OTP_MP5FT2REV_BCD,FRM_OTP_MP6FT3REV_BCD,
   FRM_OTP_FT4REV_BCD,FRM_OTP_FT5REV_BCD;

extern    StringM FRM_OTP_IREFPMOS_BCD,FRM_OTP_IREFCV_BCD;

extern    StringM2D FRM_OTP_SECT_PREDRL_VT_BCD; /* array dimensions were : 0..7,0..15 */
extern    StringM2D FRM_OTP_SECT_PREFT1_VT_BCD; /* array dimensions were : 0..7,0..15 */
extern    StringM1D FRM_OTP_BANK_PREDRL_VT_BCD; /* array dimensions were : 0..7 */
extern    StringM1D FRM_OTP_BANK_PREFT1_VT_BCD; /* array dimensions were : 0..7 */

    /*pre-Drl Vt0/1 in otp at mp1 before bake*/
extern    StringM2D FRM_OTP_BLOCK_PREDRL_VT0_BCD; /* array dimensions were : 0..7,0..15 */
extern    StringM2D FRM_OTP_BLOCK_PREDRL_VT1_BCD; /* array dimensions were : 0..7,0..15 */
    /*pre-Drl2 Vt0/1 in otp at mp2 before bake and going to mp3 testing*/
extern    StringM2D FRM_OTP_BLOCK_PREDRL2_VT0_BCD; /* array dimensions were : 0..7,0..15 */
extern    StringM2D FRM_OTP_BLOCK_PREDRL2_VT1_BCD; /* array dimensions were : 0..7,0..15 */
    /*pre-Drl3 Vt0/1 in otp at mp3 before going to mp4/ft testing*/
extern    StringM2D FRM_OTP_BLOCK_PREDRL3_VT0_BCD; /* array dimensions were : 0..7,0..15 */
extern    StringM2D FRM_OTP_BLOCK_PREDRL3_VT1_BCD; /* array dimensions were : 0..7,0..15 */
extern    StringM2D FRM_OTP_BLOCK_PREFT1_VT_BCD; /* array dimensions were : 0..7,0..15 */

extern    FloatM2D FRM_OTP_SECT_PREDRL_VT_VAL; /* array dimensions were : 0..7,0..15 */
extern    FloatM2D FRM_OTP_SECT_PREFT1_VT_VAL; /* array dimensions were : 0..7,0..15 */
extern    FloatM1D FRM_OTP_BANK_PREDRL_VT_VAL; /* array dimensions were : 0..7 */
extern    FloatM1D FRM_OTP_BANK_PREFT1_VT_VAL; /* array dimensions were : 0..7 */

extern    FloatM2D FRM_OTP_BLOCK_PREDRL_VT0_VAL; /* array dimensions were : 0..7,0..15 */
extern    FloatM2D FRM_OTP_BLOCK_PREDRL_VT1_VAL; /* array dimensions were : 0..7,0..15 */
extern    FloatM2D FRM_OTP_BLOCK_PREDRL2_VT0_VAL; /* array dimensions were : 0..7,0..15 */
extern    FloatM2D FRM_OTP_BLOCK_PREDRL2_VT1_VAL; /* array dimensions were : 0..7,0..15 */
extern    FloatM2D FRM_OTP_BLOCK_PREDRL3_VT0_VAL; /* array dimensions were : 0..7,0..15 */
extern    FloatM2D FRM_OTP_BLOCK_PREDRL3_VT1_VAL; /* array dimensions were : 0..7,0..15 */
extern    FloatM2D FRM_OTP_BLOCK_PREFT1_VT_VAL; /* array dimensions were : 0..7,0..15 */

   
    /*use to specify module/bank/sector/block/quad testing (0,1,2,3,4,5 respectively)*/
extern    IntS MODTYPE;
extern    IntS BANKTYPE;
extern    IntS SECTTYPE;
extern    IntS OTPTYPE;
extern    IntS BLOCKTYPE;
extern    IntS QUADTYPE, ARBTYPE;
extern    IntS FL_MAX_QUADRANT;

extern prepostcorner prepost_type;
 /*OtpOper_type : OtpOper; import;*/


extern    BoolM spare_msbool1,spare_msbool2,
   spare_msbool3,spare_msbool4;
extern    IntM spare_msint1,spare_msint2,
   spare_msint3,spare_msint4,spare_msint5;   
extern    FloatM spare_msFloatS1,spare_msFloatS2,
   spare_msFloatS3,spare_msFloatS4;
extern    StringS spare_str1_256,spare_str2_256;


 /*KChau effuse 02/01/7 - added for flash efuse trimming*/
extern    BoolS enableFTrim;   /*KChau effuse 02/01/7*/

extern    StringM TempDieIDChainStr;
extern    StringM margFlashChainStr;
extern    StringM FlashProgString, TempProgString;
extern    StringM SaveFlashProgString;
extern    StringM BANK_EFSTR, AUXBG_EFSTR, MAINBG_EFSTR, VHV_SLPCT_EFSTR, VSA5CT_EFSTR;
extern    StringM AUXBG_EFSTR_SHORT, MAINBG_EFSTR_SHORT;

 /*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


       /*+++ Ers/Prog/Rd Limit +++*/
extern     FloatS SECT_PRECON_IVDD_ULimit;
extern     FloatS SECT_PRECON_IVDD_LLimit;
extern     FloatS SECT_ERS_IVDD_ULimit;
extern     FloatS SECT_ERS_IVDD_LLimit;
extern     FloatS SECT_READ_IVDD_ULimit;
extern     FloatS SECT_READ_IVDD_LLimit;
extern     FloatS SECT_PRECON_IVDD3VFL_ULimit;
extern     FloatS SECT_PRECON_IVDD3VFL_LLimit;
extern     FloatS SECT_ERS_IVDD3VFL_ULimit;
extern     FloatS SECT_ERS_IVDD3VFL_LLimit;
extern     FloatS SECT_READ_IVDD3VFL_ULimit;
extern     FloatS SECT_READ_IVDD3VFL_LLimit;

extern     FloatS BANK_PRECON_IVDD_ULimit;
extern     FloatS BANK_PRECON_IVDD_LLimit;
extern     FloatS BANK_ERS_IVDD_ULimit;
extern     FloatS BANK_ERS_IVDD_LLimit;
extern     FloatS BANK_READ_IVDD_ULimit;
extern     FloatS BANK_READ_IVDD_LLimit;
extern     FloatS BANK_PRECON_IVDD3VFL_ULimit;
extern     FloatS BANK_PRECON_IVDD3VFL_LLimit;
extern     FloatS BANK_ERS_IVDD3VFL_ULimit;
extern     FloatS BANK_ERS_IVDD3VFL_LLimit;
extern     FloatS BANK_READ_IVDD3VFL_ULimit;
extern     FloatS BANK_READ_IVDD3VFL_LLimit;


     /*for capture esda*/
extern     StringS GL_ESDA_PROGID, my_this_wfrid,my_lotid,my_scribeid;

extern     IntS ESDA_IMG_BLK1;
extern     IntS ESDA_IMG_BLKM1;
extern     IntS ESDA_IMG_BLK1_RED;
extern     IntS ESDA_IMG_BLKM1_RED;
extern     IntS ESDA_IMG_BLK1_SHIP;
extern     IntS ESDA_IMG_BLKM1_SHIP;
      
extern     IntS ESDA_IMG_BLK0;
extern     IntS ESDA_IMG_BLKM0;
extern     IntS ESDA_IMG_BLK0_RED;
extern     IntS ESDA_IMG_BLKM0_RED;
        
extern     IntS ESDA_IMG_OCHK;
extern     IntS ESDA_IMG_MOCHK;
extern     IntS ESDA_IMG_ECHK;
extern     IntS ESDA_IMG_MECHK;
        
extern     IntS ESDA_IMG_UV;
        
extern     IntS ESDA_IMG_PREWLSVT0;
extern     IntS ESDA_IMG_PSTWLSVT0;
extern     IntS ESDA_IMG_PREBLSVT0;
extern     IntS ESDA_IMG_PSTBLSVT0;
extern     IntS ESDA_IMG_PRESLSVT0;
extern     IntS ESDA_IMG_PSTSLSVT0;
        
extern     IntS ESDA_IMG_PREWLSVT1;
extern     IntS ESDA_IMG_PSTWLSVT1;
        
extern     IntS ESDA_IMG_PREDRLOCHK_VT0MIN;
extern     IntS ESDA_IMG_PSTDRLOCHK_VT0MIN;
extern     IntS ESDA_IMG_PREDRLOCHK_VT0MAX;
extern     IntS ESDA_IMG_PREDRLECHK_VT0MIN;
extern     IntS ESDA_IMG_PSTDRLECHK_VT0MIN;
extern     IntS ESDA_IMG_PREDRLECHK_VT0MAX;
        
extern     IntS ESDA_IMG_PREDRLOCHK_VT1;
extern     IntS ESDA_IMG_PSTDRLOCHK_VT1;
extern     IntS ESDA_IMG_PREDRLECHK_VT1;
extern     IntS ESDA_IMG_PSTDRLECHK_VT1;
        
extern     IntS ESDA_IMG_SHIP_VT1;

           
extern     IntS ESDA_IMG_BLK1_OTP;
extern     IntS ESDA_IMG_BLKM1_OTP;
extern     IntS ESDA_IMG_BLK1_SHIP_OTP;
extern     IntS ESDA_IMG_BLKM1_SHIP_OTP;
        
extern     IntS ESDA_IMG_BLK0_OTP;
extern     IntS ESDA_IMG_BLKM0_OTP;
        
extern     IntS ESDA_IMG_OCHK_OTP;
extern     IntS ESDA_IMG_MOCHK_OTP;
extern     IntS ESDA_IMG_ECHK_OTP;
extern     IntS ESDA_IMG_MECHK_OTP;
        
extern     IntS ESDA_IMG_UV_OTP;
        
extern     IntS ESDA_IMG_PREWLSVT0_OTP;
extern     IntS ESDA_IMG_PSTWLSVT0_OTP;
extern     IntS ESDA_IMG_PREBLSVT0_OTP;
extern     IntS ESDA_IMG_PSTBLSVT0_OTP;
extern     IntS ESDA_IMG_PRESLSVT0_OTP;
extern     IntS ESDA_IMG_PSTSLSVT0_OTP;
        
extern     IntS ESDA_IMG_PREWLSVT1_OTP;
extern     IntS ESDA_IMG_PSTWLSVT1_OTP;
        
extern     IntS ESDA_IMG_PREDRLOCHK_VT0MIN_OTP;
extern     IntS ESDA_IMG_PSTDRLOCHK_VT0MIN_OTP;
extern     IntS ESDA_IMG_PREDRLOCHK_VT0MAX_OTP;
extern     IntS ESDA_IMG_PREDRLECHK_VT0MIN_OTP;
extern     IntS ESDA_IMG_PSTDRLECHK_VT0MIN_OTP;
extern     IntS ESDA_IMG_PREDRLECHK_VT0MAX_OTP;
        
extern     IntS ESDA_IMG_PREDRLOCHK_VT1_OTP;
extern     IntS ESDA_IMG_PSTDRLOCHK_VT1_OTP;


     /*for characterization*/
extern     BoolS GL_DO_IMEAS_RDBLK1;
extern     BoolS GL_DO_IMEAS_RDBLK0;
extern     BoolS GL_DO_IMEAS_PRECON;
extern     BoolS GL_DO_IMEAS_ERASE;
extern     BoolS GL_DO_IMEAS_BLS;
extern     BoolS GL_DO_IMEAS_WLS;
extern     BoolS GL_DO_IMEAS_SLS;
     /*+++ CHARZ +++*/
extern     BoolS GL_DO_CHARZ_ERSREFARR, GL_DO_CHARZ_OVRTEMPL_W89;
extern     IntS GL_CHARZ_ERSREFARR_COUNT,GL_CHARZ_ERSREFARR_SAVECOUNT, GL_CHARZ_BCC_COUNT;
extern     IntS GL_CHARZ_ESTAIRSTEP_COUNT,GL_CHARZ_ESTAIRSTEP_SAVECOUNT;
extern     BoolS GL_DO_CHARZ_PPW;
extern     BoolS GL_DO_CHARZ_BCC,GL_DO_CHARZ_VT;
extern     IntS GL_DO_CHARZ_BCC_OPTION,GL_DO_CHARZ_VT_OPTION;
extern     BoolS GL_DO_CHARZ_IREF_RD,GL_DO_CHARZ_IREF_PVFY,GL_DO_CHARZ_IREF_EVFY,GL_DO_CHARZ_IREF_CVFY,GL_DO_CHARZ_IREF_RM01;
extern     BoolS GL_DO_CHARZ_IPMOS_RD,GL_DO_CHARZ_IPMOS_PVFY,GL_DO_CHARZ_IPMOS_EVFY,GL_DO_CHARZ_IPMOS_CVFY;
extern     BoolS GL_DO_CHARZ_INTERNAL_IREF_VCG;
extern     BoolS GL_DO_CHARZ_STRESS;
extern     BoolS GL_DO_CHARZ_FREQ_RANDCODE;
extern     IntS GL_CHARZ_FREQ_RANDCODE_COUNT,GL_CHARZ_FREQ_RANDCODE_SAMPLING;
extern     BoolS GL_DO_CHARZ_SAMPNOISE;

extern     StringS GL_PREVIOUS_SHELL;
extern     MBoxRAMType GL_MBoxRAMTYPE;

extern     BoolS GL_PLELL_FORMAT;

     /*reference variables*/
extern     FloatS IBIT_DESIGN_LIM, IBIT_CMPT_LIM;
extern     FloatS1D IREF_PMOSRATIO; /* array dimensions were : 0..31 */
extern     IntS1D IREF_PMOSCODE; /* array dimensions were : 0..31 */
extern     StringS1D IREF_PMOSCODE_STR; /* array dimensions were : 0..31 */
     /*hold pmos trim code/solution per bank*/
extern     StringM1D IREF_PMOSTRIMCODE_STR; /* array dimensions were : 0..7 */
extern     StringS BANKEF_BIT0_4, BANKEF_BIT10_23, BANKEF_BIT29_31, BANKEF_BIT10_23_BIT17SET;
extern     StringS1D BANKEF_BIT10_23_BANKNUM; /* array dimensions were : 0..7 */
extern     BoolM1D BANK_TO_PMOS_TRIM; /* array dimensions were : 0..7 */
extern     BoolM SITE_IPMOS_TRIMMED;
extern     IntM IPMOS_BANKENA_MSW, IPMOS_BANKENA_LSW;
extern     IntM IPMOS_TRIMCODE1_MSW, IPMOS_TRIMCODE1_LSW;
extern     IntM IPMOS_TRIMCODE2_MSW, IPMOS_TRIMCODE2_LSW;
extern     IntM2D IPMOS_TRIMCODE_SAVED; /* array dimensions were : 0..7,0..1 */
extern     IntM2D IPMOS_TRIMCODE_EFUSE; /* array dimensions were : 0..7,0..1 */
extern     IntM2D IPMOS_TRIMCODE_VAL; /* array dimensions were : 0..7,0..1 */

extern     BoolS GL_DO_VHV_CT_TRIM;
extern     IntM VHV_PG_CT_TRIMSAVED, VHV_ER_CT_TRIMSAVED, VHV_PV_CT_TRIMSAVED, VHV_OTHER_CT_TRIMSAVED;
extern     IntM VHV_ER_CT_STARTSAVED, VHV_ER_CT_STOPSAVED, VHV_ER_CT_STEPSAVED, VHV_MAXPP_SAVED;
extern     IntM VHV_ER_CT_STARTSAVED_EMU, VHV_ER_CT_STEPSAVED_EMU, VHV_ER_CT_STOPSAVED_EMU, VHV_PG_CT_TRIMSAVED_EMU, VHV_ER_CT_TRIMSAVED_EMU, VHV_PV_CT_TRIMSAVED_EMU, VHV_OTHER_CT_TRIMSAVED_EMU;
extern     IntM VHV_SLPCT_TRIMSAVED, VSA5CT_TRIMSAVED;
     /*to hold trim solution use for adapt trimming*/
extern     IntM MAINBG_TRIMSAVED, MAINIREF_TRIMSAVED, FOSC_TRIMSAVED;


    /*++++ added for 32bit ++++*/
extern    IntS TNUM_PUMP_VRD0;
extern    IntS TNUM_PUMP_VRD1;
extern    IntS TNUM_PUMP_VRD2;
extern    IntS TNUM_PUMP_VRD3;
extern    IntS TNUM_PUMP_VRD4;
extern    IntS TNUM_PUMP_VRD5;
extern    IntS TNUM_PUMP_VRD6;
extern    IntS TNUM_PUMP_VRD7;


extern     IntS GL_VT_TTR_OPTION,
    GL_OTP_VT_TTR_OPTION;
extern     IntS GL_EQUIV_TNUM;
extern     BoolS GL_TTR_ENA_VT;
extern     FloatS GL_INTEXT_VT_SEARCH_WINDOW;


 /*------------------*/

extern    IntS TNUM_PUMP_MAINBG;
extern    IntS TNUM_PUMP_VHVPROG, TNUM_PUMP_VHVPVFY, TNUM_PUMP_VHVERS;
extern    IntS TNUM_PUMP_VSL;
extern    IntS TNUM_PUMP_VREAD;
extern    IntS TNUM_PUMP_VSA5_READ, TNUM_PUMP_VSA5_PROG, TNUM_PUMP_VSA5_PVFY, 
   TNUM_PUMP_VSA5_ERS, TNUM_PUMP_VSA5_EVFY, TNUM_PUMP_VSA5_CVFY;
extern    IntS TNUM_PUMP_VWL_READ, TNUM_PUMP_VWL_PROG, TNUM_PUMP_VWL_PVFY, 
   TNUM_PUMP_VWL_ERS, TNUM_PUMP_VWL_EVFY, TNUM_PUMP_VWL_CVFY;
extern    IntS TNUM_PUMP_VCG2P5_READ, TNUM_PUMP_VCG2P5_PROG, TNUM_PUMP_VCG2P5_PVFY, 
   TNUM_PUMP_VCG2P5_ERS, TNUM_PUMP_VCG2P5_EVFY, TNUM_PUMP_VCG2P5_CVFY;
extern    IntS TNUM_PUMP_VINH_READ, TNUM_PUMP_VINH_PROG, TNUM_PUMP_VINH_PVFY, 
   TNUM_PUMP_VINH_ERS, TNUM_PUMP_VINH_EVFY, TNUM_PUMP_VINH_CVFY;
extern    IntS TNUM_PUMP_VHV2X_PROG;
extern    IntS TNUM_PUMP_VHV_FORCE_PROG, TNUM_PUMP_VHV_FORCE_PVFY, TNUM_PUMP_VHV_FORCE_ERS;

extern    IntS TNUM_BANK_VRDBUF;
extern    IntS TNUM_BANK_IREF_READ_EVEN, TNUM_BANK_IREF_PVFY_EVEN, TNUM_BANK_IREF_EVFY_EVEN, TNUM_BANK_IREF_CVFY_EVEN;
extern    IntS TNUM_BANK_IREF_READ_ODD, TNUM_BANK_IREF_PVFY_ODD, TNUM_BANK_IREF_EVFY_ODD, TNUM_BANK_IREF_CVFY_ODD;
extern    IntS TNUM_BANK_IREF_RDM0_EVEN, TNUM_BANK_IREF_RDM0_ODD, TNUM_BANK_IREF_RDM1_EVEN, TNUM_BANK_IREF_RDM1_ODD;
extern    IntS TNUM_BANK_IPMOS_READ_EVEN, TNUM_BANK_IPMOS_PVFY_EVEN, TNUM_BANK_IPMOS_EVFY_EVEN, TNUM_BANK_IPMOS_CVFY_EVEN;
extern    IntS TNUM_BANK_IPMOS_READ_ODD, TNUM_BANK_IPMOS_PVFY_ODD, TNUM_BANK_IPMOS_EVFY_ODD, TNUM_BANK_IPMOS_CVFY_ODD;
extern    IntS TNUM_SA_IREF_LOAD_READ_EVEN, TNUM_SA_IREF_LOAD_READ_ODD, TNUM_SA_IREF_NOLOAD_READ_EVEN, TNUM_SA_IREF_NOLOAD_READ_ODD;
extern    IntS TNUM_IWLDRV_PROG_EVEN, TNUM_IWLDRV_PROG_ODD;
extern    IntS TNUM_BANK_REVTUNN_STRESS, TNUM_BANK_PTHRU_STRESS, TNUM_BANK_THINOX_STRESS;
extern    IntS TNUM_BANK_PGMFF_STRESS;
extern    IntS TNUM_BANK_TUNOX_STRESS, TNUM_BANK_ONO_STRESS;
extern    IntS TNUM_BANK_RDDIST_STRESS;
extern    IntS TNUM_BANK_CSFG_STRESS;
extern    IntS TNUM_BANK_WLS, TNUM_BANK_WLS_ODD, TNUM_BANK_WLS_EVEN;
extern    IntS TNUM_BANK_BLS, TNUM_BANK_BLS_ODD, TNUM_BANK_BLS_EVEN;
extern    IntS TNUM_BANK_CGS, TNUM_BANK_CGS_ODD, TNUM_BANK_CGS_EVEN;
extern    IntS TNUM_BANK_EGCSS;
extern    IntS TNUM_BANK_EGS;
extern    IntS TNUM_BANK_REFARR_ERS;

extern    IntS TNUM_BANK_INTERNAL_IREF_READ_EVEN, TNUM_BANK_INTERNAL_IREF_PVFY_EVEN, TNUM_BANK_INTERNAL_IREF_EVFY_EVEN, TNUM_BANK_INTERNAL_IREF_CVFY_EVEN;
extern    IntS TNUM_BANK_INTERNAL_IREF_READ_ODD, TNUM_BANK_INTERNAL_IREF_PVFY_ODD, TNUM_BANK_INTERNAL_IREF_EVFY_ODD, TNUM_BANK_INTERNAL_IREF_CVFY_ODD;
extern    IntS TNUM_BANK_INTERNAL_IREF_RDM0_EVEN, TNUM_BANK_INTERNAL_IREF_RDM0_ODD, TNUM_BANK_INTERNAL_IREF_RDM1_EVEN, TNUM_BANK_INTERNAL_IREF_RDM1_ODD;
extern    IntS TNUM_BANK_INTERNAL_IPMOS_READ_EVEN, TNUM_BANK_INTERNAL_IPMOS_PVFY_EVEN, TNUM_BANK_INTERNAL_IPMOS_EVFY_EVEN, TNUM_BANK_INTERNAL_IPMOS_CVFY_EVEN;
extern    IntS TNUM_BANK_INTERNAL_IPMOS_READ_ODD, TNUM_BANK_INTERNAL_IPMOS_PVFY_ODD, TNUM_BANK_INTERNAL_IPMOS_EVFY_ODD, TNUM_BANK_INTERNAL_IPMOS_CVFY_ODD;
extern    IntS TNUM_BANK_INTERNAL_IPMOS_RDM0_ODD, TNUM_BANK_INTERNAL_IPMOS_RDM0_EVEN, TNUM_BANK_INTERNAL_IPMOS_RDM1_ODD, TNUM_BANK_INTERNAL_IPMOS_RDM1_EVEN;

extern    IntS TNUM_BANK_RDM0ECHK, TNUM_BANK_RDM0OCHK, TNUM_BANK_RDM1ECHK, TNUM_BANK_RDM1OCHK;
extern    IntS TNUM_BANK_ERS_WEAK;
extern    IntS TNUM_BANK_BCC_0S,TNUM_BANK_BCC_0S_MIN,TNUM_BANK_BCC_1S,TNUM_BANK_BCC_1S_MAX,TNUM_BANK_BCC_ECHK,TNUM_BANK_BCC_OCHK;
extern    IntS TNUM_BANK_BCC_TCR6, TNUM_BANK_BCC_TCR38, TNUM_BANK_BCC_TCR39;
extern    IntS TNUM_BITLINE_ACCESS;


extern    IntS TNUM_TARGET_BLOCK, TNUM_TARGET_SECT, TNUM_TARGET_QUAD, TNUM_TARGET_ARB, TNUM_TARGET_OTP, TNUM_TARGET_OTP_SEMI;
extern    IntS TNUM_DATA_0S, TNUM_DATA_1S, TNUM_DATA_ECHK, TNUM_DATA_OCHK, TNUM_DATA_ARBITRARY, TNUM_DATA_ARB_ECC, TNUM_DATA_LOGIC_ECHK;
extern    IntS TNUM_BANK_VT_TCR5, TNUM_BANK_VT_TCR6, TNUM_BANK_VT_TCR39;
extern    IntS TNUM_TOPTION_NORMAL, TNUM_TOPTION_PSARD, TNUM_TOPTION_ESDARD, TNUM_TOPTION_REPAIRRD;
extern    IntS TNUM_DIV2, TNUM_MULT1, TNUM_MULT2, TNUM_MULT4;
extern    IntS TNUM_TCR5, TNUM_TCR6, TNUM_TCR38, TNUM_TCR39, TNUM_TCR72;
extern    IntS TNUM_FASTPRECON, TNUM_REDUNDENA, TNUM_ECCENA;
extern    IntS TNUM_PBIST_RDM1S, TNUM_PBIST_RDM0S, TNUM_PBIST_VT1S, TNUM_PBIST_VT0S, TNUM_PBIST_BCC1S, TNUM_PBIST_BCC0S, TNUM_PBIST_CUSTCR;
extern    IntS TNUM_PBIST_IVT0S;
extern    IntS TNUM_PBIST_MASK1S;
extern    IntS TNUM_BIDI_VT;
extern    IntS TNUM_PROG_RANDCODE, TNUM_EXEC_RANDCODE;

extern    IntS OVRIND_PSU,OVRIND_ESU,OVRIND_CSU,OVRIND_PVSU,OVRIND_EVSU,OVRIND_RPTVSU,OVRIND_CVSU,
   OVRIND_AEXEZSU,OVRIND_PVACC,OVRIND_PH,OVRIND_EH,OVRIND_RH,OVRIND_PVH,OVRIND_PVH2,
   OVRIND_PPW,OVRIND_EPW,OVRIND_EPWHI,OVRIND_VSTAT;

extern    IntS OVRIND_MAXPP,OVRIND_MAXEP,OVRIND_VHV_ESTART_CT,OVRIND_VHV_ESTOP_CT,OVRIND_VHV_ESTEP;

extern    IntS OVRIND_VHV_PG_CT,OVRIND_VHV_ER_CT,OVRIND_VHV_PV_CT,OVRIND_VCG2P5_CT,OVRIND_VINH_CT,
   OVRIND_VSL_CT,OVRIND_VWL_CT,OVRIND_VRD_CT,OVRIND_VSA5_CT,OVRIND_PUMP_SEQ;

extern    IntS OVRIND_PV_NMOS_RAT,OVRIND_PV_PMOS_EVEN_RAT,OVRIND_PV_PMOS_ODD_RAT,OVRIND_PV_PRECHARGE,
   OVRIND_EV_NMOS_RAT,OVRIND_EV_PMOS_EVEN_RAT,OVRIND_EV_PMOS_ODD_RAT,OVRIND_EV_PRECHARGE,
   OVRIND_CV_NMOS_RAT,OVRIND_CV_PMOS_EVEN_RAT,OVRIND_CV_PMOS_ODD_RAT,OVRIND_CV_PRECHARGE,
   OVRIND_RDM0_NMOS_RAT,OVRIND_RDM0_PMOS_EVEN_RAT,OVRIND_RDM0_PMOS_ODD_RAT,OVRIND_RDM0_PRECHARGE,
   OVRIND_RDM1_NMOS_RAT,OVRIND_RDM1_PMOS_EVEN_RAT,OVRIND_RDM1_PMOS_ODD_RAT,OVRIND_RDM1_PRECHARGE,
   OVRIND_RD_NMOS_RAT,OVRIND_RD_PMOS_EVEN_RAT,OVRIND_RD_PMOS_ODD_RAT,OVRIND_RD_PRECHARGE;

extern    IntS OVRIND_REFBIT_HV_PROTECTION,OVRIND_ALL_RLBL_OFF,OVRIND_OVRIDE_OTP_RATIO,OVRIND_LPWMODE_NO_TB_SPLIT,
   OVRIND_USE_1P5X_SA_TIMING,OVRIND_COL_CHANGEABLE_IN_PGM,OVRIND_IGNORE_BU_RD_RATIO,OVRIND_MASTER_REDUND_DISABLE,
   OVRIND_DISABLE_VRDBUF,OVRIND_INC_PV_SA_TIMING,OVRIND_OTP_HV_PROTECTION;

extern    IntS W8_0_DEF_CAT0, W8_4_DEF_CAT0, W8_8_DEF_CAT0, W8_C_DEF_CAT0,
   W9_0_DEF_CAT0, W9_4_DEF_CAT0, W9_8_DEF_CAT0, W9_C_DEF_CAT0,
   W8_0_DEF_CAT1, W8_4_DEF_CAT1, W8_8_DEF_CAT1, W8_C_DEF_CAT1,
   W9_0_DEF_CAT1, W9_4_DEF_CAT1, W9_8_DEF_CAT1, W9_C_DEF_CAT1,
   W8_0_DEF_CAT2, W8_4_DEF_CAT2, W8_8_DEF_CAT2, W8_C_DEF_CAT2,
   W9_0_DEF_CAT2, W9_4_DEF_CAT2, W9_8_DEF_CAT2, W9_C_DEF_CAT2,
   W8_0_DEF_CAT3, W8_4_DEF_CAT3, W8_8_DEF_CAT3, W8_C_DEF_CAT3,
   W9_0_DEF_CAT3, W9_4_DEF_CAT3, W9_8_DEF_CAT3, W9_C_DEF_CAT3,
   W8_0_DEF_CAT4, W8_4_DEF_CAT4, W8_8_DEF_CAT4, W8_C_DEF_CAT4,
   W9_0_DEF_CAT4, W9_4_DEF_CAT4, W9_8_DEF_CAT4, W9_C_DEF_CAT4,
   W8_0_DEF_CAT5, W8_4_DEF_CAT5, W8_8_DEF_CAT5, W8_C_DEF_CAT5,
   W9_0_DEF_CAT5, W9_4_DEF_CAT5, W9_8_DEF_CAT5, W9_C_DEF_CAT5;

extern    BoolS IsMainArray, IsBcc;

extern    BoolS GL_DO_GET_WORSTBIT;
extern    FloatM FL_WORSTBIT_IREF, FL_WORSTBIT_VCG;
extern    IntM FL_WORSTBIT_FADDR, FL_WORSTBIT_FCOUNT;
extern    IntM1D FL_WORSTBIT_FDATA; /* array dimensions were : 1..10 */

extern    BoolS GL_SKIP_MP2_FLASHFLOW;
extern    StringS GL_EFUSE_RD_CODEOPTION, GL_EFUSE_PG_CODEOPTION;

extern    FloatM1D FL_IV_DATA; /* array dimensions were : 1..512 */
extern    IntS FL_IV_DATA_COUNT;
extern    BoolS GL_DO_SAVE_IV_DATA;

extern    FloatS1D SAMP_NOISE_ULIM; /* array dimensions were : 0..7 */
extern    FloatS1D DRLVT0_LDELTA, DRLVT0_UDELTA, DRLVT0_Median_ULimit; /* array dimensions were : 0..7 */

extern    IntS ADDR_RAM_INC;

extern    BoolS GL_DO_CHARZ_SAMP_ACCY, GL_DO_SAVE_SAMP_ACCY_DATA;
extern    IntS GL_DO_CHARZ_SAMP_ACCY_COUNT, GL_DO_CHARZ_SAMP_ACCY_SAMPLING;
extern    FloatM2D FL_SAMP_ACCY_VT; /* array dimensions were : 0..7,0..15 */
extern    IntM2D FL_SAMP_ACCY_VT_FADDR_MSW,FL_SAMP_ACCY_VT_FADDR_LSW,
   FL_SAMP_ACCY_VT_FDATA_MSW,FL_SAMP_ACCY_VT_FDATA_LSW,
   FL_SAMP_ACCY_VT_FDATA1_MSW,FL_SAMP_ACCY_VT_FDATA1_LSW; /* array dimensions were : 0..7,0..15 */

#endif
