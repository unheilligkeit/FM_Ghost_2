﻿/*
disable Vehicles script by Belbo
disables all preplaced air and/or ground vehicles and their garage-markers.
defined in cfgFunctions (functions\server\fn_manageVeh.sqf)
Call from init.sqf (as early as possible) via:

[] call ADV_fnc_manageVeh;
*/

if (!isServer) exitWith {};

//markers for the vehicle garages:
_veh_lightMarkers = ["opf_garage_1","opf_garage_2"];
_veh_heavyMarkers = ["opf_garage_heavy_1","opf_garage_heavy_2","opf_garage_heavy_3"];
_veh_heliMarkers = ["opf_garage_air_1"];
_veh_fixedMarkers = ["opf_garage_air_2"];

//unique vehicles placed in the editor:
ADV_opf_veh_airTransport = [];
ADV_opf_veh_airRecon = [];
ADV_opf_veh_airLogistic = [];
ADV_opf_veh_airContainerMedic = ["opf_air_container_medical_1","opf_air_container_medical_2","opf_air_container_medical_3","opf_air_container_medical_4","opf_air_container_medical_5"];
ADV_opf_veh_airContainerTransport = ["opf_air_container_transport_1","opf_air_container_transport_2","opf_air_container_transport_3","opf_air_container_transport_4","opf_air_container_transport_5"];

ADV_opf_veh_airCAS = [];
ADV_opf_veh_airC130 = [];

ADV_opf_veh_MRAPs = [];
ADV_opf_veh_MRAPsHMG = [];
ADV_opf_veh_MRAPsGMG = [];
ADV_opf_veh_transport = [];
ADV_opf_veh_logistic_fuel = [];
ADV_opf_veh_logistic_ammo = [];
ADV_opf_veh_logistic_repair = [];
ADV_opf_veh_logistic_medic = [];
ADV_opf_veh_ATVs = [];
ADV_opf_veh_UAVs = [];
ADV_opf_veh_UGVs = [];
ADV_opf_veh_UGVs_repair = [];

ADV_opf_veh_heavys = [];
ADV_opf_veh_tanks = [];
ADV_opf_veh_artys = [];

///// No editing necessary below this line /////

{
	_vehicleName = str _x;
	switch ( true ) do {
		//helicopters
		case ( _vehicleName select [0,17] == "opf_air_transport" ): { ADV_opf_veh_airTransport pushBack _vehicleName; };
		case ( _vehicleName select [0,13] == "opf_air_recon" ): { ADV_opf_veh_airRecon pushBack _vehicleName; };
		case ( _vehicleName select [0,16] == "opf_air_logistic" ): { ADV_opf_veh_airLogistic pushBack _vehicleName; };
		//fixed wing planes
		case ( _vehicleName select [0,12] == "opf_air_a164" ): { ADV_opf_veh_airCAS pushBack _vehicleName; };
		case ( _vehicleName select [0,11] == "opf_air_cas" ): { ADV_opf_veh_airCAS pushBack _vehicleName; };
		case ( _vehicleName select [0,12] == "opf_air_c130" ): { ADV_opf_veh_airC130 pushBack _vehicleName; };
		//MRAPs
		case ( _vehicleName select [0,12] == "opf_MRAP_hmg" ): { ADV_opf_veh_MRAPsHMG pushBack _vehicleName; };
		case ( _vehicleName select [0,12] == "opf_MRAP_gmg" ): { ADV_opf_veh_MRAPsGMG pushBack _vehicleName; };
		case ( _vehicleName select [0,8] == "opf_MRAP" ): { ADV_opf_veh_MRAPs pushBack _vehicleName; };
		//logistics
		case ( _vehicleName select [0,7] == "opf_uav" ): { ADV_opf_veh_UAVs pushBack _vehicleName; };
		case ( _vehicleName select [0,7] == "opf_ugv" ): { ADV_opf_veh_UGVs pushBack _vehicleName; };
		case ( _vehicleName select [0,14] == "opf_ugv_repair" ): { ADV_opf_veh_UGVs_repair pushBack _vehicleName; };
		case ( _vehicleName select [0,7] == "opf_ATV" ): { ADV_opf_veh_ATVs pushBack _vehicleName; };
		case ( _vehicleName select [0,13] == "opf_transport" ): { ADV_opf_veh_transport pushBack _vehicleName; };
		case ( _vehicleName select [0,17] == "opf_logistic_fuel" ): { ADV_opf_veh_logistic_fuel pushBack _vehicleName; };
		case ( _vehicleName select [0,17] == "opf_logistic_ammo" ): { ADV_opf_veh_logistic_ammo pushBack _vehicleName; };
		case ( _vehicleName select [0,19] == "opf_logistic_repair" ): { ADV_opf_veh_logistic_repair pushBack _vehicleName; };
		case ( _vehicleName select [0,18] == "opf_logistic_medic" ): { ADV_opf_veh_logistic_medic pushBack _vehicleName; };
		//armored
		case ( _vehicleName select [0,9] == "opf_heavy" ): { ADV_opf_veh_heavys pushBack _vehicleName; };
		case ( _vehicleName select [0,8] == "opf_tank" ): { ADV_opf_veh_tanks pushBack _vehicleName; };
		case ( _vehicleName select [0,8] == "opf_arty" ): { ADV_opf_veh_artys pushBack _vehicleName; };
		default {};
	};
	nil;
} count vehicles;

ADV_opf_veh_helis = ADV_opf_veh_airLogistic+ADV_opf_veh_airTransport+ADV_opf_veh_airRecon+ADV_opf_veh_airContainerMedic+ADV_opf_veh_airContainerTransport;
ADV_opf_veh_fixedWing = ADV_opf_veh_airCAS+ADV_opf_veh_airC130+ADV_opf_veh_UAVs;
ADV_opf_veh_air = ADV_opf_veh_helis+ADV_opf_veh_fixedWing;
ADV_opf_veh_armored = ADV_opf_veh_heavys+ADV_opf_veh_tanks+ADV_opf_veh_artys;
ADV_opf_veh_car = ADV_opf_veh_MRAPS+ADV_opf_veh_MRAPsHMG+ADV_opf_veh_MRAPsGMG;
ADV_opf_veh_light = ADV_opf_veh_ATVs+ADV_opf_veh_UGVs+ADV_opf_veh_UGVs_repair+ADV_opf_veh_car+ADV_opf_veh_transport+ADV_opf_veh_logistic_fuel+ADV_opf_veh_logistic_ammo+ADV_opf_veh_logistic_repair+ADV_opf_veh_logistic_medic;

ADV_opf_veh_all = ADV_opf_veh_light+ADV_opf_veh_armored+ADV_opf_veh_air;

//removes the markers according to the lobby params
if (ADV_par_Assets_cars == 0 || ADV_par_Assets_cars == 99 || ADV_par_opfCarAssets == 99) then {
	{_x setMarkerAlpha 0;} count _veh_lightMarkers
};
if (ADV_par_Assets_tanks == 0 || ADV_par_Assets_tanks == 99 ||ADV_par_opfTankAssets == 99) then {
	{_x setMarkerAlpha 0;} count _veh_heavyMarkers;
};
if (ADV_par_Assets_air_helis == 0 || ADV_par_Assets_air_helis == 99 || ADV_par_opfHeliAssets == 99) then {
	{_x setMarkerAlpha 0;} count _veh_heliMarkers;
};
if ( (ADV_par_Assets_air_fixed == 0 && ADV_par_Assets_air_helis == 0) || (ADV_par_Assets_air_fixed == 99 && ADV_par_Assets_air_helis == 99) || ADV_par_opfAirAssets == 99) then {
	{_x setMarkerAlpha 0;} count _veh_fixedMarkers;
};

//creation of vehicle code:
adv_opf_manageVeh_codeForAll = {
	_veh = _this;
	[_veh] call ADV_fnc_clearCargo;
	[_veh] call ADV_opf_fnc_addVehicleLoad;
	[_veh] call ADV_opf_fnc_disableVehSelector;
	if (ADV_par_engineArtillery == 1 && str _veh in ADV_opf_veh_artys) then {
		[_veh] call ADV_fnc_showArtiSetting;
	};
	if (ADV_par_TIEquipment > 0) then {
		_veh disableTIEquipment true;
		if (ADV_par_TIEquipment > 2) then {
			_veh disableNVGEquipment true;
		};
	};
	if ( ADV_par_Radios > 0 && (_veh isKindOf 'CAR' || _veh isKindOf 'TANK' || _veh isKindOf 'AIR') ) then {
		_veh setVariable ['tf_hasRadio', true, true];
	};
	if (isClass(configFile >> 'CfgPatches' >> 'rhs_main')) then {
		[_veh] call ADV_opf_fnc_rhsDecals;
	};
};
//application of code:
{
	if (isNil _x) exitWith {};
	private _vehObj = missionNamespace getVariable [_x,objNull];
	_vehObj spawn adv_opf_manageVeh_codeForAll;
	[_vehObj,ADV_par_vehicleRespawn, east, (typeOf _vehObj)] spawn ADV_fnc_respawnVeh;
	nil;
} count ADV_opf_veh_all;

//replaces MRAPS with mod cars:
switch (ADV_par_opfCarAssets) do {
	//RHS UAZ
	case 1: {[ADV_opf_veh_MRAPs+ADV_opf_veh_MRAPsHMG+ADV_opf_veh_MRAPsGMG,["rhs_uaz_msv_01","rhs_uaz_open_msv_01"],east] spawn ADV_fnc_changeVeh;};
	//RHS GAZ
	case 2: {[ADV_opf_veh_MRAPs,["rhs_tigr_msv"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_MRAPsHMG+ADV_opf_veh_MRAPsGMG,["rhs_tigr_ffv_msv"],east] spawn ADV_fnc_changeVeh;};
	//RDS vehicles
	case 3: {[ADV_opf_veh_MRAPs+ADV_opf_veh_MRAPsHMG+ADV_opf_veh_MRAPsGMG,["RDS_Gaz24_Civ_01","RDS_Gaz24_Civ_02","RDS_Gaz24_Civ_03","RDS_Lada_Civ_01","RDS_Lada_Civ_02","RDS_Lada_Civ_03","RDS_Lada_Civ_04"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_ATVs,[""],east] spawn ADV_fnc_changeVeh;};
	//Apex Qilin
	case 4: {[ADV_opf_veh_MRAPs,["O_T_LSV_02_unarmed_F"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_MRAPsHMG+ADV_opf_veh_MRAPsGMG,["O_T_LSV_02_armed_F"],east] spawn ADV_fnc_changeVeh;};
	//no vehicles
	case 99: {[ADV_opf_veh_MRAPs+ADV_opf_veh_MRAPsHMG+ADV_opf_veh_MRAPsGMG+ADV_opf_veh_ATVs,[""],east] spawn ADV_fnc_changeVeh;};
	default {};
};

//replaces trucks with mod trucks:
switch (ADV_par_opfTruckAssets) do {
	//RHS
	case 1: {[ADV_opf_veh_transport,["rhs_gaz66_msv","rhs_gaz66o_msv","rhs_ural_msv_01","rhs_ural_open_msv_01"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_logistic_ammo,["rhs_gaz66_ammo_msv"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_logistic_fuel,["rhs_ural_fuel_msv_01"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_logistic_repair,["rhs_gaz66_repair_msv"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_logistic_medic,["rhs_ural_msv_01"],east] spawn ADV_fnc_changeVeh;};
	//RDS vehicles
	case 2: {[ADV_opf_veh_transport+ADV_opf_veh_logistic_medic+ADV_opf_veh_logistic_ammo+ADV_opf_veh_logistic_fuel+ADV_opf_veh_logistic_repair,["RHS_Ural_Open_Civ_01","RHS_Ural_Open_Civ_02","RHS_Ural_Open_Civ_03","RHS_Ural_Civ_01","RHS_Ural_Civ_02","RHS_Ural_Civ_03"],east] spawn ADV_fnc_changeVeh;};
	//no Trucks
	case 99: {[ADV_opf_veh_transport+ADV_opf_veh_logistic_medic+ADV_opf_veh_logistic_ammo+ADV_opf_veh_logistic_fuel+ADV_opf_veh_logistic_repair,[""],east] spawn ADV_fnc_changeVeh;};
	default {};
};

//replaces heavy vehicles with mod vehicles:
switch (ADV_par_opfHeavyAssets) do {
	//RHS BTR
	case 1: {[ADV_opf_veh_heavys,["rhs_btr80a_msv","rhs_btr80_msv","rhs_btr70_msv"],east] spawn ADV_fnc_changeVeh;};
	//RHS BMP
	case 2: {[ADV_opf_veh_heavys,["rhs_bmp1_msv","rhs_bmp1d_msv","rhs_bmp1k_msv","rhs_bmp1p_msv","rhs_bmp2_msv","rhs_bmp2d_msv","rhs_bmp2e_msv","rhs_bmp2k_msv"],east] spawn ADV_fnc_changeVeh;};
	//no vehicles
	case 99: {[ADV_opf_veh_heavys,[""],east] spawn ADV_fnc_changeVeh;};
	default {};
};

//replaces tanks with mod tanks:
switch (ADV_par_opfTankAssets) do {
	//RHS T72
	case 1: {[ADV_opf_veh_tanks,["rhs_t72ba_tv","rhs_t72bb_tv","rhs_t72bc_tv","rhs_t72bd_tv"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_artys,["rhs_d30_msv"],east] spawn ADV_fnc_changeVeh;};
	//RHS T80
	case 2: {[ADV_opf_veh_tanks,["rhs_t80a","rhs_t80b","rhs_t80bk","rhs_t80bv","rhs_t80bvk","rhs_t80u"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_artys,["rhs_2s3_tv"],east] spawn ADV_fnc_changeVeh;};	
	//RHS T90
	case 3: {[ADV_opf_veh_tanks,["rhs_t90_tv"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_artys,["rhs_2s3_tv"],east] spawn ADV_fnc_changeVeh;};	
	//RDS T34
	case 4: {[ADV_opf_veh_tanks,["RDS_T34_AAF_01"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_artys,["RDS_D30_CSAT"],east] spawn ADV_fnc_changeVeh; [ADV_opf_veh_logistic_medic,["RDS_BMP2_Ambul_01"],east] spawn ADV_fnc_changeVeh;};
	//RDS T55
	case 5: {[ADV_opf_veh_tanks,["RDS_T55_AAF_01"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_artys,["RDS_D30_CSAT"],east] spawn ADV_fnc_changeVeh; [ADV_opf_veh_logistic_medic,["RDS_BMP2_Ambul_01"],east] spawn ADV_fnc_changeVeh;};
	//no vehicles 
	case 99: {[ADV_opf_veh_tanks+ADV_opf_veh_artys,[""],east] spawn ADV_fnc_changeVeh;};
	default {};
};

//replaces helis with mod helis:
switch (ADV_par_opfHeliAssets) do {
	//RHS transport
	case 1: {[ADV_opf_veh_airTransport+ADV_opf_veh_airLogistic,["rhs_mi8amt_vvsc","rhs_mi8amt_vvs","rhs_mi8amtsh_vvsc","rhs_mi8amtsh_vvs","rhs_mi8mt_vvsc","rhs_mi8mt_vvs","rhs_mi8mtv3_vvsc","rhs_mi8mtv3_vvs"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_airRecon,["rhs_ka60_c","rhs_ka60_grey"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_airContainerMedic+ADV_opf_veh_airContainerTransport,[""],east] spawn ADV_fnc_changeVeh;};
	//RHS transport Mi24
	case 2: {[ADV_opf_veh_airTransport+ADV_opf_veh_airLogistic,["rhs_mi8amt_vvsc","rhs_mi8amt_vvs","rhs_mi8amtsh_vvsc","rhs_mi8amtsh_vvs","rhs_mi8mt_vvsc","rhs_mi8mt_vvs","rhs_mi8mtv3_vvsc","rhs_mi8mtv3_vvs"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_airRecon,["rhs_mi24p_vvs","rhs_mi24p_vvsc","rhs_mi24v_vvs","rhs_mi24v_vvsc"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_airContainerMedic+ADV_opf_veh_airContainerTransport,[""],east] spawn ADV_fnc_changeVeh;};
	//RHS transport Ka52
	case 3: {[ADV_opf_veh_airTransport+ADV_opf_veh_airLogistic,["rhs_mi8amt_vvsc","rhs_mi8amt_vvs","rhs_mi8amtsh_vvsc","rhs_mi8amtsh_vvs","rhs_mi8mt_vvsc","rhs_mi8mt_vvs","rhs_mi8mtv3_vvsc","rhs_mi8mtv3_vvs"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_airRecon,["rhs_ka52_vvsc","rhs_ka52_vvs"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_airContainerMedic+ADV_opf_veh_airContainerTransport,[""],east] spawn ADV_fnc_changeVeh;};
	//RHS CAS only
	case 4: {[ADV_opf_veh_airLogistic,["rhs_mi8amt_vvsc","rhs_mi8amt_vvs","rhs_mi8amtsh_vvsc","rhs_mi8amtsh_vvs","rhs_mi8mt_vvsc","rhs_mi8mt_vvs","rhs_mi8mtv3_vvsc","rhs_mi8mtv3_vvs"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_airTransport,["rhs_mi24p_vvs","rhs_mi24p_vvsc","rhs_mi24v_vvs","rhs_mi24v_vvsc"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_airRecon,["rhs_ka52_vvsc","rhs_ka52_vvs"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_airContainerMedic+ADV_opf_veh_airContainerTransport,[""],east] spawn ADV_fnc_changeVeh;};
	//RHS civilian
	case 5: {[ADV_opf_veh_helis,["RHS_Mi8amt_civilian"],east] spawn ADV_fnc_changeVeh;[ADV_opf_veh_airContainerMedic+ADV_opf_veh_airContainerTransport,[""],east] spawn ADV_fnc_changeVeh;};
	//no vehicles
	case 99: {[ADV_opf_veh_helis+ADV_opf_veh_airContainerMedic+ADV_opf_veh_airContainerTransport,[""],east] spawn ADV_fnc_changeVeh;};
	default {};
};

//replaces planes with mod planes:
switch (ADV_par_opfAirAssets) do {
	//Apex Xi'an
	//case 0: { [ADV_opf_veh_airC130,["O_T_VTOL_02_infantry_F"],west] spawn ADV_fnc_changeVeh; };
	//RHS SU-25
	case 1: {[ADV_opf_veh_airCAS,["RHS_Su25SM_vvsc","RHS_Su25SM_vvs"],east] spawn ADV_fnc_changeVeh;};
	//RHS Su T-50
	case 2: {[ADV_opf_veh_airCAS,["RHS_T50_vvs_generic","RHS_T50_vvs_blueonblue"],east] spawn ADV_fnc_changeVeh;};
	//JS SU35
	case 3: {[ADV_opf_veh_airCAS,["JS_JC_SU35"],east] spawn ADV_fnc_changeVeh;};
	//no planes
	case 99: {[ADV_opf_veh_airCAS,[""],east] spawn ADV_fnc_changeVeh;};
	default {};
};

if (true) exitWith { missionNamespace setVariable ["ADV_var_manageVeh_opf",true,true]; };