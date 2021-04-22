--  创建人：刘悦璘
--  创建时间：2018.03.22
--  NPC：乌龟魂兽
--  类型：攻击
local npc_wugui_xuanzhuan = {
    CLASS = "composite.QSBSequence",
    ARGS = {
        
        -- 上免疫控制buff
        {
            CLASS = "composite.QSBParallel",
            ARGS = 
            {
                {
                    CLASS = "action.QSBApplyBuff",
                    OPTIONS = {buff_id = "mianyi_suoyou_zhuangtai"},
                },

            },
        },
        
        -- {
        --     CLASS = "action.QSBPlaySound"
        -- },
        {
            CLASS = "action.QSBPlayAnimation",
            OPTIONS = {animation = "attack11", no_stand = true},
        },
        {
            CLASS = "composite.QSBParallel",
            ARGS = {
                {
                    CLASS = "action.QSBPlayAnimation",
                    OPTIONS = {animation = "attack13", is_keep_animation = true , is_loop = true},
                },
                {
                    CLASS = "action.QSBActorKeepAnimation",
                    OPTIONS = {is_keep_animation = true}
                },
                {
                    CLASS = "action.QSBHitTimer",
                },
            },
        },

        -- 清楚免疫控制buff
        {
            CLASS = "composite.QSBParallel",
            ARGS = {
                {
                    CLASS = "action.QSBRemoveBuff",
                    OPTIONS = {buff_id = "mianyi_suoyou_zhuangtai"},
                },

            },
        },
        
        {
            CLASS = "composite.QSBParallel",
            ARGS = {
                {
                    CLASS = "action.QSBActorKeepAnimation",
                    OPTIONS = {is_keep_animation = false},
                },
            },
        },
        {
            CLASS = "action.QSBActorStand",
        },
        {
            CLASS = "action.QSBAttackFinish"
        },
    },
}

return npc_wugui_xuanzhuan
