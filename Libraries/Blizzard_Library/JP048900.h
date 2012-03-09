#include <Unison.h>

using namespace std;

// Function prototypes...
TMResultM  CaptureFlashProc();
TMResultM  Check_Skey_Status_Probe_Proc();
TMResultM  OpenCTOs();
TMResultM  dmy_erase_current_proc();
TMResultM  dmy_pageerase_current_proc();
TMResultM  dmy_ierase_current_proc();
TMResultM  dmy_ipageerase_current_proc();
TMResultM  DVSProc();
TMResultM  EnterBypassmode();
TMResultM  EnterExternalControlMode();
TMResultM  EnterFTESTmode();
TMResultM  EnterScanmode();
TMResultM  ToxLeakProc();
TMResultM  ConnectVPP();
TMResultM  DisconnectVPP();
TMResultM  cc_erase_current_proc();
TMResultM  cc_pageerase_current_proc();
TMResultM  cc_pageerase_current_32pages_proc();
TMResultM  cc_ierase_current_proc();
TMResultM  cc_ipageerase_current_proc();
TMResultM  cc_ipageerase_current_3pages_proc();
TMResultM  WaitTime();
TMResultM  Prog_DieID_Proc();
TMResultM  ROMdumpProc();
TMResultM  RAMselfProc();
TMResultM  ChangeVCC();
