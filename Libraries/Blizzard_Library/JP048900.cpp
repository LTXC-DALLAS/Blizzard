/*********************************************************************************************************

	 5 Oct 2010   Rev 1.0   Created by j750_SpreadsheetProcessor.pl, Rev. R3.0, LTX-Credence Corporation

 *********************************************************************************************************/

#include "JP048900.h"
  
  const int SKEY_STATUS_NOT_PROGED = 0;
  const int SKEY_STATUS_PROGED = 1;
  const int SKEY_STATUS_CANNOT_CHECK = 2;


  IntM S_key_Proged;

TMResultM  CaptureFlashProc()
{
	TMResultM testResult    = TM_NOTEST;	
	testResult = TM_PASS;
	return testResult;
}

void SetTestLimits (LimitTable limit_table)
{
  TestProg.SetActiveLimitTable(limit_table);
}

TMResultM  Check_Skey_Status_Probe_Proc(PinML testpin)
{
	TMResultM testResult    = TM_NOTEST;
  TMResultM patternResult = TM_PASS;
  StringS burstname;
  BoolM skeypassed = true;
  
  Sites SavedSites = ActiveSites;
  SiteIter site_iter = SavedSites.Begin();
  SITE site = site_iter.GetValue();


 /*     Check Status of Skey Bit 0  */
  burstname = "peek_fiftest_skey0_burst"; //run from skey_bit_0 label
  patternResult = DIGITAL.TestPattern(burstname);
  DIGITAL.WaitForPattern();
  
  for (site_iter.Begin(); !site_iter.End(); ++site_iter) {
    S_key_Proged[site] = SKEY_STATUS_CANNOT_CHECK;
    site = site_iter.GetValue();
    if(patternResult[site] == TM_PASS){
        //std::cout << "SKEY NOT PROGRAMMED" << std::endl;
        IO.Print(IO.Stdout, "SKEY not Programed on Site: ", IntS(site)+"\n");
        S_key_Proged[site] = SKEY_STATUS_NOT_PROGED;}
    else{
        IO.Print(IO.Stdout, "Skey bit 0 failed on Site: ", IntS(site));
        S_key_Proged[site] = SKEY_STATUS_PROGED;}    
   }
	
  
  //     Check Status of Skey Bit 1     
  burstname = "peek_fiftest_skey1_burst"; //run from skey_bit_1 label
  patternResult = DIGITAL.TestPattern(burstname);
  DIGITAL.WaitForPattern(); 
    
 
  for (site_iter.Begin(); !site_iter.End(); ++site_iter) {    
    site = site_iter.GetValue();
    if(patternResult[site] == TM_PASS){
        IO.Print(IO.Stdout, "Skey bit 1 locked on Site: ", IntS(site_iter.GetValue()));
        S_key_Proged[site] = SKEY_STATUS_PROGED;
        testResult[site] = TM_FAIL;
        skeypassed[site] = false;
   }
    else{
        IO.Print(IO.Stdout, "Skey bit 1 failed on Site: "+ IntS(site_iter.GetValue()));
   }  
    }
   
  
  // Check to see if Skey Bit is neither 0 nor 1
  for (site_iter.Begin(); !site_iter.End(); ++site_iter) {
        site = site_iter.GetValue();
        if (S_key_Proged[site] == SKEY_STATUS_CANNOT_CHECK){
            IO.Print(IO.Stdout, "Bad Device Skey Bit on Site: ", IntS(site_iter.GetValue()));
            testResult[site] = TM_FAIL;
            skeypassed[site] =false;
            }
	}
  // DLOG.Functional(testpin, testResult, "Check Skey Status");
	return testResult;
}



TMResultM  OpenCTOs()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  dmy_erase_current_proc()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  dmy_pageerase_current_proc()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  dmy_ierase_current_proc()
{
	TMResultM testResult    = TM_NOTEST;
	testResult = TM_PASS;
	return testResult;
}
TMResultM  dmy_ipageerase_current_proc()
{
	TMResultM testResult    = TM_NOTEST;
	testResult = TM_PASS;
	return testResult;
}
TMResultM  DVSProc(PinML vcc_pin,FloatM force_value, FloatM max_current, FloatM max_voltage, IntM numsamples, FloatM measuredelay)
{
	TMResultM testResult    = TM_NOTEST;
	testResult = TM_PASS;
  
  VI.InitializeMeasure(vcc_pin);
  
  VI.Connect(vcc_pin, VI_TO_DUT, VI_MODE_REMOTE);
  
  VI.SetMeasureSamples(vcc_pin, numsamples);
  
  //Set current and voltage clamps
  VI.SetClampsI(vcc_pin, max_current);
  VI.SetClampsV(vcc_pin, max_voltage, -(max_voltage));
  
  
  VI.ForceV(vcc_pin, force_value);
  
  FloatM1D Iout;  
  VI.SetMeasureVRange(vcc_pin, max_voltage);
  VI.MeasureIAverage(vcc_pin, Iout, 500nA);
  
  FloatS low_limit = 100nA;
  FloatS high_limit = 1100nA;
  StringS unit = "uA";
  StringS comment = "DVSProcTest";
  UnsignedS testnum = 10;
  
  
  testResult = DLOG.Value(vcc_pin, Iout[0], low_limit, high_limit, unit, comment);
 
    
	return testResult;
}
TMResultM  EnterBypassmode()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  EnterExternalControlMode()
{
	TMResultM testResult    = TM_NOTEST;

	testResult = TM_PASS;
	return testResult;
}
TMResultM  EnterFTESTmode()
{
	TMResultM testResult    = TM_NOTEST;
    TMResultM patternResult = TM_PASS;
	
    BoolS     EnablePatternDatalog = true;
    PinML     TestPins       = "RA6+RA5+RA4+RC7+MRST";
    IntS      MinorID        = 0;
  
    patternResult = DIGITAL.TestPattern("EnterFTESTmode_Burst", EnablePatternDatalog);
    if (EnablePatternDatalog)
        DLOG.Functional(TestPins, patternResult, UTL_VOID, UTL_VOID, UTL_VOID, MinorID, ER_PASS);
    // Need AccumulateResult(), having problems compiling ('not in scope'). Work around for now...
    //testResult = AccumulateResults(testResult, patternResult);
    if (((testResult == TM_NOTEST) || (testResult == TM_PASS)) && patternResult == TM_PASS) {
        testResult = TM_PASS;
    }
    else {
        testResult = TM_FAIL;
    }
        
    // Breakpoint for Debug
    DEBUG.Breakpoint("AfterTest", "After Test");

	return testResult;
}
TMResultM  EnterScanmode()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  ToxLeakProc()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  ConnectVPP()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  DisconnectVPP()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  cc_erase_current_proc()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  cc_pageerase_current_proc()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  cc_pageerase_current_32pages_proc()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  cc_ierase_current_proc()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  cc_ipageerase_current_proc()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  cc_ipageerase_current_3pages_proc()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  WaitTime()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  Prog_DieID_Proc()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  ROMdumpProc()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  RAMselfProc()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}
TMResultM  ChangeVCC()
{
	TMResultM testResult    = TM_NOTEST;
	
	testResult = TM_PASS;
	return testResult;
}


