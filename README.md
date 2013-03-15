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
add
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
i do not know all of the changes that need to be made to scripts.txt yet. 
when i do i will include copys of the modified scripts.txt in the github
for now i suggest disabling battleeye
