--枪骑兵冲锋
--NPC ID: 10015 10016 10017
--技能ID: 50302
--冲锋到目标
--[[-----------------------------------------
	不要轻易修改,有特殊需求,尽量复制一份使用.
	避免影响其他同原型NPC!!!
]]-------------------------------------------
--创建人：庞圣峰
--创建时间:2018-3-21

local npc_qiangqibing_chongfeng = {
	CLASS = "composite.QSBSequence",
	ARGS = {
		{    
			CLASS = "composite.QSBSequence",
			ARGS = {
				{
					CLASS = "action.QSBLockTarget",
					OPTIONS = {is_lock_target = true, revertable = true},
				},
				{
					CLASS = "action.QSBApplyBuff",
					OPTIONS = {buff_id = "tongyongchongfeng_jisu_buff"},
				}, 
				{
					CLASS = "action.QSBManualMode",
					OPTIONS = {enter = true, revertable = true},
				},   
			},
		},
        {
            CLASS = "composite.QSBParallel",
            ARGS = {
				{
                     CLASS = "composite.QSBParallel",
                     ARGS = {
                        {
							CLASS = "action.QSBPlayAnimation",
							OPTIONS = {animation = "walk"},
						},
                    },
                },
				{
					CLASS = "action.QSBCharge", 
					OPTIONS = {move_time = 0.7},
				},
				-- {
				-- 	CLASS = "action.QSBPlayEffect",
				-- 	OPTIONS = {is_hit_effect = false, effect_id = "charge_4"},
				-- },
            },
        },
		{    
			CLASS = "composite.QSBSequence",
			ARGS = {
				{
                    CLASS = "composite.QSBParallel",
                    ARGS = {
						{
							CLASS = "action.QSBApplyBuff",
							OPTIONS = {is_target = true, buff_id = "chongfeng_tongyong_xuanyun"},
						},   
						{
                            CLASS = "action.QSBPlayEffect",
                            OPTIONS = {is_hit_effect = true},
                        },
                        {
                             CLASS = "action.QSBHitTarget",
                        },
                    },
                },
				{
					CLASS = "action.QSBRemoveBuff",
					OPTIONS = {buff_id = "tongyongchongfeng_jisu_buff"},
				},
				{
					CLASS = "action.QSBLockTarget",
					OPTIONS = {is_lock_target = false},
				},
				{
					CLASS = "action.QSBManualMode",
					OPTIONS = {exit = true},
				},
				{
					CLASS = "action.QSBAttackFinish"
				},
			},
		},
	},
}

return npc_qiangqibing_chongfeng

