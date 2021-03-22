/*
 * Author: Raynor
 * Start and stop designate
 *
 * Arguments:
 * 0: State <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call raynor_anpeq25_fnc_designateStart
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_start"];

if(_start) then { // starting
    GVAR(deltaTimeIR) = 0;
    GVAR(deltaTimeLaser) = 0;
    GVAR(IRLaserOn) = false;
    player action ["IRLaserOff", player];
    
    GVAR(handle_designatePFH) = [FUNC(designatePFH), 0, []] call CBA_fnc_addPerFrameHandler;
    
    GVAR(handle_designatePFHKill) = [{
        params ["_args","_handle"];
        if(!(call FUNC(laserCanFire))) then {
            LOG("Killing PFH");
            [_handle] call CBA_fnc_removePerFrameHandler;
            [false] call FUNC(designateStart);
        };
    }, 1, []] call CBA_fnc_addPerFrameHandler;
} else {  // ending
    if(DEBUG_MODE) then {
        deleteVehicle GVAR(testObj);
        GVAR(testObj) = nil;
    };
    
    deleteVehicle GVAR(laser);
    player action ["IRLaserOff", player];
    [false] call FUNC(showLaserIcon);
    
    [GVAR(handle_designatePFH)] call CBA_fnc_removePerFrameHandler;
    [GVAR(handle_designatePFHKill)] call CBA_fnc_removePerFrameHandler;
    
    GVAR(handle_designatePFH) = nil;
    GVAR(handle_designatePFHKill) = nil;
    GVAR(laser) = nil;
    GVAR(deltaTimeIR) = nil;
    GVAR(deltaTimeLaser) = nil;
    GVAR(IRLaserOn) = nil;
};
