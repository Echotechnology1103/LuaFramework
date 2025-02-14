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
    params.attackCallback(1)

    local tmpShake = {0, -15, 0, 1}
    --仅仅执行页面抖动
    bd.interface.shakeTimes({node = bd.layer,
        time = 3,
        direction = cc.vec3(rotationY and -tonumber(tmpShake[1]) or tonumber(tmpShake[1]), rotationX and -tonumber(tmpShake[2]) or tonumber(tmpShake[2]), tonumber(tmpShake[3])),
        duration = 0.1
    })
    if params.dmgTimes == 1 then
        bd.adapter.audio.playSound("hero_jinlunfawang_nuji.mp3")
    elseif params.dmgTimes == 4 then
        local nodeParent = params.data:get_battle_layer().heroPlant
        local p1 = bd.func.getRow(params.to[1].posId)
        local atkPos = bd.interface.getStandPos(14)
        if p1 <= 6 then
            atkPos.x = atkPos.x + 150
        else
            atkPos.x = atkPos.x - 50
        end

        atkPos.y = atkPos.y - 60
   
        local atkEffect = bd.interface.newEffect({
                parent = nodeParent,
                effectName = "hero_jinlunfawang",
                animation = "DiMian",
                scale = bd.ui_config.MinScale*0.4,
                position3D = atkPos,
                endRelease = true,
                
            })
        atkEffect:setLocalZOrder(-atkPos.y - bd.ui_config.diffz)
    end
end

local skill = {
    zhua = true,
    res = { },
    audio = {"hero_jinlunfawang_nuji.mp3"},
    excute = function(params)
        skill_func(params)
    end,
    explode = function(params)
        skill_func(params)
    end,
    type = bd.CONST.SkillType.Class1,
}

return skill
