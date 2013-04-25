DayZ-Admin-Tools
================
This project includes code that I did not write, but have permission to use<br>
https://github.com/nomadichayward/dayz_dual_debug_monitor

Install Instructions (Chernarus)
--------------------------------
Make these changes to your init.sqf

(debug version only)(Skip if using No debug)<br>
under<br>
`"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";`<br>
add this<br>
`playerstats = compile preprocessFileLineNumbers "debug\playerstats.sqf";`<br>
(End Skip)

At the bottom of init.sqf add<br>
`[] execVM "admintools\Activate.sqf";`

Find this code
<pre>
if (!isDedicated) then { // If mission is loaded by a player execute the player monitor
	0 fadeSound 0;
	0 cutText [(localize "STR_AUTHENTICATING"), "BLACK FADED", 60];
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
</pre>
and change the playermonitor line to<br>
`_playerMonitor = [] execFSM "admintools\player_monitor.fsm";`


Locate this code in debug\playerstats.sqf(no debug version: Activate.sqf), and admintools\admintoolsmain.sqf
`if ((getPlayerUID player) in ["#######","#######"]) then {`<br>
change ###### to your admins player id's<br>
Profile>>"PlayerName">>Edit, look in the bottom left hand corner for "Player ID"<br>
that is the number that needs to be added to the code<br>

(skip if using No Debug version)<br>
in debug\playerstats.sqf<br>
locate this code and change "Server name here" to what ever you want<br>
`<t size='1.15' font='Bitstream' color='#5882FA'>Server name here</t><br/>",`<br>
(End Skip)

if you have Sarge AI skip this (thanks sarge)<br>
Adjust your server_cleanup.fsm file for "Killed a hacker" fix<br>
Depends which DayZ version you are running.

The line you are looking for is either:<br>
`"    if  (!(vehicle _x in _safety) && ((typeOf vehicle _x) != ""ParachuteWest"") ) then {" \n`

Change to / add as shown:<br>
`"    if  (!(vehicle _x in _safety) && ((typeOf vehicle _x) != ""ParachuteWest"") && (vehicle _x getVariable [""Sarge"",0] != 1) ) then {" \n`

Or the line looks like<br>
`if(vehicle _x != _x  && !(vehicle _x in _safety) && (typeOf vehicle _x) != ""ParachuteWest"") then {" \n`

Change that to<br>
`if(vehicle _x != _x && (vehicle _x getVariable [""Sarge"",0] != 1) && !(vehicle _x in _safety) && (typeOf vehicle _x) != `

once you have all of this done pack and replace your mission.pbo and dayz_server.pbo<br>
if your player ID has been added to the correct portions of code a option will be added to the scroll menu

Install Instructions (All other Maps)
-------------------------------------
Find this code in init.sqf
<pre>
if (!isDedicated) then {
	0 fadeSound 0;
	0 cutText [(localize "STR_AUTHENTICATING"), "BLACK FADED",60];
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
</pre>
and change the player monitor line to this<br>
```_playerMonitor = [] execFSM "admintools\player_monitor.fsm";```
	
at the bottom of init.sqf add this line<br>
```[] execVM "admintools\Activate.sqf";```
	
locate this code in debug\playerstats.sqf(no debug version: Activate.sqf), and admintools\admintoolsmain.sqf
```if ((getPlayerUID player) in ["########","########"]) then {```<br>
change ###### to your admins player id's
	
(skip if using No Debug version)<br>
in debug\playerstats.sqf<br>
locate this code and change "Server name here" to what ever you want<br>
```<t size='1.15' font='Bitstream' color='#5882FA'>Server name here</t><br/>",```<br>
(end skip)

if you have Sarge AI skip this (thanks sarge)<br>
Adjust your server_cleanup.fsm file for "Killed a hacker" fix<br>
Depends which DayZ version you are running.

The line you are looking for is either:<br>
`"    if  (!(vehicle _x in _safety) && ((typeOf vehicle _x) != ""ParachuteWest"") ) then {" \n`

Change to / add as shown:<br>
`"    if  (!(vehicle _x in _safety) && ((typeOf vehicle _x) != ""ParachuteWest"") && (vehicle _x getVariable [""Sarge"",0] != 1) ) then {" \n`

Or the line looks like<br>
`if(vehicle _x != _x  && !(vehicle _x in _safety) && (typeOf vehicle _x) != ""ParachuteWest"") then {" \n`

Change that to<br>
`if(vehicle _x != _x && (vehicle _x getVariable [""Sarge"",0] != 1) && !(vehicle _x in _saf`

once you have all of this done pack and replace your mission.pbo and dayz_server.pbo<br>
if your player ID has been added to the correct portions of code a option will be added to the scroll menu


BattlEye
--------
Provided by inkko<br>
These are all of the changes that need to be made<br>
Do NOT delete the line, only add the exception<br>
If you need an example please go here: http://opendayz.net/threads/dayz-admin-tools.8576/page-34#post-33299
<pre>
These are all the changes I made in my scripts.txt
Code:
----------------------------------------
script restriction !exception
----------------------------------------
//dayzesp.sqf is the only one I went line by line and made all the exact restrictions for
5 addGroupIcon !"dayzesp.sqf"
5 setMarkerPosLocal !"dayzesp.sqf"
5 onMapSingleClick !"dayzesp.sqf"
5 setPosASL2 !"dayzesp.sqf"
5 openMap !"dayzesp.sqf"
5 drawIcon !"dayzesp.sqf"

----------------------------------------

1 addPublicVariableEventHandler !"healp.sqf"
5 setHit !"healp.sqf"
1 setVariable !"healp.sqf"

-----------------------------------------

5 setVehicleAmmo !"looknrepair.sqf"
5 setDamage !"looknrepair.sqf"
5 setDammage !"looknrepair.sqf"

------------------------------------------

5 "zombieshield" !"zombieshield.sqf"

------------------------------------------

//covers all the weapon switches/backpack changes
5 addWeapon !"items.sqf"
5 addWeaponCargo !"items.sqf"
5 addMagazine !"items.sqf"
5 addMagazineCargo !"items.sqf"
5 addBackpack !"items.sqf"
5 addBackpackCargo !"items.sqf"

--------------------------------------------

1 allowDamage !"Godmode.sqf"
1 allowDammage !"Godmode.sqf"
5 setDammage !"Godmode.sqf"
5 setVehicleAmmo !"Godmode.sqf"
5 "God mode" !"Godmode.sqf"
5 GodMode !"Godmode.sqf"

---------------------------------------------

5 setDammage !"cargod.sqf"
1 setFuel !"cargod.sqf"
5 setVehicleAmmo !"cargod.sqf"
5 "God mode" !"cargod.sqf"
5 GodMode !"cargod.sqf"

---------------------------------------------

Example for some of the lines...

Script Restriction | Exception

5 setMarkerPosLocal !"\"setMarkerPosLocal\"," !"dayzesp.sqf"," !"rsetMarkerPosLocal = 'setMarkerPosLocal'" !"rsetMarkerPosLocalcode = compile PreprocessFile (BIS_PathMPscriptCommands + 'setMarkerPosLocal.sqf')"


5 setDammage !"\"setDammage\"," !"looknrepair.sqf"," !"Godmode.sqf"," !"cargod.sqf"

I like to put my exceptions near the beginning rather then the end since I find it easier to find them if I need to later on.
</pre>

FAQ
---
Q: I teleported and now I can't move<br>
A: Press w + space

Q: How do i return to my body after spectating a player?<br>
A: Press F3.

Q: I executed "script name" and now I'm stuck, frozen, glitched..etc<br>
A: Change skin to survivor, if that does not work relog

Q: I want to modify my debug monitor, can you help?<br>
A: No, post here http://opendayz.net/index.php?threads/dayz-duel-admin-debug-monitor.8402/ for help.

Q: Can you add "script name" to the tools?<br>
A: Possibly.

Q: I followed the readme to the letter, but it's not working<br>
A: Did you set your instance ID # in init.sqf?
