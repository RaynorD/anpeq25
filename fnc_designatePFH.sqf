#include "script_component.hpp"

#ifdef DEBUG_MODE_FULL
    if (isNil {GVAR(testObj2)}) then {
        GVAR(testObj) = "Sign_Sphere100cm_F" createVehicle [0,0,0];
    };
#endif

GVAR(begPosASL) = ATLtoASL positionCameraToWorld [0,0,0];
// attempt to use selection position, but there isn't one on the muzzle
//GVAR(begPosASL) = ATLtoASL (player modelToWorld (player selectionPosition ["proxy:\a3\characters_f\proxies\weapon.001","Memory"]));

GVAR(endPosASL) = GVAR(begPosASL) vectorAdd ((player weaponDirection currentWeapon player) vectorMultiply 500);

private _intersects = lineIntersectsSurfaces [GVAR(begPosASL), GVAR(endPosASL), player, objNull, true, 1, "PHYSX"];

hint str _intersects;

if (count _intersects == 0) exitWith {
    deleteVehicle GVAR(laser);
    GVAR(laser) = nil;
};

if (
        ((animationState player) find "stp" >= 0 &&
        (animationState player) find "ras" >= 0 &&
        (animationState player) find "_a" < 0)
        ||
        (animationState player) find "pronebipod" >= 0
) then {
    //LaserTargetE
    if (isNil {GVAR(laser)}) then {
        GVAR(laser) = "LaserTargetE" createVehicle (_intersects#0#0);
    };
    #ifdef DEBUG_MODE_FULL
        GVAR(testObj) setPosASL (_intersects#0#0);
    #endif
    GVAR(laser) setPosASL (_intersects#0#0);
} else {
    deleteVehicle GVAR(laser);
    GVAR(laser) = nil;
};
