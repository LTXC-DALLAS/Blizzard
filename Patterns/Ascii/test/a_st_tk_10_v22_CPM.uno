Unison:U0.2:S4.3;

Pattern a_st_tk_10_v22_CPM {

Mode Digital;
Type Generic;



Default SignalHeader DefaultSignalHeader;

Default WaveformTable WFT1;

" Processed by Jazz::Tvt::tvtFusion version 1.199.0, updated Nov 22, 2011 "
" TDL:  TDLS/a_st_tk_10_v22.tdl.gz "
" Generated:  Wed Dec 28 17:58:09 US/Central 2011 "
" Jazz dir: /data/jazztest4/vikas/Phoenix_Unison/Blizzard_FX1 "

" ASIC_VERSION = 4.0 "
" "
" ASIC_TITLE = 'LIBRARY_TYPE = GS60, "
"                   CUSTOMER = TEXASINSTRUMENTS, "
"             TI_PART_NUMBER = F771727B, "
"           PATTERN_SET_NAME = a_st_tk_10_v22, "
"           PATTERN_SET_TYPE = SCAN_AC, "
"    PATTERN_SET_DESCRIPTION = , "
"                   REVISION = 2.2, "
"                       DATE = 8/8/2011'; "

/*                                                        */
/*   TDL91 6.0 FORMAT TEST PATTERNS PRODUCED BY Tessent TestKompress v8.2009_4.10   */
/*   FILENAME : TK_PATT/PROD/A_ST_TK_10.TDL.GZ   */
/*   TIMEFILE : DEFAULT                                   */
/*   IDSTAMP  : v8.2009_4.10:26a3:c64f:8381:8495   */
/*   FAULT    :        STUCK                              */
/*   COVERAGE : 94.90(TC) 92.67(FC)                       */
/*                                                        */
/**/
/*   PATTERN 0 Vector 0 TesterCycle 0   */
/*
"AAAAPPrPPPAAAAPPPPPPPPPCCCCooPPPPPPPPPPRPPPPPFFFPPPPPPPPPTTTTPPPPPwhXXPPPPPPLLLLLLROOUUPPPiLLLLLLPPPPTTTTPPPPPRPPCCPPAAAAAAAAAAA"
"IIIIQQbBBQIIIINHHHHHHHH0011__AAAAAAGGPPAQQQQQLLLGGGGGGFFFRRRRFNNNNaiOOPPPPMMPPPPPPSSSSSBBBaPPPPPPKKKKDDMCNJJJJAPO22JJIIIIIIIIIII"
"NNNN01i672NNNN276543210____cc2345677625W34567AAA543210765DDDD37654kbSS341076CCCCCCTCCBB012_CCCCCC7654OISK30123W6R__67NNNNNNNNNNN"
"1111__a___1111_________nppnpp__________P_____SSS_________3210_____e_CC______000000_0100___f000000_____________P__pn__22221100000"
"543256s1116789222333344____uu4455555555O66666HHH777788888____99999_n01111111CSACSPn__DD111tRFAAAA1111111111111O1O__1132101098765"
"____  _056____7890567014444__8901456789R12345345678901456888914567n___000011LE2LCD_11MP233eERDDDD4444455555566R6R1177___________"
"1234  9   2222         2345df          _     ___         7890     _911678901KR0KI_122__901sSA01231234901238901_3I776711111111111"
"          3456             oa          n     777                  9900      _I_R_n24511   tEM____             N D45  77888888999"
"                           ni          _     012                  8 02      1R1Un_2  22   aTE1111             _ E    89012389012"
"                           el          6                                    1Q1N_1   78   d__3334             T _               "
"                           __          0                                    6_8_12        cnn7890             E 1               "
"                           44                                                1 n21        ___                 S 6               "
"                           67                                                1 _0         111                 T 4               "
"                                                                             7 1          333                 _                 "
"                                                                               1          256                 1                 "
"                                                                               9                              6                 "
"                                                                                                              2                 "
*/
$a_st_tk_10_v22_CPM_st
*--------------------------------------------------------------------------------------------------------------------------------*;<SWCCPM>
*--------------------------------------------------------------------------------------------------------------------------------*;<LDA a_st_tk_10_v22_DPM_st,COND NZC2>
*--------------------------------------------------------------------------------------------------------------------------------*;<RPT 128>

" end initialization; start regular patterns "

*dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd*;<SWCDPM,SDP,RPT 7683>"1-7683"

*dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd*;<SWCDPM,SDP,LC2 400>"7684"
$a_st_tk_10_v22_CPM_LOOP1
*dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd*;<SWCDPM,SDP,DC2> "this is for the xtra vector added in the DPM for the SET"
*-----------------------oooo--iiiiii-----------------------oooo-------------------------ii---------------------------------C-----*;<SWCCPM,SDP,RPT 261>
*dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd*;<SWCDPM,SDP,RPT 2>
*dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd*;<SWCDPM,SDP,CJMP a_st_tk_10_v22_CPM_LOOP1>
"end a_st_tk_10_v22_CPM_LOOP1"
*dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd*;<SWCDPM,SDP> "this is for the xtra vector added in the DPM for the SET"
*-----------------------oooo--iiiiii-----------------------oooo-------------------------ii---------------------------------C-----*;<SWCCPM,SDP,RPT 261>"113285-113545"

" end regular patterns; start wrapup "

*MMMMMMMMMMMMMMMMMMMMMMMMMMM-M------MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-MMMMMMMMMMMMM--MMM--M-MMMMMMMMMMM---MMMMMMMMMMMMMMMMM-MMMMM*;<SWCCPM>
$a_st_tk_10_v22_CPM_end
*MMMMMMMMMMMMMMMMMMMMMMMMMMM-M------MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-MMMMMMMMMMMMM--MMM--M-MMMMMMMMMMM---MMMMMMMMMMMMMMMMM-MMMMM*;<RET>
*MMMMMMMMMMMMMMMMMMMMMMMMMMM-M------MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-MMMMMMMMMMMMM--MMM--M-MMMMMMMMMMM---MMMMMMMMMMMMMMMMM-MMMMM*;<RPT 512>
}
