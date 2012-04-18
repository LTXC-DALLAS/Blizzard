Unison:U0.2:S4.3;

Pattern pwm_0_int_check {

Mode Digital;
Type Generic;



Default SignalHeader DefaultSignalHeader;

Default WaveformTable WFT8;

" Processed by Jazz::Tvt::tvtFusion version 1.199.0, updated Nov 22, 2011 "
" TDL:  TDLS/pwm_0_int_check.tdl.gz "
" Generated:  Wed Dec 28 17:58:10 US/Central 2011 "
" Jazz dir: /data/jazztest4/vikas/Phoenix_Unison/Blizzard_FX1 "

" ASIC_VERSION = 7.0 "
" "
" ASIC_TITLE = 'LIBRARY_TYPE = GS60, "
"                   CUSTOMER = TexasInstruments, "
"             TI_PART_NUMBER = F771727B, "
"           PATTERN_SET_NAME = pwm_0_int_check, "
"           PATTERN_SET_TYPE = FUNC, "
"    PATTERN_SET_DESCRIPTION = , "
"                   REVISION = 2.2, "
"                       DATE = 06/29/11'; "

/*     Started Reset Mode Entry Sequence        */
/*   Assert reset   */
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
$pwm_0_int_check_st
*--------------------------------------------------------------------------------------------------------------------------------*;<SWCCPM>
*--------------------------------------------------------------------------------------------------------------------------------*;<LDA pwm_0_int_check_DPM_st,COND NZC2>
*--------------------------------------------------------------------------------------------------------------------------------*;<RPT 128>

" end initialization; start regular patterns "

*dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd*;<SWCDPM,SDP,RPT 50000> "1-50000"
*dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd*;<SWCDPM,SDP,RPT 25985> "50001-75985"

"LOOP_FOR_MATCH FAIL, 150000"
"loop setup"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMLMMMMMMMMMMMMMHCMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*; "Load counter and test pins prior entering match loop"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMLMMMMMMMMMMMMMHCMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*; "ignore fail and inhibit count during loop for match"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMM1MMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMLMMMMMMMMMMMMMHCMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM* WFT_MATCH; <MATCHVECTOR 968> "if vector fails then SEQF is set to on and match loop continues"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMLMMMMMMMMMMMMMHCMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*; <MODE(IFAIL OFF,TCI OFF)> "matched so now switch back to normal mode"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMLMMMMMMMMMMMMMHCMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*;
"end of match loop"


"LOOP_FOR_MATCH FAIL, 800"
"loop setup"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMLMMMMMMMMMMMMMHCMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*; "Load counter and test pins prior entering match loop"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMLMMMMMMMMMMMMMHCMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*; "ignore fail and inhibit count during loop for match"
*MMMMMMMMMMMMMMMMMMMMMMMMMMM0MMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMLMMMMMMMMMMMMMHCMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM* WFT_MATCH; <MATCHVECTOR 6> "if vector fails then SEQF is set to on and match loop continues"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMLMMMMMMMMMMMMMHCMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*; "matched so now switch back to normal mode"
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMLMLMMMMMMMMMMMMMHCMMMMMMLMMMMMMMMMMMLLLMMMMMMMMMMMMMMMMMLMMMMM*;
"end of match loop"


" end regular patterns; start wrapup "

*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM---MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-M-MMMMMMMMMMMMM--MMMMMM-MMMMMMMMMMM---MMMMMMMMMMMMMMMMM-MMMMM*;<RPT 512>
$pwm_0_int_check_end
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM---MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-M-MMMMMMMMMMMMM--MMMMMM-MMMMMMMMMMM---MMMMMMMMMMMMMMMMM-MMMMM*;
*MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM---MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-M-MMMMMMMMMMMMM--MMMMMM-MMMMMMMMMMM---MMMMMMMMMMMMMMMMM-MMMMM*;<STOP>
}
