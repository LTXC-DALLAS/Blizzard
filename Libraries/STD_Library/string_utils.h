//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                     string_utils.h                                       //
//                                                                                          //
//  This is the header file to some string utility functions.                               //
//  Functions include:                                                                      //
//       Basic string functions not included in the OS (ie. reverse)                        //
//       Functions to turn integers into VLSI-drive strings                                 //
//       Other number-to-string functions for non-standard formats                          //
//                                                                                          //
// See comments on the function headers for usage.                                          //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////
//                                Revision Log			                                          //
//////////////////////////////////////////////////////////////////////////////////////////////
//  2012-04-27 v1.0    : jat    initial release                                             //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////

#ifndef STRING_UTILS_H
#define STRING_UTILS_H

#include <Unison.h>


StringS ReverseString(const StringS &inString);

StringS StringBinToHex(const StringS &inString);


 /*hexvalue: write decimal value 4660 (or 0x1234) into RAM as 1234*/
 /*nothexvalue: write decimal value 751 (or 0x2EF) into RAM as 751*/
 /*the nothexvalue is used for cases like VT, lot#,..., i.e. what*/
 /*you see is what you get*/
void IntMToBcdBinVlsiStrM(const IntM &srcData, StringM &bcdStr, 
                           StringM &binVlsiStr, const BoolS &hexValue);


// IntToVLSIDriveStr will take an IntS and return a StringS, which is
// the binary representation of the IntS. HOWEVER, 1s are represented
// with an 'H' and 0s are represented with an 'L', since that is the 
// VLSI drive character standard at TI.
//
// numBits is the number of bits to convert. It is number of bits, NOT 
// bit number. This means it is 1-based, not 0 based.                           
StringS IntToVLSIDriveStr(const IntS &srcInt, const IntS &numBits, const bool &isMSBFirst);



#endif

