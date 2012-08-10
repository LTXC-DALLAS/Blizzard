//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                    EfuseTrim.h                                           //
//                                                                                          //
//  This is the header file.                                                                //
//                                                                                          //
//  Put comments about the method here.                                                     //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////
//                                     Revision History                                     //
//////////////////////////////////////////////////////////////////////////////////////////////
//  xxxx-xx-xx v1.0    : xxx    initial release                                             //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////

#if 0

#ifndef EFUSE_TRIM_H
#define EFUSE_TRIM_H

#include <Unison.h>
#include <TMFamily.h>
#include <SearchMod.h>
#include <efuse.h>

class EfuseTrim : public TMFamily {
   public:
      EfuseTrim();
      virtual ~EfuseTrim() { }
      
      TM_RETURN      Execute();
      BoolM          ParamCheck();
      BoolM          Initialize();

      enum TrimType {
         TRIM_VI,
         TRIM_FREQ
      };
      
      enum TrimAlgorithmType {
         TRIM_LINEAR_UP,
         TRIM_LINEAR_DOWN,
         TRIM_BINARY,
         TRIM_BINARY_SKIP_MIN_MAX,
         TRIM_SUCC_APPROX,
         TRIM_SUCC_APPROX_SKIP_MIN_MAX
      };
      
      enum TrimDecisionType {
         TRIM_WITHIN_TOLERANCE,
         TRIM_NEAREST,
         TRIM_NEAREST_UPPER,
         TRIM_NEAREST_LOWER
      };
      
      enum TrimCodeType {
         TRIM_CODE_BINARY, 
         TRIM_CODE_SIGNED_BINARY,
         TRIM_CODE_TWOS_COMPLEMENT,
         TRIM_CODE_TABLE
      };
      
   protected:
      StringS FormatBreakpointMessage(const StringS TestName, const StringS EventName, const StringS MethodMessage,
                                      const StringS ExtraMessage, const TMResultM result_break);

   private:
      // define class variables here
      // device variables
      PinM  MeasPin;            // the pin to measure on
      EnumS<TrimType> TrimType; // Trimming Voltage/Current or Frequency?
      FloatS TrimTarget;        // the trim target
      FloatS LsbWeight;         // optional LSB weight used for Successive Approximation when skipping min & max
      PinML CodeProgPins;       // pins to program trim codes on
      IntS NumTrimBits; 
      IntS1D TrimLookupTable;
      EnumS<DesignInstEnumType> EfuseType;
      Levels EfuseReadLevels;
      Levels EfuseProgLevels;
      Levels TrimLevels;
      StringS EfuseCodeOption;
      
      // trim step setup
      EnumS<TrimCodeType> TrimCodeStyle;
      EnumS<TrimAlgorithmType> TrimAlgorithm; 
      EnumS<TrimDecisionType> TrimDecision;
      StringS SoftTrimPattern;
      StringS SoftTrimSendRef;
      WordOrientationS SerialBitOrder;
      
      // measure vars
      StringS MeasPattern;      // Pattern to run for measures
      FloatS ForceValue;
      FloatS ForceRange;
      FloatS MeasureClamp;       
      FloatS SettlingTime;      // settling time between each code step and measurement
      
      // misc vars
      BoolS Debug;
      BoolS Characterize;
      
      // output vars
      IntM TrimCode;
      
      // test limits
      LimitStruct PostTrimLimits;
      
      // internal-only variables
      IntS v_min_code;
      IntS v_max_code;
      IntS v_num_codes;
      IntS1D v_trim_lookup_table;
      bool v_meas_prev_connected;
      
      
      // functions
      void ProfileOn(const BoolS &enable, const StringS &message);
      void ProfileOn(const BoolS &enable, const bool startTimer);
      
      void ConnectMeasInstrument();
      void LoadTrimCode(const IntM &trimCode);
      FloatM MeasureValue();
      void DisconnectMeasInstrument();
      IntM PickBestCode(FloatM1D &trimCurve, const FloatS &target);
      SearchMod GenerateSearchMod();
      
      // debug support
      FloatS v_prev_timer;
      
      // characterization support
      static EfuseTrim   *ParamPtr;

      void SetParamPtr() { ParamPtr = this; }
      static TMResultM Callback();
};

#endif // EFUSE_TRIM_H

#endif

