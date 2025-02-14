----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local map = 
{
	[317001] = {pos = { x = 81.27921, y = 27.46231, z = -54.88493 }, mapid = 96001},
	[317005] = {pos = { x = 5.795868, y = 28.24279, z = -172.8591 }, mapid = 96001},
	[317007] = {pos = { x = 26.93927, y = 28.2695, z = -36.25692 }, mapid = 96001},
	[317010] = {pos = { x = 157.1033, y = 27.34424, z = -153.3654 }, mapid = 96002},
	[317012] = {pos = { x = -76.95351, y = 33.9796, z = -32.31077 }, mapid = 96002},
	[317013] = {pos = { x = 5.795868, y = 28.24279, z = -172.8591 }, mapid = 96002},
	[317015] = {pos = { x = 26.93927, y = 28.2695, z = -36.25692 }, mapid = 96002},
	[317002] = {pos = { x = 157.1033, y = 27.34424, z = -153.3654 }, mapid = 96001},
	[317003] = {pos = { x = -6.015606, y = 28.5237, z = -123.069 }, mapid = 96001},
	[317004] = {pos = { x = -76.95351, y = 33.9796, z = -32.31077 }, mapid = 96001},
	[317006] = {pos = { x = 77.01125, y = 27.27525, z = -133.6458 }, mapid = 96001},
	[317008] = {pos = { x = 95.99387, y = 26.98224, z = 87.56731 }, mapid = 96001},
	[317009] = {pos = { x = 81.27921, y = 27.46231, z = -54.88493 }, mapid = 96002},
	[317011] = {pos = { x = -6.015606, y = 28.5237, z = -123.069 }, mapid = 96002},
	[317014] = {pos = { x = 77.01125, y = 27.27525, z = -133.6458 }, mapid = 96002},
	[317016] = {pos = { x = 95.99387, y = 26.98224, z = 87.56731 }, mapid = 96002},

};
function get_db_table()
	return map;
end
