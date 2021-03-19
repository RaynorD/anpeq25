#include "script_component.hpp"

#ifdef DEBUG_MODE_FULL
    deleteVehicle GVAR(testObj);
    GVAR(testObj) = nil;
#endif

deleteVehicle GVAR(laser);
GVAR(laser) = nil;
