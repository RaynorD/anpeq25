
/*
 * Author: Raynor
 * Checks if the matching ace interact menu should show
 *
 * Arguments:
 * 0: State <BOOL>
 *
 * Return Value:
 * Condition matches <BOOL>
 *
 * Example:
 * [true] call raynor_anpeq25_fnc_aceInteractCondition
 *
 * Public: No
 */

#include "script_component.hpp"

(call FUNC(laserMounted)) && (_this#0) isNotEqualTo GVAR(armed)
