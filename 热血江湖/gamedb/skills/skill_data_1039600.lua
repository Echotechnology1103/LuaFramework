----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local level = 
{
	[1039601] = {
		[1] = {cool = 5000, events = {},},
	},
	[1039602] = {
		[1] = {cool = 5000, events = {},},
	},

};
function get_db_table()
	return level;
end
