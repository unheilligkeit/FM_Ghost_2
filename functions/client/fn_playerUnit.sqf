﻿/*
ADV_fnc_playerUnit by Belbo

Possible call - has to be executed on each client at mission startup:
[object] call ADV_fnc_applyLoadout;

_this select 0 = object - target the loadout is applied to.
*/

params [
	["_target", player, [objNull]],
	"_object","_zeus","_prefix","_playerUnit"
];
_object = str _target;

if (side _target == sideLogic) exitWith {};

if (side _target == west) then {
	_zeus = ["Z1","Z2","Z3","Z4","Z5"];
	
	_prefix = _object select [0,3];
	//_prefix = [_object,0,2] call BIS_fnc_trimString;
	_playerUnit = switch (toUpper (_prefix)) do {
		case "FT_": {"ADV_fnc_ftLeader"};
		case "LEA": {"ADV_fnc_leader"};
		case "LMG": {"ADV_fnc_LMG"};
		case "AR_": {"ADV_fnc_AR"};
		case "MMG": {"ADV_fnc_AR"};
		case "GRE": {"ADV_fnc_gren"};
		case "AT_": {"ADV_fnc_AT"};
		case "AA_": {"ADV_fnc_AA"};
		case "COM": {"ADV_fnc_command"};
		case "MED": {"ADV_fnc_medic"};
		case "SPE": {"ADV_fnc_spec"};
		case "MAR": {"ADV_fnc_marksman"};
		case "UAV": {"ADV_fnc_uavOP"};
		case "CLS": {"ADV_fnc_cls"};
		case "DRI": {"ADV_fnc_driver"};
		case "LOG": {"ADV_fnc_log"};
		case "PIL": {"ADV_fnc_pilot"};
		case "SNI": {"ADV_fnc_sniper"};
		case "SPO": {"ADV_fnc_spotter"};
		case "ABE": {"ADV_fnc_ABearer"};
		case "CSW": {"ADV_fnc_soldier"};	//crew served weapon
		case "ACS": {"ADV_fnc_soldier"};	//crew served weapon
		case "MOR": {"ADV_fnc_soldier"};	//mortar gunner
		case "AMO": {"ADV_fnc_soldier"};	//mortar gunner
		case "TOW": {"ADV_fnc_soldier"};	//TOW Gunner
		case "ATO": {"ADV_fnc_soldier"};	//TOW Gunner
		default {
			switch true do {
				case ( toUpper (_object select [0,8]) == "FTLEADER" ): {"ADV_fnc_ftLeader"};
				case ( toUpper (_object select [0,9]) == "SOLDIERAT" ): {"ADV_fnc_soldierAT"};
				case ( toUpper (_object select [0,7]) == "SOLDIER" ): {"ADV_fnc_soldier"};
				case ( toUpper (_object select [0,5]) == "ASSAR" ): {"ADV_fnc_assAR"};
				case ( toUpper (_object select [0,6]) == "ASSMMG" ): {"ADV_fnc_assAR"};
				case ( toUpper (_object select [0,5]) == "ASSAT" ): {"ADV_fnc_assAT"};
				case ( toUpper (_object select [0,5]) == "ASSAA" ): {"ADV_fnc_assAA"};
				case ( toUpper (_object select [0,11]) == "DIVER_MEDIC" ): {"ADV_fnc_diver_medic"};
				case ( toUpper (_object select [0,10]) == "DIVER_SPEC" ): {"ADV_fnc_diver_spec"};
				case ( toUpper (_object select [0,5]) == "DIVER" ): {"ADV_fnc_diver"};
				case ( toUpper (_object select [0,6]) == "ASSCSW" ): {"ADV_fnc_soldier"};			//asst. crew served weapon
				case ( toUpper (_object select [0,9]) == "ASSMORTAR" ): {"ADV_fnc_soldier"};		//asst. mortar gunner
				case ( toUpper (_object select [0,6]) == "ASSTOW" ): {"ADV_fnc_soldier"};		//asst. mortar gunner
				case ( (toUpper _object) in _zeus ): {"ADV_fnc_zeus"};
				default {"ADV_fnc_nil"};
			};
		};	
	};
};

if (side _target == east) then {
	_zeus = ["OPF_Z1","OPF_Z2","OPF_Z3","OPF_Z4","OPF_Z5"];
	
	_prefix = _object select [0,7];
	_playerUnit = switch (toUpper (_prefix)) do {
		case "OPF_FT_": {"ADV_opf_fnc_ftLeader"};
		case "OPF_LEA": {"ADV_opf_fnc_leader"};
		case "OPF_LMG": {"ADV_opf_fnc_LMG"};
		case "OPF_AR_": {"ADV_opf_fnc_AR"};
		case "OPF_MMG": {"ADV_opf_fnc_AR"};
		case "OPF_GRE": {"ADV_opf_fnc_gren"};
		case "OPF_AT_": {"ADV_opf_fnc_AT"};
		case "OPF_AA_": {"ADV_opf_fnc_AA"};
		case "OPF_COM": {"ADV_opf_fnc_command"};
		case "OPF_MED": {"ADV_opf_fnc_medic"};
		case "OPF_SPE": {"ADV_opf_fnc_spec"};
		case "OPF_MAR": {"ADV_opf_fnc_marksman"};
		case "OPF_UAV": {"ADV_opf_fnc_uavOP"};
		case "OPF_CLS": {"ADV_opf_fnc_cls"};
		case "OPF_DRI": {"ADV_opf_fnc_driver"};
		case "OPF_LOG": {"ADV_opf_fnc_log"};
		case "OPF_PIL": {"ADV_opf_fnc_pilot"};
		case "OPF_SNI": {"ADV_opf_fnc_sniper"};
		case "OPF_SPO": {"ADV_opf_fnc_spotter"};
		case "OPF_ABE": {"ADV_opf_fnc_ABearer"};
		case "OPF_CSW": {"ADV_opf_fnc_soldier"};	//crew served weapon
		case "OPF_ACS": {"ADV_opf_fnc_soldier"};	//asst. crew served weapon
		case "OPF_MOR": {"ADV_opf_fnc_soldier"};	//mortar gunner
		case "OPF_AMO": {"ADV_opf_fnc_soldier"};	//asst. mortar gunner
		case "OPF_TOW": {"ADV_opf_fnc_soldier"};	//TOW gunner
		case "OPF_ATO": {"ADV_opf_fnc_soldier"};	//asst. TOW gunner
		default {
			_prefix = [_object,0,-2] call BIS_fnc_trimString;
			switch true do {
				case ( toUpper (_object select [0,12]) == "OPF_FTLEADER" ): {"ADV_opf_fnc_ftLeader"};
				case ( toUpper (_object select [0,13]) == "OPF_SOLDIERAT" ): {"ADV_opf_fnc_soldierAT"};
				case ( toUpper (_object select [0,11]) == "OPF_SOLDIER" ): {"ADV_opf_fnc_soldier"};
				case ( toUpper (_object select [0,9]) == "OPF_ASSAR" ): {"ADV_opf_fnc_assAR"};
				case ( toUpper (_object select [0,10]) == "OPF_ASSMMG" ): {"ADV_opf_fnc_assAR"};
				case ( toUpper (_object select [0,9]) == "OPF_ASSAT" ): {"ADV_opf_fnc_assAT"};
				case ( toUpper (_object select [0,9]) == "OPF_ASSAA" ): {"ADV_opf_fnc_assAA"};
				case ( toUpper (_object select [0,15]) == "OPF_DIVER_MEDIC" ): {"ADV_opf_fnc_diver_medic"};
				case ( toUpper (_object select [0,14]) == "OPF_DIVER_SPEC" ): {"ADV_opf_fnc_diver_spec"};
				case ( toUpper (_object select [0,9]) == "OPF_DIVER" ): {"ADV_opf_fnc_diver"};
				case ( toUpper (_object select [0,10]) == "OPF_ASSCSW" ): {"ADV_opf_fnc_soldier"};			//asst. crew served weapon
				case ( toUpper (_object select [0,13]) == "OPF_ASSMORTAR" ): {"ADV_opf_fnc_soldier"};		//asst. mortar gunner
				case ( toUpper (_object select [0,10]) == "OPF_ASSTOW" ): {"ADV_opf_fnc_soldier"};		//asst. mortar gunner
				case ( (toUpper _object) in _zeus ): {"ADV_fnc_zeus"};
				default {"ADV_fnc_nil"};
			};
		};	
	};
};

if (side _target == independent) then {
	_zeus = ["IND_Z1","IND_Z2","IND_Z3","IND_Z4","IND_Z5"];
	
	_prefix = _object select [0,7];
	_playerUnit = switch (toUpper (_prefix)) do {
		case "IND_FT_": {"ADV_ind_fnc_ftLeader"};
		case "IND_LEA": {"ADV_ind_fnc_leader"};
		case "IND_LMG": {"ADV_ind_fnc_LMG"};
		case "IND_AR_": {"ADV_ind_fnc_AR"};
		case "IND_MMG": {"ADV_ind_fnc_AR"};
		case "IND_GRE": {"ADV_ind_fnc_gren"};
		case "IND_AT_": {"ADV_ind_fnc_AT"};
		case "IND_AA_": {"ADV_ind_fnc_AA"};
		case "IND_COM": {"ADV_ind_fnc_command"};
		case "IND_MED": {"ADV_ind_fnc_medic"};
		case "IND_SPE": {"ADV_ind_fnc_spec"};
		case "IND_MAR": {"ADV_ind_fnc_marksman"};
		case "IND_UAV": {"ADV_ind_fnc_uavOP"};
		case "IND_CLS": {"ADV_ind_fnc_cls"};
		case "IND_LOG": {"ADV_ind_fnc_log"};
		case "IND_DRI": {"ADV_ind_fnc_driver"};
		case "IND_PIL": {"ADV_ind_fnc_pilot"};
		case "IND_SNI": {"ADV_ind_fnc_sniper"};
		case "IND_SPO": {"ADV_ind_fnc_spotter"};
		case "IND_ABE": {"ADV_ind_fnc_ABearer"};
		case "IND_CSW": {"ADV_ind_fnc_soldier"};	//crew served weapon
		case "IND_ACS": {"ADV_ind_fnc_soldier"};	//asst. crew served weapon
		case "IND_MOR": {"ADV_ind_fnc_soldier"};	//mortar gunner
		case "IND_AMO": {"ADV_ind_fnc_soldier"};	//asst. mortar gunner
		case "IND_TOW": {"ADV_ind_fnc_soldier"};	//TOW gunner
		case "IND_ATO": {"ADV_ind_fnc_soldier"};	//asst. TOW gunner
		default {
			_prefix = [_object,0,-2] call BIS_fnc_trimString;
			switch true do {
				case ( toUpper (_object select [0,12]) == "IND_FTLEADER" ): {"ADV_ind_fnc_ftLeader"};
				case ( toUpper (_object select [0,13]) == "IND_SOLDIERAT" ): {"ADV_ind_fnc_soldierAT"};
				case ( toUpper (_object select [0,11]) == "IND_SOLDIER" ): {"ADV_ind_fnc_soldier"};
				case ( toUpper (_object select [0,9]) == "IND_ASSAR" ): {"ADV_ind_fnc_assAR"};
				case ( toUpper (_object select [0,10]) == "IND_ASSMMG" ): {"ADV_ind_fnc_assAR"};
				case ( toUpper (_object select [0,9]) == "IND_ASSAT" ): {"ADV_ind_fnc_assAT"};
				case ( toUpper (_object select [0,9]) == "IND_ASSAA" ): {"ADV_ind_fnc_assAA"};
				case ( toUpper (_object select [0,15]) == "IND_DIVER_MEDIC" ): {"ADV_ind_fnc_diver_medic"};
				case ( toUpper (_object select [0,14]) == "IND_DIVER_SPEC" ): {"ADV_ind_fnc_diver_spec"};
				case ( toUpper (_object select [0,9]) == "IND_DIVER" ): {"ADV_ind_fnc_diver"};
				case ( toUpper (_object select [0,10]) == "IND_ASSCSW" ): {"ADV_ind_fnc_soldier"};			//asst. crew served weapon
				case ( toUpper (_object select [0,13]) == "IND_ASSMORTAR" ): {"ADV_ind_fnc_soldier"};		//asst. mortar gunner
				case ( toUpper (_object select [0,10]) == "IND_ASSTOW" ): {"ADV_ind_fnc_soldier"};		//asst. mortar gunner
				case ( (toUpper _object) in _zeus ): {"ADV_fnc_zeus"};
				default {"ADV_fnc_nil"};
			};
		};	
	};
};

if (side _target == civilian) then {
	_zeus = ["civ_z1","civ_z2","civ_z3","civ_z4","civ_z5"];
	
	_prefix = [_object,0,-2] call BIS_fnc_trimString;
	_playerUnit = switch true do {
		case ( toUpper (_object select [0,9]) == "CIV_PILOT" ): {"ADV_fnc_civPilot"};
		case ( toUpper (_object select [0,3]) == "CIV" ): {"ADV_fnc_civ"};
		case ( toUpper (_object select [0,7]) == "CIV_DOC" ): {"ADV_fnc_doc"};
		case ( toUpper (_object select [0,7]) == "CIV_POL" ): {"ADV_fnc_police"};
		case ( toUpper (_object select [0,9]) == "CIV_PRESS" ): {"ADV_fnc_press"};
		default {"ADV_fnc_nil"};
	};
};

_target setVariable ["ADV_var_playerUnit",_playerUnit];
_playerUnit;