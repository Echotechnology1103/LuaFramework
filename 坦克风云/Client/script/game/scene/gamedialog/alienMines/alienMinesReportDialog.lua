alienMinesReportDialog = commonDialog:new()

function alienMinesReportDialog:new()
	local nc = {}
	setmetatable(nc, self)
	self.__index = self

	self.normalHeight=120
	self.unreadLabel=nil
	self.totalLabel=nil
	self.canClick=false
	self.mailClick=0
	self.noEmailLabel=nil

	spriteController:addPlist("public/emailNewUI.plist")
   	spriteController:addTexture("public/emailNewUI.png")

	return nc
end	

function alienMinesReportDialog:resetTab()
    self.panelLineBg:setContentSize(CCSizeMake(G_VisibleSizeWidth-20, G_VisibleSizeHeight - 100))
    self.panelLineBg:setPosition(ccp(G_VisibleSizeWidth/2, self.bgLayer:getContentSize().height/2-36))
    if self.panelLineBg then
		self.panelLineBg:setVisible(false)
	end
	if self.panelTopLine then
		self.panelTopLine:setVisible(true)
    	self.panelTopLine:setPositionY(G_VisibleSizeHeight-82)
	end
end	

function alienMinesReportDialog:initLayer()
end

function alienMinesReportDialog:initTableView()
	local rect = CCRect(0, 0, 50, 50);
	local capInSet = CCRect(20, 20, 10, 10);
	local function click(hd,fn,idx)
	end
	self.tvBg =LuaCCScale9Sprite:createWithSpriteFrameName("letterBgWrite.png",capInSet,click)
	self.tvBg:setContentSize(CCSizeMake(self.bgLayer:getContentSize().width-40, self.bgLayer:getContentSize().height-185))
	self.tvBg:ignoreAnchorPointForPosition(false)
	self.tvBg:setAnchorPoint(ccp(0.5,0))
	--self.tvBg:setIsSallow(false)
	--self.tvBg:setTouchPriority(-(self.layerNum-1)*20-2)
	self.tvBg:setPosition(ccp(G_VisibleSizeWidth/2,85))
	self.tvBg:setOpacity(0)
	self.bgLayer:addChild(self.tvBg)

	self.noEmailLabel=GetTTFLabel(getlocal("noEmails"),24,true)
	self.noEmailLabel:setPosition(getCenterPoint(self.tvBg))
	self.noEmailLabel:setColor(G_ColorGray)
	self.tvBg:addChild(self.noEmailLabel,2)
	self.noEmailLabel:setVisible(false)

	local strSize2Pos = 50
    if G_getCurChoseLanguage() =="cn" or G_getCurChoseLanguage() =="ko" or G_getCurChoseLanguage() =="ja" or G_getCurChoseLanguage() =="tw" then
        strSize2Pos =0
    end
	local posX=340
	local posY=30

	local groupSelf = CCSprite:createWithSpriteFrameName("groupSelf.png")
    groupSelf:setScaleY(40/groupSelf:getContentSize().height)
    groupSelf:setScaleX(5)
    groupSelf:setPosition(ccp(G_VisibleSizeWidth*0.5+20,posY))
    groupSelf:ignoreAnchorPointForPosition(false)
    groupSelf:setAnchorPoint(ccp(0.5,0))
    self.bgLayer:addChild(groupSelf)

	self.unreadLabel=GetTTFLabel(getlocal("email_unread_num",{0}),22)
	self.unreadLabel:setAnchorPoint(ccp(0.5,0))
	self.unreadLabel:setPosition(posX-90-strSize2Pos,posY+8)
	self.unreadLabel:setColor(G_ColorYellowPro)
	self.bgLayer:addChild(self.unreadLabel,2)

	self.totalLabel=GetTTFLabel(getlocal("email_total_num",{0}),22)
	self.totalLabel:setAnchorPoint(ccp(0.5,0))
	self.totalLabel:setPosition(posX+45+strSize2Pos,posY+8)
	self.bgLayer:addChild(self.totalLabel,2)

	local function initTv()
		local function callBack(...)
	       return self:eventHandler(...)
	    end
	    local hd= LuaEventHandler:createHandler(callBack)
	    self.tv=LuaCCTableView:createWithEventHandler(hd,CCSizeMake(self.bgLayer:getContentSize().width-40,self.bgLayer:getContentSize().height-185),nil)
	    self.bgLayer:setTouchPriority(-(self.layerNum-1)*20-1)
	    self.tv:setTableViewTouchPriority(-(self.layerNum-1)*20-3)
	    self.tv:setPosition(ccp(20,85))
	    self.bgLayer:addChild(self.tv,1)
	    self.tv:setMaxDisToBottomOrTop(120)

	    local num=alienMinesEmailVoApi:getNum()
	    if num>0 then
			self.noEmailLabel:setVisible(false)
		else
			self.noEmailLabel:setVisible(true)
		end

		if self.unreadLabel then
			local unreadNum=alienMinesEmailVoApi:getHasUnread()
			self.unreadLabel:setString(getlocal("email_unread_num",{unreadNum}))
		end
		if self.totalLabel then
			local totalNum=alienMinesEmailVoApi:getTotalNum()
			self.totalLabel:setString(getlocal("email_total_num",{totalNum}))
		end
	end
	local function emailListCallback(fn,data)
		if base:checkServerData(data)==true then
			if self and self.bgLayer then
				initTv()
				self:resetForbidLayer()
			end
		end
	end
	if alienMinesEmailVoApi:getFlag()==-1 then
		socketHelper:emailList(4,0,0,emailListCallback,1,true)
	elseif alienMinesEmailVoApi:hasMore()==false and (alienMinesEmailVoApi:getNotReadNum()~=alienMinesEmailVoApi:getHasUnread()) then
		local mineid,maxeid=alienMinesEmailVoApi:getMinAndMaxEid(self.selectedTabIndex+1)
		socketHelper:emailList(4,mineid,maxeid,emailListCallback,nil,true)
	else
		initTv()
	end
end

function alienMinesReportDialog:eventHandler(handler,fn,idx,cel)
	if fn=="numberOfCellsInTableView" then
		local hasMore=alienMinesEmailVoApi:hasMore()
		local num=alienMinesEmailVoApi:getNum()
		if hasMore then
			num=num+1
		end
		return num
	elseif fn=="tableCellSizeForIndex" then
		local tmpSize
		tmpSize=CCSizeMake(self.bgLayer:getContentSize().width-40,self.normalHeight)
		return  tmpSize
	elseif fn=="tableCellAtIndex" then
		local strSize2 = 24
		if G_getCurChoseLanguage() == "ru" then
				strSize2 = 21
		end
		local cell=CCTableViewCell:new()
		cell:autorelease()
		
		local hasMore=alienMinesEmailVoApi:hasMore()
		local num=alienMinesEmailVoApi:getNum()
		local emailVoTab=alienMinesEmailVoApi:getEmailsList()
		
		local rect = CCRect(0, 0, 50, 50);
		local capInSet = CCRect(20, 20, 10, 10);
		local function cellClick(hd,fn,idx)
			return self:cellClick(idx)
		end
		local backSprie
		if hasMore and idx==num then
			backSprie=LuaCCScale9Sprite:createWithSpriteFrameName("ItemBtnMore.png",capInSet,cellClick)
			backSprie:setContentSize(CCSizeMake(self.bgLayer:getContentSize().width-40, self.normalHeight-2))
			backSprie:ignoreAnchorPointForPosition(false);
			backSprie:setAnchorPoint(ccp(0.5,0));
			backSprie:setTag(idx)
			backSprie:setIsSallow(false)
			backSprie:setTouchPriority(-(self.layerNum-1)*20-2)
			backSprie:setPosition(ccp((self.bgLayer:getContentSize().width-40)/2,0));
			cell:addChild(backSprie,1)
			
			local moreLabel=GetTTFLabel(getlocal("showMoreTen"),24)
			moreLabel:setPosition(getCenterPoint(backSprie))
			backSprie:addChild(moreLabel,2)
			
			return cell
		end

		local emailVo=emailVoTab[idx+1]
		if emailVo.isRead==1 then
			backSprie=LuaCCScale9Sprite:createWithSpriteFrameName("newReadBg.png",CCRect(5,5,1,1),cellClick)
		else
			backSprie=LuaCCScale9Sprite:createWithSpriteFrameName("newUnReadBg.png",CCRect(5,23,1,1),cellClick)
		end
		backSprie:setContentSize(CCSizeMake(self.bgLayer:getContentSize().width-40, self.normalHeight-10))
		backSprie:ignoreAnchorPointForPosition(false);
		backSprie:setAnchorPoint(ccp(0.5,0));
		backSprie:setTag(idx)
		backSprie:setIsSallow(false)
		backSprie:setTouchPriority(-(self.layerNum-1)*20-2)
		backSprie:setPosition(ccp((self.bgLayer:getContentSize().width-40)/2,5));
		cell:addChild(backSprie,1)
		
		local emailIconBg
		if emailVo.isRead==1 then
			emailIconBg=LuaCCScale9Sprite:createWithSpriteFrameName("emailNewUI_readIconBg.png",CCRect(16,16,2,2),function()end)
		else
			emailIconBg=LuaCCScale9Sprite:createWithSpriteFrameName("newChat_head_shade.png",CCRect(16,16,2,2),function()end)
		end
		emailIconBg:setContentSize(CCSizeMake(backSprie:getContentSize().height,backSprie:getContentSize().height))
		emailIconBg:setAnchorPoint(ccp(0,0.5))
		emailIconBg:setPosition(0,backSprie:getContentSize().height/2)
		backSprie:addChild(emailIconBg)

		local emailIcon
		if emailVo.isRead==1 then
			emailIcon=CCSprite:createWithSpriteFrameName("emailNewUI_readIcon.png")
		else
			emailIcon=CCSprite:createWithSpriteFrameName("emailNewUI_unReadIcon.png")
		end
		emailIcon:setPosition(getCenterPoint(emailIconBg))
		emailIconBg:addChild(emailIcon)

		local typeIconName
		if emailVo.reportType==1 then
			if emailVo.isRead==1 then
				typeIconName="emailNewUI_fight0.png"
			else
				typeIconName="emailNewUI_fight1.png"
			end
		elseif emailVo.reportType==2 or emailVo.reportType==5 or emailVo.reportType==6 then
			if emailVo.isRead==1 then
				typeIconName="emailNewUI_scout0.png"
			else
				typeIconName="emailNewUI_scout1.png"
			end
		elseif emailVo.reportType==3 or emailVo.reportType==7 or emailVo.reportType==8 then
			if emailVo.isRead==1 then
				typeIconName="emailNewUI_return0.png"
			else
				typeIconName="emailNewUI_return1.png"
			end
		elseif emailVo.reportType==4 then
			if emailVo.isRead==1 then
				typeIconName="emailNewUI_gather0.png"
			else
				typeIconName="emailNewUI_gather1.png"
			end
		end
		if typeIconName then
			local typeIcon=CCSprite:createWithSpriteFrameName(typeIconName)
			typeIcon:setPosition(getCenterPoint(emailIconBg))
			if emailVo.isRead==1 then
				typeIcon:setPositionY(typeIcon:getPositionY()-10)
			end
			emailIconBg:addChild(typeIcon)
		end

		local _posX=emailIconBg:getPositionX()+emailIconBg:getContentSize().width+10
		
		local fromToLabel
    	if self.selectedTabIndex==0 or self.selectedTabIndex==1 then
        	fromToLabel=GetTTFLabel(getlocal("email_from",{emailVo.from}),20)
		elseif self.selectedTabIndex==2 then
			fromToLabel=GetTTFLabel(getlocal("email_to",{emailVo.to}),20)
		end
		fromToLabel:setAnchorPoint(ccp(0,0))
		fromToLabel:setPosition(_posX,65)
		backSprie:addChild(fromToLabel)

		local noticeSp
		local spSize=40
		if emailVo.isAllianceEmail and emailVo.isAllianceEmail==1 then
			noticeSp=CCSprite:createWithSpriteFrameName("Icon_warn.png")
			noticeSp:setAnchorPoint(ccp(0.5,0.5))
			noticeSp:setPosition(ccp(_posX+spSize/2,80))
		    noticeSp:setScale(spSize/noticeSp:getContentSize().width)
			backSprie:addChild(noticeSp)

			fromToLabel:setPosition(_posX,15)
		end
		
		local titleStr=emailVo.title
		if titleStr and titleStr~="" then
			local lbWidth=25*16
			if noticeSp then
				lbWidth=lbWidth-(spSize+5)
			end
			local titleLabel=GetTTFLabelWrap(titleStr,strSize2,CCSizeMake(lbWidth,0),kCCTextAlignmentLeft,kCCVerticalTextAlignmentTop,"Helvetica-bold")
			titleLabel:setAnchorPoint(ccp(0,0.5))
			titleLabel:setColor(G_ColorYellow)
			backSprie:addChild(titleLabel,2)
			local lbx=_posX
			if noticeSp then
				lbx=lbx+spSize+5
			end
			titleLabel:setPosition(lbx,80)

			local lineSp=LuaCCScale9Sprite:createWithSpriteFrameName("reportWhiteLine.png",CCRect(4,0,1,2),function()end)
	        lineSp:setContentSize(CCSizeMake(self.bgLayer:getContentSize().width-40-emailIconBg:getContentSize().width-24, 2))
	        lineSp:setAnchorPoint(ccp(0,1))
	        lineSp:setPosition(emailIconBg:getContentSize().width+12,titleLabel:getPositionY()-titleLabel:getContentSize().height/2-5)
	        lineSp:setOpacity(255*0.06)
	        backSprie:addChild(lineSp)
			
			fromToLabel:setPosition(lbx,15)
		end
		
		local timeLabel=GetTTFLabel(alienMinesEmailVoApi:getTimeStr(emailVo.time),20)
		timeLabel:setAnchorPoint(ccp(1,0))
		timeLabel:setPosition(backSprie:getContentSize().width-25,15)
		backSprie:addChild(timeLabel,2)

		return cell
	elseif fn=="ccTouchBegan" then
		self.isMoved=false
		return true
	elseif fn=="ccTouchMoved" then
		self.isMoved=true
	elseif fn=="ccTouchEnded"  then

	end
end

--点击了cell或cell上某个按钮
function alienMinesReportDialog:cellClick(idx)
    if self.tv:getScrollEnable()==true and self.tv:getIsScrolled()==false then
        PlayEffect(audioCfg.mouseClick)
		local type=4
		local num=alienMinesEmailVoApi:getNum()
		local hasMore=alienMinesEmailVoApi:hasMore()
		local nextHasMore=false
		if hasMore and tostring(idx)==tostring(num) then
			local function emailListCallback(fn,data)
				if base:checkServerData(data)==true then
					self.canClick=true
					local newNum=alienMinesEmailVoApi:getNum()
					local diffNum=newNum-num
					local nextHasMore=alienMinesEmailVoApi:hasMore()
					if nextHasMore then
						diffNum=diffNum+1
					end
					local recordPoint = self.tv:getRecordPoint()
					self:refresh()
					recordPoint.y=-(diffNum-1)*self.normalHeight+recordPoint.y
					self.tv:recoverToRecordPoint(recordPoint)
					alienMinesEmailVoApi:setFlag(self.selectedTabIndex+1,1)
					self.canClick=false
				end
			end
			if self.canClick==false then
				local mineid,maxeid=alienMinesEmailVoApi:getMinAndMaxEid()
				socketHelper:emailList(type,mineid,maxeid,emailListCallback,1,true)
			end
		else
			if self.mailClick==0 then
				self.mailClick=1
				local emailVoTab=alienMinesEmailVoApi:getEmailsList()
				local emailVo=emailVoTab[idx+1]
				local eid=emailVo.eid
				local ifCallBack=false
				-- if type==2 then
					local report=reportVoApi:getReport(eid)
					if report==nil then
						ifCallBack=true
					end
				-- else
				-- 	if emailVo.content==nil or emailVo.content=="" then
				-- 		ifCallBack=true
				-- 	end
				-- end
				--if emailVo and emailVo.isRead==0 then
				if ifCallBack==true then
					local function readEmailCallback(fn,data)
						if base:checkServerData(data)==true then
							self:showDetailDialog(emailVo)
							if emailVo.isRead==0 then
								alienMinesEmailVoApi:setIsRead(eid)
								if self==nil or self.tv==nil then
									do return end
								end
								local recordPoint = self.tv:getRecordPoint()
								self:refresh()
								self.tv:recoverToRecordPoint(recordPoint)
							end
						end
					end
					socketHelper:readEmail(type,eid,readEmailCallback)
				else
					self:showDetailDialog(emailVo)
				end
			end
		end
    end
end

function alienMinesReportDialog:showDetailDialog(emailVo)
	-- if self.selectedTabIndex==1 then
		local report=alienMinesEmailVoApi:getReport(emailVo.eid)
		if report~=nil then
			if report.type==1 then
				titleStr=getlocal("fight_content_fight_title")
			elseif report.type==2 then
				titleStr=getlocal("scout_content_scout_title")
			elseif report.type==3 then
				titleStr=getlocal("fight_content_return_title")
			end
		end
	-- end
	-- require "luascript/script/game/scene/gamedialog/alienMines/alienMinesEmailDetailDialog"
	-- local td=alienMinesEmailDetailDialog:new(self.layerNum+1,4,emailVo.eid)
	require "luascript/script/game/scene/gamedialog/alienMines/alienMinesReportDetailDialog"
	local td=alienMinesReportDetailDialog:new(self.layerNum+1,emailVo.eid)
	local dialog=td:init("panelBg.png",true,CCSizeMake(600,900),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),{},nil,nil,titleStr,false,self.layerNum+1)
	sceneGame:addChild(dialog,self.layerNum+1)
end

function alienMinesReportDialog:tick()
	if self.mailClick>0 then
		self.mailClick=0
	end
	local flag=alienMinesEmailVoApi:getFlag()
	if flag==0 then
		self:refresh()
		alienMinesEmailVoApi:setFlag(1)
	end
end

function alienMinesReportDialog:refresh()
	if self~=nil then
		if self.tv~=nil then
			self.tv:reloadData()
		end

		if self.noEmailLabel then
			local lb=tolua.cast(self.noEmailLabel,"CCLabelTTF")
			if lb then
			    local num=alienMinesEmailVoApi:getNum()
			    if num>0 then
					lb:setVisible(false)
				else
					lb:setVisible(true)
				end
			end
		end

		if self.unreadLabel then
			local unreadNum=alienMinesEmailVoApi:getHasUnread()
			self.unreadLabel:setString(getlocal("email_unread_num",{unreadNum}))
		end
		if self.totalLabel then
			local totalNum=alienMinesEmailVoApi:getTotalNum()
			self.totalLabel:setString(getlocal("email_total_num",{totalNum}))
		end
	end
end

function alienMinesReportDialog:dispose()
	self.mailClick=nil
	self.canClick=nil
	self.normalHeight=nil
	self.unreadLabel=nil
	self.totalLabel=nil
	self.noEmailLabel=nil
	spriteController:removePlist("public/emailNewUI.plist")
  	spriteController:removeTexture("public/emailNewUI.png")
end

