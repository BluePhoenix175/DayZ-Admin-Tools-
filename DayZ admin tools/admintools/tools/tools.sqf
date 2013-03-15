//sub menu of "tools"
if ((getPlayerUID player) in ["#######","#######"]) then { 
	player addaction [("<t color=""FF0000"">" + ("Tele / ESP") +"</t>"),"admintools\tools\dayzesp.sqf","",1,true,true,""];
	player addaction [("<t color=""FF0000"">" + ("God Mode") +"</t>"),"admintools\tools\Godmode.sqf","",1,true,true,""];
	player addaction [("<t color=""FF0000"">" + ("Car God") +"</t>"),"admintools\tools\cargod.sqf","",1,true,true,""];
	player addaction [("<t color=""FF0000"">" + ("look-n-repair") +"</t>"),"admintools\tools\looknrepair.sqf","",1,true,true,""];
	player addaction [("<t color=""FF0000"">" + ("Heal Player") +"</t>"),"admintools\tools\healp.sqf","",1,true,true,""];
	player addaction [("<t color=""FF0000"">" + ("Zombie Sheild") +"</t>"),"admintools\tools\zombieshield.sqf","",1,true,true,""];
};