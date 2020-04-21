
/* ----------------------------------------------------------------------------
Function: btc_fnc_tow_ViV

Description:
    Tow a vehicle.

Parameters:
    _tower - Vehicle. [Object]

Returns:
    _thisId - ID of the event handler. [Number]

Examples:
    (begin example)
        [cursorObject] call btc_fnc_tow_ViV;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_vehicle_selected", objNull, [objNull]],
    ["_tower", objNull, [objNull]]
];

private _hideVehicle = createVehicle [typeOf _vehicle_selected, _vehicle_selected, [], 0, "CAN_COLLIDE"];
_hideVehicle hideObjectGlobal true;
_vehicle_selected attachTo [_hideVehicle, [0, 0, 0]];

if !(_tower setVehicleCargo _hideVehicle) then {
	deleteVehicle _hideVehicle;
};