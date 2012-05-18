//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                   MultisiteUtils.cpp                                     //
//                                                                                          //
//  This is the implementation file to some multisite utility functions.                    //
//                                                                                          //
// See comments on the function headers for usage.                                          //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////
//                                     Revision Log                                         //
//////////////////////////////////////////////////////////////////////////////////////////////
//  2012-05-18 v1.0    : jat    initial release                                             //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////

#include <MultisiteUtils.h>
using namespace std;

// Due to the current issue where RunTime.SetActiveSites will not allow turning off all 
// sites, this custom SetActiveSites routine will check if we are trying to disable all
// sites. SetActiveSites will set the active sites and return a boolean value denoting
// if it worked.
//
// newActiveSites - site list to set
// return value - boolean 
//                false if trying to turn off all sites (ie, newActiveSites is NO_SITES)
//                true if leaving some sites enabled
bool SetActiveSites(Sites newActiveSites)
{
   if (newActiveSites == NO_SITES)
      return false;
   RunTime.SetActiveSites(newActiveSites);
   return true;
}


