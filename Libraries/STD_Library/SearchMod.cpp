/*
 * SearchMod.cpp
 *
 *  110616  jj  initial version of search_module from Cadence
 *
 */

#include <iostream>
#include <iomanip>
#include <string>
#include <cmath>
#include <dirent.h>  //opendir

#include "SearchMod.h"

using namespace std;

// global in this cpp file.
// common to all SearchMod classes

unsigned 	SEARCH_LINEAR_MAX_STEPS = 100; //maximum number of search steps can be reset in *Begin call
unsigned 	SEARCH_BIN_MAX_STEPS    =  20;
unsigned 	SEARCH_SA_MAX_STEPS     =  30;
unsigned 	SEARCH_NOTCH_MAX_STEPS  = 100;

const 	int     POSITIVE_SLOPE                  = true;
const 	int     NEGATIVE_SLOPE                  = false;

///////////////////////////////////////////////////////////////////////
        SearchMod::SearchMod    () {
        
            m_persistenceOnLast     = false;
            m_persistenceOn         = false;
            m_persistenceOnCount    = 0;
            
            m_plotTarget            = false;

            m_plotPath              = "/tmp/";
            m_plotFileName          = "SearchModData";
            
            SetSMPipeDebug      (0); //0 off, 1 to see gnuplot pipe
            
            StartGnuPlot        ();
            
            ptr_x_MSa.Resize(1);
            ptr_y_MSa.Resize(1);
            ptr_xy_MSa.Resize(2);
            
            ptr_x_MSa = 0.;
            ptr_y_MSa = 0.;
            ptr_xy_MSa = 0.;
            
            // these were in the Begin functions, but since order of functions
            // could overwrite them (ie. if you did SkipMinMax, then called Begin)
            // it's best to put the initialization here
            searchSkipMinMax        = false;
            saSeededValue           = false;
            searchSkipMinMax        = false;

            
}
        SearchMod::~SearchMod   () {
    // TODO Auto-generated destructor stub
}
///////////////////////////////////////////////////////////////////////

//bool    SearchMod::LinearSearchBegin    (float  startX, float  stopX, float  stepSizeX,  float  targetY, float  toleranceY , unsigned maxSteps){
//
//    SEARCH_LINEAR_MAX_STEPS = maxSteps; //maximum number of search steps
//    ResizeDebugArrays( maxSteps );
//    
//    m_lineStyle = "w l";  // "w l" , "w p", "w lp" 
//
//    // loop control
//    m_searchType            = SEARCH_LINEAR;
//    searchNotDone           = true;
//    searchDbgPrintHeader    = true;
//    m_searchIndex           = 1;
//
//    // save search X parameters
//    xMin            = startX;
//    xMax            = stopX	;
//    xForceValue	    = xMin;
//    float range     = xMax - xMin;
//
//    // save search Y parameters
//    yTarget         = targetY;
//    yTolerance	    = toleranceY;
//      
//    // find search step size ---------------------------
//    xStep = abs(stepSizeX);
//    if ( xStep == 0 )  xStep=1.0;   // guard against zero step size
//
//    if ( (int) abs( range/xStep) > (SEARCH_LINEAR_MAX_STEPS-1) ){
//        xStep           = abs((xMax-xMin)/float(SEARCH_LINEAR_MAX_STEPS-1)); // autorange step size
//        m_searchMaxIndex  = SEARCH_LINEAR_MAX_STEPS;
//    }
//    else if( abs(range) < abs(xStep) ){
//        xStep = range;                              // adjust step size to range
//    }
//    else{      
//        m_searchMaxIndex  = (int) abs(range/xStep);   // use requested step size
//    }
//
//    if ( xMin > xMax ) xStep = - xStep;             // step down
//
//    return (searchNotDone);
//}
bool    SearchMod::LinearSearchBegin    (FloatM startX, FloatM stopX, FloatM stepSizeX,  FloatM targetY, FloatM toleranceY , unsigned maxSteps){

    SEARCH_LINEAR_MAX_STEPS = maxSteps; //maximum number of search steps
    ResizeDebugArrays( maxSteps );

    searchSites = ActiveSites;

    m_lineStyle = "w l";  // "w l" , "w p", "w lp" 

    // loop control
    m_searchType              = SEARCH_LINEAR_MS;
    searchDbgPrintHeader    = true;
    searchNotDone           = true;
    m_searchIndex             = 0;
    m_searchIndexMS           = 0;
    m_searchMaxIndex          = 0;    //max number of search steps for all sites
    IntM  searchMaxIndexMS;         //max number of search steps per site
    
    // save search X parameters
    xMinMS              = startX;
    xMaxMS              = stopX	;
    xForceValueMS       = xMinMS;
    FloatM  rangeMS = xMaxMS - xMinMS;

    // save search Y parameters
    yTargetMS           = targetY;
    yToleranceMS        = toleranceY;

    // find search step size ---------------------------
    for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {

        xStepMS[*si] = abs(stepSizeX[*si]);
        
        if ( xStepMS[*si] == 0 )  xStepMS[*si]=1.0;  // guard against zero step size
     
        if ( (int) abs( rangeMS[*si]/xStepMS[*si] ) > (SEARCH_LINEAR_MAX_STEPS-1) ){
            xStepMS[*si]           = abs((rangeMS[*si])/double(SEARCH_LINEAR_MAX_STEPS-1)); // autorange step size
            searchMaxIndexMS[*si]  = SEARCH_LINEAR_MAX_STEPS-1;
        }
        else if( abs(rangeMS[*si]) < abs(xStepMS[*si]) ){
            xStepMS[*si] = rangeMS[*si];            // adjust step size to range
        }
        else{
            searchMaxIndexMS[*si]  = (int) abs((rangeMS[*si])/xStepMS[*si]);  // use requested step size
        }

        if(searchMaxIndexMS[*si] > m_searchMaxIndex)
            m_searchMaxIndex = searchMaxIndexMS[*si]; // select max number of steps for all sites
    }
    
    for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
        if ( xMinMS[*si] > xMaxMS[*si] ) xStepMS[*si] = - xStepMS[*si]; //   step down     
    }
    
    return(searchNotDone);
}


//bool    SearchMod::BinarySearchBegin    (float  startX, float  stopX, float  toleranceX, float  targetY,                     unsigned maxSteps){	
///* Set up Binary search parameters
//startX      //minimum search range
//stopX			  //maximum search range
//toleranceX	//search stops when the forceX step size reaches the toleranceX
//targetY   	//search value on y axis
//*/
//    SEARCH_BIN_MAX_STEPS = maxSteps; //maximum number of search steps
//    ResizeDebugArrays( maxSteps );
//
//    m_lineStyle = "w p";  // "w l" , "w p", "w lp" 
//
//    // loop control
//    m_searchType			        = SEARCH_BIN;
//    searchNotDone           = true;
//    searchDbgPrintHeader    = true;
//    m_searchIndex			        = 0;
//    searchSkipMinMax        = false;
//    m_searchAlarm             = TARGET_FOUND;
//
//    // save search X parameters
//    xMin		        = startX;
//    xMax		        = stopX	;
//    xForceValue	    = xMin;				// start with minimum value
//    xTolerance	    = toleranceX;
//    xStep           = (xMax-xMin)/2.;	// set step size
//
//    // save search Y parameters
//    yTarget		    = targetY;
//
////    if (search_debug_print)
////        searchDbgPrintHeader = true;	// print header
//
//    return (searchNotDone);
//
//}
bool    SearchMod::BinarySearchBegin    (FloatM startX, FloatM stopX, FloatM toleranceX, FloatM targetY,                     unsigned maxSteps){	
/* Set up Binary search parameters
startX      //minimum search range
stopX			  //maximum search range
toleranceX	//search stops when the forceX step size reaches the toleranceX
targetY   	//search value on y axis
*/
    SEARCH_BIN_MAX_STEPS = maxSteps; //maximum number of search steps
    ResizeDebugArrays( maxSteps );
    
    searchSites = ActiveSites;

    m_lineStyle = "w p";  // "w l" , "w p", "w lp" 

    // loop control
    m_searchType			        = SEARCH_BIN_MS;
    searchNotDone           = true;
    searchDbgPrintHeader    = true;
    m_searchIndex			        = 0;
    m_searchAlarm             = TARGET_FOUND;
    m_searchMaxIndex        = maxSteps;

    // save search X parameters
    xMinMS		      = startX;
    xMaxMS	        = stopX	;
    xForceValueMS   = xMinMS;				// start with minimum value
    xToleranceMS    = toleranceX;
    xStepMS         = (xMaxMS-xMinMS)/2.;	// set step size
    
    // save search Y parameters
    yTargetMS		    = targetY;

//    if (search_debug_print)
//        searchDbgPrintHeader = true;	// print header

    return (searchNotDone);

}



//bool    SearchMod::SASearchBegin        (float  startX, float  stopX, float  toleranceY, float  targetY,                     unsigned maxSteps){	
///* 
//Set up Sucessive Aproximation (SA) search parameters
//startX      starting value of search
//stopX			  maximum end value of search 
//toleranceY	tolerance of the target measure value
//targetY   	search will terminate once targetY+-toleranceY is reached 
//*/
//
//    SEARCH_SA_MAX_STEPS = maxSteps; //maximum number of search steps
//    ResizeDebugArrays( maxSteps );
//
//    m_lineStyle = "w p";  // "w l" , "w p", "w lp" 
//
//    // loop control
//    m_searchType			        = SEARCH_SA;
//    searchNotDone           = true;
//    searchDbgPrintHeader    = true;
//    m_searchIndex			        = 0;
//    searchSkipMinMax        = false;
//    m_searchAlarm             = TARGET_FOUND;
//
//    // save search X parameters
//    xMin		        = startX;
//    xMax		        = stopX	;
//    xForceValue	    = xMin;				// start with minimum value
//    xStep           = (xMax-xMin)/2.;	// set step size
//
//    // save search Y parameters
//    yTarget		      = targetY;
//    yTolerance	    = toleranceY;
//
//    return (searchNotDone);
//}
bool    SearchMod::SASearchBegin        (FloatM startX, FloatM stopX, FloatM toleranceY, FloatM targetY,                     unsigned maxSteps){	
/* 
Set up Sucessive Aproximation (SA) search parameters
startX     starting value of search
stopX      maximum end value of search 
toleranceY tolerance of the target measure value
targetY    search will terminate once targetY+-toleranceY is reached 
*/
    SEARCH_SA_MAX_STEPS = maxSteps; //maximum number of search steps
    ResizeDebugArrays( maxSteps );
    
    searchSites = ActiveSites;

    m_lineStyle = "w p";  // "w l" , "w p", "w lp" 

    // loop control
    m_searchType			        = SEARCH_SA_MS;
    searchNotDone           = true;
    searchDbgPrintHeader    = true;
    m_searchIndex			        = 0;
    m_searchAlarm           = TARGET_FOUND;
    m_searchAlarmMS         = TARGET_FOUND;
    m_searchMaxIndex        = maxSteps;

    // save search X parameters
    xMinMS		      = startX;
    xMaxMS	        = stopX	;
    xForceValueMS   = xMinMS;				      // start with minimum value
    xStepMS         = (xMaxMS-xMinMS)/2.;	// set step size
    
    // save search Y parameters
    yTargetMS		    = targetY;
    yToleranceMS    = toleranceY;

    return (searchNotDone);
}


void    SearchMod::SkipMinMax           (bool   slopeIsPositive ){
/*
Allows skipping the min and max measurement if slope is provided.
BinarySearchBegin must be executed before this function.
*/

//    if      (m_searchType == SEARCH_BIN){
//        xForceValue     = (xMax-xMin)/2. + xMin; // start with center value
//        xStep           = (xMax-xMin)/4.;        // set step size
//
//        searchPositiveSlope = slopeIsPositive;
//        if ( not (searchPositiveSlope))
//            xStep = -xStep;
//
//        searchSkipMinMax    = true;
//        m_searchIndex			    = 2;				        //skip measurement of min,max values
//
//
//    }
//    else 
    if (m_searchType == SEARCH_BIN_MS){
        xForceValueMS   = (xMaxMS-xMinMS)/2. + xMinMS;  // start with center value
        xStepMS         = (xMaxMS-xMinMS)/4.;           // set step size

//IO.Print(IO.Stdout, " %9.3f\n %9.3f\n %9.3f\n %9.3f\n\n" ,xMaxMS,xMinMS, xForceValueMS, xStepMS );

        searchPositiveSlope = slopeIsPositive;
        if ( not (searchPositiveSlope))
            xStepMS = -xStepMS;

        searchSkipMinMax    = true;
        m_searchIndex			    = 2;				        //skip measurement of min,max values

    }
    else if (m_searchType == SEARCH_SA_MS){
    
        m_searchType = SEARCH_SA_SMM_MS;
    
        // make  xMinMS < xMaxMS
        for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
            if (xMinMS[*si]>xMaxMS[*si]){
                double  t   = xMaxMS[*si];
                xMaxMS[*si] = xMinMS[*si];
                xMinMS[*si] = t;
            }
        }
        xForceValueMS   = (xMaxMS-xMinMS)/2. + xMinMS;  // start with center value

//IO.Print(IO.Stdout, " %9.3f\n %9.3f\n %9.3f\n\n" ,xMaxMS,xMinMS, xForceValueMS);

        searchPositiveSlope = slopeIsPositive;
        if ( not (searchPositiveSlope))
            xStepMS = -xStepMS;
    }

    else{
        cout << "use of 'SkipMinMax' not applicable" << endl;   
    }

}

 
void    SearchMod::SASetInitialValues   (FloatM initialX, FloatS initialSlope){

    saSeededValue = true;
    estimatedSlope = initialSlope;
    xForceValueMS = initialX;
}
    
 
///////////////////////////////////////////////////////////////////////////////////////
//void    SearchMod::LinearSearchNext     (float  measuredY ){
//
//    if ( (abs) (measuredY - yTarget)  > yTolerance ){	// SET UP NEXT SEARCH POINT
//        xForceValue = xForceValue + xStep;
//        m_searchIndex = m_searchIndex + 1;
//    }
//    else{												//SEARCH IS DONE
//        searchNotDone = false ; 		//                -- exit
//        m_searchIndex = m_searchIndex + 1;
//    }
//
//    return;
//}

void    SearchMod::LinearSearchNext     (FloatM measuredY ){

   for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {

       if ( (abs) (measuredY[*si] - yTargetMS[*si])  > yToleranceMS[*si] ){	
           xForceValueMS[*si] = xForceValueMS[*si] + xStepMS[*si];  // set up next search point
       }
       else    sitesToDisable += *si ; 		//search finished on this site
   }
  
   m_searchIndex = m_searchIndex + 1;

    return;
}




//void    SearchMod::BinarySearchNext     (float  measuredY ){
//
//     if 			(m_searchIndex == 0 ){ 				//  min value was tested
//         // CHECK IF MIN VALUE PASSED
//         if ( measuredY < yTarget)
//             searchMinPassed = true;
//         else
//             searchMinPassed = false;
//
//         xForceValue 	= xMax;                		// set up for max value
//         m_searchIndex  	= m_searchIndex + 1;
//     }
//     else if 	(m_searchIndex == 1 ){ 				//  max value was tested
//         // CHECK IF MAX VALUE PASSED
//         if ( measuredY < yTarget)
//             searchMaxPassed = true;
//         else
//             searchMaxPassed = false;
//
//         if 		( searchMinPassed && searchMaxPassed ){ //  search failed
//             searchNotDone   = false;
//             m_searchAlarm     = MIN_AND_MAX_PASSED;
//         }
//         else if  ( not(searchMinPassed) && not(searchMaxPassed) ){ //  search failed
//             searchNotDone   = false;
//             m_searchAlarm     = MIN_AND_MAX_FAILED;
//         }
//         else if  ( searchMinPassed ){ 				//  curve slope is positive
//             xForceValue     = xForceValue-xStep;
//             xStep           = xStep/2.;
//         }
//         else{ 				                        //  curve slope is negative
//             xForceValue     = xForceValue-xStep;
//             xStep           = -xStep/2.;
//         }
//         
//         m_searchIndex = m_searchIndex + 1;
//     }
//     else if  (abs(xStep) > xTolerance) {
//         // SET UP NEXT SEARCH POINT
//         if (measuredY < yTarget)
//             xForceValue 	= xForceValue+xStep;
//         else
//             xForceValue 	= xForceValue-xStep;
//
//         xStep = xStep/2.;
//         m_searchIndex  	= m_searchIndex + 1;
//     }
//     else{												//SEARCH IS DONE
//         //m_searchAlarm     = TARGET_FOUND;     // already set thus not needed
//         searchNotDone   = false ; 						//  exit
//         m_searchIndex    += m_searchIndex ;
//     }
//}
void    SearchMod::BinarySearchNext     (FloatM measuredY ){

    FloatM errorMS  = 0.;

     for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
         errorMS[*si] = measuredY [*si] - yTargetMS [*si];

         if 			  (m_searchIndex == 0 ){ 				        //  min value was tested
             // CHECK IF MIN VALUE PASSED
             if ( measuredY[*si] < yTargetMS[*si])
                 searchMinPassedMS[*si] = true;
             else
                 searchMinPassedMS[*si] = false;

             xForceValueMS   [*si]   = xMaxMS[*si];     // set up for max value

         }
         else if 	(m_searchIndex == 1 ){ 				        //  max value was tested
             // CHECK IF MAX VALUE PASSED
             if ( measuredY[*si] < yTargetMS[*si])
                 searchMaxPassedMS[*si] = true;
             else
                 searchMaxPassedMS[*si] = false;

             // SET UP NEXT SEARCH POINT
             if 		( searchMinPassedMS[*si] && searchMaxPassedMS[*si] ){             //  search failed
                 sitesToDisable += *si;
                 m_searchAlarmMS   [*si]   = MIN_AND_MAX_PASSED;
             }
             else if  ( not(searchMinPassedMS[*si]) && not(searchMaxPassedMS[*si]) ){ //  search failed
                 sitesToDisable += *si;
                 m_searchAlarmMS   [*si]   = MIN_AND_MAX_FAILED;
             }
             else if  ( searchMinPassedMS[*si] ){ 				//  curve slope is positive
                 xForceValueMS   [*si]   = xForceValueMS[*si]-xStepMS[*si];
                 xStepMS         [*si]   = xStepMS[*si]/2.;
             }
             else{ 				                              //  curve slope is negative
                 xForceValueMS   [*si]   = xForceValueMS[*si]-xStepMS[*si];
                 xStepMS         [*si]   = -xStepMS[*si]/2.;
             }
             
         }
         else if  (abs(errorMS[*si]) > xToleranceMS[*si])  {    //&& (m_searchIndex < SEARCH_BIN_MAX_STEPS))

             // SET UP NEXT SEARCH POINT (3rd and up)
             if (measuredY[*si] < yTargetMS[*si])
                 xForceValueMS[*si] 	= xForceValueMS[*si]+xStepMS[*si];
             else
                 xForceValueMS[*si] 	= xForceValueMS[*si]-xStepMS[*si];

             xStepMS         [*si] = xStepMS[*si]/2.;
         }
         else{												//SEARCH IS DONE
             //m_searchAlarm     = TARGET_FOUND;     // already set thus not needed
             sitesToDisable += *si; 	    //  exit
         }

     }
     m_searchIndex = m_searchIndex + 1;
}

//void    SearchMod::SASearchNext         (float  measuredY ){
//
//    static float    x1;
//    static float    x2;
//    static float    y1;
//    static float    y2;
//           float    num;
//           float    dnum;
//           float    slope;
//           float    b;
//
//     if        (m_searchIndex == 0 ){          //  min value was tested
//         // CHECK IF MIN VALUE PASSED
//         if ( measuredY < yTarget)
//             searchMinPassed = true;
//         else
//             searchMinPassed = false;
//         
//         x1 = xForceValue;                       //save results
//         y1 = measuredY;
//         
//         xForceValue 	= xMax;                		// set up for max value
//     }
//     else if 	(m_searchIndex == 1 ){          //  max value was tested
//         // CHECK IF MAX VALUE PASSED
//         if ( measuredY < yTarget)
//             searchMaxPassed = true;
//         else
//             searchMaxPassed = false;
//
//         if (y1 < measuredY){                    //save results
//             x2 = xForceValue;
//             y2 = measuredY;
//         }
//         else{
//             x2 = x1;
//             y2 = y1;
//             x1 = xForceValue;
//             y1 = measuredY;
//         }
//
//         if 		( searchMinPassed && searchMaxPassed ){             //  search failed
//             searchNotDone   = false;
//             m_searchAlarm     = MIN_AND_MAX_PASSED;
//         }
//         else if  ( not(searchMinPassed) && not(searchMaxPassed) ){ //  search failed
//             searchNotDone   = false;
//             m_searchAlarm     = MIN_AND_MAX_FAILED;
//         }
//         else{                                              // calc next xForceValue
//             num   = y2 - y1;       
//             dnum  = x2 - x1;
//             if ((num == 0.0) || (dnum == 0.0)){
//                 searchNotDone   = false;
//                 m_searchAlarm     = SLOPE_FAILED;
//             }
//             else{
//                 slope           = num/dnum;
//                 b               = ((y2 + y1) - slope * (x2 + x1))/2.;
//                 xForceValue     = (yTarget - b)/slope;
//             }
//         }
//     }
//     else if   (abs(measuredY-yTarget)>yTolerance){ // set up next search point
//         if (measuredY > yTarget){
//             x2 = xForceValue;
//             y2 = measuredY;        
//         }
//         else{
//             x1 = xForceValue;
//             y1 = measuredY;
//         }
//         num   = y2 - y1;       
//         dnum  = x2 - x1;
//         if ((num == 0.0) || (dnum == 0.0)){
//             searchNotDone   = false;
//             m_searchAlarm     = SLOPE_FAILED;
//         }
//         else{
//             slope           = num/dnum;
//             b               = ((y2 + y1) - slope * (x2 + x1))/2.;
//             xForceValue     = (yTarget - b)/slope;
//         }
//     }
//     else{												                   //SEARCH IS DONE
//         //m_searchAlarm     = TARGET_FOUND;     // already set thus not needed
//         searchNotDone   = false ; 						//  exit
//     }
//
//     m_searchIndex  	= m_searchIndex + 1;
//}
void    SearchMod::SASearchNext         (FloatM measuredY ){

    static FloatM    x1MS;
    static FloatM    x2MS;
    static FloatM    y1MS;
    static FloatM    y2MS;
           double    num;
           double    dnum;
           double    slope;
           double    b;

     for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {

         if      (m_searchIndex == 0 ){          //  min value was tested
             // CHECK IF MIN VALUE PASSED
             if ( measuredY[*si] < yTargetMS [*si])  searchMinPassedMS [*si] = true;
             else                                    searchMinPassedMS [*si] = false;
             
             x1MS [*si] = xForceValueMS  [*si];    //save results
             y1MS [*si] = measuredY      [*si];
             
             xForceValueMS   [*si] = xMaxMS [*si]; // set up for max value
         }
         else if 	(m_searchIndex == 1 ){           //  max value was tested
             // CHECK IF MAX VALUE PASSED
             if ( measuredY[*si] < yTargetMS [*si])  searchMaxPassedMS [*si] = true;
             else                                    searchMaxPassedMS [*si] = false;

             if (y1MS [*si] < measuredY[*si]){                    //save results
                 x2MS [*si] = xForceValueMS [*si];
                 y2MS [*si] = measuredY[*si];
             } else{
                 x2MS [*si] = x1MS [*si];
                 y2MS [*si] = y1MS [*si];
                 x1MS [*si] = xForceValueMS  [*si];
                 y1MS [*si] = measuredY      [*si];
             }

             if 		    ( searchMinPassedMS [*si] && searchMaxPassedMS [*si] ){           //  search failed
                 sitesToDisable += *si;
                 m_searchAlarmMS [*si]   = MIN_AND_MAX_PASSED;
             } else if  ( not(searchMinPassedMS [*si]) && not(searchMaxPassedMS [*si]) ){ //  search failed
                 sitesToDisable += *si;
                 m_searchAlarmMS [*si]   = MIN_AND_MAX_FAILED;
             } else {                                              // calc next xForceValue
                 num   = y2MS [*si] - y1MS [*si];       
                 dnum  = x2MS [*si] - x1MS [*si];
                 if ((num == 0.0) || (dnum == 0.0)){
                     sitesToDisable += *si;
                     m_searchAlarmMS   [*si]   = SLOPE_FAILED;
                 } else {
                     slope               = num/dnum;
                     b                   = ((y2MS [*si] + y1MS [*si]) - slope * (x2MS [*si] + x1MS [*si]))/2.;
                     xForceValueMS [*si] = (yTargetMS [*si] - b)/slope;
                 }
             }
         }
         else if   (abs(measuredY[*si]-yTargetMS [*si])>yToleranceMS [*si]){ // set up next search point
             if (measuredY[*si] > yTargetMS [*si]){
                 x2MS [*si] = xForceValueMS [*si];
                 y2MS [*si] = measuredY[*si];        
             }
             else{
                 x1MS [*si] = xForceValueMS  [*si];
                 y1MS [*si] = measuredY      [*si];
             }
             num   = y2MS [*si] - y1MS [*si];       
             dnum  = x2MS [*si] - x1MS [*si];
             if ((num == 0.0) || (dnum == 0.0)){
                 sitesToDisable += *si;
                 m_searchAlarmMS   [*si]   = SLOPE_FAILED;
             }
             else{
                 slope               = num/dnum;
                 b                   = ((y2MS [*si] + y1MS [*si]) - slope * (x2MS [*si] + x1MS [*si]))/2.;
                 xForceValueMS [*si] = (yTargetMS [*si] - b)/slope;
             }
         }
         else{												                   //SEARCH IS DONE
             //m_searchAlarmMS [*si]     = TARGET_FOUND;     // already set thus not needed
             sitesToDisable += *si;						//  exit
         }
     }
     m_searchIndex  	= m_searchIndex + 1;    
}

void    SearchMod::SASkipMMSearchNext   (FloatM measuredY ){

    static FloatM    x1MS;
    static FloatM    x2MS;
    static FloatM    y1MS;
    static FloatM    y2MS;
           double    num;
           double    dnum;
           double    slope;
           double    b;

     for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {

         if      (m_searchIndex == 0 ){          //  MID value was tested
             if ( abs(measuredY [*si] - yTargetMS [*si]) < yToleranceMS [*si] ){
                 sitesToDisable += *si;  //target found on first try
             } else {
                 x1MS [*si] = xForceValueMS  [*si];                       //save results
                 y1MS [*si] = measuredY      [*si];
                 
                 if (saSeededValue) {
                    // replicate value since we are skipping the index == 1 stuff below
                    // x1/y1 or x2/y2 will be replaced as appropriate during calculations 
                    // later, but we need the other to be this point
                    x2MS [*si] = xForceValueMS  [*si];      
                    y2MS [*si] = measuredY      [*si];
                    
                    b = y1MS[*si] - estimatedSlope * x1MS[*si];
                    xForceValueMS [*si] = (yTargetMS [*si] - b)/estimatedSlope;
                 } else {
 //                if (searchPositiveSlope ^ (measuredY[*si] > yTargetMS[*si])){
                    if (searchPositiveSlope != (measuredY[*si] > yTargetMS[*si])){      // != used as XOR
                        xForceValueMS     [*si] = xMaxMS [*si]; //set up for max value               		// set up for max value
                        searchMinPassedMS [*si] = true;
                        searchMaxPassedMS [*si] = false;              
                    } else{
                        xForceValueMS     [*si] = xMinMS [*si]; //set up for min value               		// set up for max value
                        searchMinPassedMS [*si] = false;
                        searchMaxPassedMS [*si] = true;                              
                    } 
                 }
             }
         } 
         else if (m_searchIndex == 1 && !saSeededValue){          //  max or nin value was tested

             if(searchPositiveSlope != (measuredY[*si] > yTargetMS[*si]))    searchMaxPassedMS [*si] = true;
             else                                                            searchMinPassedMS [*si] = true;

             if ( abs(measuredY [*si] - yTargetMS [*si]) < yToleranceMS [*si] ){
                 sitesToDisable += *si;  //target found on second try
             } else{
                 if (y1MS [*si] < measuredY      [*si]){   //save results
                     x2MS [*si] = xForceValueMS  [*si];
                     y2MS [*si] = measuredY      [*si];
                 } else{
                     x2MS [*si] = x1MS [*si];
                     y2MS [*si] = y1MS [*si];
                     x1MS [*si] = xForceValueMS  [*si];
                     y1MS [*si] = measuredY      [*si];
                 }
             }

             if 		( searchMinPassedMS [*si] && searchMaxPassedMS [*si] ){              //  search failed
                 sitesToDisable += *si;
                 m_searchAlarmMS [*si]   = MIN_AND_MAX_PASSED;
             } else if  ( not(searchMinPassedMS [*si]) && not(searchMaxPassedMS [*si]) ){ //  search failed
                 sitesToDisable += *si;
                 m_searchAlarmMS [*si]   = MIN_AND_MAX_FAILED;
             } else{                                              // calc next xForceValue
                 num   = y2MS [*si] - y1MS [*si];       
                 dnum  = x2MS [*si] - x1MS [*si];
                 if ((num == 0.0) || (dnum == 0.0)){
                     sitesToDisable += *si;
                     m_searchAlarmMS   [*si]   = SLOPE_FAILED;
                 } else{
                     slope               = num/dnum;
                     b                   = ((y2MS [*si] + y1MS [*si]) - slope * (x2MS [*si] + x1MS [*si]))/2.;
                     xForceValueMS [*si] = (yTargetMS [*si] - b)/slope;
                 }
             }
         }
         else if (abs(measuredY[*si]-yTargetMS [*si])>yToleranceMS [*si]){ 
             // set up next search point
             if (measuredY[*si] > yTargetMS [*si]){
                 x2MS [*si] = xForceValueMS [*si];
                 y2MS [*si] = measuredY[*si];        
             } else{
                 x1MS [*si] = xForceValueMS  [*si];
                 y1MS [*si] = measuredY      [*si];
             }
             
             num   = y2MS [*si] - y1MS [*si];       
             dnum  = x2MS [*si] - x1MS [*si];
             if ((num == 0.0) || (dnum == 0.0)){
                 sitesToDisable += *si;
                 m_searchAlarmMS [*si]   = SLOPE_FAILED;
             } else{
                 slope               = num/dnum;
                 b                   = ((y2MS [*si] + y1MS [*si]) - slope * (x2MS [*si] + x1MS [*si]))/2.;
                 xForceValueMS [*si] = (yTargetMS [*si] - b)/slope;
             }
         }
         else{												                   //SEARCH IS DONE
             //m_searchAlarmMS [*si]     = TARGET_FOUND;     // already set thus not needed
             sitesToDisable += *si ; 						//  exit
         }
     }
     m_searchIndex  	= m_searchIndex + 1;
}

//void    SearchMod::SearchNext           (float  measuredY ){
//
//    if (m_searchIndex >= m_searchMaxIndex) {
//      m_searchAlarmMS = TARGET_NOT_FOUND;
//      searchNotDone = false;
//    }
//    else {
//    //SET NEXT SEARCH VALUE
//       switch (m_searchType){
//           case (SEARCH_LINEAR):
//               LinearSearchNext    ( measuredY );
//               break;
//           case (SEARCH_BIN):
//               BinarySearchNext    ( measuredY );
//               break;
//           case (SEARCH_SA):
//               SASearchNext        ( measuredY );
//               break;
//   //        case (SEARCH_SA_SMM):
//   //            SASkipMMSearchNext  ( measuredY );
//   //            break;
//           default:
//               cout<<left<< setw(15)<<"MOO m_searchType";
//               searchNotDone   = false ;
//               break;
//       }
//    }
//}
void    SearchMod::SearchNext           (FloatM measuredY ){

    bool any_site_active = true;
    
    // DEBUG PRINT AND PLOT
    DbgPrintSrchStep    ( measuredY );

    sitesToDisable = NO_SITES;
    
    if (m_searchIndex >= m_searchMaxIndex) {
      m_searchAlarmMS = TARGET_NOT_FOUND;
      searchNotDone = false;
    }
    else {
       //SET NEXT SEARCH VALUE
       switch (m_searchType){
           case (SEARCH_LINEAR_MS):
               LinearSearchNext    ( measuredY );
               break;
           case (SEARCH_BIN_MS):
               BinarySearchNext    ( measuredY );
               break;
           case (SEARCH_SA_MS):
               SASearchNext        ( measuredY );
               break;
           case (SEARCH_SA_SMM_MS):
               SASkipMMSearchNext  ( measuredY );
               break;
           default:
               cout<< setw(15)<<"MOO m_searchType ";
               cout<< m_searchType << endl;
               searchNotDone   = false ;
               break;
       }
    }

//    DbgPrintSrchResult  ( measuredY );

    // RunTime.SetActiveSites does not allow you to turn off all 
    // sites. So, we use the created SetActiveSites which tells 
    // us if we should have no active sites.
    if (!sitesToDisable.Begin().End()) // sitesToDisable isn't empty
       any_site_active = SetActiveSites(ActiveSites - sitesToDisable);

    // if no ActiveSites or done, we are done - reactivate sites, set NotDone and plot, if necessary
    if (!any_site_active || !searchNotDone) {
       RunTime.SetActiveSites(searchSites);
       searchNotDone = false;
//       if (m_searchDebugMode>0) {
//          // plot data at end of search
//          DbgPlotEnd         ( xForceValueMS, measuredY, dbgXMSa, dbgYMSa, dbgXYMSa); 
//       }
    }
}
///////////////////////////////////////////////////////////////////////////////////////
void    SearchMod::SetSMPipeDebug       (BoolS      smPipeDebug){
    m_smPipeDebug = smPipeDebug;
//    m_smPipeDebug = true; //TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
}
void    SearchMod::WriteToSMPipe        (StringS    PipeString){

    // for debug
    if (m_smPipeDebug){cout << "gnuplot> " << PipeString ;}
    
    // send to gnuplot pipe
    fprintf (GNUPlotPipe, "%s", (const char *) PipeString );
//    fflush  (GNUPlotPipe);

}


void    SearchMod::SetSearchModDebugMode(int        searchDebugMode_opVar){
    m_searchDebugMode = searchDebugMode_opVar;
//    m_searchDebugMode = 0; //TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
}


bool    SearchMod::GetSearchNotDone     (){
    return (searchNotDone);
}
bool    SearchMod::GetSearchIndex       (){
    return (m_searchIndex);
}


void    SearchMod::SetPlotPath          (StringS    plotDirPath){

    // plotDirPath is the directory where to save gnuplot data
    if (plotDirPath.Length()==0){m_plotPath = "/tmp/";}
    else                        {m_plotPath = plotDirPath;}

    StringS     plotStr;        

    plotStr  = "cd '"+ m_plotPath + "' \n";   // cd to dir where the data is stored
    WriteToSMPipe         (plotStr);
    plotStr  = "\n";   // blank line
    WriteToSMPipe         (plotStr);

}

void    SearchMod::SetLineStyle         (StringS    lineStyle){
    m_lineStyle = lineStyle;  // "w l" , "w p", "w lp" 
}

void    SearchMod::SetPersistenceOn     (bool       persistenceOn ){

    if (persistenceOn)  { m_persistenceOnLast = m_persistenceOn; m_persistenceOn     = persistenceOn; }
    else                { m_persistenceOnLast = false          ; m_persistenceOn     = persistenceOn; }
    
}
void    SearchMod::PlotTarget           (bool       plotTarget ){
    m_plotTarget = plotTarget;
}

///////////////////////////////////////////////////////////////////////////////////////
void    SearchMod::DbgPrintSrchStep     (FloatM measuredY ){


    // DEBUG PRINT AND PLOT
    if (m_searchDebugMode>0){
        dbgXMSa.SetValue( m_searchIndex , xForceValueMS );
        dbgYMSa.SetValue( m_searchIndex , measuredY );

        if (true){ //TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
            // print header        
            if (searchDbgPrintHeader){
                // create "-*-" string
                StringS sStr="----";  // for "Step"
                for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si){
                    sStr=sStr+"----------"+"----------"+"----------";
                }   

                IO.Print(IO.Stdout, "%s\n"   , sStr );
                IO.Print(IO.Stdout, "%4s" , StringS("Step"));

                for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si){
                    IO.Print(IO.Stdout," forceX_S%d",IntS( *si ) );
                }   
                for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si){
                    IO.Print(IO.Stdout,"   msrY_S%d",IntS( *si ) );
                }
                for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si){
                    IO.Print(IO.Stdout," errorY_S%d",IntS( *si ) );
                }
                IO.Print(IO.Stdout, "\n%s\n" , sStr );

                searchDbgPrintHeader = false;        
            }

            // print search data        
            IO.Print(IO.Stdout, "%3d %9.3f %9.3f %9.3f\n" 
                ,IntS(m_searchIndex) 
                ,xForceValueMS
                ,measuredY
                ,(yTargetMS-measuredY)
                );
        }             
    }
}
void    SearchMod::DbgPrintSrchResult   (FloatM measuredY ){

    if ((m_searchDebugMode>0) && !searchNotDone){
        switch (m_searchType){
            case (SEARCH_LINEAR_MS):
                m_searchTypeStr = "SEARCH_LINEAR_MS   ";
                break;
            case (SEARCH_BIN_MS):
                m_searchTypeStr = "SEARCH_BIN_MS      ";
                break;
            case (SEARCH_SA_MS):
                m_searchTypeStr = "SEARCH_SA_MS       ";
                break;
            case (SEARCH_SA_SMM_MS):
                m_searchTypeStr = "SEARCH_SA_SMM_MS   ";
                break;
            default:
                cout<<left<< setw(15)<<"MOO m_searchType";
                break;
        }
    
        StringS sStr="----";  
        for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si){
            sStr=sStr+"----------"+"----------"+"----------";
        }   
        IO.Print(IO.Stdout, "%s\n"  , sStr );
        
        IO.Print(IO.Stdout, "%-19s" , m_searchTypeStr);
        for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si){
            IO.Print(IO.Stdout,"        S%d",IntS( *si ) );
        }   
        IO.Print(IO.Stdout, "\n");
        
        //                   12345678901234567890
        IO.Print(IO.Stdout, " From               %9.3f\n"   , xMinMS);
        IO.Print(IO.Stdout, " To                 %9.3f\n"   , xMaxMS);
        IO.Print(IO.Stdout, " Target             %9.3f\n"   , yTargetMS);
        IO.Print(IO.Stdout, " Tolerance          %9.3f\n"   , yToleranceMS);
        IO.Print(IO.Stdout, "  FinalX            %9.3f\n"   , xForceValueMS);
        IO.Print(IO.Stdout, "  FinalY            %9.3f\n"   , measuredY);
        IO.Print(IO.Stdout, "  ErrorY            %9.3f\n"   , (yTargetMS-measuredY));

//        Deactivating sites to do searchNotDoneMS...could check if the site is in 
//        sitesToDeactivate, I guess, to tell when it's done...
//        IO.Print(IO.Stdout, "   searchNotDoneMS  %10d\n" , searchNotDoneMS );
        IO.Print(IO.Stdout, "   m_searchAlarmMS    %10d\n" , m_searchAlarmMS   );
        IO.Print(IO.Stdout, "%s\n"   , sStr );


        TIME.Wait(0.);

    }
}

void    SearchMod::SaveData             (StringS filePathName , FloatM1D xMSa, FloatM1D yMSa ){

//    cout << "saving file    " << filePath  << " ... ";


    // write or append current data to plotFile
    //----------------------------------------------------    
    ofstream    plotFile;

    if(m_persistenceOnLast)    { plotFile.open (filePathName , ios::app ); }  // append to data file
    else                       { plotFile.open (filePathName );            }  // write  to data file
    
    if(plotFile){
    
        UnsignedS   aSize       = xMSa.GetSize();
        unsigned    FW          = 10;               // field width for cout
        BoolS       printHdr    = true;

        plotFile << fixed << setprecision(3) << right;  //set fixed floating mode, precision and right justify  

        for (UnsignedS lineI = 0; lineI<aSize; ++lineI){
            if(printHdr){
                plotFile   
                    <<right<<setw(FW)<< "# xData"    
                    <<right<<setw(FW)<< "yData"    
                << endl;
                printHdr = false;   
            }
                plotFile 
                    <<right<<setw(FW)<< xMSa   [lineI]    
                    <<right<<setw(FW)<< yMSa   [lineI]    
                << endl;
        }       
        plotFile << endl; // add separator       
        plotFile.close();
//        cout << " DONE " <<endl; 
    }else{
        cout << " !!! could not open " << filePathName << " file for write !!!" << endl;  
    } //plotFile


    // write current data to plotFileLAST 
    //----------------------------------------------------        
    if(m_persistenceOn){
    
        ofstream    plotFile (filePathName + "Last");
       
        if(plotFile){
        
            UnsignedS   aSize       = xMSa.GetSize();
            unsigned    FW          = 10;               // field width for cout
            BoolS       printHdr    = true;

            plotFile << fixed << setprecision(3) << right;  //set fixed floating mode, precision and right justify  

            for (UnsignedS lineI = 0; lineI<aSize; ++lineI){
                if(printHdr){
                    plotFile   
                        <<right<<setw(FW)<< "# xData"    
                        <<right<<setw(FW)<< "yData"    
                    << endl;
                    printHdr = false;   
                }
                    plotFile 
                        <<right<<setw(FW)<< xMSa   [lineI]    
                        <<right<<setw(FW)<< yMSa   [lineI]    
                    << endl;
            }
            
            plotFile.close();

        }else{
            cout << " !!! could not open " << filePathName + "Last" << " file for write !!!" << endl;  
        } //plotFile
         
    } //m_persistence

    m_persistenceOnLast = m_persistenceOn; // set persistance for next run  

}



void    SearchMod::DbgPlotEnd           (FloatM xMS, FloatM yMS, FloatM1D &xMSa, FloatM1D &yMSa, FloatM1D &xyMSa){

    //set search pointer array
    ptr_xy_MSa.SetValue( 0 , xMS );
    ptr_xy_MSa.SetValue( 1 , yMS );
    
    UnsignedS   aSize = xMSa.GetSize();

    if (aSize>m_searchIndex){
        for (int ii = m_searchIndex; ii<int(aSize) ; ++ii){
//            cout<< m_searchIndex << "\t" << ii<<endl;

            xMSa.SetValue( ii , xMS );
            yMSa.SetValue( ii , yMS );      
        }    
    }

    
    // create xy plot array
    VP.Pick ( xMSa , 0 , 1 , xyMSa , 0, 2, aSize );
    VP.Pick ( yMSa , 0 , 1 , xyMSa , 1, 2, aSize );

    TIME.Wait(0.);  // trap here and add xMSa or yMSa or xyMSa plot to sd


    // save search for gnuplot
    SaveData( m_plotPath + m_plotFileName   , xMSa.Slice(0,m_searchIndex) , yMSa.Slice(0,m_searchIndex) );


    //----------------------------------------------------
    // create GnuPlot command
    //----------------------------------------------------

    StringS     plotStr;        

    plotStr  = "clear ;    \n";
    plotStr += "         set grid ; \n";    
    plotStr += "         set title  \"" + m_searchTypeStr + "\"; \n";   
    plotStr += "         set xlabel \"ForcedValue\" ; \n";   
    plotStr += "         set ylabel \"MeasuredValue\" \n";   
    WriteToSMPipe         (plotStr);


//-----------------------------------------
//g(x)=a
//plot a=1,g(x) w p  lc a pt 1 , \
//     a=2,g(x) w p  lc a pt 1 , \
//     a=3,g(x) w p  lc a pt 1 , \
//     a=4,g(x) w p  lc a pt 6 


//    //----------------------------------------------------
//    // try gnuplot featured do not delete
//    //----------------------------------------------------
//    IntS    tI = 0;
//    IntS    loopN = 3;
//    FloatS  fracColor = 0;
//    IntS    rgbColor  = 0;
//
//    plotStr = ""; // clear plot command
//    plotStr += "g(x)=a; a=-4 \n " ;
//    plotStr += "plot [0:10] [] a  w l  lc 1 \\\n";
//
//    for (IntS loopI = 0; loopI<=loopN; loopI++) {
//
//        fracColor   = 1.*loopI/loopN;
//        rgbColor    = loopI;
//
//        plotStr += " , \"<echo ' 1 " + loopI.GetText() + "'\"   notitle  w p   lc " + loopI.GetText() + " pt 6  ps 3";
//        plotStr += "  \\\n";    //   \ and new line
//
//        plotStr += " , \"<echo ' 2 " + loopI.GetText() + "'\"   notitle  w p   lc palette frac " + fracColor.GetText()  + " pt 7  ps 3";
//        plotStr += "  \\\n";    //   \ and new line
//
//        plotStr += " , \"<echo ' 3 " + loopI.GetText() + "'\"   notitle  w p   lc 1   pt " + loopI.GetText() + " ps 3";
//        plotStr += "  \\\n";    //   \ and new line
//
//        plotStr += " , \"<echo ' 4 " + loopI.GetText() + "'\"   notitle  w p   lc 1   pt 6   ps " + loopI.GetText() ;
//        plotStr += "  \\\n";    //   \ and new line
//
////        plotStr += " , \"<echo ' 5 " + loopI.GetText() + "'\"   notitle  w p   lc rgb #00000" + rgbColor.GetText()  + " pt 7  ps 3";
////        plotStr += "  \\\n";    //   \ and new line
//
//    }
//    plotStr += "\n\n";
//    WriteToSMPipe         (plotStr);  // send to gnuplot
//
//    fflush  (GNUPlotPipe);
//   
//    plotStr = ""; // clear plot command
//    
//    
//return; //TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT


    //----------------------------------------------------
    // plot search data
    //----------------------------------------------------
    int     nLoadedSites    = LoadedSites.GetNumSites();
    int     nActiveSites    = ActiveSites.GetNumSites();

    IntS    sI;
    IntS    xI;
    IntS    yI;
    IntS    nSites      = nActiveSites;
    BoolS   firstSite   = true;
    xI      = 0 ;                 // init x data column

    plotStr = "";    // clear plot command
    for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
    
        sI = IntS(si.GetValue()); // get integer value of site
        xI++ ;                    // x data column
        yI = xI + nSites;         // y data column

        if (firstSite){plotStr += "plot [] [] \"" + m_plotFileName + "\" " ; firstSite = false;}  //set file name
        else          {plotStr += "                  , \"\"              " ;}               //use the same file  
              
        plotStr += " u " + xI.GetText() + ":" + yI.GetText() ;  // " u <siteN X>:<siteN Y> "

        if(m_persistenceOn)    {
            plotStr += " notitle         "; // no title,
            plotStr += " w l  lt " + sI.GetText() + " lw 1 ";    // w l lt<siteN> lw 1
            plotStr += " \\\n";    // \ and new line
        }else{
            plotStr += " title \"Site" + sI.GetText() + " \" ";          // set title " title "SiteXX "
            if (m_lineStyle=="w l"){ plotStr += "w l  lc " + sI.GetText()           ;}   // set  " w l  lc Sn        "
            else                   { plotStr += "w p  lc " + sI.GetText() + " pt 1 ";}   // set  " w p  lc Sn   pt 1 "
            
            plotStr += " \\\n";    // \ and new line
        }
    }

    //-----------------------------------------------------------
    // mark last data data point
    //-----------------------------------------------------------
    // , "<echo '-38.8939 -508.515'"   notitle  w p   lc 1 pt 6  ps 3 \

    xI          = 0 ;                 // init x data column
    firstSite   = true;
    for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
        sI = IntS(si.GetValue()); // get integer value of site

        FloatS xFinal = xMS    [*si];
        FloatS yFinal = yMS    [*si];           
                //   , "<echo 'xFinal yFinal'"   notitle  w p   lc SI pt 6  ps 3 
        plotStr += "         , \"<echo '" + xFinal.GetText() +" "+ yFinal.GetText() + "'\"   notitle  w p   lc " + sI.GetText() + " pt 6  ps 3";
        plotStr += " \\\n";    //   \ and new line
    }
        
    //-----------------------------------------------------------
    // add current data if m_persistenceOn
    //-----------------------------------------------------------
    if(m_persistenceOn)    {
        xI          = 0 ;                 // init x data column
        firstSite   = true;
        for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si) {
        
            sI = IntS(si.GetValue()); // get integer value of site
            xI++ ;                    // x data column
            yI = xI + nSites;         // y data column

            if (firstSite){plotStr += "         , \""  + m_plotFileName + "Last"+"\"" ;firstSite = false;} //set file name               
            else          {plotStr += "         , \"\" " ;}                                                    //use the same file

            plotStr += " u " + xI.GetText() + ":" + yI.GetText() ;  // " u <siteN X>:<siteN Y> "
            plotStr += " title \"site " + sI.GetText() + " \" ";
 //           plotStr += m_lineStyle + " lt " + sI.GetText() + " lw 2 ";
            plotStr += " w p lt " + sI.GetText() + " lw 2 ";
            plotStr += " \\\n";    //   \ and new line
        }
    } //m_persistenceOn

    //-----------------------------------------------------------
    // add target
    //-----------------------------------------------------------
    if(m_plotTarget){
        SiteIter si = ActiveSites.Begin();
        
        FloatS ll;
        FloatS ul;

        switch (m_searchType){
//            case (SEARCH_BIN):
//                ll = yTarget;
//                plotStr += "         , ";
//                plotStr += " ll(x) =  " + ll.GetText() + " , ";
//                plotStr += " ll(x) title \"Target\"  w l   lc 1 lw 1  , " ;
//                plotStr += " \\\n";    //   \ and new line
//                break;
            case (SEARCH_BIN_MS):
                ll = yTargetMS[*si] - yToleranceMS[*si];
                plotStr += "         , ";
                plotStr += " ll(x) =  " + ll.GetText() + " , ";
                plotStr += " ll(x) title \"Target\"  w l   lc 1 lw 1   " ;
                plotStr += " \\\n";    //   \ and new line
                break;
            default:
                ll = yTargetMS[*si] - yToleranceMS[*si];
                ul = yTargetMS[*si] + yToleranceMS[*si];
                plotStr += "         ,";
                plotStr += " ll(x) =  " + ll.GetText() + " ,";
                plotStr += " ul(x) =  " + ul.GetText() + "  \\\n";
                plotStr += "         , ll(x) title   \"Target\"  w l   lc 1 lw 1  \\\n" ;
                plotStr += "         , ul(x) notitle           w l   lc 1 lw 1  \\\n" ;
 //               plotStr += " \\\n";    //   \ and new line
                break;
        }

    }



    //-----------------------------------------------------------

    plotStr += "\n\n";
    WriteToSMPipe         (plotStr);  // send to gnuplot

    fflush  (GNUPlotPipe);




    TIME.Wait(0.);  // trap here and see gnuplot

}

void    SearchMod::StartGnuPlot (){
//------------------------------------------------------------------------------------------------

    //-------------------------------------
    // start gnuplot
    //-------------------------------------
            StringS     gnuPlotPath ;    
            StringS     plotStr;        
    static  BoolS       startGplot = true; 

    if (opendir ("/opt/RFTOOLS") != NULL){gnuPlotPath = "/opt/RFTOOLS/bin/gnuplot";}
    else                                 {gnuPlotPath = "/usr/bin/gnuplot        ";}

    if (startGplot){
        GNUPlotPipe = popen(gnuPlotPath + " -background white \n" , "w" );       
   //("gnuplot -xrm 'gnuplot*background: black \n");

//      plotStr  = "set terminal wxt  \n";
        plotStr  = "set terminal X11 title \"SearchMod\"  position 950,450 noraise \n";
        WriteToSMPipe         (plotStr);

        plotStr  = "cd '"+ m_plotPath + "' \n";   // cd to dir where the data is stored
        WriteToSMPipe         (plotStr);

        plotStr  = "\n";   // blank line
        WriteToSMPipe         (plotStr);
        startGplot = false; 
    }



}


void    SearchMod::ResizeDebugArrays               (unsigned maxSteps ){

    dbgErrMSa.Resize( maxSteps  , SV_CONTENT_LOSE); 
    dbgXMSa.Resize  ( maxSteps  , SV_CONTENT_LOSE);  
    dbgYMSa.Resize  ( maxSteps  , SV_CONTENT_LOSE); 
    dbgXYMSa.Resize ( maxSteps*2, SV_CONTENT_LOSE); 
}

