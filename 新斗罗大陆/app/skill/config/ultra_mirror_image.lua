local ultra_mirror_image = {
	CLASS = "composite.QSBParallel",
	ARGS = 
	{
		{
			CLASS = "composite.QSBSequence",
			ARGS =
			{
				{
					CLASS = "action.QSBPlayAnimation",
					OPTIONS = {animation = "attack13"},
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
					CLASS = "action.QSBDelayTime",
					OPTIONS = {delay_frame = 15},
				},
				{
					CLASS = "action.QSBPlayEffect",
					OPTIONS = {effect_id = "mirror_image_1"},
				},
			},
		},
		{
			CLASS = "composite.QSBSequence",
			ARGS =
			{
				{
					CLASS = "action.QSBDelayTime",
					OPTIONS = {delay_frame = 43 - 11},
				},
				{
					CLASS = "composite.QSBParallel",
					ARGS =
					{
						{
							CLASS = "action.QSBPlayEffect",
							OPTIONS = {effect_id = "mirror_image_2", is_flip_x = true},
						},
					},
				},
				{
					CLASS = "action.QSBDelayTime",
					OPTIONS = {delay_frame = 6},
				},
				{
					CLASS = "composite.QSBParallel",
					ARGS = 
					{
						{
							CLASS = "action.QSBSummonGhosts",
			            	OPTIONS = {actor_id = 10026, life_span = 9.0, no_fog = true, relative_pos = {x = -120, y = 0}, set_color = ccc3(5, 135, 163)}
						},
						{
							CLASS = "action.QSBSummonGhosts",
			            	OPTIONS = {actor_id = 10026, life_span = 9.0, no_fog = true, relative_pos = {x = 120, y = 0}, set_color = ccc3(5, 135, 163)}, 
						},
					},
				},
			},
		},
	}
}

return ultra_mirror_image