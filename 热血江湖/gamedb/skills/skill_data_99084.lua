----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local level = 
{
	[99084] = {
		[1] = {events = {{triTime = 700, hitEffID = 30992, hitSoundID = 10, damage = {odds = 10000, arg1 = 1.0, }, }, },},
	},

};
function get_db_table()
	return level;
end
