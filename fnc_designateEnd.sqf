#include "script_component.hpp"

#ifdef DEBUG_MODE_FULL
    deleteVehicle GVAR(testObj);
    GVAR(testObj) = nil;
#endif

[GVAR(handle_designatePFH)] call CBA_fnc_removePerFrameHandler;
deleteVehicle GVAR(laser);
GVAR(laser) = nil;
