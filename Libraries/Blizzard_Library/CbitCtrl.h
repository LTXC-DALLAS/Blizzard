//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                CbitCtrl.h                                                //
//                                  v1.4				                                              //     
//                                                                                          //
//  This is the header file to the Applications Cbit control drivers (CbitCtrl).            //
// Control over ECBITs, CBOC, and wrappers for similar control of Tester Cbits is included. //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////
//                                Revision Log			                                        //
//////////////////////////////////////////////////////////////////////////////////////////////
//  2011-07-26 v1.4    : jat    Fixed issue in EcbitSet which would reset all cbits if you  //
//                              called EcbitSet with the same cbits that were already closed//
//  2011-06-13 v1.3    : jat    Added in Tester Cbit control                                //
//                              Changed cbitPins in CbitClose, CbitOpen, CbitSet in .cpp    //
//                              to inPins to match function declaration in .h file.         //
//                              Added in Ecbit readback functionality                       //
//  2011-06-07 v1.2    : jat    Added in waitTime parameter to CbitClose, CbitOpen, CbitSet //
//                              and ResetAllCbit wrappers.                                  //
//                              Added NO_CBIT CbitType.                                     //
//                              Removed some function headers from CbitCtrl.h because they  //
//                              were really for debug or internal CbitCtrl use, not for     //
//                              external use                                                //
//                              Made function prototypes extern in Cbit.h                   //
//                              Reformatted output of PrintEcbitShadowList                  //
//                              Removed default useCbitType from wrapper functions          //
//  2011-06-02 v1.1    : jat    moved variables from CbitCtrl.h to CbitCtrl.cpp to fix      //
//                              'duplicate var' errors during linking when CbitCtrl.h is    //
//                              included in multiple .cpp files in a library.               //
//  2011-05-06 v1.0    : jat    initial release                                             //
//////////////////////////////////////////////////////////////////////////////////////////////


#ifndef _APPS_CBIT_H
#define _APPS_CBIT_H
#include <Unison.h>

enum CbitType
{ 
    NO_CBIT = 0,
    ECBIT = 1,
    CBOC = 2, 
    TESTERCBIT = 3, 
};

typedef EnumS<CbitType> enCbitType;

enum EcbitReadbackType
{
    ECBIT_READ_SHADOW,          // readback the Ecbit driver shadow list
    ECBIT_READ_CPLD,            // readback what the Ecbit module CPLD has as closed
    ECBIT_XOR_CPLD_SHADOW,      // xor the CPLD readback with the Ecbit shadow list and return that
};

typedef EnumS<EcbitReadbackType> enEcbitReadbackType;

const short ECBITS_PER_CAGE = 256;
const short ECBIT_NUMBER_OF_BLOCKS_PER_CAGE = 16;
const short ECBIT_NUMBER_OF_REGISTERS_PER_BLOCK = 4;
const short ECBIT_REVISION_REGISTER_ADDRESS = 0x00;
const short ECBIT_VALID_REVISION = 0x07;
const short ECBIT_BLOCK_REGISTER_ADDRESS = 0x4;
const short ECBIT_BLOCK_WRITE_ENABLE_BIT = 0x10;
const short ECBIT_CBIT_REGISTER_0_ADDRESS = 0x9;
const short ECBIT_CBIT_REGISTER_1_ADDRESS = 0x8;
const short ECBIT_CBIT_REGISTER_2_ADDRESS = 0xB;
const short ECBIT_CBIT_REGISTER_3_ADDRESS = 0xA;
const short ECBIT_CBIT_REGISTER_ADDRESSES[4] = {ECBIT_CBIT_REGISTER_0_ADDRESS, ECBIT_CBIT_REGISTER_1_ADDRESS, ECBIT_CBIT_REGISTER_2_ADDRESS, ECBIT_CBIT_REGISTER_3_ADDRESS};
const short ECBIT_DRIVER_COMMAND_REGISTER_ADDRESS = 0x01;
const short ECBIT_DRIVER_UPDATE_COMMAND = 0x02;
const short ECBIT_DRIVER_RESET_COMMAND = 0x01;

const double ECBIT_DRIVER_UPDATE_WAIT = 0.000012;  // it takes 12us for the drivers to get updated

const short MAX_NUMBER_OF_CAGES = 4;




extern void CloseCbits(PinML inPins, enCbitType useCbitType, FloatS waitTime = 0.0);
extern void OpenCbits(PinML inPins, enCbitType useCbitType, FloatS waitTime = 0.0);
extern void SetCbits(PinML inPins, enCbitType useCbitType, FloatS waitTime = 0.0);
extern void ResetAllCbits(enCbitType useCbitType, FloatS waitTime = 0.0);
//////////////////////////////////////////////////////////////////////////////////////////////////////
// extern void CloseCbits(PinML inPins, enCbitType useCbitType, FloatS waitTime = 0.0);             //
// extern void OpenCbits(PinML inPins, enCbitType useCbitType, FloatS waitTime = 0.0);              //
// extern void SetCbits(PinML inPins, enCbitType useCbitType, FloatS waitTime = 0.0);               //
// extern void ResetAllCbits(enCbitType useCbitType, FloatS waitTime = 0.0);                        //
//                                                                                                  //
// These functions form the body of cbit wrapper calls. These functions are written to work on any  //
// cbit type in the X-series tester. Except ResetAll they take a PinML and an EnumS of the type of  //
// cbits to work with. Depending on the CbitType, this wrapper will call the appropriate cbit       //
// driver function.                                                                                 //
//                                                                                                  //
// Valid useCbitType are: NO_CBIT, ECBIT, CBOC, & TESTERCBIT                                        //
//                                                                                                  //
// The difference between the functions is:                                                         //
//                                                                                                  //
// CloseCbits - closes the cbit pins passed in as inPins, leaving all other cbits alone             //
// OpenCbits  - opens the cbit pins passed in as inPins, leaving all other cbits alone              //
// SetCbits   - closes the cbit pins passed in as inPins and opens all  cbits of the same type not  //
//            listed in inPins (inPins is a snapshot of all relays that should be closed at the     //
//            end of running SetCbits, thus not relying on the previous state of the cbits          //
//            NOTE: Calling SetCbits with an empty pin list will open all cbits of the CbitType.    //
// ResetAllCbits - Opens all cbits of the appropriate type.                                         //
//                                                                                                  //
// :NOTE: Close, Open & Set use a static list of Cbits that shadows Cbits that this module closed   //
// in order to improve performance. Therefore, do not mix your own Cbit custom methods with this    //
// module for the same Cbit type. Also, if you compile your program, the shadow list is wiped so    //
// may not mirror the actual hardware. The same is true for cycling tester head or dut power        //
// switches on the tester. In these cases, make sure to run a ResetAllCbits to clear hardware and   //
// the software shadow lists. A ResetAll somewhere in OnInit should ensure mirroring.               //
//                                                                                                  //
// :NOTE: SetCbits and ResetAllCbits REQUIRE that you run InitializeTesterCbitLists before use if   //
// you are using TESTERCBIT. This is because tester cbit syntax requires a set of 'used' tester     //
// cbits for context for the Set and ResetAll functionality.                                        //
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
// :NOTE: Currently only Ecbits are implemented in Open/Close/Set Cbits!                            //
// :TODO: Implement the other cbit types (CBOC & Tester)                                            //
//////////////////////////////////////////////////////////////////////////////////////////////////////





extern void EcbitClose(UnsignedSL cbitChannels);
extern void EcbitOpen(UnsignedSL cbitChannels);
extern void EcbitSet(UnsignedSL cbitChannels);
//////////////////////////////////////////////////////////////////////////////////////////////////////
// extern void EcbitClose (UnsignedSL cbitChannels);                                                //
// extern void EcbitOpen  (UnsignedSL cbitChannels);                                                //
// extern void EcbitSet   (UnsignedSL cbitChannels);                                                //
//                                                                                                  //
// These functions form the basic Ecbit driver calls. They all take in an UnsignedSL of cbit        //
// channel numbers. The difference between the functions is:                                        //
//                                                                                                  //
// EcbitClose - closes the ecbits listed in cbitChannels, leaving all other cbits alone             //
// EcbitOpen  - opens the ecbits listed in cbitChannels, leaving all other cbits alone              //
// EcbitSet   - closes the ecbits listed in cbitChannels and opens all ecbits not listed in         //
//              cbitChannels (cbitChannels is a snapshot of all relays that should be closed at the //
//              end of running EcbitSet, thus not relying on the previous state of the ecbits       //
//                                                                                                  //
// :NOTE: Close, Open & Set use a static list of Cbits that shadows Cbits that this module closed   //
// in order to improve performance. Therefore, do not mix your own Cbit custom methods with this    //
// module for the same Cbit type. Also, if you compile your program, the shadow list is wiped so    //
// may not mirror the actual hardware. The same is true for cycling tester head or dut power        //
// switches on the tester. In these cases, make sure to run a ResetAllCbits to clear hardware and   //
// the software shadow lists. A ResetAll somewhere in OnInit should ensure mirroring.               //
//////////////////////////////////////////////////////////////////////////////////////////////////////


extern void EcbitResetAll();
//////////////////////////////////////////////////////////////////////////////////////////////////////
// extern void EcbitResetAll();                                                                     //
//                                                                                                  //
// EcbitResetAll resets all Ecbit modules present, opening all ecbits and clearing any flags,       //
// settings, and empties the software ecbit shadow list.                                            //
//////////////////////////////////////////////////////////////////////////////////////////////////////

extern void PrintEcbitShadowList(BoolS enable, StringS identifier = "");
//////////////////////////////////////////////////////////////////////////////////
// extern void PrintEcbitShadowList(BoolS enable, StringS identifier = "")      //
//                                                                              //
// This function prints the Ecbit Shadow List to the dataviewer if              //
// enable is true.                                                              //
// identifier is optional and is added to the statement so you can track        //
// the shadow list at various points and keep things straight in the            //
// datalog.                                                                     //
//                                                                              //
// Statement format is: identifier + " Ecbit shadow list is: " + list           //
//                                                                              //
// The shadow list is a software list used to track how the hardware            //
// should be setup. This list is used to speed performance of the module        //
// However, power loss to the Cbit circuity or compilation of the               //
// program can cause the shadow list and the hardware to mismatch. In           //
// this case, a ResetAllCbits should be performed to reset hardware and         //
// software to a known state. A ResetAll somewhere in OnInit should             //
// ensure mirroring.                                                            //
//////////////////////////////////////////////////////////////////////////////////

extern UnsignedSL EcbitReadback (enEcbitReadbackType readbackType, BoolS printResult = true, StringS identifier = "");
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// extern UnsignedSL EcbitReadback (enEcbitReadbackType readbackType, BoolS printResult = true, StringS identifier = "");   //     
//                                                                                                                          //
// This function reads back data from the Ecbit module based on readbackType                                                //
// ECBIT_READ_SHADOW                                                                                                        //
//      Return the Ecbit driver shadow list                                                                                 //
//      Added for completeness. Can be used instead of PrintEcbitShadowList                                                 //
// ECBIT_READ_CPLD                                                                                                          //
//      Return the data in the CPLD registers that hold what Ecbits should be closed; this is not the driver state, but     //
//      the CPLD registers.                                                                                                 //
// ECBIT_XOR_CPLD_SHADOW                                                                                                    //
//      Readback the data in the CPLD registers and return the XORed value of the CPLD registers and the driver shadow list //
//      if the two match, the returned list will be empty.                                                                  //
//                                                                                                                          //
// If printResult is true, then the results will be printed to the dataviewer as well as returned. The format of the print  //
// will be:                                                                                                                 //
//  identifier + " Ecbit readback mode: " + readbackType + " is: " + list                                                   //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////






extern void TesterCbitSet(PinML inPins);
extern void TesterCbitResetAll();
//////////////////////////////////////////////////////////////////////////////////////////////////////
// extern void TesterCbitSet (PinML inPins);                                                        //
// extern void TesterCbitResetAll();                                                                //
//                                                                                                  //
// TesterCbitClose & TesterCbitOpen are trivial and not worth creating functions. However,          //
// TesterCbitSet and TesterCbitResetAll are special cases that will require a function in order to  //
// check that a pre-condition has been met.                                                         //
//                                                                                                  //
// TesterCbitSet takes in a PinML of tester cbit pins (HCOVICBIT, OVICBIT, FXCBIT).                 //
// It closes the cbits listed in inPins and opens all cbits not listed in inPins, but were          //
// designated as being used by calling TesterCbitInitializeVars                                     //
//                                                                                                  //
////////////////////////// READ IMPORTANT NOTE BELOW!  ///////////////////////////////////////////////
//                                                                                                  //
// :NOTE: TesterCbitSet and TesterCbitResetAll REQUIRE that you run TesterCbitInitializeVars        //
// before use. This is because tester cbit syntax requires a set of 'used' tester cbits for context //
// for the Set and ResetAll functionality.                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////////////

extern void TesterCbitInitializeVars(PinML usedTesterCbits);
//////////////////////////////////////////////////////////////////////////////////////////////////////
// extern void TesterCbitInitializeVars(PinML usedTesterCbits);                                     //
//                                                                                                  //
// This function takes a PinML as an input and saves it off for future use by TesterCbitSet.        //
// This list is necessary to give the CBIT driver context for the Set command. In order for         //
// TesterCbitSet, SetCbits and ResetAllCbits to work properly, when the latter 2 are called with    //
// TESTERCBIT, this function must be called and every tester cbit in your program must be passed    //
// in. This is usually accomplished during OnLoad as it only needs to happen once.                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////


#endif  // _APPS_CBIT_H

