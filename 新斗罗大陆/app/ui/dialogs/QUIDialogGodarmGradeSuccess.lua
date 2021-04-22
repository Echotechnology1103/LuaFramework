-- @Author: liaoxianbo
-- @Date:   2019-12-31 11:43:07
-- @Last Modified by:   xurui
-- @Last Modified time: 2020-01-21 16:28:36
local QUIDialog = import("..dialogs.QUIDialog")
local QUIDialogGodarmGradeSuccess = class("QUIDialogGodarmGradeSuccess", QUIDialog)
local QHeroModel = import("...models.QHeroModel")
local QUIWidgetGodarmBox = import("..widgets.QUIWidgetGodarmBox")
local QUIWidgetHeroHeadVibrate = import("..widgets.QUIWidgetHeroHeadVibrate")
local QColorLabel = import("...utils.QColorLabel")
local QUIWidgetTitelEffect = import("..widgets.QUIWidgetTitelEffect")

function QUIDialogGodarmGradeSuccess:ctor(options)
	local ccbFile = "ccb/Dialog_Weapon_sxcg_09.ccbi"
	local callBacks = {}
	QUIDialogGodarmGradeSuccess.super.ctor(self,ccbFile,callBacks,options)

    self.isAnimation = true --是否动画显示
	app.sound:playSound("hero_breakthrough")
	self._isEnd = false
	
	local titleWidget = QUIWidgetTitelEffect.new()
	self._ccbOwner.node_title_effect:addChild(titleWidget)

	self._callback = options.callback
	self._godarmId = options.godarmId
	self._godarmInfo = remote.godarm:getGodarmById(self._godarmId)

    self._animationManager = tolua.cast(self._view:getUserObject(), "CCBAnimationManager")
    self._animationManager:runAnimationsForSequenceNamed("1")
    self._animationManager:connectScriptHandler(handler(self, self.animationEndHandler))

	local oldGradeConfig = db:getGradeByHeroActorLevel(self._godarmInfo.id, self._godarmInfo.grade-1) or {}
    local charaterConfig = db:getCharacterByID(self._godarmInfo.id)
    local oldMountBox = QUIWidgetGodarmBox.new()
    local oldMountInfo = clone(self._godarmInfo)
    oldMountInfo.grade = oldMountInfo.grade-1

    oldMountBox:setGodarmInfo(oldMountInfo)
    self._ccbOwner.old_head:addChild(oldMountBox)
    self._ccbOwner.tf_old_name:setString(charaterConfig.name)

    local props = remote.godarm:getUIPropInfo(oldGradeConfig)
	local index = 1
	for i, prop in ipairs(props) do
		if self._ccbOwner["prop_node_"..index] then
			self._ccbOwner["name_"..index]:setString(prop.name)
			self._ccbOwner["old_prop_"..index]:setString(prop.value)
		end
		index = index + 1
	end

	local newGradeConfig = db:getGradeByHeroActorLevel(self._godarmInfo.id, self._godarmInfo.grade) or {}
    local newMountBox = QUIWidgetGodarmBox.new()
    local newMountInfo = clone(self._godarmInfo)

    newMountBox:setGodarmInfo(newMountInfo)
    newMountBox:setStarVisible(false)

	self._newHeadVibrate = QUIWidgetHeroHeadVibrate.new({star = newMountInfo.grade + 1, head = newMountBox, scale = 0.8})
	self._newHeadVibrate:setStarPosition(0, 6)
	self._ccbOwner.new_head:addChild(self._newHeadVibrate)
	self._scheduler = scheduler.performWithDelayGlobal(function ( ... )
		self._newHeadVibrate:playStarAnimation()
	end, 1.7)

    self._ccbOwner.tf_new_name:setString(charaterConfig.name)
    local props = remote.godarm:getUIPropInfo(newGradeConfig)
	local index = 1
	for i, prop in ipairs(props) do
		if self._ccbOwner["prop_node_"..index] then
			self._ccbOwner["new_prop_"..index]:setString(prop.value)
		end
		index = index + 1
	end

	self._ccbOwner.tf_skill_name:setString("")
	self._ccbOwner.tf_skill_desc:setString("")
	self._ccbOwner.node_skill:setCascadeOpacityEnabled(true)
	self._ccbOwner.node_skill:setOpacity(0)
	self._skillProcess = 0
	self._skillIndex = 0
end

function QUIDialogGodarmGradeSuccess:animationEndHandler(name)
	self._animationStage = name
end

function QUIDialogGodarmGradeSuccess:skillHandler()
	self._animationStage = "3"
	local mountGradeConfig = db:getGradeByHeroActorLevel(self._godarmInfo.id, self._godarmInfo.grade)
	if mountGradeConfig and mountGradeConfig.god_arm_skill_sz ~= nil and mountGradeConfig.god_arm_skill_sz ~= "" then
		local skillIds = string.split(mountGradeConfig.god_arm_skill_sz, ":")
		self._skillId = tonumber(skillIds[1])
		local skillConfig = db:getSkillByID(self._skillId)
		if skillConfig ~= nil then
			if self._skillProcess == 1 then
				self._animationManager:runAnimationsForSequenceNamed("3")
			elseif self._skillProcess == 4 then
				self._ccbOwner.tf_skill_name:setString("")
				self._ccbOwner.tf_skill_desc:setString("")
				self._ccbOwner.node_skill:setOpacity(0)
			end
			print("下一步---self._skillProcess=",self._skillProcess)
			self._ccbOwner.node_status2:setVisible(true)
			self:setIconPath(skillConfig.icon)
			local actionArrayIn = CCArray:create()
			actionArrayIn:addObject(CCFadeIn:create(0.5))
			actionArrayIn:addObject(CCCallFunc:create(function ()
			  	self._actionHandler = nil
			  	self:wordTypewriterEffect(self._ccbOwner.tf_skill_name, "效果更新："..skillConfig.name, function ()
					local skillDesc = q.getSkillMainDesc(skillConfig.description or "")
			        skillDesc = QColorLabel.removeColorSign(skillDesc)
			  		self:wordTypewriterEffect(self._ccbOwner.tf_skill_desc, skillDesc, function ()
						self._skillProcess = self._skillProcess + 2	
						if self._skillProcess == 6 then
							self._isEnd = true
						end
			  		end)
			  	end)
			end))
			local ccsequence = CCSequence:create(actionArrayIn)
			self._actionHandler = self._ccbOwner.node_skill:runAction(ccsequence)
			return
		else
			self._isEnd = true
			self:_onTriggerClose()
		end
	else
		self._isEnd = true
		self:_onTriggerClose()
	end
end

function QUIDialogGodarmGradeSuccess:skillHandler2()
	self._animationStage = "3"
	local mountGradeConfig = db:getGradeByHeroActorLevel(self._godarmInfo.id, self._godarmInfo.grade)
	if mountGradeConfig and mountGradeConfig.god_arm_skill_sz ~= nil and mountGradeConfig.god_arm_skill_yz ~= "" then
		local skillIds = string.split(mountGradeConfig.god_arm_skill_yz, ":")
		self._skillId = tonumber(skillIds[1])
		local skillConfig = db:getSkillByID(self._skillId)
		if skillConfig ~= nil then
			if self._skillProcess == 1 then
				self._animationManager:runAnimationsForSequenceNamed("3")
			elseif self._skillProcess == 4 then
				self._ccbOwner.tf_skill_name:setString("")
				self._ccbOwner.tf_skill_desc:setString("")
				self._ccbOwner.node_skill:setOpacity(0)
			end
			self._ccbOwner.node_status2:setVisible(true)
			self:setIconPath(skillConfig.icon)
			local actionArrayIn = CCArray:create()
			actionArrayIn:addObject(CCFadeIn:create(0.5))
			actionArrayIn:addObject(CCCallFunc:create(function ()
			  	self._actionHandler = nil
			  	self:wordTypewriterEffect(self._ccbOwner.tf_skill_name, "效果更新："..skillConfig.name, function ()
					local skillDesc = q.getSkillMainDesc(skillConfig.description or "")
			        skillDesc = QColorLabel.removeColorSign(skillDesc)
			  		self:wordTypewriterEffect(self._ccbOwner.tf_skill_desc, skillDesc, function ()
						self._skillProcess = self._skillProcess + 2	
						if self._skillProcess == 6 then
							self._isEnd = true
						end
			  		end)
			  	end)
			end))
			local ccsequence = CCSequence:create(actionArrayIn)
			self._actionHandler = self._ccbOwner.node_skill:runAction(ccsequence)
			return
		else
			self._isEnd = true
			self:_onTriggerClose()
		end
	else
		self._isEnd = true
		self:_onTriggerClose()
	end
end

function QUIDialogGodarmGradeSuccess:wordTypewriterEffect(tf, word, callback)
	if tf == nil or word == nil then
		if callback ~= nil then callback() end
		return false
	end
	if self._typewriterCallback ~= nil then
		if callback ~= nil then callback() end
		return false
	end
	self._typewriterTF = tf
	self._typewriterWord = word
	self._typewriterCallback = callback

	self._sayPosition = 1
	self._typewriterSayWord = ""
	self._typewriterTF:setString(self._typewriterSayWord)
	self._delayTime = TUTORIAL_ONEWORD_TIME * 0.3
	self._isExist = true

	if self._typewriterHandler == nil then
		self._typewriterHandler = function ()
			if self._isExist ~= true then return end
			local c = string.sub(self._typewriterWord,self._sayPosition,self._sayPosition)
	        local b = string.byte(c) or 0
	        local str = c
	        if b > 128 then
	           str = string.sub(self._typewriterWord,self._sayPosition,self._sayPosition + 2)
	           self._sayPosition = self._sayPosition + 2
	        end
            self._typewriterSayWord =  self._typewriterSayWord .. str
			self._typewriterTF:setString(self._typewriterSayWord)
        	self._sayPosition = self._sayPosition + 1

        	if self._sayPosition <= #self._typewriterWord then
		        self._typewriterTimeHandler = scheduler.performWithDelayGlobal(self._typewriterHandler,self._delayTime)
		    else
		        if self._typewriterCallback ~= nil then
		        	local callBack = self._typewriterCallback
		            self._typewriterCallback = nil
		            callBack()
		        end
		        self._typewriterTimeHandler = nil
		    end
		end
	end
	self._typewriterHandler()
end

function QUIDialogGodarmGradeSuccess:setIconPath(path)
	if not path then
		return
	end
    self._ccbOwner.node_icon:setTexture(CCTextureCache:sharedTextureCache():addImage(path))
end

function QUIDialogGodarmGradeSuccess:_onTriggerClose()
	if self._isEnd == true then
		if self._callback ~= nil then
			self._callback()
		end
		if self._scheduler then
			scheduler.unscheduleGlobal(self._scheduler)
			self._scheduler = nil
		end

		self:playEffectOut()
	else
		if self._animationStage == nil then
			self._animationStage = "1"
			self._animationManager:runAnimationsForSequenceNamed("2")
		elseif self._animationStage == "1" then
			return
		else
			if self._skillProcess == 0 then
				self._skillProcess = self._skillProcess + 1
				self._skillIndex = 1
				self:skillHandler()
			elseif self._skillProcess == 1 then
				self._skillProcess = self._skillProcess + 1
				self:jumpSkillAnimation()
				scheduler.performWithDelayGlobal(function()
					self._skillProcess = self._skillProcess + 1
					end, 1)
			elseif self._skillProcess == 3 then
				self._skillProcess = self._skillProcess + 1
				self._skillIndex = 2
				self:skillHandler2()
			elseif self._skillProcess == 4 then
				self._skillProcess = self._skillProcess + 1
				self:jumpSkillAnimation2()
				scheduler.performWithDelayGlobal(function()
						self._isEnd = true
					end, 1)								
			end		
		end
	end
end

function QUIDialogGodarmGradeSuccess:jumpSkillAnimation( ... )
    if self._typewriterTimeHandler ~= nil then
    	scheduler.unscheduleGlobal(self._typewriterTimeHandler)
    	self._typewriterTimeHandler = nil
    end
    if self._actionHandler ~= nil then
    	self._ccbOwner.node_skill:stopAction(self._actionHandler)
    	self._actionHandler = nil
    end
    self._typewriterCallback = nil

	local mountGradeConfig = db:getGradeByHeroActorLevel(self._godarmInfo.id, self._godarmInfo.grade)
	if mountGradeConfig and mountGradeConfig.god_arm_skill_sz ~= nil and mountGradeConfig.god_arm_skill_sz ~= "" then
		local skillIds = string.split(mountGradeConfig.god_arm_skill_sz, ":")
		self._skillId = tonumber(skillIds[1])
		local skillConfig = db:getSkillByID(self._skillId)
		self._ccbOwner.node_skill:setOpacity(255)
		self._ccbOwner.tf_skill_name:setString("效果更新："..skillConfig.name)
		local skillDesc = q.getSkillMainDesc(skillConfig.description or "")
  		skillDesc = QColorLabel.removeColorSign(skillDesc)
		self._ccbOwner.tf_skill_desc:setString(skillDesc)
	end
end

function QUIDialogGodarmGradeSuccess:jumpSkillAnimation2( ... )
    if self._typewriterTimeHandler ~= nil then
    	scheduler.unscheduleGlobal(self._typewriterTimeHandler)
    	self._typewriterTimeHandler = nil
    end
    if self._actionHandler ~= nil then
    	self._ccbOwner.node_skill:stopAction(self._actionHandler)
    	self._actionHandler = nil
    end
    self._typewriterCallback = nil

	local mountGradeConfig = db:getGradeByHeroActorLevel(self._godarmInfo.id, self._godarmInfo.grade)
	if mountGradeConfig and mountGradeConfig.god_arm_skill_yz ~= nil and mountGradeConfig.god_arm_skill_yz ~= "" then
		local skillIds = string.split(mountGradeConfig.god_arm_skill_yz, ":")
		self._skillId = tonumber(skillIds[1])
		local skillConfig = db:getSkillByID(self._skillId)
		self._ccbOwner.node_skill:setOpacity(255)
		self._ccbOwner.tf_skill_name:setString("效果更新："..skillConfig.name)
		local skillDesc = q.getSkillMainDesc(skillConfig.description or "")
  		skillDesc = QColorLabel.removeColorSign(skillDesc)
		self._ccbOwner.tf_skill_desc:setString(skillDesc)
	end
end
function QUIDialogGodarmGradeSuccess:_backClickHandler()
	self:_onTriggerClose()
end

return QUIDialogGodarmGradeSuccess
