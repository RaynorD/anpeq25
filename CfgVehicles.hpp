class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class raynor_anpeq25_arm {
                    displayName = "Arm AN/PEQ-25 Designator";
                    condition = QUOTE([true] call FUNC(aceInteractCondition));
                    statement = QUOTE([true] call FUNC(aceInteractStatement));
                    icon = "x\raynor\addons\anpeq25\ui\anpeq25_arm.paa";
                    showDisabled = 0;
                };
                class raynor_anpeq25_disarm {
                    displayName = "Disarm AN/PEQ-25 Designator";
                    condition = QUOTE([false] call FUNC(aceInteractCondition));
                    statement = QUOTE([false] call FUNC(aceInteractStatement));
                    icon = "x\raynor\addons\anpeq25\ui\anpeq25_disarm.paa";
                    showDisabled = 0;
                };
            };
        };
    };
};


//statement = "[_player,  true] call ace_hearing_fnc_putInEarPlugs";
