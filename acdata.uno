Unison:U1.0c:S5.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/acdata.evo                                     */
/* Creation Date  : Tue Jan  3 17:11:53 2012                                  */
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*									      */
/*	                        Revision Comments 			      */
/*                                                                            */
/* 1st char of Rev (0-Z) - major revisions               	              */
/* 2nd char of Rev (0-Z) - minor revisions               		      */
/*									      */
/* Rev : Comment                                          : UserID   : Date   */
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*									      */
/*  A0 : Initial version of the Fusion Test Program       : x0051755 :        */
/*                                                                            */
/******************************************************************************/
/*  Jazz Version used: /vobs/ASP/jazz/release */
/******************************************************************************/

/***********************************************************************/
/***                                                                 ***/
/***  The file acdata.evo is the location in which all AC specs      ***/
/***  are stored. This is the only place in a test program in which  ***/
/***  numerical valued AC information should be. All other AC        ***/
/***  expressions should include references to the values in acdata. ***/
/***  resources are to be used, how they are to be used, and the     ***/
/***  connection map of tester resources to device pins              ***/
/***                                                                 ***/
/***  The global declarations for all the AC specification variables ***/
/***  are also located here. This is handy, as adding additional     ***/
/***  specs can be done without having to update a separate global   ***/
/***  declarations file.                                             ***/
/***                                                                 ***/
/***  The global declararation also types the variable, so that      ***/
/***  enVision can check for correct assignments (seconds, Volts,    ***/
/***  Amps, and so on).                                              ***/
/***                                                                 ***/
/***  Final comment related to specs is that no value should be      ***/
/***  entered more than once. The "Inherit" capability allows a      ***/
/***  "common" Category to be built, which can then be referenced    ***/
/**   by other Categories                                            ***/
/***                                                                 ***/
/***********************************************************************/

    /***********************************************************/
    /***     Declare global variables with type info         ***/
    /***********************************************************/
    /***                                                     ***/
    /***  This section declares the Globally available       ***/
    /***  AC specifications that will be used in the program.***/
    /***  Type      = Type of value (SCALAR, V, A, s, etc)   ***/
    /***                                                     ***/
    /***********************************************************/

__Spec ACSpecs {
    __Category CommonACdata {
        ACTableIndex = "0";
        twMCC_F = "'0'";
        tfreq.Min = "1/tper.Max";
        tfreq.Typ = "1/tper.Max";
        tfreq.Max = "1/tper.Min";
        tper.Min = "10ns";
        tper.Typ = "1/tfreq";
        tper.Max = "100ns";
        tfreqAsync.Min = "1/tperAsync.Max";
        tfreqAsync.Typ = "1/tperAsync.Max";
        tfreqAsync.Max = "1/tperAsync.Min";
        tperAsync.Min = "10ns";
        tperAsync.Typ = "1/tfreqAsync";
        tperAsync.Max = "100ns";
        tH = "tper/2";
        tQ = "tper/4";
        t_8th = "tper/8";
        tref = "0ps";
        dtcf = "TIdtcf";
        ctcf = "TIctcf";
        charID_tper = "'A'";
        charEn_tper = "FALSE";
        charStep_tper = "1ns";
        charID_tperAsync = "'B'";
        charEn_tperAsync = "FALSE";
        charStep_tperAsync = "1ns";
        charID_tfreq = "'C'";
        charEn_tfreq = "FALSE";
        charStep_tfreq = "1MHz";
        charID_tfreqAsync = "'D'";
        charEn_tfreqAsync = "FALSE";
        charStep_tfreqAsync = "1MHz";
        stb_bit = "7ns";
        edg1_bit = "0ns";
        edg2_bit = "4ns";
        edg3_bit = "0ns";
    }
    __Category AC_cat_FTN {
        __Inherit CommonACdata;
        ACTableIndex = "99";
        tper.Max = "62.5ns";
    }
    __Category AC_cat_1 {
        __Inherit CommonACdata;
        ACTableIndex = "1";
        twMCC_F = "'1'";
        tper.Min = "10ns";
        tper.Max = "50ns";
        charEn_tper = "TRUE";
    }
    __Category AC_cat_10 {
        __Inherit CommonACdata;
        ACTableIndex = "2";
        twMCC_F = "'2'";
        tper.Min = "10ns";
        tper.Max = "33ns";
        tperAsync.Min = "10ns";
        tperAsync.Max = "33.3333333333333ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_11 {
        __Inherit CommonACdata;
        ACTableIndex = "3";
        twMCC_F = "'3'";
        tper.Min = "10ns";
        tper.Max = "33ns";
        tperAsync.Min = "10ns";
        tperAsync.Max = "12.5ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_11_3tper {
        __Inherit CommonACdata;
        ACTableIndex = "4";
        twMCC_F = "'4'";
        tper.Min = "10ns";
        tper.Max = "99ns";
        tperAsync.Min = "10ns";
        tperAsync.Max = "37.5ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_12 {
        __Inherit CommonACdata;
        ACTableIndex = "5";
        twMCC_F = "'5'";
        tper.Min = "10ns";
        tper.Max = "33ns";
        tperAsync.Min = "10ns";
        tperAsync.Max = "25ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_12_3tper {
        __Inherit CommonACdata;
        ACTableIndex = "6";
        twMCC_F = "'6'";
        tper.Min = "10ns";
        tper.Max = "99ns";
        tperAsync.Min = "10ns";
        tperAsync.Max = "75ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_13 {
        __Inherit CommonACdata;
        ACTableIndex = "7";
        twMCC_F = "'7'";
        tper.Min = "10ns";
        tper.Max = "tperAsync.Max*16";
        tperAsync.Min = "10ns";
        tperAsync.Max = "12.5ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_14 {
        __Inherit CommonACdata;
        ACTableIndex = "8";
        twMCC_F = "'8'";
        tper.Min = "10ns";
        tper.Max = "33ns";
        tperAsync.Min = "10ns";
        tperAsync.Max = "38.4615384615385ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_14_3tper {
        __Inherit CommonACdata;
        ACTableIndex = "9";
        twMCC_F = "'9'";
        tper.Min = "10ns";
        tper.Max = "99ns";
        tperAsync.Min = "10ns";
        tperAsync.Max = "115.384615384615ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_15 {
        __Inherit CommonACdata;
        ACTableIndex = "10";
        twMCC_F = "'A'";
        tper.Min = "10ns";
        tper.Max = "100ns";
        tperAsync.Min = "10ns";
        tperAsync.Max = "119.217930376729ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_16 {
        __Inherit CommonACdata;
        ACTableIndex = "11";
        twMCC_F = "'B'";
        tper.Min = "10ns";
        tper.Max = "100ns";
        tperAsync.Min = "10ns";
        tperAsync.Max = "125ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_17 {
        __Inherit CommonACdata;
        ACTableIndex = "12";
        twMCC_F = "'C'";
        tper.Min = "10ns";
        tper.Max = "tperAsync.Max*8";
        tperAsync.Min = "10ns";
        tperAsync.Max = "12.5ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_18 {
        __Inherit CommonACdata;
        ACTableIndex = "13";
        twMCC_F = "'D'";
        tper.Min = "10ns";
        tper.Max = "tperAsync.Max*5";
        tperAsync.Min = "10ns";
        tperAsync.Max = "20ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_19 {
        __Inherit CommonACdata;
        ACTableIndex = "14";
        twMCC_F = "'E'";
        tper.Min = "10ns";
        tper.Max = "200ns";
        charEn_tper = "TRUE";
    }
    __Category AC_cat_2 {
        __Inherit CommonACdata;
        ACTableIndex = "15";
        twMCC_F = "'F'";
        tper.Min = "10ns";
        tper.Max = "tperAsync.Max*4";
        tperAsync.Min = "10ns";
        tperAsync.Max = "12.5ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_3 {
        __Inherit CommonACdata;
        ACTableIndex = "16";
        twMCC_F = "'G'";
        tper.Min = "10ns";
        tper.Max = "50ns";
        tperAsync.Min = "10ns";
        tperAsync.Max = "62.5ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
        stb_bit = "7ns";
        edg1_bit = "0ns";
        edg2_bit = "4ns";
        edg3_bit = "0ns";
    }
    __Category AC_cat_4 {
        __Inherit CommonACdata;
        ACTableIndex = "17";
        twMCC_F = "'H'";
        tper.Min = "10ns";
        tper.Max = "50ns";
        tperAsync.Min = "10ns";
        tperAsync.Max = "40ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_5 {
        __Inherit CommonACdata;
        ACTableIndex = "18";
        twMCC_F = "'I'";
        tper.Min = "10ns";
        tper.Max = "50ns";
        tperAsync.Min = "10ns";
        tperAsync.Max = "30.3030303030303ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_6 {
        __Inherit CommonACdata;
        ACTableIndex = "19";
        twMCC_F = "'J'";
        tper.Min = "10ns";
        tper.Max = "tperAsync.Max*2";
        tperAsync.Min = "10ns";
        tperAsync.Max = "25ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_7 {
        __Inherit CommonACdata;
        ACTableIndex = "20";
        twMCC_F = "'K'";
        tper.Min = "10ns";
        tper.Max = "100ns";
        charEn_tper = "TRUE";
    }
    __Category AC_cat_8 {
        __Inherit CommonACdata;
        ACTableIndex = "21";
        twMCC_F = "'L'";
        tper.Min = "10ns";
        tper.Max = "tperAsync.Max";
        tperAsync.Min = "10ns";
        tperAsync.Max = "100ns";
        charEn_tper = "TRUE";
        charEn_tperAsync = "TRUE";
    }
    __Category AC_cat_9 {
        __Inherit CommonACdata;
        ACTableIndex = "22";
        twMCC_F = "'M'";
        tper.Min = "10ns";
        tper.Max = "166.66ns";
        charEn_tper = "TRUE";
    }
    __Category SlowScan {
        ACTableIndex = "16";
        twMCC_F = "'G'";
        tfreq.Min = "1/tper.Max";
        tfreq.Typ = "1/tper.Max";
        tfreq.Max = "1/tper.Min";
        tper.Min = "10ns";
        tper.Typ = "1/tfreq";
        tper.Max = "50ns*10";
        tfreqAsync.Min = "1/tperAsync.Max";
        tfreqAsync.Typ = "1/tperAsync.Max";
        tfreqAsync.Max = "1/tperAsync.Min";
        tperAsync.Min = "10ns";
        tperAsync.Typ = "1/tfreqAsync";
        tperAsync.Max = "62.5ns";
        tH = "tper/2";
        tQ = "tper/4";
        t_8th = "tper/8";
        tref = "0ps";
        dtcf = "TIdtcf";
        ctcf = "TIctcf";
        charID_tper = "'A'";
        charEn_tper = "TRUE";
        charStep_tper = "1ns";
        charID_tperAsync = "'B'";
        charEn_tperAsync = "TRUE";
        charStep_tperAsync = "1ns";
        charID_tfreq = "'C'";
        charEn_tfreq = "FALSE";
        charStep_tfreq = "1MHz";
        charID_tfreqAsync = "'D'";
        charEn_tfreqAsync = "FALSE";
        charStep_tfreqAsync = "1MHz";
        stb_bit = "0ns";
        edg1_bit = "0ns";
        edg2_bit = "0ns";
        edg3_bit = "0ns";
    }
    __ParamGlobals {
            ACTableIndex { __Type = SCALAR; }
            twMCC_F { __Type = STRING; __Comment = "MCC Frequency indicator in testware"; }
            tfreq { __Type = Hz; __Comment = "1\/tper.Max base frequency for test"; }
            tper { __Type = s; __Comment = "1\/tfreq base period in terms of tfreq"; }
            tfreqAsync { __Type = Hz; __Comment = "1\/tperAsync.Max base frequency for test"; }
            tperAsync { __Type = s; __Comment = "1\/tfreqAsync base period in terms of tfreq"; }
            tH { __Type = s; }
            tQ { __Type = s; }
            t_8th { __Type = s; }
            tref { __Type = s; }
            dtcf { __Type = s; }
            ctcf { __Type = s; }
            charID_tper { __Type = STRING; }
            charEn_tper { __Type = BOOLEAN; }
            charStep_tper { __Type = s; }
            charID_tperAsync { __Type = STRING; }
            charEn_tperAsync { __Type = BOOLEAN; }
            charStep_tperAsync { __Type = s; }
            charID_tfreq { __Type = STRING; }
            charEn_tfreq { __Type = BOOLEAN; }
            charStep_tfreq { __Type = Hz; }
            charID_tfreqAsync { __Type = STRING; }
            charEn_tfreqAsync { __Type = BOOLEAN; }
            charStep_tfreqAsync { __Type = Hz; }
            stb_bit { __Type = s; }
            edg1_bit { __Type = s; }
            edg2_bit { __Type = s; }
            edg3_bit { __Type = s; }
    }
}
