#include "script_component.hpp"
/*
if disarmed,
    arm
        when armed, hold L to designate
        when designating, laser flashes and laser target is created
            when on terrain, laser target moves to aim point
            when off terrain, laser target is deleted/moved away?

if armed,
    disarm
        return to normal IR laser operation
*/

params ["_armed"];

if (isNil "_armed") then {
    if(isNil {GVAR(armed)}) then {
        GVAR(armed) = true;
    } else {
        GVAR(armed) = !(GVAR(armed));
    };
} else {
    GVAR(armed) = _armed;
};

if(GVAR(armed)) then {
    systemChat "AN/PEQ-25 designator armed";
    if (!isNil {GVAR(displayEH)}) then {
        (findDisplay 46) displayRemoveEventHandler ["keyDown",GVAR(displayEH)];
    };
    
    // KeyDown: start designating
    GVAR(displayEH) = (findDisplay 46) displayAddEventHandler ["keyDown",{
        params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
        if(_key in (actionKeys "headlights")) then {
            if(FUNC(laserCanFire)) then {
                [] call FUNC(designateStart);
            };
            true
        };
    }];
    
    // KeyDown: stop designating
    GVAR(displayEH) = (findDisplay 46) displayAddEventHandler ["keyUp",{
        params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
        if(_key in (actionKeys "headlights")) then {
            [] call FUNC(designateEnd);
            true
        };
    }];
} else {
    systemChat "AN/PEQ-25 designator disarmed";
    if (!isNil {GVAR(displayEH)}) then {
        (findDisplay 46) displayRemoveEventHandler ["keyDown",GVAR(displayEH)];
    };
    [] call FUNC(designateEnd);
};


/*

[{
    if (player isIRLaserOn currentWeapon player) then {
        GVAR(PFHon) = [{
            params ["_args","_handle"];
            if(player isIRLaserOn currentWeapon player) then {
                call FUNC(pfh);
            } else {
                [_handle] call CBA_fnc_removePerFrameHandler;
                call FUNC(hide);
            };
        }, 0, []] call CBA_fnc_addPerFrameHandler;
    };
}, [], 0.1] call CBA_fnc_waitAndExecute;

*/
