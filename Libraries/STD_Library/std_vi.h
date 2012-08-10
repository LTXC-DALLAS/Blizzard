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
//  2012-08-09 v1.1    : jat    Removed STDConnect. It was confusing once I actually tried  //
//                              to use it for DCLs. After changing to VI-only, it became    //
//                              trivial. Also changed STDSetVI to use VI.Force instead of   //
//                              VI.ForceV and VI.ForceI to avoid ordering of statement      //
//                              issues with ranging.                                        //
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

// STDConnect is unnecessary. It would be a 1 line function for VIs. And, since
// digital pins can connect either DCL or PPMU, it takes more arguments and is
// confusing. Instead of STDConnect, use the following:
// For VI:           VI.Connect(myPin, VI_TO_DUT, VI_MODE_REMOTE);  //or other VI_MODE type
// For Digital DCL:  DIGITAL.Connect(myPin, DIGITAL_DCL_TO_DUT);
//void STDConnect(const PinM &myPin, const VIConnectModeM &connectMode = VI_MODE_REMOTE);
                  
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
