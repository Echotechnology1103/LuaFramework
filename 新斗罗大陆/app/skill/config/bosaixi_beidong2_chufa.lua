local bosaixi_beidong2_chufa = {
     CLASS = "composite.QSBSequence",
     ARGS = {
        {
            CLASS = "action.QSBRemoveBuff",
            OPTIONS = {buff_id = "bosaixi_beidong2_buff", is_target = false,  remove_all_same_buff_id = true},
        },
        {
            CLASS = "action.QSBApplyBuff",
            OPTIONS = {buff_id = "bosaixi_beidong2_chufa;y", is_target = false},
        },
        {
            CLASS = "action.QSBAttackFinish",
        },
    },
}

return bosaixi_beidong2_chufa