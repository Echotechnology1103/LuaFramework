
local ultra_kill_command_dog = {        --狗撕咬
    CLASS = "composite.QSBSequence",
    OPTIONS = {forward_mode = true,},
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
                    OPTIONS = {buff_id = "rush"},
                }, 
                {
                    CLASS = "action.QSBManualMode",
                    OPTIONS = {enter = true, revertable = true},
                },       
                {
                    CLASS = "action.QSBMoveToTarget",
                    OPTIONS = {is_position = true},
                },
                {
                    CLASS = "action.QSBRemoveBuff",
                    OPTIONS = {buff_id = "rush"},
                },
                {
                    CLASS = "composite.QSBParallel",
                    OPTIONS = {forward_mode = true,},
                    ARGS = {
                        {
                            CLASS = "action.QSBPlayAnimation",
                            OPTIONS = {animation = "attack13"},
                        },
                        {
                            CLASS = "action.QSBApplyBuff",
                            OPTIONS = {buff_id = "dog_big"},
                        }, 
                        {
                            CLASS = "action.QSBPlayEffect",
                            OPTIONS = {effect_id = "worry_3_3", is_hit_effect = false},
                        },
                        {
                            CLASS = "action.QSBPlayEffect",
                            OPTIONS = {effect_id = "worry_y"},
                        },
                        {
                            CLASS = "composite.QSBSequence",
                            OPTIONS = {forward_mode = true,},
                            ARGS = {
                                {
                                    CLASS = "action.QSBDelayTime",
                                    OPTIONS = {delay_frame = 25},
                                },
                                {
                                    CLASS = "action.QSBHitTarget",
                                    OPTIONS = {is_range_hit = true},
                                },
                            },
                        },
                    },
                },
                {
                    CLASS = "action.QSBRemoveBuff",
                    OPTIONS = {buff_id = "dog_big"},
                },
                {
                    CLASS = "action.QSBAttackFinish"
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
        -- {
        --     CLASS = "composite.QSBParallel",
        --     OPTIONS = {forward_mode = true,},
        --     ARGS = {
        --         {
        --             CLASS = "action.QSBPlayAnimation",
        --             OPTIONS = {animation = "attack13"},
        --         },
        --         {
        --             CLASS = "action.QSBPlayEffect",
        --             OPTIONS = {effect_id = "rending_slash_1", is_hit_effect = false},
        --         },
        --         {
        --             CLASS = "composite.QSBSequence",
        --             OPTIONS = {forward_mode = true,},
        --             ARGS = {
        --                 {
        --                     CLASS = "action.QSBDelayTime",
        --                     OPTIONS = {delay_frame = 25},
        --                 },
        --                 {
        --                     CLASS = "action.QSBHitTarget",
        --                     OPTIONS = {is_range_hit = true},
        --                 },
        --             },
        --         },
        --     },
        -- },

    },
}

return ultra_kill_command_dog