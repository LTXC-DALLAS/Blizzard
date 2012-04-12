 /******************************************************************************/
 /*  A00 : Initial version of some semi-VLCT-equivalent code.    JT 2012/12/04 */
 /*                                                                            */
 /******************************************************************************/


#ifndef STD_VI_H
#define STD_VI_H

#include <Unison.h>

void STDSetVI(const PinM &viPin, const FloatM &setV, const FloatM &setI, 
              const VIForceTypeS &forceType, const VIMeasureTypeS &measType = UTL_VOID,
              const FloatM &vRange = UTL_VOID);
             
bool STDGetConnect (const PinM &myPin, const BoolS &checkDCL = false);

void STDConnect(const PinM &myPin, const VIConnectModeM &connectMode = VI_MODE_REMOTE, 
               const BoolS &connectDCL = false);
               
void STDMeasV (const PinM &myPin, const UnsignedS &averages, FloatM &measValue, 
               const FloatM &simValue);
void STDMeasI (const PinM &myPin, const UnsignedS &averages, FloatM &measValue, 
               const FloatM &simValue);

// Below 2 functions are for debug only right now.
void STDMeasVSampled (const PinM &myPin, const UnsignedS &samples, 
                      FloatM1D &measValues, const FloatM &simValue);
void STDMeasISampled (const PinM &myPin, const UnsignedS &samples, 
                      FloatM1D &measValues, const FloatM &simValue);


#endif // STD_VI_H
