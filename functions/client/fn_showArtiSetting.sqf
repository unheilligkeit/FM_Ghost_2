﻿/*
ADV_fnc_showArtiSetting by Belbo
Shows artillery setting (propellant setting).

Possible call - has to be executed locally on each client:
[artiObject_1,artiObject_2] call ADV_fnc_showArtiSetting;

_this = artillery vehicles or mortars the notification should be applied to.
*/
//if (isClass(configFile >> "CfgPatches" >> "ACE_mk6mortar")) exitWith {};

{
	if (!isNil "_x") then {
		private _target = _x;
		_target addAction [
			"<t color='#00cc00'>Artillerie-Einstellung anzeigen</t>",
			{
				ADV_artiVar = 1;
				while {player == gunner (_this select 0) && ADV_artiVar == 1} do {
					//hint str (getArtilleryComputerSettings select 0);
					hint format ["Currently selected range:\n %1 \n\nTo change the artillery-range press 'F'",getArtilleryComputerSettings select 0];
					sleep 0.5;
				};
				hint "";
				ADV_artiVar = 0;
			},nil,6,false,true,"","gunner _target == _this"
		];
		_target addAction [
			"<t color='#00cc00'>Artillerie-Einstellung ausblenden</t>",
			{
				hint "";
				ADV_artiVar = 0;
			},nil,6,false,true,"","gunner _target == _this"
		];
	};
	nil;
} count _this;

if (true) exitWith {};