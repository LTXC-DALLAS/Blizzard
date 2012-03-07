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
#include <TestwareSupport.h>
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

#endif  // Test_value_H








