----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local level = 
{
	[99052] = {
		[1] = {events = {{triTime = 450, hitEffID = 30082, hitSoundID = 10, damage = {odds = 10000, arg1 = 2.0, }, }, },},
	},

};
function get_db_table()
	return level;
end
