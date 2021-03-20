#include "script_component.hpp"

/*
    designateArm
        designateStart
            designatePressure?

*/

class CfgPatches {
    class ADDON {
        // Meta information for editor
        name = "AN/PEQ-25 Weapon Mounted Laser Designator";
        author = "Raynor";
        url = "https://github.com/RaynorD/anpeq25";
        
        // Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game.
        requiredVersion = 1.98;
        // Required addons, used for setting load order.
        // When any of the addons is missing, pop-up warning will appear when launching the game.
        requiredAddons[] = {"A3_Weapons_F_LongRangeRifles_DMR_01","A3_Weapons_F_LongRangeRifles_EBR","A3_Weapons_F_Machineguns_M200","A3_Weapons_F_Machineguns_Zafir","A3_Weapons_F_Rifles_Khaybar","A3_Weapons_F_Rifles_MK20","A3_Weapons_F_Rifles_MX","A3_Weapons_F_Rifles_MX_Black","A3_Weapons_F_Rifles_TRG20","A3_Weapons_F_SMGs_SMG_02","A3_Data_F_Curator","A3_Weapons_F_Mark_LongRangeRifles_DMR_01","A3_Weapons_F_Mark_LongRangeRifles_DMR_02","A3_Weapons_F_Mark_LongRangeRifles_DMR_03","A3_Weapons_F_Mark_LongRangeRifles_DMR_04","A3_Weapons_F_Mark_LongRangeRifles_DMR_05","A3_Weapons_F_Mark_LongRangeRifles_EBR","A3_Weapons_F_Mark_Machineguns_M200","A3_Weapons_F_Mark_Machineguns_MMG_01","A3_Weapons_F_Mark_Machineguns_MMG_02","A3_Weapons_F_Mark_Rifles_MX","A3_Weapons_F_Mod_SMGs_SMG_03","A3_Weapons_F_Exp","A3_Weapons_F_Exp_Machineguns_LMG_03","A3_Weapons_F_Exp_Rifles_AK12","A3_Weapons_F_Exp_Rifles_ARX","A3_Weapons_F_Exp_Rifles_CTAR","A3_Weapons_F_Exp_Rifles_CTARS","A3_Weapons_F_Exp_Rifles_SPAR_01","A3_Weapons_F_Exp_Rifles_SPAR_02","A3_Weapons_F_Exp_Rifles_SPAR_03","A3_Weapons_F_Exp_SMGs_SMG_05","A3_Weapons_F_Patrol","A3_Characters_F_Tacops","A3_Weapons_F_Enoch","A3_Weapons_F_Enoch_Machineguns_M200","A3_Weapons_F_Enoch_Rifles_AK12","A3_Weapons_F_Enoch_Rifles_MSBS","CBA_main"};
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content (units and groups) unlocking.
        units[] = {};
        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {"raynor_acc_pointer_anpeq25"};
    };
};

#include "CfgEventhandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "dialogs.hpp"
