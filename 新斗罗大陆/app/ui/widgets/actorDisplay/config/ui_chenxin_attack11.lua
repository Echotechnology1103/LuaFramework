
local ui_chenxin_attack11 = {
    CLASS = "composite.QUIDBParallel",
    ARGS =
    {
        {
			CLASS = "action.QUIDBPlayAnimation",
			OPTIONS = {animation = "attack11"},
		},
		{
			CLASS = "action.QUIDBPlayEffect",
			OPTIONS = {is_hit_effect = false, effect_id = "jiandouluo_attack11_1_ui"},
		},
		{
			CLASS = "action.QUIDBPlayEffect",
			OPTIONS = {is_hit_effect = false, effect_id = "jiandouluo_attack11_1_1_ui"},
		},
		{
            CLASS = "composite.QUIDBSequence",
            ARGS = {
                {
                    CLASS = "action.QUIDBDelayTime",
                    OPTIONS = {delay_time = 83 / 30},
                },
                {
                    CLASS = "action.QUIDBPlayAnimation",
                    OPTIONS = {animation = "stand"},
                },
            },
        },
    },
}

return ui_chenxin_attack11