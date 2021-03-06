// ------------------------------------------------------------------------------------------------------
//                                                                                                    
//                    	            Blizzard environment page		               		                                   
//                                                                                                     
// ------------------------------------------------------------------------------------------------------
//   REVISION LOG:                                 
// ------------------------------------------------------------------------------------------------------
//   REVISION	DATE	        AUTHOR 	    REASON FOR CHANGE			                        
//   1.0     	25-Jan-2011 	 BJP	    Creation             
// ------------------------------------------------------------------------------------------------------
//
// ------------------------------------------------------------------------------------------------------

#include <Unison.h>
#include <iostream>
#include <iomanip>
#include <globals.h>
#include <TestwareSupport.h>

using namespace std;

void Initialize_ecbits () {
int i;
//    ALL_ECBITS.Resize (256, 0);
//    for (i=0; i<256; ++i) ALL_ECBITS[i] = i+1;
}


//void close_srn_buffer (SITE local_site)
//{
//    if (local_site == SITE_1) { EcbitClose (BUF_TO_SRN_S1); }
//}

void Initialize_digital_pins ()
{
    DIGITAL.SetDriveState ("DIG_INIT_LO", DIGITAL_DRV_STATE_LOW);
    DIGITAL.SetDriveState ("DIG_INIT_HI", DIGITAL_DRV_STATE_HIGH);
    DIGITAL.SetDriveState ("DIG_INIT_HIZ", DIGITAL_DRV_STATE_OFF);
    DIGITAL.Connect ("DIG_ALL", DIGITAL_DCL_TO_DUT);
    VI.Disconnect ("DIG_ALL"); // Disconnect PPMU connections
}

void Initialize_hardware ()
{

    DIGITAL.ClearAllSends (); 
    DIGITAL.ClearAllCaptures (); 

 }

/*void FV_VI (PinML pins, FloatM value_v, FloatM range_v, FloatM range_i, FloatM clamp_i, BoolS Gate_and_Connect)
{
    VI.SetMeasureIRange (pins, range_i);
    VI.SetClampsI (pins, clamp_i, -1mA); // isnk clamped to -1mA any case
    VI.ForceV (pins, value_v, range_v);
    if (Gate_and_Connect) {
        VI.Connect (pins, VI_TO_DUT, VI_MODE_REMOTE);
        VI.Gate (pins, VI_GATE_ON); }
}
void FI_VI (PinML pins, FloatM value_i, FloatM range_i, FloatM range_v, FloatM clamp_v, BoolS Gate_and_Connect)
{
    VI.SetMeasureVRange (pins, range_v);
    VI.SetClampsV (pins, clamp_v, -1V); 
    VI.ForceI (pins, value_i, range_i);
    if (!UseEvalBoard) { VI.SetSwitchMode ("REG25", VI_SWITCH_HOT); } // Hot switching is required for HCOVI
    if (Gate_and_Connect) {
        VI.Connect (pins, VI_TO_DUT, VI_MODE_REMOTE);
        VI.Gate (pins, VI_GATE_ON); }
}

void Tune_HCOVI (FloatM T2, FloatM Gain)
{
// Valid T2 and Gain combinations can be:
// 1.5ms 150us 15us 3us     with    0 0.1875 3 12
// OR
// 500us 50us 5us 1us       with    0 0.625 2.5 10 40	
    VI.SetBandwidthFactors ("REG25", 0., T2, Gain);
    TIME.Wait (100usec);
    if (false) {
        FloatM1D T1_readback, T2_readback, Gain_readback;
        VI.GetBandwidthFactors ("REG25", T1_readback, T2_readback, Gain_readback);
        std::cout << "REG25 HCOVI T2   readback = " << T2_readback << std::endl;
        std::cout << "REG25 HCOVI Gain readback = " << Gain_readback << std::endl;
   }
}
*/
/*void DutPowerOFF () {
    RemovePowerSRN ();
    FV_VI ("FUSE", 0V, 3.9V, 49mA, 49mA, false);
    TIME.Wait (1msec);
    VI.Gate ("FUSE", VI_GATE_OFF_LOZ);
    VI.Disconnect ("FUSE");
    if (UseEvalBoard) {
        FV_VI ("PTC", 0V, 3.9V, 49mA, 49mA, false);
        TIME.Wait (1msec);
        VI.Gate ("PTC", VI_GATE_OFF_LOZ);
        VI.Disconnect ("PTC"); }
    else {
        FV_VI ("PTC_DSG", 0V, 3.9V, 49mA, 49mA, false);
        FV_VI ("GPOD_CHG", 0V, 3.9V, 49mA, 49mA, false);
        TIME.Wait (1msec);
        VI.Gate ("PTC_DSG", VI_GATE_OFF_LOZ);
        VI.Gate ("GPOD_CHG", VI_GATE_OFF_LOZ);
        VI.Disconnect ("PTC_DSG");
        VI.Disconnect ("GPOD_CHG"); }
    DIGITAL.Disconnect ("DIG_ALL", DIGITAL_DCL_TO_DUT);
    if (UseEvalBoard) {
        VCX_Irange = "VCX_Irange.Typ";
        VCX_Iclamp = "VCX_Iclamp.Typ";
        FV_VI ("VCX_PINS", 0V, 0V, VCX_Irange, VCX_Iclamp, false);
        VI.Gate ("VCX_PINS", VI_GATE_OFF_LOZ);
        VI.Disconnect ("VCX_PINS"); 
        VCX_gatedon = false;
        VCX_connected = false; }
    else { 
        VCX_Irange = "VCX_Irange.Typ";
        VCX_Iclamp = "VCX_Iclamp.Typ";
        FV_VI ("VCX", 0V, 0V, VCX_Irange, VCX_Iclamp, false);
        VI.Gate ("VCX", VI_GATE_OFF_LOZ);
        VI.Disconnect ("VCX");                
        EcbitOpen (VC1_TO_BAT + DIV_TO_VC1 + DIV_TO_VC2 + DIV_TO_VC3 + DIV_TO_VC4);
        TIME.Wait (Mosfets_settling_time); }
    BAT_Irange = "BAT_Irange.Typ";
    BAT_Iclamp = "BAT_Iclamp.Typ";
    FV_VI ("BAT", 0V, 0V, BAT_Irange, BAT_Iclamp, false);
    VCC_Irange = "VCC_Irange.Typ";
    VCC_Iclamp = "VCC_Iclamp.Typ";
    FV_VI ("VCC", 0V, 0V, VCC_Irange, VCC_Iclamp, false);
    PACK_Irange = "PACK_Irange.Typ";
    PACK_Iclamp = "PACK_Iclamp.Typ";
    FV_VI ("PACK", 0V, 0V, PACK_Irange, PACK_Iclamp, false);
    BAT_current_value = 0V;
    VCC_current_value = 0V;
    PACK_current_value = 0V;
    TIME.Wait (6msec); // Let time to discharge decoupling caps before disconnecting resources
    VI.Gate ("POWER_PINS", VI_GATE_OFF_LOZ);
    BAT_gatedon = false;
    VCC_gatedon = false;
    PACK_gatedon = false;
    VI.Disconnect ("POWER_PINS"); 
    BAT_connected = false;
    VCC_connected = false;
    PACK_connected = false;
    FV_VI ("ANA_ALL", 0V, 0V, 50mA, 50mA, false);
    VI.Gate ("ANA_ALL", VI_GATE_OFF_LOZ);
    VI.Disconnect ("ANA_ALL"); 
    DIGITAL.Disconnect ("DIG_ALL", DIGITAL_ALL_PATHS);
    if (!UseEvalBoard) {
        EcbitOpen (ALL_RELAYS_EXCEPT_R5V);  // Open all relays except R5V  
        EcbitClose (ALL_MUXES);   
        TIME.Wait (Relays_settling_time); }
    
    TIME.Wait (50msec); // Need to adjust this wait time, it was only required for 16 sites in enVision progrqm --LB

}

void DutPowerON (FloatS packv, FloatS vccv, FloatS batv, FloatS wait_time) {

    if (!UseEvalBoard) {
        EcbitOpen (ALL_RELAYS_EXCEPT_R5V);  // Open all relays except R5V  
        EcbitClose (ALL_MUXES);   
        TIME.Wait (Relays_settling_time); 
        VI.SetBandwidthFactors ("REG25", 0., 500e-6, 0.); // T1/T2/Gain, T1 is NA for HCOVI 
    } 
    ApplyPowerSRN ( 0V, false, 0.0);

//    ---------------------------------------------------------------------------------------------------
//    -- PSets                                "power_up"                                               --
//    ---------------------------------------------------------------------------------------------------
//    -- Mode                                 tlDCVIModeVoltage : Applies for all
//    -- Pin                                  PACK    VCC     BAT     VC1     VC2     VC3     VC4     RBI    
//    -- Voltage                              0V      0V      0V      0V      0V      0V      0V      0V
//    -- VoltageRange                         30V     30V     30V     30V     20V     10V     5V      5V
//    -- Current                              20mA    75mA    75mA    15mA    15mA    15mA    15mA    1mA
//    -- CurrentRange                         20mA    100mA   100mA   20mA    20mA    20mA    20mA    2mA
//    -- ComplianceRangeHigh                  30V     30V     30V     30V     30V     30V     30V     10V
//    -- ComplianceRangeLow                   30V     30V     30V     30V     30V     30V     30V     10V
//    -- MeterMode                            tlDCVIMeterCurrent : Applies for all
//    -- MeterVoltageRange                    30V     30V     20V     20V     20V     10V     5V      5V
//    -- MeterCurrentRange                    20mA    100mA   100mA   20mA    20mA    20mA    20mA    2mA
//    --------------------------------------------------------------------------------------------------    

    PACK_Irange = "PACK_Irange.Typ";
    PACK_Iclamp = "PACK_Iclamp.Typ";
    FV_VI ("PACK", packv, packv*1.1, PACK_Irange, PACK_Iclamp, false);
    PACK_connected = true;
    PACK_current_value = packv;

    VCC_Irange = "VCC_Irange.Typ";
    VCC_Iclamp = "VCC_Iclamp.Typ";
    FV_VI ("VCC", vccv, vccv*1.1, VCC_Irange, VCC_Iclamp, false);
    VCC_connected = true;
    VCC_current_value = vccv;

    BAT_Irange = "BAT_Irange.Typ";
    BAT_Iclamp = "BAT_Iclamp.Typ";
    FV_20V = "FV_20V.Typ";
    Sites SavedSites = ActiveSites;
    SiteIter site_iter = SavedSites.Begin();
    SITE FirstActiveSite = site_iter.GetValue();
    if (batv > 20V) { batv = FV_20V[FirstActiveSite]; }
    FV_VI ("BAT", batv, batv*1.1, BAT_Irange, BAT_Iclamp, false);
    BAT_connected = true;
    BAT_current_value = batv;

    if (UseEvalBoard) {
        FV_VI ("PTC", 0V, 3V, 2uA, 1mA, true);
    } else {
        EcbitOpen (DSG_TO_VI);
        TIME.Wait (Relays_settling_time);
        FV_VI ("PTC_DSG", 0V, 3V, 2uA, 1mA, true);
    }
    FV_VI ("FUSE", 0V, 8V, 10uA, 100uA, true);
    TIME.Wait (2msec);

    if (UseEvalBoard) {
        VCX_Irange = "VCX_Irange.Typ";
        VCX_Iclamp = "VCX_Iclamp.Typ";
        FV_VI ("VC1", batv*1.00, batv*1.00*1.1, VCX_Irange, VCX_Iclamp, false);
        FV_VI ("VC2", batv*0.75, batv*0.75*1.1, VCX_Irange, VCX_Iclamp, false);
        FV_VI ("VC3", batv*0.50, batv*0.50*1.1, VCX_Irange, VCX_Iclamp, false);
        FV_VI ("VC4", batv*0.25, batv*0.25*1.1, VCX_Irange, VCX_Iclamp, false); } 
    else {
        EcbitClose (VC1_TO_BAT + DIV_TO_VC1 + DIV_TO_VC2 + DIV_TO_VC3 + DIV_TO_VC4);
        TIME.Wait (Mosfets_settling_time);
    }
    
    if (UseEvalBoard) {
        VI.Gate ("POWER_PINS", VI_GATE_ON);
        VI.Gate ("VCX_PINS", VI_GATE_ON);
        VCX_gatedon = true; }
    else {
        VI.Gate ("POWER_PINS", VI_GATE_ON);
    }
    PACK_gatedon = true;     
    VCC_gatedon = true;     
    BAT_gatedon = true;     
    if (packv < 5.5V) {
        FV_VI ("PACK", 6.5V, 10V, PACK_Irange, PACK_Iclamp, false);
        TIME.Wait (2.5msec);
        FV_VI ("PACK", packv, 10V, PACK_Irange, PACK_Iclamp, false);
    }
    DEBUG.Breakpoint("AfterSetup", "After DutPowerOn");
    TIME.Wait (wait_time);   
    SaveDutPower ();
}

void DutPowerDN (FloatS packv, FloatS vccv, FloatS batv, FloatS wait_time) {
    // If 999. is applied to packv, vccv or batv then it means that the field
    // is empty. This is to replicate the optional field behavior available in VBT.
    if (packv == 999. && vccv == 999. && batv == 999.) {
        DIGITAL.Disconnect ("DIG_ALL", DIGITAL_DCL_TO_DUT);
        if (UseEvalBoard) { 
            VI.Connect ("PTC", VI_TO_DUT, VI_MODE_REMOTE); }
        else {
            EcbitOpen (DSG_TO_VI);
            TIME.Wait (Relays_settling_time);
            VI.Connect ("PTC_DSG", VI_TO_DUT, VI_MODE_REMOTE); }
        //VI.Gate ("PACK", VI_GATE_OFF_LOZ);
        //VI.Gate ("VCC", VI_GATE_OFF_LOZ);
        if (UseEvalBoard) {
            VI.Gate ("VCX_PINS", VI_GATE_OFF_LOZ);
            VCX_gatedon = false; }
        else {
            EcbitOpen (VC1_TO_BAT + DIV_TO_VC1 + DIV_TO_VC2 + DIV_TO_VC3 + DIV_TO_VC4);
            TIME.Wait (Mosfets_settling_time); }
        //VI.Gate ("BAT", VI_GATE_OFF_LOZ);
        VI.Gate ("POWER_PINS", VI_GATE_OFF_LOZ);  // Use PinML
        PACK_gatedon = false;     
        VCC_gatedon = false;      
        BAT_gatedon = false;     
        // I use packv_Vrangemax as SaveDutPower has side effects that would not modify the levels inappropriately in this case
        // 8V/16V/44V ranges are used respectively for Vmin/Vnom/Vmax so decision is based on these values
        FloatS1D packv_Vrangemax, packv_Vrangemin;
        VI.GetConstraints ("PACK", VI_CONSTR_VFORCE, packv_Vrangemax, packv_Vrangemin);
        if (packv_Vrangemax > 8V) { 
            TIME.Wait (10msec); }
        else if (packv_Vrangemax > 16V) {
            TIME.Wait (10msec); }       
    }
    else {
        if (batv != 999. && BAT_gatedon) {   
            BAT_Irange = "BAT_Irange.Typ";
            BAT_Iclamp = "BAT_Iclamp.Typ";
            FV_VI ("BAT", batv, batv*1.1, BAT_Irange, BAT_Iclamp, false);
            BAT_current_value = batv;
            if (UseEvalBoard) {
                VCX_Irange = "VCX_Irange.Typ";
                VCX_Iclamp = "VCX_Iclamp.Typ";
                FV_VI ("VC1", batv*1.00, batv*1.00*1.1, VCX_Irange, VCX_Iclamp, false);
                FV_VI ("VC2", batv*0.75, batv*0.75*1.1, VCX_Irange, VCX_Iclamp, false);
                FV_VI ("VC3", batv*0.50, batv*0.50*1.1, VCX_Irange, VCX_Iclamp, false);
                FV_VI ("VC4", batv*0.25, batv*0.25*1.1, VCX_Irange, VCX_Iclamp, false); }
            else { 
                EcbitClose (VC1_TO_BAT + DIV_TO_VC1 + DIV_TO_VC2 + DIV_TO_VC3 + DIV_TO_VC4);
                TIME.Wait (Mosfets_settling_time); }
        }
        if (vccv != 999. && VCC_gatedon) {
            VCC_current_value = vccv;
            VCC_Irange = "VCC_Irange.Typ";
            VCC_Iclamp = "VCC_Iclamp.Typ";
            FV_VI ("VCC", vccv, vccv*1.1, VCC_Irange, VCC_Iclamp, false); }
        if (packv != 999. && PACK_gatedon) {
            PACK_current_value = packv;
            PACK_Irange = "PACK_Irange.Typ";
            PACK_Iclamp = "PACK_Iclamp.Typ";
            FV_VI ("PACK", packv, packv*1.1, PACK_Irange, PACK_Iclamp, false); }
    }
    TIME.Wait (wait_time);
}          

void DutPowerUP (FloatS packv, FloatS vccv, FloatS batv, FloatS wait_time) {
    // If 999. is applied to packv, vccv or batv then it means that the field
    // is empty. This is to replicate the optional field behavior available in VBT.

    if (packv == 999. && vccv == 999. && batv == 999.) {
        VI.Gate ("POWER_PINS", VI_GATE_ON);
        //VI.Gate ("BAT", VI_GATE_ON);
        if (UseEvalBoard) {
            VI.Gate ("VCX_PINS", VI_GATE_ON);
            VCX_gatedon = true; }
        else {
            EcbitClose (VC1_TO_BAT + DIV_TO_VC1 + DIV_TO_VC2 + DIV_TO_VC3 + DIV_TO_VC4);
            TIME.Wait (Mosfets_settling_time); }
        //VI.Gate ("VCC", VI_GATE_ON);
        //VI.Gate ("PACK", VI_GATE_ON);
        VCC_gatedon = true;
        PACK_gatedon = true;
        BAT_gatedon = true;
        DIGITAL.Connect ("DIG_ALL", DIGITAL_DCL_TO_DUT);
        TIME.Wait (wait_time);
    }
    else {
        if (batv != 999. && BAT_gatedon) {   
            BAT_Irange = "BAT_Irange.Typ";
            BAT_Iclamp = "BAT_Iclamp.Typ";
            FV_VI ("BAT", batv, batv*1.1, BAT_Irange, BAT_Iclamp, false);
            BAT_current_value = batv;
            if (UseEvalBoard) {
                VCX_Irange = "VCX_Irange.Typ";
                VCX_Iclamp = "VCX_Iclamp.Typ";
                FV_VI ("VC1", batv*1.00, batv*1.00*1.1, VCX_Irange, VCX_Iclamp, false);
                FV_VI ("VC2", batv*0.75, batv*0.75*1.1, VCX_Irange, VCX_Iclamp, false);
                FV_VI ("VC3", batv*0.50, batv*0.50*1.1, VCX_Irange, VCX_Iclamp, false);
                FV_VI ("VC4", batv*0.25, batv*0.25*1.1, VCX_Irange, VCX_Iclamp, false);
                VI.Connect ("VCX_PINS", VI_TO_DUT, VI_MODE_REMOTE);
                VI.Gate ("VCX_PINS", VI_GATE_ON);
                VCX_connected = true;
                VCX_gatedon =true; }     
           else { 
                EcbitClose (VC1_TO_BAT + DIV_TO_VC1 + DIV_TO_VC2 + DIV_TO_VC3 + DIV_TO_VC4);
                TIME.Wait (Mosfets_settling_time); }
        }
        if (vccv != 999. && VCC_gatedon) {
            VCC_current_value = vccv;
            VCC_Irange = "VCC_Irange.Typ";
            VCC_Iclamp = "VCC_Iclamp.Typ";
            FV_VI ("VCC", vccv, vccv*1.1, VCC_Irange, VCC_Iclamp, false); }
        if (packv != 999. && PACK_gatedon) {
            PACK_current_value = packv;
            PACK_Irange = "PACK_Irange.Typ";
            PACK_Iclamp = "PACK_Iclamp.Typ";
            FV_VI ("PACK", packv, packv*1.1, PACK_Irange, PACK_Iclamp, false); }
    }
    if (packv == 999.) {
            if (PACK_saved_value < 5.5V) {
                PACK_Irange = "PACK_Irange.Typ";
                PACK_Iclamp = "PACK_Iclamp.Typ";
                FV_VI ("PACK", 6.5, 6.5*1.1, PACK_Irange, PACK_Iclamp, false);
                TIME.Wait (1msec); 
                FV_VI ("PACK", PACK_saved_value, PACK_saved_value*1.1, PACK_Irange, PACK_Iclamp, false); }
    }
    else {           
        if (packv < 5.5V) {
                PACK_Irange = "PACK_Irange.Typ";
                PACK_Iclamp = "PACK_Iclamp.Typ";
                FV_VI ("PACK", 6.5, 6.5*1.1, PACK_Irange, PACK_Iclamp, false);
                TIME.Wait (5msec); 
                FV_VI ("PACK", packv, packv*1.1, PACK_Irange, PACK_Iclamp, false); }
    }
}
*/

void connect_digital_pins (PinML connect_pins, EnumS <DigitalType> connect_type) {
    if (connect_type = DCL) {
        DIGITAL.Connect (connect_pins, DIGITAL_DCL_TO_DUT); }
    else if (connect_type = PPMU) {
        VI.Connect (connect_pins, VI_TO_DUT, VI_MODE_LOCAL); }
    else if (connect_type = DCL_PPMU) {
        VI.Connect (connect_pins, VI_TO_DUT, VI_MODE_LOCAL); 
        DIGITAL.Connect (connect_pins, DIGITAL_DCL_TO_DUT); }
    else { ERR.ReportError (ERR_INVALID_SETUP, "connect_digital_pins: This condition is not supported", connect_type, NO_SITES, UTL_VOID); } 
}

void disconnect_digital_pins (PinML disconnect_pins, EnumS <DigitalType> disconnect_type) {
    if (disconnect_type = DCL) {
        DIGITAL.Disconnect (disconnect_pins, DIGITAL_DCL_TO_DUT); }
    else if (disconnect_type = PPMU) {
        VI.Disconnect (disconnect_pins); }
    else if (disconnect_type = DCL_PPMU) {
        VI.Disconnect (disconnect_pins);
        DIGITAL.Disconnect (disconnect_pins, DIGITAL_ALL_PATHS); }
    else { ERR.ReportError (ERR_INVALID_SETUP, "disconnect_digital_pins: This condition is not supported", disconnect_type, NO_SITES, UTL_VOID); } 
}


StringS get_site_mask ()
{
    StringS site_mask_string = "";
    int element_pos = 1;
    Sites SavedSites = ActiveSites;
    SITE largest_enabled_site = ActiveSites.GetLargestSite();
    SiteIter site_iter = SavedSites.Begin();
    for (int i = 1; i <= 48; i++) {
        int current_site = site_iter.GetValue();
        if (i == current_site) {
            site_mask_string = site_mask_string + "1";
            element_pos = element_pos + 1; 
            site_iter++; }
        else { site_mask_string = site_mask_string + "0"; }
        if (element_pos > largest_enabled_site) {
            while (i < 48) {
               site_mask_string = site_mask_string + "0";
               i = i++; }
            break; 
        } // endif
    }     // endfor       
    return (site_mask_string);
}

void Dec2bin(int decimal, char *binary) {
    int  k = 0, n = 0;
    int  neg_flag = 0;
    int  remain;
    int  old_decimal;  // for test
    char temp[80];

    // take care of negative input
    if (decimal < 0)  {      
        decimal = -decimal;
        neg_flag = 1; }
    do {
        old_decimal = decimal;   // for test
        remain = decimal % 2;
        decimal = decimal / 2;
        // converts digit 0 or 1 to character '0' or '1'
        temp[k++] = remain + '0';
    } while (decimal > 0);

    if (neg_flag)
        temp[k++] = '-';       // add - sign
    //else
    //    temp[k++] = ' ';       // add space

     // reverse the spelling
    while (k >= 0)
        binary[n++] = temp[--k];

        binary[n-1] = 0;         // end with NULL
}

void Fill_string_with_zero_leading (StringS input_string, StringS &output_string) {
    IntS lens = input_string.Length (); 
    if (lens == 7) {output_string = "0"+input_string; }
    else if (lens == 6) {output_string = "00"+input_string; }
    else if (lens == 5) {output_string = "000"+input_string; }
    else if (lens == 4) {output_string = "0000"+input_string; }
    else if (lens == 3) {output_string = "00000"+input_string; }
    else if (lens == 2) {output_string = "000000"+input_string; }
    else if (lens == 1) {output_string = "0000000"+input_string; }
    else if (lens == 0) {output_string = "00000000"+input_string; }
}

void OutputGlobals () {
//For example
//    std::cout << "UseEvalBoard = " << UseEvalBoard << std::endl;
//    std::cout << "UseTestware = " << UseTestware << std::endl;
}

void SetDriversLow(PinML pins)
{
    DIGITAL.SetDriveMode(pins, DIGITAL_DRV_MODE_LOW);
    DIGITAL.SetLoadMode(pins, DIGITAL_LD_MODE_OFF);
}

void RestoreDrivers(PinML pins)
{
    DIGITAL.SetDriveMode(pins, DIGITAL_DRV_MODE_PATTERN);
    DIGITAL.SetLoadMode(pins, DIGITAL_LD_MODE_OFF);
}
IntS ClearCPUFlag()
{
   DIGITAL.SetFlag(DIGITAL_FLAG_CPU, false);
    return 0;
}
void connectOpenPinList(PinML pins)
{
   DIGITAL.Connect(pins, DIGITAL_DCL_TO_DUT);
}
void CyclePower(Levels powerDownLevels1, Levels powerDownLevels2, FloatS powerDownDelay,
                Levels powerUpLevels1, Levels powerUpLevels2)
{
   if (powerDownLevels1.Valid())
      powerDownLevels1.Execute();
   if (powerDownLevels2.Valid())
      powerDownLevels2.Execute();
   TIME.Wait(powerDownDelay);
   if (powerUpLevels1.Valid())
      powerUpLevels1.Execute();
   if (powerUpLevels2.Valid())
      powerUpLevels2.Execute();
}

void codetest (IntS senampnum)
{
   IntS1D din_array(19,0xffff);
   IntS count, numword_max=4;
   
//   for (count = 0;count <= numword_max;count++) din_array[count] = 0xffff;
   
   cout << "Sense Amp Number " << setw(5) << senampnum << " DataMask == " << hex << din_array[(senampnum/16)] << endl;
}
