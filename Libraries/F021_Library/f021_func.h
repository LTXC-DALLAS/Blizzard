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
 /*  A1.5 : Released for bug fix.                               KChau 01/15/10 */
 /*                                                                            */
 /*  A1.6 : Released with PMOS Trim.                            KChau 03/15/10 */
 /*                                                                            */
 /*  A1.7 : Released with Redundancy, fake repair, flash PBIST. KChau 04/09/10 */
 /*                                                                            */
 /****************************************************************************/

#ifndef F021_FUNC_H
#define F021_FUNC_H

#include <f021_flashvar.h>
#include <std_vi.h>
#include <TestwareSupport.h>

//void F021_FlashConfig();
//
//void PrintHeaderBool(BoolS paral_format);
//
//void PrintResultBool(StringS tmpstr1,
//                          IntS tnum,
//                          BoolM test_results,
//                          BoolS paral_format);
//void PrintResultInt(StringS tmpstr1,
//                         IntS tnum,
//                         IntM cmptval,
//                           IntS cmptllim, IntS cmptulim,
//                         BoolS paral_format);
//
//void PrintResultIntHex(StringS tmpstr1,
//                         IntS tnum,
//                         IntM cmptval,
//                           IntS cmptllim, IntS cmptulim,
//                         BoolS paral_format);
//
//void TrealToStr(    FloatS FloatSval,
//                         StringS ReturnStr);
//
//void GetTreal_Unit_Info(    FloatS FloatSval,
//                                 FloatS FloatSVal,
//                                 IntS UnitLen,
//                                 StringS UnitStr);
//
//void PrintHeaderParam(BoolS paral_format);
//
//void PrintResultParam(StringS tmpstr1,
//                           IntS tnum,
//                           BoolM test_results,
//                           FloatS llimit,
//                           FloatS ulimit,
//                           FloatM meas_values,
//                           BoolS paral_format);
//
//void PrintHeaderErsProg(  IntS preconllim, IntS preconulim,
//                               IntS ersllim, IntS ersulim,
//                               IntS cmptllim, IntS cmptulim,
//                             BoolS paral_format);
//
//void PrintResultErsProg(StringS tmpstr1,
//                             IntS tnum,
//                             IntM preconval,
//                             IntM ersval,
//                             IntM cmptval,
//                               IntS preconllim, IntS preconulim,
//                               IntS ersllim, IntS ersulim,
//                               IntS cmptllim, IntS cmptulim,
//                             BoolS paral_format);


// If needed, uncomment. However, I think the only use for this is when 
// working with pattern modifications and we use 'L' & 'H', not '0' & '1'
// so leaving this commented to see if we can just trash - JT
//void IntToBinStr(IntS tmpint1,     StringS &tmpstr1);

StringS IntToVLSIDriveStr(const IntS &tmpint1, const IntS &numBits, const bool &isMSBFirst);

//void ElimSpaceStr(    StringS inputstr);

// ReadRamAddress is multi-site
void ReadRamAddress(IntS startaddr, IntS  stopaddr);

void DumpRamMailbox();

TMResultM F021_LoadFlashShell_func();

void GetRamContentDec_16Bit(    StringS tpatt,
                                     IntS addr_loc,
                                     IntM &ret_val);

void IntMToBcdBinVlsiStrM(const IntM &srcData, StringM &bcdStr, 
                           StringM &binVlsiStr, const BoolS &hexValue);

// I think IntToBCD_BinStr is useless for us. Use IntMToBcdBinVlsiStrM instead
//void IntToBCD_BinStr(    IntM intdata,
//                              StringM bcdStr,
//                              StringM binStr,
//                              BoolS hexvalue);

void WriteRamContentDec_32Bit(IntS addr_loc,
                                   IntM src_data1,
                                   BoolS data1_hexvalue,
                                   IntM src_data2,
                                   BoolS data2_hexvalue,
                                   BoolS bcd_format);

void GetRamContent_SCRAM(IntS start_addr,
                              IntS store_option);
void Get_Flash_TestLogSpace_SCRAM();
//void Get_TLogSpace_STAT1(    IntM msw_data,
//                              IntM lsw_data);
//void Get_TLogSpace_STAT2(    IntM msw_data,
//                              IntM lsw_data);
//void Get_TLogSpace_STAT3(    IntM msw_data,
//                              IntM lsw_data);
//void Get_TLogSpace_STAT4(    IntM msw_data,
//                              IntM lsw_data);
//void Get_TLogSpace_TESTFREQ(    IntM ret_val);
void Get_TLogSpace_PFBin(    IntM &ret_val);
//void Get_TLogSpace_FAILADDR(    IntM msw_data,
//                                 IntM lsw_data);
//void Get_TLogSpace_FAILDATA(    IntM msw_data,
//                                 IntM lsw_data);
void Get_TLogSpace_TNUM(    IntM &msw_data,
                             IntM &lsw_data);
//void Get_TLogSpace_MSTAT(      IntM msw_data, IntM lsw_data);
//void Get_TLogSpace_ErsPulse(    IntM ret_val);
//void Get_TLogSpace_TRIMSOL(    IntM ret_val);
//void Get_TLogSpace_MaxPPulse(    IntM ret_val);
//void Get_TLogSpace_TotPPulse(    IntM msw_data,
//                                  IntM lsw_data);
//void Get_TLogSpace_MeasFreq(    IntM msw_data,
//                                 IntM lsw_data);
//void Get_TLogSpace_RTIValue(    IntM ret_val);
//void Get_Flash_MBoxSpace_OTP_SCRAM();
//void Get_MBoxSpace_FlagNum(    IntM msw_data,
//                                    IntM lsw_data);
//void Get_MBoxSpace_RowX_WdX(      IntS rownum, IntS wdnum,
//                                     IntM ret_val);
//void Get_MBoxSpace_BCCVT(BoolS rdbcc,
//                              IntS banknum,
//                              IntS index);
//void Get_PreBake1_BCC0(IntS bank);
//void Get_PreBake1_BCC1(IntS bank);
//void Get_PreBake2_BCC0(IntS bank);
//void Get_PreBake2_BCC1(IntS bank);
//void Get_PreBake3_BCC0(IntS bank);
//void Get_PreBake3_BCC1(IntS bank);
//void Get_PreBake4_BCC0(IntS bank);
//void Get_PreBake4_BCC1(IntS bank);
//void Get_PreBake1_VT0(IntS bank);
//void Get_PreBake1_VT1(IntS bank);
//void Get_PreBake2_VT0(IntS bank);
//void Get_PreBake2_VT1(IntS bank);
//void Get_PreBake3_VT0(IntS bank);
//void Get_PreBake3_VT1(IntS bank);
//void Get_PreBake4_VT0(IntS bank);
//void Get_PreBake4_VT1(IntS bank);
//void GetRTIValue(    IntM ret_val);
//
//void Get_Flash_ESDASpace_SCRAM();
//
//void F021_Log_FailPat_To_TW(StringS tmpstr,
//                                 BoolM results,
//                                 StringS tname);
//
//void F021_Init_COF_Inst_Str(    StringM site_cof_inst_str);
//
//void F021_Update_COF_Inst_Str(    StringS failstr,
//                                       StringM site_cof_inst_str,
//                                       BoolM results);
//
//void F021_Save_COF_Info(StringS tnamestr,
//                             StringM failstr,
//                             BoolM results);
//
//void F021_Send_COF_Info_To_TW();
//
//void F021_Log_OTP_To_TW();
//
//void F021_Log_OTP_To_TW_Final();
//
//BoolS F021_MatchLoopByPMU_MS(    StringS tpatt,
//                                    PinML pass_pin,
//                                    PinML done_pin,
//                                    PinML ndone_pin,
//                                    FloatS max_timeout,
//                                    IntS pmstop,
//                                    FloatM ret_timer,
//                                    BoolM test_results);
//BoolS F021_MatchLoopByPMU_MS_loader(    StringS tpatt,
//                                    PinML pass_pin,
//                                    PinML done_pin,
//                                    PinML ndone_pin,
//                                    FloatS max_timeout,
//                                    IntS pmstop,
//                                    FloatM ret_timer,
//                                    BoolM test_results);

void F021_SetTestNum(IntS testnum);

//void Check_RAM_TNUM(    IntS expTnum,
//                             BoolM test_results);
//
//void MBox_Upload_RCODE_PSA(IntS banknum,
//                                FlashCodeType code_type);
//void MBox_Upload_RCODE_PSA_VRD_CT(IntS banknum,
//                                       FlashCodeType code_type,
//                                       IntS ovr_data);
//
BoolS F021_RunTestNumber(const IntS &testnum,
                            const FloatS &maxtimeout,
                            FloatM &ret_timer,
                            TMResultM &ret_result);

//void CmpTRealLULim(    FloatM test_val,
//                            FloatS test_LLimit,
//                            FloatS test_ULimit,
//                            BoolM test_results);
//
//BoolS F021_Meas_TPAD(    PinM TPAD,
//                            IntS testnum,
//                            BoolS Imeasure,
//                            FloatS test_LLimit,
//                            FloatS test_ULimit,
//                            FloatS force_volt,
//                            FloatS iload,
//                            FloatS delaytime,
//                            BoolS x64soft,
//                            FloatM Meas_Value,
//                            BoolM Test_results);
//
//
void F021_Set_TPADS(IntS TCRnum,
                         TPModeType TCRMode);
//void F021_Set_TPADS_ByOrder(IntS TCRnum,
//                                 TPModeType TCRMode,
//                                 BoolS rampup);
//
//void F021_UnSet_TPADS(IntS TCRnum);

void F021_TurnOff_AllTPADS();

//void F021_Ramp_TPAD(PinM TPAD,
//                         FloatS rampstart,
//                         FloatS rampstop,
//                         FloatS iProg,
//                         Option pgmMode);
//
TMResultM F021_Meas_TPAD_PMEX(    PinM TPAD,
                                 IntS TCRnum,
                                 TPModeType TCRMode,
                                 FloatS test_llim,
                                 FloatS test_ulim,
                                 FloatM &Meas_Value);

TMResultM F021_RunTestNumber_PMEX(    IntS testnum,
                                     FloatS maxtimeout,
                                     BoolS testPassPin = false);

//void MBox_Upload_IProg(IntS senampnum);
//
//void MBox_Upload_ISenAmp(IntS senampnum);
//
//
//void TL_Swizzle_VHVE(IntS value);
//void TL_UnSwizzle_VHVE(IntS value);
//
//void TL_FMW_EnableKey(BoolS enakey);
//void TL_GetFMWInfo();
//void TL_GetFMWInfo_TNUM(IntS tnum);
//void TL_SetARBFREQ(FloatS infreq,
//                        BoolS pllena);
//void TL_GetARBFREQ();
//void TL_SetARBWAIT(BoolS wstate_autocalc,
//                        IntS wstate,
//                        BoolS wstate_addr_ena,
//                        BoolS wstate_pipe_ena);
//void TL_GetARBWAIT();
//void TL_SetARBADDR(IntS msw_addr,
//                        IntS lsw_addr);
//void TL_SetARBLENGTH(IntS msw_length,
//                          IntS lsw_length);
//void TL_ArbitraryRead(IntS banknum,
//                           IntS msw_addr,
//                           IntS lsw_addr,
//                           IntS msw_length,
//                           IntS lsw_length);
//void TL_EngOvride_PSU(IntS ovr_data);
//void TL_EngOvride_ESU(IntS ovr_data);
//void TL_EngOvride_PVSU(IntS ovr_data);
//void TL_EngOvride_EVSU(IntS ovr_data);
//void TL_EngOvride_RPTVSU(IntS ovr_data);
//void TL_EngOvride_CVSU(IntS ovr_data);
//void TL_EngOvride_AEXEZSU(IntS ovr_data);
//void TL_EngOvride_PVACC(IntS ovr_data);
//void TL_EngOvride_PH(IntS ovr_data);
//void TL_EngOvride_EH(IntS ovr_data);
//void TL_EngOvride_RH(IntS ovr_data);
//void TL_EngOvride_PVH(IntS ovr_data);
//void TL_EngOvride_PVH2(IntS ovr_data);
//void TL_EngOvride_PPW(IntS ovr_data);
//void TL_EngOvride_EPW(IntS ovr_data);
//void TL_EngOvride_MAXPP(IntS ovr_data);
//void TL_EngOvride_PPW_MAXPP(  IntS ovr_pw, IntS ovr_pp);
//void TL_EngOvride_MAXEP(IntS ovr_data);
//void TL_EngOvride_VHV_PG_CT(IntS ovr_data);
//void TL_EngOvride_VHV_ER_CT(IntS ovr_data);
//void TL_EngOvride_VHV_PV_CT(IntS ovr_data);
//void TL_EngOvride_VCG2P5_CT(IntS ovr_data);
//void TL_EngOvride_VINH_CT(IntS ovr_data);
//void TL_EngOvride_VSL_CT(IntS ovr_data);
//void TL_EngOvride_VWL_CT(IntS ovr_data);
//void TL_EngOvride_VRD_CT(IntS ovr_data);
//void TL_EngOvride_VSA5_CT(IntS ovr_data);
//void TL_EngOvride_RDM0_NMOS(IntS ovr_data);
//void TL_EngOvride_VHV_ER_CT_MS(IntM ovr_data);
//void TL_EngOvride_VHV_MAXEP_ESTART_ESTEP_CT(  IntM ovr_maxep, IntM ovr_startct, IntM ovr_estep, IntM ovr_ersct);
//void TL_EngOvride_RPC_EF(IntS ovr_rpcval,
//                              IntS ovr_efindex,
//                              IntS ovr_efval);
//void TL_EngOvride_BANK_EF(IntS ovr_efindex,
//                               IntS ovr_efval);
//void TL_EngOvride_BANK_EF22(IntS ovr_data);
//void TL_EngOvride_BANK_EF17(IntS ovr_data);
//void TL_EngOvride_BANK_EF22_17(  IntS ef22_val, IntS ef17_val);
//void TL_EngOvride_RDM0_NMOS_EF(IntS ovr_nmosval,
//                                    IntS ovr_efindex,
//                                    IntS ovr_efval);
//void TL_EngOvride_RDM0_NMOS_EF_PVCT(IntS ovr_nmosval,
//                                         IntS ovr_efindex,
//                                         IntS ovr_efval,
//                                         IntS ovr_pvct);
//void TL_EngOvride_RDM0_NMOS_PVCT(IntS ovr_data,
//                                      IntS ovr_pvct);
//
//void TL_CpuToBankWordAddr(IntS msw_cpuaddr,
//                               IntS lsw_cpuaddr);
//void TL_Get_SenAmp_From_CpuAddrData(  IntS msw_cpuaddr, IntS lsw_cpuaddr,
//                                           IntS msw_fdata, IntS lsw_fdata,
//                                             IntS SenAmpNum);
//void TL_Get_SenAmp_From_CpuAddrData_MS(      IntM msw_cpuaddr, IntM lsw_cpuaddr,
//                                              IntM msw_fdata, IntM lsw_fdata,
//                                                  IntM msw_mainaddr, IntM lsw_mainaddr,
//                                                IntM SenAmpNum);
//void TL_Get_PhysSenAmp_From_ESDA_WorstBit(IntS test_site,
//                                                   IntS PhysSenAmp,
//                                                   IntS MBoxWdIndex,
//                                                   IntS MBoxBitIndex);
//
//void TL_EngOvride_TIME_CT(  IntS ovr_psu, IntS ovr_esu, IntS ovr_pvsu, IntS ovr_evsu, IntS 
//                               ovr_rptvsu, IntS ovr_cvsu, IntS ovr_aexezsu, IntS ovr_pvacc, IntS 
//                               ovr_ph, IntS ovr_eh, IntS ovr_rh, IntS ovr_pvh, IntS 
//                               ovr_pvh2, IntS ovr_ppw, IntS ovr_epw, IntS ovr_vstat, IntS 
//                               ovr_maxpp, IntS ovr_maxep, IntS ovr_vhv_estart_ct, IntS ovr_vhv_estep, IntS 
//                               ovr_vhv_estop_ct, IntS ovr_vhv_pg_ct, IntS ovr_vhv_er_ct, IntS ovr_vhv_pv_ct, IntS 
//                               ovr_vcg2p5_ct, IntS ovr_vinh_ct, IntS ovr_vsl_ct, IntS ovr_vwl_ct, IntS 
//                               ovr_vrd_ct, IntS ovr_vsa5_ct);
//
//void TL_IV_Curve(IntS Address,
//                      IntS SenAmpNum,
//                      FloatS Start_V,
//                      FloatS Stop_V,
//                      FloatS Inc_V,
//                      BoolS OvrideBL,
//                      FloatS BLBias_Vforce,
//                      BoolS Test_All_IOS);
//
//void CloneTCR_To_TCR128(TPModeType tcrmode_tget,
//                             TPModeType tcrmode_src,
//                             IntS tcrnum_src);
//
//void RestoreTCR_Fr_TCR128(TPModeType tcrmode_tget,
//                               TPModeType tcrmode_src,
//                               IntS tcrnum_src);
//
//void TL_PumpOutput_VHV(VCornerType vcorner);
//
//void TL_EngOvride_W89_RAM(IntS catnum,
//                               IntS pmos_ratio,
//                               IntS nmos_pvratio,
//                               IntS nmos_evratio,
//                               IntS nmos_rm0ratio,
//                               IntS nmos_rm1ratio,
//                               IntS nmos_rdratio);
//
void TL_RunTestNum(IntS start_testnum,
                        StringS logstr);

//void TL_DumpOTP();
//
//void TL_DumpRawESDA_ToFile(IntS imgnum,
//                                StringS logstr);
//void TL_SaveESDAImage(IntS imgnum,
//                           IntS banknum);
//
//void F021_GetESDA_NonSCRAM(IntS imgnum,
//                                IntS banknum);
//
//void SetFlashESDAVars(BoolM logsites,
//                           IntS bank,
//                           IntS sect);
//
//void ClearFlashESDAVars(IntS bank,
//                             IntS sect);
//
//void F021_Set_TPADS_ESDA(  IntS bank, IntS  sect);
//
//void F021_CollectESDA(IntS imagenum);
//
//void TL_BitHistogram(IntS pattype,
//                          IntS testnum,
//                          FloatS vcg_start,
//                          FloatS vcg_stop,
//                          FloatS vcg_inc,
//                          FloatS iref_start,
//                          FloatS iref_stop,
//                          FloatS iref_inc,
//                          BoolS logena,
//                          StringS logstr);
//
//void TL_Boost_RefArray();
//
//BoolS F021_RestoreOTPInfo_func(    StringS tname,
//                                      BoolM test_results,
//                                      BoolS dlogonly);
//void GoRestoreOTP_OnFail();
//
//void RAM_Clear_MailBox_Key();

BoolS F021_VHV_PG_CT_Trim_func(    TMResultM &test_results,
                                      IntM &ret_ctval);
BoolS F021_VHV_ER_CT_Trim_func(    TMResultM &test_results,
                                      IntM &ret_ctval);
BoolS F021_VHV_PV_CT_Trim_func(    TMResultM &test_results,
                                      IntM &ret_ctval);
void RAM_Upload_VHV_CT_TrimVal();

BoolS F021_Pump_Para_func(    IntS start_testnum,
                                 prepostcorner prepost_type,
                                 VCornerType vcorner_type,
                                 IntS TCRnum,
                                 TPModeType TCRMode,
                                 TMResultM &test_results);

//BoolS F021_Bank_Para_func(    IntS start_testnum,
//                                 prepostcorner prepost_type,
//                                 VCornerType vcorner_type,
//                                 IntS TCRnum,
//                                 TPModeType TCRMode,
//                                 BoolM test_results);
//
//BoolS F021_Bank_Para_MBox_func(    IntS start_testnum,
//                                      prepostcorner prepost_type,
//                                      VCornerType vcorner,
//                                      IntS TCRnum,
//                                      TPModeType TCRMode,
//                                      BoolM test_results);
//
//void PrintDUTSetup();
//
//BoolS F021_Flash_Leak_func(    IntS start_testnum,
//                                  StringS tname,
//                                  prepostcorner prepost_type,
//                                  VCornerType vcorner,
//                                  IntS TCRnum,
//                                  TPModeType TCRMode,
//                                  BoolM test_results);
//
//
//BoolS F021_Stress_func(    IntS start_testnum,
//                              StringS tname,
//                              IntS TCRnum,
//                              TPModeType TCRMode,
//                              BoolM test_results);
//
//BoolS F021_RefArr_Erase_func(    StringS tname,
//                                    BoolS adaptiveEna,
//                                    BoolM test_results);

TMResultM F021_InitFLGlobalvars_func();

//void Update_FLASH_RETEST_Var();
//void Update_FLWBYTE_Var();
//
//void MeasInternalVT(    IntS testnum,
//                             FloatS test_llim,
//                             FloatS test_ulim,
//                             BoolM ret_results,
//                             FloatM ret_values);
//
//void F021_Vt_BinSearch_TTR(    IntS testnum,
//                                    FloatM vstart,
//                                    FloatM vstop,
//                                    FloatS vresolution,
//                                    FloatM irefarr,
//                                    FloatS maxtime,
//                                    FloatM ret_timer,
//                                    FloatM ret_values);
//
//BoolS F021_VT_Delta_func(    IntS pattype,
//                                vttype vt_type,
//                                StringS tname,
//                                BoolM test_results,
//                                BoolS dlogonly);
//
//void F021_BCC_BinSearch_TTR(    IntS testnum,
//                                     FloatM Istart,
//                                     FloatM Istop,
//                                     FloatS Iresolution,
//                                     FloatM VforceArr,
//                                     FloatS maxtime,
//                                     FloatM ret_timer,
//                                     FloatM ret_values);
//
//BoolS TL_Run_BCCVT(StringS tname,
//                      vttype vt_type,
//                      prepostcorner prepost_type,
//                      BoolS IsMainArray,
//                      BoolS IsBcc,
//                      StringS logstr,
//                          BoolM test_results);
//
//BoolS F021_BCC_Delta_func(    IntS pattype,
//                                vttype vt_type,
//                                StringS tname,
//                                BoolM test_results,
//                                BoolS dlogonly);
//
//BoolS F021_Program_func(    IntS start_testnum,
//                               StringS tname,
//                               BoolM test_results);

BoolS F021_Erase_func( IntS start_testnum, StringS tname, TMResultM& test_results);

//BoolS F021_Read_func(    IntS start_testnum,
//                            StringS tname,
//                            BoolM test_results);
//
//BoolS CalcChksum_FlashEfuse_func(    StringM efbinstring,
//                                        IntM chksum1,
//                                        IntM chksum2);
//
//BoolS Compare_FlashEfuse_OTP_Chksum_func(    StringS tname,
//                                                BoolM test_results);
//
//BoolS F021_ReadVTOTP_func(    BoolM test_results,
//                                 BoolS binout_ena);
//BoolS F021_WriteVTOTP_func(    StringS tname,
//                                  IntS wr_option,
//                                  BoolM test_results);
//
//BoolS F021_ReadVT0BCC1OTP_func(    BoolM test_results,
//                                      BoolS binout_ena);
//BoolS F021_WriteVT0BCC1OTP_func(    StringS tname,
//                                       IntS wr_option,
//                                       BoolM test_results);
//
//BoolS F021_ReadBCCOTP_func(    BoolM test_results,
//                                 BoolS binout_ena);
//BoolS F021_WriteBCCOTP_func(    StringS tname,
//                                  IntS wr_option,
//                                  BoolM test_results);
//
//BoolS F021_ReadIDOTP_func(    BoolM test_results,
//                                 BoolS binout_ena);
//
//BoolS F021_ReadOTPInfo_func(    BoolM test_results);
//BoolS F021_ReadIDOTP_Pst_func(    BoolM test_results,
//                                 BoolS binout_ena);
//
//BoolS F021_ReadLog1OTP_func(    BoolM test_results,
//                                   IntS rd_option);
//
//BoolS F021_ReadLog3OTP_func(    BoolM test_results,
//                                   IntS rd_option);
//
//void MBox_Upload_DieID();
//void MBox_Upload_PgmRev();
//void MBox_Upload_PkgMem();
//void MBox_Upload_EFChkSum();
//void MBox_Upload_EFChkSum_Pump_Trim();
//void MBox_Upload_FlwByte(IntS flwbyte_option);
//void MBox_Upload_LPO_CAL();
//
//BoolS F021_Write_OTP_MBox_func(    StringS tname,
//                                      IntS wr_option,
//                                      BoolM test_results);
//
//BoolS F021_OTP_WrEngRow_func(    BoolM test_results);
//
//BoolS GetShellInfo_func();
//
//BoolS F021_FlowCheck_func(    BoolM test_results);
//
//void F021_InitFLEfuseStr();
//
//void RAM_Upload_SoftTrim_All(IntS BGapVal,
//                                  IntS IRefVal,
//                                  IntS FOSCVal,
//                                  IntS VHVSLPVal,
//                                  IntS VSA5CTVal);
//void RAM_Upload_SoftTrim(IntS trimenakey,
//                              IntM BGapVal,
//                              IntM IRefVal,
//                              IntM FOSCVal,
//                              IntM VHVSLPVal,
//                              IntM VSA5CTVal);
void RAM_Clear_SoftTrim_All();

//BoolS F021_MainBG_SoftTrim_Direct_func(    BoolS adapttrim_ena,
//                                       BoolS chartrim_ena,
//                                  BoolM test_results);
//
//BoolS F021_MainBG_SoftTrim_func(    BoolS adapttrim_ena,
//                                       BoolS chartrim_ena,
//                                  BoolM test_results);
//
//BoolS F021_MainIREF_SoftTrim_func(  BoolS adapttrim_ena,
//                                       BoolS chartrim_ena,
//                                  BoolM test_results);
//
//BoolS F021_FOSC_SoftTrim_func(    BoolM test_results);
//BoolS F021_VSA5CT_SoftTrim_func(    BoolM test_results,
//                                       IntM ret_ctval);
//BoolS F021_VHV_SLOPECT_SoftTrim_func(    BoolM test_results,
//                                            IntM ret_ctval);
//
//void ProgramFlashTrim(      StringS tname1, StringS  tname2,
//                                StringS tname3,
//                                StringM progChainStr,
//                                StringM initChainStr);
//
//void RAM_Upload_PMOS_SoftTrim_Bank(IntS bank,
//                                        BoolS bnkeven_ena,
//                                        BoolS bnkodd_ena,
//                                        IntM msw_val,
//                                        IntM lsw_val);
//void RAM_Clear_PMOS_SoftTrim_Bank(IntS bank);
//void RAM_Clear_PMOS_SoftTrim();
//void GetTrimCode_On_EFStr();
void RAM_Upload_PMOS_TrimCode();
//BoolS F021_IPMOS_SoftTrim_func();
//BoolS F021_IPMOS_NMOS_SoftTrim_func(IntS trimopt);
//void TL_Mod_OTP_PMOS_SoftTrim();
//
// /*added for fake repair*/
//void RAM_Upload_FakeRepair(IntS bankcount);
//BoolS Run_Update_FakeRepair(    StringS tname,
//                                   BoolM test_results,
//                                  BoolS dlogonly);
//
//BoolS SAMP_Noise_Screen_func(StringS tname,
//                                IntS tcrnum,
//                                IntS tdata,
//                                IntS ttarget,
//                                FloatS force_vcg,
//                                BoolS redundena,
//                                    BoolM test_results,
//                                BoolS dopgmbkgrnd,
//                                IntS ovrideRPC_Val,
//                                IntS ovrideEF_Index,
//                                IntS ovrideEF_Val,
//                                StringS twlogstr);
//
//BoolS F021_LPO_Trim_func(    StringS fl_tname,
//                                BoolS dlogonly,
//                                BoolM test_results);
//
// /*++++++++++++++++++++++++*/
//
//void MyPATTEST_COF(StringS logstr,
//                        StringS firstPatt,
//                        StringS lastPatt,
//                        FloatS tfreq,
//                        VCornerType vcorner);
//
//void TL_DEBUG_FUNC();
//void TL_Display_BCC_INFO();
//void TL_DEBUG_PGM_FAIL(VCornerType vcorner,
//                            IntS pattype);
//void TL_SENSEAMP_CHARZ(VCornerType vcorner,
//                            IntS banknum,
//                            IntS bkgrnd_data);
//void TL_PER_SENSEAMP_CHARZ(VCornerType vcorner,
//                                IntS banknum,
//                                IntS bkgrnd_data,
//                                  IntS start_senamp, IntS stop_senamp);
//
//BoolS FlashCode_WR_EXE_func(StringS tname,
//                               FlashCodeType code_type,
//                               BoolM test_results);
//BoolS FlashCode_RdPsa_func(StringS tname,
//                              FlashCodeType code_type,
//                              BoolM test_results);
//
//BoolS F021_Special_Program_func(IntS start_testnum,
//                                   StringS tname,
//                                   IntS PPULimit,
//                                   BoolM test_results,
//                                   BoolM soft_results);
//
//void TL_Display_W89();
//void TL_Display_W34();
//void TL_Display_Word8_9();
//
//void TL_Meas_VHV_ER_OvrCT(IntM ovr_ersct,
//                               BoolS logena,
//                               StringS logstr,
//                                   FloatM ret_val);
//void TL_StairStep_Erase(  IntS banknum, IntS sectnum,
//                               IntM estart, IntM ersct,
//                               IntS ctoffset, IntS maxep,
//                             BoolS logena,
//                             StringS logstr);
//void TL_Schmoo_Freq(VCornerType vcorner,
//                         IntS testnumber,
//                           FloatS freqstart, FloatS freqstop, FloatS freqinc,
//                         BoolS EnaPLL,
//                         BoolS UseAutoWaitState,
//                         IntS waitState,
//                         BoolS EnaPipeLine,
//                         BoolS twlogena,
//                         StringS logstr,
//                         StringS dumpToFileName);
//
//void TL_SAMP_ACCY_IV(BoolS dobcc,
//                          StringS logstr,
//                          BoolS twlogena);
//void TL_SWEEP_RDM0_NMOS_EF(IntS tdata,
//                             BoolS ovrideEF,
//                             IntS ovrideEF_Index,
//                             IntS ovrideEF_Val,
//                             BoolS doimeas,
//                             BoolS twlogena,
//                             StringS logstr);
//void TL_SWEEP_RDM0_NMOS(IntS tdata,
//                             BoolS twlogena,
//                             StringS logstr);
//void TL_PVFY_EF(IntS tdata,
//                     BoolS ovrideEF,
//                     IntS ovrideEF_Index,
//                     IntS ovrideEF_Val,
//                     BoolS twlogena,
//                     StringS logstr);
//
//BoolS MeasPinTMU_func(PinML tpin,
//                         StringS tStringS,
//                         IntS meas_option,
//                         FloatS time_llimit,
//                         FloatS time_ulimit,
//                             FloatM ret_values,
//                             BoolM test_results);
//
//#if $FL_USE_DCC_TRIM_FOSC=FALSE then
//BoolS F021_FOSC_SoftTrim_External_func(    BoolM test_results);
//#endif

#endif

