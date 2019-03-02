/*/
File: fn_getWeekday.sqf
Author:

	[bbs] with snippets from Grumpy Old Man and Quicksilver
	This is based on an algorithm found here: https://blog.artofmemory.com/how-to-calculate-the-day-of-the-week-4203.html
	This is hard coded to support 2000 thru 2099 only, I'll be dead before this expires.
	
Last Modified:
	
	3/1/2019 ArmA 3 1.83 by [bbs]
	
Description:

	Get Day of Week
____________________________________________________/*/

params [['_date',date],['_type','SHORT']];
_date params ['_year','_m','_q'];
_yeararray = _year call (missionNamespace getVariable 'BIS_fnc_numberDigits');
_yeararray params ['_y0','_y1','_y2','_y3'];
_K = (_y2 * 10) + _y3;
_Month = (_m - 1);
_MArray = [0,3,3,6,1,4,6,2,5,0,3,5];
_YCode = ((_K + floor (_K/4)) mod 7);
_MCode = (_MArray select _Month);
_CCode = 6;
_LYCode = 0;
if ((_K mod 4) isEqualTo 0) then { _LYCode = 1 };
_DCode = ((_YCode + _MCode + _CCode + _q -_LYCode) mod 7);
_dayNames = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
if (_type isEqualTo 'SHORT') exitwith {((_dayNames select _DCode) select [0,3])};
(_dayNames select _DCode);
