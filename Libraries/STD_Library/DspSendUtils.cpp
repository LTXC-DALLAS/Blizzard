//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                  DspSendUtils.cpp                                        //
//                                                                                          //
//  This is the implementation file for some common DSP Send utilities.                     //
//                                                                                          //
// See comments on the function headers for usage.                                          //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////
//                                     Revision History                                     //
//////////////////////////////////////////////////////////////////////////////////////////////
//  2012-07-02 v1.0    : jat    initial release                                             //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////

#include <DspSendUtils.h>
using namespace std;


bool IsDspSendDefined(const StringS &send_name)
{
   DigitalSendInfoStruct check_struct = DIGITAL.GetSendInfo(send_name);
   
   return (check_struct.WordCount > 0);
}


