----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local map = 
{
	[313001] = {pos = { x = 140.6361, y = 0.1638422, z = -35.68009 }, mapid = 93101},
	[313002] = {pos = { x = -22.6297379, y = 9.187286, z = 44.7644119 }, mapid = 93102},
	[313003] = {pos = { x = 165.519623, y = 26.0820236, z = 64.54193 }, mapid = 93103},
	[313004] = {pos = { x = 33.5189819, y = -8.924781, z = -103.189522 }, mapid = 93104},
	[313005] = {pos = { x = -152.384689, y = 18.1046066, z = 121.036278 }, mapid = 93105},

};
function get_db_table()
	return map;
end
