#include <Unison.h>

// Initialize and define settling times
extern FloatS Relays_settling_time;  // Mechanical relays 
extern FloatS Mosfets_settling_time; // Typical is 0.5ms in datasheet 
extern FloatS Muxes_settling_time;   // Switch time is specified below 1us in datasheet

// Reset Extended mode status
extern BoolS AlreadyExtendedMode;
extern BoolS ForcedExtendedMode;

extern BoolS UseEvalBoard;
extern BoolS UseTestware;

extern BoolS UseFocusCal;

// Pins
extern PinM reg25;
extern PinM reg33;
extern PinM pack;
extern PinM bat;
extern PinM vcc;
extern PinM fuse;
extern PinML dig_all;
extern PinML dig_init_lo;
extern PinML dig_init_hi;
extern PinML dig_init_hiz;
extern PinML por_agg_pins;
extern PinML ana_all;
extern PinML dctm_all;
extern PinML power_pins;
extern PinM dctm_pin;

// Ecbit control
extern UnsignedSL ALL_ECBITS;
extern UnsignedSL ALL_RELAYS_EXCEPT_R5V;

// Power_supplies
extern FloatM VCC_Irange;

// May need to handle following variables per site
// They are only handled for all sites so far in DUTPowerxx procedures //LB
extern BoolS PACK_connected;

const IntS BYTE_SIZE = 8;
const IntS MAX_PINS	= 4;
const IntS MAX_SAMPLES = 3;
const StringS STRING_NULL = "000000000000000000000000000000000000000000000000";

// Enums
enum DigitalType {DCL,PPMU,DCL_PPMU,VM};
enum AnalogType {FV,FI,HIZ};
enum RegType {AFE, AGG};
enum RegSetup {REG, SETB, CLRB};

// Functions prototypes
extern void Initialize_ecbits ();
extern void Initialize_digital_pins ();
extern void Initialize_hardware ();
extern void Initialize_instruments ();
extern void Initialize_VIs (PinML pins);
extern void FV_VI (PinML pins, FloatM value_v, FloatM range_v, FloatM range_i, FloatM clamp_i, BoolS Gate_and_Connect);
extern void FV_VI_extended_negative_clamp (PinML pins, FloatM value_v, FloatM range_v, FloatM range_i, FloatM clamp_i, BoolS Gate_and_Connect);
extern void FI_VI (PinML pins, FloatM value_i, FloatM range_i, FloatM range_v, FloatM clamp_v, BoolS Gate_and_Connect);
extern void FI_VI_programmable_negative_clamp (PinML pins, FloatM value_i, FloatM range_i, FloatM range_v, FloatM clamp_v_max, FloatM clamp_v_min, BoolS Gate_and_Connect);

const IntS MAX_CAPT_SIZE_I2C = 8;
const IntS MAX_SRC_SIZE_I2C = 8;
