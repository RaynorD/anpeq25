/*
 * Author: Raynor
 * Per frame handler for active designator
 * Update lasertarget position and blink IR laser and UI element
 *
 * Arguments:
 * 0: Arm state <BOOL>
 * 1: Was manually triggered <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true,true] call raynor_anpeq25_fnc_designatePFH
 *
 * Public: No
 */

disableSerialization;

#include "script_component.hpp"

if (isNil {GVAR(testObj)} && DEBUG_MODE) then {
    GVAR(testObj) = "Sign_Sphere100cm_F" createVehicle [0,0,0];
};

private _ctrlIcon = (uiNamespace getVariable "raynor_anpeq25_iconDisplay") displayCtrl 601;

// emulate player only activating pressure switch when aiming the rifle
//  kinda pointless now that the keybind is momentary, but meh
private _pressure = (((animationState player) find "stp" >= 0 &&
                    (animationState player) find "ras" >= 0 &&
                    (animationState player) find "_a" < 0)
                    ||
                    (animationState player) find "pronebipod" >= 0);

[_pressure] call FUNC(showLaserIcon);

if(_pressure) then {
    // fire/update IR laser
    GVAR(deltaTimeIR) = GVAR(deltaTimeIR) + diag_deltaTime;
    //systemChat str GVAR(deltaTime);
    if(GVAR(deltaTimeIR) > IR_FLASH_DELAY) then {
        if(GVAR(IRLaserOn)) then {
            GVAR(IRLaserOn) = false;
            player action ["IRLaserOff", player];
            _ctrlIcon ctrlShow false;
        } else {
            GVAR(IRLaserOn) = true;
            player action ["IRLaserOn", player];
            _ctrlIcon ctrlShow true;
        };
        
        /*
        if(!GVAR(laserCanArm) || !GVAR(laserCanFire)) exitWith {
            [] call FUNC(designateEnd);
            
            if (!GVAR(laserCanArm)) then {
                [false] call FUNC(designateArm);
            };
        };
        */
        
        GVAR(deltaTimeIR) = 0;
    };
    
    // fire/update designator
    GVAR(deltaTimeLaser) = GVAR(deltaTimeLaser) + diag_deltaTime;
    //systemChat str GVAR(deltaTime);
    if(GVAR(deltaTimeLaser) > LASER_REFRESH_DELAY) then {
        
        //private _begPosASL = ATLtoASL positionCameraToWorld GVAR(cameraOffset);
        private _begPosASL = ATLtoASL (player modelToWorld (player selectionPosition "rightshoulder"));
        private _endPosASL = _begPosASL vectorAdd ((player weaponDirection currentWeapon player) vectorMultiply 500);
        private _intersects = (lineIntersectsSurfaces [_begPosASL, _endPosASL, player, objNull, true, 1, "PHYSX"]);
        
        if (count _intersects == 0) exitWith {
            if(DEBUG_MODE) then {
                deleteVehicle GVAR(testObj);
                GVAR(testObj) = nil;
            };
            deleteVehicle GVAR(laser);
            GVAR(laser) = nil;
        };
        
        private _intersectPos = _intersects#0#0;

        //LaserTargetE
        if (isNil {GVAR(laser)}) then {
            GVAR(laser) = GVAR(laserType) createVehicle _intersectPos;
        };
        if(DEBUG_MODE) then {
            GVAR(testObj) setPosASL _intersectPos;
        };
        GVAR(laser) setPosASL _intersectPos;
        
        GVAR(deltaTimeLaser) = 0;
    };
} else {
    // turn off IR laser
    GVAR(deltaTimeIR) = 0;
    player action ["IRLaserOff", player];
    
    // turn off designator
    GVAR(deltaTimeLaser) = 0;
    deleteVehicle GVAR(laser);
    GVAR(laser) = nil;
    
    if(DEBUG_MODE) then {
        deleteVehicle GVAR(testObj);
        GVAR(testObj) = nil;
    };
};
