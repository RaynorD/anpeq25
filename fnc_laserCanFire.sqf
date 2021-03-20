#include "script_component.hpp"

alive player && call FUNC(laserCanArm) && !(player getVariable ["ACE_isUnconscious",false]) && vehicle player == player

/*
if(!call FUNC(laserCanArm)) exitWith {
    false
};

if(!alive player) exitWith {
    LOG("Can't fire: Player dead");
    systemChat ("Can't fire: Player dead");
    false
};

if(player getVariable ["ACE_isUnconscious",false]) exitWith {
    LOG("Can't fire: Player is unconscious");
    systemChat ("Can't fire: Player is unconscious");
    false
};

if (vehicle player != player) exitWith {
    LOG("Can't fire: Player in vehicle");
    systemChat ("Can't fire: Player in vehicle");
    false
};

true
*/
