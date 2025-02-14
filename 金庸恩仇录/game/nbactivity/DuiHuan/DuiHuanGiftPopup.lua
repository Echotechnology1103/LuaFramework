local btnCloseRes = {
normal = "#win_base_close.png",
pressed = "#win_base_close.png",
disabled = "#win_base_close.png"
}
local goldStateRes = {
normal = "#gold_close.png",
pressed = "#gold_open.png",
disabled = "#gold_none.png"
}
local RADIO_BUTTON_IMAGES = {
task = {
off = "#task_p.png",
off_pressed = "#task_p.png",
off_disabled = "#task_p.png",
on = "#task_n.png",
on_pressed = "#task_n.png",
on_disabled = "#task_n.png"
},
road = {
off = "#road_p.png",
off_pressed = "#road_p.png",
off_disabled = "#road_p.png",
on = "#road_n.png",
on_pressed = "#road_n.png",
on_disabled = "#road_n.png"
},
collect = {
off = "#collect_p.png",
off_pressed = "#collect_p.png",
off_disabled = "#collect_p.png",
on = "#collect_n.png",
on_pressed = "#collect_n.png",
on_disabled = "#collect_n.png"
}
}
local commonRes = {
mainFrameRes = "#win_base_bg2.png",
mainInnerRes = "#win_base_inner_bg_light.png",
tableViewBngRes = "#db_result_bg.png",
progressNoneBng = "#progress_zero.png",
progressFullBng = "#progress_full.png",
goldOpen = "#gold_open.png"
}
local typeEnum = {
task = 1,
road = 2,
collect = 3
}
local GiftGetItemView = require("game.nbactivity.DuiHuan.DuiHuanGiftItemView")
local data_item_item = require("data.data_item_item")

local DuiHuanGiftPopup = class("DuiHuanGiftPopup", function()
	return display.newLayer("DuiHuanGiftPopup")
end)

function DuiHuanGiftPopup:ctor(rank)
	self._mainFrameHeightOffset = 100
	self._mainFrameWidthOffset = 20
	self._mainPopupSize = nil
	self._innerContainerBorderOffset = 10
	self._innerContainerHeight = 100
	self._innerContainerSize = nil
	self._titleDisOffsetOfTop = 20
	self._titleDisFontSize = 25
	self._checkBoxMargin = -10
	self._mianPopup = nil
	self._innerContainer = nil
	self._tableContainer = nil
	self._tableContainerSize = nil
	self._tableContainerBorderOffset = 10
	self._titleDisLabel = nil
	self._tableCellHeight = 130
	self._rank = rank
	local function init()
		self:setUpView()
	end
	self:initData(init)
end

function DuiHuanGiftPopup:setUpView()
	local winSize = CCDirector:sharedDirector():getWinSize()
	local mask = CCLayerColor:create()
	mask:setContentSize(winSize)
	mask:setColor(cc.c3b(0, 0, 0))
	mask:setOpacity(150)
	mask:setAnchorPoint(cc.p(0, 0))
	mask:setTouchEnabled(true)
	self:addChild(mask)
	self._mianPopup = display.newScale9Sprite(commonRes.mainFrameRes, 0, 0, cc.size(display.width - self._mainFrameWidthOffset, display.height - 100)):pos(display.cx, display.cy):addTo(self)
	self._mainPopupSize = self._mianPopup:getContentSize()
	self._innerContainerHeight = self._mainPopupSize.height - 80
	self._innerContainer = display.newScale9Sprite(commonRes.mainInnerRes, 0, 0, cc.size(self._mainPopupSize.width - self._innerContainerBorderOffset * 2, self._innerContainerHeight)):pos(self._mainPopupSize.width / 2, self._innerContainerBorderOffset):addTo(self._mianPopup)
	self._innerContainerSize = self._innerContainer:getContentSize()
	self._innerContainer:setAnchorPoint(cc.p(0.5, 0))
	
	local closeBtn = ResMgr.newNormalButton({
	scaleBegan = 0.9,
	sprite = btnCloseRes.normal,
	handle = function ()	
		GameAudio.playSound(ResMgr.getSFX(SFX_NAME.u_guanbi))
		self:removeSelf()
	end
	})
	closeBtn:align(display.CENTER, self._mainPopupSize.width - 30, self._mainPopupSize.height - 35)
	--closeBtn:pos(self._mainPopupSize.width - 30, self._mainPopupSize.height - 35)
	closeBtn:addTo(self._mianPopup)
	--:setAnchorPoint(cc.p(0.5, 0.5))
	
	self._titleDisLabel = ui.newBMFontLabel({
	text = common:getLanguageString("@ExchangePrview"),
	size = self._titleDisFontSize,
	align = ui.TEXT_ALIGN_CENTER,
	font = FONTS_NAME.font_title
	}):pos(self._mainPopupSize.width / 2, self._mainPopupSize.height - self._titleDisOffsetOfTop):addTo(self._mianPopup)
	self._titleDisLabel:setAnchorPoint(cc.p(0.5, 1))
	self:setUpTableView()
	self:createTitleTask()
	self:reloadData()
end

function DuiHuanGiftPopup:setUpTableView()
	local titleDis = CCLabelTTF:create(require("data.data_message_message")[22].text, FONTS_NAME.font_fzcy, 20, cc.size(self._innerContainerSize.width - 40, 0), kCCTextAlignmentLeft, kCCVerticalTextAlignmentTop)
	titleDis:setPosition(self._innerContainerSize.width * 0.5, self._innerContainerSize.height - 90)
	titleDis:setColor(cc.c3b(99, 47, 8))
	titleDis:setAnchorPoint(cc.p(0.5, 0.5))
	self._innerContainer:addChild(titleDis)
	self._tableContainer = display.newScale9Sprite(commonRes.tableViewBngRes, 0, 0, cc.size(self._innerContainerSize.width - self._tableContainerBorderOffset * 2, self._innerContainerSize.height - 50)):pos(self._tableContainerBorderOffset, self._tableContainerBorderOffset):addTo(self._innerContainer)
	self._tableContainer:setAnchorPoint(cc.p(0, 0))
	self._tableContainerSize = self._tableContainer:getContentSize()
	self:selectContent(self._tableContainer, index)
	local iconDis = display.newSprite("#huodongshuoming.png")
	iconDis:setPosition(cc.p(self._innerContainer:getContentSize().width / 2, self._innerContainer:getContentSize().height - 35))
	self._innerContainer:addChild(iconDis)
end

function DuiHuanGiftPopup:selectContent(innerContainer, index)
	local innerSize = innerContainer:getContentSize()
	self.tableView = CCTableView:create(cc.size(innerSize.width, innerSize.height - 20))
	self.tableView:setPosition(cc.p(0, 10))
	self.tableView:setAnchorPoint(cc.p(0.5, 0.5))
	self.tableView:setDelegate()
	innerContainer:addChild(self.tableView)
	local listenerEnum = {
	CCTableView.kNumberOfCellsInTableView,
	CCTableView.kTableViewScroll,
	CCTableView.kTableViewZoom,
	CCTableView.kTableCellTouched,
	CCTableView.kTableCellSizeForIndex,
	CCTableView.kTableCellSizeAtIndex
	}
	local listenerFuc = {
	"numberOfCellsInTableView",
	"scrollViewDidScroll",
	"scrollViewDidZoom",
	"tableCellTouched",
	"cellSizeForTable",
	"tableCellAtIndex"
	}
	for key, var in pairs(listenerEnum) do
		self.tableView:registerScriptHandler(function(...)
			return self[listenerFuc[key]](self, ...)
		end,
		var)
	end
	self.tableView:setDirection(kCCScrollViewDirectionVertical)
	self.tableView:setVerticalFillOrder(kCCTableViewFillTopDown)
	
	local touchNode = display.newNode()
	touchNode:setTouchEnabled(true)
	touchNode:setContentSize(cc.size(display.width, display.height))
	touchNode:addNodeEventListener(cc.NODE_TOUCH_CAPTURE_EVENT, function(event)
		self.posX = event.x
		self.posY = event.y
	end)
	self:addChild(touchNode, 20)
end

function DuiHuanGiftPopup:scrollViewDidScroll(view)
end

function DuiHuanGiftPopup:scrollViewDidZoom(view)
end

function DuiHuanGiftPopup:tableCellTouched(_table, cell)
	for i = 1, cell:getChildByTag(1):getIconNum() do
		local icon, data = cell:getChildByTag(1):getIcon(i)
		local pos = icon:convertToNodeSpace(cc.p(self.posX, self.posY))
		if cc.rectContainsPoint(cc.rect(0, 0, icon:getContentSize().width, icon:getContentSize().height), pos) then
			self:onIconClick(data)
			break
		end
	end
end

function DuiHuanGiftPopup:onIconClick(data)
	if tonumber(data[1]) ~= 6 then
		if not CCDirector:sharedDirector():getRunningScene():getChildByTag(1111) then
			local closeFunc = function()
				if CCDirector:sharedDirector():getRunningScene():getChildByTag(1111) then
					CCDirector:sharedDirector():getRunningScene():removeChildByTag(1111, true)
				end
			end
			local itemInfo = require("game.Huodong.ItemInformation").new({
			id = tonumber(data[2]),
			type = tonumber(data[1]),
			name = data_item_item[tonumber(data[2])].name,
			describe = data_item_item[tonumber(data[2])].describe,
			endFunc = closeFunc
			})
			CCDirector:sharedDirector():getRunningScene():addChild(itemInfo, 100000000, 1111)
		end
	else
		local closeFunc = function()
			if CCDirector:sharedDirector():getRunningScene():getChildByTag(1111) then
				CCDirector:sharedDirector():getRunningScene():removeChildByTag(1111, true)
			end
		end
		if not CCDirector:sharedDirector():getRunningScene():getChildByTag(1111) then
			local descLayer = require("game.Spirit.SpiritInfoLayer").new(4, {
			resId = tonumber(data[2])
			}, nil, closeFunc)
			CCDirector:sharedDirector():getRunningScene():addChild(descLayer, 100000000, 1111)
		end
	end
end

function DuiHuanGiftPopup:cellSizeForTable(_table, idx)
	local count = math.ceil(#string.split(self._data[idx + 1].view, ";") / 8)
	return 60 + math.ceil(count * 130) + 10, self._tableContainerSize.width
end

function DuiHuanGiftPopup:tableCellAtIndex(_table, idx)
	local cell = CCTableViewCell:new()
	local count = #string.split(self._data[idx + 1].view, ";") / 2
	local itemView = GiftGetItemView.new(cc.size(self._tableContainerSize.width, 60 + math.ceil(count / 4) * 130), self._data[idx + 1], self._mainMenuScene, self)
	itemView:setPositionY(itemView:getPositionY() - 15)
	cell:addChild(itemView, 1, 1)
	return cell
end

function DuiHuanGiftPopup:numberOfCellsInTableView(tableView)
	return table.maxn(self._data)
end

function DuiHuanGiftPopup:reloadData()
	self.tableView:setViewSize(cc.size(self._tableContainerSize.width, self._tableContainerSize.height - 110))
	self._tableContainer:setContentSize(cc.size(self._tableContainerSize.width, self._tableContainerSize.height - 90))
	self.tableView:reloadData()
end

function DuiHuanGiftPopup:createTitleTask()
	local leftAdgeOffset = 30
	local titleViewHeight = 110
	self.titleView = CCLayer:create()
	self.titleView:setContentSize(cc.size(self._tableContainerSize.width, titleViewHeight))
	self.titleView:setAnchorPoint(cc.p(0, 1))
	self.titleView:setPosition(cc.p(0, self._innerContainerHeight - 100))
	self._innerContainer:addChild(self.titleView)
end

function DuiHuanGiftPopup:initData(func)
	self._data = {}
	local function init(data)
		self._data = data.list
		func()
	end
	RequestHelper.exchangeSystem.giftPreView({
	callback = function(data)
		dump(data)
		init(data)
	end
	})
end

return DuiHuanGiftPopup