class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class RAYNOR_ANPEQ25 {
                    displayName = "AN/PEQ-25 Laser Designator";
                    condition = QUOTE([] call FUNC(aceInteractCondition));
                    class DesignatorArm {
                        displayName = "Arm Designator";
                        statement = QUOTE([true] call FUNC(aceInteractStatement));
                    };
                    class DesignatorDisarm {
                        displayName = "Disarm Designator";
                        statement = QUOTE([false] call FUNC(aceInteractStatement));
                    };
                };
            };
        };
    };
};
