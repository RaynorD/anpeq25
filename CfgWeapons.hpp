
class CfgWeapons
{
    class acc_pointer_ir;
    class raynor_acc_pointer_anpeq25: acc_pointer_ir
    {
        Author = "Raynor";
        _generalMacro = "raynor_acc_pointer_anpeq25";
        displayName = "AN/PEQ-25 Weapon Attached Laser Designator";
        scope = 2;
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
