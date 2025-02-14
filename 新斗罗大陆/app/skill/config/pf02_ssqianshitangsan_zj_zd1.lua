local ssqianshitangsan_pugong1 = 
{
    CLASS = "composite.QSBParallel",
    ARGS = 
    {
        {
            CLASS = "action.QSBPlaySound"
        },
        {
            CLASS = "composite.QSBSequence",
            ARGS = 
            {
                {
                    CLASS = "action.QSBDelayTime",
                    OPTIONS = {delay_frame = 1},
                },
                {
                    CLASS = "action.QSBPlayAnimation",
                },
                {
                    CLASS = "action.QSBAttackFinish",
                },
            },
        },
        {
            CLASS = "composite.QSBSequence",
            ARGS = 
            {

                {
					CLASS = "action.QSBPlayEffect",
					OPTIONS = {effect_id = "pf02_ssqianshitangsan_attack12_1", is_hit_effect = false},
				},
            },
        },
        {
            CLASS = "action.QSBMultipleTrap", --连续放置多个陷阱
            OPTIONS = {interval_time = 0.1, attacker_face = false,attacker_underfoot = true,count = 1, distance = 0, trapId = "ssqianshitangsan_zj_zd1"},
        },
        {
            CLASS = "composite.QSBSequence",
            ARGS = {
                {
                    CLASS = "action.QSBDelayTime",
                    OPTIONS = {delay_frame = 40},
                },
                {
                    CLASS = "action.QSBBullet",
                    OPTIONS = {start_pos = {x = 125,y = 160}, effect_id = "pf02_ssqianshitangsan_attack01_2", speed = 2500, hit_effect_id = "pf02_ssqianshitangsan_attack01_3"},
                },
            },
        },
    },
}

return ssqianshitangsan_pugong1