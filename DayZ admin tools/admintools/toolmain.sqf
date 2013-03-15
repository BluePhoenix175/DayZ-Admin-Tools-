//sub menu of "Admin Tools"
if ((getPlayerUID player) in ["#######","#######"]) then { 
	player addaction [("<t color=""#FF9900"">" + ("Tools") +"</t>"),"admintools\tools\tools.sqf","",1,false,false,""];
	player addaction [("<t color=""#FF9900"">" + ("Weapon Kits") +"</t>"),"admintools\weaponkits\kitsmain.sqf","",1,false,false,""];
	player addaction [("<t color=""#FF9900"">" + ("Skins") +"</t>"),"admintools\skins\skinsmain.sqf","",1,false,false,""];
};