#include "script_component.hpp"

GVAR(handle_designatePFH) = [{
    params ["_args","_handle"];
    call FUNC(pfh);
}, 0, []] call CBA_fnc_addPerFrameHandler;
