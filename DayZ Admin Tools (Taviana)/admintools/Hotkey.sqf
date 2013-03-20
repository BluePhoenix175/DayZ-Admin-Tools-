KeyCheck = {
    switch (_this) do {       
                //Key F5
        case 63: {
            nul = [] execVM "debug\playerstats.sqf";
        };       
                //Key F6
        case 64: {
            nul = [] execVM "admintools\AdminToolsMain.sqf";
        };
    };
};  
EnableHotkey = 1;
if (isnil ("ActivateHotKey")) then {
    ActivateHotKey = 0;
};
if (ActivateHotKey == 1) then {
ActivateHotKey = 0;
} else {
ActivateHotKey = 1;
};
while {EnableHotkey == 1} do {
	if (ActivateHotKey == 0) then {
		waituntil {!isnull (finddisplay 46)};
		(findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call KeyCheck;false;"];
		ActivateHotKey = 1;
	} else {
		(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
		ActivateHotKey = 0;
	};
};