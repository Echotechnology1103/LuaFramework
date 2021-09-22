local GUILoaderBar = class("GUILoaderBar",function ()
	  return ccui.Widget:create()
end)
--高级属性写 "GUILoaderBar"

function GUILoaderBar:ctor( params )
	self.image = params.image;
	self._fontsize = 24;
	self._fontcolor = cc.c3b(255,255,255);
	self._outlineColor = cc.c3b(0,0,0)
	self._outlineSize = 1

	self.exFactor = 0
	self.exMaxValue = 0
	self.size = self.image:getContentSize();
	self._labelformat = "%s/%s";
	self._labelformat2 = ""--"(%.2f%%)";--百分比
	self._labelVisible = true;

	self._factor = 0;
	self._maxValue = 0;
	self._perUnitCallBack = nil;
	self._time_ = 1;--1秒跑完进度条
	self:initBar();
end

function GUILoaderBar:initBar()
	local name = self.image:getName()
	self:setName(name);
	self.image:setName("imageui");
	self:setAnchorPoint(self.image:getAnchorPoint());
	self:setPosition(self.image:getPosition());

	self.label  = GameUtilSenior.newUILabel({
		text = "",
		font = "image/typeface/game.ttf",
		fontSize = self._fontsize,
		anchor = cc.p(0.5,0.5),
		color = self._fontcolor,
	})

	self.layout = ccui.Layout:create();
	self.layout:setContentSize(self.image:getContentSize());
	self.layout:setPosition(cc.p(-self.size.width/2,0))
	self.layout:setAnchorPoint(cc.p(0,0.5))
	self.layout:setClippingEnabled(true);
	self.layout:setBackGroundColor(cc.c3b(100,0,0))
	self.layout:setName("layout");
	local parent = self.image:getParent()
	if parent then
		self.image:retain();
		self.image:removeFromParent()
		self.layout:addChild(self.image);
		self.image:release()
		self:addTo(parent)--:pos(self.image:getPosition())
	else
		self.layout:addChild(self.image);		
	end
	self.image:setAnchorPoint(cc.p(0,0));
	self.image:setPosition(cc.p(0,0));
	self:addChild(self.layout)
	self:addChild(self.label)
	self.label:setLocalZOrder(5)

	self:setPercent(0)
end

function GUILoaderBar:setPercent(factor,maxValue)
	factor = checknumber(factor)
	if checknumber(maxValue)==0 then
		maxValue = 100;
	end
	local percent = factor / maxValue;
	self._factor = factor;
	self._maxValue = maxValue;
	percent = GameUtilSenior.bound(0, percent, 1)
	self.layout:setContentSize(self.size.width * percent, self.size.height);
	--self._labelformat = self._labelformat.gsub(self._labelformat, "%%d", "%%s");
	self:_setString(self._factor,self._maxValue);
	return self;
end

function GUILoaderBar:_setPercentWithAnimation(factor,maxValue, animationCB, updateFunc)
	self.layout:stopAllActions()

	maxValue = tonumber(maxValue) or 100
	local times = 60
	local count = 0

	if self._factor == factor then
		self:setPercent(factor,maxValue)
		if type(animationCB) == "function" then
			animationCB();
		end
		return self;
	end

	local perValue = 1
	local all = self._time_*times
	-- local total = math.ceil(100*(factor/maxValue - self._factor/self._maxValue))
	-- times = GameUtilSenior.bound(1,math.abs(total),times);

	perValue = (factor - self._factor)/all;
	local curfactor = self._factor;

	local function update()
		local _percent = 0;
		count = count + 1;
		curfactor = curfactor + perValue
		self:setPercent(curfactor,maxValue);
		_percent = curfactor/maxValue
		if count>=all then
			self.layout:stopAllActions()
			self:setPercent(factor,maxValue);
			_percent = factor/maxValue
		end
		if type(updateFunc) =="function" then
			updateFunc(_percent)
		end
		if type(self._perUnitCallBack) == "function" then
			self._perUnitCallBack(self)
		end
	end
	self:runAction(cca.seq({cca.rep(cca.seq({cca.delay(1/times),cca.cb(update)}),all), cca.cb(animationCB)}))
	return self;
end

function GUILoaderBar:setPercentWithAnimation(factor,maxValue, animationCB, updateFunc)
	if maxValue ~= self._maxValue and self._maxValue>0 then
		self:_setPercentWithAnimation(self._maxValue,self._maxValue,function()
			self:setPercent(0, maxValue)
			self:_setPercentWithAnimation(factor,maxValue,animationCB, updateFunc)
		end, updateFunc)
	else
		self:_setPercentWithAnimation(factor,maxValue,animationCB, updateFunc)
	end
end

function GUILoaderBar:setFontSize( size )
	self._fontsize = size;
	self.label:setFontSize(size)
	return self;
end

function GUILoaderBar:setTextColor( color )
	self._fontcolor = color;
	self.label:setTextColor(color);
	return self;
end

function GUILoaderBar:enableOutline(outlineColor, outlineSize)
	self._outlineColor = outlineColor
	self._outlineSize = outlineSize
	self.label:enableOutline(outlineColor, outlineSize)
	return self;
end


function GUILoaderBar:_setString(v,m)
	local str = string.format(self._labelformat,v,m)
	--print(str,v,m,"==========111111111111111111")
	--str = tostring(v).."/"..tostring(m);
	if #self._labelformat2>0 then
		str = str .. string.format(self._labelformat2,100*v/m)
		--str = str .. tostring(100*v/m)
	end
	self.label:setString(str)
end

function GUILoaderBar:setFormatString( format )
	if type(format) ~= "string" then return self end
	self._labelformat = format;
	self:_setString(self._factor,self._maxValue);
	return self;
end

function GUILoaderBar:setFormat2String( format )
	if type(format) ~= "string" then return self end
	self._labelformat2 = format;
	self:_setString(self._factor,self._maxValue);
	return self;
end

function GUILoaderBar:setLabelVisible( vis )
	if vis == self._labelVisible then return self end
	self._labelVisible = vis;
	self.label:setVisible(vis);
	return self;
end

function GUILoaderBar:getPercent()
	return 100*self._factor/self._maxValue;
end

function GUILoaderBar:setPerUnitCallBack( callBack )
	self._perUnitCallBack = callBack
	return self;
end

function GUILoaderBar:getContentSize()
	return self.image:getContentSize();
end

function GUILoaderBar:getLabel()
	return self.label;
end

function GUILoaderBar:setProgressTime(time)
	if GameUtilSenior.isNumber(time) and time>0 then
		self._time_ = time
	end
end

function GUILoaderBar:enableOutline( color,outlineSize )
	self.label:enableOutline(color, outlineSize)
	return self
end

return GUILoaderBar