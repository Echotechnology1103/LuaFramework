----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local level = 
{
	[60003] = {
		[1] = {events = {{triTime = 125, hitEffID = 30889, hitSoundID = 10, damage = {odds = 10000, arg1 = 0.8, }, }, },},
	},

};
function get_db_table()
	return level;
end
