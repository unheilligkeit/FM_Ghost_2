﻿/*
cratefiller script by Belbo
put this into init-line of the crate that's supposed to contain the items specified below:
nul = [[this],true,true] call ADV_fnc_resupplyCrate;
*/

if (!isServer) exitWith {};
private ["_target"];
{
	_target = _x;
	//makes the crates indestructible:
	_target allowDamage false;
	
	//grenades
	switch (true) do {
		case (ADV_par_customWeap == 1): {
			_target addMagazineCargoGlobal ["BWA3_DM51A1",10];		
			_target addMagazineCargoGlobal ["BWA3_DM25",20];		
			_target addMagazineCargoGlobal ["BWA3_DM32_Orange",20];
			_target addMagazineCargoGlobal ["BWA3_DM32_Yellow",20];
		};
		case (ADV_par_customWeap == 2 || ADV_par_customWeap == 3 || ADV_par_customWeap == 4): {
			_target addMagazineCargoGlobal ["rhs_mag_m67",10];
			_target addMagazineCargoGlobal ["rhs_mag_an_m8hc",20];
			_target addMagazineCargoGlobal ["rhs_mag_m18_green",10];
			_target addMagazineCargoGlobal ["rhs_mag_m18_red",10];
			_target addMagazineCargoGlobal ["rhs_mag_m18_yellow",10];
		};
		default {
			_target addMagazineCargoGlobal ["HandGrenade",10];
			_target addMagazineCargoGlobal ["SmokeShell",20];
			_target addMagazineCargoGlobal ["SmokeShellGreen",10];
			_target addMagazineCargoGlobal ["SmokeShellRed",10];
			_target addMagazineCargoGlobal ["SmokeShellYellow",10];
		};
	};
	_target addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",20];
	_target addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell",10];
	_target addMagazineCargoGlobal ["1Rnd_SmokePurple_Grenade_shell",10];
	_target addMagazineCargoGlobal ["1Rnd_SmokeYellow_Grenade_shell",10];
	_target addMagazineCargoGlobal ["UGL_FlareYellow_F",10];

	if ( ADV_par_NVGs == 2 && !(isClass (configFile >> "CfgPatches" >> "ACE_attach")) ) then {
		_target addMagazineCargoGlobal ["B_IR_Grenade",4];
	};

	_ACE_fieldDressing = 0;
	_ACE_packingBandage = 0;
	_ACE_elasticBandage = 0;
	_ACE_quikclot = 0;
	_ACE_atropine = 0;
	_ACE_epinephrine = 0;
	_ACE_morphine = 0;
	_ACE_tourniquet = 0;
	_ACE_bloodIV = 0;
	_ACE_bloodIV_500 = 0;
	_ACE_bloodIV_250 = 0;
	_ACE_plasmaIV = 0;
	_ACE_plasmaIV_500 = 0;
	_ACE_plasmaIV_250 = 0;
	_ACE_salineIV = 0;
	_ACE_salineIV_500 = 0;
	_ACE_salineIV_250 = 0;
	_ACE_personalAidKit = 0;
	_ACE_surgicalKit = 0;
	_ACE_bodyBag = 0;
	
	_FAKs = 2;
	_mediKit = 0;
	
	if !(isClass (configFile >> "CfgPatches" >> "ACE_Medical")) then {
		_target addItemCargoGlobal ["FirstAidKit",_FAKs];
		_target addItemCargoGlobal ["MediKit",_mediKit];	
	};
	//medical stuff
	if (isClass (configFile >> "CfgPatches" >> "ACE_common")) then {
		_ACE_EarPlugs = 2;

		_ACE_SpareBarrel = 0;
		_ACE_tacticalLadder = 0;
		_ACE_UAVBattery = 0;
		_ACE_wirecutter = 0;
		_ACE_sandbag = 0;
		_ACE_Clacker = 0;
		_ACE_M26_Clacker = 0;
		_ACE_DeadManSwitch = 0;
		_ACE_DefusalKit = 0;
		_ACE_Cellphone = 0;
		_ACE_MapTools = 0;
		_ACE_CableTie = 0;
		_ACE_NonSteerableParachute = 0;

		_ACE_key_west = 0;
		_ACE_key_east = 0;
		_ACE_key_indp = 0;
		_ACE_key_civ = 0;
		_ACE_key_master = 0;
		_ACE_key_lockpick = 0;
		_ACE_kestrel = 0;
		_ACE_ATragMX = 0;
		_ACE_rangecard = 0;
		_ACE_altimeter = 0;
		_ACE_microDAGR = 0;
		_ACE_DAGR = 0;
		_ACE_RangeTable_82mm = 0;
		_ACE_rangefinder = 0;
		_ACE_NonSteerableParachute = 0;
		_ACE_IR_Strobe = 4;
		_ACE_M84 = 0;
		_ACE_HandFlare_Green = 0;
		_ACE_HandFlare_Red = 2;
		_ACE_HandFlare_White = 0;
		_ACE_HandFlare_Yellow = 0;
		[_target] call ADV_fnc_addACEItems;
	};
	nil;
} count _this;

if (true) exitWith {true;};