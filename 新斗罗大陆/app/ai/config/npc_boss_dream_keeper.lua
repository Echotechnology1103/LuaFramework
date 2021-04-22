
local npc_boss_dream_keeper= {
    CLASS = "composite.QAISelector",
    ARGS =
	{
        {
            CLASS = "composite.QAISequence",
            ARGS = 
            {
                {
                    CLASS = "action.QAITimer",
                    OPTIONS = {interval = 500,first_interval=0},
                },
                {
                    CLASS = "action.QAIUseSkill",
                    OPTIONS = {skill_id = 201103},
                },
            },
        },
        {
            CLASS = "composite.QAISequence",
            ARGS = 
            {
                {
                    CLASS = "action.QAITimer",
                    OPTIONS = {interval = 35,first_interval=7},
                },
                {
                    CLASS = "action.QAIAttackAnyEnemy",
                    OPTIONS = {always = true},
                },
                {
                    CLASS = "action.QAIUseSkill",
                    OPTIONS = {skill_id = 201904},
                },
            },
        },
        {
            CLASS = "composite.QAISequence",
            ARGS = 
            {
                {
                    CLASS = "action.QAITimer",
                    OPTIONS = {interval = 35,first_interval=14},
                },
                {
                    CLASS = "action.QAIUseSkill",
                    OPTIONS = {skill_id = 200315},
                },
            },
        },
        {
            CLASS = "composite.QAISequence",
            ARGS = 
            {
                {
                    CLASS = "action.QAITimer",
                    OPTIONS = {interval = 35,first_interval=20},
                },
                {
                    CLASS = "action.QAIUseSkill",
                    OPTIONS = {skill_id = 200904},
                },
            },
        },
        {
            CLASS = "composite.QAISequence",
            ARGS = 
            {
                {
                    CLASS = "action.QAITimer",
                    OPTIONS = {interval = 35,first_interval=28},
                },
                {
                    CLASS = "action.QAIAttackAnyEnemy",
                    OPTIONS = {always = true},
                },
                {
                    CLASS = "action.QAIUseSkill",
                    OPTIONS = {skill_id = 201904},
                },
            },
        },
        {
            CLASS = "composite.QAISequence",
            ARGS = 
            {
                {
                    CLASS = "action.QAITimer",
                    OPTIONS = {interval = 35,first_interval=35},
                },
                {
                    CLASS = "action.QAIUseSkill",
                    OPTIONS = {skill_id = 200315},
                },
            },
        },
        -- {
        --     CLASS = "composite.QAISequence",
        --     ARGS = 
        --     {
        --         {
        --             CLASS = "action.QAIHealthSpan",
        --             OPTIONS = {from = 1,to =0.5},               
        --         },
        --         {
        --             CLASS = "action.QAITimer",
        --             OPTIONS = {interval = 22,first_interval=15},
        --         },
        --         {
        --             CLASS = "action.QAIAttackAnyEnemy",
        --             OPTIONS = {always = true},
        --         },
        --         {
        --             CLASS = "action.QAIUseSkill",
        --             OPTIONS = {skill_id = 200919},
        --         },
        --     },
        -- },
        -- {
        --     CLASS = "composite.QAISequence",
        --     ARGS = 
        --     {
        --         {
        --             CLASS = "action.QAIHealthSpan",
        --             OPTIONS = {from = 1,to =0.5},               
        --         },
        --         {
        --             CLASS = "action.QAITimer",
        --             OPTIONS = {interval = 22,first_interval=22},
        --         },
        --         {
        --             CLASS = "action.QAIAttackAnyEnemy",
        --             OPTIONS = {always = true},
        --         },
        --         {
        --             CLASS = "action.QAIUseSkill",
        --             OPTIONS = {skill_id = 200920},
        --         },
        --     },
        -- },
        -- {
        --     CLASS = "composite.QAISequence",
        --     ARGS = 
        --     {
        --         {
        --             CLASS = "action.QAIHealthSpan",
        --             OPTIONS = {from = 0.5,to =0},               
        --         },
        --         {
        --             CLASS = "action.QAITimer",
        --             OPTIONS = {interval = 24,first_interval=5},
        --         },
        --         {
        --             CLASS = "action.QAIAttackAnyEnemy",
        --             OPTIONS = {always = true},
        --         },
        --         {
        --             CLASS = "action.QAIUseSkill",
        --             OPTIONS = {skill_id = 200920},
        --         },
        --     },
        -- },
        -- {
        --     CLASS = "composite.QAISequence",
        --     ARGS = 
        --     {
        --         {
        --             CLASS = "action.QAIHealthSpan",
        --             OPTIONS = {from = 0.5,to =0},               
        --         },
        --         {
        --             CLASS = "action.QAITimer",
        --             OPTIONS = {interval = 24,first_interval=10},
        --         },
        --         {
        --             CLASS = "action.QAIAttackAnyEnemy",
        --             OPTIONS = {always = true},
        --         },
        --         {
        --             CLASS = "action.QAIUseSkill",
        --             OPTIONS = {skill_id = 200919},
        --         },
        --     },
        -- },
        -- {
        --     CLASS = "composite.QAISequence",
        --     ARGS = 
        --     {
        --         {
        --             CLASS = "action.QAIHealthSpan",
        --             OPTIONS = {from = 0.5,to =0},               
        --         },
        --         {
        --             CLASS = "action.QAITimer",
        --             OPTIONS = {interval = 24,first_interval=15},
        --         },
        --         {
        --             CLASS = "action.QAIAttackAnyEnemy",
        --             OPTIONS = {always = true},
        --         },
        --         {
        --             CLASS = "action.QAIUseSkill",
        --             OPTIONS = {skill_id = 200919},
        --         },
        --     },
        -- },
        -- {
        --     CLASS = "composite.QAISequence",
        --     ARGS = 
        --     {
        --         {
        --             CLASS = "action.QAIHealthSpan",
        --             OPTIONS = {from = 0.5,to =0},               
        --         },
        --         {
        --             CLASS = "action.QAITimer",
        --             OPTIONS = {interval = 24,first_interval=17},
        --         },
        --         {
        --             CLASS = "action.QAIAttackAnyEnemy",
        --             OPTIONS = {always = true},
        --         },
        --         {
        --             CLASS = "action.QAIUseSkill",
        --             OPTIONS = {skill_id = 200919},
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
	}
}
        
return npc_boss_dream_keeper
