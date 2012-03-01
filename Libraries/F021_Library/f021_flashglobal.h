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
 /****************************************************************************/

#ifndef F021_FLASHGLOBAL_H
#define F021_FLASHGLOBAL_H

#include <Unison.h>

 /*changed define statement below to 'TRUE' if your hardware has it*/
#define $ADREFHI_PRESENT  false

 /*changed define statement below to 'TRUE' if flash TESTADC signal is available/bonded out*/
#define $TADC_PRESENT  false

 /*changed define statement below to 'TRUE' at wafer probe if TPAD3 to TPAD5 are avail*/
#define $TP3_TO_TP5_PRESENT   false


extern StringS NULL_TestName;
extern BoolS tistdscreenprint;
extern BoolS tiprintpass;
extern BoolS TI_FlashDebug;
extern BoolS TI_FlashCharEna; 
extern BoolS TI_FlashESDAEna; 
extern BoolS TI_FlashCOFEna; 
extern BoolM v_dev_active;
extern StringS f021_shell_exepat;
extern PinM F021_DONEPIN;
extern PinM F021_NDONEPIN;
extern PinM F021_PASSPIN;
extern PinM F021_VCTRLPIN;
extern PinM F021_VSTATPIN;
extern PinM nporrst;

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

enum FlashCodeType {TNI, Random, SingleCycle};

enum FlashLeakType {BANK_GANG,BANK_ODDEVEN,BLOCK_GANG,BLOCK_ODDEVEN,SECT_GANG,SECT_ODDEVEN};

enum TPMeasType {MeasNullType,MeasCurrType,MeasVoltType,ForceCurrType,ForceVoltType};
enum TPModeType {ReadMode,ProgMode,PvfyMode,ErsMode,EvfyMode,CvfyMode};

 /*vmin,nom,max,mineven,minodd,...*/
enum VcornerType {VMN,VNM,VMX,VMNE,VMNO,VNME,VNMO,VMXE,VMXO};


struct F021_RunCodeRec {
  BoolS1D DO_RUNCODE_ENA; /* :MANUAL FIX REQUIRED: array dimensions are : FlashCodeType */     /*use for flow control, true=enable*/
  StringS1D FIRST_PROGPAT; /* :MANUAL FIX REQUIRED: array dimensions are : FlashCodeType */     /*1st (segment) write pattern*/
  StringS1D LAST_PROGPAT; /* :MANUAL FIX REQUIRED: array dimensions are : FlashCodeType */     /*last (segment) write pattern*/
  FloatS1D PROG_FREQ; /* :MANUAL FIX REQUIRED: array dimensions are : FlashCodeType */       /*write frequency*/
  VcornerType PROG_VDDCORNER[3];
  /* array[FlashCodeType] of VcornerType PROG_VDDCORNER; */ /* Unknown Array type :MANUAL FIX REQUIRED: */ /* :MANUAL FIX REQUIRED: array dimensions are : FlashCodeType */  /*write vdd core voltage corner*/

   /*+++ info for arbitrary psa read and VT +++*/
  BoolS2D DO_RUNCODE_VT0_ENA; /* :MANUAL FIX REQUIRED: array dimensions are : FlashCodeType,0..7 */  /*use for bank selection, true=enable*/
  BoolS2D DO_RUNCODE_VT1_ENA; /* :MANUAL FIX REQUIRED: array dimensions are : FlashCodeType,0..7 */  /*use for bank selection, true=enable*/
  IntS2D BANK_START_ADDR_MSW; /* :MANUAL FIX REQUIRED: array dimensions are : FlashCodeType,0..7 */  /*16-bit word msb addr*/
  IntS2D BANK_START_ADDR_LSW; /* :MANUAL FIX REQUIRED: array dimensions are : FlashCodeType,0..7 */  /*16-bit word lsb addr*/
  IntS2D BANK_LEN_MSW; /* :MANUAL FIX REQUIRED: array dimensions are : FlashCodeType,0..7 */  /*16-bit word msb*/
  IntS2D BANK_LEN_LSW; /* :MANUAL FIX REQUIRED: array dimensions are : FlashCodeType,0..7 */  /*16-bit word lsb*/
  IntS2D BANK_PSA_MSW; /* :MANUAL FIX REQUIRED: array dimensions are : FlashCodeType,0..7 */  /*16-bit word msb expect psa*/
  IntS2D BANK_PSA_LSW; /* :MANUAL FIX REQUIRED: array dimensions are : FlashCodeType,0..7 */  /*16-bit word lsb expect psa*/
  
  F021_RunCodeRec() : DO_RUNCODE_ENA(3), FIRST_PROGPAT(3), LAST_PROGPAT(3),
                      PROG_FREQ(3), DO_RUNCODE_VT0_ENA(3,8), DO_RUNCODE_VT1_ENA(3,8),
                      BANK_START_ADDR_MSW(3,8), BANK_START_ADDR_LSW(3,8),
                      BANK_LEN_MSW(3,8), BANK_LEN_LSW(3,8), BANK_PSA_MSW(3,8),
                      BANK_PSA_LSW(3,8) {}
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
   /* array[0..128] of TPMeasType TP1_MeasType; */ /* Unknown Array type :MANUAL FIX REQUIRED: */ /* :MANUAL FIX REQUIRED: array dimensions are : 0..128 */
   FloatS2D TP1_VRange; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*force voltage or range*/
   FloatS2D TP1_IRange; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*current range/load*/
   FloatS2D TP1_ULim; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */
   FloatS2D TP1_LLim; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */
   FloatS2D TP1_FTime; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*time duration, e.g. stress time*/
   FloatS2D TP1_TDelay; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*meas delay time*/
   FloatS2D TP1_VCharLo; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*start force voltage for char*/
   FloatS2D TP1_VCharHi; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*stop force voltage for char*/
   FloatS2D TP1_VCharRes; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModetype */  /*step/resolution voltage for char*/

   BoolS1D TP2_Ena;
   TPMeasType TP2_MeasType[129];
   /* array[0..128] of TPMeasType TP2_MeasType; */ /* Unknown Array type :MANUAL FIX REQUIRED: */ /* :MANUAL FIX REQUIRED: array dimensions are : 0..128 */
   FloatS2D TP2_VRange; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*force voltage or range*/
   FloatS2D TP2_IRange; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*current range/load*/
   FloatS2D TP2_ULim; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */
   FloatS2D TP2_LLim; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */
   FloatS2D TP2_FTime; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*time duration, e.g. stress time*/
   FloatS2D TP2_TDelay; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*meas delay time*/
   FloatS2D TP2_VCharLo; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*start force voltage for char*/
   FloatS2D TP2_VCharHi; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*stop force voltage for char*/
   FloatS2D TP2_VCharRes; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*step/resolution voltage for char*/

   BoolS1D TP3_Ena;
   TPMeasType TP3_MeasType[129];
   /* array[0..128] of TPMeasType TP3_MeasType; */ /* Unknown Array type :MANUAL FIX REQUIRED: */ /* :MANUAL FIX REQUIRED: array dimensions are : 0..128 */
   FloatS2D TP3_VRange; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*force voltage or range*/
   FloatS2D TP3_IRange; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*current range/load*/
   FloatS2D TP3_ULim; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */
   FloatS2D TP3_LLim; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */
   FloatS2D TP3_FTime; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*time duration, e.g. stress time*/
   FloatS2D TP3_TDelay; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*meas delay time*/
   FloatS2D TP3_VCharLo; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*start force voltage for char*/
   FloatS2D TP3_VCharHi; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*stop force voltage for char*/
   FloatS2D TP3_VCharRes; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*step/resolution voltage for char*/

   BoolS1D TP4_Ena;
   TPMeasType TP4_MeasType[129];
   /* array[0..128] of TPMeasType TP4_MeasType; */ /* Unknown Array type :MANUAL FIX REQUIRED: */ /* :MANUAL FIX REQUIRED: array dimensions are : 0..128 */
   FloatS2D TP4_VRange; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*force voltage or range*/
   FloatS2D TP4_IRange; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*current range/load*/
   FloatS2D TP4_ULim; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */
   FloatS2D TP4_LLim; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */
   FloatS2D TP4_FTime; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*time duration, e.g. stress time*/
   FloatS2D TP4_TDelay; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*meas delay time*/
   FloatS2D TP4_VCharLo; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*start force voltage for char*/
   FloatS2D TP4_VCharHi; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*stop force voltage for char*/
   FloatS2D TP4_VCharRes; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*step/resolution voltage for char*/

   BoolS1D TP5_Ena;
   TPMeasType TP5_MeasType[129];
   /* array[0..128] of TPMeasType TP5_MeasType; */ /* Unknown Array type :MANUAL FIX REQUIRED: */ /* :MANUAL FIX REQUIRED: array dimensions are : 0..128 */
   FloatS2D TP5_VRange; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*force voltage or range*/
   FloatS2D TP5_IRange; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*current range/load*/
   FloatS2D TP5_ULim; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */
   FloatS2D TP5_LLim; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */
   FloatS2D TP5_FTime; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*time duration, e.g. stress time*/
   FloatS2D TP5_TDelay; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*meas delay time*/
   FloatS2D TP5_VCharLo; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*start force voltage for char*/
   FloatS2D TP5_VCharHi; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*stop force voltage for char*/
   FloatS2D TP5_VCharRes; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*step/resolution voltage for char*/

   BoolS1D TADC_Ena;
   TPMeasType TADC_MeasType[129];
   /* array[0..128] of TPMeasType TADC_MeasType; */ /* Unknown Array type :MANUAL FIX REQUIRED: */ /* :MANUAL FIX REQUIRED: array dimensions are : 0..128 */
   FloatS2D TADC_VRange; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*force voltage or range*/
   FloatS2D TADC_IRange; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*current range/load*/
   FloatS2D TADC_ULim; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */
   FloatS2D TADC_LLim; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */
   FloatS2D TADC_FTime; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*time duration, e.g. stress time*/
   FloatS2D TADC_TDelay; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*meas delay time*/
   FloatS2D TADC_VCharLo; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*start force voltage for char*/
   FloatS2D TADC_VCharHi; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*stop force voltage for char*/
   FloatS2D TADC_VCharRes; /* :MANUAL FIX REQUIRED: array dimensions are : 0..128,TPModeType */  /*step/resolution voltage for char*/

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
   BoolS2D ENA; /* :MANUAL FIX REQUIRED: array dimensions are : vttype,prepostcorner */
   BoolS2D ENARED; /* :MANUAL FIX REQUIRED: array dimensions are : vttype,prepostcorner */
   BoolS2D DLOGONLY; /* :MANUAL FIX REQUIRED: array dimensions are : vttype,prepostcorner */
   FloatS2D SSTART; /* :MANUAL FIX REQUIRED: array dimensions are : vttype,prepostcorner */
   FloatS2D SSTOP; /* :MANUAL FIX REQUIRED: array dimensions are : vttype,prepostcorner */
   FloatS2D SRESOL; /* :MANUAL FIX REQUIRED: array dimensions are : vttype,prepostcorner */
   FloatS2D LLIM; /* :MANUAL FIX REQUIRED: array dimensions are : vttype,prepostcorner */
   FloatS2D ULIM; /* :MANUAL FIX REQUIRED: array dimensions are : vttype,prepostcorner */
   FloatS2D LLIM_EMU; /* :MANUAL FIX REQUIRED: array dimensions are : vttype,prepostcorner */
   FloatS2D ULIM_EMU; /* :MANUAL FIX REQUIRED: array dimensions are : vttype,prepostcorner */
   IntS2D TCRNUM; /* :MANUAL FIX REQUIRED: array dimensions are : vttype,prepostcorner */
   IntS2D IRATIO; /* :MANUAL FIX REQUIRED: array dimensions are : vttype,prepostcorner */
   IntS2D RDOPTION; /* :MANUAL FIX REQUIRED: array dimensions are : vttype,prepostcorner */
   IntS1D MEMCFG; /* :MANUAL FIX REQUIRED: array dimensions are : vttype */
   IntS1D TDATA; /* :MANUAL FIX REQUIRED: array dimensions are : vttype */
   FloatS1D LDELTA; /* :MANUAL FIX REQUIRED: array dimensions are : vttype */
   FloatS1D UDELTA; /* :MANUAL FIX REQUIRED: array dimensions are : vttype */
   FloatS1D LDELTA_EMU; /* :MANUAL FIX REQUIRED: array dimensions are : vttype */
   FloatS1D UDELTA_EMU; /* :MANUAL FIX REQUIRED: array dimensions are : vttype */
   vttype PREVTYPE[6];
   /* array[vttype] of vttype PREVTYPE; */ /* Unknown Array type :MANUAL FIX REQUIRED: */ /* :MANUAL FIX REQUIRED: array dimensions are : vttype */
   
   FlashVTBCCRec() : ENA(6,2), ENARED(6,2), DLOGONLY(6,2), SSTART(6,2),
                     SSTOP(6,2), SRESOL(6,2), LLIM(6,2), ULIM(6,2), 
                     LLIM_EMU(6,2), ULIM_EMU(6,2), TCRNUM(6,2), IRATIO(6,2),
                     RDOPTION(6,2), MEMCFG(6), TDATA(6), LDELTA(6), UDELTA(6),
                     LDELTA_EMU(6), UDELTA_EMU(6) {}
};


struct FlashStressRec {
   IntS2D TPUPSEQ; /* :MANUAL FIX REQUIRED: array dimensions are : vttype,1..5 */
   StringS1D STRESSNAME; /* :MANUAL FIX REQUIRED: array dimensions are : vttype */
   
   FlashStressRec() : TPUPSEQ(6,5), STRESSNAME(6) {}
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

#endif
