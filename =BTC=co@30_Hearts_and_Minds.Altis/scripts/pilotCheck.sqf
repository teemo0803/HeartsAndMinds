// Original pilotcheck by Kamaradski [AW]. 
// Since then been tweaked by many hands!
// Notable contributors: chucky [allFPS], Quiksilver.
// Latest modified by S034

_pilots = ["B_Helipilot_F","B_officer_F","B_Pilot_F"];//飞行员类别名，不为空，随便填则代表只有白名单可飞
_aircraft_nocopilot = ["RHS_MELB_MH6M"];

waitUntil {player == player};

_iampilot = ({typeOf player == _x} count _pilots) > 0;

/* Remove comments and insert UIDs into the whitelist to exempt individuals from this script */
_uid = getPlayerUID player;
_whitelist = [""];//"76561198342036539","76561198309768861"

if (_uid in _whitelist) exitWith {};

while { true } do {
	_oldvehicle = vehicle player;
	_oldcopilot = _oldvehicle turretUnit [0];
	_oldpilot = driver _oldvehicle;
	waitUntil {(vehicle player != _oldvehicle)||!(_oldcopilot isequalto ((vehicle player) turretUnit [0]))||!(_oldpilot isequalto (driver (vehicle player)))};

	if(vehicle player != player) then {
		_veh = vehicle player;

		//------------------------------ pilot can be pilot seat only
		
		if((_veh isKindOf "Helicopter" || _veh isKindOf "Plane") && !(_veh isKindOf "ParachuteBase")) then {
			_forbidden = [driver _veh,_veh turretUnit [0]];
			if(player in _forbidden) then {
				if (!_iampilot) then {
					hint "只有飞行员进入飞机正副驾驶位";
					player action ["getOut",_veh];
				};
			};
		};
		if(!(_veh isKindOf "Helicopter" || _veh isKindOf "Plane")&& !(_veh isKindOf "Quadbike_01_base_F")) then {
			_forbidden = [driver _veh];
			if(player in _forbidden) then {
				if(_iampilot) then {
					hint "飞行员不允许驾驶地面载具";
					player action ["getOut", _veh];
				};
			};
		};
	};
};