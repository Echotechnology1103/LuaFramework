-- 技能 牛天神技触发
-- 技能ID 39047~39051
-- 先后触发降龙和升龙
--[[
	魂师 牛天
	ID:1052
	psf 2020-2-12
]]--

local pf_ssniutian02_shenji_trigger_5 = {
    CLASS = "composite.QSBSequence",
    ARGS = {
        {
            CLASS = "action.QSBPlayGodSkillAnimation",
        },
        {
            CLASS = "action.QSBClearSkillCD",
            OPTIONS = {skill_id = 539056},
        },
        {
            CLASS = "action.QSBTriggerSkill",
            OPTIONS = {skill_id = 539056},
        },
        {
            CLASS = "action.QSBDelayTime",
            OPTIONS = {delay_frame = 56},
        },  
        {
            CLASS = "action.QSBClearSkillCD",
            OPTIONS = {skill_id = 539061},
        },
        {
            CLASS = "action.QSBTriggerSkill",
            OPTIONS = {skill_id = 539061},
        },
        {
            CLASS = "action.QSBAttackFinish",
        },
    },
}

return pf_ssniutian02_shenji_trigger_5