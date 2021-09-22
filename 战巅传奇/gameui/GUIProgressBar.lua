GUIProgressBar = class("GUIProgressBar",function ()
	  return ccui.Widget:create()
end)

function GUIProgressBar:ctor( loadingbar,lab_wdg_name )
	self.expbar=loadingbar

	self.exPercent = 0

	if lab_wdg_name and type(lab_wdg_name)=="string" then
		self.expLabel=self.expbar:getChildByName(lab_wdg_name)
	end

	self.exFactor = 0
	self.exMaxValue=0
end

function GUIProgressBar:setPercentByMaxValue(factor,maxValue)
	if type(factor)=="number" then
		factor = math.floor(factor)
	elseif type(factor)=="string" then
		factor = tonumber(string.format("%0.0f",factor))
	else
		factor = 0
	end
	maxValue = tonumber(maxValue)>0 and tonumber(maxValue) or 100
	if self.expLabel then
		self.expLabel:setString(factor.."/"..maxValue)
		self.exFactor = factor
		self.exMaxValue = maxValue
	end
	local percent = factor*100/maxValue
	if self.expbar then
		self.expbar:setPercent(percent)
		self.exPercent = percent
		self.expbar:setVisible(percent >1000/self.expbar:getContentSize().width)
	end
end

function GUIProgressBar:setPercentWithAnimation(factor,maxValue, animationCB)
	self.expbar:stopAllActions()
	if type(factor)=="number" then
		factor = math.floor(factor)
	elseif type(factor)=="string" then
		factor = tonumber(string.format("%0.0f",factor))
	end
	maxValue = tonumber(maxValue) or 100
	local times = 60
	local count = 0
	local MaxChange = maxValue > self.exMaxValue or self.exFactor>factor
	if self.exMaxValue == 0 then
		self.exMaxValue = maxValue
		MaxChange = false
		self:setPercentByMaxValue(factor,maxValue)
		return
	end
	if self.exFactor == factor and MaxChange == self.exMaxValue then return end
	local perValue = 1
	local perPercent = 1
	if MaxChange then
		times = math.floor(100-100*self.exFactor/self.exMaxValue + 100*factor/maxValue)>0 and math.floor(100-100*self.exFactor/self.exMaxValue + 100*factor/maxValue) or 1
		perValue = (-self.exFactor + self.exMaxValue + factor)/times
	else
		times = math.floor(100*(factor-self.exFactor)/maxValue)>0 and math.floor(100*(factor-self.exFactor)/maxValue) or 1
		perValue = (factor - self.exFactor)/times
	end
	local function update()
		count = count + 1
		if MaxChange then
			if self.exFactor> self.exMaxValue then
				self.exFactor = 0 --self.exFactor % self.exMaxValue
				self.exMaxValue = maxValue
				self.exPercent = 0
				MaxChange = false
			end
		end
		self.exFactor = self.exFactor + perValue
		if self.expLabel then self.expLabel:setString(math.floor(self.exFactor).."/"..self.exMaxValue) end
		self.exPercent = self.exPercent + perPercent
		self.expbar:setPercent(self.exPercent)
		self.expbar:setVisible(self.exPercent>1000/self.expbar:getContentSize().width)
		if count>=times then
			if self.expLabel then self.expLabel:setString(factor.."/"..maxValue) end
			self.exFactor = factor
			self.exMaxValue = maxValue
			self.expbar:setPercent(factor*100/maxValue)
			self.exPercent = factor*100/maxValue
			self.expbar:setVisible(self.exPercent>1000/self.expbar:getContentSize().width)
		end

	end
	self.expbar:runAction(cca.seq({cca.rep(cca.seq({cca.delay(1/60),cca.cb(update)}),times), cca.cb(animationCB)}))
end

return GUIProgressBar