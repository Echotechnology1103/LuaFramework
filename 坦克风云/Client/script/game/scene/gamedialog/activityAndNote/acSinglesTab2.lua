acSinglesTab2={}
function acSinglesTab2:new()
	local nc=commonDialog:new()
	setmetatable(nc,self)
	self.__index=self

	self.tokenNumTb={}
	self.data=nil
	self.cellHeght=210
	self.tagOffset=823
	return nc
end

function acSinglesTab2:init(layerNum,parent)
	self.layerNum=layerNum
	self.parent=parent
	self.bgLayer=CCLayer:create()

	self:initWithData(data)
	self:initheader()
	self:initTableView()
	return self.bgLayer
end

function acSinglesTab2:initWithData(data)

	 -- shopItem = {
  --               --mm_m1 光棍 mm_m2 基友 mm_m3 女神
  --               i1={id="i1",buynum=10,price={mm_m1=3, mm_m2=3, mm_m3=6,},reward={p={{p393=1}}},serverReward={props_p393=1}},
  --               i2={id="i2",buynum=10,price={mm_m1=3, mm_m2=3,},reward={p={{p394=1}}},serverReward={props_p394=1}},
  --           },
  	local shopList = acSinglesVoApi:getShopCfg()
	self.data={}

	if shopList then
		for k,v in pairs(shopList) do
			local cellData={}
			cellData.id=v.id
			cellData.rewardTb=FormatItem(v.reward)
			cellData.price=v.price
			cellData.maxbuyNum=v.buynum
			cellData.curbuyNum=acSinglesVoApi:getHasBuyNumByID(cellData.id)
			--cellData.index=v.index
			table.insert(self.data,cellData)
		end
	end
	
end

function acSinglesTab2:initheader()
	local function nilFun()
	end
    local capInSet = CCRect(20, 20, 10, 10);
	local sp = LuaCCScale9Sprite:createWithSpriteFrameName("panelItemBg.png",capInSet,nilFun)
	sp:setAnchorPoint(ccp(0.5,1))
	sp:setPosition(ccp(self.bgLayer:getContentSize().width/2,self.bgLayer:getContentSize().height-180))
	sp:setContentSize(CCSizeMake(self.bgLayer:getContentSize().width-60,180))
	self.bgLayer:addChild(sp)

	self.bgLayer:setTouchPriority(-(self.layerNum-1)*20-1)

	for i=1,3 do
    	local pCfg = nil
        local id = "mm_m"..i
        pCfg = acSinglesVoApi:getTokenCfgForShowByPid(id)
        local hadNum = tonumber(acSinglesVoApi:getTokenNumByID(id))
        local pIcon = self:getIcon(pCfg,id)
        local pIconX = 110+((i-1)%3)*180
		local pIconY = sp:getContentSize().height/2
        pIcon:setAnchorPoint(ccp(0.5,0.5))
        pIcon:setPosition(ccp(pIconX,pIconY+20))
        pIcon:setTouchPriority(-(self.layerNum-1)*20-4)
        sp:addChild(pIcon)
        
        local numLb = GetTTFLabel(hadNum,25)
        numLb:setAnchorPoint(ccp(0.5,1))
        numLb:setPosition(pIconX,pIconY-40)
       	sp:addChild(numLb)
       	self.tokenNumTb[id]=numLb
    end

end
function acSinglesTab2:updateTokenNum(id)
  local numLb = self.tokenNumTb[id]
  local hadNum = tonumber(acSinglesVoApi:getTokenNumByID(id))
  numLb:setString(tostring(hadNum))
end
function acSinglesTab2:getIcon(pCfg,id)
  local function showInfoHandler(hd,fn,idx)
	  if G_checkClickEnable()==false then
	      do
	          return
	      end
	  else
	      base.setWaitTime=G_getCurDeviceMillTime()
	  end
	  PlayEffect(audioCfg.mouseClick)
	  local hadNum = tonumber(acSinglesVoApi:getTokenNumByID(id))
	  local item = {name = getlocal(pCfg.name), pic= pCfg.icon, num = hadNum, desc = pCfg.des}
	  propInfoDialog:create(sceneGame,item,self.layerNum+1,nil,nil,nil,nil,nil,nil,nil,true)
	end
  local pIcon = LuaCCSprite:createWithSpriteFrameName(pCfg.icon,showInfoHandler)
  return pIcon
end

function acSinglesTab2:initTableView()
	local function callBack(...)
		return self:eventHandler(...)
	end
	local hd= LuaEventHandler:createHandler(callBack)
	self.tv=LuaCCTableView:createWithEventHandler(hd,CCSizeMake(G_VisibleSizeWidth-60,self.bgLayer:getContentSize().height-390),nil)
	self.tv:setTableViewTouchPriority(-(self.layerNum-1)*20-4)
	self.tv:setAnchorPoint(ccp(0,0))
	self.tv:setPosition(ccp(30,30))
	self.tv:setMaxDisToBottomOrTop(120)
	self.bgLayer:addChild(self.tv)
end

function acSinglesTab2:eventHandler(handler,fn,idx,cel)
	if fn=="numberOfCellsInTableView" then
		return SizeOfTable(self.data)
	elseif fn=="tableCellSizeForIndex" then
		if G_getCurChoseLanguage() == "ko" or G_getCurChoseLanguage()=="ja" or G_getCurChoseLanguage() == "in" or G_getCurChoseLanguage() =="en" or G_getCurChoseLanguage() =="thai"then
           self.cellHeght = 230
        elseif G_getCurChoseLanguage() == "ru"  or G_getCurChoseLanguage() =="de" or G_getCurChoseLanguage() =="ar" then
          self.cellHeght = 285
        end 
		local tmpSize = CCSizeMake(G_VisibleSizeWidth-60,self.cellHeght)
		return  tmpSize
	elseif fn=="tableCellAtIndex" then
		local cell=CCTableViewCell:new()
		cell:autorelease()
		local backSprie=LuaCCScale9Sprite:createWithSpriteFrameName("letterBgWrite.png",CCRect(20,20,10,10),function () end)
		backSprie:setContentSize(CCSizeMake(G_VisibleSizeWidth-65,self.cellHeght))
		backSprie:setPosition(ccp((G_VisibleSizeWidth-60)/2,self.cellHeght/2))
		backSprie:setTouchPriority(-(self.layerNum-1)*20-1)

		local cellData=self.data[idx+1]
		local nameStrTb={}
		for k,v in pairs(cellData.rewardTb) do
			table.insert(nameStrTb,v.name.." x"..FormatNumber(v.num))
		end
		local nameLb=GetTTFLabel(table.concat(nameStrTb, ", "),25)
		nameLb:setAnchorPoint(ccp(0,0.5))
		nameLb:setColor(G_ColorGreen)
		nameLb:setPosition(ccp(10,(self.cellHeght/2+50+self.cellHeght)/2))
		backSprie:addChild(nameLb)

		local limitLb=GetTTFLabel("("..cellData.curbuyNum.."/"..cellData.maxbuyNum..")",25)
		limitLb:setAnchorPoint(ccp(0,0.5))
		limitLb:setPosition(ccp(10+nameLb:getContentSize().width+5,(self.cellHeght/2+50+self.cellHeght)/2))
		backSprie:addChild(limitLb)

		local award=cellData.rewardTb[1]
		local icon
		local iconSize=100
		if(award.type and award.type=="e")then
			if(award.eType)then
				if(award.eType=="a")then
					icon=accessoryVoApi:getAccessoryIcon(award.key,80,iconSize)
				elseif(award.eType=="f")then
					icon=accessoryVoApi:getFragmentIcon(award.key,80,iconSize)
				elseif(award.pic and award.pic~="")then
					icon=GetBgIcon(award.pic,nil,nil,80,iconSize)
				end
			end
		elseif(award.equipId)then
			local eType=string.sub(award.equipId,1,1)
			if(eType=="a")then
				icon=accessoryVoApi:getAccessoryIcon(award.equipId,80,iconSize)
			elseif(eType=="f")then
				icon=accessoryVoApi:getFragmentIcon(award.equipId,80,iconSize)
			elseif(eType=="p")then
				icon=GetBgIcon(accessoryCfg.propCfg[award.equipId].icon,nil,nil,80,iconSize)
			end
		elseif(award.pic and award.pic~="")then
			icon=GetBgIcon(award.pic,nil,nil,80,iconSize)
		end
		if(icon)then
			icon:setAnchorPoint(ccp(0,0.5))
			icon:setPosition(ccp(10,self.cellHeght/2-10))
			backSprie:addChild(icon)
		end

		local descLb=GetTTFLabelWrap(getlocal(award.desc),22,CCSizeMake(G_VisibleSizeWidth-335,0),kCCTextAlignmentLeft,kCCVerticalTextAlignmentCenter)
		descLb:setAnchorPoint(ccp(0,1))
		descLb:setPosition(ccp(130,self.cellHeght/2+40))
		backSprie:addChild(descLb)

		-- local priceLb=GetTTFLabel(cellData.price,25)
		-- priceLb:setPosition(ccp(G_VisibleSizeWidth-135,self.cellHeght/2+10))
		-- if(allianceMemberVoApi:getCanUseDonate(playerVoApi:getUid())<cellData.price)then
		-- 	priceLb:setColor(G_ColorRed)
		-- else
		-- 	priceLb:setColor(G_ColorYellowPro)
		-- end
		-- backSprie:addChild(priceLb)
		local canbuy = true

		local posX = backSprie:getContentSize().width-120
		local poxY
		if SizeOfTable(cellData.price) == 1 then
			poxY=self.cellHeght/2+20
		elseif SizeOfTable(cellData.price) == 2 then
			poxY=self.cellHeght/2+50
		elseif SizeOfTable(cellData.price) ==3 then
			poxY=self.cellHeght/2+70
		end
		local scale = 0.3
		local x=1
		for i=1,3 do
			local kid ="mm_m"..i
			if cellData.price[kid]~=nil then
				local pCfg = acSinglesVoApi:getTokenCfgForShowByPid(kid)
				local icon = CCSprite:createWithSpriteFrameName(pCfg.icon)
				icon:setAnchorPoint(ccp(0,0.5))
				icon:setScale(scale)
				icon:setPosition(ccp(posX,poxY-(x-1)*(icon:getContentSize().height*scale+5)))
				backSprie:addChild(icon)

				local hadNum = tonumber(acSinglesVoApi:getTokenNumByID(kid))
				local numLb = GetTTFLabel(cellData.price[kid],25)
				numLb:setAnchorPoint(ccp(0,0.5))
				numLb:setPosition(ccp(posX+icon:getContentSize().width*scale+10,poxY-(x-1)*(icon:getContentSize().height*scale+5)))
				backSprie:addChild(numLb)
				if hadNum<cellData.price[kid] then
					numLb:setColor(G_ColorRed)
					canbuy= false
				else
					numLb:setColor(G_ColorWhite)
				end
				x=x+1
			end
		end

		local function onClick(tag,object)
			 if G_checkClickEnable()==false then
	            do
	                return
	            end
	        else
	            base.setWaitTime=G_getCurDeviceMillTime()
	        end 
	        if self.tv:getScrollEnable()==true and self.tv:getIsScrolled()==false then
	        	 PlayEffect(audioCfg.mouseClick)
	        	if(cellData.curbuyNum<cellData.maxbuyNum)then
					local function onRequestEnd(fn,data)
						local ret,sData=base:checkServerData(data)
							if(ret==true)then
								G_addPlayerAward(award.type,award.key,award.id,award.num,false,true)
								G_showRewardTip(cellData.rewardTb)
								for k,v in pairs(cellData.price) do
									acSinglesVoApi:updateSelfTokens(k,-v)
	                    			self:updateTokenNum(k)
								end
								acSinglesVoApi:updateHasBuyNumByID(cellData.id,1)
								cellData.curbuyNum=acSinglesVoApi:getHasBuyNumByID(cellData.id)
								local recordPoint = self.tv:getRecordPoint()
								self.tv:reloadData()
								self.tv:recoverToRecordPoint(recordPoint)

								if acSinglesVoApi:getIsChatByID(cellData.id)==true then
									local propName=award.name
									local message={key="activity_singles_chatMessage",param={playerVoApi:getPlayerName(),propName}}
									chatVoApi:sendSystemMessage(message)
								end
							end
						end
					socketHelper:activitySinglesShop(cellData.id,onRequestEnd)
				end
	        end
         
			
		end
		local buyItem = GetButtonItem("BtnCancleSmall.png","BtnCancleSmall_Down.png","BtnCancleSmall.png",onClick,nil,getlocal("code_gift"),25)
		buyItem:setTag(self.tagOffset+idx+1)
		buyItem:setScale(0.8)
		local buyBtn = CCMenu:createWithItem(buyItem)
		buyBtn:setPosition(ccp(G_VisibleSizeWidth-135,self.cellHeght/4))
		buyBtn:setTouchPriority(-(self.layerNum-1)*20-3)
		backSprie:addChild(buyBtn)

		if canbuy == false or (cellData.curbuyNum>=cellData.maxbuyNum) then
			buyItem:setEnabled(false)
		else
			buyItem:setEnabled(true)
		end

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

function acSinglesTab2:tick()
	
end

function acSinglesTab2:buyItem(index)
	
end


function acSinglesTab2:dispose()
	self.data=nil
end