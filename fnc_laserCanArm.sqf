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

(alive player) && (count weaponsItems player > 0) && (call FUNC(aceInteractCondition)) && ("Laserbatteries" in magazines player)

/*
if(!alive player) exitWith {
    LOG("Can't Arm: Player dead");
    systemChat ("Can't Arm: Player dead");
    false
};

if (count weaponsItems player == 0) exitWith {
    LOG("Can't Arm: Player has no weapons");
    systemChat("Can't Arm: Player has no weapons");
    false
};

if(!(call FUNC(aceInteractCondition))) exitWith {
    LOG("Can't Arm: Laser not mounted");
    systemChat("Can't Arm: Laser not mounted");
    false
};

if (!("Laserbatteries" in magazines player)) exitWith {
    LOG("Can't Arm: No designator batteries");
    systemChat("Can't Arm: No designator batteries");
    false
};

true
*/
