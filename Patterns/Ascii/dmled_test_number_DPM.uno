Unison:U0.2:S4.3;

Pattern dmled_test_number_DPM {

Mode Digital;
Type Generic;

Default SignalHeader DefaultSignalHeader;

Default WaveformTable WFT11;

" Processed by Jazz::Tvt::tvtFusion version 1.199.0, updated Nov 22, 2011 "
" TDL:  TDLS/dmled_test_number_v22.tdl.gz "
" Generated:  Wed Dec 28 17:58:16 US/Central 2011 "
" Jazz dir: /data/jazztest4/vikas/Phoenix_Unison/Blizzard_FX1 "
" ASIC_VERSION = 7.0 "
" "
" ASIC_TITLE = 'LIBRARY_TYPE = GS60, "
"                   CUSTOMER = TexasInstruments, "
"             TI_PART_NUMBER = F771727B, "
"           PATTERN_SET_NAME = dmled_test_number, "
"           PATTERN_SET_TYPE = FUNC,NOSTROBE, "
"    PATTERN_SET_DESCRIPTION = , "
"                   REVISION = 2.2, "
"                       DATE = 11/03/10'; "

/* Assert reset */
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
$dmled_test_number_DPM_st
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*;"1 (TDL line 218)"
"(*$ Entering DMLED TEST mode testmode_reg = 0x1003 *)
 (*$0100:11000000000000000001000000000011 *)"
"(*$ Select DR Scan *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"2-3 (TDL lines 221-222) (*$ Select IR Scan *)"
"(*$ Capture IR *)"
"(*$ Shift IR *)
 (*$ BIT: 0*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 4>"4-7 (TDL lines 223-226) (*$ BIT: 1*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;"8 (TDL line 227) (*$ BIT: 2*)"
"(*$ BIT: 3 Shift and Exit IR*)"
"(*$ Update IR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 3>"9-11 (TDL lines 228-230) (*$ Select DR Scan *)"
"(*$ Capture DR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"12-13 (TDL lines 231-232) (*$ Shift DR *)"
"(*$ BIT: 0*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"14-15 (TDL lines 233-234) (*$ BIT: 1*)"
"(*$ BIT: 2*)"
"(*$ BIT: 3*)
 (*$ BIT: 4*)
 (*$ BIT: 5*)
 (*$ BIT: 6*)
 (*$ BIT: 7*)
 (*$ BIT: 8*)
 (*$ BIT: 9*)
 (*$ BIT: 10*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 10>"16-25 (TDL lines 235-244) (*$ BIT: 11*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;"26 (TDL line 245) (*$ BIT: 12*)"
"(*$ BIT: 13*)"
"(*$ BIT: 14*)
 (*$ BIT: 15*)
 (*$ BIT: 16*)
 (*$ BIT: 17*)
 (*$ BIT: 18*)
 (*$ BIT: 19*)
 (*$ BIT: 20*)
 (*$ BIT: 21*)
 (*$ BIT: 22*)
 (*$ BIT: 23*)
 (*$ BIT: 24*)
 (*$ BIT: 25*)
 (*$ BIT: 26*)
 (*$ BIT: 27*)
 (*$ BIT: 28*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 17>"27-43 (TDL lines 246-262) (*$ BIT: 29*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;"44 (TDL line 263) (*$ BIT: 30*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHHCMMMMMMMMMMMMMMMMMLMMMMM*;"45 (TDL line 264) (*$Shift and Exit DR  BIT: 31 *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;"46 (TDL line 265) (*$ Update DR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"47 (TDL line 266) (*$ Run Test Idle *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*;"48 (TDL line 267) (*$ Run Test Idle *)"

"(*$0101:00010000 *)"
"(*$ Select DR Scan *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"49-50 (TDL lines 270-271) (*$ Select IR Scan *)"
"(*$ Capture IR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"51-52 (TDL lines 272-273) (*$ Shift IR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;"53 (TDL line 274) (*$ BIT: 0*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"54 (TDL line 275) (*$ BIT: 1*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;"55 (TDL line 276) (*$ BIT: 2*)"
"(*$ BIT: 3 Shift and Exit IR*)"
"(*$ Update IR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 3>"56-58 (TDL lines 277-279) (*$ Select DR Scan *)"
"(*$ Capture DR *)"
"(*$ Shift DR *)
 (*$ BIT: 0*)
 (*$ BIT: 1*)
 (*$ BIT: 2*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 6>"59-64 (TDL lines 280-285) (*$ BIT: 3*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;"65 (TDL line 286) (*$ BIT: 4*)"
"(*$ BIT: 5*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"66-67 (TDL lines 287-288) (*$ BIT: 6*)"
"(*$Shift and Exit DR  BIT: 7 *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"68-69 (TDL lines 289-290) (*$ Update DR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"70 (TDL line 291) (*$ Run Test Idle *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*;"71 (TDL line 292) (*$ Run Test Idle *)"

"(*$ programming test number at 0x8C offset - word 17 of ODD bank *)
 (*$ Reset DMLED register *)
 (*$0101:00010000 *)"
"(*$ Select DR Scan *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"72-73 (TDL lines 297-298) (*$ Select IR Scan *)"
"(*$ Capture IR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"74-75 (TDL lines 299-300) (*$ Shift IR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;"76 (TDL line 301) (*$ BIT: 0*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"77 (TDL line 302) (*$ BIT: 1*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;"78 (TDL line 303) (*$ BIT: 2*)"
"(*$ Shift and Exit1 IR; BIT: 3*)"
"(*$ Update IR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 3>"79-81 (TDL lines 304-306) (*$ Select DR Scan *)"
"(*$ Capture DR *)"
"(*$ Shift DR *)
 (*$ BIT: 0*)
 (*$ BIT: 1*)
 (*$ BIT: 2*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 6>"82-87 (TDL lines 307-312) (*$ BIT: 3*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;"88 (TDL line 313) (*$ BIT: 4*)"
"(*$ BIT: 5*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"89-90 (TDL lines 314-315) (*$ BIT: 6*)"
"(*$ Shift and Exit1 DR; BIT: 7 *)"
"(*$0110:0000000000000000 *)
 (*$ Update DR *)
 (*$ Select DR Scan *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 4>"91-94 (TDL lines 316-320) (*$ Select IR Scan *)"
"(*$ Capture IR *)"
"(*$ Shift IR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 3>"95-97 (TDL lines 321-323) (*$ BIT: 0*)"
"(*$ BIT: 1*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"98-99 (TDL lines 324-325) (*$ BIT: 2*)"
"(*$ Shift and Exit1 IR; BIT: 3*)"
"(*$ Update IR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 3>"100-102 (TDL lines 326-328) (*$ Select DR Scan *)"
"(*$ Capture DR *)"
"(*$ Shift DR *)
 (*$ BIT: 0*)
 (*$ BIT: 1*)
 (*$ BIT: 2*)
 (*$ BIT: 3*)
 (*$ BIT: 4*)
 (*$ BIT: 5*)
 (*$ BIT: 6*)
 (*$ BIT: 7*)
 (*$ BIT: 8*)
 (*$ BIT: 9*)
 (*$ BIT: 10*)
 (*$ BIT: 11*)
 (*$ BIT: 12*)
 (*$ BIT: 13*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 17>"103-119 (TDL lines 329-345) (*$ BIT: 14*)"
"(*$ Shift and Exit1 DR; BIT: 15 *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"120-121 (TDL lines 346-347) (*$ Update DR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"122 (TDL line 348) (*$ Run Test Idle *)"

"(*$0110:0000000000000001 *)"
"(*$ Select DR Scan *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"123-124 (TDL lines 351-352) (*$ Select IR Scan *)"
"(*$ Capture IR *)"
"(*$ Shift IR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 3>"125-127 (TDL lines 353-355) (*$ BIT: 0*)"
"(*$ BIT: 1*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"128-129 (TDL lines 356-357) (*$ BIT: 2*)"
"(*$ Shift and Exit1 IR; BIT: 3*)"
"(*$ Update IR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 3>"130-132 (TDL lines 358-360) (*$ Select DR Scan *)"
"(*$ Capture DR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"133-134 (TDL lines 361-362) (*$ Shift DR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;"135 (TDL line 363) (*$ BIT: 0*)"
"(*$ BIT: 1*)"
"(*$ BIT: 2*)
 (*$ BIT: 3*)
 (*$ BIT: 4*)
 (*$ BIT: 5*)
 (*$ BIT: 6*)
 (*$ BIT: 7*)
 (*$ BIT: 8*)
 (*$ BIT: 9*)
 (*$ BIT: 10*)
 (*$ BIT: 11*)
 (*$ BIT: 12*)
 (*$ BIT: 13*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 14>"136-149 (TDL lines 364-377) (*$ BIT: 14*)"
"(*$ Shift and Exit1 DR; BIT: 15 *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"150-151 (TDL lines 378-379) (*$ Update DR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"152 (TDL line 380) (*$ Run Test Idle *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*;"153 (TDL line 381) (*$ Run Test Idle *)"

"(*$0110:0000000000001111 *)"
"(*$ Select DR Scan *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"154-155 (TDL lines 384-385) (*$ Select IR Scan *)"
"(*$ Capture IR *)"
"(*$ Shift IR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 3>"156-158 (TDL lines 386-388) (*$ BIT: 0*)"
"(*$ BIT: 1*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"159-160 (TDL lines 389-390) (*$ BIT: 2*)"
"(*$ Shift and Exit1 IR; BIT: 3*)"
"(*$ Update IR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 3>"161-163 (TDL lines 391-393) (*$ Select DR Scan *)"
"(*$ Capture DR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"164-165 (TDL lines 394-395) (*$ Shift DR *)"
"(*$ BIT: 0*)"
"(*$ BIT: 1*)
 (*$ BIT: 2*)
 (*$ BIT: 3*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 5>"166-170 (TDL lines 396-400) (*$ BIT: 4*)"
"(*$ BIT: 5*)"
"(*$ BIT: 6*)
 (*$ BIT: 7*)
 (*$ BIT: 8*)
 (*$ BIT: 9*)
 (*$ BIT: 10*)
 (*$ BIT: 11*)
 (*$ BIT: 12*)
 (*$ BIT: 13*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 10>"171-180 (TDL lines 401-410) (*$ BIT: 14*)"
"(*$ Shift and Exit1 DR; BIT: 15 *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"181-182 (TDL lines 411-412) (*$ Update DR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"183 (TDL line 413) (*$ Run Test Idle *)"
"(*$ Run Test Idle *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 12>"184-195 (TDL lines 414-418)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;<RPT 4>"196-199 (TDL lines 419-420)"
"(*$ Sending out addr word *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMHLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;"200 (TDL line 422)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;<RPT 3>"201-203 (TDL lines 423-425)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMHLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;"204 (TDL line 426)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;<RPT 11>"205-215 (TDL lines 427-437)"
"(*$ Sending out SIZE word *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMHLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;"216 (TDL line 439)"
"(*$ Sending out control word *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;<RPT 19>"217-235 (TDL lines 440-459)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMHLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;"236 (TDL line 460)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;<RPT 2>"237-238 (TDL lines 461-462)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMHLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;"239 (TDL line 463)"

"(*$ Load test number here *)
 (*$ 0x20004600 *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;<RPT 16>"240-255 (TDL lines 464-477)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLHHMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;"256 (TDL line 478)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLHMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;"257 (TDL line 479)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;<RPT 3>"258-260 (TDL lines 480-482)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLHLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMCMMMMM*;<RPT 11>"261-271 (TDL lines 483-484)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 11>"272-282 (TDL lines 486-487)"

"(*$ Entering functional mode testmode_reg = 0x0000 *)
 (*$0100:11000000000000000000000000000000 *)"
"(*$ Select DR Scan *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 2>"283-284 (TDL lines 492-493) (*$ Select IR Scan *)"
"(*$ Capture IR *)"
"(*$ Shift IR *)
 (*$ BIT: 0*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 4>"285-288 (TDL lines 494-497) (*$ BIT: 1*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMHLCMMMMMMMMMMMMMMMMMLMMMMM*;"289 (TDL line 498) (*$ BIT: 2*)"
"(*$ BIT: 3 Shift and Exit IR*)"
"(*$ Update IR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;<RPT 3>"290-292 (TDL lines 499-501) (*$ Select DR Scan *)"
"(*$ Capture DR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"293 (TDL lines 502)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"294 (TDL lines 503)(*$ Shift DR *)"

*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"295 (TDL lines 504)(*$ BIT: 0*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"296 (TDL lines 505)(*$ BIT: 1*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"297 (TDL lines 506)(*$ BIT: 2*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"298 (TDL lines 507)(*$ BIT: 3*)"

*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"299 (TDL lines 508)(*$ BIT: 4*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"300 (TDL lines 509)(*$ BIT: 5*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"301 (TDL lines 510)(*$ BIT: 6*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"302 (TDL lines 511)(*$ BIT: 7*)"

*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"303 (TDL lines 512)(*$ BIT: 8*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"304 (TDL lines 513)(*$ BIT: 9*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"305 (TDL lines 514)(*$ BIT: 10*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"306 (TDL lines 515)(*$ BIT: 11*)"

*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"307 (TDL lines 516)(*$ BIT: 12*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"308 (TDL lines 517)(*$ BIT: 13*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"309 (TDL lines 518)(*$ BIT: 14*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"310 (TDL lines 519)(*$ BIT: 15*)"

*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"311 (TDL lines 520)(*$ BIT: 16*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"312 (TDL lines 521)(*$ BIT: 17*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"313 (TDL lines 522)(*$ BIT: 18*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"314 (TDL lines 523)(*$ BIT: 19*)"

*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"315 (TDL lines 524)(*$ BIT: 20*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"316 (TDL lines 525)(*$ BIT: 21*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"317 (TDL lines 526)(*$ BIT: 22*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"318 (TDL lines 527)(*$ BIT: 23*)"

*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"319 (TDL lines 528)(*$ BIT: 24*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"320 (TDL lines 529)(*$ BIT: 25*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"321 (TDL lines 530)(*$ BIT: 26*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"322 (TDL lines 531)(*$ BIT: 27*)"

*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"323 (TDL lines 532)(*$ BIT: 28*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"324 (TDL lines 533)(*$ BIT: 29*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"325 (TDL lines 534)(*$ BIT: 30*)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;"326-327 (TDL lines 535-536)(*$Shift and Exit DR  BIT: 31 *)"
" (*$ Update DR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLHCMMMMMMMMMMMMMMMMMLMMMMM*;"326-327 (TDL lines 535-536) (*$ Update DR *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLCMMMMMMMMMMMMMMMMMLMMMMM*;"328 (TDL line 537) (*$ Run Test Idle *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMLLMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*;"329 (TDL line 538) (*$ Run Test Idle *)"

"(*$ de-asserting reset *)"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMMMMMMMMMMMMMHCMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*;"330 (TDL line 542)"

" end regular TDL patterns; start wrapup "

*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM---MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-MMMMMMMMMMMMM--MMMMMM-MMMMMMMMMMM---MMMMMMMMMMMMMMMMM-MMMMM*;<RPT 4>
$dmled_test_number_DPM_end
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM---MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-MMMMMMMMMMMMM--MMMMMM-MMMMMMMMMMM---MMMMMMMMMMMMMMMMM-MMMMM*;
}
