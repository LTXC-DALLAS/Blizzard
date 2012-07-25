//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                       std_vi.h                                           //
//                                                                                          //
//  This is the header file to the std_vi functions, which are semi-VLCT equivalent code.   //
// The routines included are used to do basic VI type functions.                            //
//                                                                                          //
// See comments on the function headers for usage.                                          //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////
//                                     Revision Log                                         //
//////////////////////////////////////////////////////////////////////////////////////////////
//  2012-04-12 v1.0    : jat    initial release                                             //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////


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
