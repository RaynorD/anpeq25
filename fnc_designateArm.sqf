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

//P:\a3\ui_f\data\IGUI\RscIngameUI\RscOptics\laser_designator_iconLaserOn.paa
//P:\a3\ui_f_curator\Data\CfgCurator\laser_ca.paa
//P:\a3\ui_f\data\IGUI\RscCustomInfo\Sensors\Targets\LaserTarget_ca.paa
//P:\a3\ui_f\data\IGUI\Cfg\WeaponCursors\laserdesignator_gs.paa


params [["_armedArg",nil],["_manual",false]];

_armed = nil;

TRACE_1("%1",_armed);

if (isNil "_armedArg") then {
    _armed = !(GVAR(armed));
} else {
    _armed = _armedArg;
};

//systemChat format ["Trying to arm: %1",_armed];

if(_armed) then {
    if ([true] call FUNC(laserCanArm)) then {
        GVAR(firing) = false;
        GVAR(laserType) = switch (side player) do {
            case (west): {
                "LaserTargetW"
            };
            case (east): {
                "LaserTargetE"
            };
            default {
                "LaserTargetC"
            };
        };
        
        player action ["IRLaserOff", player];
        
        //systemChat "AN/PEQ-25 designator armed";
        if (!isNil {GVAR(displayEHDown)}) then {
            (findDisplay 46) displayRemoveEventHandler ["keyDown",GVAR(displayEHDown)];
        };
        if (!isNil {GVAR(displayEHUp)}) then {
            (findDisplay 46) displayRemoveEventHandler ["keyUp",GVAR(displayEHUp)];
        };
        if (!isNil {GVAR(handle_armPFH)}) then {
            [GVAR(handle_armPFH)] call CBA_fnc_removePerFrameHandler;
        };
        
        // KeyDown: start designating
        GVAR(displayEHDown) = (findDisplay 46) displayAddEventHandler ["keyDown",{
            params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
            if(_key in (actionKeys "headlights")) then {
                if(call FUNC(laserCanFire)) then {
                    if (!GVAR(firing)) then {
                        //systemChat "Starting designate";
                        GVAR(firing) = true;
                        [true] call FUNC(designateStart);
                    };
                };
                true
            };
        }];
        
        // KeyDown: stop designating
        GVAR(displayEHUp) = (findDisplay 46) displayAddEventHandler ["keyUp",{
            params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
            if(_key in (actionKeys "headlights")) then {
                //systemChat "Stopping designate";
                [false] call FUNC(designateStart);
                GVAR(firing) = false;
                true
            };
        }];
        
        // check if conditions remain valid to stay armed
        GVAR(handle_armPFH) = [{
            params ["_args","_handle"];
            if(!(call FUNC(laserCanArm))) then {
                LOG("Disarming");
                [_handle] call CBA_fnc_removePerFrameHandler;
                [false] call FUNC(designateArm);
            };
        }, 0.25, []] call CBA_fnc_addPerFrameHandler;
        
        "raynor_anpeq25_iconDisplay" cutFadeOut 0;
        GVAR(armed) = true;
        
        if(_manual) then {
            playSound "WeaponRestedOff";
            if (!isNil "ace_common") then {
                ["AN/PEQ-25 Designator Armed" ,"\x\raynor\addons\anpeq25\ui\anpeq25_arm.paa"] call ace_common_fnc_displayTextPicture
            };
        };
        
    } else {
        LOG("The AN/PEQ-25 could not be armed");
        systemChat "The AN/PEQ-25 could not be armed";
        GVAR(armed) = false;
    };
} else {
    //systemChat "AN/PEQ-25 designator disarmed";
    if (!isNil {GVAR(displayEHDown)}) then {
        (findDisplay 46) displayRemoveEventHandler ["keyDown",GVAR(displayEHDown)];
    };
    if (!isNil {GVAR(displayEHUp)}) then {
        (findDisplay 46) displayRemoveEventHandler ["keyUp",GVAR(displayEHUp)];
    };
    if (!isNil {GVAR(handle_armPFH)}) then {
        [GVAR(handle_armPFH)] call CBA_fnc_removePerFrameHandler;
    };
    [false] call FUNC(designateStart);
    GVAR(firing) = false;
    GVAR(armed) = false;
    if(_manual) then {
        playSound "WeaponRestedOff";
        if (!isNil "ace_common") then {
            ["AN/PEQ-25 Designator Disarmed" ,"\x\raynor\addons\anpeq25\ui\anpeq25_disarm.paa"] call ace_common_fnc_displayTextPicture
        };
    };
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
