----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local map = 
{
	[480001] = {pos = { x = -104.8336, y = 3.571008, z = 75.10916 }, mapid = 96101},
	[480002] = {pos = { x = -24.22544, y = 8.426181, z = 78.09756 }, mapid = 96102},
	[480003] = {pos = { x = 61.33455, y = 3.174681, z = 91.09904 }, mapid = 96103},
	[480004] = {pos = { x = 77.7655, y = 3.290803, z = 51.87704 }, mapid = 96104},
	[480005] = {pos = { x = 56.92423, y = 20.79676, z = 40.64019 }, mapid = 96105},
	[480006] = {pos = { x = -30.61583, y = 17.3486, z = 23.49724 }, mapid = 96106},
	[480007] = {pos = { x = -1.321827, y = 7.682753, z = -92.64647 }, mapid = 96107},
	[480008] = {pos = { x = -95.21996, y = 8.026529, z = -21.23097 }, mapid = 96108},
	[480009] = {pos = { x = 7.49031, y = 16.17469, z = -34.48065 }, mapid = 96109},
	[480010] = {pos = { x = 122.224, y = 30.17469, z = 105.128 }, mapid = 96110},

};
function get_db_table()
	return map;
end
