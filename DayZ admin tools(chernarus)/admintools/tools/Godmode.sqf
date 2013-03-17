if (isNil "demiGOD") then
{
	demiGOD = 0;
};

if (demiGOD == 0) then
{
	demiGOD = 1;
    cutText ["Godmode activated. (No Recoil, No Grass, No reload)", "PLAIN"];
	setterraingrid 50;
	player setUnitRecoilCoefficient 0;
	player_zombieCheck = {};
	fnc_usec_damageHandler = {};
	fnc_usec_unconscious  = {};
	player removeAllEventHandlers "handleDamage";
	player addEventHandler ["handleDamage", {false}];
	player allowDamage false;
	while {demiGOD == 1} do
	{
		vehicle player setVehicleAmmo 1;
	};
}

else
{
	demiGOD = 0;
    cutText ["Godmode Deactivated. (No Recoil, No Grass, No reload)", "PLAIN"];
	setterraingrid 25;
	player setUnitRecoilCoefficient 1;
	player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
	fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
	fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
	player addEventHandler ["handleDamage", {true}];
	player removeAllEventHandlers "handleDamage";
	player allowDamage true;
};