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

#include <f021_flashvar.h>

     F021_FlashRec F021_Flash;
     F021_RunCodeRec F021_RunCode;
     F021_MBIRec F021_MBI;
     Flash_TCR_Rec TCR;
     Flash_ESDA_Rec FLEsda;
     FlashVTBCCRec MainVT,OtpVT;
     FlashVTBCCRec MainBCC,OtpBCC;
     FlashStressRec TPadSeq;

     IntM1D FL_TESTLOG_ARR(136); 
     IntM1D FL_SCRAM_CAPT_ARR(4096); 

     IntS GL_FLTESTID;
     BoolS TI_FLASHDEBUG_PRINT;

     StringS GL_VLC_LIBREV;
     IntM GL_SHELL_LIBREV;
     IntM GL_SHELL_TAPIREV;
     IntM GL_SHELL_FAPIREV;
     IntM GL_SHELL_CONFIGREV;
     IntM GL_SHELL_SUPPORTREV;

     BoolS GL_USE_RAMPMT_X64;
     BoolS GL_DO_ESDA_WITH_SCRAM, GL_DUMP_RAWESDA_TOFILE, GL_DO_SOURCE_WITH_SCRAM;
     BoolM GL_SITE_TO_ESDA;
     BoolM2D GL_BANK_TO_ESDA(8,16);

     FloatS Main_Icmp10_Target, Main_Icmp10_LLim, Main_Icmp10_ULim;

     FloatS Aux_Iref_Target;
     FloatS Main_Iref_Target;
     FloatS MainBG_VTarget;
     FloatS AuxBG_VLLim;
     FloatS AuxBG_VULim;
     FloatS MainBG_VLLim;
     FloatS MainBG_VULim;
     FloatS Aux_Iref_LLim;
     FloatS Aux_Iref_ULim;
     FloatS Main_Iref_LLim;
     FloatS Main_Iref_ULim;
     FloatS VDD5V0_Target;
     FloatS VDD5V0_LLim;
     FloatS VDD5V0_ULim;
     FloatS VDD5V1_Target;
     FloatS VDD5V1_LLim;
     FloatS VDD5V1_ULim;
     FloatS Vread01_LLim;
     FloatS Vread01_ULim;
     FloatS Vread23_LLim;
     FloatS Vread23_ULim;
     FloatS Vread45_LLim;
     FloatS Vread45_ULim;
     FloatS Vread67_LLim;
     FloatS Vread67_ULim;
     FloatS VppErs_Target;
     FloatS VppErs_LLim;
     FloatS VppErs_ULim;
     FloatS VppCmpt_Target;
     FloatS VppCmpt_LLim;
     FloatS VppCmpt_ULim;
     FloatS VppProg_Target;
     FloatS VppProg_LLim;
     FloatS VppProg_ULim;



     FloatS BG_tolerance;
     FloatS Iref_tolerance;

     FloatS IPMOS_Trim_Target, IPMOS_Trim_ULim, IPMOS_Trim_LLim, IPMOS_Trim_Toler;
     FloatS IrefRd_Trim_Target, IrefRd_Trim_ULim, IrefRd_Trim_LLim, IrefRd_Trim_Toler;
     FloatS IrefEv_Trim_Target, IrefEv_Trim_ULim, IrefEv_Trim_LLim, IrefEv_Trim_Toler;
     FloatS MainBG_Target, MainBG_ULim, MainBG_LLim;
     FloatS VHV_Prog_Target, VHV_Prog_ULim, VHV_Prog_LLim;
     FloatS VHV_Prog_SlopeCT_Target;
     FloatS VHV_Prog_SlopeCT_Toler, VSA5CT_Toler;
     FloatS VHV_Pvfy_Target, VHV_Pvfy_ULim, VHV_Pvfy_LLim;
     FloatS VHV_Ers_Target, VHV_Ers_ULim, VHV_Ers_LLim;
     FloatS VHVVregRef_Prog_Target, VHVVregRef_Prog_LLim, VHVVregRef_Prog_ULim;
     FloatS VHVVregRef_Pvfy_Target, VHVVregRef_Pvfy_LLim, VHVVregRef_Pvfy_ULim;
     FloatS VHVVregRef_Ers_Target, VHVVregRef_Ers_LLim, VHVVregRef_Ers_ULim;
     FloatS VHalfRef_Prog_Target, VHalfRef_Prog_LLim, VHalfRef_Prog_ULim;
     FloatS VHalfRef_Pvfy_Target, VHalfRef_Pvfy_LLim, VHalfRef_Pvfy_ULim;
     FloatS VHalfRef_Ers_Target, VHalfRef_Ers_LLim, VHalfRef_Ers_ULim;
     FloatS VHV_TADC_Prog_Target, VHV_TADC_Prog_LLim, VHV_TADC_Prog_ULim;
     FloatS VHV_TADC_Pvfy_Target, VHV_TADC_Pvfy_LLim, VHV_TADC_Pvfy_ULim;
     FloatS VHV_TADC_Ers_Target, VHV_TADC_Ers_LLim, VHV_TADC_Ers_ULim;
     FloatS VSL_Target, VSL_ULim, VSL_LLim;
     FloatS VSLNREF_Target, VSLNREF_ULim, VSLNREF_LLim;
     FloatS VSL_TADC_Target, VSL_TADC_ULim, VSL_TADC_LLim;
     FloatS VRead_Target, VRead_ULim, VRead_LLim,
     VRead_Target_VMIN, VRead_ULim_VMIN, VRead_LLim_VMIN,
     VRead_Target_VMAX, VRead_ULim_VMAX, VRead_LLim_VMAX;
     FloatS VReadNREF_Target, VReadNREF_ULim, VReadNREF_LLim;
     FloatS VRead_TADC_Target, VRead_TADC_ULim, VRead_TADC_LLim;
     FloatS VSA5_Read_Target, VSA5_Read_ULim, VSA5_Read_LLim;
     FloatS VSA5Pump_Read_Target, VSA5Pump_Read_ULim, VSA5Pump_Read_LLim;
     FloatS VSA5NREF_Read_Target, VSA5NREF_Read_ULim, VSA5NREF_Read_LLim;
     FloatS VSA5_TADC_Read_Target, VSA5_TADC_Read_ULim, VSA5_TADC_Read_LLim;
     FloatS VSA5_Prog_Target, VSA5_Prog_ULim, VSA5_Prog_LLim;
     FloatS VSA5Pump_Prog_Target, VSA5Pump_Prog_ULim, VSA5Pump_Prog_LLim;
     FloatS VSA5NREF_Prog_Target, VSA5NREF_Prog_ULim, VSA5NREF_Prog_LLim;
     FloatS VSA5_TADC_Prog_Target, VSA5_TADC_Prog_ULim, VSA5_TADC_Prog_LLim;
     FloatS VSA5_Pvfy_Target, VSA5_Pvfy_ULim, VSA5_Pvfy_LLim;
     FloatS VSA5Pump_Pvfy_Target, VSA5Pump_Pvfy_ULim, VSA5Pump_Pvfy_LLim;
     FloatS VSA5NREF_Pvfy_Target, VSA5NREF_Pvfy_ULim, VSA5NREF_Pvfy_LLim;
     FloatS VSA5_TADC_Pvfy_Target, VSA5_TADC_Pvfy_ULim, VSA5_TADC_Pvfy_LLim;
     FloatS VSA5_Ers_Target, VSA5_Ers_ULim, VSA5_Ers_LLim;
     FloatS VSA5Pump_Ers_Target, VSA5Pump_Ers_ULim, VSA5Pump_Ers_LLim;
     FloatS VSA5NREF_Ers_Target, VSA5NREF_Ers_ULim, VSA5NREF_Ers_LLim;
     FloatS VSA5_TADC_Ers_Target, VSA5_TADC_Ers_ULim, VSA5_TADC_Ers_LLim;
     FloatS VSA5_Evfy_Target, VSA5_Evfy_ULim, VSA5_Evfy_LLim;
     FloatS VSA5Pump_Evfy_Target, VSA5Pump_Evfy_ULim, VSA5Pump_Evfy_LLim;
     FloatS VSA5NREF_Evfy_Target, VSA5NREF_Evfy_ULim, VSA5NREF_Evfy_LLim;
     FloatS VSA5_TADC_Evfy_Target, VSA5_TADC_Evfy_ULim, VSA5_TADC_Evfy_LLim;
     FloatS VSA5_Cvfy_Target, VSA5_Cvfy_ULim, VSA5_Cvfy_LLim;
     FloatS VSA5Pump_Cvfy_Target, VSA5Pump_Cvfy_ULim, VSA5Pump_Cvfy_LLim;
     FloatS VSA5NREF_Cvfy_Target, VSA5NREF_Cvfy_ULim, VSA5NREF_Cvfy_LLim;
     FloatS VSA5_TADC_Cvfy_Target, VSA5_TADC_Cvfy_ULim, VSA5_TADC_Cvfy_LLim;
     FloatS VWL_Read_Target, VWL_Read_ULim, VWL_Read_LLim;
     FloatS VWLNREF_Read_Target, VWLNREF_Read_ULim, VWLNREF_Read_LLim;
     FloatS VWL_TADC_Read_Target, VWL_TADC_Read_ULim, VWL_TADC_Read_LLim;
     FloatS VWL_Prog_Target, VWL_Prog_ULim, VWL_Prog_LLim;
     FloatS VWLNREF_Prog_Target, VWLNREF_Prog_ULim, VWLNREF_Prog_LLim;
     FloatS VWL_TADC_Prog_Target, VWL_TADC_Prog_ULim, VWL_TADC_Prog_LLim;
     FloatS VWL_Pvfy_Target, VWL_Pvfy_ULim, VWL_Pvfy_LLim;
     FloatS VWLNREF_Pvfy_Target, VWLNREF_Pvfy_ULim, VWLNREF_Pvfy_LLim;
     FloatS VWL_TADC_Pvfy_Target, VWL_TADC_Pvfy_ULim, VWL_TADC_Pvfy_LLim;
     FloatS VWL_Ers_Target, VWL_Ers_ULim, VWL_Ers_LLim;
     FloatS VWLNREF_Ers_Target, VWLNREF_Ers_ULim, VWLNREF_Ers_LLim;
     FloatS VWL_TADC_Ers_Target, VWL_TADC_Ers_ULim, VWL_TADC_Ers_LLim;
     FloatS VWL_Evfy_Target, VWL_Evfy_ULim, VWL_Evfy_LLim;
     FloatS VWLNREF_Evfy_Target, VWLNREF_Evfy_ULim, VWLNREF_Evfy_LLim;
     FloatS VWL_TADC_Evfy_Target, VWL_TADC_Evfy_ULim, VWL_TADC_Evfy_LLim;
     FloatS VWL_Cvfy_Target, VWL_Cvfy_ULim, VWL_Cvfy_LLim;
     FloatS VWLNREF_Cvfy_Target, VWLNREF_Cvfy_ULim, VWLNREF_Cvfy_LLim;
     FloatS VWL_TADC_Cvfy_Target, VWL_TADC_Cvfy_ULim, VWL_TADC_Cvfy_LLim;
     FloatS VCG2P5_Read_Target, VCG2P5_Read_ULim, VCG2P5_Read_LLim;
     FloatS VCG2P5NREF_Read_Target, VCG2P5NREF_Read_ULim, VCG2P5NREF_Read_LLim;
     FloatS VCG2P5_TADC_Read_Target, VCG2P5_TADC_Read_ULim, VCG2P5_TADC_Read_LLim;
     FloatS VCG2P5_Prog_Target, VCG2P5_Prog_ULim, VCG2P5_Prog_LLim;
     FloatS VCG2P5NREF_Prog_Target, VCG2P5NREF_Prog_ULim, VCG2P5NREF_Prog_LLim;
     FloatS VCG2P5_TADC_Prog_Target, VCG2P5_TADC_Prog_ULim, VCG2P5_TADC_Prog_LLim;
     FloatS VCG2P5_Pvfy_Target, VCG2P5_Pvfy_ULim, VCG2P5_Pvfy_LLim;
     FloatS VCG2P5NREF_Pvfy_Target, VCG2P5NREF_Pvfy_ULim, VCG2P5NREF_Pvfy_LLim;
     FloatS VCG2P5_TADC_Pvfy_Target, VCG2P5_TADC_Pvfy_ULim, VCG2P5_TADC_Pvfy_LLim;
     FloatS VCG2P5_Ers_Target, VCG2P5_Ers_ULim, VCG2P5_Ers_LLim;
     FloatS VCG2P5NREF_Ers_Target, VCG2P5NREF_Ers_ULim, VCG2P5NREF_Ers_LLim;
     FloatS VCG2P5_TADC_Ers_Target, VCG2P5_TADC_Ers_ULim, VCG2P5_TADC_Ers_LLim;
     FloatS VCG2P5_Evfy_Target, VCG2P5_Evfy_ULim, VCG2P5_Evfy_LLim;
     FloatS VCG2P5NREF_Evfy_Target, VCG2P5NREF_Evfy_ULim, VCG2P5NREF_Evfy_LLim;
     FloatS VCG2P5_TADC_Evfy_Target, VCG2P5_TADC_Evfy_ULim, VCG2P5_TADC_Evfy_LLim;
     FloatS VCG2P5_Cvfy_Target, VCG2P5_Cvfy_ULim, VCG2P5_Cvfy_LLim;
     FloatS VCG2P5NREF_Cvfy_Target, VCG2P5NREF_Cvfy_ULim, VCG2P5NREF_Cvfy_LLim;
     FloatS VCG2P5_TADC_Cvfy_Target, VCG2P5_TADC_Cvfy_ULim, VCG2P5_TADC_Cvfy_LLim;
     FloatS VINH_Read_Target, VINH_Read_ULim, VINH_Read_LLim;
     FloatS VINHNREF_Read_Target, VINHNREF_Read_ULim, VINHNREF_Read_LLim;
     FloatS VINH_TADC_Read_Target, VINH_TADC_Read_ULim, VINH_TADC_Read_LLim;
     FloatS VINH_Prog_Target, VINH_Prog_ULim, VINH_Prog_LLim;
     FloatS VINH_Target_VMIN, VINH_ULim_VMIN, VINH_LLim_VMIN, VINH_Target_VMAX, VINH_ULim_VMAX, VINH_LLim_VMAX;
     FloatS VINHNREF_Prog_Target, VINHNREF_Prog_ULim, VINHNREF_Prog_LLim;
     FloatS VINH_TADC_Prog_Target, VINH_TADC_Prog_ULim, VINH_TADC_Prog_LLim;
     FloatS VINH_Pvfy_Target, VINH_Pvfy_ULim, VINH_Pvfy_LLim;
     FloatS VINHNREF_Pvfy_Target, VINHNREF_Pvfy_ULim, VINHNREF_Pvfy_LLim;
     FloatS VINH_TADC_Pvfy_Target, VINH_TADC_Pvfy_ULim, VINH_TADC_Pvfy_LLim;
     FloatS VINH_Ers_Target, VINH_Ers_ULim, VINH_Ers_LLim;
     FloatS VINHNREF_Ers_Target, VINHNREF_Ers_ULim, VINHNREF_Ers_LLim;
     FloatS VINH_TADC_Ers_Target, VINH_TADC_Ers_ULim, VINH_TADC_Ers_LLim;
     FloatS VINH_Evfy_Target, VINH_Evfy_ULim, VINH_Evfy_LLim;
     FloatS VINHNREF_Evfy_Target, VINHNREF_Evfy_ULim, VINHNREF_Evfy_LLim;
     FloatS VINH_TADC_Evfy_Target, VINH_TADC_Evfy_ULim, VINH_TADC_Evfy_LLim;
     FloatS VINH_Cvfy_Target, VINH_Cvfy_ULim, VINH_Cvfy_LLim;
     FloatS VINHNREF_Cvfy_Target, VINHNREF_Cvfy_ULim, VINHNREF_Cvfy_LLim;
     FloatS VINH_TADC_Cvfy_Target, VINH_TADC_Cvfy_ULim, VINH_TADC_Cvfy_LLim;
     FloatS VHV2XPump_Prog_Target, VHV2XPump_Prog_ULim, VHV2XPump_Prog_LLim;
     FloatS VHV2XPump_TADC_Prog_Target, VHV2XPump_TADC_Prog_ULim, VHV2XPump_TADC_Prog_LLim;

     FloatS VHV_VStress_Prog, VHV_VStress_Pvfy, VHV_VStress_Ers;
     FloatS VHV_TStress_Prog, VHV_TStress_Pvfy, VHV_TStress_Ers;
     FloatS VHV_Leak_Target,VHV_Leak_ULim,VHV_Leak_LLim;

     FloatS VReadBUF_Prog_Target, VReadBUF_Prog_ULim, VReadBUF_Prog_LLim,
     VReadBUF_Pvfy_Target, VReadBUF_Pvfy_ULim, VReadBUF_Pvfy_LLim;
     FloatS Bank_Iref_Read_Target, Bank_Iref_Read_ULim, Bank_Iref_Read_LLim,
     Bank_Iref_Pvfy_Target, Bank_Iref_Pvfy_ULim, Bank_Iref_Pvfy_LLim,
     Bank_Iref_Evfy_Target, Bank_Iref_Evfy_ULim, Bank_Iref_Evfy_LLim, Bank_Iref_Evfy_Target_EMU, Bank_Iref_Evfy_ULim_EMU, Bank_Iref_Evfy_LLim_EMU,
     Bank_Iref_Cvfy_Target, Bank_Iref_Cvfy_ULim, Bank_Iref_Cvfy_LLim,
     Bank_Iref_VCG_Read, Bank_Iref_VCG_Pvfy, Bank_Iref_VCG_Evfy, Bank_Iref_VCG_Cvfy,
     Bank_Iref_VBL_Read, Bank_Iref_VBL_Pvfy, Bank_Iref_VBL_Evfy, Bank_Iref_VBL_Cvfy;
     FloatS Bank_Iref_RDM0_Target, Bank_Iref_RDM0_ULim, Bank_Iref_RDM0_LLim;
     FloatS Bank_Iref_RDM1_Target, Bank_Iref_RDM1_ULim, Bank_Iref_RDM1_LLim;
     FloatS Bank_IPMOS_Read_Target, Bank_IPMOS_Read_ULim, Bank_IPMOS_Read_LLim,
     Bank_IPMOS_Pvfy_Target, Bank_IPMOS_Pvfy_ULim, Bank_IPMOS_Pvfy_LLim,
     Bank_IPMOS_Evfy_Target, Bank_IPMOS_Evfy_ULim, Bank_IPMOS_Evfy_LLim,
     Bank_IPMOS_Cvfy_Target, Bank_IPMOS_Cvfy_ULim, Bank_IPMOS_Cvfy_LLim,
     Bank_IPMOS_VCG_Read, Bank_IPMOS_VCG_Pvfy, Bank_IPMOS_VCG_Evfy, Bank_IPMOS_VCG_Cvfy,
     Bank_IPMOS_VBL_Read, Bank_IPMOS_VBL_Pvfy, Bank_IPMOS_VBL_Evfy, Bank_IPMOS_VBL_Cvfy;
     FloatS Bank_IPMOS_Prog_Target, Bank_IPMOS_Prog_ULim, Bank_IPMOS_Prog_LLim,
     Bank_IPMOS_VBL_Prog, Bank_IPMOS_VCG_Prog;
     FloatS Bank_IPMOS_Ers_Target, Bank_IPMOS_Ers_ULim, Bank_IPMOS_Ers_LLim,
     Bank_IPMOS_ErsPst_ULim,Bank_IPMOS_ErsPst_LLim,
     Bank_IPMOS_VBL_Ers, Bank_IPMOS_VCG_Ers;
     FloatS IPMOS_Adaptive_Target, RefArr_Ers_Adaptive_VStart, RefArr_Ers_Adaptive_VStop, RefArr_Ers_Adaptive_RESOL, RefArr_Ers_Adaptive_PWIDTH;
     FloatS Bank_Internal_Iref_VBL, Bank_Internal_IPMOS_VBL;

     FloatS Bank_RefArr_VEG_Ers, Bank_RefArr_VEG_IMAX_Ers, Bank_RefArr_VEG_Ers_PWidth;
     FloatS SA_Iref_BLLoad_Read_Target, SA_Iref_BLLoad_Read_ULim, SA_Iref_BLLoad_Read_LLim, SA_Iref_VBLLoad_Read;
     FloatS SA_Iref_BLLoadDis_Read_Target, SA_Iref_BLLoadDis_Read_ULim, SA_Iref_BLLoadDis_Read_LLim, SA_Iref_VBLLoadDis_Read;
     FloatS IVWLDRV_Prog_Target, IVWLDRV_Prog_LLim, IVWLDRV_Prog_ULim, IVWLDRV_Prog;
     FloatS WLS_VWL_LEAK_Prog_Target, WLS_VWL_LEAK_Prog_ULim, WLS_VWL_LEAK_Prog_LLim, WLS_VWL_LEAK_Prog, WLS_VWL_LEAK_TStress_Prog;
     FloatS BLS_VBL_LEAK_Prog_Target, BLS_VBL_LEAK_Prog_ULim, BLS_VBL_LEAK_Prog_LLim, BLS_VBL_LEAK_Prog, BLS_VBL_LEAK_TStress_Prog;
     FloatS BLS_VBL_LEAK_Prog_ULim_Retest, BLS_VBL_LEAK_Prog_LLim_Retest;
     FloatS CGS_VCG_LEAK_Prog_Target, CGS_VCG_LEAK_Prog_ULim, CGS_VCG_LEAK_Prog_LLim, CGS_VCG_LEAK_Prog, CGS_VCG_LEAK_TStress_Prog;
     FloatS CGEG_VCG_LEAK_Pvfy_Target, CGEG_VCG_LEAK_Pvfy_ULim, CGEG_VCG_LEAK_Pvfy_LLim, CGEG_VCG_LEAK_Pvfy, CGEG_VCG_LEAK_TStress_Pvfy, CGEG_VCG_LEAK_Pvfy_Delta;
     FloatS EGCSS_VEGCS_LEAK_Prog_Target, EGCSS_VEGCS_LEAK_Prog_ULim, EGCSS_VEGCS_LEAK_Prog_LLim, EGCSS_VEGCS_LEAK_Prog, EGCSS_VEGCS_LEAK_TStress_Prog;
     FloatS EGS_VEG_LEAK_Ers_Target, EGS_VEG_LEAK_Ers_ULim, EGS_VEG_LEAK_Ers_LLim, EGS_VEG_LEAK_Ers, EGS_VEG_LEAK_TStress_Ers;

     FloatS RevTunnel_VEGCS_Prog, RevTunnel_VEGCS_IMAX_Prog, RevTunnel_VEGCS_TStress_Prog,
     RevTunnel_VBL_Prog, RevTunnel_VBL_IMAX_Prog, RevTunnel_VBL_TStress_Prog;
     FloatS PunchThru_VEGCS_Pvfy, PunchThru_VEGCS_IMAX_Pvfy, PunchThru_VEGCS_TStress_Pvfy,
     PunchThru_VBL_Pvfy, PunchThru_VBL_IMAX_Pvfy, PunchThru_VBL_TStress_Pvfy;
     FloatS ThinOxide_VEGCS_Ers, ThinOxide_VEGCS_IMAX_Ers, ThinOxide_VEGCS_TStress_Ers,
     ThinOxide_VBL_Ers, ThinOxide_VBL_IMAX_Ers, ThinOxide_VBL_TStress_Ers;

     FloatS TunOxide_VCG_Prog, TunOxide_VCG_IMAX_Prog, TunOxide_VCG_TStress_Prog,
     TunOxide_VBL_Prog, TunOxide_VBL_IMAX_Prog, TunOxide_VBL_TStress_Prog;
     FloatS ONO_VCG_Pvfy, ONO_VCG_IMAX_Pvfy, ONO_VCG_TStress_Pvfy,
     ONO_VBL_Pvfy, ONO_VBL_IMAX_Pvfy, ONO_VBL_TStress_Pvfy;

     FloatS PgmFF_VCG_Prog, PgmFF_VCG_IMAX_Prog, PgmFF_VCG_TStress_Prog,
     PgmFF_VEGCS_Prog, PgmFF_VEGCS_IMAX_Prog, PgmFF_VEGCS_TStress_Prog,
     PgmFF_VBL_Prog, PgmFF_VBL_IMAX_Prog, PgmFF_VBL_TStress_Prog,
     PgmFF_VWL_Prog, PgmFF_VWL_IMAX_Prog, PgmFF_VWL_TStress_Prog;

     FloatS FGWL_VCG_Pvfy, FGWL_VCG_IMAX_Pvfy, FGWL_VCG_TStress_Pvfy,
     FGWL_VEGCS_Pvfy, FGWL_VEGCS_IMAX_Pvfy, FGWL_VEGCS_TStress_Pvfy,
     FGWL_VBL_Pvfy, FGWL_VBL_IMAX_Pvfy, FGWL_VBL_TStress_Pvfy,
     FGWL_VWL_Pvfy, FGWL_VWL_IMAX_Pvfy, FGWL_VWL_TStress_Pvfy;

     FloatS TunOx_VCG_Evfy, TunOx_VCG_IMAX_Evfy, TunOx_VCG_TStress_Evfy,
     TunOx_VEGCS_Evfy, TunOx_VEGCS_IMAX_Evfy, TunOx_VEGCS_TStress_Evfy, TunOx_VEGCS_Cvfy,
     TunOx_VBL_Evfy, TunOx_VBL_IMAX_Evfy, TunOx_VBL_TStress_Evfy,
     TunOx_VWL_Evfy, TunOx_VWL_IMAX_Evfy, TunOx_VWL_TStress_Evfy;

     FloatS CSFG_VCG_Ers, CSFG_VCG_IMAX_Ers, CSFG_VCG_TStress_Ers,
     CSFG_VEGCS_Ers, CSFG_VEGCS_IMAX_Ers, CSFG_VEGCS_TStress_Ers,
     CSFG_VBL_Ers, CSFG_VBL_IMAX_Ers, CSFG_VBL_TStress_Ers,
     CSFG_VWL_Ers, CSFG_VWL_IMAX_Ers, CSFG_VWL_TStress_Ers;

     FloatS CSFG_VCG_Prog, CSFG_VCG_IMAX_Prog, CSFG_VCG_TStress_Prog,
     CSFG_VCS_Prog, CSFG_VCS_IMAX_Prog, CSFG_VCS_TStress_Prog,
     CSFG_VBL_Prog, CSFG_VBL_IMAX_Prog, CSFG_VBL_TStress_Prog,
     CSFG_VEG_Prog, CSFG_VEG_IMAX_Prog, CSFG_VEG_TStress_Prog,
     CSFG_VWL_Prog, CSFG_VWL_IMAX_Prog, CSFG_VWL_TStress_Prog;

     FloatS EGFG_VEG_Read, EGFG_VEG_IMAX_Read, EGFG_VEG_TStress_Read,
     EGFG_VEG_Prog, EGFG_VEG_IMAX_Prog, EGFG_VEG_TStress_Prog,
     EGFG_VEG_Pvfy, EGFG_VEG_IMAX_Pvfy, EGFG_VEG_TStress_Pvfy,
     EGFG_VEG_Evfy, EGFG_VEG_IMAX_Evfy, EGFG_VEG_TStress_Evfy,
     EGFG_VEG_Cvfy, EGFG_VEG_IMAX_Cvfy, EGFG_VEG_TStress_Cvfy;

     FloatS RDISTURB_VWL_STRESS_Read, RDISTURB_VWL_STRESS_IMAX_Read, RDISTURB_VWL_TStress_Read;
     FloatS RDISTURB_VWL_STRESS_Pvfy, RDISTURB_VWL_STRESS_IMAX_Pvfy, RDISTURB_VWL_TStress_Pvfy;

     FloatS VSNS_VCG_Read;

     FloatS TP1_LEAK_VLO, TP1_LEAK_VHI, TP1_LEAK_VLO_ULim, TP1_LEAK_VLO_LLim, TP1_LEAK_VHI_ULim, TP1_LEAK_VHI_LLim,
     TP2_LEAK_VLO, TP2_LEAK_VHI, TP2_LEAK_VLO_ULim, TP2_LEAK_VLO_LLim, TP2_LEAK_VHI_ULim, TP2_LEAK_VHI_LLim;
     FloatS TP1TP2_DELTA_LLIM, TP1TP2_DELTA_ULIM;



     FloatS VWLCmpt_Target;
     FloatS VWLCmpt_LLim;
     FloatS VWLCmpt_ULim;
     FloatS VWLEvfy_Target;
     FloatS VWLEvfy_LLim;
     FloatS VWLEvfy_ULim;
     FloatS VWLErs_Target;
     FloatS VWLErs_LLim;
     FloatS VWLErs_ULim;


     FloatS MainBG_SoftTrim_VForce;
     FloatS MainBG_Adapt_Delta_ULim;
     FloatS MainIref_Adapt_Delta_ULim;
     FloatS MainBG_Const_VStep;
     FloatS MainBG_Const_VMin;
     FloatS MainBG_Const_VMax;
     FloatS MainIref_Const_IStep;
     FloatS AuxBG_SoftTrim_VForce;
     FloatS AuxBG_Adapt_Delta_ULim;
     FloatS AuxIref_Adapt_Delta_ULim;
     FloatS AuxBG_Const_VStep;
     FloatS AuxBG_Const_VMin;
     FloatS AuxBG_Const_VMax;
     FloatS AuxIref_Const_IStep;
     FloatS BG_Adapt_Delta_AbsLim;   /*absolute delta limit*/
     FloatS Iref_Adapt_Delta_AbsLim;   /*absolute delta limit*/

   

     /*+++ Leakage Conditions/Limits +++*/
    FloatS BL_LEAK_ULim;
    FloatS BL_LEAK_LLim;
    FloatS BL_LEAK_Voltage;
    FloatS WL_LEAK_ULim;
    FloatS WL_LEAK_LLim;
    FloatS WL_LEAK_Voltage;
    FloatS SL_LEAK_ULim;
    FloatS SL_LEAK_LLim;
    FloatS SL_LEAK_Voltage;

    FloatS BL_VRD_ULim;
    FloatS BL_VRD_LLim;
    FloatS WL_VCVFY_ULim;
    FloatS WL_VCVFY_LLim;
    FloatS SL_VCMPT_ULim;
    FloatS SL_VCMPT_LLim;
   
   
       /*+++ Pulse Limit +++*/
    IntS SECT_PRECON_ULimit;
    IntS SECT_ERS_ULimit;
    IntS SECT_CMPT_ULimit;
    IntS SECT_PROG_ULimit;
    IntS BANK_PRECON_ULimit;
    IntS BANK_ERS_ULimit;
    IntS BANK_CMPT_ULimit;
    IntS BANK_PROG_ULimit;
    IntS OTP_PRECON_ULimit;
    IntS OTP_ERS_ULimit;
    IntS OTP_CMPT_ULimit;
    IntS OTP_PROG_ULimit;
    IntS BANK_ERS_AVNV_CAT1_ULimit;
    IntS BANK_ERS_AVNV_CAT2_ULimit;
    IntS BANK_ERS_AVNV_CAT3_ULimit;
    IntS BANK_ERS_AVNV_CAT1_SET;
    IntS BANK_ERS_AVNV_CAT2_SET;
    IntS BANK_ERS_AVNV_CAT3_SET;
    IntS BANK_PROGONEPLS_ULimit;
   

    /*+++ Datalog/Pulse Address info +++*/
    IntS ADDR_API_STAT1;
    IntS ADDR_API_STAT2;
    IntS ADDR_API_STAT3;
    IntS ADDR_API_STAT4;

    IntS ADDR_FAIL_ADDR;
    IntS ADDR_FAIL_DATA;

    IntS ADDR_PF_BIN;
    IntS ADDR_TEST_INFO;
   
    IntS ADDR_MSTAT;
    IntS ADDR_ERS_PULSE;
    IntS ADDR_PROG_MAX_PULSE;
    IntS ADDR_PROG_TOT_PULSE;
    IntS ADDR_MEASFREQ, ADDR_RTITIMER, ADDR_TRIMSOL, ADDR_TESTFREQ;

    IntS ADDR_RAM_MAILBOX;
    IntS ADDR_RAM_REPAIR_SOL;
    IntS ADDR_RAM_SHELLREV;

    IntS ADDR_RAM_IPMOS_MAILBOX;

    IntS ADDR_RAM_ESDA;
    IntS ADDR_RAM_ARB_FREQ, ADDR_RAM_ARB_WAIT, ADDR_RAM_ARB_TGADDR,
    ADDR_RAM_ARB_TGLEN, ADDR_RAM_FMW;
    IntS ADDR_RAM_EFSOFTTRIM, ADDR_RAM_BGAP_TRIM, ADDR_RAM_PUMP_IREF_TRIM,
    ADDR_RAM_FOSC_TRIM, ADDR_RAM_SLOPECT_TRIM, ADDR_RAM_IGNOREOTP;

    IntS1D ADDR_TIOTP_HI(8),ADDR_TIOTP_LO(8);

    IntS ADDR_RAM_OTP_TEMP_W8;
    IntS ADDR_RAM_TEMPL_VHVE_PMT, ADDR_RAM_TEMPL_VHVE_SM, ADDR_RAM_TEMPL_VHVPV_PMT;
    IntS ADDR_RAM_TEMPL_VHVE_PMT_EMU, ADDR_RAM_TEMPL_VHVE_SM_EMU, ADDR_RAM_TEMPL_VHVPV_PMT_EMU;
   
    /*+++ Stress Limit +++*/
    FloatS BLS_ULim;
    FloatS BLS_LLim;
    FloatS WLS_ULim;
    FloatS WLS_LLim;
    FloatS SLS_ULim;
    FloatS SLS_LLim;
    FloatS DRL0S_ULim;
    FloatS DRL0S_LLim;
    FloatS DRL1S_ULim;
    FloatS DRL1S_LLim;
    FloatS BLS_Voltage;
    FloatS WLS_Voltage;
    FloatS SLS_Voltage;
    FloatS UVVT_Voltage;
     /*delta limit of block median*/
    FloatS DRL0S_Block_LLim;
    FloatS DRL0S_Block_ULim;
    FloatS DRL1S_Block_LLim;
    FloatS DRL1S_Block_ULim;


    /*+++ VT Limit +++*/
    FloatS UVVT_ULim;
    FloatS UVVT_LLim;
    FloatS VT0_ULim;
    FloatS VT0_LLim;
    FloatS VT1_ULim;
    FloatS VT1_LLim;
    FloatS VT1min_ULim;
    FloatS VT1min_LLim;
    FloatS VT0min_ULim;
    FloatS VT0min_LLim;
    FloatS VT0min_PstDRL_LLim;
    FloatS VT0max_ULim;
    FloatS VT0max_LLim;
    FloatS VT0MinMax_ULim;
    FloatS VT0MinMax_LLim;
    FloatS VT0ErsStr_ULim;
    FloatS VT0ErsStr_LLim;
    FloatS VT0ErsStr_Delta_ULim;
    FloatS VT0ErsStr_Delta_LLim;
    FloatS VT1ErsStr_ULim;
    FloatS ErsStrSlowScrn_Lim;
    FloatS LOWVT0_ULim;
    FloatS LOWVT0_LLim;

   
    /*+++ Base test number +++*/
   IntS TNUM_SECT_ERS_PRECON_SM;
   IntS TNUM_SECT_ERS_PRECON;
   IntS TNUM_SECT_ERS_NOPRECON_SM;
   IntS TNUM_SECT_ERS_NOPRECON;
   IntS TNUM_SECT_PROG;
   IntS TNUM_SECT_PROG_OCHK;
   IntS TNUM_SECT_PROG_ECHK;
   IntS TNUM_SECT_PROG_WOCHK;
   IntS TNUM_SECT_PROG_WECHK;
   IntS TNUM_SECT_PROG_SW;
   IntS TNUM_SECT_PROG_CSW;
   IntS TNUM_SECT_PROG_OCHK_SW;
   IntS TNUM_SECT_PROG_OCHK_CSW;
   IntS TNUM_SECT_PROG_ECHK_SW;
   IntS TNUM_SECT_PROG_ECHK_CSW;
   IntS TNUM_SECT_PROG_ONEPLS;
   IntS TNUM_SECT_PROG_LOWVT;
   IntS TNUM_SECT_PROG_RESTORE;
   IntS TNUM_SECT_PROG_SBDG;
   IntS TNUM_SECT_PRECON;
   IntS TNUM_SECT_PVFY_SM;
   IntS TNUM_SECT_EVFY_SM;
   IntS TNUM_SECT_CVFY_SM;
   IntS TNUM_SECT_BLS_SEL;
   IntS TNUM_SECT_BL_LEAK_SEL;
   IntS TNUM_SECT_BLS;
   IntS TNUM_SECT_BL_LEAK;
   IntS TNUM_SECT_BLS_ODD;
   IntS TNUM_SECT_BL_LEAK_ODD;
   IntS TNUM_SECT_BLS_EVEN;
   IntS TNUM_SECT_BL_LEAK_EVEN;
   IntS TNUM_SECT_WLS;
   IntS TNUM_SECT_WL_LEAK;
   IntS TNUM_SECT_WLS_ODD;
   IntS TNUM_SECT_WL_LEAK_ODD;
   IntS TNUM_SECT_WLS_EVEN;
   IntS TNUM_SECT_WL_LEAK_EVEN;
   IntS TNUM_SECT_SLI;
   IntS TNUM_SECT_SL_LEAK;
   IntS TNUM_SECT_ERS_ONEPLS;
   IntS TNUM_SECT_ERS_SLOWBIT;
   IntS TNUM_SECT_EVFY;
   IntS TNUM_SECT_PVFY;
   IntS TNUM_SECT_CVFY;
   IntS TNUM_SECT_EVFY_PIPE;
   IntS TNUM_SECT_PVFY_PIPE;
   IntS TNUM_SECT_CVFY_PIPE;
   IntS TNUM_SECT_RD1S;
   IntS TNUM_SECT_RD0S;
   IntS TNUM_SECT_RDOCHK;
   IntS TNUM_SECT_RDECHK;
   IntS TNUM_SECT_RD1S_PIPE;
   IntS TNUM_SECT_RD0S_PIPE;
   IntS TNUM_SECT_RDOCHK_PIPE;
   IntS TNUM_SECT_RDECHK_PIPE;
   IntS TNUM_SECT_RDM1S;
   IntS TNUM_SECT_RDM0S;
   IntS TNUM_SECT_RDMOCHK;
   IntS TNUM_SECT_RDMECHK;
   IntS TNUM_SECT_RDM1S_PIPE;
   IntS TNUM_SECT_RDM0S_PIPE;
   IntS TNUM_SECT_RDMOCHK_PIPE;
   IntS TNUM_SECT_RDMECHK_PIPE;
   IntS TNUM_SECT_RD1S_RED;
   IntS TNUM_SECT_RD0S_RED;
   IntS TNUM_SECT_RDOCHK_RED;
   IntS TNUM_SECT_RDECHK_RED;
   IntS TNUM_SECT_RD1S_PIPE_RED;
   IntS TNUM_SECT_RD0S_PIPE_RED;
   IntS TNUM_SECT_RDOCHK_PIPE_RED;
   IntS TNUM_SECT_RDECHK_PIPE_RED;
   IntS TNUM_SECT_RDM1S_RED;
   IntS TNUM_SECT_RDM0S_RED;
   IntS TNUM_SECT_RDMOCHK_RED;
   IntS TNUM_SECT_RDMECHK_RED;
   IntS TNUM_SECT_RDM1S_PIPE_RED;
   IntS TNUM_SECT_RDM0S_PIPE_RED;
   IntS TNUM_SECT_RDMOCHK_PIPE_RED;
   IntS TNUM_SECT_RDMECHK_PIPE_RED;
   IntS TNUM_SECT_VTMAX_NO_ESDA;
   IntS TNUM_SECT_VTMIN_NO_ESDA;
   IntS TNUM_SECT_VT_OCHK;
   IntS TNUM_SECT_VT_ECHK;
   IntS TNUM_SECT_VTMAX_PIPE;
   IntS TNUM_SECT_VTMIN_PIPE;
   IntS TNUM_SECT_VT_OCHK_PIPE;
   IntS TNUM_SECT_VT_ECHK_PIPE;

   IntS TNUM_SECT_VTMIN_INTER_1S;
   IntS TNUM_SECT_VTMIN_INTER_0S;
   IntS TNUM_SECT_VTMIN_INTER_OCHK;
   IntS TNUM_SECT_VTMIN_INTER_ECHK;
   IntS TNUM_SECT_VTMAX_INTER_1S;
   IntS TNUM_SECT_VTMAX_INTER_0S;
   IntS TNUM_SECT_VTMAX_INTER_OCHK;
   IntS TNUM_SECT_VTMAX_INTER_ECHK;

   IntS TNUM_SECT_VTMAX_INTER_1S_RED;
   IntS TNUM_SECT_VTMAX_RED;
   IntS TNUM_SECT_VTMIN_RED;
   IntS TNUM_SECT_VTMIN_INTER_0S_RED;

   IntS TNUM_SECT_PVFY_SW;
   IntS TNUM_SECT_EVFY_SW;
   IntS TNUM_SECT_CVFY_SW;


   IntS TNUM_SECT_PROG_TM;
   IntS TNUM_SECT_PROG_OCHK_TM;
   IntS TNUM_SECT_PROG_ECHK_TM;
   IntS TNUM_SECT_VTMAX_ESDA;
   IntS TNUM_SECT_VTMIN_ESDA;

   
   IntS TNUM_BANK_ERS_PRECON;
   IntS TNUM_BANK_ERS_NOPRECON;
   IntS TNUM_BANK_ERS_PRECON_SW;
   IntS TNUM_BANK_ERS_NOPRECON_SW;
   IntS TNUM_BANK_ERS_SW_SCREEN;
   IntS TNUM_BANK_ERS_SCMD_PRECON;
   IntS TNUM_BANK_ERS_SCMD_NOPRECON;
   IntS TNUM_BANK_ERS_SCMD_PRECON_SW;
   IntS TNUM_BANK_ERS_SCMD_NOPRECON_SW;
   IntS TNUM_BANK_PROG_SM;
   IntS TNUM_BANK_PROG_OCHK;
   IntS TNUM_BANK_PROG_ECHK;
   IntS TNUM_BANK_PROG_SM_DISTURB;
   IntS TNUM_BANK_PROG_OCHK_DISTURB;
   IntS TNUM_BANK_PROG_ECHK_DISTURB;
   IntS TNUM_BANK_PROG_WORD;
   IntS TNUM_BANK_PROG_OCHK_WORD;
   IntS TNUM_BANK_PROG_ECHK_WORD;
   IntS TNUM_BANK_PROG_WOCHK;
   IntS TNUM_BANK_PROG_WECHK;
   IntS TNUM_BANK_PROG_ONEPLS;
   IntS TNUM_BANK_PROG_LOWVT;
   IntS TNUM_BANK_PROG_RESTORE;
   IntS TNUM_BANK_PROG_SBDG;
   IntS TNUM_BANK_PRECON;
   IntS TNUM_BANK_PROG_SW;
   IntS TNUM_BANK_PROG_OCHK_SW;
   IntS TNUM_BANK_PROG_ECHK_SW;
   IntS TNUM_BANK_PROG_WOCHK_SW;
   IntS TNUM_BANK_PROG_WECHK_SW;
   IntS TNUM_BANK_PROG_CSW;
   IntS TNUM_BANK_PROG_OCHK_CSW;
   IntS TNUM_BANK_PROG_ECHK_CSW;
   IntS TNUM_BANK_PROG_WOCHK_CSW;
   IntS TNUM_BANK_PROG_WECHK_CSW;
   IntS TNUM_BANK_BL_LEAK;
   IntS TNUM_BANK_BL_LEAK_ODD;
   IntS TNUM_BANK_BL_LEAK_EVEN;
   IntS TNUM_BANK_WL_LEAK;
   IntS TNUM_BANK_WL_LEAK_ODD;
   IntS TNUM_BANK_WL_LEAK_EVEN;
   IntS TNUM_BANK_SLI;
   IntS TNUM_BANK_SL_LEAK;
   IntS TNUM_BANK_ERS_STRESS_FAST;
   IntS TNUM_BANK_ERS_STRESS_SLOW;
   IntS TNUM_BANK_RD1S;
   IntS TNUM_BANK_RD0S;
   IntS TNUM_BANK_RDOCHK;
   IntS TNUM_BANK_RDECHK;
   IntS TNUM_BANK_RD1S_PIPE;
   IntS TNUM_BANK_RD0S_PIPE;
   IntS TNUM_BANK_RDOCHK_PIPE;
   IntS TNUM_BANK_RDECHK_PIPE;
   IntS TNUM_BANK_RDM1S;
   IntS TNUM_BANK_RDM0S;
   IntS TNUM_BANK_RDMOCHK;
   IntS TNUM_BANK_RDMECHK;
   IntS TNUM_BANK_RDM1S_PIPE;
   IntS TNUM_BANK_RDM0S_PIPE;
   IntS TNUM_BANK_RDMOCHK_PIPE;
   IntS TNUM_BANK_RDMECHK_PIPE;
   IntS TNUM_BANK_RD1S_RED;
   IntS TNUM_BANK_RD0S_RED;
   IntS TNUM_BANK_RDOCHK_RED;
   IntS TNUM_BANK_RDECHK_RED;
   IntS TNUM_BANK_RD1S_PIPE_RED;
   IntS TNUM_BANK_RD0S_PIPE_RED;
   IntS TNUM_BANK_RDOCHK_PIPE_RED;
   IntS TNUM_BANK_RDECHK_PIPE_RED;
   IntS TNUM_BANK_RDM1S_RED;
   IntS TNUM_BANK_RDM0S_RED;
   IntS TNUM_BANK_RDMOCHK_RED;
   IntS TNUM_BANK_RDMECHK_RED;
   IntS TNUM_BANK_RDM1S_PIPE_RED;
   IntS TNUM_BANK_RDM0S_PIPE_RED;
   IntS TNUM_BANK_RDMOCHK_PIPE_RED;
   IntS TNUM_BANK_RDMECHK_PIPE_RED;
   IntS TNUM_BANK_VTMAX;
   IntS TNUM_BANK_VTMIN;
   IntS TNUM_BANK_VTOCHK;
   IntS TNUM_BANK_VTECHK;
   IntS TNUM_BANK_VTMAX_PIPE;
   IntS TNUM_BANK_VTMIN_PIPE;
   IntS TNUM_BANK_VTOCHK_PIPE;
   IntS TNUM_BANK_VTECHK_PIPE;

   IntS TNUM_BANK_VTMIN_INTER_1S;
   IntS TNUM_BANK_VTMIN_INTER_0S;
   IntS TNUM_BANK_VTMIN_INTER_OCHK;
   IntS TNUM_BANK_VTMIN_INTER_ECHK;
   IntS TNUM_BANK_VTMAX_INTER_1S;
   IntS TNUM_BANK_VTMAX_INTER_0S;
   IntS TNUM_BANK_VTMAX_INTER_OCHK;
   IntS TNUM_BANK_VTMAX_INTER_ECHK;

   IntS TNUM_BANK_VTMAX_RED;
   IntS TNUM_BANK_VTMIN_RED;
   IntS TNUM_BANK_VTOCHK_RED;
   IntS TNUM_BANK_VTECHK_RED;
   IntS TNUM_BANK_VTMAX_PIPE_RED;
   IntS TNUM_BANK_VTMIN_PIPE_RED;
   IntS TNUM_BANK_VTOCHK_PIPE_RED;
   IntS TNUM_BANK_VTECHK_PIPE_RED;

   IntS TNUM_BANK_VTMIN_INTER_1S_RED;
   IntS TNUM_BANK_VTMIN_INTER_0S_RED;
   IntS TNUM_BANK_VTMIN_INTER_OCHK_RED;
   IntS TNUM_BANK_VTMIN_INTER_ECHK_RED;
   IntS TNUM_BANK_VTMAX_INTER_1S_RED;
   IntS TNUM_BANK_VTMAX_INTER_0S_RED;
   IntS TNUM_BANK_VTMAX_INTER_OCHK_RED;
   IntS TNUM_BANK_VTMAX_INTER_ECHK_RED;

    /*arbitrary psa vt*/
   IntS TNUM_BANK_ARB_RD;
   IntS TNUM_BANK_ARB_WR;
   IntS TNUM_BANK_VT_ARB_PSA;
   IntS TNUM_BANK_RD_ARB_PSA;

   IntS TNUM_BANK_PVFY;
   IntS TNUM_BANK_EVFY;
   IntS TNUM_BANK_VTVFY;
   IntS TNUM_BANK_CVFY;
   IntS TNUM_BANK_PVFY_PIPE;
   IntS TNUM_BANK_EVFY_PIPE;
   IntS TNUM_BANK_VTVFY_PIPE;
   IntS TNUM_BANK_CVFY_PIPE;
   IntS TNUM_BANK_CVFY_RED;
   IntS TNUM_BANK_RD1S_NOCOLRED;
   IntS TNUM_BANK_RD0S_NOCOLRED;
   IntS TNUM_BANK_RDOCHK_NOCOLRED;
   IntS TNUM_BANK_RDECHK_NOCOLRED;
   IntS TNUM_BANK_RD1S_PIPE_NOCOLRED;
   IntS TNUM_BANK_RD0S_PIPE_NOCOLRED;
   IntS TNUM_BANK_RDOCHK_PIPE_NOCOLRED;
   IntS TNUM_BANK_RDECHK_PIPE_NOCOLRED;
   IntS TNUM_BANK_RDM1S_NOCOLRED;
   IntS TNUM_BANK_RDM0S_NOCOLRED;
   IntS TNUM_BANK_RDMOCHK_NOCOLRED;
   IntS TNUM_BANK_RDMECHK_NOCOLRED;
   IntS TNUM_BANK_RDM1S_PIPE_NOCOLRED;
   IntS TNUM_BANK_RDM0S_PIPE_NOCOLRED;
   IntS TNUM_BANK_RDMOCHK_PIPE_NOCOLRED;
   IntS TNUM_BANK_RDMECHK_PIPE_NOCOLRED;
   IntS TNUM_BANK_VTMAX_LOGICSECT;
   IntS TNUM_BANK_VTMIN_LOGICSECT;
   IntS TNUM_BANK_VTOCHK_LOGICSECT;
   IntS TNUM_BANK_VTECHK_LOGICSECT;
   IntS TNUM_BANK_VTMAX_LOGICSECT_RED;
   IntS TNUM_BANK_VTMIN_LOGICSECT_RED;
   IntS TNUM_BANK_VTOCHK_LOGICSECT_RED;
   IntS TNUM_BANK_VTECHK_LOGICSECT_RED;
   IntS TNUM_BANK_VTMAX_SCRN_LOGICSECT;
   IntS TNUM_BANK_VTMIN_SCRN_LOGICSECT;
   IntS TNUM_BANK_VTOCHK_SCRN_LOGICSECT;
   IntS TNUM_BANK_VTECHK_SCRN_LOGICSECT;
   IntS TNUM_BANK_RD1S_LOGICSECT;
   IntS TNUM_BANK_RD0S_LOGICSECT;
   IntS TNUM_BANK_RDOCHK_LOGICSECT;
   IntS TNUM_BANK_RDECHK_LOGICSECT;
   IntS TNUM_BANK_RD1S_LOGICSECT_RED;
   IntS TNUM_BANK_RD0S_LOGICSECT_RED;
   IntS TNUM_BANK_RDOCHK_LOGICSECT_RED;
   IntS TNUM_BANK_RDECHK_LOGICSECT_RED;

   IntS TNUM_BANK_REPAIR_PROG_SOLUTION;
   IntS TNUM_BANK_REPAIR_CALC_SOLUTION_VT0S;
   IntS TNUM_BANK_REPAIR_CALC_SOLUTION_VT1S;
   IntS TNUM_BANK_REPAIR_UPDATE_SOLUTION;

   IntS TNUM_BANK_VTMIN_INTER_1S_LOGICSECT;
   IntS TNUM_BANK_VTMIN_INTER_0S_LOGICSECT;
   IntS TNUM_BANK_VTMIN_INTER_OCHK_LOGICSECT;
   IntS TNUM_BANK_VTMIN_INTER_ECHK_LOGICSECT;
   IntS TNUM_BANK_VTMAX_INTER_1S_LOGICSECT;
   IntS TNUM_BANK_VTMAX_INTER_0S_LOGICSECT;
   IntS TNUM_BANK_VTMAX_INTER_OCHK_LOGICSECT;
   IntS TNUM_BANK_VTMAX_INTER_ECHK_LOGICSECT;

   IntS TNUM_BANK_VTMAX_FAST;
   IntS TNUM_BANK_VTMIN_FAST;
   IntS TNUM_BANK_VTOCHK_FAST;
   IntS TNUM_BANK_VTECHK_FAST;
   IntS TNUM_BANK_VTMAX_DIRECT;
   IntS TNUM_BANK_VTMIN_DIRECT;
   IntS TNUM_BANK_VTOCHK_DIRECT;
   IntS TNUM_BANK_VTECHK_DIRECT;
   IntS TNUM_BANK_RD0S_BURST;
   IntS TNUM_BANK_RD1S_BURST;
   IntS TNUM_BANK_RDOCHK_BURST;
   IntS TNUM_BANK_RDECHK_BURST;
   IntS TNUM_BANK_RDM0S_BURST;
   IntS TNUM_BANK_RDM1S_BURST;
   IntS TNUM_BANK_RDMOCHK_BURST;
   IntS TNUM_BANK_RDMECHK_BURST;
   IntS TNUM_BANK_ERS_SMTCR31;
   IntS TNUM_BANK_WLS_100;
   IntS TNUM_BANK_WLS_ODD_100;
   IntS TNUM_BANK_WLS_EVEN_100;
   IntS TNUM_BANK_SLL;


   IntS TNUM_OTP_ERS_PRECON_SEMI;
   IntS TNUM_OTP_ERS_PRECON_SW;
   IntS TNUM_OTP_ERS_PRECON;
   IntS TNUM_OTP_ERS_NOPRECON;
   IntS TNUM_OTP_ERS_PRECON_MP1SET;
   IntS TNUM_OTP_ERS_NOPRECON_MP1SET;
   IntS TNUM_OTP_PROG;
   IntS TNUM_OTP_PROG_OCHK;
   IntS TNUM_OTP_PROG_ECHK;
   IntS TNUM_OTP_PROG_MP1SET;
   IntS TNUM_OTP_PROG_SEMI;
   IntS TNUM_OTP_PROG_OCHK_SEMI;
   IntS TNUM_OTP_PROG_ECHK_SEMI;
   IntS TNUM_OTP_PROG_SW;
   IntS TNUM_OTP_PROG_OCHK_SW;
   IntS TNUM_OTP_PROG_ECHK_SW;
   IntS TNUM_OTP_PROG_MP1SET_SW;
   IntS TNUM_OTP_PROG_TEMP_SW;
   IntS TNUM_OTP_PROG_SEMI_SW;
   IntS TNUM_OTP_PROG_OCHK_SEMI_SW;
   IntS TNUM_OTP_PROG_ECHK_SEMI_SW;
   IntS TNUM_OTP_PROG_SEMI_CSW;
   IntS TNUM_OTP_PROG_OCHK_SEMI_CSW;
   IntS TNUM_OTP_PROG_ECHK_SEMI_CSW;
   IntS TNUM_OTP_PROG_ONEPLS;
   IntS TNUM_OTP_PROG_TEMPLATE,TNUM_OTP_PROG_TEMPLATE_ENGOVRD;
   IntS TNUM_OTP_REFRESH;
   IntS TNUM_OTP_REFRESH_VT;
   IntS TNUM_OTP_PROG_CHKSUM_CBITS;
   IntS TNUM_OTP_PROG_PMOS_SETTING;
   IntS TNUM_OTP_PROG_AVNV_SETTING;
   IntS TNUM_OTP_PROG_ECC_BITS;
   IntS TNUM_OTP_PROG_FSPEED_BITS;
   IntS TNUM_OTP_PROG_EFCHKSUM;
   IntS TNUM_OTP_BLS;
   IntS TNUM_OTP_BLS_ODD;
   IntS TNUM_OTP_BLS_EVEN;
   IntS TNUM_OTP_WLS;
   IntS TNUM_OTP_WLS_ODD;
   IntS TNUM_OTP_WLS_EVEN;
   IntS TNUM_OTP_SLI;
   IntS TNUM_OTP_RD1S;
   IntS TNUM_OTP_RD0S;
   IntS TNUM_OTP_RDOCHK;
   IntS TNUM_OTP_RDECHK;
   IntS TNUM_OTP_RDM1S;
   IntS TNUM_OTP_RDM0S;
   IntS TNUM_OTP_RDM1S_TEMPLATE;
   IntS TNUM_OTP_RDM0S_TEMPLATE;
   IntS TNUM_OTP_RDMOCHK;
   IntS TNUM_OTP_RDMECHK;
   IntS TNUM_OTP_VFY_TEMPLATE;
   IntS TNUM_OTP_VFY_DATA;
   IntS TNUM_OTP_RDM0S_SEMI;
   IntS TNUM_OTP_RDOCHK_SEMI;
   IntS TNUM_OTP_RDECHK_SEMI;
   IntS TNUM_OTP_VTMAX;
   IntS TNUM_OTP_VTMIN;
   IntS TNUM_OTP_VTOCHK;
   IntS TNUM_OTP_VTECHK;
   IntS TNUM_OTP_VTMAX_PIPE;
   IntS TNUM_OTP_VTMIN_PIPE;
   IntS TNUM_OTP_VTOCHK_PIPE;
   IntS TNUM_OTP_VTECHK_PIPE;

   IntS TNUM_OTP_VTMIN_INTER_1S;
   IntS TNUM_OTP_VTMIN_INTER_0S;
   IntS TNUM_OTP_VTMIN_INTER_OCHK;
   IntS TNUM_OTP_VTMIN_INTER_ECHK;
   IntS TNUM_OTP_VTMAX_INTER_1S;
   IntS TNUM_OTP_VTMAX_INTER_0S;
   IntS TNUM_OTP_VTMAX_INTER_OCHK;
   IntS TNUM_OTP_VTMAX_INTER_ECHK;

   IntS TNUM_OTP_VTMAX_SEMI;
   IntS TNUM_OTP_VTMIN_SEMI;
   IntS TNUM_OTP_VTOCHK_SEMI;
   IntS TNUM_OTP_VTECHK_SEMI;
   IntS TNUM_OTP_VTMIN_SEMI_INTER_1S;
   IntS TNUM_OTP_VTMIN_SEMI_INTER_0S;
   IntS TNUM_OTP_VTMIN_SEMI_INTER_OCHK;
   IntS TNUM_OTP_VTMIN_SEMI_INTER_ECHK;
   IntS TNUM_OTP_VTMAX_SEMI_INTER_1S;
   IntS TNUM_OTP_VTMAX_SEMI_INTER_0S;
   IntS TNUM_OTP_VTMAX_SEMI_INTER_OCHK;
   IntS TNUM_OTP_VTMAX_SEMI_INTER_ECHK;

   IntS TNUM_OTP_WD9LATCH_COMPARE;
   IntS TNUM_OTP_RESET_BANK;
   IntS TNUM_OTP_WD9LATCH_CLEAR;
   IntS TNUM_OTP_WD9LATCH_WR;
   IntS TNUM_OTP_RD_VT_MBOX;
   IntS TNUM_OTP_RD_ID_MBOX;
   IntS TNUM_OTP_RD_LOG1_MBOX;
   IntS TNUM_OTP_RD_LOG3_MBOX;
   IntS TNUM_OTP_CHKSUM;
   IntS TNUM_OTP_CHKSUM_NO_CBIT;
   IntS TNUM_OTP_API_CHKSUM;
   IntS TNUM_OTP_WR_BLK_PREDRL_VT_MBOX;
   IntS TNUM_OTP_WR_BLK_POSTDRL1_VT_MBOX;
   IntS TNUM_OTP_WR_BLK_POSTDRL2_VT_MBOX;
   IntS TNUM_OTP_WR_BLK_PREDRL_VT1_MBOX;
   IntS TNUM_OTP_WR_BLK_POSTDRL1_VT1_MBOX;
   IntS TNUM_OTP_WR_BLK_POSTDRL2_VT1_MBOX;
   IntS TNUM_OTP_WR_OTP_PREDRL_VT1_MBOX;
   IntS TNUM_OTP_WR_OTP_POSTDRL1_VT1_MBOX;
   IntS TNUM_OTP_WR_OTP_POSTDRL2_VT1_MBOX;
   IntS TNUM_OTP_WR_BANK_PREDRL_VT_MBOX;
   IntS TNUM_OTP_WR_BANK_POSTDRL1_VT_MBOX;
   IntS TNUM_OTP_WR_BANK_POSTDRL2_VT_MBOX;
   IntS TNUM_OTP_WR_MP1_FLWBYTE;
   IntS TNUM_OTP_WR_MP2_FLWBYTE;
   IntS TNUM_OTP_WR_MP3_FLWBYTE;
   IntS TNUM_OTP_WR_MP4_FLWBYTE;
   IntS TNUM_OTP_WR_FT1_FLWBYTE;
   IntS TNUM_OTP_WR_FT2_FLWBYTE;
   IntS TNUM_OTP_WR_FT3_FLWBYTE;
   IntS TNUM_OTP_WR_DRL_FLWBYTE;
   IntS TNUM_OTP_WR_FUNC1_FLWBYTE;
   IntS TNUM_OTP_WR_FUNC2_FLWBYTE;
   IntS TNUM_OTP_WR_FUNC3_FLWBYTE;
   IntS TNUM_OTP_WR_REPAIR_FLWBYTE;
   IntS TNUM_OTP_WR_BURNIN_FLWBYTE;
   IntS TNUM_OTP_WR_EXEC_FLWBYTE;
   IntS TNUM_OTP_WR_CUST_FLWBYTE;
   IntS TNUM_OTP_CHECK_MP1_FLWBYTE;
   IntS TNUM_OTP_CHECK_MP2_FLWBYTE;
   IntS TNUM_OTP_CHECK_MP3_FLWBYTE;
   IntS TNUM_OTP_CHECK_MP1_3_DRL_FLWBYTE;
   IntS TNUM_OTP_CHECK_FT1_FLWBYTE;
   IntS TNUM_OTP_CHECK_FT1_MP1_FLWBYTE;
   IntS TNUM_OTP_CHECK_FT2_FT1_FLWBYTE;
   IntS TNUM_OTP_CHECK_FT3_FLWBYTE;
   IntS TNUM_OTP_CHECK_DRL_FLWBYTE;
   IntS TNUM_OTP_CHECK_FUNC1_FLWBYTE;
   IntS TNUM_OTP_CHECK_FUNC2_FLWBYTE;
   IntS TNUM_OTP_CHECK_FUNC3_FLWBYTE;
   IntS TNUM_OTP_CHECK_REPAIR_FLWBYTE;
   IntS TNUM_OTP_CHECK_BURNIN_FLWBYTE;
   IntS TNUM_OTP_CHECK_EXEC_FLWBYTE;
   IntS TNUM_OTP_CHECK_USER_FLWBYTE;

   IntS TNUM_OTP_WR_PREDRL_VT_MBOX;
   IntS TNUM_OTP_WR_POSTDRL_VT_MBOX;
   IntS TNUM_OTP_WR_BANK_POSTDRL_VT_MBOX;
   IntS TNUM_OTP_WR_DIEID_MBOX;
   IntS TNUM_OTP_WR_DIEID_FBYTE_MBOX;
   IntS TNUM_OTP_WR_DIEID_FBYTE_MP1_MBOX;
   IntS TNUM_OTP_WR_DIEID_FBYTE_MP1_PKG_MBOX;
   IntS TNUM_OTP_WR_OTP_CHKSUM_MBOX;
   IntS TNUM_OTP_WR_PKG_MEMSIZE_MBOX;
   IntS TNUM_OTP_WR_MP3DRL_FLWBYTE;
   IntS TNUM_OTP_PRECON;

   IntS TNUM_OTP_WR_MP1_REV;
   IntS TNUM_OTP_WR_MP2_REV;
   IntS TNUM_OTP_WR_MP3_REV;
   IntS TNUM_OTP_WR_FT1_REV;
   IntS TNUM_OTP_WR_FT2_REV;
   IntS TNUM_OTP_WR_FT3_REV;

   IntS TNUM_OTP_ERS_TCR44;
   IntS TNUM_OTP_ERS_RAM;

   IntS TNUM_OTP_WR_PGMREV_MBOX;
   IntS TNUM_OTP_WR_FLWBYTE_MBOX;
   IntS TNUM_OTP_WR_VT_MBOX;

   IntS TNUM_PUMP_AUXBG;
   IntS TNUM_PUMP_AUXIREF;
   IntS TNUM_PUMP_AUXOSC;
   IntS TNUM_PUMP_AUXV5V0;
   IntS TNUM_PUMP_AUXV5V1;
   IntS TNUM_PUMP_MAINIREF,TNUM_PUMP_MAINICMP10U;
   IntS TNUM_PUMP_MAINOSC;

   IntS TNUM_PUMP_VRD01;
   IntS TNUM_PUMP_VRD23;
   IntS TNUM_PUMP_VRD45;
   IntS TNUM_PUMP_VRD67;

   IntS TNUM_BANK_IREF_RD;
   IntS TNUM_BANK_IREF_PVFY;
   IntS TNUM_BANK_IREF_EVFY;
   IntS TNUM_BANK_IREF_CVFY;
   IntS TNUM_BANK_IREF_RM0;
   IntS TNUM_BANK_IREF_RM1;
   IntS TNUM_BANK_IREF_PMOS_RD;
   IntS TNUM_BANK_IREF_PMOS_PVFY;
   IntS TNUM_BANK_IREF_PMOS_EVFY;
   IntS TNUM_BANK_IREF_PMOS_CVFY;


   IntS TNUM_PUMP_BANDGAP;
   IntS TNUM_PUMP_PARA;
   IntS TNUM_BANK_IREF;
   IntS TNUM_SECT_VDEPLETE;
   IntS TNUM_BANK_BLV_RD;
   IntS TNUM_BANK_WLV_CVFY;
   IntS TNUM_BANK_SLV_CMPT;
   
   IntS TNUM_MAINBG_FORCE_MEASVRD0;
   IntS TNUM_MAINBG_MEASVRD0;
   IntS TNUM_MAINBG_MEAS;
   IntS TNUM_AUXBG_FORCE_MEASVDD5V;
   IntS TNUM_AUXBG_MEASVDD5V;
   IntS TNUM_AUXBG_MEAS;
   IntS TNUM_AUXIREF_MEAS;
   IntS TNUM_MAINIREF_MEAS,TNUM_MAINICMP10U_MEAS;
   IntS TNUM_ALWAYS_PASS;
   IntS TNUM_SHELL_INFO;
   
   IntS TNUM_IBIT_LEFT;
   IntS TNUM_IBIT_RIGHT;
   IntS TNUM_IREFPMOS_RD;

   IntS TNUM_DUMP_FMW_MBOX;
   IntS TNUM_OTP_WR_MISCLOC1;
   IntS TNUM_OTP_WR_MISCLOC2;
   IntS TNUM_BANK_RDSUPERM1S;


    /*+++ Base testnames/twnames +++*/


     /*[tcrnum,tcrmode,tpnum,prepost,vcorner]*/
    /* array[0..128,TPModeType,1..6,pre..post,VCornerType] of */
    StringS PUMP_BANK_PARA_TESTNAME[129][6][6][2][9]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /* array[0..128,TPModeType,1..6] of */
    BoolS PUMP_BANK_PARA_ENABLE[129][6][6]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /* array[0..128,TPModeType,1..6] of */
    BoolS PUMP_BANK_PARA_BINOUT[129][6][6]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    FloatM2D PUMP_PARA_VALUE(6,2); /* :MANUAL FIX REQUIRED: array dimensions are : TPModeType,pre..post */
    /* array[0..7,0..128,TPModeType,1..6,pre..post,VCornerType] of */
    FloatM BANK_PARA_VALUE[8][129][6][6][2][9]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /* array[0..128,TPModeType,1..6,pre..post,VCornerType] of */
    StringS BANK_PARA_TWSTR[129][6][6][2][9]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    
     /*[bank,block,tcrnum,tcrmode,tpnum,prepost,vcorner]*/
    /*array[0..7,0..7,0..128,TPModeType,1..6,pre..post,VCornerType] of */
    FloatM BLOCK_PARA_VALUE[8][8][129][6][6][2][9]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    
     /*[bank,even..odd,tcrnum,tcrmode,prepost,vcorner]*/
    /*array[0..7,0..1,TPModeType,pre..post,VCornerType] of */
    FloatM BANK_IREFARR_VALUE[8][2][6][2][9]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */

    FloatM2D PUMP_LEAK_VALUE(6,9); /* :MANUAL FIX REQUIRED: array dimensions are : TPModeType,VCornerType */
    /*array[TPModeType,pre..post,1..2] of */
    FloatM TPAD_LEAK_VALUE[6][2][2]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */

    /*array[0..7,0..15,vttype,prepostcorner] of */
    FloatM BANK_VT_VALUE[8][16][6][2]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /*array[0..7,0..15,vttype,prepostcorner] of */
    FloatM RED_VT_VALUE[8][16][6][2]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /*array[0..7,0..15,vttype] of */
    FloatM BANK_VT_DELTA_VALUE[8][16][6]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /*array[0..7,vttype,prepostcorner] of */
    FloatM OTP_VT_VALUE[8][6][2]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    FloatM2D OTP_VT_DELTA_VALUE(8,6); /* :MANUAL FIX REQUIRED: array dimensions are : 0..7,vttype */

    /*array[0..7,0..15,vttype,prepostcorner] of */
    FloatM BANK_BCC_VALUE[8][16][6][2]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /*array[0..7,0..15,vttype,prepostcorner] of */
    FloatM RED_BCC_VALUE[8][16][6][2]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /*array[0..7,0..15,vttype] of */
    FloatM BANK_BCC_DELTA_VALUE[8][16][6]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    /*array[0..7,vttype,prepostcorner] of */
    FloatM OTP_BCC_VALUE[8][6][2]; /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */
    FloatM2D OTP_BCC_DELTA_VALUE(8,6); /* :MANUAL FIX REQUIRED: array dimensions are : 0..7,vttype */

    BoolM GL_VT0DRL_RESULT, GL_VT1DRL_RESULT, GL_BCC0DRL_RESULT, GL_BCC1DRL_RESULT;

    IntM2D BANK_ERS_PULSE(8,16);
    IntM2D BANK_PRECON_PULSE(8,16);

                        /*bank,row#,word#,site*/
    StringM2D OTP_ID_INFO(8,129); /* was array[0..7,0..128,1..NUMSITES] of string[4] */
    IntM2D OTP_ID_INFO_VAL(8,129);
    StringM2D OTP_VT_INFO(8,129); /* was array[0..7,0..128,1..NUMSITES] of string[4] */
    FloatM2D OTP_VT_INFO_VAL(8,129);
    StringM2D OTP_BCC_INFO; /* was array[0..7,0..128,1..NUMSITES] of string[4] */
    FloatM2D OTP_BCC_INFO_VAL(8,129);
    IntM2D OTP_BCC_INFO_INTVAL(8,129);
    IntM2D OTP_LOG1_INFO_VAL(8,129);
    IntM2D OTP_LOG3_INFO_VAL(8,129);

    IntM EFCHKSUM_MSW, EFCHKSUM_LSW;
    StringM1D FRM_OTP_BANK_EFSUM_HI_BCD(8), FRM_OTP_BANK_EFSUM_LO_BCD(8);
    IntM1D FRM_OTP_BANK_EFSUM_HI_VAL(8), FRM_OTP_BANK_EFSUM_LO_VAL(8);
    StringM1D FRM_OTP_BANK_FOSC_HI_BCD(8), FRM_OTP_BANK_FOSC_LO_BCD(8);
    IntM1D FRM_OTP_BANK_FOSC_HI_VAL(8), FRM_OTP_BANK_FOSC_LO_VAL(8);


    /*+++ Global test frequency +++*/
   FloatS GL_F021_PLLENA_SPEED1;
   FloatS GL_F021_PLLDIS_SPEED1;


    /*+++ Global maxtime +++*/
   FloatS GL_F021_MAXTIME,GL_F021_PARAM_MAXTIME;

   FloatS GL_F021_BANK_MAXTIME;
   FloatS GL_F021_BANK_ERS_MAXTIME;
   FloatS GL_F021_BANK_PGM_MAXTIME;
   FloatS GL_F021_BANK_SWPGM_MAXTIME;
   FloatS GL_F021_BANK_VT_MAXTIME;

   FloatS GL_F021_SECT_MAXTIME;
   FloatS GL_F021_SECT_ERS_MAXTIME;
   FloatS GL_F021_SECT_PGM_MAXTIME;
   FloatS GL_F021_SECT_VT_MAXTIME;

   FloatS GL_VT1_UV_SEARCH_START;
   FloatS GL_VT1_UV_SEARCH_STOP;
   FloatS GL_VT1_UV_SEARCH_RESOL;
   FloatS GL_VT1_SEARCH_START;
   FloatS GL_VT1_SEARCH_STOP;
   FloatS GL_VT1_SEARCH_RESOL;
   FloatS GL_VT0_SEARCH_START;
   FloatS GL_VT0_SEARCH_STOP;
   FloatS GL_VT0_SEARCH_RESOL;
   FloatS GL_VT1_SHIP_SEARCH_START;
   FloatS GL_VT1_SHIP_SEARCH_STOP;
   FloatS GL_VT1_SHIP_SEARCH_RESOL;
   FloatS GL_VT0_ERSSTR_SEARCH_START;
   FloatS GL_VT0_ERSSTR_SEARCH_STOP;
   FloatS GL_VT1_ERSSTR_SEARCH_STOP;

    /*+++ Global misc +++*/
   BoolS GL_MULTISHELL,GL_SAVEFLCOFENA;
   BoolS GL_MP3PKG_FLOW;
   BoolS GL_VPP_PRESENT;
   FlashPumpType GL_PUMPTYPE;
   FlashBankType GL_BANKTYPE;
   StringM GL_F021_FAIL_PATT;
   BoolM GL_F021_LOG_FAIL_PATT;
   BoolM GL_F021_COF_PASS;
   StringM GL_F021_COF_1STFAILTEST;
    /*for continue-on-fail*/
   StringM1D GL_F021_COF_INFOS(40);
   BoolM1D GL_F021_COF_INFOS_FULL(40);
    /*for esda delta-vt*/
   IntS GL_PREV_TNUM_VT;
   BoolM GL_FLASH_RETEST;
   BoolM GL_FLASH_RETEST_GEC;
   BoolM GL_FLASH_SAVESITES;
   BoolM GL_FLASH_EGSTRESS_STATUS;
   StringM GL_F021_LOG_SOFTBIN_STAT;
   StringM GL_F021_LOG_SOFTBIN_PATT;

   IntS GL_TPADMIN,GL_TPADMAX;

   BoolS GL_DO_REFARR_ERS_ADAPTIVE;

   BoolS GL_DO_TWLOGALL_IPROG_DRV,GL_DO_TWLOGALL_ISA_LD,GL_DO_TWLOGALL_ISA_NLD;
   IntS GL_DO_RD_WITH_TOPTION;
   BoolS GL_DO_VT_MAIN_USING_PBIST, GL_DO_VT_OTP_USING_PBIST, GL_DO_VT_USING_BIDI, GL_DO_VT_USING_INTERNAL;
   BoolS GL_DO_BCC_MAIN_USING_PBIST, GL_DO_BCC_OTP_USING_PBIST;
   BoolS GL_DO_FL_PBIST, GL_DO_PGM_USING_PBIST, GL_DO_ERS_BY_SECTOR, GL_DO_REDENA;
   BoolS GL_DO_MASK_1S_BCC0_DRL_PBIST;
   BoolS GL_DO_BCCVT_RCODE_ENA;
   IntS GL_DO_BCCVT_RCODE_BANK;

   BoolS GL_DO_TNI_CODE;
   BoolS GL_DO_VT_HISTOGRAM;

   BoolS GL_DO_RESTORE_OTP_ON_FAIL;
   BoolM SITE_TO_RESTORE_OTP;

   FlashLeakType GL_DO_WLS_LEAK_OPTION, GL_DO_BLS_LEAK_OPTION,
   GL_DO_CGS_LEAK_OPTION, GL_DO_EGCSS_LEAK_OPTION, GL_DO_EGS_LEAK_OPTION;

   BoolS GL_DO_VT_FIRST, GL_DO_DRL0_USING_VT, GL_DO_DRL1_USING_VT;


   IntS GL_ASICHI, GL_ASICLO;
   IntS GL_PGMREV;

   BoolS GL_IGNORE_FLOWBYTE;
   StringS GL_MP1_FLWBYTE;
   StringS GL_MP1REP_FLWBYTE;
   StringS GL_MP2_FLWBYTE;
   StringS GL_MP2DRL_FLWBYTE;
   StringS GL_MP3DRL_FLWBYTE;
   StringS GL_MP3_FLWBYTE;
   StringS GL_FT1DRL_FLWBYTE;
   StringS GL_FT1_FLWBYTE;
   StringS GL_FT2_FLWBYTE;
   StringS GL_FT3_FLWBYTE;

   BoolM GL_FLWBIT0_PGM,GL_FLWBIT1_PGM,GL_FLWBIT2_PGM,GL_FLWBIT3_PGM,
   GL_FLWBIT4_PGM,GL_FLWBIT5_PGM,GL_FLWBIT6_PGM,GL_FLWBIT7_PGM,
   GL_FLWBIT8_PGM,GL_FLWBIT9_PGM,GL_FLWBIT10_PGM,GL_FLWBIT11_PGM,
   GL_FLWBIT12_PGM,GL_FLWBIT13_PGM,GL_FLWBIT14_PGM,GL_FLWBIT15_PGM;


   IntS GL_DEV_PKG_ID;
   IntS GL_DEV_MEMSZ;

    /*added for soft trim*/
   IntS GL_AUXBG_MAXEFUSE;
   IntS GL_AUXIREF_MAXEFUSE;
   IntS GL_MAINBG_MAXEFUSE;
   IntS GL_MAINIREF_MAXEFUSE;
   IntS GL_VHV_SLPCT_MAXEFUSE, GL_VSA5CT_MAXEFUSE;
   BoolS GL_DO_FLASHTRIM;
   BoolS GL_DO_BG_DIRECT_TRIM;
   BoolS GL_DO_BG_ADAPT_TRIM;
   BoolS GL_DO_BG_CHAR_TRIM;
   BoolS GL_DO_IREF_ADAPT_TRIM;
   BoolS GL_DO_IREF_CHAR_TRIM;
   BoolS GL_DO_IREF_PMOS_TRIM;
   BoolM SITE_TO_FTRIM;
   BoolS GL_DO_FOSC_TRIM;
   BoolS GL_DO_EFBIT22_TRIM;

    /*added for repair*/
   BoolS GL_DO_REPAIR;
   BoolM SITE_TO_REPAIR;
   BoolM2D BLOCK_TO_REPAIR(8,16);
   BoolM1D BANK_TO_REPAIR(8);
   BoolM SITE_TO_REPAIR_FAST;
   BoolM SITE_GOOD_REPAIR_FAST;
   BoolM SITE_TO_REPAIR_SLOW;
   BoolM SITE_GOOD_REPAIR_SLOW;
   IntS FAKEREP_SOL[8][16][4];  /* No SV type for > 2 dimensional arrays :MANUAL FIX REQUIRED: */ /*hold pre-defined artificial rep solution*/
   IntS GL_FAKEREP_SAMPLING, GL_FAKEREP_COUNT;
   BoolS GL_FAKEREP_ENA;
   IntS GL_PMOS_TRIM_COUNT;

   StringM1D FRM_OTP_WD8(8), FRM_OTP_WD9(8);
   StringM FRM_OTP_VERSION_BCD;

   StringM FRM_OTP_ASICHI_BCD, FRM_OTP_ASICLO_BCD,
   FRM_OTP_LOTHI_BCD,  FRM_OTP_LOTLO_BCD,
   FRM_OTP_FLWBYTE_BCD,
   FRM_OTP_WAFER_BCD,  FRM_OTP_XPOS_BCD, FRM_OTP_YPOS_BCD;

   IntM FRM_OTP_FLWBYTE_VALUE;

   StringM FRM_OTP_PKGID_BCD, FRM_OTP_MEMSZ_BCD;

   StringM FRM_OTP_OTPCHKSUM_HI_BCD,FRM_OTP_OTPCHKSUM_LO_BCD,FRM_OTP_NUMSECT_BCD,FRM_OTP_NUMBANK_BCD,
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

   StringM FRM_OTP_IREFPMOS_BCD,FRM_OTP_IREFCV_BCD;

   StringM2D FRM_OTP_SECT_PREDRL_VT_BCD(8,16);
   StringM2D FRM_OTP_SECT_PREFT1_VT_BCD(8,16);
   StringM1D FRM_OTP_BANK_PREDRL_VT_BCD(8);
   StringM1D FRM_OTP_BANK_PREFT1_VT_BCD(8);

    /*pre-Drl Vt0/1 in otp at mp1 before bake*/
   StringM2D FRM_OTP_BLOCK_PREDRL_VT0_BCD(8,16);
   StringM2D FRM_OTP_BLOCK_PREDRL_VT1_BCD(8,16);
    /*pre-Drl2 Vt0/1 in otp at mp2 before bake and going to mp3 testing*/
   StringM2D FRM_OTP_BLOCK_PREDRL2_VT0_BCD(8,16);
   StringM2D FRM_OTP_BLOCK_PREDRL2_VT1_BCD(8,16);
    /*pre-Drl3 Vt0/1 in otp at mp3 before going to mp4/ft testing*/
   StringM2D FRM_OTP_BLOCK_PREDRL3_VT0_BCD(8,16);
   StringM2D FRM_OTP_BLOCK_PREDRL3_VT1_BCD(8,16);
   StringM2D FRM_OTP_BLOCK_PREFT1_VT_BCD(8,16);

   FloatM2D FRM_OTP_SECT_PREDRL_VT_VAL(8,16);
   FloatM2D FRM_OTP_SECT_PREFT1_VT_VAL(8,16);
   FloatM1D FRM_OTP_BANK_PREDRL_VT_VAL(8);
   FloatM1D FRM_OTP_BANK_PREFT1_VT_VAL(8);

   FloatM2D FRM_OTP_BLOCK_PREDRL_VT0_VAL(8,16);
   FloatM2D FRM_OTP_BLOCK_PREDRL_VT1_VAL(8,16);
   FloatM2D FRM_OTP_BLOCK_PREDRL2_VT0_VAL(8,16);
   FloatM2D FRM_OTP_BLOCK_PREDRL2_VT1_VAL(8,16);
   FloatM2D FRM_OTP_BLOCK_PREDRL3_VT0_VAL(8,16);
   FloatM2D FRM_OTP_BLOCK_PREDRL3_VT1_VAL(8,16);
   FloatM2D FRM_OTP_BLOCK_PREFT1_VT_VAL(8,16);

   
    /*use to specify module/bank/sector/block/quad testing (0,1,2,3,4,5 respectively)*/
   IntS MODTYPE;
   IntS BANKTYPE;
   IntS SECTTYPE;
   IntS OTPTYPE;
   IntS BLOCKTYPE;
   IntS QUADTYPE, ARBTYPE;
   IntS FL_MAX_QUADRANT;

prepostcorner prepost_type;
 /*OtpOper_type : OtpOper; export;*/


   BoolM spare_msbool1,spare_msbool2,
   spare_msbool3,spare_msbool4;
   IntM spare_msint1,spare_msint2,
   spare_msint3,spare_msint4,spare_msint5;   
   FloatM spare_msFloatS1,spare_msFloatS2,
   spare_msFloatS3,spare_msFloatS4;
   StringS spare_str1_256,spare_str2_256;

 /*KChau effuse 02/01/7 - added for flash efuse trimming*/
   BoolS enableFTrim;   /*KChau effuse 02/01/7*/

   StringM TempDieIDChainStr;
   StringM margFlashChainStr;
   StringM FlashProgString, TempProgString;
   StringM SaveFlashProgString;
   StringM BANK_EFSTR, AUXBG_EFSTR, MAINBG_EFSTR, VHV_SLPCT_EFSTR, VSA5CT_EFSTR;
   StringM AUXBG_EFSTR_SHORT, MAINBG_EFSTR_SHORT;

 /*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


       /*+++ Ers/Prog/Rd Limit +++*/
    FloatS SECT_PRECON_IVDD_ULimit;
    FloatS SECT_PRECON_IVDD_LLimit;
    FloatS SECT_ERS_IVDD_ULimit;
    FloatS SECT_ERS_IVDD_LLimit;
    FloatS SECT_READ_IVDD_ULimit;
    FloatS SECT_READ_IVDD_LLimit;
    FloatS SECT_PRECON_IVDD3VFL_ULimit;
    FloatS SECT_PRECON_IVDD3VFL_LLimit;
    FloatS SECT_ERS_IVDD3VFL_ULimit;
    FloatS SECT_ERS_IVDD3VFL_LLimit;
    FloatS SECT_READ_IVDD3VFL_ULimit;
    FloatS SECT_READ_IVDD3VFL_LLimit;

    FloatS BANK_PRECON_IVDD_ULimit;
    FloatS BANK_PRECON_IVDD_LLimit;
    FloatS BANK_ERS_IVDD_ULimit;
    FloatS BANK_ERS_IVDD_LLimit;
    FloatS BANK_READ_IVDD_ULimit;
    FloatS BANK_READ_IVDD_LLimit;
    FloatS BANK_PRECON_IVDD3VFL_ULimit;
    FloatS BANK_PRECON_IVDD3VFL_LLimit;
    FloatS BANK_ERS_IVDD3VFL_ULimit;
    FloatS BANK_ERS_IVDD3VFL_LLimit;
    FloatS BANK_READ_IVDD3VFL_ULimit;
    FloatS BANK_READ_IVDD3VFL_LLimit;


     /*for capture esda*/
    StringS GL_ESDA_PROGID, my_this_wfrid,my_lotid,my_scribeid;

    IntS ESDA_IMG_BLK1;
    IntS ESDA_IMG_BLKM1;
    IntS ESDA_IMG_BLK1_RED;
    IntS ESDA_IMG_BLKM1_RED;
    IntS ESDA_IMG_BLK1_SHIP;
    IntS ESDA_IMG_BLKM1_SHIP;
      
    IntS ESDA_IMG_BLK0;
    IntS ESDA_IMG_BLKM0;
    IntS ESDA_IMG_BLK0_RED;
    IntS ESDA_IMG_BLKM0_RED;
        
    IntS ESDA_IMG_OCHK;
    IntS ESDA_IMG_MOCHK;
    IntS ESDA_IMG_ECHK;
    IntS ESDA_IMG_MECHK;
        
    IntS ESDA_IMG_UV;
        
    IntS ESDA_IMG_PREWLSVT0;
    IntS ESDA_IMG_PSTWLSVT0;
    IntS ESDA_IMG_PREBLSVT0;
    IntS ESDA_IMG_PSTBLSVT0;
    IntS ESDA_IMG_PRESLSVT0;
    IntS ESDA_IMG_PSTSLSVT0;
        
    IntS ESDA_IMG_PREWLSVT1;
    IntS ESDA_IMG_PSTWLSVT1;
        
    IntS ESDA_IMG_PREDRLOCHK_VT0MIN;
    IntS ESDA_IMG_PSTDRLOCHK_VT0MIN;
    IntS ESDA_IMG_PREDRLOCHK_VT0MAX;
    IntS ESDA_IMG_PREDRLECHK_VT0MIN;
    IntS ESDA_IMG_PSTDRLECHK_VT0MIN;
    IntS ESDA_IMG_PREDRLECHK_VT0MAX;
        
    IntS ESDA_IMG_PREDRLOCHK_VT1;
    IntS ESDA_IMG_PSTDRLOCHK_VT1;
    IntS ESDA_IMG_PREDRLECHK_VT1;
    IntS ESDA_IMG_PSTDRLECHK_VT1;
        
    IntS ESDA_IMG_SHIP_VT1;

           
    IntS ESDA_IMG_BLK1_OTP;
    IntS ESDA_IMG_BLKM1_OTP;
    IntS ESDA_IMG_BLK1_SHIP_OTP;
    IntS ESDA_IMG_BLKM1_SHIP_OTP;
        
    IntS ESDA_IMG_BLK0_OTP;
    IntS ESDA_IMG_BLKM0_OTP;
        
    IntS ESDA_IMG_OCHK_OTP;
    IntS ESDA_IMG_MOCHK_OTP;
    IntS ESDA_IMG_ECHK_OTP;
    IntS ESDA_IMG_MECHK_OTP;
        
    IntS ESDA_IMG_UV_OTP;
        
    IntS ESDA_IMG_PREWLSVT0_OTP;
    IntS ESDA_IMG_PSTWLSVT0_OTP;
    IntS ESDA_IMG_PREBLSVT0_OTP;
    IntS ESDA_IMG_PSTBLSVT0_OTP;
    IntS ESDA_IMG_PRESLSVT0_OTP;
    IntS ESDA_IMG_PSTSLSVT0_OTP;
        
    IntS ESDA_IMG_PREWLSVT1_OTP;
    IntS ESDA_IMG_PSTWLSVT1_OTP;
        
    IntS ESDA_IMG_PREDRLOCHK_VT0MIN_OTP;
    IntS ESDA_IMG_PSTDRLOCHK_VT0MIN_OTP;
    IntS ESDA_IMG_PREDRLOCHK_VT0MAX_OTP;
    IntS ESDA_IMG_PREDRLECHK_VT0MIN_OTP;
    IntS ESDA_IMG_PSTDRLECHK_VT0MIN_OTP;
    IntS ESDA_IMG_PREDRLECHK_VT0MAX_OTP;
        
    IntS ESDA_IMG_PREDRLOCHK_VT1_OTP;
    IntS ESDA_IMG_PSTDRLOCHK_VT1_OTP;


     /*for characterization*/
    BoolS GL_DO_IMEAS_RDBLK1;
    BoolS GL_DO_IMEAS_RDBLK0;
    BoolS GL_DO_IMEAS_PRECON;
    BoolS GL_DO_IMEAS_ERASE;
    BoolS GL_DO_IMEAS_BLS;
    BoolS GL_DO_IMEAS_WLS;
    BoolS GL_DO_IMEAS_SLS;
     /*+++ CHARZ +++*/
    BoolS GL_DO_CHARZ_ERSREFARR, GL_DO_CHARZ_OVRTEMPL_W89;
    IntS GL_CHARZ_ERSREFARR_COUNT,GL_CHARZ_ERSREFARR_SAVECOUNT, GL_CHARZ_BCC_COUNT;
    IntS GL_CHARZ_ESTAIRSTEP_COUNT,GL_CHARZ_ESTAIRSTEP_SAVECOUNT;
    BoolS GL_DO_CHARZ_PPW;
    BoolS GL_DO_CHARZ_BCC,GL_DO_CHARZ_VT;
    IntS GL_DO_CHARZ_BCC_OPTION,GL_DO_CHARZ_VT_OPTION;
    BoolS GL_DO_CHARZ_IREF_RD,GL_DO_CHARZ_IREF_PVFY,GL_DO_CHARZ_IREF_EVFY,GL_DO_CHARZ_IREF_CVFY,GL_DO_CHARZ_IREF_RM01;
    BoolS GL_DO_CHARZ_IPMOS_RD,GL_DO_CHARZ_IPMOS_PVFY,GL_DO_CHARZ_IPMOS_EVFY,GL_DO_CHARZ_IPMOS_CVFY;
    BoolS GL_DO_CHARZ_INTERNAL_IREF_VCG;
    BoolS GL_DO_CHARZ_STRESS;
    BoolS GL_DO_CHARZ_FREQ_RANDCODE;
    IntS GL_CHARZ_FREQ_RANDCODE_COUNT,GL_CHARZ_FREQ_RANDCODE_SAMPLING;
    BoolS GL_DO_CHARZ_SAMPNOISE;

    StringS GL_PREVIOUS_SHELL;
    MBoxRAMType GL_MBoxRAMTYPE;

//    BoolS GL_PLELL_FORMAT; // unused, instead use Unison datalogger controls

     /*reference variables*/
    FloatS IBIT_DESIGN_LIM, IBIT_CMPT_LIM;
    FloatS1D IREF_PMOSRATIO(32);
    IntS1D IREF_PMOSCODE(32);
    StringS1D IREF_PMOSCODE_STR(32);
     /*hold pmos trim code/solution per bank*/
    StringM1D IREF_PMOSTRIMCODE_STR(8);
    StringS BANKEF_BIT0_4, BANKEF_BIT10_23, BANKEF_BIT29_31, BANKEF_BIT10_23_BIT17SET;
    StringS1D BANKEF_BIT10_23_BANKNUM(8);
    BoolM1D BANK_TO_PMOS_TRIM(8);
    BoolM SITE_IPMOS_TRIMMED;
    IntM IPMOS_BANKENA_MSW, IPMOS_BANKENA_LSW;
    IntM IPMOS_TRIMCODE1_MSW, IPMOS_TRIMCODE1_LSW;
    IntM IPMOS_TRIMCODE2_MSW, IPMOS_TRIMCODE2_LSW;
    IntM2D IPMOS_TRIMCODE_SAVED(8,2);
    IntM2D IPMOS_TRIMCODE_EFUSE(8,2);
    IntM2D IPMOS_TRIMCODE_VAL(8,2);

    BoolS GL_DO_VHV_CT_TRIM;
    IntM VHV_PG_CT_TRIMSAVED, VHV_ER_CT_TRIMSAVED, VHV_PV_CT_TRIMSAVED, VHV_OTHER_CT_TRIMSAVED;
    IntM VHV_ER_CT_STARTSAVED, VHV_ER_CT_STOPSAVED, VHV_ER_CT_STEPSAVED, VHV_MAXPP_SAVED;
    IntM VHV_ER_CT_STARTSAVED_EMU, VHV_ER_CT_STEPSAVED_EMU, VHV_ER_CT_STOPSAVED_EMU, VHV_PG_CT_TRIMSAVED_EMU, VHV_ER_CT_TRIMSAVED_EMU, VHV_PV_CT_TRIMSAVED_EMU, VHV_OTHER_CT_TRIMSAVED_EMU;
    IntM VHV_SLPCT_TRIMSAVED, VSA5CT_TRIMSAVED;
     /*to hold trim solution use for adapt trimming*/
    IntM MAINBG_TRIMSAVED, MAINIREF_TRIMSAVED, FOSC_TRIMSAVED;



    /*++++ added for 32bit ++++*/
   IntS TNUM_PUMP_VRD0;
   IntS TNUM_PUMP_VRD1;
   IntS TNUM_PUMP_VRD2;
   IntS TNUM_PUMP_VRD3;
   IntS TNUM_PUMP_VRD4;
   IntS TNUM_PUMP_VRD5;
   IntS TNUM_PUMP_VRD6;
   IntS TNUM_PUMP_VRD7;


    IntS GL_VT_TTR_OPTION,
    GL_OTP_VT_TTR_OPTION;
    IntS GL_EQUIV_TNUM;
    BoolS GL_TTR_ENA_VT;
    FloatS GL_INTEXT_VT_SEARCH_WINDOW;


 /*------------------*/
   IntS TNUM_PUMP_MAINBG;
   IntS TNUM_PUMP_VHVPROG, TNUM_PUMP_VHVPVFY, TNUM_PUMP_VHVERS;
   IntS TNUM_PUMP_VSL;
   IntS TNUM_PUMP_VREAD;
   IntS TNUM_PUMP_VSA5_READ, TNUM_PUMP_VSA5_PROG, TNUM_PUMP_VSA5_PVFY, 
   TNUM_PUMP_VSA5_ERS, TNUM_PUMP_VSA5_EVFY, TNUM_PUMP_VSA5_CVFY;
   IntS TNUM_PUMP_VWL_READ, TNUM_PUMP_VWL_PROG, TNUM_PUMP_VWL_PVFY, 
   TNUM_PUMP_VWL_ERS, TNUM_PUMP_VWL_EVFY, TNUM_PUMP_VWL_CVFY;
   IntS TNUM_PUMP_VCG2P5_READ, TNUM_PUMP_VCG2P5_PROG, TNUM_PUMP_VCG2P5_PVFY, 
   TNUM_PUMP_VCG2P5_ERS, TNUM_PUMP_VCG2P5_EVFY, TNUM_PUMP_VCG2P5_CVFY;
   IntS TNUM_PUMP_VINH_READ, TNUM_PUMP_VINH_PROG, TNUM_PUMP_VINH_PVFY, 
   TNUM_PUMP_VINH_ERS, TNUM_PUMP_VINH_EVFY, TNUM_PUMP_VINH_CVFY;
   IntS TNUM_PUMP_VHV2X_PROG;
   IntS TNUM_PUMP_VHV_FORCE_PROG, TNUM_PUMP_VHV_FORCE_PVFY, TNUM_PUMP_VHV_FORCE_ERS;

   IntS TNUM_BANK_VRDBUF;
   IntS TNUM_BANK_IREF_READ_EVEN, TNUM_BANK_IREF_PVFY_EVEN, TNUM_BANK_IREF_EVFY_EVEN, TNUM_BANK_IREF_CVFY_EVEN;
   IntS TNUM_BANK_IREF_READ_ODD, TNUM_BANK_IREF_PVFY_ODD, TNUM_BANK_IREF_EVFY_ODD, TNUM_BANK_IREF_CVFY_ODD;
   IntS TNUM_BANK_IREF_RDM0_EVEN, TNUM_BANK_IREF_RDM0_ODD, TNUM_BANK_IREF_RDM1_EVEN, TNUM_BANK_IREF_RDM1_ODD;
   IntS TNUM_BANK_IPMOS_READ_EVEN, TNUM_BANK_IPMOS_PVFY_EVEN, TNUM_BANK_IPMOS_EVFY_EVEN, TNUM_BANK_IPMOS_CVFY_EVEN;
   IntS TNUM_BANK_IPMOS_READ_ODD, TNUM_BANK_IPMOS_PVFY_ODD, TNUM_BANK_IPMOS_EVFY_ODD, TNUM_BANK_IPMOS_CVFY_ODD;
   IntS TNUM_SA_IREF_LOAD_READ_EVEN, TNUM_SA_IREF_LOAD_READ_ODD, TNUM_SA_IREF_NOLOAD_READ_EVEN, TNUM_SA_IREF_NOLOAD_READ_ODD;
   IntS TNUM_IWLDRV_PROG_EVEN, TNUM_IWLDRV_PROG_ODD;
   IntS TNUM_BANK_REVTUNN_STRESS, TNUM_BANK_PTHRU_STRESS, TNUM_BANK_THINOX_STRESS;
   IntS TNUM_BANK_PGMFF_STRESS;
   IntS TNUM_BANK_TUNOX_STRESS, TNUM_BANK_ONO_STRESS;
   IntS TNUM_BANK_RDDIST_STRESS;
   IntS TNUM_BANK_CSFG_STRESS;
   IntS TNUM_BANK_WLS, TNUM_BANK_WLS_ODD, TNUM_BANK_WLS_EVEN;
   IntS TNUM_BANK_BLS, TNUM_BANK_BLS_ODD, TNUM_BANK_BLS_EVEN;
   IntS TNUM_BANK_CGS, TNUM_BANK_CGS_ODD, TNUM_BANK_CGS_EVEN;
   IntS TNUM_BANK_EGCSS;
   IntS TNUM_BANK_EGS;
   IntS TNUM_BANK_REFARR_ERS;

   IntS TNUM_BANK_INTERNAL_IREF_READ_EVEN, TNUM_BANK_INTERNAL_IREF_PVFY_EVEN, TNUM_BANK_INTERNAL_IREF_EVFY_EVEN, TNUM_BANK_INTERNAL_IREF_CVFY_EVEN;
   IntS TNUM_BANK_INTERNAL_IREF_READ_ODD, TNUM_BANK_INTERNAL_IREF_PVFY_ODD, TNUM_BANK_INTERNAL_IREF_EVFY_ODD, TNUM_BANK_INTERNAL_IREF_CVFY_ODD;
   IntS TNUM_BANK_INTERNAL_IREF_RDM0_EVEN, TNUM_BANK_INTERNAL_IREF_RDM0_ODD, TNUM_BANK_INTERNAL_IREF_RDM1_EVEN, TNUM_BANK_INTERNAL_IREF_RDM1_ODD;
   IntS TNUM_BANK_INTERNAL_IPMOS_READ_EVEN, TNUM_BANK_INTERNAL_IPMOS_PVFY_EVEN, TNUM_BANK_INTERNAL_IPMOS_EVFY_EVEN, TNUM_BANK_INTERNAL_IPMOS_CVFY_EVEN;
   IntS TNUM_BANK_INTERNAL_IPMOS_READ_ODD, TNUM_BANK_INTERNAL_IPMOS_PVFY_ODD, TNUM_BANK_INTERNAL_IPMOS_EVFY_ODD, TNUM_BANK_INTERNAL_IPMOS_CVFY_ODD;
   IntS TNUM_BANK_INTERNAL_IPMOS_RDM0_ODD, TNUM_BANK_INTERNAL_IPMOS_RDM0_EVEN, TNUM_BANK_INTERNAL_IPMOS_RDM1_ODD, TNUM_BANK_INTERNAL_IPMOS_RDM1_EVEN;

   IntS TNUM_BANK_RDM0ECHK, TNUM_BANK_RDM0OCHK, TNUM_BANK_RDM1ECHK, TNUM_BANK_RDM1OCHK;
   IntS TNUM_BANK_ERS_WEAK;
   IntS TNUM_BANK_BCC_0S,TNUM_BANK_BCC_0S_MIN,TNUM_BANK_BCC_1S,TNUM_BANK_BCC_1S_MAX,TNUM_BANK_BCC_ECHK,TNUM_BANK_BCC_OCHK;
   IntS TNUM_BANK_BCC_TCR6, TNUM_BANK_BCC_TCR38, TNUM_BANK_BCC_TCR39;
   IntS TNUM_BITLINE_ACCESS;


   IntS TNUM_TARGET_BLOCK, TNUM_TARGET_SECT, TNUM_TARGET_QUAD, TNUM_TARGET_ARB, TNUM_TARGET_OTP, TNUM_TARGET_OTP_SEMI;
   IntS TNUM_DATA_0S, TNUM_DATA_1S, TNUM_DATA_ECHK, TNUM_DATA_OCHK, TNUM_DATA_ARBITRARY, TNUM_DATA_ARB_ECC, TNUM_DATA_LOGIC_ECHK;
   IntS TNUM_BANK_VT_TCR5, TNUM_BANK_VT_TCR6, TNUM_BANK_VT_TCR39;
   IntS TNUM_TOPTION_NORMAL, TNUM_TOPTION_PSARD, TNUM_TOPTION_ESDARD, TNUM_TOPTION_REPAIRRD;
   IntS TNUM_DIV2, TNUM_MULT1, TNUM_MULT2, TNUM_MULT4;
   IntS TNUM_TCR5, TNUM_TCR6, TNUM_TCR38, TNUM_TCR39, TNUM_TCR72;
   IntS TNUM_FASTPRECON,TNUM_REDUNDENA, TNUM_ECCENA;
   IntS TNUM_PBIST_RDM1S, TNUM_PBIST_RDM0S, TNUM_PBIST_VT1S, TNUM_PBIST_VT0S, TNUM_PBIST_BCC1S, TNUM_PBIST_BCC0S, TNUM_PBIST_CUSTCR;
   IntS TNUM_PBIST_IVT0S;
   IntS TNUM_PBIST_MASK1S;
   IntS TNUM_BIDI_VT;
   IntS TNUM_PROG_RANDCODE, TNUM_EXEC_RANDCODE;

   IntS OVRIND_PSU,OVRIND_ESU,OVRIND_CSU,OVRIND_PVSU,OVRIND_EVSU,OVRIND_RPTVSU,OVRIND_CVSU,
   OVRIND_AEXEZSU,OVRIND_PVACC,OVRIND_PH,OVRIND_EH,OVRIND_RH,OVRIND_PVH,OVRIND_PVH2,
   OVRIND_PPW,OVRIND_EPW,OVRIND_EPWHI,OVRIND_VSTAT;

   IntS OVRIND_MAXPP,OVRIND_MAXEP,OVRIND_VHV_ESTART_CT,OVRIND_VHV_ESTOP_CT,OVRIND_VHV_ESTEP;

   IntS OVRIND_VHV_PG_CT,OVRIND_VHV_ER_CT,OVRIND_VHV_PV_CT,OVRIND_VCG2P5_CT,OVRIND_VINH_CT,
   OVRIND_VSL_CT,OVRIND_VWL_CT,OVRIND_VRD_CT,OVRIND_VSA5_CT,OVRIND_PUMP_SEQ;

   IntS OVRIND_PV_NMOS_RAT,OVRIND_PV_PMOS_EVEN_RAT,OVRIND_PV_PMOS_ODD_RAT,OVRIND_PV_PRECHARGE,
   OVRIND_EV_NMOS_RAT,OVRIND_EV_PMOS_EVEN_RAT,OVRIND_EV_PMOS_ODD_RAT,OVRIND_EV_PRECHARGE,
   OVRIND_CV_NMOS_RAT,OVRIND_CV_PMOS_EVEN_RAT,OVRIND_CV_PMOS_ODD_RAT,OVRIND_CV_PRECHARGE,
   OVRIND_RDM0_NMOS_RAT,OVRIND_RDM0_PMOS_EVEN_RAT,OVRIND_RDM0_PMOS_ODD_RAT,OVRIND_RDM0_PRECHARGE,
   OVRIND_RDM1_NMOS_RAT,OVRIND_RDM1_PMOS_EVEN_RAT,OVRIND_RDM1_PMOS_ODD_RAT,OVRIND_RDM1_PRECHARGE,
   OVRIND_RD_NMOS_RAT,OVRIND_RD_PMOS_EVEN_RAT,OVRIND_RD_PMOS_ODD_RAT,OVRIND_RD_PRECHARGE;

   IntS OVRIND_REFBIT_HV_PROTECTION,OVRIND_ALL_RLBL_OFF,OVRIND_OVRIDE_OTP_RATIO,OVRIND_LPWMODE_NO_TB_SPLIT,
   OVRIND_USE_1P5X_SA_TIMING,OVRIND_COL_CHANGEABLE_IN_PGM,OVRIND_IGNORE_BU_RD_RATIO,OVRIND_MASTER_REDUND_DISABLE,
   OVRIND_DISABLE_VRDBUF,OVRIND_INC_PV_SA_TIMING,OVRIND_OTP_HV_PROTECTION;

   IntS W8_0_DEF_CAT0, W8_4_DEF_CAT0, W8_8_DEF_CAT0, W8_C_DEF_CAT0,
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

   BoolS IsMainArray, IsBcc;

   BoolS GL_DO_GET_WORSTBIT;
   FloatM FL_WORSTBIT_IREF, FL_WORSTBIT_VCG;
   IntM FL_WORSTBIT_FADDR, FL_WORSTBIT_FCOUNT;
   IntM1D FL_WORSTBIT_FDATA(10);

   BoolS GL_SKIP_MP2_FLASHFLOW;
   StringS GL_EFUSE_RD_CODEOPTION, GL_EFUSE_PG_CODEOPTION;

   FloatM1D FL_IV_DATA(512);
   IntS FL_IV_DATA_COUNT;
   BoolS GL_DO_SAVE_IV_DATA;

   FloatS1D SAMP_NOISE_ULIM(8);
   FloatS1D DRLVT0_LDELTA(8), DRLVT0_UDELTA(8), DRLVT0_Median_ULimit(8);

   IntS ADDR_RAM_INC;

   BoolS GL_DO_CHARZ_SAMP_ACCY, GL_DO_SAVE_SAMP_ACCY_DATA;
   IntS GL_DO_CHARZ_SAMP_ACCY_COUNT, GL_DO_CHARZ_SAMP_ACCY_SAMPLING;
   FloatM2D FL_SAMP_ACCY_VT(8,16);
   IntM2D FL_SAMP_ACCY_VT_FADDR_MSW(8,16),FL_SAMP_ACCY_VT_FADDR_LSW(8,16),
   FL_SAMP_ACCY_VT_FDATA_MSW(8,16),FL_SAMP_ACCY_VT_FDATA_LSW(8,16),
   FL_SAMP_ACCY_VT_FDATA1_MSW(8,16),FL_SAMP_ACCY_VT_FDATA1_LSW(8,16);


