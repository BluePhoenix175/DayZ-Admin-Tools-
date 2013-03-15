//add menu items when the hotkey is pressed
if ((getPlayerUID player) in ["#######","#######"]) then { 
player addaction [("<t color=""FF0000"">" + ("Admin Tools") +"</t>"),"admintools\toolmain.sqf","",1,false,false,""];
player addaction [("<t color=""FF0000"">" + ("Toggle Debug") +"</t>"),"debug\playerstats.sqf","",1,false,false,""];
} else {
player addaction [("<t color=""FF0000"">" + ("Toggle Debug") +"</t>"),"debug\playerstats.sqf","",1,false,false,""];
};