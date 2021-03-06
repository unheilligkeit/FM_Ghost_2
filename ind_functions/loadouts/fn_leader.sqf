﻿/*
unit loadout script by Belbo
creates a specific loadout for playable units. Add the items to their respective variables. (expected data type is given).
The kind of ammo a player gets with this loadout does not necessarily have to be specified. If tracer ammo is supposed to be used, you should set _primaryweaponAmmo to 0 and add those
magazines one for one in _items.
*/

//clothing - (string)
_uniform = ["U_I_G_Story_Protagonist_F","U_Rangemaster","U_Competitor"];
_vest = ["V_PlateCarrier1_blk","V_PlateCarrier2_blk"];
_headgear = ["H_Cap_blk","H_MilCap_gry","H_Cap_headphones"];
_backpack = ["B_AssaultPack_blk"];
_insignium = "";
_useProfileGoggles = 1;		//If set to 1, goggles from your profile will be used. If set to 0, _goggles will be added (or profile goggles will be removed when _goggles is left empty).
_goggles = "";
_unitTraits = [["medic",true],["engineer",false],["explosiveSpecialist",false],["UAVHacker",false],["camouflageCoef",1.0],["audibleCoef",1.0]];

//weapons - primary weapon - (string)
_primaryweapon = "arifle_MX_GL_Black_F";
if (worldName == "TANOA") then { _primaryweapon = ["arifle_MX_GL_Black_F","arifle_MX_GL_khk_F"]; };

//primary weapon items - (array)
_optic = ["optic_Hamr"];
_attachments = [""];
if ( ADV_par_NVGs == 1 ) then { _attachments pushBack "acc_flashlight"; };
if ( ADV_par_NVGs == 2 ) then { _attachments pushback "acc_pointer_IR"; };
_silencer = "muzzle_snds_H";		//if silencer is added

//primary weapon ammo (if a primary weapon is given) and how many tracer mags - (integer)
_primaryweaponAmmo = [4,1];		//first number: Amount of magazines, second number: config index of magazine or classname of magazine type.
if ( ADV_par_indUni == 1 ) then {
	_primaryweaponAmmo set [1,3];		//first number: Amount of magazines, second number: config index of magazine or classname of magazine type.
};
_additionalAmmo = [3,0,false];

//40mm Grenades - (integer)
_40mmHeGrenadesAmmo = 3;
_40mmSmokeGrenadesWhite = 0;
_40mmSmokeGrenadesYellow = 1;
_40mmSmokeGrenadesOrange = 0;
_40mmSmokeGrenadesRed = 1;
_40mmSmokeGrenadesPurple = 0;
_40mmSmokeGrenadesBlue = 0;
_40mmSmokeGrenadesGreen = 1;
_40mmFlareWhite = 0;
_40mmFlareYellow = 4;
_40mmFlareRed = 0;
_40mmFlareGreen = 0;
_40mmFlareIR = 0;

//weapons - handgun - (string)
_handgun = "hgun_Pistol_heavy_01_F";

//handgun items - (array)
_itemsHandgun = ["optic_MRD"];
_handgunSilencer = "muzzle_snds_acp";		//if silencer is added

//handgun ammo (if a handgun is given) - (integer)
_handgunAmmo = [2,0];		//first number: Amount of magazines, second number: config index of magazine or classname of magazine type.

//weapons - launcher - (string)
_launcher = "";

//launcher ammo (if a launcher is given) - (integer) 
_launcherAmmo = [0,0];		//first number: Amount of magazines, second number: config index of magazine or classname of magazine type.

//binocular - (string)
_binocular = "Rangefinder";

//throwables - (integer)
_grenadeSet = 1;		//contains 2 HE grenades, 1 white and one coloured smoke grenade and 1 red chemlight. Select 0 if you want to define your own grenades.
_grenades = [""];		//depending on the custom loadout the colours may be merged. add like this: ["HE","HE","WHITE"] (adds two HE and one white smoke grenade).
_chemlights = [""];		//add like this: ["RED","RED","GREEN"] (adds two red and one green chemlight).
_IRgrenade = 1;

//first aid kits and medi kits- (integer)
_FirstAidKits = 2;
_MediKit = 0;		//if set to 1, a MediKit and all FirstAidKits will be added to the backpack; if set to 0, FirstAidKits will be added to inventory in no specific order.

//items added specifically to uniform: - (array)
_itemsUniform = [];

//items added specifically to vest: - (array)
_itemsVest = [];

//items added specifically to Backpack: - (array)
_itemsBackpack = [];

//linked items (don't put "ItemRadio" in here, as it's set with _equipRadio) - (array)
_itemsLink = [
	"ItemWatch",
	"ItemCompass",
	"ItemGPS",
	"ItemMap",
	"NVGoggles_OPFOR"
];
		
//items added to any container - (array)
_items = [];

//MarksmenDLC-objects:
if (304400 in (getDLCs 1) || 332350 in (getDLCs 1)) then {
};

	//CustomMod items//
	
//TFAR or ACRE radios
_giveRiflemanRadio = true;
_givePersonalRadio = true;
_giveBackpackRadio = false;
if ( isClass (configFile >> "CfgPatches" >> "task_force_radio") ) then {
	_giveBackpackRadio = true;
};
_tfar_microdagr = 0;		//adds the tfar microdagr to set the channels for a rifleman radio

//ACE items (if ACE is running on the server) - (integers)
_ACE_EarPlugs = 1;

_ace_FAK = 1;		//overwrites the values for bandages, morphine and tourniquet and adds a specified number of bandages and morphine. Defined in fn_aceFAK.sqf
_ACE_fieldDressing = 3;
_ACE_packingBandage = 6;
_ACE_elasticBandage = 6;
_ACE_quikclot = 6;
_ACE_atropine = 0;
_ACE_adenosine = 0;
_ACE_epinephrine = 0;
_ACE_morphine = 2;
_ACE_tourniquet = 2;
_ACE_bloodIV = 0;
_ACE_bloodIV_500 = 0;
_ACE_bloodIV_250 = 0;
_ACE_plasmaIV = 0;
_ACE_plasmaIV_500 = 0;
_ACE_plasmaIV_250 = 0;
_ACE_salineIV = 0;
_ACE_salineIV_500 = 0;
_ACE_salineIV_250 = 0;
_ACE_bodyBag = 0;
_ACE_personalAidKit = 0;
_ACE_surgicalKit = 0;

_ACE_SpareBarrel = 0;
_ACE_UAVBattery = 0;
_ACE_wirecutter = 0;
_ACE_Clacker = 0;
_ACE_M26_Clacker = 0;
_ACE_DeadManSwitch = 0;
_ACE_DefusalKit = 0;
_ACE_Cellphone = 0;
_ACE_MapTools = 1;
_ACE_CableTie = 2;
_ACE_EntrenchingTool = 0;
_ACE_sprayPaintColor = "RANDOM";
_ACE_gunbag = 0;

_ACE_key = 1;	//0 = no key, 1 = side dependant key, 2 = master key, 3 = lockpick
_ACE_flashlight = 1;
_ACE_kestrel = 0;
_ACE_altimeter = 0;
_ACE_ATragMX = 0;
_ACE_rangecard = 0;
_ACE_DAGR = 0;
_ACE_microDAGR = 1;
_ACE_RangeTable_82mm = 0;
_ACE_MX2A = 0;
_ACE_HuntIR_monitor = 0;
_ACE_HuntIR = 0;
_ACE_m84 = 0;
_ACE_HandFlare_Green = 0;
_ACE_HandFlare_Red = 0;
_ACE_HandFlare_White = 0;
_ACE_HandFlare_Yellow = 0;

//AGM Variables (if AGM is running) - (bool)
_ACE_isMedic = 0;		//0 = no medic; 1 = medic; 2 = doctor;
_ACE_isEngineer = 1;	//0 = no specialist; 1 = engineer; 2 = repair specialist;
_ACE_isEOD = false;
_ACE_isPilot = false;

//Tablet-Items
_tablet = false;
_androidDevice = true;
_microDAGR = false;
_helmetCam = true;

//scorch inv items
_scorchItems = ["sc_dogtag","sc_mre"];
_scorchItemsRandom = ["sc_cigarettepack","sc_chips","sc_charms","sc_candybar","","",""];

//Addon Content:
switch (ADV_par_indWeap) do {
	case 1: {
		//Vanilla Mk20
		_primaryWeapon = ["arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F"];
		_silencer = ["muzzle_snds_M"];
		_handgun = ["hgun_ACPC2_F"];
		_itemsHandgun = [""];
		_handgunSilencer = [""];
	};
	case 2: {
		//SELmods
		_primaryweapon = ["rhs_weap_m4a1_m320","rhs_weap_m4_m320"];
		_optic = ["rhsusf_acc_ACOG","rhsusf_acc_ACOG3","rhsusf_acc_SpecterDR","rhsusf_acc_SpecterDR","rhsusf_acc_SpecterDR_OD"];
		if ( ADV_par_NVGs == 1 ) then { _attachments = ["rhsusf_acc_M952V"]; };
		if ( ADV_par_NVGs == 2 ) then { _attachments = ["rhsusf_acc_anpeq15side_bk"]; };
		_attachments pushBack (["","","","","rhsusf_acc_grip1","rhsusf_acc_grip2","rhsusf_acc_grip2_tan","rhsusf_acc_grip3"] call BIS_fnc_selectRandom);
		_silencer = "rhsusf_acc_rotex5_grey";
		_primaryweaponAmmo set [1,10];
		_additionalAmmo set [1,9];
		_handgun = "rhsusf_weap_m1911a1";
		_itemsHandgun = [""];
		_handgunSilencer = "";
	};
	case 3: {
		_primaryWeapon = ["HLC_Rifle_g3ka4_GL"];
		_optic = [""];
		_attachments = [""];
		_silencer = "";
		if (isClass(configFile >> "CfgPatches" >> "RH_de_cfg")) then {
			_handgun = ["RH_m1911"];
			_itemsHandgun = [""];
			_handgunSilencer = "";
		};
	};
	case 20: {
		//APEX AKM
		_primaryWeapon = "arifle_AK12_GL_F";
		_optic = [""];
		if ( ADV_par_NVGs == 2 ) then { _attachments = _attachments-["acc_pointer_IR"]; };
		_primaryweaponAmmo set [1,2];
		_handgun = "hgun_Pistol_01_F";
	};
	default {};
};

switch (ADV_par_indUni) do {
	case 1: {
	//AAF uniforms
		_uniform = ["U_I_CombatUniform","U_I_CombatUniform_shortsleeve"];
		_vest = ["V_PlateCarrierIA2_dgtl","V_PlateCarrierIA1_dgtl"];
		_headgear = ["H_HelmetIA"];
		_backpack = ["B_AssaultPack_blk"];
	};
	case 2: {
	//TFA uniforms
		_uniform = ["TFA_Instructor_BW","TFA_Instructor_BT","TFA_Instructor2_BW","TFA_Instructor_BlT","TFA_green_blk_rs","TFA_green_blk","TFA_green_KHK","TFA_green_KHK_rs","TFA_black_KHK_rs","TFA_black_KHK","TFA_black_grn_rs","TFA_black_grn"];
		_vest = ["TFA_PlateCarrierH_Black"];
		_headgear = ["TFA_Cap_HS_blk"];
	};
	case 20: {
	//Apex Syndikat
		_uniform = ["U_I_C_Soldier_Camo_F","U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F"];
		_vest = ["V_TacChestrig_grn_F","V_TacChestrig_cbr_F","V_TacChestrig_oli_F","V_HarnessO_brn","V_HarnessO_ghex_F","V_TacVest_oli","V_I_G_resistanceLeader_F"];
		if ( isClass (configFile >> "CfgPatches" >> "acre_main") ) then {
			_giveRiflemanRadio = true;
			_givePersonalRadio = false;
			_giveBackpackRadio = true;
		};
	};
};

switch (toUpper ([str (_this select 0),3,13] call BIS_fnc_trimString)) do {
	case "LEADER_LOG": {
		_ACE_isMedic = 2;
		_ACE_isEngineer = 2;
		_ACE_isEOD = true;
		_tablet = true;
		_androidDevice = true;
		_giveBackpackRadio = true;
	};
	case "LEADER_COM": {
		_ACE_isMedic = 2;
		_tablet = true;
		_androidDevice = false;
		_40mmFlareYellow = 0;
		_ACE_HuntIR_monitor = 1;
		_ACE_HuntIR = 5;
		_giveBackpackRadio = true;
		if ( isClass (configFile >> "CfgPatches" >> "acre_main") ) then {
			["en","ru","gr"] call acre_api_fnc_babelSetSpokenLanguages;
		};
	};
};

//TFAR-manpacks
if ( isClass(configFile >> "CfgPatches" >> "task_force_radio") && (ADV_par_Radios == 1 || ADV_par_Radios == 3) && _giveBackpackRadio ) then {
	switch (ADV_par_indUni) do {
		case 1: { _backpack = ["tf_anprc155"]; };
		default { _backpack = ["tf_anprc155_coyote"]; };
	};
};

if ( isClass (configFile >> "CfgPatches" >> "acre_main") && (ADV_par_Radios == 1 || ADV_par_Radios == 3) && _giveBackpackRadio ) then {
	_backpack = switch (ADV_par_indUni) do {
		case 1: {"B_AssaultPack_dgtl"};
		case 20: {"B_AssaultPack_rgr"};
		default {"B_AssaultPack_blk"};
	};
};

///// No editing necessary below this line /////
_player = _this select 0;
[_player] call ADV_fnc_gear;
CL_IE_Module_Enabled = true;

nil;