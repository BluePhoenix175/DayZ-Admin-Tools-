DayZ-Admin-Tools
================
this project includes code that i did not wright but have permission to use
https://github.com/nomadichayward/DayZ_Dual_Admin_Debug_Monitor

Install Instructions
=====================
make these changes to your init.sqf

//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf"; //Compile regular functions
call compile preprocessFileLineNumbers "debug\compiles.sqf";

under "filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";
add this

playerstats = compile preprocessFileLineNumbers "debug\playerstats.sqf";
admintools = compile preprocessFileLineNumbers  "admintools\AdminToolsMain.sqf";

at the bottom of init.sqf add
[] execVM "admintools\AdminToolsMain.sqf"; 

find this code if (!isDedicated) then { // If mission is loaded by a player execute the player monitor
0 fadeSound 0;
0 cutText [(localize "STR_AUTHENTICATING"), "BLACK FADED", 60];
_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];

and change the playermonitor line to
_playerMonitor = [] execFSM "admintools\player_monitor.fsm";

un pack your dayz_code pbo 
in the system folder delete antihacks.sqf
copy playermonitor.fsm to your mission folder\admintools

open playermonitor.fsm find and delete
"[] execVM ""\z\addons\dayz_code\system\antihack.sqf"";" \n
save changes

delete both playermonitor files from dayz_code
repack and replace dayz_code.pbo

in admintools\AdminToolsMain.sqf and debug\playerstats.sqf
locate this code
 if ((getPlayerUID player) in ["#######","#######"]) then {
change ###### to your admins player id's

in debug\playerstats.sqf
locate this code and change "Server name here" to what ever you want
<t size='1.15' font='Bitstream' color='#5882FA'>Server name here</t><br/>",

once you have all of this done pack and replace your mission.pbo
in game press escape >>options>>controls>>custom controlls>> set hotkeys for #'s 19 and 20(19 = admin tools, 20 = debug

alt click on the map to teleport, then press w + space to move after teleport
if you execute a script and get stuck change skin to suvivor 

battleye
=========
either use the included scripts.txt
or compare mine with yours and make the required changes

FAQ
====


Q: I teleported and now i cant move

A: press w + space

Q: I executed "script name" and now im stuck, frozen, glitched..ect

A: change skin to survivor, if that does not work relog

Q: I want to modify my debug monitor can you help?

A: no, post here http://opendayz.net/index.php?threads/dayz-duel-admin-debug-monitor.8402/ for help

Q: can you add "script name" to the tools?

A: possibly.

Q:i do not have access to dayz_code.pbo how can i make the required changes?

A: you can not. i am working on a way to bypass this method of disabling the default anti teleport script

Q: i have other mods that also use compiles.sqf what lines does your mod need?

A: these tools require the following lines from compiles.sqf

under _config2 = configFile >> "CfgWeapons" >> "Loot";

add

hotkey_hitme = 0;

locate the block of code that looks like

if (_dikCode in actionKeys "PushToTalk" and (time - dayz_lastCheckBit > 10)) then { dayz_lastCheckBit = time; [player,50,true,(getPosATL player)] spawn player_alertZombies; };

add the following code to that block

if (_dikCode in actionKeys "User20" and hotkey_hitme == 0 and (time - dayz_lastCheckBit > 5)) then { dayz_lastCheckBit = time; hotkey_hitme = 1; _nill = [] execVM "debug\playerstats.sqf"; }; if (_dikCode in actionKeys "User20" and hotkey_hitme == 1 and (time - dayz_lastCheckBit > 5)) then { dayz_lastCheckBit = time; hintSilent ""; hotkey_hitme = 0; }; if (_dikCode in actionKeys "User19" and hotkey_tools == 0 and (time - dayz_lastCheckBit > 5)) then { dayz_lastCheckBit = time; hotkey_tools = 1; _nill = [] execVM "admintools\toolexec.sqf"; }; if (_dikCode in actionKeys "User19" and hotkey_tools == 1 and (time - dayz_lastCheckBit > 5)) then { dayz_lastCheckBit = time; hintSilent ""; hotkey_tools = 0; };
