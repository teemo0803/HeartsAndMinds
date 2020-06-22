if (hasInterface) then {execVM "scripts\tscheck.sqf"};
if (hasInterface) then {execVM "scripts\pilotCheck.sqf"};
//if (hasInterface) then {execVM "scripts\plot.sqf"};


#define SAFETY_ZONES [["safezone", 40]]
#define MESSAGE "注意：基地内部禁止使用武器"

if (isDedicated) exitWith {};
waitUntil {!isNull player};

//安全区
player addEventHandler ["Fired", {
    if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
    {
        deleteVehicle (_this select 6);
        titleText [MESSAGE, "PLAIN", 3];
    };
}];

