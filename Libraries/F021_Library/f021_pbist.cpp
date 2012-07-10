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
   BoolS       doneAssertAll = false;
   Sites       log_Sites;
   Sites       saveSites;
   StringS     capName = "pBistCapData";
   Test        pbistTest;
   TMResultM   currLogout;
   TMResultM   doneTest;
   TMResultM   pbistRslt;
   UnsignedM1D captureArr(PBIST_FRAME_SIZE);
   UnsignedM1D simValue(PBIST_FRAME_SIZE,1);
   UnsignedS   maxCapCount = PBIST_FRAME_SIZE;

   log_Sites = ActiveSites;
   saveSites = ActiveSites;
   pbistTest = "Pbist_Logout_Test_T";
   pbistRslt = pbistTest.GetTestResult();

   // Only logout FAILS
   if ( pbistRslt.AnyEqual(TM_FAIL) ) {
      // Enable ONLY failed sites for logout
      log_Sites.DisableFailingSites(pbistRslt.Equal(TM_FAIL));
      RunTime.SetActiveSites(log_Sites);

      do {
         // Only logout if FAIL asserted (TM_PASS)
         currLogout = DIGITAL.TestPattern("pb_pb_test_fail_pin_Thrd");
         if ( currLogout.AnyEqual(TM_PASS) ) {
            PatternDigitalCapture("pb_pb_fail_logout_Thrd", "PBIST_LOGP", capName, maxCapCount, captureArr, simValue);
         }
         
         // Test DONE after fail logout
         doneTest = DIGITAL.TestPattern("pb_pb_test_done_pin_Thrd");
         if ( doneTest.AnyEqual(TM_PASS) ) {
            // Disable DONE sites
            log_Sites.DisableFailingSites(doneTest.Equal(TM_PASS));
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
   
   return(TM_PASS);
}
