--[[
    params:
        layer           数据源
        data            战斗数据
        attackCallback  伤害结算函数
        event           动作数据
        count           执行次数
    return:
        NULL
]]
local function skill_func(params)
    if (params.from < 7) ~= (params.to[1].posId < 7) then
        for i, af in ipairs(params.to) do
            if params.attackCallback then
                params.attackCallback(1, af)
            end
        end
        return
    end

    local nodeParent = params.data:get_battle_layer().heroPlant
       
    local atkPos = bd.interface.getStandPos(params.from)
    local atkEffect = bd.interface.newEffect({
            parent = nodeParent,
            effectName = "effect_pushanzhou_nuji",
            animation = "fz",
            scale = bd.ui_config.MinScale*1.5,
            position3D = atkPos,
            endRelease = true,
            
        })
    atkEffect:setLocalZOrder(-atkPos.y - bd.ui_config.diffz)

    local actionArray = {}


    for i, af in ipairs(params.to) do
        table.insert(actionArray, cc.CallFunc:create(function()
            local atkPos = bd.interface.getStandPos(af.posId)
            local zorder = -atkPos.y + 1

            local atkEffect = bd.interface.newEffect({
                parent = nodeParent,
                effectName = "effect_zhiliao",
                animation = "shang",
                scale = bd.ui_config.MinScale,
                position3D = atkPos,
                eventListener = function(p)
                    local value = bd.interface.getActionValue_daji(p.event.stringValue)
                    if value and params.attackCallback then
                        params.attackCallback(value, af)
                    end
                end,
            })
            atkEffect:setLocalZOrder(zorder)

            local inciEffect = bd.interface.newEffect({
                parent = nodeParent,
                effectName = "effect_zhiliao",
                animation = "xia",
                scale = bd.ui_config.MinScale,
                position3D = atkPos,
            })
            inciEffect:setLocalZOrder(zorder - 2)
            
            bd.adapter.audio.playSound("common_zhiliao.mp3")
        end))

        if #params.to > 3 then
            table.insert(actionArray , cc.DelayTime:create(0.14 * math.floor(i / 3) ))
        else
            table.insert(actionArray , cc.DelayTime:create(0.11))
        end
    end

    nodeParent:runAction(cc.Sequence:create(actionArray))
end

local skill = {
    res = { "effect_qingxinpushanzhou_nuji", "hero_qingxinpushanzhou", "effect_zhiliao"},
    audio = {"common_zhiliao.mp3"},
    excute = function(params)
        skill_func(params)
    end,
    explode = function(params)
        skill_func(params)
    end,
    type = bd.CONST.SkillType.Class1,
}

return skill
