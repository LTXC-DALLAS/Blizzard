// ------------------------------------------------------------------------------------------------------
//                                                                                                     
//                            BQ8050 POWER-UP	UNISON TEST METHOD     		               	       
//                                                                                                     
// ------------------------------------------------------------------------------------------------------
//                                   REVISION LOG                                                      
// ------------------------------------------------------------------------------------------------------
//   REVISION	REVISION DATE	 AUTHOR 	REASON FOR CHANGE			                 
//   1.0     	31-May-2011	 BARNIER	creation from cadence test method			                
// ------------------------------------------------------------------------------------------------------
//
// ------------------------------------------------------------------------------------------------------
// Description:	This CTM is intended to test REG25/REG33 power-up values		       	       
// ------------------------------------------------------------------------------------------------------
//
// ------------------------------------------------------------------------------------------------------

#ifndef power_up_H
#define power_up_H

#include <Unison.h>
#include <TMFamily.h>
#include "../stdprogram_U10/Enums.h"
#include "../stdprogram_U10/TWPDL.h"
#include <globals.h>

using namespace UTL;
using namespace std;

class power_up: public TMFamily
{
  public:
    power_up();
    virtual ~power_up() {}

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
    BoolS                       debug;
    FloatS                      vccv;
    FloatS                      packv;
    FloatS                      batv;
    FloatS                      wait_time;
    BoolS                       use_testware;
    EnumS<TWDataType>           testware_datatype;
    // Rows settings
    ArrayOfPinM                 Tested_pins;
    ArrayOfFloatM1D             row_reg_value;
    // Limits structure definition
    ArrayOfPinML                test_pins;
    ArrayOfIntS                 test_limits;
    ArrayOfEnumM<TM_RESULT>     row_test_result;
    // Define generic names for limit structure and limit table
    LimitTable                  limit_table;
    LimitStruct                 limits_struct;
    
};

TM_RETURN power_up::DoAction(TM_ACTION action)
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

TMResultM power_up::AccumulateResults(TMResultM &test_result, TMResultM new_result)
{
    // accumulates non-passing site results from new_result into passing sites in test_result
    SiteIter site_iter = ActiveSites.Begin();

    for(site_iter.Begin(); !site_iter.End(); site_iter++) {
        if (test_result[site_iter.GetValue()] == TM_PASS || test_result[site_iter.GetValue()] == TM_NOTEST) {
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
#endif  // power_up_H








