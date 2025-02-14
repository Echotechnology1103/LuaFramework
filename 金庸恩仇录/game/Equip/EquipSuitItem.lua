local data_item_item = require("data.data_item_item")
local data_taozhuang_taozhuang = require("data.data_taozhuang_taozhuang")

local EquipSuitItem = class("EquipSuitItem", function()
	return display.newNode()
end)

function EquipSuitItem:ctor(param)
	local equipNum = param.equipNum
	local natureTable = param.natureTable
	local valTable = param.valTable
	local suitId = param.suitId
	local suitGetNum = HeroSettingModel.getSuitNum(suitId)
	local floorNum = math.ceil(#valTable / 2)
	local floorH = 28
	local orHeight = 20
	self.curHeight = orHeight + floorNum * floorH
	local proxy = CCBProxy:create()
	self._rootnode = {}
	local node = CCBuilderReaderLoad("equip/suit_item.ccbi", proxy, self._rootnode, self, cc.size(display.width, self.curHeight))
	self:addChild(node)
	local isActive = false
	if equipNum <= suitGetNum then
		isActive = true
	end
	self._rootnode.nameItemName:setString(common:getLanguageString("@EquitNumber", equipNum))
	local fontColor = cc.c3b(147, 5, 5)
	if not isActive then
		fontColor = cc.c3b(137, 137, 137)
		self._rootnode.nameItemName:setColor(fontColor)
	else
	end
	self.layerHight = 0
	for i = 1, #natureTable do
		local valX = 0
		local valY = 0
		if i % 2 == 0 then
			valX = 280
		else
			valX = 120
		end
		local charH = 30
		self.layerNum = checkint(i / 2) - 1
		valY = self.layerNum * charH
		self.layerHight = self.layerHight + valY
		dump("natureTable[i]" .. natureTable[i])
		local natureNameStr = ResMgr.getNatureName(natureTable[i])
		local natureTTF = ui.newTTFLabel({
		text = natureNameStr,
		font = FONTS_NAME.font_fzcy,
		size = 22,
		color = fontColor
		})
		natureTTF:setPosition(self._rootnode.nameItemName:getContentSize().width + valX, self._rootnode.nameItemName:getPositionY() - valY)
		node:addChild(natureTTF)
		local natureNumTTF = ui.newTTFLabel({
		text = "+" .. valTable[i],
		font = FONTS_NAME.font_fzcy,
		size = 22,
		color = fontColor
		})
		natureNumTTF:setPosition(natureTTF:getContentSize().width / 2 + natureNumTTF:getContentSize().width / 2 + natureTTF:getPositionX(), self._rootnode.nameItemName:getPositionY() - valY)
		node:addChild(natureNumTTF)
	end
end

function EquipSuitItem:getHeight()
	return self.layerHight + 45
end

return EquipSuitItem