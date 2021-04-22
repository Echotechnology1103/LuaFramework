--
-- Author: xurui
-- Date: 2016-07-28 10:52:43
--
local QUIDialog = import("..dialogs.QUIDialog")
local QUIDialogSilverStoreDetailPlus = class("QUIDialogSilverStoreDetailPlus", QUIDialog)

local QStaticDatabase = import("...controllers.QStaticDatabase")
local QNavigationController = import("...controllers.QNavigationController")
local QUIWidgetItemsBox = import("..widgets.QUIWidgetItemsBox")
local QQuickWay = import("...utils.QQuickWay")
local QNotificationCenter = import("...controllers.QNotificationCenter")

QUIDialogSilverStoreDetailPlus.ITEM_SELL_SCCESS = "ITEM_SELL_SCCESS"

function QUIDialogSilverStoreDetailPlus:ctor(options)
	local ccbFile = "ccb/Dialog_Shop_Buymore_plus.ccbi"
	local callBacks = {
		{ccbCallbackName = "onTriggerClose", callback = handler(self, self._onTriggerClose)},
		{ccbCallbackName = "onSub", callback = handler(self, self._onSub)},
		{ccbCallbackName = "onPlus", callback = handler(self, self._onPlus)},
		{ccbCallbackName = "onSubTen", callback = handler(self, self._onSubTen)},
		{ccbCallbackName = "onPlusTen", callback = handler(self, self._onPlusTen)},
		{ccbCallbackName = "onSubHundred", callback = handler(self, self._onSubHundred)},
		{ccbCallbackName = "onPlusHundred", callback = handler(self, self._onPlusHundred)},
		{ccbCallbackName = "onTriggerOK", callback = handler(self, self._onTriggerOK)}
	}
	QUIDialogSilverStoreDetailPlus.super.ctor(self, ccbFile, callBacks, options)
	self.isAnimation = true
	
	cc.GameObject.extend(self)
	self:addComponent("components.behavior.EventProtocol"):exportMethods()

	self._nameMaxSize = 120

	if options then
		self._itemInfo = options.itemInfo
		self._shopId = options.shopId
		self._index = options.index
		self._callback = options.callback
	end
	self._currencyNum = {}

	self._ccbOwner.node_next_price:setVisible(false)
	self._ccbOwner.buy_content:setString("确认购买")
	self._ccbOwner.node_btn:setPositionY(self._ccbOwner.node_btn:getPositionY()-17)
	self._ccbOwner.line:setPositionY(self._ccbOwner.line:getPositionY()+17)
	self._ccbOwner.node_buy_num:setVisible(false)
	self._ccbOwner.frame_tf_title:setString("购 买")
	q.setButtonEnableShadow(self._ccbOwner.btn_close)
	q.setButtonEnableShadow(self._ccbOwner.btn_plusOne)
	q.setButtonEnableShadow(self._ccbOwner.btn_plusTen)
	q.setButtonEnableShadow(self._ccbOwner.btn_plusHundred)
	q.setButtonEnableShadow(self._ccbOwner.btn_subOne)
	q.setButtonEnableShadow(self._ccbOwner.btn_subTen)
	q.setButtonEnableShadow(self._ccbOwner.btn_subHundred)
	q.setButtonEnableShadow(self._ccbOwner.btn_ok)

	self:setDetailInfo()
end

function QUIDialogSilverStoreDetailPlus:viewDidAppear()
	QUIDialogSilverStoreDetailPlus.super.viewDidAppear(self)
	self.prompt = app:promptTips()
	self.prompt:addItemEventListener(self)
end

function QUIDialogSilverStoreDetailPlus:viewWillDisappear()
	QUIDialogSilverStoreDetailPlus.super.viewWillDisappear(self)
  	self.prompt:removeItemEventListener()
end

function QUIDialogSilverStoreDetailPlus:setDetailInfo()
	self._itemId = self._itemInfo.item_id
	self._itemNum = self._itemInfo.item_number
	self._itemConfig = QStaticDatabase:sharedDatabase():getItemByID(self._itemId)
	
	local name = ""
	local itemNum = 0
	if self._itemInfo.item_type ~= "item" then
		self._itemConfig = remote.items:getWalletByType(self._itemInfo.item_type)
		name = self._itemConfig.nativeName
		itemNum = remote.user[self._itemConfig.name] or 0
	else
		name = self._itemConfig.name
		itemNum = remote.items:getItemsNumByID(self._itemId)
	end

	-- set item box
	local itemBox = QUIWidgetItemsBox.new()
	self._ccbOwner.node_icon:addChild(itemBox)
	itemBox:setGoodsInfo(self._itemId, self._itemInfo.item_type, self._itemInfo.item_number)
	if self._itemConfig.type ~= ITEM_CONFIG_TYPE.GEMSTONE_PIECE and self._itemConfig.type ~= ITEM_CONFIG_TYPE.GEMSTONE_PIECE then
		itemBox:setPromptIsOpen(true)
	else
		itemBox:addEventListener(QUIWidgetItemsBox.EVENT_CLICK, handler(self, self._clickItemBox))
	end

	self._ccbOwner.item_name:setString(name or "")
	self._ccbOwner.have_num:setString(itemNum or 0)

	-- set exchange info 
	local num = 0
	for i = 1, 2 do
		self._currencyNum[i] = {}
		if self._itemInfo["resource_"..i] ~= nil and self._itemInfo["resource_"..i] ~= "item" then
			self:setCurrencyInfo(i)
			num = num + 1
		elseif self._itemInfo["resource_item_"..i] ~= nil then
			self:setItemInfo(i)
			num = num + 1
		end
	end
	if num == 2 then
		self._ccbOwner["node_"..1]:setPositionX(-60)
		self._ccbOwner["node_"..2]:setPositionX(60)
	elseif num == 1 then
		self._ccbOwner["node_"..2]:setVisible(false)
	end

	self._needItemNum = num

	-- set buy nums
	local buyInfo = remote.exchangeShop:getShopBuyInfo(self._shopId)
	local buyNum = buyInfo[tostring(self._itemInfo.grid_id)] or 0
	self.maxNum = (self._itemInfo.exchange_number or 9999999999) - buyNum
	self.nums = 1
	
	-- check max num
	for i = 1, 2 do
		if self._currencyNum[i] ~= nil and type(self._currencyNum[i].type) ~= "number" then
			local currencyInfo = remote.items:getWalletByType(self._currencyNum[i].type)
			if self._currencyNum[i].value ~= nil then
				local num = math.floor(remote.user[currencyInfo.name] / self._currencyNum[i].value)
				self.maxNum = self.maxNum < num and self.maxNum or num
			end
		elseif self._currencyNum[i] ~= nil then
			local itemNum = remote.items:getItemsNumByID(self._currencyNum[i].type)
			if self._currencyNum[i].value ~= nil then
				local num = math.floor(itemNum / self._currencyNum[i].value)
				self.maxNum = self.maxNum < num and self.maxNum or num
			end
		end
	end
	self:setNums()
end

function QUIDialogSilverStoreDetailPlus:setCurrencyInfo(index)
  	local path = remote.items:getWalletByType(self._itemInfo["resource_"..index]).alphaIcon
  	
  	if path ~= nil then
	    local icon = CCSprite:create()
	    icon:setTexture(CCTextureCache:sharedTextureCache():addImage(path))
	    self._ccbOwner["node_currency_"..index]:addChild(icon)
	    self._ccbOwner["node_currency_"..index]:setScale(0.6)
  	end
  	self._currencyNum[index].value = self._itemInfo["resource_number_"..index]
  	self._currencyNum[index].type = self._itemInfo["resource_"..index]
end

function QUIDialogSilverStoreDetailPlus:setItemInfo(index)
	-- if self._itemInfo["resource_item_"..index] == 601004 or self._itemInfo["resource_item_"..index] == 4200001 then
	local path = QStaticDatabase:sharedDatabase():getItemByID(tonumber(self._itemInfo["resource_item_"..index])).icon_1 or "icon/Tap_icon_g/Tap_bu.png"
    local icon = CCSprite:create()
    icon:setTexture(CCTextureCache:sharedTextureCache():addImage(path))
    self._ccbOwner["node_currency_"..index]:addChild(icon)
    self._ccbOwner["node_currency_"..index]:setScale(0.6)
	-- else
	--    	local itemBox = QUIWidgetItemsBox.new()
	--    	itemBox:setGoodsInfo(self._itemInfo["resource_item_"..index], "item", 0)
	--     self._ccbOwner["node_currency_"..index]:addChild(itemBox)
	--     self._ccbOwner["node_currency_"..index]:setScale(0.4)
	-- end

  	self._currencyNum[index].value = self._itemInfo["resource_number_"..index]
  	self._currencyNum[index].type = self._itemInfo["resource_item_"..index]
end

function QUIDialogSilverStoreDetailPlus:setNums()
	self.needNum1 = (self._currencyNum[1].value or 0) * self.nums 
	self.needNum2 = (self._currencyNum[2].value or 0) * self.nums 

	self._ccbOwner.tf_currency_1:setString(self.needNum1 or 0)
	self._ccbOwner.tf_currency_2:setString(self.needNum2 or 0)
	if self._itemInfo.exchange_number == nil then
		self._ccbOwner.item_num:setString(self.nums)
	else
		self._ccbOwner.item_num:setString(self.nums .. "/" .. self.maxNum)
		self._ccbOwner.buy_count:setString(self.maxNum or 0)
	end

	local nameWidth = self._ccbOwner.item_num:getContentSize().width
	self._ccbOwner.item_num:setScale(1)
	if nameWidth > self._nameMaxSize then
		self._ccbOwner.item_num:setScale(1-(nameWidth - self._nameMaxSize)/self._nameMaxSize)
	end
	
	if self._needItemNum and self._needItemNum == 1 then
		if self.needNum1 and self.needNum1 < 100 then
			self._ccbOwner["node_"..1]:setPositionX(10)
		else
			self._ccbOwner["node_"..1]:setPositionX(-10)
		end
	end
end


function QUIDialogSilverStoreDetailPlus:_clickItemBox()
	if self._itemId == nil then return end
	app.tip:itemTip(ITEM_TYPE.GEMSTONE_PIECE, self._itemId)
end

function  QUIDialogSilverStoreDetailPlus:_onSub(event)
	app.sound:playSound("common_increase")

	-- self._isMaxNum = false
	if self.nums - 1 <= 0 then 
		self.nums = 1
	else
		self.nums = self.nums - 1
	end
	self:setNums()
end

function  QUIDialogSilverStoreDetailPlus:_onSubTen(event)
	-- if q.buttonEventShadow(event, self._ccbOwner.btn_subTen) == false then return end
	-- self._isMaxNum = false
	if tonumber(event) == CCControlEventTouchDown then
		self._ccbOwner.btn_subTen:setColor(ccc3(210, 210, 210))
		self:_onDownHandler(-10)
	else
		self._ccbOwner.btn_subTen:setColor(ccc3(255, 255, 255))
		app.sound:playSound("common_increase")
		self:_onUpHandler(-10)
	end
end

function  QUIDialogSilverStoreDetailPlus:_onSubHundred(event)
	-- if q.buttonEventShadow(event, self._ccbOwner.btn_subTen) == false then return end
	-- self._isMaxNum = false
	if tonumber(event) == CCControlEventTouchDown then
		self._ccbOwner.btn_subHundred:setColor(ccc3(210, 210, 210))
		self:_onDownHandler(-100)
	else
		self._ccbOwner.btn_subHundred:setColor(ccc3(255, 255, 255))
		app.sound:playSound("common_increase")
		self:_onUpHandler(-100)
	end
end

function  QUIDialogSilverStoreDetailPlus:_onPlus(event)
	app.sound:playSound("common_increase")

	-- if self._isMaxNum then return end

	if self.nums + 1 > self.maxNum then 
		self.nums = self.maxNum < 1 and 1 or self.maxNum
	else
		self.nums = self.nums + 1
	end
	self:setNums()
end

function  QUIDialogSilverStoreDetailPlus:_onPlusTen(event)
	-- if q.buttonEventShadow(event, self._ccbOwner.btn_plusTen) == false then return end
	-- if self._isMaxNum then return end
	if tonumber(event) == CCControlEventTouchDown then
		self._ccbOwner.btn_plusTen:setColor(ccc3(210, 210, 210))
		self:_onDownHandler(10)
	else
		self._ccbOwner.btn_plusTen:setColor(ccc3(255, 255, 255))
		app.sound:playSound("common_increase")
		self:_onUpHandler(10)
	end
end

function  QUIDialogSilverStoreDetailPlus:_onPlusHundred(event)
	if tonumber(event) == CCControlEventTouchDown then
		self._ccbOwner.btn_plusHundred:setColor(ccc3(210, 210, 210))
		self:_onDownHandler(100)
	else
		self._ccbOwner.btn_plusHundred:setColor(ccc3(255, 255, 255))
		app.sound:playSound("common_increase")
		self:_onUpHandler(100)
	end
end

function QUIDialogSilverStoreDetailPlus:_onUpHandler(num)
	self._isDown = false	
	self._isUp = true
	self:_subBuyNums(num)
end

function QUIDialogSilverStoreDetailPlus:_onDownHandler(num)
	self._isDown = true
	self._isUp = false
	self._calculatorScheduler = scheduler.performWithDelayGlobal(function()
			self:_subBuyNums(num)
		end, 0.5)
end

function QUIDialogSilverStoreDetailPlus:_subBuyNums(num)
	if self._calculatorScheduler then
		scheduler.unscheduleGlobal(self._calculatorScheduler)
		self._calculatorScheduler = nil
	end

	if self._isDown or self._isUp then
		if self.nums + num <= 0 then 
			self.nums = 1
		elseif self.nums + num > self.maxNum then 
			self.nums =  self.maxNum < 1 and 1 or self.maxNum
		elseif self.nums == 1 and  num == 10 then 
			self.nums =  10
		else
			self.nums = self.nums + num
		end
		self:setNums()

		if self._isUp then return end
		self._calculatorScheduler = scheduler.performWithDelayGlobal(function()
			self:_subBuyNums(num)
		end, 0.05)
	end
end

function QUIDialogSilverStoreDetailPlus:viewAnimationOutHandler()
	local callback = self._callback
	self:removeSelfFromParent()
	if self._isBuy then
		for i = 1, 2 do
			if self._currencyNum[i] ~= nil and type(self._currencyNum[i].type) ~= "number" then
				local currencyInfo = remote.items:getWalletByType(self._currencyNum[i].type)
				if self._currencyNum[i].value ~= nil and self._currencyNum[i].value * self.nums > remote.user[currencyInfo.name] then
					remote.stores:checkShopCurrencyQuickWay(currencyInfo.name)
					return 
				end
			elseif self._currencyNum[i] ~= nil then
				local itemNum = remote.items:getItemsNumByID(self._currencyNum[i].type)
				if self._currencyNum[i].value ~= nil and self._currencyNum[i].value * self.nums > itemNum then
					QQuickWay:addQuickWay(QQuickWay.ITEM_DROP_WAY, self._currencyNum[i].type, nil, nil, false)
					return 
				end
			end
		end
	 	remote.exchangeShop:exchangeShopBuyRequest(self._shopId, self._itemInfo.grid_id, self.nums, function(data)
		 		if self.class ~= nil then
					app.tip:floatTip("购买成功")
					QNotificationCenter.sharedNotificationCenter():dispatchEvent({name = remote.stores.SHOP_ITEM_BUY_SCCESS, index = self._index})
					if callback then
						callback({itemInfo = self._itemInfo, index = self._index})
					end
		 		end
		 	end)
	end
end

function  QUIDialogSilverStoreDetailPlus:_onTriggerOK(event)
	if q.buttonEventShadow(event, self._ccbOwner.btn_ok) == false then return end
	app.sound:playSound("common_confirm")
	if self.nums == 0 then 
		app.tip:floatTip("购买数量不能为0")
		return
	end
	self._isBuy = true
	self:_onTriggerClose()
end

function QUIDialogSilverStoreDetailPlus:removeSelfFromParent()
	app:getNavigationManager():popViewController(app.middleLayer, QNavigationController.POP_TOP_CONTROLLER)
end

function QUIDialogSilverStoreDetailPlus:_backClickHandler()
	 self:_onTriggerClose()
end

function QUIDialogSilverStoreDetailPlus:_onTriggerClose(event)
	if q.buttonEventShadow(event, self._ccbOwner.btn_close) == false then return end
 	app.sound:playSound("common_close")
	self:playEffectOut()
end

return QUIDialogSilverStoreDetailPlus