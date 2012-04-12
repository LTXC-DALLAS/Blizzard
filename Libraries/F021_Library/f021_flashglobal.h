 /******************************************************************************/
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
 /*  A1.9 : Released for Yield Learning.                        KChau 06/08/10 */
 /*                                                                            */
 /*  A2.5 : Released with changes for qual.                     KChau 03/14/11 */
 /*                                                                            */
 /* 03/15/11  KChau                                                            */
 /*           -Modified $TP3_TO_TP5_PRESENT to True as running CSFG stress     */
 /*            with both TCR84 & TCR110.                                       */
 /* 04/08/11  KChau                                                            */
 /*           -Added L/UDELTA_EMU for DRL.                                     */
 /*           -Added at-compile config using new VHV template address.         */
 /*                                                                            */
 /*  B1.1 : Released to support C2000 and Stellaris platforms.  KChau 06/29/11 */
 /*                                                                            */
 /* 10/28/11  KChau                                                            */
 /*           -Added OtpSCPL type in FlashCodeType for Stellaris.              */
 /*                                                                            */
 /*  B2.5 : Released for Stellaris.                             KChau 10/28/11 */
 /*                                                                            */
 /******************************************************************************/

#ifndef F021_FLASHGLOBAL_H
#define F021_FLASHGLOBAL_H

#include <Unison.h>
#include <enums_noheader.evo>

 /*changed define statement below to 'TRUE' if your hardware has it*/
#define $ADREFHI_PRESENT  false

 /*changed define statement below to 'TRUE' if flash TESTADC signal is available/bonded out*/
#define $TADC_PRESENT  false

 /*changed define statement below to 'TRUE' at wafer probe if TPAD3 to TPAD5 are avail*/
#define $TP3_TO_TP5_PRESENT   false

extern IntS SelectedTITestTemp;
extern IntS SelectedTITestType;

extern BoolS RunAllTests;

extern StringS NULL_TestName;
extern BoolS tistdscreenprint;
extern BoolS tiprintpass;
extern BoolS TI_FlashDebug;
extern BoolS TI_FlashCharEna; 
extern BoolS TI_FlashESDAEna; 
extern BoolS TI_FlashCOFEna; 
//extern BoolM v_dev_active;

extern StringS f021_shell_loadpat;
extern StringS f021_shell_exepat;
//extern StringS f021_shell_exepat_name;
extern StringS f021_shell_exepat_vco_kc;
extern StringS ldo_bypass_init_thread;
extern StringS f021_shell_rcodepat;


extern PinM F021_DONEPIN;
extern PinM F021_NDONEPIN;
extern PinM F021_PASSPIN;
extern PinM F021_VCTRLPIN;
extern PinM F021_VSTATPIN;
extern PinM nporrst;
extern PinM FLTP1;
extern PinM FLTP2;
#if $TP3_TO_TP5_PRESENT
extern PinM FLTP3;
extern PinM FLTP4;
extern PinM FLTP5;
#endif
#if $TADC_PRESENT
extern PinM P_TADC;
#endif

extern BoolS IsFastBinning;

   /*up to 8 banks, 8 blks/bank, 16 sectors per blk?*/
struct F021_FlashRec {
     IntS MAXBANK;
     IntS1D MAXBLOCK;
     IntS1D MAXSECT;  
     IntS1D BANKSIZE;
     IntS2D BLOCKSIZE;   /* [bank,blk] */
     IntS2D SECTSIZE;  /* [bank,sect] */
     IntS ECC_PARITY;
     IntS DATAWIDTH;
     IntS1D MUXFACT;  /*bank's mux factor, 16 or 32*/
     BoolS1D EMUBANK;  /*emu bank=true, non-emu bank=false*/
     
     // Initializer needed to size the array objects
     F021_FlashRec () : MAXBLOCK(8), MAXSECT(8), BANKSIZE(8),
                        BLOCKSIZE(8,8), SECTSIZE(8,16),
                        MUXFACT(8), EMUBANK(8) {}
  };

 /*usage: CHKVT0/1 = preDRL vt value @mp1/mp2, CHKVT0/1DRL = postDRL vt value @mp1/mp2*/
 /*ex @mp1: vt value stores as (chkvt0,pre)*/
 /*   @mp2: predrl mp1->mp2 vt value read from otp stores as (chkvt0drl,pre) */
 /*         pstdrl mp1->mp2 vt value after srch stores as (chkvt0drl,post) */
 /*         predrl mp2->mp3 vt value after srch stores as (chkvt0,pre) */
enum vttype {CHKVT0,CHKVT1,CHKVT0Max,CHKVT0DRL,CHKVT1DRL,CHKVT0MaxDRL,
          REVTUNVT1,PGMFFVT1,PUNTHRUVT1,FGWLVT1,TUNOXTSMCVT1,TUNOXVT1,THINOXVT1,
          ONOVT0,CSFGVT0,EGFG1VT0,EGFG2VT0,EGFG3VT0,EGFG4VT0,EGFG5VT0,RDDISTBVT0,RDDISTB2VT0,
          RCODEVT0,RCODEVT1,ERSSTRVT0 };

enum prepostcorner {pre,post};
enum OtpOper {OtpRD,OtpWR,OtpRW};
enum FlashPumpType {FPAPUMP,HDPUMP,ESPUMP};
enum FlashBankType {FLEPBANK,FLESBANK};
enum MBoxRAMType {RAMType1,RAMType2};

enum FlashCodeType {TNI, Random, SingleCycle, OtpSCPL};

enum FlashLeakType {BANK_GANG,BANK_ODDEVEN,BLOCK_GANG,BLOCK_ODDEVEN,SECT_GANG,SECT_ODDEVEN};

enum TPMeasType {MeasNullType,MeasCurrType,MeasVoltType,ForceCurrType,ForceVoltType};
enum TPModeType {ReadMode,ProgMode,PvfyMode,ErsMode,EvfyMode,CvfyMode};

 /*vmin,nom,max,mineven,minodd,...*/
enum VCornerType {VMN,VNM,VMX,VMNE,VMNO,VNME,VNMO,VMXE,VMXO};

struct F021_RunCodeRec {
  /*+++ info for program & execute +++*/
  BoolS1D DO_RUNCODE_ENA; /*use for flow control, true=enable*/
  StringS1D FIRST_PROGPAT;  /*1st (segment) write pattern*/
  StringS1D LAST_PROGPAT;  /*last (segment) write pattern*/
  FloatS1D PROG_FREQ;   /*write frequency*/
  VCornerType PROG_VDDCORNER[4];  /*write vdd core voltage corner*/

   /*+++ info for arbitrary VT +++*/
  BoolS2D DO_RUNCODE_VT0_ENA; /*use for bank selection, true=enable*/
  BoolS2D DO_RUNCODE_VT1_ENA; /*use for bank selection, true=enable*/
  IntS2D BANK_START_ADDR_MSW; /*16-bit word msb addr*/
  IntS2D BANK_START_ADDR_LSW; /*16-bit word lsb addr*/
  IntS2D BANK_LEN_MSW; /*16-bit word msb*/
  IntS2D BANK_LEN_LSW; /*16-bit word lsb*/
  IntS2D BANK_PSA_MSW; /*16-bit word msb expect psa*/
  IntS2D BANK_PSA_LSW; /*16-bit word lsb expect psa*/
  
  /*+++ info for arbitrary psa read in conjunction with bank_tart/len above +++*/
  BoolS1D DO_RDPSA_ENA;    /*use for flow control, true=enable*/
  IntS2D TDATA; /*data type field, e.g. 0xA=arb data, 0xB=arb data/ecc, 0xc=arb ecc, 0xe=custom algo*/
  IntS2D MEMCFG; /*target type field, e.g. 0x0=bank, 0x1=sector, 0x4=otp, 0x5=semi-otp, 0x6=data otp, 0x7=customer otp, 0xA=arbitrary} {also used as enable/disable for rdpsa in otpscpl type per bank*/

  F021_RunCodeRec() : DO_RUNCODE_ENA(4), FIRST_PROGPAT(4), LAST_PROGPAT(4),
                      PROG_FREQ(4), DO_RUNCODE_VT0_ENA(4,8), DO_RUNCODE_VT1_ENA(4,8),
                      BANK_START_ADDR_MSW(4,8), BANK_START_ADDR_LSW(4,8),
                      BANK_LEN_MSW(4,8), BANK_LEN_LSW(4,8), BANK_PSA_MSW(4,8),
                      BANK_PSA_LSW(4,8), DO_RDPSA_ENA(4), TDATA(4,8), MEMCFG(4,8) {}
  };


struct F021_MBIRec {
  BoolS DO_MBI_ENA;
  BoolS TNI_EXE_ENA;
  StringS TNI_EXE_PAT;
  FloatS TNI_EXE_FREQ;
  StringS TNI_EXE_RAM_ERRLOG_PAT;
  BoolS PBIST_EXE_ENA;
  StringS PBIST_FIRST_PAT;
  StringS PBIST_LAST_PAT;
  FloatS PBIST_EXE_FREQ;
  BoolS BIST_EXE_ENA;
  StringS BIST_FIRST_PAT;
  StringS BIST_LAST_PAT;
  FloatS BIST_EXE_FREQ;
  BoolS CPATH_EXE_ENA;
  StringS CPATH_FIRST_PAT;
  StringS CPATH_LAST_PAT;
  FloatS CPATH_EXE_FREQ;
  };


 /*++++++++++++++++++++++++++++++++++++++*/

extern StringS1D TestOptFieldArr; /* = array[1..20] of tistring80; */ /* :MANUAL FIX REQUIRED: */



struct Flash_TCR_Rec {
   BoolS1D TP1_Ena;
   TPMeasType TP1_MeasType[129];
   FloatS2D TP1_VRange;  /*force voltage or range*/
   FloatS2D TP1_IRange;  /*current range/load*/
   FloatS2D TP1_ULim; 
   FloatS2D TP1_LLim; 
   FloatS2D TP1_FTime;   /*time duration, e.g. stress time*/
   FloatS2D TP1_TDelay;   /*meas delay time*/
   FloatS2D TP1_VCharLo;   /*start force voltage for char*/
   FloatS2D TP1_VCharHi;   /*stop force voltage for char*/
   FloatS2D TP1_VCharRes;   /*step/resolution voltage for char*/

   BoolS1D TP2_Ena;
   TPMeasType TP2_MeasType[129];
   FloatS2D TP2_VRange;   /*force voltage or range*/
   FloatS2D TP2_IRange;   /*current range/load*/
   FloatS2D TP2_ULim; 
   FloatS2D TP2_LLim; 
   FloatS2D TP2_FTime;   /*time duration, e.g. stress time*/
   FloatS2D TP2_TDelay;   /*meas delay time*/
   FloatS2D TP2_VCharLo;   /*start force voltage for char*/
   FloatS2D TP2_VCharHi;   /*stop force voltage for char*/
   FloatS2D TP2_VCharRes;   /*step/resolution voltage for char*/

   BoolS1D TP3_Ena;
   TPMeasType TP3_MeasType[129];
   FloatS2D TP3_VRange;   /*force voltage or range*/
   FloatS2D TP3_IRange;   /*current range/load*/
   FloatS2D TP3_ULim; 
   FloatS2D TP3_LLim; 
   FloatS2D TP3_FTime;  /*time duration, e.g. stress time*/
   FloatS2D TP3_TDelay;   /*meas delay time*/
   FloatS2D TP3_VCharLo;   /*start force voltage for char*/
   FloatS2D TP3_VCharHi;   /*stop force voltage for char*/
   FloatS2D TP3_VCharRes;   /*step/resolution voltage for char*/

   BoolS1D TP4_Ena;
   TPMeasType TP4_MeasType[129];
   FloatS2D TP4_VRange;   /*force voltage or range*/
   FloatS2D TP4_IRange;   /*current range/load*/
   FloatS2D TP4_ULim; 
   FloatS2D TP4_LLim; 
   FloatS2D TP4_FTime;   /*time duration, e.g. stress time*/
   FloatS2D TP4_TDelay;   /*meas delay time*/
   FloatS2D TP4_VCharLo;   /*start force voltage for char*/
   FloatS2D TP4_VCharHi;   /*stop force voltage for char*/
   FloatS2D TP4_VCharRes;   /*step/resolution voltage for char*/

   BoolS1D TP5_Ena;
   TPMeasType TP5_MeasType[129];
   FloatS2D TP5_VRange;   /*force voltage or range*/
   FloatS2D TP5_IRange;   /*current range/load*/
   FloatS2D TP5_ULim; 
   FloatS2D TP5_LLim; 
   FloatS2D TP5_FTime;   /*time duration, e.g. stress time*/
   FloatS2D TP5_TDelay;   /*meas delay time*/
   FloatS2D TP5_VCharLo;   /*start force voltage for char*/
   FloatS2D TP5_VCharHi;   /*stop force voltage for char*/
   FloatS2D TP5_VCharRes;   /*step/resolution voltage for char*/

   BoolS1D TADC_Ena;
   TPMeasType TADC_MeasType[129];
   FloatS2D TADC_VRange;   /*force voltage or range*/
   FloatS2D TADC_IRange;   /*current range/load*/
   FloatS2D TADC_ULim; 
   FloatS2D TADC_LLim; 
   FloatS2D TADC_FTime;   /*time duration, e.g. stress time*/
   FloatS2D TADC_TDelay;   /*meas delay time*/
   FloatS2D TADC_VCharLo;   /*start force voltage for char*/
   FloatS2D TADC_VCharHi;   /*stop force voltage for char*/
   FloatS2D TADC_VCharRes;   /*step/resolution voltage for char*/

   Flash_TCR_Rec() : 
                      TP1_Ena(129), TP1_VRange(129,6), TP1_IRange(129,6), TP1_ULim(129,6),
                      TP1_LLim(129,6), TP1_FTime(129,6), TP1_TDelay(129,6), TP1_VCharLo(129,6),
                      TP1_VCharHi(129,6), TP1_VCharRes(129,6),
                      TP2_Ena(129), TP2_VRange(129,6), TP2_IRange(129,6), TP2_ULim(129,6),
                      TP2_LLim(129,6), TP2_FTime(129,6), TP2_TDelay(129,6), TP2_VCharLo(129,6),
                      TP2_VCharHi(129,6), TP2_VCharRes(129,6),
                      TP3_Ena(129), TP3_VRange(129,6), TP3_IRange(129,6), TP3_ULim(129,6),
                      TP3_LLim(129,6), TP3_FTime(129,6), TP3_TDelay(129,6), TP3_VCharLo(129,6),
                      TP3_VCharHi(129,6), TP3_VCharRes(129,6),
                      TP4_Ena(129), TP4_VRange(129,6), TP4_IRange(129,6), TP4_ULim(129,6),
                      TP4_LLim(129,6), TP4_FTime(129,6), TP4_TDelay(129,6), TP4_VCharLo(129,6),
                      TP4_VCharHi(129,6), TP4_VCharRes(129,6),
                      TP5_Ena(129), TP5_VRange(129,6), TP5_IRange(129,6), TP5_ULim(129,6),
                      TP5_LLim(129,6), TP5_FTime(129,6), TP5_TDelay(129,6), TP5_VCharLo(129,6),
                      TP5_VCharHi(129,6), TP5_VCharRes(129,6),
                      TADC_Ena(129), TADC_VRange(129,6), TADC_IRange(129,6), TADC_ULim(129,6),
                      TADC_LLim(129,6), TADC_FTime(129,6), TADC_TDelay(129,6), TADC_VCharLo(129,6),
                      TADC_VCharHi(129,6), TADC_VCharRes(129,6) {}
};

struct Flash_ESDA_Rec {
   IntS ImageNum;
   IntS Tnum;
   IntS Pattype;
   vttype VT_type;
   IntS TCRNum;
   TPModeType TCRMode;
   prepostcorner PPCorner;
   BoolS UseBcc;
};


struct FlashVTBCCRec {
   BoolS2D ENA; 
   BoolS2D ENARED; 
   BoolS2D DLOGONLY; 
   FloatS2D SSTART; 
   FloatS2D SSTOP; 
   FloatS2D SRESOL; 
   FloatS2D LLIM; 
   FloatS2D ULIM; 
   FloatS2D LLIM_EMU; 
   FloatS2D ULIM_EMU; 
   IntS2D TCRNUM; 
   IntS2D IRATIO; 
   IntS2D RDOPTION; 
   IntS1D MEMCFG; 
   IntS1D TDATA; 
   FloatS1D LDELTA; 
   FloatS1D UDELTA; 
   FloatS1D LDELTA_EMU; 
   FloatS1D UDELTA_EMU; 
   vttype PREVTYPE[25];
   
   FlashVTBCCRec() : ENA(25,2), ENARED(25,2), DLOGONLY(25,2), SSTART(25,2),
                     SSTOP(25,2), SRESOL(25,2), LLIM(25,2), ULIM(25,2), 
                     LLIM_EMU(25,2), ULIM_EMU(25,2), TCRNUM(25,2), IRATIO(25,2),
                     RDOPTION(25,2), MEMCFG(25), TDATA(25), LDELTA(25), UDELTA(25),
                     LDELTA_EMU(25), UDELTA_EMU(25) {}
};


struct FlashStressRec {
   IntS2D TPUPSEQ; 
   StringS1D STRESSNAME; 
   
   // :HACK: only need 5 values, but since converting over code, 
   // make TPUPSEQ size 6 so loops in code are ok
   FlashStressRec() : TPUPSEQ(25,6), STRESSNAME(25) {}
};

enum SCRAM_STORE_OPTION {TEMPLOG_ARR, TESTLOG_ARR, MBOXOTP_ARR, MBOXLOG_ARR};

 /*True for TV2.0 only to swizzle VHV Erase CT trim. False for after TV2.0*/
#define $TV2_VHV_CT_SWIZZLE    false

 /*True = using new vhv template address starting shell support revision 30*/
#define $FL_USE_NEW_VHV_TEMPL_ADDR true

 /*+++++++ NOTE +++++++*/
 /*must only define true to one of variables below as either using jtag only ($GL_USE_JTAG_RAMPMT) or dmled only ($GL_USE_DMLED_RAMPMT)*/
 /*for aec auto devices, set both vars to false*/

 /*True=using single jtag tdi/tdo pin for data in/out. for device like sonata/breve*/
#define $GL_USE_JTAG_RAMPMT false

 /*True=using dmled addr/data pins. for device like blizzard/garnett*/
#define $GL_USE_DMLED_RAMPMT true
 /*+++++++ NOTE +++++++*/

/*True=use internal DCC module to trim FOSC, False=use external digital pin to trim FOSC via DMA TMU*/
/*for device like Stellaris blizzard that doesn't have DCC module, set to false*/
#define $FL_USE_DCC_TRIM_FOSC false

/*True=use auto flash flow.  For Stellaris and C2000 devices need to set false to use catalog flow.*/
#define $FL_USE_AUTO_FLOW false

#endif
