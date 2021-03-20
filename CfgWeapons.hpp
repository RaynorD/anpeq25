
class CfgWeapons
{
    class acc_pointer_ir;
    class raynor_acc_pointer_anpeq25: acc_pointer_ir
    {
        Author = "Raynor";
        _generalMacro = "raynor_acc_pointer_anpeq25";
        displayName = "AN/PEQ-25 Laser Designator";
        picture = "\x\raynor\addons\anpeq25\ui\anpeq25.paa";
        scope = 2;
        descriptionShort = "Weapon Mounted Laser Designator";
        
        MRT_switchItemHintText = "IR Laser/Designator";
        MRT_SwitchItemNextClass = "acc_pointer_IR";
        MRT_SwitchItemPrevClass = "acc_pointer_IR";
    };
};

class SlotInfo;
class PointerSlot: SlotInfo {
    compatibleItems[] += {
        "raynor_acc_pointer_anpeq25"
    };
};

class asdg_SlotInfo;
class asdg_FrontSideRail: asdg_SlotInfo {
    class compatibleItems {
        raynor_acc_pointer_anpeq25 = 1;
    };
};

class PointerSlot_Rail: PointerSlot {
    class compatibleItems {
        raynor_acc_pointer_anpeq25 = 1;
    };
};
