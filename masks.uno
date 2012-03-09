Unison:U1.0c:S5.3;

/******************************************************************************/
/* Jazz Integrated Program : Bllizar                                          */
/*                                                                            */
/* Program Module : FusionProg/masks.evo                                      */
/* Creation Date  : Tue Jan  3 17:12:37 2012                                  */
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
/***  The file masks.evo is the location in which all specs masks    ***/
/***  are stored. The masks are a method that allows each spec to    ***/
/***  have three values (min, typ, max). Normal programming style    ***/
/***  will to be only to use typ values. In this case, the masks     ***/
/***  objects will always be a single line, setting default to typ.  ***/
/***                                                                 ***/
/***  There must be at least one Mask for every Spec in use. There   ***/
/***  may be multiple masks for one spec, but one masks cannot be    ***/
/***  tied to multiple specs.                                        ***/
/***                                                                 ***/
/***  Globals_Meas_Mask requires each parameter explicity defined    ***/
/***   since enVision cannot recognize Meas as a valid MaskDefault   ***/ 
/***  Reference SPR : 70919                                          ***/
/***                                                                 ***/
/***********************************************************************/

__Mask Globals_Meas_Mask {
    __MaskDefault = Meas;
    __Spec = Globals_Meas;
    GlobalMeasIndex = Typ;
    TestWareDataLog = Typ;
    ContinueOnFail = Typ;
    TestWarePrintSpec = Typ;
    CharNthDevice = Typ;
    twMCC = Typ;
    twMCC_S = Typ;
    twBase = Typ;
    twVar = Typ;
    twVar1 = Typ;
    twVarsFile = Typ;
    ESDAProgName = Typ;
    DataNDTimeOut = Typ;
    FailsToCollect = Typ;
}

__Mask Globals_Typ_Mask {
    __MaskDefault = Typ;
    __Spec = Globals_Typ;
}

__Mask DCSpecsMask {
    __MaskDefault = Typ;
    __Spec = DCSpecs;
}

__Mask ACSpecsMask {
    __MaskDefault = Typ;
    __Spec = ACSpecs;
}

__Mask PSSpecsMask {
    __MaskDefault = Typ;
    __Spec = PSSpecs;
}

__Mask PSSpecsMask_Meas {
    __MaskDefault = Typ;
    __Spec = PSSpecs;
    VDD_PS = Meas;
    VDDEEPROM_PS = Meas;
    VDDPGM_PS = Meas;
    VNWA_PS = Meas;
    VDDAR_PS = Meas;
    VBAT_PS = Meas;
    VDDS_PS = Meas;
    VDDA_PS = Meas;
    VPP_PS = Meas;
}

__Mask CTMask {
    __MaskDefault = Typ;
    __Spec = CTSpec;
    PinNum = Meas;
}
