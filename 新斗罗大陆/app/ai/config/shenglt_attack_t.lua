--斗罗AI：优先打T
--升灵台
--psf 2020-4-14

local shenglt_attack_t = {
	CLASS = "composite.QAISelector", 
	ARGS = 
	{
        {
            CLASS = "action.QAIAttackByRole",
            OPTIONS = {role = "t"},
        },
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

return shenglt_attack_t