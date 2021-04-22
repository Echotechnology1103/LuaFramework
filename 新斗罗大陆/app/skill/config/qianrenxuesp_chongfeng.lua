-- 技能 千仞雪冲锋
-- 技能ID 202
-- 同tank_chongfeng, 但是不晕眩,而是击飞
--[[
	hero 千仞雪
	ID:1027 
	psf 2018-8-11
]]--

local pf_qianrenxue02_chongfeng = 
{
    CLASS = "composite.QSBParallel",
    ARGS =
    {
        {
            CLASS = "composite.QSBSequence",
            ARGS = 
            {
                {
                    CLASS = "action.QSBDelayTime",
                    OPTIONS = {delay_frame = 1},
                },
                {
                    CLASS = "action.QSBPlayEffect",
                    OPTIONS = {effect_id = "qianrenxue_attack12_1", is_hit_effect = false},
                },               
            },
        },
        {
            CLASS = "composite.QSBSequence",
            OPTIONS = {forward_mode = true},
            ARGS = 
            {
                {
                    CLASS = "action.QSBLockTarget",     --锁定目标
                    OPTIONS = {is_lock_target = true, revertable = true},
                },
                {
                    CLASS = "action.QSBManualMode",     --进入手动模式
                    OPTIONS = {enter = true, revertable = true},
                },
                {
                    CLASS = "action.QSBStopMove",
                },
                {
                    CLASS = "action.QSBApplyBuff",      --加速
                    OPTIONS = {buff_id = "tongyongchongfeng_buff1"},
                },
                {
                    CLASS = "action.QSBPlayAnimation",
                    OPTIONS = {animation = "attack12", is_loop = true},       
                }, 
                {
                    CLASS = "action.QSBActorKeepAnimation",
                    OPTIONS = {is_keep_animation = true}
                },
                {
                    CLASS = "action.QSBMoveToTarget",
                    OPTIONS = {is_position = true},
                },
        		--不晕眩
                -- {
                    -- CLASS = "action.QSBApplyBuff",
                    -- OPTIONS = {buff_id = "chongfeng_tongyong_xuanyun", is_target = true},
                -- },
                {
                    CLASS = "action.QSBRemoveBuff",     --去除加速
                    OPTIONS = {buff_id = "tongyongchongfeng_buff1"},
                },
                {
                    CLASS = "composite.QSBParallel",
                    ARGS = 
                    {
                        {
                             CLASS = "composite.QSBSequence",
                             ARGS = 
                             {
                                {
                                    CLASS = "action.QSBReloadAnimation",
                                },
                                {
                                    CLASS = "action.QSBActorKeepAnimation",
                                    OPTIONS = {is_keep_animation = false}
                                },
                                {
                                    CLASS = "action.QSBActorStand",
                                },
                                {
                                    CLASS = "action.QSBAttackFinish"
                                },
                            },
                        },
                        {
                             CLASS = "action.QSBHitTarget",
                        },
                    },
                },
                {
                    CLASS = "action.QSBLockTarget",
                    OPTIONS = {is_lock_target = false},
                },
                {
                    CLASS = "action.QSBManualMode",
                    OPTIONS = {exit = true},
                },
            },
        },
    },
}

return pf_qianrenxue02_chongfeng