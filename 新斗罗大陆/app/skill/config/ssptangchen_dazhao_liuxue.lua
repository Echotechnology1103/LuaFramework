local sspbosaixi_sj3_cf3 = 
{
    CLASS = "composite.QSBParallel",
    ARGS = 
    {    
        {
            CLASS = "composite.QSBSequence",
            ARGS = 
            {
                {
                    CLASS = "action.QSBArgsConditionSelector",
                    OPTIONS = 
                    {
                        failed_select = 2,
                        {expression = "self:is_pvp=true", select = 1},
                    },
                },
                {
                    CLASS = "composite.QSBSelector",
                    ARGS = 
                    {
                        {
                            CLASS = "composite.QSBParallel",
                            ARGS = 
                            { 
                                {
                                    CLASS = "action.QSBDecreaseHpByTargetProp", --造成攻击目标当前生命20%伤害
                                    OPTIONS = {is_max_hp_percent = true, current_hp_percent = true, hp_percent = 0.2},
                                },
                            },
                        },
                        {
                            CLASS = "composite.QSBParallel",
                            ARGS = 
                            { 
                                {
                                  CLASS = "action.QSBHitTarget",
                                  OPTIONS = {damage_scale = 1.5,check_target_by_skill = true},
                                }, 
                            },
                        },
                    },
                },
            },
        },   
        {
            CLASS = "action.QSBAttackFinish",
        },               
    },
}

return sspbosaixi_sj3_cf3