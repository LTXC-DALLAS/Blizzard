 /****************************************************************************/
 /*  A01 : Initial version of F021 Flash VLCT STD LIB.          KChau 10/09/09 */
 /*                                                                            */
 /* 10/27/09  KChau                                                            */
 /*           -Modified CG(tcr7), EG Lkg(tcr23) to subtract pump lkg(tcr86) for*/
 /*            true bank lkg.                                                  */
 /*                                                                            */
 /*  A1.1 : Released with VT/BCC enable.                        KChau 11/10/09 */
 /*                                                                            */
 /* 11/18/09  KChau                                                            */
 /*           -Updated TNUM_OTP_RD_ID_MBOX,TNUM_OTP_RD_LOG1_MBOX to reflect    */
 /*            new OTP offset/format change.                                   */
 /*                                                                            */
 /*  A1.2 : Released with using new OTP format.                 KChau 11/19/09 */
 /*                                                                            */
 /*  A1.3 : Released with new OTP format with 8us ppw.          KChau 11/30/09 */
 /*                                                                            */
 /* 12/09/09  KChau                                                            */
 /*           -Updated TNUM_BANK_PROG_OCHK/ECHK w/ bit disturb enable.         */
 /*           -Reduced search window GL_BCC_SEARCH_START(1) to 20ua (was 2ua). */
 /*           -Changed IPMOS_Evfy_LLim/ULim to -85ua/-126ua per tech team,     */
 /*            (was -93.5ua/-121ua), pre-IPMOS trim.                           */
 /*                                                                            */
 /*  A1.4 : Released with Charz routines.                       KChau 12/18/09 */
 /*                                                                            */
 /* 01/14/10  KChau                                                            */
 /*           -Config"ed  read,VT/BCC tests to use PSA (was normal) for TTR via*/
 /*            GL_DO_VTx/BCCx_WITH_IRATIO, GL_DO_VT/BCC_WITH_RD_OPTION vars.   */
 /*           -Config"ed VT/BCC tests w/ conditions below & adjusted limits:   */
 /*            BCC0: Vcg=4.4v, tcr=6, ratio=div2                               */
 /*            BCC1: tcr=38, ratio=mult2                                       */
 /*            VT0:  tcr=5                                                     */
 /*            VT1:  tcr=6, forceIref=20ua, ratio=mult2                        */
 /*                                                                            */
 /*  A1.5 : Released for bug fix.                               KChau 01/21/10 */
 /*                                                                            */
 /* 03/01/10  KChau                                                            */
 /*           -New BCC/VT limits/search windows.                               */
 /*                                                                            */
 /*  A1.6 : Released with PMOS Trim.                            KChau 03/15/10 */
 /*                                                                            */
 /*  A1.6.1: Released for stress charz.                         KChau 03/15/10 */
 /*                                                                            */
 /*  A1.7 : Released with Redundancy, fake repair, flash PBIST. KChau 04/09/10 */
 /*                                                                            */
 /*  A1.7.1: Released with new stress/BCC conditions for        KChau 04/09/10 */
 /*          look ahead qual.                                                  */
 /*                                                                            */
 /* 05/13/10  KChau                                                            */
 /*           -Update Iref/IPMOS target/limit for high temp.                   */
 /* 05/17/10  KChau                                                            */
 /*           -Update BCC limits for high temp (Ardentec):                     */
 /*           MainBCC.SSTOP[CHKVT0DRL] = 18ua (was 15ua).                      */
 /*           MainBCC.L/UDELTA[CHKVT0DRL] = +/-8ua (was +/-6ua).               */
 /*           MainBCC.L/UDELTA[CHKVT1DRL] = +/-8ua (was +/-6ua).               */
 /*           MainBCC.L/UDELTA[ONOVT0] = +/-4ua (was +/-2ua).                  */
 /*           MainBCC.L/UDELTA[EGFG4VT0] = +/-8ua (was +/-5ua).                */
 /*           MainBCC.L/UDELTA[PGMFFVT1] = +/-8ua (was +/-2ua).                */
 /* 05/18/10  KChau                                                            */
 /*           -Changed Otp/MainBCC.LLIM[PGMFFVT1,post] = 6uA (was 10ua).       */
 /*           -WEBS: VLCTSTD.13 -- Update EGFG1/2 to datalog only.             */
 /*           -WEBS: VLCTSTD.11 -- changed BCC ONO delta limit to +/-8ua.      */
 /*                                                                            */
 /*  A1.8 : Released for EFR.                                   KChau 05/25/10 */
 /*                                                                            */
 /* 05/26/10  KChau                                                            */
 /*           -Update BCC/VT record to use previous post-stress value in delta */
 /*            calculation as pre-stress value.                                */
 /*           -Disable all MainVT and OtpVT.ENA[VT1].                          */
 /* 06/04/10  KChau                                                            */
 /*           -Added control var to enable masking data 1s in echk/ochk on     */
 /*            bcc0 pbist. to use with Shell035 or later.                      */
 /*           -Enable TI_FlashESDAEna as default.                              */
 /*                                                                            */
 /*  A1.9 : Released for Yield Learning.                        KChau 06/08/10 */
 /*                                                                            */
 /* 06/24/10  KChau                                                            */
 /*           -Corrected BCC DG delta limit to +/-16uA with applied IRatio,    */
 /*            was +/-8ua before IRatio.                                       */
 /* 07/01/10  KChau                                                            */
 /*           -Changed BCC TUNOX delta limit to +/-20uA, was +/-10uA.          */
 /*                                                                            */
 /*  A1.10 : Released for Yield Learning.                       KChau 07/01/10 */
 /*                                                                            */
 /****************************************************************************/
 /* 07/22/10  KChau                                                            */
 /*           -Making changes for TV2.0                                        */
 /*           -Update TCR125, TCR126.                                          */
 /*           -Added TCR 102,103, 107-110.                                     */
 /*           -Modified MainBCC/OtpBCC.LLIM/ULIM[*VT1] w/ iratio of x2.        */
 /* 09/01/10  KChau                                                            */
 /*           -Updated datalog, config, override space as new shell changes.   */
 /* 09/24/10  KChau                                                            */
 /*           -Temporary modified to use shell instead of pbist for bcc/vt.    */
 /* 09/30/10  KChau                                                            */
 /*           -Changed MainBCC.L/UDELTA[TUNOXTSMCVT1] to 10ua (was 5ua).       */
 /* 10/07/10  KChau                                                            */
 /*           -Tightened VHV limits: Prog 10% (was 20%), Ers 5% (was 30%/20%). */
 /*           -Temporary modified to use shell instead of pbist for read.      */
 /* 11/02/10  KChau                                                            */
 /*           -Relaxed VHV ERS LLim for high temp to 6% (was 5%).              */
 /*           -Changed CSFG BCC L/UDELTA to 14uA (was 2uA) on tcr110.          */
 /*           -Added tcr72 for internal vt0.                                   */
 /*                                                                            */
 /*  A2.2 : Updated with new shell stress tests.                KChau 10/11/10 */
 /*                                                                            */
 /* 11/16/10  KChau                                                            */
 /*           -Added ipmos trim option using pmos, nmos irefrd, nmos irefev.   */
 /*           -Modified and enabled THINOXVT1.                                 */
 /*                                                                            */
 /*  A2.3 : Updated with ipmos trim option.                     KChau 11/17/10 */
 /*                                                                            */
 /* 11/29/10  KChau                                                            */
 /*           -Changed RDDISTB2 stress to 50ms (was 2s).                       */
 /*           -Added charz RDDISTB2 5v/1.95s stress for datalog only.          */
 /*           -Changed VHV_Pvfy_Target to 3.4v (was 3.0v).                     */
 /*           -WEBS: VLCTSTD.25 -- corrected TCR97 current clamp on TP2.       */
 /*           -Changed DRL BCC limits to:                                      */
 /*            MP2 BCC1: -3ua,5ua (was +/-16ua)                                */
 /*                BCC0: -5ua,5ua (was +/-8ua)                                 */
 /*            MP3 BCC1: -16ua,5ua (was +/-16ua)                               */
 /*                BCC0: -10ua,10ua (was +/-8ua)                               */
 /*                                                                            */
 /*  A2.3.1 : Updated pvfy target and RDDISTB2 condition.       KChau 11/29/10 */
 /*                                                                            */
 /*  A2.3.2 : Released with baseline ipmos trim.                KChau 12/03/10 */
 /*                                                                            */
 /*  A2.3.3.1 : Updated fake repair solutions on bank1.         KChau 12/15/10 */
 /*                                                                            */
 /* 01/04/11  KChau                                                            */
 /*           -Updated using pbist TNUM on read, BCC tests.                    */
 /*                                                                            */
 /*  A2.4 : Released with one pass flash efuse pgm.             KChau 01/15/11 */
 /*                                                                            */
 /* 03/07/11  KChau                                                            */
 /*           -Updated following for qual:                                     */
 /*           -CGEG stress lkg.                                                */
 /*           -New PVFY target 3.6v (was 3.4v), IrefPV 3.10:1 ratio internal.  */
 /*           -RevG blow efuse 22 in all banks, default is false.              */
 /*           -Quadrant based BCC/VT for DRL.                                  */
 /*           -BCC0/BCC1 Delta-Delta at MP2/MP3 to 2ua.                        */
 /*           -N40C DRL/DG limits.                                             */
 /*           -NMOS/PMOS current meas at Vmin and internally supply VCG.       */
 /*           -BCC1Min limits. 25 for non-emulation, 23 for emulation.         */
 /*           -Other limits changes from test specs.                           */
 /*                                                                            */
 /*  A2.5 : Released with changes for qual.                     KChau 03/14/11 */
 /*                                                                            */
 /* 03/15/11  KChau                                                            */
 /*           -More update stresses limits.                                    */
 /*           -Added CSFG TCR110 before TCR84 with datalog only.               */
 /*           -Changed EGFG3 BCC tests as datalog only.                        */
 /*           -Enabled bank efuse bit22 blow.                                  */
 /*                                                                            */
 /* 03/16/11  KChau                                                            */
 /*           -BCC1Min limits to 25.5 for non-emulation, 23 for emulation.     */
 /*           -Increased IPMOS trim iteration to 6 (was 5).                    */
 /*                                                                            */
 /*  A2.6 : Released with changes for qual revG.                KChau 03/15/11 */
 /*                                                                            */
 /* 03/24/11  KChau                                                            */
 /*           -Updated MP2/MP3 IPMOS/INMOS with estimate limits.               */
 /* 03/30/11  KChau                                                            */
 /*           -Relaxed MP3 for revG data collection:                           */
 /*            Main/OtpBCC.LLIM[PGMFFVT1, PUNTHRUVT1, CHKVT1]                  */
 /*              NonEMU = 22.5ua (was 25.5ua), EMU bank = 21ua (was 23ua)      */
 /*            MainBCC.LDELTA[CHKVT1DRL] = -8ua (was -2ua)                     */
 /*            MainBCC.LDELTA[CHKVT0DRL] = -5ua (was -2ua)                     */
 /*            MainBCC.UDELTA[CHKVT0DRL] = 8ua (was 2ua)                       */
 /*            OtpBCC.LDELTA[CHKVT1DRL] = -8ua (was -3ua)                      */
 /* 03/31/11  KChau                                                            */
 /*           -Relaxed MP3 VHV limits to +/-6% (was 3%).                       */
 /* 04/07/11  KChau                                                            */
 /*           -Changed Iref Evfy target to 28.2uA (non-emu).                   */
 /*           -Changed EGFG3 (4v) to pass/fail & EGFG3 (3.5v) to datalog only. */
 /*           -Added MainBCC.L/UDELTA[CHKVT0/1DRL] for EMU bank.               */
 /* 04/13/11  KChau                                                            */
 /*           -Changed DRL BCC0 start search range to 6ua (was 4ua).           */
 /*           -Corrected Iref CV L/ULim to 2uA/10uA.                           */
 /*           -Corrected VSL_Target to 4.8v (was 4.9v).                        */
 /*           -Changed BCC.LLIM_EMU[*VT1,pre] to 23.5ua (was 23ua).            */
 /*           -Changed following:                                              */
 /*            VCG2P5 = 1.825v (was 1.8v),                                     */
 /*            Bank_Iref_Read_Target = 15.5ua (was 15ua),                      */
 /*            Bank_Iref_RDM0 = 11.749ua (was 11.37ua),                        */
 /*            Bank_Iref_RDM1 = 11.685ua (was 19.05ua),                        */
 /*            Bank_Iref_Pvfy = 11.749ua (was 11.37ua),                        */
 /*            Bank_Iref_Evfy = 29.14ua (was 28.2ua),                          */
 /*            Bank_Iref_Evfy_EMU = 26.98ua (was 26.11ua),                     */
 /*           -Changed IPMOS_Trim_Target to -145.7ua (was -141ua).             */
 /*                                                                            */
 /*  A2.7 : Released with changes for qual revG.                KChau 04/15/11 */
 /*                                                                            */
 /* 04/19/11  KChau                                                            */
 /*           -Updated parametrics and DRL limits for MP2 per test specs.      */
 /*                                                                            */
 /****************************************************************************/
 /*                                                                            */
 /* 05/19/11  KChau                                                            */
 /*           -Enabled VT0 and disabled all BCC0 except EGFG4/CHK.             */
 /*           -Added support mixed DRL VT0/BCC1.                               */
 /* 05/25/11  KChau                                                            */
 /*           -Added Sense Amp Noise screen limit of 8.5ua.                    */
 /*           -Added special screen of PPmax=1 and softbin in 1st cycle9x.     */
 /*           -Disabled Efuse Bit22 (not blow).                                */
 /*           -Added Efuse Bit17 blow for bank0/1, not bank2, with precharge   */
 /*            bank0 pc=3, bank1 pc=2, bank2 pc=3.                             */
 /*                                                                            */
 /*  B1.0 : Released for qual with internal VT0 enabled.        KChau 05/27/11 */
 /*                                                                            */
 /* 05/31/11  KChau                                                            */
 /*           -Added VT/BCC for Random code.                                   */
 /* 06/02/11  KChau                                                            */
 /*           -Corrected DRL VT0 delta limit (pre-post).                       */
 /*           -Added DRL VT0 Median or delta-delta limit.                      */
 /* 06/21/11  KChau                                                            */
 /*           -Added TL_EngOvride_VHV_MAXEP_ESTART_ESTEP_CT,                   */
 /*            TL_EngOvride_VHV_ER_CT_MS, TL_Meas_VHV_ER_OvrCT,                */
 /*            TL_StairStep_Erase for stair step erase DOE.                    */
 /*                                                                            */
 /****************************************************************************/
 /*                                                                            */
 /* 06/29/11  KChau                                                            */
 /*           -Unified RAM address/access for all platforms using byte address.*/
 /*           -Added to support new VHV template address at compile.           */
 /*           -Updated to support Stellaris & C2000 devices.                   */
 /*           -Added ESPUMP, FLESBANK type, Icmp10U limit/conditions.          */
 /*           -WEBS: VLCTSTD.35 -- added bank datawidth=64 on FLES bank.       */
 /*           -WEBS: VLCTSTD.36 -- disable IPMOS Odd tests on FLES bank.       */
 /*           -Updated CHKVT0DRL internal VT0 MP2/MP3 limits:                  */
 /*            MP2 : DRLVT0_UDELTA[x] = 1v (was 0.6v)                          */
 /*                  DRLVT0_Median_ULimit[x] = 0.4v (was 0.3v)                 */
 /*            MP3 : DRLVT0_UDELTA[x] = 1v (was 0.7v,0.8v,0.6v bank0/1/2)      */
 /*                  DRLVT0_Median_ULimit[x] = 0.4v (was 0.35v)                */
 /* 07/05/11  KChau                                                            */
 /*           -Removed CSFG TCR84 stress charz.                                */
 /*           -Switch back to use direct trim BGap (was using Vrd)             */
 /*           -Updated limits:                                                 */
 /*            MainBG = 3% at MP3 (was 5%)                                     */
 /*            Icmp10_LLim = -16.5ua at room temp (was -17.5ua)                */
 /*                        = -17.5ua at high temp (was -18.5ua)                */
 /*            Icmp10_ULim = -13.5ua at high temp (was -12.5ua)                */
 /*            Iref_LLim = -10.64ua at high temp (was -14ua)                   */
 /*            Iref_ULim = -8.36ua at high temp (was -8ua)                     */
 /*            VHV_Ers_ULim = 13.75v (was 13.78v or 6%) at high temp           */
 /*            VHV_Prog = 4% at room temp (was 3%), 7% at high temp (was 6%)   */
 /*            VHV_Pvfy = 7% at high temp (was 6%)                             */
 /*            VCG2P5 = 4% at high temp (was 3%)                               */
 /*            Bank_IPMOS_*_L/ULim = 10% (was 8% room, 15% high temp)          */
 /*            Bank_IPMOS_*_Target = -143.3ua at MP2 (was -142.7ua),           */
 /*                                = -110.4ua at MP3 (was -106ua)              */
 /*            Bank_Iref_Read_Target = 15.13ua at MP2 (was 15.2ua),            */
 /*                                  = 12.9ua & 7% MP3 (was 13.5ua, 20%)       */
 /*            Bank_Iref_Pvfy_Target = 11.41ua at MP2 (was 11.48ua)            */
 /*                                  = 9.8ua & 8% at MP3 (was 9ua, 20%)        */
 /*            Bank_Iref_Evfy_Target = 28.52ua at MP2 (was 28.74ua) nonEMU     */
 /*                                  = 26.41ua at MP2 (was 26.581ua) EMU       */
 /*                                  = 24ua & 8% at MP3 (was 22ua, 20%) nonEMU */
 /*                                  = 22.4ua & 8% at MP3 (was 20ua, 20%) EMU  */
 /*            Bank_Iref_RDM0_Target = 11.41ua at MP2 (was 11.48ua)            */
 /*                                  = 9.8ua & 8% at MP3 (was 9.3ua, 20%)      */
 /*            Bank_Iref_RDM1_Target = 19.2ua at MP2 (was 19.246ua)            */
 /*                                  = 16.3ua & 8% at MP3 (was 15.6ua, 20%)    */
 /*            MP3 BCC1 PGMFF Delta = +/-2ua (was 8ua)                         */
 /* 07/08/11  KChau                                                            */
 /*           -Added Charz_FreqSchmoo_RandCode,TL_Schmoo_Freq routine, and     */
 /*            sampling before pgmchkboard in MP1.                             */
 /*                                                                            */
 /*  B1.1 : Released to support C2000 and Stellaris platforms.  KChau 06/29/11 */
 /*                                                                            */
 /* 07/13/11  KChau                                                            */
 /*           -No blow efuse bit17 and changed rd precharge efuse bits to 1 on */
 /*            all banks for revI (was b0 pc=3, b1 pc=2, b2 pc=3).             */
 /* 07/15/11  KChau                                                            */
 /*           -Updated Run_Update_FakeRepair as shell changed.                 */
 /*           -Added sense amp accuracy charz.                                 */
 /*                                                                            */
 /*  B2.0 : Released with changes for revI.                     KChau 07/16/11 */
 /*                                                                            */
 /* 07/20/11  KChau                                                            */
 /*           -Updated Charz_SenAmpNoise_RPC_EF,TL_EngOvride_RPC_EF,           */
 /*            SAMP_Noise_Screen_func to support override bank efuse bit23-13  */
 /*            & rdpc via mailbox.                                             */
 /* 07/25/11  KChau                                                            */
 /*           -Disabled RandCode freq schmoo.                                  */
 /*           -Enabled SA noise charz with EF17, and do RPC0-3 (was 0-7),      */
 /*            and run at MP1,MP2,MP3.                                         */
 /*                                                                            */
 /*  B2.1 : Released with changes for revI.                     KChau 07/25/11 */
 /*                                                                            */
 /* 07/26/11  KChau                                                            */
 /*           -Disabled all Iref charz & SA accuracy.                          */
 /*           -Datalog only PUNTHRU,REVTUN,PGMFFVT1 at MP1 as these are also   */
 /*            tested at MP3.                                                  */
 /*           -Changed SA noise & accuracy tw string to format below:          */
 /*            Z_SAN_VMX_B0Q0_PC0_01UA_FBIT, Z_SAACCY_BCC0, Z_SAACCY_IVT0      */
 /* 07/28/11  KChau                                                            */
 /*           -Moved sense amp noise screen after pgm chkboard in MP1.         */
 /*           -Changed sense amp noise charz to do at VMX, pc1 only.           */
 /* 07/29/11  KChau                                                            */
 /*           -Enabled efuse bit22 pgm for qual on FLEPBANK only.              */
 /*           -Corrected BCC/VT RandCode TNUM with arbitrary ecc enable.       */
 /*                                                                            */
 /*  B2.2 : Released for revI qual.                             KChau 07/29/11 */
 /*                                                                            */
 /* 08/01/11  KChau                                                            */
 /*           -Changed VHV CT trim to check against llim instead of llim_pre   */
 /*            to tighten post-trim distribution.                              */
 /*           -Modified FlowCheck_func to disable fail site even COF.          */
 /* 08/04/11  KChau                                                            */
 /*           -WEBS: VLCTSTD.40 -- added check efuse error status reg and fail */
 /*            if errorCode = 0x15/0x5 even ECC is correcting single bit error.*/
 /*           -WEBS: VLCTSTD.41 -- corrected internal VT TT log to TW.         */
 /* 08/11/11  KChau                                                            */
 /*           -Added main array precon before pump vhv trim on retest unit.    */
 /*           -Changed VHV ER CT START to 6 steps on HDPUMP, 7 on ESPUMP.      */
 /*           -Changed TUNOX BCC LDELTA = -20ua (was -2ua) due to new shell    */
 /*            with corrected bank stressing.                                  */
 /*                                                                            */
 /*  B2.3 : Released for revI qual.                             KChau 08/12/11 */
 /*                                                                            */
 /* 08/22/11  KChau                                                            */
 /*           -Added DRL BCC1 median delta.                                    */
 /*                                                                            */
 /*  B2.3.1 : Released for revI qual.                           KChau 08/23/11 */
 /*                                                                            */
 /* 09/06/11  KChau                                                            */
 /*           -Changed BCC1 LLIM pre PUNTHRU, PGMFF:                           */
 /*            non-EMU 22ua (was 22.5ua), EMU 20ua (was 21ua) @MP3/high temp.  */
 /* 09/07/11  KChau                                                            */
 /*           -Changed BCC1 LLIM pre RCODE (same as PUNTHRU/PGMFF):            */
 /*            non-EMU 22ua (was 25.5ua), EMU 20ua (was 23.5ua) @MP3/high temp.*/
 /*                                                                            */
 /*  B2.3.2 : Released for revI qual.                           KChau 09/07/11 */
 /*                                                                            */
 /* 09/16/11  KChau                                                            */
 /*           -Changed DRLVT0_UDELTA bank2 to 1.4v (was 1v) @MP3.              */
 /*                                                                            */
 /*  B2.3.3 : Released for revI qual.                           KChau 09/16/11 */
 /*                                                                            */
 /* 09/20/11  KChau                                                            */
 /*           -Updated target/limits below based on qual wafers:               */
 /*            VCG2P5 target to 1.8v @MP3 (was 1.825v).                        */
 /*            VHV Erease LLim to 11.96v (8%) @MP3 (was 12.22v or 6%).         */
 /*            Iref_RDM1 limits to 7% (17.856ua/20.544ua) @MP2 (was 6%).       */
 /*            Post bake [CHKVT0DRL/RCODEVT0,post] to 2.4v (was 2.7v).         */
 /* 09/20/11  KChau                                                            */
 /*           -Modified VHV PG/ERS/PV CT trim and BandGap direct trim with     */
 /*            adaptive algo for TTR and tighter distribution.                 */
 /*           -Modified EraseRefArray_func & added TL_Boost_RefArray to do     */
 /*            refarr boost to ~iref rd target on retest.                      */
 /*           -Added LPO (LF/HF) Trim using DCC @ PreBurnIn.                   */
 /*           -WEBS: VLCTSTD.42 -- write pump trim solutions to OTP.           */
 /*                                                                            */
 /*  B2.4 : Released for revK wafers.                           KChau 09/20/11 */
 /*                                                                            */
 /* 09/28/11  KChau                                                            */
 /*           -Modified to use various esda image number based on test type.   */
 /*           -Enabled RefArr adaptive erase on FLESBANK.                      */
 /*           -Implemented new target/limits for FLESBANK TCR25,26,27,40,56.   */
 /*                                                                            */
 /* 10/28/11  KChau                                                            */
 /*           -Added PgmOtpSCPL test for Stellaris.                            */
 /*           -Modified FlashCode_WR_EXE_func to support Stellaris for writing */
 /*            SCPL into customer OTP.                                         */
 /*           -Added FlashCode_RdPsa_func to support arbitrary target/data     */
 /*            field including customer otp for Stellaris.                     */
 /*           -Modified MBox_Upload_RCODE_PSA to support various FlashCodeType.*/
 /*           -Moved ADDR_TIOTP_HI/LO[bank] and VHV OTP template RAM location  */
 /*            to f021_config.p device specific.                               */
 /*           -Added FL_PUMP_SUPPLY_NAME configurable parameter for device that*/
 /*            that gang flash pump supply VDD3VFL with other supply on their  */
 /*            test hardware.  Applicable in ReadDisturb2 stress test.         */
 /*           -Added MeasPinTMU_func, F021_FOSC_SoftTrim_External_func to trim */
 /*            FOSC using external pin via DMA TMU for device doesn"t have DCC.*/
 /*           -Added FOSC_VCO_Vmin_func for external FOSC post trim test.      */
 /*           -Added VHV slopect override in MeasInternalVT for ESPUMP.        */
 /*           -Changed BCC.UDELTA[TUNOXVT1] to 2ua (was 10ua).                 */
 /*           -Added pump trim extraction in GetTrimCode_On_EFStr on ESPUMP for*/
 /*            usage in internal vt.                                           */
 /*           -Added internal BCC1 support in TL_Run_BCCVT, MeasInternalVT.    */
 /*           -Updated limits:                                                 */
 /*            Main/OtpVT.LDELTA[CSFGVT0] to -0.5v (was -2.2v)                 */
 /*            MainVT.LDELTA[RDDISTB2VT0] to -0.4v (was -0.7v)                 */
 /*            OtpVT.LDELTA[RDDISTB2VT0]  to -0.4v (was -0.7v)                 */
 /*            OtpVT.UDELTA[RDDISTB2VT0]  to  0.4v (was 0.25v)                 */
 /*                                                                            */
 /*  B3.0 : Released for Catalog Flow.                          KChau 11/24/11 */
 /*                                                                            */
 /****************************************************************************/

#include <Unison.h>
#include <f021_flashvar.h>
using namespace std;

void F021_FlashConfigInclude()
{
    /*std vlct library revision*/
   GL_VLC_LIBREV = "B3.0.2";  /*C06*/

    /*shell library revision (GL_SHELL_LIBREV is in f035_readotpinfo_func*/

#if $TP3_TO_TP5_PRESENT  
#if $TADC_PRESENT  
   GL_TPADMIN = 1;
   GL_TPADMAX = 6;
#else
   GL_TPADMIN = 1;
   GL_TPADMAX = 5;
#endif
#else
   GL_TPADMIN = 1;
   GL_TPADMAX = 2;
#endif

    /*enable flash esda*/
   TI_FlashESDAEna = false;  /*turn off for now Pasa...3/5/12*/
   TI_FlashCharEna = true;  /*enable data collection pmos/nmos iref & internal*/
  
// :TODO: come back and fix this. Unneeded for now due to var being false
//   if(TI_FlashESDAEna)  
//   {
//      MemSetGeometry(4096,32,192);
//      ESDASetProgramID(GL_ESDA_PROGID);
//   } 

   TI_FLASHDEBUG_PRINT = false;

    /*will need to make this device specific ?*/
   GL_USE_RAMPMT_X64 = false;
    /*GL_DO_ESDA_WITH_SCRAM := true;}  {moved to f021_config.p for device specific*/
    /*GL_DO_SOURCE_WITH_SCRAM := true;} {moved to f021_config.p for device specific*/
   GL_DUMP_RAWESDA_TOFILE = true;

   GL_SAVEFLCOFENA = TI_FlashCOFEna;

   IsMainArray = true;
   IsBcc = true;

    /*soft trim*/
   GL_DO_FLASHTRIM       = true;
   GL_DO_BG_DIRECT_TRIM  = true;  /*false=use force bg/meas vrd method*/
   GL_DO_BG_ADAPT_TRIM   = true;  /*do hard trim. if set then soft trim*/
   GL_DO_BG_CHAR_TRIM    = false;
   GL_DO_IREF_ADAPT_TRIM = false;  /*do hard trim. if set then soft trim*/
   GL_DO_IREF_CHAR_TRIM  = false;
   GL_DO_IREF_PMOS_TRIM  = true;   /*true=do bank iref pmos trim*/
   if(GL_BANKTYPE==FLESBANK)  
      GL_DO_REFARR_ERS_ADAPTIVE  = false ; /*true} {blizzard - temporary use deep erase shell*/
   else
      GL_DO_REFARR_ERS_ADAPTIVE  = false;
   GL_DO_BOOST_REFARR = true;
   GL_DO_FOSC_TRIM       = true;  /*true=blow efuse, false=no blow efuse*/

   if(SelectedTITestType==MP1)  
      GL_DO_REDENA = false ; /*blizzard specific} {CHANGED: Should be true but Redundancy doesn"t work on Blizzard*/
   else
      GL_DO_REDENA = false;

    /* RD_OPTION (extended test option TNUM) : 0=normal, 1=psa, 2=esda, 3=repair */
   GL_DO_RD_WITH_TOPTION = 1;  /*psa*/
   GL_DO_VT_FIRST = false;
   GL_DO_VT_USING_INTERNAL = true;   /*note: take precedent over gl_do_vt_using_bidi*/
   GL_DO_VT_USING_BIDI = true;  /*using bidirectional vt method*/
   GL_DO_DRL0_USING_VT = true;   /*false=use bcc, true=use vt*/
   GL_DO_DRL1_USING_VT = false;   /*false=use bcc, true=use vt*/
   GL_DO_VT_MAIN_USING_PBIST = false;  /*true}; {blizzard specific*/
   GL_DO_VT_OTP_USING_PBIST  = false;  /*true}; {blizzard specific*/
   GL_DO_BCC_MAIN_USING_PBIST = false;  /*true}; {blizzard specific*/
   GL_DO_BCC_OTP_USING_PBIST  = false;  /*true}; {blizzard specific*/
   GL_DO_BCC_USING_INTERNAL = true; 
   GL_DO_MASK_1S_BCC0_DRL_PBIST = true;   /*true=mask 1s in echk/ochk, false=not masking*/

   GL_DO_FL_PBIST = false;  /*true};  {use for read} {blizzard specific*/
   GL_DO_PGM_USING_PBIST = false;  /*true};  {use for pgm} {blizzard specific*/

#if $GL_USE_DMLED_RAMPMT  
   GL_DO_ERS_BY_SECTOR = false;  /*use for ers: true=do by sector, false=do by bank*/
#else
   GL_DO_ERS_BY_SECTOR = false;  /*use for ers: true=do by sector, false=do by bank*/
#endif

   if(SelectedTITestType==MP1)  
      GL_DO_VHV_CT_TRIM = true;
   else
      GL_DO_VHV_CT_TRIM = false;

   if(SelectedTITestType==PreBurnIn)  
      GL_DO_LPO_TRIM = true;
   else
      GL_DO_LPO_TRIM = false;
   
    /*--- artificial (fake) repair ---*/
    /*Note: var gl_fakerep_count gets increment in WrEngRow. once it reaches gl_fakerep_sampling*/
    /*then will do fake repair & then reset to 1. the repair solution is upload in PgmOTPTemplate.*/
   GL_DO_REPAIR = false;  /*true}; {blizzard specific*/
   GL_FAKEREP_SAMPLING = 10;  /*repair on every 10th die*/
   GL_FAKEREP_COUNT = 1;

    /*-- LEAK_OPTION (FlashLeakType) definition --*/
   GL_DO_WLS_LEAK_OPTION    = BANK_ODDEVEN;
   GL_DO_BLS_LEAK_OPTION    = BANK_ODDEVEN;
   GL_DO_CGS_LEAK_OPTION    = BANK_ODDEVEN;
   GL_DO_EGCSS_LEAK_OPTION  = BANK_GANG;
   GL_DO_EGS_LEAK_OPTION    = BANK_GANG;

    /*+++ CHARZ +++*/
   GL_DO_CHARZ_ERSREFARR = false;
   GL_CHARZ_ERSREFARR_COUNT = 0;
   GL_CHARZ_ERSREFARR_SAVECOUNT = 0;
   GL_CHARZ_BCC_COUNT = 0;
   GL_DO_CHARZ_PPW = false;
   GL_DO_CHARZ_BCC = false;
   GL_DO_CHARZ_VT  = false;
   GL_DO_CHARZ_BCC_OPTION = SECTTYPE;
   GL_DO_CHARZ_VT_OPTION  = SECTTYPE;
   GL_DO_CHARZ_IREF_RD   = false;
   GL_DO_CHARZ_IREF_PVFY = false;
   GL_DO_CHARZ_IREF_EVFY = false;
   GL_DO_CHARZ_IREF_CVFY = false;
   GL_DO_CHARZ_IREF_RM01 = false;
   GL_DO_CHARZ_IPMOS_RD   = false;
   GL_DO_CHARZ_IPMOS_PVFY = false;
   GL_DO_CHARZ_IPMOS_EVFY = false;
   GL_DO_CHARZ_IPMOS_CVFY = false;
   GL_DO_CHARZ_STRESS = false;
   GL_DO_CHARZ_INTERNAL_IREF_VCG = false;
   GL_DO_CHARZ_FREQ_RANDCODE = false;
   GL_CHARZ_FREQ_RANDCODE_COUNT = 1;
   GL_CHARZ_FREQ_RANDCODE_SAMPLING = 10;
   if(GL_BANKTYPE==FLEPBANK)  
      GL_DO_CHARZ_SAMPNOISE = true;
   else
      GL_DO_CHARZ_SAMPNOISE = false;

   GL_DO_CHARZ_SAMP_ACCY = false;
   GL_DO_SAVE_SAMP_ACCY_DATA = false;  /*enable in vt/bcc func*/
   GL_DO_CHARZ_SAMP_ACCY_COUNT = 1;
   GL_DO_CHARZ_SAMP_ACCY_SAMPLING = 10;

 /*!!! NOTE: auto device should not skip mp2 flow unless approved by f021 team !!!*/
#if $FL_USE_AUTO_FLOW  
   GL_SKIP_MP2_FLASHFLOW = false;
#else
   GL_SKIP_MP2_FLASHFLOW = true;
#endif

    /*use to specify module/bank/sector testing*/
   MODTYPE  = 0;
   BANKTYPE = 1;
   SECTTYPE = 2;
   OTPTYPE  = 3;
   BLOCKTYPE  = 4;
   ARBTYPE  = 0xA;
   QUADTYPE  = 5;  /*quadrant type*/
   FL_MAX_QUADRANT = 3;  /*based 0 so total 4 quadrant*/

   TNUM_TARGET_SECT     = 0x00000100;
   TNUM_TARGET_BLOCK    = 0x00000200;
   TNUM_TARGET_QUAD     = 0x00000300;
   TNUM_TARGET_OTP      = 0x00000400;
   TNUM_TARGET_OTP_SEMI = 0x00000500;
   TNUM_TARGET_OTP_DATA = 0x00000600;
   TNUM_TARGET_OTP_CUSTOMER = 0x00000700;
   TNUM_TARGET_ARB      = 0x00000A00;

   TNUM_DATA_0S         = 0x00000000;
   TNUM_DATA_1S         = 0x00001000;
   TNUM_DATA_ECHK       = 0x00002000;
   TNUM_DATA_OCHK       = 0x00003000;
   TNUM_DATA_ARBITRARY  = 0x0000A000;
   TNUM_DATA_ARB_ECC    = 0x0000B000;
   TNUM_DATA_LOGIC_ECHK = 0x00008000;

   TNUM_TOPTION_NORMAL   = 0x00000000;
   TNUM_TOPTION_PSARD    = 0x00000000;  /*0x00010000;} {blizzard specific*/
   TNUM_TOPTION_ESDARD   = 0x00020000;
   TNUM_TOPTION_REPAIRRD = 0x00030000;

   TNUM_DIV2  = 0x00000000;
   TNUM_MULT1 = 0x00040000;
   TNUM_MULT2 = 0x00080000;
   TNUM_MULT4 = 0x000C0000;

   TNUM_TCR6  = 0x51000000;  
   TNUM_TCR38 = 0x53000000;  
   TNUM_TCR39 = 0x52000000;  
   TNUM_TCR72 = 0x52000000;  
   TNUM_TCR5  = 0x50000000;  

   TNUM_PBIST_RDM1S  = 0xB0011000;
   TNUM_PBIST_RDM0S  = 0xB0020000;
   TNUM_PBIST_VT1S   = 0xB0031000;
   TNUM_PBIST_VT0S   = 0xB0040000;
   TNUM_PBIST_IVT0S  = 0xB00C0000;
   TNUM_PBIST_BCC1S  = 0xB0051000;
   TNUM_PBIST_BCC0S  = 0xB0060000;
   TNUM_PBIST_CUSTCR = 0xB0070000;
   TNUM_FASTPRECON   = 0x32000000;
   TNUM_REDUNDENA    = 0x00800000;
   TNUM_PBIST_MASK1S = 0x00200000;

   TNUM_BIDI_VT = 0x00100000;


    /*+++ Global VT search range/resol +++*/


    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[REVTUNVT1][pre]             = false;
#else
   MainBCC.ENA[REVTUNVT1][pre]             = false;
#endif
   MainBCC.ENARED[REVTUNVT1][pre]          = GL_DO_REDENA;
   switch(SelectedTITestType) {
     case MP1 :     MainBCC.DLOGONLY[REVTUNVT1][pre]        = true;
     default: MainBCC.DLOGONLY[REVTUNVT1][pre]        = false;
   }   /* case */
   MainBCC.SSTART[REVTUNVT1][pre]          = 6uA;
   MainBCC.SSTOP[REVTUNVT1][pre]           = 30uA;
   MainBCC.SRESOL[REVTUNVT1][pre]          = 500nA;
   MainBCC.LLIM[REVTUNVT1][pre]            = 25.5uA;
   MainBCC.ULIM[REVTUNVT1][pre]            = 50uA;
   MainBCC.LLIM_EMU[REVTUNVT1][pre]        = 23.5uA;
   MainBCC.ULIM_EMU[REVTUNVT1][pre]        = 50uA;
   MainBCC.TCRNUM[REVTUNVT1][pre]          = 38;
   MainBCC.IRATIO[REVTUNVT1][pre]          = TNUM_MULT2;
   MainBCC.RDOPTION[REVTUNVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[REVTUNVT1][post]            = true;
#else
   MainBCC.ENA[REVTUNVT1][post]            = (SelectedTITestType==MP3);
#endif
   MainBCC.ENARED[REVTUNVT1][post]         = GL_DO_REDENA;
   switch(SelectedTITestType) {
     case MP1 :     MainBCC.DLOGONLY[REVTUNVT1][post]        = true;
     default: MainBCC.DLOGONLY[REVTUNVT1][post]        = false;
   }   /* case */
   MainBCC.SSTART[REVTUNVT1][post]         = 6uA;
   MainBCC.SSTOP[REVTUNVT1][post]          = 30uA;
   MainBCC.SRESOL[REVTUNVT1][post]         = 500nA;
   MainBCC.LLIM[REVTUNVT1][post]           = 16uA;
   MainBCC.ULIM[REVTUNVT1][post]           = 49uA;
   MainBCC.LLIM_EMU[REVTUNVT1][post]       = 16uA;
   MainBCC.ULIM_EMU[REVTUNVT1][post]       = 49uA;
   MainBCC.TCRNUM[REVTUNVT1][post]         = 38;
   MainBCC.IRATIO[REVTUNVT1][post]         = TNUM_MULT2;
   MainBCC.RDOPTION[REVTUNVT1][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[REVTUNVT1]              = BANKTYPE;
   MainBCC.TDATA[REVTUNVT1]               = TNUM_DATA_1S;
   MainBCC.LDELTA[REVTUNVT1]              = -2uA;
   MainBCC.UDELTA[REVTUNVT1]              = 2uA;
   MainBCC.PREVTYPE[REVTUNVT1]            = PUNTHRUVT1;   /*KChau - yield learning*/

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[PGMFFVT1][pre]             = true;
#else
   MainBCC.ENA[PGMFFVT1][pre]             = (SelectedTITestType==MP3);
#endif   
   MainBCC.ENARED[PGMFFVT1][pre]          = GL_DO_REDENA;
   switch(SelectedTITestType) {
     case MP1 :     MainBCC.DLOGONLY[PGMFFVT1][pre]        = true;
     default: MainBCC.DLOGONLY[PGMFFVT1][pre]        = false;
   } 
   MainBCC.SSTART[PGMFFVT1][pre]          = 4uA;
   MainBCC.SSTOP[PGMFFVT1][pre]           = 30uA;
   MainBCC.SRESOL[PGMFFVT1][pre]          = 500nA;
   switch(SelectedTITestType) {
     case  MP1: case  MP2 :   
        MainBCC.LLIM[PGMFFVT1][pre]            = 25.5uA;
        MainBCC.ULIM[PGMFFVT1][pre]            = 45uA;
        MainBCC.LLIM_EMU[PGMFFVT1][pre]        = 23.5uA;
        MainBCC.ULIM_EMU[PGMFFVT1][pre]        = 45uA;
      break; 
     case  MP3: case  PreBurnIn: case  PostBurnIn1 :   
        MainBCC.LLIM[PGMFFVT1][pre]            = 22.5uA; /*22ua;} {pasa 12/2/11*/
        MainBCC.ULIM[PGMFFVT1][pre]            = 45uA;
        MainBCC.LLIM_EMU[PGMFFVT1][pre]        = 21uA; /*20ua;}{pasa 12/2/11*/
        MainBCC.ULIM_EMU[PGMFFVT1][pre]        = 45uA;
      break; 
     default:  
        MainBCC.LLIM[PGMFFVT1][pre]            = 25.5uA;
        MainBCC.ULIM[PGMFFVT1][pre]            = 45uA;
        MainBCC.LLIM_EMU[PGMFFVT1][pre]        = 23.5uA;
        MainBCC.ULIM_EMU[PGMFFVT1][pre]        = 45uA;
      break; 
   }   /* case */
   MainBCC.TCRNUM[PGMFFVT1][pre]          = 38;
   MainBCC.IRATIO[PGMFFVT1][pre]          = TNUM_MULT2;
   MainBCC.RDOPTION[PGMFFVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[PGMFFVT1][post]            = true;
#else
   MainBCC.ENA[PGMFFVT1][post]            = (SelectedTITestType==MP3);
#endif   
   MainBCC.ENARED[PGMFFVT1][post]         = GL_DO_REDENA;
   switch(SelectedTITestType) {
     case MP1 :     MainBCC.DLOGONLY[PGMFFVT1][post]        = true;
     default: MainBCC.DLOGONLY[PGMFFVT1][post]        = false;
   } 
   MainBCC.SSTART[PGMFFVT1][post]         = 4uA;
   MainBCC.SSTOP[PGMFFVT1][post]          = 30uA;
   MainBCC.SRESOL[PGMFFVT1][post]         = 500nA;
   MainBCC.LLIM[PGMFFVT1][post]           = 18uA;
   MainBCC.ULIM[PGMFFVT1][post]           = 47uA;
   MainBCC.LLIM_EMU[PGMFFVT1][post]       = 18uA;
   MainBCC.ULIM_EMU[PGMFFVT1][post]       = 47uA;
   MainBCC.TCRNUM[PGMFFVT1][post]         = 38;
   MainBCC.IRATIO[PGMFFVT1][post]         = TNUM_MULT2;
   MainBCC.RDOPTION[PGMFFVT1][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[PGMFFVT1]              = BANKTYPE;
   MainBCC.TDATA[PGMFFVT1]               = TNUM_DATA_1S;
   switch(SelectedTITestType) {
     case  MP1: case  MP2: case  FT2 :   
        MainBCC.LDELTA[PGMFFVT1]              = -2uA;
        MainBCC.UDELTA[PGMFFVT1]              = 2uA;
      break; 
     default:  
        MainBCC.LDELTA[PGMFFVT1]              = -2uA;
        MainBCC.UDELTA[PGMFFVT1]              = 2uA;
      break; 
   }   /* case */
   switch(SelectedTITestType) {
     case MP3 :     MainBCC.PREVTYPE[PGMFFVT1]        = PGMFFVT1;
     default: MainBCC.PREVTYPE[PGMFFVT1]        = PGMFFVT1;
   }   /* case */

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[PUNTHRUVT1][pre]             = true;
#else
   MainBCC.ENA[PUNTHRUVT1][pre]             = (SelectedTITestType==MP3);
#endif
   MainBCC.ENARED[PUNTHRUVT1][pre]          = GL_DO_REDENA;
   switch(SelectedTITestType) {
     case MP1 :     MainBCC.DLOGONLY[PUNTHRUVT1][pre]        = true;
     default: MainBCC.DLOGONLY[PUNTHRUVT1][pre]        = false;
   }   /* case */
   MainBCC.SSTART[PUNTHRUVT1][pre]          = 4uA;
   MainBCC.SSTOP[PUNTHRUVT1][pre]           = 30uA;
   MainBCC.SRESOL[PUNTHRUVT1][pre]          = 500nA;
   switch(SelectedTITestType) {
     case  MP1: case  MP2 :   
        MainBCC.LLIM[PUNTHRUVT1][pre]            = 25.5uA;
        MainBCC.ULIM[PUNTHRUVT1][pre]            = 45uA;
        MainBCC.LLIM_EMU[PUNTHRUVT1][pre]        = 23.5uA;
        MainBCC.ULIM_EMU[PUNTHRUVT1][pre]        = 45uA;
      break; 
     case  MP3: case  PreBurnIn: case  PostBurnIn1 :   
        MainBCC.LLIM[PUNTHRUVT1][pre]            = 22.5uA; /*22ua;} {pasa 12/2/11*/
        MainBCC.ULIM[PUNTHRUVT1][pre]            = 45uA;
        MainBCC.LLIM_EMU[PUNTHRUVT1][pre]        = 21uA; /*20ua;} {pasa 12/2/11*/
        MainBCC.ULIM_EMU[PUNTHRUVT1][pre]        = 45uA;
      break; 
     default:  
        MainBCC.LLIM[PUNTHRUVT1][pre]            = 25.5uA;
        MainBCC.ULIM[PUNTHRUVT1][pre]            = 45uA;
        MainBCC.LLIM_EMU[PUNTHRUVT1][pre]        = 23.5uA;
        MainBCC.ULIM_EMU[PUNTHRUVT1][pre]        = 45uA;
      break; 
   }   /* case */
   MainBCC.TCRNUM[PUNTHRUVT1][pre]          = 38;
   MainBCC.IRATIO[PUNTHRUVT1][pre]          = TNUM_MULT2;
   MainBCC.RDOPTION[PUNTHRUVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[PUNTHRUVT1][post]            = true;
#else
   MainBCC.ENA[PUNTHRUVT1][post]            = (SelectedTITestType==MP3);
#endif
   MainBCC.ENARED[PUNTHRUVT1][post]         = GL_DO_REDENA;
   switch(SelectedTITestType) {
     case MP1 :     MainBCC.DLOGONLY[PUNTHRUVT1][post]        = true;
     default: MainBCC.DLOGONLY[PUNTHRUVT1][post]        = false;
   }   /* case */
   MainBCC.SSTART[PUNTHRUVT1][post]         = 4uA;
   MainBCC.SSTOP[PUNTHRUVT1][post]          = 30uA;
   MainBCC.SRESOL[PUNTHRUVT1][post]         = 500nA;
   MainBCC.LLIM[PUNTHRUVT1][post]           = 18uA;
   MainBCC.ULIM[PUNTHRUVT1][post]           = 47uA;
   MainBCC.LLIM_EMU[PUNTHRUVT1][post]       = 18uA;
   MainBCC.ULIM_EMU[PUNTHRUVT1][post]       = 47uA;
   MainBCC.TCRNUM[PUNTHRUVT1][post]         = 38;
   MainBCC.IRATIO[PUNTHRUVT1][post]         = TNUM_MULT2;
   MainBCC.RDOPTION[PUNTHRUVT1][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[PUNTHRUVT1]              = BANKTYPE;
   MainBCC.TDATA[PUNTHRUVT1]               = TNUM_DATA_1S;
   MainBCC.LDELTA[PUNTHRUVT1]              = -2uA;
   MainBCC.UDELTA[PUNTHRUVT1]              = 2uA;
   MainBCC.PREVTYPE[PUNTHRUVT1]            = PUNTHRUVT1;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[FGWLVT1][pre]             = (SelectedTITestType==MP1);
#else
   MainBCC.ENA[FGWLVT1][pre]             = false;
#endif   
   MainBCC.ENARED[FGWLVT1][pre]          = GL_DO_REDENA;
   MainBCC.DLOGONLY[FGWLVT1][pre]        = false;
   MainBCC.SSTART[FGWLVT1][pre]          = 4uA;
   MainBCC.SSTOP[FGWLVT1][pre]           = 30uA;
   MainBCC.SRESOL[FGWLVT1][pre]          = 500nA;
   MainBCC.LLIM[FGWLVT1][pre]            = 25.5uA;
   MainBCC.ULIM[FGWLVT1][pre]            = 45uA;
   MainBCC.LLIM_EMU[FGWLVT1][pre]        = 23.5uA;
   MainBCC.ULIM_EMU[FGWLVT1][pre]        = 45uA;
   MainBCC.TCRNUM[FGWLVT1][pre]          = 38;
   MainBCC.IRATIO[FGWLVT1][pre]          = TNUM_MULT2;
   MainBCC.RDOPTION[FGWLVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[FGWLVT1][post]            = (SelectedTITestType==MP1);
#else
   MainBCC.ENA[FGWLVT1][post]            = false;
#endif   
   MainBCC.ENARED[FGWLVT1][post]         = GL_DO_REDENA;
   MainBCC.DLOGONLY[FGWLVT1][post]       = false;
   MainBCC.SSTART[FGWLVT1][post]         = 4uA;
   MainBCC.SSTOP[FGWLVT1][post]          = 30uA;
   MainBCC.SRESOL[FGWLVT1][post]         = 500nA;
   MainBCC.LLIM[FGWLVT1][post]           = 16uA;
   MainBCC.ULIM[FGWLVT1][post]           = 49uA;
   MainBCC.LLIM_EMU[FGWLVT1][post]       = 16uA;
   MainBCC.ULIM_EMU[FGWLVT1][post]       = 49uA;
   MainBCC.TCRNUM[FGWLVT1][post]         = 38;
   MainBCC.IRATIO[FGWLVT1][post]         = TNUM_MULT2;
   MainBCC.RDOPTION[FGWLVT1][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[FGWLVT1]              = BANKTYPE;
   MainBCC.TDATA[FGWLVT1]               = TNUM_DATA_1S;
   MainBCC.LDELTA[FGWLVT1]              = -2uA;
   MainBCC.UDELTA[FGWLVT1]              = 2uA;
   MainBCC.PREVTYPE[FGWLVT1]            = PGMFFVT1;   /*KChau - yield learning*/


    /*---- pre ----*/
   MainBCC.ENA[TUNOXTSMCVT1][pre]             = false;
   MainBCC.ENARED[TUNOXTSMCVT1][pre]          = GL_DO_REDENA;
   MainBCC.DLOGONLY[TUNOXTSMCVT1][pre]        = false;
   MainBCC.SSTART[TUNOXTSMCVT1][pre]          = 4uA;
   MainBCC.SSTOP[TUNOXTSMCVT1][pre]           = 30uA;
   MainBCC.SRESOL[TUNOXTSMCVT1][pre]          = 500nA;
   MainBCC.LLIM[TUNOXTSMCVT1][pre]            = 25.5uA;
   MainBCC.ULIM[TUNOXTSMCVT1][pre]            = 45uA;
   MainBCC.LLIM_EMU[TUNOXTSMCVT1][pre]        = 23.5uA;
   MainBCC.ULIM_EMU[TUNOXTSMCVT1][pre]        = 45uA;
   MainBCC.TCRNUM[TUNOXTSMCVT1][pre]          = 38;
   MainBCC.IRATIO[TUNOXTSMCVT1][pre]          = TNUM_MULT2;
   MainBCC.RDOPTION[TUNOXTSMCVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainBCC.ENA[TUNOXTSMCVT1][post]            = false;
   MainBCC.ENARED[TUNOXTSMCVT1][post]         = GL_DO_REDENA;
   MainBCC.DLOGONLY[TUNOXTSMCVT1][post]       = false;
   MainBCC.SSTART[TUNOXTSMCVT1][post]         = 4uA;
   MainBCC.SSTOP[TUNOXTSMCVT1][post]          = 30uA;
   MainBCC.SRESOL[TUNOXTSMCVT1][post]         = 500nA;
   MainBCC.LLIM[TUNOXTSMCVT1][post]           = 10uA;
   MainBCC.ULIM[TUNOXTSMCVT1][post]           = 45uA;
   MainBCC.LLIM_EMU[TUNOXTSMCVT1][post]       = 10uA;
   MainBCC.ULIM_EMU[TUNOXTSMCVT1][post]       = 45uA;
   MainBCC.TCRNUM[TUNOXTSMCVT1][post]         = 38;
   MainBCC.IRATIO[TUNOXTSMCVT1][post]         = TNUM_MULT2;
   MainBCC.RDOPTION[TUNOXTSMCVT1][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[TUNOXTSMCVT1]              = BANKTYPE;
   MainBCC.TDATA[TUNOXTSMCVT1]               = TNUM_DATA_1S;
   MainBCC.LDELTA[TUNOXTSMCVT1]              = -20uA; /*-2ua;} {pasa 12/2/11*/
   MainBCC.UDELTA[TUNOXTSMCVT1]              = 10uA;
   MainBCC.PREVTYPE[TUNOXTSMCVT1]            = TUNOXTSMCVT1;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[TUNOXVT1][pre]             = (SelectedTITestType==MP1);
#else
   MainBCC.ENA[TUNOXVT1][pre]             = (SelectedTITestType==MP1);
#endif   
   MainBCC.ENARED[TUNOXVT1][pre]          = GL_DO_REDENA;
   MainBCC.DLOGONLY[TUNOXVT1][pre]        = false;
   MainBCC.SSTART[TUNOXVT1][pre]          = 4uA;
   MainBCC.SSTOP[TUNOXVT1][pre]           = 30uA;
   MainBCC.SRESOL[TUNOXVT1][pre]          = 500nA;
   MainBCC.LLIM[TUNOXVT1][pre]            = 25.5uA;
   MainBCC.ULIM[TUNOXVT1][pre]            = 45uA;
   MainBCC.LLIM_EMU[TUNOXVT1][pre]        = 23.5uA;
   MainBCC.ULIM_EMU[TUNOXVT1][pre]        = 45uA;
   MainBCC.TCRNUM[TUNOXVT1][pre]          = 38;
   MainBCC.IRATIO[TUNOXVT1][pre]          = TNUM_MULT2;
   MainBCC.RDOPTION[TUNOXVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[TUNOXVT1][post]            = (SelectedTITestType==MP1);
#else
   MainBCC.ENA[TUNOXVT1][post]            = (SelectedTITestType==MP1);
#endif   
   MainBCC.ENARED[TUNOXVT1][post]         = GL_DO_REDENA;
   MainBCC.DLOGONLY[TUNOXVT1][post]       = false;
   MainBCC.SSTART[TUNOXVT1][post]         = 4uA;
   MainBCC.SSTOP[TUNOXVT1][post]          = 30uA;
   MainBCC.SRESOL[TUNOXVT1][post]         = 500nA;
   MainBCC.LLIM[TUNOXVT1][post]           = 10uA;
   MainBCC.ULIM[TUNOXVT1][post]           = 45uA;
   MainBCC.LLIM_EMU[TUNOXVT1][post]       = 10uA;
   MainBCC.ULIM_EMU[TUNOXVT1][post]       = 45uA;
   MainBCC.TCRNUM[TUNOXVT1][post]         = 38;
   MainBCC.IRATIO[TUNOXVT1][post]         = TNUM_MULT2;
   MainBCC.RDOPTION[TUNOXVT1][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[TUNOXVT1]              = BANKTYPE;
   MainBCC.TDATA[TUNOXVT1]               = TNUM_DATA_1S;
   MainBCC.LDELTA[TUNOXVT1]              = -20uA;
   MainBCC.UDELTA[TUNOXVT1]              = 10uA; /*2ua;} {pasa 12/2/11*/
   MainBCC.PREVTYPE[TUNOXVT1]            = TUNOXVT1;

    /*---- pre ----*/
   MainBCC.ENA[THINOXVT1][pre]             = (SelectedTITestType==MP1);
   MainBCC.ENARED[THINOXVT1][pre]          = GL_DO_REDENA;
   MainBCC.DLOGONLY[THINOXVT1][pre]        = false;
   MainBCC.SSTART[THINOXVT1][pre]          = 4uA;
   MainBCC.SSTOP[THINOXVT1][pre]           = 30uA;
   MainBCC.SRESOL[THINOXVT1][pre]          = 500nA;
   MainBCC.LLIM[THINOXVT1][pre]            = 25.5uA;
   MainBCC.ULIM[THINOXVT1][pre]            = 45uA;
   MainBCC.LLIM_EMU[THINOXVT1][pre]        = 23.5uA;
   MainBCC.ULIM_EMU[THINOXVT1][pre]        = 45uA;
   MainBCC.TCRNUM[THINOXVT1][pre]          = 38;
   MainBCC.IRATIO[THINOXVT1][pre]          = TNUM_MULT2;
   MainBCC.RDOPTION[THINOXVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainBCC.ENA[THINOXVT1][post]            = (SelectedTITestType==MP1);
   MainBCC.ENARED[THINOXVT1][post]         = GL_DO_REDENA;
   MainBCC.DLOGONLY[THINOXVT1][post]       = false;
   MainBCC.SSTART[THINOXVT1][post]         = 4uA;
   MainBCC.SSTOP[THINOXVT1][post]          = 30uA;
   MainBCC.SRESOL[THINOXVT1][post]         = 500nA;
   MainBCC.LLIM[THINOXVT1][post]           = 15uA;
   MainBCC.ULIM[THINOXVT1][post]           = 47uA;
   MainBCC.LLIM_EMU[THINOXVT1][post]       = 15uA;
   MainBCC.ULIM_EMU[THINOXVT1][post]       = 47uA;
   MainBCC.TCRNUM[THINOXVT1][post]         = 38;
   MainBCC.IRATIO[THINOXVT1][post]         = TNUM_MULT2;
   MainBCC.RDOPTION[THINOXVT1][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[THINOXVT1]              = BANKTYPE;
   MainBCC.TDATA[THINOXVT1]               = TNUM_DATA_1S;
   MainBCC.LDELTA[THINOXVT1]              = -2uA;
   MainBCC.UDELTA[THINOXVT1]              = 5uA;
   MainBCC.PREVTYPE[THINOXVT1]            = THINOXVT1;


    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case  MP1: case MP2 :  MainBCC.ENA[CHKVT1][pre]             = true;
     default: MainBCC.ENA[CHKVT1][pre]             = false;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case  MP1: case MP3 :  MainBCC.ENA[CHKVT1][pre]             = true;
     default: MainBCC.ENA[CHKVT1][pre]             = false;
   }   /* case */
#endif   
   MainBCC.ENARED[CHKVT1][pre]          = false;
   MainBCC.DLOGONLY[CHKVT1][pre]        = false;
   MainBCC.SSTART[CHKVT1][pre]          = 7uA;
   MainBCC.SSTOP[CHKVT1][pre]           = 30uA;
   MainBCC.SRESOL[CHKVT1][pre]          = 500nA;
   switch(SelectedTITestType) {
     case  MP1: case  MP2 :   
        MainBCC.LLIM[CHKVT1][pre]            = 25.5uA;
        MainBCC.ULIM[CHKVT1][pre]            = 45uA;
        MainBCC.LLIM_EMU[CHKVT1][pre]        = 23.5uA;
        MainBCC.ULIM_EMU[CHKVT1][pre]        = 45uA;
      break; 
     case  MP3: case  PreBurnIn: case  PostBurnIn1 :   
        MainBCC.LLIM[CHKVT1][pre]            = 22.5uA;
        MainBCC.ULIM[CHKVT1][pre]            = 45uA;
        MainBCC.LLIM_EMU[CHKVT1][pre]        = 21uA;
        MainBCC.ULIM_EMU[CHKVT1][pre]        = 45uA;
      break; 
     default:  
        MainBCC.LLIM[CHKVT1][pre]            = 25.5uA;
        MainBCC.ULIM[CHKVT1][pre]            = 45uA;
        MainBCC.LLIM_EMU[CHKVT1][pre]        = 23.5uA;
        MainBCC.ULIM_EMU[CHKVT1][pre]        = 45uA;
      break; 
   }   /* case */
   MainBCC.TCRNUM[CHKVT1][pre]          = 38;
   MainBCC.IRATIO[CHKVT1][pre]          = TNUM_MULT2;
   MainBCC.RDOPTION[CHKVT1][pre]        = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
   MainBCC.ENA[CHKVT1][post]            = false;
   MainBCC.ENARED[CHKVT1][post]         = false;
   MainBCC.DLOGONLY[CHKVT1][post]       = false;
   MainBCC.SSTART[CHKVT1][post]         = 7uA;
   MainBCC.SSTOP[CHKVT1][post]          = 30uA;
   MainBCC.SRESOL[CHKVT1][post]         = 500nA;
   MainBCC.LLIM[CHKVT1][post]           = 20uA;
   MainBCC.ULIM[CHKVT1][post]           = 50uA;
   MainBCC.LLIM_EMU[CHKVT1][post]       = 20uA;
   MainBCC.ULIM_EMU[CHKVT1][post]       = 50uA;
   MainBCC.TCRNUM[CHKVT1][post]         = 38;
   MainBCC.IRATIO[CHKVT1][post]         = TNUM_MULT2;
   MainBCC.RDOPTION[CHKVT1][post]       = TNUM_TOPTION_NORMAL;
   switch(SelectedTITestType) {
     case MP3 :     MainBCC.MEMCFG[CHKVT1]              = BANKTYPE;
     default: MainBCC.MEMCFG[CHKVT1]              = QUADTYPE;
   }   /* case */
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case MP1 : MainBCC.TDATA[CHKVT1]       = TNUM_DATA_ECHK;
     case MP2 : MainBCC.TDATA[CHKVT1]       = TNUM_DATA_OCHK;
     default: MainBCC.TDATA[CHKVT1]   = TNUM_DATA_ECHK;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case MP1 : MainBCC.TDATA[CHKVT1]       = TNUM_DATA_1S;
     case MP3 : MainBCC.TDATA[CHKVT1]       = TNUM_DATA_OCHK;
     default: MainBCC.TDATA[CHKVT1]   = TNUM_DATA_ECHK;
   }   /* case */
#endif
   MainBCC.LDELTA[CHKVT1]              = -5uA;
   MainBCC.UDELTA[CHKVT1]              = 5uA;
   MainBCC.PREVTYPE[CHKVT1]            = CHKVT1;


    /*---- pre ----*/
   MainBCC.ENA[CHKVT1DRL][pre]             = false;
   MainBCC.ENARED[CHKVT1DRL][pre]          = false;
   MainBCC.DLOGONLY[CHKVT1DRL][pre]        = false;
   MainBCC.SSTART[CHKVT1DRL][pre]          = 7uA;
   MainBCC.SSTOP[CHKVT1DRL][pre]           = 30uA;
   MainBCC.SRESOL[CHKVT1DRL][pre]          = 500nA;
   MainBCC.LLIM[CHKVT1DRL][pre]            = 25.5uA;
   MainBCC.ULIM[CHKVT1DRL][pre]            = 45uA;
   MainBCC.LLIM_EMU[CHKVT1DRL][pre]        = 23.5uA;
   MainBCC.ULIM_EMU[CHKVT1DRL][pre]        = 45uA;
   MainBCC.TCRNUM[CHKVT1DRL][pre]          = 38;
   MainBCC.IRATIO[CHKVT1DRL][pre]          = TNUM_MULT2;
   MainBCC.RDOPTION[CHKVT1DRL][pre]        = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case  MP2: case MP3 :  MainBCC.ENA[CHKVT1DRL][post]            = true;
     default:  MainBCC.ENA[CHKVT1DRL][post]            = false;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case  MP3: case PreBurnIn :  MainBCC.ENA[CHKVT1DRL][post]            = true;
     default:       MainBCC.ENA[CHKVT1DRL][post]            = false;
   }   /* case */
#endif
   MainBCC.ENARED[CHKVT1DRL][post]         = false;
   MainBCC.DLOGONLY[CHKVT1DRL][post]       = false;
   MainBCC.SSTART[CHKVT1DRL][post]         = 7uA;
   MainBCC.SSTOP[CHKVT1DRL][post]          = 30uA;
   MainBCC.SRESOL[CHKVT1DRL][post]         = 500nA;
   switch(SelectedTITestType) {
     case MP2 :  
              MainBCC.LLIM[CHKVT1DRL][post]           = 22.5uA;
              MainBCC.ULIM[CHKVT1DRL][post]           = 50uA;
              MainBCC.LLIM_EMU[CHKVT1DRL][post]       = 20.5uA;
              MainBCC.ULIM_EMU[CHKVT1DRL][post]       = 50uA;
            break; 
     case MP3 :  
              MainBCC.LLIM[CHKVT1DRL][post]           = 20uA;
              MainBCC.ULIM[CHKVT1DRL][post]           = 50uA;
              MainBCC.LLIM_EMU[CHKVT1DRL][post]       = 20uA;
              MainBCC.ULIM_EMU[CHKVT1DRL][post]       = 50uA;
            break; 
     default:  
              MainBCC.LLIM[CHKVT1DRL][post]           = 20uA;
              MainBCC.ULIM[CHKVT1DRL][post]           = 50uA;
              MainBCC.LLIM_EMU[CHKVT1DRL][post]       = 20uA;
              MainBCC.ULIM_EMU[CHKVT1DRL][post]       = 50uA;
      break; 
   }   /* case */
   MainBCC.TCRNUM[CHKVT1DRL][post]         = 38;
   MainBCC.IRATIO[CHKVT1DRL][post]         = TNUM_MULT2;
   MainBCC.RDOPTION[CHKVT1DRL][post]       = TNUM_TOPTION_NORMAL;
   MainBCC.MEMCFG[CHKVT1DRL]              = QUADTYPE;
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case MP2 : MainBCC.TDATA[CHKVT1DRL]       = TNUM_DATA_ECHK;
     case MP3 : MainBCC.TDATA[CHKVT1DRL]       = TNUM_DATA_OCHK;
     default: MainBCC.TDATA[CHKVT1DRL]   = TNUM_DATA_ECHK;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case MP3 :     MainBCC.TDATA[CHKVT1DRL]       = TNUM_DATA_1S;
     default: MainBCC.TDATA[CHKVT1DRL]       = TNUM_DATA_OCHK;
   }   /* case */
#endif
   switch(SelectedTITestType) {
     case MP1 :  
              MainBCC.LDELTA[CHKVT1DRL]              = -16uA;
              MainBCC.UDELTA[CHKVT1DRL]              = 16uA;
            break; 
     case MP2 :  
              MainBCC.LDELTA[CHKVT1DRL]              = -3uA;
              MainBCC.UDELTA[CHKVT1DRL]              = 5uA;
              MainBCC.LDELTA_EMU[CHKVT1DRL]          = -3uA;
              MainBCC.UDELTA_EMU[CHKVT1DRL]          = 5uA;
              DRLBCC1_Median_ULimit[0]               = 5uA;
              DRLBCC1_Median_ULimit[1]               = 5uA;
              DRLBCC1_Median_ULimit[2]               = 5uA;
              DRLBCC1_Median_ULimit[3]               = 5uA;
              DRLBCC1_Median_ULimit[4]               = 5uA;
              DRLBCC1_Median_ULimit[5]               = 5uA;
              DRLBCC1_Median_ULimit[6]               = 5uA;
              DRLBCC1_Median_ULimit[7]               = 5uA;
            break; 
     case MP3 :  
              MainBCC.LDELTA[CHKVT1DRL]              = -8uA;  /*-2ua;*/
              MainBCC.UDELTA[CHKVT1DRL]              = 2uA;
              MainBCC.LDELTA_EMU[CHKVT1DRL]          = -8uA;  /*-2ua;*/
              MainBCC.UDELTA_EMU[CHKVT1DRL]          = 2uA;
              DRLBCC1_Median_ULimit[0]               = 5uA;
              DRLBCC1_Median_ULimit[1]               = 5uA;
              DRLBCC1_Median_ULimit[2]               = 5uA;
              DRLBCC1_Median_ULimit[3]               = 5uA;
              DRLBCC1_Median_ULimit[4]               = 5uA;
              DRLBCC1_Median_ULimit[5]               = 5uA;
              DRLBCC1_Median_ULimit[6]               = 5uA;
              DRLBCC1_Median_ULimit[7]               = 5uA;
            break; 
     default:  
              MainBCC.LDELTA[CHKVT1DRL]              = -16uA;
              MainBCC.UDELTA[CHKVT1DRL]              = 5uA;
              MainBCC.LDELTA_EMU[CHKVT1DRL]          = -16uA;
              MainBCC.UDELTA_EMU[CHKVT1DRL]          = 5uA;
              DRLBCC1_Median_ULimit[0]               = 5uA;
              DRLBCC1_Median_ULimit[1]               = 5uA;
              DRLBCC1_Median_ULimit[2]               = 5uA;
              DRLBCC1_Median_ULimit[3]               = 5uA;
              DRLBCC1_Median_ULimit[4]               = 5uA;
              DRLBCC1_Median_ULimit[5]               = 5uA;
              DRLBCC1_Median_ULimit[6]               = 5uA;
              DRLBCC1_Median_ULimit[7]               = 5uA;
      break; 
   }   /* case */
   MainBCC.PREVTYPE[CHKVT1DRL]            = CHKVT1DRL;


    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case MP3 :     MainBCC.ENA[RCODEVT1][pre]             = true;
     default: MainBCC.ENA[RCODEVT1][pre]             = false;
   }   /* case */
#else
   MainBCC.ENA[RCODEVT1][pre]             = false;
#endif
   MainBCC.ENARED[RCODEVT1][pre]          = false;
   MainBCC.DLOGONLY[RCODEVT1][pre]        = false;
   MainBCC.SSTART[RCODEVT1][pre]          = 7uA;
   MainBCC.SSTOP[RCODEVT1][pre]           = 30uA;
   MainBCC.SRESOL[RCODEVT1][pre]          = 500nA;
   switch(SelectedTITestType) {
     case  MP3: case  PreBurnIn: case  PostBurnIn1 :   
        MainBCC.LLIM[RCODEVT1][pre]            = 22uA;
        MainBCC.ULIM[RCODEVT1][pre]            = 45uA;
        MainBCC.LLIM_EMU[RCODEVT1][pre]        = 20uA;
        MainBCC.ULIM_EMU[RCODEVT1][pre]        = 45uA;
      break; 
     default:  
        MainBCC.LLIM[RCODEVT1][pre]            = 25.5uA;
        MainBCC.ULIM[RCODEVT1][pre]            = 45uA;
        MainBCC.LLIM_EMU[RCODEVT1][pre]        = 23.5uA;
        MainBCC.ULIM_EMU[RCODEVT1][pre]        = 45uA;
      break; 
   }   /* case */
   MainBCC.TCRNUM[RCODEVT1][pre]          = 38;
   MainBCC.IRATIO[RCODEVT1][pre]          = TNUM_MULT2;
   MainBCC.RDOPTION[RCODEVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case PreBurnIn :   MainBCC.ENA[RCODEVT1][post]        = true;
     default:     MainBCC.ENA[RCODEVT1][post]        = false;
   }   /* case */
#else
   MainBCC.ENA[RCODEVT1][post]            = false;
#endif
   MainBCC.ENARED[RCODEVT1][post]         = false;
   MainBCC.DLOGONLY[RCODEVT1][post]       = false;
   MainBCC.SSTART[RCODEVT1][post]         = 7uA;
   MainBCC.SSTOP[RCODEVT1][post]          = 30uA;
   MainBCC.SRESOL[RCODEVT1][post]         = 500nA;
   switch(SelectedTITestType) {
     case MP2 :  
              MainBCC.LLIM[RCODEVT1][post]           = 22.5uA;
              MainBCC.ULIM[RCODEVT1][post]           = 50uA;
              MainBCC.LLIM_EMU[RCODEVT1][post]       = 20.5uA;
              MainBCC.ULIM_EMU[RCODEVT1][post]       = 50uA;
            break; 
     case MP3 :  
              MainBCC.LLIM[RCODEVT1][post]           = 20uA;
              MainBCC.ULIM[RCODEVT1][post]           = 50uA;
              MainBCC.LLIM_EMU[RCODEVT1][post]       = 20uA;
              MainBCC.ULIM_EMU[RCODEVT1][post]       = 50uA;
            break; 
     default:  
              MainBCC.LLIM[RCODEVT1][post]           = 20uA;
              MainBCC.ULIM[RCODEVT1][post]           = 50uA;
              MainBCC.LLIM_EMU[RCODEVT1][post]       = 20uA;
              MainBCC.ULIM_EMU[RCODEVT1][post]       = 50uA;
      break; 
   }   /* case */
   MainBCC.TCRNUM[RCODEVT1][post]         = 38;
   MainBCC.IRATIO[RCODEVT1][post]         = TNUM_MULT2;
   MainBCC.RDOPTION[RCODEVT1][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[RCODEVT1]              = ARBTYPE;
   MainBCC.TDATA[RCODEVT1]               = TNUM_DATA_ARB_ECC;
   switch(SelectedTITestType) {
     case MP1 :  
              MainBCC.LDELTA[RCODEVT1]              = -16uA;
              MainBCC.UDELTA[RCODEVT1]              = 16uA;
            break; 
     case MP2 :  
              MainBCC.LDELTA[RCODEVT1]              = -3uA;
              MainBCC.UDELTA[RCODEVT1]              = 5uA;
              MainBCC.LDELTA_EMU[RCODEVT1]          = -3uA;
              MainBCC.UDELTA_EMU[RCODEVT1]          = 5uA;
            break; 
     case MP3 :  
              MainBCC.LDELTA[RCODEVT1]              = -2uA;
              MainBCC.UDELTA[RCODEVT1]              = 2uA;
              MainBCC.LDELTA_EMU[RCODEVT1]          = -2uA;
              MainBCC.UDELTA_EMU[RCODEVT1]          = 2uA;
            break; 
     default:  
              MainBCC.LDELTA[RCODEVT1]              = -16uA;
              MainBCC.UDELTA[RCODEVT1]              = 5uA;
              MainBCC.LDELTA_EMU[RCODEVT1]          = -16uA;
              MainBCC.UDELTA_EMU[RCODEVT1]          = 5uA;
      break; 
   }   /* case */
   MainBCC.PREVTYPE[RCODEVT1]            = RCODEVT1;




    /*---- pre ----*/
   MainBCC.ENA[ONOVT0][pre]             = false;
   MainBCC.ENARED[ONOVT0][pre]          = GL_DO_REDENA;
   MainBCC.DLOGONLY[ONOVT0][pre]        = false;
   MainBCC.SSTART[ONOVT0][pre]          = 6uA;
   MainBCC.SSTOP[ONOVT0][pre]           = 40uA;
   MainBCC.SRESOL[ONOVT0][pre]          = 500nA;
   MainBCC.LLIM[ONOVT0][pre]            = 5uA;
   MainBCC.ULIM[ONOVT0][pre]            = 30uA;
   MainBCC.TCRNUM[ONOVT0][pre]          = 6;
   MainBCC.IRATIO[ONOVT0][pre]          = TNUM_MULT1;
   MainBCC.RDOPTION[ONOVT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainBCC.ENA[ONOVT0][post]            = false;
   MainBCC.ENARED[ONOVT0][post]         = GL_DO_REDENA;
   MainBCC.DLOGONLY[ONOVT0][post]       = false;
   MainBCC.SSTART[ONOVT0][post]         = 6uA;
   MainBCC.SSTOP[ONOVT0][post]          = 40uA;
   MainBCC.SRESOL[ONOVT0][post]         = 500nA;
   MainBCC.LLIM[ONOVT0][post]           = 5uA;
   MainBCC.ULIM[ONOVT0][post]           = 38uA;
   MainBCC.TCRNUM[ONOVT0][post]         = 6;
   MainBCC.IRATIO[ONOVT0][post]         = TNUM_MULT1;
   MainBCC.RDOPTION[ONOVT0][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[ONOVT0]              = BANKTYPE;
   MainBCC.TDATA[ONOVT0]               = TNUM_DATA_0S;
   switch(SelectedTITestType) {
     case  MP1: case  MP2: case  FT2 :   
        MainBCC.LDELTA[ONOVT0]              = -2uA;
        MainBCC.UDELTA[ONOVT0]              = 5uA;
      break; 
     default:  
        MainBCC.LDELTA[ONOVT0]              = -2uA;
        MainBCC.UDELTA[ONOVT0]              = 5uA;
      break; 
   }   /* case */
   MainBCC.PREVTYPE[ONOVT0]            = ONOVT0;

    /*---- pre ----*/
   MainBCC.ENA[CSFGVT0][pre]             = false;
   MainBCC.ENARED[CSFGVT0][pre]          = GL_DO_REDENA;
   MainBCC.DLOGONLY[CSFGVT0][pre]        = false;
   MainBCC.SSTART[CSFGVT0][pre]          = 6uA;
   MainBCC.SSTOP[CSFGVT0][pre]           = 40uA;
   MainBCC.SRESOL[CSFGVT0][pre]          = 500nA;
   MainBCC.LLIM[CSFGVT0][pre]            = 5uA;
   MainBCC.ULIM[CSFGVT0][pre]            = 30uA;
   MainBCC.TCRNUM[CSFGVT0][pre]          = 6;
   MainBCC.IRATIO[CSFGVT0][pre]          = TNUM_MULT1;
   MainBCC.RDOPTION[CSFGVT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainBCC.ENA[CSFGVT0][post]            = false;
   MainBCC.ENARED[CSFGVT0][post]         = GL_DO_REDENA;
   MainBCC.DLOGONLY[CSFGVT0][post]       = false;
   MainBCC.SSTART[CSFGVT0][post]         = 6uA;
   MainBCC.SSTOP[CSFGVT0][post]          = 40uA;
   MainBCC.SRESOL[CSFGVT0][post]         = 500nA;
   MainBCC.LLIM[CSFGVT0][post]           = 5uA;
   MainBCC.ULIM[CSFGVT0][post]           = 44uA;
   MainBCC.TCRNUM[CSFGVT0][post]         = 6;
   MainBCC.IRATIO[CSFGVT0][post]         = TNUM_MULT1;
   MainBCC.RDOPTION[CSFGVT0][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[CSFGVT0]              = BANKTYPE;
   MainBCC.TDATA[CSFGVT0]               = TNUM_DATA_0S;
   MainBCC.LDELTA[CSFGVT0]              = -2uA;
   MainBCC.UDELTA[CSFGVT0]              = 14uA;
   MainBCC.PREVTYPE[CSFGVT0]            = CSFGVT0;

    /*---- pre ----*/
   MainBCC.ENA[EGFG1VT0][pre]             = false;
   MainBCC.ENARED[EGFG1VT0][pre]          = GL_DO_REDENA;
   MainBCC.DLOGONLY[EGFG1VT0][pre]        = true;
   MainBCC.SSTART[EGFG1VT0][pre]          = 6uA;
   MainBCC.SSTOP[EGFG1VT0][pre]           = 40uA;
   MainBCC.SRESOL[EGFG1VT0][pre]          = 500nA;
   MainBCC.LLIM[EGFG1VT0][pre]            = 5uA;
   MainBCC.ULIM[EGFG1VT0][pre]            = 30uA;
   MainBCC.TCRNUM[EGFG1VT0][pre]          = 6;
   MainBCC.IRATIO[EGFG1VT0][pre]          = TNUM_MULT1;
   MainBCC.RDOPTION[EGFG1VT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainBCC.ENA[EGFG1VT0][post]            = false;
   MainBCC.ENARED[EGFG1VT0][post]         = GL_DO_REDENA;
   MainBCC.DLOGONLY[EGFG1VT0][post]       = true;
   MainBCC.SSTART[EGFG1VT0][post]         = 6uA;
   MainBCC.SSTOP[EGFG1VT0][post]          = 40uA;
   MainBCC.SRESOL[EGFG1VT0][post]         = 500nA;
   MainBCC.LLIM[EGFG1VT0][post]           = 5uA;
   MainBCC.ULIM[EGFG1VT0][post]           = 37uA;
   MainBCC.TCRNUM[EGFG1VT0][post]         = 6;
   MainBCC.IRATIO[EGFG1VT0][post]         = TNUM_MULT1;
   MainBCC.RDOPTION[EGFG1VT0][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[EGFG1VT0]              = BANKTYPE;
   MainBCC.TDATA[EGFG1VT0]               = TNUM_DATA_0S;
   MainBCC.LDELTA[EGFG1VT0]              = -25uA;
   MainBCC.UDELTA[EGFG1VT0]              = 3uA;
   MainBCC.PREVTYPE[EGFG1VT0]            = EGFG1VT0;

    /*---- pre ----*/
   MainBCC.ENA[EGFG2VT0][pre]             = false;
   MainBCC.ENARED[EGFG2VT0][pre]          = GL_DO_REDENA;
   MainBCC.DLOGONLY[EGFG2VT0][pre]        = true;
   MainBCC.SSTART[EGFG2VT0][pre]          = 6uA;
   MainBCC.SSTOP[EGFG2VT0][pre]           = 40uA;
   MainBCC.SRESOL[EGFG2VT0][pre]          = 500nA;
   MainBCC.LLIM[EGFG2VT0][pre]            = 5uA;
   MainBCC.ULIM[EGFG2VT0][pre]            = 30uA;
   MainBCC.TCRNUM[EGFG2VT0][pre]          = 6;
   MainBCC.IRATIO[EGFG2VT0][pre]          = TNUM_MULT1;
   MainBCC.RDOPTION[EGFG2VT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainBCC.ENA[EGFG2VT0][post]            = false;
   MainBCC.ENARED[EGFG2VT0][post]         = GL_DO_REDENA;
   MainBCC.DLOGONLY[EGFG2VT0][post]       = true;
   MainBCC.SSTART[EGFG2VT0][post]         = 6uA;
   MainBCC.SSTOP[EGFG2VT0][post]          = 40uA;
   MainBCC.SRESOL[EGFG2VT0][post]         = 500nA;
   MainBCC.LLIM[EGFG2VT0][post]           = 5uA;
   MainBCC.ULIM[EGFG2VT0][post]           = 37uA;
   MainBCC.TCRNUM[EGFG2VT0][post]         = 6;
   MainBCC.IRATIO[EGFG2VT0][post]         = TNUM_MULT1;
   MainBCC.RDOPTION[EGFG2VT0][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[EGFG2VT0]              = BANKTYPE;
   MainBCC.TDATA[EGFG2VT0]               = TNUM_DATA_0S;
   MainBCC.LDELTA[EGFG2VT0]              = -25uA;
   MainBCC.UDELTA[EGFG2VT0]              = 3uA;
   MainBCC.PREVTYPE[EGFG2VT0]            = EGFG2VT0;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[EGFG3VT0][pre]             = false;
#else
   MainBCC.ENA[EGFG3VT0][pre]             = false;
#endif   
   MainBCC.ENARED[EGFG3VT0][pre]          = GL_DO_REDENA;
   MainBCC.DLOGONLY[EGFG3VT0][pre]        = false;
   MainBCC.SSTART[EGFG3VT0][pre]          = 6uA;
   MainBCC.SSTOP[EGFG3VT0][pre]           = 40uA;
   MainBCC.SRESOL[EGFG3VT0][pre]          = 500nA;
   MainBCC.LLIM[EGFG3VT0][pre]            = 5uA;
   MainBCC.ULIM[EGFG3VT0][pre]            = 30uA;
   MainBCC.TCRNUM[EGFG3VT0][pre]          = 6;
   MainBCC.IRATIO[EGFG3VT0][pre]          = TNUM_MULT1;
   MainBCC.RDOPTION[EGFG3VT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[EGFG3VT0][post]            = false;
#else
   MainBCC.ENA[EGFG3VT0][post]            = false;
#endif   
   MainBCC.ENARED[EGFG3VT0][post]         = GL_DO_REDENA;
   MainBCC.DLOGONLY[EGFG3VT0][post]       = false;
   MainBCC.SSTART[EGFG3VT0][post]         = 6uA;
   MainBCC.SSTOP[EGFG3VT0][post]          = 40uA;
   MainBCC.SRESOL[EGFG3VT0][post]         = 500nA;
   MainBCC.LLIM[EGFG3VT0][post]           = 5uA;
   MainBCC.ULIM[EGFG3VT0][post]           = 44uA;
   MainBCC.TCRNUM[EGFG3VT0][post]         = 6;
   MainBCC.IRATIO[EGFG3VT0][post]         = TNUM_MULT1;
   MainBCC.RDOPTION[EGFG3VT0][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[EGFG3VT0]              = BANKTYPE;
   MainBCC.TDATA[EGFG3VT0]               = TNUM_DATA_0S;
   MainBCC.LDELTA[EGFG3VT0]              = -2uA;
   MainBCC.UDELTA[EGFG3VT0]              = 14uA;
   MainBCC.PREVTYPE[EGFG3VT0]            = EGFG3VT0;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[EGFG4VT0][pre]             = (SelectedTITestType==MP1);
#else
   MainBCC.ENA[EGFG4VT0][pre]             = false;
#endif   
   MainBCC.ENARED[EGFG4VT0][pre]          = GL_DO_REDENA;
   MainBCC.DLOGONLY[EGFG4VT0][pre]        = true;
   MainBCC.SSTART[EGFG4VT0][pre]          = 6uA;
   MainBCC.SSTOP[EGFG4VT0][pre]           = 40uA;
   MainBCC.SRESOL[EGFG4VT0][pre]          = 500nA;
   MainBCC.LLIM[EGFG4VT0][pre]            = 5uA;
   MainBCC.ULIM[EGFG4VT0][pre]            = 30uA;
   MainBCC.TCRNUM[EGFG4VT0][pre]          = 6;
   MainBCC.IRATIO[EGFG4VT0][pre]          = TNUM_MULT1;
   MainBCC.RDOPTION[EGFG4VT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[EGFG4VT0][post]            = (SelectedTITestType==MP1);
#else
   MainBCC.ENA[EGFG4VT0][post]            = false;
#endif   
   MainBCC.ENARED[EGFG4VT0][post]         = GL_DO_REDENA;
   MainBCC.DLOGONLY[EGFG4VT0][post]       = true;
   MainBCC.SSTART[EGFG4VT0][post]         = 6uA;
   MainBCC.SSTOP[EGFG4VT0][post]          = 40uA;
   MainBCC.SRESOL[EGFG4VT0][post]         = 500nA;
   MainBCC.LLIM[EGFG4VT0][post]           = 5uA;
   MainBCC.ULIM[EGFG4VT0][post]           = 38uA;
   MainBCC.TCRNUM[EGFG4VT0][post]         = 6;
   MainBCC.IRATIO[EGFG4VT0][post]         = TNUM_MULT1;
   MainBCC.RDOPTION[EGFG4VT0][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[EGFG4VT0]              = BANKTYPE;
   MainBCC.TDATA[EGFG4VT0]               = TNUM_DATA_0S;
   switch(SelectedTITestType) {
     case  MP1: case  MP2: case  FT2 :   
        MainBCC.LDELTA[EGFG4VT0]              = -2uA;
        MainBCC.UDELTA[EGFG4VT0]              = 8uA;
      break; 
     default:  
        MainBCC.LDELTA[EGFG4VT0]              = -8uA;
        MainBCC.UDELTA[EGFG4VT0]              = 8uA;
      break; 
   }   /* case */
   MainBCC.PREVTYPE[EGFG4VT0]            = EGFG4VT0;

    /*---- pre ----*/
   MainBCC.ENA[EGFG5VT0][pre]             = false;
   MainBCC.ENARED[EGFG5VT0][pre]          = GL_DO_REDENA;
   MainBCC.DLOGONLY[EGFG5VT0][pre]        = false;
   MainBCC.SSTART[EGFG5VT0][pre]          = 6uA;
   MainBCC.SSTOP[EGFG5VT0][pre]           = 40uA;
   MainBCC.SRESOL[EGFG5VT0][pre]          = 500nA;
   MainBCC.LLIM[EGFG5VT0][pre]            = 5uA;
   MainBCC.ULIM[EGFG5VT0][pre]            = 30uA;
   MainBCC.TCRNUM[EGFG5VT0][pre]          = 6;
   MainBCC.IRATIO[EGFG5VT0][pre]          = TNUM_MULT1;
   MainBCC.RDOPTION[EGFG5VT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainBCC.ENA[EGFG5VT0][post]            = false;
   MainBCC.ENARED[EGFG5VT0][post]         = GL_DO_REDENA;
   MainBCC.DLOGONLY[EGFG5VT0][post]       = false;
   MainBCC.SSTART[EGFG5VT0][post]         = 6uA;
   MainBCC.SSTOP[EGFG5VT0][post]          = 40uA;
   MainBCC.SRESOL[EGFG5VT0][post]         = 500nA;
   MainBCC.LLIM[EGFG5VT0][post]           = 5uA;
   MainBCC.ULIM[EGFG5VT0][post]           = 35uA;
   MainBCC.TCRNUM[EGFG5VT0][post]         = 6;
   MainBCC.IRATIO[EGFG5VT0][post]         = TNUM_MULT1;
   MainBCC.RDOPTION[EGFG5VT0][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[EGFG5VT0]              = BANKTYPE;
   MainBCC.TDATA[EGFG5VT0]               = TNUM_DATA_0S;
   MainBCC.LDELTA[EGFG5VT0]              = -20uA;
   MainBCC.UDELTA[EGFG5VT0]              = 3uA;
   MainBCC.PREVTYPE[EGFG5VT0]            = EGFG5VT0;

    /*---- pre ----*/
   MainBCC.ENA[RDDISTBVT0][pre]             = false;
   MainBCC.ENARED[RDDISTBVT0][pre]          = GL_DO_REDENA;
   MainBCC.DLOGONLY[RDDISTBVT0][pre]        = false;
   MainBCC.SSTART[RDDISTBVT0][pre]          = 6uA;
   MainBCC.SSTOP[RDDISTBVT0][pre]           = 40uA;
   MainBCC.SRESOL[RDDISTBVT0][pre]          = 500nA;
   MainBCC.LLIM[RDDISTBVT0][pre]            = 5uA;
   MainBCC.ULIM[RDDISTBVT0][pre]            = 30uA;
   MainBCC.TCRNUM[RDDISTBVT0][pre]          = 6;
   MainBCC.IRATIO[RDDISTBVT0][pre]          = TNUM_MULT1;
   MainBCC.RDOPTION[RDDISTBVT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainBCC.ENA[RDDISTBVT0][post]            = false;
   MainBCC.ENARED[RDDISTBVT0][post]         = GL_DO_REDENA;
   MainBCC.DLOGONLY[RDDISTBVT0][post]       = false;
   MainBCC.SSTART[RDDISTBVT0][post]         = 6uA;
   MainBCC.SSTOP[RDDISTBVT0][post]          = 40uA;
   MainBCC.SRESOL[RDDISTBVT0][post]         = 500nA;
   MainBCC.LLIM[RDDISTBVT0][post]           = 5uA;
   MainBCC.ULIM[RDDISTBVT0][post]           = 35uA;
   MainBCC.TCRNUM[RDDISTBVT0][post]         = 6;
   MainBCC.IRATIO[RDDISTBVT0][post]         = TNUM_MULT1;
   MainBCC.RDOPTION[RDDISTBVT0][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[RDDISTBVT0]              = BANKTYPE;
   MainBCC.TDATA[RDDISTBVT0]               = TNUM_DATA_0S;
   MainBCC.LDELTA[RDDISTBVT0]              = -2uA;
   MainBCC.UDELTA[RDDISTBVT0]              = 5uA;
   MainBCC.PREVTYPE[RDDISTBVT0]            = EGFG3VT0;  /*RDDISTBVT0}; {KChau - yield learning*/

    /*---- pre ----*/
   MainBCC.ENA[RDDISTB2VT0][pre]             = false;
   MainBCC.ENARED[RDDISTB2VT0][pre]          = GL_DO_REDENA;
   MainBCC.DLOGONLY[RDDISTB2VT0][pre]        = false;
   MainBCC.SSTART[RDDISTB2VT0][pre]          = 6uA;
   MainBCC.SSTOP[RDDISTB2VT0][pre]           = 40uA;
   MainBCC.SRESOL[RDDISTB2VT0][pre]          = 500nA;
   MainBCC.LLIM[RDDISTB2VT0][pre]            = 5uA;
   MainBCC.ULIM[RDDISTB2VT0][pre]            = 30uA;
   MainBCC.TCRNUM[RDDISTB2VT0][pre]          = 6;
   MainBCC.IRATIO[RDDISTB2VT0][pre]          = TNUM_MULT1;
   MainBCC.RDOPTION[RDDISTB2VT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainBCC.ENA[RDDISTB2VT0][post]            = false;
   MainBCC.ENARED[RDDISTB2VT0][post]         = GL_DO_REDENA;
   MainBCC.DLOGONLY[RDDISTB2VT0][post]       = false;
   MainBCC.SSTART[RDDISTB2VT0][post]         = 6uA;
   MainBCC.SSTOP[RDDISTB2VT0][post]          = 40uA;
   MainBCC.SRESOL[RDDISTB2VT0][post]         = 500nA;
   MainBCC.LLIM[RDDISTB2VT0][post]           = 5uA;
   MainBCC.ULIM[RDDISTB2VT0][post]           = 35uA;
   MainBCC.TCRNUM[RDDISTB2VT0][post]         = 6;
   MainBCC.IRATIO[RDDISTB2VT0][post]         = TNUM_MULT1;
   MainBCC.RDOPTION[RDDISTB2VT0][post]       = TNUM_TOPTION_PSARD;
   MainBCC.MEMCFG[RDDISTB2VT0]              = BANKTYPE;
   MainBCC.TDATA[RDDISTB2VT0]               = TNUM_DATA_0S;
   MainBCC.LDELTA[RDDISTB2VT0]              = -2uA;
   MainBCC.UDELTA[RDDISTB2VT0]              = 5uA;
   MainBCC.PREVTYPE[RDDISTB2VT0]            = RDDISTB2VT0;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case  MP1: case MP2 :  MainBCC.ENA[CHKVT0][pre]             = false ; /*true*/
     default: MainBCC.ENA[CHKVT0][pre]             = false;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case MP3 :     MainBCC.ENA[CHKVT0][pre]             = false;
     default: MainBCC.ENA[CHKVT0][pre]             = false;
   }   /* case */
#endif   
   MainBCC.ENARED[CHKVT0][pre]          = false;
   MainBCC.DLOGONLY[CHKVT0][pre]        = false ; /*true*/
   MainBCC.SSTART[CHKVT0][pre]          = 6uA;
   switch(SelectedTITestType) {
     case  MP1: case  MP2: case  FT2 :  
        MainBCC.SSTOP[CHKVT0][pre]           = 40uA;
     default:
        MainBCC.SSTOP[CHKVT0][pre]           = 18uA;
   }   /* case */
   MainBCC.SRESOL[CHKVT0][pre]          = 500nA;
   MainBCC.LLIM[CHKVT0][pre]            = 5uA;
   MainBCC.ULIM[CHKVT0][pre]            = 30uA;
   MainBCC.TCRNUM[CHKVT0][pre]          = 6;
   MainBCC.IRATIO[CHKVT0][pre]          = TNUM_MULT1;
   MainBCC.RDOPTION[CHKVT0][pre]        = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
   MainBCC.ENA[CHKVT0][post]            = false;
   MainBCC.ENARED[CHKVT0][post]         = false;
   MainBCC.DLOGONLY[CHKVT0][post]       = false;
   MainBCC.SSTART[CHKVT0][post]         = 6uA;
   switch(SelectedTITestType) {
     case  MP1: case  MP2: case  FT2 :  
        MainBCC.SSTOP[CHKVT0][post]          = 40uA;
     default:
        MainBCC.SSTOP[CHKVT0][post]          = 18uA;
   }   /* case */
   MainBCC.SRESOL[CHKVT0][post]         = 500nA;
   MainBCC.LLIM[CHKVT0][post]           = 4uA;
   MainBCC.ULIM[CHKVT0][post]           = 28uA;
   MainBCC.TCRNUM[CHKVT0][post]         = 6;
   MainBCC.IRATIO[CHKVT0][post]         = TNUM_MULT1;
   MainBCC.RDOPTION[CHKVT0][post]       = TNUM_TOPTION_NORMAL;
   switch(SelectedTITestType) {
     case MP3 :      MainBCC.MEMCFG[CHKVT0]              = BANKTYPE;
     default:  MainBCC.MEMCFG[CHKVT0]              = QUADTYPE;
   }   /* case */
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case MP1 : MainBCC.TDATA[CHKVT0]       = TNUM_DATA_ECHK;
     case MP2 : MainBCC.TDATA[CHKVT0]       = TNUM_DATA_OCHK;
     default: MainBCC.TDATA[CHKVT0]   = TNUM_DATA_ECHK;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case MP3 : MainBCC.TDATA[CHKVT0]       = TNUM_DATA_OCHK;
     default: MainBCC.TDATA[CHKVT0]   = TNUM_DATA_ECHK;
   }   /* case */
#endif
   MainBCC.LDELTA[CHKVT0]              = -6uA;
   MainBCC.UDELTA[CHKVT0]              = 6uA;
   MainBCC.PREVTYPE[CHKVT0]            = CHKVT0;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainBCC.ENA[CHKVT0DRL][pre]             = false;
#else
   MainBCC.ENA[CHKVT0DRL][pre]             = false;
#endif
   MainBCC.ENARED[CHKVT0DRL][pre]          = false;
   MainBCC.DLOGONLY[CHKVT0DRL][pre]        = true;
   MainBCC.SSTART[CHKVT0DRL][pre]          = 6uA;
   switch(SelectedTITestType) {
     case  MP1: case  MP2: case  FT2 :  
        MainBCC.SSTOP[CHKVT0DRL][pre]           = 40uA;
     default:
        MainBCC.SSTOP[CHKVT0DRL][pre]           = 18uA;
   }   /* case */
   MainBCC.SRESOL[CHKVT0DRL][pre]          = 500nA;
   MainBCC.LLIM[CHKVT0DRL][pre]            = 5uA;
   MainBCC.ULIM[CHKVT0DRL][pre]            = 28uA;
   MainBCC.TCRNUM[CHKVT0DRL][pre]          = 6;
   MainBCC.IRATIO[CHKVT0DRL][pre]          = TNUM_MULT1;
   MainBCC.RDOPTION[CHKVT0DRL][pre]        = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case  MP2: case MP3 :  MainBCC.ENA[CHKVT0DRL][post]            = false ; /*true*/
     default: MainBCC.ENA[CHKVT0DRL][post]            = false;
   }   /* case */
#else
   MainBCC.ENA[CHKVT0DRL][post]            = false;
#endif
   MainBCC.ENARED[CHKVT0DRL][post]         = false;
   MainBCC.DLOGONLY[CHKVT0DRL][post]       = false ; /*true*/
   MainBCC.SSTART[CHKVT0DRL][post]         = 6uA;
   switch(SelectedTITestType) {
     case  MP1: case  MP2: case  FT2 :  
        MainBCC.SSTOP[CHKVT0DRL][post]          = 40uA;
     default:
        MainBCC.SSTOP[CHKVT0DRL][post]          = 18uA;
   }   /* case */
   MainBCC.SRESOL[CHKVT0DRL][post]         = 500nA;
   switch(SelectedTITestType) {
     case MP2 :  
              MainBCC.LLIM[CHKVT0DRL][post]           = 5uA;
              MainBCC.ULIM[CHKVT0DRL][post]           = 35uA;
            break; 
     case MP3 :  
              MainBCC.LLIM[CHKVT0DRL][post]           = 5uA;
              MainBCC.ULIM[CHKVT0DRL][post]           = 28uA;
            break; 
     default:  
              MainBCC.LLIM[CHKVT0DRL][post]           = 5uA;
              MainBCC.ULIM[CHKVT0DRL][post]           = 28uA;
      break; 
   }   /* case */

   MainBCC.TCRNUM[CHKVT0DRL][post]         = 6;
   MainBCC.IRATIO[CHKVT0DRL][post]         = TNUM_MULT1;
   MainBCC.RDOPTION[CHKVT0DRL][post]       = TNUM_TOPTION_NORMAL;
   MainBCC.MEMCFG[CHKVT0DRL]              = QUADTYPE;
   switch(SelectedTITestType) {
     case MP2 : MainBCC.TDATA[CHKVT0DRL]       = TNUM_DATA_ECHK;
     case MP3 : MainBCC.TDATA[CHKVT0DRL]       = TNUM_DATA_OCHK;
     default: MainBCC.TDATA[CHKVT0DRL]   = TNUM_DATA_ECHK;
   }   /* case */
   switch(SelectedTITestType) {
     case MP1 :  
              MainBCC.LDELTA[CHKVT0DRL]              = -8uA;
              MainBCC.UDELTA[CHKVT0DRL]              = 8uA;
            break; 
     case MP2 :  
              MainBCC.LDELTA[CHKVT0DRL]              = -5uA;
              MainBCC.UDELTA[CHKVT0DRL]              = 5uA;
              MainBCC.LDELTA_EMU[CHKVT0DRL]          = -5uA;
              MainBCC.UDELTA_EMU[CHKVT0DRL]          = 9uA;
            break; 
     case MP3 :  
              MainBCC.LDELTA[CHKVT0DRL]              = -5uA;  /*-2ua;*/
              MainBCC.UDELTA[CHKVT0DRL]              = 8uA;  /*2ua;*/
              MainBCC.LDELTA_EMU[CHKVT0DRL]          = -5uA;  /*-2ua;*/
              MainBCC.UDELTA_EMU[CHKVT0DRL]          = 9uA;  /*2ua;*/
            break; 
     default:  
              MainBCC.LDELTA[CHKVT0DRL]              = -10uA;
              MainBCC.UDELTA[CHKVT0DRL]              = 10uA;
      break; 
   }   /* case */
   MainBCC.PREVTYPE[CHKVT0DRL]            = CHKVT0DRL;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case  MP3: case PreBurnIn :  MainBCC.ENA[RCODEVT0][pre]             = false;
     Otherwise       MainBCC.ENA[RCODEVT0][pre]             = false;
   }   /* case */
#else
   MainBCC.ENA[RCODEVT0][pre]             = false;
#endif
   MainBCC.ENARED[RCODEVT0][pre]          = false;
   MainBCC.DLOGONLY[RCODEVT0][pre]        = false;
   MainBCC.SSTART[RCODEVT0][pre]          = 6uA;
   MainBCC.SSTOP[RCODEVT0][pre]           = 40uA;
   MainBCC.SRESOL[RCODEVT0][pre]          = 500nA;
   MainBCC.LLIM[RCODEVT0][pre]            = 5uA;
   MainBCC.ULIM[RCODEVT0][pre]            = 28uA;
   MainBCC.TCRNUM[RCODEVT0][pre]          = 6;
   MainBCC.IRATIO[RCODEVT0][pre]          = TNUM_MULT1;
   MainBCC.RDOPTION[RCODEVT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainBCC.ENA[RCODEVT0][post]            = false;
   MainBCC.ENARED[RCODEVT0][post]         = false;
   MainBCC.DLOGONLY[RCODEVT0][post]       = false;
   MainBCC.SSTART[RCODEVT0][post]         = 6uA;
   MainBCC.SSTOP[RCODEVT0][post]          = 40uA;
   MainBCC.SRESOL[RCODEVT0][post]         = 500nA;
   switch(SelectedTITestType) {
     case MP2 :  
              MainBCC.LLIM[RCODEVT0][post]           = 5uA;
              MainBCC.ULIM[RCODEVT0][post]           = 35uA;
            break; 
     case MP3 :  
              MainBCC.LLIM[RCODEVT0][post]           = 5uA;
              MainBCC.ULIM[RCODEVT0][post]           = 28uA;
            break; 
     default:  
              MainBCC.LLIM[RCODEVT0][post]           = 5uA;
              MainBCC.ULIM[RCODEVT0][post]           = 28uA;
      break; 
   }   /* case */
   MainBCC.TCRNUM[RCODEVT0][post]         = 6;
   MainBCC.IRATIO[RCODEVT0][post]         = TNUM_MULT1;
   MainBCC.RDOPTION[RCODEVT0][post]       = TNUM_TOPTION_NORMAL;
   MainBCC.MEMCFG[RCODEVT0]              = ARBTYPE;
   MainBCC.TDATA[RCODEVT0]               = TNUM_DATA_ARB_ECC;
   switch(SelectedTITestType) {
     case MP1 :  
              MainBCC.LDELTA[RCODEVT0]              = -8uA;
              MainBCC.UDELTA[RCODEVT0]              = 8uA;
            break; 
     case MP2 :  
              MainBCC.LDELTA[RCODEVT0]              = -5uA;
              MainBCC.UDELTA[RCODEVT0]              = 5uA;
              MainBCC.LDELTA_EMU[RCODEVT0]          = -5uA;
              MainBCC.UDELTA_EMU[RCODEVT0]          = 9uA;
            break; 
     case MP3 :  
              MainBCC.LDELTA[RCODEVT0]              = -2uA;
              MainBCC.UDELTA[RCODEVT0]              = 2uA;
              MainBCC.LDELTA_EMU[RCODEVT0]          = -2uA;
              MainBCC.UDELTA_EMU[RCODEVT0]          = 2uA;
            break; 
     default:  
              MainBCC.LDELTA[RCODEVT0]              = -10uA;
              MainBCC.UDELTA[RCODEVT0]              = 10uA;
              MainBCC.LDELTA_EMU[RCODEVT0]          = -10uA;
              MainBCC.UDELTA_EMU[RCODEVT0]          = 10uA;
      break; 
   }   /* case */
   MainBCC.PREVTYPE[RCODEVT0]            = RCODEVT0;


    /*++++ OTP ++++*/
    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   OtpBCC.ENA[REVTUNVT1][pre]             = false;
#else
   OtpBCC.ENA[REVTUNVT1][pre]             = false;
#endif
   OtpBCC.ENARED[REVTUNVT1][pre]          = false;
   switch(SelectedTITestType) {
     case MP1 :     OtpBCC.DLOGONLY[REVTUNVT1][pre]        = true;
     default: OtpBCC.DLOGONLY[REVTUNVT1][pre]        = false;
   }   /* case */
   OtpBCC.SSTART[REVTUNVT1][pre]          = 6uA;
   OtpBCC.SSTOP[REVTUNVT1][pre]           = 30uA;
   OtpBCC.SRESOL[REVTUNVT1][pre]          = 500nA;
   OtpBCC.LLIM[REVTUNVT1][pre]            = 25.5uA;
   OtpBCC.ULIM[REVTUNVT1][pre]            = 50uA;
   OtpBCC.LLIM_EMU[REVTUNVT1][pre]        = 23.5uA;
   OtpBCC.ULIM_EMU[REVTUNVT1][pre]        = 50uA;
   OtpBCC.TCRNUM[REVTUNVT1][pre]          = 38;
   OtpBCC.IRATIO[REVTUNVT1][pre]          = TNUM_MULT2;
   OtpBCC.RDOPTION[REVTUNVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpBCC.ENA[REVTUNVT1][post]            = true;
#else
   OtpBCC.ENA[REVTUNVT1][post]            = (SelectedTITestType==MP3);
#endif
   OtpBCC.ENARED[REVTUNVT1][post]         = false;
   switch(SelectedTITestType) {
     case MP1 :     OtpBCC.DLOGONLY[REVTUNVT1][post]        = true;
     default: OtpBCC.DLOGONLY[REVTUNVT1][post]        = false;
   }   /* case */
   OtpBCC.SSTART[REVTUNVT1][post]         = 6uA;
   OtpBCC.SSTOP[REVTUNVT1][post]          = 30uA;
   OtpBCC.SRESOL[REVTUNVT1][post]         = 500nA;
   OtpBCC.LLIM[REVTUNVT1][post]           = 16uA;
   OtpBCC.ULIM[REVTUNVT1][post]           = 49uA;
   OtpBCC.LLIM_EMU[REVTUNVT1][post]       = 16uA;
   OtpBCC.ULIM_EMU[REVTUNVT1][post]       = 49uA;
   OtpBCC.TCRNUM[REVTUNVT1][post]         = 38;
   OtpBCC.IRATIO[REVTUNVT1][post]         = TNUM_MULT2;
   OtpBCC.RDOPTION[REVTUNVT1][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[REVTUNVT1]              = OTPTYPE;
   OtpBCC.TDATA[REVTUNVT1]               = TNUM_DATA_1S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[REVTUNVT1]              = -2uA;
   OtpBCC.UDELTA[REVTUNVT1]              = 2uA;
   OtpBCC.PREVTYPE[REVTUNVT1]            = PUNTHRUVT1;   /*KChau - yield learning*/

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   OtpBCC.ENA[PGMFFVT1][pre]             = true;
#else
   OtpBCC.ENA[PGMFFVT1][pre]             = (SelectedTITestType==MP3);
#endif   
   OtpBCC.ENARED[PGMFFVT1][pre]          = false;
   switch(SelectedTITestType) {
     case MP1 :     OtpBCC.DLOGONLY[PGMFFVT1][pre]        = true;
     default: OtpBCC.DLOGONLY[PGMFFVT1][pre]        = false;
   }   /* case */
   OtpBCC.SSTART[PGMFFVT1][pre]          = 4uA;
   OtpBCC.SSTOP[PGMFFVT1][pre]           = 30uA;
   OtpBCC.SRESOL[PGMFFVT1][pre]          = 500nA;
   switch(SelectedTITestType) {
     case  MP1: case  MP2 :   
        OtpBCC.LLIM[PGMFFVT1][pre]            = 25.5uA;
        OtpBCC.ULIM[PGMFFVT1][pre]            = 45uA;
        OtpBCC.LLIM_EMU[PGMFFVT1][pre]        = 23.5uA;
        OtpBCC.ULIM_EMU[PGMFFVT1][pre]        = 45uA;
      break; 
     case  MP3: case  PreBurnIn: case  PostBurnIn1 :   
        OtpBCC.LLIM[PGMFFVT1][pre]            = 22.5uA; /*22ua;}{pasa 12/2/11*/
        OtpBCC.ULIM[PGMFFVT1][pre]            = 45uA;
        OtpBCC.LLIM_EMU[PGMFFVT1][pre]        = 21uA; /*20ua;}{pasa 12/2/11*/
        OtpBCC.ULIM_EMU[PGMFFVT1][pre]        = 45uA;
      break; 
     default:  
        OtpBCC.LLIM[PGMFFVT1][pre]            = 25.5uA;
        OtpBCC.ULIM[PGMFFVT1][pre]            = 45uA;
        OtpBCC.LLIM_EMU[PGMFFVT1][pre]        = 23.5uA;
        OtpBCC.ULIM_EMU[PGMFFVT1][pre]        = 45uA;
      break; 
   }   /* case */
   OtpBCC.TCRNUM[PGMFFVT1][pre]          = 38;
   OtpBCC.IRATIO[PGMFFVT1][pre]          = TNUM_MULT2;
   OtpBCC.RDOPTION[PGMFFVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpBCC.ENA[PGMFFVT1][post]            = true;
#else
   OtpBCC.ENA[PGMFFVT1][post]            = (SelectedTITestType==MP3);
#endif   
   OtpBCC.ENARED[PGMFFVT1][post]         = false;
   switch(SelectedTITestType) {
     case MP1 :     OtpBCC.DLOGONLY[PGMFFVT1][post]        = true;
     default: OtpBCC.DLOGONLY[PGMFFVT1][post]        = false;
   }   /* case */
   OtpBCC.SSTART[PGMFFVT1][post]         = 6uA;
   OtpBCC.SSTOP[PGMFFVT1][post]          = 30uA;
   OtpBCC.SRESOL[PGMFFVT1][post]         = 500nA;
   OtpBCC.LLIM[PGMFFVT1][post]           = 18uA;
   OtpBCC.ULIM[PGMFFVT1][post]           = 47uA;
   OtpBCC.LLIM_EMU[PGMFFVT1][post]       = 18uA;
   OtpBCC.ULIM_EMU[PGMFFVT1][post]       = 47uA;
   OtpBCC.TCRNUM[PGMFFVT1][post]         = 38;
   OtpBCC.IRATIO[PGMFFVT1][post]         = TNUM_MULT2;
   OtpBCC.RDOPTION[PGMFFVT1][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[PGMFFVT1]              = OTPTYPE;
   OtpBCC.TDATA[PGMFFVT1]               = TNUM_DATA_1S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[PGMFFVT1]              = -2uA;
   OtpBCC.UDELTA[PGMFFVT1]              = 2uA;
   switch(SelectedTITestType) {
     case MP3 :     OtpBCC.PREVTYPE[PGMFFVT1]            = PGMFFVT1;
     default: OtpBCC.PREVTYPE[PGMFFVT1]            = PGMFFVT1;
   } 

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   OtpBCC.ENA[PUNTHRUVT1][pre]             = true;
#else
   OtpBCC.ENA[PUNTHRUVT1][pre]             = (SelectedTITestType==MP3);
#endif
   OtpBCC.ENARED[PUNTHRUVT1][pre]          = false;
   switch(SelectedTITestType) {
     case MP1 :     OtpBCC.DLOGONLY[PUNTHRUVT1][pre]        = true;
     default: OtpBCC.DLOGONLY[PUNTHRUVT1][pre]        = false;
   }   /* case */
   OtpBCC.SSTART[PUNTHRUVT1][pre]          = 6uA;
   OtpBCC.SSTOP[PUNTHRUVT1][pre]           = 30uA;
   OtpBCC.SRESOL[PUNTHRUVT1][pre]          = 500nA;
   switch(SelectedTITestType) {
     case  MP1: case  MP2 :   
        OtpBCC.LLIM[PUNTHRUVT1][pre]            = 25.5uA;
        OtpBCC.ULIM[PUNTHRUVT1][pre]            = 45uA;
        OtpBCC.LLIM_EMU[PUNTHRUVT1][pre]        = 23.5uA;
        OtpBCC.ULIM_EMU[PUNTHRUVT1][pre]        = 45uA;
      break; 
     case  MP3: case  PreBurnIn: case  PostBurnIn1 :   
        OtpBCC.LLIM[PUNTHRUVT1][pre]            = 22.5uA; /*22ua;}{pasa 12/2/11*/
        OtpBCC.ULIM[PUNTHRUVT1][pre]            = 45uA;
        OtpBCC.LLIM_EMU[PUNTHRUVT1][pre]        = 21uA; /*20ua;}{pasa 12/2/11*/
        OtpBCC.ULIM_EMU[PUNTHRUVT1][pre]        = 45uA;
      break; 
     default:  
        OtpBCC.LLIM[PUNTHRUVT1][pre]            = 25.5uA;
        OtpBCC.ULIM[PUNTHRUVT1][pre]            = 45uA;
        OtpBCC.LLIM_EMU[PUNTHRUVT1][pre]        = 23.5uA;
        OtpBCC.ULIM_EMU[PUNTHRUVT1][pre]        = 45uA;
      break; 
   }   /* case */
   OtpBCC.TCRNUM[PUNTHRUVT1][pre]          = 38;
   OtpBCC.IRATIO[PUNTHRUVT1][pre]          = TNUM_MULT2;
   OtpBCC.RDOPTION[PUNTHRUVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpBCC.ENA[PUNTHRUVT1][post]            = true;
#else
   OtpBCC.ENA[PUNTHRUVT1][post]            = (SelectedTITestType==MP3);
#endif
   OtpBCC.ENARED[PUNTHRUVT1][post]         = false;
   switch(SelectedTITestType) {
     case MP1 :     OtpBCC.DLOGONLY[PUNTHRUVT1][post]        = true;
     default: OtpBCC.DLOGONLY[PUNTHRUVT1][post]        = false;
   }   /* case */
   OtpBCC.SSTART[PUNTHRUVT1][post]         = 6uA;
   OtpBCC.SSTOP[PUNTHRUVT1][post]          = 30uA;
   OtpBCC.SRESOL[PUNTHRUVT1][post]         = 500nA;
   OtpBCC.LLIM[PUNTHRUVT1][post]           = 18uA;
   OtpBCC.ULIM[PUNTHRUVT1][post]           = 47uA;
   OtpBCC.LLIM_EMU[PUNTHRUVT1][post]       = 18uA;
   OtpBCC.ULIM_EMU[PUNTHRUVT1][post]       = 47uA;
   OtpBCC.TCRNUM[PUNTHRUVT1][post]         = 38;
   OtpBCC.IRATIO[PUNTHRUVT1][post]         = TNUM_MULT2;
   OtpBCC.RDOPTION[PUNTHRUVT1][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[PUNTHRUVT1]              = OTPTYPE;
   OtpBCC.TDATA[PUNTHRUVT1]               = TNUM_DATA_1S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[PUNTHRUVT1]              = -2uA;
   OtpBCC.UDELTA[PUNTHRUVT1]              = 2uA;
   OtpBCC.PREVTYPE[PUNTHRUVT1]            = PUNTHRUVT1;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   OtpBCC.ENA[FGWLVT1][pre]             = (SelectedTITestType==MP1);
#else
   OtpBCC.ENA[FGWLVT1][pre]             = false;
#endif   
   OtpBCC.ENARED[FGWLVT1][pre]          = false;
   OtpBCC.DLOGONLY[FGWLVT1][pre]        = false;
   OtpBCC.SSTART[FGWLVT1][pre]          = 6uA;
   OtpBCC.SSTOP[FGWLVT1][pre]           = 30uA;
   OtpBCC.SRESOL[FGWLVT1][pre]          = 500nA;
   OtpBCC.LLIM[FGWLVT1][pre]            = 25.5uA;
   OtpBCC.ULIM[FGWLVT1][pre]            = 45uA;
   OtpBCC.LLIM_EMU[FGWLVT1][pre]        = 23.5uA;
   OtpBCC.ULIM_EMU[FGWLVT1][pre]        = 45uA;
   OtpBCC.TCRNUM[FGWLVT1][pre]          = 38;
   OtpBCC.IRATIO[FGWLVT1][pre]          = TNUM_MULT2;
   OtpBCC.RDOPTION[FGWLVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpBCC.ENA[FGWLVT1][post]            = (SelectedTITestType==MP1);
#else
   OtpBCC.ENA[FGWLVT1][post]            = false;
#endif   
   OtpBCC.ENARED[FGWLVT1][post]         = false;
   OtpBCC.DLOGONLY[FGWLVT1][post]       = false;
   OtpBCC.SSTART[FGWLVT1][post]         = 4uA;
   OtpBCC.SSTOP[FGWLVT1][post]          = 30uA;
   OtpBCC.SRESOL[FGWLVT1][post]         = 500nA;
   OtpBCC.LLIM[FGWLVT1][post]           = 16uA;
   OtpBCC.ULIM[FGWLVT1][post]           = 49uA;
   OtpBCC.LLIM_EMU[FGWLVT1][post]       = 16uA;
   OtpBCC.ULIM_EMU[FGWLVT1][post]       = 49uA;
   OtpBCC.TCRNUM[FGWLVT1][post]         = 38;
   OtpBCC.IRATIO[FGWLVT1][post]         = TNUM_MULT2;
   OtpBCC.RDOPTION[FGWLVT1][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[FGWLVT1]              = OTPTYPE;
   OtpBCC.TDATA[FGWLVT1]               = TNUM_DATA_1S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[FGWLVT1]              = -2uA;
   OtpBCC.UDELTA[FGWLVT1]              = 2uA;
   OtpBCC.PREVTYPE[FGWLVT1]            = PGMFFVT1;   /*KChau - yield learning*/


    /*---- pre ----*/
   OtpBCC.ENA[TUNOXTSMCVT1][pre]             = false;
   OtpBCC.ENARED[TUNOXTSMCVT1][pre]          = false;
   OtpBCC.DLOGONLY[TUNOXTSMCVT1][pre]        = false;
   OtpBCC.SSTART[TUNOXTSMCVT1][pre]          = 6uA;
   OtpBCC.SSTOP[TUNOXTSMCVT1][pre]           = 30uA;
   OtpBCC.SRESOL[TUNOXTSMCVT1][pre]          = 500nA;
   OtpBCC.LLIM[TUNOXTSMCVT1][pre]            = 25.5uA;
   OtpBCC.ULIM[TUNOXTSMCVT1][pre]            = 45uA;
   OtpBCC.LLIM_EMU[TUNOXTSMCVT1][pre]        = 23.5uA;
   OtpBCC.ULIM_EMU[TUNOXTSMCVT1][pre]        = 45uA;
   OtpBCC.TCRNUM[TUNOXTSMCVT1][pre]          = 38;
   OtpBCC.IRATIO[TUNOXTSMCVT1][pre]          = TNUM_MULT2;
   OtpBCC.RDOPTION[TUNOXTSMCVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpBCC.ENA[TUNOXTSMCVT1][post]            = false;
   OtpBCC.ENARED[TUNOXTSMCVT1][post]         = false;
   OtpBCC.DLOGONLY[TUNOXTSMCVT1][post]       = false;
   OtpBCC.SSTART[TUNOXTSMCVT1][post]         = 6uA;
   OtpBCC.SSTOP[TUNOXTSMCVT1][post]          = 30uA;
   OtpBCC.SRESOL[TUNOXTSMCVT1][post]         = 500nA;
   OtpBCC.LLIM[TUNOXTSMCVT1][post]           = 10uA;
   OtpBCC.ULIM[TUNOXTSMCVT1][post]           = 45uA;
   OtpBCC.LLIM_EMU[TUNOXTSMCVT1][post]       = 10uA;
   OtpBCC.ULIM_EMU[TUNOXTSMCVT1][post]       = 45uA;
   OtpBCC.TCRNUM[TUNOXTSMCVT1][post]         = 38;
   OtpBCC.IRATIO[TUNOXTSMCVT1][post]         = TNUM_MULT2;
   OtpBCC.RDOPTION[TUNOXTSMCVT1][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[TUNOXTSMCVT1]              = OTPTYPE;
   OtpBCC.TDATA[TUNOXTSMCVT1]               = TNUM_DATA_1S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[TUNOXTSMCVT1]              = -20uA; /*-2ua;} {pasa 12/2/11*/
   OtpBCC.UDELTA[TUNOXTSMCVT1]              = 10uA;
   OtpBCC.PREVTYPE[TUNOXTSMCVT1]            = TUNOXTSMCVT1;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   OtpBCC.ENA[TUNOXVT1][pre]             = (SelectedTITestType==MP1);
#else
   OtpBCC.ENA[TUNOXVT1][pre]             = (SelectedTITestType==MP1);
#endif   
   OtpBCC.ENARED[TUNOXVT1][pre]          = false;
   OtpBCC.DLOGONLY[TUNOXVT1][pre]        = false;
   OtpBCC.SSTART[TUNOXVT1][pre]          = 6uA;
   OtpBCC.SSTOP[TUNOXVT1][pre]           = 30uA;
   OtpBCC.SRESOL[TUNOXVT1][pre]          = 500nA;
   OtpBCC.LLIM[TUNOXVT1][pre]            = 25.5uA;
   OtpBCC.ULIM[TUNOXVT1][pre]            = 45uA;
   OtpBCC.LLIM_EMU[TUNOXVT1][pre]        = 23.5uA;
   OtpBCC.ULIM_EMU[TUNOXVT1][pre]        = 45uA;
   OtpBCC.TCRNUM[TUNOXVT1][pre]          = 38;
   OtpBCC.IRATIO[TUNOXVT1][pre]          = TNUM_MULT2;
   OtpBCC.RDOPTION[TUNOXVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpBCC.ENA[TUNOXVT1][post]            = (SelectedTITestType==MP1);
#else
   OtpBCC.ENA[TUNOXVT1][post]            = (SelectedTITestType==MP1);
#endif   
   OtpBCC.ENARED[TUNOXVT1][post]         = false;
   OtpBCC.DLOGONLY[TUNOXVT1][post]       = false;
   OtpBCC.SSTART[TUNOXVT1][post]         = 6uA;
   OtpBCC.SSTOP[TUNOXVT1][post]          = 30uA;
   OtpBCC.SRESOL[TUNOXVT1][post]         = 500nA;
   OtpBCC.LLIM[TUNOXVT1][post]           = 10uA;
   OtpBCC.ULIM[TUNOXVT1][post]           = 45uA;
   OtpBCC.LLIM_EMU[TUNOXVT1][post]       = 10uA;
   OtpBCC.ULIM_EMU[TUNOXVT1][post]       = 45uA;
   OtpBCC.TCRNUM[TUNOXVT1][post]         = 38;
   OtpBCC.IRATIO[TUNOXVT1][post]         = TNUM_MULT2;
   OtpBCC.RDOPTION[TUNOXVT1][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[TUNOXVT1]              = OTPTYPE;
   OtpBCC.TDATA[TUNOXVT1]               = TNUM_DATA_1S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[TUNOXVT1]              = -20uA;
   OtpBCC.UDELTA[TUNOXVT1]              = 10uA; /*2ua;} {pasa 12/2/11*/
   OtpBCC.PREVTYPE[TUNOXVT1]            = TUNOXVT1;

    /*---- pre ----*/
   OtpBCC.ENA[THINOXVT1][pre]             = (SelectedTITestType==MP1);
   OtpBCC.ENARED[THINOXVT1][pre]          = false;
   OtpBCC.DLOGONLY[THINOXVT1][pre]        = false;
   OtpBCC.SSTART[THINOXVT1][pre]          = 6uA;
   OtpBCC.SSTOP[THINOXVT1][pre]           = 30uA;
   OtpBCC.SRESOL[THINOXVT1][pre]          = 500nA;
   OtpBCC.LLIM[THINOXVT1][pre]            = 25.5uA;
   OtpBCC.ULIM[THINOXVT1][pre]            = 45uA;
   OtpBCC.LLIM_EMU[THINOXVT1][pre]        = 23.5uA;
   OtpBCC.ULIM_EMU[THINOXVT1][pre]        = 45uA;
   OtpBCC.TCRNUM[THINOXVT1][pre]          = 38;
   OtpBCC.IRATIO[THINOXVT1][pre]          = TNUM_MULT2;
   OtpBCC.RDOPTION[THINOXVT1][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpBCC.ENA[THINOXVT1][post]            = (SelectedTITestType==MP1);
   OtpBCC.ENARED[THINOXVT1][post]         = false;
   OtpBCC.DLOGONLY[THINOXVT1][post]       = false;
   OtpBCC.SSTART[THINOXVT1][post]         = 6uA;
   OtpBCC.SSTOP[THINOXVT1][post]          = 30uA;
   OtpBCC.SRESOL[THINOXVT1][post]         = 500nA;
   OtpBCC.LLIM[THINOXVT1][post]           = 15uA;
   OtpBCC.ULIM[THINOXVT1][post]           = 47uA;
   OtpBCC.LLIM_EMU[THINOXVT1][post]       = 15uA;
   OtpBCC.ULIM_EMU[THINOXVT1][post]       = 47uA;
   OtpBCC.TCRNUM[THINOXVT1][post]         = 38;
   OtpBCC.IRATIO[THINOXVT1][post]         = TNUM_MULT2;
   OtpBCC.RDOPTION[THINOXVT1][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[THINOXVT1]              = OTPTYPE;
   OtpBCC.TDATA[THINOXVT1]               = TNUM_DATA_1S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[THINOXVT1]              = -2uA;
   OtpBCC.UDELTA[THINOXVT1]              = 5uA;
   OtpBCC.PREVTYPE[THINOXVT1]            = THINOXVT1;


    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case  MP1: case MP2: case MP3 :  OtpBCC.ENA[CHKVT1][pre]             = true;
     default:     OtpBCC.ENA[CHKVT1][pre]             = false;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case  MP1: case MP3 :  OtpBCC.ENA[CHKVT1][pre]             = true;
     default: OtpBCC.ENA[CHKVT1][pre]             = false;
   }   /* case */
#endif
   OtpBCC.ENARED[CHKVT1][pre]          = false;
   OtpBCC.DLOGONLY[CHKVT1][pre]        = false;
   OtpBCC.SSTART[CHKVT1][pre]          = 7uA;
   OtpBCC.SSTOP[CHKVT1][pre]           = 30uA;
   OtpBCC.SRESOL[CHKVT1][pre]          = 500nA;
   switch(SelectedTITestType) {
     case  MP1: case  MP2 :   
        OtpBCC.LLIM[CHKVT1][pre]            = 25.5uA;
        OtpBCC.ULIM[CHKVT1][pre]            = 45uA;
        OtpBCC.LLIM_EMU[CHKVT1][pre]        = 23.5uA;
        OtpBCC.ULIM_EMU[CHKVT1][pre]        = 45uA;
      break; 
     case  MP3: case  PreBurnIn: case  PostBurnIn1 :   
        OtpBCC.LLIM[CHKVT1][pre]            = 22.5uA;
        OtpBCC.ULIM[CHKVT1][pre]            = 45uA;
        OtpBCC.LLIM_EMU[CHKVT1][pre]        = 21uA;
        OtpBCC.ULIM_EMU[CHKVT1][pre]        = 45uA;
      break; 
     default:  
        OtpBCC.LLIM[CHKVT1][pre]            = 25.5uA;
        OtpBCC.ULIM[CHKVT1][pre]            = 45uA;
        OtpBCC.LLIM_EMU[CHKVT1][pre]        = 23.5uA;
        OtpBCC.ULIM_EMU[CHKVT1][pre]        = 45uA;
      break; 
   }   /* case */
   OtpBCC.TCRNUM[CHKVT1][pre]          = 38;
   OtpBCC.IRATIO[CHKVT1][pre]          = TNUM_MULT2;
   OtpBCC.RDOPTION[CHKVT1][pre]        = TNUM_TOPTION_NORMAL;  /*PSARD;*/
    /*---- pst ----*/
   OtpBCC.ENA[CHKVT1][post]            = false;
   OtpBCC.ENARED[CHKVT1][post]         = false;
   OtpBCC.DLOGONLY[CHKVT1][post]       = false;
   OtpBCC.SSTART[CHKVT1][post]         = 7uA;
   OtpBCC.SSTOP[CHKVT1][post]          = 30uA;
   OtpBCC.SRESOL[CHKVT1][post]         = 500nA;
   OtpBCC.LLIM[CHKVT1][post]           = 20uA;
   OtpBCC.ULIM[CHKVT1][post]           = 50uA;
   OtpBCC.LLIM_EMU[CHKVT1][post]       = 20uA;
   OtpBCC.ULIM_EMU[CHKVT1][post]       = 50uA;
   OtpBCC.TCRNUM[CHKVT1][post]         = 38;
   OtpBCC.IRATIO[CHKVT1][post]         = TNUM_MULT2;
   OtpBCC.RDOPTION[CHKVT1][post]       = TNUM_TOPTION_NORMAL;  /*PSARD;*/
   OtpBCC.MEMCFG[CHKVT1]              = SECTTYPE;
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case MP1 : OtpBCC.TDATA[CHKVT1]       = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
     case MP2 : OtpBCC.TDATA[CHKVT1]       = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
     default: OtpBCC.TDATA[CHKVT1]   = TNUM_DATA_1S+TNUM_TARGET_OTP_SEMI;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case MP1 : OtpBCC.TDATA[CHKVT1]       = TNUM_DATA_1S+TNUM_TARGET_OTP_SEMI;
     case MP3 : OtpBCC.TDATA[CHKVT1]       = TNUM_DATA_1S+TNUM_TARGET_OTP_SEMI;
     default: OtpBCC.TDATA[CHKVT1]   = TNUM_DATA_1S+TNUM_TARGET_OTP_SEMI;
   }   /* case */
#endif
   OtpBCC.LDELTA[CHKVT1]              = -3uA;
   OtpBCC.UDELTA[CHKVT1]              = 3uA;
   OtpBCC.PREVTYPE[CHKVT1]            = CHKVT1;


    /*---- pre ----*/
   OtpBCC.ENA[CHKVT1DRL][pre]             = false;
   OtpBCC.ENARED[CHKVT1DRL][pre]          = false;
   OtpBCC.DLOGONLY[CHKVT1DRL][pre]        = false;
   OtpBCC.SSTART[CHKVT1DRL][pre]          = 7uA;
   OtpBCC.SSTOP[CHKVT1DRL][pre]           = 30uA;
   OtpBCC.SRESOL[CHKVT1DRL][pre]          = 500nA;
   OtpBCC.LLIM[CHKVT1DRL][pre]            = 25.5uA;
   OtpBCC.ULIM[CHKVT1DRL][pre]            = 45uA;
   OtpBCC.LLIM_EMU[CHKVT1DRL][pre]        = 23.5uA;
   OtpBCC.ULIM_EMU[CHKVT1DRL][pre]        = 45uA;
   OtpBCC.TCRNUM[CHKVT1DRL][pre]          = 38;
   OtpBCC.IRATIO[CHKVT1DRL][pre]          = TNUM_MULT2;
   OtpBCC.RDOPTION[CHKVT1DRL][pre]        = TNUM_TOPTION_NORMAL;  /*PSARD;*/
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpBCC.ENA[CHKVT1DRL][post]            = true;
#else
   OtpBCC.ENA[CHKVT1DRL][post]            = true;
#endif
   OtpBCC.ENARED[CHKVT1DRL][post]         = false;
   OtpBCC.DLOGONLY[CHKVT1DRL][post]       = false;
   OtpBCC.SSTART[CHKVT1DRL][post]         = 7uA;
   OtpBCC.SSTOP[CHKVT1DRL][post]          = 30uA;
   OtpBCC.SRESOL[CHKVT1DRL][post]         = 500nA;
   switch(SelectedTITestType) {
     case MP2 :  
              OtpBCC.LLIM[CHKVT1DRL][post]           = 22.5uA;
              OtpBCC.ULIM[CHKVT1DRL][post]           = 50uA;
              OtpBCC.LLIM_EMU[CHKVT1DRL][post]       = 20.5uA;
              OtpBCC.ULIM_EMU[CHKVT1DRL][post]       = 50uA;
            break; 
     case MP3 :  
              OtpBCC.LLIM[CHKVT1DRL][post]           = 20uA;
              OtpBCC.ULIM[CHKVT1DRL][post]           = 50uA;
              OtpBCC.LLIM_EMU[CHKVT1DRL][post]       = 20uA;
              OtpBCC.ULIM_EMU[CHKVT1DRL][post]       = 50uA;
            break; 
     default:  
              OtpBCC.LLIM[CHKVT1DRL][post]           = 20uA;
              OtpBCC.ULIM[CHKVT1DRL][post]           = 50uA;
              OtpBCC.LLIM_EMU[CHKVT1DRL][post]       = 20uA;
              OtpBCC.ULIM_EMU[CHKVT1DRL][post]       = 50uA;
      break; 
   }   /* case */
   OtpBCC.TCRNUM[CHKVT1DRL][post]         = 38;
   OtpBCC.IRATIO[CHKVT1DRL][post]         = TNUM_MULT2;
   OtpBCC.RDOPTION[CHKVT1DRL][post]       = TNUM_TOPTION_NORMAL;  /*PSARD;*/
   OtpBCC.MEMCFG[CHKVT1DRL]              = OTPTYPE;
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case MP2 : OtpBCC.TDATA[CHKVT1DRL]       = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
     case MP3 : OtpBCC.TDATA[CHKVT1DRL]       = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
     default: OtpBCC.TDATA[CHKVT1DRL]   = TNUM_DATA_1S+TNUM_TARGET_OTP_SEMI;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case  MP3: case PreBurnIn :  OtpBCC.TDATA[CHKVT1DRL]       = TNUM_DATA_1S+TNUM_TARGET_OTP_SEMI;
     default: OtpBCC.TDATA[CHKVT1DRL]   = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
   }   /* case */
#endif
   switch(SelectedTITestType) {
     case MP2 :  
              OtpBCC.LDELTA[CHKVT1DRL]              = -3uA;
              OtpBCC.UDELTA[CHKVT1DRL]              = 5uA;
            break; 
     case MP3 :  
              OtpBCC.LDELTA[CHKVT1DRL]              = -8uA;  /*-3ua;*/
              OtpBCC.UDELTA[CHKVT1DRL]              = 3uA;
      break; 
     default:  
        OtpBCC.LDELTA[CHKVT1DRL]              = -3uA;
        OtpBCC.UDELTA[CHKVT1DRL]              = 3uA;
      break; 
   }   /* case */
   OtpBCC.PREVTYPE[CHKVT1DRL]            = CHKVT1DRL;


    /*---- pre ----*/
   OtpBCC.ENA[RCODEVT1][pre]             = true;
   OtpBCC.ENARED[RCODEVT1][pre]          = false;
   OtpBCC.DLOGONLY[RCODEVT1][pre]        = false;
   OtpBCC.SSTART[RCODEVT1][pre]          = 7uA;
   OtpBCC.SSTOP[RCODEVT1][pre]           = 30uA;
   OtpBCC.SRESOL[RCODEVT1][pre]          = 500nA;
   switch(SelectedTITestType) {
     case  MP3: case  PreBurnIn: case  PostBurnIn1 :   
        OtpBCC.LLIM[RCODEVT1][pre]            = 22uA;
        OtpBCC.ULIM[RCODEVT1][pre]            = 45uA;
        OtpBCC.LLIM_EMU[RCODEVT1][pre]        = 20uA;
        OtpBCC.ULIM_EMU[RCODEVT1][pre]        = 45uA;
      break; 
     default:  
        OtpBCC.LLIM[RCODEVT1][pre]            = 25.5uA;
        OtpBCC.ULIM[RCODEVT1][pre]            = 45uA;
        OtpBCC.LLIM_EMU[RCODEVT1][pre]        = 23.5uA;
        OtpBCC.ULIM_EMU[RCODEVT1][pre]        = 45uA;
      break; 
   }   /* case */
   OtpBCC.TCRNUM[RCODEVT1][pre]          = 38;
   OtpBCC.IRATIO[RCODEVT1][pre]          = TNUM_MULT2;
   OtpBCC.RDOPTION[RCODEVT1][pre]        = TNUM_TOPTION_NORMAL;  /*PSARD;*/
    /*---- pst ----*/
   OtpBCC.ENA[RCODEVT1][post]            = true;
   OtpBCC.ENARED[RCODEVT1][post]         = false;
   OtpBCC.DLOGONLY[RCODEVT1][post]       = false;
   OtpBCC.SSTART[RCODEVT1][post]         = 7uA;
   OtpBCC.SSTOP[RCODEVT1][post]          = 30uA;
   OtpBCC.SRESOL[RCODEVT1][post]         = 500nA;
   OtpBCC.LLIM[RCODEVT1][post]           = 20uA;
   OtpBCC.ULIM[RCODEVT1][post]           = 50uA;
   OtpBCC.LLIM_EMU[RCODEVT1][post]       = 20uA;
   OtpBCC.ULIM_EMU[RCODEVT1][post]       = 50uA;
   OtpBCC.TCRNUM[RCODEVT1][post]         = 38;
   OtpBCC.IRATIO[RCODEVT1][post]         = TNUM_MULT2;
   OtpBCC.RDOPTION[RCODEVT1][post]       = TNUM_TOPTION_NORMAL;  /*PSARD;*/
   OtpBCC.MEMCFG[RCODEVT1]              = OTPTYPE;
   switch(SelectedTITestType) {
     case MP3 : OtpBCC.TDATA[RCODEVT1]      = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
     default: OtpBCC.TDATA[RCODEVT1]  = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
   }   /* case */
   OtpBCC.LDELTA[RCODEVT1]              = -3uA;
   OtpBCC.UDELTA[RCODEVT1]              = 3uA;
   OtpBCC.PREVTYPE[RCODEVT1]            = RCODEVT1;




    /*---- pre ----*/
   OtpBCC.ENA[ONOVT0][pre]             = false;
   OtpBCC.ENARED[ONOVT0][pre]          = false;
   OtpBCC.DLOGONLY[ONOVT0][pre]        = false;
   OtpBCC.SSTART[ONOVT0][pre]          = 6uA;
   OtpBCC.SSTOP[ONOVT0][pre]           = 40uA;
   OtpBCC.SRESOL[ONOVT0][pre]          = 500nA;
   OtpBCC.LLIM[ONOVT0][pre]            = 5uA;
   OtpBCC.ULIM[ONOVT0][pre]            = 30uA;
   OtpBCC.TCRNUM[ONOVT0][pre]          = 6;
   OtpBCC.IRATIO[ONOVT0][pre]          = TNUM_MULT1;
   OtpBCC.RDOPTION[ONOVT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpBCC.ENA[ONOVT0][post]            = false;
   OtpBCC.ENARED[ONOVT0][post]         = false;
   OtpBCC.DLOGONLY[ONOVT0][post]       = false;
   OtpBCC.SSTART[ONOVT0][post]         = 6uA;
   OtpBCC.SSTOP[ONOVT0][post]          = 40uA;
   OtpBCC.SRESOL[ONOVT0][post]         = 500nA;
   OtpBCC.LLIM[ONOVT0][post]           = 5uA;
   OtpBCC.ULIM[ONOVT0][post]           = 38uA;
   OtpBCC.TCRNUM[ONOVT0][post]         = 6;
   OtpBCC.IRATIO[ONOVT0][post]         = TNUM_MULT1;
   OtpBCC.RDOPTION[ONOVT0][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[ONOVT0]              = OTPTYPE;
   OtpBCC.TDATA[ONOVT0]               = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[ONOVT0]              = -2uA;
   OtpBCC.UDELTA[ONOVT0]              = 5uA;
   OtpBCC.PREVTYPE[ONOVT0]            = ONOVT0;

    /*---- pre ----*/
   OtpBCC.ENA[CSFGVT0][pre]             = false;
   OtpBCC.ENARED[CSFGVT0][pre]          = false;
   OtpBCC.DLOGONLY[CSFGVT0][pre]        = false;
   OtpBCC.SSTART[CSFGVT0][pre]          = 6uA;
   OtpBCC.SSTOP[CSFGVT0][pre]           = 40uA;
   OtpBCC.SRESOL[CSFGVT0][pre]          = 500nA;
   OtpBCC.LLIM[CSFGVT0][pre]            = 5uA;
   OtpBCC.ULIM[CSFGVT0][pre]            = 30uA;
   OtpBCC.TCRNUM[CSFGVT0][pre]          = 6;
   OtpBCC.IRATIO[CSFGVT0][pre]          = TNUM_MULT1;
   OtpBCC.RDOPTION[CSFGVT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpBCC.ENA[CSFGVT0][post]            = false;
   OtpBCC.ENARED[CSFGVT0][post]         = false;
   OtpBCC.DLOGONLY[CSFGVT0][post]       = false;
   OtpBCC.SSTART[CSFGVT0][post]         = 6uA;
   OtpBCC.SSTOP[CSFGVT0][post]          = 40uA;
   OtpBCC.SRESOL[CSFGVT0][post]         = 500nA;
   OtpBCC.LLIM[CSFGVT0][post]           = 5uA;
   OtpBCC.ULIM[CSFGVT0][post]           = 44uA;
   OtpBCC.TCRNUM[CSFGVT0][post]         = 6;
   OtpBCC.IRATIO[CSFGVT0][post]         = TNUM_MULT1;
   OtpBCC.RDOPTION[CSFGVT0][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[CSFGVT0]              = OTPTYPE;
   OtpBCC.TDATA[CSFGVT0]               = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[CSFGVT0]              = -2uA;
   OtpBCC.UDELTA[CSFGVT0]              = 14uA;
   OtpBCC.PREVTYPE[CSFGVT0]            = CSFGVT0;

    /*---- pre ----*/
   OtpBCC.ENA[EGFG1VT0][pre]             = false;
   OtpBCC.ENARED[EGFG1VT0][pre]          = false;
   OtpBCC.DLOGONLY[EGFG1VT0][pre]        = false;
   OtpBCC.SSTART[EGFG1VT0][pre]          = 6uA;
   OtpBCC.SSTOP[EGFG1VT0][pre]           = 40uA;
   OtpBCC.SRESOL[EGFG1VT0][pre]          = 500nA;
   OtpBCC.LLIM[EGFG1VT0][pre]            = 5uA;
   OtpBCC.ULIM[EGFG1VT0][pre]            = 30uA;
   OtpBCC.TCRNUM[EGFG1VT0][pre]          = 6;
   OtpBCC.IRATIO[EGFG1VT0][pre]          = TNUM_MULT1;
   OtpBCC.RDOPTION[EGFG1VT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpBCC.ENA[EGFG1VT0][post]            = false;
   OtpBCC.ENARED[EGFG1VT0][post]         = false;
   OtpBCC.DLOGONLY[EGFG1VT0][post]       = false;
   OtpBCC.SSTART[EGFG1VT0][post]         = 6uA;
   OtpBCC.SSTOP[EGFG1VT0][post]          = 40uA;
   OtpBCC.SRESOL[EGFG1VT0][post]         = 500nA;
   OtpBCC.LLIM[EGFG1VT0][post]           = 5uA;
   OtpBCC.ULIM[EGFG1VT0][post]           = 37uA;
   OtpBCC.TCRNUM[EGFG1VT0][post]         = 6;
   OtpBCC.IRATIO[EGFG1VT0][post]         = TNUM_MULT1;
   OtpBCC.RDOPTION[EGFG1VT0][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[EGFG1VT0]              = OTPTYPE;
   OtpBCC.TDATA[EGFG1VT0]               = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[EGFG1VT0]              = -25uA;
   OtpBCC.UDELTA[EGFG1VT0]              = 3uA;
   OtpBCC.PREVTYPE[EGFG1VT0]            = EGFG1VT0;

    /*---- pre ----*/
   OtpBCC.ENA[EGFG2VT0][pre]             = false;
   OtpBCC.ENARED[EGFG2VT0][pre]          = false;
   OtpBCC.DLOGONLY[EGFG2VT0][pre]        = false;
   OtpBCC.SSTART[EGFG2VT0][pre]          = 6uA;
   OtpBCC.SSTOP[EGFG2VT0][pre]           = 40uA;
   OtpBCC.SRESOL[EGFG2VT0][pre]          = 500nA;
   OtpBCC.LLIM[EGFG2VT0][pre]            = 5uA;
   OtpBCC.ULIM[EGFG2VT0][pre]            = 30uA;
   OtpBCC.TCRNUM[EGFG2VT0][pre]          = 6;
   OtpBCC.IRATIO[EGFG2VT0][pre]          = TNUM_MULT1;
   OtpBCC.RDOPTION[EGFG2VT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpBCC.ENA[EGFG2VT0][post]            = false;
   OtpBCC.ENARED[EGFG2VT0][post]         = false;
   OtpBCC.DLOGONLY[EGFG2VT0][post]       = false;
   OtpBCC.SSTART[EGFG2VT0][post]         = 6uA;
   OtpBCC.SSTOP[EGFG2VT0][post]          = 40uA;
   OtpBCC.SRESOL[EGFG2VT0][post]         = 500nA;
   OtpBCC.LLIM[EGFG2VT0][post]           = 5uA;
   OtpBCC.ULIM[EGFG2VT0][post]           = 37uA;
   OtpBCC.TCRNUM[EGFG2VT0][post]         = 6;
   OtpBCC.IRATIO[EGFG2VT0][post]         = TNUM_MULT1;
   OtpBCC.RDOPTION[EGFG2VT0][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[EGFG2VT0]              = OTPTYPE;
   OtpBCC.TDATA[EGFG2VT0]               = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[EGFG2VT0]              = -25uA;
   OtpBCC.UDELTA[EGFG2VT0]              = 3uA;
   OtpBCC.PREVTYPE[EGFG2VT0]            = EGFG2VT0;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   OtpBCC.ENA[EGFG3VT0][pre]             = false;
#else
   OtpBCC.ENA[EGFG3VT0][pre]             = false;
#endif   
   OtpBCC.ENARED[EGFG3VT0][pre]          = false;
   OtpBCC.DLOGONLY[EGFG3VT0][pre]        = false;
   OtpBCC.SSTART[EGFG3VT0][pre]          = 6uA;
   OtpBCC.SSTOP[EGFG3VT0][pre]           = 40uA;
   OtpBCC.SRESOL[EGFG3VT0][pre]          = 500nA;
   OtpBCC.LLIM[EGFG3VT0][pre]            = 5uA;
   OtpBCC.ULIM[EGFG3VT0][pre]            = 30uA;
   OtpBCC.TCRNUM[EGFG3VT0][pre]          = 6;
   OtpBCC.IRATIO[EGFG3VT0][pre]          = TNUM_MULT1;
   OtpBCC.RDOPTION[EGFG3VT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpBCC.ENA[EGFG3VT0][post]            = false;
#else
   OtpBCC.ENA[EGFG3VT0][post]            = false;
#endif   
   OtpBCC.ENARED[EGFG3VT0][post]         = false;
   OtpBCC.DLOGONLY[EGFG3VT0][post]       = false;
   OtpBCC.SSTART[EGFG3VT0][post]         = 6uA;
   OtpBCC.SSTOP[EGFG3VT0][post]          = 40uA;
   OtpBCC.SRESOL[EGFG3VT0][post]         = 500nA;
   OtpBCC.LLIM[EGFG3VT0][post]           = 5uA;
   OtpBCC.ULIM[EGFG3VT0][post]           = 44uA;
   OtpBCC.TCRNUM[EGFG3VT0][post]         = 6;
   OtpBCC.IRATIO[EGFG3VT0][post]         = TNUM_MULT1;
   OtpBCC.RDOPTION[EGFG3VT0][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[EGFG3VT0]              = OTPTYPE;
   OtpBCC.TDATA[EGFG3VT0]               = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[EGFG3VT0]              = -2uA;
   OtpBCC.UDELTA[EGFG3VT0]              = 14uA;
   OtpBCC.PREVTYPE[EGFG3VT0]            = EGFG3VT0;

    /*---- pre ----*/
   OtpBCC.ENA[EGFG4VT0][pre]             = false;
   OtpBCC.ENARED[EGFG4VT0][pre]          = false;
   OtpBCC.DLOGONLY[EGFG4VT0][pre]        = false;
   OtpBCC.SSTART[EGFG4VT0][pre]          = 6uA;
   OtpBCC.SSTOP[EGFG4VT0][pre]           = 40uA;
   OtpBCC.SRESOL[EGFG4VT0][pre]          = 500nA;
   OtpBCC.LLIM[EGFG4VT0][pre]            = 5uA;
   OtpBCC.ULIM[EGFG4VT0][pre]            = 30uA;
   OtpBCC.TCRNUM[EGFG4VT0][pre]          = 6;
   OtpBCC.IRATIO[EGFG4VT0][pre]          = TNUM_MULT1;
   OtpBCC.RDOPTION[EGFG4VT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpBCC.ENA[EGFG4VT0][post]            = false;
   OtpBCC.ENARED[EGFG4VT0][post]         = false;
   OtpBCC.DLOGONLY[EGFG4VT0][post]       = false;
   OtpBCC.SSTART[EGFG4VT0][post]         = 6uA;
   OtpBCC.SSTOP[EGFG4VT0][post]          = 40uA;
   OtpBCC.SRESOL[EGFG4VT0][post]         = 500nA;
   OtpBCC.LLIM[EGFG4VT0][post]           = 5uA;
   OtpBCC.ULIM[EGFG4VT0][post]           = 38uA;
   OtpBCC.TCRNUM[EGFG4VT0][post]         = 6;
   OtpBCC.IRATIO[EGFG4VT0][post]         = TNUM_MULT1;
   OtpBCC.RDOPTION[EGFG4VT0][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[EGFG4VT0]              = OTPTYPE;
   OtpBCC.TDATA[EGFG4VT0]               = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[EGFG4VT0]              = -2uA;
   OtpBCC.UDELTA[EGFG4VT0]              = 8uA;
   OtpBCC.PREVTYPE[EGFG4VT0]            = EGFG4VT0;

    /*---- pre ----*/
   OtpBCC.ENA[EGFG5VT0][pre]             = false;
   OtpBCC.ENARED[EGFG5VT0][pre]          = false;
   OtpBCC.DLOGONLY[EGFG5VT0][pre]        = false;
   OtpBCC.SSTART[EGFG5VT0][pre]          = 6uA;
   OtpBCC.SSTOP[EGFG5VT0][pre]           = 40uA;
   OtpBCC.SRESOL[EGFG5VT0][pre]          = 500nA;
   OtpBCC.LLIM[EGFG5VT0][pre]            = 5uA;
   OtpBCC.ULIM[EGFG5VT0][pre]            = 30uA;
   OtpBCC.TCRNUM[EGFG5VT0][pre]          = 6;
   OtpBCC.IRATIO[EGFG5VT0][pre]          = TNUM_MULT1;
   OtpBCC.RDOPTION[EGFG5VT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpBCC.ENA[EGFG5VT0][post]            = false;
   OtpBCC.ENARED[EGFG5VT0][post]         = false;
   OtpBCC.DLOGONLY[EGFG5VT0][post]       = false;
   OtpBCC.SSTART[EGFG5VT0][post]         = 6uA;
   OtpBCC.SSTOP[EGFG5VT0][post]          = 40uA;
   OtpBCC.SRESOL[EGFG5VT0][post]         = 500nA;
   OtpBCC.LLIM[EGFG5VT0][post]           = 5uA;
   OtpBCC.ULIM[EGFG5VT0][post]           = 35uA;
   OtpBCC.TCRNUM[EGFG5VT0][post]         = 6;
   OtpBCC.IRATIO[EGFG5VT0][post]         = TNUM_MULT1;
   OtpBCC.RDOPTION[EGFG5VT0][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[EGFG5VT0]              = OTPTYPE;
   OtpBCC.TDATA[EGFG5VT0]               = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[EGFG5VT0]              = -20uA;
   OtpBCC.UDELTA[EGFG5VT0]              = 5uA;
   OtpBCC.PREVTYPE[EGFG5VT0]            = EGFG5VT0;

    /*---- pre ----*/
   OtpBCC.ENA[RDDISTBVT0][pre]             = false;
   OtpBCC.ENARED[RDDISTBVT0][pre]          = false;
   OtpBCC.DLOGONLY[RDDISTBVT0][pre]        = false;
   OtpBCC.SSTART[RDDISTBVT0][pre]          = 6uA;
   OtpBCC.SSTOP[RDDISTBVT0][pre]           = 40uA;
   OtpBCC.SRESOL[RDDISTBVT0][pre]          = 500nA;
   OtpBCC.LLIM[RDDISTBVT0][pre]            = 5uA;
   OtpBCC.ULIM[RDDISTBVT0][pre]            = 30uA;
   OtpBCC.TCRNUM[RDDISTBVT0][pre]          = 6;
   OtpBCC.IRATIO[RDDISTBVT0][pre]          = TNUM_MULT1;
   OtpBCC.RDOPTION[RDDISTBVT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpBCC.ENA[RDDISTBVT0][post]            = false;
   OtpBCC.ENARED[RDDISTBVT0][post]         = false;
   OtpBCC.DLOGONLY[RDDISTBVT0][post]       = false;
   OtpBCC.SSTART[RDDISTBVT0][post]         = 6uA;
   OtpBCC.SSTOP[RDDISTBVT0][post]          = 40uA;
   OtpBCC.SRESOL[RDDISTBVT0][post]         = 500nA;
   OtpBCC.LLIM[RDDISTBVT0][post]           = 5uA;
   OtpBCC.ULIM[RDDISTBVT0][post]           = 35uA;
   OtpBCC.TCRNUM[RDDISTBVT0][post]         = 6;
   OtpBCC.IRATIO[RDDISTBVT0][post]         = TNUM_MULT1;
   OtpBCC.RDOPTION[RDDISTBVT0][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[RDDISTBVT0]              = OTPTYPE;
   OtpBCC.TDATA[RDDISTBVT0]               = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[RDDISTBVT0]              = -2uA;
   OtpBCC.UDELTA[RDDISTBVT0]              = 5uA;
   OtpBCC.PREVTYPE[RDDISTBVT0]            = EGFG3VT0;  /*RDDISTBVT0}; {KChau - yield learning*/

    /*---- pre ----*/
   OtpBCC.ENA[RDDISTB2VT0][pre]             = false;
   OtpBCC.ENARED[RDDISTB2VT0][pre]          = false;
   OtpBCC.DLOGONLY[RDDISTB2VT0][pre]        = false;
   OtpBCC.SSTART[RDDISTB2VT0][pre]          = 6uA;
   OtpBCC.SSTOP[RDDISTB2VT0][pre]           = 40uA;
   OtpBCC.SRESOL[RDDISTB2VT0][pre]          = 500nA;
   OtpBCC.LLIM[RDDISTB2VT0][pre]            = 5uA;
   OtpBCC.ULIM[RDDISTB2VT0][pre]            = 30uA;
   OtpBCC.TCRNUM[RDDISTB2VT0][pre]          = 6;
   OtpBCC.IRATIO[RDDISTB2VT0][pre]          = TNUM_MULT1;
   OtpBCC.RDOPTION[RDDISTB2VT0][pre]        = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpBCC.ENA[RDDISTB2VT0][post]            = false;
   OtpBCC.ENARED[RDDISTB2VT0][post]         = false;
   OtpBCC.DLOGONLY[RDDISTB2VT0][post]       = false;
   OtpBCC.SSTART[RDDISTB2VT0][post]         = 6uA;
   OtpBCC.SSTOP[RDDISTB2VT0][post]          = 40uA;
   OtpBCC.SRESOL[RDDISTB2VT0][post]         = 500nA;
   OtpBCC.LLIM[RDDISTB2VT0][post]           = 5uA;
   OtpBCC.ULIM[RDDISTB2VT0][post]           = 35uA;
   OtpBCC.TCRNUM[RDDISTB2VT0][post]         = 6;
   OtpBCC.IRATIO[RDDISTB2VT0][post]         = TNUM_MULT1;
   OtpBCC.RDOPTION[RDDISTB2VT0][post]       = TNUM_TOPTION_PSARD;
   OtpBCC.MEMCFG[RDDISTB2VT0]              = OTPTYPE;
   OtpBCC.TDATA[RDDISTB2VT0]               = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpBCC.LDELTA[RDDISTB2VT0]              = -2uA;
   OtpBCC.UDELTA[RDDISTB2VT0]              = 5uA;
   OtpBCC.PREVTYPE[RDDISTB2VT0]            = RDDISTB2VT0;

    /*---- pre ----*/
   OtpBCC.ENA[CHKVT0][pre]             = false;
   OtpBCC.ENARED[CHKVT0][pre]          = false;
   OtpBCC.DLOGONLY[CHKVT0][pre]        = false;
   OtpBCC.SSTART[CHKVT0][pre]          = 6uA;
   OtpBCC.SSTOP[CHKVT0][pre]           = 30uA;
   OtpBCC.SRESOL[CHKVT0][pre]          = 500nA;
   OtpBCC.LLIM[CHKVT0][pre]            = 5uA;
   OtpBCC.ULIM[CHKVT0][pre]            = 30uA;
   OtpBCC.TCRNUM[CHKVT0][pre]          = 6;
   OtpBCC.IRATIO[CHKVT0][pre]          = TNUM_MULT1;
   OtpBCC.RDOPTION[CHKVT0][pre]        = TNUM_TOPTION_NORMAL;  /*PSARD;*/
    /*---- pst ----*/
   OtpBCC.ENA[CHKVT0][post]            = false;
   OtpBCC.ENARED[CHKVT0][post]         = false;
   OtpBCC.DLOGONLY[CHKVT0][post]       = false;
   OtpBCC.SSTART[CHKVT0][post]         = 6uA;
   OtpBCC.SSTOP[CHKVT0][post]          = 30uA;
   OtpBCC.SRESOL[CHKVT0][post]         = 500nA;
   OtpBCC.LLIM[CHKVT0][post]           = 5uA;
   OtpBCC.ULIM[CHKVT0][post]           = 28uA;
   OtpBCC.TCRNUM[CHKVT0][post]         = 6;
   OtpBCC.IRATIO[CHKVT0][post]         = TNUM_MULT1;
   OtpBCC.RDOPTION[CHKVT0][post]       = TNUM_TOPTION_NORMAL;  /*PSARD;*/
   OtpBCC.MEMCFG[CHKVT0]              = OTPTYPE;
   switch(SelectedTITestType) {
     case MP1 : OtpBCC.TDATA[CHKVT0]       = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
     case MP2 : OtpBCC.TDATA[CHKVT0]       = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
     default: OtpBCC.TDATA[CHKVT0]   = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
   }   /* case */
   OtpBCC.LDELTA[CHKVT0]              = -6uA;
   OtpBCC.UDELTA[CHKVT0]              = 6uA;
   OtpBCC.PREVTYPE[CHKVT0]            = CHKVT0;

    /*---- pre ----*/
   OtpBCC.ENA[CHKVT0DRL][pre]             = false;
   OtpBCC.ENARED[CHKVT0DRL][pre]          = false;
   OtpBCC.DLOGONLY[CHKVT0DRL][pre]        = false;
   OtpBCC.SSTART[CHKVT0DRL][pre]          = 6uA;
   OtpBCC.SSTOP[CHKVT0DRL][pre]           = 30uA;
   OtpBCC.SRESOL[CHKVT0DRL][pre]          = 500nA;
   OtpBCC.LLIM[CHKVT0DRL][pre]            = 5uA;
   OtpBCC.ULIM[CHKVT0DRL][pre]            = 28uA;
   OtpBCC.TCRNUM[CHKVT0DRL][pre]          = 6;
   OtpBCC.IRATIO[CHKVT0DRL][pre]          = TNUM_MULT1;
   OtpBCC.RDOPTION[CHKVT0DRL][pre]        = TNUM_TOPTION_NORMAL;  /*PSARD;*/
    /*---- pst ----*/
   OtpBCC.ENA[CHKVT0DRL][post]            = false;
   OtpBCC.ENARED[CHKVT0DRL][post]         = false;
   OtpBCC.DLOGONLY[CHKVT0DRL][post]       = false;
   OtpBCC.SSTART[CHKVT0DRL][post]         = 6uA;
   OtpBCC.SSTOP[CHKVT0DRL][post]          = 30uA;
   OtpBCC.SRESOL[CHKVT0DRL][post]         = 500nA;
   switch(SelectedTITestType) {
     case MP2 :  
              OtpBCC.LLIM[CHKVT0DRL][post]           = 5uA;
              OtpBCC.ULIM[CHKVT0DRL][post]           = 35uA;
            break; 
     case MP3 :  
              OtpBCC.LLIM[CHKVT0DRL][post]           = 5uA;
              OtpBCC.ULIM[CHKVT0DRL][post]           = 28uA;
            break; 
     default:  
              OtpBCC.LLIM[CHKVT0DRL][post]           = 5uA;
              OtpBCC.ULIM[CHKVT0DRL][post]           = 28uA;
      break; 
   }   /* case */
   OtpBCC.TCRNUM[CHKVT0DRL][post]         = 6;
   OtpBCC.IRATIO[CHKVT0DRL][post]         = TNUM_MULT1;
   OtpBCC.RDOPTION[CHKVT0DRL][post]       = TNUM_TOPTION_NORMAL;  /*PSARD;*/
   OtpBCC.MEMCFG[CHKVT0DRL]              = OTPTYPE;
   switch(SelectedTITestType) {
     case MP2 : OtpBCC.TDATA[CHKVT0DRL]       = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
     case MP3 : OtpBCC.TDATA[CHKVT0DRL]       = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
     default: OtpBCC.TDATA[CHKVT0DRL]   = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
   }   /* case */
   OtpBCC.LDELTA[CHKVT0DRL]              = -5uA;
   OtpBCC.UDELTA[CHKVT0DRL]              = 5uA;
   OtpBCC.PREVTYPE[CHKVT0DRL]            = CHKVT0DRL;

    /*---- pre ----*/
   OtpBCC.ENA[RCODEVT0][pre]             = false;
   OtpBCC.ENARED[RCODEVT0][pre]          = false;
   OtpBCC.DLOGONLY[RCODEVT0][pre]        = false;
   OtpBCC.SSTART[RCODEVT0][pre]          = 6uA;
   OtpBCC.SSTOP[RCODEVT0][pre]           = 30uA;
   OtpBCC.SRESOL[RCODEVT0][pre]          = 500nA;
   OtpBCC.LLIM[RCODEVT0][pre]            = 5uA;
   OtpBCC.ULIM[RCODEVT0][pre]            = 28uA;
   OtpBCC.TCRNUM[RCODEVT0][pre]          = 6;
   OtpBCC.IRATIO[RCODEVT0][pre]          = TNUM_MULT1;
   OtpBCC.RDOPTION[RCODEVT0][pre]        = TNUM_TOPTION_NORMAL;  /*PSARD;*/
    /*---- pst ----*/
   OtpBCC.ENA[RCODEVT0][post]            = false;
   OtpBCC.ENARED[RCODEVT0][post]         = false;
   OtpBCC.DLOGONLY[RCODEVT0][post]       = false;
   OtpBCC.SSTART[RCODEVT0][post]         = 6uA;
   OtpBCC.SSTOP[RCODEVT0][post]          = 30uA;
   OtpBCC.SRESOL[RCODEVT0][post]         = 500nA;
   OtpBCC.LLIM[RCODEVT0][post]           = 5uA;
   OtpBCC.ULIM[RCODEVT0][post]           = 28uA;
   OtpBCC.TCRNUM[RCODEVT0][post]         = 6;
   OtpBCC.IRATIO[RCODEVT0][post]         = TNUM_MULT1;
   OtpBCC.RDOPTION[RCODEVT0][post]       = TNUM_TOPTION_NORMAL;  /*PSARD;*/
   OtpBCC.MEMCFG[RCODEVT0]              = OTPTYPE;
   switch(SelectedTITestType) {
     case MP3 : OtpBCC.TDATA[RCODEVT0]       = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
     default: OtpBCC.TDATA[RCODEVT0]   = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
   }   /* case */
   OtpBCC.LDELTA[RCODEVT0]              = -6uA;
   OtpBCC.UDELTA[RCODEVT0]              = 6uA;
   OtpBCC.PREVTYPE[RCODEVT0]            = RCODEVT0;




    /*---- pre ----*/
   MainVT.ENA[ONOVT0][pre]              = (SelectedTITestType==MP1);
   MainVT.ENARED[ONOVT0][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[ONOVT0][pre]         = false;
   MainVT.SSTART[ONOVT0][pre]           = 2.0V;
   MainVT.SSTOP[ONOVT0][pre]            = 6.7V;
   MainVT.SRESOL[ONOVT0][pre]           = 10mV;
   MainVT.LLIM[ONOVT0][pre]             = 3.4V;
   MainVT.ULIM[ONOVT0][pre]             = 6.5V;
   MainVT.TCRNUM[ONOVT0][pre]           = 5;
   MainVT.IRATIO[ONOVT0][pre]           = TNUM_DIV2;
   MainVT.RDOPTION[ONOVT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainVT.ENA[ONOVT0][post]             = (SelectedTITestType==MP1);
   MainVT.ENARED[ONOVT0][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[ONOVT0][post]        = false;
   MainVT.SSTART[ONOVT0][post]          = 2.0V;
   MainVT.SSTOP[ONOVT0][post]           = 6.7V;
   MainVT.SRESOL[ONOVT0][post]          = 10mV;
   MainVT.LLIM[ONOVT0][post]            = 2.3V;
   MainVT.ULIM[ONOVT0][post]            = 6.5V;
   MainVT.TCRNUM[ONOVT0][post]          = 5;
   MainVT.IRATIO[ONOVT0][post]          = TNUM_DIV2;
   MainVT.RDOPTION[ONOVT0][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[ONOVT0]               = BANKTYPE;
   MainVT.TDATA[ONOVT0]                = TNUM_DATA_0S;
   switch(SelectedTITestType) {
     case  MP1: case  MP2: case  FT2 :   
        MainVT.LDELTA[ONOVT0]               = -0.7V;
        MainVT.UDELTA[ONOVT0]               = 0.25V;
      break; 
     default:  
        MainVT.LDELTA[ONOVT0]               = -0.7V;
        MainVT.UDELTA[ONOVT0]               = 0.25V;
      break; 
   }   /* case */
   MainVT.PREVTYPE[ONOVT0]             = ONOVT0;

    /*---- pre ----*/
   MainVT.ENA[CSFGVT0][pre]              = (SelectedTITestType==MP1);
   MainVT.ENARED[CSFGVT0][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[CSFGVT0][pre]         = false;
   MainVT.SSTART[CSFGVT0][pre]           = 2.0V;
   MainVT.SSTOP[CSFGVT0][pre]            = 6.7V;
   MainVT.SRESOL[CSFGVT0][pre]           = 10mV;
   MainVT.LLIM[CSFGVT0][pre]             = 3.4V;
   MainVT.ULIM[CSFGVT0][pre]             = 6.5V;
   MainVT.TCRNUM[CSFGVT0][pre]           = 5;
   MainVT.IRATIO[CSFGVT0][pre]           = TNUM_DIV2;
   MainVT.RDOPTION[CSFGVT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainVT.ENA[CSFGVT0][post]             = (SelectedTITestType==MP1);
   MainVT.ENARED[CSFGVT0][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[CSFGVT0][post]        = false;
   MainVT.SSTART[CSFGVT0][post]          = 1.0V;
   MainVT.SSTOP[CSFGVT0][post]           = 6.7V;
   MainVT.SRESOL[CSFGVT0][post]          = 10mV;
   MainVT.LLIM[CSFGVT0][post]            = 2.9V;  /*C06 CHANGED: from 1.2v to 2.9V to match spec Jamal Sheikh modified Fri, Feb  3 2012*/
   MainVT.ULIM[CSFGVT0][post]            = 6.5V;
   MainVT.TCRNUM[CSFGVT0][post]          = 5;
   MainVT.IRATIO[CSFGVT0][post]          = TNUM_DIV2;
   MainVT.RDOPTION[CSFGVT0][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[CSFGVT0]               = BANKTYPE;
   MainVT.TDATA[CSFGVT0]                = TNUM_DATA_0S;
   MainVT.LDELTA[CSFGVT0]               = -0.5V;
   MainVT.UDELTA[CSFGVT0]               = 0.25V;
   MainVT.PREVTYPE[CSFGVT0]             = CSFGVT0;

    /*---- pre ----*/
   MainVT.ENA[EGFG1VT0][pre]              = false;
   MainVT.ENARED[EGFG1VT0][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[EGFG1VT0][pre]         = true;
   MainVT.SSTART[EGFG1VT0][pre]           = 2.0V;
   MainVT.SSTOP[EGFG1VT0][pre]            = 6.7V;
   MainVT.SRESOL[EGFG1VT0][pre]           = 10mV;
   MainVT.LLIM[EGFG1VT0][pre]             = 3V;
   MainVT.ULIM[EGFG1VT0][pre]             = 6.5V;
   MainVT.TCRNUM[EGFG1VT0][pre]           = 5;
   MainVT.IRATIO[EGFG1VT0][pre]           = TNUM_DIV2;
   MainVT.RDOPTION[EGFG1VT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainVT.ENA[EGFG1VT0][post]             = false;
   MainVT.ENARED[EGFG1VT0][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[EGFG1VT0][post]        = true;
   MainVT.SSTART[EGFG1VT0][post]          = 2.0V;
   MainVT.SSTOP[EGFG1VT0][post]           = 6.7V;
   MainVT.SRESOL[EGFG1VT0][post]          = 10mV;
   MainVT.LLIM[EGFG1VT0][post]            = 3V;
   MainVT.ULIM[EGFG1VT0][post]            = 6.5V;
   MainVT.TCRNUM[EGFG1VT0][post]          = 5;
   MainVT.IRATIO[EGFG1VT0][post]          = TNUM_DIV2;
   MainVT.RDOPTION[EGFG1VT0][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[EGFG1VT0]               = BANKTYPE;
   MainVT.TDATA[EGFG1VT0]                = TNUM_DATA_0S;
   MainVT.LDELTA[EGFG1VT0]               = -0.5V;
   MainVT.UDELTA[EGFG1VT0]               = 2V;
   MainVT.PREVTYPE[EGFG1VT0]             = EGFG1VT0;

    /*---- pre ----*/
   MainVT.ENA[EGFG2VT0][pre]              = false;
   MainVT.ENARED[EGFG2VT0][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[EGFG2VT0][pre]         = true;
   MainVT.SSTART[EGFG2VT0][pre]           = 2.0V;
   MainVT.SSTOP[EGFG2VT0][pre]            = 6.7V;
   MainVT.SRESOL[EGFG2VT0][pre]           = 10mV;
   MainVT.LLIM[EGFG2VT0][pre]             = 3V;
   MainVT.ULIM[EGFG2VT0][pre]             = 6.5V;
   MainVT.TCRNUM[EGFG2VT0][pre]           = 5;
   MainVT.IRATIO[EGFG2VT0][pre]           = TNUM_DIV2;
   MainVT.RDOPTION[EGFG2VT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainVT.ENA[EGFG2VT0][post]             = false;
   MainVT.ENARED[EGFG2VT0][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[EGFG2VT0][post]        = true;
   MainVT.SSTART[EGFG2VT0][post]          = 2.0V;
   MainVT.SSTOP[EGFG2VT0][post]           = 6.7V;
   MainVT.SRESOL[EGFG2VT0][post]          = 10mV;
   MainVT.LLIM[EGFG2VT0][post]            = 3V;
   MainVT.ULIM[EGFG2VT0][post]            = 6.5V;
   MainVT.TCRNUM[EGFG2VT0][post]          = 5;
   MainVT.IRATIO[EGFG2VT0][post]          = TNUM_DIV2;
   MainVT.RDOPTION[EGFG2VT0][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[EGFG2VT0]               = BANKTYPE;
   MainVT.TDATA[EGFG2VT0]                = TNUM_DATA_0S;
   MainVT.LDELTA[EGFG2VT0]               = -0.5V;
   MainVT.UDELTA[EGFG2VT0]               = 2V;
   MainVT.PREVTYPE[EGFG2VT0]             = EGFG2VT0;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[EGFG3VT0][pre]              = (SelectedTITestType==MP1);
#else
   MainVT.ENA[EGFG3VT0][pre]              = false;
#endif   
   MainVT.ENARED[EGFG3VT0][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[EGFG3VT0][pre]         = false;
   MainVT.SSTART[EGFG3VT0][pre]           = 2.0V;
   MainVT.SSTOP[EGFG3VT0][pre]            = 6.7V;
   MainVT.SRESOL[EGFG3VT0][pre]           = 10mV;
   MainVT.LLIM[EGFG3VT0][pre]             = 3.4V;
   MainVT.ULIM[EGFG3VT0][pre]             = 6.5V;
   MainVT.TCRNUM[EGFG3VT0][pre]           = 5;
   MainVT.IRATIO[EGFG3VT0][pre]           = TNUM_DIV2;
   MainVT.RDOPTION[EGFG3VT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[EGFG3VT0][post]             = (SelectedTITestType==MP1);
#else
   MainVT.ENA[EGFG3VT0][post]             = false;
#endif   
   MainVT.ENARED[EGFG3VT0][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[EGFG3VT0][post]        = false;
   MainVT.SSTART[EGFG3VT0][post]          = 2.0V;
   MainVT.SSTOP[EGFG3VT0][post]           = 6.7V;
   MainVT.SRESOL[EGFG3VT0][post]          = 10mV;
   MainVT.LLIM[EGFG3VT0][post]            = 1.2V;
   MainVT.ULIM[EGFG3VT0][post]            = 6.5V;
   MainVT.TCRNUM[EGFG3VT0][post]          = 5;
   MainVT.IRATIO[EGFG3VT0][post]          = TNUM_DIV2;
   MainVT.RDOPTION[EGFG3VT0][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[EGFG3VT0]               = BANKTYPE;
   MainVT.TDATA[EGFG3VT0]                = TNUM_DATA_0S;
   MainVT.LDELTA[EGFG3VT0]               = -2.2V;
   MainVT.UDELTA[EGFG3VT0]               = 0.25V;
   MainVT.PREVTYPE[EGFG3VT0]             = EGFG3VT0;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[EGFG4VT0][pre]              = (SelectedTITestType==MP1);
#else
   MainVT.ENA[EGFG4VT0][pre]              = false;
#endif   
   MainVT.ENARED[EGFG4VT0][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[EGFG4VT0][pre]         = true;
   MainVT.SSTART[EGFG4VT0][pre]           = 2.0V;
   MainVT.SSTOP[EGFG4VT0][pre]            = 6.7V;
   MainVT.SRESOL[EGFG4VT0][pre]           = 10mV;
   MainVT.LLIM[EGFG4VT0][pre]             = 3.4V;
   MainVT.ULIM[EGFG4VT0][pre]             = 6.5V;
   MainVT.TCRNUM[EGFG4VT0][pre]           = 5;
   MainVT.IRATIO[EGFG4VT0][pre]           = TNUM_DIV2;
   MainVT.RDOPTION[EGFG4VT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[EGFG4VT0][post]             = (SelectedTITestType==MP1);
#else
   MainVT.ENA[EGFG4VT0][post]             = false;
#endif   
   MainVT.ENARED[EGFG4VT0][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[EGFG4VT0][post]        = true;
   MainVT.SSTART[EGFG4VT0][post]          = 2.0V;
   MainVT.SSTOP[EGFG4VT0][post]           = 6.7V;
   MainVT.SRESOL[EGFG4VT0][post]          = 10mV;
   MainVT.LLIM[EGFG4VT0][post]            = 2.3V;
   MainVT.ULIM[EGFG4VT0][post]            = 6.5V;
   MainVT.TCRNUM[EGFG4VT0][post]          = 5;
   MainVT.IRATIO[EGFG4VT0][post]          = TNUM_DIV2;
   MainVT.RDOPTION[EGFG4VT0][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[EGFG4VT0]               = BANKTYPE;
   MainVT.TDATA[EGFG4VT0]                = TNUM_DATA_0S;
   MainVT.LDELTA[EGFG4VT0]               = -1.1V;
   MainVT.UDELTA[EGFG4VT0]               = 0.25V;
   MainVT.PREVTYPE[EGFG4VT0]             = EGFG4VT0;

    /*---- pre ----*/
   MainVT.ENA[EGFG5VT0][pre]              = false;
   MainVT.ENARED[EGFG5VT0][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[EGFG5VT0][pre]         = true;
   MainVT.SSTART[EGFG5VT0][pre]           = 2.0V;
   MainVT.SSTOP[EGFG5VT0][pre]            = 6.7V;
   MainVT.SRESOL[EGFG5VT0][pre]           = 10mV;
   MainVT.LLIM[EGFG5VT0][pre]             = 3V;
   MainVT.ULIM[EGFG5VT0][pre]             = 6.5V;
   MainVT.TCRNUM[EGFG5VT0][pre]           = 5;
   MainVT.IRATIO[EGFG5VT0][pre]           = TNUM_DIV2;
   MainVT.RDOPTION[EGFG5VT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainVT.ENA[EGFG5VT0][post]             = false;
   MainVT.ENARED[EGFG5VT0][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[EGFG5VT0][post]        = true;
   MainVT.SSTART[EGFG5VT0][post]          = 2.0V;
   MainVT.SSTOP[EGFG5VT0][post]           = 6.7V;
   MainVT.SRESOL[EGFG5VT0][post]          = 10mV;
   MainVT.LLIM[EGFG5VT0][post]            = 3V;
   MainVT.ULIM[EGFG5VT0][post]            = 6.5V;
   MainVT.TCRNUM[EGFG5VT0][post]          = 5;
   MainVT.IRATIO[EGFG5VT0][post]          = TNUM_DIV2;
   MainVT.RDOPTION[EGFG5VT0][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[EGFG5VT0]               = BANKTYPE;
   MainVT.TDATA[EGFG5VT0]                = TNUM_DATA_0S;
   MainVT.LDELTA[EGFG5VT0]               = -0.5V;
   MainVT.UDELTA[EGFG5VT0]               = 0.5V;
   MainVT.PREVTYPE[EGFG5VT0]             = EGFG5VT0;

    /*---- pre ----*/
   MainVT.ENA[RDDISTBVT0][pre]              = false;
   MainVT.ENARED[RDDISTBVT0][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[RDDISTBVT0][pre]         = true;
   MainVT.SSTART[RDDISTBVT0][pre]           = 2.0V;
   MainVT.SSTOP[RDDISTBVT0][pre]            = 6.7V;
   MainVT.SRESOL[RDDISTBVT0][pre]           = 10mV;
   MainVT.LLIM[RDDISTBVT0][pre]             = 3V;
   MainVT.ULIM[RDDISTBVT0][pre]             = 6.5V;
   MainVT.TCRNUM[RDDISTBVT0][pre]           = 5;
   MainVT.IRATIO[RDDISTBVT0][pre]           = TNUM_DIV2;
   MainVT.RDOPTION[RDDISTBVT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainVT.ENA[RDDISTBVT0][post]             = false;
   MainVT.ENARED[RDDISTBVT0][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[RDDISTBVT0][post]        = true;
   MainVT.SSTART[RDDISTBVT0][post]          = 2.0V;
   MainVT.SSTOP[RDDISTBVT0][post]           = 6.7V;
   MainVT.SRESOL[RDDISTBVT0][post]          = 10mV;
   MainVT.LLIM[RDDISTBVT0][post]            = 3V;
   MainVT.ULIM[RDDISTBVT0][post]            = 6.5V;
   MainVT.TCRNUM[RDDISTBVT0][post]          = 5;
   MainVT.IRATIO[RDDISTBVT0][post]          = TNUM_DIV2;
   MainVT.RDOPTION[RDDISTBVT0][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[RDDISTBVT0]               = BANKTYPE;
   MainVT.TDATA[RDDISTBVT0]                = TNUM_DATA_0S;
   MainVT.LDELTA[RDDISTBVT0]               = -0.5V;
   MainVT.UDELTA[RDDISTBVT0]               = 0.5V;
   MainVT.PREVTYPE[RDDISTBVT0]             = EGFG3VT0;  /*RDDISTBVT0}; {KChau - yield learning*/

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[RDDISTB2VT0][pre]              = (SelectedTITestType==MP1);
#else
   MainVT.ENA[RDDISTB2VT0][pre]              = (SelectedTITestType==MP1);
#endif   
   MainVT.ENARED[RDDISTB2VT0][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[RDDISTB2VT0][pre]         = false;
   MainVT.SSTART[RDDISTB2VT0][pre]           = 2.0V;
   MainVT.SSTOP[RDDISTB2VT0][pre]            = 6.7V;
   MainVT.SRESOL[RDDISTB2VT0][pre]           = 10mV;
   MainVT.LLIM[RDDISTB2VT0][pre]             = 3.4V;
   MainVT.ULIM[RDDISTB2VT0][pre]             = 6.5V;
   MainVT.TCRNUM[RDDISTB2VT0][pre]           = 5;
   MainVT.IRATIO[RDDISTB2VT0][pre]           = TNUM_DIV2;
   MainVT.RDOPTION[RDDISTB2VT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[RDDISTB2VT0][post]             = (SelectedTITestType==MP1);
#else
   MainVT.ENA[RDDISTB2VT0][post]             = (SelectedTITestType==MP1);
#endif   
   MainVT.ENARED[RDDISTB2VT0][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[RDDISTB2VT0][post]        = false;
   MainVT.SSTART[RDDISTB2VT0][post]          = 2.0V;
   MainVT.SSTOP[RDDISTB2VT0][post]           = 6.7V;
   MainVT.SRESOL[RDDISTB2VT0][post]          = 10mV;
   MainVT.LLIM[RDDISTB2VT0][post]            = 2.7V;
   MainVT.ULIM[RDDISTB2VT0][post]            = 6.5V;
   MainVT.TCRNUM[RDDISTB2VT0][post]          = 5;
   MainVT.IRATIO[RDDISTB2VT0][post]          = TNUM_DIV2;
   MainVT.RDOPTION[RDDISTB2VT0][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[RDDISTB2VT0]               = BANKTYPE;
   MainVT.TDATA[RDDISTB2VT0]                = TNUM_DATA_0S;
   MainVT.LDELTA[RDDISTB2VT0]               = -0.4V;
   MainVT.UDELTA[RDDISTB2VT0]               =  0.25V;
   MainVT.PREVTYPE[RDDISTB2VT0]             = RDDISTB2VT0;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case  MP1: case MP2 :  MainVT.ENA[CHKVT0][pre]              = true;
     default: MainVT.ENA[CHKVT0][pre]              = false;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case MP3 :     MainVT.ENA[CHKVT0][pre]              = true;
     default: MainVT.ENA[CHKVT0][pre]              = false;
   }   /* case */
#endif
   MainVT.ENARED[CHKVT0][pre]           = false;
   MainVT.DLOGONLY[CHKVT0][pre]         = false;
   MainVT.SSTART[CHKVT0][pre]           = 2.0V;
   MainVT.SSTOP[CHKVT0][pre]            = 6.7V;
   MainVT.SRESOL[CHKVT0][pre]           = 10mV;
   MainVT.LLIM[CHKVT0][pre]             = 3.4V;
   MainVT.ULIM[CHKVT0][pre]             = 6.5V;
   MainVT.TCRNUM[CHKVT0][pre]           = 5;
   MainVT.IRATIO[CHKVT0][pre]           = TNUM_DIV2;
   MainVT.RDOPTION[CHKVT0][pre]         = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
   MainVT.ENA[CHKVT0][post]             = false;
   MainVT.ENARED[CHKVT0][post]          = false;
   MainVT.DLOGONLY[CHKVT0][post]        = false;
   MainVT.SSTART[CHKVT0][post]          = 2.0V;
   MainVT.SSTOP[CHKVT0][post]           = 6.7V;
   MainVT.SRESOL[CHKVT0][post]          = 10mV;
   MainVT.LLIM[CHKVT0][post]            = 2.7V;
   MainVT.ULIM[CHKVT0][post]            = 6.5V;
   MainVT.TCRNUM[CHKVT0][post]          = 5;
   MainVT.IRATIO[CHKVT0][post]          = TNUM_DIV2;
   MainVT.RDOPTION[CHKVT0][post]        = TNUM_TOPTION_NORMAL;
   switch(SelectedTITestType) {
     case  MP1: case MP2 :  MainVT.MEMCFG[CHKVT0]               = QUADTYPE;
     default: MainVT.MEMCFG[CHKVT0]               = BANKTYPE;
   }   /* case */
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case MP1 : MainVT.TDATA[CHKVT0]        = TNUM_DATA_ECHK;
     case MP2 : MainVT.TDATA[CHKVT0]        = TNUM_DATA_OCHK;
     default: MainVT.TDATA[CHKVT0]    = TNUM_DATA_OCHK;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case MP3 : MainVT.TDATA[CHKVT0]        = TNUM_DATA_OCHK;
     default: MainVT.TDATA[CHKVT0]    = TNUM_DATA_OCHK;
   }   /* case */
#endif
   MainVT.LDELTA[CHKVT0]               = -0.25V;
   MainVT.UDELTA[CHKVT0]               = 0.6V;
   MainVT.PREVTYPE[CHKVT0]             = CHKVT0;

    /*---- pre ----*/
   MainVT.ENA[CHKVT0DRL][pre]              = false;
   MainVT.ENARED[CHKVT0DRL][pre]           = false;
   MainVT.DLOGONLY[CHKVT0DRL][pre]         = false;
   MainVT.SSTART[CHKVT0DRL][pre]           = 2.0V;
   MainVT.SSTOP[CHKVT0DRL][pre]            = 6.7V;
   MainVT.SRESOL[CHKVT0DRL][pre]           = 10mV;
   MainVT.LLIM[CHKVT0DRL][pre]             = 3.4V;
   MainVT.ULIM[CHKVT0DRL][pre]             = 6.5V;
   MainVT.TCRNUM[CHKVT0DRL][pre]           = 5;
   MainVT.IRATIO[CHKVT0DRL][pre]           = TNUM_DIV2;
   MainVT.RDOPTION[CHKVT0DRL][pre]         = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case  MP2: case MP3 :  MainVT.ENA[CHKVT0DRL][post]             = true;
     default: MainVT.ENA[CHKVT0DRL][post]             = false;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case PreBurnIn : MainVT.ENA[CHKVT0DRL][post]             = true;
     default:   MainVT.ENA[CHKVT0DRL][post]             = false;
   } 
#endif
   MainVT.ENARED[CHKVT0DRL][post]          = false;
   MainVT.DLOGONLY[CHKVT0DRL][post]        = false;
   MainVT.SSTART[CHKVT0DRL][post]          = 2.0V;
   MainVT.SSTOP[CHKVT0DRL][post]           = 6.7V;
   MainVT.SRESOL[CHKVT0DRL][post]          = 10mV;
   MainVT.LLIM[CHKVT0DRL][post]            = 2.4V;
   MainVT.ULIM[CHKVT0DRL][post]            = 6.5V;
   MainVT.TCRNUM[CHKVT0DRL][post]          = 5;
   MainVT.IRATIO[CHKVT0DRL][post]          = TNUM_DIV2;
   MainVT.RDOPTION[CHKVT0DRL][post]        = TNUM_TOPTION_NORMAL;
   MainVT.MEMCFG[CHKVT0DRL]               = QUADTYPE;
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case MP2 : MainVT.TDATA[CHKVT0DRL]        = TNUM_DATA_ECHK;
     case MP3 : MainVT.TDATA[CHKVT0DRL]        = TNUM_DATA_OCHK;
     default: MainVT.TDATA[CHKVT0DRL]    = TNUM_DATA_OCHK;
   }   /* case */
#else
   MainVT.TDATA[CHKVT0DRL]        = TNUM_DATA_OCHK;
#endif
   switch(SelectedTITestType) {
     case MP2 :  
              MainVT.LDELTA[CHKVT0DRL]    = -0.25V;  /*not used*/
              MainVT.UDELTA[CHKVT0DRL]    = 0.6V;    /*not used*/
              DRLVT0_LDELTA[0]            = -0.25V;
              DRLVT0_LDELTA[1]            = -0.25V;
              DRLVT0_LDELTA[2]            = -0.25V;
              DRLVT0_LDELTA[3]            = -0.25V;
              DRLVT0_LDELTA[4]            = -0.25V;
              DRLVT0_LDELTA[5]            = -0.25V;
              DRLVT0_LDELTA[6]            = -0.25V;
              DRLVT0_LDELTA[7]            = -0.25V;
              DRLVT0_UDELTA[0]            = 1.0V;
              DRLVT0_UDELTA[1]            = 1.0V;
              DRLVT0_UDELTA[2]            = 1.0V;
              DRLVT0_UDELTA[3]            = 1.0V;
              DRLVT0_UDELTA[4]            = 1.0V;
              DRLVT0_UDELTA[5]            = 1.0V;
              DRLVT0_UDELTA[6]            = 1.0V;
              DRLVT0_UDELTA[7]            = 1.0V;
              DRLVT0_Median_ULimit[0]     = 0.4V;
              DRLVT0_Median_ULimit[1]     = 0.4V;
              DRLVT0_Median_ULimit[2]     = 0.4V;
              DRLVT0_Median_ULimit[3]     = 0.4V;
              DRLVT0_Median_ULimit[4]     = 0.4V;
              DRLVT0_Median_ULimit[5]     = 0.4V;
              DRLVT0_Median_ULimit[6]     = 0.4V;
              DRLVT0_Median_ULimit[7]     = 0.4V;
            break; 
     default:  
              MainVT.LDELTA[CHKVT0DRL]    = -0.25V;
              MainVT.UDELTA[CHKVT0DRL]    = 0.6V;
              DRLVT0_LDELTA[0]            = -0.25V;
              DRLVT0_LDELTA[1]            = -0.25V;
              DRLVT0_LDELTA[2]            = -0.25V;
              DRLVT0_LDELTA[3]            = -0.25V;
              DRLVT0_LDELTA[4]            = -0.25V;
              DRLVT0_LDELTA[5]            = -0.25V;
              DRLVT0_LDELTA[6]            = -0.25V;
              DRLVT0_LDELTA[7]            = -0.25V;
              DRLVT0_UDELTA[0]            = 1.0V;
              DRLVT0_UDELTA[1]            = 1.0V;
              DRLVT0_UDELTA[2]            = 1.4V;
              DRLVT0_UDELTA[3]            = 1.0V;
              DRLVT0_UDELTA[4]            = 1.0V;
              DRLVT0_UDELTA[5]            = 1.0V;
              DRLVT0_UDELTA[6]            = 1.0V;
              DRLVT0_UDELTA[7]            = 1.0V;
              DRLVT0_Median_ULimit[0]     = 0.4V;
              DRLVT0_Median_ULimit[1]     = 0.4V;
              DRLVT0_Median_ULimit[2]     = 0.4V;
              DRLVT0_Median_ULimit[3]     = 0.4V;
              DRLVT0_Median_ULimit[4]     = 0.4V;
              DRLVT0_Median_ULimit[5]     = 0.4V;
              DRLVT0_Median_ULimit[6]     = 0.4V;
              DRLVT0_Median_ULimit[7]     = 0.4V;
   }   /* case */
   MainVT.PREVTYPE[CHKVT0DRL]             = CHKVT0DRL;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case MP3 :     MainVT.ENA[RCODEVT0][pre]              = true;
     default: MainVT.ENA[RCODEVT0][pre]              = false;
   }   /* case */
#else
   MainVT.ENA[RCODEVT0][pre]              = false;
#endif
   MainVT.ENARED[RCODEVT0][pre]           = false;
   MainVT.DLOGONLY[RCODEVT0][pre]         = false;
   MainVT.SSTART[RCODEVT0][pre]           = 2.0V;
   MainVT.SSTOP[RCODEVT0][pre]            = 6.7V;
   MainVT.SRESOL[RCODEVT0][pre]           = 10mV;
   MainVT.LLIM[RCODEVT0][pre]             = 3.4V;
   MainVT.ULIM[RCODEVT0][pre]             = 6.5V;
   MainVT.TCRNUM[RCODEVT0][pre]           = 5;
   MainVT.IRATIO[RCODEVT0][pre]           = TNUM_DIV2;
   MainVT.RDOPTION[RCODEVT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case PreBurnIn : MainVT.ENA[RCODEVT0][post]             = true;
     default:   MainVT.ENA[RCODEVT0][post]             = false;
   }   /* case */
#else
   MainVT.ENA[RCODEVT0][post]             = false;
#endif
   MainVT.ENARED[RCODEVT0][post]          = false;
   MainVT.DLOGONLY[RCODEVT0][post]        = false;
   MainVT.SSTART[RCODEVT0][post]          = 2.0V;
   MainVT.SSTOP[RCODEVT0][post]           = 6.7V;
   MainVT.SRESOL[RCODEVT0][post]          = 10mV;
   MainVT.LLIM[RCODEVT0][post]            = 2.4V;
   MainVT.ULIM[RCODEVT0][post]            = 6.5V;
   MainVT.TCRNUM[RCODEVT0][post]          = 5;
   MainVT.IRATIO[RCODEVT0][post]          = TNUM_DIV2;
   MainVT.RDOPTION[RCODEVT0][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[RCODEVT0]               = ARBTYPE;
   MainVT.TDATA[RCODEVT0]                = TNUM_DATA_ARB_ECC;
   switch(SelectedTITestType) {
     case MP2 :  
              MainVT.LDELTA[RCODEVT0]               = -0.25V;
              MainVT.UDELTA[RCODEVT0]               = 0.6V;
            break; 
     default:  
              MainVT.LDELTA[RCODEVT0]               = -0.25V;
              MainVT.UDELTA[RCODEVT0]               = 0.6V;
      break; 
   }   /* case */
   MainVT.PREVTYPE[RCODEVT0]             = RCODEVT0;



    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[REVTUNVT1][pre]              = false;
#else
   MainVT.ENA[REVTUNVT1][pre]              = false;
#endif
   MainVT.ENARED[REVTUNVT1][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[REVTUNVT1][pre]         = false;
   MainVT.SSTART[REVTUNVT1][pre]           = 2V;
   MainVT.SSTOP[REVTUNVT1][pre]            = 6.5V;
   MainVT.SRESOL[REVTUNVT1][pre]           = 10mV;
   MainVT.LLIM[REVTUNVT1][pre]             = 2.4V;
   MainVT.ULIM[REVTUNVT1][pre]             = 6.0V;
   MainVT.TCRNUM[REVTUNVT1][pre]           = 6;
   MainVT.IRATIO[REVTUNVT1][pre]           = TNUM_MULT2;
   MainVT.RDOPTION[REVTUNVT1][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[REVTUNVT1][post]             = false;
#else
   MainVT.ENA[REVTUNVT1][post]             = false;
#endif
   MainVT.ENARED[REVTUNVT1][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[REVTUNVT1][post]        = false;
   MainVT.SSTART[REVTUNVT1][post]          = 2V;
   MainVT.SSTOP[REVTUNVT1][post]           = 6.5V;
   MainVT.SRESOL[REVTUNVT1][post]          = 10mV;
   MainVT.LLIM[REVTUNVT1][post]            = 2.4V;
   MainVT.ULIM[REVTUNVT1][post]            = 6.0V;
   MainVT.TCRNUM[REVTUNVT1][post]          = 6;
   MainVT.IRATIO[REVTUNVT1][post]          = TNUM_MULT2;
   MainVT.RDOPTION[REVTUNVT1][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[REVTUNVT1]               = BANKTYPE;
   MainVT.TDATA[REVTUNVT1]                = TNUM_DATA_1S;
   MainVT.LDELTA[REVTUNVT1]               = -0.5V;
   MainVT.UDELTA[REVTUNVT1]               = 0.5V;
   MainVT.PREVTYPE[REVTUNVT1]             = PUNTHRUVT1;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[PGMFFVT1][pre]              = false;
#else
   MainVT.ENA[PGMFFVT1][pre]              = false;
#endif   
   MainVT.ENARED[PGMFFVT1][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[PGMFFVT1][pre]         = false;
   MainVT.SSTART[PGMFFVT1][pre]           = 2V;
   MainVT.SSTOP[PGMFFVT1][pre]            = 6.5V;
   MainVT.SRESOL[PGMFFVT1][pre]           = 10mV;
   MainVT.LLIM[PGMFFVT1][pre]             = 2.4V;
   MainVT.ULIM[PGMFFVT1][pre]             = 5.0V;
   MainVT.TCRNUM[PGMFFVT1][pre]           = 6;
   MainVT.IRATIO[PGMFFVT1][pre]           = TNUM_MULT2;
   MainVT.RDOPTION[PGMFFVT1][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[PGMFFVT1][post]             = false;
#else
   MainVT.ENA[PGMFFVT1][post]             = false;
#endif   
   MainVT.ENARED[PGMFFVT1][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[PGMFFVT1][post]        = false;
   MainVT.SSTART[PGMFFVT1][post]          = 2V;
   MainVT.SSTOP[PGMFFVT1][post]           = 6.5V;
   MainVT.SRESOL[PGMFFVT1][post]          = 10mV;
   MainVT.LLIM[PGMFFVT1][post]            = 2.4V;
   MainVT.ULIM[PGMFFVT1][post]            = 6.0V;
   MainVT.TCRNUM[PGMFFVT1][post]          = 6;
   MainVT.IRATIO[PGMFFVT1][post]          = TNUM_MULT2;
   MainVT.RDOPTION[PGMFFVT1][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[PGMFFVT1]               = BANKTYPE;
   MainVT.TDATA[PGMFFVT1]                = TNUM_DATA_1S;
   MainVT.LDELTA[PGMFFVT1]               = -0.5V;
   MainVT.UDELTA[PGMFFVT1]               = 0.5V;
   switch(SelectedTITestType) {
     case MP3 :     MainVT.PREVTYPE[PGMFFVT1]             = PGMFFVT1;
     default: MainVT.PREVTYPE[PGMFFVT1]             = PGMFFVT1;
   }   /* case */

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[PUNTHRUVT1][pre]              = false;
#else
   MainVT.ENA[PUNTHRUVT1][pre]              = false;
#endif
   MainVT.ENARED[PUNTHRUVT1][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[PUNTHRUVT1][pre]         = true;
   MainVT.SSTART[PUNTHRUVT1][pre]           = 2V;
   MainVT.SSTOP[PUNTHRUVT1][pre]            = 6.5V;
   MainVT.SRESOL[PUNTHRUVT1][pre]           = 10mV;
   MainVT.LLIM[PUNTHRUVT1][pre]             = 2.4V;
   MainVT.ULIM[PUNTHRUVT1][pre]             = 6.0V;
   MainVT.TCRNUM[PUNTHRUVT1][pre]           = 6;
   MainVT.IRATIO[PUNTHRUVT1][pre]           = TNUM_MULT2;
   MainVT.RDOPTION[PUNTHRUVT1][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[PUNTHRUVT1][post]             = false;
#else
   MainVT.ENA[PUNTHRUVT1][post]             = false;
#endif
   MainVT.ENARED[PUNTHRUVT1][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[PUNTHRUVT1][post]        = true;
   MainVT.SSTART[PUNTHRUVT1][post]          = 2V;
   MainVT.SSTOP[PUNTHRUVT1][post]           = 6.5V;
   MainVT.SRESOL[PUNTHRUVT1][post]          = 10mV;
   MainVT.LLIM[PUNTHRUVT1][post]            = 2.4V;
   MainVT.ULIM[PUNTHRUVT1][post]            = 6.0V;
   MainVT.TCRNUM[PUNTHRUVT1][post]          = 6;
   MainVT.IRATIO[PUNTHRUVT1][post]          = TNUM_MULT2;
   MainVT.RDOPTION[PUNTHRUVT1][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[PUNTHRUVT1]               = BANKTYPE;
   MainVT.TDATA[PUNTHRUVT1]                = TNUM_DATA_1S;
   MainVT.LDELTA[PUNTHRUVT1]               = -0.5V;
   MainVT.UDELTA[PUNTHRUVT1]               = 0.5V;
   MainVT.PREVTYPE[PUNTHRUVT1]             = PUNTHRUVT1;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[FGWLVT1][pre]              = false;
#else
   MainVT.ENA[FGWLVT1][pre]              = false;
#endif   
   MainVT.ENARED[FGWLVT1][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[FGWLVT1][pre]         = false;
   MainVT.SSTART[FGWLVT1][pre]           = 2V;
   MainVT.SSTOP[FGWLVT1][pre]            = 6.5V;
   MainVT.SRESOL[FGWLVT1][pre]           = 10mV;
   MainVT.LLIM[FGWLVT1][pre]             = 2.4V;
   MainVT.ULIM[FGWLVT1][pre]             = 6.0V;
   MainVT.TCRNUM[FGWLVT1][pre]           = 6;
   MainVT.IRATIO[FGWLVT1][pre]           = TNUM_MULT2;
   MainVT.RDOPTION[FGWLVT1][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[FGWLVT1][post]             = false;
#else
   MainVT.ENA[FGWLVT1][post]             = false;
#endif   
   MainVT.ENARED[FGWLVT1][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[FGWLVT1][post]        = false;
   MainVT.SSTART[FGWLVT1][post]          = 2V;
   MainVT.SSTOP[FGWLVT1][post]           = 6.5V;
   MainVT.SRESOL[FGWLVT1][post]          = 10mV;
   MainVT.LLIM[FGWLVT1][post]            = 2.4V;
   MainVT.ULIM[FGWLVT1][post]            = 6.0V;
   MainVT.TCRNUM[FGWLVT1][post]          = 6;
   MainVT.IRATIO[FGWLVT1][post]          = TNUM_MULT2;
   MainVT.RDOPTION[FGWLVT1][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[FGWLVT1]               = BANKTYPE;
   MainVT.TDATA[FGWLVT1]                = TNUM_DATA_1S;
   MainVT.LDELTA[FGWLVT1]               = -0.5V;
   MainVT.UDELTA[FGWLVT1]               = 0.5V;
   MainVT.PREVTYPE[FGWLVT1]             = PGMFFVT1;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[TUNOXVT1][pre]              = false;
#else
   MainVT.ENA[TUNOXVT1][pre]              = false;
#endif   
   MainVT.ENARED[TUNOXVT1][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[TUNOXVT1][pre]         = false;
   MainVT.SSTART[TUNOXVT1][pre]           = 2V;
   MainVT.SSTOP[TUNOXVT1][pre]            = 6.5V;
   MainVT.SRESOL[TUNOXVT1][pre]           = 10mV;
   MainVT.LLIM[TUNOXVT1][pre]             = 2.4V;
   MainVT.ULIM[TUNOXVT1][pre]             = 6.0V;
   MainVT.TCRNUM[TUNOXVT1][pre]           = 6;
   MainVT.IRATIO[TUNOXVT1][pre]           = TNUM_MULT2;
   MainVT.RDOPTION[TUNOXVT1][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   MainVT.ENA[TUNOXVT1][post]             = false;
#else
   MainVT.ENA[TUNOXVT1][post]             = false;
#endif   
   MainVT.ENARED[TUNOXVT1][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[TUNOXVT1][post]        = false;
   MainVT.SSTART[TUNOXVT1][post]          = 2V;
   MainVT.SSTOP[TUNOXVT1][post]           = 6.5V;
   MainVT.SRESOL[TUNOXVT1][post]          = 10mV;
   MainVT.LLIM[TUNOXVT1][post]            = 2.4V;
   MainVT.ULIM[TUNOXVT1][post]            = 6.0V;
   MainVT.TCRNUM[TUNOXVT1][post]          = 6;
   MainVT.IRATIO[TUNOXVT1][post]          = TNUM_MULT2;
   MainVT.RDOPTION[TUNOXVT1][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[TUNOXVT1]               = BANKTYPE;
   MainVT.TDATA[TUNOXVT1]                = TNUM_DATA_1S;
   MainVT.LDELTA[TUNOXVT1]               = -0.5V;
   MainVT.UDELTA[TUNOXVT1]               = 0.5V;
   MainVT.PREVTYPE[TUNOXVT1]             = TUNOXVT1;

    /*---- pre ----*/
   MainVT.ENA[THINOXVT1][pre]              = false;
   MainVT.ENARED[THINOXVT1][pre]           = GL_DO_REDENA;
   MainVT.DLOGONLY[THINOXVT1][pre]         = true;
   MainVT.SSTART[THINOXVT1][pre]           = 1V;    /*was 2v*/
   MainVT.SSTOP[THINOXVT1][pre]            = 3.5V;  /*was 6.5v*/
   MainVT.SRESOL[THINOXVT1][pre]           = 10mV;
   MainVT.LLIM[THINOXVT1][pre]             = 1.5V;  /*was 2.4v*/
   MainVT.ULIM[THINOXVT1][pre]             = 3.0V;  /*was 6.0v*/
   MainVT.TCRNUM[THINOXVT1][pre]           = 6;
   MainVT.IRATIO[THINOXVT1][pre]           = TNUM_MULT2;
   MainVT.RDOPTION[THINOXVT1][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   MainVT.ENA[THINOXVT1][post]             = false;
   MainVT.ENARED[THINOXVT1][post]          = GL_DO_REDENA;
   MainVT.DLOGONLY[THINOXVT1][post]        = true;
   MainVT.SSTART[THINOXVT1][post]          = 1V;        /*was 2v*/
   MainVT.SSTOP[THINOXVT1][post]           = 3.5V;  /*was 6.5v*/
   MainVT.SRESOL[THINOXVT1][post]          = 10mV;
   MainVT.LLIM[THINOXVT1][post]            = 1.5V;  /*was 2.4v*/
   MainVT.ULIM[THINOXVT1][post]            = 3.0V;  /*was 6.0v*/
   MainVT.TCRNUM[THINOXVT1][post]          = 6;
   MainVT.IRATIO[THINOXVT1][post]          = TNUM_MULT2;
   MainVT.RDOPTION[THINOXVT1][post]        = TNUM_TOPTION_PSARD;
   MainVT.MEMCFG[THINOXVT1]               = BANKTYPE;
   MainVT.TDATA[THINOXVT1]                = TNUM_DATA_1S;
   MainVT.LDELTA[THINOXVT1]               = -0.5V;
   MainVT.UDELTA[THINOXVT1]               = 0.5V;
   MainVT.PREVTYPE[THINOXVT1]             = THINOXVT1;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case  MP1: case MP2 :  MainVT.ENA[CHKVT1][pre]             = false;
     default: MainVT.ENA[CHKVT1][pre]             = false;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case  MP1: case MP3 :  MainVT.ENA[CHKVT1][pre]             = false;
     default: MainVT.ENA[CHKVT1][pre]             = false;
   }   /* case */
#endif   
   MainVT.ENARED[CHKVT1][pre]           = false;
   MainVT.DLOGONLY[CHKVT1][pre]         = false;
   MainVT.SSTART[CHKVT1][pre]           = 1V;
   MainVT.SSTOP[CHKVT1][pre]            = 3.5V;
   MainVT.SRESOL[CHKVT1][pre]           = 10mV;
   MainVT.LLIM[CHKVT1][pre]             = 1.5V;
   MainVT.ULIM[CHKVT1][pre]             = 3.0V;
   MainVT.TCRNUM[CHKVT1][pre]           = 6;
   MainVT.IRATIO[CHKVT1][pre]           = TNUM_MULT2;
   MainVT.RDOPTION[CHKVT1][pre]         = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
   MainVT.ENA[CHKVT1][post]             = false;
   MainVT.ENARED[CHKVT1][post]          = false;
   MainVT.DLOGONLY[CHKVT1][post]        = false;
   MainVT.SSTART[CHKVT1][post]          = 2V;
   MainVT.SSTOP[CHKVT1][post]           = 6.5V;
   MainVT.SRESOL[CHKVT1][post]          = 10mV;
   MainVT.LLIM[CHKVT1][post]            = 2.4V;
   MainVT.ULIM[CHKVT1][post]            = 6.0V;
   MainVT.TCRNUM[CHKVT1][post]          = 6;
   MainVT.IRATIO[CHKVT1][post]          = TNUM_MULT2;
   MainVT.RDOPTION[CHKVT1][post]        = TNUM_TOPTION_NORMAL;
   MainVT.MEMCFG[CHKVT1]               = QUADTYPE;
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case MP1 : MainVT.TDATA[CHKVT1]       = TNUM_DATA_ECHK;
     case MP2 : MainVT.TDATA[CHKVT1]       = TNUM_DATA_OCHK;
     default: MainVT.TDATA[CHKVT1]   = TNUM_DATA_OCHK;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case MP1 : MainVT.TDATA[CHKVT1]       = TNUM_DATA_1S;
     case MP3 : MainVT.TDATA[CHKVT1]       = TNUM_DATA_OCHK;
     default: MainVT.TDATA[CHKVT1]   = TNUM_DATA_OCHK;
   }   /* case */
#endif
   MainVT.LDELTA[CHKVT1]               = -0.5V;
   MainVT.UDELTA[CHKVT1]               = 0.5V;
   MainVT.PREVTYPE[CHKVT1]             = CHKVT1;

    /*---- pre ----*/
   MainVT.ENA[CHKVT1DRL][pre]              = false;
   MainVT.ENARED[CHKVT1DRL][pre]           = false;
   MainVT.DLOGONLY[CHKVT1DRL][pre]         = false;
   MainVT.SSTART[CHKVT1DRL][pre]           = 2V;
   MainVT.SSTOP[CHKVT1DRL][pre]            = 6.5V;
   MainVT.SRESOL[CHKVT1DRL][pre]           = 10mV;
   MainVT.LLIM[CHKVT1DRL][pre]             = 2.4V;
   MainVT.ULIM[CHKVT1DRL][pre]             = 6.0V;
   MainVT.TCRNUM[CHKVT1DRL][pre]           = 6;
   MainVT.IRATIO[CHKVT1DRL][pre]           = TNUM_MULT2;
   MainVT.RDOPTION[CHKVT1DRL][pre]         = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
   MainVT.ENA[CHKVT1DRL][post]             = false;
   MainVT.ENARED[CHKVT1DRL][post]          = false;
   MainVT.DLOGONLY[CHKVT1DRL][post]        = false;
   MainVT.SSTART[CHKVT1DRL][post]          = 2V;
   MainVT.SSTOP[CHKVT1DRL][post]           = 6.5V;
   MainVT.SRESOL[CHKVT1DRL][post]          = 10mV;
   MainVT.LLIM[CHKVT1DRL][post]            = 2.4V;
   MainVT.ULIM[CHKVT1DRL][post]            = 6.0V;
   MainVT.TCRNUM[CHKVT1DRL][post]          = 6;
   MainVT.IRATIO[CHKVT1DRL][post]          = TNUM_MULT2;
   MainVT.RDOPTION[CHKVT1DRL][post]        = TNUM_TOPTION_NORMAL;
   MainVT.MEMCFG[CHKVT1DRL]               = QUADTYPE;
   switch(SelectedTITestType) {
     case MP2 : MainVT.TDATA[CHKVT1DRL]        = TNUM_DATA_ECHK;
     case MP3 : MainVT.TDATA[CHKVT1DRL]        = TNUM_DATA_OCHK;
     default: MainVT.TDATA[CHKVT1DRL]    = TNUM_DATA_ECHK;
   }   /* case */
   MainVT.LDELTA[CHKVT1DRL]               = -0.5V;
   MainVT.UDELTA[CHKVT1DRL]               = 0.5V;
   MainVT.PREVTYPE[CHKVT1DRL]             = CHKVT1DRL;

    /*---- pre ----*/
   MainVT.ENA[RCODEVT1][pre]              = false;
   MainVT.ENARED[RCODEVT1][pre]           = false;
   MainVT.DLOGONLY[RCODEVT1][pre]         = false;
   MainVT.SSTART[RCODEVT1][pre]           = 2V;
   MainVT.SSTOP[RCODEVT1][pre]            = 6.5V;
   MainVT.SRESOL[RCODEVT1][pre]           = 10mV;
   MainVT.LLIM[RCODEVT1][pre]             = 2.4V;
   MainVT.ULIM[RCODEVT1][pre]             = 6.0V;
   MainVT.TCRNUM[RCODEVT1][pre]           = 6;
   MainVT.IRATIO[RCODEVT1][pre]           = TNUM_MULT2;
   MainVT.RDOPTION[RCODEVT1][pre]         = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
   MainVT.ENA[RCODEVT1][post]             = false;
   MainVT.ENARED[RCODEVT1][post]          = false;
   MainVT.DLOGONLY[RCODEVT1][post]        = false;
   MainVT.SSTART[RCODEVT1][post]          = 2V;
   MainVT.SSTOP[RCODEVT1][post]           = 6.5V;
   MainVT.SRESOL[RCODEVT1][post]          = 10mV;
   MainVT.LLIM[RCODEVT1][post]            = 2.4V;
   MainVT.ULIM[RCODEVT1][post]            = 6.0V;
   MainVT.TCRNUM[RCODEVT1][post]          = 6;
   MainVT.IRATIO[RCODEVT1][post]          = TNUM_MULT2;
   MainVT.RDOPTION[RCODEVT1][post]        = TNUM_TOPTION_NORMAL;
   MainVT.MEMCFG[RCODEVT1]               = SECTTYPE;
   MainVT.TDATA[RCODEVT1]                = TNUM_DATA_ARB_ECC;
   MainVT.LDELTA[RCODEVT1]               = -0.5V;
   MainVT.UDELTA[RCODEVT1]               = 0.5V;
   MainVT.PREVTYPE[RCODEVT1]             = RCODEVT1;


    /*++++ OTP ++++*/
    /*---- pre ----*/
   OtpVT.ENA[ONOVT0][pre]              = (SelectedTITestType==MP1);
   OtpVT.ENARED[ONOVT0][pre]           = false;
   OtpVT.DLOGONLY[ONOVT0][pre]         = false;
   OtpVT.SSTART[ONOVT0][pre]           = 2.0V;
   OtpVT.SSTOP[ONOVT0][pre]            = 6.7V;
   OtpVT.SRESOL[ONOVT0][pre]           = 10mV;
   OtpVT.LLIM[ONOVT0][pre]             = 3.4V;
   OtpVT.ULIM[ONOVT0][pre]             = 6.5V;
   OtpVT.TCRNUM[ONOVT0][pre]           = 5;
   OtpVT.IRATIO[ONOVT0][pre]           = TNUM_DIV2;
   OtpVT.RDOPTION[ONOVT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpVT.ENA[ONOVT0][post]             = (SelectedTITestType==MP1);
   OtpVT.ENARED[ONOVT0][post]          = false;
   OtpVT.DLOGONLY[ONOVT0][post]        = false;
   OtpVT.SSTART[ONOVT0][post]          = 2.0V;
   OtpVT.SSTOP[ONOVT0][post]           = 6.7V;
   OtpVT.SRESOL[ONOVT0][post]          = 10mV;
   OtpVT.LLIM[ONOVT0][post]            = 3.4V;
   OtpVT.ULIM[ONOVT0][post]            = 6.5V;
   OtpVT.TCRNUM[ONOVT0][post]          = 5;
   OtpVT.IRATIO[ONOVT0][post]          = TNUM_DIV2;
   OtpVT.RDOPTION[ONOVT0][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[ONOVT0]               = BANKTYPE;
   OtpVT.TDATA[ONOVT0]                = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[ONOVT0]               = -0.7V;
   OtpVT.UDELTA[ONOVT0]               = 0.25V;
   OtpVT.PREVTYPE[ONOVT0]             = ONOVT0;

    /*---- pre ----*/
   OtpVT.ENA[CSFGVT0][pre]              = (SelectedTITestType==MP1);
   OtpVT.ENARED[CSFGVT0][pre]           = false;
   OtpVT.DLOGONLY[CSFGVT0][pre]         = false;
   OtpVT.SSTART[CSFGVT0][pre]           = 2.0V;
   OtpVT.SSTOP[CSFGVT0][pre]            = 6.7V;
   OtpVT.SRESOL[CSFGVT0][pre]           = 10mV;
   OtpVT.LLIM[CSFGVT0][pre]             = 3.4V;
   OtpVT.ULIM[CSFGVT0][pre]             = 6.5V;
   OtpVT.TCRNUM[CSFGVT0][pre]           = 5;
   OtpVT.IRATIO[CSFGVT0][pre]           = TNUM_DIV2;
   OtpVT.RDOPTION[CSFGVT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpVT.ENA[CSFGVT0][post]             = (SelectedTITestType==MP1);
   OtpVT.ENARED[CSFGVT0][post]          = false;
   OtpVT.DLOGONLY[CSFGVT0][post]        = false;
   OtpVT.SSTART[CSFGVT0][post]          = 2.0V;
   OtpVT.SSTOP[CSFGVT0][post]           = 6.7V;
   OtpVT.SRESOL[CSFGVT0][post]          = 10mV;
   OtpVT.LLIM[CSFGVT0][post]            = 2.9V;  /*C06 CHANGED from 1.2v to match spec Jamal Sheikh modified Fri, Feb  3 2012*/
   OtpVT.ULIM[CSFGVT0][post]            = 6.5V;
   OtpVT.TCRNUM[CSFGVT0][post]          = 5;
   OtpVT.IRATIO[CSFGVT0][post]          = TNUM_DIV2;
   OtpVT.RDOPTION[CSFGVT0][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[CSFGVT0]               = BANKTYPE;
   OtpVT.TDATA[CSFGVT0]                = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[CSFGVT0]               = -0.5V;
   OtpVT.UDELTA[CSFGVT0]               = 0.25V;
   OtpVT.PREVTYPE[CSFGVT0]             = CSFGVT0;

    /*---- pre ----*/
   OtpVT.ENA[EGFG1VT0][pre]              = false;
   OtpVT.ENARED[EGFG1VT0][pre]           = false;
   OtpVT.DLOGONLY[EGFG1VT0][pre]         = true;
   OtpVT.SSTART[EGFG1VT0][pre]           = 2.0V;
   OtpVT.SSTOP[EGFG1VT0][pre]            = 6.7V;
   OtpVT.SRESOL[EGFG1VT0][pre]           = 10mV;
   OtpVT.LLIM[EGFG1VT0][pre]             = 3V;
   OtpVT.ULIM[EGFG1VT0][pre]             = 6.5V;
   OtpVT.TCRNUM[EGFG1VT0][pre]           = 5;
   OtpVT.IRATIO[EGFG1VT0][pre]           = TNUM_DIV2;
   OtpVT.RDOPTION[EGFG1VT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpVT.ENA[EGFG1VT0][post]             = false;
   OtpVT.ENARED[EGFG1VT0][post]          = false;
   OtpVT.DLOGONLY[EGFG1VT0][post]        = true;
   OtpVT.SSTART[EGFG1VT0][post]          = 2.0V;
   OtpVT.SSTOP[EGFG1VT0][post]           = 6.7V;
   OtpVT.SRESOL[EGFG1VT0][post]          = 10mV;
   OtpVT.LLIM[EGFG1VT0][post]            = 3V;
   OtpVT.ULIM[EGFG1VT0][post]            = 6.5V;
   OtpVT.TCRNUM[EGFG1VT0][post]          = 5;
   OtpVT.IRATIO[EGFG1VT0][post]          = TNUM_DIV2;
   OtpVT.RDOPTION[EGFG1VT0][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[EGFG1VT0]               = BANKTYPE;
   OtpVT.TDATA[EGFG1VT0]                = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[EGFG1VT0]               = -0.5V;
   OtpVT.UDELTA[EGFG1VT0]               = 2V;
   OtpVT.PREVTYPE[EGFG1VT0]             = EGFG1VT0;

    /*---- pre ----*/
   OtpVT.ENA[EGFG2VT0][pre]              = false;
   OtpVT.ENARED[EGFG2VT0][pre]           = false;
   OtpVT.DLOGONLY[EGFG2VT0][pre]         = true;
   OtpVT.SSTART[EGFG2VT0][pre]           = 2.0V;
   OtpVT.SSTOP[EGFG2VT0][pre]            = 6.7V;
   OtpVT.SRESOL[EGFG2VT0][pre]           = 10mV;
   OtpVT.LLIM[EGFG2VT0][pre]             = 3V;
   OtpVT.ULIM[EGFG2VT0][pre]             = 6.5V;
   OtpVT.TCRNUM[EGFG2VT0][pre]           = 5;
   OtpVT.IRATIO[EGFG2VT0][pre]           = TNUM_DIV2;
   OtpVT.RDOPTION[EGFG2VT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpVT.ENA[EGFG2VT0][post]             = false;
   OtpVT.ENARED[EGFG2VT0][post]          = false;
   OtpVT.DLOGONLY[EGFG2VT0][post]        = true;
   OtpVT.SSTART[EGFG2VT0][post]          = 2.0V;
   OtpVT.SSTOP[EGFG2VT0][post]           = 6.7V;
   OtpVT.SRESOL[EGFG2VT0][post]          = 10mV;
   OtpVT.LLIM[EGFG2VT0][post]            = 3V;
   OtpVT.ULIM[EGFG2VT0][post]            = 6.5V;
   OtpVT.TCRNUM[EGFG2VT0][post]          = 5;
   OtpVT.IRATIO[EGFG2VT0][post]          = TNUM_DIV2;
   OtpVT.RDOPTION[EGFG2VT0][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[EGFG2VT0]               = BANKTYPE;
   OtpVT.TDATA[EGFG2VT0]                = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[EGFG2VT0]               = -0.5V;
   OtpVT.UDELTA[EGFG2VT0]               = 2V;
   OtpVT.PREVTYPE[EGFG2VT0]             = EGFG2VT0;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[EGFG3VT0][pre]              = (SelectedTITestType==MP1);
#else
   OtpVT.ENA[EGFG3VT0][pre]              = false;
#endif   
   OtpVT.ENARED[EGFG3VT0][pre]           = false;
   OtpVT.DLOGONLY[EGFG3VT0][pre]         = false;
   OtpVT.SSTART[EGFG3VT0][pre]           = 2.0V;
   OtpVT.SSTOP[EGFG3VT0][pre]            = 6.7V;
   OtpVT.SRESOL[EGFG3VT0][pre]           = 10mV;
   OtpVT.LLIM[EGFG3VT0][pre]             = 3.4V;
   OtpVT.ULIM[EGFG3VT0][pre]             = 6.5V;
   OtpVT.TCRNUM[EGFG3VT0][pre]           = 5;
   OtpVT.IRATIO[EGFG3VT0][pre]           = TNUM_DIV2;
   OtpVT.RDOPTION[EGFG3VT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[EGFG3VT0][post]             = (SelectedTITestType==MP1);
#else
   OtpVT.ENA[EGFG3VT0][post]             = false;
#endif   
   OtpVT.ENARED[EGFG3VT0][post]          = false;
   OtpVT.DLOGONLY[EGFG3VT0][post]        = false;
   OtpVT.SSTART[EGFG3VT0][post]          = 2.0V;
   OtpVT.SSTOP[EGFG3VT0][post]           = 6.7V;
   OtpVT.SRESOL[EGFG3VT0][post]          = 10mV;
   OtpVT.LLIM[EGFG3VT0][post]            = 1.2V;
   OtpVT.ULIM[EGFG3VT0][post]            = 6.5V;
   OtpVT.TCRNUM[EGFG3VT0][post]          = 5;
   OtpVT.IRATIO[EGFG3VT0][post]          = TNUM_DIV2;
   OtpVT.RDOPTION[EGFG3VT0][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[EGFG3VT0]               = BANKTYPE;
   OtpVT.TDATA[EGFG3VT0]                = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[EGFG3VT0]               = -2.2V;
   OtpVT.UDELTA[EGFG3VT0]               = 0.25V;
   OtpVT.PREVTYPE[EGFG3VT0]             = EGFG3VT0;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[EGFG4VT0][pre]              = (SelectedTITestType==MP1);
#else
   OtpVT.ENA[EGFG4VT0][pre]              = false;
#endif   
   OtpVT.ENARED[EGFG4VT0][pre]           = false;
   OtpVT.DLOGONLY[EGFG4VT0][pre]         = true;
   OtpVT.SSTART[EGFG4VT0][pre]           = 2.0V;
   OtpVT.SSTOP[EGFG4VT0][pre]            = 6.7V;
   OtpVT.SRESOL[EGFG4VT0][pre]           = 10mV;
   OtpVT.LLIM[EGFG4VT0][pre]             = 3.4V;
   OtpVT.ULIM[EGFG4VT0][pre]             = 6.5V;
   OtpVT.TCRNUM[EGFG4VT0][pre]           = 5;
   OtpVT.IRATIO[EGFG4VT0][pre]           = TNUM_DIV2;
   OtpVT.RDOPTION[EGFG4VT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[EGFG4VT0][post]             = (SelectedTITestType==MP1);
#else
   OtpVT.ENA[EGFG4VT0][post]             = false;
#endif   
   OtpVT.ENARED[EGFG4VT0][post]          = false;
   OtpVT.DLOGONLY[EGFG4VT0][post]        = true;
   OtpVT.SSTART[EGFG4VT0][post]          = 2.0V;
   OtpVT.SSTOP[EGFG4VT0][post]           = 6.7V;
   OtpVT.SRESOL[EGFG4VT0][post]          = 10mV;
   OtpVT.LLIM[EGFG4VT0][post]            = 2.3V;
   OtpVT.ULIM[EGFG4VT0][post]            = 6.5V;
   OtpVT.TCRNUM[EGFG4VT0][post]          = 5;
   OtpVT.IRATIO[EGFG4VT0][post]          = TNUM_DIV2;
   OtpVT.RDOPTION[EGFG4VT0][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[EGFG4VT0]               = BANKTYPE;
   OtpVT.TDATA[EGFG4VT0]                = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[EGFG4VT0]               = -1.1V;
   OtpVT.UDELTA[EGFG4VT0]               = 0.25V;
   OtpVT.PREVTYPE[EGFG4VT0]             = EGFG4VT0;

    /*---- pre ----*/
   OtpVT.ENA[EGFG5VT0][pre]              = false;
   OtpVT.ENARED[EGFG5VT0][pre]           = false;
   OtpVT.DLOGONLY[EGFG5VT0][pre]         = true;
   OtpVT.SSTART[EGFG5VT0][pre]           = 2.0V;
   OtpVT.SSTOP[EGFG5VT0][pre]            = 6.7V;
   OtpVT.SRESOL[EGFG5VT0][pre]           = 10mV;
   OtpVT.LLIM[EGFG5VT0][pre]             = 3V;
   OtpVT.ULIM[EGFG5VT0][pre]             = 6.5V;
   OtpVT.TCRNUM[EGFG5VT0][pre]           = 5;
   OtpVT.IRATIO[EGFG5VT0][pre]           = TNUM_DIV2;
   OtpVT.RDOPTION[EGFG5VT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpVT.ENA[EGFG5VT0][post]             = false;
   OtpVT.ENARED[EGFG5VT0][post]          = false;
   OtpVT.DLOGONLY[EGFG5VT0][post]        = true;
   OtpVT.SSTART[EGFG5VT0][post]          = 2.0V;
   OtpVT.SSTOP[EGFG5VT0][post]           = 6.7V;
   OtpVT.SRESOL[EGFG5VT0][post]          = 10mV;
   OtpVT.LLIM[EGFG5VT0][post]            = 3V;
   OtpVT.ULIM[EGFG5VT0][post]            = 6.5V;
   OtpVT.TCRNUM[EGFG5VT0][post]          = 5;
   OtpVT.IRATIO[EGFG5VT0][post]          = TNUM_DIV2;
   OtpVT.RDOPTION[EGFG5VT0][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[EGFG5VT0]               = BANKTYPE;
   OtpVT.TDATA[EGFG5VT0]                = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[EGFG5VT0]               = -0.5V;
   OtpVT.UDELTA[EGFG5VT0]               = 0.5V;
   OtpVT.PREVTYPE[EGFG5VT0]             = EGFG5VT0;

    /*---- pre ----*/
   OtpVT.ENA[RDDISTBVT0][pre]              = false;
   OtpVT.ENARED[RDDISTBVT0][pre]           = false;
   OtpVT.DLOGONLY[RDDISTBVT0][pre]         = true;
   OtpVT.SSTART[RDDISTBVT0][pre]           = 2.0V;
   OtpVT.SSTOP[RDDISTBVT0][pre]            = 6.7V;
   OtpVT.SRESOL[RDDISTBVT0][pre]           = 10mV;
   OtpVT.LLIM[RDDISTBVT0][pre]             = 3V;
   OtpVT.ULIM[RDDISTBVT0][pre]             = 6.5V;
   OtpVT.TCRNUM[RDDISTBVT0][pre]           = 5;
   OtpVT.IRATIO[RDDISTBVT0][pre]           = TNUM_DIV2;
   OtpVT.RDOPTION[RDDISTBVT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpVT.ENA[RDDISTBVT0][post]             = false;
   OtpVT.ENARED[RDDISTBVT0][post]          = false;
   OtpVT.DLOGONLY[RDDISTBVT0][post]        = true;
   OtpVT.SSTART[RDDISTBVT0][post]          = 2.0V;
   OtpVT.SSTOP[RDDISTBVT0][post]           = 6.7V;
   OtpVT.SRESOL[RDDISTBVT0][post]          = 10mV;
   OtpVT.LLIM[RDDISTBVT0][post]            = 3V;
   OtpVT.ULIM[RDDISTBVT0][post]            = 6.5V;
   OtpVT.TCRNUM[RDDISTBVT0][post]          = 5;
   OtpVT.IRATIO[RDDISTBVT0][post]          = TNUM_DIV2;
   OtpVT.RDOPTION[RDDISTBVT0][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[RDDISTBVT0]               = BANKTYPE;
   OtpVT.TDATA[RDDISTBVT0]                = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[RDDISTBVT0]               = -0.5V;
   OtpVT.UDELTA[RDDISTBVT0]               = 0.5V;
   OtpVT.PREVTYPE[RDDISTBVT0]             = EGFG3VT0;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[RDDISTB2VT0][pre]              = (SelectedTITestType==MP1);
#else
   OtpVT.ENA[RDDISTB2VT0][pre]              = (SelectedTITestType==MP1);
#endif   
   OtpVT.ENARED[RDDISTB2VT0][pre]           = false;
   OtpVT.DLOGONLY[RDDISTB2VT0][pre]         = false;
   OtpVT.SSTART[RDDISTB2VT0][pre]           = 2.0V;
   OtpVT.SSTOP[RDDISTB2VT0][pre]            = 6.7V;
   OtpVT.SRESOL[RDDISTB2VT0][pre]           = 10mV;
   OtpVT.LLIM[RDDISTB2VT0][pre]             = 3.4V;
   OtpVT.ULIM[RDDISTB2VT0][pre]             = 6.5V;
   OtpVT.TCRNUM[RDDISTB2VT0][pre]           = 5;
   OtpVT.IRATIO[RDDISTB2VT0][pre]           = TNUM_DIV2;
   OtpVT.RDOPTION[RDDISTB2VT0][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[RDDISTB2VT0][post]             = (SelectedTITestType==MP1);
#else
   OtpVT.ENA[RDDISTB2VT0][post]             = (SelectedTITestType==MP1);
#endif   
   OtpVT.ENARED[RDDISTB2VT0][post]          = false;
   OtpVT.DLOGONLY[RDDISTB2VT0][post]        = false;
   OtpVT.SSTART[RDDISTB2VT0][post]          = 2.0V;
   OtpVT.SSTOP[RDDISTB2VT0][post]           = 6.7V;
   OtpVT.SRESOL[RDDISTB2VT0][post]          = 10mV;
   OtpVT.LLIM[RDDISTB2VT0][post]            = 2.7V;
   OtpVT.ULIM[RDDISTB2VT0][post]            = 6.5V;
   OtpVT.TCRNUM[RDDISTB2VT0][post]          = 5;
   OtpVT.IRATIO[RDDISTB2VT0][post]          = TNUM_DIV2;
   OtpVT.RDOPTION[RDDISTB2VT0][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[RDDISTB2VT0]               = BANKTYPE;
   OtpVT.TDATA[RDDISTB2VT0]                = TNUM_DATA_0S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[RDDISTB2VT0]               = -0.4V;
   OtpVT.UDELTA[RDDISTB2VT0]               = 0.25V;  /* C06 CHANGED to match spec was 0.25v Jamal Sheikh modified Fri, Feb  3 2012*/
   OtpVT.PREVTYPE[RDDISTB2VT0]             = RDDISTB2VT0;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case  MP1: case MP2 :  OtpVT.ENA[CHKVT0][pre]              = true;
     default: OtpVT.ENA[CHKVT0][pre]              = false;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case MP3 :     OtpVT.ENA[CHKVT0][pre]              = false;
     default: OtpVT.ENA[CHKVT0][pre]              = false;
   }   /* case */
#endif
   OtpVT.ENARED[CHKVT0][pre]           = false;
   OtpVT.DLOGONLY[CHKVT0][pre]         = false;
   OtpVT.SSTART[CHKVT0][pre]           = 2.0V;
   OtpVT.SSTOP[CHKVT0][pre]            = 6.7V;
   OtpVT.SRESOL[CHKVT0][pre]           = 10mV;
   OtpVT.LLIM[CHKVT0][pre]             = 3.4V;
   OtpVT.ULIM[CHKVT0][pre]             = 6.5V;
   OtpVT.TCRNUM[CHKVT0][pre]           = 5;
   OtpVT.IRATIO[CHKVT0][pre]           = TNUM_DIV2;
   OtpVT.RDOPTION[CHKVT0][pre]         = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
   OtpVT.ENA[CHKVT0][post]             = false;
   OtpVT.ENARED[CHKVT0][post]          = false;
   OtpVT.DLOGONLY[CHKVT0][post]        = false;
   OtpVT.SSTART[CHKVT0][post]          = 2.0V;
   OtpVT.SSTOP[CHKVT0][post]           = 6.7V;
   OtpVT.SRESOL[CHKVT0][post]          = 10mV;
   OtpVT.LLIM[CHKVT0][post]            = 2.7V;
   OtpVT.ULIM[CHKVT0][post]            = 6.5V;
   OtpVT.TCRNUM[CHKVT0][post]          = 5;
   OtpVT.IRATIO[CHKVT0][post]          = TNUM_DIV2;
   OtpVT.RDOPTION[CHKVT0][post]        = TNUM_TOPTION_NORMAL;
   OtpVT.MEMCFG[CHKVT0]               = BANKTYPE;
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case MP1 : OtpVT.TDATA[CHKVT0]        = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
     case MP2 : OtpVT.TDATA[CHKVT0]        = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
     default: OtpVT.TDATA[CHKVT0]    = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case MP3 : OtpVT.TDATA[CHKVT0]        = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
     default: OtpVT.TDATA[CHKVT0]    = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
   }   /* case */
#endif   
   OtpVT.LDELTA[CHKVT0]               = -0.25V;
   OtpVT.UDELTA[CHKVT0]               = 0.6V;
   OtpVT.PREVTYPE[CHKVT0]             = CHKVT0;

    /*---- pre ----*/
   OtpVT.ENA[CHKVT0DRL][pre]              = true;
   OtpVT.ENARED[CHKVT0DRL][pre]           = false;
   OtpVT.DLOGONLY[CHKVT0DRL][pre]         = false;
   OtpVT.SSTART[CHKVT0DRL][pre]           = 2.0V;
   OtpVT.SSTOP[CHKVT0DRL][pre]            = 6.7V;
   OtpVT.SRESOL[CHKVT0DRL][pre]           = 10mV;
   OtpVT.LLIM[CHKVT0DRL][pre]             = 3.4V;
   OtpVT.ULIM[CHKVT0DRL][pre]             = 6.5V;
   OtpVT.TCRNUM[CHKVT0DRL][pre]           = 5;
   OtpVT.IRATIO[CHKVT0DRL][pre]           = TNUM_DIV2;
   OtpVT.RDOPTION[CHKVT0DRL][pre]         = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[CHKVT0DRL][post]             = true;
#else
   OtpVT.ENA[CHKVT0DRL][post]             = false;
#endif
   OtpVT.ENARED[CHKVT0DRL][post]          = false;
   OtpVT.DLOGONLY[CHKVT0DRL][post]        = false;
   OtpVT.SSTART[CHKVT0DRL][post]          = 2.0V;
   OtpVT.SSTOP[CHKVT0DRL][post]           = 6.7V;
   OtpVT.SRESOL[CHKVT0DRL][post]          = 10mV;
   OtpVT.LLIM[CHKVT0DRL][post]            = 2.4V;
   OtpVT.ULIM[CHKVT0DRL][post]            = 6.5V;
   OtpVT.TCRNUM[CHKVT0DRL][post]          = 5;
   OtpVT.IRATIO[CHKVT0DRL][post]          = TNUM_DIV2;
   OtpVT.RDOPTION[CHKVT0DRL][post]        = TNUM_TOPTION_NORMAL;
   OtpVT.MEMCFG[CHKVT0DRL]               = SECTTYPE;
   switch(SelectedTITestType) {
     case MP2 : OtpVT.TDATA[CHKVT0DRL]        = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
     case MP3 : OtpVT.TDATA[CHKVT0DRL]        = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
     default: OtpVT.TDATA[CHKVT0DRL]    = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
   }   /* case */
   switch(SelectedTITestType) {
     case MP2 :  
              OtpVT.LDELTA[CHKVT0DRL]               = -0.25V;
              OtpVT.UDELTA[CHKVT0DRL]               = 1.0V;
            break; 
     default:  
              OtpVT.LDELTA[CHKVT0DRL]               = -0.25V;  /*not used this but use DRLVT0_L/UDELTA[bank]*/
              OtpVT.UDELTA[CHKVT0DRL]               = 1.0V;  /*not used this but use DRLVT0_L/UDELTA[bank]*/
      break; 
   }   /* case */
   OtpVT.PREVTYPE[CHKVT0DRL]             = CHKVT0DRL;

    /*---- pre ----*/
   OtpVT.ENA[RCODEVT0][pre]              = true;
   OtpVT.ENARED[RCODEVT0][pre]           = false;
   OtpVT.DLOGONLY[RCODEVT0][pre]         = false;
   OtpVT.SSTART[RCODEVT0][pre]           = 2.0V;
   OtpVT.SSTOP[RCODEVT0][pre]            = 6.7V;
   OtpVT.SRESOL[RCODEVT0][pre]           = 10mV;
   OtpVT.LLIM[RCODEVT0][pre]             = 3.4V;
   OtpVT.ULIM[RCODEVT0][pre]             = 6.5V;
   OtpVT.TCRNUM[RCODEVT0][pre]           = 5;
   OtpVT.IRATIO[RCODEVT0][pre]           = TNUM_DIV2;
   OtpVT.RDOPTION[RCODEVT0][pre]         = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
   OtpVT.ENA[RCODEVT0][post]             = true;
   OtpVT.ENARED[RCODEVT0][post]          = false;
   OtpVT.DLOGONLY[RCODEVT0][post]        = false;
   OtpVT.SSTART[RCODEVT0][post]          = 2.0V;
   OtpVT.SSTOP[RCODEVT0][post]           = 6.7V;
   OtpVT.SRESOL[RCODEVT0][post]          = 10mV;
   OtpVT.LLIM[RCODEVT0][post]            = 2.4V;
   OtpVT.ULIM[RCODEVT0][post]            = 6.5V;
   OtpVT.TCRNUM[RCODEVT0][post]          = 5;
   OtpVT.IRATIO[RCODEVT0][post]          = TNUM_DIV2;
   OtpVT.RDOPTION[RCODEVT0][post]        = TNUM_TOPTION_NORMAL;
   OtpVT.MEMCFG[RCODEVT0]               = BANKTYPE;
   switch(SelectedTITestType) {
     case MP1 : OtpVT.TDATA[RCODEVT0]        = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
     case MP2 : OtpVT.TDATA[RCODEVT0]        = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
     default: OtpVT.TDATA[RCODEVT0]    = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
   }   /* case */
   switch(SelectedTITestType) {
     case MP2 :  
              OtpVT.LDELTA[RCODEVT0]               = -0.3V;
              OtpVT.UDELTA[RCODEVT0]               = 0.3V;
            break; 
     default:  
              OtpVT.LDELTA[RCODEVT0]               = -0.35V;
              OtpVT.UDELTA[RCODEVT0]               = 0.35V;
      break; 
   }   /* case */
   OtpVT.PREVTYPE[RCODEVT0]             = RCODEVT0;



    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[REVTUNVT1][pre]              = false;
#else
   OtpVT.ENA[REVTUNVT1][pre]              = false;
#endif
   OtpVT.ENARED[REVTUNVT1][pre]           = false;
   OtpVT.DLOGONLY[REVTUNVT1][pre]         = false;
   OtpVT.SSTART[REVTUNVT1][pre]           = 2V;
   OtpVT.SSTOP[REVTUNVT1][pre]            = 6.5V;
   OtpVT.SRESOL[REVTUNVT1][pre]           = 10mV;
   OtpVT.LLIM[REVTUNVT1][pre]             = 2.4V;
   OtpVT.ULIM[REVTUNVT1][pre]             = 5.5V;
   OtpVT.TCRNUM[REVTUNVT1][pre]           = 6;
   OtpVT.IRATIO[REVTUNVT1][pre]           = TNUM_MULT2;
   OtpVT.RDOPTION[REVTUNVT1][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[REVTUNVT1][post]             = false;
#else
   OtpVT.ENA[REVTUNVT1][post]             = false;
#endif   
   OtpVT.ENARED[REVTUNVT1][post]          = false;
   OtpVT.DLOGONLY[REVTUNVT1][post]        = false;
   OtpVT.SSTART[REVTUNVT1][post]          = 2V;
   OtpVT.SSTOP[REVTUNVT1][post]           = 6.5V;
   OtpVT.SRESOL[REVTUNVT1][post]          = 10mV;
   OtpVT.LLIM[REVTUNVT1][post]            = 2.4V;
   OtpVT.ULIM[REVTUNVT1][post]            = 5.5V;
   OtpVT.TCRNUM[REVTUNVT1][post]          = 6;
   OtpVT.IRATIO[REVTUNVT1][post]          = TNUM_MULT2;
   OtpVT.RDOPTION[REVTUNVT1][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[REVTUNVT1]               = BANKTYPE;
   OtpVT.TDATA[REVTUNVT1]                = TNUM_DATA_1S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[REVTUNVT1]               = -0.5V;
   OtpVT.UDELTA[REVTUNVT1]               = 0.5V;
   OtpVT.PREVTYPE[REVTUNVT1]             = PUNTHRUVT1;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[PGMFFVT1][pre]              = false;
#else
   OtpVT.ENA[PGMFFVT1][pre]              = false;
#endif   
   OtpVT.ENARED[PGMFFVT1][pre]           = false;
   OtpVT.DLOGONLY[PGMFFVT1][pre]         = false;
   OtpVT.SSTART[PGMFFVT1][pre]           = 2V;
   OtpVT.SSTOP[PGMFFVT1][pre]            = 6.5V;
   OtpVT.SRESOL[PGMFFVT1][pre]           = 10mV;
   OtpVT.LLIM[PGMFFVT1][pre]             = 2.4V;
   OtpVT.ULIM[PGMFFVT1][pre]             = 5.5V;
   OtpVT.TCRNUM[PGMFFVT1][pre]           = 6;
   OtpVT.IRATIO[PGMFFVT1][pre]           = TNUM_MULT2;
   OtpVT.RDOPTION[PGMFFVT1][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[PGMFFVT1][post]             = false;
#else
   OtpVT.ENA[PGMFFVT1][post]             = false;
#endif   
   OtpVT.ENARED[PGMFFVT1][post]          = false;
   OtpVT.DLOGONLY[PGMFFVT1][post]        = false;
   OtpVT.SSTART[PGMFFVT1][post]          = 2V;
   OtpVT.SSTOP[PGMFFVT1][post]           = 6.5V;
   OtpVT.SRESOL[PGMFFVT1][post]          = 10mV;
   OtpVT.LLIM[PGMFFVT1][post]            = 2.4V;
   OtpVT.ULIM[PGMFFVT1][post]            = 5.5V;
   OtpVT.TCRNUM[PGMFFVT1][post]          = 6;
   OtpVT.IRATIO[PGMFFVT1][post]          = TNUM_MULT2;
   OtpVT.RDOPTION[PGMFFVT1][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[PGMFFVT1]               = BANKTYPE;
   OtpVT.TDATA[PGMFFVT1]                = TNUM_DATA_1S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[PGMFFVT1]               = -0.5V;
   OtpVT.UDELTA[PGMFFVT1]               = 0.5V;
   switch(SelectedTITestType) {
     case MP3 :     OtpVT.PREVTYPE[PGMFFVT1]             = PGMFFVT1;
     default: OtpVT.PREVTYPE[PGMFFVT1]             = PGMFFVT1;
   }   /* case */

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[PUNTHRUVT1][pre]              = false;
#else
   OtpVT.ENA[PUNTHRUVT1][pre]              = false;
#endif
   OtpVT.ENARED[PUNTHRUVT1][pre]           = false;
   OtpVT.DLOGONLY[PUNTHRUVT1][pre]         = true;
   OtpVT.SSTART[PUNTHRUVT1][pre]           = 2V;
   OtpVT.SSTOP[PUNTHRUVT1][pre]            = 6.5V;
   OtpVT.SRESOL[PUNTHRUVT1][pre]           = 10mV;
   OtpVT.LLIM[PUNTHRUVT1][pre]             = 2.4V;
   OtpVT.ULIM[PUNTHRUVT1][pre]             = 5.5V;
   OtpVT.TCRNUM[PUNTHRUVT1][pre]           = 6;
   OtpVT.IRATIO[PUNTHRUVT1][pre]           = TNUM_MULT2;
   OtpVT.RDOPTION[PUNTHRUVT1][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpVT.ENA[PUNTHRUVT1][post]             = false;
   OtpVT.ENARED[PUNTHRUVT1][post]          = false;
   OtpVT.DLOGONLY[PUNTHRUVT1][post]        = true;
   OtpVT.SSTART[PUNTHRUVT1][post]          = 2V;
   OtpVT.SSTOP[PUNTHRUVT1][post]           = 6.5V;
   OtpVT.SRESOL[PUNTHRUVT1][post]          = 10mV;
   OtpVT.LLIM[PUNTHRUVT1][post]            = 2.4V;
   OtpVT.ULIM[PUNTHRUVT1][post]            = 5.5V;
   OtpVT.TCRNUM[PUNTHRUVT1][post]          = 6;
   OtpVT.IRATIO[PUNTHRUVT1][post]          = TNUM_MULT2;
   OtpVT.RDOPTION[PUNTHRUVT1][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[PUNTHRUVT1]               = BANKTYPE;
   OtpVT.TDATA[PUNTHRUVT1]                = TNUM_DATA_1S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[PUNTHRUVT1]               = -0.5V;
   OtpVT.UDELTA[PUNTHRUVT1]               = 0.5V;
   OtpVT.PREVTYPE[PUNTHRUVT1]             = PUNTHRUVT1;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[FGWLVT1][pre]              = false;
#else
   OtpVT.ENA[FGWLVT1][pre]              = false;
#endif   
   OtpVT.ENARED[FGWLVT1][pre]           = false;
   OtpVT.DLOGONLY[FGWLVT1][pre]         = false;
   OtpVT.SSTART[FGWLVT1][pre]           = 2V;
   OtpVT.SSTOP[FGWLVT1][pre]            = 6.5V;
   OtpVT.SRESOL[FGWLVT1][pre]           = 10mV;
   OtpVT.LLIM[FGWLVT1][pre]             = 2.4V;
   OtpVT.ULIM[FGWLVT1][pre]             = 5.5V;
   OtpVT.TCRNUM[FGWLVT1][pre]           = 6;
   OtpVT.IRATIO[FGWLVT1][pre]           = TNUM_MULT2;
   OtpVT.RDOPTION[FGWLVT1][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[FGWLVT1][post]             = false;
#else
   OtpVT.ENA[FGWLVT1][post]             = false;
#endif   
   OtpVT.ENARED[FGWLVT1][post]          = false;
   OtpVT.DLOGONLY[FGWLVT1][post]        = false;
   OtpVT.SSTART[FGWLVT1][post]          = 2V;
   OtpVT.SSTOP[FGWLVT1][post]           = 6.5V;
   OtpVT.SRESOL[FGWLVT1][post]          = 10mV;
   OtpVT.LLIM[FGWLVT1][post]            = 2.4V;
   OtpVT.ULIM[FGWLVT1][post]            = 5.5V;
   OtpVT.TCRNUM[FGWLVT1][post]          = 6;
   OtpVT.IRATIO[FGWLVT1][post]          = TNUM_MULT2;
   OtpVT.RDOPTION[FGWLVT1][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[FGWLVT1]               = BANKTYPE;
   OtpVT.TDATA[FGWLVT1]                = TNUM_DATA_1S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[FGWLVT1]               = -0.5V;
   OtpVT.UDELTA[FGWLVT1]               = 0.5V;
   OtpVT.PREVTYPE[FGWLVT1]             = PGMFFVT1;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[TUNOXVT1][pre]              = false;
#else
   OtpVT.ENA[TUNOXVT1][pre]              = false;
#endif   
   OtpVT.ENARED[TUNOXVT1][pre]           = false;
   OtpVT.DLOGONLY[TUNOXVT1][pre]         = false;
   OtpVT.SSTART[TUNOXVT1][pre]           = 2V;
   OtpVT.SSTOP[TUNOXVT1][pre]            = 6.5V;
   OtpVT.SRESOL[TUNOXVT1][pre]           = 10mV;
   OtpVT.LLIM[TUNOXVT1][pre]             = 2.4V;
   OtpVT.ULIM[TUNOXVT1][pre]             = 5.5V;
   OtpVT.TCRNUM[TUNOXVT1][pre]           = 6;
   OtpVT.IRATIO[TUNOXVT1][pre]           = TNUM_MULT2;
   OtpVT.RDOPTION[TUNOXVT1][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
#if $FL_USE_AUTO_FLOW  
   OtpVT.ENA[TUNOXVT1][post]             = false;
#else
   OtpVT.ENA[TUNOXVT1][post]             = false;
#endif   
   OtpVT.ENARED[TUNOXVT1][post]          = false;
   OtpVT.DLOGONLY[TUNOXVT1][post]        = false;
   OtpVT.SSTART[TUNOXVT1][post]          = 2V;
   OtpVT.SSTOP[TUNOXVT1][post]           = 6.5V;
   OtpVT.SRESOL[TUNOXVT1][post]          = 10mV;
   OtpVT.LLIM[TUNOXVT1][post]            = 2.4V;
   OtpVT.ULIM[TUNOXVT1][post]            = 5.5V;
   OtpVT.TCRNUM[TUNOXVT1][post]          = 6;
   OtpVT.IRATIO[TUNOXVT1][post]          = TNUM_MULT2;
   OtpVT.RDOPTION[TUNOXVT1][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[TUNOXVT1]               = BANKTYPE;
   OtpVT.TDATA[TUNOXVT1]                = TNUM_DATA_1S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[TUNOXVT1]               = -0.5V;
   OtpVT.UDELTA[TUNOXVT1]               = 0.5V;
   OtpVT.PREVTYPE[TUNOXVT1]             = TUNOXVT1;

    /*---- pre ----*/
   OtpVT.ENA[THINOXVT1][pre]              = false;
   OtpVT.ENARED[THINOXVT1][pre]           = false;
   OtpVT.DLOGONLY[THINOXVT1][pre]         = true;
   OtpVT.SSTART[THINOXVT1][pre]           = 2V;
   OtpVT.SSTOP[THINOXVT1][pre]            = 6.5V;
   OtpVT.SRESOL[THINOXVT1][pre]           = 10mV;
   OtpVT.LLIM[THINOXVT1][pre]             = 2.4V;
   OtpVT.ULIM[THINOXVT1][pre]             = 5.5V;
   OtpVT.TCRNUM[THINOXVT1][pre]           = 6;
   OtpVT.IRATIO[THINOXVT1][pre]           = TNUM_MULT2;
   OtpVT.RDOPTION[THINOXVT1][pre]         = TNUM_TOPTION_PSARD;
    /*---- pst ----*/
   OtpVT.ENA[THINOXVT1][post]             = false;
   OtpVT.ENARED[THINOXVT1][post]          = false;
   OtpVT.DLOGONLY[THINOXVT1][post]        = true;
   OtpVT.SSTART[THINOXVT1][post]          = 2V;
   OtpVT.SSTOP[THINOXVT1][post]           = 6.5V;
   OtpVT.SRESOL[THINOXVT1][post]          = 10mV;
   OtpVT.LLIM[THINOXVT1][post]            = 2.4V;
   OtpVT.ULIM[THINOXVT1][post]            = 5.5V;
   OtpVT.TCRNUM[THINOXVT1][post]          = 6;
   OtpVT.IRATIO[THINOXVT1][post]          = TNUM_MULT2;
   OtpVT.RDOPTION[THINOXVT1][post]        = TNUM_TOPTION_PSARD;
   OtpVT.MEMCFG[THINOXVT1]               = BANKTYPE;
   OtpVT.TDATA[THINOXVT1]                = TNUM_DATA_1S+TNUM_TARGET_OTP;
   OtpVT.LDELTA[THINOXVT1]               = -0.5V;
   OtpVT.UDELTA[THINOXVT1]               = 0.5V;
   OtpVT.PREVTYPE[THINOXVT1]             = THINOXVT1;

    /*---- pre ----*/
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case  MP1: case MP2: case MP3 :  OtpVT.ENA[CHKVT1][pre]             = false;
     default:     OtpVT.ENA[CHKVT1][pre]             = false;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case  MP1: case MP3 :  OtpVT.ENA[CHKVT1][pre]             = false;
     default: OtpVT.ENA[CHKVT1][pre]             = false;
   }   /* case */
#endif
   OtpVT.ENARED[CHKVT1][pre]           = false;
   OtpVT.DLOGONLY[CHKVT1][pre]         = false;
   OtpVT.SSTART[CHKVT1][pre]           = 1V;
   OtpVT.SSTOP[CHKVT1][pre]            = 3.5V;
   OtpVT.SRESOL[CHKVT1][pre]           = 10mV;
   OtpVT.LLIM[CHKVT1][pre]             = 1.5V;
   OtpVT.ULIM[CHKVT1][pre]             = 3.0V;
   OtpVT.TCRNUM[CHKVT1][pre]           = 6;
   OtpVT.IRATIO[CHKVT1][pre]           = TNUM_MULT2;
   OtpVT.RDOPTION[CHKVT1][pre]         = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
   OtpVT.ENA[CHKVT1][post]             = false;
   OtpVT.ENARED[CHKVT1][post]          = false;
   OtpVT.DLOGONLY[CHKVT1][post]        = false;
   OtpVT.SSTART[CHKVT1][post]          = 1V;
   OtpVT.SSTOP[CHKVT1][post]           = 3.5V;
   OtpVT.SRESOL[CHKVT1][post]          = 10mV;
   OtpVT.LLIM[CHKVT1][post]            = 1.5V;
   OtpVT.ULIM[CHKVT1][post]            = 3.0V;
   OtpVT.TCRNUM[CHKVT1][post]          = 6;
   OtpVT.IRATIO[CHKVT1][post]          = TNUM_MULT2;
   OtpVT.RDOPTION[CHKVT1][post]        = TNUM_TOPTION_NORMAL;
   OtpVT.MEMCFG[CHKVT1]               = SECTTYPE;
#if $FL_USE_AUTO_FLOW  
   switch(SelectedTITestType) {
     case MP1 : OtpVT.TDATA[CHKVT1]       = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
     case MP2 : OtpVT.TDATA[CHKVT1]       = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
     default: OtpVT.TDATA[CHKVT1]   = TNUM_DATA_1S+TNUM_TARGET_OTP_SEMI;
   }   /* case */
#else
   switch(SelectedTITestType) {
     case MP1 : OtpVT.TDATA[CHKVT1]       = TNUM_DATA_1S+TNUM_TARGET_OTP_SEMI;
     case MP3 : OtpVT.TDATA[CHKVT1]       = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
     default: OtpVT.TDATA[CHKVT1]   = TNUM_DATA_1S+TNUM_TARGET_OTP_SEMI;
   }   /* case */
#endif
   OtpVT.LDELTA[CHKVT1]               = -0.5V;
   OtpVT.UDELTA[CHKVT1]               = 0.5V;
   OtpVT.PREVTYPE[CHKVT1]             = CHKVT1;

    /*---- pre ----*/
   OtpVT.ENA[CHKVT1DRL][pre]              = false;
   OtpVT.ENARED[CHKVT1DRL][pre]           = false;
   OtpVT.DLOGONLY[CHKVT1DRL][pre]         = false;
   OtpVT.SSTART[CHKVT1DRL][pre]           = 1V;
   OtpVT.SSTOP[CHKVT1DRL][pre]            = 3.5V;
   OtpVT.SRESOL[CHKVT1DRL][pre]           = 10mV;
   OtpVT.LLIM[CHKVT1DRL][pre]             = 1.5V;
   OtpVT.ULIM[CHKVT1DRL][pre]             = 3.0V;
   OtpVT.TCRNUM[CHKVT1DRL][pre]           = 6;
   OtpVT.IRATIO[CHKVT1DRL][pre]           = TNUM_MULT2;
   OtpVT.RDOPTION[CHKVT1DRL][pre]         = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
   OtpVT.ENA[CHKVT1DRL][post]             = false;
   OtpVT.ENARED[CHKVT1DRL][post]          = false;
   OtpVT.DLOGONLY[CHKVT1DRL][post]        = false;
   OtpVT.SSTART[CHKVT1DRL][post]          = 1V;
   OtpVT.SSTOP[CHKVT1DRL][post]           = 3.5V;
   OtpVT.SRESOL[CHKVT1DRL][post]          = 10mV;
   OtpVT.LLIM[CHKVT1DRL][post]            = 1.5V;
   OtpVT.ULIM[CHKVT1DRL][post]            = 3.0V;
   OtpVT.TCRNUM[CHKVT1DRL][post]          = 6;
   OtpVT.IRATIO[CHKVT1DRL][post]          = TNUM_MULT2;
   OtpVT.RDOPTION[CHKVT1DRL][post]        = TNUM_TOPTION_NORMAL;
   OtpVT.MEMCFG[CHKVT1DRL]               = SECTTYPE;
   switch(SelectedTITestType) {
     case MP2 : OtpVT.TDATA[CHKVT1DRL]        = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
     case MP3 : OtpVT.TDATA[CHKVT1DRL]        = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
     default: OtpVT.TDATA[CHKVT1DRL]    = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
   }   /* case */
   OtpVT.LDELTA[CHKVT1DRL]               = -0.5V;
   OtpVT.UDELTA[CHKVT1DRL]               = 0.5V;
   OtpVT.PREVTYPE[CHKVT1DRL]             = CHKVT1DRL;

    /*---- pre ----*/
   OtpVT.ENA[RCODEVT1][pre]              = false;
   OtpVT.ENARED[RCODEVT1][pre]           = false;
   OtpVT.DLOGONLY[RCODEVT1][pre]         = false;
   OtpVT.SSTART[RCODEVT1][pre]           = 1V;
   OtpVT.SSTOP[RCODEVT1][pre]            = 3.5V;
   OtpVT.SRESOL[RCODEVT1][pre]           = 10mV;
   OtpVT.LLIM[RCODEVT1][pre]             = 1.5V;
   OtpVT.ULIM[RCODEVT1][pre]             = 3.0V;
   OtpVT.TCRNUM[RCODEVT1][pre]           = 6;
   OtpVT.IRATIO[RCODEVT1][pre]           = TNUM_MULT2;
   OtpVT.RDOPTION[RCODEVT1][pre]         = TNUM_TOPTION_NORMAL;
    /*---- pst ----*/
   OtpVT.ENA[RCODEVT1][post]             = false;
   OtpVT.ENARED[RCODEVT1][post]          = false;
   OtpVT.DLOGONLY[RCODEVT1][post]        = false;
   OtpVT.SSTART[RCODEVT1][post]          = 1V;
   OtpVT.SSTOP[RCODEVT1][post]           = 3.5V;
   OtpVT.SRESOL[RCODEVT1][post]          = 10mV;
   OtpVT.LLIM[RCODEVT1][post]            = 1.5V;
   OtpVT.ULIM[RCODEVT1][post]            = 3.0V;
   OtpVT.TCRNUM[RCODEVT1][post]          = 6;
   OtpVT.IRATIO[RCODEVT1][post]          = TNUM_MULT2;
   OtpVT.RDOPTION[RCODEVT1][post]        = TNUM_TOPTION_NORMAL;
   OtpVT.MEMCFG[RCODEVT1]               = SECTTYPE;
   switch(SelectedTITestType) {
     case MP1 : OtpVT.TDATA[RCODEVT1]        = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
     case MP2 : OtpVT.TDATA[RCODEVT1]        = TNUM_DATA_OCHK+TNUM_TARGET_OTP_SEMI;
     default: OtpVT.TDATA[RCODEVT1]    = TNUM_DATA_ECHK+TNUM_TARGET_OTP_SEMI;
   }   /* case */
   OtpVT.LDELTA[RCODEVT1]               = -0.5V;
   OtpVT.UDELTA[RCODEVT1]               = 0.5V;
   OtpVT.PREVTYPE[RCODEVT1]             = RCODEVT1;





    /*Bit Definition        */
    /*15              RSV   */
    /*14              RSV   */
    /*13  FT3 TNI     EXE   */
    /*12              BIR   */
    /*11  MP1 Repair  REP   */
    /*10  FT1 DRL     FUNC3 */
    /*9   MP3 TNI     FUNC2 */
    /*8   MP2 DRL     FUNC1 */
    /*7   MP3 DRL     DRL   */
    /*6               FT3   */
    /*5               FT2   */
    /*4               FT1   */
    /*3               MP4   */
    /*2               MP3   */
    /*1               MP2   */
    /*0               MP1   */

    /*NOTE:  Flow byte below doesn"t include mp1 repair, mp3/ft3 tni*/
    /*except for mp1rep_flwbyte.*/
   GL_MP1_FLWBYTE    = "FFFE";
   GL_MP1REP_FLWBYTE = "F7FE";
   GL_MP2DRL_FLWBYTE = "FEFE";
   GL_MP2_FLWBYTE    = "FEFC";
   GL_MP3DRL_FLWBYTE = "FE7C";
   GL_MP3_FLWBYTE    = "FE78";
   GL_FT1DRL_FLWBYTE = "FA70";
   GL_FT1_FLWBYTE    = "FA60";
   GL_FT2_FLWBYTE    = "FA40";
   GL_FT3_FLWBYTE    = "FA00";



    /*added for soft trim*/
   if(GL_PUMPTYPE == FPAPUMP)  
   {
      GL_AUXBG_MAXEFUSE    = 5;
      GL_AUXIREF_MAXEFUSE  = 5;
      GL_MAINBG_MAXEFUSE   = 5;
      GL_MAINIREF_MAXEFUSE = 5;
   }
   else
   {
      GL_MAINBG_MAXEFUSE   = 6;
      GL_MAINIREF_MAXEFUSE = 6;
      GL_VHV_SLPCT_MAXEFUSE = 4;
      GL_VSA5CT_MAXEFUSE = 4;
   } 
      

   
    /*+++ Pump Parametrics +++*/
   BG_tolerance     = 0.0125;   /*1.25%*/
   Iref_tolerance   = 0.0250;   /*2.5%*/
   Main_Iref_Target = -10uA;

   if(GL_PUMPTYPE == HDPUMP)  
      Main_Icmp10_Target = -15uA;
   else if(GL_PUMPTYPE == ESPUMP)  
      Main_Icmp10_Target = -10uA;
   else
      Main_Icmp10_Target = -15uA;
      
   MainBG_Target    = 1.21V;
   switch(SelectedTITestType) {
     case  MP3: case  PreBurnIn: case  PostBurnIn1 :   
              MainBG_LLim      = MainBG_Target-(MainBG_Target*0.05);   /*1.1495v*/
              MainBG_ULim      = MainBG_Target+(MainBG_Target*0.05);   /*1.2705v*/
            break; 
     default:  
        MainBG_LLim      = MainBG_Target-(MainBG_Target*0.03);   /*1.1737v*/
        MainBG_ULim      = MainBG_Target+(MainBG_Target*0.03);   /*1.2463v*/
      break; 
   }   /* case */

   if(GL_PUMPTYPE == ESPUMP)  
   {
      switch(SelectedTITestType) {
        case MP1 :  
                 Main_Iref_LLim   = -13uA;
                 Main_Iref_ULim   = -9uA;
                 Main_Icmp10_LLim = -11uA;  /*CHANGE: -12.5uA; changed based on Audit Jamal Sheikh modified Sun, Jan  8 2012*/
                 Main_Icmp10_ULim = -9uA;   /*CHANGE: -8.5uA;  changed based on Audit Jamal Sheikh modified Sun, Jan  8 2012*/
               break; 
        case MP2 :  
                 if(SelectedTITestTemp==TEMP_30_DEG)  
                 { 
                    Main_Iref_LLim   = -13uA;
                    Main_Iref_ULim   = -9uA;  
                    Main_Icmp10_LLim = -11uA;  /*CHANGE: -12.5uA; changed based on Audit Jamal Sheikh modified Sun, Jan  8 2012*/
                    Main_Icmp10_ULim = -9uA;   /*CHANGE: -8.5uA;  changed based on Audit Jamal Sheikh modified Sun, Jan  8 2012*/
                 }
                 else
                 {
                    /*-40C*/
                    Main_Iref_LLim   = -13uA;
                    Main_Iref_ULim   = -9uA;
                    Main_Icmp10_LLim = -11uA;  /*CHANGE: -12.5uA; changed based on Audit Jamal Sheikh modified Sun, Jan  8 2012*/
                    Main_Icmp10_ULim = -9uA;   /*CHANGE: -8.5uA;  changed based on Audit Jamal Sheikh modified Sun, Jan  8 2012*/
                 }
               break; 
        default:  
           Main_Iref_LLim   = -14uA;
           Main_Iref_ULim   = -8uA;
           if (SelectedTITestType == MP1)  
               Main_Icmp10_LLim = -13.5uA;
           else
               Main_Icmp10_LLim = -11.25uA;
       
           Main_Icmp10_ULim = -7.5uA;
         break; 
      }   /* case */
   }   /*ESPUMP*/
   else  
   {  /*HDPUMP*/
      switch(SelectedTITestType) {
        case MP1 :  
                 Main_Iref_LLim   = -13uA;
                 Main_Iref_ULim   = -9uA;
                 Main_Icmp10_LLim = -16.5uA;
                 Main_Icmp10_ULim = -13.5uA;
               break; 
        case MP2 :  
                 if(SelectedTITestTemp==TEMP_30_DEG)  
                 { 
                    Main_Iref_LLim   = -13uA;
                    Main_Iref_ULim   = -9uA;
                    Main_Icmp10_LLim = -16.5uA;
                    Main_Icmp10_ULim = -13.5uA;
                 }
                 else
                 {
                    /*-40C*/
                    Main_Iref_LLim   = -13uA;
                    Main_Iref_ULim   = -9uA;
                    Main_Icmp10_LLim = -16.5uA;
                    Main_Icmp10_ULim = -13.5uA;
                 }
               break; 
        default:  
           Main_Iref_LLim   = -10.64uA;
           Main_Iref_ULim   = -8.36uA;
           Main_Icmp10_LLim = -17.5uA;
           Main_Icmp10_ULim = -13.5uA;
         break; 
      }   /* case */
   }   /*HDPUMP*/

      VHV_Prog_SlopeCT_Target = 13.8V;
      VHV_Prog_SlopeCT_Toler  = 0.03;  /*3%*/

      VHV_Prog_Target  = 11.2V;
      switch(SelectedTITestType) {
        case  MP3: case  PreBurnIn: case  PostBurnIn1 :   
           VHV_Prog_LLim    = VHV_Prog_Target-(VHV_Prog_Target*0.07);
           VHV_Prog_ULim    = VHV_Prog_Target+(VHV_Prog_Target*0.07);
         break; 
        default:  
           VHV_Prog_LLim    = VHV_Prog_Target-(VHV_Prog_Target*0.04);
           VHV_Prog_ULim    = VHV_Prog_Target+(VHV_Prog_Target*0.04);
         break; 
      }   /* case */
      
      VHV_Pvfy_Target  = 3.6V;  
      switch(SelectedTITestType) {
        case  MP3: case  PreBurnIn: case  PostBurnIn1 :   
           VHV_Pvfy_LLim    = VHV_Pvfy_Target-(VHV_Pvfy_Target*0.07);
           VHV_Pvfy_ULim    = VHV_Pvfy_Target+(VHV_Pvfy_Target*0.07);
         break; 
        default:  
           VHV_Pvfy_LLim    = VHV_Pvfy_Target-(VHV_Pvfy_Target*0.03);
           VHV_Pvfy_ULim    = VHV_Pvfy_Target+(VHV_Pvfy_Target*0.03);
         break; 
      }   /* case */
        
      VHV_Ers_Target   = 13.0V;
      switch(SelectedTITestType) {
        case  MP3: case  PreBurnIn: case  PostBurnIn1 :   
           VHV_Ers_LLim     = VHV_Ers_Target-(VHV_Ers_Target*0.08);
           VHV_Ers_ULim     = 13.75V;  /*VHV_Ers_Target+(VHV_Ers_Target*0.06);} {was 6% or 13.78v*/
         break; 
        default:  
           VHV_Ers_LLim     = VHV_Ers_Target-(VHV_Ers_Target*0.03);
           VHV_Ers_ULim     = VHV_Ers_Target+(VHV_Ers_Target*0.03);
         break; 
      }   /* case */
      
      VHVVregRef_Prog_Target  = 9.0V;
      VHVVregRef_Prog_LLim    = VHVVregRef_Prog_Target-(VHVVregRef_Prog_Target*0.10);
      VHVVregRef_Prog_ULim    = VHVVregRef_Prog_Target+(VHVVregRef_Prog_Target*0.10);
      
      VHVVregRef_Pvfy_Target  = 9.0V;
      VHVVregRef_Pvfy_LLim    = VHVVregRef_Pvfy_Target-(VHVVregRef_Pvfy_Target*0.10);
      VHVVregRef_Pvfy_ULim    = VHVVregRef_Pvfy_Target+(VHVVregRef_Pvfy_Target*0.10);
      
      VHVVregRef_Ers_Target  = 9.0V;
      VHVVregRef_Ers_LLim    = VHVVregRef_Ers_Target-(VHVVregRef_Ers_Target*0.10);
      VHVVregRef_Ers_ULim    = VHVVregRef_Ers_Target+(VHVVregRef_Ers_Target*0.10);

      VHalfRef_Prog_Target  = 9.0V;
      VHalfRef_Prog_LLim    = VHalfRef_Prog_Target-(VHalfRef_Prog_Target*0.10);
      VHalfRef_Prog_ULim    = VHalfRef_Prog_Target+(VHalfRef_Prog_Target*0.10);
      
      VHalfRef_Pvfy_Target  = 9.0V;
      VHalfRef_Pvfy_LLim    = VHalfRef_Pvfy_Target-(VHalfRef_Pvfy_Target*0.10);
      VHalfRef_Pvfy_ULim    = VHalfRef_Pvfy_Target+(VHalfRef_Pvfy_Target*0.10);
      
      VHalfRef_Ers_Target  = 9.0V;
      VHalfRef_Ers_LLim    = VHalfRef_Ers_Target-(VHalfRef_Ers_Target*0.10);
      VHalfRef_Ers_ULim    = VHalfRef_Ers_Target+(VHalfRef_Ers_Target*0.10);
      
      VSL_Target       = 4.8V;
      VSL_LLim         = VSL_Target-(VSL_Target*0.05);
      VSL_ULim         = VSL_Target+(VSL_Target*0.05);
      
      VSLNREF_Target   = 8V;
      VSLNREF_LLim     = VSLNREF_Target-(VSLNREF_Target*0.05);
      VSLNREF_ULim     = VSLNREF_Target+(VSLNREF_Target*0.05);
      
      VRead_Target     = 3.0V;   /*used for trimming*/
      VRead_LLim       = VRead_Target-(VRead_Target*0.10);  /*used for trimming*/
      VRead_ULim       = VRead_Target+(VRead_Target*0.10);  /*used for trimming*/

      VRead_Target_VMIN = 2.9V;
      VRead_LLim_VMIN   = VRead_Target_VMIN-(VRead_Target_VMIN*0.05);
      VRead_ULim_VMIN   = VRead_Target_VMIN+(VRead_Target_VMIN*0.05);
      
      VRead_Target_VMAX = 3.025V;
      VRead_LLim_VMAX   = VRead_Target_VMAX-(VRead_Target_VMAX*0.05);
      VRead_ULim_VMAX   = VRead_Target_VMAX+(VRead_Target_VMAX*0.05);
      
      VReadNREF_Target = 6.0V;
      VReadNREF_LLim   = VReadNREF_Target-(VReadNREF_Target*0.10);
      VReadNREF_ULim   = VReadNREF_Target+(VReadNREF_Target*0.10);
            
      VSA5_Read_Target = 5.25V;
      VSA5_Read_LLim   = VSA5_Read_Target-(VSA5_Read_Target*0.05);
      VSA5_Read_ULim   = VSA5_Read_Target+(VSA5_Read_Target*0.05);
      VSA5CT_Toler     = 0.01;   /*1%*/
      
      VSA5Pump_Read_Target = 9.0V;
      VSA5Pump_Read_LLim   = VSA5Pump_Read_Target-(VSA5Pump_Read_Target*0.05);
      VSA5Pump_Read_ULim   = VSA5Pump_Read_Target+(VSA5Pump_Read_Target*0.05);

      VSA5NREF_Read_Target = 9.0V;
      VSA5NREF_Read_LLim   = VSA5NREF_Read_Target-(VSA5NREF_Read_Target*0.05);
      VSA5NREF_Read_ULim   = VSA5NREF_Read_Target+(VSA5NREF_Read_Target*0.05);
            
      VWL_Read_Target  = 1.3V;
      VWL_Read_LLim    = VWL_Read_Target-(VWL_Read_Target*0.05);
      VWL_Read_ULim    = VWL_Read_Target+(VWL_Read_Target*0.05);
      
      VWLNREF_Read_Target  = 3V;
      VWLNREF_Read_LLim    = VWLNREF_Read_Target-(VWLNREF_Read_Target*0.05);
      VWLNREF_Read_ULim    = VWLNREF_Read_Target+(VWLNREF_Read_Target*0.05);

      if(SelectedTITestType==MP3)  
         VCG2P5_Read_Target = 1.8V;
      else
         VCG2P5_Read_Target = 1.825V;
      switch(SelectedTITestType) {
        case  MP3: case  PreBurnIn: case  PostBurnIn1 :   
           VCG2P5_Read_LLim   = VCG2P5_Read_Target-(VCG2P5_Read_Target*0.04);
           VCG2P5_Read_ULim   = VCG2P5_Read_Target+(VCG2P5_Read_Target*0.04);
         break; 
        case MP1 :  
           VCG2P5_Read_LLim   = VCG2P5_Read_Target-(VCG2P5_Read_Target*0.03);
           VCG2P5_Read_ULim   = VCG2P5_Read_Target+(VCG2P5_Read_Target*0.03);
         break; 
        case MP2 :  
           VCG2P5_Read_LLim   = VCG2P5_Read_Target-(VCG2P5_Read_Target*0.03);
           VCG2P5_Read_ULim   = VCG2P5_Read_Target+(VCG2P5_Read_Target*0.03);
         break; 
        default:  
           VCG2P5_Read_LLim   = VCG2P5_Read_Target-(VCG2P5_Read_Target*0.03);
           VCG2P5_Read_ULim   = VCG2P5_Read_Target+(VCG2P5_Read_Target*0.03);
         break; 
      }   /* case */

      VCG2P5NREF_Read_Target = 3V;
      VCG2P5NREF_Read_LLim   = VCG2P5NREF_Read_Target-(VCG2P5NREF_Read_Target*0.03);
      VCG2P5NREF_Read_ULim   = VCG2P5NREF_Read_Target+(VCG2P5NREF_Read_Target*0.03);
      
      VINH_Read_Target   = 3.3V;
      VINH_Read_LLim     = VINH_Read_Target-(VINH_Read_Target*0.30);
      VINH_Read_ULim     = VINH_Read_Target+(VINH_Read_Target*0.10);
      
      VINH_Target_VMIN   = 2.9V;
      VINH_LLim_VMIN     = 2.75V;
      VINH_ULim_VMIN     = 3.1V;
      
      VINH_Target_VMAX   = 3.3V;
      VINH_LLim_VMAX     = 3.15V;
      VINH_ULim_VMAX     = 4.0V;
      
      VINHNREF_Read_Target   = 6V;
      VINHNREF_Read_LLim     = VINHNREF_Read_Target-(VINHNREF_Read_Target*0.10);
      VINHNREF_Read_ULim     = VINHNREF_Read_Target+(VINHNREF_Read_Target*0.10);
      
      VHV2XPump_Prog_Target  = 5.125V;
      VHV2XPump_Prog_LLim    = 4.8V;  /*VHV2XPump_Prog_Target-(VHV2XPump_Prog_Target*0.10);*/
      VHV2XPump_Prog_ULim    = 6.2V;  /*VHV2XPump_Prog_Target+(VHV2XPump_Prog_Target*0.10);*/

       /*vmin corner*/
      VReadBUF_Prog_Target = 2.9V;
      VReadBUF_Prog_LLim   = 2.5V;  /*VReadBUF_Prog_Target-(VReadBUF_Prog_Target*0.10);*/
      VReadBUF_Prog_ULim   = 3.0V;  /*VReadBUF_Prog_Target+(VReadBUF_Prog_Target*0.10);*/
       /*vmax corner*/
   if(GL_PUMPTYPE==ESPUMP)  
   {
      VReadBUF_Pvfy_Target = 3.6V;
      VReadBUF_Pvfy_LLim   = VReadBUF_Pvfy_Target-(VReadBUF_Pvfy_Target*0.05);
      VReadBUF_Pvfy_ULim   = VReadBUF_Pvfy_Target+(VReadBUF_Pvfy_Target*0.05);
   }
   else
   {
      VReadBUF_Pvfy_Target = 2.9V;
      VReadBUF_Pvfy_LLim   = 2.5V;  /*VReadBUF_Pvfy_Target-(VReadBUF_Pvfy_Target*0.10);*/
      VReadBUF_Pvfy_ULim   = 3.0V;  /*VReadBUF_Pvfy_Target+(VReadBUF_Pvfy_Target*0.10);*/
   }   /*HDPUMP*/
      


   MainBG_SoftTrim_VForce    = 1.21V;
   MainBG_Adapt_Delta_ULim   = 8mV;  /*vrd step*/
   MainIref_Adapt_Delta_ULim = 150nA;  /*was 250na*/
   MainBG_Const_VStep        = 0.003V;
   MainBG_Const_VMin         = 1.161V;
   MainBG_Const_VMax         = 1.209V;
   MainIref_Const_IStep      = 0.125uA;  /*f035 0.25ua*/
   AuxBG_SoftTrim_VForce     = 1.21V;
   AuxBG_Adapt_Delta_ULim    = 3mV;
   AuxIref_Adapt_Delta_ULim  = 250nA;
   AuxBG_Const_VStep         = 0.003V;
   AuxBG_Const_VMin          = 1.161V;
   AuxBG_Const_VMax          = 1.209V;
   AuxIref_Const_IStep       = 0.125uA;
   BG_Adapt_Delta_AbsLim     = 3mV;   /*absolute delta limit used in trim*/
   Iref_Adapt_Delta_AbsLim   = 150nA;  /*absolute delta limit used in trim*/

   FOSC_Target = 18.0MHz;
   FOSC_Trim_Toler = 0.01;  /*1%*/
    /* Changed the FOSC limits for Blizzard at 90C...Pasa Boonpirom Jan.19,2012*/
   if (SelectedTITestType==MP3)  
       {
           FOSC_LLimit = 16.3MHz;
           FOSC_ULimit = 19.7MHz;
       }
         else
       {
   FOSC_LLimit = 17.1MHz;
   FOSC_ULimit = 18.9MHz;
       } 
   
    /*+++ Leakage Conditions/Limits +++*/
   BL_LEAK_ULim =  50uA;
   BL_LEAK_LLim = -10uA;
   BL_LEAK_Voltage = 2V;  /*TP2*/
   WL_LEAK_ULim =  50uA;
   WL_LEAK_LLim = -10uA;
   WL_LEAK_Voltage = 8.5V;  /*TP1*/
   SL_LEAK_ULim =  50uA;
   SL_LEAK_LLim = -10uA;
   SL_LEAK_Voltage = 2V;  /*TP2*/
   
   
   BL_VRD_ULim     = 2V;    /*no upper limit so use dummy limit*/
   BL_VRD_LLim     = 0.2V;
   WL_VCVFY_ULim   = 2V;    /*no upper limit so use dummy limit*/
   WL_VCVFY_LLim   = 0.3V;
   SL_VCMPT_ULim   = 2V;    /*no upper limit so use dummy limit*/
   SL_VCMPT_LLim   = 0.5V;


       /*+++ Pulse Limit +++*/
   SECT_PRECON_ULimit =  20;  /*100; tightened for Blizzard per S.C request Jamal Sheikh modified Thu, Jan  5 2012*/
   SECT_ERS_ULimit    =  20;  /*600; tightened for Blizzard per S.C request Jamal Sheikh modified Thu, Jan  5 2012*/
   SECT_CMPT_ULimit   =  50;
   SECT_PROG_ULimit   =  20;  /*100; tightened for Blizzard per S.C request Jamal Sheikh modified Thu, Jan  5 2012*/
   BANK_PRECON_ULimit =  20;  /*100; tightened for Blizzard per S.C request Jamal Sheikh modified Thu, Jan  5 2012*/
   BANK_ERS_ULimit    =  20;  /*600; tightened for Blizzard per S.C request Jamal Sheikh modified Thu, Jan  5 2012*/
   BANK_CMPT_ULimit   =  50;                                              
   BANK_PROG_ULimit   =  20;  /*100; tightened for Blizzard per S.C request Jamal Sheikh modified Thu, Jan  5 2012*/
   OTP_PRECON_ULimit  =  20;  /*100; tightened for Blizzard per S.C request Jamal Sheikh modified Thu, Jan  5 2012*/
   OTP_ERS_ULimit     =  20;  /*600; tightened for Blizzard per S.C request Jamal Sheikh modified Thu, Jan  5 2012*/
   OTP_CMPT_ULimit    =  50;                                              
   OTP_PROG_ULimit    =  20;  /*100; tightened for Blizzard per S.C request Jamal Sheikh modified Thu, Jan  5 2012*/

   BANK_PROGONEPLS_ULimit = 1;

    /*for AVNV*/
   BANK_ERS_AVNV_CAT1_ULimit = 125;
   BANK_ERS_AVNV_CAT2_ULimit = 252;
   BANK_ERS_AVNV_CAT3_ULimit = 600;
   BANK_ERS_AVNV_CAT1_SET = 0xC;
   BANK_ERS_AVNV_CAT2_SET = 0xD;
   BANK_ERS_AVNV_CAT3_SET = 0xE;
   

    /*+++ Datalog/Pulse Address info +++*/
   ADDR_API_STAT1      = 0x0070;
   ADDR_API_STAT2      = 0x0074;
   ADDR_API_STAT3      = 0x0078;
   ADDR_API_STAT4      = 0x007c;

   ADDR_TESTFREQ       = 0x0080;
   ADDR_FAIL_ADDR      = 0x0084;   /*fail addrs or expected psa*/
   ADDR_FAIL_DATA      = 0x0088;   /*fail data or actual psa*/

   ADDR_PF_BIN         = 0x0082;   /*test p/f, bin lsw*/
   ADDR_TEST_INFO      = 0x008c;    /*test number*/
   
   ADDR_MSTAT          = 0x0090;  /*was 0x0092, 32bit*/
   ADDR_ERS_PULSE      = 0x0094;  /*16bit, was 0x92*/
   ADDR_PROG_MAX_PULSE = 0x0096;  /*16bit*/
   ADDR_PROG_TOT_PULSE = 0x0098;  /*totalPP or failing bit count, 32bit*/
   ADDR_MEASFREQ       = 0x009c;  /*measured freq in khz 32bit*/
   ADDR_RTITIMER       = 0x00a0;  /*32bit in msec*/
   ADDR_TRIMSOL        = 0x00a4;  /*16bit*/


   if(GL_MBoxRAMTYPE==RAMType2)  
   {      
      ADDR_RAM_MAILBOX    = 0x0200;  /*for sirius device*/
      ADDR_RAM_REPAIR_SOL = 0x0500;  /*holds repair solution/info*/
      ADDR_RAM_IPMOS_MAILBOX = 0x00C0;  /*16bit was 0x0920;}  {holds pmos trim solution/info*/
   }
   else
   {
      ADDR_RAM_MAILBOX    = 0x0200;
      ADDR_RAM_REPAIR_SOL = 0x0500;  /*holds repair solution/info*/
      ADDR_RAM_IPMOS_MAILBOX = 0x00C0;   /*16bit was 0x2BA0;}  {holds pmos trim solution/info*/
   } 

   ADDR_RAM_INC = 0x4;
   ADDR_RAM_SHELLREV   = 0x0090;  /*shell revision in lsw*/

   ADDR_RAM_ESDA       = 0x0500;
   ADDR_RAM_ARB_FREQ   = 0x00B0;
   ADDR_RAM_ARB_WAIT   = 0x00B2;
   ADDR_RAM_ARB_TGADDR = 0x00B4;  /*arb config space for arb target addr*/
   ADDR_RAM_ARB_TGLEN  = 0x00B8;
   ADDR_RAM_EFSOFTTRIM = 0x00D4;  /*was 0xd8*/
   ADDR_RAM_BGAP_TRIM  = 0x00D6;  /*upper 8bit=bgap, lower 8bit=iref} {was 0xda*/
   ADDR_RAM_PUMP_IREF_TRIM  = 0x00D6;  /*upper 8bit=bgap, lower 8bit=iref} {was 0xdc*/
   ADDR_RAM_SLOPECT_TRIM  = 0x00D8;   /*upper 8bit=vsa5ct, lower 8bit=slopect} {was 0xe0*/
   ADDR_RAM_FOSC_TRIM  = 0x00DA;   /*upper 8bit, lower 8bit=rsvd} {was 0xde*/
   ADDR_RAM_FMW        = 0x00DC;  /*was 0xbc*/
   ADDR_RAM_IGNOREOTP = 0x00DE;


 /*KChau - for TV2 only*/
 /*moved to f021_config.p for device specific*/
 /*
    ADDR_TIOTP_HI[0] := 0xF008;
    ADDR_TIOTP_LO[0] := 0x0000;
    ADDR_TIOTP_HI[1] := 0xF008;
    ADDR_TIOTP_LO[1] := 0x2000;
    ADDR_TIOTP_HI[2] := 0xF008;
    ADDR_TIOTP_LO[2] := 0xE000;
 */

    /*+++ Stress Limit +++*/
   BLS_ULim =  0.5V; 
   BLS_LLim = -0.1V;
   WLS_ULim =  0.2V;
   WLS_LLim = -0.1V;
   SLS_ULim =  0.2V;
   SLS_LLim = -0.1V;
   DRL0S_ULim  = 0.6V;  
   DRL0S_LLim  = -0.1V;
   DRL1S_ULim  = 0.3V;
   DRL1S_LLim  = -0.2V;
   BLS_Voltage = 4.4V;
   WLS_Voltage = 9.6V;
   SLS_Voltage = 4.4V;
   UVVT_Voltage = 5.5V;


    /*+++ VT Limit +++*/
   UVVT_ULim = 5.5V;
   UVVT_LLim = 3.5V;
   VT0_ULim = 8.7V;
   VT0_LLim = 6.6V;
   LOWVT0_ULim = 7.50V;   /*use for low-vt (pre-wls)*/
   LOWVT0_LLim = 6.73V;
   VT1_ULim = 4.6V;
   VT1_LLim = 3.5V;
   VT1min_ULim = 3.5V;
   VT1min_LLim = 0.9V;   /*KChau 02/15/07 - temporary 1.2v;*/
   VT0min_ULim = 7.00V;  /*for compressed pgm*/
   VT0min_LLim = 6.73V;    /*for compressed pgm preDRL*/
   VT0min_PstDRL_LLim = 6.13V;    /*for compressed pgm pstDRL*/
   VT0max_ULim = 8.00V;  /*for compressed pgm*/
   VT0max_LLim = 6.80V;  /*for compressed pgm*/
   VT0MinMax_ULim = 1.0V;  /*for compressed pgm*/
   VT0MinMax_LLim = -0.1V;  /*for compressed pgm*/
   VT0ErsStr_ULim = 8V;
   VT0ErsStr_LLim = 4V; 
   VT0ErsStr_Delta_ULim = 3V;
   VT0ErsStr_Delta_LLim = 0V;
   VT1ErsStr_ULim = 7.5V;
   ErsStrSlowScrn_Lim = 350mV;  /*used for slow ers screen*/
    /*delta limit of block median*/
   DRL0S_Block_LLim  = 0mV;
   DRL0S_Block_ULim  = 150mV;
   DRL1S_Block_LLim  = 0mV;
   DRL1S_Block_ULim  = 150mV;



    /*==== PARAMETRIC TEST NAME ====*/
    /*[tcr#,modetype,pre/post,vcorner]*/
    /*test name of post-type is w/o Pst, pre-type is w/ Pre*/
    /*MN=vmin,NM=vnom,MX=vmax, MNE=vmin_even,MNO=vmin_odd, & so on*/

   PUMP_BANK_PARA_TESTNAME[0][ReadMode][1][pre][VMX]  = "TP1LkgLoPre_MX_Test";
   PUMP_BANK_PARA_TESTNAME[0][ReadMode][2][pre][VMX]  = "TP2LkgLoPre_MX_Test";
   PUMP_BANK_PARA_TESTNAME[0][ProgMode][1][pre][VMX]  = "TP1LkgHiPre_MX_Test";
   PUMP_BANK_PARA_TESTNAME[0][ProgMode][2][pre][VMX]  = "TP2LkgHiPre_MX_Test";
   PUMP_BANK_PARA_TESTNAME[0][ReadMode][1][post][VMX] = "TP1LkgLoPst_MX_Test";
   PUMP_BANK_PARA_TESTNAME[0][ReadMode][2][post][VMX] = "TP2LkgLoPst_MX_Test";
   PUMP_BANK_PARA_TESTNAME[0][ProgMode][1][post][VMX] = "TP1LkgHiPst_MX_Test";
   PUMP_BANK_PARA_TESTNAME[0][ProgMode][2][post][VMX] = "TP2LkgHiPst_MX_Test";

   PUMP_BANK_PARA_TESTNAME[115][ProgMode][1][post][VMN] = "VHV_Pg_MN_Test";
   PUMP_BANK_PARA_TESTNAME[115][ProgMode][2][post][VMN] = "VHVVregRef_Pg_MN_Test";
   PUMP_BANK_PARA_TESTNAME[115][ProgMode][3][post][VMN] = "VHalfRef_Pg_MN_Test";
   PUMP_BANK_PARA_TESTNAME[115][ProgMode][6][post][VMN] = "VHV_TADC_Pg_MN_Test";
   PUMP_BANK_PARA_TESTNAME[115][PvfyMode][1][post][VMN] = "VHV_Pv_MN_Test";
   PUMP_BANK_PARA_TESTNAME[115][PvfyMode][2][post][VMN] = "VHVVregRef_Pv_MN_Test";
   PUMP_BANK_PARA_TESTNAME[115][PvfyMode][3][post][VMN] = "VHalfRef_Pv_MN_Test";
   PUMP_BANK_PARA_TESTNAME[115][PvfyMode][6][post][VMN] = "VHV_TADC_Pv_MN_Test";
   PUMP_BANK_PARA_TESTNAME[115][ErsMode][1][post][VMN]  = "VHV_Er_MN_Test";
   PUMP_BANK_PARA_TESTNAME[115][ErsMode][2][post][VMN]  = "VHVVregRef_Er_MN_Test";
   PUMP_BANK_PARA_TESTNAME[115][ErsMode][3][post][VMN]  = "VHalfRef_Er_MN_Test";
   PUMP_BANK_PARA_TESTNAME[115][ErsMode][6][post][VMN]  = "VHV_TADC_Er_MN_Test";

   PUMP_BANK_PARA_TESTNAME[115][ProgMode][1][post][VMX] = "VHV_Pg_MX_Test";
   PUMP_BANK_PARA_TESTNAME[115][ProgMode][2][post][VMX] = "VHVVregRef_Pg_MX_Test";
   PUMP_BANK_PARA_TESTNAME[115][ProgMode][3][post][VMX] = "VHalfRef_Pg_MX_Test";
   PUMP_BANK_PARA_TESTNAME[115][ProgMode][6][post][VMX] = "VHV_TADC_Pg_MX_Test";
   PUMP_BANK_PARA_TESTNAME[115][PvfyMode][1][post][VMX] = "VHV_Pv_MX_Test";
   PUMP_BANK_PARA_TESTNAME[115][PvfyMode][2][post][VMX] = "VHVVregRef_Pv_MX_Test";
   PUMP_BANK_PARA_TESTNAME[115][PvfyMode][3][post][VMX] = "VHalfRef_Pv_MX_Test";
   PUMP_BANK_PARA_TESTNAME[115][PvfyMode][6][post][VMX] = "VHV_TADC_Pv_MX_Test";
   PUMP_BANK_PARA_TESTNAME[115][ErsMode][1][post][VMX]  = "VHV_Er_MX_Test";
   PUMP_BANK_PARA_TESTNAME[115][ErsMode][2][post][VMX]  = "VHVVregRef_Er_MX_Test";
   PUMP_BANK_PARA_TESTNAME[115][ErsMode][3][post][VMX]  = "VHalfRef_Er_MX_Test";
   PUMP_BANK_PARA_TESTNAME[115][ErsMode][6][post][VMX]  = "VHV_TADC_Er_MX_Test";

   PUMP_BANK_PARA_TESTNAME[116][ProgMode][2][post][VMN] = "VSL_Pg_MN_Test";
   PUMP_BANK_PARA_TESTNAME[116][ProgMode][3][post][VMN] = "VSLNref_Pg_MN_Test";
   PUMP_BANK_PARA_TESTNAME[116][ProgMode][6][post][VMN] = "VSL_TADC_Pg_MN_Test";
   PUMP_BANK_PARA_TESTNAME[116][PvfyMode][2][post][VMN] = "VSL_Pg_MN_Ld2_Test";
   PUMP_BANK_PARA_TESTNAME[116][PvfyMode][3][post][VMN] = "VSLNref_Pg_MN_Ld2_Test";
   PUMP_BANK_PARA_TESTNAME[116][PvfyMode][6][post][VMN] = "VSL_TADC_Pg_MN_Ld2_Test";
   
   PUMP_BANK_PARA_TESTNAME[116][ProgMode][2][post][VMX] = "VSL_Pg_MX_Test";
   PUMP_BANK_PARA_TESTNAME[116][ProgMode][3][post][VMX] = "VSLNref_Pg_MX_Test";
   PUMP_BANK_PARA_TESTNAME[116][ProgMode][6][post][VMX] = "VSL_TADC_Pg_MX_Test";
   PUMP_BANK_PARA_TESTNAME[116][PvfyMode][2][post][VMX] = "VSL_Pg_MX_Ld2_Test";
   PUMP_BANK_PARA_TESTNAME[116][PvfyMode][3][post][VMX] = "VSLNref_Pg_MX_Ld2_Test";
   PUMP_BANK_PARA_TESTNAME[116][PvfyMode][6][post][VMX] = "VSL_TADC_Pg_MX_Ld2_Test";
   
   PUMP_BANK_PARA_TESTNAME[117][ReadMode][1][post][VMN] = "VRead_MN_Test";
   PUMP_BANK_PARA_TESTNAME[117][ReadMode][3][post][VMN] = "VReadNref_MN_Test";
   PUMP_BANK_PARA_TESTNAME[117][ReadMode][6][post][VMN] = "VRead_TADC_MN_Test";
   
   PUMP_BANK_PARA_TESTNAME[117][EvfyMode][1][post][VMN] = "VRead_MN_Test";
   PUMP_BANK_PARA_TESTNAME[117][EvfyMode][3][post][VMN] = "VReadNref_MN_Test";
   PUMP_BANK_PARA_TESTNAME[117][EvfyMode][6][post][VMN] = "VRead_TADC_MN_Test";
   
   PUMP_BANK_PARA_TESTNAME[117][CvfyMode][1][post][VMX] = "VRead_MX_Test";
   PUMP_BANK_PARA_TESTNAME[117][CvfyMode][3][post][VMX] = "VReadNref_MX_Test";
   PUMP_BANK_PARA_TESTNAME[117][CvfyMode][6][post][VMX] = "VRead_TADC_MX_Test";
   
   PUMP_BANK_PARA_TESTNAME[118][ReadMode][1][post][VMN] = "VSA5_Rd_MN_Test";
   PUMP_BANK_PARA_TESTNAME[118][ReadMode][2][post][VMN] = "VSA5Pu_Rd_MN_Test";
   PUMP_BANK_PARA_TESTNAME[118][ReadMode][3][post][VMN] = "VSA5Nref_Rd_MN_Test";
   PUMP_BANK_PARA_TESTNAME[118][ReadMode][6][post][VMN] = "VSA5_TADC_Rd_MN_Test";
   
   PUMP_BANK_PARA_TESTNAME[118][ReadMode][1][post][VMX] = "VSA5_Rd_MX_Test";
   PUMP_BANK_PARA_TESTNAME[118][ReadMode][2][post][VMX] = "VSA5Pu_Rd_MX_Test";
   PUMP_BANK_PARA_TESTNAME[118][ReadMode][3][post][VMX] = "VSA5Nref_Rd_MX_Test";
   PUMP_BANK_PARA_TESTNAME[118][ReadMode][6][post][VMX] = "VSA5_TADC_Rd_MX_Test";
   
   PUMP_BANK_PARA_TESTNAME[119][ReadMode][1][post][VMN] = "VWL_Pg_MN_Test";
   PUMP_BANK_PARA_TESTNAME[119][ReadMode][3][post][VMN] = "VWLNref_Pg_MN_Test";
   PUMP_BANK_PARA_TESTNAME[119][ReadMode][6][post][VMN] = "VWL_TADC_Pg_MN_Test";
   
   PUMP_BANK_PARA_TESTNAME[119][ReadMode][1][post][VMX] = "VWL_Pg_MX_Test";
   PUMP_BANK_PARA_TESTNAME[119][ReadMode][3][post][VMX] = "VWLNref_Pg_MX_Test";
   PUMP_BANK_PARA_TESTNAME[119][ReadMode][6][post][VMX] = "VWL_TADC_Pg_MX_Test";
   
   PUMP_BANK_PARA_TESTNAME[120][ReadMode][1][post][VMN] = "VCG2P5_Rd_MN_Test";
   PUMP_BANK_PARA_TESTNAME[120][ReadMode][3][post][VMN] = "VCG2P5Nref_Rd_MN_Test";
   PUMP_BANK_PARA_TESTNAME[120][ReadMode][6][post][VMN] = "VCG2P5_TADC_Rd_MN_Test";
   
   PUMP_BANK_PARA_TESTNAME[120][ReadMode][1][post][VMX] = "VCG2P5_Rd_MX_Test";
   PUMP_BANK_PARA_TESTNAME[120][ReadMode][3][post][VMX] = "VCG2P5Nref_Rd_MX_Test";
   PUMP_BANK_PARA_TESTNAME[120][ReadMode][6][post][VMX] = "VCG2P5_TADC_Rd_MX_Test";
   
   PUMP_BANK_PARA_TESTNAME[121][ReadMode][1][post][VMN] = "VINH_Rd_MN_Test";
   PUMP_BANK_PARA_TESTNAME[121][ReadMode][3][post][VMN] = "VINHNref_Rd_MN_Test";
   PUMP_BANK_PARA_TESTNAME[121][ReadMode][6][post][VMN] = "VINH_TADC_Rd_MN_Test";
   
   PUMP_BANK_PARA_TESTNAME[121][EvfyMode][1][post][VMN] = "VINH_Rd_MN_Test";
   PUMP_BANK_PARA_TESTNAME[121][EvfyMode][3][post][VMN] = "VINHNref_Rd_MN_Test";
   PUMP_BANK_PARA_TESTNAME[121][EvfyMode][6][post][VMN] = "VINH_TADC_Rd_MN_Test";
   
   PUMP_BANK_PARA_TESTNAME[121][CvfyMode][1][post][VMX] = "VINH_Rd_MX_Test";
   PUMP_BANK_PARA_TESTNAME[121][CvfyMode][3][post][VMX] = "VINHNref_Rd_MX_Test";
   PUMP_BANK_PARA_TESTNAME[121][CvfyMode][6][post][VMX] = "VINH_TADC_Rd_MX_Test";
   
   PUMP_BANK_PARA_TESTNAME[122][ProgMode][1][post][VMN] = "VHV2XPu_Pg_MN_Test";
   PUMP_BANK_PARA_TESTNAME[122][ProgMode][6][post][VMN] = "VHV2XPu_TADC_Pg_MN_Test";

   PUMP_BANK_PARA_TESTNAME[122][ProgMode][1][post][VMX] = "VHV2XPu_Pg_MX_Test";
   PUMP_BANK_PARA_TESTNAME[122][ProgMode][6][post][VMX] = "VHV2XPu_TADC_Pg_MX_Test";

   PUMP_BANK_PARA_TESTNAME[124][ReadMode][2][post][VNM] = "MainBG_NM_Test";
   PUMP_BANK_PARA_TESTNAME[124][ReadMode][6][post][VNM] = "MainBG_TADC_NM_Test";
   
   PUMP_BANK_PARA_TESTNAME[125][ReadMode][1][post][VNM] = "MainIcmp10_NM_Test";
   PUMP_BANK_PARA_TESTNAME[126][ReadMode][1][post][VNM] = "MainIref_NM_Test";
   

    /*--- BANK ---*/
   PUMP_BANK_PARA_TESTNAME[25][ReadMode][2][post][VNME] = "Iref_Rd_NME_Test";
   PUMP_BANK_PARA_TESTNAME[25][PvfyMode][2][post][VNME] = "Iref_Pv_NME_Test";
   PUMP_BANK_PARA_TESTNAME[25][EvfyMode][2][post][VNME] = "Iref_Ev_NME_Test";
   PUMP_BANK_PARA_TESTNAME[25][CvfyMode][2][post][VNME] = "Iref_Cv_NME_Test";
   PUMP_BANK_PARA_TESTNAME[25][ReadMode][2][post][VNMO] = "Iref_Rd_NMO_Test";
   PUMP_BANK_PARA_TESTNAME[25][PvfyMode][2][post][VNMO] = "Iref_Pv_NMO_Test";
   PUMP_BANK_PARA_TESTNAME[25][EvfyMode][2][post][VNMO] = "Iref_Ev_NMO_Test";
   PUMP_BANK_PARA_TESTNAME[25][CvfyMode][2][post][VNMO] = "Iref_Cv_NMO_Test";

   PUMP_BANK_PARA_TESTNAME[26][ReadMode][2][post][VNME] = "Iref_RM0_NME_Test";
   PUMP_BANK_PARA_TESTNAME[26][ReadMode][2][post][VNMO] = "Iref_RM0_NMO_Test";

   PUMP_BANK_PARA_TESTNAME[27][ReadMode][2][post][VNME] = "Iref_RM1_NME_Test";
   PUMP_BANK_PARA_TESTNAME[27][ReadMode][2][post][VNMO] = "Iref_RM1_NMO_Test";

   PUMP_BANK_PARA_TESTNAME[40][ReadMode][2][post][VNME] = "IPMOS_Rd_NME_Test";
   PUMP_BANK_PARA_TESTNAME[40][PvfyMode][2][post][VNME] = "IPMOS_Pv_NME_Test";
   PUMP_BANK_PARA_TESTNAME[40][EvfyMode][2][post][VNME] = "IPMOS_Ev_NME_Test";
   PUMP_BANK_PARA_TESTNAME[40][CvfyMode][2][post][VNME] = "IPMOS_Cv_NME_Test";
   PUMP_BANK_PARA_TESTNAME[40][ReadMode][2][post][VNMO] = "IPMOS_Rd_NMO_Test";
   PUMP_BANK_PARA_TESTNAME[40][PvfyMode][2][post][VNMO] = "IPMOS_Pv_NMO_Test";
   PUMP_BANK_PARA_TESTNAME[40][EvfyMode][2][post][VNMO] = "IPMOS_Ev_NMO_Test";
   PUMP_BANK_PARA_TESTNAME[40][CvfyMode][2][post][VNMO] = "IPMOS_Cv_NMO_Test";

   PUMP_BANK_PARA_TESTNAME[69][ProgMode][2][post][VMNE] = "IPROG_DRV_MNE_Test";
   PUMP_BANK_PARA_TESTNAME[69][ProgMode][2][post][VMNO] = "IPROG_DRV_MNO_Test";
   PUMP_BANK_PARA_TESTNAME[69][ProgMode][2][post][VMXE] = "IPROG_DRV_MXE_Test";
   PUMP_BANK_PARA_TESTNAME[69][ProgMode][2][post][VMXO] = "IPROG_DRV_MXO_Test";

   PUMP_BANK_PARA_TESTNAME[70][ReadMode][2][post][VMNE] = "ISA_LD_MNE_Test";  /*ISA_LD_Test*/
   PUMP_BANK_PARA_TESTNAME[70][ReadMode][2][post][VMNO] = "ISA_LD_MNO_Test";

   PUMP_BANK_PARA_TESTNAME[71][ReadMode][2][post][VMNE] = "ISA_NLD_MNE_Test";
   PUMP_BANK_PARA_TESTNAME[71][ReadMode][2][post][VMNO] = "ISA_NLD_MNO_Test";

   PUMP_BANK_PARA_TESTNAME[83][ProgMode][2][post][VMN]  = "VReadBUF_Pg_MN_Test";
   PUMP_BANK_PARA_TESTNAME[83][PvfyMode][2][post][VMX]  = "VReadBUF_Pg_MX_Test";  /*use pvfymode for vmax corner*/

    /*tw string - use this if more than one tpad measurement*/
   BANK_PARA_TWSTR[25][ReadMode][2][pre ][VNM] = "Bank_Iref_Rd_PreNM";
   BANK_PARA_TWSTR[25][ReadMode][2][post][VNM] = "Bank_Iref_Rd_NM";
   

    /*==== PARAMETRIC ENABLE CONTROL ====*/
    /*index=[tcr#,modetype,tpad#]*/

    /*+++ tcr 0 - TP1/TP2 Leakage +++*/
   PUMP_BANK_PARA_ENABLE[0][ReadMode][1] = true;
   PUMP_BANK_PARA_ENABLE[0][ReadMode][2] = true;
   PUMP_BANK_PARA_ENABLE[0][ProgMode][1] = true;
   PUMP_BANK_PARA_ENABLE[0][ProgMode][2] = true;
    /*+++ tcr 25 - bank iref +++*/
   PUMP_BANK_PARA_ENABLE[25][ReadMode][2] = true;
   PUMP_BANK_PARA_ENABLE[25][PvfyMode][2] = true;
   PUMP_BANK_PARA_ENABLE[25][EvfyMode][2] = true;
   PUMP_BANK_PARA_ENABLE[25][CvfyMode][2] = true;
    /*+++ tcr 26 - bank irefM0 +++*/
   PUMP_BANK_PARA_ENABLE[26][ReadMode][2] = true;
    /*+++ tcr 27 - bank irefM1 +++*/
   PUMP_BANK_PARA_ENABLE[27][ReadMode][2] = true;
    /*+++ tcr 40 - bank PMOS iref +++*/
   PUMP_BANK_PARA_ENABLE[40][ReadMode][2] = true;
   PUMP_BANK_PARA_ENABLE[40][PvfyMode][2] = true;
   PUMP_BANK_PARA_ENABLE[40][EvfyMode][2] = true;
   PUMP_BANK_PARA_ENABLE[40][CvfyMode][2] = true;
    /*++++ TCR 69 Meas IProg WL Driver ++++*/
#if $FL_USE_AUTO_FLOW  
   PUMP_BANK_PARA_ENABLE[69][ProgMode][2] = true;
#else
   PUMP_BANK_PARA_ENABLE[69][ProgMode][2] = false;
#endif
    /*++++ TCR 70 SA Iref w/ local BL load ++++*/
#if $FL_USE_AUTO_FLOW  
   PUMP_BANK_PARA_ENABLE[70][ReadMode][2] = true;
#else
   PUMP_BANK_PARA_ENABLE[70][ReadMode][2] = false;
#endif
    /*++++ TCR  71 SA Iref w/o local BL load ++++*/
#if $FL_USE_AUTO_FLOW  
   PUMP_BANK_PARA_ENABLE[71][ReadMode][2] = true;
#else
   PUMP_BANK_PARA_ENABLE[71][ReadMode][2] = false;
#endif
    /*+++ tcr 83 - VReadBUF +++*/
#if $FL_USE_AUTO_FLOW  
   PUMP_BANK_PARA_ENABLE[83][ProgMode][2] = true;
   PUMP_BANK_PARA_ENABLE[83][PvfyMode][2] = true;
#else
   PUMP_BANK_PARA_ENABLE[83][ProgMode][2] = false;
   PUMP_BANK_PARA_ENABLE[83][PvfyMode][2] = false;
#endif   
    /*+++ tcr 115 - VHV, VHVREGREF, VHALFREF, VHV_TADC +++*/
   PUMP_BANK_PARA_ENABLE[115][ProgMode][1] = true;
   PUMP_BANK_PARA_ENABLE[115][ProgMode][2] = false ; /*true*/
   PUMP_BANK_PARA_ENABLE[115][ProgMode][3] = false;  /*non-func in tv1*/
   PUMP_BANK_PARA_ENABLE[115][ProgMode][6] = false; 
   PUMP_BANK_PARA_ENABLE[115][PvfyMode][1] = true;
   PUMP_BANK_PARA_ENABLE[115][PvfyMode][2] = false ; /*true*/
   PUMP_BANK_PARA_ENABLE[115][PvfyMode][3] = false;  /*non-func in tv1*/
   PUMP_BANK_PARA_ENABLE[115][PvfyMode][6] = false; 
   PUMP_BANK_PARA_ENABLE[115][ErsMode ][1] = true;
   PUMP_BANK_PARA_ENABLE[115][ErsMode ][2] = false ; /*true*/
   PUMP_BANK_PARA_ENABLE[115][ErsMode ][3] = false;  /*non-func in tv1*/
   PUMP_BANK_PARA_ENABLE[115][ErsMode ][6] = false;
    /*+++ tcr 116 - VSL, VSLNREF, VSL_TADC +++*/
   PUMP_BANK_PARA_ENABLE[116][ProgMode][2] = true;
   PUMP_BANK_PARA_ENABLE[116][ProgMode][3] = false;  /*non-func in tv1*/
   PUMP_BANK_PARA_ENABLE[116][ProgMode][6] = false;
   PUMP_BANK_PARA_ENABLE[116][PvfyMode][2] = true;
   PUMP_BANK_PARA_ENABLE[116][PvfyMode][3] = false;  /*non-func in tv1*/
   PUMP_BANK_PARA_ENABLE[116][PvfyMode][6] = false;
    /*+++ tcr 117 - VRead, VReadNREF, VRead_TADC +++*/
   PUMP_BANK_PARA_ENABLE[117][ReadMode][1] = true;
   PUMP_BANK_PARA_ENABLE[117][ReadMode][3] = false;  /*non-func in tv1*/
   PUMP_BANK_PARA_ENABLE[117][ReadMode][6] = false;
   PUMP_BANK_PARA_ENABLE[117][EvfyMode][1] = true;
   PUMP_BANK_PARA_ENABLE[117][EvfyMode][3] = false;  /*non-func in tv1*/
   PUMP_BANK_PARA_ENABLE[117][EvfyMode][6] = false;
   PUMP_BANK_PARA_ENABLE[117][CvfyMode][1] = true;
   PUMP_BANK_PARA_ENABLE[117][CvfyMode][3] = false;  /*non-func in tv1*/
   PUMP_BANK_PARA_ENABLE[117][CvfyMode][6] = false;
    /*+++ tcr 118 - VSA5, VSA5PUMP, VSA5NREF, VSA5_TADC +++*/
   PUMP_BANK_PARA_ENABLE[118][ReadMode][1] = true;
   PUMP_BANK_PARA_ENABLE[118][ReadMode][2] = false;
   PUMP_BANK_PARA_ENABLE[118][ReadMode][3] = false;  /*non-func in tv1*/
   PUMP_BANK_PARA_ENABLE[118][ReadMode][6] = false;
    /*+++ tcr 119 - VWL, VWLNREF, VWL_TADC +++*/
   PUMP_BANK_PARA_ENABLE[119][ReadMode][1] = true;
   PUMP_BANK_PARA_ENABLE[119][ReadMode][3] = false;  /*non-func in tv1*/
   PUMP_BANK_PARA_ENABLE[119][ReadMode][6] = false;
    /*+++ tcr 120 - VCG2P5, VCG2P5NREF, VCG2P5_TADC +++*/
   PUMP_BANK_PARA_ENABLE[120][ReadMode][1] = true;
   PUMP_BANK_PARA_ENABLE[120][ReadMode][3] = false;  /*non-func in tv1*/
   PUMP_BANK_PARA_ENABLE[120][ReadMode][6] = false;
    /*+++ tcr 121 - VINH, VINHNREF, VINH_TADC +++*/
   PUMP_BANK_PARA_ENABLE[121][ReadMode][1] = true;
   PUMP_BANK_PARA_ENABLE[121][ReadMode][3] = false;  /*non-func in tv1*/
   PUMP_BANK_PARA_ENABLE[121][ReadMode][6] = false;
   PUMP_BANK_PARA_ENABLE[121][EvfyMode][1] = true;
   PUMP_BANK_PARA_ENABLE[121][EvfyMode][3] = false;  /*non-func in tv1*/
   PUMP_BANK_PARA_ENABLE[121][EvfyMode][6] = false;
   PUMP_BANK_PARA_ENABLE[121][CvfyMode][1] = true;
   PUMP_BANK_PARA_ENABLE[121][CvfyMode][3] = false;  /*non-func in tv1*/
   PUMP_BANK_PARA_ENABLE[121][CvfyMode][6] = false;
    /*+++ tcr 122 - VHV2XPUMP, VHV2XPUMP_TADC +++*/
#if $FL_USE_AUTO_FLOW  
   PUMP_BANK_PARA_ENABLE[122][ProgMode][1] = true;
   PUMP_BANK_PARA_ENABLE[122][ProgMode][6] = false;
#else
   PUMP_BANK_PARA_ENABLE[122][ProgMode][1] = false;
   PUMP_BANK_PARA_ENABLE[122][ProgMode][6] = false;
#endif   
    /*+++ tcr 124 - VBGAP, VBGAP_TADC +++*/
   PUMP_BANK_PARA_ENABLE[124][ReadMode][2] = true;
   PUMP_BANK_PARA_ENABLE[124][ReadMode][6] = false;
    /*+++ tcr 125 - Icmp10 +++*/
   PUMP_BANK_PARA_ENABLE[125][ReadMode][1] = true;  /*icmp10*/
    /*for trimming*/
   PUMP_BANK_PARA_ENABLE[125][ProgMode][1] = true;
    /*+++ tcr 126 - Iref +++*/
   PUMP_BANK_PARA_ENABLE[126][ReadMode][1] = true;  /*iref*/
    /*for trimming*/
   PUMP_BANK_PARA_ENABLE[126][ProgMode][1] = true;


    /*==== BINOUT CONTROL ====*/
    /*index=[tcr #,modetype,tp#]*/

    /*+++ tcr 0 - TP1/TP2 Leakage +++*/
   PUMP_BANK_PARA_BINOUT[0][ReadMode][1]  =  true; /*false*/
   PUMP_BANK_PARA_BINOUT[0][ReadMode][2]  =  true; /*false*/
   PUMP_BANK_PARA_BINOUT[0][ProgMode][1]  =  true; /*false*/
   PUMP_BANK_PARA_BINOUT[0][ProgMode][2]  =  true; /*false*/
    /*++++ TCR 7,8,9 Bank CG Stress -- CG Leakage test ++++*/
   PUMP_BANK_PARA_BINOUT[7][ProgMode][1]  =  true; /*false*/
   PUMP_BANK_PARA_BINOUT[8][ProgMode][1]  =  true; /*false*/
   PUMP_BANK_PARA_BINOUT[9][ProgMode][1]  =  true; /*false*/
   PUMP_BANK_PARA_BINOUT[7][PvfyMode][1]  =  true; /*false*/
    /*++++ TCR 13 Bank EG/CS Stress -- EG/CS Leakage test ++++*/
   PUMP_BANK_PARA_BINOUT[13][ProgMode][1]  =  true; /*false*/
    /*++++ TCR 15 Bank BLS All -- BL Leakage test ++++*/
   PUMP_BANK_PARA_BINOUT[15][ProgMode][1]  =  true; /*false*/
    /*++++ TCR 16 Bank BLS Even -- BL Leakage test ++++*/
   PUMP_BANK_PARA_BINOUT[16][ProgMode][1]  =  true; /*false*/
    /*++++ TCR 17 Bank BLS Odd -- BL Leakage test ++++*/
   PUMP_BANK_PARA_BINOUT[17][ProgMode][1]  =  true; /*false*/
    /*++++ TCR 23 Bank EG Stress -- EG Leakage test ++++*/
   PUMP_BANK_PARA_BINOUT[23][ProgMode][1]  =  true; /*false*/
    /*+++ tcr 25 - bank iref +++*/
   PUMP_BANK_PARA_BINOUT[25][ReadMode][2]  = true;
   PUMP_BANK_PARA_BINOUT[25][PvfyMode][2]  = true; 
   PUMP_BANK_PARA_BINOUT[25][EvfyMode][2]  = true;
   PUMP_BANK_PARA_BINOUT[25][CvfyMode][2]  = true;
    /*+++ tcr 26 - bank irefM0 +++*/
   PUMP_BANK_PARA_BINOUT[26][ReadMode][2]  = true;
    /*+++ tcr 27 - bank irefM1 +++*/
   PUMP_BANK_PARA_BINOUT[27][ReadMode][2]  = true;
    /*+++ tcr 40 - bank PMOS iref +++*/
   PUMP_BANK_PARA_BINOUT[40][ReadMode][2]  = true;
   PUMP_BANK_PARA_BINOUT[40][PvfyMode][2]  = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[40][EvfyMode][2]  = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[40][CvfyMode][2]  = false ; /*true*/
    /*++++ TCR 58 Bank WLS All -- WL Leakage test ++++*/
   PUMP_BANK_PARA_BINOUT[58][ProgMode][1]  =  true; /*false*/
    /*++++ TCR  59 Bank WLS Odd -- WL Leakage test ++++*/
   PUMP_BANK_PARA_BINOUT[59][ProgMode][1]  =  true; /*false*/
    /*++++ TCR 60 Bank WLS Even -- WL Leakage test ++++*/
   PUMP_BANK_PARA_BINOUT[60][ProgMode][1]  =  true; /*false*/
    /*++++ TCR  69 Meas IProg WL Driver ++++*/
   PUMP_BANK_PARA_BINOUT[69][ProgMode][2]  =  true; /*false*/
    /*++++ TCR 70 SA Iref w/ local BL load ++++*/
   PUMP_BANK_PARA_BINOUT[70][ReadMode][2]  =  true; /*false*/
    /*++++ TCR 71 SA Iref w/o local BL load ++++*/
   PUMP_BANK_PARA_BINOUT[71][ReadMode][2]  =  true; /*false*/
    /*+++ tcr 83 - VReadBUF +++*/
   PUMP_BANK_PARA_BINOUT[83][ProgMode][2]  = true;
   PUMP_BANK_PARA_BINOUT[83][PvfyMode][2]  = true;
       /*+++ tcr 115 - VHV, VHVREGREF, VHALFREF, VHV_TADC +++*/
   PUMP_BANK_PARA_BINOUT[115][ProgMode][1] = true;
   PUMP_BANK_PARA_BINOUT[115][ProgMode][2] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[115][ProgMode][3] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[115][ProgMode][6] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[115][PvfyMode][1] = true;
   PUMP_BANK_PARA_BINOUT[115][PvfyMode][2] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[115][PvfyMode][3] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[115][PvfyMode][6] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[115][ErsMode ][1] = true;
   PUMP_BANK_PARA_BINOUT[115][ErsMode ][2] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[115][ErsMode ][3] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[115][ErsMode ][6] = false ; /*true*/
    /*+++ tcr 116 - VSL, VSLNREF, VSL_TADC +++*/
   PUMP_BANK_PARA_BINOUT[116][ProgMode][2] = true;
   PUMP_BANK_PARA_BINOUT[116][ProgMode][3] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[116][ProgMode][6] = true;
   PUMP_BANK_PARA_BINOUT[116][PvfyMode][2] = true;
   PUMP_BANK_PARA_BINOUT[116][PvfyMode][3] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[116][PvfyMode][6] = true;
    /*+++ tcr 117 - VRead, VReadNREF, VRead_TADC +++*/
   PUMP_BANK_PARA_BINOUT[117][ReadMode][1] = true;
   PUMP_BANK_PARA_BINOUT[117][ReadMode][3] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[117][ReadMode][6] = false;
   PUMP_BANK_PARA_BINOUT[117][EvfyMode][1] = true;
   PUMP_BANK_PARA_BINOUT[117][EvfyMode][3] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[117][EvfyMode][6] = false;
   PUMP_BANK_PARA_BINOUT[117][CvfyMode][1] = true;
   PUMP_BANK_PARA_BINOUT[117][CvfyMode][3] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[117][CvfyMode][6] = false;
    /*+++ tcr 118 - VSA5, VSA5PUMP, VSA5NREF, VSA5_TADC +++*/
   PUMP_BANK_PARA_BINOUT[118][ReadMode][1] = true;
   PUMP_BANK_PARA_BINOUT[118][ReadMode][2] = false;
   PUMP_BANK_PARA_BINOUT[118][ReadMode][3] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[118][ReadMode][6] = true;
    /*+++ tcr 119 - VWL, VWLNREF, VWL_TADC +++*/
   PUMP_BANK_PARA_BINOUT[119][ReadMode][1] = true;
   PUMP_BANK_PARA_BINOUT[119][ReadMode][3] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[119][ReadMode][6] = true;
    /*+++ tcr 120 - VCG2P5, VCG2P5NREF, VCG2P5_TADC +++*/
   PUMP_BANK_PARA_BINOUT[120][ReadMode][1] = true;
   PUMP_BANK_PARA_BINOUT[120][ReadMode][3] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[120][ReadMode][6] = true;
    /*+++ tcr 121 - VINH, VINHNREF, VINH_TADC +++*/
   PUMP_BANK_PARA_BINOUT[121][ReadMode][1] = true;
   PUMP_BANK_PARA_BINOUT[121][ReadMode][3] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[121][ReadMode][6] = false;
   PUMP_BANK_PARA_BINOUT[121][EvfyMode][1] = true;
   PUMP_BANK_PARA_BINOUT[121][EvfyMode][3] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[121][EvfyMode][6] = false;
   PUMP_BANK_PARA_BINOUT[121][CvfyMode][1] = true;
   PUMP_BANK_PARA_BINOUT[121][CvfyMode][3] = false ; /*true*/
   PUMP_BANK_PARA_BINOUT[121][CvfyMode][6] = false;
    /*+++ tcr 122 - VHV2XPUMP, VHV2XPUMP_TADC +++*/
   PUMP_BANK_PARA_BINOUT[122][ProgMode][1] = false;
   PUMP_BANK_PARA_BINOUT[122][ProgMode][6] = false;
    /*+++ tcr 124 - VBGAP, VBGAP_TADC +++*/
   PUMP_BANK_PARA_BINOUT[124][ReadMode][2] = true;
    /*+++ tcr 125 - Icmp10 +++*/
   PUMP_BANK_PARA_BINOUT[125][ReadMode][1] = true;
   PUMP_BANK_PARA_BINOUT[125][ProgMode][1] = true;
    /*+++ tcr 126 - Icmp10 +++*/
   PUMP_BANK_PARA_BINOUT[126][ReadMode][1] = true;
   PUMP_BANK_PARA_BINOUT[126][ProgMode][1] = true;




    /*==== LIMITS, CONDITIONS ====*/

    /*++++ TCR 0 - TP1/TP2 Leakage ++++*/
   TP1_LEAK_VLO = 0V;
   TP1_LEAK_VHI = 3.6V;
   TP1_LEAK_VLO_ULim =  1uA;
   TP1_LEAK_VLO_LLim = -100nA;
   TP1_LEAK_VHI_ULim =  1uA;
   TP1_LEAK_VHI_LLim = -100nA;

   TP2_LEAK_VLO = 0V;
   TP2_LEAK_VHI = 3.6V;
   TP2_LEAK_VLO_ULim =  1uA;
   TP2_LEAK_VLO_LLim = -100nA;
   TP2_LEAK_VHI_ULim =  1uA;
   TP2_LEAK_VHI_LLim = -100nA;

   TP1TP2_DELTA_LLIM = -200nA;
   TP1TP2_DELTA_ULIM = 200nA;

    /*++++ TCR 7  Bank CGS All -- CG Leakage test ++++*/
    /*++++ TCR 8  Bank CGS Odd -- CG Leakage test ++++*/
    /*++++ TCR 9  Bank CGS Even -- CG Leakage test ++++*/
    /*tp1->CG, WL/BL/CS/EG=gnd*/
   CGS_VCG_LEAK_Prog         = 11.3V;
   CGS_VCG_LEAK_Prog_Target  = 35uA;
   CGS_VCG_LEAK_Prog_ULim    = CGS_VCG_LEAK_Prog_Target+(CGS_VCG_LEAK_Prog_Target*0.05);
   CGS_VCG_LEAK_Prog_LLim    = -0.10*CGS_VCG_LEAK_Prog_ULim;
   CGS_VCG_LEAK_TStress_Prog = 100ms;
    /*use pvfy to select different conditions*/
   CGEG_VCG_LEAK_Pvfy         = 13.0V;
   CGEG_VCG_LEAK_Pvfy_Target  = 100mA;
   CGEG_VCG_LEAK_Pvfy_ULim    = CGEG_VCG_LEAK_Pvfy_Target;
   CGEG_VCG_LEAK_Pvfy_LLim    = -0.10*CGEG_VCG_LEAK_Pvfy_ULim;
   CGEG_VCG_LEAK_TStress_Pvfy = 1s;
   CGEG_VCG_LEAK_Pvfy_Delta   = 2uA;  /*pre/post delta*/

    /*++++ TCR 13 Bank EG/CS stress-- EG/CS Leakage test ++++*/
    /*tp2->EG/CS, WL/BL/CG=gnd*/
   EGCSS_VEGCS_LEAK_Prog         = 4.91V;
   EGCSS_VEGCS_LEAK_Prog_Target  = 21uA;
   EGCSS_VEGCS_LEAK_Prog_ULim    = EGCSS_VEGCS_LEAK_Prog_Target+(EGCSS_VEGCS_LEAK_Prog_Target*0.00);
   EGCSS_VEGCS_LEAK_Prog_LLim    = -1*(EGCSS_VEGCS_LEAK_Prog_ULim*0.10);
   EGCSS_VEGCS_LEAK_TStress_Prog = 100ms;

    /*++++ TCR 15 Bank BLS All -- BL Leakage test ++++*/
    /*++++ TCR 16 Bank BLS Even -- BL Leakage test ++++*/
    /*++++ TCR 17 Bank BLS Odd -- BL Leakage test ++++*/
    /*tp1->BL, WL/CG/CS/EG=gnd*/
   BLS_VBL_LEAK_Prog         = 3.3V;
   BLS_VBL_LEAK_Prog_Target  = 4uA;
   BLS_VBL_LEAK_Prog_ULim    = BLS_VBL_LEAK_Prog_Target+(BLS_VBL_LEAK_Prog_Target*0.0);
   BLS_VBL_LEAK_Prog_LLim    = -1*(BLS_VBL_LEAK_Prog_ULim*0.10);
   BLS_VBL_LEAK_TStress_Prog = 100ms;
    /*for retest*/
   BLS_VBL_LEAK_Prog_ULim_Retest  = 20uA;
   BLS_VBL_LEAK_Prog_LLim_Retest  = -1*(BLS_VBL_LEAK_Prog_ULim*0.10);

    /*++++ TCR 23 Bank EG stress-- EG Leakage test ++++*/
    /*tp1->EG, WL/BL/CG/CS=gnd*/
   EGS_VEG_LEAK_Ers         = 13.1V;
   EGS_VEG_LEAK_Ers_Target  = 20uA;
   EGS_VEG_LEAK_Ers_ULim    = EGS_VEG_LEAK_Ers_Target+(EGS_VEG_LEAK_Ers_Target*0.0);
   EGS_VEG_LEAK_Ers_LLim    = -1*(EGS_VEG_LEAK_Ers_ULim*0.1);
   EGS_VEG_LEAK_TStress_Ers = 100ms;

    /*EGFG1 stress cond. use tcr23*/
   EGFG_VEG_Read            = 5.0V;
   EGFG_VEG_IMAX_Read       = 100mA;
   EGFG_VEG_TStress_Read    = 1s;

    /*EGFG2 stress cond. use tcr23*/
   EGFG_VEG_Prog            = 4.5V;
   EGFG_VEG_IMAX_Prog       = 100mA;
   EGFG_VEG_TStress_Prog    = 1s;

    /*EGFG3 stress cond. use tcr23*/
   EGFG_VEG_Pvfy            = 4.0V;
   EGFG_VEG_IMAX_Pvfy       = 100mA;
   EGFG_VEG_TStress_Pvfy    = 1s;

    /*EGFG4 stress cond. use tcr23*/
   EGFG_VEG_Evfy            = 3.5V;
   EGFG_VEG_IMAX_Evfy       = 100mA;
   EGFG_VEG_TStress_Evfy    = 1s;

    /*EGFG5 stress cond. use tcr23*/
   EGFG_VEG_Cvfy            = 3.0V;
   EGFG_VEG_IMAX_Cvfy       = 100mA;
   EGFG_VEG_TStress_Cvfy    = 1s;


    /*++++ TCR 25 (Bank) IREF: TP1=CG, TP2=Iref ++++*/
   Bank_Iref_VCG_Read = 1.825V;
   Bank_Iref_VBL_Read = 0.6V;
   Bank_Iref_VCG_Pvfy = 1.825V;
   Bank_Iref_VBL_Pvfy = 0.6V;
   Bank_Iref_VCG_Evfy = 1.825V;
   Bank_Iref_VBL_Evfy = 0.6V;
   Bank_Iref_VCG_Cvfy = 1.825V;
   Bank_Iref_VBL_Cvfy = 0.6V;

   if(GL_BANKTYPE==FLESBANK)  
   {
       /*+++++ FLES ++++*/
      if(GL_DO_REFARR_ERS_ADAPTIVE)  
      {
         IrefRd_Trim_Target = 15.93uA;
         IrefEv_Trim_Target = 28.67uA;
      }
      else
      {
         IrefRd_Trim_Target = 15.5uA;
         IrefEv_Trim_Target = 29.14uA;
      } 
      IrefRd_Trim_Toler  = 0.035;  /*3.5%*/
      IrefRd_Trim_LLim   = IrefRd_Trim_Target-(IrefRd_Trim_Target*IrefRd_Trim_Toler);
      IrefRd_Trim_ULim   = IrefRd_Trim_Target+(IrefRd_Trim_Target*IrefRd_Trim_Toler);
      IrefEv_Trim_Toler  = 0.05;  /*5%*/
      IrefEv_Trim_LLim   = IrefEv_Trim_Target-(IrefEv_Trim_Target*IrefEv_Trim_Toler);
      IrefEv_Trim_ULim   = IrefEv_Trim_Target+(IrefEv_Trim_Target*IrefEv_Trim_Toler);
      
      if(GL_DO_IREF_PMOS_TRIM)  
      {
         switch(SelectedTITestType) {
           case MP1 :  
                    if(GL_DO_REFARR_ERS_ADAPTIVE)  
                    { 
                       Bank_Iref_Read_Target = 15.93uA;
                       Bank_Iref_Pvfy_Target = 11.62uA;
                       Bank_Iref_Evfy_Target = 28.67uA;
                       Bank_Iref_Cvfy_Target = 3.7uA;
                       Bank_Iref_Evfy_Target_EMU = 25.29uA;
                    } 
                    else
                    { 
                       Bank_Iref_Read_Target = 15.5uA;
                       Bank_Iref_Pvfy_Target = 11.749uA;
                       Bank_Iref_Evfy_Target = 29.14uA;
                       Bank_Iref_Cvfy_Target = 3.7uA;
                       Bank_Iref_Evfy_Target_EMU = 26.98uA;
                    }                        
                    Bank_Iref_Read_LLim   = Bank_Iref_Read_Target-(Bank_Iref_Read_Target*0.035);
                    Bank_Iref_Read_ULim   = Bank_Iref_Read_Target+(Bank_Iref_Read_Target*0.035);
                    Bank_Iref_Pvfy_LLim   = Bank_Iref_Pvfy_Target-(Bank_Iref_Pvfy_Target*0.06);
                    Bank_Iref_Pvfy_ULim   = Bank_Iref_Pvfy_Target+(Bank_Iref_Pvfy_Target*0.06);
                    Bank_Iref_Evfy_LLim   = Bank_Iref_Evfy_Target-(Bank_Iref_Evfy_Target*0.05);
                    Bank_Iref_Evfy_ULim   = Bank_Iref_Evfy_Target+(Bank_Iref_Evfy_Target*0.05);
                    Bank_Iref_Cvfy_LLim   = 2uA;
                    Bank_Iref_Cvfy_ULim   = 10uA;
                    Bank_Iref_Evfy_LLim_EMU   = Bank_Iref_Evfy_Target_EMU-(Bank_Iref_Evfy_Target_EMU*0.05);
                    Bank_Iref_Evfy_ULim_EMU   = Bank_Iref_Evfy_Target_EMU+(Bank_Iref_Evfy_Target_EMU*0.05);
                  break; 
           case  MP2: case  FT2 :   
              if(GL_DO_REFARR_ERS_ADAPTIVE)  
              { 
                 Bank_Iref_Read_Target = 15.55uA;
                 Bank_Iref_Pvfy_Target = 11.28uA;
                 Bank_Iref_Evfy_Target = 28.06uA;
                 Bank_Iref_Cvfy_Target = 3.7uA;
                 Bank_Iref_Evfy_Target_EMU = 24.75uA;
              }
              else
              { 
                 Bank_Iref_Read_Target = 15.13uA;
                 Bank_Iref_Pvfy_Target = 11.41uA;
                 Bank_Iref_Evfy_Target = 28.52uA;
                 Bank_Iref_Cvfy_Target = 3.7uA;
                 Bank_Iref_Evfy_Target_EMU = 26.41uA;
              } 
              Bank_Iref_Read_LLim   = Bank_Iref_Read_Target-(Bank_Iref_Read_Target*0.06);
              Bank_Iref_Read_ULim   = Bank_Iref_Read_Target+(Bank_Iref_Read_Target*0.06);
              Bank_Iref_Pvfy_LLim   = Bank_Iref_Pvfy_Target-(Bank_Iref_Pvfy_Target*0.07);
              Bank_Iref_Pvfy_ULim   = Bank_Iref_Pvfy_Target+(Bank_Iref_Pvfy_Target*0.07);
              Bank_Iref_Evfy_LLim   = Bank_Iref_Evfy_Target-(Bank_Iref_Evfy_Target*0.07);
              Bank_Iref_Evfy_ULim   = Bank_Iref_Evfy_Target+(Bank_Iref_Evfy_Target*0.07);
              Bank_Iref_Cvfy_LLim   = 2uA;
              Bank_Iref_Cvfy_ULim   = 10uA;
              Bank_Iref_Evfy_LLim_EMU   = Bank_Iref_Evfy_Target_EMU-(Bank_Iref_Evfy_Target_EMU*0.07);
              Bank_Iref_Evfy_ULim_EMU   = Bank_Iref_Evfy_Target_EMU+(Bank_Iref_Evfy_Target_EMU*0.07);
           default:
              if(GL_DO_REFARR_ERS_ADAPTIVE)  
              {
                 Bank_Iref_Read_Target = 13.25uA;
                 Bank_Iref_Pvfy_Target = 9.7uA;
                 Bank_Iref_Evfy_Target = 23.6uA;
                 Bank_Iref_Cvfy_Target = 3.7uA;
                 Bank_Iref_Evfy_Target_EMU = 21uA;
              }
              else
              {
                 Bank_Iref_Read_Target = 12.9uA;
                 Bank_Iref_Pvfy_Target = 9.8uA;
                 Bank_Iref_Evfy_Target = 24uA;
                 Bank_Iref_Cvfy_Target = 3.7uA;
                 Bank_Iref_Evfy_Target_EMU = 22.4uA;
              } 
               if (SelectedTITestType == MP3)  
               {
                   Bank_Iref_Read_LLim   = Bank_Iref_Read_Target-(Bank_Iref_Read_Target*0.15);
                   Bank_Iref_Read_ULim   = Bank_Iref_Read_Target+(Bank_Iref_Read_Target*0.20);
                   Bank_Iref_Pvfy_LLim   = Bank_Iref_Pvfy_Target-(Bank_Iref_Pvfy_Target*0.15);
                   Bank_Iref_Pvfy_ULim   = Bank_Iref_Pvfy_Target+(Bank_Iref_Pvfy_Target*0.20);
                   Bank_Iref_Evfy_LLim   = Bank_Iref_Evfy_Target-(Bank_Iref_Evfy_Target*0.15);
                   Bank_Iref_Evfy_ULim   = Bank_Iref_Evfy_Target+(Bank_Iref_Evfy_Target*0.20);
                   Bank_Iref_Cvfy_LLim   = 2uA;
                   Bank_Iref_Cvfy_ULim   = 10uA;
                   Bank_Iref_Evfy_LLim_EMU   = Bank_Iref_Evfy_Target_EMU-(Bank_Iref_Evfy_Target_EMU*0.15);
                   Bank_Iref_Evfy_ULim_EMU   = Bank_Iref_Evfy_Target_EMU+(Bank_Iref_Evfy_Target_EMU*0.20);
               }
               else 
               {
                   Bank_Iref_Read_LLim   = Bank_Iref_Read_Target-(Bank_Iref_Read_Target*0.07);
                   Bank_Iref_Read_ULim   = Bank_Iref_Read_Target+(Bank_Iref_Read_Target*0.07);
                   Bank_Iref_Pvfy_LLim   = Bank_Iref_Pvfy_Target-(Bank_Iref_Pvfy_Target*0.08);
                   Bank_Iref_Pvfy_ULim   = Bank_Iref_Pvfy_Target+(Bank_Iref_Pvfy_Target*0.08);
                   Bank_Iref_Evfy_LLim   = Bank_Iref_Evfy_Target-(Bank_Iref_Evfy_Target*0.08);
                   Bank_Iref_Evfy_ULim   = Bank_Iref_Evfy_Target+(Bank_Iref_Evfy_Target*0.08);
                   Bank_Iref_Cvfy_LLim   = 2uA;
                   Bank_Iref_Cvfy_ULim   = 10uA;
                   Bank_Iref_Evfy_LLim_EMU   = Bank_Iref_Evfy_Target_EMU-(Bank_Iref_Evfy_Target_EMU*0.08);
                   Bank_Iref_Evfy_ULim_EMU   = Bank_Iref_Evfy_Target_EMU+(Bank_Iref_Evfy_Target_EMU*0.08);
               }  
         }   /* case */
      }
      else
      {
          Bank_Iref_Read_Target = 13.75uA;
          Bank_Iref_Read_LLim   = Bank_Iref_Read_Target-(Bank_Iref_Read_Target*0.20);
          Bank_Iref_Read_ULim   = Bank_Iref_Read_Target+(Bank_Iref_Read_Target*0.20);
          Bank_Iref_Pvfy_Target = 11uA;
          Bank_Iref_Pvfy_LLim   = Bank_Iref_Pvfy_Target-(Bank_Iref_Pvfy_Target*0.20);
          Bank_Iref_Pvfy_ULim   = Bank_Iref_Pvfy_Target+(Bank_Iref_Pvfy_Target*0.20);
          Bank_Iref_Evfy_Target = 22uA;
          Bank_Iref_Evfy_LLim   = Bank_Iref_Evfy_Target-(Bank_Iref_Evfy_Target*0.20);
          Bank_Iref_Evfy_ULim   = Bank_Iref_Evfy_Target+(Bank_Iref_Evfy_Target*0.20);
          Bank_Iref_Cvfy_Target = 3.7uA;
          Bank_Iref_Cvfy_LLim   = Bank_Iref_Cvfy_Target-(Bank_Iref_Cvfy_Target*0.30);
          Bank_Iref_Cvfy_ULim   = Bank_Iref_Cvfy_Target+(Bank_Iref_Cvfy_Target*0.30);
          Bank_Iref_Evfy_Target_EMU = 22uA;
          Bank_Iref_Evfy_LLim_EMU   = Bank_Iref_Evfy_Target_EMU-(Bank_Iref_Evfy_Target_EMU*0.20);
          Bank_Iref_Evfy_ULim_EMU   = Bank_Iref_Evfy_Target_EMU+(Bank_Iref_Evfy_Target_EMU*0.20);
      } 
   }
   else
   {
        /*+++++ FLEP ++++*/
       IrefRd_Trim_Target = 15.5uA;
       IrefRd_Trim_Toler  = 0.035;  /*3.5%*/
       IrefRd_Trim_LLim   = IrefRd_Trim_Target-(IrefRd_Trim_Target*IrefRd_Trim_Toler);
       IrefRd_Trim_ULim   = IrefRd_Trim_Target+(IrefRd_Trim_Target*IrefRd_Trim_Toler);
       IrefEv_Trim_Target = 29.14uA;
       IrefEv_Trim_Toler  = 0.05;  /*5%*/
       IrefEv_Trim_LLim   = IrefEv_Trim_Target-(IrefEv_Trim_Target*IrefEv_Trim_Toler);
       IrefEv_Trim_ULim   = IrefEv_Trim_Target+(IrefEv_Trim_Target*IrefEv_Trim_Toler);
       
       if(GL_DO_IREF_PMOS_TRIM)  
       {
           switch(SelectedTITestType) {
             case MP1 :  
                       Bank_Iref_Read_Target = 15.5uA;
                       Bank_Iref_Read_LLim   = Bank_Iref_Read_Target-(Bank_Iref_Read_Target*0.035);
                       Bank_Iref_Read_ULim   = Bank_Iref_Read_Target+(Bank_Iref_Read_Target*0.035);
                       Bank_Iref_Pvfy_Target = 11.749uA;
                       Bank_Iref_Pvfy_LLim   = Bank_Iref_Pvfy_Target-(Bank_Iref_Pvfy_Target*0.06);
                       Bank_Iref_Pvfy_ULim   = Bank_Iref_Pvfy_Target+(Bank_Iref_Pvfy_Target*0.06);
                       Bank_Iref_Evfy_Target = 29.14uA;
                       Bank_Iref_Evfy_LLim   = Bank_Iref_Evfy_Target-(Bank_Iref_Evfy_Target*0.05);
                       Bank_Iref_Evfy_ULim   = Bank_Iref_Evfy_Target+(Bank_Iref_Evfy_Target*0.05);
                       Bank_Iref_Cvfy_Target = 3.7uA;
                       Bank_Iref_Cvfy_LLim   = 2uA;
                       Bank_Iref_Cvfy_ULim   = 10uA;
                       Bank_Iref_Evfy_Target_EMU = 26.98uA;
                       Bank_Iref_Evfy_LLim_EMU   = Bank_Iref_Evfy_Target_EMU-(Bank_Iref_Evfy_Target_EMU*0.05);
                       Bank_Iref_Evfy_ULim_EMU   = Bank_Iref_Evfy_Target_EMU+(Bank_Iref_Evfy_Target_EMU*0.05);
                    break; 
             case  MP2: case  FT2 :   
                 Bank_Iref_Read_Target = 15.13uA;
                 Bank_Iref_Read_LLim   = Bank_Iref_Read_Target-(Bank_Iref_Read_Target*0.06);
                 Bank_Iref_Read_ULim   = Bank_Iref_Read_Target+(Bank_Iref_Read_Target*0.06);
                 Bank_Iref_Pvfy_Target = 11.41uA;
                 Bank_Iref_Pvfy_LLim   = Bank_Iref_Pvfy_Target-(Bank_Iref_Pvfy_Target*0.07);
                 Bank_Iref_Pvfy_ULim   = Bank_Iref_Pvfy_Target+(Bank_Iref_Pvfy_Target*0.07);
                 Bank_Iref_Evfy_Target = 28.52uA;
                 Bank_Iref_Evfy_LLim   = Bank_Iref_Evfy_Target-(Bank_Iref_Evfy_Target*0.07);
                 Bank_Iref_Evfy_ULim   = Bank_Iref_Evfy_Target+(Bank_Iref_Evfy_Target*0.07);
                 Bank_Iref_Cvfy_Target = 3.7uA;
                 Bank_Iref_Cvfy_LLim   = 2uA;
                 Bank_Iref_Cvfy_ULim   = 10uA;
                 Bank_Iref_Evfy_Target_EMU = 26.41uA;
                 Bank_Iref_Evfy_LLim_EMU   = Bank_Iref_Evfy_Target_EMU-(Bank_Iref_Evfy_Target_EMU*0.07);
                 Bank_Iref_Evfy_ULim_EMU   = Bank_Iref_Evfy_Target_EMU+(Bank_Iref_Evfy_Target_EMU*0.07);
              break; 
             default:  
                 Bank_Iref_Read_Target = 12.9uA;
                 Bank_Iref_Read_LLim   = Bank_Iref_Read_Target-(Bank_Iref_Read_Target*0.07);
                 Bank_Iref_Read_ULim   = Bank_Iref_Read_Target+(Bank_Iref_Read_Target*0.07);
                 Bank_Iref_Pvfy_Target = 9.8uA;
                 Bank_Iref_Pvfy_LLim   = Bank_Iref_Pvfy_Target-(Bank_Iref_Pvfy_Target*0.08);
                 Bank_Iref_Pvfy_ULim   = Bank_Iref_Pvfy_Target+(Bank_Iref_Pvfy_Target*0.08);
                 Bank_Iref_Evfy_Target = 24uA;
                 Bank_Iref_Evfy_LLim   = Bank_Iref_Evfy_Target-(Bank_Iref_Evfy_Target*0.08);
                 Bank_Iref_Evfy_ULim   = Bank_Iref_Evfy_Target+(Bank_Iref_Evfy_Target*0.08);
                 Bank_Iref_Cvfy_Target = 3.7uA;
                 Bank_Iref_Cvfy_LLim   = 2uA;
                 Bank_Iref_Cvfy_ULim   = 10uA;
                 Bank_Iref_Evfy_Target_EMU = 22.4uA;
                 Bank_Iref_Evfy_LLim_EMU   = Bank_Iref_Evfy_Target_EMU-(Bank_Iref_Evfy_Target_EMU*0.08);
                 Bank_Iref_Evfy_ULim_EMU   = Bank_Iref_Evfy_Target_EMU+(Bank_Iref_Evfy_Target_EMU*0.08);
           }   /* case */
       }
       else
       {
           Bank_Iref_Read_Target = 13.75uA;
           Bank_Iref_Read_LLim   = Bank_Iref_Read_Target-(Bank_Iref_Read_Target*0.20);
           Bank_Iref_Read_ULim   = Bank_Iref_Read_Target+(Bank_Iref_Read_Target*0.20);
           Bank_Iref_Pvfy_Target = 11uA;
           Bank_Iref_Pvfy_LLim   = Bank_Iref_Pvfy_Target-(Bank_Iref_Pvfy_Target*0.20);
           Bank_Iref_Pvfy_ULim   = Bank_Iref_Pvfy_Target+(Bank_Iref_Pvfy_Target*0.20);
           Bank_Iref_Evfy_Target = 22uA;
           Bank_Iref_Evfy_LLim   = Bank_Iref_Evfy_Target-(Bank_Iref_Evfy_Target*0.20);
           Bank_Iref_Evfy_ULim   = Bank_Iref_Evfy_Target+(Bank_Iref_Evfy_Target*0.20);
           Bank_Iref_Cvfy_Target = 3.7uA;
           Bank_Iref_Cvfy_LLim   = Bank_Iref_Cvfy_Target-(Bank_Iref_Cvfy_Target*0.30);
           Bank_Iref_Cvfy_ULim   = Bank_Iref_Cvfy_Target+(Bank_Iref_Cvfy_Target*0.30);
           Bank_Iref_Evfy_Target_EMU = 22uA;
           Bank_Iref_Evfy_LLim_EMU   = Bank_Iref_Evfy_Target_EMU-(Bank_Iref_Evfy_Target_EMU*0.20);
           Bank_Iref_Evfy_ULim_EMU   = Bank_Iref_Evfy_Target_EMU+(Bank_Iref_Evfy_Target_EMU*0.20);
       } 
   } 

 /*++++ TCR 26 (Bank) IREFM0: TP1=CG, TP2=Iref ++++*/
Bank_Iref_VCG_Read = 1.825V;
Bank_Iref_VBL_Read = 0.6V;

if(GL_BANKTYPE==FLESBANK)  
{
     /*+++++ FLES ++++*/
    switch(SelectedTITestType) {
      case MP1 :  
                if(GL_DO_REFARR_ERS_ADAPTIVE)  
                    Bank_Iref_RDM0_Target = 11.62uA;
                else
                    Bank_Iref_RDM0_Target = 11.749uA;
                Bank_Iref_RDM0_LLim   = Bank_Iref_RDM0_Target-(Bank_Iref_RDM0_Target*0.06);
                Bank_Iref_RDM0_ULim   = Bank_Iref_RDM0_Target+(Bank_Iref_RDM0_Target*0.06);
             break; 
      case  MP2: case  FT2 :   
          if(GL_DO_REFARR_ERS_ADAPTIVE)  
              Bank_Iref_RDM0_Target = 11.28uA;
          else
              Bank_Iref_RDM0_Target = 11.41uA;
          Bank_Iref_RDM0_LLim   = Bank_Iref_RDM0_Target-(Bank_Iref_RDM0_Target*0.07);
          Bank_Iref_RDM0_ULim   = Bank_Iref_RDM0_Target+(Bank_Iref_RDM0_Target*0.07);
       break; 
      default:  
          if(GL_DO_REFARR_ERS_ADAPTIVE)  
              Bank_Iref_RDM0_Target = 9.7uA;
          else
              Bank_Iref_RDM0_Target = 9.8uA;
          if (SelectedTITestType == MP3)  
          {
              Bank_Iref_RDM0_LLim   = Bank_Iref_RDM0_Target-(Bank_Iref_RDM0_Target*0.15);
              Bank_Iref_RDM0_ULim   = Bank_Iref_RDM0_Target+(Bank_Iref_RDM0_Target*0.20);
          }
          else
          { 
              Bank_Iref_RDM0_LLim   = Bank_Iref_RDM0_Target-(Bank_Iref_RDM0_Target*0.08);
              Bank_Iref_RDM0_ULim   = Bank_Iref_RDM0_Target+(Bank_Iref_RDM0_Target*0.08);
          } 
       break; 
    }   /* case */
}
else
{
     /*+++++ FLEP ++++*/
    switch(SelectedTITestType) {
      case MP1 :  
                Bank_Iref_RDM0_Target = 11.749uA;
                Bank_Iref_RDM0_LLim   = Bank_Iref_RDM0_Target-(Bank_Iref_RDM0_Target*0.06);
                Bank_Iref_RDM0_ULim   = Bank_Iref_RDM0_Target+(Bank_Iref_RDM0_Target*0.06);
             break; 
      case  MP2: case  FT2 :   
          Bank_Iref_RDM0_Target = 11.41uA;
          Bank_Iref_RDM0_LLim   = Bank_Iref_RDM0_Target-(Bank_Iref_RDM0_Target*0.07);
          Bank_Iref_RDM0_ULim   = Bank_Iref_RDM0_Target+(Bank_Iref_RDM0_Target*0.07);
       break; 
      default:  
          Bank_Iref_RDM0_Target = 9.8uA;
          Bank_Iref_RDM0_LLim   = Bank_Iref_RDM0_Target-(Bank_Iref_RDM0_Target*0.08);
          Bank_Iref_RDM0_ULim   = Bank_Iref_RDM0_Target+(Bank_Iref_RDM0_Target*0.08);
       break; 
    }   /* case */
} 

 /*++++ TCR 27 (Bank) IREFM1: TP1=CG, TP2=Iref ++++*/
Bank_Iref_VCG_Read = 1.825V;
Bank_Iref_VBL_Read = 0.6V;

if(GL_BANKTYPE==FLESBANK)  
{
     /*+++++ FLES ++++*/
    if(GL_DO_IREF_PMOS_TRIM)  
    {
        switch(SelectedTITestType) {
          case MP1 :  
                    if(GL_DO_REFARR_ERS_ADAPTIVE)  
                        Bank_Iref_RDM1_Target = 19.55uA;
                    else
                        Bank_Iref_RDM1_Target = 19.685uA;
                    Bank_Iref_RDM1_LLim   = Bank_Iref_RDM1_Target-(Bank_Iref_RDM1_Target*0.05);
                    Bank_Iref_RDM1_ULim   = Bank_Iref_RDM1_Target+(Bank_Iref_RDM1_Target*0.05);
                 break; 
          case  MP2: case  FT2 :   
              if(GL_DO_REFARR_ERS_ADAPTIVE)  
                  Bank_Iref_RDM1_Target = 19.07uA;
              else
                  Bank_Iref_RDM1_Target = 19.2uA;
              Bank_Iref_RDM1_LLim   = Bank_Iref_RDM1_Target-(Bank_Iref_RDM1_Target*0.07);
              Bank_Iref_RDM1_ULim   = Bank_Iref_RDM1_Target+(Bank_Iref_RDM1_Target*0.07);
           break; 
          default:  
              if(GL_DO_REFARR_ERS_ADAPTIVE)  
                  Bank_Iref_RDM1_Target = 16.2uA;
              else
                  Bank_Iref_RDM1_Target = 16.3uA;
              if (SelectedTITestType == MP3)  
              {  
                  Bank_Iref_RDM1_LLim   = Bank_Iref_RDM1_Target-(Bank_Iref_RDM1_Target*0.15);
                  Bank_Iref_RDM1_ULim   = Bank_Iref_RDM1_Target+(Bank_Iref_RDM1_Target*0.20);           
              }
              else  
              {
                  Bank_Iref_RDM1_LLim   = Bank_Iref_RDM1_Target-(Bank_Iref_RDM1_Target*0.08);
                  Bank_Iref_RDM1_ULim   = Bank_Iref_RDM1_Target+(Bank_Iref_RDM1_Target*0.08);
              } 
           break;  /* Otherwise*/
        }   /* case */
    }
    else
    {
        Bank_Iref_RDM1_Target = 17.19uA;
        Bank_Iref_RDM1_LLim   = Bank_Iref_RDM1_Target-(Bank_Iref_RDM1_Target*0.20);
        Bank_Iref_RDM1_ULim   = Bank_Iref_RDM1_Target+(Bank_Iref_RDM1_Target*0.20);
    } 
}
else
{
     /*+++++ FLEP ++++*/
    if(GL_DO_IREF_PMOS_TRIM)  
    {
        switch(SelectedTITestType) {
          case MP1 :  
                    Bank_Iref_RDM1_Target = 19.685uA;
                    Bank_Iref_RDM1_LLim   = Bank_Iref_RDM1_Target-(Bank_Iref_RDM1_Target*0.05);
                    Bank_Iref_RDM1_ULim   = Bank_Iref_RDM1_Target+(Bank_Iref_RDM1_Target*0.05);
                 break; 
          case  MP2: case  FT2 :   
              Bank_Iref_RDM1_Target = 19.2uA;
              Bank_Iref_RDM1_LLim   = Bank_Iref_RDM1_Target-(Bank_Iref_RDM1_Target*0.07);
              Bank_Iref_RDM1_ULim   = Bank_Iref_RDM1_Target+(Bank_Iref_RDM1_Target*0.07);
           break; 
          default:  
              Bank_Iref_RDM1_Target = 16.3uA;
              Bank_Iref_RDM1_LLim   = Bank_Iref_RDM1_Target-(Bank_Iref_RDM1_Target*0.08);
              Bank_Iref_RDM1_ULim   = Bank_Iref_RDM1_Target+(Bank_Iref_RDM1_Target*0.08);
           break; 
        }   /* case */
    }
    else
    {
        Bank_Iref_RDM1_Target = 17.19uA;
        Bank_Iref_RDM1_LLim   = Bank_Iref_RDM1_Target-(Bank_Iref_RDM1_Target*0.20);
        Bank_Iref_RDM1_ULim   = Bank_Iref_RDM1_Target+(Bank_Iref_RDM1_Target*0.20);
    } 
} 

 /*++++ TCR 28,29,30 (Bank) Internal IREF, IREFM0, IREFM1, VCG: TP1=CG, TP2=Iref ++++*/
 /*measure iref on TP2 & vcg on TP1*/
 /*iref same condition as tcr 25 except VBL below*/
 /*vcg same condition as tcr 120*/
Bank_Internal_Iref_VBL = 0.6V;


 /*++++ TCR 40 (Bank) PMOS IREF: TP1=CG, TP2=Iref ++++*/
if(GL_BANKTYPE==FLESBANK)  
{
     /*+++++ FLES ++++*/
     /*use ersmode for soft trim mode*/
    Bank_IPMOS_VCG_Ers  = 1.825V;
    Bank_IPMOS_VBL_Ers  = 0.0V;
    if(GL_DO_REFARR_ERS_ADAPTIVE)  
        IPMOS_Trim_Target   = -88uA;
    else
        IPMOS_Trim_Target   = -145.7uA;
    IPMOS_Trim_Toler    = 0.0582;   /*range 5.82%*/
    IPMOS_Trim_LLim     = IPMOS_Trim_Target+(IPMOS_Trim_Target*IPMOS_Trim_Toler);
    IPMOS_Trim_ULim     = IPMOS_Trim_Target-(IPMOS_Trim_Target*IPMOS_Trim_Toler);
    Bank_IPMOS_Ers_LLim = IPMOS_Trim_Target+(IPMOS_Trim_Target*0.15);
    Bank_IPMOS_Ers_ULim = IPMOS_Trim_Target-(IPMOS_Trim_Target*0.50);
    IPMOS_Adaptive_Target = -88uA;
     /*pst-trim*/
    Bank_IPMOS_VCG_Read = 1.825V;
    Bank_IPMOS_VBL_Read = 0.0V;
    Bank_IPMOS_VCG_Pvfy = 1.825V;
    Bank_IPMOS_VBL_Pvfy = 0.0V;
    Bank_IPMOS_VCG_Evfy = 1.825V;
    Bank_IPMOS_VBL_Evfy = 0.0V;
    Bank_IPMOS_VCG_Cvfy = 1.825V;
    Bank_IPMOS_VBL_Cvfy = 0.0V;
    
     /*use progmode for pre-refarray erase but not yet pmos trim*/
    Bank_IPMOS_VCG_Prog = 1.825V;
    Bank_IPMOS_VBL_Prog = 0.0V;
    if(GL_DO_REFARR_ERS_ADAPTIVE)  
    {
        Bank_IPMOS_Prog_Target = -88uA;
        Bank_IPMOS_Prog_LLim   = -100uA;
        Bank_IPMOS_Prog_ULim   = 1uA;  /*5ua*/
        Bank_IPMOS_ErsPst_LLim = -100uA;  /*was -126ua;*/
        Bank_IPMOS_ErsPst_ULim = -70uA;
    }
    else
    {
        Bank_IPMOS_Prog_Target = -110uA;
        Bank_IPMOS_Prog_LLim   = -135uA;  /*was -85ua;} {-135ua to take care retest cases*/
        Bank_IPMOS_Prog_ULim   = 1uA;  /*5ua*/
        Bank_IPMOS_ErsPst_LLim = -160uA;  /*was -126ua;*/
        Bank_IPMOS_ErsPst_ULim = -60uA;
    }          
    
     /*use Readmode for post-pmos trim*/
    if(GL_DO_IREF_PMOS_TRIM)  
    {
        switch(SelectedTITestType) {
          case MP1 :  
                    Bank_IPMOS_Read_Target = IPMOS_Trim_Target;
                    Bank_IPMOS_Read_LLim   = Bank_IPMOS_Read_Target+(Bank_IPMOS_Read_Target*0.10);
                    Bank_IPMOS_Read_ULim   = Bank_IPMOS_Read_Target-(Bank_IPMOS_Read_Target*0.10);
                    Bank_IPMOS_Pvfy_Target = IPMOS_Trim_Target;
                    Bank_IPMOS_Pvfy_LLim   = Bank_IPMOS_Pvfy_Target+(Bank_IPMOS_Pvfy_Target*0.10);
                    Bank_IPMOS_Pvfy_ULim   = Bank_IPMOS_Pvfy_Target-(Bank_IPMOS_Pvfy_Target*0.10);
                    Bank_IPMOS_Evfy_Target = IPMOS_Trim_Target;
                    Bank_IPMOS_Evfy_LLim   = Bank_IPMOS_Evfy_Target+(Bank_IPMOS_Evfy_Target*0.10);
                    Bank_IPMOS_Evfy_ULim   = Bank_IPMOS_Evfy_Target-(Bank_IPMOS_Evfy_Target*0.10);
                    Bank_IPMOS_Cvfy_Target = -25uA;
                    Bank_IPMOS_Cvfy_LLim   = Bank_IPMOS_Cvfy_Target+(Bank_IPMOS_Cvfy_Target*0.10);
                    Bank_IPMOS_Cvfy_ULim   = -15uA; ; /*Bank_IPMOS_Cvfy_Target-(Bank_IPMOS_Cvfy_Target*0.25)*/
                 break; 
          case  MP2: case  FT2 :   
              if(GL_DO_REFARR_ERS_ADAPTIVE)  
                  Bank_IPMOS_Read_Target = -85.6uA;
              else
                  Bank_IPMOS_Read_Target = -143.3uA;
              Bank_IPMOS_Read_LLim   = Bank_IPMOS_Read_Target+(Bank_IPMOS_Read_Target*0.10);
              Bank_IPMOS_Read_ULim   = Bank_IPMOS_Read_Target-(Bank_IPMOS_Read_Target*0.10);
              Bank_IPMOS_Pvfy_Target = Bank_IPMOS_Read_Target;
              Bank_IPMOS_Pvfy_LLim   = Bank_IPMOS_Pvfy_Target+(Bank_IPMOS_Pvfy_Target*0.10);
              Bank_IPMOS_Pvfy_ULim   = Bank_IPMOS_Pvfy_Target-(Bank_IPMOS_Pvfy_Target*0.10);
              Bank_IPMOS_Evfy_Target = Bank_IPMOS_Read_Target;
              Bank_IPMOS_Evfy_LLim   = Bank_IPMOS_Evfy_Target+(Bank_IPMOS_Evfy_Target*0.10);
              Bank_IPMOS_Evfy_ULim   = Bank_IPMOS_Evfy_Target-(Bank_IPMOS_Evfy_Target*0.10);
              Bank_IPMOS_Cvfy_Target = -25uA;
              Bank_IPMOS_Cvfy_LLim   = Bank_IPMOS_Cvfy_Target+(Bank_IPMOS_Cvfy_Target*0.10);
              Bank_IPMOS_Cvfy_ULim   = -15uA; ; /*Bank_IPMOS_Cvfy_Target-(Bank_IPMOS_Cvfy_Target*0.25)*/
           break; 
          default:  
              if(GL_DO_REFARR_ERS_ADAPTIVE)  
                  Bank_IPMOS_Read_Target = -66.7uA;
              else
                  Bank_IPMOS_Read_Target = -130.4uA;  /*MP3*/
              
              Bank_IPMOS_Read_LLim   = Bank_IPMOS_Read_Target+(Bank_IPMOS_Read_Target*0.10);
              Bank_IPMOS_Read_ULim   = Bank_IPMOS_Read_Target-(Bank_IPMOS_Read_Target*0.10);
              Bank_IPMOS_Pvfy_Target = Bank_IPMOS_Read_Target;
              Bank_IPMOS_Pvfy_LLim   = Bank_IPMOS_Pvfy_Target+(Bank_IPMOS_Pvfy_Target*0.10);
              Bank_IPMOS_Pvfy_ULim   = Bank_IPMOS_Pvfy_Target-(Bank_IPMOS_Pvfy_Target*0.10);
              Bank_IPMOS_Evfy_Target = Bank_IPMOS_Read_Target;
              Bank_IPMOS_Evfy_LLim   = Bank_IPMOS_Evfy_Target+(Bank_IPMOS_Evfy_Target*0.10);
              Bank_IPMOS_Evfy_ULim   = Bank_IPMOS_Evfy_Target-(Bank_IPMOS_Evfy_Target*0.10);
              Bank_IPMOS_Cvfy_Target = -23uA;
              
              Bank_IPMOS_Cvfy_LLim   = Bank_IPMOS_Cvfy_Target+(Bank_IPMOS_Cvfy_Target*0.30);
              Bank_IPMOS_Cvfy_ULim   = -15uA; ; /*Bank_IPMOS_Cvfy_Target-(Bank_IPMOS_Cvfy_Target*0.25)*/
            break; 
         }   /* case */
      }
      else
      {
         Bank_IPMOS_Read_Target = -88uA;
         Bank_IPMOS_Read_LLim   = Bank_IPMOS_Read_Target+(Bank_IPMOS_Read_Target*0.10);
         Bank_IPMOS_Read_ULim   = Bank_IPMOS_Read_Target-(Bank_IPMOS_Read_Target*0.15);
         Bank_IPMOS_Pvfy_Target = -88uA;
         Bank_IPMOS_Pvfy_LLim   = Bank_IPMOS_Pvfy_Target+(Bank_IPMOS_Pvfy_Target*0.10);
         Bank_IPMOS_Pvfy_ULim   = Bank_IPMOS_Pvfy_Target-(Bank_IPMOS_Pvfy_Target*0.15);
         Bank_IPMOS_Evfy_Target = -88uA;
         Bank_IPMOS_Evfy_LLim   = -100uA;   /*Bank_IPMOS_Evfy_Target+(Bank_IPMOS_Evfy_Target*0.10);*/
         Bank_IPMOS_Evfy_ULim   = -70uA;   /*Bank_IPMOS_Evfy_Target-(Bank_IPMOS_Evfy_Target*0.15);*/
         Bank_IPMOS_Cvfy_Target = -25uA;
         Bank_IPMOS_Cvfy_LLim   = Bank_IPMOS_Cvfy_Target+(Bank_IPMOS_Cvfy_Target*0.10);
         Bank_IPMOS_Cvfy_ULim   = Bank_IPMOS_Cvfy_Target-(Bank_IPMOS_Cvfy_Target*0.25);
      } 
   }
   else
   {
       /*+++++ FLEP ++++*/
       /*use ersmode for soft trim mode*/
      Bank_IPMOS_VCG_Ers  = 1.825V;
      Bank_IPMOS_VBL_Ers  = 0.0V;
      IPMOS_Trim_Target   = -145.7uA;
      IPMOS_Trim_Toler    = 0.0582;   /*range 5.82%*/
      IPMOS_Trim_LLim     = IPMOS_Trim_Target+(IPMOS_Trim_Target*IPMOS_Trim_Toler);  /*-149.21ua*/
      IPMOS_Trim_ULim     = IPMOS_Trim_Target-(IPMOS_Trim_Target*IPMOS_Trim_Toler);  /*-132.79ua*/
      Bank_IPMOS_Ers_LLim = IPMOS_Trim_Target+(IPMOS_Trim_Target*0.15);    /*-162.15ua loose lim*/
      Bank_IPMOS_Ers_ULim = IPMOS_Trim_Target-(IPMOS_Trim_Target*0.50);    /*-70.5ua loose lim*/
      IPMOS_Adaptive_Target = -56uA;
       /*pst-trim*/
      Bank_IPMOS_VCG_Read = 1.825V;
      Bank_IPMOS_VBL_Read = 0.0V;
      Bank_IPMOS_VCG_Pvfy = 1.825V;
      Bank_IPMOS_VBL_Pvfy = 0.0V;
      Bank_IPMOS_VCG_Evfy = 1.825V;
      Bank_IPMOS_VBL_Evfy = 0.0V;
      Bank_IPMOS_VCG_Cvfy = 1.825V;
      Bank_IPMOS_VBL_Cvfy = 0.0V;
      
       /*use progmode for pre-refarray erase but not yet pmos trim*/
      Bank_IPMOS_VCG_Prog = 1.825V;
      Bank_IPMOS_VBL_Prog = 0.0V;
      Bank_IPMOS_Prog_Target = -110uA;
      Bank_IPMOS_Prog_LLim   = -135uA;  /*was -85ua;} {-135ua to take care retest cases*/
      Bank_IPMOS_Prog_ULim   = 1uA;  /*5ua*/
      Bank_IPMOS_ErsPst_LLim = -160uA;  /*was -126ua;*/
      Bank_IPMOS_ErsPst_ULim = -60uA;
      
       /*use Readmode for post-pmos trim*/
      if(GL_DO_IREF_PMOS_TRIM)  
      {
         switch(SelectedTITestType) {
           case MP1 :  
                    Bank_IPMOS_Read_Target = IPMOS_Trim_Target;
                    Bank_IPMOS_Read_LLim   = Bank_IPMOS_Read_Target+(Bank_IPMOS_Read_Target*0.10);
                    Bank_IPMOS_Read_ULim   = Bank_IPMOS_Read_Target-(Bank_IPMOS_Read_Target*0.10);
                    Bank_IPMOS_Pvfy_Target = IPMOS_Trim_Target;
                    Bank_IPMOS_Pvfy_LLim   = Bank_IPMOS_Pvfy_Target+(Bank_IPMOS_Pvfy_Target*0.10);
                    Bank_IPMOS_Pvfy_ULim   = Bank_IPMOS_Pvfy_Target-(Bank_IPMOS_Pvfy_Target*0.10);
                    Bank_IPMOS_Evfy_Target = IPMOS_Trim_Target;
                    Bank_IPMOS_Evfy_LLim   = Bank_IPMOS_Evfy_Target+(Bank_IPMOS_Evfy_Target*0.10);
                    Bank_IPMOS_Evfy_ULim   = Bank_IPMOS_Evfy_Target-(Bank_IPMOS_Evfy_Target*0.10);
                    Bank_IPMOS_Cvfy_Target = -25uA;
                    Bank_IPMOS_Cvfy_LLim   = Bank_IPMOS_Cvfy_Target+(Bank_IPMOS_Cvfy_Target*0.10);
                    Bank_IPMOS_Cvfy_ULim   = -15uA; ; /*Bank_IPMOS_Cvfy_Target-(Bank_IPMOS_Cvfy_Target*0.25)*/
                  break; 
           case  MP2: case  FT2 :   
                 Bank_IPMOS_Read_Target = -143.3uA;
                 Bank_IPMOS_Read_LLim   = Bank_IPMOS_Read_Target+(Bank_IPMOS_Read_Target*0.10);
                 Bank_IPMOS_Read_ULim   = Bank_IPMOS_Read_Target-(Bank_IPMOS_Read_Target*0.10);
                 Bank_IPMOS_Pvfy_Target = Bank_IPMOS_Read_Target;
                 Bank_IPMOS_Pvfy_LLim   = Bank_IPMOS_Pvfy_Target+(Bank_IPMOS_Pvfy_Target*0.10);
                 Bank_IPMOS_Pvfy_ULim   = Bank_IPMOS_Pvfy_Target-(Bank_IPMOS_Pvfy_Target*0.10);
                 Bank_IPMOS_Evfy_Target = Bank_IPMOS_Read_Target;
                 Bank_IPMOS_Evfy_LLim   = Bank_IPMOS_Evfy_Target+(Bank_IPMOS_Evfy_Target*0.10);
                 Bank_IPMOS_Evfy_ULim   = Bank_IPMOS_Evfy_Target-(Bank_IPMOS_Evfy_Target*0.10);
                 Bank_IPMOS_Cvfy_Target = -25uA;
                 Bank_IPMOS_Cvfy_LLim   = Bank_IPMOS_Cvfy_Target+(Bank_IPMOS_Cvfy_Target*0.10);
                 Bank_IPMOS_Cvfy_ULim   = -15uA; ; /*Bank_IPMOS_Cvfy_Target-(Bank_IPMOS_Cvfy_Target*0.25)*/
            break; 
           default:  
                 Bank_IPMOS_Read_Target = -110.4uA;
                 Bank_IPMOS_Read_LLim   = Bank_IPMOS_Read_Target+(Bank_IPMOS_Read_Target*0.10);
                 Bank_IPMOS_Read_ULim   = Bank_IPMOS_Read_Target-(Bank_IPMOS_Read_Target*0.10);
                 Bank_IPMOS_Pvfy_Target = Bank_IPMOS_Read_Target;
                 Bank_IPMOS_Pvfy_LLim   = Bank_IPMOS_Pvfy_Target+(Bank_IPMOS_Pvfy_Target*0.10);
                 Bank_IPMOS_Pvfy_ULim   = Bank_IPMOS_Pvfy_Target-(Bank_IPMOS_Pvfy_Target*0.10);
                 Bank_IPMOS_Evfy_Target = Bank_IPMOS_Read_Target;
                 Bank_IPMOS_Evfy_LLim   = Bank_IPMOS_Evfy_Target+(Bank_IPMOS_Evfy_Target*0.10);
                 Bank_IPMOS_Evfy_ULim   = Bank_IPMOS_Evfy_Target-(Bank_IPMOS_Evfy_Target*0.10);
                 Bank_IPMOS_Cvfy_Target = -20uA;
                 Bank_IPMOS_Cvfy_LLim   = Bank_IPMOS_Cvfy_Target+(Bank_IPMOS_Cvfy_Target*0.30);
                 Bank_IPMOS_Cvfy_ULim   = -15uA; ; /*Bank_IPMOS_Cvfy_Target-(Bank_IPMOS_Cvfy_Target*0.25)*/
            break; 
         }   /* case */
      }
      else
      {
         Bank_IPMOS_Read_Target = -110uA;
         Bank_IPMOS_Read_LLim   = Bank_IPMOS_Read_Target+(Bank_IPMOS_Read_Target*0.10);
         Bank_IPMOS_Read_ULim   = Bank_IPMOS_Read_Target-(Bank_IPMOS_Read_Target*0.15);
         Bank_IPMOS_Pvfy_Target = -110uA;
         Bank_IPMOS_Pvfy_LLim   = Bank_IPMOS_Pvfy_Target+(Bank_IPMOS_Pvfy_Target*0.10);
         Bank_IPMOS_Pvfy_ULim   = Bank_IPMOS_Pvfy_Target-(Bank_IPMOS_Pvfy_Target*0.15);
         Bank_IPMOS_Evfy_Target = -110uA;
         Bank_IPMOS_Evfy_LLim   = -126uA;   /*Bank_IPMOS_Evfy_Target+(Bank_IPMOS_Evfy_Target*0.10);*/
         Bank_IPMOS_Evfy_ULim   = -85uA;   /*Bank_IPMOS_Evfy_Target-(Bank_IPMOS_Evfy_Target*0.15);*/
         Bank_IPMOS_Cvfy_Target = -25uA;
         Bank_IPMOS_Cvfy_LLim   = Bank_IPMOS_Cvfy_Target+(Bank_IPMOS_Cvfy_Target*0.10);
         Bank_IPMOS_Cvfy_ULim   = Bank_IPMOS_Cvfy_Target-(Bank_IPMOS_Cvfy_Target*0.25);
      } 
   } 

    /*++++ TCR 43 (Bank) Internal PMOS IREF,VCG: TP1=CG, TP2=Iref ++++*/
   Bank_Internal_IPMOS_VBL = 0V;


    /*++++ TCR 52 PGMFF stress ++++*/
    /*tp1->CG, tp2->CS/EG, tp3->BL, tp4->WL*/
   PgmFF_VCG_Prog           = 12.2V;
   PgmFF_VCG_IMAX_Prog      = 100mA;
   PgmFF_VCG_TStress_Prog   = 41ms;
   PgmFF_VEGCS_Prog         = 5.1V;
   PgmFF_VEGCS_IMAX_Prog    = 100mA;
   PgmFF_VEGCS_TStress_Prog = 41ms;
   PgmFF_VBL_Prog           = 3.3V;
   PgmFF_VBL_IMAX_Prog      = 100mA;
   PgmFF_VBL_TStress_Prog   = 41ms;
   PgmFF_VWL_Prog           = 1.3V;
   PgmFF_VWL_IMAX_Prog      = 100mA;
   PgmFF_VWL_TStress_Prog   = 41ms;
    /*Note: use Pvfy for FGWL condition but actual is Prog mode*/
   FGWL_VCG_Pvfy            = 13.5V;
   FGWL_VCG_IMAX_Pvfy       = 100mA;
   FGWL_VCG_TStress_Pvfy    = 512ms;
   FGWL_VEGCS_Pvfy          = 3.1V;
   FGWL_VEGCS_IMAX_Pvfy     = 100mA;
   FGWL_VEGCS_TStress_Pvfy  = 512ms;
   FGWL_VBL_Pvfy            = 3.3V;
   FGWL_VBL_IMAX_Pvfy       = 100mA;
   FGWL_VBL_TStress_Pvfy    = 512ms;
   FGWL_VWL_Pvfy            = 1.3V;
   FGWL_VWL_IMAX_Pvfy       = 100mA;
   FGWL_VWL_TStress_Pvfy    = 512ms;
    /*Note: use Evfy for tunox/fgwl condition but actual is Prog mode*/
   TunOx_VCG_Evfy           = 13.0V;
   TunOx_VCG_IMAX_Evfy      = 100mA;
   TunOx_VCG_TStress_Evfy   = 400ms;
   TunOx_VEGCS_Evfy         = 0.0V;
   TunOx_VEGCS_IMAX_Evfy    = 100mA;
   TunOx_VEGCS_TStress_Evfy = 400ms;
   TunOx_VBL_Evfy           = 0.0V;
   TunOx_VBL_IMAX_Evfy      = 100mA;
   TunOx_VBL_TStress_Evfy   = 400ms;
   TunOx_VWL_Evfy           = 1.3V;
   TunOx_VWL_IMAX_Evfy      = 100mA;
   TunOx_VWL_TStress_Evfy   = 400ms;
    /*Added for TMSC cond*/
   TunOx_VEGCS_Cvfy         = 1.7V;


    /*++++ TCR 53 Tunnel Oxide (FG/ONO) stress ++++*/
    /*tp1->CG, tp2->BL, WL/EG/CS=0v*/
    /*Note: use Pvfy for ONO condition but actual is Prog mode*/
   ONO_VCG_Pvfy              = 13.0V;
   ONO_VCG_IMAX_Pvfy         = 100mA;
   ONO_VCG_TStress_Pvfy      = 400ms;
   ONO_VBL_Pvfy              = 3.3V;
   ONO_VBL_IMAX_Pvfy         = 100mA;
   ONO_VBL_TStress_Pvfy      = 400ms;

    /*++++ TCR 54 Reverse Tunneling (punch thru, thinox) stress ++++*/
    /*tp1->EG/CS, tp2->BL, WL/CG=0v*/
   RevTunnel_VEGCS_Prog         = 5.1V;
   RevTunnel_VEGCS_IMAX_Prog    = 100mA;
   RevTunnel_VEGCS_TStress_Prog = 500ms;
   RevTunnel_VBL_Prog           = 3.3V;
   RevTunnel_VBL_IMAX_Prog      = 100mA;
   RevTunnel_VBL_TStress_Prog   = 500ms;
    /*Note: use Pvfy for punch thru condition but actual is Prog mode*/
   PunchThru_VEGCS_Pvfy         = 5.1V;
   PunchThru_VEGCS_IMAX_Pvfy    = 100mA;
   PunchThru_VEGCS_TStress_Pvfy = 5ms;
   PunchThru_VBL_Pvfy           = 0.6V;
   PunchThru_VBL_IMAX_Pvfy      = 100mA;
   PunchThru_VBL_TStress_Pvfy   = 5ms;
    /*Note: use Ers for ThinOxide condition but actual is Prog mode*/
   ThinOxide_VEGCS_Ers          = 6.5V;
   ThinOxide_VEGCS_IMAX_Ers     = 100mA;
   ThinOxide_VEGCS_TStress_Ers  = 1s;
   ThinOxide_VBL_Ers            = 3.3V;
   ThinOxide_VBL_IMAX_Ers       = 100mA;
   ThinOxide_VBL_TStress_Ers    = 1s;

    /*++++ TCR 56 Erase Ref Array External ++++*/
   if(GL_BANKTYPE==FLESBANK)  
   {
      if(GL_DO_REFARR_ERS_ADAPTIVE)  
         Bank_RefArr_VEG_Ers = 11V;
      else
         Bank_RefArr_VEG_Ers = 13V;
      Bank_RefArr_VEG_IMAX_Ers = 100mA;
      Bank_RefArr_VEG_Ers_PWidth = 50ms;
      RefArr_Ers_Adaptive_RESOL  = 2ms;
      RefArr_Ers_Adaptive_PWIDTH = 10ms;
      RefArr_Ers_Adaptive_VStart = 9V;
      RefArr_Ers_Adaptive_VStop  = 12V;
   }
   else
   {
      Bank_RefArr_VEG_Ers = 13V;
      Bank_RefArr_VEG_IMAX_Ers = 100mA;
      Bank_RefArr_VEG_Ers_PWidth = 50ms;
      RefArr_Ers_Adaptive_RESOL  = 2ms;
      RefArr_Ers_Adaptive_PWIDTH = 10ms;
      RefArr_Ers_Adaptive_VStart = 9V;
      RefArr_Ers_Adaptive_VStop  = 11V;
   } 

    /*++++ TCR 58 Bank WLS All -- WL Leakage test ++++*/
    /*++++ TCR 59 Bank WLS Odd -- WL Leakage test ++++*/
    /*++++ TCR 60 Bank WLS Even -- WL Leakage test ++++*/
    /*tp1->WL, BL/CG/CS/EG=gnd*/
   WLS_VWL_LEAK_Prog         = 3.3V;
   if(GL_BANKTYPE==FLESBANK)  
      WLS_VWL_LEAK_Prog_Target  = 60uA;
   else
      WLS_VWL_LEAK_Prog_Target  = 10uA;
   WLS_VWL_LEAK_Prog_ULim    = WLS_VWL_LEAK_Prog_Target+(WLS_VWL_LEAK_Prog_Target*0.5);
   WLS_VWL_LEAK_Prog_LLim    = -1.5uA;
   WLS_VWL_LEAK_TStress_Prog = 100ms;

    /*--Note: use ReadMode of TCR 58 for Read Disturb stress condition*/
   RDISTURB_VWL_STRESS_Read      = 4.5V;
   RDISTURB_VWL_STRESS_IMAX_Read = 100mA;
   RDISTURB_VWL_TStress_Read     = 50ms;

    /*read disturb2 stress*/
   RDISTURB_VWL_STRESS_Pvfy      = 5.0V;
   RDISTURB_VWL_STRESS_IMAX_Pvfy = 100mA;
   RDISTURB_VWL_TStress_Pvfy     = 50ms;
    /*--     --*/

    /*++++ TCR 69 Meas IProg WL Driver ++++*/
   IVWLDRV_Prog = 0.5V;
   IVWLDRV_Prog_Target = 2uA;
   IVWLDRV_Prog_LLim = 1uA;  /*IVWLDRV_Prog_Target-(IVWLDRV_Prog_Target*0.10);*/
   IVWLDRV_Prog_ULim = 10uA;  /*IVWLDRV_Prog_Target+(IVWLDRV_Prog_Target*0.10);*/
   GL_DO_TWLOGALL_IPROG_DRV = false;  /*false=disable tw log all sense amp*/

    /*++++ TCR 70 SA Iref w/ local BL load ++++*/
   SA_Iref_VBLLoad_Read = "VDD_PS.Typ.PS_Vmin";
   SA_Iref_BLLoad_Read_Target = 13.75uA;
   SA_Iref_BLLoad_Read_LLim = SA_Iref_BLLoad_Read_Target-(SA_Iref_BLLoad_Read_Target*0.25);
   if(GL_DO_IREF_PMOS_TRIM)  
      SA_Iref_BLLoad_Read_ULim = SA_Iref_BLLoad_Read_Target+(SA_Iref_BLLoad_Read_Target*0.25);
   else
      SA_Iref_BLLoad_Read_ULim = SA_Iref_BLLoad_Read_Target+(SA_Iref_BLLoad_Read_Target*0.10);
   GL_DO_TWLOGALL_ISA_LD = false;  /*false=disable tw log all sense amp*/

    /*++++ TCR 71 SA Iref w/o local BL load ++++*/
   SA_Iref_VBLLoadDis_Read = "VDD_PS.Typ.PS_Vmin";
   SA_Iref_BLLoadDis_Read_Target = 13.75uA;
   SA_Iref_BLLoadDis_Read_LLim = SA_Iref_BLLoadDis_Read_Target-(SA_Iref_BLLoadDis_Read_Target*0.25);
   if(GL_DO_IREF_PMOS_TRIM)  
      SA_Iref_BLLoadDis_Read_ULim = SA_Iref_BLLoadDis_Read_Target+(SA_Iref_BLLoadDis_Read_Target*0.25);
   else
      SA_Iref_BLLoadDis_Read_ULim = SA_Iref_BLLoadDis_Read_Target+(SA_Iref_BLLoadDis_Read_Target*0.10);
   GL_DO_TWLOGALL_ISA_NLD = false;  /*false=disable tw log all sense amp*/


    /*++++ TCR 84 CSFG Stress ++++*/
   CSFG_VCG_Prog            = 5.0V;
   CSFG_VCG_IMAX_Prog       = 100mA;
   CSFG_VCG_TStress_Prog    = 1s;
   CSFG_VCS_Prog            = 5.0V;
   CSFG_VCS_IMAX_Prog       = 100mA;
   CSFG_VCS_TStress_Prog    = 1s;
   CSFG_VBL_Prog            = 3.3V;
   CSFG_VBL_IMAX_Prog       = 100mA;
   CSFG_VBL_TStress_Prog    = 1s;
   CSFG_VEG_Prog            = 0.0V;
   CSFG_VEG_IMAX_Prog       = 100mA;
   CSFG_VEG_TStress_Prog    = 1s;
   CSFG_VWL_Prog            = 0.0V;
   CSFG_VWL_IMAX_Prog       = 100mA;
   CSFG_VWL_TStress_Prog    = 1s;


    /*++++ TCR 86 Force VHV -- Stress ++++*/
   VHV_VStress_Prog = 11.2V;
   VHV_TStress_Prog = 50ms;
   VHV_VStress_Pvfy =  3.4V;
   VHV_TStress_Pvfy = 50ms;
   VHV_VStress_Ers  = 13.0V;
   VHV_TStress_Ers  = 50ms;
    /*total pump leakage*/
   VHV_Leak_Target  = 126uA;
   VHV_Leak_ULim    = VHV_Leak_Target;
   VHV_Leak_LLim    = -1*(VHV_Leak_ULim*0.10);


    /*++++ TCR 6 Sense Amp Noise per bank ++++*/
   SAMP_NOISE_ULIM[0] = 8.5uA;
   SAMP_NOISE_ULIM[1] = 8.5uA;
   SAMP_NOISE_ULIM[2] = 8.5uA;
   SAMP_NOISE_ULIM[3] = 8.5uA;
   SAMP_NOISE_ULIM[4] = 8.5uA;
   SAMP_NOISE_ULIM[5] = 8.5uA;
   SAMP_NOISE_ULIM[6] = 8.5uA;
   SAMP_NOISE_ULIM[7] = 8.5uA;


    /*==== TCR RECORD TABLE ====*/

    /*++++ TCR 0 - TP1/TP2 Leakage ++++*/
    /*Note: Use ReadMode=0v, ProgMode=3.6v*/
   TCR.TP1_Ena[0] = true;
   TCR.TP1_MeasType[0] = MeasCurrType;
   TCR.TP1_VRange[0][ReadMode] = TP1_LEAK_VLO;
   TCR.TP1_IRange[0][ReadMode] = TP1_LEAK_VLO_ULim;
   TCR.TP1_ULim[0][ReadMode]   = TP1_LEAK_VLO_ULim;
   TCR.TP1_LLim[0][ReadMode]   = TP1_LEAK_VLO_LLim;

   TCR.TP1_VRange[0][ProgMode] = TP1_LEAK_VHI;
   TCR.TP1_IRange[0][ProgMode] = TP1_LEAK_VHI_ULim;
   TCR.TP1_ULim[0][ProgMode]   = TP1_LEAK_VHI_ULim;
   TCR.TP1_LLim[0][ProgMode]   = TP1_LEAK_VHI_LLim;

   TCR.TP2_Ena[0] = true;
   TCR.TP2_MeasType[0] = MeasCurrType;
   TCR.TP2_VRange[0][ReadMode] = TP2_LEAK_VLO;
   TCR.TP2_IRange[0][ReadMode] = TP2_LEAK_VLO_ULim;
   TCR.TP2_ULim[0][ReadMode]   = TP2_LEAK_VLO_ULim;
   TCR.TP2_LLim[0][ReadMode]   = TP2_LEAK_VLO_LLim;

   TCR.TP2_VRange[0][ProgMode] = TP2_LEAK_VHI;
   TCR.TP2_IRange[0][ProgMode] = TP2_LEAK_VHI_ULim;
   TCR.TP2_ULim[0][ProgMode]   = TP2_LEAK_VHI_ULim;
   TCR.TP2_LLim[0][ProgMode]   = TP2_LEAK_VHI_LLim;

   TCR.TP3_Ena[0] = false;
   TCR.TP4_Ena[0] = false;
   TCR.TP5_Ena[0] = false;
   TCR.TADC_Ena[0] = false;

    /*++++ TCR 1 - BitLine Access (CG) ++++*/
    /*tp1->cg, tp2->bitline*/
   TCR.TP1_Ena[1] = true;
   TCR.TP1_MeasType[1] = ForceVoltType;
   TCR.TP1_VRange[1][ProgMode] = VCG2P5_Read_Target;  /*dummy*/
   TCR.TP1_IRange[1][ProgMode] = 100mA;
   TCR.TP1_ULim[1][ProgMode]   = VCG2P5_Read_Target;
   TCR.TP1_LLim[1][ProgMode]   = VCG2P5_Read_Target;

   TCR.TP2_Ena[1] = true;
   TCR.TP2_VRange[1][ProgMode] = VCG2P5_Read_Target;  /*dummy*/
   TCR.TP2_IRange[1][ProgMode] = 50uA;
   TCR.TP2_ULim[1][ProgMode]   = 50uA;
   TCR.TP2_LLim[1][ProgMode]   = 0uA;

   TCR.TP3_Ena[1] = false;
   TCR.TP4_Ena[1] = false;
   TCR.TP5_Ena[1] = false;
   TCR.TADC_Ena[1] = false;

    /*++++ TCR 5  Bank Vsns -- external force VCG ++++*/
    /*tp1->cg*/
   TCR.TP1_Ena[5 ] = true;
   TCR.TP1_MeasType[5 ] = ForceVoltType;
   TCR.TP1_VRange[5 ][ReadMode] = VCG2P5_Read_Target;  /*VSNS_VCG_Read;*/
   TCR.TP1_IRange[5 ][ReadMode] = 100mA;
   TCR.TP1_ULim[5 ][ReadMode]   = VCG2P5_Read_Target;  /*VSNS_VCG_Read;*/
   TCR.TP1_LLim[5 ][ReadMode]   = VCG2P5_Read_Target;  /*VSNS_VCG_Read;*/

   TCR.TP2_Ena[5 ] = false;
   TCR.TP3_Ena[5 ] = false;
   TCR.TP4_Ena[5 ] = false;
   TCR.TP5_Ena[5 ] = false;
   TCR.TADC_Ena[5 ] = false;


    /*++++ TCR 6  Bank Vsns -- external force VCG/Iref ++++*/
    /*tp1->cg, tp2->iref, refcg=vcg2p5*/
   TCR.TP1_Ena[6 ] = true;
   TCR.TP1_MeasType[6 ] = ForceVoltType;
   TCR.TP1_VRange[6 ][ReadMode] = 4.4V;
   TCR.TP1_IRange[6 ][ReadMode] = 100mA;
   TCR.TP1_ULim[6 ][ReadMode]   = 4.4V;
   TCR.TP1_LLim[6 ][ReadMode]   = 0V;

   TCR.TP2_Ena[6 ] = true;
   TCR.TP2_MeasType[6 ] = ForceCurrType;
   TCR.TP2_VRange[6 ][ReadMode] = 2.5V;
   TCR.TP2_IRange[6 ][ReadMode] = 40uA;  /*Bank_Iref_Read_ULim;*/
   TCR.TP2_ULim[6 ][ReadMode]   = 30uA;  /*Bank_Iref_Read_ULim;*/
   TCR.TP2_LLim[6 ][ReadMode]   = 1uA;  /*Bank_Iref_Read_LLim;*/

   TCR.TP3_Ena[6 ] = false;
   TCR.TP4_Ena[6 ] = false;
   TCR.TP5_Ena[6 ] = false;
   TCR.TADC_Ena[6 ] = false;


    /*++++ TCR 7  Bank CGS All -- CG Leakage test ++++*/
    /*tp1->CG, WL/BL/CS/EG=gnd*/
    /*NOTE: must ramp from vhv->vstr->vhv 7v/us*/
   TCR.TP1_Ena[7 ] = true;
   TCR.TP1_MeasType[7 ] = MeasCurrType;
   TCR.TP1_VRange[7 ][ProgMode] = CGS_VCG_LEAK_Prog;
   TCR.TP1_IRange[7 ][ProgMode] = CGS_VCG_LEAK_Prog_ULim;
   TCR.TP1_ULim[7 ][ProgMode]   = CGS_VCG_LEAK_Prog_ULim;
   TCR.TP1_LLim[7 ][ProgMode]   = CGS_VCG_LEAK_Prog_LLim;
   TCR.TP1_FTime[7 ][ProgMode]  = CGS_VCG_LEAK_TStress_Prog;
   TCR.TP1_VCharLo[7 ][ProgMode]= 0V;  /*use for ramping*/
   TCR.TP1_VCharHi[7 ][ProgMode]= CGS_VCG_LEAK_Prog;  /*use for ramping*/
    /*use pvfy for cg stress lkg*/
   TCR.TP1_VRange[7 ][PvfyMode] = CGEG_VCG_LEAK_Pvfy;
   TCR.TP1_IRange[7 ][PvfyMode] = CGEG_VCG_LEAK_Pvfy_ULim;
   TCR.TP1_ULim[7 ][PvfyMode]   = CGEG_VCG_LEAK_Pvfy_ULim;
   TCR.TP1_LLim[7 ][PvfyMode]   = CGEG_VCG_LEAK_Pvfy_LLim;
   TCR.TP1_FTime[7 ][PvfyMode]  = CGEG_VCG_LEAK_TStress_Pvfy;
   TCR.TP1_VCharLo[7 ][PvfyMode]= 0V;  /*use for ramping*/
   TCR.TP1_VCharHi[7 ][PvfyMode]= CGEG_VCG_LEAK_Pvfy;  /*use for ramping*/

   TCR.TP2_Ena[7 ] = false;
   TCR.TP3_Ena[7 ] = false;
   TCR.TP4_Ena[7 ] = false;
   TCR.TP5_Ena[7 ] = false;
   TCR.TADC_Ena[7 ] = false;


    /*++++ TCR 8  Bank CGS Odd -- CG Leakage test ++++*/
    /*tp1->CG, WL/BL/CS/EG=gnd*/
    /*NOTE: must ramp from vhv->vstr->vhv 7v/us*/
   TCR.TP1_Ena[8 ] = true;
   TCR.TP1_MeasType[8 ] = MeasCurrType;
   TCR.TP1_VRange[8 ][ProgMode] = CGS_VCG_LEAK_Prog;
   TCR.TP1_IRange[8 ][ProgMode] = CGS_VCG_LEAK_Prog_ULim;
   TCR.TP1_ULim[8 ][ProgMode]   = CGS_VCG_LEAK_Prog_ULim;
   TCR.TP1_LLim[8 ][ProgMode]   = CGS_VCG_LEAK_Prog_LLim;
   TCR.TP1_FTime[8 ][ProgMode]  = CGS_VCG_LEAK_TStress_Prog;
   TCR.TP1_VCharLo[8 ][ProgMode]= 0V;
   TCR.TP1_VCharHi[8 ][ProgMode]= CGS_VCG_LEAK_Prog;

   TCR.TP2_Ena[8 ] = false;
   TCR.TP3_Ena[8 ] = false;
   TCR.TP4_Ena[8 ] = false;
   TCR.TP5_Ena[8 ] = false;
   TCR.TADC_Ena[8 ] = false;


    /*++++ TCR 9  Bank CGS Even -- CG Leakage test ++++*/
    /*tp1->CG, WL/BL/CS/EG=gnd*/
    /*NOTE: must ramp from vhv->vstr->vhv 7v/us*/
   TCR.TP1_Ena[9 ] = true;
   TCR.TP1_MeasType[9 ] = MeasCurrType;
   TCR.TP1_VRange[9 ][ProgMode] = CGS_VCG_LEAK_Prog;
   TCR.TP1_IRange[9 ][ProgMode] = CGS_VCG_LEAK_Prog_ULim;
   TCR.TP1_ULim[9 ][ProgMode]   = CGS_VCG_LEAK_Prog_ULim;
   TCR.TP1_LLim[9 ][ProgMode]   = CGS_VCG_LEAK_Prog_LLim;
   TCR.TP1_FTime[9 ][ProgMode]  = CGS_VCG_LEAK_TStress_Prog;
   TCR.TP1_VCharLo[9 ][ProgMode]= 0V; 
   TCR.TP1_VCharHi[9 ][ProgMode]= CGS_VCG_LEAK_Prog;

   TCR.TP2_Ena[9 ] = false;
   TCR.TP3_Ena[9 ] = false;
   TCR.TP4_Ena[9 ] = false;
   TCR.TP5_Ena[9 ] = false;
   TCR.TADC_Ena[9 ] = false;


    /*++++ TCR 13 Bank EG/CS Stress -- EG/CS Leakage test ++++*/
    /*tp2->EG/CS, WL/BL/CG=gnd*/
    /*NOTE: must ramp from vsl->vstr->vsl 7v/us*/
   TCR.TP2_Ena[13] = true;
   TCR.TP2_MeasType[13] = MeasCurrType;
   TCR.TP2_VRange[13][ProgMode] = EGCSS_VEGCS_LEAK_Prog;
   TCR.TP2_IRange[13][ProgMode] = EGCSS_VEGCS_LEAK_Prog_ULim;
   TCR.TP2_ULim[13][ProgMode]   = EGCSS_VEGCS_LEAK_Prog_ULim;
   TCR.TP2_LLim[13][ProgMode]   = EGCSS_VEGCS_LEAK_Prog_LLim;
   TCR.TP2_FTime[13][ProgMode]  = EGCSS_VEGCS_LEAK_TStress_Prog;
   TCR.TP2_VCharLo[13][ProgMode]= VSL_Target;  /*use for ramping*/
   TCR.TP2_VCharHi[13][ProgMode]= EGCSS_VEGCS_LEAK_Prog;  /*use for ramping*/

   TCR.TP1_Ena[13] = false;
   TCR.TP3_Ena[13] = false;
   TCR.TP4_Ena[13] = false;
   TCR.TP5_Ena[13] = false;
   TCR.TADC_Ena[13] = false;


    /*++++ TCR 15 Bank BLS All -- BL Leakage test ++++*/
    /*tp1->BL, WL/CG/CS/EG=gnd*/
    /*NOTE: must ramp from vinh->vstr->vinh 7v/us*/
   TCR.TP1_Ena[15] = true;
   TCR.TP1_MeasType[15] = MeasCurrType;
   TCR.TP1_VRange[15][ProgMode] = BLS_VBL_LEAK_Prog;
   TCR.TP1_IRange[15][ProgMode] = BLS_VBL_LEAK_Prog_ULim_Retest;
   TCR.TP1_ULim[15][ProgMode]   = BLS_VBL_LEAK_Prog_ULim;
   TCR.TP1_LLim[15][ProgMode]   = BLS_VBL_LEAK_Prog_LLim;
   TCR.TP1_FTime[15][ProgMode]  = BLS_VBL_LEAK_TStress_Prog;
   TCR.TP1_VCharLo[15][ProgMode]= 0V;  /*use for ramping*/
   TCR.TP1_VCharHi[15][ProgMode]= BLS_VBL_LEAK_Prog;  /*use for ramping*/

   TCR.TP2_Ena[15] = false;
   TCR.TP3_Ena[15] = false;
   TCR.TP4_Ena[15] = false;
   TCR.TP5_Ena[15] = false;
   TCR.TADC_Ena[15] = false;


    /*++++ TCR 16 Bank BLS Even -- BL Leakage test ++++*/
    /*tp1->BL, WL/CG/CS/EG=gnd*/
    /*NOTE: must ramp from vinh->vstr->vinh 7v/us*/
   TCR.TP1_Ena[16] = true;
   TCR.TP1_MeasType[16] = MeasCurrType;
   TCR.TP1_VRange[16][ProgMode] = BLS_VBL_LEAK_Prog;
   TCR.TP1_IRange[16][ProgMode] = BLS_VBL_LEAK_Prog_ULim_Retest;
   TCR.TP1_ULim[16][ProgMode]   = BLS_VBL_LEAK_Prog_ULim;
   TCR.TP1_LLim[16][ProgMode]   = BLS_VBL_LEAK_Prog_LLim;
   TCR.TP1_FTime[16][ProgMode]  = BLS_VBL_LEAK_TStress_Prog;
   TCR.TP1_VCharLo[16][ProgMode]= 0V;
   TCR.TP1_VCharHi[16][ProgMode]= BLS_VBL_LEAK_Prog;

   TCR.TP2_Ena[16] = false;
   TCR.TP3_Ena[16] = false;
   TCR.TP4_Ena[16] = false;
   TCR.TP5_Ena[16] = false;
   TCR.TADC_Ena[16] = false;


    /*++++ TCR 17 Bank BLS Odd -- BL Leakage test ++++*/
    /*tp1->BL, WL/CG/CS/EG=gnd*/
    /*NOTE: must ramp from vinh->vstr->vinh 7v/us*/
   TCR.TP1_Ena[17] = true;
   TCR.TP1_MeasType[17] = MeasCurrType;
   TCR.TP1_VRange[17][ProgMode] = BLS_VBL_LEAK_Prog;
   TCR.TP1_IRange[17][ProgMode] = BLS_VBL_LEAK_Prog_ULim_Retest;
   TCR.TP1_ULim[17][ProgMode]   = BLS_VBL_LEAK_Prog_ULim;
   TCR.TP1_LLim[17][ProgMode]   = BLS_VBL_LEAK_Prog_LLim;
   TCR.TP1_FTime[17][ProgMode]  = BLS_VBL_LEAK_TStress_Prog;
   TCR.TP1_VCharLo[17][ProgMode]= 0V; 
   TCR.TP1_VCharHi[17][ProgMode]= BLS_VBL_LEAK_Prog;

   TCR.TP2_Ena[17] = false;
   TCR.TP3_Ena[17] = false;
   TCR.TP4_Ena[17] = false;
   TCR.TP5_Ena[17] = false;
   TCR.TADC_Ena[17] = false;


    /*++++ TCR 23 Bank ers EG Stress -- EG Leakage test ++++*/
    /*tp1->EG, WL/BL/CG/CS=gnd*/
    /*NOTE: must ramp from vhv->vstr->vhv 7v/us*/
   TCR.TP1_Ena[23] = true;
   TCR.TP1_MeasType[23] = MeasCurrType;
   TCR.TP1_VRange[23][ErsMode ] = EGS_VEG_LEAK_Ers;
   TCR.TP1_IRange[23][ErsMode ] = EGS_VEG_LEAK_Ers_ULim;
   TCR.TP1_ULim[23][ErsMode ]   = EGS_VEG_LEAK_Ers_ULim;
   TCR.TP1_LLim[23][ErsMode ]   = EGS_VEG_LEAK_Ers_LLim;
   TCR.TP1_FTime[23][ErsMode ]  = EGS_VEG_LEAK_TStress_Ers;
   TCR.TP1_VCharLo[23][ErsMode ]= 0V;  /*VHV_Ers_Target;} {use for ramping*/
   TCR.TP1_VCharHi[23][ErsMode ]= EGS_VEG_LEAK_Ers;  /*use for ramping*/

    /*use Read for EGFG1 stress cond*/
   TCR.TP1_VRange[23][ReadMode] = EGFG_VEG_Read;
   TCR.TP1_IRange[23][ReadMode] = EGFG_VEG_IMAX_Read;
   TCR.TP1_ULim[23][ReadMode]   = EGFG_VEG_Read;
   TCR.TP1_LLim[23][ReadMode]   = EGFG_VEG_Read;
   TCR.TP1_FTime[23][ReadMode]  = EGFG_VEG_TStress_Read;
   TCR.TP1_VCharLo[23][ReadMode]= 0V;  /*VHV_Ers_Target;} {use for ramping*/
   TCR.TP1_VCharHi[23][ReadMode]= EGFG_VEG_Read;  /*use for ramping*/

    /*use Prog for EGFG2 stress cond*/
   TCR.TP1_VRange[23][ProgMode] = EGFG_VEG_Prog;
   TCR.TP1_IRange[23][ProgMode] = EGFG_VEG_IMAX_Prog;
   TCR.TP1_ULim[23][ProgMode]   = EGFG_VEG_Prog;
   TCR.TP1_LLim[23][ProgMode]   = EGFG_VEG_Prog;
   TCR.TP1_FTime[23][ProgMode]  = EGFG_VEG_TStress_Prog;
   TCR.TP1_VCharLo[23][ProgMode]= 0V;  /*VHV_Ers_Target;} {use for ramping*/
   TCR.TP1_VCharHi[23][ProgMode]= EGFG_VEG_Prog;  /*use for ramping*/

    /*use Pvfy for EGFG3 stress cond*/
   TCR.TP1_VRange[23][PvfyMode] = EGFG_VEG_Pvfy;
   TCR.TP1_IRange[23][PvfyMode] = EGFG_VEG_IMAX_Pvfy;
   TCR.TP1_ULim[23][PvfyMode]   = EGFG_VEG_Pvfy;
   TCR.TP1_LLim[23][PvfyMode]   = EGFG_VEG_Pvfy;
   TCR.TP1_FTime[23][PvfyMode]  = EGFG_VEG_TStress_Pvfy;
   TCR.TP1_VCharLo[23][PvfyMode]= 0V;  /*VHV_Ers_Target;} {use for ramping*/
   TCR.TP1_VCharHi[23][PvfyMode]= EGFG_VEG_Pvfy;  /*use for ramping*/

    /*use Evfy for EGFG4 stress cond*/
   TCR.TP1_VRange[23][EvfyMode] = EGFG_VEG_Evfy;
   TCR.TP1_IRange[23][EvfyMode] = EGFG_VEG_IMAX_Evfy;
   TCR.TP1_ULim[23][EvfyMode]   = EGFG_VEG_Evfy;
   TCR.TP1_LLim[23][EvfyMode]   = EGFG_VEG_Evfy;
   TCR.TP1_FTime[23][EvfyMode]  = EGFG_VEG_TStress_Evfy;
   TCR.TP1_VCharLo[23][EvfyMode]= 0V;  /*VHV_Ers_Target;} {use for ramping*/
   TCR.TP1_VCharHi[23][EvfyMode]= EGFG_VEG_Evfy;  /*use for ramping*/

    /*use Cvfy for EGFG5 stress cond*/
   TCR.TP1_VRange[23][CvfyMode] = EGFG_VEG_Cvfy;
   TCR.TP1_IRange[23][CvfyMode] = EGFG_VEG_IMAX_Cvfy;
   TCR.TP1_ULim[23][CvfyMode]   = EGFG_VEG_Cvfy;
   TCR.TP1_LLim[23][CvfyMode]   = EGFG_VEG_Cvfy;
   TCR.TP1_FTime[23][CvfyMode]  = EGFG_VEG_TStress_Cvfy;
   TCR.TP1_VCharLo[23][CvfyMode]= 0V;  /*VHV_Ers_Target;} {use for ramping*/
   TCR.TP1_VCharHi[23][CvfyMode]= EGFG_VEG_Cvfy;  /*use for ramping*/

   TCR.TP2_Ena[23] = false;
   TCR.TP3_Ena[23] = false;
   TCR.TP4_Ena[23] = false;
   TCR.TP5_Ena[23] = false;
   TCR.TADC_Ena[23] = false;


    /*++++ TCR 25 (Bank) ++++*/
    /*IREF: TP1=CG, TP2=Iref*/
   TCR.TP1_Ena[25] = true;
   TCR.TP1_MeasType[25] = ForceVoltType;
   TCR.TP1_VRange[25][ReadMode] = Bank_Iref_VCG_Read;
   TCR.TP1_IRange[25][ReadMode] = 100mA;
   TCR.TP1_ULim[25][ReadMode]   = Bank_Iref_VCG_Read;
   TCR.TP1_LLim[25][ReadMode]   = Bank_Iref_VCG_Read;

   TCR.TP1_VRange[25][PvfyMode] = Bank_Iref_VCG_Pvfy;
   TCR.TP1_IRange[25][PvfyMode] = 100mA;
   TCR.TP1_ULim[25][PvfyMode]   = Bank_Iref_VCG_Pvfy;
   TCR.TP1_LLim[25][PvfyMode]   = Bank_Iref_VCG_Pvfy;

   TCR.TP1_VRange[25][EvfyMode] = Bank_Iref_VCG_Evfy;
   TCR.TP1_IRange[25][EvfyMode] = 100mA;
   TCR.TP1_ULim[25][EvfyMode]   = Bank_Iref_VCG_Evfy;
   TCR.TP1_LLim[25][EvfyMode]   = Bank_Iref_VCG_Evfy;

   TCR.TP1_VRange[25][CvfyMode] = Bank_Iref_VCG_Cvfy;
   TCR.TP1_IRange[25][CvfyMode] = 100mA;
   TCR.TP1_ULim[25][CvfyMode]   = Bank_Iref_VCG_Cvfy;
   TCR.TP1_LLim[25][CvfyMode]   = Bank_Iref_VCG_Cvfy;

   TCR.TP2_Ena[25] = true;
   TCR.TP2_MeasType[25] = MeasCurrType;
   TCR.TP2_VRange[25][ReadMode] = Bank_Iref_VBL_Read;
   TCR.TP2_IRange[25][ReadMode] = Bank_Iref_Read_ULim;
   TCR.TP2_ULim[25][ReadMode]   = Bank_Iref_Read_ULim;
   TCR.TP2_LLim[25][ReadMode]   = Bank_Iref_Read_LLim;

   TCR.TP2_VRange[25][PvfyMode] = Bank_Iref_VBL_Pvfy;
   TCR.TP2_IRange[25][PvfyMode] = Bank_Iref_Pvfy_ULim;
   TCR.TP2_ULim[25][PvfyMode]   = Bank_Iref_Pvfy_ULim;
   TCR.TP2_LLim[25][PvfyMode]   = Bank_Iref_Pvfy_LLim;

   TCR.TP2_VRange[25][EvfyMode] = Bank_Iref_VBL_Evfy;
   TCR.TP2_IRange[25][EvfyMode] = Bank_Iref_Evfy_ULim;
   TCR.TP2_ULim[25][EvfyMode]   = Bank_Iref_Evfy_ULim;
   TCR.TP2_LLim[25][EvfyMode]   = Bank_Iref_Evfy_LLim;

   TCR.TP2_VRange[25][CvfyMode] = Bank_Iref_VBL_Cvfy;
   TCR.TP2_IRange[25][CvfyMode] = Bank_Iref_Cvfy_ULim;
   TCR.TP2_ULim[25][CvfyMode]   = Bank_Iref_Cvfy_ULim;
   TCR.TP2_LLim[25][CvfyMode]   = Bank_Iref_Cvfy_LLim;

    /*KChau 11/17/11 - use for internal bcc1 measurement*/
   TCR.TP1_VRange[25][ErsMode] = Bank_Iref_VCG_Cvfy;
   TCR.TP1_IRange[25][ErsMode] = 100mA;
   TCR.TP1_ULim[25][ErsMode]   = Bank_Iref_VCG_Cvfy;
   TCR.TP1_LLim[25][ErsMode]   = Bank_Iref_VCG_Cvfy;
   TCR.TP2_VRange[25][ErsMode] = Bank_Iref_VBL_Cvfy;
   TCR.TP2_IRange[25][ErsMode] = 50uA;
   TCR.TP2_ULim[25][ErsMode]   = 49uA;
   TCR.TP2_LLim[25][ErsMode]   = 0uA;

   TCR.TP3_Ena[25] = false;
   TCR.TP4_Ena[25] = false;
   TCR.TP5_Ena[25] = false;
   TCR.TADC_Ena[25] = false;


    /*++++ TCR 26 (Bank) ++++*/
    /*IREFM0: TP1=CG, TP2=Iref*/
   TCR.TP1_Ena[26] = true;
   TCR.TP1_MeasType[26] = ForceVoltType;
   TCR.TP1_VRange[26][ReadMode] = Bank_Iref_VCG_Read;
   TCR.TP1_IRange[26][ReadMode] = 100mA;
   TCR.TP1_ULim[26][ReadMode]   = Bank_Iref_VCG_Read;
   TCR.TP1_LLim[26][ReadMode]   = Bank_Iref_VCG_Read;

   TCR.TP2_Ena[26] = true;
   TCR.TP2_MeasType[26] = MeasCurrType;
   TCR.TP2_VRange[26][ReadMode] = Bank_Iref_VBL_Read;
   TCR.TP2_IRange[26][ReadMode] = Bank_Iref_RDM0_ULim;
   TCR.TP2_ULim[26][ReadMode]   = Bank_Iref_RDM0_ULim;
   TCR.TP2_LLim[26][ReadMode]   = Bank_Iref_RDM0_LLim;

   TCR.TP3_Ena[26] = false;
   TCR.TP4_Ena[26] = false;
   TCR.TP5_Ena[26] = false;
   TCR.TADC_Ena[26] = false;


    /*++++ TCR 27 (Bank) ++++*/
    /*IREFM0: TP1=CG, TP2=Iref*/
   TCR.TP1_Ena[27] = true;
   TCR.TP1_MeasType[27] = ForceVoltType;
   TCR.TP1_VRange[27][ReadMode] = Bank_Iref_VCG_Read;
   TCR.TP1_IRange[27][ReadMode] = 100mA;
   TCR.TP1_ULim[27][ReadMode]   = Bank_Iref_VCG_Read;
   TCR.TP1_LLim[27][ReadMode]   = Bank_Iref_VCG_Read;

   TCR.TP2_Ena[27] = true;
   TCR.TP2_MeasType[27] = MeasCurrType;
   TCR.TP2_VRange[27][ReadMode] = Bank_Iref_VBL_Read;
   TCR.TP2_IRange[27][ReadMode] = Bank_Iref_RDM1_ULim;
   TCR.TP2_ULim[27][ReadMode]   = Bank_Iref_RDM1_ULim;
   TCR.TP2_LLim[27][ReadMode]   = Bank_Iref_RDM1_LLim;

   TCR.TP3_Ena[27] = false;
   TCR.TP4_Ena[27] = false;
   TCR.TP5_Ena[27] = false;
   TCR.TADC_Ena[27] = false;

    /*++++ TCR 28,29,30 (Bank) Internal IREF,VCG: TP1=CG, TP2=Iref ++++*/
   TCR.TP1_Ena[28] = true;
   TCR.TP1_MeasType[28] = MeasVoltType;
   TCR.TP1_VRange[28][ReadMode] = VCG2P5_Read_ULim;
   TCR.TP1_IRange[28][ReadMode] = 10uA;
   TCR.TP1_ULim[28][ReadMode]   = VCG2P5_Read_ULim;
   TCR.TP1_LLim[28][ReadMode]   = VCG2P5_Read_LLim;

   TCR.TP1_VRange[28][PvfyMode] = VCG2P5_Read_ULim;
   TCR.TP1_IRange[28][PvfyMode] = 10uA;
   TCR.TP1_ULim[28][PvfyMode]   = VCG2P5_Read_ULim;
   TCR.TP1_LLim[28][PvfyMode]   = VCG2P5_Read_LLim;

   TCR.TP1_VRange[28][EvfyMode] = VCG2P5_Read_ULim;
   TCR.TP1_IRange[28][EvfyMode] = 10uA;
   TCR.TP1_ULim[28][EvfyMode]   = VCG2P5_Read_ULim;
   TCR.TP1_LLim[28][EvfyMode]   = VCG2P5_Read_LLim;

   TCR.TP1_VRange[28][CvfyMode] = VCG2P5_Read_ULim;
   TCR.TP1_IRange[28][CvfyMode] = 10uA;
   TCR.TP1_ULim[28][CvfyMode]   = VCG2P5_Read_ULim;
   TCR.TP1_LLim[28][CvfyMode]   = VCG2P5_Read_LLim;

   TCR.TP2_Ena[28] = true;
   TCR.TP2_MeasType[28] = MeasCurrType;
   TCR.TP2_VRange[28][ReadMode] = Bank_Internal_Iref_VBL;
   TCR.TP2_IRange[28][ReadMode] = Bank_Iref_Read_ULim;
   TCR.TP2_ULim[28][ReadMode]   = Bank_Iref_Read_ULim;
   TCR.TP2_LLim[28][ReadMode]   = Bank_Iref_Read_LLim;

   TCR.TP2_VRange[28][PvfyMode] = Bank_Internal_Iref_VBL;
   TCR.TP2_IRange[28][PvfyMode] = Bank_Iref_Pvfy_ULim;
   TCR.TP2_ULim[28][PvfyMode]   = Bank_Iref_Pvfy_ULim;
   TCR.TP2_LLim[28][PvfyMode]   = Bank_Iref_Pvfy_LLim;

   TCR.TP2_VRange[28][EvfyMode] = Bank_Internal_Iref_VBL;
   TCR.TP2_IRange[28][EvfyMode] = Bank_Iref_Evfy_ULim;
   TCR.TP2_ULim[28][EvfyMode]   = Bank_Iref_Evfy_ULim;
   TCR.TP2_LLim[28][EvfyMode]   = Bank_Iref_Evfy_LLim;

   TCR.TP2_VRange[28][CvfyMode] = Bank_Internal_Iref_VBL;
   TCR.TP2_IRange[28][CvfyMode] = Bank_Iref_Cvfy_ULim;
   TCR.TP2_ULim[28][CvfyMode]   = Bank_Iref_Cvfy_ULim;
   TCR.TP2_LLim[28][CvfyMode]   = Bank_Iref_Cvfy_LLim;

   TCR.TP3_Ena[28] = false;
   TCR.TP4_Ena[28] = false;
   TCR.TP5_Ena[28] = false;
   TCR.TADC_Ena[28] = false;

    /*++++ TCR 29 (Bank) Internal IREFM0,VCG: TP1=CG, TP2=Iref ++++*/
   TCR.TP1_Ena[29] = true;
   TCR.TP1_MeasType[29] = MeasVoltType;
   TCR.TP1_VRange[29][ReadMode] = VCG2P5_Read_ULim;
   TCR.TP1_IRange[29][ReadMode] = 10uA;
   TCR.TP1_ULim[29][ReadMode]   = VCG2P5_Read_ULim;
   TCR.TP1_LLim[29][ReadMode]   = VCG2P5_Read_LLim;

   TCR.TP2_Ena[29] = true;
   TCR.TP2_MeasType[29] = MeasCurrType;
   TCR.TP2_VRange[29][ReadMode] = Bank_Internal_Iref_VBL;
   TCR.TP2_IRange[29][ReadMode] = Bank_Iref_RDM0_ULim;
   TCR.TP2_ULim[29][ReadMode]   = Bank_Iref_RDM0_ULim;
   TCR.TP2_LLim[29][ReadMode]   = Bank_Iref_RDM0_LLim;

   TCR.TP3_Ena[29] = false;
   TCR.TP4_Ena[29] = false;
   TCR.TP5_Ena[29] = false;
   TCR.TADC_Ena[29] = false;


    /*++++ TCR 30 (Bank) Internal IREFM1,VCG: TP1=CG, TP2=Iref ++++*/
   TCR.TP1_Ena[30] = true;
   TCR.TP1_MeasType[30] = MeasVoltType;
   TCR.TP1_VRange[30][ReadMode] = VCG2P5_Read_ULim;
   TCR.TP1_IRange[30][ReadMode] = 10uA;
   TCR.TP1_ULim[30][ReadMode]   = VCG2P5_Read_ULim;
   TCR.TP1_LLim[30][ReadMode]   = VCG2P5_Read_LLim;

   TCR.TP2_Ena[30] = true;
   TCR.TP2_MeasType[30] = MeasCurrType;
   TCR.TP2_VRange[30][ReadMode] = Bank_Internal_Iref_VBL;
   TCR.TP2_IRange[30][ReadMode] = Bank_Iref_RDM1_ULim;
   TCR.TP2_ULim[30][ReadMode]   = Bank_Iref_RDM1_ULim;
   TCR.TP2_LLim[30][ReadMode]   = Bank_Iref_RDM1_LLim;

   TCR.TP3_Ena[30] = false;
   TCR.TP4_Ena[30] = false;
   TCR.TP5_Ena[30] = false;
   TCR.TADC_Ena[30] = false;


    /*++++ TCR 38  Force Iref ++++*/
   TCR.TP1_Ena[38] = true;
   TCR.TP1_MeasType[38] = ForceCurrType;
   TCR.TP1_VRange[38][ReadMode] = 2.5V;
   TCR.TP1_IRange[38][ReadMode] = 150uA;
   TCR.TP1_ULim[38][ReadMode]   = 100uA;
   TCR.TP1_LLim[38][ReadMode]   = 0uA;

   TCR.TP2_Ena[38] = false;
   TCR.TP3_Ena[38] = false;
   TCR.TP4_Ena[38] = false;
   TCR.TP5_Ena[38] = false;
   TCR.TADC_Ena[38] = false;


    /*++++ TCR 39  Bank Vsns -- external force VCG/Iref, including refCG ++++*/
    /*tp1->iref, tp2->vcg, refcg=tp2*/
   TCR.TP1_Ena[39] = true;
   TCR.TP1_MeasType[39] = ForceCurrType;
   TCR.TP1_VRange[39][ReadMode] = 2.5V;
   TCR.TP1_IRange[39][ReadMode] = 10nA;
   TCR.TP1_ULim[39][ReadMode]   = 2.5V;
   TCR.TP1_LLim[39][ReadMode]   = 0V;

   TCR.TP2_Ena[39] = true;
   TCR.TP2_MeasType[39] = ForceVoltType;
   TCR.TP2_VRange[39][ReadMode] = 2.5V;
   TCR.TP2_IRange[39][ReadMode] = 100mA;
   TCR.TP2_ULim[39][ReadMode]   = VCG2P5_Read_Target;
   TCR.TP2_LLim[39][ReadMode]   = VCG2P5_Read_Target;

   TCR.TP3_Ena[39] = false;
   TCR.TP4_Ena[39] = false;
   TCR.TP5_Ena[39] = false;
   TCR.TADC_Ena[39] = false;


    /*++++ TCR 40 (Bank) ++++*/
    /*PMOS IREF: TP1=CG, TP2=Iref*/
   TCR.TP1_Ena[40] = true;
   TCR.TP1_MeasType[40] = ForceVoltType;
   TCR.TP1_VRange[40][ReadMode] = Bank_IPMOS_VCG_Read;
   TCR.TP1_IRange[40][ReadMode] = 100mA;
   TCR.TP1_ULim[40][ReadMode]   = Bank_IPMOS_VCG_Read;
   TCR.TP1_LLim[40][ReadMode]   = Bank_IPMOS_VCG_Read;

   TCR.TP1_VRange[40][PvfyMode] = Bank_IPMOS_VCG_Pvfy;
   TCR.TP1_IRange[40][PvfyMode] = 100mA;
   TCR.TP1_ULim[40][PvfyMode]   = Bank_IPMOS_VCG_Pvfy;
   TCR.TP1_LLim[40][PvfyMode]   = Bank_IPMOS_VCG_Pvfy;

   TCR.TP1_VRange[40][EvfyMode] = Bank_IPMOS_VCG_Evfy;
   TCR.TP1_IRange[40][EvfyMode] = 100mA;
   TCR.TP1_ULim[40][EvfyMode]   = Bank_IPMOS_VCG_Evfy;
   TCR.TP1_LLim[40][EvfyMode]   = Bank_IPMOS_VCG_Evfy;

   TCR.TP1_VRange[40][CvfyMode] = Bank_IPMOS_VCG_Cvfy;
   TCR.TP1_IRange[40][CvfyMode] = 100mA;
   TCR.TP1_ULim[40][CvfyMode]   = Bank_IPMOS_VCG_Cvfy;
   TCR.TP1_LLim[40][CvfyMode]   = Bank_IPMOS_VCG_Cvfy;

   TCR.TP2_Ena[40] = true;
   TCR.TP2_MeasType[40] = MeasCurrType;
   TCR.TP2_VRange[40][ReadMode] = Bank_IPMOS_VBL_Read;
   TCR.TP2_IRange[40][ReadMode] = Bank_IPMOS_Read_LLim;  /*use abs(highest) for range*/
   TCR.TP2_ULim[40][ReadMode]   = Bank_IPMOS_Read_ULim;
   TCR.TP2_LLim[40][ReadMode]   = Bank_IPMOS_Read_LLim;

   TCR.TP2_VRange[40][PvfyMode] = Bank_IPMOS_VBL_Pvfy;
   TCR.TP2_IRange[40][PvfyMode] = Bank_IPMOS_Pvfy_LLim;
   TCR.TP2_ULim[40][PvfyMode]   = Bank_IPMOS_Pvfy_ULim;
   TCR.TP2_LLim[40][PvfyMode]   = Bank_IPMOS_Pvfy_LLim;

   TCR.TP2_VRange[40][EvfyMode] = Bank_IPMOS_VBL_Evfy;
   TCR.TP2_IRange[40][EvfyMode] = Bank_IPMOS_Evfy_LLim;
   TCR.TP2_ULim[40][EvfyMode]   = Bank_IPMOS_Evfy_ULim;
   TCR.TP2_LLim[40][EvfyMode]   = Bank_IPMOS_Evfy_LLim;

   TCR.TP2_VRange[40][CvfyMode] = Bank_IPMOS_VBL_Cvfy;
   TCR.TP2_IRange[40][CvfyMode] = Bank_IPMOS_Cvfy_LLim;
   TCR.TP2_ULim[40][CvfyMode]   = Bank_IPMOS_Cvfy_ULim;
   TCR.TP2_LLim[40][CvfyMode]   = Bank_IPMOS_Cvfy_LLim;

    /*used for pre-ref ers*/
   TCR.TP1_VRange[40][ProgMode] = Bank_IPMOS_VCG_Prog;
   TCR.TP1_IRange[40][ProgMode] = 100mA;
   TCR.TP1_ULim[40][ProgMode]   = Bank_IPMOS_VCG_Read;
   TCR.TP1_LLim[40][ProgMode]   = Bank_IPMOS_VCG_Read;

   TCR.TP2_VRange[40][ProgMode] = Bank_IPMOS_VBL_Prog;
   TCR.TP2_IRange[40][ProgMode] = Bank_IPMOS_Prog_LLim;
   TCR.TP2_ULim[40][ProgMode]   = Bank_IPMOS_Prog_ULim;
   TCR.TP2_LLim[40][ProgMode]   = Bank_IPMOS_Prog_LLim;

    /*used for pmos trim*/
   TCR.TP1_VRange[40][ErsMode] = Bank_IPMOS_VCG_Ers;
   TCR.TP1_IRange[40][ErsMode] = 100mA;
   TCR.TP1_ULim[40][ErsMode]   = Bank_IPMOS_VCG_Read;
   TCR.TP1_LLim[40][ErsMode]   = Bank_IPMOS_VCG_Read;

   TCR.TP2_VRange[40][ErsMode] = Bank_IPMOS_VBL_Ers;
   TCR.TP2_IRange[40][ErsMode] = Bank_IPMOS_Ers_LLim;
   TCR.TP2_ULim[40][ErsMode]   = Bank_IPMOS_Ers_ULim;
   TCR.TP2_LLim[40][ErsMode]   = Bank_IPMOS_Ers_LLim;

   TCR.TP3_Ena[40] = false;
   TCR.TP4_Ena[40] = false;
   TCR.TP5_Ena[40] = false;
   TCR.TADC_Ena[40] = false;


    /*++++ TCR 43 (Bank) Internal PMOS IREF,VCG: TP1=CG, TP2=Iref ++++*/
   TCR.TP1_Ena[43] = true;
   TCR.TP1_MeasType[43] = MeasVoltType;
   TCR.TP1_VRange[43][ReadMode] = VCG2P5_Read_ULim;
   TCR.TP1_IRange[43][ReadMode] = 10uA;
   TCR.TP1_ULim[43][ReadMode]   = VCG2P5_Read_ULim;
   TCR.TP1_LLim[43][ReadMode]   = VCG2P5_Read_LLim;

   TCR.TP1_VRange[43][PvfyMode] = VCG2P5_Read_ULim;
   TCR.TP1_IRange[43][PvfyMode] = 10uA;
   TCR.TP1_ULim[43][PvfyMode]   = VCG2P5_Read_ULim;
   TCR.TP1_LLim[43][PvfyMode]   = VCG2P5_Read_LLim;

   TCR.TP1_VRange[43][EvfyMode] = VCG2P5_Read_ULim;
   TCR.TP1_IRange[43][EvfyMode] = 10uA;
   TCR.TP1_ULim[43][EvfyMode]   = VCG2P5_Read_ULim;
   TCR.TP1_LLim[43][EvfyMode]   = VCG2P5_Read_LLim;

   TCR.TP1_VRange[43][CvfyMode] = VCG2P5_Read_ULim;
   TCR.TP1_IRange[43][CvfyMode] = 10uA;
   TCR.TP1_ULim[43][CvfyMode]   = VCG2P5_Read_ULim;
   TCR.TP1_LLim[43][CvfyMode]   = VCG2P5_Read_LLim;

   TCR.TP2_Ena[43] = true;
   TCR.TP2_MeasType[43] = MeasCurrType;
   TCR.TP2_VRange[43][ReadMode] = Bank_Internal_IPMOS_VBL;
   TCR.TP2_IRange[43][ReadMode] = Bank_IPMOS_Read_LLim;
   TCR.TP2_ULim[43][ReadMode]   = Bank_IPMOS_Read_ULim;
   TCR.TP2_LLim[43][ReadMode]   = Bank_IPMOS_Read_LLim;

   TCR.TP2_VRange[43][PvfyMode] = Bank_Internal_IPMOS_VBL;
   TCR.TP2_IRange[43][PvfyMode] = Bank_IPMOS_Pvfy_LLim;
   TCR.TP2_ULim[43][PvfyMode]   = Bank_IPMOS_Pvfy_ULim;
   TCR.TP2_LLim[43][PvfyMode]   = Bank_IPMOS_Pvfy_LLim;

   TCR.TP2_VRange[43][EvfyMode] = Bank_Internal_IPMOS_VBL;
   TCR.TP2_IRange[43][EvfyMode] = Bank_IPMOS_Evfy_LLim;
   TCR.TP2_ULim[43][EvfyMode]   = Bank_IPMOS_Evfy_ULim;
   TCR.TP2_LLim[43][EvfyMode]   = Bank_IPMOS_Evfy_LLim;

   TCR.TP2_VRange[43][CvfyMode] = Bank_Internal_IPMOS_VBL;
   TCR.TP2_IRange[43][CvfyMode] = Bank_IPMOS_Cvfy_LLim;
   TCR.TP2_ULim[43][CvfyMode]   = Bank_IPMOS_Cvfy_ULim;
   TCR.TP2_LLim[43][CvfyMode]   = Bank_IPMOS_Cvfy_LLim;

   TCR.TP3_Ena[43] = false;
   TCR.TP4_Ena[43] = false;
   TCR.TP5_Ena[43] = false;
   TCR.TADC_Ena[43] = false;


    /*++++ TCR 44 (Bank) Internal PMOS IREFM0,VCG: TP1=CG, TP2=Iref ++++*/
   TCR.TP1_Ena[44] = true;
   TCR.TP1_MeasType[44] = MeasVoltType;
   TCR.TP1_VRange[44][ReadMode] = VCG2P5_Read_ULim;
   TCR.TP1_IRange[44][ReadMode] = 10uA;
   TCR.TP1_ULim[44][ReadMode]   = VCG2P5_Read_ULim;
   TCR.TP1_LLim[44][ReadMode]   = VCG2P5_Read_LLim;

   TCR.TP2_Ena[44] = true;
   TCR.TP2_MeasType[44] = MeasCurrType;
   TCR.TP2_VRange[44][ReadMode] = Bank_Internal_IPMOS_VBL;
   TCR.TP2_IRange[44][ReadMode] = Bank_IPMOS_Read_LLim;
   TCR.TP2_ULim[44][ReadMode]   = Bank_IPMOS_Read_ULim;
   TCR.TP2_LLim[44][ReadMode]   = Bank_IPMOS_Read_LLim;

   TCR.TP3_Ena[44] = false;
   TCR.TP4_Ena[44] = false;
   TCR.TP5_Ena[44] = false;
   TCR.TADC_Ena[44] = false;


    /*++++ TCR 45 (Bank) Internal PMOS IREFM1,VCG: TP1=CG, TP2=Iref ++++*/
   TCR.TP1_Ena[45] = true;
   TCR.TP1_MeasType[45] = MeasVoltType;
   TCR.TP1_VRange[45][ReadMode] = VCG2P5_Read_ULim;
   TCR.TP1_IRange[45][ReadMode] = 10uA;
   TCR.TP1_ULim[45][ReadMode]   = VCG2P5_Read_ULim;
   TCR.TP1_LLim[45][ReadMode]   = VCG2P5_Read_LLim;

   TCR.TP2_Ena[45] = true;
   TCR.TP2_MeasType[45] = MeasCurrType;
   TCR.TP2_VRange[45][ReadMode] = Bank_Internal_IPMOS_VBL;
   TCR.TP2_IRange[45][ReadMode] = Bank_IPMOS_Read_LLim;
   TCR.TP2_ULim[45][ReadMode]   = Bank_IPMOS_Read_ULim;
   TCR.TP2_LLim[45][ReadMode]   = Bank_IPMOS_Read_LLim;

   TCR.TP3_Ena[45] = false;
   TCR.TP4_Ena[45] = false;
   TCR.TP5_Ena[45] = false;
   TCR.TADC_Ena[45] = false;


    /*++++ TCR 52 PGMFF stress ++++*/
    /*tp1->CG, tp2->CS/EG, tp3->BL, tp4->WL*/
    /*PGMFF stress*/
   TCR.TP1_Ena[52] = true;
   TCR.TP1_MeasType[52] = ForceVoltType;
   TCR.TP1_VRange[52][ProgMode] = PgmFF_VCG_Prog;
   TCR.TP1_IRange[52][ProgMode] = PgmFF_VCG_IMAX_Prog;
   TCR.TP1_ULim[52][ProgMode]   = PgmFF_VCG_Prog;
   TCR.TP1_LLim[52][ProgMode]   = PgmFF_VCG_Prog;
   TCR.TP1_FTime[52][ProgMode]  = PgmFF_VCG_TStress_Prog;
   TCR.TP1_VCharLo[52][ProgMode] = 0V;
   TCR.TP1_VCharHi[52][ProgMode] = PgmFF_VCG_Prog;

   TCR.TP2_Ena[52] = true;
   TCR.TP2_MeasType[52] = ForceVoltType;
   TCR.TP2_VRange[52][ProgMode] = PgmFF_VEGCS_Prog;
   TCR.TP2_IRange[52][ProgMode] = PgmFF_VEGCS_IMAX_Prog;
   TCR.TP2_ULim[52][ProgMode]   = PgmFF_VEGCS_Prog;
   TCR.TP2_LLim[52][ProgMode]   = PgmFF_VEGCS_Prog;
   TCR.TP2_FTime[52][ProgMode]  = PgmFF_VEGCS_TStress_Prog;
   TCR.TP2_VCharLo[52][ProgMode] = 0V;
   TCR.TP2_VCharHi[52][ProgMode] = PgmFF_VEGCS_Prog;

   TCR.TP3_Ena[52] = true;
   TCR.TP3_MeasType[52] = ForceVoltType;
   TCR.TP3_VRange[52][ProgMode] = PgmFF_VBL_Prog;
   TCR.TP3_IRange[52][ProgMode] = PgmFF_VBL_IMAX_Prog;
   TCR.TP3_ULim[52][ProgMode]   = PgmFF_VBL_Prog;
   TCR.TP3_LLim[52][ProgMode]   = PgmFF_VBL_Prog;
   TCR.TP3_FTime[52][ProgMode]  = PgmFF_VBL_TStress_Prog;
   TCR.TP3_VCharLo[52][ProgMode] = 0V;
   TCR.TP3_VCharHi[52][ProgMode] = PgmFF_VBL_Prog;

   TCR.TP4_Ena[52] = true;
   TCR.TP4_MeasType[52] = ForceVoltType;
   TCR.TP4_VRange[52][ProgMode] = PgmFF_VWL_Prog;
   TCR.TP4_IRange[52][ProgMode] = PgmFF_VWL_IMAX_Prog;
   TCR.TP4_ULim[52][ProgMode]   = PgmFF_VWL_Prog;
   TCR.TP4_LLim[52][ProgMode]   = PgmFF_VWL_Prog;
   TCR.TP4_FTime[52][ProgMode]  = PgmFF_VWL_TStress_Prog;
   TCR.TP4_VCharLo[52][ProgMode] = 0V;
   TCR.TP4_VCharHi[52][ProgMode] = PgmFF_VWL_Prog;

    /*FGWL stress*/
   TCR.TP1_VRange[52][PvfyMode] = FGWL_VCG_Pvfy;
   TCR.TP1_IRange[52][PvfyMode] = FGWL_VCG_IMAX_Pvfy;
   TCR.TP1_ULim[52][PvfyMode]   = FGWL_VCG_Pvfy;
   TCR.TP1_LLim[52][PvfyMode]   = FGWL_VCG_Pvfy;
   TCR.TP1_FTime[52][PvfyMode]  = FGWL_VCG_TStress_Pvfy;
   TCR.TP1_VCharLo[52][PvfyMode] = 0V;
   TCR.TP1_VCharHi[52][PvfyMode] = FGWL_VCG_Pvfy;

   TCR.TP2_VRange[52][PvfyMode] = FGWL_VEGCS_Pvfy;
   TCR.TP2_IRange[52][PvfyMode] = FGWL_VEGCS_IMAX_Pvfy;
   TCR.TP2_ULim[52][PvfyMode]   = FGWL_VEGCS_Pvfy;
   TCR.TP2_LLim[52][PvfyMode]   = FGWL_VEGCS_Pvfy;
   TCR.TP2_FTime[52][PvfyMode]  = FGWL_VEGCS_TStress_Pvfy;
   TCR.TP2_VCharLo[52][PvfyMode] = 0V;
   TCR.TP2_VCharHi[52][PvfyMode] = FGWL_VEGCS_Pvfy;

   TCR.TP3_VRange[52][PvfyMode] = FGWL_VBL_Pvfy;
   TCR.TP3_IRange[52][PvfyMode] = FGWL_VBL_IMAX_Pvfy;
   TCR.TP3_ULim[52][PvfyMode]   = FGWL_VBL_Pvfy;
   TCR.TP3_LLim[52][PvfyMode]   = FGWL_VBL_Pvfy;
   TCR.TP3_FTime[52][PvfyMode]  = FGWL_VBL_TStress_Pvfy;
   TCR.TP3_VCharLo[52][PvfyMode] = 0V;
   TCR.TP3_VCharHi[52][PvfyMode] = FGWL_VBL_Pvfy;

   TCR.TP4_VRange[52][PvfyMode] = FGWL_VWL_Pvfy;
   TCR.TP4_IRange[52][PvfyMode] = FGWL_VWL_IMAX_Pvfy;
   TCR.TP4_ULim[52][PvfyMode]   = FGWL_VWL_Pvfy;
   TCR.TP4_LLim[52][PvfyMode]   = FGWL_VWL_Pvfy;
   TCR.TP4_FTime[52][PvfyMode]  = FGWL_VWL_TStress_Pvfy;
   TCR.TP4_VCharLo[52][PvfyMode] = 0V;
   TCR.TP4_VCharHi[52][PvfyMode] = FGWL_VWL_Pvfy;

    /*CSFG stress*/
    /*
    TCR.TP1_VRange[52,ErsMode ] := CSFG_VCG_Ers;
    TCR.TP1_IRange[52,ErsMode ] := CSFG_VCG_IMAX_Ers;
    TCR.TP1_ULim[52,ErsMode ]   := CSFG_VCG_Ers;
    TCR.TP1_LLim[52,ErsMode ]   := CSFG_VCG_Ers;
    TCR.TP1_FTime[52,ErsMode ]  := CSFG_VCG_TStress_Ers;
 
    TCR.TP2_VRange[52,ErsMode ] := CSFG_VEGCS_Ers;
    TCR.TP2_IRange[52,ErsMode ] := CSFG_VEGCS_IMAX_Ers;
    TCR.TP2_ULim[52,ErsMode ]   := CSFG_VEGCS_Ers;
    TCR.TP2_LLim[52,ErsMode ]   := CSFG_VEGCS_Ers;
    TCR.TP2_FTime[52,ErsMode ]  := CSFG_VEGCS_TStress_Ers;
 
    TCR.TP3_VRange[52,ErsMode ] := CSFG_VBL_Ers;
    TCR.TP3_IRange[52,ErsMode ] := CSFG_VBL_IMAX_Ers;
    TCR.TP3_ULim[52,ErsMode ]   := CSFG_VBL_Ers;
    TCR.TP3_LLim[52,ErsMode ]   := CSFG_VBL_Ers;
    TCR.TP3_FTime[52,ErsMode ]  := CSFG_VBL_TStress_Ers;
 
    TCR.TP4_VRange[52,ErsMode ] := CSFG_VWL_Ers;
    TCR.TP4_IRange[52,ErsMode ] := CSFG_VWL_IMAX_Ers;
    TCR.TP4_ULim[52,ErsMode ]   := CSFG_VWL_Ers;
    TCR.TP4_LLim[52,ErsMode ]   := CSFG_VWL_Ers;
    TCR.TP4_FTime[52,ErsMode ]  := CSFG_VWL_TStress_Ers;
     */

    /*TunOx/FGWL(2) stress*/
   TCR.TP1_VRange[52][EvfyMode] = TunOx_VCG_Evfy;
   TCR.TP1_IRange[52][EvfyMode] = TunOx_VCG_IMAX_Evfy;
   TCR.TP1_ULim[52][EvfyMode]   = TunOx_VCG_Evfy;
   TCR.TP1_LLim[52][EvfyMode]   = TunOx_VCG_Evfy;
   TCR.TP1_FTime[52][EvfyMode]  = TunOx_VCG_TStress_Evfy;
   TCR.TP1_VCharLo[52][EvfyMode] = 0V;
   TCR.TP1_VCharHi[52][EvfyMode] = TunOx_VCG_Evfy;

   TCR.TP2_VRange[52][EvfyMode] = TunOx_VEGCS_Evfy;
   TCR.TP2_IRange[52][EvfyMode] = TunOx_VEGCS_IMAX_Evfy;
   TCR.TP2_ULim[52][EvfyMode]   = TunOx_VEGCS_Evfy;
   TCR.TP2_LLim[52][EvfyMode]   = TunOx_VEGCS_Evfy;
   TCR.TP2_FTime[52][EvfyMode]  = TunOx_VEGCS_TStress_Evfy;
   TCR.TP2_VCharLo[52][EvfyMode] = 0V;
   TCR.TP2_VCharHi[52][EvfyMode] = TunOx_VEGCS_Evfy;

   TCR.TP3_VRange[52][EvfyMode] = TunOx_VBL_Evfy;
   TCR.TP3_IRange[52][EvfyMode] = TunOx_VBL_IMAX_Evfy;
   TCR.TP3_ULim[52][EvfyMode]   = TunOx_VBL_Evfy;
   TCR.TP3_LLim[52][EvfyMode]   = TunOx_VBL_Evfy;
   TCR.TP3_FTime[52][EvfyMode]  = TunOx_VBL_TStress_Evfy;
   TCR.TP3_VCharLo[52][EvfyMode] = 0V;
   TCR.TP3_VCharHi[52][EvfyMode] = TunOx_VBL_Evfy;

   TCR.TP4_VRange[52][EvfyMode] = TunOx_VWL_Evfy;
   TCR.TP4_IRange[52][EvfyMode] = TunOx_VWL_IMAX_Evfy;
   TCR.TP4_ULim[52][EvfyMode]   = TunOx_VWL_Evfy;
   TCR.TP4_LLim[52][EvfyMode]   = TunOx_VWL_Evfy;
   TCR.TP4_FTime[52][EvfyMode]  = TunOx_VWL_TStress_Evfy;
   TCR.TP4_VCharLo[52][EvfyMode] = 0V;
   TCR.TP4_VCharHi[52][EvfyMode] = TunOx_VWL_Evfy;

    /*TMSC Condition TunOx/FGWL(2) stress*/
   TCR.TP1_VRange[52][CvfyMode] = TunOx_VCG_Evfy;
   TCR.TP1_IRange[52][CvfyMode] = TunOx_VCG_IMAX_Evfy;
   TCR.TP1_ULim[52][CvfyMode]   = TunOx_VCG_Evfy;
   TCR.TP1_LLim[52][CvfyMode]   = TunOx_VCG_Evfy;
   TCR.TP1_FTime[52][CvfyMode]  = TunOx_VCG_TStress_Evfy;
   TCR.TP1_VCharLo[52][CvfyMode] = 0V;
   TCR.TP1_VCharHi[52][CvfyMode] = TunOx_VCG_Evfy;

   TCR.TP2_VRange[52][CvfyMode] = TunOx_VEGCS_Cvfy;   /*TMSC condition*/
   TCR.TP2_IRange[52][CvfyMode] = TunOx_VEGCS_IMAX_Evfy;
   TCR.TP2_ULim[52][CvfyMode]   = TunOx_VEGCS_Cvfy;
   TCR.TP2_LLim[52][CvfyMode]   = TunOx_VEGCS_Cvfy;
   TCR.TP2_FTime[52][CvfyMode]  = TunOx_VEGCS_TStress_Evfy;
   TCR.TP2_VCharLo[52][CvfyMode] = 0V;
   TCR.TP2_VCharHi[52][CvfyMode] = TunOx_VEGCS_Cvfy;

   TCR.TP3_VRange[52][CvfyMode] = TunOx_VBL_Evfy;
   TCR.TP3_IRange[52][CvfyMode] = TunOx_VBL_IMAX_Evfy;
   TCR.TP3_ULim[52][CvfyMode]   = TunOx_VBL_Evfy;
   TCR.TP3_LLim[52][CvfyMode]   = TunOx_VBL_Evfy;
   TCR.TP3_FTime[52][CvfyMode]  = TunOx_VBL_TStress_Evfy;
   TCR.TP3_VCharLo[52][CvfyMode] = 0V;
   TCR.TP3_VCharHi[52][CvfyMode] = TunOx_VBL_Evfy;

   TCR.TP4_VRange[52][CvfyMode] = TunOx_VWL_Evfy;
   TCR.TP4_IRange[52][CvfyMode] = TunOx_VWL_IMAX_Evfy;
   TCR.TP4_ULim[52][CvfyMode]   = TunOx_VWL_Evfy;
   TCR.TP4_LLim[52][CvfyMode]   = TunOx_VWL_Evfy;
   TCR.TP4_FTime[52][CvfyMode]  = TunOx_VWL_TStress_Evfy;
   TCR.TP4_VCharLo[52][CvfyMode] = 0V;
   TCR.TP4_VCharHi[52][CvfyMode] = TunOx_VWL_Evfy;

   TCR.TP5_Ena[52] = false;
   TCR.TADC_Ena[52] = false;


    /*++++ TCR 53 Tunnel Oxide (FG/ONO) stress ++++*/
    /*tp1->CG, tp2->BL, WL/EG/CS=0v*/
    /*--Note: use Pvfy for ONO condition but actual is Prog mode*/
   TCR.TP1_Ena[53] = true;
   TCR.TP1_MeasType[53] = ForceVoltType;
   TCR.TP1_VRange[53][PvfyMode] = ONO_VCG_Pvfy;
   TCR.TP1_IRange[53][PvfyMode] = ONO_VCG_IMAX_Pvfy;
   TCR.TP1_ULim[53][PvfyMode]   = ONO_VCG_Pvfy;
   TCR.TP1_LLim[53][PvfyMode]   = ONO_VCG_Pvfy;
   TCR.TP1_FTime[53][PvfyMode]  = ONO_VCG_TStress_Pvfy;
   TCR.TP1_VCharLo[53][PvfyMode] = 0V;
   TCR.TP1_VCharHi[53][PvfyMode] = ONO_VCG_Pvfy;

   TCR.TP2_Ena[53] = true;
   TCR.TP2_MeasType[53] = ForceVoltType;
   TCR.TP2_VRange[53][PvfyMode] = ONO_VBL_Pvfy;
   TCR.TP2_IRange[53][PvfyMode] = ONO_VBL_IMAX_Pvfy;
   TCR.TP2_ULim[53][PvfyMode]   = ONO_VBL_Pvfy;
   TCR.TP2_LLim[53][PvfyMode]   = ONO_VBL_Pvfy;
   TCR.TP2_FTime[53][PvfyMode]  = ONO_VBL_TStress_Pvfy;
   TCR.TP2_VCharLo[53][PvfyMode] = 0V;
   TCR.TP2_VCharHi[53][PvfyMode] = ONO_VBL_Pvfy;
    /*--     --*/

   TCR.TP3_Ena[53] = false;
   TCR.TP4_Ena[53] = false;
   TCR.TP5_Ena[53] = false;
   TCR.TADC_Ena[53] = false;


    /*++++ TCR 54 Reverse Tunneling (punch thru, thinox) stress ++++*/
    /*tp1->EG/CS, tp2->BL, WL/CG=0v*/
   TCR.TP1_Ena[54] = true;
   TCR.TP1_MeasType[54] = ForceVoltType;
   TCR.TP1_VRange[54][ProgMode] = RevTunnel_VEGCS_Prog;
   TCR.TP1_IRange[54][ProgMode] = RevTunnel_VEGCS_IMAX_Prog;
   TCR.TP1_ULim[54][ProgMode]   = RevTunnel_VEGCS_Prog;
   TCR.TP1_LLim[54][ProgMode]   = RevTunnel_VEGCS_Prog;
   TCR.TP1_FTime[54][ProgMode]  = RevTunnel_VEGCS_TStress_Prog;
   TCR.TP1_VCharLo[54][ProgMode] = 0V;
   TCR.TP1_VCharHi[54][ProgMode] = RevTunnel_VEGCS_Prog;

   TCR.TP2_Ena[54] = true;
   TCR.TP2_MeasType[54] = ForceVoltType;
   TCR.TP2_VRange[54][ProgMode] = RevTunnel_VBL_Prog;
   TCR.TP2_IRange[54][ProgMode] = RevTunnel_VBL_IMAX_Prog;
   TCR.TP2_ULim[54][ProgMode]   = RevTunnel_VBL_Prog;
   TCR.TP2_LLim[54][ProgMode]   = RevTunnel_VBL_Prog;
   TCR.TP2_FTime[54][ProgMode]  = RevTunnel_VBL_TStress_Prog;
   TCR.TP2_VCharLo[54][ProgMode] = 0V;
   TCR.TP2_VCharHi[54][ProgMode] = RevTunnel_VBL_Prog;
   
    /*--Note: use Pvfy for punch thru condition but actual is Prog mode*/
   TCR.TP1_VRange[54][PvfyMode] = PunchThru_VEGCS_Pvfy;
   TCR.TP1_IRange[54][PvfyMode] = PunchThru_VEGCS_IMAX_Pvfy;
   TCR.TP1_ULim[54][PvfyMode]   = PunchThru_VEGCS_Pvfy;
   TCR.TP1_LLim[54][PvfyMode]   = PunchThru_VEGCS_Pvfy;
   TCR.TP1_FTime[54][PvfyMode]  = PunchThru_VEGCS_TStress_Pvfy;
   TCR.TP1_VCharLo[54][PvfyMode] = 0V;
   TCR.TP1_VCharHi[54][PvfyMode] = PunchThru_VEGCS_Pvfy;

   TCR.TP2_VRange[54][PvfyMode] = PunchThru_VBL_Pvfy;
   TCR.TP2_IRange[54][PvfyMode] = PunchThru_VBL_IMAX_Pvfy;
   TCR.TP2_ULim[54][PvfyMode]   = PunchThru_VBL_Pvfy;
   TCR.TP2_LLim[54][PvfyMode]   = PunchThru_VBL_Pvfy;
   TCR.TP2_FTime[54][PvfyMode]  = PunchThru_VBL_TStress_Pvfy;
   TCR.TP2_VCharLo[54][PvfyMode] = 0V;
   TCR.TP2_VCharHi[54][PvfyMode] = PunchThru_VBL_Pvfy;
    /*--     --*/

    /*--Note: use Ers for thin oxide condition but actual is Prog mode*/
   TCR.TP1_VRange[54][ErsMode ] = ThinOxide_VEGCS_Ers;
   TCR.TP1_IRange[54][ErsMode ] = ThinOxide_VEGCS_IMAX_Ers;
   TCR.TP1_ULim[54][ErsMode ]   = ThinOxide_VEGCS_Ers;
   TCR.TP1_LLim[54][ErsMode ]   = ThinOxide_VEGCS_Ers;
   TCR.TP1_FTime[54][ErsMode ]  = ThinOxide_VEGCS_TStress_Ers;
   TCR.TP1_VCharLo[54][ErsMode] = 0V;
   TCR.TP1_VCharHi[54][ErsMode] = ThinOxide_VEGCS_Ers;

   TCR.TP2_VRange[54][ErsMode ] = ThinOxide_VBL_Ers;
   TCR.TP2_IRange[54][ErsMode ] = ThinOxide_VBL_IMAX_Ers;
   TCR.TP2_ULim[54][ErsMode ]   = ThinOxide_VBL_Ers;
   TCR.TP2_LLim[54][ErsMode ]   = ThinOxide_VBL_Ers;
   TCR.TP2_FTime[54][ErsMode ]  = ThinOxide_VBL_TStress_Ers;
   TCR.TP2_VCharLo[54][ErsMode] = 0V;
   TCR.TP2_VCharHi[54][ErsMode] = ThinOxide_VBL_Ers;
    /*--     --*/

   TCR.TP3_Ena[54] = false;
   TCR.TP4_Ena[54] = false;
   TCR.TP5_Ena[54] = false;
   TCR.TADC_Ena[54] = false;


    /*++++ TCR 56 Erase Ref Array External ++++*/
   TCR.TP1_Ena[56] = true;
   TCR.TP1_MeasType[56] = ForceVoltType;
   TCR.TP1_VRange[56][ErsMode ] = Bank_RefArr_VEG_Ers;
   TCR.TP1_IRange[56][ErsMode ] = Bank_RefArr_VEG_IMAX_Ers;
   TCR.TP1_ULim[56][ErsMode ]   = Bank_RefArr_VEG_Ers;
   TCR.TP1_LLim[56][ErsMode ]   = Bank_RefArr_VEG_Ers;
   TCR.TP1_FTime[56][ErsMode ]  = Bank_RefArr_VEG_Ers_PWidth;
    /*adaptive erase*/
   TCR.TP1_VRange[56][EvfyMode ] = RefArr_Ers_Adaptive_VStart;
   TCR.TP1_IRange[56][EvfyMode ] = Bank_RefArr_VEG_IMAX_Ers;
   TCR.TP1_ULim[56][EvfyMode ]   = Bank_RefArr_VEG_Ers;  /*dummy*/
   TCR.TP1_LLim[56][EvfyMode ]   = Bank_RefArr_VEG_Ers;  /*dummy*/
   TCR.TP1_FTime[56][EvfyMode ]  = RefArr_Ers_Adaptive_PWIDTH;

   TCR.TP2_Ena[56] = false;
   TCR.TP3_Ena[56] = false;
   TCR.TP4_Ena[56] = false;
   TCR.TP5_Ena[56] = false;
   TCR.TADC_Ena[56] = false;


    /*++++ TCR 58 Bank WLS All -- WL Leakage test ++++*/
    /*tp1->WL, BL/CG/CS/EG=gnd*/
    /*NOTE: must ramp from vrd->vstr->vrd 7v/us*/
   TCR.TP1_Ena[58] = true;
   TCR.TP1_MeasType[58] = MeasCurrType;
   TCR.TP1_VRange[58][ProgMode] = WLS_VWL_LEAK_Prog;
   TCR.TP1_IRange[58][ProgMode] = WLS_VWL_LEAK_Prog_ULim;
   TCR.TP1_ULim[58][ProgMode]   = WLS_VWL_LEAK_Prog_ULim;
   TCR.TP1_LLim[58][ProgMode]   = WLS_VWL_LEAK_Prog_LLim;
   TCR.TP1_FTime[58][ProgMode]  = WLS_VWL_LEAK_TStress_Prog;
   TCR.TP1_VCharLo[58][ProgMode]= 0V;  /*VRead_Target;} {use for ramping*/
   TCR.TP1_VCharHi[58][ProgMode]= WLS_VWL_LEAK_Prog;  /*use for ramping*/

    /*--Note: use Read for Read Disturb stress condition*/
    /*        special case -- force voltage so taken care inside f021_stress_func*/
   TCR.TP1_VRange[58][ReadMode] = RDISTURB_VWL_STRESS_Read;
   TCR.TP1_IRange[58][ReadMode] = RDISTURB_VWL_STRESS_IMAX_Read;
   TCR.TP1_ULim[58][ReadMode]   = RDISTURB_VWL_STRESS_Read;
   TCR.TP1_LLim[58][ReadMode]   = RDISTURB_VWL_STRESS_Read;
   TCR.TP1_FTime[58][ReadMode]  = RDISTURB_VWL_TStress_Read;
   TCR.TP1_VCharLo[58][ReadMode]= 0V;  /*VRead_Target}; {use for ramping*/
   TCR.TP1_VCharHi[58][ReadMode]= RDISTURB_VWL_STRESS_Read;  /*use for ramping*/
    /*rddisturb 2*/
   TCR.TP1_VRange[58][PvfyMode] = RDISTURB_VWL_STRESS_Pvfy;
   TCR.TP1_IRange[58][PvfyMode] = RDISTURB_VWL_STRESS_IMAX_Pvfy;
   TCR.TP1_ULim[58][PvfyMode]   = RDISTURB_VWL_STRESS_Pvfy;
   TCR.TP1_LLim[58][PvfyMode]   = RDISTURB_VWL_STRESS_Pvfy;
   TCR.TP1_FTime[58][PvfyMode]  = RDISTURB_VWL_TStress_Pvfy;
   TCR.TP1_VCharLo[58][PvfyMode]= 0V;  /*VRead_Target}; {use for ramping*/
   TCR.TP1_VCharHi[58][PvfyMode]= RDISTURB_VWL_STRESS_Pvfy;  /*use for ramping*/
    /*--     --*/

   TCR.TP2_Ena[58] = false;
   TCR.TP3_Ena[58] = false;
   TCR.TP4_Ena[58] = false;
   TCR.TP5_Ena[58] = false;
   TCR.TADC_Ena[58] = false;


    /*++++ TCR 59 Bank WLS Odd -- WL Leakage test ++++*/
    /*tp1->WL, BL/CG/CS/EG=gnd*/
    /*NOTE: must ramp from vrd->vstr->vrd 7v/us*/
   TCR.TP1_Ena[59] = true;
   TCR.TP1_MeasType[59] = MeasCurrType;
   TCR.TP1_VRange[59][ProgMode] = WLS_VWL_LEAK_Prog;
   TCR.TP1_IRange[59][ProgMode] = WLS_VWL_LEAK_Prog_ULim;
   TCR.TP1_ULim[59][ProgMode]   = WLS_VWL_LEAK_Prog_ULim;
   TCR.TP1_LLim[59][ProgMode]   = WLS_VWL_LEAK_Prog_LLim;
   TCR.TP1_FTime[59][ProgMode]  = WLS_VWL_LEAK_TStress_Prog;
   TCR.TP1_VCharLo[59][ProgMode]= 0V;
   TCR.TP1_VCharHi[59][ProgMode]= WLS_VWL_LEAK_Prog;

   TCR.TP2_Ena[59] = false;
   TCR.TP3_Ena[59] = false;
   TCR.TP4_Ena[59] = false;
   TCR.TP5_Ena[59] = false;
   TCR.TADC_Ena[59] = false;


    /*++++ TCR 60 Bank WLS Even -- WL Leakage test ++++*/
    /*tp1->WL, BL/CG/CS/EG=gnd*/
    /*NOTE: must ramp from vrd->vstr->vrd 7v/us*/
   TCR.TP1_Ena[60] = true;
   TCR.TP1_MeasType[60] = MeasCurrType;
   TCR.TP1_VRange[60][ProgMode] = WLS_VWL_LEAK_Prog;
   TCR.TP1_IRange[60][ProgMode] = WLS_VWL_LEAK_Prog_ULim;
   TCR.TP1_ULim[60][ProgMode]   = WLS_VWL_LEAK_Prog_ULim;
   TCR.TP1_LLim[60][ProgMode]   = WLS_VWL_LEAK_Prog_LLim;
   TCR.TP1_FTime[60][ProgMode]  = WLS_VWL_LEAK_TStress_Prog;
   TCR.TP1_VCharLo[60][ProgMode]= 0V;
   TCR.TP1_VCharHi[60][ProgMode]= WLS_VWL_LEAK_Prog;

   TCR.TP2_Ena[60] = false;
   TCR.TP3_Ena[60] = false;
   TCR.TP4_Ena[60] = false;
   TCR.TP5_Ena[60] = false;
   TCR.TADC_Ena[60] = false;


    /*++++ TCR 69 Meas IProg WL Driver ++++*/
   TCR.TP2_Ena[69] = true;
   TCR.TP2_MeasType[69] = MeasCurrType;
   TCR.TP2_VRange[69][ProgMode] = IVWLDRV_Prog;
   TCR.TP2_IRange[69][ProgMode] = IVWLDRV_Prog_ULim;
   TCR.TP2_ULim[69][ProgMode]   = IVWLDRV_Prog_ULim;
   TCR.TP2_LLim[69][ProgMode]   = IVWLDRV_Prog_LLim;

   TCR.TP1_Ena[69] = false;
   TCR.TP3_Ena[69] = false;
   TCR.TP4_Ena[69] = false;
   TCR.TP5_Ena[69] = false;
   TCR.TADC_Ena[69] = false;


    /*++++ TCR 70 SA Iref w/ local BL load ++++*/
   TCR.TP2_Ena[70] = true;
   TCR.TP2_MeasType[70] = MeasCurrType;
   TCR.TP2_VRange[70][ReadMode] = SA_Iref_VBLLoad_Read;
   TCR.TP2_IRange[70][ReadMode] = SA_Iref_BLLoad_Read_ULim;
   TCR.TP2_ULim[70][ReadMode]   = SA_Iref_BLLoad_Read_ULim;
   TCR.TP2_LLim[70][ReadMode]   = SA_Iref_BLLoad_Read_LLim;

   TCR.TP1_Ena[70] = false;
   TCR.TP3_Ena[70] = false;
   TCR.TP4_Ena[70] = false;
   TCR.TP5_Ena[70] = false;
   TCR.TADC_Ena[70] = false;


    /*++++ TCR 71 SA Iref w/o local BL load ++++*/
   TCR.TP2_Ena[71] = true;
   TCR.TP2_MeasType[71] = MeasCurrType;
   TCR.TP2_VRange[71][ReadMode] = SA_Iref_VBLLoadDis_Read;
   TCR.TP2_IRange[71][ReadMode] = SA_Iref_BLLoadDis_Read_ULim;
   TCR.TP2_ULim[71][ReadMode]   = SA_Iref_BLLoadDis_Read_ULim;
   TCR.TP2_LLim[71][ReadMode]   = SA_Iref_BLLoadDis_Read_LLim;

   TCR.TP1_Ena[71] = false;
   TCR.TP3_Ena[71] = false;
   TCR.TP4_Ena[71] = false;
   TCR.TP5_Ena[71] = false;
   TCR.TADC_Ena[71] = false;


    /*++++ TCR 72 Read Vsns Internal ++++*/
   TCR.TP1_Ena[72] = true;
   TCR.TP1_MeasType[72] = MeasVoltType;
   TCR.TP1_VRange[72][ReadMode] = 8V;
   TCR.TP1_IRange[72][ReadMode] = 0nA;
   TCR.TP1_ULim[72][ReadMode]   = 8V;
   TCR.TP1_LLim[72][ReadMode]   = 0V;

   TCR.TP2_Ena[72] = false;
   TCR.TP3_Ena[72] = false;
   TCR.TP4_Ena[72] = false;
   TCR.TP5_Ena[72] = false;
   TCR.TADC_Ena[72] = false;


    /*++++ TCR 83 (Bank) ++++*/
    /*VReadBUF*/
   TCR.TP2_Ena[83] = true;
   TCR.TP2_MeasType[83] = MeasVoltType;
    /*use progmode for vmin corner*/
   TCR.TP2_VRange[83][ProgMode] = VReadBUF_Prog_ULim;
   TCR.TP2_IRange[83][ProgMode] = 0nA;
   TCR.TP2_ULim[83][ProgMode]   = VReadBUF_Prog_ULim;
   TCR.TP2_LLim[83][ProgMode]   = VReadBUF_Prog_LLim;
    /*use pvfymode for vmax corner*/
   if(GL_PUMPTYPE==ESPUMP)  
   {
      TCR.TP2_VRange[83][PvfyMode] = VReadBUF_Pvfy_ULim;
      TCR.TP2_IRange[83][PvfyMode] = 0nA;
      TCR.TP2_ULim[83][PvfyMode]   = VReadBUF_Pvfy_ULim;
      TCR.TP2_LLim[83][PvfyMode]   = VReadBUF_Pvfy_LLim;
   }
   else
   {
      TCR.TP2_VRange[83][PvfyMode] = VReadBUF_Prog_ULim;  /*VReadBUF_Pvfy_ULim;*/
      TCR.TP2_IRange[83][PvfyMode] = 0nA;
      TCR.TP2_ULim[83][PvfyMode]   = VReadBUF_Prog_ULim;  /*VReadBUF_Pvfy_ULim;*/
      TCR.TP2_LLim[83][PvfyMode]   = VReadBUF_Prog_LLim;  /*VReadBUF_Pvfy_LLim;*/
   } 

   TCR.TP1_Ena[83] = false;
   TCR.TP3_Ena[83] = false;
   TCR.TP4_Ena[83] = false;
   TCR.TP5_Ena[83] = false;
   TCR.TADC_Ena[83] = false;


    /*++++ TCR 84 CSFG stress ++++*/
    /*tp1->CG, tp2->CS(SL), tp3->BL, tp4->EG, tp5->WL*/
   TCR.TP1_Ena[84] = true;
   TCR.TP1_MeasType[84] = ForceVoltType;
   TCR.TP2_Ena[84] = true;
   TCR.TP2_MeasType[84] = ForceVoltType;
   TCR.TP3_Ena[84] = true;
   TCR.TP3_MeasType[84] = ForceVoltType;
   TCR.TP4_Ena[84] = true;
   TCR.TP4_MeasType[84] = ForceVoltType;
   TCR.TP5_Ena[84] = true;
   TCR.TP4_MeasType[84] = ForceVoltType;
   TCR.TADC_Ena[84] = false;

   TCR.TP1_VRange[84][ProgMode] = CSFG_VCG_Prog;
   TCR.TP1_IRange[84][ProgMode] = CSFG_VCG_IMAX_Prog;
   TCR.TP1_ULim[84][ProgMode]   = CSFG_VCG_Prog;
   TCR.TP1_LLim[84][ProgMode]   = CSFG_VCG_Prog;
   TCR.TP1_FTime[84][ProgMode]  = CSFG_VCG_TStress_Prog;

   TCR.TP2_VRange[84][ProgMode] = CSFG_VCS_Prog;
   TCR.TP2_IRange[84][ProgMode] = CSFG_VCS_IMAX_Prog;
   TCR.TP2_ULim[84][ProgMode]   = CSFG_VCS_Prog;
   TCR.TP2_LLim[84][ProgMode]   = CSFG_VCS_Prog;
   TCR.TP2_FTime[84][ProgMode]  = CSFG_VCS_TStress_Prog;

   TCR.TP3_VRange[84][ProgMode] = CSFG_VBL_Prog;
   TCR.TP3_IRange[84][ProgMode] = CSFG_VBL_IMAX_Prog;
   TCR.TP3_ULim[84][ProgMode]   = CSFG_VBL_Prog;
   TCR.TP3_LLim[84][ProgMode]   = CSFG_VBL_Prog;
   TCR.TP3_FTime[84][ProgMode]  = CSFG_VBL_TStress_Prog;

   TCR.TP4_VRange[84][ProgMode] = CSFG_VEG_Prog;
   TCR.TP4_IRange[84][ProgMode] = CSFG_VEG_IMAX_Prog;
   TCR.TP4_ULim[84][ProgMode]   = CSFG_VEG_Prog;
   TCR.TP4_LLim[84][ProgMode]   = CSFG_VEG_Prog;
   TCR.TP4_FTime[84][ProgMode]  = CSFG_VEG_TStress_Prog;

   TCR.TP5_VRange[84][ProgMode] = CSFG_VWL_Prog;
   TCR.TP5_IRange[84][ProgMode] = CSFG_VWL_IMAX_Prog;
   TCR.TP5_ULim[84][ProgMode]   = CSFG_VWL_Prog;
   TCR.TP5_LLim[84][ProgMode]   = CSFG_VWL_Prog;
   TCR.TP5_FTime[84][ProgMode]  = CSFG_VWL_TStress_Prog;


    /*++++ TCR 86 ++++*/
    /*Force VHV*/
   TCR.TP1_Ena[86] = true;
   TCR.TP1_MeasType[86] = ForceVoltType;
   TCR.TP1_VRange[86][ProgMode] = VHV_VStress_Prog;
   TCR.TP1_IRange[86][ProgMode] = 100mA;
   TCR.TP1_ULim[86][ProgMode]   = VHV_VStress_Prog;
   TCR.TP1_LLim[86][ProgMode]   = VHV_VStress_Prog;
   TCR.TP1_FTime[86][ProgMode]  = VHV_TStress_Prog;

   TCR.TP1_VRange[86][PvfyMode] = VHV_VStress_Pvfy;
   TCR.TP1_IRange[86][PvfyMode] = 100mA;
   TCR.TP1_ULim[86][PvfyMode]   = VHV_VStress_Pvfy;
   TCR.TP1_LLim[86][PvfyMode]   = VHV_VStress_Pvfy;
   TCR.TP1_FTime[86][PvfyMode]  = VHV_TStress_Pvfy;

   TCR.TP1_VRange[86][ErsMode]  = VHV_VStress_Ers;
   TCR.TP1_IRange[86][ErsMode]  = 100mA;
   TCR.TP1_ULim[86][ErsMode]    = VHV_VStress_Ers;
   TCR.TP1_LLim[86][ErsMode]    = VHV_VStress_Ers;
   TCR.TP1_FTime[86][ErsMode]   = VHV_TStress_Ers;

    /*below used in conjunction w/ tcr 7/8/9, 23 to minus pump lkg from bnk*/
    /*cvfy for cg lkg (tcr7/8/9), evfy for eg lkg (tcr23)*/
   TCR.TP1_VRange[86][CvfyMode] = CGS_VCG_LEAK_Prog;
   TCR.TP1_IRange[86][CvfyMode] = CGS_VCG_LEAK_Prog_ULim;
   TCR.TP1_ULim[86][CvfyMode]   = CGS_VCG_LEAK_Prog_ULim;
   TCR.TP1_LLim[86][CvfyMode]   = CGS_VCG_LEAK_Prog_LLim;
   TCR.TP1_FTime[86][CvfyMode]  = CGS_VCG_LEAK_TStress_Prog;
   TCR.TP1_VCharLo[86][CvfyMode]= 0V;  /*use for ramping*/
   TCR.TP1_VCharHi[86][CvfyMode]= CGS_VCG_LEAK_Prog;  /*use for ramping*/

   TCR.TP1_VRange[86][EvfyMode] = EGS_VEG_LEAK_Ers;
   TCR.TP1_IRange[86][EvfyMode] = VHV_Leak_ULim;
   TCR.TP1_ULim[86][EvfyMode]   = VHV_Leak_ULim;
   TCR.TP1_LLim[86][EvfyMode]   = VHV_Leak_LLim;
   TCR.TP1_FTime[86][EvfyMode]  = EGS_VEG_LEAK_TStress_Ers;
   TCR.TP1_VCharLo[86][EvfyMode]= 0V;  /*VHV_Ers_Target;} {use for ramping*/
   TCR.TP1_VCharHi[86][EvfyMode]= EGS_VEG_LEAK_Ers;  /*use for ramping*/

   TCR.TP2_Ena[86] = false;
   TCR.TP3_Ena[86] = false;
   TCR.TP4_Ena[86] = false;
   TCR.TP5_Ena[86] = false;
   TCR.TADC_Ena[86] = false;


    /*++++ TCR 97 Force VBG (TP2), meas VRD (TP1) ++++*/
   TCR.TP1_Ena[97] = true;
   TCR.TP1_MeasType[97] = MeasVoltType;
   TCR.TP1_VRange[97][ReadMode] = VRead_ULim+0.5V;  /*relax limit since pre-trim*/
   TCR.TP1_IRange[97][ReadMode] = 0nA;
   TCR.TP1_ULim[97][ReadMode]   = VRead_ULim+0.5V;
   TCR.TP1_LLim[97][ReadMode]   = VRead_LLim-0.5V;

   TCR.TP2_Ena[97] = true;
   TCR.TP2_MeasType[97] = ForceVoltType;
   TCR.TP2_VRange[97][ReadMode] = MainBG_SoftTrim_VForce;
   TCR.TP2_IRange[97][ReadMode] = 100mA;
   TCR.TP2_ULim[97][ReadMode]   = MainBG_SoftTrim_VForce;
   TCR.TP2_LLim[97][ReadMode]   = MainBG_SoftTrim_VForce;

   TCR.TP3_Ena[97] = false;
   TCR.TP4_Ena[97] = false;
   TCR.TP5_Ena[97] = false;
   TCR.TADC_Ena[97] = false;

    /*++++ TCR 102 Force VBG (TP2), meas IREF (TP1) ++++*/
   TCR.TP1_Ena[102] = true;
   TCR.TP1_MeasType[102] = MeasCurrType;
   TCR.TP1_VRange[102][ReadMode] = 0V;
   TCR.TP1_IRange[102][ReadMode] = Main_Iref_LLim-5uA;
   TCR.TP1_ULim[102][ReadMode]   = Main_Iref_ULim+5uA;
   TCR.TP1_LLim[102][ReadMode]   = Main_Iref_LLim-5uA;

   TCR.TP2_Ena[102] = true;
   TCR.TP2_MeasType[102] = ForceVoltType;
   TCR.TP2_VRange[102][ReadMode] = MainBG_SoftTrim_VForce;
   TCR.TP2_IRange[102][ReadMode] = 100mA;
   TCR.TP2_ULim[102][ReadMode]   = MainBG_SoftTrim_VForce;
   TCR.TP2_LLim[102][ReadMode]   = MainBG_SoftTrim_VForce;

   TCR.TP3_Ena[102] = false;
   TCR.TP4_Ena[102] = false;
   TCR.TP5_Ena[102] = false;
   TCR.TADC_Ena[102] = false;

    /*++++ TCR 103 Force VBG (TP2), meas ICMP10U (TP1) ++++*/
   TCR.TP1_Ena[103] = true;
   TCR.TP1_MeasType[103] = MeasCurrType;
   TCR.TP1_VRange[103][ReadMode] = 0V;
   TCR.TP1_IRange[103][ReadMode] = Main_Icmp10_LLim-5uA;
   TCR.TP1_ULim[103][ReadMode]   = Main_Icmp10_ULim+5uA;
   TCR.TP1_LLim[103][ReadMode]   = Main_Icmp10_LLim-5uA;

   TCR.TP2_Ena[103] = true;
   TCR.TP2_MeasType[103] = ForceVoltType;
   TCR.TP2_VRange[103][ReadMode] = MainBG_SoftTrim_VForce;
   TCR.TP2_IRange[103][ReadMode] = 100mA;
   TCR.TP2_ULim[103][ReadMode]   = MainBG_SoftTrim_VForce;
   TCR.TP2_LLim[103][ReadMode]   = MainBG_SoftTrim_VForce;

   TCR.TP3_Ena[103] = false;
   TCR.TP4_Ena[103] = false;
   TCR.TP5_Ena[103] = false;
   TCR.TADC_Ena[103] = false;

    /*++++ TCR 107 PGMFF, FGWL stress10 & stress11 ++++*/
    /*tp1->CG, tp2->CS/EG, WL=VWL, BL=VINH*/
    /*PGMFF stress*/
   TCR.TP1_Ena[107] = true;
   TCR.TP1_MeasType[107] = ForceVoltType;
   TCR.TP1_VRange[107][ProgMode] = PgmFF_VCG_Prog;
   TCR.TP1_IRange[107][ProgMode] = PgmFF_VCG_IMAX_Prog;
   TCR.TP1_ULim[107][ProgMode]   = PgmFF_VCG_Prog;
   TCR.TP1_LLim[107][ProgMode]   = PgmFF_VCG_Prog;
   TCR.TP1_FTime[107][ProgMode]  = PgmFF_VCG_TStress_Prog;
   TCR.TP1_VCharLo[107][ProgMode] = 0V;
   TCR.TP1_VCharHi[107][ProgMode] = PgmFF_VCG_Prog;

   TCR.TP2_Ena[107] = true;
   TCR.TP2_MeasType[107] = ForceVoltType;
   TCR.TP2_VRange[107][ProgMode] = PgmFF_VEGCS_Prog;
   TCR.TP2_IRange[107][ProgMode] = PgmFF_VEGCS_IMAX_Prog;
   TCR.TP2_ULim[107][ProgMode]   = PgmFF_VEGCS_Prog;
   TCR.TP2_LLim[107][ProgMode]   = PgmFF_VEGCS_Prog;
   TCR.TP2_FTime[107][ProgMode]  = PgmFF_VEGCS_TStress_Prog;
   TCR.TP2_VCharLo[107][ProgMode] = 0V;
   TCR.TP2_VCharHi[107][ProgMode] = PgmFF_VEGCS_Prog;

    /*FGWL stress*/
   TCR.TP1_VRange[107][PvfyMode] = FGWL_VCG_Pvfy;
   TCR.TP1_IRange[107][PvfyMode] = FGWL_VCG_IMAX_Pvfy;
   TCR.TP1_ULim[107][PvfyMode]   = FGWL_VCG_Pvfy;
   TCR.TP1_LLim[107][PvfyMode]   = FGWL_VCG_Pvfy;
   TCR.TP1_FTime[107][PvfyMode]  = FGWL_VCG_TStress_Pvfy;
   TCR.TP1_VCharLo[107][PvfyMode] = 0V;
   TCR.TP1_VCharHi[107][PvfyMode] = FGWL_VCG_Pvfy;

   TCR.TP2_VRange[107][PvfyMode] = FGWL_VEGCS_Pvfy;
   TCR.TP2_IRange[107][PvfyMode] = FGWL_VEGCS_IMAX_Pvfy;
   TCR.TP2_ULim[107][PvfyMode]   = FGWL_VEGCS_Pvfy;
   TCR.TP2_LLim[107][PvfyMode]   = FGWL_VEGCS_Pvfy;
   TCR.TP2_FTime[107][PvfyMode]  = FGWL_VEGCS_TStress_Pvfy;
   TCR.TP2_VCharLo[107][PvfyMode] = 0V;
   TCR.TP2_VCharHi[107][PvfyMode] = FGWL_VEGCS_Pvfy;

   TCR.TP3_Ena[107] = false;
   TCR.TP4_Ena[107] = false;
   TCR.TP5_Ena[107] = false;
   TCR.TADC_Ena[107] = false;

    /*++++ TCR 108 TUNOX stress1 ++++*/
    /*tp1->CG, tp2->CS/EG, WL=VWL, BL=0v*/
    /*TunOx/FGWL(2) stress*/
   TCR.TP1_Ena[108] = true;
   TCR.TP1_MeasType[108] = ForceVoltType;
   TCR.TP1_VRange[108][EvfyMode] = TunOx_VCG_Evfy;
   TCR.TP1_IRange[108][EvfyMode] = TunOx_VCG_IMAX_Evfy;
   TCR.TP1_ULim[108][EvfyMode]   = TunOx_VCG_Evfy;
   TCR.TP1_LLim[108][EvfyMode]   = TunOx_VCG_Evfy;
   TCR.TP1_FTime[108][EvfyMode]  = TunOx_VCG_TStress_Evfy;
   TCR.TP1_VCharLo[108][EvfyMode] = 0V;
   TCR.TP1_VCharHi[108][EvfyMode] = TunOx_VCG_Evfy;

   TCR.TP2_Ena[108] = true;
   TCR.TP2_MeasType[108] = ForceVoltType;
   TCR.TP2_VRange[108][EvfyMode] = TunOx_VEGCS_Evfy;
   TCR.TP2_IRange[108][EvfyMode] = TunOx_VEGCS_IMAX_Evfy;
   TCR.TP2_ULim[108][EvfyMode]   = TunOx_VEGCS_Evfy;
   TCR.TP2_LLim[108][EvfyMode]   = TunOx_VEGCS_Evfy;
   TCR.TP2_FTime[108][EvfyMode]  = TunOx_VEGCS_TStress_Evfy;
   TCR.TP2_VCharLo[108][EvfyMode] = 0V;
   TCR.TP2_VCharHi[108][EvfyMode] = TunOx_VEGCS_Evfy;

    /*TSMC stress*/
   TCR.TP1_VRange[108][CvfyMode] = TunOx_VCG_Evfy;
   TCR.TP1_IRange[108][CvfyMode] = TunOx_VCG_IMAX_Evfy;
   TCR.TP1_ULim[108][CvfyMode]   = TunOx_VCG_Evfy;
   TCR.TP1_LLim[108][CvfyMode]   = TunOx_VCG_Evfy;
   TCR.TP1_FTime[108][CvfyMode]  = TunOx_VCG_TStress_Evfy;
   TCR.TP1_VCharLo[108][CvfyMode] = 0V;
   TCR.TP1_VCharHi[108][CvfyMode] = TunOx_VCG_Evfy;

   TCR.TP2_VRange[108][CvfyMode] = TunOx_VEGCS_Cvfy;  /*TSMC condition*/
   TCR.TP2_IRange[108][CvfyMode] = TunOx_VEGCS_IMAX_Evfy;
   TCR.TP2_ULim[108][CvfyMode]   = TunOx_VEGCS_Cvfy;
   TCR.TP2_LLim[108][CvfyMode]   = TunOx_VEGCS_Cvfy;
   TCR.TP2_FTime[108][CvfyMode]  = TunOx_VEGCS_TStress_Evfy;
   TCR.TP2_VCharLo[108][CvfyMode] = 0V;
   TCR.TP2_VCharHi[108][CvfyMode] = TunOx_VEGCS_Cvfy;

   TCR.TP3_Ena[108] = false;
   TCR.TP4_Ena[108] = false;
   TCR.TP5_Ena[108] = false;
   TCR.TADC_Ena[108] = false;

    /*++++ TCR 110 CSFG stress4 ++++*/
    /*tp1->CG, tp2->CS, EG=0v, WL=0v, BL=VINH*/
   TCR.TP1_Ena[110] = true;
   TCR.TP1_MeasType[110] = ForceVoltType;
   TCR.TP1_VRange[110][ProgMode] = CSFG_VCG_Prog;
   TCR.TP1_IRange[110][ProgMode] = CSFG_VCG_IMAX_Prog;
   TCR.TP1_ULim[110][ProgMode]   = CSFG_VCG_Prog;
   TCR.TP1_LLim[110][ProgMode]   = CSFG_VCG_Prog;
   TCR.TP1_FTime[110][ProgMode]  = CSFG_VCG_TStress_Prog;

   TCR.TP2_Ena[110] = true;
   TCR.TP2_MeasType[110] = ForceVoltType;
   TCR.TP2_VRange[110][ProgMode] = CSFG_VCS_Prog;
   TCR.TP2_IRange[110][ProgMode] = CSFG_VCS_IMAX_Prog;
   TCR.TP2_ULim[110][ProgMode]   = CSFG_VCS_Prog;
   TCR.TP2_LLim[110][ProgMode]   = CSFG_VCS_Prog;
   TCR.TP2_FTime[110][ProgMode]  = CSFG_VCS_TStress_Prog;

   TCR.TP3_Ena[110] = false;
   TCR.TP4_Ena[110] = false;
   TCR.TP5_Ena[110] = false;
   TCR.TADC_Ena[110] = false;


    /*++++ TCR 115 ++++*/
    /*VHV->TP1*/
   TCR.TP1_Ena[115] = true;
   TCR.TP1_MeasType[115] = MeasVoltType;
   TCR.TP1_VRange[115][ProgMode] = VHV_Prog_ULim;  /*~12v*/
   TCR.TP1_IRange[115][ProgMode] = 10uA;
   TCR.TP1_ULim[115][ProgMode]   = VHV_Prog_ULim;
   TCR.TP1_LLim[115][ProgMode]   = VHV_Prog_LLim;

   TCR.TP1_VRange[115][PvfyMode] = VHV_Pvfy_ULim;
   TCR.TP1_IRange[115][PvfyMode] = 10uA;
   TCR.TP1_ULim[115][PvfyMode]   = VHV_Pvfy_ULim;
   TCR.TP1_LLim[115][PvfyMode]   = VHV_Pvfy_LLim;

   TCR.TP1_VRange[115][ErsMode]  = VHV_Ers_ULim;
   TCR.TP1_IRange[115][ErsMode]  = 10uA;
   TCR.TP1_ULim[115][ErsMode]    = VHV_Ers_ULim;
   TCR.TP1_LLim[115][ErsMode]    = VHV_Ers_LLim;

    /*VHVREGREF->TP2*/
   TCR.TP2_Ena[115] = false ; /*true*/
   TCR.TP2_MeasType[115] = MeasVoltType;
   TCR.TP2_VRange[115][ProgMode] = VHVVregRef_Prog_ULim;
   TCR.TP2_IRange[115][ProgMode] = 10uA;
   TCR.TP2_ULim[115][ProgMode]   = VHVVregRef_Prog_ULim;
   TCR.TP2_LLim[115][ProgMode]   = VHVVregRef_Prog_LLim;

   TCR.TP2_VRange[115][PvfyMode] = VHVVregRef_Pvfy_ULim;
   TCR.TP2_IRange[115][PvfyMode] = 10uA;
   TCR.TP2_ULim[115][PvfyMode]   = VHVVregRef_Pvfy_ULim;
   TCR.TP2_LLim[115][PvfyMode]   = VHVVregRef_Pvfy_LLim;

   TCR.TP2_VRange[115][ErsMode]  = VHVVregRef_Ers_ULim;
   TCR.TP2_IRange[115][ErsMode]  = 10uA;
   TCR.TP2_ULim[115][ErsMode]    = VHVVregRef_Ers_ULim;
   TCR.TP2_LLim[115][ErsMode]    = VHVVregRef_Ers_LLim;

    /*VHALFREF->TP3*/
   TCR.TP3_Ena[115] = false ; /*true*/
   TCR.TP3_MeasType[115] = MeasVoltType;
   TCR.TP3_VRange[115][ProgMode] = VHalfRef_Prog_ULim;
   TCR.TP3_IRange[115][ProgMode] = 10uA;
   TCR.TP3_ULim[115][ProgMode]   = VHalfRef_Prog_ULim;
   TCR.TP3_LLim[115][ProgMode]   = VHalfRef_Prog_LLim;

   TCR.TP3_VRange[115][PvfyMode] = VHalfRef_Pvfy_ULim;
   TCR.TP3_IRange[115][PvfyMode] = 10uA;
   TCR.TP3_ULim[115][PvfyMode]   = VHalfRef_Pvfy_ULim;
   TCR.TP3_LLim[115][PvfyMode]   = VHalfRef_Pvfy_LLim;

   TCR.TP3_VRange[115][ErsMode]  = VHalfRef_Ers_ULim;
   TCR.TP3_IRange[115][ErsMode]  = 10uA;
   TCR.TP3_ULim[115][ErsMode]    = VHalfRef_Ers_ULim;
   TCR.TP3_LLim[115][ErsMode]    = VHalfRef_Ers_LLim;

    /*VHV->TESTADC output 1/8 factor*/
   TCR.TADC_Ena[115] = false ; /*true*/
   TCR.TADC_MeasType[115] = MeasVoltType;
   TCR.TADC_VRange[115][ProgMode] = VHV_TADC_Prog_ULim;
   TCR.TADC_IRange[115][ProgMode] = 10uA;
   TCR.TADC_ULim[115][ProgMode]   = VHV_TADC_Prog_ULim;
   TCR.TADC_LLim[115][ProgMode]   = VHV_TADC_Prog_LLim;

   TCR.TADC_VRange[115][PvfyMode] = VHV_TADC_Pvfy_ULim;
   TCR.TADC_IRange[115][PvfyMode] = 10uA;
   TCR.TADC_ULim[115][PvfyMode]   = VHV_TADC_Pvfy_ULim;
   TCR.TADC_LLim[115][PvfyMode]   = VHV_TADC_Pvfy_LLim;

   TCR.TADC_VRange[115][ErsMode]  = VHV_TADC_Ers_ULim;
   TCR.TADC_IRange[115][ErsMode]  = 10uA;
   TCR.TADC_ULim[115][ErsMode]    = VHV_TADC_Ers_ULim;
   TCR.TADC_LLim[115][ErsMode]    = VHV_TADC_Ers_LLim;

   TCR.TP4_Ena[115] = false;
   TCR.TP5_Ena[115] = false;


    /*++++ TCR 116 ++++*/
    /*VSL->TP2*/
   TCR.TP2_Ena[116] = true;
   TCR.TP2_MeasType[116] = MeasVoltType;
   TCR.TP2_VRange[116][ProgMode] = VSL_ULim;
   TCR.TP2_IRange[116][ProgMode] = 10uA;
   TCR.TP2_ULim[116][ProgMode]   = VSL_ULim;
   TCR.TP2_LLim[116][ProgMode]   = VSL_LLim;
    /*VSLNREF*/
   TCR.TP3_Ena[116] = false ; /*true*/
   TCR.TP3_MeasType[116] = MeasVoltType;
   TCR.TP3_VRange[116][ProgMode] = VSLNREF_ULim;
   TCR.TP3_IRange[116][ProgMode] = 10uA;
   TCR.TP3_ULim[116][ProgMode]   = VSLNREF_ULim;
   TCR.TP3_LLim[116][ProgMode]   = VSLNREF_LLim;

    /*VSL->TESTADC output 1/2 factor*/
   TCR.TADC_Ena[116] = false ; /*true*/
   TCR.TADC_MeasType[116] = MeasVoltType;
   TCR.TADC_VRange[116][ProgMode] = VSL_TADC_ULim;
   TCR.TADC_IRange[116][ProgMode] = 10uA;
   TCR.TADC_ULim[116][ProgMode]   = VSL_TADC_ULim;
   TCR.TADC_LLim[116][ProgMode]   = VSL_TADC_LLim;

    /*use PvfyMode for 1mA Irange*/
   TCR.TP2_VRange[116][PvfyMode] = VSL_ULim;
   TCR.TP2_IRange[116][PvfyMode] = 1mA;
   TCR.TP2_ULim[116][PvfyMode]   = VSL_ULim;
   TCR.TP2_LLim[116][PvfyMode]   = VSL_LLim;
   TCR.TP3_VRange[116][PvfyMode] = VSLNREF_ULim;
   TCR.TP3_IRange[116][PvfyMode] = 1mA;
   TCR.TP3_ULim[116][PvfyMode]   = VSLNREF_ULim;
   TCR.TP3_LLim[116][PvfyMode]   = VSLNREF_LLim;
   TCR.TADC_VRange[116][PvfyMode] = VSL_TADC_ULim;
   TCR.TADC_IRange[116][PvfyMode] = 1mA;
   TCR.TADC_ULim[116][PvfyMode]   = VSL_TADC_ULim;
   TCR.TADC_LLim[116][PvfyMode]   = VSL_TADC_LLim;

   TCR.TP1_Ena[116] = false;
   TCR.TP4_Ena[116] = false;
   TCR.TP5_Ena[116] = false;


    /*++++ TCR 117 ++++*/
    /*VRead->TP1*/
   TCR.TP1_Ena[117] = true;
   TCR.TP1_MeasType[117] = MeasVoltType;
   TCR.TP1_VRange[117][ReadMode] = VRead_ULim;
   TCR.TP1_IRange[117][ReadMode] = 10uA;
   TCR.TP1_ULim[117][ReadMode]   = VRead_ULim;
   TCR.TP1_LLim[117][ReadMode]   = VRead_LLim;
    /*VReadNREF*/
   TCR.TP3_Ena[117] = false ; /*true*/
   TCR.TP3_MeasType[117] = MeasVoltType;
   TCR.TP3_VRange[117][ReadMode] = VReadNREF_ULim;
   TCR.TP3_IRange[117][ReadMode] = 10uA;
   TCR.TP3_ULim[117][ReadMode]   = VReadNREF_ULim;
   TCR.TP3_LLim[117][ReadMode]   = VReadNREF_LLim;

    /*VRead->TESTADC output 1/1 factor*/
   TCR.TADC_Ena[117] = false ; /*true*/
   TCR.TADC_MeasType[117] = MeasVoltType;
   TCR.TADC_VRange[117][ReadMode] = VRead_TADC_ULim;
   TCR.TADC_IRange[117][ReadMode] = 10uA;
   TCR.TADC_ULim[117][ReadMode]   = VRead_TADC_ULim;
   TCR.TADC_LLim[117][ReadMode]   = VRead_TADC_LLim;

    /*use ProgMode for VRead/bgap trim with relax limit*/
   TCR.TP1_VRange[117][ProgMode] = VRead_ULim+0.5V;
   TCR.TP1_IRange[117][ProgMode] = 0nA;
   TCR.TP1_ULim[117][ProgMode]   = VRead_ULim+0.5V;
   TCR.TP1_LLim[117][ProgMode]   = VRead_LLim-0.5V;

   TCR.TP3_VRange[117][ProgMode] = VReadNREF_ULim;
   TCR.TP3_IRange[117][ProgMode] = 10uA;
   TCR.TP3_ULim[117][ProgMode]   = VReadNREF_ULim;
   TCR.TP3_LLim[117][ProgMode]   = VReadNREF_LLim;
    /*post trim vmin limits*/
   TCR.TP1_VRange[117][EvfyMode] = VRead_ULim_VMIN;
   TCR.TP1_IRange[117][EvfyMode] = 10uA;
   TCR.TP1_ULim[117][EvfyMode]   = VRead_ULim_VMIN;
   TCR.TP1_LLim[117][EvfyMode]   = VRead_LLim_VMIN;
    /*post trim vmax limits*/
   TCR.TP1_VRange[117][CvfyMode] = VRead_ULim_VMAX;
   TCR.TP1_IRange[117][CvfyMode] = 10uA;
   TCR.TP1_ULim[117][CvfyMode]   = VRead_ULim_VMAX;
   TCR.TP1_LLim[117][CvfyMode]   = VRead_LLim_VMAX;

   TCR.TP2_Ena[117] = false;
   TCR.TP4_Ena[117] = false;
   TCR.TP5_Ena[117] = false;


    /*++++ TCR 118 ++++*/
    /*VSA5->TP1*/
   TCR.TP1_Ena[118] = true;
   TCR.TP1_MeasType[118] = MeasVoltType;
   TCR.TP1_VRange[118][ReadMode] = VSA5_Read_ULim;
   TCR.TP1_IRange[118][ReadMode] = 10uA;
   TCR.TP1_ULim[118][ReadMode]   = VSA5_Read_ULim;
   TCR.TP1_LLim[118][ReadMode]   = VSA5_Read_LLim;
    /*VSA5PUMP*/
   TCR.TP2_Ena[118] = false ; /*true*/
   TCR.TP2_MeasType[118] = MeasVoltType;
   TCR.TP2_VRange[118][ReadMode] = VSA5Pump_Read_ULim;
   TCR.TP2_IRange[118][ReadMode] = 10uA;
   TCR.TP2_ULim[118][ReadMode]   = VSA5Pump_Read_ULim;
   TCR.TP2_LLim[118][ReadMode]   = VSA5Pump_Read_LLim;
    /*VSA5NREF*/
   TCR.TP3_Ena[118] = false ; /*true*/
   TCR.TP3_MeasType[118] = MeasVoltType;
   TCR.TP3_VRange[118][ReadMode] = VSA5NREF_Read_ULim;
   TCR.TP3_IRange[118][ReadMode] = 10uA;
   TCR.TP3_ULim[118][ReadMode]   = VSA5NREF_Read_ULim;
   TCR.TP3_LLim[118][ReadMode]   = VSA5NREF_Read_LLim;
    /*VSA5->TESTADC output 1/2 factor*/
   TCR.TADC_Ena[118] = false ; /*true*/
   TCR.TADC_MeasType[118] = MeasVoltType;
   TCR.TADC_VRange[118][ReadMode] = VSA5_TADC_Read_ULim;
   TCR.TADC_IRange[118][ReadMode] = 10uA;
   TCR.TADC_ULim[118][ReadMode]   = VSA5_TADC_Read_ULim;
   TCR.TADC_LLim[118][ReadMode]   = VSA5_TADC_Read_LLim;

   TCR.TP4_Ena[118] = false;
   TCR.TP5_Ena[118] = false;


    /*++++ TCR 119 ++++*/
    /*VWL*/
   TCR.TP1_Ena[119] = true;
   TCR.TP1_MeasType[119] = MeasVoltType;
   TCR.TP1_VRange[119][ReadMode] = VWL_Read_ULim;
   TCR.TP1_IRange[119][ReadMode] = 10uA;
   TCR.TP1_ULim[119][ReadMode]   = VWL_Read_ULim;
   TCR.TP1_LLim[119][ReadMode]   = VWL_Read_LLim;
    /*VWLNREF*/
   TCR.TP3_Ena[119] = false ; /*true*/
   TCR.TP3_MeasType[119] = MeasVoltType;
   TCR.TP3_VRange[119][ReadMode] = VWLNREF_Read_ULim;
   TCR.TP3_IRange[119][ReadMode] = 10uA;
   TCR.TP3_ULim[119][ReadMode]   = VWLNREF_Read_ULim;
   TCR.TP3_LLim[119][ReadMode]   = VWLNREF_Read_LLim;
    /*VWL->TESTADC output 1/1 factor*/
   TCR.TADC_Ena[119] = false ; /*true*/
   TCR.TADC_MeasType[119] = MeasVoltType;
   TCR.TADC_VRange[119][ReadMode] = VWL_TADC_Read_ULim;
   TCR.TADC_IRange[119][ReadMode] = 10uA;
   TCR.TADC_ULim[119][ReadMode]   = VWL_TADC_Read_ULim;
   TCR.TADC_LLim[119][ReadMode]   = VWL_TADC_Read_LLim;

   TCR.TP2_Ena[119] = false;
   TCR.TP4_Ena[119] = false;
   TCR.TP5_Ena[119] = false;


    /*++++ TCR 120 ++++*/
    /*VCG2P5*/
   TCR.TP1_Ena[120] = true;
   TCR.TP1_MeasType[120] = MeasVoltType;
   TCR.TP1_VRange[120][ReadMode] = VCG2P5_Read_ULim;
   TCR.TP1_IRange[120][ReadMode] = 10uA;
   TCR.TP1_ULim[120][ReadMode]   = VCG2P5_Read_ULim;
   TCR.TP1_LLim[120][ReadMode]   = VCG2P5_Read_LLim;
    /*VCG2P5NREF*/
   TCR.TP3_Ena[120] = false ; /*true*/
   TCR.TP3_MeasType[120] = MeasVoltType;
   TCR.TP3_VRange[120][ReadMode] = VCG2P5NREF_Read_ULim;
   TCR.TP3_IRange[120][ReadMode] = 10uA;
   TCR.TP3_ULim[120][ReadMode]   = VCG2P5NREF_Read_ULim;
   TCR.TP3_LLim[120][ReadMode]   = VCG2P5NREF_Read_LLim;
    /*VCG2P5->TESTADC output 1/1 factor*/
   TCR.TADC_Ena[120] = false ; /*true*/
   TCR.TADC_MeasType[120] = MeasVoltType;
   TCR.TADC_VRange[120][ReadMode] = VCG2P5_TADC_Read_ULim;
   TCR.TADC_IRange[120][ReadMode] = 10uA;
   TCR.TADC_ULim[120][ReadMode]   = VCG2P5_TADC_Read_ULim;
   TCR.TADC_LLim[120][ReadMode]   = VCG2P5_TADC_Read_LLim;

   TCR.TP2_Ena[120] = false;
   TCR.TP4_Ena[120] = false;
   TCR.TP5_Ena[120] = false;


    /*++++ TCR 121 ++++*/
    /*VINH*/
   TCR.TP1_Ena[121] = true;
   TCR.TP1_MeasType[121] = MeasVoltType;
   TCR.TP1_VRange[121][ReadMode] = VINH_Read_ULim;
   TCR.TP1_IRange[121][ReadMode] = 10uA;
   TCR.TP1_ULim[121][ReadMode]   = VINH_Read_ULim;
   TCR.TP1_LLim[121][ReadMode]   = VINH_Read_LLim;
    /*VINHNREF*/
   TCR.TP3_Ena[121] = false ; /*true*/
   TCR.TP3_MeasType[121] = MeasVoltType;
   TCR.TP3_VRange[121][ReadMode] = VINHNREF_Read_ULim;
   TCR.TP3_IRange[121][ReadMode] = 10uA;
   TCR.TP3_ULim[121][ReadMode]   = VINHNREF_Read_ULim;
   TCR.TP3_LLim[121][ReadMode]   = VINHNREF_Read_LLim;
    /*VINH->TESTADC output 1/1 factor*/
   TCR.TADC_Ena[121] = false ; /*true*/
   TCR.TADC_MeasType[121] = MeasVoltType;
   TCR.TADC_VRange[121][ReadMode] = VINH_TADC_Read_ULim;
   TCR.TADC_IRange[121][ReadMode] = 10uA;
   TCR.TADC_ULim[121][ReadMode]   = VINH_TADC_Read_ULim;
   TCR.TADC_LLim[121][ReadMode]   = VINH_TADC_Read_LLim;
    /*vmin limits*/
   TCR.TP1_VRange[121][EvfyMode] = VINH_ULim_VMIN;
   TCR.TP1_IRange[121][EvfyMode] = 10uA;
   TCR.TP1_ULim[121][EvfyMode]   = VINH_ULim_VMIN;
   TCR.TP1_LLim[121][EvfyMode]   = VINH_LLim_VMIN;
    /*vmax limits*/
   TCR.TP1_VRange[121][CvfyMode] = VINH_ULim_VMAX;
   TCR.TP1_IRange[121][CvfyMode] = 10uA;
   TCR.TP1_ULim[121][CvfyMode]   = VINH_ULim_VMAX;
   TCR.TP1_LLim[121][CvfyMode]   = VINH_LLim_VMAX;

   TCR.TP2_Ena[121] = false;
   TCR.TP4_Ena[121] = false;
   TCR.TP5_Ena[121] = false;


    /*++++ TCR 122 ++++*/
    /*VHV2XPump*/
   TCR.TP1_Ena[122] = true;
   TCR.TP1_MeasType[122] = MeasVoltType;
   TCR.TP1_VRange[122][ProgMode] = VHV2XPump_Prog_ULim;
   TCR.TP1_IRange[122][ProgMode] = 10uA;
   TCR.TP1_ULim[122][ProgMode]   = VHV2XPump_Prog_ULim;
   TCR.TP1_LLim[122][ProgMode]   = VHV2XPump_Prog_LLim;
    /*VHV2XPump->TESTADC output 1/8 factor*/
   TCR.TADC_Ena[122] = false ; /*true*/
   TCR.TADC_MeasType[122] = MeasVoltType;
   TCR.TADC_VRange[122][ProgMode] = VHV2XPump_TADC_Prog_ULim;
   TCR.TADC_IRange[122][ProgMode] = 10uA;
   TCR.TADC_ULim[122][ProgMode]   = VHV2XPump_TADC_Prog_ULim;
   TCR.TADC_LLim[122][ProgMode]   = VHV2XPump_TADC_Prog_LLim;

   TCR.TP2_Ena[122] = false;
   TCR.TP3_Ena[122] = false;
   TCR.TP4_Ena[122] = false;
   TCR.TP5_Ena[122] = false;


    /*++++ TCR 124 ++++*/
    /*VBGap->TP2*/
   TCR.TP2_Ena[124] = true;
   TCR.TP2_MeasType[124] = MeasVoltType;
   TCR.TP2_VRange[124][ReadMode] = MainBG_ULim;
   TCR.TP2_IRange[124][ReadMode] = 0nA;
   TCR.TP2_ULim[124][ReadMode]   = MainBG_ULim;
   TCR.TP2_LLim[124][ReadMode]   = MainBG_LLim;
    /*use progmode for pre trim w/ relaxed limits*/
   TCR.TP2_VRange[124][ProgMode] = MainBG_ULim+650mV;
   TCR.TP2_IRange[124][ProgMode] = 0nA;
   TCR.TP2_ULim[124][ProgMode]   = MainBG_ULim+500mV;
   TCR.TP2_LLim[124][ProgMode]   = MainBG_LLim-500mV;

    /*VBGap->TESTADC output 1 factor*/
   TCR.TADC_Ena[124] = false;
   TCR.TADC_MeasType[124] = MeasVoltType;
   TCR.TADC_VRange[124][ReadMode] = MainBG_ULim;
   TCR.TADC_IRange[124][ReadMode] = 0nA;
   TCR.TADC_ULim[124][ReadMode]   = MainBG_ULim;
   TCR.TADC_LLim[124][ReadMode]   = MainBG_LLim;

   TCR.TP1_Ena[124] = false;
   TCR.TP3_Ena[124] = false;
   TCR.TP4_Ena[124] = false;
   TCR.TP5_Ena[124] = false;


    /*++++ TCR 125 ++++*/
    /*pump Icmp10u->TP1*/
   TCR.TP1_Ena[125] = true;
   TCR.TP1_MeasType[125] = MeasCurrType;
   TCR.TP1_VRange[125][ReadMode] = 0V;
   TCR.TP1_IRange[125][ReadMode] = Main_Icmp10_LLim;
   TCR.TP1_ULim[125][ReadMode]   = Main_Icmp10_ULim;
   TCR.TP1_LLim[125][ReadMode]   = Main_Icmp10_LLim;

    /*use for trim w/ relax limit*/
   TCR.TP1_VRange[125][ProgMode] = 0V;
   TCR.TP1_IRange[125][ProgMode] = -29uA;  /*Main_Icmp10_LLim-9uA;*/
   TCR.TP1_ULim[125][ProgMode]   = -7uA;  /*Main_Icmp10_ULim+5uA;*/
   TCR.TP1_LLim[125][ProgMode]   = -28.5uA;  /*Main_Icmp10_LLim-9uA;*/

   TCR.TP2_Ena[125] = false;
   TCR.TP3_Ena[125] = false;
   TCR.TP4_Ena[125] = false;
   TCR.TP5_Ena[125] = false;
   TCR.TADC_Ena[125]= false;

    /*++++ TCR 126 ++++*/
    /*pump Iref->TP1*/
   TCR.TP1_Ena[126] = true;
   TCR.TP1_MeasType[126] = MeasCurrType;
   TCR.TP1_VRange[126][ReadMode] = 0V;
   TCR.TP1_IRange[126][ReadMode] = Main_Iref_LLim;
   TCR.TP1_ULim[126][ReadMode]   = Main_Iref_ULim;
   TCR.TP1_LLim[126][ReadMode]   = Main_Iref_LLim;

    /*use for trim w/ relax limit*/
   TCR.TP1_VRange[126][ProgMode] = 0V;
   TCR.TP1_IRange[126][ProgMode] = Main_Iref_LLim-5uA;
   TCR.TP1_ULim[126][ProgMode]   = Main_Iref_ULim+5uA;
   TCR.TP1_LLim[126][ProgMode]   = Main_Iref_LLim-5uA;

   TCR.TP2_Ena[126] = false;
   TCR.TP3_Ena[126] = false;
   TCR.TP4_Ena[126] = false;
   TCR.TP5_Ena[126] = false;
   TCR.TADC_Ena[126]= false;

    /*++++ TCR 128 - Dummy place holder ++++*/
   TCR.TP1_Ena[128] = false;
   TCR.TP1_MeasType[128] = ForceVoltType;
   TCR.TP1_VRange[128][ReadMode] = TP1_LEAK_VLO;
   TCR.TP1_IRange[128][ReadMode] = TP1_LEAK_VLO_ULim;
   TCR.TP1_ULim[128][ReadMode]   = TP1_LEAK_VLO_ULim;
   TCR.TP1_LLim[128][ReadMode]   = TP1_LEAK_VLO_LLim;

   TCR.TP1_VRange[128][ProgMode] = TP1_LEAK_VHI;
   TCR.TP1_IRange[128][ProgMode] = TP1_LEAK_VHI_ULim;
   TCR.TP1_ULim[128][ProgMode]   = TP1_LEAK_VHI_ULim;
   TCR.TP1_LLim[128][ProgMode]   = TP1_LEAK_VHI_LLim;

   TCR.TP2_Ena[128] = false;
   TCR.TP2_MeasType[128] = MeasCurrType;
   TCR.TP2_VRange[128][ReadMode] = TP2_LEAK_VLO;
   TCR.TP2_IRange[128][ReadMode] = TP2_LEAK_VLO_ULim;
   TCR.TP2_ULim[128][ReadMode]   = TP2_LEAK_VLO_ULim;
   TCR.TP2_LLim[128][ReadMode]   = TP2_LEAK_VLO_LLim;

   TCR.TP2_VRange[128][ProgMode] = TP2_LEAK_VHI;
   TCR.TP2_IRange[128][ProgMode] = TP2_LEAK_VHI_ULim;
   TCR.TP2_ULim[128][ProgMode]   = TP2_LEAK_VHI_ULim;
   TCR.TP2_LLim[128][ProgMode]   = TP2_LEAK_VHI_LLim;

   TCR.TP3_Ena[128] = false;
   TCR.TP3_VRange[128][ReadMode] = TP2_LEAK_VLO;
   TCR.TP3_IRange[128][ReadMode] = TP2_LEAK_VLO_ULim;
   TCR.TP3_ULim[128][ReadMode]   = TP2_LEAK_VLO_ULim;
   TCR.TP3_LLim[128][ReadMode]   = TP2_LEAK_VLO_LLim;

   TCR.TP3_VRange[128][ProgMode] = TP2_LEAK_VHI;
   TCR.TP3_IRange[128][ProgMode] = TP2_LEAK_VHI_ULim;
   TCR.TP3_ULim[128][ProgMode]   = TP2_LEAK_VHI_ULim;
   TCR.TP3_LLim[128][ProgMode]   = TP2_LEAK_VHI_LLim;

   TCR.TP4_Ena[128] = false;
   TCR.TP4_VRange[128][ReadMode] = TP2_LEAK_VLO;
   TCR.TP4_IRange[128][ReadMode] = TP2_LEAK_VLO_ULim;
   TCR.TP4_ULim[128][ReadMode]   = TP2_LEAK_VLO_ULim;
   TCR.TP4_LLim[128][ReadMode]   = TP2_LEAK_VLO_LLim;

   TCR.TP4_VRange[128][ProgMode] = TP2_LEAK_VHI;
   TCR.TP4_IRange[128][ProgMode] = TP2_LEAK_VHI_ULim;
   TCR.TP4_ULim[128][ProgMode]   = TP2_LEAK_VHI_ULim;
   TCR.TP4_LLim[128][ProgMode]   = TP2_LEAK_VHI_LLim;

   TCR.TP5_Ena[128] = false;
   TCR.TP5_VRange[128][ReadMode] = TP2_LEAK_VLO;
   TCR.TP5_IRange[128][ReadMode] = TP2_LEAK_VLO_ULim;
   TCR.TP5_ULim[128][ReadMode]   = TP2_LEAK_VLO_ULim;
   TCR.TP5_LLim[128][ReadMode]   = TP2_LEAK_VLO_LLim;

   TCR.TP5_VRange[128][ProgMode] = TP2_LEAK_VHI;
   TCR.TP5_IRange[128][ProgMode] = TP2_LEAK_VHI_ULim;
   TCR.TP5_ULim[128][ProgMode]   = TP2_LEAK_VHI_ULim;
   TCR.TP5_LLim[128][ProgMode]   = TP2_LEAK_VHI_LLim;

   TCR.TADC_Ena[128] = false;
   TCR.TADC_VRange[128][ReadMode] = TP2_LEAK_VLO;
   TCR.TADC_IRange[128][ReadMode] = TP2_LEAK_VLO_ULim;
   TCR.TADC_ULim[128][ReadMode]   = TP2_LEAK_VLO_ULim;
   TCR.TADC_LLim[128][ReadMode]   = TP2_LEAK_VLO_LLim;

   TCR.TADC_VRange[128][ProgMode] = TP2_LEAK_VHI;
   TCR.TADC_IRange[128][ProgMode] = TP2_LEAK_VHI_ULim;
   TCR.TADC_ULim[128][ProgMode]   = TP2_LEAK_VHI_ULim;
   TCR.TADC_LLim[128][ProgMode]   = TP2_LEAK_VHI_LLim;



    /*==== TPAD SEQUENCE RECORD TABLE FOR STRESS ====*/

    /*++++ TCR 54 - THINOX (StressTest 3) ++++*/
   TPadSeq.STRESSNAME[THINOXVT1] = "StressTest_3";
    /*bring up order*/
   TPadSeq.TPUPSEQ[THINOXVT1][1] = 2;   /*tpad2 1st*/
   TPadSeq.TPUPSEQ[THINOXVT1][2] = 1;   /*tpad1 2nd*/
   TPadSeq.TPUPSEQ[THINOXVT1][3] = 0;   /*null*/
   TPadSeq.TPUPSEQ[THINOXVT1][4] = 0;   /*null*/
   TPadSeq.TPUPSEQ[THINOXVT1][5] = 0;   /*null*/


    /*++++ TCR 54 - PUNTHRU (StressTest 15) ++++*/
   TPadSeq.STRESSNAME[PUNTHRUVT1] = "StressTest_15";
    /*bring up order*/
   TPadSeq.TPUPSEQ[PUNTHRUVT1][1] = 2;   /*tpad2 1st*/
   TPadSeq.TPUPSEQ[PUNTHRUVT1][2] = 1;   /*tpad1 2nd*/
   TPadSeq.TPUPSEQ[PUNTHRUVT1][3] = 0;   /*null*/
   TPadSeq.TPUPSEQ[PUNTHRUVT1][4] = 0;   /*null*/
   TPadSeq.TPUPSEQ[PUNTHRUVT1][5] = 0;   /*null*/
   

    /*++++ TCR 54 - REVTUN (StressTest 16) ++++*/
   TPadSeq.STRESSNAME[REVTUNVT1] = "StressTest_16";
    /*bring up order*/
   TPadSeq.TPUPSEQ[REVTUNVT1][1] = 2;   /*tpad2 1st*/
   TPadSeq.TPUPSEQ[REVTUNVT1][2] = 1;   /*tpad1 2nd*/
   TPadSeq.TPUPSEQ[REVTUNVT1][3] = 0;   /*null*/
   TPadSeq.TPUPSEQ[REVTUNVT1][4] = 0;   /*null*/
   TPadSeq.TPUPSEQ[REVTUNVT1][5] = 0;   /*null*/
   

#if $TP3_TO_TP5_PRESENT  
    /*++++ TCR 84 - CSFG (StressTest 4) ++++*/
   TPadSeq.STRESSNAME[CSFGVT0] = "StressTest_4";
    /*bring up order*/
   TPadSeq.TPUPSEQ[CSFGVT0][1] = 3;   /*tpad3 1st*/
   TPadSeq.TPUPSEQ[CSFGVT0][2] = 1;   /*tpad1 2nd*/
   TPadSeq.TPUPSEQ[CSFGVT0][3] = 2;   /*tpad2 3rd*/
   TPadSeq.TPUPSEQ[CSFGVT0][4] = 0;   /*null tpad4 already 0*/
   TPadSeq.TPUPSEQ[CSFGVT0][5] = 0;   /*null tpad5 already 0*/
#else
    /*++++ TCR 110 - CSFG (StressTest 4) ++++*/
   TPadSeq.STRESSNAME[CSFGVT0] = "StressTest_4";
    /*bring up order*/
   TPadSeq.TPUPSEQ[CSFGVT0][1] = 1;   /*tpad1 1st*/
   TPadSeq.TPUPSEQ[CSFGVT0][2] = 2;   /*tpad2 2nd*/
   TPadSeq.TPUPSEQ[CSFGVT0][3] = 0;   /*null tpad4 already 0*/
   TPadSeq.TPUPSEQ[CSFGVT0][4] = 0;   /*null tpad4 already 0*/
   TPadSeq.TPUPSEQ[CSFGVT0][5] = 0;   /*null tpad5 already 0*/
#endif   

    /*++++ TCR 53 - ONO (StressTest 2) ++++*/
   TPadSeq.STRESSNAME[ONOVT0] = "StressTest_2";
    /*bring up order*/
   TPadSeq.TPUPSEQ[ONOVT0][1] = 2;   /*tpad3 1st*/
   TPadSeq.TPUPSEQ[ONOVT0][2] = 1;   /*tpad1 2nd*/
   TPadSeq.TPUPSEQ[ONOVT0][3] = 0;   /*tpad2 3rd*/
   TPadSeq.TPUPSEQ[ONOVT0][4] = 0;   /*null tpad4 already 0*/
   TPadSeq.TPUPSEQ[ONOVT0][5] = 0;   /*null tpad5 already 0*/

    /*++++ TCR 23 - EGFG4 (StressTest 8) ++++*/
   TPadSeq.STRESSNAME[EGFG4VT0] = "StressTest_8";
    /*bring up order*/
   TPadSeq.TPUPSEQ[EGFG4VT0][1] = 1;   /*tpad1 1st*/
   TPadSeq.TPUPSEQ[EGFG4VT0][2] = 0;  
   TPadSeq.TPUPSEQ[EGFG4VT0][3] = 0;  
   TPadSeq.TPUPSEQ[EGFG4VT0][4] = 0;  
   TPadSeq.TPUPSEQ[EGFG4VT0][5] = 0;  

    /*++++ TCR 23 - EGFG3 (StressTest 7) ++++*/
   TPadSeq.STRESSNAME[EGFG3VT0] = "StressTest_7";
    /*bring up order*/
   TPadSeq.TPUPSEQ[EGFG3VT0][1] = 1;   /*tpad1 1st*/
   TPadSeq.TPUPSEQ[EGFG3VT0][2] = 0;  
   TPadSeq.TPUPSEQ[EGFG3VT0][3] = 0;  
   TPadSeq.TPUPSEQ[EGFG3VT0][4] = 0;  
   TPadSeq.TPUPSEQ[EGFG3VT0][5] = 0;  

    /*++++ TCR 58 - RDDISTB (StressTest 13) ++++*/
   TPadSeq.STRESSNAME[RDDISTBVT0] = "StressTest_13";
    /*bring up order*/
   TPadSeq.TPUPSEQ[RDDISTBVT0][1] = 1;   /*tpad1 1st*/
   TPadSeq.TPUPSEQ[RDDISTBVT0][2] = 0;  
   TPadSeq.TPUPSEQ[RDDISTBVT0][3] = 0;  
   TPadSeq.TPUPSEQ[RDDISTBVT0][4] = 0;  
   TPadSeq.TPUPSEQ[RDDISTBVT0][5] = 0;  

    /*++++ TCR 58 - RDDISTB2 (StressTest 13) ++++*/
   TPadSeq.STRESSNAME[RDDISTB2VT0] = "StressTest_13";
    /*bring up order*/
   TPadSeq.TPUPSEQ[RDDISTB2VT0][1] = 1;   /*tpad1 1st*/
   TPadSeq.TPUPSEQ[RDDISTB2VT0][2] = 0;  
   TPadSeq.TPUPSEQ[RDDISTB2VT0][3] = 0;  
   TPadSeq.TPUPSEQ[RDDISTB2VT0][4] = 0;  
   TPadSeq.TPUPSEQ[RDDISTB2VT0][5] = 0;  

#if $TP3_TO_TP5_PRESENT  
    /*++++ TCR 52 - TUNOX (StressTest 1) ++++*/
   TPadSeq.STRESSNAME[TUNOXVT1] = "StressTest_1";
    /*bring up order*/
   TPadSeq.TPUPSEQ[TUNOXVT1][1] = 4;   /*tpad4 1st*/
   TPadSeq.TPUPSEQ[TUNOXVT1][2] = 1;  
   TPadSeq.TPUPSEQ[TUNOXVT1][3] = 0;  
   TPadSeq.TPUPSEQ[TUNOXVT1][4] = 0;  
   TPadSeq.TPUPSEQ[TUNOXVT1][5] = 0;  
#else
    /*++++ TCR 108 - TUNOX (StressTest 1) ++++*/
   TPadSeq.STRESSNAME[TUNOXVT1] = "StressTest_1";
    /*bring up order*/
   TPadSeq.TPUPSEQ[TUNOXVT1][1] = 2;   /*tpad2 1st*/
   TPadSeq.TPUPSEQ[TUNOXVT1][2] = 1;  
   TPadSeq.TPUPSEQ[TUNOXVT1][3] = 0;  
   TPadSeq.TPUPSEQ[TUNOXVT1][4] = 0;  
   TPadSeq.TPUPSEQ[TUNOXVT1][5] = 0;  
#endif

#if $TP3_TO_TP5_PRESENT  
    /*++++ TCR 52 - TSMC TUNOX (StressTest 1A) ++++*/
   TPadSeq.STRESSNAME[TUNOXTSMCVT1] = "StressTest_1A";
    /*bring up order*/
   TPadSeq.TPUPSEQ[TUNOXTSMCVT1][1] = 4;   /*tpad4 1st*/
   TPadSeq.TPUPSEQ[TUNOXTSMCVT1][2] = 1;  
   TPadSeq.TPUPSEQ[TUNOXTSMCVT1][3] = 0;  
   TPadSeq.TPUPSEQ[TUNOXTSMCVT1][4] = 0;  
   TPadSeq.TPUPSEQ[TUNOXTSMCVT1][5] = 0;  
#else
    /*++++ TCR 52 - TSMC TUNOX (StressTest 1A) ++++*/
   TPadSeq.STRESSNAME[TUNOXTSMCVT1] = "StressTest_1A";
    /*bring up order*/
   TPadSeq.TPUPSEQ[TUNOXTSMCVT1][1] = 2;   /*tpad2 1st*/
   TPadSeq.TPUPSEQ[TUNOXTSMCVT1][2] = 1;  
   TPadSeq.TPUPSEQ[TUNOXTSMCVT1][3] = 0;  
   TPadSeq.TPUPSEQ[TUNOXTSMCVT1][4] = 0;  
   TPadSeq.TPUPSEQ[TUNOXTSMCVT1][5] = 0;  
#endif

#if $TP3_TO_TP5_PRESENT  
    /*++++ TCR 52 - PGMFF (StressTest 10) ++++*/
   TPadSeq.STRESSNAME[PGMFFVT1] = "StressTest_10";
    /*bring up order*/
   TPadSeq.TPUPSEQ[PGMFFVT1][1] = 3;   /*tpad3 1st*/
   TPadSeq.TPUPSEQ[PGMFFVT1][2] = 2;  
   TPadSeq.TPUPSEQ[PGMFFVT1][3] = 4;  
   TPadSeq.TPUPSEQ[PGMFFVT1][4] = 1;  
   TPadSeq.TPUPSEQ[PGMFFVT1][5] = 0;  
#else
    /*++++ TCR 107 - PGMFF (StressTest 10) ++++*/
   TPadSeq.STRESSNAME[PGMFFVT1] = "StressTest_10";
    /*bring up order*/
   TPadSeq.TPUPSEQ[PGMFFVT1][1] = 2;   /*tpad2 1st*/
   TPadSeq.TPUPSEQ[PGMFFVT1][2] = 1;  
   TPadSeq.TPUPSEQ[PGMFFVT1][3] = 0;  
   TPadSeq.TPUPSEQ[PGMFFVT1][4] = 0;  
   TPadSeq.TPUPSEQ[PGMFFVT1][5] = 0;  
#endif

#if $TP3_TO_TP5_PRESENT  
    /*++++ TCR 52 - FGWL (StressTest 11) ++++*/
   TPadSeq.STRESSNAME[FGWLVT1] = "StressTest_11";
    /*bring up order*/
   TPadSeq.TPUPSEQ[FGWLVT1][1] = 3;   /*tpad3 1st*/
   TPadSeq.TPUPSEQ[FGWLVT1][2] = 2;  
   TPadSeq.TPUPSEQ[FGWLVT1][3] = 4;  
   TPadSeq.TPUPSEQ[FGWLVT1][4] = 1;  
   TPadSeq.TPUPSEQ[FGWLVT1][5] = 0;  
#else
    /*++++ TCR 107 - FGWL (StressTest 11) ++++*/
   TPadSeq.STRESSNAME[FGWLVT1] = "StressTest_11";
    /*bring up order*/
   TPadSeq.TPUPSEQ[FGWLVT1][1] = 2;   /*tpad2 1st*/
   TPadSeq.TPUPSEQ[FGWLVT1][2] = 1;  
   TPadSeq.TPUPSEQ[FGWLVT1][3] = 0;  
   TPadSeq.TPUPSEQ[FGWLVT1][4] = 0;  
   TPadSeq.TPUPSEQ[FGWLVT1][5] = 0;  
#endif   

   GL_IGNORE_FLOWBYTE = false;
   GL_DO_VT_HISTOGRAM = false;



    /*old F035 stuffs -- Current limits for precon/erase/read*/
   BANK_PRECON_IVDD_ULimit     = 75mA;
   BANK_PRECON_IVDD_LLimit     = -1mA;
   BANK_ERS_IVDD_ULimit        = 75mA;
   BANK_ERS_IVDD_LLimit        = -1mA;
   BANK_READ_IVDD_ULimit       = 50mA;
   BANK_READ_IVDD_LLimit       = -1mA;
   BANK_PRECON_IVDD3VFL_ULimit = 75mA;
   BANK_PRECON_IVDD3VFL_LLimit = -1mA;
   BANK_ERS_IVDD3VFL_ULimit    = 75mA;
   BANK_ERS_IVDD3VFL_LLimit    = -1mA;
   BANK_READ_IVDD3VFL_ULimit   = 50mA;
   BANK_READ_IVDD3VFL_LLimit   = -1mA;
                                
   SECT_PRECON_IVDD_ULimit     = 75mA;
   SECT_PRECON_IVDD_LLimit     = -1mA;
   SECT_ERS_IVDD_ULimit        = 75mA;
   SECT_ERS_IVDD_LLimit        = -1mA;
   SECT_READ_IVDD_ULimit       = 50mA;
   SECT_READ_IVDD_LLimit       = -1mA;
   SECT_PRECON_IVDD3VFL_ULimit = 75mA;
   SECT_PRECON_IVDD3VFL_LLimit = -1mA;
   SECT_ERS_IVDD3VFL_ULimit    = 75mA;
   SECT_ERS_IVDD3VFL_LLimit    = -1mA;
   SECT_READ_IVDD3VFL_ULimit   = 50mA;
   SECT_READ_IVDD3VFL_LLimit   = -1mA;


    /*Flash esda image base/start number*/
   ESDA_IMG_PGM0S              = 100;
   ESDA_IMG_RDM0S              = 200;
   ESDA_IMG_ERS                = 300;
   ESDA_IMG_RDM1S              = 400;
   ESDA_IMG_CYC1X_PGM0S        = 500;
   ESDA_IMG_CYC1X_ERS          = 600;
   ESDA_IMG_CYC1X_RDM1S        = 700;
   ESDA_IMG_THINOX_ERS         = 1000;
   ESDA_IMG_THINOX_VT1_PRE     = 1100;
   ESDA_IMG_THINOX_VT1_PST     = 1200;
   ESDA_IMG_THINOX_VT1_DLT     = 1300;
   ESDA_IMG_PUNTHRU_ERS        = 2000;
   ESDA_IMG_PUNTHRU_VT1_PRE    = 2100;
   ESDA_IMG_PUNTHRU_VT1_PST    = 2200;
   ESDA_IMG_PUNTHRU_VT1_DLT    = 2300;
   ESDA_IMG_REVTUN_ERS         = 3000;
   ESDA_IMG_REVTUN_VT1_PRE     = 3100;
   ESDA_IMG_REVTUN_VT1_PST     = 3200;
   ESDA_IMG_REVTUN_VT1_DLT     = 3300;
   ESDA_IMG_CSFG_PGM0S         = 4000;
   ESDA_IMG_CSFG_RDM0S         = 4100;
   ESDA_IMG_CSFG_VT0_PRE       = 4200;
   ESDA_IMG_CSFG_VT0_PST       = 4300;
   ESDA_IMG_CSFG_VT0_DLT       = 4400;
   ESDA_IMG_ONO_PGM0S          = 5000;
   ESDA_IMG_ONO_RDM0S          = 5100;
   ESDA_IMG_ONO_VT0_PRE        = 5200;
   ESDA_IMG_ONO_VT0_PST        = 5300;
   ESDA_IMG_ONO_VT0_DLT        = 5400;
   ESDA_IMG_EGFG4_PGM0S        = 6000;
   ESDA_IMG_EGFG4_RDM0S        = 6100;
   ESDA_IMG_EGFG4_VT0_PRE      = 6200;
   ESDA_IMG_EGFG4_VT0_PST      = 6300;
   ESDA_IMG_EGFG4_VT0_DLT      = 6400;
   ESDA_IMG_EGFG3_PGM0S        = 7000;
   ESDA_IMG_EGFG3_RDM0S        = 7100;
   ESDA_IMG_EGFG3_VT0_PRE      = 7200;
   ESDA_IMG_EGFG3_VT0_PST      = 7300;
   ESDA_IMG_EGFG3_VT0_DLT      = 7400;
   ESDA_IMG_RDDISTB2_PGM0S     = 8000;
   ESDA_IMG_RDDISTB2_RDM0S     = 8100;
   ESDA_IMG_RDDISTB2_VT0_PRE   = 8200;
   ESDA_IMG_RDDISTB2_VT0_PST   = 8300;
   ESDA_IMG_RDDISTB2_VT0_DLT   = 8400;
   ESDA_IMG_TUNOX_ERS          = 9000;
   ESDA_IMG_TUNOX_VT1_PRE      = 9100;
   ESDA_IMG_TUNOX_VT1_PST      = 9200;
   ESDA_IMG_TUNOX_VT1_DLT      = 9300;
   ESDA_IMG_PGMFF_ERS          = 10000;
   ESDA_IMG_PGMFF_VT1_PRE      = 10100;
   ESDA_IMG_PGMFF_VT1_PST      = 10200;
   ESDA_IMG_PGMFF_VT1_DLT      = 10300;
   ESDA_IMG_FGWL_ERS           = 11000;
   ESDA_IMG_FGWL_VT1_PRE       = 11100;
   ESDA_IMG_FGWL_VT1_PST       = 11200;
   ESDA_IMG_FGWL_VT1_DLT       = 11300;
   ESDA_IMG_CYC9X_PGM0S        = 12000;
   ESDA_IMG_CYC9X_ERS          = 12100;
   ESDA_IMG_CYC9X_RDM1S        = 12200;
   ESDA_IMG_PGM_CHK            = 13000;
   ESDA_IMG_DRL_RDM0S_PRE      = 13100;
   ESDA_IMG_DRL_RDM1S_PRE      = 13200;
   ESDA_IMG_DRL_VT0_PRE        = 13300;
   ESDA_IMG_DRL_VT1_PRE        = 13400;
   ESDA_IMG_DRL_RDM0S_PST      = 14000;
   ESDA_IMG_DRL_RDM1S_PST      = 14100;
   ESDA_IMG_DRL_VT0_PST        = 14200;
   ESDA_IMG_DRL_VT1_PST        = 14300;
   ESDA_IMG_DRL_VT0_DLT        = 14400;
   ESDA_IMG_DRL_VT1_DLT        = 14500;
   ESDA_IMG_SECT_ERS           = 15000;
   ESDA_IMG_BLK0               = 15500;
   ESDA_IMG_BLK1               = 15600;
   ESDA_IMG_ECHK               = 15700;
   ESDA_IMG_OCHK               = 15800;

  


    /*IREF PMOS RATIO & CODE LIST HERE FOR REFERENCE*/
                  /*index}  {RATIO}  {CODE integer/hex*/
   IREF_PMOSRATIO[  0 ] = 1.2500;     /*  0  0x00 */
   IREF_PMOSRATIO[  1 ] = 1.1765;    /*  1  0x01 */
   IREF_PMOSRATIO[  2 ] = 1.1111;    /*  2  0x02 */
   IREF_PMOSRATIO[  3 ] = 1.0526;    /*  3  0x03 */
   IREF_PMOSRATIO[  4 ] = 1.0000;    /*  4  0x04 */
   IREF_PMOSRATIO[  5 ] = 0.9524;    /*  5  0x05 */
   IREF_PMOSRATIO[  6 ] = 0.9091;    /*  6  0x06 */
   IREF_PMOSRATIO[  7 ] = 0.8696;    /*  7  0x07 */
   IREF_PMOSRATIO[  8 ] = 0.8333;    /*  8  0x08 */
   IREF_PMOSRATIO[  9 ] = 0.8000;    /*  9  0x09 */
   IREF_PMOSRATIO[ 10 ] = 0.7692;    /*  10 0x0A */
   IREF_PMOSRATIO[ 11 ] = 0.7407;    /*  11 0x0B */
   IREF_PMOSRATIO[ 12 ] = 0.7143;    /*  12 0x0C */
   IREF_PMOSRATIO[ 13 ] = 0.6897;    /*  13 0x0D */
   IREF_PMOSRATIO[ 14 ] = 0.6667;    /*  14 0x0E */
   IREF_PMOSRATIO[ 15 ] = 0.6452;    /*  15 0x0F */
   IREF_PMOSRATIO[ 16 ] = 0.6383;    /*  16 0x10 */
   IREF_PMOSRATIO[ 17 ] = 0.6061;    /*  17 0x11 */
   IREF_PMOSRATIO[ 18 ] = 0.5769;    /*  18 0x12 */
   IREF_PMOSRATIO[ 19 ] = 0.5505;    /*  19 0x13 */
   IREF_PMOSRATIO[ 20 ] = 0.5263;    /*  20 0x14 */
   IREF_PMOSRATIO[ 21 ] = 0.5042;    /*  21 0x15 */
   IREF_PMOSRATIO[ 22 ] = 0.4839;    /*  22 0x16 */
   IREF_PMOSRATIO[ 23 ] = 0.4651;    /*  23 0x17 */
   IREF_PMOSRATIO[ 24 ] = 0.4478;    /*  24 0x18 */
   IREF_PMOSRATIO[ 25 ] = 0.4317;    /*  25 0x19 */
   IREF_PMOSRATIO[ 26 ] = 0.4167;    /*  26 0x1A */
   IREF_PMOSRATIO[ 27 ] = 0.4027;    /*  27 0x1b */
   IREF_PMOSRATIO[ 28 ] = 0.3896;    /*  28 0x1c */
   IREF_PMOSRATIO[ 29 ] = 0.3774;    /*  29 0x1d */
   IREF_PMOSRATIO[ 30 ] = 0.3659;    /*  30 0x1e */
   IREF_PMOSRATIO[ 31 ] = 0.3550;    /*  31 0x1f */


                  /*index} {CODE integer/hex*/
   IREF_PMOSCODE[  0 ] = 0x00;     /*  0  */
   IREF_PMOSCODE[  1 ] = 0x01;    /*  1  */
   IREF_PMOSCODE[  2 ] = 0x02;    /*  2  */
   IREF_PMOSCODE[  3 ] = 0x03;    /*  3  */
   IREF_PMOSCODE[  4 ] = 0x04;    /*  4  */
   IREF_PMOSCODE[  5 ] = 0x05;    /*  5  */
   IREF_PMOSCODE[  6 ] = 0x06;    /*  6  */
   IREF_PMOSCODE[  7 ] = 0x07;    /*  7  */
   IREF_PMOSCODE[  8 ] = 0x08;    /*  8  */
   IREF_PMOSCODE[  9 ] = 0x09;    /*  9  */
   IREF_PMOSCODE[ 10 ] = 0x0A;    /*  10 */
   IREF_PMOSCODE[ 11 ] = 0x0B;    /*  11 */
   IREF_PMOSCODE[ 12 ] = 0x0C;    /*  12 */
   IREF_PMOSCODE[ 13 ] = 0x0D;    /*  13 */
   IREF_PMOSCODE[ 14 ] = 0x0E;    /*  14 */
   IREF_PMOSCODE[ 15 ] = 0x0F;    /*  15 */
   IREF_PMOSCODE[ 16 ] = 0x10;    /*  16 */
   IREF_PMOSCODE[ 17 ] = 0x11;    /*  17 */
   IREF_PMOSCODE[ 18 ] = 0x12;    /*  18 */
   IREF_PMOSCODE[ 19 ] = 0x13;    /*  19 */
   IREF_PMOSCODE[ 20 ] = 0x14;    /*  20 */
   IREF_PMOSCODE[ 21 ] = 0x15;    /*  21 */
   IREF_PMOSCODE[ 22 ] = 0x16;    /*  22 */
   IREF_PMOSCODE[ 23 ] = 0x17;    /*  23 */
   IREF_PMOSCODE[ 24 ] = 0x18;    /*  24 */
   IREF_PMOSCODE[ 25 ] = 0x19;    /*  25 */
   IREF_PMOSCODE[ 26 ] = 0x1A;    /*  26 */
   IREF_PMOSCODE[ 27 ] = 0x1b;    /*  27 */
   IREF_PMOSCODE[ 28 ] = 0x1c;    /*  28 */
   IREF_PMOSCODE[ 29 ] = 0x1d;    /*  29 */
   IREF_PMOSCODE[ 30 ] = 0x1e;    /*  30 */
   IREF_PMOSCODE[ 31 ] = 0x1f;    /*  31 */


    /*Efuse String: pump[bit0:21],bank1[bit31:0],bank0[bit31:0]*/
    /*i.e. str[1]=pump[bit0],str[2]=pump[bit1] or vbgtrim<5>*/

    /*NOTE: string below is build as pmos[4:0], eg. bit9:bit5*/
                            /*bit98765*/
   IREF_PMOSCODE_STR[  0 ] = "00000";     /*  0  0x00 */
   IREF_PMOSCODE_STR[  1 ] = "00001";    /*  1  0x01 */
   IREF_PMOSCODE_STR[  2 ] = "00010";    /*  2  0x02 */
   IREF_PMOSCODE_STR[  3 ] = "00011";    /*  3  0x03 */
   IREF_PMOSCODE_STR[  4 ] = "00100";    /*  4  0x04 */
   IREF_PMOSCODE_STR[  5 ] = "00101";    /*  5  0x05 */
   IREF_PMOSCODE_STR[  6 ] = "00110";    /*  6  0x06 */
   IREF_PMOSCODE_STR[  7 ] = "00111";    /*  7  0x07 */
   IREF_PMOSCODE_STR[  8 ] = "01000";    /*  8  0x08 */
   IREF_PMOSCODE_STR[  9 ] = "01001";    /*  9  0x09 */
   IREF_PMOSCODE_STR[ 10 ] = "01010";    /*  10 0x0A */
   IREF_PMOSCODE_STR[ 11 ] = "01011";    /*  11 0x0B */
   IREF_PMOSCODE_STR[ 12 ] = "01100";    /*  12 0x0C */
   IREF_PMOSCODE_STR[ 13 ] = "01101";    /*  13 0x0D */
   IREF_PMOSCODE_STR[ 14 ] = "01110";    /*  14 0x0E */
   IREF_PMOSCODE_STR[ 15 ] = "01111";    /*  15 0x0F */
   IREF_PMOSCODE_STR[ 16 ] = "10000";    /*  16 0x10 */
   IREF_PMOSCODE_STR[ 17 ] = "10001";    /*  17 0x11 */
   IREF_PMOSCODE_STR[ 18 ] = "10010";    /*  18 0x12 */
   IREF_PMOSCODE_STR[ 19 ] = "10011";    /*  19 0x13 */
   IREF_PMOSCODE_STR[ 20 ] = "10100";    /*  20 0x14 */
   IREF_PMOSCODE_STR[ 21 ] = "10101";    /*  21 0x15 */
   IREF_PMOSCODE_STR[ 22 ] = "10110";    /*  22 0x16 */
   IREF_PMOSCODE_STR[ 23 ] = "10111";    /*  23 0x17 */
   IREF_PMOSCODE_STR[ 24 ] = "11000";    /*  24 0x18 */
   IREF_PMOSCODE_STR[ 25 ] = "11001";    /*  25 0x19 */
   IREF_PMOSCODE_STR[ 26 ] = "11010";    /*  26 0x1A */
   IREF_PMOSCODE_STR[ 27 ] = "11011";    /*  27 0x1b */
   IREF_PMOSCODE_STR[ 28 ] = "11100";    /*  28 0x1c */
   IREF_PMOSCODE_STR[ 29 ] = "11101";    /*  29 0x1d */
   IREF_PMOSCODE_STR[ 30 ] = "11110";    /*  30 0x1e */
   IREF_PMOSCODE_STR[ 31 ] = "11111";    /*  31 0x1f */

    /*Based on OTP setting version4*/
    /*Note: string below is reversed ordering with their name, eg. bankef_bit0_4=bit4:0*/
   if(GL_BANKTYPE==FLEPBANK)  
   {
      BANKEF_BIT0_4   = "10011";   /*19 or 0x13, rd ratio=2.35*/
      GL_DO_EFBIT22_TRIM = true;  /*true=blow efuse, false=no blow efuse. Pace6 revI only*/
      if(GL_DO_EFBIT22_TRIM)  
      {
         BANKEF_BIT10_23 = "01001000000001";   /*SAPREZ bit[10:12]=1; IGNORE BU RR bit19=1, otp hv prot bit23=0*/
         BANKEF_BIT10_23_BANKNUM[0] = "01001000000001";  /*pc=1,bit17=0*/
         BANKEF_BIT10_23_BANKNUM[1] = "01001000000001";  /*pc=1,bit17=0*/
         BANKEF_BIT10_23_BANKNUM[2] = "01001000000001";  /*pc=1,bit17=0*/
         BANKEF_BIT10_23_BANKNUM[3] = "01001000000001";  /*pc=1,bit17=0*/
         BANKEF_BIT10_23_BANKNUM[4] = "01001000000001";  /*pc=1,bit17=0*/
         BANKEF_BIT10_23_BANKNUM[5] = "01001000000001";  /*pc=1,bit17=0*/
         BANKEF_BIT10_23_BANKNUM[6] = "01001000000001";  /*pc=1,bit17=0*/
         BANKEF_BIT10_23_BANKNUM[7] = "01001000000001";  /*pc=1,bit17=0*/
      }
      else
      {
         BANKEF_BIT10_23 = "00001000000001";   /*SAPREZ bit[10:12]=1; IGNORE BU RR bit19=1, otp hv prot bit23=0*/
         BANKEF_BIT10_23_BANKNUM[0] = "00001000000001";  /*pc=1,bit17=0*/
         BANKEF_BIT10_23_BANKNUM[1] = "00001000000001";  /*pc=1,bit17=0*/
         BANKEF_BIT10_23_BANKNUM[2] = "00001000000001";  /*pc=1,bit17=0*/
         BANKEF_BIT10_23_BANKNUM[3] = "00001000000001";  /*pc=1,bit17=0*/
         BANKEF_BIT10_23_BANKNUM[4] = "00001000000001";  /*pc=1,bit17=0*/
         BANKEF_BIT10_23_BANKNUM[5] = "00001000000001";  /*pc=1,bit17=0*/
         BANKEF_BIT10_23_BANKNUM[6] = "00001000000001";  /*pc=1,bit17=0*/
         BANKEF_BIT10_23_BANKNUM[7] = "00001000000001";  /*pc=1,bit17=0*/
      } 
      BANKEF_BIT29_31 = "000";   /*BLCHG sadly=0, bit31=1*/
   }
   else
   {
       /*+++++ FLESBANK +++++*/
      if(GL_DO_REFARR_ERS_ADAPTIVE)  
         BANKEF_BIT0_4   = "01011"  ; /*11 or 0xb, rd ratio=1.35*/
      else
         BANKEF_BIT0_4   = "10011";   /*19 or 0x13, rd ratio=2.35*/
      GL_DO_EFBIT22_TRIM = false;  /*true=blow efuse, false=no blow efuse*/
      BANKEF_BIT10_23 = "00001000000100";   /*SAPREZ bit[10:12]=4; IGNORE BU RR bit19=1, otp hv prot bit23=0*/
       
        /* Updated to use precharge of 2 for A2 material and 4 for A3 material Jamal Sheikh modified Sat, Dec 10 2011*/
      StringS SelectedTIDesignRev = "TIDesignRev";
      if (SelectedTIDesignRev == "B")  
      {
          BANKEF_BIT10_23            = "00001000000010";   /*SAPREZ bit[10:12]=4; IGNORE BU RR bit19=1, otp hv prot bit23=0*/
          BANKEF_BIT10_23_BANKNUM[0] = "00001000000010";  /*pc=2,bit17=0*/
          BANKEF_BIT10_23_BANKNUM[1] = "00001000000010";  /*pc=2,bit17=0*/
          BANKEF_BIT10_23_BANKNUM[2] = "00001000000010";  /*pc=2,bit17=0*/
          BANKEF_BIT10_23_BANKNUM[3] = "00001000000010";  /*pc=2,bit17=0*/
          BANKEF_BIT10_23_BANKNUM[4] = "00001000000010";  /*pc=2,bit17=0*/
          BANKEF_BIT10_23_BANKNUM[5] = "00001000000010";  /*pc=2,bit17=0*/
          BANKEF_BIT10_23_BANKNUM[6] = "00001000000010";  /*pc=2,bit17=0*/
          BANKEF_BIT10_23_BANKNUM[7] = "00001000000010";  /*pc=2,bit17=0*/
      }
      else
      {
          BANKEF_BIT10_23            = "00001000000100";   /*SAPREZ bit[10:12]=4; IGNORE BU RR bit19=1, otp hv prot bit23=0*/
          BANKEF_BIT10_23_BANKNUM[0] = "00001000000100";  /*pc=4,bit17=0*/
          BANKEF_BIT10_23_BANKNUM[1] = "00001000000100";  /*pc=4,bit17=0*/
          BANKEF_BIT10_23_BANKNUM[2] = "00001000000100";  /*pc=4,bit17=0*/
          BANKEF_BIT10_23_BANKNUM[3] = "00001000000100";  /*pc=4,bit17=0*/
          BANKEF_BIT10_23_BANKNUM[4] = "00001000000100";  /*pc=4,bit17=0*/
          BANKEF_BIT10_23_BANKNUM[5] = "00001000000100";  /*pc=4,bit17=0*/
          BANKEF_BIT10_23_BANKNUM[6] = "00001000000100";  /*pc=4,bit17=0*/
          BANKEF_BIT10_23_BANKNUM[7] = "00001000000100";  /*pc=4,bit17=0*/
      } 
  


      BANKEF_BIT29_31 = "000";   /*BLCHG sadly=0, bit31=1*/
   } 

    /*GL_PLELL_FORMAT := true;} {print dlog // format, false=serial format*/
   GL_PLELL_FORMAT = false;  /* pasa changed */


    /*++++ 32bit TNUM (and 16bit) ++++*/
   TNUM_LPO_AUTOTRIM                    = 0x00C00000;
   TNUM_OTP_PROG_LPO_CAL                = 0xA0201000;

    /*+++ PUMP +++*/
   TNUM_PUMP_MAINBG                     = 0x10000000;   /*tcr 124*/
   TNUM_PUMP_MAINIREF                   = 0x10100000;   /*tcr 126*/
   TNUM_PUMP_MAINICMP10U                = 0x10110000;   /*tcr 125*/
   TNUM_PUMP_MAINOSC                    = 0x10200000;   /*tcr 127*/
   TNUM_PUMP_VHV_FORCE_ERS              = 0x10300000;   /*tcr 86*/

   TNUM_PUMP_VHVPROG                    = 0x11320000;   /*tcr 115*/
   TNUM_PUMP_VHVPVFY                    = 0x11310000;  
   TNUM_PUMP_VHVERS                     = 0x11340000;  
   TNUM_PUMP_VSL                        = 0x11600000;   /*tcr 116*/
   TNUM_PUMP_VREAD                      = 0x11000000;   /*tcr 117*/
   TNUM_PUMP_VSA5_READ                  = 0x11200000;   /*tcr 118*/
   TNUM_PUMP_VWL_READ                   = 0x11500000;   /*tcr 119*/
   TNUM_PUMP_VCG2P5_READ                = 0x11100000;   /*tcr 120*/
   TNUM_PUMP_VINH_READ                  = 0x11700000;   /*tcr 121*/
   TNUM_PUMP_VHV2X_PROG                 = 0x11400000;   /*tcr 122*/

   TNUM_BANK_VRDBUF                     = 0x11800000;   /*tcr 83*/
   TNUM_BANK_IREF_READ_EVEN             = 0x12000000;   /*tcr 25*/
   TNUM_BANK_IREF_READ_ODD              = 0x12100000;   /*tcr 25*/
   TNUM_BANK_IREF_PVFY_EVEN             = 0x12010000;   /*tcr 25*/
   TNUM_BANK_IREF_PVFY_ODD              = 0x12110000;   /*tcr 25*/
   TNUM_BANK_IREF_EVFY_EVEN             = 0x12030000;   /*tcr 25*/
   TNUM_BANK_IREF_EVFY_ODD              = 0x12130000;   /*tcr 25*/
   TNUM_BANK_IREF_CVFY_EVEN             = 0x12050000;   /*tcr 25*/
   TNUM_BANK_IREF_CVFY_ODD              = 0x12150000;   /*tcr 25*/
   TNUM_BANK_IREF_RDM0_EVEN             = 0x12080000;   /*tcr 26*/
   TNUM_BANK_IREF_RDM0_ODD              = 0x12180000;   /*tcr 26*/
   TNUM_BANK_IREF_RDM1_EVEN             = 0x12090000;   /*tcr 27*/
   TNUM_BANK_IREF_RDM1_ODD              = 0x12190000;   /*tcr 27*/

   TNUM_BANK_IPMOS_READ_EVEN            = 0x12200000;   /*tcr 40*/
   TNUM_BANK_IPMOS_READ_ODD             = 0x12300000;   /*tcr 40*/
   TNUM_BANK_IPMOS_PVFY_EVEN            = 0x12210000;   /*tcr 40*/
   TNUM_BANK_IPMOS_PVFY_ODD             = 0x12310000;   /*tcr 40*/
   TNUM_BANK_IPMOS_EVFY_EVEN            = 0x12230000;   /*tcr 40*/
   TNUM_BANK_IPMOS_EVFY_ODD             = 0x12330000;   /*tcr 40*/
   TNUM_BANK_IPMOS_CVFY_EVEN            = 0x12250000;   /*tcr 40*/
   TNUM_BANK_IPMOS_CVFY_ODD             = 0x12350000;   /*tcr 40*/
   TNUM_BANK_REFARR_ERS                 = 0x12800000;   /*tcr 56*/

   TNUM_BANK_INTERNAL_IREF_READ_EVEN             = 0x12900000;   /*tcr 28*/
   TNUM_BANK_INTERNAL_IREF_READ_ODD              = 0x12A00000;   /*tcr 28*/
   TNUM_BANK_INTERNAL_IREF_PVFY_EVEN             = 0x12910000;   /*tcr 28*/
   TNUM_BANK_INTERNAL_IREF_PVFY_ODD              = 0x12A10000;   /*tcr 28*/
   TNUM_BANK_INTERNAL_IREF_EVFY_EVEN             = 0x12930000;   /*tcr 28*/
   TNUM_BANK_INTERNAL_IREF_EVFY_ODD              = 0x12A30000;   /*tcr 28*/
   TNUM_BANK_INTERNAL_IREF_CVFY_EVEN             = 0x12950000;   /*tcr 28*/
   TNUM_BANK_INTERNAL_IREF_CVFY_ODD              = 0x12A50000;   /*tcr 28*/
   TNUM_BANK_INTERNAL_IREF_RDM0_EVEN             = 0x12980000;   /*tcr 29*/
   TNUM_BANK_INTERNAL_IREF_RDM0_ODD              = 0x12A80000;   /*tcr 29*/
   TNUM_BANK_INTERNAL_IREF_RDM1_EVEN             = 0x12990000;   /*tcr 30*/
   TNUM_BANK_INTERNAL_IREF_RDM1_ODD              = 0x12A90000;   /*tcr 30*/

   TNUM_BANK_INTERNAL_IPMOS_READ_EVEN            = 0x12B00000;   /*tcr 43*/
   TNUM_BANK_INTERNAL_IPMOS_READ_ODD             = 0x12C00000;   /*tcr 43*/
   TNUM_BANK_INTERNAL_IPMOS_PVFY_EVEN            = 0x12B10000;   /*tcr 43*/
   TNUM_BANK_INTERNAL_IPMOS_PVFY_ODD             = 0x12C10000;   /*tcr 43*/
   TNUM_BANK_INTERNAL_IPMOS_EVFY_EVEN            = 0x12B30000;   /*tcr 43*/
   TNUM_BANK_INTERNAL_IPMOS_EVFY_ODD             = 0x12C30000;   /*tcr 43*/
   TNUM_BANK_INTERNAL_IPMOS_CVFY_EVEN            = 0x12B50000;   /*tcr 43*/
   TNUM_BANK_INTERNAL_IPMOS_CVFY_ODD             = 0x12C50000;   /*tcr 43*/
   TNUM_BANK_INTERNAL_IPMOS_RDM0_EVEN            = 0x12B80000;   /*tcr 44*/
   TNUM_BANK_INTERNAL_IPMOS_RDM0_ODD             = 0x12C80000;   /*tcr 44*/
   TNUM_BANK_INTERNAL_IPMOS_RDM1_EVEN            = 0x12B90000;   /*tcr 45*/
   TNUM_BANK_INTERNAL_IPMOS_RDM1_ODD             = 0x12C90000;   /*tcr 45*/


   TNUM_IWLDRV_PROG_EVEN                = 0x12400000;   /*tcr 69*/
   TNUM_SA_IREF_LOAD_READ_EVEN          = 0x12500000;   /*tcr 70*/
   TNUM_SA_IREF_NOLOAD_READ_EVEN        = 0x12600000;   /*tcr 71*/

   TNUM_MAINBG_FORCE_MEASVRD0           = 0x10500000;   /*16bit ~~ 0x0188*/
   TNUM_MAINBG_MEASVRD0                 = 0x11000000;   /*tnum_pump_VRead*/
   TNUM_MAINBG_MEAS                     = 0x10000000;   /*tnum_pump_mainbg*/
   TNUM_MAINIREF_MEAS                   = 0x10100000;   /*tnum_pump_mainiref*/
   TNUM_MAINICMP10U_MEAS                = 0x10110000;   /*tnum_pump_mainicmp10u*/
   TNUM_ALWAYS_PASS                     = 0x00100000;   /*16bit ~~ 0x0010*/
   TNUM_SHELL_INFO                      = 0x00500000;   /*16bit ~~ 0x0001*/
   
   TNUM_IBIT_LEFT                       = 0x12300000;   /*16bit ~~ 0x038D} {left array*/
   TNUM_IBIT_RIGHT                      = 0x12310000;   /*16bit ~~ 0x038E} {right array*/
   TNUM_IREFPMOS_RD                     = 0x12100000;   /*16bit ~~ 0x0387*/

    /*TNUM_DUMP_FMW_MBOX    := 0x0401;} {don"t need on 32bit*/
   TNUM_OTP_WR_MISCLOC1                 = 0xA1E0A000;   /*16bit ~~ 0xD20E; offset 0x100-0x104*/
   TNUM_OTP_WR_MISCLOC2                 = 0xA10EA000;   /*16bit ~~ 0xD20F; offset 0x108-0x10C*/
   TNUM_BANK_RDSUPERM1S  = 0x280C;


   TNUM_BANK_BLV_RD                     = 0x12400000;   /*16bit ~~ 0x0A00 bl access/voltage during rd, tp1, tcr1*/
   TNUM_BANK_WLV_CVFY                   = 0x12200000;   /*16bit ~~ 0x0304 wl voltage during cvfy, tp2, tcr24*/
   TNUM_BANK_SLV_CMPT                   = 0x12210000;   /*16bit ~~ 0x030F sl voltage during cmpt, tp2, tcr26*/

   TNUM_BITLINE_ACCESS                  = 0x13000000;   /*tcr1*/

    /*+++ READ +++*/
   TNUM_BANK_RD0S                       = 0x40000000;   /*16bit ~~ 0xA801*/
   TNUM_BANK_RDM0S                      = 0x40040000;   /*16bit ~~ 0xA809*/
   TNUM_BANK_RD1S                       = 0x40001000;   /*16bit ~~ 0xA804*/
   TNUM_BANK_RDM1S                      = 0x40081000;   /*16bit ~~ 0xA80C*/
   TNUM_BANK_RD1S_PIPE                  = 0x40001000;   /*16bit ~~ 0xA804*/
   TNUM_BANK_RDM1S_PIPE                 = 0x40081000;   /*16bit ~~ 0xA80C*/
   TNUM_BANK_RDECHK                     = 0x40002000;   /*16bit ~~ 0xA803*/
   TNUM_BANK_RDMECHK                    = 0x400C2000;   /*16bit ~~ 0xA80B*/
   TNUM_BANK_RDOCHK                     = 0x40003000;   /*16bit ~~ 0xA802*/
   TNUM_BANK_RDMOCHK                    = 0x400C3000;   /*16bit ~~ 0xA80A*/
   TNUM_BANK_RD0S_RED                   = 0x40800000;   /*16bit ~~ 0xA901*/
   TNUM_BANK_RDM0S_RED                  = 0x40840000;   /*16bit ~~ 0xA909*/

   TNUM_BANK_CVFY_RED                   = 0x43800000;   /*16bit ~~ 0xAC0B w/ redund*/
   TNUM_BANK_CVFY                       = 0x43000000;   /*16bit ~~ 0xAC03 normal*/

   TNUM_BANK_RD_ARB_PSA                 = 0x8000AA00;  

   TNUM_BANK_RDM0ECHK                   = 0x40042000;  
   TNUM_BANK_RDM1ECHK                   = 0x40082000;  
   TNUM_BANK_RDM0OCHK                   = 0x40043000;  
   TNUM_BANK_RDM1OCHK                   = 0x40083000;  


    /*+++ VT +++*/
   TNUM_BANK_BCC_0S                     = 0x53000000;  
   TNUM_BANK_BCC_1S                     = 0x53001000;  
   TNUM_BANK_BCC_ECHK                   = 0x53002000;  
   TNUM_BANK_BCC_OCHK                   = 0x53003000;  
   TNUM_BANK_BCC_TCR6                   = 0x51000000;  
   TNUM_BANK_BCC_TCR38                  = 0x53000000;  
   TNUM_BANK_BCC_TCR39                  = 0x52000000;  
   TNUM_BANK_VT_TCR5                    = 0x50000000;  
   TNUM_BANK_VT_TCR6                    = 0x51000000;  
   TNUM_BANK_VT_TCR39                   = 0x52000000;  

   TNUM_BANK_VTMAX_RED                  = 0x50801000;   /*16bit ~~ 0xAB00 normal vt1 w/ redund*/
   TNUM_BANK_VTMAX_INTER_1S_RED         = 0x52801000;   /*16bit ~~ 0xAB0C used for Vt1max of 1s w/ redund*/
                                                         /*& Vt0max 0s,ev/odd chkb w redund*/
   TNUM_SECT_VTMAX_RED                  = 0x50801100;   /*16bit ~~ 0x9000 w/ red normal, tp1, tcr4*/
   TNUM_SECT_VTMAX_INTER_1S_RED         = 0x52801100;   /*16bit ~~ 0x9C00 w/ red used for Vt1max of 1s*/
                                                         /*and Vt0max of 0s,ev/odd chkb*/
   TNUM_BANK_VTMIN                      = 0x50000000;   /*16bit ~~ 0xAA01 normal vt0*/
   TNUM_SECT_VTMIN_NO_ESDA              = 0x50000100;   /*16bit ~~ 0x9100 normal, tp1, tcr4*/

   TNUM_BANK_VTMIN_RED                  = 0x50800000;   /*16bit ~~ 0xAB01 normal vt0 w/ redund*/
   TNUM_BANK_VTMIN_INTER_0S_RED         = 0x51800000;   /*16bit ~~ 0xAB09 used for Vt1min of 1s*/
                                                         /*and 0s,ev/odd chkb w/ redundancy*/
   TNUM_SECT_VTMIN_RED                  = 0x50800100;   /*16bit ~~ 0x9100 w/ red normal, tp1, tcr4*/
   TNUM_SECT_VTMIN_INTER_0S_RED         = 0x51800100;  

   TNUM_BANK_VTMAX                      = 0x50001000;   /*16bit ~~ 0xAA00 normal vt1*/
   TNUM_BANK_VTMAX_INTER_1S             = 0x52001000;   /*16bit ~~ 0xAA0C used for Vt1max of 1s*/
                                                         /*and Vt0max of 0s,ev/odd chkb*/
   TNUM_SECT_VTMAX_NO_ESDA              = 0x50001100;   /*16bit ~~ 0x9000 normal, tp1, tcr4*/
   TNUM_SECT_VTMAX_INTER_1S             = 0x52001100;  


   TNUM_BANK_VTECHK                     = 0x50002000;    /*16bit ~~ 0xAA03 normal even chkb*/
   TNUM_SECT_VT_ECHK                    = 0x50002100;   /*16bit ~~ 0x9300 normal, tp1, tcr4} {not used in flow*/

   TNUM_BANK_VTMAX_LOGICSECT            = 0x50001200;   /*16bit ~~ 0xB000 bank logical sector vtmax*/
   TNUM_BANK_VTMAX_INTER_1S_LOGICSECT   = 0x52001200;   /*16bit ~~ 0xEC00 used for block Vt1max of 1s*/
                                                         /*& Vt0max 0s,ev/odd chkb*/

   TNUM_BANK_VTECHK_LOGICSECT           = 0x50002200;   /*16bit ~~ 0xB300 bank logical sector vt even chk*/
   TNUM_BANK_VTMAX_INTER_ECHK_LOGICSECT = 0x52002200;   /*16bit ~~ 0xEF00 for block Vt1max echk*/
   TNUM_BANK_VTMIN_INTER_ECHK_LOGICSECT = 0x51002200;   /*16bit ~~ 0xEB00 for block Vt0min echk*/

   TNUM_BANK_VTOCHK_LOGICSECT           = 0x50003200;   /*16bit ~~ 0xB200 bank logical sector vt odd chk*/
   TNUM_BANK_VTMIN_INTER_OCHK_LOGICSECT = 0x51003200;   /*16bit ~~ 0xEA00 for block Vt0min ochk*/
   TNUM_BANK_VTMAX_INTER_OCHK_LOGICSECT = 0x52003200;   /*16bit ~~ 0xEE00 for block Vt1max ochk*/

   TNUM_BANK_VT_ARB_PSA                 = 0x5001AA00;   /*16bit ~~ 0x0702 VT arbitrary psa, e.g. TNI,Random,SCycle code*/

   TNUM_BANK_VTMAX_LOGICSECT_RED        = 0x50801200;   /*16bit ~~ 0xB040 bank logical sector vtmax*/
   TNUM_BANK_VTMAX_SCRN_LOGICSECT       = 0x50A01200;   /*16bit ~~ 0xB400 bank logical sector vtmax*/
                                                         /*w/ deviant bit screen*/



    /*+++ PROG +++*/
   TNUM_BANK_PROG_SM                    = 0x20000000;   /*CHANGED: Was changed to 0x21000000 on C05; changed back to - 0x20000000 due to MP3. Flow changed to use TNUM_BANK_PROG_ITERSECTOR; Jamal Sheikh modified Mon, Jan  9 2012 */
   TNUM_BANK_PROG_ECHK_CSW              = 0x23152000; /*0x23142000};  {16bit ~~ 0xA30A compressed sw*/
   TNUM_SECT_PROG_ECHK_CSW              = 0x23152100;   /*16bit ~~ 0x5500 compressed sw*/
   TNUM_BANK_PROG_OCHK_CSW              = 0x23153000;   /*16bit ~~ 0xA309 compressed sw*/
   TNUM_SECT_PROG_OCHK_CSW              = 0x23153100;   /*16bit ~~ 0x5300 compressed sw*/

   TNUM_BANK_PROG_OCHK                  = 0x20003000;   /*bit disturb disable*/
   TNUM_BANK_PROG_ECHK                  = 0x20002000;   /*bit disturb disable*/
   TNUM_BANK_PROG_OCHK_DISTURB          = 0x20013000;   /*bit disturb ena*/
   TNUM_BANK_PROG_ECHK_DISTURB          = 0x20012000;   /*bit disturb ena*/

    /*note: precon tnum uses erase test type instead of program test type*/
   TNUM_BANK_PRECON                     = 0x32000000;   /*16bit ~~ 0xA403 sm precond}  {CHANGED: Was changed from 0x32000000 to 0x20000400 in C05. Changed back to 0x32000000, only need to change the OTP.  Jamal Sheikh modified Mon, Jan  9 2012*/
   TNUM_SECT_PRECON                     = 0x32000100;   /*16bit ~~ 0x5A00 sm precond*/
   TNUM_BANK_PROG_ONEPLS                = 0x31000000;   /*16bit ~~ 0xA400 one pulse prog*/
   TNUM_BANK_PROG_LOWVT                 = 0x31100000;   /*16bit ~~ 0xA401 low-vt prog 4 pulses*/
   TNUM_BANK_PROG_RESTORE               = 0x31200000;   /*16bit ~~ 0xA402 */

   TNUM_BANK_PROG_ITERSECTOR            = 0x21000000;


    /*+++ ERASE +++*/
   TNUM_BANK_ERS_PRECON                 = 0x30010000;   /*0x30010000; 16bit ~~ 0xA000 sm w/ precond*/
   TNUM_SECT_ERS_PRECON_SM              = 0x30010100;   /*16bit ~~ 0x4000 fsm ers*/
   TNUM_BANK_ERS_NOPRECON               = 0x30000000;   /*16bit ~~ 0xA001 sm w/o precond*/
   TNUM_SECT_ERS_NOPRECON_SM            = 0x30000100;   /*16bit ~~ 0x4200 fsm ers*/
   TNUM_BANK_ERS_PRECON_SW              = 0x33000000;   /*0x33010000 precon is not robustly wking*/
   TNUM_SECT_ERS_PRECON                 = 0x33000100;   /*16bit ~~ 0x4100 software ers*/

   TNUM_BANK_ERS_ITERSECTOR             = 0x30040000;
   TNUM_BANK_ERS_ITERSECTOR_PRECON      = 0x30840000;

    /*fast ers-stress*/
   TNUM_BANK_ERS_STRESS_FAST            = 0x60300000;   /*16bit ~~ 0xA60E */
   TNUM_BANK_REPAIR_CALC_SOLUTION_VT0S  = 0x50830000;   /*16bit ~~ 0xD805 */
   TNUM_BANK_REPAIR_UPDATE_SOLUTION     = 0x82500000;    /*16bit ~~ 0xD807 */
   TNUM_BANK_REPAIR_PROG_SOLUTION       = 0x70000100;   /*16bit ~~ 0xD803 */

    /*slow ers-stress*/
   TNUM_BANK_ERS_STRESS_SLOW            = 0x60400000;   /*16bit ~~ 0xA60F */
   TNUM_BANK_REPAIR_CALC_SOLUTION_VT1S  = 0x50831200;   /*16bit ~~ 0xBC00 */
   TNUM_BANK_ERS_SW_SCREEN              = 0x33100000;   /*16bit ~~ 0xA006 sw ers for post-slow ers screen*/
   TNUM_OTP_RESET_BANK                  = 0x82300000;   /*16bit ~~ 0xCE01 reset bank, relatch from otp*/

    /*weak ers-stress*/
   TNUM_BANK_ERS_WEAK                   = 0x60B00000;   /*tv1 0x60800000*/


    /*+++ STRESS/LEAK +++*/
   TNUM_BANK_WLS_ODD                    = 0x60110000;   /*tv1 0x60010000*/
   TNUM_BANK_WLS_EVEN                   = 0x60120000;   /*tv1 0x60020000*/
   TNUM_BANK_WLS                        = 0x60100000;   /*tv1 0x60000000*/
   TNUM_SECT_WLS                        = 0x60100100;   /*16bit ~~ 0x6800 tp1, tcr8*/
   TNUM_BANK_BLS_ODD                    = 0x60010000;   /*tv1 0x60110000*/
   TNUM_BANK_BLS_EVEN                   = 0x60020000;   /*tv1 0x60120000*/
   TNUM_BANK_BLS                        = 0x60000000;   /*tv1 0x60100000*/
   TNUM_BANK_CGS_ODD                    = 0x60210000;   /*tv1 0x60210000*/
   TNUM_BANK_CGS_EVEN                   = 0x60220000;   /*tv1 0x60220000*/
   TNUM_BANK_CGS                        = 0x60200000;   /*tv1 0x60200000*/
   TNUM_BANK_EGCSS                      = 0x60400000;   /*tv1 0x60300000*/
   TNUM_BANK_EGS                        = 0x60300000;   /*tv1 0x60400000*/
   TNUM_BANK_REVTUNN_STRESS             = 0x60600000;   /*tcr54} {tv1 0x60500000*/
   TNUM_BANK_PTHRU_STRESS               = 0x60600000;   /*tcr54} {tv1 0x60500000*/
   TNUM_BANK_THINOX_STRESS              = 0x60600000;   /*tcr54} {tv1 0x60500000*/
   TNUM_BANK_PGMFF_STRESS               = 0x60500000;   /*tcr107} {tcr52 tv1 0x60600000*/
   TNUM_BANK_TUNOX_STRESS               = 0x60800000;   /*tcr108} {tcr52 tv1 0x60600000*/
   TNUM_BANK_ONO_STRESS                 = 0x60700000;   /*tcr53} {tcr53 tv1 0x60700000*/
   TNUM_BANK_CSFG_STRESS                = 0x60900000;   /*tcr110} {5-terminal stress tcr84 tv1 0x60900000*/
                                                                  /*5-terminal stress tcr84 tv2 0x60A00000*/
   TNUM_BANK_RDDIST_STRESS              = 0x60100000;   /*tcr58} {tcr58 tv1 0x60000000*/

   TNUM_PROG_RANDCODE = 0x50000000;
   TNUM_EXEC_RANDCODE = 0xE0070200;


    /*+++ READ +++*/
   TNUM_OTP_RD0S                        = 0x40000400;   /*16bit ~~ 0xC801*/
   TNUM_OTP_RDM0S                       = 0x40040400;   /*16bit ~~ 0xC809*/
   TNUM_OTP_RD1S                        = 0x40001400;   /*16bit ~~ 0xC801*/
   TNUM_OTP_RDM1S                       = 0x40081400;   /*16bit ~~ 0xC809*/
   TNUM_OTP_RDECHK_SEMI                 = 0x40002500;   /*16bit ~~ 0xC903*/
   TNUM_OTP_RDOCHK_SEMI                 = 0x40003500;   /*16bit ~~ 0xC902*/
   TNUM_OTP_RDM0S_SEMI                  = 0x40040500;  
   TNUM_OTP_RDM0S_TEMPLATE              = 0x40045600;   /*read via otp data copy*/
   TNUM_OTP_RDM1S_TEMPLATE              = 0x40085600;   /*read via otp data copy*/

   TNUM_OTP_CHKSUM                      = 0x81100400;   /*0x81110400 - include ecc, 0x81100400 - no ecc*/

    /*+++ VT +++*/
   TNUM_OTP_VTMIN                       = 0x50000400;   /*16bit ~~ 0xCA01 normal,tp1, tcr4*/
   TNUM_OTP_VTMIN_INTER_0S              = 0x51000400;   /*16bit ~~ 0xCA09 used for Vt1min of 1s,0s,ev/odd chkb*/
   TNUM_OTP_VTMAX_INTER_1S              = 0x52001400;   /*16bit ~~ 0xCA0C used for Vt1max of 1s*/
                                                         /*and Vt0max of 0s,ev/odd chkb*/
   TNUM_OTP_VTMAX                       = 0x50001400;   /*16bit ~~ 0xCA00 normal,tp1, tcr4*/
   TNUM_OTP_VTMAX_SEMI_INTER_1S         = 0x52001500;   /*16bit ~~ 0xCB0C used for Vt1max of 1s*/
                                                         /*and Vt0max of 0s,ev/odd chkb*/
   TNUM_OTP_VTMAX_SEMI                  = 0x50001500;   /*16bit ~~ 0xCB00 normal, semi-otp*/
   TNUM_OTP_VTMIN_SEMI_INTER_ECHK       = 0x51002500;   /*16bit ~~ 0xCB0B for Vt0min echk*/
   TNUM_OTP_VTECHK_SEMI                 = 0x50002500;   /*16bit ~~ 0xCB03 normal, semi-otp*/
   TNUM_OTP_VTMAX_SEMI_INTER_ECHK       = 0x52002500;   /*16bit ~~ 0xCB0F for Vt1max echk*/
   TNUM_OTP_VTMIN_SEMI                  = 0x50000500;   /*16bit ~~ 0xCB01 normal, semi-otp*/
   TNUM_OTP_VTMIN_SEMI_INTER_OCHK       = 0x51003500;   /*16bit ~~ 0xCB0A for Vt0min ochk*/
   TNUM_OTP_VTOCHK_SEMI                 = 0x50003500;   /*16bit ~~ 0xCB02 normal, semi-otp*/
   TNUM_OTP_VTMAX_SEMI_INTER_OCHK       = 0x52003500;   /*16bit ~~ 0xCB0E for Vt1max ochk*/



    /*+++ ERASE +++*/
   TNUM_OTP_ERS_PRECON                  = 0x30010400;   /*16bit ~~ 0xC000 ers w/ precond*/
   TNUM_OTP_ERS_NOPRECON                = 0x30000400;   /*16bit ~~ 0xC000 ers*/
   TNUM_OTP_ERS_PRECON_SW               = 0x33010400;
   TNUM_OTP_ERS_PRECON_SEMI             = 0x70100000;   /*otp refresh*/


    /*+++ STRESS +++*/
   TNUM_OTP_WLS                         = 0x60000000;   /*16bit ~~ 0xC606 tp1, tcr8*/


    /*+++ PROG +++*/
   TNUM_OTP_PRECON                      = 0x32000400;  
   TNUM_OTP_PROG                        = 0x20000400;   /*16bit ~~ 0xC200 sm*/
   TNUM_OTP_PROG_SEMI                   = 0x20000500;  
   TNUM_OTP_PROG_ECHK_SEMI_CSW          = 0x23102500;   /*16bit ~~ 0xC30E sw compressed semi prog even chkb*/
   TNUM_OTP_PROG_SEMI_SW                = 0x23000500;   /*16bit ~~ 0xC308 sw semi-otp/customer prog 0s*/
   TNUM_OTP_PROG_OCHK_SEMI_CSW          = 0x23103500;   /*16bit ~~ 0xC30D sw compressed semi prog odd chkb*/
   TNUM_OTP_PROG_ECHK_SEMI              = 0x20002500;  
   TNUM_OTP_PROG_OCHK_SEMI              = 0x20003500;  
   TNUM_OTP_PROG_ECHK_DISTURB_SEMI      = 0x20012500;  
   TNUM_OTP_PROG_OCHK_DISTURB_SEMI      = 0x20013500;  
   TNUM_OTP_PROG_TEMPLATE               = 0x20004600;   /*16bit ~~ 0xC500 prog otp wd9*/
                                                         /*requires otp in erased state 1s*/
                                                         /*also cannot run back-to-back or*/
                                                         /*it would fail*/
   TNUM_OTP_PROG_TEMPLATE_ENGOVRD       = 0x70000200;   /*pgm template w/ eng override vhv/pmos trim, no refresh*/

   TNUM_OTP_PROG_ONEPLS                 = 0x31000400;   /*16bit ~~ 0xC400 */

   TNUM_OTP_REFRESH                     = 0x70100000;   /*16bit ~~ 0xC502 reprogrammed OTP data w/o cbits*/
                                                         /*also ers semi-otp chk/invchk*/
   TNUM_OTP_REFRESH_VT                  = 0x70140000;   /*16bit ~~ 0xC503 used for clear DRL VT log in OTP*/

   TNUM_OTP_PROG_AVNV_SETTING           = 0x70010000;   /*16bit ~~ 0xC50B write otp avnv setting*/
   TNUM_OTP_PROG_PMOS_SETTING           = 0x71000800;   /*16bit ~~ 0xC50A write otp avnv setting*/

   TNUM_OTP_PROG_EFCHKSUM               = 0xA0C01000;   /*no refresh & ef chksum only*/
   TNUM_OTP_PROG_EFCHKSUM_PUMP_TRIM     = 0xA0C71000;   /*no refresh & ef chksum,bgap,iref,fosc,vsa5,slpct*/


    /*+++ FLOWBYTE +++*/
    /*note: target field is not applicable to flowbyte(0x9..)/otpdata(0x7..) tnum*/
   TNUM_OTP_WR_MP2_FLWBYTE              = 0x91000200;   /*16bit ~~ 0xD301 mp2 flowbyte*/
   TNUM_OTP_WR_MP3_FLWBYTE              = 0x91000400;   /*16bit ~~ 0xD302 mp3 flowbyte*/
   TNUM_OTP_WR_FT1_FLWBYTE              = 0x91001000;   /*16bit ~~ 0xD304 ft1 flowbyte*/
   TNUM_OTP_WR_FT3_FLWBYTE              = 0x91004000;   /*16bit ~~ 0xD306 ft3 flowbyte*/
   TNUM_OTP_WR_FUNC1_FLWBYTE            = 0x91010000;   /*16bit ~~ 0xD308 func1 flowbyte use for mp2*/
   TNUM_OTP_WR_FUNC2_FLWBYTE            = 0x91020000;   /*16bit ~~ 0xD309 func2 flowbyte use for mp3tni*/
   TNUM_OTP_WR_DRL_FLWBYTE              = 0x91008000;   /*16bit ~~ 0xD307 drl flowbyte use for mp3*/
   TNUM_OTP_WR_MP3DRL_FLWBYTE           = TNUM_OTP_WR_DRL_FLWBYTE;
   TNUM_OTP_WR_FUNC3_FLWBYTE            = 0x91040000;   /*16bit ~~ 0xD30A func3 flowbyte use for ft1drl*/
   TNUM_OTP_WR_EXEC_FLWBYTE             = 0x91100000;   /*16bit ~~ 0xD30D execute flowbyte for ft3tni*/
   TNUM_OTP_WR_BURNIN_FLWBYTE           = 0x91200000;   /*16bit ~~ 0xD30C burnin flowbyte. use this for ft2 good*/
   TNUM_OTP_WR_CUST_FLWBYTE             = 0x91800000;   /*16bit ~~ 0xD30F customer bit*/
   TNUM_OTP_WR_REPAIR_FLWBYTE           = 0x91080000;   /*16bit ~~ 0xD30B repair flowbyte use for mp1*/

   TNUM_OTP_WR_DIEID_FBYTE_MP1_MBOX     = 0x71006000;   /*16bit ~~ 0xD602 old 0x0052*/
   TNUM_OTP_WR_PKG_MEMSIZE_MBOX         = 0x71001000;   /*16bit ~~ 0xD60F pkg,memsize*/
   TNUM_OTP_PROG_CHKSUM_CBITS           = 0x71600000;   /*16bit ~~ 0xC508 write otp chksum & cbits*/
   TNUM_OTP_PROG_ECC_BITS               = 0x71080000;   /*16bit ~~ 0xC50C write otp ecc bit*/
   TNUM_OTP_PROG_FSPEED_BITS            = 0x71008000;   /*16bit ~~ 0xC50E write otp flash speed*/

   TNUM_OTP_WR_BLK_PREDRL_VT_MBOX       = 0xA280A200;    /*16bit ~~ 0xD000 write block preDRL VT0 (mp1)*/
   TNUM_OTP_WR_BLK_PREDRL_VT1_MBOX      = 0xA208A200;   /*16bit ~~ 0xD003 write block preDRL VT1 (mp1)*/
   TNUM_OTP_WR_BLK_POSTDRL1_VT_MBOX     = 0xA240A200;   /*16bit ~~ 0xD001 write block pstDRL1 VT0 (mp2)*/
   TNUM_OTP_WR_BLK_POSTDRL1_VT1_MBOX    = 0xA204A200;   /*16bit ~~ 0xD004 write block pstDRL1 VT1 (mp2)*/
   TNUM_OTP_WR_BANK_POSTDRL2_VT_MBOX    = 0xA220A000;   /*16bit ~~ 0xD00A write bank pstDRL2 VT0/1 (mp3)*/


   TNUM_OTP_WR_PREDRL_VT_MBOX           = 0xA200A100;   /*16bit ~~ 0xD104 old 0x1985 sectr predrl vt*/
   TNUM_OTP_WR_BANK_PREDRL_VT_MBOX      = 0xA200A000;   /*16bit ~~ 0xD100 write bank preDRL VT*/

   TNUM_OTP_RD_ID_MBOX                  = 0x80110400;   /*image otp row 0x100-0x1ff to ram*/
   TNUM_OTP_RD_VT_MBOX                  = 0x80120400;   /*image otp row 0x200-0x2ff to ram*/
   TNUM_OTP_RD_LOG1_MBOX                = 0x80100400;   /*image otp row 0x000-0x0ff to ram*/
   TNUM_OTP_RD_LOG3_MBOX                = 0x80130400;   /*image otp row 0x300-0x3ff to ram*/

   TNUM_OTP_WR_PGMREV_MBOX              = 0xA0002000;  
   TNUM_OTP_WR_FLWBYTE_MBOX             = 0x71004000;  
   TNUM_OTP_WR_VT_MBOX                  = 0xA000D000;  

   TNUM_OTP_WR_MP1_REV                  = 0xA0800000;     /*16bit ~~ 0xD606*/
   TNUM_OTP_WR_MP2_REV                  = 0xA0400000;     /*16bit ~~ 0xD607*/
   TNUM_OTP_WR_MP3_REV                  = 0xA0200000;     /*16bit ~~ 0xD608*/
   TNUM_OTP_WR_FT1_REV                  = 0xA0080000;     /*16bit ~~ 0xD60A*/
   TNUM_OTP_WR_FT2_REV                  = 0xA0040000;     /*16bit ~~ 0xD60B*/
   TNUM_OTP_WR_FT3_REV                  = 0xA0020000;     /*16bit ~~ 0xD60C*/




    /* GL_VT_TTR_OPTION, GL_OTP_VT_TTR_OPTION */
    /* 0  = none      */
    /* 1  = adapext vt*/
    /* 2  = intext vt */
   GL_VT_TTR_OPTION = 2;
   GL_OTP_VT_TTR_OPTION = 0;
   GL_TTR_ENA_VT = true;
   GL_INTEXT_VT_SEARCH_WINDOW = 100mV;

   GL_F021_PARAM_MAXTIME = 100ms;

   OVRIND_PSU     = 0x01;
   OVRIND_ESU     = 0x02;
   OVRIND_CSU     = 0x03;
   OVRIND_PVSU    = 0x04;
   OVRIND_EVSU    = 0x05;
   OVRIND_RPTVSU  = 0x06;
   OVRIND_CVSU    = 0x07;
   OVRIND_AEXEZSU = 0x08;
   OVRIND_PVACC   = 0x09;
   OVRIND_PH      = 0x0A;
   OVRIND_EH      = 0x0B;
   OVRIND_RH      = 0x0C;
   OVRIND_PVH     = 0x0D;
   OVRIND_PVH2    = 0x0E;
   OVRIND_PPW     = 0x0F;
   OVRIND_EPW     = 0x10;
   OVRIND_EPWHI   = 0x11;
   OVRIND_VSTAT   = 0x12;

   OVRIND_MAXPP         = 0x20;
   OVRIND_MAXEP         = 0x21;
   OVRIND_VHV_ESTART_CT = 0x22;
   OVRIND_VHV_ESTEP     = 0x23;
    /*OVRIND_VHV_ESTOP_CT  := 0x24;}  {KChau 09/01/10 - removed as shell changed*/

   OVRIND_VHV_PG_CT     = 0x30;
   OVRIND_VHV_ER_CT     = 0x31;
   OVRIND_VHV_PV_CT     = 0x32;
   OVRIND_VCG2P5_CT     = 0x33;
   OVRIND_VINH_CT       = 0x34;
   OVRIND_VSL_CT        = 0x35;
   OVRIND_VWL_CT        = 0x36;
   OVRIND_VRD_CT        = 0x37;
    /*OVRIND_VSA5_CT       := 0x38;} {KChau 09/01/10 - removed as shell changed*/
   OVRIND_PUMP_SEQ      = 0x38;    /*KChau 09/01/10 - shell changed, was 0x39*/

   OVRIND_PV_NMOS_RAT        = 0x40;
   OVRIND_PV_PMOS_EVEN_RAT   = 0x41;
   OVRIND_PV_PMOS_ODD_RAT    = 0x42;
   OVRIND_PV_PRECHARGE       = 0x43;
   OVRIND_EV_NMOS_RAT        = 0x50;
   OVRIND_EV_PMOS_EVEN_RAT   = 0x51;
   OVRIND_EV_PMOS_ODD_RAT    = 0x52;
   OVRIND_EV_PRECHARGE       = 0x53;
   OVRIND_CV_NMOS_RAT        = 0x60;
   OVRIND_CV_PMOS_EVEN_RAT   = 0x61;
   OVRIND_CV_PMOS_ODD_RAT    = 0x62;
   OVRIND_CV_PRECHARGE       = 0x63;
   OVRIND_RDM0_NMOS_RAT      = 0x70;
   OVRIND_RDM0_PMOS_EVEN_RAT = 0x71;
   OVRIND_RDM0_PMOS_ODD_RAT  = 0x72;
   OVRIND_RDM0_PRECHARGE     = 0x73;
   OVRIND_RDM1_NMOS_RAT      = 0x80;
   OVRIND_RDM1_PMOS_EVEN_RAT = 0x81;
   OVRIND_RDM1_PMOS_ODD_RAT  = 0x82;
   OVRIND_RDM1_PRECHARGE     = 0x83;
   OVRIND_RD_NMOS_RAT        = 0x90;
   OVRIND_RD_PMOS_EVEN_RAT   = 0x91;
   OVRIND_RD_PMOS_ODD_RAT    = 0x92;
   OVRIND_RD_PRECHARGE       = 0x93;

   OVRIND_REFBIT_HV_PROTECTION  = 0xA0;  /*bank efuse bit13*/
   OVRIND_ALL_RLBL_OFF          = 0xA1;
   OVRIND_OVRIDE_OTP_RATIO      = 0xA2;  /*use efuse ratio for all modes*/
   OVRIND_LPWMODE_NO_TB_SPLIT   = 0xA3;
   OVRIND_USE_1P5X_SA_TIMING    = 0xA4;  /*increase all sa timings*/
   OVRIND_COL_CHANGEABLE_IN_PGM = 0xA5;
   OVRIND_IGNORE_BU_RD_RATIO    = 0xA6;  /*use efuse ratio for read*/
   OVRIND_MASTER_REDUND_DISABLE = 0xA7;
   OVRIND_DISABLE_VRDBUF        = 0xA8;
   OVRIND_INC_PV_SA_TIMING      = 0xA9;
   OVRIND_OTP_HV_PROTECTION     = 0xAA;  /*bank efuse bit23*/

    /*Default rom template val*/
    /*W8_0=0xB982 A614, W8_4=0x0098 5260, W8_8=0x0026 0D00, W8_C=0x9840 0000*/
    /*W9_0=0x0480 1200, W9_4=0x0008 0120, W9_8=0x0002 0000, W9_C=0x0800 0000*/
   W8_0_DEF_CAT0 = 0xB982A614;
   W8_4_DEF_CAT0 = 0x00985260;
   W8_8_DEF_CAT0 = 0x00260D00;
   W8_C_DEF_CAT0 = 0x98400000;
   W9_0_DEF_CAT0 = 0x04801200;
   W9_4_DEF_CAT0 = 0x00080120;
   W9_8_DEF_CAT0 = 0x00020000;
   W9_C_DEF_CAT0 = 0x08000000;

   ADDR_RAM_OTP_TEMP_W8 = 0x2F80;   /*ram loc where w8 start. can be different on tv2.0*/
   
   
    /*w8/w9 bit def -- FYI...*/
    /* ---
    W89_PVR_NMOS_BITSTART := 0; {bit0/lsb}
    W89_PVR_NMOS_BITSTOP  := 4;
    W89_PVR_PMOS_BITSTART := 5;
    W89_PVR_PMOS_BITSTOP  := 9;
    W89_PVR_PC_BITSTART   := 10;
    W89_PVR_PC_BITSTOP    := 12;
    W89_PVR_ENA_BIT       := 13;
 
    W89_EVR_NMOS_BITSTART := 14;
    W89_EVR_NMOS_BITSTOP  := 18;
    W89_EVR_PMOS_BITSTART := 19;
    W89_EVR_PMOS_BITSTOP  := 23;
    W89_EVR_PC_BITSTART   := 24;
    W89_EVR_PC_BITSTOP    := 26;
    W89_EVR_ENA_BIT       := 27;
 
    W89_CVR_NMOS_BITSTART := 28;
    W89_CVR_NMOS_BITSTOP  := 32;
    W89_CVR_PMOS_BITSTART := 33;
    W89_CVR_PMOS_BITSTOP  := 37;
    W89_CVR_PC_BITSTART   := 38;
    W89_CVR_PC_BITSTOP    := 40;
    W89_CVR_ENA_BIT       := 41;
    
    W89_RM0R_NMOS_BITSTART := 42;
    W89_RM0R_NMOS_BITSTOP  := 46;
    W89_RM0R_PMOS_BITSTART := 47;
    W89_RM0R_PMOS_BITSTOP  := 51;
    W89_RM0R_PC_BITSTART   := 52;
    W89_RM0R_PC_BITSTOP    := 54;
    W89_RM0R_ENA_BIT       := 55;
    
    W89_UNUSED1_NMOS_BITSTART := 56;
    W89_UNUSED1_NMOS_BITSTOP  := 60;
    W89_UNUSED1_PMOS_BITSTART := 61;
    W89_UNUSED1_PMOS_BITSTOP  := 65;
    W89_UNUSED1_PC_BITSTART   := 66;
    W89_UNUSED1_PC_BITSTOP    := 68;
    W89_UNUSED1_NA_BITSTART   := 69;
    W89_UNUSED1_NA_BITSTOP    := 70;
    W89_UNUSED1_ENA_BIT       := 71;
    
    W89_RM1R_NMOS_BITSTART := 72;
    W89_RM1R_NMOS_BITSTOP  := 76;
    W89_RM1R_PMOS_BITSTART := 77;
    W89_RM1R_PMOS_BITSTOP  := 81;
    W89_RM1R_PC_BITSTART   := 82;
    W89_RM1R_PC_BITSTOP    := 84;
    W89_RM1R_ENA_BIT       := 85;
    
    W89_UNUSED2_NMOS_BITSTART := 86;
    W89_UNUSED2_NMOS_BITSTOP  := 90;
    W89_UNUSED2_PMOS_BITSTART := 91;
    W89_UNUSED2_PMOS_BITSTOP  := 95;
    W89_UNUSED2_PC_BITSTART   := 96;
    W89_UNUSED2_PC_BITSTOP    := 98;
    W89_UNUSED2_ENA_BIT       := 99;
    
    W89_UNUSED3_NMOS_BITSTART := 100;
    W89_UNUSED3_NMOS_BITSTOP  := 104;
    W89_UNUSED3_PMOS_BITSTART := 105;
    W89_UNUSED3_PMOS_BITSTOP  := 109;
    W89_UNUSED3_PC_BITSTART   := 110;
    W89_UNUSED3_PC_BITSTOP    := 112;
    W89_UNUSED3_ENA_BIT       := 113;
    
    W89_BKRR_NMOS_BITSTART := 114;
    W89_BKRR_NMOS_BITSTOP  := 118;
    W89_BKRR_PMOS_BITSTART := 119;
    W89_BKRR_PMOS_BITSTOP  := 123;
    W89_BKRR_PC_BITSTART   := 124;
    W89_BKRR_PC_BITSTOP    := 126;
    W89_BKRR_ENA_BIT       := 127;
    --- */


    /*--- artificial (fake) repair ---*/
    /*pre-defined fake repair solution: [bank,block,index]*/
    /*rep sol 32-bit field def -- 31:14=unused, 13=ena, 12=stick (mux32 only), 11:0=Q*/
    /*-- bank0 --*/
    /*middle stick repair*/
   FAKEREP_SOL[0][0][0] = 0x2047;  /*LH Q71 SL*/
   FAKEREP_SOL[0][0][1] = 0x2048;  /*LH Q72 SR*/
   FAKEREP_SOL[0][0][2] = 0x2047;  /*RH Q71 SL*/
   FAKEREP_SOL[0][0][3] = 0x2048;  /*RH Q72 SR*/
    /*stick halfway out repair*/
   FAKEREP_SOL[0][1][0] = 0x2023;  /*LH Q35  SL*/
   FAKEREP_SOL[0][1][1] = 0x206C;  /*LH Q108 SR*/
   FAKEREP_SOL[0][1][2] = 0x2023;  /*RH Q35  SL*/
   FAKEREP_SOL[0][1][3] = 0x206C;  /*RH Q108 SR*/
    /*no repair*/
   FAKEREP_SOL[0][2][0] = 0x0000; 
   FAKEREP_SOL[0][2][1] = 0x0000; 
   FAKEREP_SOL[0][2][2] = 0x0000; 
   FAKEREP_SOL[0][2][3] = 0x0000; 
    /*middle stick repair*/
   FAKEREP_SOL[0][3][0] = 0x2047;  /*LH Q71 SL*/
   FAKEREP_SOL[0][3][1] = 0x2048;  /*LH Q72 SR*/
   FAKEREP_SOL[0][3][2] = 0x2047;  /*RH Q71 SL*/
   FAKEREP_SOL[0][3][3] = 0x2048;  /*RH Q72 SR*/
    /*-- bank1 --*/
    /*old Q-number stick halfway out repair*/
   FAKEREP_SOL[1][0][0] = 0x3023;  /*LH Q35  S1 SL*/
   FAKEREP_SOL[1][0][1] = 0x206C;  /*LH Q108 S0 SR*/
   FAKEREP_SOL[1][0][2] = 0x3023;  /*RH Q35  S1 SL*/
   FAKEREP_SOL[1][0][3] = 0x206C;  /*RH Q108 S0 SR*/
    /*stick halfway out repair*/
   FAKEREP_SOL[1][1][0] = 0x2047;  /*LH Q35  S1 SL*/
   FAKEREP_SOL[1][1][1] = 0x20D8;  /*LH Q108 S0 SR*/
   FAKEREP_SOL[1][1][2] = 0x2047;  /*RH Q35  S1 SL*/
   FAKEREP_SOL[1][1][3] = 0x20D8;  /*RH Q108 S0 SR*/
    /*stick halfway out repair*/
   FAKEREP_SOL[1][2][0] = 0x2047;  /*LH Q35  S1 SL*/
   FAKEREP_SOL[1][2][1] = 0x20D8;  /*LH Q108 S0 SR*/
   FAKEREP_SOL[1][2][2] = 0x2047;  /*RH Q35  S1 SL*/
   FAKEREP_SOL[1][2][3] = 0x20D8;  /*RH Q108 S0 SR*/
    /*middle stick repair*/
   FAKEREP_SOL[1][3][0] = 0x0000;  /*LH Q71 S1 SL*/
   FAKEREP_SOL[1][3][1] = 0x0000;  /*LH Q72 S0 SR*/
   FAKEREP_SOL[1][3][2] = 0x0000;  /*RH Q71 S1 SL*/
   FAKEREP_SOL[1][3][3] = 0x0000;  /*RH Q72 S0 SR*/
    /*stick halfway out repair*/
   FAKEREP_SOL[1][4][0] = 0x2047;  /*LH Q35  S1 SL*/
   FAKEREP_SOL[1][4][1] = 0x20D8;  /*LH Q108 S0 SR*/
   FAKEREP_SOL[1][4][2] = 0x2047;  /*RH Q35  S1 SL*/
   FAKEREP_SOL[1][4][3] = 0x20D8;  /*RH Q108 S0 SR*/
    /*no repair*/
   FAKEREP_SOL[1][5][0] = 0x0000; 
   FAKEREP_SOL[1][5][1] = 0x0000; 
   FAKEREP_SOL[1][5][2] = 0x0000; 
   FAKEREP_SOL[1][5][3] = 0x0000; 
    /*-- bank2 --*/
    /*middle stick repair*/
   FAKEREP_SOL[2][0][0] = 0x2047;  /*LH Q71 SL*/
   FAKEREP_SOL[2][0][1] = 0x2048;  /*LH Q72 SR*/
   FAKEREP_SOL[2][0][2] = 0x2047;  /*RH Q71 SL*/
   FAKEREP_SOL[2][0][3] = 0x2048;  /*RH Q72 SR*/

 /*psk :022411 Changing IPMOS trim to use NMOS read, so trim count has been changed from 0 to 1*/

    /*ipmos trim option*/
   GL_PMOS_TRIM_COUNT = 1; /*0*/

 /*end of f035_cfginclude.p*/
}

 /****************************************************************************/
 /*---------------------------- SUMMARY OF CHANGES ----------------------------*/
 /****************************************************************************/
 /* A1.0  :                                                                    */
 /* 1)  Initial release with 8us program pw override.                          */
 /*                                                                            */
 /*----------------------------------------------------------------------------*/
 /* A1.1  :                                                                    */
 /* 1)  Modified CG (tcr7) and EG (tcr23) leakage tests to subtract pump lkg   */
 /*     (tcr86) for true bank lkg.                                             */
 /* 2)  Use bank sw erase w/ no precon instead of SM erase due to sm issue.    */
 /* 3)  Enable VT/BCC tests.                                                   */
 /*                                                                            */
 /*----------------------------------------------------------------------------*/
 /* A1.2  :                                                                    */
 /* 1)  Updated OTP funcs/procedures to reflect new OTP format changes.        */
 /* 2)  Disable ref array erase on reprobe site.                               */
 /* 3)  Datalog only for bank and sector deplete tests.                        */
 /* 4)  Added validation stress tests that used more than 2 tpads for Gerry.   */
 /*                                                                            */
 /*----------------------------------------------------------------------------*/
 /* A1.3  :                                                                    */
 /* 1)  Removed 8us program pw override as new shell default of 8us ppw.       */
 /* 2)  Added pre ref array erase IPMOS measurement and log to tw.             */
 /* 3)  Added configurable not to log all individual sense amp measurements to */
 /*     tw on SenAmp Iref Load/NoLoad, WLDriver current tests (default), and   */
 /*     log min/max sense amp number with its measurement to tw.               */
 /* 4)  Added OTP restore func to be used at MP3 after stresses. Flow needs to */
 /*     be updated.                                                            */
 /*                                                                            */
 /*----------------------------------------------------------------------------*/
 /* A1.4  :                                                                    */
 /* 1)  Changed bank prog echk/ochk with bit disturb enable.                   */
 /* 2)  Added charz routines for ref array erase, program pw, Iref NMOS/PMOS   */
 /*     repeatability, BCC0/1 DOE.                                             */
 /* 3)  Removed tpad ramping on Leakage and Stress tests.                      */
 /* 4)  Changed EGCS leakage test (tcr13) to set tpad prior entering tcr mode  */
 /*     or else would get high/clamp leak measurement.                         */
 /* 5)  Added configurable to select either tcr5,6,39 for VT, and tcr6,38,39   */
 /*     for BCC tests.                                                         */
 /* 6)  Reduced search window GL_BCC_SEARCH_START(1) to 20ua (was 2ua).        */
 /* 7)  Corrected bugs on tw total prog, cmpt pulse, & tnum tw string in       */
 /*     F021_Log_FailPat_To_TW.                                                */
 /* 8)  Added reprobe support on adaptive RefArray erase.                      */
 /* 9)  Changed IPMOS_Evfy_LLim/ULim to -85ua/-126ua per tech team.            */
 /*                                                                            */
 /*----------------------------------------------------------------------------*/
 /* A1.5  :                                                                    */
 /* 1)  Changed to new VT/BCC tests conditions (tcr,limits) and use PSA read   */
 /*     (was normal) for TTR.  Note that DRL VT/BCC is using normal read as    */
 /*     sector and block psa is not supported in F021.                         */
 /* 2)  Added flash ESDA in Cycle9X, PgmMain, and BankErs_* tests.  Note that  */
 /*     SCRAM and VT/BCC ESDA options are not support yet.                     */
 /* 3)  Bug fix WebID Flash_Test.BTS_F021_VLCTSTD.1 with using correct testname*/
 /*     in bank erase tests.                                                   */
 /* 4)  Added data collection for VBG direct soft trim.  This will be removed  */
 /*     later on once gather enough data.                                      */
 /*----------------------------------------------------------------------------*/
 /* A1.6  :                                                                    */
 /* 1)  Enable PMOS Trim.                                                      */
 /* 2)  Changed BCC/VT limits/search window/conditions.                        */
 /* 3)  Changed TW log for BCC with internal mult/divide ratio.                */
 /* 4)  Flash flow changed for look ahead qual.                                */
 /* 5)  Changed codes to disable fail site after all DRL BCC/VT & delta tests  */
 /*     are performed in order to have BCC1/BCC0 DRL data.  WEBS: VLCTSTD.4    */
 /* 6)  Added Efuse Chksum write to OTP.                                       */
 /* 7)  Modified codes to use Jazz STDMeas routines.                           */
 /*----------------------------------------------------------------------------*/
 /* A1.6.1 :                                                                   */
 /* 1)  Added stresses charz.                                                  */
 /*----------------------------------------------------------------------------*/
 /* A1.7  :                                                                    */
 /* 1)  Added and enable flash PBIST (Array+Ecc+Redundancy):                   */
 /* 1a) GL_DO_FL_PBIST enable Read/Prog/Ers tests.                             */
 /* 1b) GL_DO_VT/BCC_MAIN/OTP_USING_PBIST enable VT/BCC tests.                 */
 /* 1c) Redundancy enable via variable GL_DO_REDENA.                           */
 /* 2)  Added Artificial (fake) repair at OTP template pgm. Sampling fake rep  */
 /*     on every 10th GEC.                                                     */
 /* 3)  Added VHV CT Trim with 3% tolerance of target.                         */
 /* 4)  Updated BankErsWeak test to use TCR23 for external ATE control erase   */
 /*     condition of 10ms pulse, post-CT trim VHV minus 400mV.                 */
 /* 5)  Enable post-Weak Erase read test.                                      */
 /*----------------------------------------------------------------------------*/
 /* A1.7.1  :                                                                  */
 /* 1)  Modified stress conditions/limits:                                     */
 /* 1a) TUNOXVT1 BCC Delta 10uA (was 5ua).                                     */
 /* 1b) ONOVT0 stress 400ms, BCC Delta 2ua (was 200ms, 4ua).                   */
 /* 1c) CSFGVT0 BCC Delta 2ua (was 4ua).                                       */
 /* 1d) EGFG3VT0 BCC Delta 14ua (was 25ua).                                    */
 /* 1e) EGFG4VT0 BCC Delta 5ua (was 20ua).                                     */
 /* 1f) PGMFFVT1 BCC Delta 2ua (was 5ua).                                      */
 /* 1g) FGWLVT1 BCC Delta 2ua (was 8ua).                                       */
 /* 1h) RDDISTBVT0 BCC Delta 5ua (was 25ua).                                   */
 /* 1i) PUNTHRUVT1 stress 5ms, BCC Delta 2ua (was 560us, 5ua).                 */
 /* 1j) REVTUNVT1 stress 500ms, BCC Delta 2ua (was 286ms, 5ua).                */
 /* 1k) Temp bypassed all tests related to EGFG2 and EGFG5 in f021_flashflow.p */
 /*     Will make permanent change in Jazz config.                             */
 /*----------------------------------------------------------------------------*/
 /* A1.8  :                                                                    */
 /* 1)  WEBS VLCTSTD.9  -- Renamed TW on read ipmos pre ref array erase to     */
 /*     IPMOS_RD_Bx_NMO/NME_PRE (was IPMOS_EV_Bx_NMO/NME_PRE).                 */
 /* 2)  WEBS VLCTSTD.10 -- Updated BCC0 delta calc using post-pre.             */
 /* 3)  WEBS VLCTSTD.11 -- Updated ONO, and DRL,EGFG4,PGMFF BCC limits.        */
 /* 4)  WEBS VLCTSTD.12 -- Changed testnames and TW to VWL_PG_MN, VWL_PG_MX,   */
 /*     was VWL_RD_MN, VWL_RD_MX.  Files affected f021_cfginclude.p, bins.p,   */
 /*     global.h                                                               */
 /* 5)  WEBS VLCTSTD.13 -- Removed EGFG1/2 soft bins as making datalog only.   */
 /* 6)  WEBS VLCTSTD.15 -- Changed BCC delta calculation to convert value to   */
 /*     their respective IRatio prior comparing against limits.                */
 /* 7)  Added FOSC internal soft trim with no efuse blow for data collection.  */
 /*----------------------------------------------------------------------------*/
 /* A1.9  :                                                                    */
 /* 1)  Changed MP1 & MP3 flashflow for yield learning:                        */
 /* 1a) Moved Flash_Cycle9X to later in the flow, prior OTP Template pgm.      */
 /* 1b) Added Bin108 for Cycle9X Programming Fail.                             */
 /* 1c) Removed re-conditioning array between stresses.                        */
 /* 2)  Use previous post-stress BCC/VT value as pre-stress value in delta     */
 /*     calculation on stresses.                                               */
 /* 3)  Disable all MainVT and OtpVT.ENA[VT1] .                                */
 /* 4)  Added and enable masking data 1s in echk/ochk on BCC0 PBIST to recover */
 /*     postDRL BCC0 fails.                                                    */
 /* 5)  Added Flash_Cycle1X with BIN103 for pgm fail, BIN104 for ers fail.     */
 /*     ESDA is enable by default for this test and log to file.               */
 /* 6)  Modified stress tests to bring up TPADs in pre-defined order,          */
 /*     was sequentially in numeric ordering.                                  */
 /* 7)  Added TP1/TP2 Leakage Delta for datalog only.                          */
 /*----------------------------------------------------------------------------*/
 /* A1.10 :                                                                    */
 /* 1)  Changed BCC TUNOX delta limit to +/-20uA, was +/-10uA.                 */
 /* 2)  Modified VHV_ER_CT_Trim_func and RAM_Upload_VHV_CT_TrimVal to change   */
 /*     ER Start/Stop in OTP template for SM reg.                              */
 /* 3)  Corrected PgmOTP_func to remove shell reload.                          */
 /*----------------------------------------------------------------------------*/
 /* A2.0 :                                                                     */
 /* 1)  Making changes for TV2.                                                */
 /*----------------------------------------------------------------------------*/
 /* A2.3.1 - IPMOS trim charz (using PMOS, NMOS RD, NMOS EVFY).                */
 /* A2.3.2 - disable IPMOS trim charz, i.e. baseline IPMOS trim.               */
 /* 1)  Make flash flow to be same as TV1 A14.                                 */
 /* 2)  Changed VHV_PVFY_TARGET to 3.4V for TV2.                               */
 /* 3)  Changed DRL BCC limits to:                                             */
 /*            MP2 BCC1: -3ua,5ua (was +/-16ua)                                */
 /*                BCC0: -5ua,5ua (was +/-8ua)                                 */
 /*            MP3 BCC1: -16ua,5ua (was +/-16ua)                               */
 /*                BCC0: -10ua,10ua (was +/-8ua)                               */
 /* 4)  WEBS: VLCTSTD.24 -- corrected VHV ESTART CT.                           */
 /* 5)  WEBS: VLCTSTD.25 -- corrected TCR97 current clamp on TP2.              */
 /*----------------------------------------------------------------------------*/
 /* A2.3.3.x :                                                                 */
 /* 1)  Updated fake repair solutions on bank1 to fix chkbd pgm fails.         */
 /*----------------------------------------------------------------------------*/
 /* A2.4 :                                                                     */
 /* 1)  WEBS: VLCTSTD.26 -- corrected logic bug in VHV trim that caused storing*/
 /*     wrong trim solution.                                                   */
 /* 2)  Updated VHV, BG, Iref trim algo for TTR.                               */
 /* 3)  Updated Pump/IPMOS trim to single pass efuse blow.                     */
 /* 4)  Using default PBIST TNUM for BCC and read tests.                       */
 /* 5)  New shell OTP checksum.                                                */
 /*----------------------------------------------------------------------------*/
 /*----------------------------------------------------------------------------*/
 /* A06 :                                                                      */
 /* 1)  psk: 022411                                                            */
 /*     Changing PMOS trim method to use NMOS Read current instead of PMOS     */
 /*----------------------------------------------------------------------------*/
 /* A2.5 :                                                                     */
 /*           -Updated following for qual:                                     */
 /*           -CGEG stress lkg.                                                */
 /*           -New PVFY target 3.6v (was 3.4v), IrefPV 3.10:1 ratio internal.  */
 /*           -RevG blow efuse 22 in all banks, default is false.              */
 /*           -Quadrant based BCC/VT for DRL.                                  */
 /*           -BCC0/BCC1 Delta-Delta at MP2/MP3 to 2ua.                        */
 /*           -N40C DRL/DG limits.                                             */
 /*           -NMOS/PMOS current meas at Vmin and internally supply VCG.       */
 /*           -BCC1Min limits. 25 for non-emulation, 23 for emulation.         */
 /*           -Other limits changes from test specs.                           */
 /*----------------------------------------------------------------------------*/
 /****************************************************************************/

