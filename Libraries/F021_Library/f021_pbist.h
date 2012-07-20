
// *****************************************************************************
//                                                                              
//  A01 : Initial version of F021 Pbist DMDx Code.          cjp   10jul12       
//                                                                              
// *****************************************************************************

#ifndef F021_PBIST_H
#define F021_PBIST_H

extern IntS PBIST_FRAME_SIZE;

TMResultM PbistFailLogout();
void      ProcessFailData(UnsignedM1D captureArr);

#endif
