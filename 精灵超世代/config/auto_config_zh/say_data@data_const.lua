-- this file is generated by program!
-- don't change it manaully.
-- source file: say_data.xls

Config = Config or {} 
Config.SayData = Config.SayData or {}
Config.SayData.data_const_key_depth = 1
Config.SayData.data_const_length = 14
Config.SayData.data_const_lan = "zh"
Config.SayData.data_const = {
	["at_condition"] = {desc="角色达到30级才可at其他玩家，请努力提升等级！",val=30},
	["cooldown_cross_service"] = {desc="跨服发言冷却",val=10},
	["cooldown_guild"] = {desc="公会发言冷却",val=5},
	["cooldown_same_province"] = {desc="同省发言冷却",val=5},
	["cooldown_team"] = {desc="组队聊天发言冷却",val=3},
	["cooldown_world"] = {desc="世界发言冷却",val=10},
	["default_bubble"] = {desc="默认聊天气泡",val=1000},
	["say_repeak_lev"] = {desc="X级以下限制",val=80},
	["say_repeak_num"] = {desc="筛选的发言条数",val=3},
	["say_repeak_similar"] = {desc="封禁的相似度（百分比）",val=60},
	["say_repeak_span"] = {desc="最近X分钟内的发言条数",val=15},
	["say_repeak_time"] = {desc="封禁的小时",val=10},
	["say_repeak_vip"] = {desc="VIPX以下限制",val=4},
	["say_string_length"] = {desc="限制的字符串长度（中文3个字符，英/数一个字符）",val=28},
}
