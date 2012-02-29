Unison:U0.1:S4.3;

Pattern smb_subr {
Comment = "
 1 Oct 2010   Rev 1.0   Created by J750 Conversion, Rev. R3.0, from J750 pattern file 'patterns/smb/smb_subr.atp'.
";
Mode Digital;
Type Generic;
Default WaveformTable TS_NR_1us_WFTRef;
Default SignalHeader  allFuncPins;

$smb_subr_st
$start
* 01 XXX XXXXX XXXXX X*  ;  < RPT 10 >
* 00 XXX XXXXX XXXXX X*  ; " < RET >"
$stop
* 01 XXX XXXXX XXXXX X*  ;  < RPT 10 >
* 11 XXX XXXXX XXXXX X*  ;  < RPT 9 >
* 11 XXX XXXXX XXXXX X*  ; " < RET >"
$restart
* 00 XXX XXXXX XXXXX X*  ;  < RPT 9 >
* 01 XXX XXXXX XXXXX X*  ;  < RPT 10 >
* 11 XXX XXXXX XXXXX X*  ;  < RPT 10 >
* 01 XXX XXXXX XXXXX X*  ;  < RPT 10 >
* 00 XXX XXXXX XXXXX X*  ;  "< RET >"
$wr0
* 00 XXX XXXXX XXXXX X*  ;  < RPT 6 >
* 00 XXX XXXXX XXXXX X*  ;
* 01 XXX XXXXX XXXXX X*  ;  < RPT 10 >
* 00 XXX XXXXX XXXXX X*  ;
* 00 XXX XXXXX XXXXX X*  ;  "< RET >"
$wr1
* 00 XXX XXXXX XXXXX X*  ;  < RPT 6 >
* 10 XXX XXXXX XXXXX X*  ;
* 11 XXX XXXXX XXXXX X*  ;  < RPT 10 >
* 10 XXX XXXXX XXXXX X*  ;
* 00 XXX XXXXX XXXXX X*  ;  "< RET >"
$rd0
* 00 XXX XXXXX XXXXX X*  ;  < RPT 6 >
* X0 XXX XXXXX XXXXX X*  ;
* X1 XXX XXXXX XXXXX X*  ;  < RPT 9 >
* L1 XXX XXXXX XXXXX X*  ;
* X0 XXX XXXXX XXXXX X*  ;
* 00 XXX XXXXX XXXXX X*  ;  "< RET >"
$rd1
* X0 XXX XXXXX XXXXX X*  ;  < RPT 6 >
* X0 XXX XXXXX XXXXX X*  ;
* X1 XXX XXXXX XXXXX X*  ;  < RPT 9 >
* H1 XXX XXXXX XXXXX X*  ;
* X0 XXX XXXXX XXXXX X*  ;
* 00 XXX XXXXX XXXXX X*  ;  "< RET >"
$rdX
* 00 XXX XXXXX XXXXX X*  ;  < RPT 6 >
* X0 XXX XXXXX XXXXX X*  ;
* X1 XXX XXXXX XXXXX X*  ;  < RPT 10 >
* X0 XXX XXXXX XXXXX X*  ;
* 00 XXX XXXXX XXXXX X*  ;  "< RET >"
$ack_master
* 00 XXX XXXXX XXXXX X*  ;  < RPT 6 >
* 00 XXX XXXXX XXXXX X*  ;
* 01 XXX XXXXX XXXXX X*  ;  < RPT 10 >
* 00 XXX XXXXX XXXXX X*  ;
* 00 XXX XXXXX XXXXX X*  ;  "< RET >"
$nack_master
* 00 XXX XXXXX XXXXX X*  ;  < RPT 6 >
* 10 XXX XXXXX XXXXX X*  ;
* 11 XXX XXXXX XXXXX X*  ;  < RPT 10 >
* 10 XXX XXXXX XXXXX X*  ;
* 00 XXX XXXXX XXXXX X*  ;  "< RET >"
$ack_slave
* 00 XXX XXXXX XXXXX X*  ;  < RPT 6 >
* X0 XXX XXXXX XXXXX X*  ;
* X1 XXX XXXXX XXXXX X*  ;  < RPT 9 >
* L1 XXX XXXXX XXXXX X*  ;
* X0 XXX XXXXX XXXXX X*  ;
* 00 XXX XXXXX XXXXX X*  ;  "< RET >"
$nack_slave
* 00 XXX XXXXX XXXXX X*  ;  < RPT 6 >
* X0 XXX XXXXX XXXXX X*  ;
* X1 XXX XXXXX XXXXX X*  ;  < RPT 9 >
* H1 XXX XXXXX XXXXX X*  ;
* X0 XXX XXXXX XXXXX X*  ;
* 00 XXX XXXXX XXXXX X*  ;  "< RET >"
$capture
* 00 XXX XXXXX XXXXX X*  ;  < RPT 6 >
* X0 XXX XXXXX XXXXX X*  ;
* X1 XXX XXXXX XXXXX X*  ;  < RPT 7 >
* X1 XXX XXXXX XXXXX X*  ;  "J750:stv"
* X1 XXX XXXXX XXXXX X*  ;  "J750:stv"
* X1 XXX XXXXX XXXXX X*  ;  "J750:stv"
* X0 XXX XXXXX XXXXX X*  ;
* 00 XXX XXXXX XXXXX X*  ;  "< RET >"
}
