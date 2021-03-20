class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class raynor_anpeq25_arm {
                    displayName = "Arm AN/PEQ-25 Designator";
                    condition = QUOTE([true] call FUNC(aceInteractCondition));
                    statement = QUOTE([true] call FUNC(aceInteractStatement));
                    icon = "\A3\weapons_F\Data\UI\gear_accv_pointer_CA.paa";
                };
                class raynor_anpeq25_disarm {
                    displayName = "Disarm AN/PEQ-25 Designator";
                    condition = QUOTE([false] call FUNC(aceInteractCondition));
                    statement = QUOTE([false] call FUNC(aceInteractStatement));
                    icon = "\A3\weapons_F\Data\UI\gear_accv_pointer_CA.paa";
                };
            };
        };
    };
};
