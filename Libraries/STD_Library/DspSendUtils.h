//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                  DspSendUtils.h                                          //
//                                                                                          //
//  This is the header file for some common DSP Send utilities.                             //
//                                                                                          //
// See comments on the function headers for usage.                                          //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////
//                                     Revision History                                     //
//////////////////////////////////////////////////////////////////////////////////////////////
//  2012-07-02 v1.0    : jat    initial release                                             //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////

#ifndef DSP_SEND_UTILS_H
#define DSP_SEND_UTILS_H

#include <Unison.h>

// Checks if the given send_name is a defined DSP Send.
bool IsDspSendDefined(const StringS &send_name);

#endif

