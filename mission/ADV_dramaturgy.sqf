if (!isServer && hasInterface) exitWith {};

if !(isServer || hasInterface) then {ADV_HCpresent = 1;};
if (isServer) then {ADV_HCpresent = 0;};
publicVariable "ADV_HCpresent";

if (isNil "ADV_taskVar") then { ADV_taskVar = 0; };
if (isNil "ADV_spawnVar") then { ADV_spawnVar = 0; };

//upsmon arrays for editor placed units (for HC-compatibility)
/*
[] spawn {
	_upsmonCalls = [
		//[opf_group_1,"area","CARELESS","LIMITED"]
	];
	if (count _upsmonCalls != 0) then {
		{_x execVM "scripts\upsmon.sqf"} forEach _upsmonCalls;
	};
};
*/

//scripts for first mission part
waitUntil {sleep 1; ADV_taskVar == 1};

[{playMusic "AmbientTrack02_F_EXP"},"BIS_fnc_spawn",true] call BIS_fnc_MP;

sleep 10;

[{["<img size='4' image='img\logo.paa'/> <br />
<t align = 'center' color='#FF8012' shadow = '1' size = '.8'>Task Force Wolf<br />
präsentiert</t>",0,0,10,10,1,789] spawn BIS_fnc_dynamicText;},"BIS_fnc_spawn",true] call BIS_fnc_MP;

sleep 20;

[{["<t align = 'center' color='#FF8012' shadow = '1' size = '.8'>eine<br />
eine TFW Mission</t>",0,0,10,10,-1,791] spawn BIS_fnc_dynamicText;},"BIS_fnc_spawn",true] call BIS_fnc_MP;

sleep 20;

[{["<t align = 'center' color='#FF8012' shadow = '1' size = '.8'>Made in<br />
Switzerland</t>",0,0,10,10,1,794] spawn BIS_fnc_dynamicText;},"BIS_fnc_spawn",true] call BIS_fnc_MP;

sleep 20;

[{["<t align = 'center' color='#FF8012' shadow = '1' size = '.8'>gebaut von<br />
TFW Florian</t>",0,0,10,10,-1,792] spawn BIS_fnc_dynamicText;},"BIS_fnc_spawn",true] call BIS_fnc_MP;

sleep 20;

[{["<t align = 'center' color='#FFF300' shadow = '1' size = '.9'>THE GHOSTS PART 2</t>",0,0,10,10,1,793] spawn BIS_fnc_dynamicText;},"BIS_fnc_spawn",true] call BIS_fnc_MP;



sleep 100;
[{playMusic "RadioAmbient2"},"BIS_fnc_spawn",true] call BIS_fnc_MP;
["Ghosts hier Hitman","hint",true,true] call BIS_fnc_MP;

sleep 5;

["Ich bin eure Taktische Unterstützung in dieser Operation.","hint",true,true] call BIS_fnc_MP;

sleep 5;

["Ghosts sie haben grünes Licht.","hint",true,true] call BIS_fnc_MP;



waitUntil {sleep 1; ADV_taskVar == 2};

[{playMusic "RadioAmbient2"},"BIS_fnc_spawn",true] call BIS_fnc_MP;
["Ghosts hier Hitman","hint",true,true] call BIS_fnc_MP;

sleep 5;

["Missions wird Abgebrochen","hint",true,true] call BIS_fnc_MP;

sleep 5;

["Ich widerhole Missionabruch.","hint",true,true] call BIS_fnc_MP;
[["task_1", "canceled"],"FHQ_TT_setTaskState",false] call BIS_fnc_MP;
sleep 5;

["Wir haben ein Notfall Auftrag für sie.","hint",true,true] call BIS_fnc_MP;

sleep 5;

["Infos werden jetzt übertragen","hint",true,true] call BIS_fnc_MP;
[[{true},["task_2","Begeben sie sich so schnell wie möglich nach Savu und beschaffen sich Wasserfahrzeuge .","Wasserfahrzeuge beschaffen","Wasserfahrzeuge beschaffen",(getMarkerPos "marker1"),"assigned"]],"FHQ_TT_addTasks",false] call BIS_fnc_MP;

sleep 5;

["Briefing bekommen sie unterwegs.","hint",true,true] call BIS_fnc_MP;
[[{true},["task_3","Der Makana Wirtschafts Gipfel wird angegriffen sorgen sie für Ordnung und Sicherheit.","Wirtschaftsgipfel wird Angegriffen","Wirtschaftsgipfel wird Angegriffen",(getMarkerPos "marker2"),"assigned"]],"FHQ_TT_addTasks",false] call BIS_fnc_MP;







waitUntil {sleep 1; ADV_taskVar == 3};

[{t1 say "club"},"BIS_fnc_spawn",true] call BIS_fnc_MP;




waitUntil {sleep 1; ADV_taskVar == 4};


	[["fm_schuetze_china","fm_grenadier_china"],east,50,["LIMITED","CARELESS","STAG COLUMN"],[sp1,sp2,sp3,sp4,sp5,sp6,sp7,sp8,sp9,sp10,sp11,sp12]] call ADV_fnc_spawnPatrol;

sleep 2;

[{playMusic "RadioAmbient2"},"BIS_fnc_spawn",true] call BIS_fnc_MP;
["Ghosts hier Hitman","hint",true,true] call BIS_fnc_MP;

sleep 5;

["Wir haben bestätigte Infos das lokale Sicherheitskräfte alle Tot sind.","hint",true,true] call BIS_fnc_MP;

sleep 5;

["Der Wirtschaftsgipfel war gut bewacht das können keine Rebellen sein.","hint",true,true] call BIS_fnc_MP;


waitUntil {sleep 1; ADV_taskVar == 5};

[{playMusic "LeadTrack02_F_Mark"},"BIS_fnc_spawn",true] call BIS_fnc_MP;
sleep 10;
[["task_3", "succeeded"],"FHQ_TT_setTaskState",false] call BIS_fnc_MP;
sleep 20;
["End2",true,8] remoteExec ["BIS_fnc_endMission",0];


//scripts for following mission parts
ADV_handle_dramaturgy_1 = [] spawn {
	/*
	private _code_1 = {};
	[{CONDITION}, _code_1, [PARAMS]] call CBA_fnc_waitUntilAndExecute;
	*/
};

//mission end:
ADV_handle_dramaturgy_end = [] spawn {
	waitUntil {sleep 1; ADV_taskVar == 99};
	["task_1", "succeeded"] remoteExec ["FHQ_TT_setTaskState",2];
	sleep 20;
	["End2",true,8] remoteExec ["BIS_fnc_endMission",0];
};

/*
//possible spawn calls:
[["O_Soldier_TL_F","O_Soldier_GL_F","O_Soldier_F","O_soldier_AR_F","O_medic_F"],east,50,["LIMITED","CARELESS","STAG COLUMN"],[spawnLogic_1]] call ADV_fnc_spawnPatrol;
//or:
[["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_F","I_soldier_GL_F","I_medic_F"],independent,50,["LIMITED","CARELESS","STAG COLUMN"],[spawnLogic_1,spawnLogic_2],"area_1"] call ADV_fnc_spawnPatrol;
or:
[["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_F","I_soldier_GL_F","I_medic_F"],independent,50,[spawnLogic_1],attackLogic_1] call ADV_fnc_spawnAttack;
//for calling custom loadouts on last group spawned (just add one spawnLogic/Marker):
_grp = [["B_Sniper_F","B_Spotter_F"],west,200,["LIMITED","STAG COLUMN","NOFOLLOW"],[spawnLogic_1]] call ADV_fnc_spawnPatrol;
[(units _grp) select 0] call ADV_fnc_sniper;
[(units _grp) select 1] call ADV_fnc_spotter;
//for adding new tasks, create a new case in ADV_tasks.sqf, a new task within this case and call like this:
[2] remoteExec ["ADV_fnc_tasks",2];
*/

if (true) exitWith {};