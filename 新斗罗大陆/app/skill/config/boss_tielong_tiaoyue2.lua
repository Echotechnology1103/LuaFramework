-- 技能 鬼虎飞扑
-- 扑向目标造成AOE伤害
--[[
	boss 铁龙
	ID:3306 副本3-4
	psf 2018-2-5
]]--

local boss_tielong_tiaoyue = {
	CLASS = "composite.QSBParallel",
	ARGS = 
	{
		{
			CLASS = "action.QSBApplyBuff",
			OPTIONS = {is_target = false, buff_id = "mianyi_suoyou_zhuangtai"},
		},
		{
			CLASS = "action.QSBPlaySound",
		},        
		{
			CLASS = "composite.QSBSequence",
			OPTIONS = {revertable = true},
			ARGS = 
			{	
				{
					CLASS = "action.QSBPlayAnimation",
					OPTIONS = {animation = "attack13"},
				},
				
			},
		},
		--{
		--	CLASS = "action.QSBApplyBuff",
		--	OPTIONS = {buff_id = "xiaowu_tongyongchongfeng_buff"},
		--}, 
		{
			CLASS = "composite.QSBSequence",
			OPTIONS = {revertable = true},
			ARGS = 
			{
                {
                    CLASS = "action.QSBArgsPosition",
                    OPTIONS = {is_attackee = true}, -- 生成传递参数 pos = {x = 100, y = 目标的y轴}
                },
				{
                    CLASS = "action.QSBDelayTime",
                    OPTIONS = {delay_frame = 4, pass_key = {"pos"}},
                },
				{
					CLASS = "action.QSBCharge", --移动向目标位置（不打断动画）
					OPTIONS = {move_time = 0.3},
				},	
				{
					CLASS = "action.QSBAttackFinish",
				},
			},
		},
	},
}

return boss_tielong_tiaoyue
