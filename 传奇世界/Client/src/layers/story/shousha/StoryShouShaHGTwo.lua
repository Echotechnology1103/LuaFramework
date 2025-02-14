local StoryShouShaHGTwo = class("StoryShouShaHGTwo", require ("src/layers/story/shousha/StoryShouSha"))

local path = "res/storygs/"

function StoryShouShaHGTwo:ctor()
    require ("src/layers/story/shousha/StoryShouSha").ctor(self) 
    self.RolesAI = {}
    self.playerTab = {{},{},{}}
end

function StoryShouShaHGTwo:updateState()  
    print("[StoryShouShaHGTwo:updateState] ..... state = " .. self.state)
	self.state = self.state + 1
	local switch = {
        function()
            local blackGround = cc.LayerColor:create(cc.c4b(0, 0, 0, 255))
            G_MAINSCENE:addChild(blackGround, 196, 1256)

            local masking = cc.LayerColor:create(cc.c4b(0, 0, 0, 255))
            self:addChild(masking, 10000)   
            masking:runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.FadeOut:create(0.2)))

            self.m_bHidePlayer = getGameSetById(GAME_SET_ID_SHIELD_PLAYER)                       
            setGameSetById(GAME_SET_ID_SHIELD_PLAYER, 0, true)
            
            
            startTimerAction(self, 0.4, false, function() 
                       self:changeRoleDress(true)                                           
                       local name_label = G_ROLE_MAIN:getNameBatchLabel()
                       if name_label then
                           self.mainRoleColor = name_label:getColor()
                           name_label:setColor(MColor.name_blue)
                       end

                       G_ROLE_MAIN:setFactionName_ex(G_ROLE_MAIN, game.getStrByKey("story_gongsha_factionname2"))
                       G_ROLE_MAIN:setTitle_ex(G_ROLE_MAIN, 0)

                       local pos = cc.p(21, 22) -- 21 22
                       G_ROLE_MAIN:setPosition(G_MAINSCENE.map_layer:tile2Space(pos))
                       G_MAINSCENE.map_layer:initDataAndFunc(pos)
                       G_MAINSCENE.map_layer:setDirectorScale(nil, pos)
                       G_MAINSCENE.map_layer:moveMapByPos(cc.p(pos.x, pos.y), false)
                       G_ROLE_MAIN:setSpriteDir(7)
                       --self:addTSXLEff()
                       self:addTaskInfo(3)
                       self:createDefender()
                       self:createAttacker()

                       self:createExitBtn()

                       self:updateState()
                       --AudioEnginer.setIsNoPlayEffects(false)
                   end)

        end
        ,
        function()
            self.m_manualFight = true
            G_MAINSCENE:setFullShortNode(false)
            self:addSkill()
            G_MAINSCENE.operate_node:setLocalZOrder(199)
            G_MAINSCENE.skill_node:setLocalZOrder(199)
            G_MAINSCENE.bloodNode:setLocalZOrder(199)
            self:createHangNode()

            startTimerAction(self, 0.5, false, function() self.needAutoAtk = 2 self.m_canPlayerHurt = true end)          
            startTimerAction(self, 1, false, function() for k,v in pairs(self.RolesAI) do v:fight() end end)
            AudioEnginer.playEffect("sounds/storyVoice/gs6.mp3",false)

            self.hurtAction = startTimerAction(self, 0.1, true, function() 
                    local bAllDie = true
                    for m, n in pairs(self.playerTab[self.hositleTeam]) do
                        if n ~= nil and n:isVisible() and n:getHP() > 0 then
                            bAllDie = false
                            break
                        end
                    end

                    if bAllDie then                      
                        self:stopAction(self.hurtAction)
                        self.hurtAction = nil                             
                        self:updateState()
                    end                    
            end)         
        end
        ,
        function()
            G_MAINSCENE.operate_node:setLocalZOrder(6)
            G_MAINSCENE.skill_node:setLocalZOrder(6)
            G_MAINSCENE.bloodNode:setLocalZOrder(6)
            self:hideHangNode()
            self.m_manualFight = false            
            self:createLead()
            self:updateState()
        end
        ,
        function()
            self:addTalk(203)
        end
        ,
        function()
            self:addTalk(204)
        end
        ,
        function()
            self:addTaskInfo(4)
            self.m_manualFight = true
            G_MAINSCENE.operate_node:setLocalZOrder(199)
            G_MAINSCENE.skill_node:setLocalZOrder(199)
            G_MAINSCENE.bloodNode:setLocalZOrder(199)
            self:showHangNode()
            startTimerAction(self, 2, false, function() 
                for m, n in pairs(self.playerTab[self.factionTeam]) do
                    if n ~= nil and n:isVisible() and n:getHP() > 0 and n.storyai then
                        n.storyai.m_dstPos = self.outPos
                        n.storyai.m_bDisappearAfterMove = true
                    end
                end
            end)
            self.needAutoAtk = 0
            self.notAddHp = true
            self:addPathPoint(self.outPos, false)            

            --AudioEnginer.playEffect("sounds/storyVoice/gs5.mp3",false)
            self.hurtAction = startTimerAction(self, 0.1, true, function() 
                local cur = G_MAINSCENE.map_layer:space2Tile(cc.p(G_ROLE_MAIN:getPosition()))
                if math.abs(cur.x - self.outPos.x) < 2 and math.abs(cur.y - self.outPos.y) < 2 then
                    self:stopAction(self.hurtAction)
                    self.hurtAction = nil
                    self.m_manualFight = false
                    startTimerAction(self, 1, false, function() self:endStroy() end)
                end                                      
            end)         
        end
        ,
    }

 	if switch[self.state] then 
 		switch[self.state]()
 	end
end

function StoryShouShaHGTwo:endStroy()
    if self.isExitBtnCall then
        g_msgHandlerInst:sendNetDataByTableExEx(COPY_CS_EXITCOPY,"ExitCopyProtocol", {})
        addNetLoading(COPY_CS_EXITCOPY,FRAME_SC_ENTITY_ENTER)
    else
        local proto = {}
        proto.copyId = 6008
        proto.isInCopy = 1
        g_msgHandlerInst:sendNetDataByTableExEx(COPY_CS_ENTERCOPY, "EnterCopyProtocol", proto);
    end
    
    self.isEnd = true
    game.setAutoStatus(0)
    self:hideHangNode()

    if self.schedulerHandle then 
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry( self.schedulerHandle ) 
        self.schedulerHandle = nil
    end 

    --移除魔法盾效果
    setGameSetById(GAME_SET_ID_SHIELD_PLAYER, self.m_bHidePlayer, true)
    for m, n in pairs(self.playerTab[1]) do
        if n ~= nil and n:getHP() == 0 then
            n:setVisible(false)
        end
    end

    --移除中毒效果
    G_ROLE_MAIN:setColor(cc.c3b(255, 255, 255))

    for m, n in pairs(self.playerTab[2]) do
        if n ~= nil and n:getHP() == 0 then
            n:setVisible(false)
        end
    end

    for m, n in pairs(self.playerTab[3]) do
        if n ~= nil and n:getHP() == 0 then
            n:setVisible(false)
        end
    end
    self:stopAllActions()
    self:changeRoleDress(false)

    self:removeSkill()
    --AudioEnginer.setIsNoPlayEffects(getGameSetById(GAME_SET_ID_CLOSE_VOICE)==0)
    --self:removeAudioEffect()

    self:removePathPoint()  

    G_MAINSCENE.map_layer:setMapActionFlag(true)
    G_MAINSCENE:removeChildByTag(1256)

    G_ROLE_MAIN.base_data.spe_skill = {}
    G_MAINSCENE.map_layer:resetSpeed(g_speed_time)

    local name_label = G_ROLE_MAIN:getNameBatchLabel()
    if name_label then
        name_label:setColor(self.mainRoleColor)
    end

    local FactinName = require("src/layers/role/RoleStruct"):getAttr(PLAYER_FACTIONNAME)
    if FactinName then
        G_ROLE_MAIN:setFactionName_ex(G_ROLE_MAIN, FactinName)
    else
        G_ROLE_MAIN:setFactionName_ex(G_ROLE_MAIN, "")        
    end
    local titleId = require("src/layers/role/RoleStruct"):getAttr(PLAYER_TITLE)
    if titleId then
        G_ROLE_MAIN:setTitle_ex(G_ROLE_MAIN, titleId)
    end

    
    --g_msgHandlerInst:sendNetDataByTableExEx(SHAWAR_CS_REQUEST_UPDATE_MONIWAR_STAGE, "ShaWarRequestUpdateMoniWarStage", {stage=3})

    --G_MAINSCENE:exitStoryMode()
end

function StoryShouShaHGTwo:createDefender()
    local num = 20
    local startIndex = math.random(5, 30)
    local items = require("src/config/storyPlayer")
    for i=1,num do
        local cfg = copyTable(items[i + startIndex])
        cfg.q_src_x = math.random(14, 20)
        cfg.q_src_y = math.random(18, 23)
        cfg.teamId = self.factionTeam
        local player = self:createPlayerBycfg(cfg, true)
        table.insert(self.playerTab[self.factionTeam], player)
        player:setFactionName_ex(player, game.getStrByKey("story_gongsha_factionname2"))

        --关联AI
        local ai = require("src/layers/story/shousha/StoryShouShaPlayer").new(self, player, cfg.q_school,self.factionTeam)
        player.storyai = ai
        table.insert(self.RolesAI, ai)
    end
    table.insert(self.playerTab[self.factionTeam], G_ROLE_MAIN)
end

function StoryShouShaHGTwo:createAttacker()
    local num = 20
    local posCfg = {{cc.p(10, 22), cc.p(15, 26)},
                    {cc.p(21, 15), cc.p(26, 19)},}
    local stepStart = math.random(100, 150)                    
    local items = require("src/config/storyPlayer")
    for i=1,num do
        local cfg = copyTable(items[i + stepStart])
        local randIndex = math.random(1, 2)
        local tempindex = (i > num/ 2) and 1 or 2
        local pos = posCfg[tempindex][randIndex]
        cfg.q_src_x = math.random(1, 3) + pos.x
        cfg.q_src_y = math.random(1, 3) + pos.y        
        
        cfg.teamId = self.hositleTeam
        local player = self:createPlayerBycfg(cfg)
        table.insert(self.playerTab[self.hositleTeam], player)
        player:setFactionName_ex(player, game.getStrByKey("story_gongsha_factionname1"))

        --关联AI
        local ai = require("src/layers/story/shousha/StoryShouShaPlayer").new(self, player, cfg.q_school,self.hositleTeam)
        player.storyai = ai
        table.insert(self.RolesAI, ai)
    end
end

function StoryShouShaHGTwo:createLead()
    self.outPos = cc.p(24, 25)
    local transforEffect = Effects:create(false)
    transforEffect:setAnchorPoint(cc.p(0.5, 0.5))
    local t_pos = G_MAINSCENE.map_layer:tile2Space(self.outPos)
    transforEffect:setPosition(t_pos)
    G_MAINSCENE.map_layer:addChild(transforEffect)
    transforEffect:playActionData("transfor", 15, 2, -1)
    transforEffect:setScale(1.1)

    local cfg = {}
    cfg.q_id = 10000
    cfg.q_school = 3
    cfg.q_sex = 1
    cfg.q_level = 999
    cfg.q_hp = 999
    cfg.q_name = "道尊·百谷"
    cfg.q_weapon = 5130107
    cfg.q_body = 5130507
    cfg.q_wing = 6031
    cfg.q_src_x = self.outPos.x
    cfg.q_src_y = self.outPos.y
    cfg.q_dir = 7
    cfg.teamId = self.factionTeam
    local zhanshi = self:createPlayerBycfg(cfg)
    self.zhanshi = zhanshi
    zhanshi:setFactionName_ex(zhanshi, game.getStrByKey("story_gongsha_factionname2"))
    local ai = require("src/layers/story/shousha/StoryShouShaPlayer").new(self, zhanshi, cfg.q_school,self.factionTeam)
    zhanshi.storyai = ai
    table.insert(self.RolesAI, ai)     
end

function StoryShouShaHGTwo:getHurtNum(skillID, target)
    if target == self.specPlayer or target == self.zhanshi then
        return 0 
    elseif skillID == 1006 then
        return math.random(2000,3600)
    elseif skillID == 1004 then
        return math.random(500,1000)
    elseif skillID == 1003 then
        return math.random(800,1500)
    elseif skillID == 1010 then
        return math.random(1000,2000)
    elseif skillID == 2010 then
        return math.random(1000,2000)
    elseif skillID == 2011 then
        return math.random(400,600)
    elseif skillID == 3011 then
        return math.random(900,1800)
    elseif skillID == 3004 then
        return math.random(60,100)
    elseif skillID == 9999 then   --神兽
        return math.random(100,150)
    elseif skillID == 9998 then   --士兵
        return math.random(10,14)
    elseif skillID == 9997 then   --怪物
        return math.random(8,12)
    else
        return 100
    end
end

function StoryShouShaHGTwo:getHurtNumPlayer(skillID, player, target)
    local num = 0
    if target == G_ROLE_MAIN then
        num = math.random(1, 5)
    elseif target == self.specPlayer then
        num = 0
    elseif skillID == 1006 then
        num = math.random(600,800)
    elseif skillID == 1003 then
        num = math.random(600,800)
    elseif skillID == 2010 then
        num = math.random(600,800)
    elseif skillID == 2011 then
        num = math.random(200,300)
    elseif skillID == 3011 then
        num = math.random(600,800)
    elseif skillID == 3004 then
        num = math.random(100,150)
    else
        num = 100
    end     

    if player and player.teamId == self.factionTeam then
        num = num * 5
    else
        num = num
    end

    return num
end

return StoryShouShaHGTwo