Unison:U1.0c:S5.3;
__PatternSequence FlashTestNum_SEQ {
    __Thread[0] = FlashShellB_Thrd;
    __Thread[1] = FlashShellC_Thrd;
    __Thread[2] = FlashTestNum_NoRPT1_Thrd;
    __Thread[3] = FlashTestNum_NoRPT2_Thrd;
    __Thread[4] = FlashTestNum_0x11200000_Trunc_Thrd;
    __Thread[5] = FlashTestNum_0x10000000_Trunc_Thrd;
    __Thread[6] = FlashTestNum_0x10000000_Thrd;
    __Thread[7] = FlashTestNum_0x11200000_Thrd;
    __Zipper = __Zipper {
        __Row { TDLStdPatGrp, WFT11 = { WFT11 } }
    }
    __AutoBasePeriod = __True;
}
