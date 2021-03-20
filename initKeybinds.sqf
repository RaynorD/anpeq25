#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[
    "AN/PEQ-25 Weapon Attached Laser Designator",
    QGVAR(designateArm),
    ["Arm/Disarm Designator","Arms the designator, allowing it to fire when the laser button is held (Keybind: Common > Headlights On/Off)"],
    {[] call FUNC(designateArm)},
    "",
    [DIK_L, [false, false, true]]
] call CBA_fnc_addKeybind;
