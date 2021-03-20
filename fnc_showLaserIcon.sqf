#include "script_component.hpp"

params ["_show"];

if (_show) then {
    if(isNil QGVAR(showingIcon)) then {
        "raynor_anpeq25_iconDisplay" cutRsc ["raynor_anpeq25_iconDisplay","PLAIN",-1,false];
        GVAR(showingIcon) = true;
    };
} else {
    if(!isNil QGVAR(showingIcon)) then {
        "raynor_anpeq25_iconDisplay" cutRsc ["RscTitleDisplayEmpty","PLAIN",-1,false];
        GVAR(showingIcon) = nil;
    };
};
