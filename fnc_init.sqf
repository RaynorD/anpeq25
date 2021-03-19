//configfile >> "RscInGameUI" >> "RscUnitInfoSoldier"

// Obsolete with CBA keys

#include "script_component.hpp"

if (!isNil {GVAR(displayEH)}) then {
    (findDisplay 46) displayRemoveEventHandler ["keyDown",GVAR(displayEH)];
};

GVAR(displayEH) = (findDisplay 46) displayAddEventHandler ["keyDown",{
    params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
    if(_key in (actionKeys "headlights")) then {
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
    };
}];
