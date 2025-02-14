----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local map = 
{
	[51001] = {pos = { x = -8.452834, y = 5.836179, z = -54.0031 }, mapid = 71001},
	[51003] = {pos = { x = -10.07216, y = 3.406951, z = -92.8902 }, mapid = 71001},
	[51004] = {pos = { x = 4.254754, y = 8.802643, z = -23.5106 }, mapid = 71001},
	[51005] = {pos = { x = -18.5253, y = 14.64021, z = 6.478608 }, mapid = 71001},
	[51006] = {pos = { x = -36.29263, y = 16.04214, z = 34.69362 }, mapid = 71001},
	[51007] = {pos = { x = 39.93885, y = 12.599, z = 0.0743541 }, mapid = 71001},
	[51051] = {pos = { x = 2.24992, y = 7.678996, z = -42.63777 }, mapid = 90},
	[51052] = {pos = { x = -20.05192, y = 3.49588, z = -81.93618 }, mapid = 90},
	[51053] = {pos = { x = -28.99221, y = 14.40305, z = 9.940607 }, mapid = 90},

};
function get_db_table()
	return map;
end
