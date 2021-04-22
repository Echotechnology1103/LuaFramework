local sspbosaixi_zidong2 = 
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
                    OPTIONS = {delay_frame = 2},
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
            CLASS = "composite.QSBParallel",
            ARGS = 
            {
                {
					CLASS = "action.QSBPlayEffect",
					OPTIONS = {effect_id = "sspbosaixi_attack14_1", is_hit_effect = false},
				},
                {
                    CLASS = "action.QSBPlayEffect",
                    OPTIONS = {effect_id = "sspbosaixi_attack14_2", is_hit_effect = false},
                },
                {
                    CLASS = "action.QSBPlayEffect",
                    OPTIONS = {effect_id = "sspbosaixi_attack14_3", is_hit_effect = false},
                },
                {
                    CLASS = "action.QSBPlayEffect",
                    OPTIONS = {effect_id = "sspbosaixi_attack14_4", is_hit_effect = false},
                },
            },
        },
        {
            CLASS = "composite.QSBSequence",
            ARGS = 
            {
                {
                    CLASS = "action.QSBDelayTime",
                    OPTIONS = {delay_frame = 36},
                },
                {
                    CLASS = "composite.QSBParallel",
                    ARGS = 
                    {
                        {
                            CLASS = "action.QSBBullet",
                            OPTIONS = 
                            {
                                is_target = true ,
                                start_pos = {x = 60,y = 105},
                                target_random = true,
                                effect_id = "sspbosaixi_attack14_5", 
                                speed = 1800, 
                                -- rail_number = 2, 
                                -- rail_delay = 0.033, 
                                hit_effect_id = "sspbosaixi_attack01_4", 
                                is_bezier = true, 
                                bullet_delay = 0.07, 
                                set_points = 
                                { 
                                    {{x = 150, y = -300},{x = 300, y = 0}}, 
                                }, 
                            },
                        },
                        {
                            CLASS = "action.QSBBullet",
                            OPTIONS = 
                            {
                                is_target = true ,
                                start_pos = {x = 60,y = 105},
                                target_random = true,
                                effect_id = "sspbosaixi_attack14_5", 
                                speed = 1800, 
                                -- rail_number = 2, 
                                -- rail_delay = 0.033, 
                                hit_effect_id = "sspbosaixi_attack01_4", 
                                is_bezier = true, 
                                bullet_delay = 0.07, 
                                set_points = 
                                { 
                                    {{x = 150, y = 300},{x = 300, y = 0}}, 
                                }, 
                            },
                        },
                    },
                },
            }, 
        },              
    },
}

return sspbosaixi_zidong2