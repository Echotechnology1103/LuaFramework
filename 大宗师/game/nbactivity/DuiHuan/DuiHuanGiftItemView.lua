--
-- Author: Daneil 
-- Date: 2015-01-15 15:33:35
--
local data_item_item = require("data.data_item_item")
local btnGetRes = {
    normal   =  "#btn_get_n.png",
    pressed  =  "#btn_get_p.png",
    disabled =  "#btn_get_p.png"
}

local DuiHuanGiftItemView = class("DuiHuanGiftItemView", function()
    return display.newLayer("DuiHuanGiftItemView")
end)

function DuiHuanGiftItemView:ctor(size,data,mainscene,parent)
    self:setContentSize(size)
    self._leftToRightOffset = 5
    self._topToDownOffset = 2
    self._frameSize = size

    self._containner = nil
    self._padding = {
        left  = 15,
        right = 15,
        top   = 15,
        down  = 20
    }
    self._data = data
    self:setUpView()
    self._mainMenuScene = mainscene
    self._parent = parent
    --控件
    self._icon = nil
end


function DuiHuanGiftItemView:setUpView()
    self._containner =  display.newScale9Sprite("#reward_item_bg.png", 0, 0, 
        cc.size(self._frameSize.width - self._leftToRightOffset * 2, 
            self._frameSize.height - self._topToDownOffset * 2))
        :pos(self._frameSize.width / 2, self._frameSize.height / 2 + 10)
    local containnerSize = self._containner:getContentSize()
    self._containner:setAnchorPoint(cc.p(0.5,0.5))
    self:addChild(self._containner)

    --标题
    local titleBng = display.newSprite("#month_item_titleBg.png")
	titleBng:setAnchorPoint(cc.p(0.5,0.5))
	titleBng:setPosition(cc.p(containnerSize.width * 0.2, containnerSize.height))
	titleBng:setScale(0.8)
	self._containner:addChild(titleBng)

	local nameLabel = ui.newBMFontLabel({
		text = self._data.tagName,
		font = "fonts/font_title.fnt",
		align = ui.TEXT_ALIGN_LEFT
		})
	nameLabel:setPosition(cc.p(titleBng:getContentSize().width * 0.3,titleBng:getContentSize().height - 30))
	titleBng:addChild(nameLabel)

    --15积分可领取背景
    local titleBngHeight = 40

    --道具框
    local marginTop   = 5
    local offset      = 10
    local marginRight = 120
    local itemsViewBngs = display.newScale9Sprite("#heroinfo_cost_st_bg.png" , 0 , 0 ,
        cc.size(containnerSize.width - self._padding.left - self._padding.right ,
            containnerSize.height - self._padding.top - self._padding.down - marginTop))
        :pos(self._padding.left , self._padding.down)
        :addTo(self._containner)
    itemsViewBngs:setAnchorPoint(cc.p(0,0))

    self._dataBase = {}
    local dataOrg = string.split(self._data.view, ";")
   	for k = 1 , #dataOrg / 2 do
   		local tableTemp = {}
    	table.insert(tableTemp,dataOrg[((k - 1) * 2 + 1)])
    	table.insert(tableTemp,dataOrg[((k - 1) * 2 + 1) + 1])
    	table.insert(self._dataBase,tableTemp)
   	end

   	self._icons = {}
    for i=1, #self._dataBase do
        table.insert(self._icons,self:createItem(i,itemsViewBngs,itemsViewBngs:getContentSize(),self._dataBase[i]))
    end

end

function DuiHuanGiftItemView:getIcon(index)
	return self._icons[index] , self._dataBase[index]
end

function DuiHuanGiftItemView:getIconNum()
	return #self._dataBase
end

function DuiHuanGiftItemView:createItem(index,itemsViewBngs,containnerSize,data)
    local marginTop  = 60
    local marginLeft = 10
    local offset = 130


    if tonumber(data[1]) == 6 then
        self._icon = require("game.Spirit.SpiritIcon").new({
            resId = tonumber(data[2]),
            bShowName = true,
        })
    else
    	self._icon = ResMgr.refreshIcon(
        {
            id = tonumber(data[2]), 
            resType = ResMgr.getResType(tonumber(data[1])), 
            iconNum = 1, 
            isShowIconNum = false, 
            numLblSize = 22, 
            numLblColor = ccc3(0, 255, 0), 
            numLblOutColor = ccc3(0, 0, 0) 
        }) 
	end

	
    self._icon:setAnchorPoint(cc.p(0,0.5)) 
    index = index - 1
    local paddingLeft = 27
    if (math.floor(index / 4)) == 0 then
    	self._icon:setPosition(cc.p(paddingLeft + ((index % 4 == 0 and 0 or index % 4)) * offset, containnerSize.height - marginTop - (math.floor(index / 4)) * 100))
    else
    	self._icon:setPosition(cc.p(paddingLeft + ((index % 4 == 0 and 0 or index % 4)) * offset, containnerSize.height - marginTop - (math.floor(index / 4)) * 100  - 30 * (math.floor(index / 4))))
    end
    local iconSize = self._icon:getContentSize()
    local iconPosX = self._icon:getPositionX()
    local iconPosY = self._icon:getPositionY()

    -- 名称
    local nameColor = ccc3(255, 255, 255) 
    if ResMgr.getResType(tonumber(data[1])) == ResMgr.HERO then 
        nameColor = ResMgr.getHeroNameColor(tonumber(data[2]))
    elseif ResMgr.getResType(tonumber(data[1])) == ResMgr.ITEM or ResMgr.getResType(tonumber(data[1])) == ResMgr.EQUIP then 
        nameColor = ResMgr.getItemNameColor(tonumber(data[2])) 
    end 

    if tonumber(data[1]) ~= 6 then
    	ui.newTTFLabelWithShadow({
        text = data_item_item[tonumber(data[2])].name,
        size = 20,
        color = nameColor,
        shadowColor = ccc3(0,0,0),
        font = FONTS_NAME.font_fzcy,
        align = ui.TEXT_ALIGN_CENTER
    	})
        :pos(iconSize.width /2 , -15)
        :addTo(self._icon)
        :setAnchorPoint(cc.p(0,1))
    end
    

    local tag
    -- 装备碎片
    if tonumber(data[1]) == 3 then
        tag = display.newSprite("#sx_suipian.png")
    elseif tonumber(data[1]) == 5 then
        -- 残魂(武将碎片)
        tag = display.newSprite("#sx_canhun.png")
    end
    if tag then
        self._icon:addChild(tag)
        tag:setRotation(-20)
        tag:setPosition(cc.p(40,75))
    end
	itemsViewBngs:addChild(self._icon)
	return self._icon 
end

return DuiHuanGiftItemView
    
    
