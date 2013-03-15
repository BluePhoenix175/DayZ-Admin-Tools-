startLoadingScreen ["", "DayZ_loadingScreen"];
//cutText ["","BLACK OUT"];
enableSaving [false, false];

dayZ_instance = 2;
hiveInUse = true;
initialized = false;
dayz_previousID = 0;

player setVariable ["BIS_noCoreConversations", true];
enableRadio false; // Disable global chat radio messages

//Load in compiled functions
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
//call compile preprocessFileLineNumbers "debug\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
call compile preprocessFileLineNumbers "debug\compiles.sqf";				//Compile regular functions
progressLoadingScreen 1.0;
/*
player_build = compile preprocessFileLineNumbers "tweaks\player_build.sqf";
player_disarmBomb = compile preprocessFileLineNumbers "tweaks\player_disarmBomb.sqf";
player_recipeBook = compile preprocessFileLineNumbers "tweaks\player_recipeBook.sqf";
player_remove = compile preprocessFileLineNumbers "tweaks\player_remove.sqf";
fnc_usec_selfActions = compile preprocessFileLineNumbers "fixes\fn_selfActions.sqf";
remProc = true;
hasBuildItem = false;

CODEINPUT = [];
keyCode = [];
keyValid = false;
antiWall = compile preprocessFileLineNumbers "tweaks\antiWall.sqf";
anti_discWall = compile preprocessFileLineNumbers "tweaks\anti_discWall.sqf";
player_chopWood = compile preprocessFileLineNumbers "tweaks\player_chopWood.sqf";
*/
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";
playerstats = compile preprocessFileLineNumbers "debug\playerstats.sqf";
admintools = compile preprocessFileLineNumbers "admintools\AdminToolsMain.sqf";
if (isServer) then { 		// If mission is loaded by server execute the server monitor
	hiveInUse = true;
	_serverMonitor = [] execVM "\z\addons\dayz_server\system\server_monitor.sqf";
};
/*
	_null = [] execVM "tweaks\player_addActions.sqf";
	_null = [] execVM "tweaks\take_itemFix.sqf";
	_null = [] execVM "tweaks\player_bomb.sqf";
//Optional:
	_null = [] execVM "tweaks\initWall.sqf"; // (must be used with antiWall and anti_discWall)
	_null = [] execVM "tweaks\antiHeli.sqf";
	_null = [] execVM "tweaks\take_itemFix.sqf";
//Drag the folder “tweaks” from the example mission file into your mission file.
//In the “tweaks” folder youll see TWO player_remove.sqf’s  if you do not care to implement my server file method use the one that is for 1.7.4.4.  This one is NOT tested however so use at your own risk.
//If all else fails please reference from the dayz files in:
//“z\dayz_code\actions\remove.sqf” as the removal function there was implemented in my custom removal function.
*/

if (!isDedicated) then {  	// If mission is loaded by a player execute the player monitor
	0 fadeSound 0;
	0 cutText [(localize "STR_AUTHENTICATING"), "BLACK FADED", 60];
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = [] execFSM "fixes\player_monitor.fsm";

};
[] execVM "R3F_ARTY_AND_LOG\init.sqf";
[] execVM "DamiMods\refuel\fuelactions.sqf";
[] execVM "DamiMods\flip\flipaction.sqf";
[] execVM "admintools\AdminToolsMain.sqf";