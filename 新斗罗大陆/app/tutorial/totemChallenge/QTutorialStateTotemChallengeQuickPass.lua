-- 
-- Kumo.Wang
-- 圣柱挑战神罚引导
--

local QTutorialStage = import("..QTutorialStage")
local QTutorialStateTotemChallengeQuickPass = class("QTutorialStateTotemChallengeQuickPass", QTutorialStage)
local QTutorialPhase01TotemChallengeQuickPass = import(".QTutorialPhase01TotemChallengeQuickPass")

function QTutorialStateTotemChallengeQuickPass:ctor(options)
	QTutorialStateTotemChallengeQuickPass.super.ctor(self)
	self._enableTouch = false
end

function QTutorialStateTotemChallengeQuickPass:_createTouchNode()
  	local touchNode = CCNode:create()
    touchNode:setCascadeBoundingBox(CCRect(0.0, 0.0, display.width, display.height))
    touchNode:setTouchMode(cc.TOUCH_MODE_ONE_BY_ONE)
    touchNode:setTouchSwallowEnabled(true)
    app.tutorialNode:addChild(touchNode)
    self._touchNode = touchNode
end

function QTutorialStateTotemChallengeQuickPass:_createPhases()
  table.insert(self._phases, QTutorialPhase01TotemChallengeQuickPass.new(self))

  self._phaseCount = table.nums(self._phases)
end

function QTutorialStateTotemChallengeQuickPass:enableTouch(func)
  self._enableTouch = true
  self._touchCallBack = func
end

function QTutorialStateTotemChallengeQuickPass:disableTouch()
  self._enableTouch = false
  self._touchCallBack = nil
end

function QTutorialStateTotemChallengeQuickPass:start()
  self:_createTouchNode()
  self._touchNode:setTouchEnabled(true)
  self._touchNode:addNodeEventListener(cc.NODE_TOUCH_EVENT, handler(self, QTutorialStateTotemChallengeQuickPass._onTouch))
  QTutorialStateTotemChallengeQuickPass.super.start(self)
end

function QTutorialStateTotemChallengeQuickPass:ended() 
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

function QTutorialStateTotemChallengeQuickPass:_onTouch(event)
  if self._enableTouch == true and self._touchCallBack ~= nil then
    return self._touchCallBack(event)
    elseif event.name == "began" then
        return true
    end
end

return QTutorialStateTotemChallengeQuickPass
