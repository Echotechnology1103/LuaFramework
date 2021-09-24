platWarDialogSubTab31={}

function platWarDialogSubTab31:new()
    local nc={}
    setmetatable(nc,self)
    self.__index=self

    self.tv=nil
    self.bgLayer=nil
    self.layerNum=nil
	self.parent=nil

	self.cellHeght=230
	self.hSpace=50
	self.maskSp=nil
	self.descLb=nil
	
    return nc
end

function platWarDialogSubTab31:init(layerNum,parent)
    self.bgLayer=CCLayer:create()
    self.layerNum=layerNum
	self.parent=parent
	self:initDesc()
	self:initTableView()
    return self.bgLayer
end

function platWarDialogSubTab31:initDesc()
	local str=getlocal("plat_war_shop_desc1")
	local descLb=GetTTFLabelWrap(str,25,CCSizeMake(G_VisibleSizeWidth-150,0),kCCTextAlignmentLeft,kCCVerticalTextAlignmentCenter)
	descLb:setAnchorPoint(ccp(0,0.5))
	descLb:setPosition(ccp(30,G_VisibleSizeHeight-225-self.hSpace-20))
	descLb:setColor(G_ColorYellowPro)
	self.bgLayer:addChild(descLb)

	local function showInfo()
		if G_checkClickEnable()==false then
            do
                return
            end
        else
            base.setWaitTime=G_getCurDeviceMillTime()
        end
		local tabStr={"\n",getlocal("plat_war_shop_tip_4"),"\n",getlocal("plat_war_shop_tip_3",{platWarCfg.shoppingtime}),"\n",getlocal("plat_war_shop_tip_2"),"\n",getlocal("plat_war_shop_tip_1"),"\n"};
		local tabColor={nil,G_ColorRed,nil,G_ColorYellow,nil,G_ColorYellow,nil,G_ColorYellow,nil}
		PlayEffect(audioCfg.mouseClick)
		local td=smallDialog:new()
		local dialog=td:init("PanelPopup.png",CCSizeMake(500,400),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),nil,true,true,self.layerNum+1,tabStr,25,tabColor)
		sceneGame:addChild(dialog,self.layerNum+1)
	end
	local infoItem = GetButtonItem("BtnInfor.png","BtnInfor_Down.png","BtnInfor_Down.png",showInfo,11,nil,nil)
	local infoBtn = CCMenu:createWithItem(infoItem);
	infoBtn:setPosition(ccp(G_VisibleSizeWidth-80,G_VisibleSizeHeight-210-self.hSpace-30))
	infoBtn:setTouchPriority(-(self.layerNum-1)*20-3)
	self.bgLayer:addChild(infoBtn)

	-- local function tmpFunc()
 --    end
 --    self.maskSp = LuaCCScale9Sprite:createWithSpriteFrameName("BlackAlphaBg.png",CCRect(10, 10, 1, 1),tmpFunc)
 --    self.maskSp:setOpacity(255)
 --    local size=CCSizeMake(G_VisibleSizeWidth-50,self.bgLayer:getContentSize().height-290-self.hSpace-25)
 --    self.maskSp:setContentSize(size)
 --    self.maskSp:setAnchorPoint(ccp(0,0))
 --    self.maskSp:setPosition(ccp(25,25))
 --    self.maskSp:setIsSallow(true)
 --    self.maskSp:setTouchPriority(-(self.layerNum-1)*20-5)
 --    self.bgLayer:addChild(self.maskSp,3)

	-- self.descLb=GetTTFLabelWrap(getlocal("plat_war_shop_open_1"),30,CCSizeMake(self.maskSp:getContentSize().width-60,0),kCCTextAlignmentCenter,kCCVerticalTextAlignmentCenter)
	-- self.descLb:setAnchorPoint(ccp(0.5,0.5))
	-- self.descLb:setPosition(getCenterPoint(self.maskSp))
	-- self.descLb:setColor(G_ColorRed)
	-- self.maskSp:addChild(self.descLb,1)

	-- local status=platWarVoApi:getShopShowStatus(1)
	-- if status<1 then
	-- 	self.maskSp:setPosition(ccp(25,25))
	-- else
	-- 	self.maskSp:setPosition(ccp(10000,0))
	-- end
end

function platWarDialogSubTab31:initTableView()
	local function callBack(...)
		return self:eventHandler(...)
	end
	local hd= LuaEventHandler:createHandler(callBack)
	self.tv=LuaCCTableView:createWithEventHandler(hd,CCSizeMake(G_VisibleSizeWidth-60,self.bgLayer:getContentSize().height-290-self.hSpace-35),nil)
	self.tv:setTableViewTouchPriority(-(self.layerNum-1)*20-3)
	self.tv:setAnchorPoint(ccp(0,0))
	self.tv:setPosition(ccp(30,30))
	self.tv:setMaxDisToBottomOrTop(120)
	self.bgLayer:addChild(self.tv)
end

function platWarDialogSubTab31:eventHandler(handler,fn,idx,cel)
	if fn=="numberOfCellsInTableView" then
		local commonList=platWarVoApi:getCommonList()
		local num=SizeOfTable(commonList)
		return num
	elseif fn=="tableCellSizeForIndex" then
		local tmpSize = CCSizeMake(G_VisibleSizeWidth-60,self.cellHeght)
		return  tmpSize
	elseif fn=="tableCellAtIndex" then
		local cell=CCTableViewCell:new()
		cell:autorelease()
		local backSprie=LuaCCScale9Sprite:createWithSpriteFrameName("letterBgWrite.png",CCRect(20,20,10,10),function () end)
		backSprie:setContentSize(CCSizeMake(G_VisibleSizeWidth-65,self.cellHeght))
		backSprie:setPosition(ccp((G_VisibleSizeWidth-60)/2,self.cellHeght/2))
		backSprie:setTouchPriority(-(self.layerNum-1)*20-1)

		local showList=platWarVoApi:getCommonList()
		local shopVo=showList[idx+1]
		local id=shopVo.id
		local num=shopVo.num or 0
		
		local commonItems=platWarVoApi:getShopCommonItems()
		local cfg=commonItems[id]
		local rewardTb=FormatItem(cfg.reward)
		local price=cfg.price
		local maxNum=cfg.buynum

		local nameStrTb={}
		for k,v in pairs(rewardTb) do
			table.insert(nameStrTb,v.name.." x"..FormatNumber(v.num))
		end
		local nameLb=GetTTFLabel(table.concat(nameStrTb, ", "),25)
		nameLb:setAnchorPoint(ccp(0,0.5))
		nameLb:setColor(G_ColorGreen)
		nameLb:setPosition(ccp(10,(self.cellHeght/2+50+self.cellHeght)/2))
		backSprie:addChild(nameLb)

		local limitLb=GetTTFLabel("("..num.."/"..maxNum..")",25)
		limitLb:setAnchorPoint(ccp(0,0.5))
		limitLb:setPosition(ccp(10+nameLb:getContentSize().width+5,(self.cellHeght/2+50+self.cellHeght)/2))
		backSprie:addChild(limitLb)

		local award=rewardTb[1]
		local iconSize=100
		local icon=G_getItemIcon(award,iconSize,false,self.layerNum)
		if icon then
			icon:setAnchorPoint(ccp(0,0.5))
			icon:setPosition(ccp(10,self.cellHeght/2-10))
			backSprie:addChild(icon)
		end

		local descLb=GetTTFLabelWrap(getlocal(rewardTb[1].desc),22,CCSizeMake(G_VisibleSizeWidth-335,0),kCCTextAlignmentLeft,kCCVerticalTextAlignmentCenter)
		descLb:setAnchorPoint(ccp(0,1))
		descLb:setPosition(ccp(130,self.cellHeght/2+40))
		backSprie:addChild(descLb)

		local priceDescLb=GetTTFLabel(getlocal("serverwar_point"),25)
		priceDescLb:setPosition(ccp(G_VisibleSizeWidth-135,self.cellHeght*3/4))
		backSprie:addChild(priceDescLb)

		local priceLb=GetTTFLabel(price,25)
		priceLb:setPosition(ccp(G_VisibleSizeWidth-135,self.cellHeght/2+10))
		if(platWarVoApi:getPoint()<price)then
			priceLb:setColor(G_ColorRed)
		else
			priceLb:setColor(G_ColorYellowPro)
		end
		backSprie:addChild(priceLb)

		local function onClick(tag,object)
			if self and self.tv and self.tv:getScrollEnable()==true and self.tv:getIsScrolled()==false then
				if G_checkClickEnable()==false then
		            do
		                return
		            end
		        else
		            base.setWaitTime=G_getCurDeviceMillTime()
		        end
				local showList=platWarVoApi:getCommonList()
				local shopVo=showList[idx+1]
				local id=shopVo.id
				local num=shopVo.num or 0
				if(num>=maxNum)then
					smallDialog:showTipsDialog("PanelPopup.png",CCSizeMake(500,400),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),getlocal("serverwar_buy_num_full"),30)
					do return end
				end
				if(platWarVoApi:getPoint()<price)then
					smallDialog:showTipsDialog("PanelPopup.png",CCSizeMake(500,400),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),getlocal("serverwar_point_not_enough"),30)
					do return end
				end
				self:buyItem(shopVo)
			end
		end
		local buyItem = GetButtonItem("BtnCancleSmall.png","BtnCancleSmall_Down.png","BtnCancleSmall.png",onClick,nil,getlocal("code_gift"),25)
		buyItem:setTag(idx+1)
		buyItem:setScale(0.8)
		if(num>=maxNum)then
			buyItem:setEnabled(false)
		end
		local buyBtn = CCMenu:createWithItem(buyItem)
		buyBtn:setPosition(ccp(G_VisibleSizeWidth-135,self.cellHeght/4))
		buyBtn:setTouchPriority(-(self.layerNum-1)*20-2)
		backSprie:addChild(buyBtn)

		cell:addChild(backSprie,1)
		return cell
	elseif fn=="ccTouchBegan" then
		self.isMoved=false
		return true
	elseif fn=="ccTouchMoved" then
		self.isMoved=true
	elseif fn=="ccTouchEnded"  then
	end
end

function platWarDialogSubTab31:buyItem(shopVo)
	local id=shopVo.id
	local num=shopVo.num
	local commonItems=platWarVoApi:getShopCommonItems()
	local cfg=commonItems[id]
	local rewardTb=FormatItem(cfg.reward)
	local price=cfg.price
	local maxNum=cfg.buynum

	if (num<maxNum) and (platWarVoApi:getPoint()>=price) then
		local function callback()
			local recordPoint = self.tv:getRecordPoint()
			self.tv:reloadData()
			self.tv:recoverToRecordPoint(recordPoint)
			if self.parent and self.parent.doUserHandler then
				self.parent:doUserHandler()
			end
		end
		platWarVoApi:buyItem(1,id,callback)
	end
end

function platWarDialogSubTab31:doUserHandler()

end

function platWarDialogSubTab31:tick()
	-- if self and self.maskSp then
	-- 	local status=platWarVoApi:getShopShowStatus(1)
	-- 	if status<1 then
	-- 		self.maskSp:setPosition(ccp(25,25))
	-- 	else
	-- 		self.maskSp:setPosition(ccp(10000,0))
	-- 	end
	-- end
end

function platWarDialogSubTab31:refresh()

end

function platWarDialogSubTab31:dispose()
    self.tv=nil
    self.bgLayer=nil
    self.layerNum=nil
    self.cellHeght=nil
	self.hSpace=nil
	self.maskSp=nil
	self.descLb=nil
end






