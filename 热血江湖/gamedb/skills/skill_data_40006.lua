----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local level = 
{
	[40006] = {
		[1] = {events = {{triTime = 100, }, },},
	},

};
function get_db_table()
	return level;
end
