

---@classdef record_treasure_fragment_info
local record_treasure_fragment_info = {}
  
record_treasure_fragment_info.id = 0 --碎片id  
record_treasure_fragment_info.name = "" --碎片名称  
record_treasure_fragment_info.res_id = 0 --碎片图标id  
record_treasure_fragment_info.treasure_id = 0 --关联宝物ID  
record_treasure_fragment_info.star = 0 --碎片星级  
record_treasure_fragment_info.npc_probability = 0 --npc抢夺概率  
record_treasure_fragment_info.player_probability = 0 --玩家抢夺概率基数  
record_treasure_fragment_info.directions = "" --碎片描述  
record_treasure_fragment_info.quality = 0 --碎片品质  
record_treasure_fragment_info.compose_id = 0 --关联合成ID  
record_treasure_fragment_info.gm = 0 --GM后台是否可发


treasure_fragment_info = {
   _data = {
    [1] = {1011,"司马法碎片一",220011,101,3,750,1000,"收集所有三片司马法碎片，可以合成宝物司马法",3,101,1,},
    [2] = {1012,"司马法碎片二",220012,101,3,750,1000,"收集所有三片司马法碎片，可以合成宝物司马法",3,101,1,},
    [3] = {1013,"司马法碎片三",220013,101,3,750,1000,"收集所有三片司马法碎片，可以合成宝物司马法",3,101,1,},
    [4] = {1021,"火鼠印碎片一",220021,102,3,750,1000,"收集所有三片火鼠印碎片，可以合成宝物火鼠印",3,102,1,},
    [5] = {1022,"火鼠印碎片二",220022,102,3,750,1000,"收集所有三片火鼠印碎片，可以合成宝物火鼠印",3,102,1,},
    [6] = {1023,"火鼠印碎片三",220023,102,3,750,1000,"收集所有三片火鼠印碎片，可以合成宝物火鼠印",3,102,1,},
    [7] = {1031,"三略碎片一",220211,103,3,750,1000,"收集所有三片三略碎片，可以合成宝物三略",3,103,1,},
    [8] = {1032,"三略碎片二",220212,103,3,750,1000,"收集所有三片三略碎片，可以合成宝物三略",3,103,1,},
    [9] = {1033,"三略碎片三",220213,103,3,750,1000,"收集所有三片三略碎片，可以合成宝物三略",3,103,1,},
    [10] = {1041,"嬴鱼印碎片一",220221,104,3,750,1000,"收集所有三片嬴鱼印碎片，可以合成宝物嬴鱼印",3,104,1,},
    [11] = {1042,"嬴鱼印碎片二",220222,104,3,750,1000,"收集所有三片嬴鱼印碎片，可以合成宝物嬴鱼印",3,104,1,},
    [12] = {1043,"嬴鱼印碎片三",220223,104,3,750,1000,"收集所有三片嬴鱼印碎片，可以合成宝物嬴鱼印",3,104,1,},
    [13] = {2011,"孙子兵法碎片一",220031,201,4,250,500,"收集所有四片孙子兵法碎片，可以合成宝物孙子兵法",4,201,1,},
    [14] = {2012,"孙子兵法碎片二",220032,201,4,250,500,"收集所有四片孙子兵法碎片，可以合成宝物孙子兵法",4,201,1,},
    [15] = {2013,"孙子兵法碎片三",220033,201,4,250,500,"收集所有四片孙子兵法碎片，可以合成宝物孙子兵法",4,201,1,},
    [16] = {2014,"孙子兵法碎片四",220034,201,4,250,500,"收集所有四片孙子兵法碎片，可以合成宝物孙子兵法",4,201,1,},
    [17] = {2021,"天马印碎片一",220041,202,4,250,500,"收集所有四片天马印碎片，可以合成宝物天马印",4,202,1,},
    [18] = {2022,"天马印碎片二",220042,202,4,250,500,"收集所有四片天马印碎片，可以合成宝物天马印",4,202,1,},
    [19] = {2023,"天马印碎片三",220043,202,4,250,500,"收集所有四片天马印碎片，可以合成宝物天马印",4,202,1,},
    [20] = {2024,"天马印碎片四",220044,202,4,250,500,"收集所有四片天马印碎片，可以合成宝物天马印",4,202,1,},
    [21] = {2031,"吴子兵书碎片一",220231,203,4,250,500,"收集所有四片吴子兵书碎片，可以合成宝物吴子兵书",4,203,1,},
    [22] = {2032,"吴子兵书碎片二",220232,203,4,250,500,"收集所有四片吴子兵书碎片，可以合成宝物吴子兵书",4,203,1,},
    [23] = {2033,"吴子兵书碎片三",220233,203,4,250,500,"收集所有四片吴子兵书碎片，可以合成宝物吴子兵书",4,203,1,},
    [24] = {2034,"吴子兵书碎片四",220234,203,4,250,500,"收集所有四片吴子兵书碎片，可以合成宝物吴子兵书",4,203,1,},
    [25] = {2041,"腾蛇印碎片一",220241,204,4,250,500,"收集所有四片腾蛇印碎片，可以合成宝物腾蛇印",4,204,1,},
    [26] = {2042,"腾蛇印碎片二",220242,204,4,250,500,"收集所有四片腾蛇印碎片，可以合成宝物腾蛇印",4,204,1,},
    [27] = {2043,"腾蛇印碎片三",220243,204,4,250,500,"收集所有四片腾蛇印碎片，可以合成宝物腾蛇印",4,204,1,},
    [28] = {2044,"腾蛇印碎片四",220244,204,4,250,500,"收集所有四片腾蛇印碎片，可以合成宝物腾蛇印",4,204,1,},
    [29] = {3011,"太平要术碎片一",220051,301,5,150,300,"收集所有五片太平要术碎片，可以合成宝物太平要术",5,301,1,},
    [30] = {3012,"太平要术碎片二",220052,301,5,150,300,"收集所有五片太平要术碎片，可以合成宝物太平要术",5,301,1,},
    [31] = {3013,"太平要术碎片三",220053,301,5,150,300,"收集所有五片太平要术碎片，可以合成宝物太平要术",5,301,1,},
    [32] = {3014,"太平要术碎片四",220054,301,5,150,300,"收集所有五片太平要术碎片，可以合成宝物太平要术",5,301,1,},
    [33] = {3015,"太平要术碎片五",220055,301,5,150,300,"收集所有五片太平要术碎片，可以合成宝物太平要术",5,301,1,},
    [34] = {3021,"朱雀印碎片一",220061,302,5,150,300,"收集所有五片朱雀印碎片，可以合成宝物朱雀印",5,302,1,},
    [35] = {3022,"朱雀印碎片二",220062,302,5,150,300,"收集所有五片朱雀印碎片，可以合成宝物朱雀印",5,302,1,},
    [36] = {3023,"朱雀印碎片三",220063,302,5,150,300,"收集所有五片朱雀印碎片，可以合成宝物朱雀印",5,302,1,},
    [37] = {3024,"朱雀印碎片四",220064,302,5,150,300,"收集所有五片朱雀印碎片，可以合成宝物朱雀印",5,302,1,},
    [38] = {3025,"朱雀印碎片五",220065,302,5,150,300,"收集所有五片朱雀印碎片，可以合成宝物朱雀印",5,302,1,},
    [39] = {3031,"太公兵法碎片一",220251,303,5,150,300,"收集所有五片太公兵法碎片，可以合成宝物太公兵法",5,303,1,},
    [40] = {3032,"太公兵法碎片二",220252,303,5,150,300,"收集所有五片太公兵法碎片，可以合成宝物太公兵法",5,303,1,},
    [41] = {3033,"太公兵法碎片三",220253,303,5,150,300,"收集所有五片太公兵法碎片，可以合成宝物太公兵法",5,303,1,},
    [42] = {3034,"太公兵法碎片四",220254,303,5,150,300,"收集所有五片太公兵法碎片，可以合成宝物太公兵法",5,303,1,},
    [43] = {3035,"太公兵法碎片五",220255,303,5,150,300,"收集所有五片太公兵法碎片，可以合成宝物太公兵法",5,303,1,},
    [44] = {3041,"玄武印碎片一",220261,304,5,150,300,"收集所有五片玄武印碎片，可以合成宝物玄武印",5,304,1,},
    [45] = {3042,"玄武印碎片二",220262,304,5,150,300,"收集所有五片玄武印碎片，可以合成宝物玄武印",5,304,1,},
    [46] = {3043,"玄武印碎片三",220263,304,5,150,300,"收集所有五片玄武印碎片，可以合成宝物玄武印",5,304,1,},
    [47] = {3044,"玄武印碎片四",220264,304,5,150,300,"收集所有五片玄武印碎片，可以合成宝物玄武印",5,304,1,},
    [48] = {3045,"玄武印碎片五",220265,304,5,150,300,"收集所有五片玄武印碎片，可以合成宝物玄武印",5,304,1,},
    [49] = {4011,"孟德新书碎片一",220071,401,6,100,200,"收集所有六片孟德新书碎片，可以合成宝物孟德新书",6,401,1,},
    [50] = {4012,"孟德新书碎片二",220072,401,6,100,200,"收集所有六片孟德新书碎片，可以合成宝物孟德新书",6,401,1,},
    [51] = {4013,"孟德新书碎片三",220073,401,6,100,200,"收集所有六片孟德新书碎片，可以合成宝物孟德新书",6,401,1,},
    [52] = {4014,"孟德新书碎片四",220074,401,6,100,200,"收集所有六片孟德新书碎片，可以合成宝物孟德新书",6,401,1,},
    [53] = {4015,"孟德新书碎片五",220075,401,6,100,200,"收集所有六片孟德新书碎片，可以合成宝物孟德新书",6,401,1,},
    [54] = {4016,"孟德新书碎片六",220076,401,6,100,200,"收集所有六片孟德新书碎片，可以合成宝物孟德新书",6,401,1,},
    [55] = {4021,"猛虎印碎片一",220271,402,6,100,200,"收集所有六片猛虎印碎片，可以合成宝物猛虎印",6,402,1,},
    [56] = {4022,"猛虎印碎片二",220272,402,6,100,200,"收集所有六片猛虎印碎片，可以合成宝物猛虎印",6,402,1,},
    [57] = {4023,"猛虎印碎片三",220273,402,6,100,200,"收集所有六片猛虎印碎片，可以合成宝物猛虎印",6,402,1,},
    [58] = {4024,"猛虎印碎片四",220274,402,6,100,200,"收集所有六片猛虎印碎片，可以合成宝物猛虎印",6,402,1,},
    [59] = {4025,"猛虎印碎片五",220275,402,6,100,200,"收集所有六片猛虎印碎片，可以合成宝物猛虎印",6,402,1,},
    [60] = {4026,"猛虎印碎片六",220276,402,6,100,200,"收集所有六片猛虎印碎片，可以合成宝物猛虎印",6,402,1,},
    [61] = {4031,"鬼谷子碎片一",220281,403,6,100,200,"收集所有六片鬼谷子碎片，可以合成宝物鬼谷子",6,403,1,},
    [62] = {4032,"鬼谷子碎片二",220282,403,6,100,200,"收集所有六片鬼谷子碎片，可以合成宝物鬼谷子",6,403,1,},
    [63] = {4033,"鬼谷子碎片三",220283,403,6,100,200,"收集所有六片鬼谷子碎片，可以合成宝物鬼谷子",6,403,1,},
    [64] = {4034,"鬼谷子碎片四",220284,403,6,100,200,"收集所有六片鬼谷子碎片，可以合成宝物鬼谷子",6,403,1,},
    [65] = {4035,"鬼谷子碎片五",220285,403,6,100,200,"收集所有六片鬼谷子碎片，可以合成宝物鬼谷子",6,403,1,},
    [66] = {4036,"鬼谷子碎片六",220286,403,6,100,200,"收集所有六片鬼谷子碎片，可以合成宝物鬼谷子",6,403,1,},
    [67] = {4041,"麒麟印碎片一",220291,404,6,100,200,"收集所有六片麒麟印碎片，可以合成宝物麒麟印",6,404,1,},
    [68] = {4042,"麒麟印碎片二",220292,404,6,100,200,"收集所有六片麒麟印碎片，可以合成宝物麒麟印",6,404,1,},
    [69] = {4043,"麒麟印碎片三",220293,404,6,100,200,"收集所有六片麒麟印碎片，可以合成宝物麒麟印",6,404,1,},
    [70] = {4044,"麒麟印碎片四",220294,404,6,100,200,"收集所有六片麒麟印碎片，可以合成宝物麒麟印",6,404,1,},
    [71] = {4045,"麒麟印碎片五",220295,404,6,100,200,"收集所有六片麒麟印碎片，可以合成宝物麒麟印",6,404,1,},
    [72] = {4046,"麒麟印碎片六",220296,404,6,100,200,"收集所有六片麒麟印碎片，可以合成宝物麒麟印",6,404,1,},
    [73] = {5011,"遁甲天书碎片一",220091,501,7,50,100,"收集所有六片遁甲天书碎片，可以合成宝物遁甲天书",7,501,1,},
    [74] = {5012,"遁甲天书碎片二",220092,501,7,50,100,"收集所有六片遁甲天书碎片，可以合成宝物遁甲天书",7,501,1,},
    [75] = {5013,"遁甲天书碎片三",220093,501,7,50,100,"收集所有六片遁甲天书碎片，可以合成宝物遁甲天书",7,501,1,},
    [76] = {5014,"遁甲天书碎片四",220094,501,7,50,100,"收集所有六片遁甲天书碎片，可以合成宝物遁甲天书",7,501,1,},
    [77] = {5015,"遁甲天书碎片五",220095,501,7,50,100,"收集所有六片遁甲天书碎片，可以合成宝物遁甲天书",7,501,1,},
    [78] = {5016,"遁甲天书碎片六",220096,501,7,50,100,"收集所有六片遁甲天书碎片，可以合成宝物遁甲天书",7,501,1,},
    [79] = {5021,"卧龙印碎片一",220081,502,7,50,100,"收集所有六片卧龙印碎片，可以合成宝物卧龙印",7,502,1,},
    [80] = {5022,"卧龙印碎片二",220082,502,7,50,100,"收集所有六片卧龙印碎片，可以合成宝物卧龙印",7,502,1,},
    [81] = {5023,"卧龙印碎片三",220083,502,7,50,100,"收集所有六片卧龙印碎片，可以合成宝物卧龙印",7,502,1,},
    [82] = {5024,"卧龙印碎片四",220084,502,7,50,100,"收集所有六片卧龙印碎片，可以合成宝物卧龙印",7,502,1,},
    [83] = {5025,"卧龙印碎片五",220085,502,7,50,100,"收集所有六片卧龙印碎片，可以合成宝物卧龙印",7,502,1,},
    [84] = {5026,"卧龙印碎片六",220086,502,7,50,100,"收集所有六片卧龙印碎片，可以合成宝物卧龙印",7,502,1,},
    [85] = {5031,"阴符经碎片一",220301,503,7,50,100,"收集所有六片阴符经碎片，可以合成宝物阴符经",7,503,1,},
    [86] = {5032,"阴符经碎片二",220302,503,7,50,100,"收集所有六片阴符经碎片，可以合成宝物阴符经",7,503,1,},
    [87] = {5033,"阴符经碎片三",220303,503,7,50,100,"收集所有六片阴符经碎片，可以合成宝物阴符经",7,503,1,},
    [88] = {5034,"阴符经碎片四",220304,503,7,50,100,"收集所有六片阴符经碎片，可以合成宝物阴符经",7,503,1,},
    [89] = {5035,"阴符经碎片五",220305,503,7,50,100,"收集所有六片阴符经碎片，可以合成宝物阴符经",7,503,1,},
    [90] = {5036,"阴符经碎片六",220306,503,7,50,100,"收集所有六片阴符经碎片，可以合成宝物阴符经",7,503,1,},
    [91] = {5041,"凤雏印碎片一",220101,504,7,50,100,"收集所有六片凤雏印碎片，可以合成宝物凤雏印",7,504,1,},
    [92] = {5042,"凤雏印碎片二",220102,504,7,50,100,"收集所有六片凤雏印碎片，可以合成宝物凤雏印",7,504,1,},
    [93] = {5043,"凤雏印碎片三",220103,504,7,50,100,"收集所有六片凤雏印碎片，可以合成宝物凤雏印",7,504,1,},
    [94] = {5044,"凤雏印碎片四",220104,504,7,50,100,"收集所有六片凤雏印碎片，可以合成宝物凤雏印",7,504,1,},
    [95] = {5045,"凤雏印碎片五",220105,504,7,50,100,"收集所有六片凤雏印碎片，可以合成宝物凤雏印",7,504,1,},
    [96] = {5046,"凤雏印碎片六",220106,504,7,50,100,"收集所有六片凤雏印碎片，可以合成宝物凤雏印",7,504,1,},
    [97] = {11,"白银经验宝物碎片一",220111,1,3,750,1000,"收集所有三片白银经验宝物碎片，可以合成宝物白银经验宝物",3,1,1,},
    [98] = {12,"白银经验宝物碎片二",220112,1,3,750,1000,"收集所有三片白银经验宝物碎片，可以合成宝物白银经验宝物",3,1,1,},
    [99] = {13,"白银经验宝物碎片三",220113,1,3,750,1000,"收集所有三片白银经验宝物碎片，可以合成宝物白银经验宝物",3,1,1,},
    [100] = {21,"黄金经验宝物碎片一",220121,2,4,250,500,"收集所有四片黄金经验宝物碎片，可以合成宝物黄金经验宝物",4,2,1,},
    [101] = {22,"黄金经验宝物碎片二",220122,2,4,250,500,"收集所有四片黄金经验宝物碎片，可以合成宝物黄金经验宝物",4,2,1,},
    [102] = {23,"黄金经验宝物碎片三",220123,2,4,250,500,"收集所有四片黄金经验宝物碎片，可以合成宝物黄金经验宝物",4,2,1,},
    [103] = {24,"黄金经验宝物碎片四",220124,2,4,250,500,"收集所有四片黄金经验宝物碎片，可以合成宝物黄金经验宝物",4,2,1,},
    }
}



local __index_id = {
    [1011] = 1,
    [1012] = 2,
    [1013] = 3,
    [1021] = 4,
    [1022] = 5,
    [1023] = 6,
    [1031] = 7,
    [1032] = 8,
    [1033] = 9,
    [1041] = 10,
    [1042] = 11,
    [1043] = 12,
    [11] = 97,
    [12] = 98,
    [13] = 99,
    [2011] = 13,
    [2012] = 14,
    [2013] = 15,
    [2014] = 16,
    [2021] = 17,
    [2022] = 18,
    [2023] = 19,
    [2024] = 20,
    [2031] = 21,
    [2032] = 22,
    [2033] = 23,
    [2034] = 24,
    [2041] = 25,
    [2042] = 26,
    [2043] = 27,
    [2044] = 28,
    [21] = 100,
    [22] = 101,
    [23] = 102,
    [24] = 103,
    [3011] = 29,
    [3012] = 30,
    [3013] = 31,
    [3014] = 32,
    [3015] = 33,
    [3021] = 34,
    [3022] = 35,
    [3023] = 36,
    [3024] = 37,
    [3025] = 38,
    [3031] = 39,
    [3032] = 40,
    [3033] = 41,
    [3034] = 42,
    [3035] = 43,
    [3041] = 44,
    [3042] = 45,
    [3043] = 46,
    [3044] = 47,
    [3045] = 48,
    [4011] = 49,
    [4012] = 50,
    [4013] = 51,
    [4014] = 52,
    [4015] = 53,
    [4016] = 54,
    [4021] = 55,
    [4022] = 56,
    [4023] = 57,
    [4024] = 58,
    [4025] = 59,
    [4026] = 60,
    [4031] = 61,
    [4032] = 62,
    [4033] = 63,
    [4034] = 64,
    [4035] = 65,
    [4036] = 66,
    [4041] = 67,
    [4042] = 68,
    [4043] = 69,
    [4044] = 70,
    [4045] = 71,
    [4046] = 72,
    [5011] = 73,
    [5012] = 74,
    [5013] = 75,
    [5014] = 76,
    [5015] = 77,
    [5016] = 78,
    [5021] = 79,
    [5022] = 80,
    [5023] = 81,
    [5024] = 82,
    [5025] = 83,
    [5026] = 84,
    [5031] = 85,
    [5032] = 86,
    [5033] = 87,
    [5034] = 88,
    [5035] = 89,
    [5036] = 90,
    [5041] = 91,
    [5042] = 92,
    [5043] = 93,
    [5044] = 94,
    [5045] = 95,
    [5046] = 96,

}

local __key_map = {
  id = 1,
  name = 2,
  res_id = 3,
  treasure_id = 4,
  star = 5,
  npc_probability = 6,
  player_probability = 7,
  directions = 8,
  quality = 9,
  compose_id = 10,
  gm = 11,

}



local m = { 
    __index = function(t, k) 
        if k == "toObject" then
            return function()  
                local o = {}
                for key, v in pairs (__key_map) do 
                    o[key] = t._raw[v]
                end
                return o
            end 
        end
        
        assert(__key_map[k], "cannot find " .. k .. " in record_treasure_fragment_info")
        
        
        return t._raw[__key_map[k]]
    end
}


function treasure_fragment_info.getLength()
    return #treasure_fragment_info._data
end



function treasure_fragment_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_treasure_fragment_info
function treasure_fragment_info.indexOf(index)
    if index == nil then
        return nil
    end
    
    return setmetatable({_raw = treasure_fragment_info._data[index]}, m)
    
end

---
--@return @class record_treasure_fragment_info
function treasure_fragment_info.get(id)
    
    return treasure_fragment_info.indexOf(__index_id[id])
        
end



function treasure_fragment_info.set(id, key, value)
    local record = treasure_fragment_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function treasure_fragment_info.get_index_data()
    return __index_id
end