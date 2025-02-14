

---@classdef record_main_growth_info
local record_main_growth_info = {}
  
record_main_growth_info.id = 0 --ID  
record_main_growth_info.name = "" --名称  
record_main_growth_info.important = 0 --描述显示类型  
record_main_growth_info.seen_directions = "" --描述信息  
record_main_growth_info.seen_id = 0 --显示集合  
record_main_growth_info.seen_icon = 0 --集合icon  
record_main_growth_info.layout_id = 0 --页面布局  
record_main_growth_info.prepose_id = 0 --前置id  
record_main_growth_info.cost_num = 0 --消耗碎片数量  
record_main_growth_info.function_type = 0 --特殊功能类型  
record_main_growth_info.attribute_type = 0 --增加属性类型  
record_main_growth_info.attribute_value = 0 --增加属性类型值  
record_main_growth_info.reward_type = 0 --奖励方式类型  
record_main_growth_info.type_1 = 0 --奖励类型1  
record_main_growth_info.value_1 = 0 --奖励类型值1  
record_main_growth_info.size_1 = 0 --奖励数量1  
record_main_growth_info.type_2 = 0 --奖励类型2  
record_main_growth_info.value_2 = 0 --奖励类型值2  
record_main_growth_info.size_2 = 0 --奖励数量2  
record_main_growth_info.type_3 = 0 --奖励类型3  
record_main_growth_info.value_3 = 0 --奖励类型值3  
record_main_growth_info.size_3 = 0 --奖励数量3  
record_main_growth_info.type_4 = 0 --奖励类型4  
record_main_growth_info.value_4 = 0 --奖励类型值4  
record_main_growth_info.size_4 = 0 --奖励数量4


main_growth_info = {
   _data = {
    [1] = {1,"青龙",0,"全队物防+10",1,4,4,0,1,0,3,10,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [2] = {2,"青龙",0,"全队法防+10",1,4,4,1,1,0,4,10,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [3] = {3,"青龙",0,"全队生命+170",1,4,4,2,1,0,5,170,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [4] = {4,"青龙",0,"全队攻击+15",1,4,4,3,1,0,6,15,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [5] = {5,"青龙",1,"随机一名紫将",1,4,4,4,1,0,0,0,1,3,1,1,0,0,0,0,0,0,0,0,0,},
    [6] = {6,"白虎",0,"全队物防+20",2,1,1,5,1,0,3,20,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [7] = {7,"白虎",0,"全队法防+20",2,1,1,6,1,0,4,20,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [8] = {8,"白虎",0,"全队生命+360",2,1,1,7,1,0,5,360,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [9] = {9,"白虎",0,"全队攻击+30",2,1,1,8,1,0,6,30,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [10] = {10,"白虎",1,"主角品质升至紫色",2,1,1,9,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [11] = {11,"朱雀",0,"全队物防+30",3,2,2,10,1,0,3,30,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [12] = {12,"朱雀",0,"全队法防+30",3,2,2,11,1,0,4,30,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [13] = {13,"朱雀",0,"全队生命+560",3,2,2,12,1,0,5,560,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [14] = {14,"朱雀",0,"全队攻击+45",3,2,2,13,1,0,6,45,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [15] = {15,"朱雀",1,"橙将碎片*20",3,2,2,14,3,0,0,0,2,6,10011,20,6,10033,20,6,10054,20,6,10083,20,},
    [16] = {16,"玄武",0,"全队物防+40",4,3,3,15,2,0,3,40,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [17] = {17,"玄武",0,"全队法防+40",4,3,3,16,2,0,4,40,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [18] = {18,"玄武",0,"全队生命+770",4,3,3,17,2,0,5,770,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [19] = {19,"玄武",0,"全队攻击+60",4,3,3,18,2,0,6,60,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [20] = {20,"玄武",1,"橙将碎片*20",4,3,3,19,3,0,0,0,2,6,10011,20,6,10033,20,6,10054,20,6,10083,20,},
    [21] = {21,"摇光",0,"全队物防+50",5,4,4,20,2,0,3,50,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [22] = {22,"摇光",0,"全队法防+50",5,4,4,21,2,0,4,50,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [23] = {23,"摇光",0,"全队生命+1000",5,4,4,22,2,0,5,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [24] = {24,"摇光",0,"全队攻击+80",5,4,4,23,2,0,6,80,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [25] = {25,"摇光",1,"主角品质升至橙色",5,4,4,24,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [26] = {26,"七杀",0,"全队物防+60",6,1,1,25,2,0,3,60,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [27] = {27,"七杀",0,"全队法防+60",6,1,1,26,2,0,4,60,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [28] = {28,"七杀",0,"全队生命+1200",6,1,1,27,2,0,5,1200,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [29] = {29,"七杀",0,"全队攻击+100",6,1,1,28,2,0,6,100,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [30] = {30,"七杀",1,"橙将碎片*20",6,1,1,29,4,0,0,0,2,6,10011,20,6,10033,20,6,10054,20,6,10083,20,},
    [31] = {31,"破军",0,"全队物防+70",7,2,2,30,3,0,3,70,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [32] = {32,"破军",0,"全队法防+70",7,2,2,31,3,0,4,70,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [33] = {33,"破军",0,"全队生命+1500",7,2,2,32,3,0,5,1500,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [34] = {34,"破军",0,"全队攻击+120",7,2,2,33,3,0,6,120,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [35] = {35,"破军",1,"红色武将精华*5",7,2,2,34,4,0,0,0,1,3,3,5,0,0,0,0,0,0,0,0,0,},
    [36] = {36,"紫微",0,"全队物防+80",8,5,5,35,3,0,3,80,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [37] = {37,"紫微",0,"全队法防+80",8,5,5,36,3,0,4,80,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [38] = {38,"紫微",0,"全队生命+1650",8,5,5,37,3,0,5,1650,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [39] = {39,"紫微",0,"全队攻击+130",8,5,5,38,3,0,6,130,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [40] = {40,"紫微",1,"主角品质升至红色",8,5,5,39,4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [41] = {41,"玉衡",0,"全队物防+90",9,1,2,40,3,0,3,90,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [42] = {42,"玉衡",0,"全队法防+90",9,1,2,41,3,0,4,90,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [43] = {43,"玉衡",0,"全队生命+1900",9,1,2,42,3,0,5,1900,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [44] = {44,"玉衡",0,"全队攻击+150",9,1,2,43,3,0,6,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [45] = {45,"玉衡",1,"红色武将精华*5",9,1,2,44,4,0,0,0,1,3,3,5,0,0,0,0,0,0,0,0,0,},
    [46] = {46,"文曲",0,"全队物防+100",10,4,3,45,3,0,3,100,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [47] = {47,"文曲",0,"全队法防+100",10,4,3,46,3,0,4,100,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [48] = {48,"文曲",0,"全队生命+2100",10,4,3,47,3,0,5,2100,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [49] = {49,"文曲",0,"全队攻击+170",10,4,3,48,3,0,6,170,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [50] = {50,"文曲",1,"红色武将精华*5",10,4,3,49,4,0,0,0,1,3,3,5,0,0,0,0,0,0,0,0,0,},
    [51] = {51,"开阳",0,"全队物防+110",11,2,4,50,3,0,3,110,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [52] = {52,"开阳",0,"全队法防+110",11,2,4,51,3,0,4,110,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [53] = {53,"开阳",0,"全队生命+2300",11,2,4,52,3,0,5,2300,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [54] = {54,"开阳",0,"全队攻击+190",11,2,4,53,3,0,6,190,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [55] = {55,"开阳",1,"红色武将精华*5",11,2,4,54,5,0,0,0,1,3,3,5,0,0,0,0,0,0,0,0,0,},
    [56] = {56,"太微",0,"全队物防+120",12,3,1,55,4,0,3,120,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [57] = {57,"太微",0,"全队法防+120",12,3,1,56,4,0,4,120,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [58] = {58,"太微",0,"全队生命+2600",12,3,1,57,4,0,5,2600,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [59] = {59,"太微",0,"全队攻击+210",12,3,1,58,4,0,6,210,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [60] = {60,"太微",1,"主角品质升至金色",12,3,1,59,5,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [61] = {61,"勾陈",0,"全队物防+130",13,5,5,60,4,0,3,130,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [62] = {62,"勾陈",0,"全队法防+130",13,5,5,61,4,0,4,130,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [63] = {63,"勾陈",0,"全队生命+2900",13,5,5,62,4,0,5,2900,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [64] = {64,"勾陈",0,"全队攻击+230",13,5,5,63,4,0,6,230,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [65] = {65,"勾陈",1,"红色武将精华*10",13,5,5,64,6,0,0,0,1,3,3,10,0,0,0,0,0,0,0,0,0,},
    [66] = {66,"轩辕",0,"全队物防+140",14,1,2,65,4,0,3,140,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [67] = {67,"轩辕",0,"全队法防+140",14,1,2,66,4,0,4,140,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [68] = {68,"轩辕",0,"全队生命+3200",14,1,2,67,4,0,5,3200,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [69] = {69,"轩辕",0,"全队攻击+250",14,1,2,68,4,0,6,250,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [70] = {70,"轩辕",1,"红色武将精华*10",14,1,2,69,6,0,0,0,1,3,3,10,0,0,0,0,0,0,0,0,0,},
    [71] = {71,"文昌",0,"全队物防+150",15,4,3,70,5,0,3,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [72] = {72,"文昌",0,"全队法防+150",15,4,3,71,5,0,4,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [73] = {73,"文昌",0,"全队生命+3500",15,4,3,72,5,0,5,3500,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [74] = {74,"文昌",0,"全队攻击+270",15,4,3,73,5,0,6,270,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [75] = {75,"文昌",1,"红色武将精华*10",15,4,3,74,6,0,0,0,1,3,3,10,0,0,0,0,0,0,0,0,0,},
    [76] = {76,"天刑",0,"全队物防+160",16,3,1,75,5,0,3,160,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [77] = {77,"天刑",0,"全队法防+160",16,3,1,76,5,0,4,160,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [78] = {78,"天刑",0,"全队生命+3800",16,3,1,77,5,0,5,3800,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [79] = {79,"天刑",0,"全队攻击+290",16,3,1,78,5,0,6,290,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [80] = {80,"天刑",1,"化神丹*5",16,3,1,79,6,0,0,0,1,3,275,5,0,0,0,0,0,0,0,0,0,},
    [81] = {81,"孤辰",0,"全队物防+170",17,2,4,80,5,0,3,170,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [82] = {82,"孤辰",0,"全队法防+170",17,2,4,81,5,0,4,170,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [83] = {83,"孤辰",0,"全队生命+4100",17,2,4,82,5,0,5,4100,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [84] = {84,"孤辰",0,"全队攻击+310",17,2,4,83,5,0,6,310,0,0,0,0,0,0,0,0,0,0,0,0,0,},
    [85] = {85,"孤辰",1,"化神丹*5",17,2,4,84,6,0,0,0,1,3,275,5,0,0,0,0,0,0,0,0,0,},
    }
}



local __index_id = {
    [1] = 1,
    [10] = 10,
    [11] = 11,
    [12] = 12,
    [13] = 13,
    [14] = 14,
    [15] = 15,
    [16] = 16,
    [17] = 17,
    [18] = 18,
    [19] = 19,
    [2] = 2,
    [20] = 20,
    [21] = 21,
    [22] = 22,
    [23] = 23,
    [24] = 24,
    [25] = 25,
    [26] = 26,
    [27] = 27,
    [28] = 28,
    [29] = 29,
    [3] = 3,
    [30] = 30,
    [31] = 31,
    [32] = 32,
    [33] = 33,
    [34] = 34,
    [35] = 35,
    [36] = 36,
    [37] = 37,
    [38] = 38,
    [39] = 39,
    [4] = 4,
    [40] = 40,
    [41] = 41,
    [42] = 42,
    [43] = 43,
    [44] = 44,
    [45] = 45,
    [46] = 46,
    [47] = 47,
    [48] = 48,
    [49] = 49,
    [5] = 5,
    [50] = 50,
    [51] = 51,
    [52] = 52,
    [53] = 53,
    [54] = 54,
    [55] = 55,
    [56] = 56,
    [57] = 57,
    [58] = 58,
    [59] = 59,
    [6] = 6,
    [60] = 60,
    [61] = 61,
    [62] = 62,
    [63] = 63,
    [64] = 64,
    [65] = 65,
    [66] = 66,
    [67] = 67,
    [68] = 68,
    [69] = 69,
    [7] = 7,
    [70] = 70,
    [71] = 71,
    [72] = 72,
    [73] = 73,
    [74] = 74,
    [75] = 75,
    [76] = 76,
    [77] = 77,
    [78] = 78,
    [79] = 79,
    [8] = 8,
    [80] = 80,
    [81] = 81,
    [82] = 82,
    [83] = 83,
    [84] = 84,
    [85] = 85,
    [9] = 9,

}

local __key_map = {
  id = 1,
  name = 2,
  important = 3,
  seen_directions = 4,
  seen_id = 5,
  seen_icon = 6,
  layout_id = 7,
  prepose_id = 8,
  cost_num = 9,
  function_type = 10,
  attribute_type = 11,
  attribute_value = 12,
  reward_type = 13,
  type_1 = 14,
  value_1 = 15,
  size_1 = 16,
  type_2 = 17,
  value_2 = 18,
  size_2 = 19,
  type_3 = 20,
  value_3 = 21,
  size_3 = 22,
  type_4 = 23,
  value_4 = 24,
  size_4 = 25,

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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_main_growth_info")
        
        
        return t._raw[__key_map[k]]
    end
}


function main_growth_info.getLength()
    return #main_growth_info._data
end



function main_growth_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_main_growth_info
function main_growth_info.indexOf(index)
    if index == nil then
        return nil
    end
    
    return setmetatable({_raw = main_growth_info._data[index]}, m)
    
end

---
--@return @class record_main_growth_info
function main_growth_info.get(id)
    
    return main_growth_info.indexOf(__index_id[id])
        
end



function main_growth_info.set(id, key, value)
    local record = main_growth_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function main_growth_info.get_index_data()
    return __index_id
end