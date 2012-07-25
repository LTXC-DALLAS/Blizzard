//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                     string_utils.cpp                                     //
//                                                                                          //
//  This is the implementation file to some string utility functions.                       //
//  Functions include:                                                                      //
//       Basic string functions not included in the OS (ie. reverse)                        //
//       Functions to turn integers into VLSI-drive strings                                 //
//       Other number-to-string functions for non-standard formats                          //
//                                                                                          //
// See comments on the function headers for usage.                                          //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////
//                                     Revision Log                                         //
//////////////////////////////////////////////////////////////////////////////////////////////
//  2012-04-27 v1.0    : jat    initial release                                             //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////

#include <string_utils.h>
using namespace std;

// In place reversal is faster since new memory isn't allocated and passed around
void ReverseStringInPlace(StringS &inString)
{
   char achar;
   
   int half_length = inString.Length()/2; 
   int j = inString.Length() - 1;
   for (int i = 0; i < half_length; ++i, --j)
   {
      achar = inString[i];
      inString[i] = inString[j];
      inString[j] = achar;
   }
}

// made to work like VLCT ReverseString (returns reversed string, not in-place reversal)
// However, in-place reversal is fast, so create a copy and use it.
StringS ReverseString(const StringS &inString)
{
   StringS reversed_string = inString;
   ReverseStringInPlace(reversed_string);
   return (reversed_string);
}

StringS StringBinToHex(const StringS &inString)
{
   StringS return_string = "";
   UnsignedS temp_uint;
   int length = inString.Length();
   
   int num_words = length / 32; // work in 32 bit chunks
   int remainder = length % 32;
   
   for (int i = 1; i <= num_words; ++i)
   {
      temp_uint = CONV.StringToInt(inString.Substring(length - 32*(i), 32));
      IO.Print(return_string, "%x%s", temp_uint, return_string);
   }
   if (remainder != 0)
   {
      temp_uint = CONV.StringToInt(inString.Substring(0, remainder));
      IO.Print(return_string, "%x%s", temp_uint, return_string);
   }
   
   return (return_string);
}

 /*hexvalue: write decimal value 4660 (or 0x1234) into RAM as 1234*/
 /*nothexvalue: write decimal value 751 (or 0x2EF) into RAM as 751*/
 /*the nothexvalue is used for cases like VT, lot#,..., i.e. what*/
 /*you see is what you get*/
void IntMToBcdBinVlsiStrM(const IntM &srcData, StringM &bcdStr, 
                           StringM &binVlsiStr, const BoolS &hexValue)
{
   IntS str_len;
   IntS src_val;
   bool all_sites_same = false;
   
   // check if all sites have same data as first active site
   if (srcData == srcData[ActiveSites.Begin().GetValue()]) 
   {
      all_sites_same = true;
   } 
 
   for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
   {
      // VLCT cut off possible MSBs after converting to string, 
      // but working in Int should be faster
      src_val = srcData[*si] & 0xFFFF; 
      if (hexValue)
      {
         binVlsiStr[*si] = IntToVLSIDriveStr(src_val, 16, true);
         // make string in hex
         IO.Print(bcdStr[*si], "%04x", src_val);
      }
      else
      {
         IO.Print(bcdStr[*si], "%04d", src_val);
         for (int i = 0; i < 4; ++i)
         {
            switch (bcdStr[*si][i]) {
               case '0' : binVlsiStr[*si] += "LLLL"; break;
               case '1' : binVlsiStr[*si] += "LLLH"; break;
               case '2' : binVlsiStr[*si] += "LLHL"; break;
               case '3' : binVlsiStr[*si] += "LLHH"; break;
               case '4' : binVlsiStr[*si] += "LHLL"; break;
               case '5' : binVlsiStr[*si] += "LHLH"; break;
               case '6' : binVlsiStr[*si] += "LHHL"; break;
               case '7' : binVlsiStr[*si] += "LHHH"; break;
               case '8' : binVlsiStr[*si] += "HLLL"; break;
               case '9' : binVlsiStr[*si] += "HLLH"; break;
            } // end switch        
         } // end for (walk through bcdStr by character)
      } // end else for if hexValue
         
      // if all sites have the same source data, 
      // set strings appropriately and break out 
      // of the loop
      if (all_sites_same)
      {
         binVlsiStr = binVlsiStr[*si];
         bcdStr = bcdStr[*si];
         break;
      }
            
   } // end site loop
}

// IntToBinStr will return a binary string representation of srcInt. 
// The string will be 0-padded (side is based upon isMSBFirst) to a minimum length
// of padToLength, if padToLength is not UTL_VOID. If the binary number takes more
// bits than padToLength, then the string will be longer than padToLength.
StringS IntToBinStr(const IntS &srcInt, const IntS &padToLength, const bool &isMSBFirst)
{
   // Yes, the implementation may seem a little squirrelly in that we are 
   // always performing an LSB-first replacement. However, it ended up being
   // the fastest algorithm and cleanest implementation to always do LSB-first, 
   // then chop of the appropriate section and reverse it.
   // It would be faster if we could use the same implementation as IntToVLSIDriveStr,
   // but that can chop bits off and here it looks like we wanted them.
   
   int my_int = int(srcInt);
   StringS binary_string = "00000000000000000000000000000000";

   int length=0;    
 
   if (my_int >= 0) 
   {
      // while there is something left in my_int, keep comparing and 
      // shifting off bits
      while (my_int) 
      {
         if ((my_int & 1) != 0)
         {
            binary_string[length] = '1';
         }
         my_int = my_int >> 1;
         ++length;
      }
   } else { // we have a negative number, so the while my_int won't work
            // because of 2's complement and 1s get shifted in.
      binary_string = "11111111111111111111111111111111";
      while (my_int < -1)
      {
         if ((my_int & 1) == 0)
         {
           binary_string[length] = '0';
         }
         ++length;
         my_int = my_int >> 1;
      }
      ++length; // have to pick up one more bit as the sign-bit. 
   }
  
   if (length == 0)
      length = 1; // grab at least one bit
      
   length = (padToLength > length) ? int(padToLength) : length;
      
   if (isMSBFirst)
   {
      StringS ret_string = binary_string.Substring(0, length);
      ReverseStringInPlace(ret_string);
      return (ret_string);
   }
   
   return (binary_string.Substring(0, length));
}

// numBits is the number of bits to convert. It is number of bits, NOT 
// bit number. This means it is 1-based, not 0 based.
// NOTE: If srcInt cannot be contained in numBits, the MSBs will be truncated!
// This implementation is faster. If it is desired, look at the IntToBinStr 
// implementation for how to have it over-size.
StringS IntToVLSIDriveStr(const IntS &srcInt, const IntS &numBits, const bool &isMSBFirst)
{
   int my_int = int(srcInt); // strip the class wrapper to hopefully speed things up
   int l_num_bits;
   
   // start with a 32-bit string of L's, replace the high bits with H's
   // later. Also, return a substring of desired length.
   StringS drive_string = "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL";
   if (numBits > 32) 
   {
      l_num_bits = 32; // we only deal with 32 bits max, because that's all an IntS holds
   } else {
      l_num_bits = numBits;
   }

   // This is the fastest implementation, to create a 32-length
   // all L's and replace bits where there should be an H. Then
   // chop off the bits desired.
   int index = l_num_bits - 1;
   for (int i = 0; i < l_num_bits; ++i, --index) 
   {
      if ((my_int & (1 << i)) != 0) 
      {
         if (isMSBFirst)
         {
            drive_string[index] = 'H';
         } else { 
            drive_string[i]= 'H';
         }      
      }
   }
   return (drive_string.Substring(0, l_num_bits));
}   /* end IntToVLSIDriveStr */


// Converts a StringS into an UnsignedS. Only works up to 32 bits. 
UnsignedS BinStringToUnsigned(const StringS &inString, const bool &isMSBFirst)
{
   UnsignedS return_val = 0;
   int bit_num;
   IntS str_length = inString.Length();
   
   if (str_length > 32)
   {
      ERR.ReportError(ERR_PARAMETER_OUT_OF_RANGE, "BinStringToUnsigned can only accomodate up to 32-bit strings.", 
                      str_length, NO_SITES, UTL_VOID);
      return (0);
   }

   for (bit_num = 0; bit_num < str_length; ++bit_num)
   {
      if (inString[bit_num] == '1')
      {
         if (isMSBFirst)
         {
            return_val |= (1 << ((str_length-1)-bit_num));
         } else {
            return_val |= (1 << bit_num);
         }
      }
   }
   
   return(return_val);
}
