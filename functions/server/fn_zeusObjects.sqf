﻿/*
zeus script by Belbo
Makes most units placed in the editor and playable units editable by Zeus.
Call from init.sqf via:
if (isServer) then {[CURATORMODULENAME] spawn compile preprocessFileLineNumbers "fn_zeus.sqf";};
or:
if (isServer) then {[] spawn compile preprocessFileLineNumbers "fn_zeus.sqf";};
*/

if (!isServer) exitWith {};

params [
	["_curator", true, [true, objNull]]
];

//makes all units continuously available to Zeus (for respawning players and AI that's being spawned by a script.)
switch (typeName _curator) do {
	case "OBJECT": {
		//adds objects placed in editor:
		_curator addCuratorEditableObjects [vehicles,true];
		_curator addCuratorEditableObjects [(entities "Man"), false];
		_curator addCuratorEditableObjects [(entities "Air"), false];
		_curator addCuratorEditableObjects [(entities "Ammo"), false];
		//makes all units continuously available to Zeus (for respawning players and AI that's being spawned by a script.)
		while {true} do {
			_curatorUnit = getAssignedCuratorUnit _curator;
			if (!isNil "_curatorUnit") then {
				_curator addCuratorEditableObjects [allUnits, false];
				_curator addCuratorEditableObjects [vehicles, true];
			};
			sleep 5;
		};
	};
	default {
		{
			_x addCuratorEditableObjects [vehicles,true];
			_x addCuratorEditableObjects [(entities "Man"), false];
			_x addCuratorEditableObjects [(entities "Air"), false];
			_x addCuratorEditableObjects [(entities "Ammo"), false];
			nil;
		} count allCurators;
		while {true} do {
			{
				if ( !isNull (getAssignedCuratorUnit _x) ) then {
					_x addCuratorEditableObjects [allUnits, false];
					_x addCuratorEditableObjects [vehicles, true];
					/*
					_bluforUnits = [];
					{ if ( side (group _x) == west ) then { _bluforUnits pushBack _x }; nil; } count allUnits;
					_x addCuratorEditableObjects [_bluforUnits,true];
					*/
				};
			} count allCurators;
			sleep 5;
		};
	};
};

if (true) exitWith {};