// ------------------------------------------------------------------------------------------------------
//                                                                                                     
//                         GENERIC TEST VALUE UNISON TEST METHOD   		               	       
//                                                                                                     
// ------------------------------------------------------------------------------------------------------
//                                   REVISION LOG                                                      
// ------------------------------------------------------------------------------------------------------
//   REVISION	REVISION DATE	 AUTHOR 	REASON FOR CHANGE			                 
//   1.0     	30-Jun-2011	 BARNIER	creation from cadence test method			                
// ------------------------------------------------------------------------------------------------------
//
// ------------------------------------------------------------------------------------------------------
// Description:	This CTM is intended to test various tests with LimitStructure	 
//		it only covers FloatM or FloatM1D so far       
// ------------------------------------------------------------------------------------------------------
//
// ------------------------------------------------------------------------------------------------------

#ifndef Test_value_H
#define Test_value_H

#include <Unison.h>
#include <TMFamily.h>
#include <TWexterns.h>
#include <CbitCtrl.h>
#include <globals.h>

using namespace UTL;
using namespace std;

class Test_value: public TMFamily
{
  public:
    Test_value();
    virtual ~Test_value() {}

    TM_RETURN DoAction(TM_ACTION action);

    /** @copydoc Method_Common::Execute() */
    TM_RETURN        Execute();
    /** @copydoc Method_Common::ParamCheck() */
    BoolM            ParamCheck();
    /** In GenericTest the Initialize is used to find the number of rows (objects) to execute,
    and to initialize the row results to #TM_NOTEST. */
    BoolM            Initialize();

    TMResultM AccumulateResults(TMResultM &test_result, const TMResultM new_result);

  protected:
  
    // Base settings   
    BoolS                       use_testware;
    EnumS<TWDataType>           testware_datatype;
    //Test settings
    ArrayOfBoolS                row_enable;
    ArrayOfPinML                tested_pins;
    ArrayOfFloatM1D             tested_value;
    // Limits structure definition
   // LimitStruct               limits_test_value;    
    ArrayOfObjectS              limits_test_value;   
    ArrayOfEnumM<TM_RESULT>     row_test_result;

};

TM_RETURN Test_value::DoAction(TM_ACTION action)
{
    switch (action) {
        case TM_EXECUTE:          { return Execute(); 
                                  }
        case TM_PARAMETER_CHANGE: { SetValue(ParamCheck()); 
                                    return TM_HAS_VALUE; 
                                  }
        case TM_INITIALIZE:       { SetValue(Initialize()); 
                                    return TM_HAS_VALUE; 
                                  }
        default:                  { SetValue(BoolM(false)); 
                                    return TM_HAS_VALUE; 
                                  }
    }
}

TMResultM Test_value::AccumulateResults(TMResultM &test_result, TMResultM new_result)
{
    // accumulates non-passing site results from new_result into passing sites in test_result
    SiteIter site_iter = ActiveSites.Begin();

    for(site_iter.Begin(); !site_iter.End(); site_iter++) {
        if (test_result[site_iter.GetValue()] == TM_PASS) {
            switch (new_result[site_iter.GetValue()]) {
                case TM_PASS:
                case TM_NOTEST: { test_result[site_iter.GetValue()] = TM_PASS; break; }
                case TM_FAIL:
                case TM_PARAM_FAIL:
                case TM_REPAIRABLE:
                case TM_TIMEOUT: { test_result[site_iter.GetValue()] = new_result[site_iter.GetValue()]; break; }
                default: { break; }
            }
        } else if (test_result[site_iter.GetValue()] == TM_NOTEST) {
            switch (new_result[site_iter.GetValue()]) {
                case TM_PASS:
                case TM_FAIL:
                case TM_PARAM_FAIL:
                case TM_NOTEST:
                case TM_REPAIRABLE: 
                case TM_TIMEOUT: { test_result[site_iter.GetValue()] = new_result[site_iter.GetValue()]; break; }
                default: { break; }
            }
        }
    }
    return test_result;
}
#endif  // Test_value_H







