#include "script_component.hpp"

if (vehicle player != player) exitWith {
    LOG("Player in vehicle");
    false
};

if (count weaponsItems player == 0) exitWith {
    LOG("Player has no weapons");
    false
};

if(!(FUNC(aceInteractCondition))) exitWith {
    LOG("Laser not mounted");
    false
};

// if no designator batteries, can't fire

true
