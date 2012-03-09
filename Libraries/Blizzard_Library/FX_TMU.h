// ------------------------------------------------------------------------------------------------------
//                                                                                                     
//                         GENERIC FX_TMU UNISON TEST METHOD   		               	       
//                                                                                                     
// ------------------------------------------------------------------------------------------------------
//                                   REVISION LOG                                                      
// ------------------------------------------------------------------------------------------------------
//   REVISION	REVISION DATE	 AUTHOR 	REASON FOR CHANGE			                 
//   1.0     	01-Jul-2011	 BARNIER	creation from FX_TMU.tmod generic cadence test method			                
// ------------------------------------------------------------------------------------------------------
//
// ------------------------------------------------------------------------------------------------------
// Description:	This CTM is a general purpose Method using the FX-TMU on X-series Platfor
//              Initial version is a very light version dedicated to BQ8050 needs
//              Only MSDI is covered so far
//              Note that frequency counter technique is included for frequency measurements
// ------------------------------------------------------------------------------------------------------
//
// ------------------------------------------------------------------------------------------------------

#ifndef FX_TMU_H
#define FX_TMU_H

#include <Unison.h>
#include <TMFamily.h>
#include <TestwareSupport.h>
#include <CbitCtrl.h>
//#include <globals.h>
#include <Enums.h>

using namespace UTL;
using namespace std;

class FX_TMU: public TMFamily
{
  public:
    FX_TMU();
    virtual ~FX_TMU() {}

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
    BoolS                               debug;
    BoolS                               use_testware;
    EnumS<TWDataType>                   testware_datatype;
    // Test settings
    EnumS<TMU_MEASURE_TYPE>             measurement_type;
    ArrayOfBoolS                        row_enable;   
    ArrayOfPinML                        test_pins;
    ArrayOfPinML                        reference_pins;
    ArrayOfPinML                        preset_pins_high;
    ArrayOfPinML                        preset_pins_low;
 //   ArrayOfEnumS<EdgeDrivenBy>          edge_one_driven_by; 
    BoolS                               run_pattern;
    ArrayOfStringS                      pattern_name;
    ArrayOfStringS                      pattern_label;
    ArrayOfIntM                         number_of_samples;
    ArrayOfEnumS<FreqCountSamples>      number_of_pulses; 
    ArrayOfFloatS                       max_expected_frequency;
    ArrayOfFloatS                       min_expected_period;
    ArrayOfFloatS                       min_expected_pulse_width;
    ArrayOfEnumS<Prescaler>             prescaler_setting;
    ArrayOfEnumS<TMU_TRIGGER_TYPE>      arm_tmu_on;
    ArrayOfEnumS<TMU_EDGE_TYPE>         start_measure_on;
    BoolS                               preset_pins;
//    BoolS                               test_jitter;
//    ArrayOfEnumS<JitterType>            jitter_type;
//    ArrayOfEnumS<TriggerVoltage>        trigger_voltage;
    // Limits structure definition
    ArrayOfEnumM<TM_RESULT>             row_test_result;
    ArrayOfFloatM1D                     row_results;
    ArrayOfObjectS                      test_limits;    
//    ArrayOfObjectS                      rms_jitter_limits;    
//    ArrayOfObjectS                      pk2pk_jitter_limits;    
//    ArrayOfObjectS                      max_jitter_limits;    
//    ArrayOfObjectS                      min_jitter_limits;    
//    ArrayOfObjectS                      jitter_range_limits;    
};

TM_RETURN FX_TMU::DoAction(TM_ACTION action)
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

#endif  // FX_TMU_H








