return {
{
	actions=
	{
		{act=1,effect=22,sound=51,delay=0,},
	},
	desc=Lang.Skill.s24L3Desc,
	iconID=24,
	actRange=
	{
		{
		xStart=0,
		xEnd=0,
		yStart=-0,
		yEnd=0,
		rangeType=3,
		rangeCenter=1,
		acts=
			{
				{
					conds=
					{
						{cond = 3,value =1},
						{cond = 17,value =63,param=115},
					},
					results=
					{
						{mj=0,timeParam=1,type=1,buffType=63, id=21,delay=0,interval=30},
					},
					specialEffects=
					{
					},
				},
			},
		},
	},
	trainConds=
	{
		{cond=1,value=60,consume=false},
		{cond=21,value=6000,consume=false},
	},
	spellConds=
	{
		{cond=8,value=448,consume=true},
	},
	singTime=0,
	cooldownTime=2000,
},
}