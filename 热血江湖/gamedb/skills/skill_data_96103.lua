----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local level = 
{
	[96103] = {
		[1] = {cool = 2000, events = {{triTime = 1, hitEffID = 30916, damage = {odds = 10000, arg1 = 1.0, }, status = {{odds = 3000, buffID = 130002, }, }, }, },},
	},

};
function get_db_table()
	return level;
end
