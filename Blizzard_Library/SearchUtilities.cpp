// *************************************************************************************
//  Module      : SearchUtilities.cpp
//  Description : Search test method support functions
//
//  Copyright (C) LTX-Credence Corporation 2007-2010.  All rights reserved.
// *************************************************************************************

#include "SearchUtilities.h"

using namespace std;

namespace LTXC
{

    TMResultM ExecuteSearchPatterns(StringS TestPatterns, PinML TestPins,
                                     BoolS DisablePatternDatalog, BoolS IgnorePatternFails)
    {
        TMResultM pattern_result(TM_FAIL);

        PatternSetup pattern_setup = RunTime.GetActivePatternSetup();
        if (pattern_setup.Valid()) {
            pattern_setup.SetActivePins(TestPins);
            pattern_result = DIGITAL.TestPattern(TestPatterns, !DisablePatternDatalog, TM_PASS);
            if (!DisablePatternDatalog)
                DLOG.Functional(TestPins, pattern_result);

            if (!IgnorePatternFails)
                return pattern_result;
            else
                return TMResultM(TM_PASS);
        }
        return pattern_result;
    }

    BoolM SearchStepPatterns(StringS TestPatterns)
    {
        TMResultM pattern_result(DIGITAL.TestPattern(TestPatterns));
        return pattern_result.Equal(TM_PASS);
    }

} // namespace LTXC
