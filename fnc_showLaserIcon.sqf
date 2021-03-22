/*
 * Author: Raynor
 * Check if conditions are met to arm laser designator
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can arm <BOOL>
 *
 * Example:
 * [] call raynor_anpeq25_fnc_laserCanArm
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_show"];

if (_show) then {
    if(isNil QGVAR(showingIcon)) then {
        "raynor_anpeq25_iconDisplay" cutRsc ["raynor_anpeq25_iconDisplay","PLAIN",-1,false];
        GVAR(showingIcon) = true;
    };
} else {
    if(!isNil QGVAR(showingIcon)) then {
        "raynor_anpeq25_iconDisplay" cutRsc ["RscTitleDisplayEmpty","PLAIN",-1,false];
        GVAR(showingIcon) = nil;
    };
};
