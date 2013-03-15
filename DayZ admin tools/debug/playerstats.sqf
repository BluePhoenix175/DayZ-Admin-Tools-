//Let Zeds know
[player,4,true,(getPosATL player)] spawn player_alertZombies;

//display gui (temp hint)


/*
Change the UID's below to match those of you and your admin(s)
Your admins will get the advanced version of your debug monitor,
while your regular users will get the cut down version. 
*/

if ((getPlayerUID player) in ["#######","#######"]) then { 	  
	while {sleep 1;hotkey_hitme == 1} do {
	  
	  hintSilent parseText format ["
	<t size='0.95' font='Bitstream' align='left' >[%18]</t><t size='0.95' font='Bitstream' align='right'>[FPS: %10]</t><br/>
	<t size='0.95' font='Bitstream' align='center' color='#FFBF00'>Survived %7 Days</t><br/>
	<t size='0.95' font='Bitstream' align='left' >Players: %8</t><t size='0.95 'font='Bitstream' align='right'>Within 500m: %11</t><br/>
	<t size='0.95' font='Bitstream' align='left' >Vehicles:</t><t size='0.95' font='Bitstream'align='right'>%13(%14)</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Air: %16</t><t size='0.95' font='Bitstream'align='right'>Sea: %23</t><br/>
	<t size='0.95' font='Bitstream' align='left' >All Bikes: %15</t><t size='0.95' font='Bitstream'align='right'>Cars: %17</t><br/>
	<t size='0.95' font='Bitstream' align='left' >Zombies (alive/total): </t><t size='0.95' font='Bitstream' align='right'>%20(%19)</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Zombies Killed: </t><t size='0.95' font='Bitstream' align='right'>%2</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Headshots: </t><t size='0.95' font='Bitstream' align='right'>%3</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Murders: </t><t size='0.95' font='Bitstream' align='right'>%4</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Bandits Killed: </t><t size='0.95' font='Bitstream' align='right'>%5</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Humanity: </t><t size='0.95' font='Bitstream' align='right'>%6</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Blood: </t><t size='0.95' font='Bitstream' align='right'>%9</t><br/>
	<t size='0.95' font='Bitstream' align='left' >GPS: %22</t><t size='0.95' font='Bitstream' align='right'>DIR: %24</t><br/>
	<t size='0.95'font='Bitstream'align='center' >%21</t><br/>",
	(name player),
	(player getVariable['zombieKills', 0]),
	(player getVariable['headShots', 0]),
	(player getVariable['humanKills', 0]),
	(player getVariable['banditKills', 0]),
	(player getVariable['humanity', 0]),
	(dayz_skilllevel),
	(count playableUnits),
	r_player_blood,
	(round diag_fps),
	(({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 500]))-1),
	viewdistance,
	(count([6800, 9200, 0] nearEntities [["StaticWeapon","Car","Motorcycle","Tank","Air","Ship"],25000])),
	count vehicles,
	(count([6800, 9200, 0] nearEntities [["Motorcycle"],25000])),
	(count([6800, 9200, 0] nearEntities [["Air"],25000])),
	(count([6800, 9200, 0] nearEntities [["Car"],25000])),
	(gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName')),
	(count entities "zZombie_Base"),
	({alive _x} count entities "zZombie_Base"),
	(getPosASL player),
	(mapGridPosition getPos player),
	(count([6800, 9200, 0] nearEntities [["Ship"],25000])),
	(round(getDir player))
];
};
} else {

while {sleep 1;hotkey_hitme == 1} do {

hintSilent parseText format ["
	<t size='1.20' font='Bitstream' align='center' color='#00CC00'>%1</t><br/>
	<t size='0.95' font='Bitstream' align='center' >[%11]</t><br/>
	<t size='1.15' font='Bitstream' align='center' color='#FFCC00'>Survived %7 Days</t><br/><br/>
	<t size='1.15' font='Bitstream' align='left' color='#FFBF00'>Zombies Killed: </t><t size='1.15' font='Bitstream' align='right'>%2</t><br/>
	<t size='1.15' font='Bitstream' align='left' color='#FFBF00'>Headshots: </t><t size='1.15' font='Bitstream' align='right'>%3</t><br/>
	<t size='1.15' font='Bitstream' align='left' color='#FFBF00'>Humanity: </t><t size='1.15' font='Bitstream' align='right'>%6</t><br/><br/>
	<t size='1.15' font='Bitstream' align='left' color='#FFBF00'>Blood: </t><t size='1.15' font='Bitstream' align='right'>%10</t><br/>
	<t size='1.15' font='Bitstream' color='#5882FA'>North Star Gaming</t><br/>",
	(name player),
	(player getVariable['zombieKills', 0]),
	(player getVariable['headShots', 0]),
	(player getVariable['humanKills', 0]),
	(player getVariable['banditKills', 0]),
	(player getVariable['humanity', 0]),
	(dayz_skilllevel),
	(count entities "zZombie_Base"),
	({alive _x} count entities "zZombie_Base"),
	r_player_blood,
	(gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName'))
];};};