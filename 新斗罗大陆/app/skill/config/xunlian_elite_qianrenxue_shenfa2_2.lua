local xunlian_elite_qianrenxue_shenfa2_2 = 
{
	CLASS = "composite.QSBParallel",
	ARGS = 
	{
		{
			CLASS = "composite.QSBSequence",
			ARGS = 
			{
		        {
		            CLASS = "action.QSBArgsPosition",
		            OPTIONS = {is_attackee = true}, -- 生成传递参数 pos = {x = 100, y = 目标的y轴}
		        },
		        {
		            CLASS = "action.QSBDelayTime",
		            OPTIONS = {delay_time = 1 / 24, pass_key = {"pos"}},
		        },
		        {
		            CLASS = "action.QSBMultipleTrap",
		            OPTIONS = {trapId = "xunlian_elite_qianrenxue_shenfayujing",count = 1, pass_key = {"pos"}},
		        },
		        {
		            CLASS = "action.QSBDelayTime",
		            OPTIONS = {delay_time = 23 / 24 },
		        },
				{
		            CLASS = "action.QSBMultipleTrap",
		            OPTIONS = {trapId = "xunlian_elite_qianrenxue_shenfa03",count = 1, pass_key = {"pos"}},
		        },
	        },
        },
        {
            CLASS = "composite.QSBSequence",
            ARGS = 
            {
                {
                    CLASS = "action.QSBDelayTime",
                    OPTIONS = {delay_time = 31 / 24 },
                },                   
                {
                    CLASS = "action.QSBShakeScreen",
                    OPTIONS = {amplitude = 6, duration = 0.35, count = 1,},
                },
            },
        },
        {
			CLASS = "composite.QSBSequence",
			ARGS = 
			{
				{
		            CLASS = "action.QSBDelayTime",
		            OPTIONS = {delay_time = 10 / 24},
		        },
				{
					CLASS = "action.QSBAttackFinish",
				},	
			},
		},			       
    },
}
return xunlian_elite_qianrenxue_shenfa2_2