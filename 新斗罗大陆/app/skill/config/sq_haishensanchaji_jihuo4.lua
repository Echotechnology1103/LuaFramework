-- 技能 海神三叉戟激活4
-- 技能ID 2020019

local sq_haishensanchaji_jihuo4 = 
{
    CLASS = "composite.QSBParallel",
    ARGS = 
    {
        {
            CLASS = "action.QSBPlayGodSkillAnimation",
            OPTIONS = {is_god_arm = true, is_ss = true},
        },
        {
            CLASS = "action.QSBApplyBuff",
            OPTIONS = {buff_id = "sq_haishensanchaji_qianghua4", teammate_and_self = true},
        },
        {
            CLASS = "action.QSBApplyBuff",
            OPTIONS = {buff_id = "sq_haishensanchaji_chufa4", highest_attack_teammate_and_self = true},
        },
        {
            CLASS = "action.QSBApplyBuff",
            OPTIONS = {buff_id = "sq_haishensanchaji_biaoji", highest_attack_teammate_and_self = true},
        },
        {
            CLASS = "action.QSBApplyBuff",
            OPTIONS = {buff_id = "sq_haishensanchaji_siwangchufa4", teammate_and_self = true},
        },
        {
            CLASS = "action.QSBRemoveBuff",
            OPTIONS = {buff_id = "sq_haishensanchaji_buff4", teammate_and_self = true},
        },
        {
            CLASS = "action.QSBAttackFinish",
        },
    },
}

return sq_haishensanchaji_jihuo4

