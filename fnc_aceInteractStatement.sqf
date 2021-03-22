/*
 * Author: Raynor
 * Called when player selects arm/disarm ace interact
 *
 * Arguments:
 * 0: Arm/Disarm <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call raynor_anpeq25_fnc_aceInteractStatement
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_arm"];

[_arm,true] call FUNC(designateArm);
