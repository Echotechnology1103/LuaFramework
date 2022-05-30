local data_carden_carden = require("data.data_carden_carden")

local HeroChoseCell = class("HeroChoseCell", function()
	display.addSpriteFramesWithFile("ui/ui_submap.plist", "ui/ui_submap.png")
	display.addSpriteFramesWithFile("ui/ui_common_button.plist", "ui/ui_common_button.png")
	display.addSpriteFramesWithFile("ui/ui_kongfu.plist", "ui/ui_kongfu.png")
	return CCTableViewCell:new()
end)

local baseStateStr = {
common:getLanguageString("@life2"),
common:getLanguageString("@Attack2"),
common:getLanguageString("@ThingDefense2"),
common:getLanguageString("@LawDefense2"),
common:getLanguageString("@FinalHarm"),
common:getLanguageString("@FinalAvoidence")
}

function HeroChoseCell:create(param)
	self.choseFunc = param.choseFunc
	self.choseTable = param.choseTable
	self.list = param.list
	local viewSize = param.viewSize
	self.cellIndex = param.id or 1
	local proxy = CCBProxy:create()
	self._rootnode = {}
	local node = CCBuilderReaderLoad("hero/hero_qianghua_chose_cell.ccbi", proxy, self._rootnode)
	node:setPosition(viewSize.width * 0.5, self._rootnode.itemBg:getContentSize().height / 2)
	self:addChild(node)
	
	self._rootnode.selIcon:registerScriptTapHandler(function()
		self._rootnode.selIcon:setVisible(false)
		self._rootnode.unSelIcon:setVisible(true)
		self.data.isChosen = false
		dump("unSel")
		self.choseFunc({
		op = 2,
		cellIndex = self.cellIndex
		})
	end)
	
	self._rootnode.unSelIcon:registerScriptTapHandler(function()
		if self.choseFunc({
			op = 1,
			cellIndex = self.cellIndex
			}) then
			self._rootnode.unSelIcon:setVisible(false)
			self._rootnode.selIcon:setVisible(true)
			self.data.isChosen = true
			dump("sel")
		end
	end)
	
	self.headIcon = self._rootnode.headIcon
	self.heroName = ui.newTTFLabelWithShadow({
	text = "",
	font = FONTS_NAME.font_haibao,
	size = 30,
	align = ui.TEXT_ALIGN_LEFT,
	shadowColor = FONT_COLOR.BLACK,
	})
	self.heroName:align(display.LEFT_CENTER)
	self._rootnode.itemNameLabel:addChild(self.heroName)
	self:refresh(self.cellIndex)
	return self
end

function HeroChoseCell:changeStarNum(num)
	self.starNum:setDisplayFrame(display.newSpriteFrame(string.format("item_board_num_%d.png", num)))
end

function HeroChoseCell:beTouched()
	dump(self.cellIndex)
end

function HeroChoseCell:refresh(idx)
	self.cellIndex = idx
	local data = self.list[idx]
	self.data = self.list[idx]
	self.objectId = data._id
	local resId = data.resId
	local cls = data.cls
	local lv = data.level
	self._rootnode.lvLabel:setString(string.format("LV.%d", lv))
	if cls > 0 then
		self._rootnode.clsLabel:setString(string.format("+%d", cls))
	else
		self._rootnode.clsLabel:setString("")
	end
	local star = data.star
	self.heroName:setColor(NAME_COLOR[star])
	local name = ResMgr.getCardData(resId).name
	self.heroName:setString(name)
	self.curExp = ResMgr.getCardData(resId).exp + data_carden_carden[data.level].sumexp[data.star] + data.curExp
	self._rootnode.expNum:setString(self.curExp)
	for i = 1, 5 do
		if star < i then
			self._rootnode["star" .. i]:setVisible(false)
		else
			self._rootnode["star" .. i]:setVisible(true)
		end
	end
	local isChosen = self.data.isChosen
	if isChosen == true then
		self._rootnode.unSelIcon:setVisible(false)
		self._rootnode.selIcon:setVisible(true)
	else
		self.data.isChosen = false
		self._rootnode.selIcon:setVisible(false)
		self._rootnode.unSelIcon:setVisible(true)
	end
	ResMgr.refreshIcon({
	itemBg = self.headIcon,
	id = resId,
	resType = ResMgr.HERO,
	cls = cls
	})
	local job = ResMgr.getCardData(resId).job
	ResMgr.refreshJobIcon(self._rootnode.job_icon, job)
	self._rootnode.job_icon:setZOrder(100)
end

function HeroChoseCell:getContentSize()
	return cc.size(display.width * 0.93, 154)
end

function HeroChoseCell:onExit()
	
end

function HeroChoseCell:runEnterAnim()
	local delayTime = self.cellIndex * 0.15
	local sequence = transition.sequence({
	CCCallFuncN:create(function()
		self:setPosition(cc.p(self:getContentSize().width / 2 + display.width / 2, self:getPositionY()))
	end),
	CCDelayTime:create(delayTime),
	CCMoveBy:create(0.3, cc.p(-(self:getContentSize().width / 2 + display.width / 2), 0))
	})
	self:runAction(sequence)
end

return HeroChoseCell