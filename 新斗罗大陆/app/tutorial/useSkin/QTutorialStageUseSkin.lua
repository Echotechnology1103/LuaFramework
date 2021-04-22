--
-- zxs
-- 使用皮肤引导
--
local QTutorialStage = import("..QTutorialStage")
local QTutorialStageUseSkin = class("QTutorialStageUseSkin", QTutorialStage)
local QTutorialPhase01UseSkin = import(".QTutorialPhase01UseSkin")

function QTutorialStageUseSkin:ctor(options)
	QTutorialStageUseSkin.super.ctor(self)
	self._enableTouch = false
end

function QTutorialStageUseSkin:_createTouchNode()
	local touchNode = CCNode:create()
	touchNode:setCascadeBoundingBox(CCRect(0.0, 0.0, display.width, display.height))
	touchNode:setTouchMode(cc.TOUCH_MODE_ONE_BY_ONE)
	touchNode:setTouchSwallowEnabled(true)
	app.tutorialNode:addChild(touchNode)
	self._touchNode = touchNode
end

function QTutorialStageUseSkin:_createPhases()
	table.insert(self._phases, QTutorialPhase01UseSkin.new(self))

	self._phaseCount = table.nums(self._phases)
end

function QTutorialStageUseSkin:enableTouch(func)
	self._enableTouch = true
	self._touchCallBack = func
end

function QTutorialStageUseSkin:disableTouch()
	self._enableTouch = false
	self._touchCallBack = nil
end

function QTutorialStageUseSkin:start()
	self:_createTouchNode()
	self._touchNode:setTouchEnabled(true)
	self._touchNode:addNodeEventListener(cc.NODE_TOUCH_EVENT, handler(self, QTutorialStageUseSkin._onTouch))
	QTutorialStageUseSkin.super.start(self)
end

function QTutorialStageUseSkin:ended()
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

function QTutorialStageUseSkin:_onTouch(event)
	if self._enableTouch == true and self._touchCallBack ~= nil then
		return self._touchCallBack(event)
	elseif event.name == "began" then
		return true
	end
end

return QTutorialStageUseSkin
