//for inserting a marker: <marker name='MARKER'>TEXT</marker>
_task = [_this,0,0] call BIS_fnc_param;

switch (_task) do {
	case 1: {
	};
	default {
		[
			{true},
				[
					"task_1", 							//TaskName.
					"Durch Infos von der Bevölkerung konnten wir ein weiters Waffenlager ausfindig machen dies gilt es zu zerstören.", 					//Task Long Description - en detail.
					"Waffenlager Zerstören",					//Task Short Description - Titel der Aufgabe.
					"Waffenlager Zerstören", 								//Task WayPoint Description - Wird als Floating Text auf dem Waypoint der Task angezeigt.
					"", 								//Target - beispielsweise ein Objekt oder ein Marker (format: (getMarkerpos "respawn_west") or OBJECTNAME)
					"assigned"							//initial task state. "created", "assigned", "succeeded", "failed", "canceled".
				]
		] call FHQ_TT_addTasks;
	};
};

if (true) exitWith {};