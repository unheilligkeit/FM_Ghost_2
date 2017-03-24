﻿/*
unit loadout script by Belbo
creates a specific loadout for playable units. Add the items to their respective variables. (expected data type is given).
The kind of ammo a player gets with this loadout does not necessarily have to be specified. If tracer ammo is supposed to be used, you should set _primaryweaponAmmo to 0 and add those
magazines one for one in _items.
*/

//clothing - (string)
_uniform = ["U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam","U_B_CombatUniform_mcam"];
_vest = ["V_PlateCarrier2_rgr","V_PlateCarrier1_rgr"];
_headgear = ["H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetB_black","H_HelmetB","H_HelmetB_desert","H_HelmetB_grass","H_HelmetB_paint"];
_backpack = ["B_FieldPack_khk","B_FieldPack_oli","B_FieldPack_cbr"];
_insignium = "";
_useProfileGoggles = 1;		//If set to 1, goggles from your profile will be used. If set to 0, _goggles will be added (or profile goggles will be removed when _goggles is left empty).
_goggles = "G_Combat";
_unitTraits = [["medic",true]];

//weapons - primary weapon - (string)
_primaryweapon = ["arifle_MX_Black_F","arifle_MX_F"];
if (worldName == "TANOA") then { _primaryweapon = ["arifle_MX_Black_F","arifle_MX_khk_F"]; };

//primary weapon items - (array)
_optic = ["optic_Hamr","optic_MRCO"];
_attachments = [""];
if ( ADV_par_NVGs == 1 ) then { _attachments pushback "acc_flashlight"; };
if ( ADV_par_NVGs == 2 ) then { _attachments pushback "acc_pointer_IR"; };
_silencer = "muzzle_snds_H";		//if silencer is added

//primary weapon ammo (if a primary weapon is given) and how many tracer mags - (integer)
_primaryweaponAmmo = [7,0];		//first number: Amount of magazines, second number: config index of magazine or classname of magazine type.

//40mm Grenades - (integer)
_40mmHeGrenadesAmmo = 0;
_40mmSmokeGrenadesWhite = 0;
_40mmSmokeGrenadesYellow = 0;
_40mmSmokeGrenadesOrange = 0;
_40mmSmokeGrenadesRed = 0;
_40mmSmokeGrenadesPurple = 0;
_40mmSmokeGrenadesBlue = 0;
_40mmSmokeGrenadesGreen = 0;
_40mmFlareWhite = 0;
_40mmFlareYellow = 0;
_40mmFlareRed = 0;
_40mmFlareGreen = 0;
_40mmFlareIR = 0;

//weapons - handgun - (string)
_handgun = "hgun_Pistol_heavy_01_F";

//handgun items - (array)
_itemsHandgun = [];
_handgunSilencer = "muzzle_snds_acp";		//if silencer is added

//handgun ammo (if a handgun is given) - (integer)
_handgunAmmo = [2,0];		//first number: Amount of magazines, second number: config index of magazine or classname of magazine type.

//weapons - launcher - (string)
_launcher = "";

//launcher ammo (if a launcher is given) - (integer) 
_launcherAmmo = [0,0];		//first number: Amount of magazines, second number: config index of magazine or classname of magazine type.

//binocular - (string)
_binocular = "Binocular";

//throwables - (integer)
_grenadeSet = 1;		//contains 2 HE grenades, 1 white and one coloured smoke grenade and 1 red chemlight. Select 0 if you want to define your own grenades.
_grenades = [""];		//depending on the custom loadout the colours may be merged. add like this: ["HE","HE","WHITE"] (adds two HE and one white smoke grenade).
_chemlights = [""];		//add like this: ["RED","RED","GREEN"] (adds two red and one green chemlight).
_IRgrenade = 0;

//first aid kits and medi kits- (integer)
_FirstAidKits = 8;
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
_givePersonalRadio = false;
_giveBackpackRadio = false;
_tfar_microdagr = 0;		//adds the tfar microdagr to set the channels for a rifleman radio

//ACE items (if ACE is running on the server) - (integers)
_ACE_EarPlugs = 1;

_ace_FAK = 0;		//overwrites the values for bandages, morphine and tourniquet and adds a specified number of bandages and morphine. Defined in fn_aceFAK.sqf
_ACE_fieldDressing = 12;
_ACE_elasticBandage = 12;
_ACE_packingBandage = 24;
_ACE_quikclot = 24;
_ACE_atropine = 0;
_ACE_adenosine = 6;
_ACE_epinephrine = 8;
_ACE_morphine = 8;
_ACE_tourniquet = 3;
_ACE_bloodIV = 0;
_ACE_bloodIV_500 = 0;
_ACE_bloodIV_250 = 0;
_ACE_plasmaIV = 0;
_ACE_plasmaIV_500 = 0;
_ACE_plasmaIV_250 = 0;
_ACE_salineIV = 0;
_ACE_salineIV_500 = 8;
_ACE_salineIV_250 = 0;
_ACE_bodyBag = 0;
_ACE_surgicalKit = 1;
_ACE_personalAidKit = 0;

_ACE_SpareBarrel = 0;
_ACE_EntrenchingTool = 0;
_ACE_UAVBattery = 0;
_ACE_wirecutter = 0;
_ACE_Clacker = 0;
_ACE_M26_Clacker = 0;
_ACE_DeadManSwitch = 0;
_ACE_DefusalKit = 0;
_ACE_Cellphone = 0;
_ACE_MapTools = 0;
_ACE_CableTie = 0;
_ACE_sprayPaintColor = "NONE";
_ACE_gunbag = 0;

_ACE_key = 0;	//0 = no key, 1 = side dependant key, 2 = master key, 3 = lockpick
_ACE_flashlight = 1;
_ACE_kestrel = 0;
_ACE_altimeter = 0;
_ACE_ATragMX = 0;
_ACE_rangecard = 0;
_ACE_DAGR = 1;
_ACE_microDAGR = 0;
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
_ACE_isMedic = 1;		//0 = no medic; 1 = medic; 2 = doctor;
_ACE_isEngineer = 0;	//0 = no specialist; 1 = engineer; 2 = repair specialist;
_ACE_isEOD = false;
_ACE_isPilot = false;

//Tablet-Items
_tablet = false;
_androidDevice = false;
_microDAGR = true;
_helmetCam = false;

//scorch inv items
_scorchItems = ["sc_dogtag","sc_mre"];
_scorchItemsRandom = ["sc_cigarettepack","sc_chips","sc_charms","sc_candybar","","",""];

//Addon Content:
switch (ADV_par_customWeap) do {
	case 1: {
		//BWmod
		if (isClass(configFile >> "CfgPatches" >> "hlcweapons_g36")) then {
			_primaryWeapon = ["hlc_rifle_G36A1"];
			_optic = ["HLC_Optic_G36dualoptic35x2d"];
			_attachments = [""];
			if (isClass(configFile >> "CfgPatches" >> "adv_hlcG36_bwmod")) then { _primaryweaponAmmo set [1,4] };
		} else {
			_primaryweapon = ["BWA3_G36"];
			_optic = ["BWA3_optic_ZO4x30"];
			if ( ADV_par_NVGs > 0 ) then { _attachments = ["BWA3_acc_LLM01_irlaser"]; };
		};
		_silencer = "BWA3_muzzle_snds_G36";
		_handgun = "BWA3_P8";
		_itemsHandgun = [];
		_handgunSilencer = "";
		_grenadeSet = 0;		//contains 2 HE grenades, 1 white and one coloured smoke grenade and 1 red chemlight. Select 0 if you want to define your own grenades.
		_grenades = ["WHITE","WHITE","GREEN"];		//depending on the custom loadout the colours may be merged. add like this: ["HE","HE","WHITE"] (adds two HE and one white smoke grenade).
		_chemlights = ["RED"];		//add like this: ["RED","RED","GREEN"] (adds two red and one green chemlight).
	};
	case 2: {
		//RHS ARMY
		_primaryweapon = ["rhs_weap_m4_carryhandle","rhs_weap_m4_carryhandle_mstock","rhs_weap_m4a1_carryhandle"];
		_optic = ["rhsusf_acc_ACOG","rhsusf_acc_ACOG3","rhsusf_acc_SpecterDR","rhsusf_acc_SpecterDR","rhsusf_acc_SpecterDR_OD"];
		if ( ADV_par_NVGs == 1 ) then { _attachments = ["rhsusf_acc_M952V"]; };
		if ( ADV_par_NVGs == 2 ) then { _attachments = ["rhsusf_acc_anpeq15side_bk"]; };
		_attachments pushBack (["","","","","rhsusf_acc_grip1","rhsusf_acc_grip2","rhsusf_acc_grip2_tan","rhsusf_acc_grip3"] call BIS_fnc_selectRandom);
		_silencer = "rhsusf_acc_rotex5_grey";
		_primaryweaponAmmo set [1,9];
		_handgun = "rhsusf_weap_m9";
		_itemsHandgun = [""];
		_handgunSilencer = "";
	};
	case 3: {
		//RHS Marines
		_primaryweapon = ["rhs_weap_m16a4_carryhandle"];
		_optic = ["rhsusf_acc_ACOG","rhsusf_acc_ACOG3"];
		if ( ADV_par_NVGs == 1 ) then { _attachments = ["rhsusf_acc_M952V"]; };
		if ( ADV_par_NVGs == 2 ) then { _attachments = ["rhsusf_acc_anpeq15side_bk"]; };
		_silencer = "rhsusf_acc_rotex5_grey";
		_primaryweaponAmmo set [1,9];
		_handgun = "rhsusf_weap_m1911a1";
		_itemsHandgun = [""];
		_handgunSilencer = "";
	};
	case 4: {
		//RHS SOF
		_primaryweapon = ["rhs_weap_hk416d145","rhs_weap_hk416d145","rhs_weap_hk416d10","rhs_weap_hk416d10_LMT","rhs_weap_m4a1_blockII_KAC","rhs_weap_m4_carryhandle"];
		_optic = ["rhsusf_acc_SpecterDR","rhsusf_acc_SpecterDR","rhsusf_acc_SpecterDR_OD"];
		if ( ADV_par_NVGs == 1 ) then { _attachments = ["rhsusf_acc_M952V"]; };
		if ( ADV_par_NVGs == 2 ) then { _attachments = ["rhsusf_acc_anpeq15side_bk"]; };
		_attachments pushBack (["","","rhsusf_acc_grip1","rhsusf_acc_grip2","rhsusf_acc_grip2_tan","rhsusf_acc_grip3"] call BIS_fnc_selectRandom);
		_silencer = "rhsusf_acc_rotex5_grey";
		_primaryweaponAmmo set [1,9];
		_handgun = "rhsusf_weap_m9";
		_itemsHandgun = [""];
		_handgunSilencer = "";
	};
	case 5: {
		//SELmods CUP Mk16
		_primaryweapon = ["CUP_arifle_Mk16_STD","CUP_arifle_Mk16_STD","CUP_arifle_Mk16_STD_FG","CUP_arifle_Mk16_STD_SFG"];
		_optic = ["CUP_optic_ELCAN_SpecterDR"];
		if ( ADV_par_NVGs > 0 ) then { _attachments = ["CUP_acc_ANPEQ_15"]; };
		_silencer = "CUP_muzzle_snds_SCAR_L";
		_handgun="CUP_hgun_M9";
		_itemsHandgun=[];
		_handgunSilencer = "CUP_muzzle_snds_M9";
	};
	case 6: {
		//SELmods CUP M4
		_primaryweapon = ["CUP_arifle_M16A4_Base","CUP_arifle_M16A4_Base","CUP_arifle_M16A4_Base","CUP_arifle_M4A1","CUP_arifle_M4A1_camo","CUP_arifle_M4A3_desert"];
		_optic = ["CUP_optic_RCO"];
		if ( ADV_par_NVGs > 0 ) then { _attachments = ["CUP_acc_ANPEQ_2_grey"]; };
		_silencer = "CUP_muzzle_snds_M16";
		_handgun="CUP_hgun_M9";
		_itemsHandgun=[];
		_handgunSilencer = "CUP_muzzle_snds_M9";
	};
	case 7: {
		//BAF
		_primaryweapon="CUP_arifle_L85A2";
		_optic = ["CUP_optic_SUSAT","CUP_optic_ACOG"];
		_attachments = [""];
		_silencer = "CUP_muzzle_snds_L85";
		_handgun="CUP_hgun_Glock17";
		_itemsHandgun=["CUP_acc_Glock17_Flashlight"];
		_handgunSilencer = "muzzle_snds_L";
	};
	case 8: {
		//UK3CB
		_primaryweapon = ["UK3CB_BAF_L85A2","UK3CB_BAF_L85A2_RIS_AFG","UK3CB_BAF_L85A2_EMAG","UK3CB_BAF_L85A2_RIS"];
		_optic = ["UK3CB_BAF_SUSAT_3D","UK3CB_BAF_TA31F_3D"];
		if ( ADV_par_NVGs > 0 ) then { _attachments = ["UK3CB_BAF_LLM_IR_Black"]; };
		_silencer = "UK3CB_BAF_Silencer_L85";
		_primaryweaponAmmo set [1,2];
		_handgun = "UK3CB_BAF_L131A1";
		_itemsHandgun=["UK3CB_BAF_Flashlight_L131A1"];
		_handgunSilencer = "muzzle_snds_L";
	};
	case 9: {
		_primaryWeapon = ["hlc_rifle_g3a3ris","hlc_rifle_g3a3ris","hlc_rifle_g3a3ris","hlc_rifle_FAL5061","hlc_rifle_STG58F","hlc_rifle_L1A1SLR"];
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
		//APEX HK416
		_primaryWeapon = ["arifle_SPAR_01_blk_F"];
		switch (true) do {
			case ((toUpper worldname) in ADV_var_aridMaps): {_primaryWeapon append ["arifle_SPAR_01_snd_F"]};
			case ((toUpper worldname) in ADV_var_lushMaps): {_primaryWeapon append ["arifle_SPAR_01_khk_F"]};
			default {};
		};
		_silencer = "muzzle_snds_M";
		_primaryweaponAmmo set [1,2];
		_optic = ["optic_Arco_blk_F","optic_MRCO"];
	};
	default {};
};
switch (ADV_par_customUni) do {
	case 1: {
		//BWmod Tropen
		_uniform = ["BWA3_Uniform_idz_Tropen"];
		if (isClass(configFile >> "CfgPatches" >> "German_feldbluse_patches")) then { 
			_uniform = ["PBW_Uniform1_tropen","PBW_Uniform1H_tropen","PBW_Uniform2_tropen","PBW_Uniform3_tropen","PBW_Uniform3K_tropen","PBW_Uniform4_tropen","PBW_Uniform4K_tropen"]; 
		};
		_vest = ["BWA3_Vest_Rifleman1_Tropen"];
		_headgear = ["BWA3_MICH_Tropen"];
		if (isClass(configFile >> "CfgPatches" >> "example_german_headgear_config")) then {
			_items pushback "PBW_muetze1_tropen";
		};
		_backpack = ["BWA3_TacticalPack_Tropen_Medic"];
		if ( isClass(configFile >> "CfgPatches" >> "Dsk_lucie_config") ) then { _itemsLink = _itemsLink-["NVGoggles_OPFOR"]+["dsk_nsv"]; };
	};
	case 2: {
		//BWmod Fleck
		_uniform = ["BWA3_Uniform_idz_Fleck"];
		if (isClass(configFile >> "CfgPatches" >> "German_feldbluse_patches")) then { 
			_uniform = ["PBW_Uniform1_fleck","PBW_Uniform1H_fleck","PBW_Uniform2_fleck","PBW_Uniform3_fleck","PBW_Uniform3K_fleck","PBW_Uniform4_fleck","PBW_Uniform4K_fleck"]; 
		};
		_vest = ["BWA3_Vest_Rifleman1_Fleck"];
		_headgear = ["BWA3_MICH_Fleck"];
		if (isClass(configFile >> "CfgPatches" >> "example_german_headgear_config")) then {
			_items pushback "PBW_muetze1_fleck";
		};
		_backpack = ["BWA3_TacticalPack_Fleck_Medic"];
		if ( isClass(configFile >> "CfgPatches" >> "Dsk_lucie_config") ) then { _itemsLink = _itemsLink-["NVGoggles_OPFOR"]+["dsk_nsv"]; };
	};
	case 3: {
		//TFA Mixed
	};
	case 4: {
		//TFA Woodland
	};
	case 5: {
		//TFA Desert
	};
	case 6: {
		//CUP BAF
		switch (true) do {
			case ((toUpper worldname) in ADV_var_aridMaps): {
				_uniform = ["CUP_U_B_BAF_DDPM_S2_UnRolled","CUP_U_B_BAF_DDPM_S1_RolledUp","CUP_U_B_BAF_DDPM_Tshirt"];
				_vest = ["CUP_V_BAF_Osprey_Mk2_DDPM_Medic"];
				_headgear = ["CUP_H_BAF_Helmet_1_DDPM","CUP_H_BAF_Helmet_Net_2_DDPM","CUP_H_BAF_Helmet_4_DDPM"];
			};
			case ((toUpper worldname) in ADV_var_lushMaps): {
				_uniform = ["CUP_U_B_BAF_DPM_S2_UnRolled","CUP_U_B_BAF_DPM_S1_RolledUp","CUP_U_B_BAF_DPM_S1_RolledUp","CUP_U_B_BAF_DPM_Tshirt"];
				_vest = ["CUP_V_BAF_Osprey_Mk2_DPM_Medic"];
				_headgear = ["CUP_H_BAF_Helmet_1_DPM","CUP_H_BAF_Helmet_Net_2_DPM","CUP_H_BAF_Helmet_4_DPM"];
			};
			default {
				_uniform = ["CUP_U_B_BAF_MTP_S2_UnRolled","CUP_U_B_BAF_MTP_S1_RolledUp","CUP_U_B_BAF_MTP_Tshirt","CUP_U_B_BAF_MTP_S3_RolledUp","CUP_U_B_BAF_MTP_S5_UnRolled","CUP_U_B_BAF_MTP_S6_UnRolled"];
				_vest = ["CUP_V_BAF_Osprey_Mk2_MTP_Medic"];
				_headgear = ["CUP_H_BAF_Helmet_1_MTP","CUP_H_BAF_Helmet_Net_2_MTP","CUP_H_BAF_Helmet_4_MTP"];
			};
		};
		_backpack = ["CUP_B_Bergen_BAF"];
		_itemsLink = _itemsLink-["NVGoggles_OPFOR"]+["CUP_NVG_HMNVS"];
	};
	case 7: {
		//RHS OCP
		_uniform = ["rhs_uniform_cu_ocp"];
		_vest = ["rhsusf_iotv_ocp_Rifleman"];
		_headgear = ["rhsusf_ach_helmet_ocp","rhsusf_ach_helmet_headset_ocp","rhsusf_ach_helmet_ESS_ocp","rhsusf_ach_helmet_headset_ess_ocp",
			"rhsusf_mich_bare_tan","rhsusf_mich_bare_tan_headset","rhsusf_ach_bare_tan_ess","rhsusf_ach_bare_tan_headset_ess"];
		_backpack = ["rhsusf_falconii"];
		_items pushBack "rhsusf_patrolcap_ocp";
		_itemsLink = _itemsLink-["NVGoggles_OPFOR"]+["rhsusf_ANPVS_15"];
	};
	case 8: {
		//RHS UCP:
		_uniform = ["rhs_uniform_cu_ucp"];
		_vest = ["rhsusf_iotv_ucp_Rifleman"];
		_headgear = ["rhsusf_ach_helmet_ucp","rhsusf_ach_helmet_headset_ucp","rhsusf_ach_helmet_ESS_ucp","rhsusf_ach_helmet_headset_ess_ucp",
			"rhsusf_mich_bare_norotos_alt","rhsusf_mich_bare_headset","rhsusf_ach_bare_ess","rhsusf_ach_bare_headset_ess"];
		_backpack = ["rhsusf_falconii"];
		_items pushBack "rhsusf_patrolcap_ucp";
		_itemsLink = _itemsLink-["NVGoggles_OPFOR"]+["rhsusf_ANPVS_15"];
	};
	case 10: {
		//RHS MARPAT
		switch (true) do {
			case ((toUpper worldname) in ADV_var_aridMaps): {
				_uniform = ["rhs_uniform_FROG01_d"];
				_headgear = ["rhsusf_lwh_helmet_marpatd","rhsusf_mich_helmet_marpatd","rhsusf_mich_helmet_marpatd_alt","rhsusf_mich_helmet_marpatd_norotos"];
				_items pushBack "rhs_Booniehat_marpatd";
			};
			default {
				_uniform = ["rhs_uniform_FROG01_wd"];
				_headgear = ["rhsusf_mich_bare_norotos"];
				_items pushBack "rhs_Booniehat_marpatwd";
			};
		};
		_vest = ["rhsusf_spc_corpsman"];
		_backpack = ["rhsusf_assault_eagleaiii_coy"];
		_itemsLink = _itemsLink-["NVGoggles_OPFOR"]+["rhsusf_ANPVS_15"];
	};	
	case 11: {
	};
	case 9: {
		//Guerilla
		_uniform = ["U_BG_Guerrilla_6_1","U_BG_Guerilla2_2","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_BG_Guerilla3_1"];
		_headgear = ["H_Shemag_olive","H_ShemagOpen_tan","H_ShemagOpen_khk","H_Cap_headphones","H_MilCap_mcamo","H_MilCap_gry","H_MilCap_blue","H_Cap_tan_specops_US",
			"H_Cap_usblack","H_Cap_oli_hs","H_Cap_blk","H_Booniehat_tan","H_Booniehat_oli","H_Booniehat_khk","H_Watchcap_khk","H_Watchcap_cbr","H_Watchcap_camo"];
	};
	case 12: {
		//UK3CB
		_uniform = ["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM","UK3CB_BAF_U_CombatUniform_MTP_TShirt","UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM","UK3CB_BAF_U_CombatUniform_MTP_RM","UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM"];
		_vest = ["UK3CB_BAF_V_Osprey_Medic_A","UK3CB_BAF_V_Osprey_Medic_B","UK3CB_BAF_V_Osprey_Medic_C","UK3CB_BAF_V_Osprey_Medic_D"];
		_headgear = ["UK3CB_BAF_H_Mk7_Camo_A","UK3CB_BAF_H_Mk7_Camo_B","UK3CB_BAF_H_Mk7_Camo_C","UK3CB_BAF_H_Mk7_Camo_D","UK3CB_BAF_H_Mk7_Camo_E","UK3CB_BAF_H_Mk7_Camo_F","UK3CB_BAF_H_Mk7_Net_A","UK3CB_BAF_H_Mk7_Net_B","UK3CB_BAF_H_Mk7_Net_C","UK3CB_BAF_H_Mk7_Net_D"];
		_backpack = ["UK3CB_BAF_B_Bergen_MTP_Medic_L_A","UK3CB_BAF_B_Bergen_MTP_Medic_L_B"];
		_items pushBack "UK3CB_BAF_H_Beret_RM_Bootneck";
		_itemsLink = _itemsLink-["NVGoggles_OPFOR"]+["UK3CB_BAF_HMNVS"];
	};
	case 13: {
		//TRYK SpecOps
		_uniform = ["TRYK_U_denim_hood_mc","TRYK_shirts_DENIM_od","TRYK_U_denim_hood_blk","TRYK_U_denim_hood_nc","TRYK_hoodie_FR","TRYK_U_pad_hood_odBK","TRYK_U_pad_hood_Cl",
			"TRYK_shirts_TAN_PAD_YEL","TRYK_U_B_PCUs"];
		_vest = ["TRYK_V_Sheriff_BA_TB4","TRYK_V_Sheriff_BA_T4"];
		_headgear append ["TRYK_R_CAP_OD_US","TRYK_R_CAP_BLK","H_Cap_headphones","H_Cap_oli_hs","H_Cap_blk","TRYK_ESS_CAP_tan",
			"TRYK_H_PASGT_COYO","TRYK_H_PASGT_OD"];
	};
	case 14: {
		//TRYK Snow
		_uniform = ["TRYK_U_B_PCUHsW6","TRYK_U_B_PCUHsW4","TRYK_U_B_PCUHsW","TRYK_U_B_PCUHsW5"];
		_vest = ["TRYK_V_ArmorVest_Winter"];
		_headgear = ["TRYK_H_woolhat_WH","TRYK_H_woolhat_WH",""];
		_backpack = ["TRYK_B_Coyotebackpack_WH"];
		_useProfileGoggles = 0;
		_goggles = ["TRYK_kio_balaclava_WH","",""];
	};
	case 20: {
		//APEX NATO
		_uniform = ["U_B_T_Soldier_AR_F","U_B_T_Soldier_SL_F","U_B_T_Soldier_F","U_B_T_Soldier_F"];
		_vest = ["V_PlateCarrier1_tna_F","V_PlateCarrier2_tna_F"];
		_headgear = ["H_HelmetB_tna_F","H_HelmetB_Enh_tna_F","H_HelmetB_Light_tna_F"];
		_backpack = ["B_FieldPack_oli"];
		_itemsLink = _itemsLink-["NVGoggles_OPFOR"]+["NVGoggles_tna_F"];
	};
	default {};
};

if (isClass(configFile >> "CfgPatches" >> "adv_insignia")) then {
	_insignium = "ADV_insignia_medic";
};

///// No editing necessary below this line /////
_player = _this select 0;
[_player] call ADV_fnc_gear;

if ( isClass(configFile >> "CfgPatches" >> "ACE_medical") && ADV_par_logisticAmount > 2 ) then {
	[_player,
		[("<t color=""#00FF00"">" + ("Replenish Medic Items") + "</t>"), {[(_this select 1),1] call adv_fnc_acefak},nil,6,false,true,"","(player != _target) && !( (['medic',(str player)] call BIS_fnc_inString) || (['cls',(str player)] call BIS_fnc_inString) )",2]
	] remoteExec ["addAction",0,true];
};

nil;