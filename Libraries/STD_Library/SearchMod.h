#ifndef SEARCHMOD_H_
#define SEARCHMOD_H_

#include <Unison.h>
#include <fstream>      // for file io

////////////////////////////////////////////////////////////////////////////////
/*

    SEARCHM.SetSearchModDebug   ( GetBoolOpVar("SearchModDebug") );     // turn on/off search debug from opTool

    SEARCHM.LinearSearchBegin   ( startX , stopX , stepSizeX , targetY , toleranceY );
// OR    
    SEARCHM.SASearchBegin       ( startX , stopX , toleranceY, targetY );
//  SEARCHM.SkipMinMax          (	true );                               //start search in middle of range
// OR    
    SEARCHM.BinarySearchBegin   ( startX , stopX , toleranceX, targetY );

    while (SEARCHM.searchNotDone){

        // apply SEARCHM.xForceValueMS to DUT
        // measure/simulate device output into measured_MS
        measured_MS = 5.0 * SEARCHM.xForceValueMS  + 20.;

        SEARCHM.SearchNext      ( measured_MS );
    }
*/
////////////////////////////////////////////////////////////////////////////////


class SearchMod {
public:

    bool    searchNotDone; 
    FloatM  xForceValueMS;

    //---------------------------------------------------------------------------------
             SearchMod();
    virtual ~SearchMod();
    
    void    SetSearchModDebugMode   ( int    searchDebugMode_opVar);
    
    bool    LinearSearchBegin       ( float  startX, float  stopX, float  stepSizeX , float  targetY, float  toleranceY, unsigned maxSteps=100);
    bool    LinearSearchBegin       ( FloatM startX, FloatM stopX, FloatM stepSizeX , FloatM targetY, FloatM toleranceY, unsigned maxSteps=100);

    bool    BinarySearchBegin       ( float  startX, float  stopX, float  toleranceX, float  targetY, unsigned maxSteps=20 );
    bool    BinarySearchBegin       ( FloatM startX, FloatM stopX, FloatM toleranceX, FloatM targetY, unsigned maxSteps=20 );

    bool    SASearchBegin           ( float  startX, float  stopX, float  toleranceY, float  targetY, unsigned maxSteps=30 );
    bool    SASearchBegin           ( FloatM startX, FloatM stopX, FloatM toleranceY, FloatM targetY, unsigned maxSteps=30 );

    void    SkipMinMax              (	bool    slopeIsPositive );

    void    SearchNext              ( float  measuredY );
    void    SearchNext              ( FloatM measuredY );

    bool    GetSearchNotDone        ();
    bool    GetSearchIndex          ();

    void    SetPersistenceOn        ( bool      persistenceOn   = true );
    void    PlotTarget              ( bool      plotTarget      = true );

    void    SetPlotPath             ( StringS   plotDirPath );
    void    SetLineStyle            ( StringS   lineStyle       = "w lp");

    void    SetSMPipeDebug          ( BoolS     smPipeDebug);
    void    WriteToSMPipe           ( StringS   PipeString);


    //---------------------------------------------------------------------------------

// variables
public:
    


    enum searchTypeEnum {
        SEARCH_BIN                      , 
        SEARCH_BIN_BOOLEAN              , 
        SEARCH_LINEAR                   , 
        SEARCH_SA                       , 
        SEARCH_NOTCH                    , 

        SEARCH_BIN_MS                   , 
        SEARCH_LINEAR_MS                , 
        SEARCH_SA_MS                    , 
        SEARCH_SA_SMM_MS                , 
        SEARCH_SC_MS                    , 
        SEARCH_RF_MS                    , 
        SEARCH_MRF_MS                   , 
    };

    enum searchResultEnum {
        TARGET_FOUND                    ,
        MIN_AND_MAX_PASSED              ,
        MIN_AND_MAX_FAILED              ,
        TARGET_NOT_FOUND                ,
        SLOPE_FAILED                    ,
        MIN_FAILED                      ,
        MAX_FAILED                      ,
    };

   FloatM1D    dbgErrMSa  ;  // common to all SearchMod classes
   FloatM1D    dbgXMSa    ;
   FloatM1D    dbgYMSa    ;
   FloatM1D    dbgXYMSa   ;


   FloatM1D    ptr_x_MSa;
   FloatM1D    ptr_y_MSa;
   FloatM1D    ptr_xy_MSa;

private:

    void    LinearSearchNext        ( float  measuredY );
    void    LinearSearchNext        ( FloatM measuredY );
    void    BinarySearchNext        ( float  measuredY );
    void    BinarySearchNext        ( FloatM measuredY );
    void    SASearchNext            ( float  measuredY );  
    void    SASearchNext            ( FloatM measuredY );  
    void    SASkipMMSearchNext      ( FloatM measuredY );

    //---------------------------------------------------------------------------------
    void    DbgPrintSrchStep    ( FloatM measuredY );
    void    DbgPrintSrchResult  ( FloatM measuredY );    
    void    DbgPlotEnd          ( FloatM xMS, FloatM yMS, FloatM1D &xMSa, FloatM1D &yMSa, FloatM1D &xyMSa);    
    void    SaveData            ( StringS filePath      , FloatM1D xMSa, FloatM1D yMSa );
    void    StartGnuPlot        ();

    void    ResizeDebugArrays(unsigned maxSteps );

    //---------------------------------------------------------------------------------
    FILE    *GNUPlotPipe;
    StringS m_plotPath;
    StringS m_plotFileName;
    BoolS   m_smPipeDebug;

    bool    m_persistenceOn;
    bool    m_persistenceOnLast;
    IntS    m_persistenceOnCount;

    bool    m_plotTarget;
    StringS m_lineStyle;


    int     m_searchType;
    StringS m_searchTypeStr;
    int     m_searchIndex;
    int     m_searchMaxIndex;
    int     m_searchAlarm;

    int     m_searchDebugMode;

//    BoolM   searchNotDoneMS;

    IntM    m_searchIndexMS;
    IntM    m_searchAlarmMS;


//    bool    searchDebugEnable;				        //set true to collect search data in display arrays at the end of the search process
    bool    searchInteractiveDebugEnable;	    //set true to collect search data in display arrays at each step of search process
    bool    searchDbgPrintHeader;             //set true to print search results if search_debug_enable OR search_interactive_debug_enable are true

    bool    search_debug_print;               //set true to print search results if search_debug_enable OR search_interactive_debug_enable are true
    bool    search_print_n_steps;             //set true to print number of search steps
    bool    search_print_alarms;              //set true to print search alarms


    bool    searchMinPassed;
    bool    searchMaxPassed;

    BoolM   searchMinPassedMS;
    BoolM   searchMaxPassedMS;

    bool    searchSkipMinMax;
    bool    searchPositiveSlope;

    float   xMin;
    float   xMax;
    float   xStep;
    float   xForceValue;
    float   xTolerance;

    float   yTarget;
    float   yTolerance;
    
    FloatM  xMinMS;
    FloatM  xMaxMS;
    FloatM  xStepMS;
    FloatM  xToleranceMS;

    FloatM  yTargetMS;
    FloatM  yToleranceMS;
    
    Sites searchSites;
    Sites sitesToDisable;


};  // needs ";" at end of class

#endif /* SEARCHMOD_H_ */
