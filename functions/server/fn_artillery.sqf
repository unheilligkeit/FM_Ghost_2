﻿/*
Based on the Artillery-Script by Nyaan (edited by Belbo)
[[target_1,target_2],"Sh_155mm_AMOS",[3,7],300,5,50] spawn ADV_fnc_artillery;
*/

params [
	["_targetArray", [], [[]]],
	["_ammoType", "Sh_155mm_AMOS", [""]],
	["_delay", [3,7], [[]]],
	["_height", 300, [0]],
	["_amount", 5, [0]],
	["_spread", 50, [0]],
	"_targetPos", "_strike", "_sound", "_soundFile"
];

{
	_target = _x;
	if (!isNil "_target") then {
		_targetPos = nil;
		for "_x" from 1 to _amount do {
			private _targetPos = call {
				if (_target isEqualType "") exitWith {
					[getMarkerPos _target select 0, getMarkerPos _target select 1, _height];
				};
				if (_target isEqualType objNull) exitWith {
					[getPosWorld _target select 0, getPosWorld _target select 1, _height];
				};
				if (_target isEqualType []) exitWith {
					[_target select 0,_target select 1, _height];
				};
				nil;
			};
			_strike = createVehicle [_ammotype, _targetPos, [], _spread, "NONE"];
			_strike allowdamage false;
			_strike setvectorup [0,9,0.1];
			_strike setvelocity [0,0,-150];
			waitUntil {((getPosATL _strike) select 2) < 300};
			_sound = selectRandom ["incoming1.wss","incoming2.wss"];
			_soundFile = format ["a3\data_f_curator\sound\cfgSounds\%1",_sound];
			playSound3D [_soundFile, _strike,false,getPos _strike, 3.3];
			sleep ((_delay select 0) + round (random ((_delay select 1) - (_delay select 0))));
		};
	};
	nil;
} count _targetArray;

if (true) exitWith {};