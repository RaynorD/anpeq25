/*
 * Author: Raynor
 * Check if correct item is mounted to use designator
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Has item <BOOL>
 *
 * Example:
 * [] call raynor_anpeq25_fnc_laserMounted
 *
 * Public: No
 */

#include "script_component.hpp"

POINTER_CLASSNAME in (player weaponAccessories (currentWeapon player))
