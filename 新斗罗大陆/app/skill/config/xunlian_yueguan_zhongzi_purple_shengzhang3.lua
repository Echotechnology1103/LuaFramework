local zhongzi_purple_shengzhang3 = {
	CLASS = "composite.QSBSequence",
	ARGS = 
	{
		-- {
		-- 	CLASS = "action.QSBSummonGhosts",
		--   	OPTIONS = {actor_id = 3583, life_span = 30.0, no_fog = false},
		-- },
		{
			CLASS = "action.QSBSummonMonsters",
			OPTIONS = {wave = -8},
		},
		{
			CLASS = "action.QSBAttackFinish",
		},
	},
}
return zhongzi_purple_shengzhang3