class ADV 
{	
	tag = "ADV";
	class preInit
	{
		class parVariables { preInit = 1; };
		class missionMarkers { preInit = 1; };
		class variables { preInit = 1; };
		class sideMarkers { preInit = 1; };
		class acreSettings { preInit = 1; postInit = 1; };
		class tfarSettings { preInit = 1; postInit = 1; };
		class fhqTT {
			file = "scripts\fhqtt2.sqf";
			preInit = 1;
		};
		class init_upsmon {
			file = "scripts\Init_UPSMON.sqf";
			preInit = 1;
		};
		class credits { file = "ADV_credits.sqf";preInit = 1; };
		class tasks { file = "mission\ADV_tasks.sqf";preInit = 1; };
		class briefing { file = "mission\ADV_briefing.sqf";preInit = 1; };		
		class leaderBriefing { file = "mission\ADV_leaderBriefing.sqf"; preInit = 1; };
	};
	class server
	{
		class armedHuron {};
		class artillery {};
		class CASRun {};
		class changeVeh {};
		class createZeus {};
		class disableTI {};
		class disableVeh {};
		class disableVehSelector {};
		class flare {};
		class HCobjects {};
		class lockVeh {};
		class manageVeh { postInit = 1; };
		class nil {};
		class radioRelay {};
		class respawnVeh {};
		class rhsDecals {};
		class paraBomb {};
		class weather { postInit = 1; };
		class zeusObjects {};
	};
	class serverGear
	{
		class addACEItems {};
		class addVehicleLoad {};
		class clearCargo {};
		class crate {};
		class submarineLoad {};
		class vehicleLoad {};
	};
	class AI
	{
		class setSide {};
		class spawnPatrol {};
		class spawnAttack {};
		class upsmon {
			file = "scripts\UPSMON.sqf";
		};
	};
	class client
	{
		class aceMine {};		
		class board {};		
		class changeName {};
		class changeUnit {};
		class dialogTeleport {};
		class dispLaunch {};
		class execTeleport {};
		class flag {};
		class fullHeal {};
		class moveRespMarker {};
		class mileage {};
		class paraJump {};
		class paraJumpSelection {};
		class playerUnit {};
		class radioHeadset {};
		class rollDice {};
		class safeZone {};
		class showArtiSetting {};
		class spawnFire {};
		class teleport {};
		class undercover {};
	};
	class gear
	{
		class aceFAK {};
		class aceGear {};
		class aceGunbag {};
		class add40mm {};
		class addGPS {};
		class addGrenades {};
		class addMagazine {};
		class addRadios {};
		class applyLoadout {};
		class CSW {};
		class dialogGearInit {};
		class dialogLoadout {};
		class gear {};
		class insignia {};
		class removeWeapon {};
		class setFaction {};
		class setFrequencies {};
		class standardWeapon {};
	};
	class gearsaving
	{
		class gearloading {};
		class gearsaving {};
		class saveGear {};
		class readdGear {};
	};
	class loadouts
	{
		class AA {};
		class ABearer {};
		class AR {};
		class AT {};
		class assAA {};
		class assAR {};
		class assAT {};
		class cls {};
		class command {};
		class diver {};
		class diver_medic {};
		class diver_spec {};
		class driver {};
		class ftleader {};
		class gren {};
		class leader {};
		class lmg {};
		class log {};
		class marksman {};
		class medic {};
		class pilot {};
		class sniper {};
		class soldier {};
		class soldierAT {};
		class spec {};
		class spotter {};
		class uavOp {};
	};
	class loadouts_civ
	{
		class civ {};
		class civPilot {};
		class doc {};
		class police {};
		class press {};
	};
	class logistic
	{
		class crateAT {};
		class crateEOD {};
		class crateGrenades {};
		class crateLarge {};
		class crateMedic {};
		class crateMG {};
		class crateNormal {};
		class crateTeam {};
		class crateStuff {};
		class crateSupport {};
		class dialogLogInit {};
		class dialogLogistic {};
		class dropLogistic {};
		class emptyCrate {};
		class paraCrate {};
	};
};
class aeroson
{
	tag = "aeroson";
	class gearsaving
	{
		class gearsaving {};
		class gearloading {};
		class getloadout {};
		class setloadout {};
	};
	class cleanUp
	{
		class cleanUp {file = "scripts\repetitive_cleanup.sqf";};
	};
};
class MtB
{
	tag = "MtB";
	class randomWeather
	{
		class randomWeather {file = "scripts\randomWeather.sqf";};
	};
};
class SA
{
	tag = "SA";
	class advancedTowing
	{
		class advancedTowingInit {file = "scripts\fn_advancedTowingInit.sqf"; postInit = 1;};
	};
};
