local common_xiaoqiang_victory = 
{
    CLASS = "composite.QSBSequence",
    ARGS = 
    {
        {
            CLASS = "composite.QSBParallel",
            ARGS = 
            {                
                {
                    CLASS = "action.QSBPlayEffect",
                    OPTIONS = {effect_id = "pf02_ssqianshitangsan_shenji_1", is_hit_effect = true},
                },
                {
                    CLASS = "action.QSBPlayEffect",
                    OPTIONS = {effect_id = "pf02_ssqianshitangsan_shenji_2", is_hit_effect = true},
                },
                {
                    CLASS = "action.QSBHitTarget",                                                                                    
                },
                {
                    CLASS = "action.QSBAttackFinish",
                },
            },
        },
    },
}

return common_xiaoqiang_victory