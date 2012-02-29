#ifndef SEARCHUTILITIES_H
#define SEARCHUTILITIES_H

#include <Unison.h>

namespace LTXC
{
    // These support functions are provided to simplify creation of custom FunctionCall
    // objects for use with SearchTest.

    TMResultM ExecuteSearchPatterns( StringS TestPatterns, PinML TestPins, BoolS DisablePatternDatalog = false, BoolS IgnorePatternFails = false);
    BoolM     SearchStepPatterns( StringS TestPatterns);

} // namespace LTXC

#endif // SEARCHUTILITIES_H

