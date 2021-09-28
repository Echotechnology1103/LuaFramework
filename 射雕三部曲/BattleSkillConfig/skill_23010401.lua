--全体攻击带特效
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
    local nodeParent = params.data:get_battle_layer().heroPlant

    local f_pos = nil
    local zorderpos = nil

    -- if bd.interface.isEnemy(params.from) then
    --     --敌方放技能。
    --     f_pos = bd.interface.getStandPos(5)
    --     zorderpos = bd.interface.getStandPos(4)
    -- else
    --     f_pos = bd.interface.getStandPos(8)
    --     zorderpos = bd.interface.getStandPos(7)
    -- end

    f_pos = bd.interface.getStandPos(14)
    zorderpos = bd.interface.getStandPos(14)

    if params.from < 7 then
        f_pos.x = f_pos.x + 300 * bd.ui_config.MinScale
    else
        f_pos.x = f_pos.x - 100 * bd.ui_config.MinScale
    end

    local atkEffect = bd.interface.newEffect({
        parent = nodeParent,
        effectName = "effect_wg_xuanmingzhang",
        scale = bd.ui_config.MinScale,
        position3D = f_pos,
        endRelease = true,
        eventListener = function(p)
            local value = bd.interface.getActionValue_daji(p.event.stringValue)
            if value and params.attackCallback then
                params.attackCallback(value, af)
            end
        end,
    })
    atkEffect:setLocalZOrder(-zorderpos.y + 1)

    if params.from > 6 then
        atkEffect:setRotation3D(cc.vec3(0, 180, 0))
    end

    bd.adapter.audio.playSound("skill_xuanmingzhang.mp3")
end

local skillConfig = {
    res = {"effect_wg_xuanmingzhang", },
    audio = {"skill_xuanmingzhang.mp3"},    
    excute = function(params)
        skill_func(params)
    end,
}

return skillConfig