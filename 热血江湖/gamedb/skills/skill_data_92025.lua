----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local level = 
{
	[92025] = {
		[1] = {events = {{triTime = 100, status = {{odds = 10000, buffID = 785, }, }, }, },},
	},

};
function get_db_table()
	return level;
end
