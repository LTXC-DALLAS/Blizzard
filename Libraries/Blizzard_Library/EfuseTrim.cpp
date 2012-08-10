//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                    EfuseTrim.cpp                                         //
//                                                                                          //
//  This is the implementation file.                                                        //
//                                                                                          //
//  Put comments about the method here.                                                     //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////
//                                     Revision History                                     //
//////////////////////////////////////////////////////////////////////////////////////////////
//  xxxx-xx-xx v1.0    : xxx    initial release                                             //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////

#if 0

#include "EfuseTrim.h"
#include <iomanip>
#include <std_vi.h>
#include <TestwareSupport.h>

using namespace std;

// below is a macro, so no semicolon
TMFAMILY_CLASS(EfuseTrim)

TM_RETURN EfuseTrim::Execute() {
   Profile_On(Debug, true);
   Profile_On(Debug, "Entering EfuseTrim Execute ");
         
   TMResultM test_result(TM_NOTEST);
   TMResultM alarm_result;
   TMResultM post_trim_result;
   StringS dlog_prefix = PostTrimLimits.GetName();
   BoolM efuse_burnt;

   if (RunTime.ResetPressed()) {
      SetResult(test_result);
      return TM_HAS_RESULT;
   }
   
   // put setup code here
   efuse_burnt = CheckEfuseTrimBurnt();

   if (TrimLevels.Valid())
      TrimLevels.Execute();

   ConnectMeasInstrument();

   DEBUG.Breakpoint("AfterSetup",(StringS)FormatBreakpointMessage(RunTime.GetActiveTest().GetName(),
                                                       "AfterSetup", "EfuseTrim","",UTL_VOID));

   if (RunTime.ResetPressed()) {
       SetResult(test_result);
       return (TM_HAS_RESULT);
   }

   if (Characterize) {
      ProfileOn(Debug, "Entering Characterize ");

      FloatM1D trim_curve(v_num_codes);      
      
      for (int i = 0; i < v_num_codes; ++i) {
         LoadTrimCode(i);
         
         TIME.Wait(SettlingTime);
         ProfileOn(Debug, "Pre-Measure ");
         meas_val = MeasureValue();
         ProfileOn(Debug, "Measure executed in: ");
         trim_curve.SetValue(i, meas_val);
      }
      
      TrimCode = PickBestCode(trim_curve, TrimTarget);
      ProfileOn(Debug, "Exiting Characterize ");
      
   } else {
      ProfileOn(Debug, "Entering Trim ");
      SearchMod this_search = GenerateSearchMod();
      
      IntM trim_val;
      StringS twstring;
      int i = 0;

      // Perform Trim Search
      while (this_search.searchNotDone) {
         for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
            trim_val[*si] = v_trim_lookup_table[MATH.LegacyRound(this_search.xForceValueMS)];
         
         LoadTrimCode(trim_val);
         
         TIME.Wait(SettlingTime);
         ProfileOn(Debug, "Pre-Measure ");
         meas_val = MeasureValue();
         ProfileOn(Debug, "Measure executed in: ");
         
         // Datalog Soft trim measurement and soft trim code used, but don't worry about 
         // failing values
         twstring = dlog_prefix + "_SOFT_" + i;
         TIDlog.Value(meas_val, MeasPin, PostTrimLimits.GetLowLimit(), PostTrimLimits.GetHighLimit(), PostTrimLimits.GetUnits(),
                      twstring, UTL_VOID, UTL_VOID, true, TWMinimumData);
         
         twstring += "_CODE";
         TIDlog.Value(trim_val, MeasPin, min_code, max_code, "", twstring, UTL_VOID, UTL_VOID, true, TWMinimumData);
         
         // prepare for next loop
         ++i;
         this_search.SearchNext(meas_val);
      }
      
      // get final trim code
      for (SiteIter si = ActiveSites.Begin(); !si.End(); ++si)
         TrimCode[*si] = v_trim_lookup_table[MATH.LegacyRound(this_search.xForceValueMS)];
         
      // test for any trim alarms, save off result
      twstring = dlog_prefix + "_Alarms";
      alarm_result = TIDlog.Value(this_search.m_searchAlarmMS, MeasPin, SearchMod::TARGET_FOUND, SearchMod::TARGET_FOUND, 
                                 "", twstring, UTL_VOID, UTL_VOID, true, TWMinimumData);
                   
      ProfileOn(Debug, "Exiting Trim ");      
   }
   
   LoadTrimCode(TrimCode);
   TIME.Wait(SettlingTime);
   meas_val = MeasureValue();

   // Datalog post trim measurement and final trim code
   post_trim_result = TIDlog.ValueLS(meas_val, MeasPin, PostTrimLimits, true, TWMinimumData);
   twstring = dlog_prefix + "_SOLN";
   TIDlog.Value(TrimCode, MeasPin, v_min_code, v_max_code, "", twstring, UTL_VOID, UTL_VOID, true, TWMinimumData);

   ProfileOn(Debug, "Completed Post Measure ");
   
   DisconnectMeasInstrument();
   
   ProfileOn(Debug, "Completed Cleanup ");
   
   ProfileOn(Debug, false);

   SetResult(test_result);
   return TM_HAS_RESULT;
}

// Send a message and time stamps to dataviewer
void EfuseTrim::ProfileOn(const BoolS &enable, const StringS &message) {   
   if (enable) {
      FloatS timestamp = TIME.GetTimer();
      cout << message << setw(24) << "timestamp " << timestamp << endl;
      cout << message << setw(24) << "delta from last stamp " (timestamp - v_prev_timer) << endl;
      prev_time = timestamp;
   }
}

// If startTimer is true, the Timer is started. If false, the timer is stopped 
// and total elapsed time from start is reported.
void EfuseTrim::ProfileOn(const BoolS &enable, const bool startTimer) {
   if (enable) {
      if (startTimer) {
         v_prev_timer = 0.;
         TIME.StartTimer();
      } else {
         cout << "Total time: " << TIME.StopTimer();
      }
   }
}

// Checks if the trim fuses are already burnt in the fuse ROM
BoolM EfuseTrim::CheckEfuseTrimBurnt() {
   StringS dlog_string;
   StringS zero_string;
   StringM read_string;
   TMResultM read_results;
   BoolM device_burnt;
   
   for (int i = 0; i < NumTrimBits; ++i)
      zero_string += "0";
   
   if (EfuseReadLevels.Valid())
      EfuseReadLevels.Execute();
   
   ReadFuseRom(EfuseCodeOption, EfuseType, Mg1B, zero_string, read_string, read_results);
   
   // Datalog (don't care about results) read_results - not to TW
   dlog_string = RunTime.GetActiveTest() + "_ReadFuse";
   TIDlog.TestTMResult(read_results, UTL_VOID, dlog_string, UTL_VOID, UTL_VOID, false, TWMinimumData);
   
   device_burnt = read_string.NotEqual(zero_string);
   dlog_string = RunTime.GetActiveTest() + "_TrimDev";
   TIDlog.TestBool(device_burnt, UTL_VOID, dlog_string, UTL_VOID, UTL_VOID, false, TWMinimumData);
   
   return (device_burnt);
}

// Connects the appropriate measure instrument if not connected on test entry
void EfuseTrim::ConnectMeasInstrument() {
   switch (TrimType) {
      case TRIM_VI:
         v_meas_prev_connected = STDGetConnect(MeasPin);
         break;
      case TRIM_FREQ:
         // Freq will use digital TMU, so check DCL
         v_meas_prev_connected = STDGetConnect(MeasPin, true);
         break;
      default:
         v_meas_prev_connected = STDGetConnect(MeasPin);
         break;
   }
   
   if (!v_meas_prev_connected) {
      switch (TrimType) {
         case TRIM_VI:
            VI.Connect(MeasPin, VI_TO_DUT, VI_MODE_REMOTE);
            break;
         case TRIM_FREQ:
            // need to connect DCL
            DIGITAL.Connect(MeasPin, DIGITAL_DCL_TO_DUT);
            break;
         default:
            VI.Connect(MeasPin, VI_TO_DUT, VI_MODE_REMOTE);
            break;
      }
   }
}

// Disconnect the measure instrument if it wasn't connected on test entry
void EfuseTrim::DisconnectMeasInstrument() {
   // only disconnect if we were not connected when entering this method
   // This way we put things back the way we found them.
   if (!v_meas_prev_connected) {
      switch (TrimType) {
         case TRIM_VI:
            // Gate off before disconnecting
            VI.Gate(MeasPin, VI_GATE_OFF_LOZ);
            VI.Disconnect(MeasPin);
            break;
         case TRIM_FREQ:
            DIGITAL.Disconnect(MeasPin, DIGITAL_DCL_TO_DUT);
            break;
         default:
            VI.Gate(MeasPin, VI_GATE_OFF_LOZ);
            VI.Disconnect(MeasPin);
            break;
      }
   }
}

// Load the trim code into the device
void EfuseTrim::LoadTrimCode(const IntM &trimCode) {

   
}


BoolM EfuseTrim::ParamCheck() {
   StringS error_message;
   BoolM param_check_status(true);

   // put in checks, using ERR.ReportError to report errors

   return (param_check_status);
}

BoolM EfuseTrim::Initialize() {
   BoolM init_status(true);
   int j, i;

   v_num_codes = IntS(MATH.Pow(2., FloatS(NumTrimBits)));
   
   if (TrimLookupTable == UTL_VOID) {
      v_trim_lookup_table.Resize(v_num_codes, SV_CONTENT_LOSE);
      switch(TrimCodeStyle) {
         case TRIM_CODE_BINARY:
            for (i = 0; i < v_num_codes; ++i)
               v_trim_lookup_table[i] = i;
            break;
            
         case TRIM_CODE_SIGNED_BINARY:
            j = -1;  // pre-incremented later
            for (i = v_num_codes - 1; i >= v_num_codes / 2; --i) 
               v_trim_lookup_table[++j] = i;
            for (i = 0; i < v_num_codes / 2; ++i)
               v_trim_lookup_table[++j] = i;
            break;
               
         case TRIM_CODE_TWOS_COMPLEMENT:
            j = -1; // pre-incremented later
            for (i = v_num_codes / 2; i < v_num_codes; ++i)
               v_trim_lookup_table[++j] = i;
            for (i = 0; i < v_num_codes /2; ++i)
               v_trim_lookup_table[++j] = i;
            break;
            
         case TRIM_CODE_TABLE:
            v_trim_lookup_table = TrimLookupTable;
            break;

         default: 
            for (i = 0; i < v_num_codes; ++i)
               v_trim_lookup_table[i] = i;
            break;
      }
   }

   v_min_code = Min(v_trim_lookup_table);
   v_max_code = Max(v_trim_lookup_table);

   return (init_status);
}

EfuseTrim *EfuseTrim::ParamPtr;

TMResultM EfuseTrim::Callback() {
   TMResultM callback_result(TM_PASS);
   
   // put in callback code here - unnecessary if Callback-style Characterization is unused
   
   return (callback_result);
}

EfuseTrim::EfuseTrim() {
   StringS text_field;

   // Add input parameters with descriptions & attributes
   // Examples:
   // AddInputParameter(MinorID, "MinorID");
   // SetParameterAttribute("MinorID", "display-if", "..TestLimitSource!=DC_LIMITS_TYPE_ENUM:USE_LIMIT_STRUCT");
   // text_field = "Minor ID used in datalog test ID calculation.";
   // SetParameterAttribute("MinorID", "tooltip", text_field);
   // text_field = "MinorID - integer expression added to the test object major ID to calculate the ";
   // text_field += "datalog test ID. The value specified has additional functionality as shown ";
   // text_field += "in the following table:";
   // text_field += "<table border=1><tr><td><b>MinorID</b></td><td><b>Effect</b></td></tr>";
   // text_field += "<tr><td>(empty)</td><td>System algorithm used to set the minor ID for all pins datalogged</td></tr>";
   // text_field += "<tr><td>integer</td><td>Value used as the minor ID for all pins datalogged</td></tr>";
   // text_field += "<tr><td>-integer</td><td>Ones compliment of the value is used as the starting minor ID, ";
   // text_field += "with each pin's datalogged minor ID incremented by one from the previous pin</td></tr></table>";
   // SetParameterAttribute("MinorID", "description", text_field);
   // SetParameterAttribute("MinorID", "needs-minor-id-init", "");
   //
   // AddInputParameter(ForceValue, "ForceValue");
   // SetParameterAttribute("ForceValue", "display-if", "..TestLimitSource=DC_LIMITS_TYPE_ENUM:USE_LOCAL_LIMITS");
   // text_field = "Forced value (Volts or Amps)";
   // SetParameterAttribute("ForceValue", "tooltip", text_field);
   // text_field = "ForceValue - A required floating point expression of type Volts or Amps that ";
   // text_field += "specifies the forcing function and magnitude for the locally defined test setup.";
   // SetParameterAttribute("ForceValue", "description", text_field);

   // register breakpoints, uncomment and add as needed
   AddLocalBreakpoint("AfterSetup");
   // AddLocalBreakpoint("AfterPreset");
   // AddLocalBreakpoint("AfterTest");


   // initialize class variables

}

StringS EfuseTrim::FormatBreakpointMessage(const StringS TestName, const StringS EventName, const StringS MethodMessage,
                                         const StringS ExtraMessage, const TMResultM result_break) {
   StringS finalMessage = "  "+TestName+" "+MethodMessage+": After "+ExtraMessage;
   StringS eventString = " test ";
   IntS Zero = 0;

   if ( EventName.Find("OnFail") == Zero )
      eventString = " fail ";
   else if ( EventName.Find("AfterSetup") == Zero )
      eventString = " setup ";
   else if ( EventName.Find("AfterPreset") == Zero )
      eventString = " preset ";

   finalMessage = finalMessage+eventString;

   if ( result_break != UTL_VOID )
      finalMessage = finalMessage+result_break;
   // For next line and extra information for test methods themselves.
   finalMessage = finalMessage+"\n"+"   ";

   return finalMessage;
}
#endif

