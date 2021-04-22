-- @Author: xurui
-- @Date:   2018-11-16 20:27:10
-- @Last Modified by:   xurui
-- @Last Modified time: 2018-11-16 20:28:07
local QTutorialStage = import("..QTutorialStage")
local QTutorialStageStromArena = class("QTutorialStageStromArena", QTutorialStage)

local QStaticDatabase = import("...controllers.QStaticDatabase")
local QUIViewController = import("...ui.QUIViewController")
local QTutorialPhase01StormArena = import(".QTutorialPhase01StormArena")

function QTutorialStageStromArena:ctor()
	QTutorialStageStromArena.super.ctor(self)
    self._enableTouch = false
end

function QTutorialStageStromArena:_createTouchNode()
	local touchNode = CCNode:create()
    touchNode:setCascadeBoundingBox(CCRect(0.0, 0.0, display.width, display.height))
    touchNode:setTouchMode(cc.TOUCH_MODE_ONE_BY_ONE)
    touchNode:setTouchSwallowEnabled(true)
    app.tutorialNode:addChild(touchNode)
    self._touchNode = touchNode
end

function QTutorialStageStromArena:enableTouch(func)
	self._enableTouch = true
	self._touchCallBack = func
end

function QTutorialStageStromArena:disableTouch()
	self._enableTouch = false
	self._touchCallBack = nil
end

function QTutorialStageStromArena:_createPhases()
	table.insert(self._phases, QTutorialPhase01StormArena.new(self))

	self._phaseCount = table.nums(self._phases)
end

function QTutorialStageStromArena:start()
	self:_createTouchNode()
	self._touchNode:setTouchEnabled(true)
	self._touchNode:addNodeEventListener(cc.NODE_TOUCH_EVENT, handler(self, QTutorialStageStromArena._onTouch))
	QTutorialStageStromArena.super.start(self)
end

function QTutorialStageStromArena:ended()
	if self._forceStop ~= true then
		local page = app:getNavigationManager():getController(app.mainUILayer):getTopPage()
		page:buildLayer()
		scheduler.performWithDelayGlobal(function()
			page:checkGuiad()
		end,0)
	end
	if self._touchNode ~= nil then
		self._touchNode:setTouchEnabled( false )
		self._touchNode:removeFromParent()
		self._touchNode = nil
	end
end

function QTutorialStageStromArena:_onTouch(event)
	if self._enableTouch == true and self._touchCallBack ~= nil then
		return self._touchCallBack(event)
    elseif event.name == "began" then
        return true
    end
end

return QTutorialStageStromArena
