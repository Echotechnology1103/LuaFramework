-- 技能 月关 大招菊花妖觉醒变异
-- ID 277
-- 判断觉醒就换AI
--[[
	hero 月关
	ID:1018
	psf 2018-7-24
]]--
local yueguan_dazhao_juhuaguai_bianyi = 
{
	CLASS = "composite.QSBSequence",
	ARGS = {
		{
			CLASS = "action.QSBArgsIsUnderStatus",
			OPTIONS = {is_attacker = true,status = "yueguan_fumo"}
		},
		{
			CLASS = "composite.QSBSelector",
			ARGS = 
			{
				{
					CLASS = "action.QSBApplyBuff",
					OPTIONS = {buff_id = "fumo_yueguan_dazhao_juhuaguai_buff"},
				},
				{
					CLASS = "action.QSBRemoveBuff",
					OPTIONS = {buff_id = "fumo_yueguan_dazhao_juhuaguai_buff"},
				},
			},
		},
		{
			CLASS = "action.QSBAttackFinish",
		},
	},
}

return yueguan_dazhao_juhuaguai_bianyi 

