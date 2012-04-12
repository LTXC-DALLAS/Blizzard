 /******************************************************************************/
 /*  A00 : Initial version of some semi-VLCT-equivalent code.    JT 2012/12/04 */
 /*                                                                            */
 /******************************************************************************/

#include <std_vi.h>
using namespace std;


/* JT  03/07/2012                                                 */
/******************************************************************/
/* I think this is the equivalent of the VLCT STDSetVI, except    */
/* ranging happens here as well. This will set the I clamps and   */
/* range. It will set the force V and range and gate the          */
/* instrument on (I don't see a gate in VLCT, so hope the force   */
/* does it.)                                                      */
/*                                                                */
/* If you don't pass the range, the previous range is kept        */
/******************************************************************/
void STDSetVI(const PinM &viPin, const FloatM &setV, const FloatM &setI, 
              const VIForceTypeS &forceType, const VIMeasureTypeS &measType, 
              const FloatM &vRange)
{   
   switch (forceType)
   {
      case VI_FORCE_I: // force current
         if (vRange != UTL_VOID)
         {
            VI.SetClampsV(viPin, vRange, -vRange);
         } else {
            VI.SetClampsV(viPin, setV, -setV);
         }
         switch (measType) 
         {
            case VI_MEASURE_I: VI.SetMeasureIRange(viPin, setI); break;
            case VI_MEASURE_V: VI.SetMeasureVRange(viPin, vRange); break;
            default: VI.SetMeasureVRange(viPin, vRange); break;
         }
         VI.ForceI(viPin, setI, setI);
         break;
      case VI_FORCE_V: // force voltage
         VI.SetClampsI(viPin, setI);
         switch (measType) 
         {
            case VI_MEASURE_I: VI.SetMeasureIRange(viPin, setI); break;
            case VI_MEASURE_V: VI.SetMeasureVRange(viPin, vRange); break;
            default: VI.SetMeasureIRange(viPin, setI); break; 
         }
         if (vRange == UTL_VOID) 
            VI.ForceV(viPin, setV);
         else
            VI.ForceV(viPin, setV, vRange);
         break;
      default:
         return; // do nothing, don't gate on
   }

   if (VI.GetGateState(viPin).AnyGreater(VI_GATE_ON)) // if any are gated off
   {
      VI.Gate(viPin, VI_GATE_ON);
   }
}

bool STDGetConnect (const PinM &myPin, const BoolS &checkDCL)
{
   PinType my_type = myPin.GetPinType();
   switch (my_type.GetBasicType())
   {
      case PINTYPE_DIGITAL_PIN:
         if (checkDCL)
            return (DIGITAL.GetConnectState(myPin, DIGITAL_DCL_TO_DUT).AnyEqual(CONNECT_OFF));
            // fall through to the VI syntax for ppmu
      case PINTYPE_ANALOG_PIN:
      case PINTYPE_POWER_PIN:
         return (!VI.GetConnectPath(myPin).AnyGreater(VI_TO_DUT));
      default:
         return (false);
   }
}

void STDConnect(const PinM &myPin, const VIConnectModeM &connectMode, 
               const BoolS &connectDCL)
{
   PinType my_type = myPin.GetPinType();
   switch (my_type.GetBasicType())
   {
      case PINTYPE_DIGITAL_PIN:
         if (connectDCL) 
         {
            DIGITAL.Connect(myPin, DIGITAL_DCL_TO_DUT);
            break;
         }
         DIGITAL.Disconnect(myPin, DIGITAL_ALL_PATHS);
         // fall through to connect PPMU
      case PINTYPE_ANALOG_PIN:
      case PINTYPE_POWER_PIN:
         VI.Connect(myPin, VI_TO_DUT, connectMode);
         break;
      default:
         return;
   }
}

void STDMeasV (const PinM &myPin, const UnsignedS &averages, FloatM &measValue, const FloatM &simValue)
{
   VI.SetMeasureSamples(myPin, averages); 
   VI.MeasureVAverage(myPin, measValue, simValue);
   measValue.SetUnits("V");
}

void STDMeasI (const PinM &myPin, const UnsignedS &averages, FloatM &measValue, const FloatM &simValue)
{
   VI.SetMeasureSamples(myPin, averages);
   VI.MeasureIAverage(myPin, measValue, simValue);
   measValue.SetUnits("A");
}

// PPMU has no sampled mode, so do it manually
// This is just for debug of stability/repeatability
void STDMeasVSampled (const PinM &myPin, const UnsignedS &samples, FloatM1D &measValues, const FloatM &simValue)
{
   FloatM measurement;
   VI.SetMeasureSamples(myPin, 1);
   for (int i = 0; i < samples; ++i)
   {
      VI.MeasureVAverage(myPin, measurement, simValue);
      measValues.SetValue(i, measurement);
      TIME.Wait(100us);
   }
   measValues.SetUnits("V");
}

// PPMU has no sampled mode, so do it manually
// This is just for debug of stability/repeatability
void STDMeasISampled (const PinM &myPin, const UnsignedS &samples, FloatM1D &measValues, const FloatM &simValue)
{
   FloatM measurement;
   VI.SetMeasureSamples(myPin, 1);
   for (int i = 0; i < samples; ++i)
   {
      VI.MeasureIAverage(myPin, measurement, simValue);
      measValues.SetValue(i, measurement);
      TIME.Wait(100us);
   }
   measValues.SetUnits("A");
}
