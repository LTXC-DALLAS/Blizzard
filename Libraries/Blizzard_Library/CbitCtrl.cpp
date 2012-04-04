//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                CbitCtrl.cpp                                              //
//                                  v1.5				                                    //     
//                                                                                          //
//  This is the source file to the Applications Cbit control drivers (CbitCtrl).            //
// Control over ECBITs, CBOC, and wrappers for similar control of Tester Cbits is included. //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////
//                                Revision Log			                                    //
//////////////////////////////////////////////////////////////////////////////////////////////
//  2012-03-23 v1.5    : jat    Changed SYS.ReadDutBus to work with UOP.SJ20120316 and above//
//                              This means that this version is only compatible with builds //
//                              of Unison equivalent or newer than that!!!                  //
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

#include <CbitCtrl.h>
#include <Unison.h>
#include <iostream>

UnsignedS CbitGetMaxCage()
{
//////////////////////////////////////////////////////////////////////////
// UnsignedS CbitGetMaxCage()                                           //
//                                                                      //
// Returns the max cage number based on head type.                      //
//        0 for LX, 1 for MX, 3 for EX, -1 and throws warning otherwise //
//////////////////////////////////////////////////////////////////////////
    StringS test_head_type = SYS.GetTestHeadType();
    if (test_head_type == "LX") return (0);
    if (test_head_type == "MX") return (1);
    if (test_head_type == "EX") return (3);
    ERR.ReportError(ERR_GENERIC_WARNING, "CbitCtrl only works on LX, MX, or EX systems.", test_head_type, NO_SITES, UTL_VOID);
    return(-1);
}

//if statements take time, commented out debug code to give driver fast-as-possible execution
//BoolS gDebugCbits = false;
//BoolS gDebugCbitTime = false;
UnsignedSL gEcbitShadowList;
UnsignedS gCbitMaxCage = CbitGetMaxCage();
UnsignedS gCbitNumCages = gCbitMaxCage + 1;
PinML gAllUsedTesterCbits;
BoolS gTesterCbitsInitialized = false;

void PrintCbitTimer(BoolS enable, StringS message)
{
//////////////////////////////////////////////////////////////////////////////////////
// PrintCbitTimer(BoolS enable, StringS message)                                    //
//                                                                                  //
// This function is merely a nicety for profiling execution times.                  //
// If enable is false, it returns immediately.                                      //
// There are several modes depending on the contents of message.                    //
// If message is empty, then a timer is started. The reference time is set to 0.    //
// If message is "update", the reference time is updated to the current timer time  //
// If message is "stop_timer", then the total time from the timer start to now is   //
// reported to the dataviewer.                                                      //
// If message is anything else, the difference between the current time and the     //
// reference time is printed to the dataviewer and the reference time is set to the //
// current time.                                                                    //
//                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////

    if (!enable)
        return;

    static double last_time;
    double report_time;
    double current_time;
    
        
    if (message.Length() < 1)
    {
        last_time = 0.;
        TIME.StartTimer();
        return;
    }
    if (message == "update")
    {
        last_time = TIME.GetTimer();
        return;
    }
    if (message == "stop_timer") 
    {
        std::cout << "Total time was: " << TIME.StopTimer() << "\n";
        return;
    }
    current_time = TIME.GetTimer();
    report_time = current_time - last_time;
    last_time = current_time;
    std::cout << message << report_time << "\n";
}

UnsignedSL CbitPinToChannel(PinML inPins)
{
//////////////////////////////////////////////////////////////////////////////////////////////////////
// UnsignedSL CbitPinToChannel(PinML inPins)                                                        //
//                                                                                                  //
// This function takes a pin list (inPins) and converts it into an UnsignedSL list of associated    //
// channel numbers.                                                                                 //
//                                                                                                  //
// The order of the returned channels is in ascending order with duplicate channels removed from    //
// the list (ie channels shared across sites only show up once).                                    //
// Note, all original order and site information is lost.                                           //
//////////////////////////////////////////////////////////////////////////////////////////////////////
    
    IntM pin_channels;
    IntS num_sites = ActiveSites.GetNumSites();
    IntS num_pins = inPins.GetNumPins();
    UnsignedSL channel_list;

    for (PinMLIter pin_iter = inPins.Begin(); !pin_iter.End(); pin_iter++)
    {
        pin_channels = (*pin_iter).GetResourceInstance();
        for (SiteIter site = ActiveSites.Begin(); !site.End(); site++)
        {
            channel_list += pin_channels[site.GetValue()];
        }
    }
    channel_list.AscendingSort(true);  // removes redundant channels and sorts list
    return (channel_list);
}

void PrintList (const UnsignedSL &printThisList)
{    
    int list_length = printThisList.GetSize();
       
    if (list_length == 0)
        std::cout << "[]\n";
    else
    {
        for (int i = 0; i < list_length; i++)
        {   
            if ((i % 10 == 0) && (i != 0))
                std::cout << ",\n \t" << printThisList[i];
            else if (i == 0)
                std::cout << "[\t" << printThisList[i];
            else if (i % 10 == 1)
                std::cout << " \t" << printThisList[i];
            else
                std::cout << ", \t" << printThisList[i];
        }
        std::cout << " ]\n";
    }           
}











/////////////////////////////////// ECBIT Section ///////////////////////////////////////////

UnsignedSL EcbitReadCpld ()
//////////////////////////////////////////////////////////////////////////////////////////////
// UnsignedSL EcbitReadCpld ()                                                              //
//                                                                                          //
// This function reads the CPLD registers on the Ecbit modules and returns a list of Ecbit  //
// numbers that have been programmed as closed in the Ecbit module.                         //
//////////////////////////////////////////////////////////////////////////////////////////////
{
    UnsignedSL cbits_closed;
    UnsignedS reg_data;
    UnsignedS reg_data_read;
    UnsignedS sim_data = 0;
 
    for (UnsignedS cage_num = 0; cage_num < gCbitMaxCage; cage_num++)
    {
        /////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////// :HACK: //////////////////////////////////////////////
        /////////////////////////////////////// :HACK: //////////////////////////////////////////////
        /////////////////////////////////////// :HACK: //////////////////////////////////////////////
        // :HACK: This is the only way I know of to check if an Ecbit module is present; however,  //
        // if the software rev ever changes, this code is screwed because of it.                   //
        /////////////////////////////////////// :HACK: //////////////////////////////////////////////
        /////////////////////////////////////// :HACK: //////////////////////////////////////////////
        /////////////////////////////////////// :HACK: //////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////
//        SYS.ReadDUTBus(SYS_BUS_PARALLEL, cage_num, ECBIT_REVISION_REGISTER_ADDRESS, reg_data_read, ECBIT_VALID_REVISION);
        if (reg_data_read == ECBIT_VALID_REVISION)  // we found a valid Ecbit module
        {
            for (IntS block_num = 0; block_num < 16; block_num++)
            {
                reg_data = block_num | ECBIT_BLOCK_WRITE_ENABLE_BIT;
                SYS.WriteDUTBus(SYS_BUS_PARALLEL, cage_num, ECBIT_BLOCK_REGISTER_ADDRESS, (int)reg_data);
                for (IntS reg_num = 0; reg_num < 4; reg_num++)
                {
//                    SYS.ReadDUTBus(SYS_BUS_PARALLEL, cage_num, ECBIT_CBIT_REGISTER_ADDRESSES[reg_num], reg_data_read, sim_data);
                    for (UnsignedS i = 0; i < 4; i++)
                    {
                        if (reg_data_read & (1 << (i*2)))
                        {   // skip enable bits, only look at data bits
                            // 256 ECBITS per cage, 16 per block, 4 per reg, 1 per bit
                            cbits_closed += (cage_num * 256) + (block_num * 16) + (reg_num * 4) + i + 1; // Ecbits start at 1, not 0
                        }
                    }
                }  // reg loop inside block
            } // end block loop
        } // if we found an Ecbit module
    } // end cage loop
    return (cbits_closed);
}

UnsignedSL EcbitReadback (enEcbitReadbackType readbackType, BoolS printResult, StringS identifier)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// UnsignedSL EcbitReadback (enEcbitReadbackType readbackType, BoolS printResult = true, StringS identifier = "");          //     
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
{
    UnsignedSL ecbit_readback_list;
    UnsignedSL ecbit_return_list;
    
    switch (readbackType)
    {
        case ECBIT_READ_SHADOW:
            gEcbitShadowList.AscendingSort();
            ecbit_return_list = gEcbitShadowList;
            break;
        case ECBIT_READ_CPLD:
            ecbit_return_list = EcbitReadCpld();
            break;
        case ECBIT_XOR_CPLD_SHADOW:
            gEcbitShadowList.AscendingSort();            
            ecbit_readback_list = EcbitReadCpld();
            ecbit_return_list += (ecbit_readback_list - gEcbitShadowList);
            ecbit_return_list += (gEcbitShadowList - ecbit_readback_list);
            break;
        default:
            break;
    }
    
    if (printResult)
    {
        std::cout << identifier << " Ecbit readback mode: " << readbackType + " is: \n";
        PrintList(ecbit_return_list);
    }
  
    return (ecbit_return_list);
}

void PrintEcbitShadowList(BoolS enable, StringS identifier)
//////////////////////////////////////////////////////////////////////////
// void PrintEcbitShadowList(BoolS enable, StringS identifier = "")     //
//                                                                      //
// This function prints the Ecbit Shadow List to the dataviewer if      //
// enable is true.                                                      //
// identifier is optional and is added to the statement so you can track//
// the shadow list at various points and keep things straight in the    //
// datalog.                                                             //
//                                                                      //
// Statement format is: identifier + " Ecbit shadow list is: " + list   //
//////////////////////////////////////////////////////////////////////////
{
    if (enable)
    {
        gEcbitShadowList.AscendingSort(true);
        
        std::cout << identifier << " Ecbit shadow list is: \n";
        PrintList(gEcbitShadowList);
    }   
}

UnsignedS2D EcbitGetBlockData(UnsignedSL cbitChannels, BoolS1D &cage_vals_changed)
{
//////////////////////////////////////////////////////////////////////////////////////////////////////
// UnsignedS2D EcbitGetBlockData(UnsignedSL cbitChannels, BoolS1D & cage_vals_changed)              //
//                                                                                                  //
// This function takes a list of ecbit channel numbers and returns a 2 dimensional array            //
// containing the compressed bit data of each ecbit module block which can be used to write to      //
// the ecbit module. The format is like this:                                                       //
// UnsignedS2D[cage_number][block_number] = 0x####                                                  //
// where #### are the 16 ecbits for ecbit block block_number in the X-series cage cage_number       //
// The bit order is: bit[0] is the lowest ecbit number of the block, bit[15] the highest.           //
//                                                                                                  //
// The function also populates cage_vals_changed with true for cages that have a cbitChannel        //
// passed in and false otherwise. (Can be used to skip writing ecbits in cages where there are no   //
// changes.)                                                                                        //
//////////////////////////////////////////////////////////////////////////////////////////////////////

    UnsignedS2D block_data(gCbitNumCages,ECBIT_NUMBER_OF_BLOCKS_PER_CAGE,0);  // 1024 possible Ecbits in 4 cages with 16 blocks each
    UnsignedS cage_num, channel_within_cage, block_num, adjusted_channel_number;

    UnsignedS max_channel = gCbitNumCages*ECBITS_PER_CAGE - 1;
    
    for (UnsignedSLIter channel_iter = cbitChannels.Begin(); !channel_iter.End(); channel_iter++)
    {
        adjusted_channel_number = (*channel_iter) - 1;
        if (adjusted_channel_number > max_channel) // if more than the tester can possibly have
        {
            UnsignedS error_channel = (*channel_iter);    
            ERR.ReportError(ERR_GENERIC_WARNING, "ECBIT channel number can not exist on current tester config.", error_channel, NO_SITES, UTL_VOID);
            continue;
        }
        
        // Bitwise OR in cbit channel into correct block
        // This will give 4 cages of 16 blocks of 16 channels, for full capability of 
        // 1024 Ecbits given an Ecbit module in each of the 4 card cages. 
        // 
        // Each data block will later be split into the 2 registers for each block of the 
        // Ecbit module
        cage_num = adjusted_channel_number/ECBITS_PER_CAGE;
        channel_within_cage = adjusted_channel_number%ECBITS_PER_CAGE;  
        block_num = channel_within_cage/ECBIT_NUMBER_OF_BLOCKS_PER_CAGE;
        cage_vals_changed[cage_num] = true;

        // Now put the channel into the correct cage, block, and bit within the block        
        block_data[cage_num][block_num] |= (1 << (channel_within_cage%ECBIT_NUMBER_OF_BLOCKS_PER_CAGE));
    }
    return (block_data);
}

void EcbitResetAll()
{
//////////////////////////////////////////////////////////////////////////////////////////////////////
// void EcbitResetAll();                                                                            //
//                                                                                                  //
// EcbitResetAll resets all Ecbit modules present, opening all ecbits and clearing any flags,       //
// settings, and empties the software ecbit shadow list.                                            //
//////////////////////////////////////////////////////////////////////////////////////////////////////
    for (int cage_num = 0; cage_num <= gCbitMaxCage; cage_num++)
    {
        SYS.WriteDUTBus(SYS_BUS_PARALLEL, cage_num, ECBIT_DRIVER_COMMAND_REGISTER_ADDRESS, ECBIT_DRIVER_RESET_COMMAND);
    }
    gEcbitShadowList.Erase();
}

void EcbitClose (UnsignedSL cbitChannels)
{
//////////////////////////////////////////////////////////////////////////////////////////////////////
// void EcbitClose (UnsignedSL cbitChannels)                                                        //
//                                                                                                  //
// This function will close all ecbits that are contained in cbitChannels leaving all other ecbits  //
// unchanged.                                                                                       //
// :NOTE: This function depends on a shadow list state. As such a ResetAll should be performed      //
// after DUT power cycles or program compilations.                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////

    UnsignedS2D block_data(gCbitNumCages,ECBIT_NUMBER_OF_BLOCKS_PER_CAGE,0);  // 1024 possible Ecbits in 4 cages with 16 blocks each
    BoolS1D cage_cbits_changed(gCbitNumCages,false);


//    if (gDebugCbits) 
//    {
//        std::cout << "Performing EcbitClose on channels:\n";
//        for (UnsignedSLIter channel = cbitChannels.Begin(); !channel.End(); channel++)
//        {
//            std::cout << (*channel) << "\n";
//        } // end channel for loop
//    } // end if debug

    UnsignedSL cbits_to_close;
    
    cbits_to_close = cbitChannels - gEcbitShadowList;

    if (cbits_to_close.GetSize() < 1) return;  // No Ecbits to close, so return.

    block_data = EcbitGetBlockData(cbits_to_close, cage_cbits_changed);
    
    UnsignedS single_block_data;
    UnsignedS register_data, cage_num;
    UnsignedS block_address_register_data;
    
    for (cage_num = 0; cage_num <= gCbitMaxCage; cage_num++)
    {
        if (cage_cbits_changed[cage_num])
        {
            for (int block = 0; block < ECBIT_NUMBER_OF_BLOCKS_PER_CAGE; block++)
            {
                single_block_data = block_data[cage_num][block];
                if (single_block_data == 0) continue;
                    
                // Now we're serious. We have a block with data to write to the Ecbit module.
                // Let's go ahead and write to the block address register (Aren't you excited? I am!)                  
                block_address_register_data = block | ECBIT_BLOCK_WRITE_ENABLE_BIT;
                SYS.WriteDUTBus(SYS_BUS_PARALLEL, cage_num, ECBIT_BLOCK_REGISTER_ADDRESS, block_address_register_data);             
//                if (gDebugCbits) 
//                {
//                    std::cout << "Writing Dut Bus:\n";
//                    std::cout << "cage number: " << cage_num << "\n";
//                    printf("Reg Address: 0x%02x Data: 0x%02x \n", ECBIT_BLOCK_REGISTER_ADDRESS, (int)block_address_register_data); 
//                } // end if debug
                       
                for (int i = 0; i<ECBIT_NUMBER_OF_REGISTERS_PER_BLOCK; i++)
                {
                    // place the channels into the data bit for each register
                    register_data = ((single_block_data & 0x0008) << 3) + ((single_block_data & 0x0004) << 2) + ((single_block_data & 0x0002) << 1) + ((single_block_data & 0x0001));
                    // now that we've pulled the data for this register out of single_block_data, let's shift those bits off 
                    // so the next run through the loop will get the next chunk
                    single_block_data >>= 4;
 
                    if (register_data > 0)
                    {
                        // now replicate the data bit into the write enable bit for each register since we're closing them
                        register_data |= (register_data << 1);
                        // Now we get to write to the DUT Bus with the cbit data for this nibble.
                        SYS.WriteDUTBus(SYS_BUS_PARALLEL, cage_num, ECBIT_CBIT_REGISTER_ADDRESSES[i], register_data);
//                        if (gDebugCbits) 
//                        {
//                            std::cout << "Writing Dut Bus:\n";
//                            std::cout << "cage number: " << cage_num << "\n";
//                            printf("Reg Address: 0x%02x Data: 0x%02x \n", ECBIT_CBIT_REGISTER_ADDRESSES[i], (int)register_data); 
//                        } // end if debug
                    }  // end if register data contains anything
                } // end block data-register loop
            } // end block loop
        } // end if cage ecbits changed
    } // end cage loop
    
    // Now we've written to all the blocks that need to be in the CPLD. Now we need to
    // tell the CPLD to push the data out to the driver chips. We waited until the end
    // of the above loop so that all cages drivers are updated at approximately the same
    // time (like the user would think, so we don't have issues of cbits flipping with 
    // possibly noticeable delays between cages
    // So we have to cage loop again...
    for (cage_num = 0; cage_num <= gCbitMaxCage; cage_num++)
    {
        if (cage_cbits_changed[cage_num])
        {
            SYS.WriteDUTBus(SYS_BUS_PARALLEL, cage_num, ECBIT_DRIVER_COMMAND_REGISTER_ADDRESS, ECBIT_DRIVER_UPDATE_COMMAND);
//            if (gDebugCbits) 
//            {
//                std::cout << "Writing Dut Bus:\n";
//                std::cout << "cage number: " << cage_num << "\n";
//                printf("Reg Address: 0x%02x Data: 0x%02x \n", ECBIT_DRIVER_COMMAND_REGISTER_ADDRESS, ECBIT_DRIVER_UPDATE_COMMAND); 
//            } // end if debug
        } // end if cage cbits changed for cbit driver update
    }  // end cage loop for driver update
    gEcbitShadowList += cbits_to_close;
    
    // Now we wait for the cbit driver chips to get set up
    TIME.Wait(ECBIT_DRIVER_UPDATE_WAIT);
    
}  // end EcbitClose function

void EcbitOpen (UnsignedSL cbitChannels)
{
//////////////////////////////////////////////////////////////////////////////////////////////////////
// void EcbitOpen (UnsignedSL cbitChannels)                                                         //
//                                                                                                  //
// This function will open all ecbits that are contained in cbitChannels leaving all other ecbits   //
// unchanged.                                                                                       //
// :NOTE: This function depends on a shadow list state. As such a ResetAll should be performed      //
// after DUT power cycles or program compilations.                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////

    UnsignedS2D block_data(gCbitNumCages,ECBIT_NUMBER_OF_BLOCKS_PER_CAGE,0);  // 1024 possible Ecbits in 4 cages with 16 blocks each
    BoolS1D cage_cbits_changed(gCbitNumCages,false);

//    if (gDebugCbits) 
//    {
//        std::cout << "Performing EcbitOpen on channels:\n";
//        for (UnsignedSLIter channel = cbitChannels.Begin(); !channel.End(); channel++)
//        {
//            std::cout << (*channel) << "\n";
//        } // end channel for loop
//    } // end if debug

    UnsignedSL cbits_to_open;
    
    cbits_to_open = cbitChannels - (cbitChannels - gEcbitShadowList);

    if (cbits_to_open.GetSize() < 1) return;  // No Ecbits to open, so return.

    block_data = EcbitGetBlockData(cbits_to_open, cage_cbits_changed);
    
    UnsignedS single_block_data;
    UnsignedS register_data, cage_num;
    UnsignedS block_address_register_data;
    
    for (cage_num = 0; cage_num <= gCbitMaxCage; cage_num++)
    {
        if (cage_cbits_changed[cage_num])
        {
            for (int block = 0; block < ECBIT_NUMBER_OF_BLOCKS_PER_CAGE; block++)
            {
                single_block_data = block_data[cage_num][block];
                if (single_block_data == 0) continue;
                    
                // Now we're serious. We have a block with data to write to the Ecbit module.
                // Let's go ahead and write to the block address register (Aren't you excited? I am!)                  
                block_address_register_data = block | ECBIT_BLOCK_WRITE_ENABLE_BIT;
                SYS.WriteDUTBus(SYS_BUS_PARALLEL, cage_num, ECBIT_BLOCK_REGISTER_ADDRESS, block_address_register_data);             
//                if (gDebugCbits) 
//                {
//                    std::cout << "Writing Dut Bus:\n";
//                    std::cout << "cage number: " << cage_num << "\n";
//                    printf("Reg Address: 0x%02x Data: 0x%02x \n", ECBIT_BLOCK_REGISTER_ADDRESS, (int)block_address_register_data); 
//                } // end if debug
                       
                for (int i = 0; i<ECBIT_NUMBER_OF_REGISTERS_PER_BLOCK; i++)
                {
                    // place the channels into the write enable bit for each register
                    // since this is open cbits, we will leave the data bit of each cbit as 0
                    register_data = ((single_block_data & 0x0008) << 4) + ((single_block_data & 0x0004) << 3) + ((single_block_data & 0x0002) << 2) + ((single_block_data & 0x0001) << 1);
                    // now that we've pulled the data for this register out of single_block_data, let's shift those bits off 
                    // so the next run through the loop will get the next chunk
                    single_block_data >>= 4;
 
                    if (register_data > 0)
                    {
                        // Now we get to write to the DUT Bus with the cbit data for this nibble.
                        SYS.WriteDUTBus(SYS_BUS_PARALLEL, cage_num, ECBIT_CBIT_REGISTER_ADDRESSES[i], register_data);
//                        if (gDebugCbits) 
//                        {
//                            std::cout << "Writing Dut Bus:\n";
//                            std::cout << "cage number: " << cage_num << "\n";
//                            printf("Reg Address: 0x%02x Data: 0x%02x \n", ECBIT_CBIT_REGISTER_ADDRESSES[i], (int)register_data); 
//                        } // end if debug
                    }  // end if register data contains anything
                } // end block data-register loop
            } // end block loop
        } // end if cage ecbits changed
    } // end cage loop
    
    // Now we've written to all the blocks that need to be in the CPLD. Now we need to
    // tell the CPLD to push the data out to the driver chips. We waited until the end
    // of the above loop so that all cages drivers are updated at approximately the same
    // time (like the user would think, so we don't have issues of cbits flipping with 
    // possibly noticeable delays between cages
    // So we have to cage loop again...
    for (cage_num = 0; cage_num <= gCbitMaxCage; cage_num++)
    {
        if (cage_cbits_changed[cage_num])
        {
            SYS.WriteDUTBus(SYS_BUS_PARALLEL, cage_num, ECBIT_DRIVER_COMMAND_REGISTER_ADDRESS, ECBIT_DRIVER_UPDATE_COMMAND);
//            if (gDebugCbits) 
//            {
//                std::cout << "Writing Dut Bus:\n";
//                std::cout << "cage number: " << cage_num << "\n";
//                printf("Reg Address: 0x%02x Data: 0x%02x \n", ECBIT_DRIVER_COMMAND_REGISTER_ADDRESS, ECBIT_DRIVER_UPDATE_COMMAND); 
//            } // end if debug
        } // end if cage cbits changed for cbit driver update
    }  // end cage loop for driver update
    gEcbitShadowList -= cbits_to_open;
    
    // Now we wait for the cbit driver chips to get set up
    TIME.Wait(ECBIT_DRIVER_UPDATE_WAIT);

}
void EcbitSet (UnsignedSL cbitChannels)
{
//////////////////////////////////////////////////////////////////////////////////////////////////////
// void EcbitSet (UnsignedSL cbitChannels)                                                          //
//                                                                                                  //
// This function will close all ecbits that are contained in cbitChannels and open all ecbits that  //
// are not contained in cbitChannels. (This makes cbitChannels a snapshot of all ecbits that are    //
// closed after running EcbitSet, and does not depend upon previous hardware states.)               //
// :NOTE: This function depends on a shadow list state. As such a ResetAll should be performed      //
// after DUT power cycles or program compilations.                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////

    UnsignedS2D block_data_open(gCbitNumCages,ECBIT_NUMBER_OF_BLOCKS_PER_CAGE,0);  // 1024 possible Ecbits in 4 cages with 16 blocks each
    UnsignedS2D block_data_close(gCbitNumCages,ECBIT_NUMBER_OF_BLOCKS_PER_CAGE,0);  // 1024 possible Ecbits in 4 cages with 16 blocks each
    BoolS1D cage_cbits_changed_close(gCbitNumCages,false);
    BoolS1D cage_cbits_changed_open(gCbitNumCages,false);

//    if (gDebugCbits) 
//    {
//        std::cout << "Performing EcbitSet on channels:\n";
//        for (UnsignedSLIter channel = cbitChannels.Begin(); !channel.End(); channel++)
//        {
//            std::cout << (*channel) << "\n";
//        } // end channel for loop
//    } // end if debug

    UnsignedSL cbits_to_close;
    UnsignedSL cbits_to_open;
    
    cbits_to_close = cbitChannels - gEcbitShadowList;
    cbits_to_open = gEcbitShadowList - cbitChannels;

    UnsignedSL stay_closed_list = gEcbitShadowList - cbits_to_open;
    if ((cbits_to_close.GetSize() < 1) && (stay_closed_list.GetSize() == 0)) // No Ecbits to close and all shadowed are to be opened
    {
        EcbitResetAll();  
        return;  
    }

    block_data_close = EcbitGetBlockData(cbits_to_close, cage_cbits_changed_close);
    block_data_open = EcbitGetBlockData(cbits_to_open, cage_cbits_changed_open);
    
    UnsignedS single_block_data_close, single_block_data_open;
    UnsignedS register_data, cage_num;
    UnsignedS block_address_register_data;
    
    for (cage_num = 0; cage_num <= gCbitMaxCage; cage_num++)
    {
        if (cage_cbits_changed_close[cage_num] || cage_cbits_changed_open[cage_num])
        {
            for (int block = 0; block < ECBIT_NUMBER_OF_BLOCKS_PER_CAGE; block++)
            {
                single_block_data_close = block_data_close[cage_num][block];
                single_block_data_open = block_data_open[cage_num][block];
                    
                // Now we're serious. We have a block with data to write to the Ecbit module.
                // Let's go ahead and write to the block address register (Aren't you excited? I am!)  
                if ((single_block_data_close > 0) || (single_block_data_open > 0))
                {
                    block_address_register_data = block | ECBIT_BLOCK_WRITE_ENABLE_BIT;
                    SYS.WriteDUTBus(SYS_BUS_PARALLEL, cage_num, ECBIT_BLOCK_REGISTER_ADDRESS, block_address_register_data);             
//                    if (gDebugCbits) 
//                    {
//                        std::cout << "Writing Dut Bus:\n";
//                        std::cout << "cage number: " << cage_num << "\n";
//                        printf("Reg Address: 0x%02x Data: 0x%02x \n", ECBIT_BLOCK_REGISTER_ADDRESS, (int)block_address_register_data); 
//                    } // end if debug
                       
                    for (int i = 0; i<ECBIT_NUMBER_OF_REGISTERS_PER_BLOCK; i++)
                    {
                        if ((single_block_data_close > 0) && !(single_block_data_open > 0))
                        {
                            // place the channels into the data bit for each register
                            register_data = ((single_block_data_close & 0x0008) << 3) + ((single_block_data_close & 0x0004) << 2) + ((single_block_data_close & 0x0002) << 1) + ((single_block_data_close & 0x0001));
                            // now that we've pulled the data for this register out of single_block_data, let's shift those bits off 
                            // so the next run through the loop will get the next chunk
                            single_block_data_close >>= 4;
                            register_data |= (register_data << 1);
                        } else if (!(single_block_data_close > 0) && (single_block_data_open > 0))
                        {
                            // place the channels into the data bit for each register
                            register_data = ((single_block_data_open & 0x0008) << 4) + ((single_block_data_open & 0x0004) << 3) + ((single_block_data_open & 0x0002) << 2) + ((single_block_data_open & 0x0001) << 1);
                            // now that we've pulled the data for this register out of single_block_data, let's shift those bits off 
                            // so the next run through the loop will get the next chunk
                            single_block_data_open >>= 4;
                        } else  // we've already checked both < 0, so both must be > 0 to get here
                        {
                            // place the channels into the data bit for each register
                            register_data = ((single_block_data_close & 0x0008) << 3) + ((single_block_data_close & 0x0004) << 2) + ((single_block_data_close & 0x0002) << 1) + ((single_block_data_close & 0x0001));
                            register_data |= (register_data << 1);
                            register_data |= ((single_block_data_open & 0x0008) << 4) + ((single_block_data_open & 0x0004) << 3) + ((single_block_data_open & 0x0002) << 2) + ((single_block_data_open & 0x0001) << 1);
                            single_block_data_close >>= 4;
                            single_block_data_open >>= 4;
                        }                       
                        // Now we get to write to the DUT Bus with the cbit data for this nibble.
                        SYS.WriteDUTBus(SYS_BUS_PARALLEL, cage_num, ECBIT_CBIT_REGISTER_ADDRESSES[i], register_data);
//                        if (gDebugCbits) 
//                        {
//                            std::cout << "Writing Dut Bus:\n";
//                            std::cout << "cage number: " << cage_num << "\n";
//                            printf("Reg Address: 0x%02x Data: 0x%02x \n", ECBIT_CBIT_REGISTER_ADDRESSES[i], (int)register_data); 
//                        } // end if debug
                    } // end block data-register loop
                } // end if open or close block
            } // end block loop
        } // end if cage_cbits_changed
    } // end cage loop
    
    // Now we've written to all the blocks that need to be in the CPLD. Now we need to
    // tell the CPLD to push the data out to the driver chips. We waited until the end
    // of the above loop so that all cages drivers are updated at approximately the same
    // time (like the user would think, so we don't have issues of cbits flipping with 
    // possibly noticeable delays between cages
    // So we have to cage loop again...
    for (cage_num = 0; cage_num <= gCbitMaxCage; cage_num++)
    {
        if (cage_cbits_changed_close[cage_num] or cage_cbits_changed_open[cage_num])
        {
            SYS.WriteDUTBus(SYS_BUS_PARALLEL, cage_num, ECBIT_DRIVER_COMMAND_REGISTER_ADDRESS, ECBIT_DRIVER_UPDATE_COMMAND);
//            if (gDebugCbits) 
//            {
//                std::cout << "Writing Dut Bus:\n";
//                std::cout << "cage number: " << cage_num << "\n";
//                printf("Reg Address: 0x%02x Data: 0x%02x \n", ECBIT_DRIVER_COMMAND_REGISTER_ADDRESS, ECBIT_DRIVER_UPDATE_COMMAND); 
//            } // end if debug
        } else if (cbitChannels.GetSize() == 0) { // added if to fix case of calling double set on same cbits would reset -- jt v1.4
            // we put this here so that resetting one cage is in quick succession to updating the other cages 
            // in order to have most cbits switch relatively close together like the user would expect
            SYS.WriteDUTBus(SYS_BUS_PARALLEL, cage_num, ECBIT_DRIVER_COMMAND_REGISTER_ADDRESS, ECBIT_DRIVER_RESET_COMMAND);
        } // end if cage_cbits_changed
    }  // end cage loop for driver update

    gEcbitShadowList = gEcbitShadowList - cbits_to_open + cbits_to_close;

    
    // Now we wait for the cbit driver chips to get set up
    TIME.Wait(ECBIT_DRIVER_UPDATE_WAIT);
    

}  // end EcbitSet













/////////////////////////////////// Tester Cbit Section ///////////////////////////////////////////

void TesterCbitInitializeVars(PinML usedTesterCbits)
//////////////////////////////////////////////////////////////////////////////////////////////////////
// void TesterCbitInitializeVars(PinML usedTesterCbits);                                            //
//                                                                                                  //
// This function takes a PinML as an input and saves it off for future use by TesterCbitSet.        //
// This list is necessary to give the CBIT driver context for the Set command. In order for         //
// TesterCbitSet, SetCbits and ResetAllCbits to work properly, when the latter 2 are called with    //
// TESTERCBIT, this function must be called and every tester cbit in your program must be passed    //
// in. This is usually accomplished during OnLoad as it only needs to happen once.                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////
{
    if (usedTesterCbits.GetNumPins() < 1)
    {
        ERR.ReportError(ERR_GENERIC_WARNING, "TesterCbitInitializeVars requires at least one pin. Enter all Tester-type Cbits being used on the board.", usedTesterCbits, NO_SITES, UTL_VOID);
        return;
    }
    gAllUsedTesterCbits = usedTesterCbits;
    gTesterCbitsInitialized = true;
}

void TesterCbitSet(PinML inPins)
//////////////////////////////////////////////////////////////////////////////////////////////////////
// void TesterCbitSet (PinML inPins);                                                               //
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
{
    if (!gTesterCbitsInitialized) 
    {
        ERR.ReportError(ERR_GENERIC_WARNING, "You must run TesterCbitInitializeVars (at least once per program load) with all Tester Cbits used on this board before running TesterCbitSet or SetCbits with TESTERCBIT.", UTL_VOID, NO_SITES, UTL_VOID);
        return;
    }
    CBIT.Set(gAllUsedTesterCbits, inPins);
}

void TesterCbitResetAll()
//////////////////////////////////////////////////////////////////////////////////////////////////////
// void TesterCbitResetAll ();                                                                      //
//                                                                                                  //
// TesterCbitResetAll opens all Tester Cbits previously passed in to TesterCbitInitializeVars       //
//                                                                                                  //
////////////////////////// READ IMPORTANT NOTE BELOW!  ///////////////////////////////////////////////
//                                                                                                  //
// :NOTE: TesterCbitSet and TesterCbitResetAll REQUIRE that you run TesterCbitInitializeVars        //
// before use. This is because tester cbit syntax requires a set of 'used' tester cbits for context //
// for the Set and ResetAll functionality.                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////////////
{
    if (!gTesterCbitsInitialized) 
    {
        ERR.ReportError(ERR_GENERIC_WARNING, "You must run TesterCbitInitializeVars (at least once per program load) with all Tester Cbits used on this board before running TesterCbitResetAll or ResetAllCbits with TESTERCBIT.", UTL_VOID, NO_SITES, UTL_VOID);
        return;
    }
//    PinML empty_list;
    CBIT.Open(gAllUsedTesterCbits);
}













/////////////////////////////////// Cbit wrapper Section ///////////////////////////////////////////

void CloseCbits(PinML inPins, enCbitType useCbitType, FloatS waitTime)
{      
    switch (useCbitType)
    {
        case NO_CBIT:
            return;
        case ECBIT:
            EcbitClose(CbitPinToChannel(inPins));
            break;
        case TESTERCBIT:
            CBIT.Close(inPins);
            break;
        /////////////////////////////////////////////////////////////////
        // :TODO: Add CBOC cbit types into this                        //
        /////////////////////////////////////////////////////////////////
        default:
            ERR.ReportError(ERR_GENERIC_WARNING, "Currently, only ECBIT and TESTERCBIT is implemented for CloseCbits.", useCbitType, NO_SITES, UTL_VOID);
    } // end switch
    
    if (waitTime > 0.) 
        TIME.Wait(waitTime);
}
void OpenCbits(PinML inPins, enCbitType useCbitType, FloatS waitTime)
{
    switch (useCbitType)
    {
        case NO_CBIT:
            return;
        case ECBIT:
            EcbitOpen(CbitPinToChannel(inPins));
            break;
        case TESTERCBIT:
            CBIT.Open(inPins);
            break;
        /////////////////////////////////////////////////////////////////
        // :TODO: Add CBOC cbit types into this                        //
        /////////////////////////////////////////////////////////////////
        default:
            ERR.ReportError(ERR_GENERIC_WARNING, "Currently, only ECBIT and TESTERCBIT is implemented for OpenCbits.", useCbitType, NO_SITES, UTL_VOID);
    } // end switch
    
    if (waitTime > 0.) 
        TIME.Wait(waitTime);
}

void SetCbits(PinML inPins, enCbitType useCbitType, FloatS waitTime)
{    
    switch (useCbitType)
    {
        case NO_CBIT:
            return;
        case ECBIT:
            EcbitSet(CbitPinToChannel(inPins));
            break;
        case TESTERCBIT:
            TesterCbitSet(inPins);
            break;
        /////////////////////////////////////////////////////////////////
        // :TODO: Add CBOC cbit types into this                        //
        /////////////////////////////////////////////////////////////////
        default:
            ERR.ReportError(ERR_GENERIC_WARNING, "Currently, only ECBIT and TESTERCBIT is implemented for SetCbits.", useCbitType, NO_SITES, UTL_VOID);
    } // end switch

    if (waitTime > 0.) 
        TIME.Wait(waitTime);
}

void ResetAllCbits(enCbitType useCbitType, FloatS waitTime)
{
    switch (useCbitType)
    {
        case NO_CBIT:
            return;
        case ECBIT:
            EcbitResetAll();
            break;
        case TESTERCBIT:
            TesterCbitResetAll();
            break;
        /////////////////////////////////////////////////////////////////
        // :TODO: Add CBOC cbit types into this                        //
        /////////////////////////////////////////////////////////////////
        default:
            ERR.ReportError(ERR_GENERIC_WARNING, "Currently, only ECBIT and TESTERCBIT is implemented for ResetAllCbits.", useCbitType, NO_SITES, UTL_VOID);
    } // end switch
    
    if (waitTime > 0.)
        TIME.Wait(waitTime);
}

