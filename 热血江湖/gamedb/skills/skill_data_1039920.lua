----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local level = 
{
	[1039920] = {
		[1] = {cool = 5000, events = {},},
	},

};
function get_db_table()
	return level;
end
