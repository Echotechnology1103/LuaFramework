----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local spawn_area = 
{
	[99200] = {	id = 99200, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130200,  } , spawndeny = 0 },
	[99201] = {	id = 99201, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130201,  } , spawndeny = 0 },
	[99202] = {	id = 99202, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130202,  } , spawndeny = 0 },
	[99203] = {	id = 99203, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130203,  } , spawndeny = 0 },
	[99204] = {	id = 99204, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130204,  } , spawndeny = 0 },
	[99205] = {	id = 99205, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130205,  } , spawndeny = 0 },
	[99206] = {	id = 99206, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130206,  } , spawndeny = 0 },
	[99207] = {	id = 99207, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130207,  } , spawndeny = 0 },
	[99208] = {	id = 99208, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130208,  } , spawndeny = 0 },
	[99209] = {	id = 99209, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130209,  } , spawndeny = 0 },
	[99210] = {	id = 99210, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130210,  } , spawndeny = 0 },
	[99211] = {	id = 99211, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130211,  } , spawndeny = 0 },
	[99212] = {	id = 99212, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130212,  } , spawndeny = 0 },
	[99213] = {	id = 99213, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130213,  } , spawndeny = 0 },
	[99214] = {	id = 99214, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130214,  } , spawndeny = 0 },
	[99215] = {	id = 99215, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130215,  } , spawndeny = 0 },
	[99216] = {	id = 99216, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130216,  } , spawndeny = 0 },
	[99217] = {	id = 99217, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130217,  } , spawndeny = 0 },
	[99218] = {	id = 99218, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130218,  } , spawndeny = 0 },
	[99219] = {	id = 99219, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130219,  } , spawndeny = 0 },
	[99220] = {	id = 99220, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130220,  } , spawndeny = 0 },
	[99221] = {	id = 99221, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130221,  } , spawndeny = 0 },
	[99222] = {	id = 99222, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130222,  } , spawndeny = 0 },
	[99223] = {	id = 99223, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130223,  } , spawndeny = 0 },
	[99224] = {	id = 99224, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130224,  } , spawndeny = 0 },
	[99225] = {	id = 99225, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130225,  } , spawndeny = 0 },
	[99226] = {	id = 99226, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130226,  } , spawndeny = 0 },
	[99227] = {	id = 99227, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130227,  } , spawndeny = 0 },
	[99228] = {	id = 99228, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130228,  } , spawndeny = 0 },
	[99229] = {	id = 99229, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130229,  } , spawndeny = 0 },
	[99230] = {	id = 99230, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130230,  } , spawndeny = 0 },
	[99231] = {	id = 99231, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130231,  } , spawndeny = 0 },
	[99232] = {	id = 99232, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130232,  } , spawndeny = 0 },
	[99233] = {	id = 99233, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130233,  } , spawndeny = 0 },
	[99234] = {	id = 99234, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130234,  } , spawndeny = 0 },
	[99235] = {	id = 99235, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130235,  } , spawndeny = 0 },
	[99236] = {	id = 99236, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130236,  } , spawndeny = 0 },
	[99237] = {	id = 99237, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130237,  } , spawndeny = 0 },
	[99238] = {	id = 99238, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130238,  } , spawndeny = 0 },
	[99239] = {	id = 99239, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130239,  } , spawndeny = 0 },
	[99240] = {	id = 99240, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130240,  } , spawndeny = 0 },
	[99241] = {	id = 99241, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130241,  } , spawndeny = 0 },
	[99242] = {	id = 99242, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130242,  } , spawndeny = 0 },
	[99243] = {	id = 99243, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130243,  } , spawndeny = 0 },
	[99244] = {	id = 99244, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130244,  } , spawndeny = 0 },
	[99245] = {	id = 99245, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130245,  } , spawndeny = 0 },
	[99246] = {	id = 99246, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130246,  } , spawndeny = 0 },
	[99247] = {	id = 99247, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130247,  } , spawndeny = 0 },
	[99248] = {	id = 99248, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130248,  } , spawndeny = 0 },
	[99249] = {	id = 99249, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130249,  } , spawndeny = 0 },
	[99250] = {	id = 99250, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130250,  } , spawndeny = 0 },
	[99251] = {	id = 99251, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130251,  } , spawndeny = 0 },
	[99252] = {	id = 99252, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130252,  } , spawndeny = 0 },
	[99253] = {	id = 99253, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130253,  } , spawndeny = 0 },
	[99254] = {	id = 99254, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130254,  } , spawndeny = 0 },
	[99255] = {	id = 99255, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130255,  } , spawndeny = 0 },
	[99256] = {	id = 99256, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130256,  } , spawndeny = 0 },
	[99257] = {	id = 99257, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130257,  } , spawndeny = 0 },
	[99258] = {	id = 99258, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130258,  } , spawndeny = 0 },
	[99259] = {	id = 99259, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130259,  } , spawndeny = 0 },
	[99260] = {	id = 99260, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130260,  } , spawndeny = 0 },
	[99261] = {	id = 99261, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130261,  } , spawndeny = 0 },
	[99262] = {	id = 99262, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130262,  } , spawndeny = 0 },
	[99263] = {	id = 99263, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130263,  } , spawndeny = 0 },
	[99264] = {	id = 99264, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130264,  } , spawndeny = 0 },
	[99265] = {	id = 99265, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130265,  } , spawndeny = 0 },
	[99266] = {	id = 99266, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130266,  } , spawndeny = 0 },
	[99267] = {	id = 99267, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130267,  } , spawndeny = 0 },
	[99268] = {	id = 99268, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130268,  } , spawndeny = 0 },
	[99269] = {	id = 99269, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130269,  } , spawndeny = 0 },
	[99270] = {	id = 99270, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130270,  } , spawndeny = 0 },
	[99271] = {	id = 99271, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130271,  } , spawndeny = 0 },
	[99272] = {	id = 99272, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130272,  } , spawndeny = 0 },
	[99273] = {	id = 99273, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130273,  } , spawndeny = 0 },
	[99274] = {	id = 99274, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130274,  } , spawndeny = 0 },
	[99275] = {	id = 99275, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130275,  } , spawndeny = 0 },
	[99276] = {	id = 99276, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130276,  } , spawndeny = 0 },
	[99277] = {	id = 99277, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130277,  } , spawndeny = 0 },
	[99278] = {	id = 99278, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130278,  } , spawndeny = 0 },
	[99279] = {	id = 99279, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130279,  } , spawndeny = 0 },
	[99280] = {	id = 99280, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130280,  } , spawndeny = 0 },
	[99281] = {	id = 99281, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130281,  } , spawndeny = 0 },
	[99282] = {	id = 99282, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130282,  } , spawndeny = 0 },
	[99283] = {	id = 99283, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130283,  } , spawndeny = 0 },
	[99284] = {	id = 99284, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130284,  } , spawndeny = 0 },
	[99285] = {	id = 99285, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130285,  } , spawndeny = 0 },
	[99286] = {	id = 99286, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130286,  } , spawndeny = 0 },
	[99287] = {	id = 99287, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130287,  } , spawndeny = 0 },
	[99288] = {	id = 99288, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130288,  } , spawndeny = 0 },
	[99289] = {	id = 99289, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130289,  } , spawndeny = 0 },
	[99290] = {	id = 99290, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130290,  } , spawndeny = 0 },
	[99291] = {	id = 99291, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130291,  } , spawndeny = 0 },
	[99292] = {	id = 99292, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130292,  } , spawndeny = 0 },
	[99293] = {	id = 99293, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130293,  } , spawndeny = 0 },
	[99294] = {	id = 99294, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130294,  } , spawndeny = 0 },
	[99295] = {	id = 99295, range = 750.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130295,  } , spawndeny = 0 },
	[99296] = {	id = 99296, range = 500.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130296,  } , spawndeny = 0 },
	[99297] = {	id = 99297, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130297,  } , spawndeny = 0 },
	[99298] = {	id = 99298, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130298,  } , spawndeny = 0 },
	[99299] = {	id = 99299, range = 1000.0, obstacle = { valid = 0 }, BeginOpen = {  }, BeginClose = {  }, EndOpen = {  }, EndClose = {  }, spawnPoints = { 130299,  } , spawndeny = 0 },

};
function get_db_table()
	return spawn_area;
end
