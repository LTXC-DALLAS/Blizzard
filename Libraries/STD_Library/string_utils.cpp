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
//                                Revision Log			                                          //
//////////////////////////////////////////////////////////////////////////////////////////////
//  2012-04-27 v1.0    : jat    initial release                                             //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////

#include <string_utils.h>
using namespace std;

// made to work like VLCT ReverseString (returns reversed string, not in-place reversal)
StringS ReverseString(const StringS &inString)
{
   StringS return_string(NULL, inString.Length());
   
   for (int i = inString.Length() - 1; i >= 0; --i)
   {
      return_string[i] = inString[i];
   }
   
   return (return_string);
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

StringS IntToVLSIDriveStr(const IntS &srcInt, const IntS &numBits, const bool &isMSBFirst)
// numBits is the number of bits to convert. It is number of bits, NOT 
// bit number. This means it is 1-based, not 0 based.
{
   int bit_of_interest = 1;
   int my_int = int(srcInt); // strip the class wrapper to hopefully speed things up
   int l_num_bits;
   
   if (numBits > 32) 
   {
      l_num_bits = 32; // we only deal with 32 bits max
   } else {
      l_num_bits = numBits;
   }

   // reserve enough space in memory for the bits we have
   StringS drive_string(NULL, l_num_bits);

   for (int i = 0; i < l_num_bits; ++i) 
   {
      if (i > 0)
      {
         bit_of_interest = bit_of_interest << 1;
      }

      if ((my_int & bit_of_interest) == 0) 
      {
         if (isMSBFirst) // LSBs come first in loop, so prepend for MSB first
         {
            drive_string = "L" + drive_string;
         } else { // LSBs come first in loop and we want LSB first, so append
            drive_string += "L";
         }
      } else {
         if (isMSBFirst) // LSBs come first in loop, so prepend for MSB first
         {
            drive_string = "H" + drive_string;
         } else { // LSBs come first in loop and we want LSB first, so append
            drive_string += "H";
         }      
      }
   }
   
   return (drive_string);
}   /* end IntToVLSIDriveStr */


