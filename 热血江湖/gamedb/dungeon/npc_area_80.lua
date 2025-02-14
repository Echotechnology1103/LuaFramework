----------------- auto generate db file ------------------------
module(..., package.seeall)

local require = require

local npc_area = 
{
	[40101] = {id = 40101, pos = { x = -52.69344, y = 7.386841, z = 68.56808 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40101},
	[40102] = {id = 40102, pos = { x = -12.37208, y = 7.386841, z = 87.14568 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40102},
	[40103] = {id = 40103, pos = { x = -19.07652, y = 7.742214, z = 70.52813 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40103},
	[40104] = {id = 40104, pos = { x = 40.56725, y = 3.386841, z = 97.41497 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40104},
	[40105] = {id = 40105, pos = { x = 26.79479, y = 3.526421, z = 76.42394 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40105},
	[40106] = {id = 40106, pos = { x = 17.21814, y = 3.476947, z = 36.48492 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40106},
	[40107] = {id = 40107, pos = { x = 16.99483, y = 3.386841, z = -6.133116 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40107},
	[40108] = {id = 40108, pos = { x = 19.79492, y = 3.386841, z = -21.5231 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40108},
	[40109] = {id = 40109, pos = { x = -42.61465, y = 3.526237, z = -19.00014 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40109},
	[40110] = {id = 40110, pos = { x = -54.03222, y = 2.109405, z = -38.12651 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40110},
	[40201] = {id = 40201, pos = { x = 32.84333, y = 0.2000002, z = -101.1185 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40201},
	[40202] = {id = 40202, pos = { x = -2.361275, y = 0.1999999, z = -126.98 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40202},
	[40203] = {id = 40203, pos = { x = -67.80183, y = 0.2000002, z = -129.174 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40203},
	[40204] = {id = 40204, pos = { x = -94.69814, y = 0.2000002, z = -101.928 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40204},
	[40205] = {id = 40205, pos = { x = 2.212815, y = 5.0, z = -65.25608 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40205},
	[40206] = {id = 40206, pos = { x = 36.79586, y = 5.0, z = -46.57642 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40206},
	[40207] = {id = 40207, pos = { x = -53.48407, y = 5.056445, z = -46.83622 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40207},
	[40208] = {id = 40208, pos = { x = -98.78722, y = 7.0, z = 8.425461 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40208},
	[40209] = {id = 40209, pos = { x = 54.8776, y = 13.0, z = 21.93328 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40209},
	[40210] = {id = 40210, pos = { x = -72.75838, y = 7.093843, z = 40.87939 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40210},
	[40301] = {id = 40301, pos = { x = 97.80959, y = 3.036194, z = -75.24497 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40301},
	[40302] = {id = 40302, pos = { x = 38.77663, y = 3.080364, z = -94.63925 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40302},
	[40303] = {id = 40303, pos = { x = 2.796619, y = 3.036194, z = -42.2359 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40303},
	[40304] = {id = 40304, pos = { x = -10.24482, y = 3.036194, z = -85.38118 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40304},
	[40305] = {id = 40305, pos = { x = -71.85038, y = 6.036194, z = -49.46322 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40305},
	[40306] = {id = 40306, pos = { x = -54.52832, y = 10.23619, z = -12.20098 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40306},
	[40307] = {id = 40307, pos = { x = -32.21342, y = 13.83619, z = 80.66478 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40307},
	[40308] = {id = 40308, pos = { x = 49.05799, y = 9.236191, z = 86.15816 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40308},
	[40309] = {id = 40309, pos = { x = 81.52437, y = 9.236191, z = 60.25859 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40309},
	[40310] = {id = 40310, pos = { x = 116.1921, y = 9.406957, z = -2.759726 }, dir = { x = 0.0, y = -345.0, z = 1.0 }, NPCID = 40310},

};
function get_db_table()
	return npc_area;
end
