local common_xiaoqiang_victory = 
{
    CLASS = "composite.QSBSequence",
    ARGS = 
    {
        {
            CLASS = "action.QSBPlayGodSkillAnimation",
        },
        {
            CLASS = "composite.QSBSequence",
            ARGS = 
            {
                {
                    CLASS = "action.QSBArgsRandomByActor",
                    OPTIONS = {random_pools = {{t = 55, dps = 35, health = 10}, {t = 35, dps = 55, health = 10}, {t = 35, dps = 35, health = 30}}, 
                    args_translate = { actorId = "copy_hero_id"}},
                },
				{
				    CLASS = "action.QSBSummonCopyHero",
				    OPTIONS = {pos = {x = 2, y = 1}, 
                    copy_slots = {1, 3, 5, 6}, 
                    percent = 0.7, 
                    buff_id = "ssaosika_shenji_dot_jt", 
                    appear_skill = 498, 
                    ai_name = "ssaosika_sj1_ai",
                    ai_name_health = "ssaosika_sj1_ai_heal", 
                    is_visible = false ,
                    has_god_skill = false, 
                    has_enchat_skill = false,
                    set_color = ccc3(35, 35,120) , 
                    set_color2 = ccc4(200, 250, 150 ,100)}
				},
            },
        },
        {
          CLASS = "action.QSBAttackFinish",
        },
    },
}

return common_xiaoqiang_victory