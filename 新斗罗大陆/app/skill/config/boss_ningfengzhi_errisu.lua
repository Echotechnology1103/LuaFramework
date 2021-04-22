
local boss_ningfengzhi_errisu = {
     CLASS = "composite.QSBParallel",
     ARGS = {
        --{
        --    CLASS = "composite.QSBSequence",
        --    OPTIONS = {forward_mode = true,},   --不会打断特效
        --    ARGS = {
        --        {
        --            CLASS = "action.QSBShowActor",
        --            OPTIONS = {is_attacker = true, turn_on = true, time = 0.3, revertable = true},
        --        },
        --        {
        --            CLASS = "action.QSBBulletTime",
        --            OPTIONS = {turn_on = true, revertable = true},
        --        },
        --        {
        --            CLASS = "action.QSBDelayTime",
        --            OPTIONS = {delay_time = 59 / 30},
        --        },
        --        {
        --            CLASS = "action.QSBBulletTime",
        --            OPTIONS = {turn_on = false},
        --        },
        --        {
        --            CLASS = "action.QSBShowActor",
        --            OPTIONS = {is_attacker = true, turn_on = false, time = 0.1},
        --        },
        --    },
        --},
        --{               --竞技场黑屏
        --    CLASS = "composite.QSBSequence",
        --    OPTIONS = {forward_mode = true,},   --不会打断特效
        --    ARGS = {
        --        {
        --            CLASS = "action.QSBShowActorArena",
        --            OPTIONS = {is_attacker = true, turn_on = true, time = 0.3, revertable = true},
        --        },
        --        {
        --            CLASS = "action.QSBBulletTimeArena",
        --            OPTIONS = {turn_on = true, revertable = true},
        --        },
        --        {
        --            CLASS = "action.QSBDelayTime",
        --            OPTIONS = {delay_time = 59/ 30},
        --        },
        --        {
        --            CLASS = "action.QSBBulletTimeArena",
        --            OPTIONS = {turn_on = false},
        --        },
        --        {
        --            CLASS = "action.QSBShowActorArena",
        --            OPTIONS = {is_attacker = true, turn_on = false, time = 0.1},
        --        },
        --    },
        --},
        {
            CLASS = "action.QSBPlaySound",
            OPTIONS = {sound_id ="ningfengzhi_walk"},
        },
        {
            CLASS = "action.QSBPlaySound"
        },
        {
            CLASS = "composite.QSBSequence",
            ARGS = {
                -- {
                --     CLASS = "action.QSBDelayTime",
                --     OPTIONS = {delay_time = 42/30},
                -- },
                {
                    CLASS = "action.QSBPlayEffect",
                    OPTIONS = {effect_id = "ningfengzhi_attack11_1" ,is_hit_effect = false},
                },
            },
        },
        {
            CLASS = "composite.QSBSequence",
            ARGS = {
                {
                    CLASS = "action.QSBDelayTime",
                    OPTIONS = {delay_time = 42/30},
                },
                {
                    CLASS = "action.QSBParallel",
                    ARGS = {
                        {
                            CLASS = "action.QSBPlayEffect",
                            OPTIONS = {is_hit_effect = true},
                        },
                        {
                            CLASS = "action.QSBHitTarget",
                        },
                    },
                },
                
            },
        },
        {
            CLASS = "composite.QSBSequence",
             ARGS = {
                {
                    CLASS = "action.QSBPlayAnimation",
                    -- ARGS = {
                    --     {
                    --         CLASS = "composite.QSBParallel",
                    --         ARGS = {
                    --             {
                    --                 CLASS = "action.QSBPlayEffect",
                    --                 OPTIONS = {effect_id = "ningfengzhi_attack01_1" ,is_hit_effect = true},
                    --             },
                    --             {
                    --                 CLASS = "action.QSBHitTarget",
                    --             },
                    --         },
                    --     },
                    -- },
                },
                {
                    CLASS = "action.QSBAttackFinish"
                },
            },
        },
    },
}

return boss_ningfengzhi_errisu