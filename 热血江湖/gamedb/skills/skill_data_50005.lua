----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local level = 
{
	[50005] = {
		[1] = {events = {{triTime = 100, hitEffID = 30091, hitSoundID = 10, damage = {odds = 10000, arg1 = 0.4, }, }, },},
	},

};
function get_db_table()
	return level;
end
