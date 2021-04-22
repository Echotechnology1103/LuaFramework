--
-- Author: xurui
-- Date: 2015-12-25 18:12:27
--
local QTutorialPhase = import("..QTutorialPhase")
local QTutorialPhase01Arena = class("QTutorialPhase01Arena", QTutorialPhase)

local QUIViewController = import("...ui.QUIViewController")
local QUIWidgetTutorialDialogue = import("...ui.widgets.QUIWidgetTutorialDialogue")
local QUIWidgetTutorialHandTouch = import("...ui.widgets.QUIWidgetTutorialHandTouch")
local QNotificationCenter = import("...controllers.QNotificationCenter")
local QTutorialEvent = import("..event.QTutorialEvent")
local QTutorialDirector = import("..QTutorialDirector")
local QNavigationController = import("...controllers.QNavigationController")
local QStaticDatabase = import("...controllers.QStaticDatabase")
local QUIGestureRecognizer = import("...ui.QUIGestureRecognizer")

function QTutorialPhase01Arena:start()
	self._stage:enableTouch(handler(self, self._onTouch))
	self._step = 0
    self._tutorialInfo = {}

	local page = app:getNavigationManager():getController(app.mainUILayer):getTopPage()
	page:cleanBuildLayer()

	if app.tutorial:checkCurrentDialog() == false then 
   		self:_jumpToEnd()
        return 
   	end

	local stage = app.tutorial:getStage()
	self._isStormArena = false
	if stage.arena == 1 then
		stage.arena = 2
		self._isStormArena = true
	else
		stage.arena = 1
	end
	app.tutorial:setStage(stage)
	app.tutorial:setFlag(stage)

	self._step = 0
	self._perCP = ccp(display.width/2, display.height/2)

	
   	if app.tip.UNLOCK_TIP_ISTRUE == false then
		app.tip:showUnlockTips(UNLOCK_TUTORIAL_TIPS_TYPE.unlockArena)
	else
		app.tip:addUnlockTips(UNLOCK_TUTORIAL_TIPS_TYPE.unlockArena)
	end
	self._schedulerHandler = scheduler.performWithDelayGlobal(function()
		self:stepManager()
	end, UNLOCK_DELAY_TIME + 0.5)

end
--步骤管理
function QTutorialPhase01Arena:stepManager()
	if self._step == 0 then
		self:_guideStart()
	elseif self._step == 1 then
		self:chooseNextStage()
	elseif self._step == 2 then
		self:_guideClickMainpage()
	elseif self._step == 3 then
		self:_backMainPage()
	elseif self._step == 4 then
		self:_openArena()
	elseif self._step == 5 then
		self:_chooseEnemy()
	elseif self._step == 6 then
		self:_clickEnemy()
	end
end

--引导开始
function QTutorialPhase01Arena:_guideStart()
	self:clearSchedule()
	if self._isStormArena then
    	self._tutorialInfo, self._sound = app.tutorial:splitTutorialWord("3901")
	else
    	self._tutorialInfo, self._sound = app.tutorial:splitTutorialWord("3201")
    end
    self._distance = "left"
    self:createDialogue()
end

function QTutorialPhase01Arena:chooseNextStage()
    self:clearDialgue()

    -- 数据埋点
	app:triggerBuriedPoint(21470)

	self.firstDialog = app:getNavigationManager():getController(app.mainUILayer):getTopDialog()
	self.firstPage = app:getNavigationManager():getController(app.mainUILayer):getTopPage()
	if self.firstDialog == nil and self.firstPage.class.__cname == "QUIPageMainMenu" then
		self._step = 3
		self:_guideClickArena()
	else
		self._step = 2
		self:_guideClickMainpage()
	end
end 

--引导玩家点击扩展标签
function QTutorialPhase01Arena:_guideClickMainpage()
	--  self:clearSchedule()
    self:clearDialgue()
	local page = app:getNavigationManager():getController(app.mainUILayer):getTopPage()
	self._CP = page._ccbOwner.btn_home:convertToWorldSpaceAR(ccp(0,0))
	self._size = page._ccbOwner.btn_home:getContentSize()
	self._perCP = ccp(display.width/2, display.height/2)
	-- self._handTouch = QUIWidgetTutorialHandTouch.new({word = "点击返回主界面", direction = "right"})
	self._handTouch = QUIWidgetTutorialHandTouch.new({attack = true})
	self._handTouch:setPosition(self._CP.x, self._CP.y)
	app.tutorialNode:addChild(self._handTouch)
end

function QTutorialPhase01Arena:_backMainPage()
	self._handTouch:removeFromParent()
	local page = app:getNavigationManager():getController(app.mainUILayer):getTopPage()
	page:_onTriggerHome()

    -- 数据埋点
	app:triggerBuriedPoint(21480)

	self._schedulerHandler = scheduler.performWithDelayGlobal(function()
		self:_guideClickArena()
	end,0.5)
end

--引导玩家点击魂师总览按钮
function QTutorialPhase01Arena:_guideClickArena()
	self:clearSchedule()
	local page = app:getNavigationManager():getController(app.mainUILayer):getTopPage()
	
	local node = "arena_node"
	local btn = "btn_arena"
	local direction = "up"
	local offsetX = 10
	local offsetY = 60
	if self._isStormArena then
		node = "storm_node"
		btn = "btn_stormArena"
		direction = "down"
		offsetX = 0
		offsetY = 0
	end
	self.moveDistance = page._ccbOwner[node]:convertToWorldSpaceAR(ccp(0, 0))
	page._pageSilder:stopAllAction()
	local speedRateX = page._pageSilder:getSpeedRateByIndex(5)
	page._pageSilder:_onTouch({name = QUIGestureRecognizer.EVENT_SLIDE_GESTURE, distance = {x = (-self.moveDistance.x + display.cx)/speedRateX, y = 0}})

	self._schedulerHandler = scheduler.performWithDelayGlobal(function()
		local page = app:getNavigationManager():getController(app.mainUILayer):getTopPage()
		self._CP = page._ccbOwner[btn]:convertToWorldSpaceAR(ccp(0,0))
		self._size = page._ccbOwner[btn]:getContentSize()
		-- self._handTouch = QUIWidgetTutorialHandTouch.new({word = "点击进入", direction = direction})
		self._CP.x = self._CP.x + offsetX
		self._CP.y = self._CP.y + offsetY
		self._handTouch = QUIWidgetTutorialHandTouch.new({id = 10014, attack = true, pos = self._CP})
		self._handTouch:setPosition(self._CP.x, self._CP.y)
		app.tutorialNode:addChild(self._handTouch)
	end, 0.8)
end

function QTutorialPhase01Arena:_openArena()
	self._handTouch:removeFromParent()
	local page = app:getNavigationManager():getController(app.mainUILayer):getTopPage()

	if self._isStormArena then
		page:_onStormArena()
	else
		page:_onArena()
	end

    -- 数据埋点
	app:triggerBuriedPoint(21490)

	self._schedulerHandler = scheduler.performWithDelayGlobal(function()
		self:_sayWord()
	end,0.5)
end

function QTutorialPhase01Arena:_sayWord()
	self:clearSchedule()
	if self._isStormArena then
    	self._tutorialInfo, self._sound = app.tutorial:splitTutorialWord("3903")
	else
    	-- self._tutorialInfo, self._sound = app.tutorial:splitTutorialWord("3103")
    	self._tutorialInfo, self._sound = app.tutorial:splitTutorialWord("5101")
    end
    self._distance = "left"
    self:createDialogue()
end

function QTutorialPhase01Arena:_chooseEnemy()
    self:clearDialgue()

    -- 数据埋点
	app:triggerBuriedPoint(21500)

	self._dialog = app:getNavigationManager():getController(app.mainUILayer):getTopDialog()
	if self._dialog == nil then
		self:_jumpToEnd()
		return
	end
	self._widget = 	self._dialog._virtualFrame[#self._dialog._virtualFrame-3].widget
	if self._widget == nil then
		self:_jumpToEnd()
		return
	end
	self._CP = self._widget._ccbOwner.btn_onPress:convertToWorldSpaceAR(ccp(0,0))
	self._size = self._widget._ccbOwner.btn_onPress:getContentSize()
	-- self._handTouch = QUIWidgetTutorialHandTouch.new({word = "点击挑战", direction = "up"})
	self._CP.y = self._CP.y - 50
	self._handTouch = QUIWidgetTutorialHandTouch.new({id = 10015, attack = true, pos = self._CP})
	self._handTouch:setPosition(self._CP.x, self._CP.y)
	app.tutorialNode:addChild(self._handTouch)
end

function QTutorialPhase01Arena:_clickEnemy()
	self._handTouch:removeFromParent()
	self._widget:_onPress()

    -- 数据埋点
	app:triggerBuriedPoint(21510)


	self:_tutorialFinished()
end

function QTutorialPhase01Arena:_tutorialFinished()
    self:clearSchedule()
	self:finished()
end

--如果出错则直接跳掉引导过程
function QTutorialPhase01Arena:_jumpToEnd()
	app.tutorial._runingStage:jumpFinished()
	self:finished()
end

--移动到指定位置
function QTutorialPhase01Arena:_nodeRunAction(posX,posY)
	self._isMove = true
	local actionArrayIn = CCArray:create()
	actionArrayIn:addObject(CCMoveBy:create(0.1, ccp(posX,posY)))
	actionArrayIn:addObject(CCCallFunc:create(function ()
		self._isMove = false
		self._actionHandler = nil
	end))
	local ccsequence = CCSequence:create(actionArrayIn)
	self._actionHandler = self._handTouch:runAction(ccsequence)
end

function QTutorialPhase01Arena:createDialogue()
	if self._dialogueRight ~= nil and self._distance ~= self._tutorialInfo[1][3] then
		self._dialogueRight:removeFromParent()
		self._dialogueRight = nil
	end
    local heroInfo = QStaticDatabase:sharedDatabase():getCharacterByID(self._tutorialInfo[1][1])
	local name = heroInfo.name or "泰奶奶"
	self._word = self._tutorialInfo[1][4] or ""
	self._distance = self._tutorialInfo[1][3]
	self._avatarKey = self._tutorialInfo[1][2]
	self._isLeft = self._distance == "left" or false
	if self._dialogueRight == nil then
		self._dialogueRight = QUIWidgetTutorialDialogue.new({avatarKey = self._avatarKey, isLeftSide = self._isLeft, text = self._word, sound = self._sound[1], name = name, heroId = heroInfo.id, isSay = true, sayFun = function()
			self._CP = {x = 0, y = 0}
			self._size = {width = display.width*2, height = display.height*2}
		end})
		self._dialogueRight:setActorImage(self._tutorialInfo[1][2])
		app.tutorialNode:addChild(self._dialogueRight)
	else
		if self._sound and self._sound[1] then
			self._dialogueRight:updateSound(self._sound[1])
		end
		self._dialogueRight:addWord(self._word)
	end
	table.remove(self._tutorialInfo, 1)
	table.remove(self._sound, 1)
end

function QTutorialPhase01Arena:_onTouch(event)
	if event.name == "began" then
		return true
	elseif event.name == "ended" then
		if self._dialogueRight ~= nil and self._dialogueRight._isSaying == true and self._dialogueRight:isVisible() then
			self._dialogueRight:printAllWord(self._word)
		elseif #self._tutorialInfo > 0 then
			self:createDialogue()
		elseif self._CP ~= nil and event.x >=  self._CP.x - self._size.width/2 and event.x <= self._CP.x + self._size.width/2 and
			event.y >=  self._CP.y - self._size.height/2 and event.y <= self._CP.y + self._size.height/2  then
			self._step = self._step + 1
			self._perCP = self._CP
			self._CP = nil
			self:stepManager()
		else
			if self._handTouch and self._handTouch.showFocus then
				self._handTouch:showFocus( self._CP )
			end
		end
	end
end

function QTutorialPhase01Arena:clearSchedule()
	if self._schedulerHandler ~= nil then
		scheduler.unscheduleGlobal(self._schedulerHandler)
		self._schedulerHandler = nil
	end
end

function QTutorialPhase01Arena:clearDialgue()
	if self._dialogueRight ~= nil then
		self._dialogueRight:removeFromParent()
		self._dialogueRight = nil
	end
end

return QTutorialPhase01Arena
