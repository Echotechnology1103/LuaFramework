local shifa_tongyong = {
     CLASS = "composite.QSBSequence",
     ARGS = {
        {
            CLASS = "action.QSBPlaySound"
        },
        {
            CLASS = "composite.QSBParallel",
            ARGS = {
                {
                    CLASS = "action.QSBPlayEffect",
                    OPTIONS = {is_hit_effect = false},
                },
                {
                    CLASS = "action.QSBPlayAnimation",
                    ARGS = {
                        {
                            CLASS = "composite.QSBParallel",
                            ARGS = {  
                                {
                                    CLASS = "action.QSBPlayEffect",
                                    OPTIONS = {effect_id = "dugubo_whzs03", is_hit_effect = false},
                                },
                                {
                                    CLASS = "action.QSBHitTarget",
                                },
                                {
                                    CLASS = "action.QSBRemoveBuff",
                                    OPTIONS = {buff_id = "dugubo_zhenji_debuff", remove_all_same_buff_id = true},
                                },
                                {
                                    CLASS = "action.QSBRemoveBuff",
                                    OPTIONS = {buff_id = "dugubo_zhenji_die", remove_all_same_buff_id = true},
                                },
                            },
                        },
                    },
                },
            },
        },
        {
            CLASS = "action.QSBAttackFinish"
        },
    },
}

return shifa_tongyong
