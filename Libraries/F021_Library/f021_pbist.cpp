// *****************************************************************************
//                                                                              
//  A01 : Initial version of F021 Pbist DMDx Code.          cjp   10jul12       
//                                                                              
// *****************************************************************************

#include <Unison.h>
#include <f021_pbist.h>
#include <f021_func.h>
using namespace std; 

IntS PBIST_FRAME_SIZE = 109;

TMResultM PbistFailLogout() {
   Sites       log_Sites;
   Sites       saveSites;
   Test        pbistTest;
   TMResultM   pbistRslt;
   
   log_Sites = ActiveSites;
   saveSites = ActiveSites;
   pbistTest = "Pbist_Logout_Test_T";
   pbistRslt = pbistTest.GetTestResult();

   // Only logout FAILS
   if ( pbistRslt.AnyEqual(TM_FAIL) ) {
      // Enable ONLY failed sites for logout
      BoolS       doneAssertAll = false;
      log_Sites.DisableFailingSites(pbistRslt.Equal(TM_FAIL));
      RunTime.SetActiveSites(log_Sites);

      do {
         // Only logout if FAIL asserted (TM_PASS)
         StringS     capName = "pBistCapData";
         TMResultM   currLogout;
         TMResultM   doneTest;
         UnsignedM1D captureArr(PBIST_FRAME_SIZE);
         UnsignedM1D simValue(PBIST_FRAME_SIZE,1);
         UnsignedS   maxCapCount = PBIST_FRAME_SIZE;
         
         currLogout = DIGITAL.TestPattern("pb_pb_test_fail_pin_Thrd");
         if ( currLogout.AnyEqual(TM_PASS) ) {
            PatternDigitalCapture("pb_pb_fail_logout_Thrd", "PBIST_LOGP", capName, maxCapCount, captureArr, simValue);
            ProcessFailData(captureArr);
         }
         
         // Test DONE after fail logout
         doneTest = DIGITAL.TestPattern("pb_pb_test_done_pin_Thrd");
         if ( doneTest.AnyEqual(TM_PASS) ) {
            // Disable DONE sites
            log_Sites.DisableFailingSites(doneTest.Equal(TM_FAIL));
            RunTime.SetActiveSites(log_Sites);
         }

         // Iterate fail logout until all devices are DONE!
         if ( doneTest == TM_PASS ) {
            doneAssertAll = true;
         }
//      while(0);   // Debug setting to do only once on tester
      } while(!doneAssertAll);
   }
   
   // Restore original Pass/Fail site list
   RunTime.SetActiveSites(saveSites);
   
   return(pbistRslt);
}

void ProcessFailData( UnsignedM1D captureArr) {
   IntS debug;
   StringM strFailArr;
   
   strFailArr = "";
   cout << endl;
   for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
      for (IntS index = 0; index < PBIST_FRAME_SIZE; ++index ) {
         if ( captureArr[*si][index] == 0 ) strFailArr[*si] += "0";
         else                               strFailArr[*si] += "1";
      }
      cout << "strFailArr[" << *si << "][" << strFailArr[*si] << "]" << endl;
   }
   
   debug = 1;
}
