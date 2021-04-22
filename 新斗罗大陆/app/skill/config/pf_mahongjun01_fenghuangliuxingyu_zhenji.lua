
local jinzhan_tongyong = {
     CLASS = "composite.QSBSequence",
     ARGS = {
        {
            CLASS = "action.QSBPlaySound"
        },
        {
            CLASS = "composite.QSBParallel",
            ARGS = {
                {
                    CLASS = "composite.QSBSequence",
                    ARGS = 
                    {
                        {
                            CLASS = "action.QSBDelayTime",
                            OPTIONS = {delay_time = 23 / 30},
                        },
                        {
                            CLASS = "action.QSBArgsPosition",
                            OPTIONS = {is_attacker = true, offset = {x = -10, y = 25}},
                        },
                        {
                            CLASS = "action.QSBPlaySceneEffect",
                            OPTIONS = {effect_id = "pf_mahongjun01_attack14_2" , ground_layer = true, scale_actor_face = -1},
                        },                       
                    },
                },
                {
                    CLASS = "composite.QSBSequence",
                    ARGS = 
                    {
                        {
                            CLASS = "action.QSBDelayTime",
                            OPTIONS = {delay_time = 23 / 30},
                        },
                        {
                            CLASS = "action.QSBArgsPosition",
                            OPTIONS = {is_attacker = true, offset = {x = 0, y = -25}}
                        },
                        {
                            CLASS = "action.QSBPlaySceneEffect",
                            OPTIONS = {effect_id = "pf_mahongjun01_attack14_2" , ground_layer = true, scale_actor_face = -1},
                        },                       
                    },
                },       
                {
                    CLASS = "composite.QSBSequence",
                    ARGS = 
                    {
                        {
                            CLASS = "action.QSBDelayTime",
                            OPTIONS = {delay_time = 25 / 30},
                        },
                        {
                            CLASS = "composite.QSBParallel",
                            ARGS = {  
                                -- {
                                --     CLASS = "action.QSBPlayEffect",
                                --     OPTIONS = {is_hit_effect = true},
                                -- },
                                {
                                    CLASS = "action.QSBHitTarget",
                                },
                            },
                        },
                    },
                },
                {
                    CLASS = "composite.QSBSequence",
                    ARGS = 
                    {
                        {
                            CLASS = "action.QSBDelayTime",
                            OPTIONS = {delay_time = 29 / 30},
                        },
                        {
                            CLASS = "action.QSBPlayEffect",
                            OPTIONS = {effect_id = "pf_mahongjun01_attack13_3" ,is_hit_effect = true},
                        },
                    },
                },
                {
                    CLASS = "action.QSBPlayAnimation",
                    OPTIONS = { animation= "attack14" },                    
                },
            },
        },
        {
            CLASS = "action.QSBAttackFinish"
        },
    },
}

return jinzhan_tongyong