local sszhuzhuqing_sj = 
{
    CLASS = "composite.QSBSequence",
    ARGS = 
    {
        {
            CLASS = "composite.QSBParallel",
            ARGS = 
            {
                {            
                    CLASS = "composite.QSBSequence",            
                    ARGS = 
                    {                
                        {
                            CLASS = "action.QSBDelayTime",
                            OPTIONS = {delay_time = 0.15},
                        },
                        {
                            CLASS = "action.QSBApplyBuff",
                            OPTIONS = {is_target = false, buff_id = "sszhuzhuqing_wuhun_jt3", debug = true}
                        },
                        {
                            CLASS = "action.QSBRemoveBuff",
                            OPTIONS = {is_target = false, buff_id = "sszhuzhuqing_wuhun_jt2"}
                        },
                    },
                },
                {
                  CLASS = "action.QSBAttackFinish",
                },
            },
        },
    },             
}

return sszhuzhuqing_sj