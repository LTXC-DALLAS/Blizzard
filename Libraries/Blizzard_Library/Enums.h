//enum CbitType {
//    CB_None = 0,
//    Tester = 1,
//    Cboc = 2,
//    User = 3,
//    Ecbit = 4,
//};
/*
enum CbitType
{ 
    CB_NONE,
    ECBIT, 
    CBOC, 
    TESTERCBIT, 
};
*/
enum DcType { 
    DC_None=0,
    ForceV=1,               
    ForceI=2,               
    MsrV=3,
    MsrI=4,
    TestV=5,
    TestI=6,
    ForceVMsrI=7,  
    ForceIMsrV=8,
    ForceVMsrV=13,
    ForceVTestI=9, 
    ForceITestV=10, 
    ForceVTestV=14,
    ForceVTestR=11,
    ForceITestR=12,
    OSPins=15,
};
enum SenseConnect { 
    Local = 0,
    Remote = 1,
    Previous = 2,
};
enum RemoveConnect { //remove_connections
    RC_None = 0,
    PreTestAll = 1,
    PostTestAll = 2,
    LocalTestOnly = 3,
    PrePostAll = 4,
    Never = 5,
    PreAllNever = 6,
    PostAllNever = 7,
};
enum ExecPattern { // When to execute pattern
    EP_None = 0,
    PreSetup = 1,
    PreMeas = 2,
    PostMeas = 3,
};
enum ContyType {
    SeparateOS = 0,
    MergeOS = 1,
};
enum DctmSetup {
    Src_DC_V = 1,
    Src_DC_WF = 2,
    Meas_DC_V = 3,
    Meas_DC_V_Test =4,
};

enum DctmDCMsrRng {
    r20mV = 1,
    r100mV = 2,
    r200mV = 3,
    r11V	= 4,
};
enum DctmDCMsrLPF {
    DTDC_OFF = 1,
    DTDC_LPF_200KHZ   = 2,
};
enum DctmDCMsrCfg {
    Direct	=1,
    Null	=2,
};
enum DctmSrcConfig {
    DSRC_SE_P        =1,
    DSRC_Diff        =2,
    DSRC_PseudoDiff  =3,
};
enum WfmType {
    Ramp      =1,
    Triangle  =2,
    Square    =3,
    Sine      =4,
    Multitone =5,
};
enum AwghrConfig {
    AWG_SE_P =1,
    AWG_SE_M =2,
    Balanced =3,
};
enum AwghrFilter {
    NoiseReduc =1,
    Reconstruct =2,
    Bandpass    =3,
    Off         =4,
};
enum DctmACMsrLPF {
    DTAC_OFF = 1,
    DTAC_LPF_200KHZ   = 2,
};
enum DctmACMsrCfg {
    DTAC_SE_P = 1,
    DTAC_DIFF = 2,
};
enum FiltSpectrum {
    FS_None = 1,
    A_Weight = 2,
};
/**************************************************************/
// DigitalCommunication.evo
enum ComType { // connection_type
    I2C = 0,
    SPI = 1,
    JTAG = 2,
    I2S = 3,
};
enum SlaveBits { // connection_type
    SL_Ssecond_group = 7,
    SL_Eight = 8,
};
enum I2cType { // connection_type
    WriteData = 0,
    ReadData = 1,
};
enum DataOrder	{ // force_type
    MsbFirst = 0,
    LsbFirst = 1,
};
enum SearchType {
    Binary = 1,
    Linear = 2,
    SuccessApprox = 3,
    BinSkipMinMax = 5,
};
enum FreqMsrInst {
    Tmu = 1,
    FreqCounter = 2,
};
enum FreqCountSamples {
    CountLegacy = 0,
    Count10 = 1,
    Count100 = 2,
    Count1k = 3,
    Count100k = 4,
    Count1M = 5,
};
enum IntCodingType {
    Unsigned = 0,
    SignedMag = 1,
    OnesComplement = 2,
    TwosComplement = 3,
};
enum DctmDCMsrConnect {
    DTDC_Single_End	=1,
    DTDC_Diff	=2,
};
enum MeasType { 
    Frequency = 0,
    MTPeriod = 1,
    DutyCycle = 2,
    PulseWidth = 3,
    DutyCycle_TED = 4,
    PulseWidth_TED = 5,
    RiseTime = 6,
    FallTime = 7,
    TpdRise2Rise = 8,
    TpdRise2Fall = 9,
    TpdFall2Rise = 10,
    TpdFall2Fall = 11,
};
enum EdgeDrivenBy { 
    Edge_Dut = 0,
    Edge_Tester = 1,
};
enum Prescaler { 
    One = 1,
    Two = 2,
    Four = 4,
    Eight = 8,
    Sixteen = 16,
};
enum ArmOn { 
    Arm_RisingEdge = 0,
    Arm_FallingEdge = 1,
    Arm_PatternTrigger = 2,
    Arm_PinTrigger = 3,
    Arm_Immediate = 4,
};
enum StartOn { 
    Start_RisingEdge = 0,
    Start_FallingEdge = 1,
};
enum JitterType { 
    Jitter_Edge = 0,
    Jitter_Period = 1,
};
enum TriggerVoltage { 
    Voh2Voh = 0,
    Voh2Vol = 1,
    Vol2Voh = 2,
    Vol2Vol = 3,
};
enum ValueType {
    Numeric = 1,
    Boolean = 2,
};
enum AdcLinSrc {
    Dctm = 1,
    Awghr = 2,
};
enum AdcInlCalc {
    BestFit = 1,
    EndPoint = 2,
    RunningSum = 3,
};
