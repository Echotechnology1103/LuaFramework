local hl_qingyufenghuang_dazhao_buff_trigger5 =
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
                    OPTIONS = {delay_frame = 3},
                },
                {
                    CLASS = "action.QSBDecreaseHpByCostHp",
                    OPTIONS = {mode = "max_hp_percent", value = 0.05, multiply_cofficient = 3, ignore_absorb = true},
                },
            },
        },
        {
            CLASS = "action.QSBPlayEffect",
            OPTIONS = {effect_id = "hl_qingyufenghuang_attack01_3",is_hit_effect = true},
        },
        {
            CLASS = "action.QSBHitTarget",
        },
        {
            CLASS = "action.QSBAttackFinish",
        },
    },
}

return hl_qingyufenghuang_dazhao_buff_trigger5