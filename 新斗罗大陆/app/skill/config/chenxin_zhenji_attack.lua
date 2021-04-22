-- 技能 尘心真技剑痕释放
-- 技能ID 190070
-- chenxin_jianhen_status_buff结束时触发,根据身上chenxin_jianhen_buff层数释放190071
--[[
	hero 尘心
	ID:1028 
	psf 2018-11-14
]]--

local chenxin_zhenji_attack = {
	CLASS = "composite.QSBSequence",
	ARGS = {
		{
			CLASS = "composite.QSBParallel",
			ARGS = {
				{
					CLASS = "action.QSBPlayEffect",
					OPTIONS = {is_hit_effect = false},
				},
				{
					CLASS = "action.QSBPlayEffect",
					OPTIONS = {is_hit_effect = true},
				},
			},
		},
--------------要修剑痕一直有的BUG的话，加上下面两段--------------
		{
			CLASS = "action.QSBRemoveBuff",
			OPTIONS = {buff_id = "chenxin_jianhen_status_buff1"},
		},
		{
			CLASS = "action.QSBRemoveBuff",
			OPTIONS = {buff_id = "chenxin_jianhen_status_buff2"},
		},
------------------------------------------------------------------

		{
			CLASS = "action.QSBAttackByBuffNum",
			OPTIONS = {buff_id = "chenxin_jianhen_buff", num_pre_stack_count = 0.7, trigger_skill_id = 190071, target_type = "self"},
		},--修复BUG补点伤害
		{
			CLASS = "action.QSBDelayTime",
			OPTIONS = {delay_time = 0.2},
		},
		{
			CLASS = "action.QSBRemoveBuff",
			OPTIONS = {buff_id = "chenxin_jianhen_baoji_buff",remove_all_same_buff_id = true},
		},
		{
			CLASS = "action.QSBRemoveBuff",
			OPTIONS = {buff_id = "chenxin_jianhen_buff",remove_all_same_buff_id = true},
		},
		{
			CLASS = "action.QSBAttackFinish",
		},
	},
}

return chenxin_zhenji_attack

