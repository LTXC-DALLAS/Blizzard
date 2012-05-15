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

// ReverseStringInPlace reverses inString inside the variable
// It is faster than ReverseString, which returns a new reversed
// string without altering the original string.
void ReverseStringInPlace(StringS &inString);
StringS ReverseString(const StringS &inString);

// StringBinToHex takes a binary string and returns a hex string
// representation of the binary string with only hex characters (ie, 
// no leading 0x)
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
//    
// NOTE: If srcInt cannot be contained in numBits, the MSBs will be truncated!
// This implementation is faster. If it is desired, look at the IntToBinStr 
// implementation for how to have it over-size.                     
StringS IntToVLSIDriveStr(const IntS &srcInt, const IntS &numBits, const bool &isMSBFirst);


// IntToBinStr will return a binary string representation of srcInt. 
// The string will be 0-padded (side is based upon isMSBFirst) to a minimum length
// of padToLength, if padToLength is not UTL_VOID. If the binary number takes more
// bits than padToLength, then the string will be longer than padToLength.
StringS IntToBinStr(const IntS &srcInt, const IntS &padToLength, const bool &isMSBFirst);

#endif

