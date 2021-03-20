#include "script_component.hpp"
#include "defines.hpp"

#define IDD 78410
#define INFINITE 1e+1000
#define IDC_ICON 601

class RscTitles
{
    class raynor_anpeq25_iconDisplay
    {
        idd = IDD;
        duration = INFINITE;
        movingEnable = 1;
        fadeIn = 0;
        fadeOut = 0;
        name = "raynor_anpeq25_iconDisplay";
        onLoad = "uiNamespace setVariable['raynor_anpeq25_iconDisplay',_this select 0]";
        onUnload = "uiNamespace setVariable['raynor_anpeq25_iconDisplay',displayNull]";
        onDestroy =  "uiNamespace setVariable['raynor_anpeq25_iconDisplay',displayNull]";
        
        class controls
        {
            class icon: RscPicture
            {
                idc = IDC_ICON;
                style = "0x30 + 0x800";
                sizeEx = "0.038*SafezoneH";
                colorText[] = {0.706,0.0745,0.0196,1};
                shadow = 0;
                font = "EtelkaMonospacePro";
                text = "\A3\ui_f\data\igui\rscingameui\rscoptics\laser_designator_iconLaserOn.paa";
                
                
                #define ICON_W 3.5 * (0.01875 * SafezoneH)
                #define ICON_H 1.5 * (0.025 * SafezoneH)
                #define ICON_X SafezoneX + (SafezoneW * 0.5) - ((ICON_W) / 2)
                #define ICON_Y SafezoneY + (SafezoneH * 0.2)
                //x = "31.1 * (0.01875 * SafezoneH)";
                //y = "12.85 * (0.025 * SafezoneH)";
                x = ICON_X;
                y = ICON_Y;
                w = ICON_W;
                h = ICON_H;
            };
        };
    };
};
