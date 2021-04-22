
local anqi_mifengnnaiping_xuming4 = 
{
    CLASS = "composite.QSBParallel",
    ARGS = 
    {
        {
            CLASS = "action.QSBPlaySound"
        },
        {
            CLASS = "action.QSBRemoveBuff",
            OPTIONS = {buff_id = "anqi_mifengnaiping_jiance4", is_target = false},
        },
        {
            CLASS = "action.QSBRemoveBuff",
            OPTIONS = {buff_id = "anqi_mifengnaiping_qianghua4", is_target = false},
        },
        {
            CLASS = "action.QSBRemoveBuff",
            OPTIONS = {buff_id = "anqi_mifengnaiping_biaoxian4_1", is_target = false},
        },
        {
            CLASS = "action.QSBRemoveBuff",
            OPTIONS = {buff_id = "anqi_mifengnaiping_biaoxian4_2", is_target = false},
        },
        {
            CLASS = "action.QSBRemoveBuff",
            OPTIONS = {buff_id = "anqi_mifengnaiping_biaoxian3", is_target = false},
        },
        {
            CLASS = "action.QSBPlayEffect",
            OPTIONS = {effect_id = "mifengnaiping_attack_5", is_hit_effect = true},
        },
        {
            CLASS = "composite.QSBSequence",
            ARGS = {
                {
                    CLASS = "action.QSBDelayTime",
                    OPTIONS = {delay_frame = 19},
                },
                {
                    CLASS = "action.QSBHitTarget",
                },
                {
                    CLASS = "action.QSBRemoveBuff",
                    OPTIONS = {buff_id = "anqi_mifengnaiping_xiaonaiping4", is_target = false},
                },
                {
                    CLASS = "action.QSBAttackFinish",
                },
            },
        },
        {
            CLASS = "composite.QSBSequence",
            ARGS = {
                {
                    CLASS = "action.QSBDelayTime",
                    OPTIONS = {delay_frame = 19},
                },
                {
                    CLASS = "action.QSBPlayEffect",
                    OPTIONS = {effect_id = "mifengnaiping_attack_4", is_hit_effect = true},
                },
            },
        },
    },
}

return anqi_mifengnnaiping_xuming4

