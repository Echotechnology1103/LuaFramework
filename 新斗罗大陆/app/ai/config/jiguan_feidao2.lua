
local npc_attack_closest = {
    CLASS = "composite.QAISelector",
    ARGS = 
    {
        {
            CLASS = "composite.QAISequence",
            ARGS = 
            {
                {
                    CLASS = "action.QAITimer",
                    OPTIONS = {interval = 500,first_interval = 1},
                },
                {
                    CLASS = "action.QAIUseSkill",
                    OPTIONS = {skill_id = 51172},          --召唤1
                },
            },
        },
        -- {
        --     CLASS = "composite.QAISequence",
        --     ARGS = 
        --     {
        --         {
        --             CLASS = "action.QAITimer",
        --             OPTIONS = {interval = 500,first_interval = 1},
        --         },
        --         {
        --             CLASS = "action.QAIUseSkill",
        --             OPTIONS = {skill_id = 51172},          --召唤2
        --         },
        --     },
        -- },
        -- {
        --     CLASS = "composite.QAISequence",
        --     ARGS = 
        --     {
        --         {
        --             CLASS = "action.QAITimer",
        --             OPTIONS = {interval = 45,first_interval = 31},
        --         },
        --         {
        --             CLASS = "action.QAIUseSkill",
        --             OPTIONS = {skill_id = 50097},          --召唤3
        --         },
        --     },
        -- },        
        {
            CLASS = "action.QAIAttackByHitlog",
        },
        {
            CLASS = "composite.QAISelector",
            ARGS = 
            {
                {
                    CLASS = "action.QAIIsAttacking",
                },
                {
                    CLASS = "action.QAIBeatBack",
                },
                {
                    CLASS = "action.QAIAttackClosestEnemy",
                },
            },
        },
    },
}

return npc_attack_closest