acYijizaitanTab1={}

function acYijizaitanTab1:new()
	local nc={}
	setmetatable(nc,self)
	self.__index=self
	self.bgLayer=nil
	self.layerNum=nil
	self.isToday=nil
	self.heightTab={}
	self.rewardList={}
  self.state = 0 
	self.citySp = {}
  self.oldShowIndex = 1
  spriteController:addPlist("serverWar/serverWar.plist")
  spriteController:addTexture("serverWar/serverWar.pvr.ccz")
  CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("public/serverWarLocal/serverWarLocalCity.plist")
  CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("public/acYijizaitan.plist")
	return nc
end

function acYijizaitanTab1:init(layerNum)
	self.bgLayer=CCLayer:create()
	self.layerNum=layerNum
	self.isToday=acYijizaitanVoApi:isToday()
	self:initLayer1()
	return self.bgLayer
end
function acYijizaitanTab1:initLayer1( ... )
  local function touchDialog()
      if self.state == 2 then
          PlayEffect(audioCfg.mouseClick)
          self.state = 3
      end
  end
  self.touchDialogBg = LuaCCScale9Sprite:createWithSpriteFrameName("BlackAlphaBg.png",CCRect(10, 10, 1, 1),touchDialog);
  self.touchDialogBg:setTouchPriority(-(self.layerNum-1)*20-10)
  local rect=CCSizeMake(G_VisibleSizeWidth,G_VisibleSizeHeight)
  self.touchDialogBg:setContentSize(rect)
  self.touchDialogBg:setOpacity(0)
  self.touchDialogBg:setIsSallow(false) -- 点击事件透下去
  self.touchDialogBg:setPosition(getCenterPoint(self.bgLayer))
  self.bgLayer:addChild(self.touchDialogBg,1)


	local function bgClick()
  	end
  
  local w = G_VisibleSizeWidth - 50 -- 背景框的宽度
  local backSprie = LuaCCScale9Sprite:createWithSpriteFrameName("CorpsLevel.png",CCRect(65, 25, 1, 1),bgClick)
  backSprie:setContentSize(CCSizeMake(w, 200))
  backSprie:setAnchorPoint(ccp(0.5,0))
  backSprie:setPosition(ccp(G_VisibleSizeWidth/2, G_VisibleSizeHeight - 365))
  self.bgLayer:addChild(backSprie)
  
  local function touch(tag,object)
    PlayEffect(audioCfg.mouseClick)
    local tabStr={};
    local tabColor ={};
    local td=smallDialog:new()
    tabStr = {"\n",getlocal("activity_yijizaitan_tab1_tip7"),"\n",getlocal("activity_yijizaitan_tab1_tip6"),"\n",getlocal("activity_yijizaitan_tab1_tip5"),"\n",getlocal("activity_yijizaitan_tab1_tip4"),"\n",getlocal("activity_yijizaitan_tab1_tip3"),"\n",getlocal("activity_yijizaitan_tab1_tip2"),"\n",getlocal("activity_yijizaitan_tab1_tip1"),"\n"}
    local dialog=td:init("PanelPopup.png",CCSizeMake(500,400),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),nil,true,true,self.layerNum+1,tabStr,25,{nil,G_ColorRed,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil})
    sceneGame:addChild(dialog,self.layerNum+1)
  end

  w = w - 10 -- 按钮的x坐标
  local menuItemDesc=GetButtonItem("BtnInfor.png","BtnInfor_Down.png","BtnInfor_Down.png",touch,nil,nil,0)
  menuItemDesc:setAnchorPoint(ccp(1,1))
  menuItemDesc:setScale(0.8)
  local menuDesc=CCMenu:createWithItem(menuItemDesc)
  menuDesc:setTouchPriority(-(self.layerNum-1)*20-5)
  menuDesc:setPosition(ccp(w-10, 190))
  backSprie:addChild(menuDesc)
  
  w = w - menuItemDesc:getContentSize().width

  local acLabel = GetTTFLabel(getlocal("activity_timeLabel"),25)
  acLabel:setAnchorPoint(ccp(0.5,1))
  acLabel:setPosition(ccp((G_VisibleSizeWidth - 20)/2, 190))
  backSprie:addChild(acLabel)
  acLabel:setColor(G_ColorGreen)

  local acVo = acYijizaitanVoApi:getAcVo()
  local timeStr=activityVoApi:getActivityTimeStr(acVo.st,acVo.acEt)
  local messageLabel=GetTTFLabel(timeStr,25)
  messageLabel:setAnchorPoint(ccp(0.5,1))
  messageLabel:setPosition(ccp((G_VisibleSizeWidth - 20)/2, 150))
  backSprie:addChild(messageLabel)
  self.timeLb=messageLabel
  self:updateAcTime()

  local aid,tankID = acYijizaitanVoApi:getTankIdAndAid()
  local function showTankInfo( ... )
    local function callback()
      self:showBattle()
    end
    if acYijizaitanVoApi:returnTankData()==nil then
      tankInfoDialog:create(nil,tankID,self.layerNum+1)
    else
      tankInfoDialog:create(nil,tankID,self.layerNum+1,nil,true,callback)
    end
  end

  local version = acYijizaitanVoApi:getVersion()

  local orderId=GetTankOrderByTankId(tonumber(tankID))
  local tankStr="t"..orderId.."_1.png"

  local tankSp=LuaCCSprite:createWithSpriteFrameName(tankStr,showTankInfo)
  tankSp:setTouchPriority(-(self.layerNum-1)*20-5)
  tankSp:setAnchorPoint(ccp(0,0.5))
  tankSp:setPosition(ccp(-18,75))

  backSprie:addChild(tankSp)
  if version then 
    if tonumber(version)==2 then
      tankSp:setPosition(0,75)
    elseif tonumber(version) == 7 then
      tankSp:setPosition(-40,75)
    elseif tonumber(version) == 8 then
      tankSp:setPosition(-25,75)
    elseif tonumber(version)==9 then
      tankSp:setPosition(-5,75)
    end
  end

  local tankBarrel="t"..orderId.."_1_1.png"  --炮管 第6层
  local tankBarrelSP=CCSprite:createWithSpriteFrameName(tankBarrel)
  if tankBarrelSP and version ~=8 then
    tankBarrelSP:setPosition(ccp(tankSp:getContentSize().width*0.5,tankSp:getContentSize().height*0.5))
    tankBarrelSP:setAnchorPoint(ccp(0.5,0.5))
    tankSp:addChild(tankBarrelSP)
  end

  local upLb = nil 
  if version and tonumber(version)<= 11 then
    upLb=getlocal("activity_yijizaitan_desc"..version)
  else
    upLb=getlocal("activity_yijizaitan_desc1")
  end
    

  local desTv, desLabel = G_LabelTableView(CCSizeMake(w-110, 110),upLb,25,kCCTextAlignmentLeft)
  backSprie:addChild(desTv)
  desTv:setPosition(ccp(170,10))
  desTv:setAnchorPoint(ccp(0,0))
  desTv:setTableViewTouchPriority(-(self.layerNum-1)*20-4)
  desTv:setMaxDisToBottomOrTop(100)


  

  if(G_isIphone5())then 
    self.background=LuaCCScale9Sprite:createWithSpriteFrameName("panelItemBg.png",CCRect(20, 20, 10, 10),function () end)
    self.background:setContentSize(CCSizeMake(G_VisibleSizeWidth-50,160))
    self.background:setAnchorPoint(ccp(0.5,1))
    self.background:setPosition(ccp(G_VisibleSizeWidth/2,G_VisibleSizeHeight - 370))
    self.bgLayer:addChild(self.background)

    local titleLb = GetTTFLabelWrap(getlocal("activity_feixutansuo_rewardTitle"),25,CCSizeMake(self.background:getContentSize().width-20,0),kCCTextAlignmentCenter,kCCVerticalTextAlignmentTop)
    titleLb:setAnchorPoint(ccp(0.5,1))
    titleLb:setPosition(self.background:getContentSize().width/2,self.background:getContentSize().height-10)
    self.background:addChild(titleLb)

    self.noTansuoLb = GetTTFLabelWrap(getlocal("activity_feixutansuo_noReward"),25,CCSizeMake(self.background:getContentSize().width,0),kCCTextAlignmentCenter,kCCVerticalTextAlignmentCenter)
    self.noTansuoLb:setAnchorPoint(ccp(0.5,0.5))
    self.noTansuoLb:setPosition(self.background:getContentSize().width/2,self.background:getContentSize().height/2)
    self.background:addChild(self.noTansuoLb)
  end

	self:updateShowTv()

  local mapHeight
  if G_isIphone5() == true then
    mapHeight = 230
  else
    mapHeight = 225
  end

  local function callBack(...)
    return self:eventHandler2(...)
  end
  local hd= LuaEventHandler:createHandler(callBack)
  self.tv2=LuaCCTableView:createWithEventHandler(hd,CCSizeMake(self.bgLayer:getContentSize().width-60,360),nil)
  self.tv2:setPosition(ccp(30,mapHeight))

  self.tv2:setMaxDisToBottomOrTop(0)
  self.tv2:setTableViewTouchPriority(-(self.layerNum-1)*20-5)
  self.bgLayer:addChild(self.tv2,1)


	local gemCost=acYijizaitanVoApi:getLotteryOnceCost()--cfg.serverreward.gemCost
	local oneGems=gemCost       --一次抽奖需要金币
	local tenGems=acYijizaitanVoApi:getLotteryTenCost()      --十次抽奖需要金币
	local vipCost = acYijizaitanVoApi:getVipCost()
	local vipTotal = acYijizaitanVoApi:getVipTansuoTotal()
	local vipHadNum = acYijizaitanVoApi:getVipHadTansuoNum()

      local leftPosX=self.bgLayer:getContentSize().width/2-200
      local centerPosX = self.bgLayer:getContentSize().width/2
      local rightPosX=self.bgLayer:getContentSize().width/2+200

      local lbY=200
      local iconY = 150
      local btnY = 70
      self.goldSp1=CCSprite:createWithSpriteFrameName("IconGold.png")
      self.goldSp1:setAnchorPoint(ccp(0,0.5))
      self.goldSp1:setPosition(ccp(leftPosX,lbY))
      self.bgLayer:addChild(self.goldSp1)
      self.goldSp1:setScale(1.5)

      self.gemsLabel1=GetTTFLabel(oneGems,25)
      self.gemsLabel1:setAnchorPoint(ccp(1,0.5))
      self.gemsLabel1:setPosition(ccp(leftPosX,lbY))
      self.bgLayer:addChild(self.gemsLabel1,1)

      local iconSP1 = CCSprite:createWithSpriteFrameName("Telescope.png")
      --iconSP1:setScale(0.5)
      iconSP1:setAnchorPoint(ccp(0.5,0.5))
      iconSP1:setPosition(leftPosX,iconY)
      self.bgLayer:addChild(iconSP1)

      local goldSp2=CCSprite:createWithSpriteFrameName("IconGold.png")
      goldSp2:setAnchorPoint(ccp(0,0.5))
      goldSp2:setPosition(ccp(centerPosX,lbY))
      self.bgLayer:addChild(goldSp2)
      goldSp2:setScale(1.5)


      self.gemsLabel2=GetTTFLabel(tenGems,25)
      self.gemsLabel2:setAnchorPoint(ccp(1,0.5))
      self.gemsLabel2:setPosition(ccp(centerPosX,lbY))
      self.bgLayer:addChild(self.gemsLabel2,1)

       local iconSP2= CCSprite:createWithSpriteFrameName("Telescope.png")
      iconSP2:setAnchorPoint(ccp(0.5,0.5))
      iconSP2:setPosition(centerPosX,iconY)
      self.bgLayer:addChild(iconSP2)


      self.goldSp3=CCSprite:createWithSpriteFrameName("IconGold.png")
      self.goldSp3:setAnchorPoint(ccp(0,0.5))
      self.goldSp3:setPosition(ccp(rightPosX,lbY))
      self.bgLayer:addChild(self.goldSp3)
      self.goldSp3:setScale(1.5)

      self.gemsLabel3=GetTTFLabel(vipCost,25)
      self.gemsLabel3:setAnchorPoint(ccp(1,0.5))
      self.gemsLabel3:setPosition(ccp(rightPosX,lbY))
      self.bgLayer:addChild(self.gemsLabel3,1)

      local vipLbWidth = rightPosX
      if G_getCurChoseLanguage() =="fr" then
      		vipLbWidth = vipLbWidth-20
      end
      local vipIcon = GetTTFLabel(getlocal("vipTitle"),25)
      vipIcon:setAnchorPoint(ccp(0.5,0.5))
      vipIcon:setPosition(vipLbWidth,lbY-35)
      self.bgLayer:addChild(vipIcon)
      vipIcon:setColor(G_ColorYellow)

      self.vipNum = GetTTFLabel("("..getlocal("scheduleChapter",{vipHadNum,vipTotal})..")",25)
      self.vipNum:setAnchorPoint(ccp(0.5,0.5))
      self.vipNum:setPosition(rightPosX,iconY-20)
      self.bgLayer:addChild(self.vipNum)
      self:updateVipNUm()
	  self:updateShowBtn()
end

function acYijizaitanTab1:updateShowBtn()
	local free = 0
	if acYijizaitanVoApi:isToday() == true then
		free = 1
	end
	local gemCost=acYijizaitanVoApi:getLotteryOnceCost()--cfg.serverreward.gemCost
	local oneGems=gemCost       --一次抽奖需要金币
	local tenGems=acYijizaitanVoApi:getLotteryTenCost()      --十次抽奖需要金币
	local vipCost = acYijizaitanVoApi:getVipCost()
	local vipTotal = acYijizaitanVoApi:getVipTansuoTotal()
	local vipHadNum = acYijizaitanVoApi:getVipHadTansuoNum()



	  local leftPosX=self.bgLayer:getContentSize().width/2-200
	  local centerPosX = self.bgLayer:getContentSize().width/2
	  local rightPosX=self.bgLayer:getContentSize().width/2+200

	  local lbY=200
      local iconY = 150
      local btnY = 70

	 local function btnCallback(tag,object)
	            if G_checkClickEnable()==false then
	                do
	                    return
	                end
	            else
	                base.setWaitTime=G_getCurDeviceMillTime()
	            end 

	          PlayEffect(audioCfg.mouseClick)
	          local free = 0
				if acYijizaitanVoApi:isToday() == true then
					free = 1
				end
	          local num
	          if tag==1 then
	            if playerVoApi:getGems()<oneGems and free==1 then
	              GemsNotEnoughDialog(nil,nil,oneGems-playerVoApi:getGems(),self.layerNum+1,oneGems)
	              do return end
	            end
	            if free == 0 then
	            	 num=0
	            else
	            	 num=1
	            end
	           
	          elseif tag==2 then
	            if playerVoApi:getGems()<tenGems then
	              GemsNotEnoughDialog(nil,nil,tenGems-playerVoApi:getGems(),self.layerNum+1,tenGems)
	              do return end
	            end
	            num=10
	        	elseif tag == 3 then
	        		if vipTotal==0 then
	        			local function callBack() --充值
					        vipVoApi:showRechargeDialog(self.layerNum+1)
					    end
					    local tsD=smallDialog:new()
					    tsD:initSureAndCancle("PanelHeaderPopup.png",CCSizeMake(550,400),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),callBack,getlocal("dialog_title_prompt"),getlocal("activity_feixutansuo_NoVip"),nil,self.layerNum+1)
	        			do return end
	        		elseif playerVoApi:getGems()<vipCost then
	         			GemsNotEnoughDialog(nil,nil,vipCost-playerVoApi:getGems(),self.layerNum+1,vipCost)
	              		do return end
	              	end
	              	num=99
	          end
	          
	          local function lotteryCallback(fn,data)
              self.oldShowIndex = acYijizaitanVoApi:getShowCityID()
	            local ret,sData=base:checkServerData(data)
	            if ret==true then
	                if sData.data==nil then
	                  do return end
	                end
	                
	                if tag==1 and free == 1 then
	                   playerVoApi:setValue("gems",playerVoApi:getGems()-oneGems)
	                elseif tag==2 then
	                   playerVoApi:setValue("gems",playerVoApi:getGems()-tenGems)
	                elseif tag==3 then
	                   playerVoApi:setValue("gems",playerVoApi:getGems()-vipCost)
	                end

	              --刷新活动数据
	                local tipStr=""
	                local getTank1=false
	                local getTank2=false
	                if sData.data["yijizaitan"] then
	                 local awardData=sData.data["yijizaitan"]["clientReward"]
	                  local nameStr 
	                  local content = {}
                    local addDestr={}
	                  local chat = false
	                  local aid,tankID = acYijizaitanVoApi:getTankIdAndAid()
	                  if awardData then
	                  	for k,v in pairs(awardData) do
		                    local ptype = v[1]
		                    local pID = v[2]
		                    local num = v[3]
		                    local award = {}
		                    local name,pic,desc,id,index,eType,equipId=getItem(pID,ptype)
		                    award={name=name,num=num,pic=pic,desc=desc,id=id,type=ptype,index=index,key=pID,eType=eType,equipId=equipId}
		                    G_addPlayerAward(award.type,award.key,award.id,award.num,nil,true)
		                   	table.insert(content,{award=award})
		                    if ptype=="o" and pID==aid then
		                    	chat = true
		                    end
		                  end
		                  --G_showRewardTip(content)
	                  end
	                  if sData.data["yijizaitan"]["location"] then
	                  	acYijizaitanVoApi:updateShowCityID(sData.data["yijizaitan"]["location"])
	                  end
                    if tag==1 then
                      local showIndex = acYijizaitanVoApi:getShowCityID()
                      if showIndex==1 then
                        if self.oldShowIndex==4 then
                          table.insert(addDestr,getlocal("activity_yijizaitan_startAgain"))
                        else
                          table.insert(addDestr,getlocal("activity_yijizaitan_failure"))
                        end
                      else
                        table.insert(addDestr,getlocal("activity_yijizaitan_success"))
                      end
                    elseif tag==2 then
                      local localtionList = sData.data["yijizaitan"]["locationList"]
                      for k,v in pairs(localtionList) do
                        if v==1 then
                          if  k==1 and self.oldShowIndex==4 then
                            table.insert(addDestr,getlocal("activity_yijizaitan_startAgain"))
                          elseif localtionList[k-1]==4 then
                            table.insert(addDestr,getlocal("activity_yijizaitan_startAgain"))
                          else
                            table.insert(addDestr,getlocal("activity_yijizaitan_failure"))
                          end
                        else
                          table.insert(addDestr,getlocal("activity_yijizaitan_success"))
                        end
                      end
                    end
	                  if sData.data["yijizaitan"]["list"] then
	                  	acYijizaitanVoApi:setRewardList(sData.data["yijizaitan"]["list"])
	                  end
	                  
	                  if tag==3 then
	                  	acYijizaitanVoApi:addVipHadTansuoNum(1)
	                  end

                    if tag==1 then
                        self.touchDialogBg:setIsSallow(true) -- 点击事件透下去
                    end

	                  local function confirmHandler(index)
	                  	if free == 0 then
		                  	acYijizaitanVoApi:updateLastTime()
		                  	self.isToday=acYijizaitanVoApi:isToday()
		                  	acYijizaitanVoApi:updateShow()
  		                end
	                     self:updateShowMap()
		                  self:updateVipNUm()
		                  self:updateShowBtn()
		                  self:updateShowTv()
                      if tag==1 then
                        self:startPalyAnimation()
                      end
                    end
                    smallDialog:showSearchEquipDialog("TankInforPanel.png",CCSizeMake(550,650),CCRect(0, 0, 400, 350),CCRect(130, 50, 1, 1),getlocal("activity_wheelFortune4_reward"),content,nil,true,self.layerNum+1,confirmHandler,true,true,nil,nil,true,nil,nil,nil,nil,nil,nil,nil,addDestr)
	                  
	                  if chat == true then
	                      --聊天公告
                      local paramTab={}
                      paramTab.functionStr="yijizaitan"
                      paramTab.addStr="i_also_want"
			                local nameData={key=tankCfg[tankID].name,param={}}
			                local message={key="activity_yijizaitan_chatSystemMessage",param={playerVoApi:getPlayerName(),nameData}}
			                chatVoApi:sendSystemMessage(message,paramTab)
		            	end
	                end
	              end
	           end
	         if tag == 3 then

	         	local function sureClick( ... )
	         		socketHelper:activityYijizaitanTansuo(num,lotteryCallback)
	         	end
	         	local tsD=smallDialog:new()
				tsD:initSureAndCancle("PanelHeaderPopup.png",CCSizeMake(550,400),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),sureClick,getlocal("dialog_title_prompt"),getlocal("activity_feixutansuo_VipTansuo",{vipCost}),nil,self.layerNum+1)
	         else
	         	socketHelper:activityYijizaitanTansuo(num,lotteryCallback)
	         end
	      end	 	
	   
		if self.lotteryTenBtn == nil then
			self.lotteryTenBtn=GetButtonItem("BtnCancleSmall.png","BtnCancleSmall_Down.png","BtnCancleSmall_Down.png",btnCallback,2,getlocal("activity_feixutansuo_continuousBtn"),25)
		    self.lotteryTenBtn:setAnchorPoint(ccp(0.5,0.5))
		    local lotteryMenu1=CCMenu:createWithItem(self.lotteryTenBtn)
		    lotteryMenu1:setPosition(ccp(centerPosX,btnY))
		    lotteryMenu1:setTouchPriority(-(self.layerNum-1)*20-3)
		    self.bgLayer:addChild(lotteryMenu1,2)
		end
	    
		if self.vipBtn == nil then
		    self.vipBtn=GetButtonItem("BtnCancleSmall.png","BtnCancleSmall_Down.png","BtnCancleSmall_Down.png",btnCallback,3,getlocal("activity_feixutansuo_highBtn"),25)
		 	self.vipBtn:setAnchorPoint(ccp(0.5,0.5))
			local vipMenu=CCMenu:createWithItem(self.vipBtn)
			vipMenu:setPosition(ccp(rightPosX,btnY))
			vipMenu:setTouchPriority(-(self.layerNum-1)*20-3)
			self.bgLayer:addChild(vipMenu,2)
		end

	

	if free == 0 then
		self.lotteryOneBtn=GetButtonItem("BtnOkSmall.png","BtnOkSmall_Down.png","BtnOkSmall_Down.png",btnCallback,1,getlocal("daily_lotto_tip_2"),25)
		self.lotteryTenBtn:setEnabled(false)
		self.vipBtn:setEnabled(false)
	else
		self.lotteryOneBtn=GetButtonItem("BtnCancleSmall.png","BtnCancleSmall_Down.png","BtnCancleSmall_Down.png",btnCallback,1,getlocal("activity_equipSearch_subTitle_1"),25)
		self.lotteryTenBtn:setEnabled(true)
		if vipTotal>0 and vipHadNum>=vipTotal then
			 self.vipBtn:setEnabled(false)
		else
			self.vipBtn:setEnabled(true)
		end
	end

	self.lotteryOneBtn:setAnchorPoint(ccp(0.5,0.5))
	local lotteryMenu=CCMenu:createWithItem(self.lotteryOneBtn)
	lotteryMenu:setPosition(leftPosX,btnY)
	lotteryMenu:setTouchPriority(-(self.layerNum-1)*20-3)
	self.bgLayer:addChild(lotteryMenu,2)
end
function acYijizaitanTab1:updateVipNUm()
	local oneGems=acYijizaitanVoApi:getLotteryOnceCost()--cfg.serverreward.gemCost
	local tenGems=acYijizaitanVoApi:getLotteryTenCost()      --十次抽奖需要金币
	local vipCost = acYijizaitanVoApi:getVipCost()
	local playerGems = playerVoApi:getGems()
	if oneGems>playerGems and self.gemsLabel1 then
		self.gemsLabel1:setColor(G_ColorRed)
	else
		self.gemsLabel1:setColor(G_ColorWhite)
	end
	if tenGems>playerGems and self.gemsLabel2 then
		self.gemsLabel2:setColor(G_ColorRed)
	else
		self.gemsLabel2:setColor(G_ColorWhite)
	end
	if vipCost>playerGems and self.gemsLabel3 then
		self.gemsLabel3:setColor(G_ColorRed)
	else
		self.gemsLabel3:setColor(G_ColorWhite)
	end
	if self.vipNum then
		local vipTotal = acYijizaitanVoApi:getVipTansuoTotal()
		local vipHadNum = acYijizaitanVoApi:getVipHadTansuoNum()
		self.vipNum:setString("("..getlocal("scheduleChapter",{vipHadNum,vipTotal})..")")
	end
end

function acYijizaitanTab1:updateShowTv()
  if(G_isIphone5())then 
  	self.rewardList = acYijizaitanVoApi:getRewardList()
  	if self.rewardList == nil then
  		do return end
  	end

  	if SizeOfTable(self.rewardList)<=0 then
  		self.noTansuoLb:setVisible(true)
  	else
  		self.noTansuoLb:setVisible(false)

  		if self.tv1~=nil then
  			self.tv1:reloadData()
  		else

  			local function callBack(...)

  				return self:eventHandler1(...)
  			end
  			local hd= LuaEventHandler:createHandler(callBack)
  		 	self.tv1=LuaCCTableView:createHorizontalWithEventHandler(hd,CCSizeMake(self.background:getContentSize().width-20,self.background:getContentSize().height-50),nil)
  			self.tv1:setAnchorPoint(ccp(0,0))
  			self.tv1:setPosition(ccp(10,10))
  			self.tv1:setTableViewTouchPriority(-(self.layerNum-1)*20-6)
  			self.tv1:setMaxDisToBottomOrTop(100)
  			self.background:addChild(self.tv1,1)
  		end
  	end
  end
end


function acYijizaitanTab1:updateShowMap()
	local showIndex = acYijizaitanVoApi:getShowCityID()
	for k,v in pairs(self.citySp) do
		if k == showIndex then
			tolua.cast(v.lockPointSp,"CCNode"):setVisible(false)
			tolua.cast(v.arrow,"CCNode"):setVisible(true)
		else
			tolua.cast(v.lockPointSp,"CCNode"):setVisible(true)
			tolua.cast(v.arrow,"CCNode"):setVisible(false)
		end
	end
end
function acYijizaitanTab1:eventHandler1(handler,fn,idx,cel)
	if fn=="numberOfCellsInTableView" then
		if SizeOfTable(self.rewardList) >=10 then
			return 10
		else
			return SizeOfTable(self.rewardList)
		end
	elseif fn=="tableCellSizeForIndex" then
		local tmpSize
		tmpSize=CCSizeMake(105,105)
		return  tmpSize
	elseif fn=="tableCellAtIndex" then
		local cell=CCTableViewCell:new()
		cell:autorelease()
		local index = SizeOfTable(self.rewardList)-idx
	    local rewardCfg = self.rewardList[index]
	    local ptype = rewardCfg[1]
	    local pID = rewardCfg[2]
	    local num = rewardCfg[3]
	    local award = {}
	    local name,pic,desc,id,index,eType,equipId=getItem(pID,ptype)
	    award={name=name,num=num,pic=pic,desc=desc,id=id,type=ptype,index=index,key=pID,eType=eType,equipId=equipId}
	    if award then
           local icon,iconScale = G_getItemIcon(award,100,true,self.layerNum,nil,self.tv1)
            icon:setTouchPriority(-(self.layerNum-1)*20-5)
            icon:setAnchorPoint(ccp(0,0.5))
            icon:setPosition(10,50)
            cell:addChild(icon)

            local num = GetTTFLabel("x"..award.num,25/iconScale)
            num:setAnchorPoint(ccp(1,0))
            num:setPosition(icon:getContentSize().width-10,10)
            icon:addChild(num)
	    end
    
		
		return cell
	elseif fn=="ccTouchBegan" then
		self.isMoved=false
		return true
	elseif fn=="ccTouchMoved" then
		self.isMoved=true
	elseif fn=="ccTouchEnded"  then

	end
end

function acYijizaitanTab1:eventHandler2(handler,fn,idx,cel)
  if fn=="numberOfCellsInTableView" then
    return 1
  elseif fn=="tableCellSizeForIndex" then
    local tmpSize
    tmpSize=CCSizeMake(580,360)
    return  tmpSize
  elseif fn=="tableCellAtIndex" then
    local cell=CCTableViewCell:new()
    cell:autorelease()
   

    local mapSp = CCSprite:create("story/CheckpointBg.jpg")
    mapSp:setScaleX((self.bgLayer:getContentSize().width-60)/mapSp:getContentSize().width)
    mapSp:setScaleY(360/mapSp:getContentSize().height)
    mapSp:setAnchorPoint(ccp(0,0))
    mapSp:setPosition(0,0)
    mapSp:setOpacity(120)
    cell:addChild(mapSp)

    if not (G_isIphone5())then
      local function touchInfoItem(idx)
        if G_checkClickEnable()==false then
            do
                return
            end
        else
            base.setWaitTime=G_getCurDeviceMillTime()
        end
        PlayEffect(audioCfg.mouseClick)
       
        local td=acYijizaitanLogSmallDialog:new()
        local rewardList=acYijizaitanVoApi:getRewardList() or {}
        local title=getlocal("activity_feixutansuo_rewardTitle")
        local desStr = getlocal("activity_yijizaitan_desTip")
        local nojilu = getlocal("activity_feixutansuo_noReward")
        local dialog=td:init("PanelPopup.png",CCSizeMake(500,600),nil,false,false,self.layerNum+1,rewardList,title,desStr,nojilu)
        sceneGame:addChild(dialog,self.layerNum+1)
      end
      local infoItem = GetButtonItem("SlotInfor.png","SlotInfor.png","SlotInfor.png",touchInfoItem,11,nil,nil)
      local infoMenu=CCMenu:createWithItem(infoItem)
      infoMenu:setPosition(ccp(540,320))
      infoMenu:setTouchPriority(-(self.layerNum-1)*20-4)
      cell:addChild(infoMenu)
    end



   


    local addSp = CCSprite:createWithSpriteFrameName("t10114Anim_1.png")
    addSp:setPosition(ccp(200,200))
    cell:addChild(addSp,9)
    self.addSp=addSp
    addSp:setVisible(false)

    self.posTb1={{82, 233.5},{82, 218.5},{82, 203.5},{82, 188.5},{82, 176.5},{89, 165.5},{102, 158.5},{116, 154.5},{131, 150.5},{147, 146.5},{163, 143.5}}
    self.posTb2={{246, 143.5},{259, 154.5},{272, 165.5},{284, 175.5},{296, 185.5},{306, 196.5},{316, 208.5},{328, 219.5},{338, 229.5}}
    self.posTb3={{427, 271.5},{444, 271.5},{464, 271.5},{484, 271.5},{502, 268.5},{514, 260.5},{514, 248.5},{509, 236.5},{504, 225.5},{498, 214.5},{492, 203.5},{486, 192.5},{479, 181.5},{472, 170.5}}

    for k,v in pairs(self.posTb1) do
      local posSp = CCSprite:createWithSpriteFrameName("acYijizaitan_dian.png")
      posSp:setPosition(v[1], v[2])
      cell:addChild(posSp)
    end
    for k,v in pairs(self.posTb2) do
      local posSp = CCSprite:createWithSpriteFrameName("acYijizaitan_dian.png")
      posSp:setPosition(v[1], v[2])
      cell:addChild(posSp)
    end
    for k,v in pairs(self.posTb3) do
      local posSp = CCSprite:createWithSpriteFrameName("acYijizaitan_dian.png")
      posSp:setPosition(v[1], v[2])
      cell:addChild(posSp)
     
    end

    self.yingPos={{95,295},{209,200},{390,290},{480,150}}

      for i=1,4 do
       local cityIconStr=""
       local posX --= 120+(i-1)*250
       local posY --= mapSp:getContentSize().height/2-((i-1)%2）*(mapSp:getContentSize().height-140)-20

       local arrowPos
       local aimPos
       local arrow=CCSprite:createWithSpriteFrameName("GuideArow.png")
        arrow:setAnchorPoint(ccp(0.5,0.5))
        cell:addChild(arrow)
        arrow:setScale(0.5)

        

       if i == 1 then
         cityIconStr="serverWarLocalCity3.png"
         posX=95
         posY=270
         arrowPos=ccp(posX,posY+60)
         aimPos=ccp(posX,posY+50)
         arrow:setPosition(arrowPos)
       elseif i==2 then
         cityIconStr="serverWarLocalCity7.png"
         posX=206
         posY=173
         arrow:setRotation(180)
         arrowPos=ccp(posX,posY-80)
         aimPos=ccp(posX,posY-70)
         arrow:setPosition(arrowPos)
       elseif i==3 then
         cityIconStr="serverWarLocalCity9.png"
         posX=390
         posY=260
         arrow:setRotation(0)
         arrowPos=ccp(posX,posY+70)
         aimPos=ccp(posX,posY+60)
         arrow:setPosition(arrowPos)
       elseif i== 4 then
         cityIconStr="serverWarLocalCity1.png"
         posX=480
         posY=120
         arrow:setRotation(180)
         arrowPos=ccp(posX,posY-80)
         aimPos=ccp(posX,posY-70)
         arrow:setPosition(arrowPos)
       end

            local function showArrowAction()
                local mvTo=CCMoveTo:create(0.35,aimPos)
                local mvBack=CCMoveTo:create(0.35,arrowPos)
                local seq=CCSequence:createWithTwoActions(mvTo,mvBack)
                arrow:runAction(CCRepeatForever:create(seq))
            end
            local fadeIn=CCFadeIn:create(0.3)
            --arrow:setOpacity(0)
            local ffunc=CCCallFuncN:create(showArrowAction)
            local fseq=CCSequence:createWithTwoActions(fadeIn,ffunc)
            arrow:runAction(fseq)

            local function clickHandler( ... )
             local rewardCfg = acYijizaitanVoApi:getRewardByID(i)
             -- local content = FormatItem(rewardCfg)
             local td = acFeixutansuoRewardTip:new()
             local titleStr=getlocal("activity_feixutansuo_tipTitle" .. i)

             td:init("PanelHeaderPopup.png",titleStr,getlocal("activity_feixutansuo_rewardDesc"),rewardCfg,nil,self.layerNum+1)
            end

            local checkPointSp=LuaCCSprite:createWithSpriteFrameName(cityIconStr,clickHandler)
            checkPointSp:setPosition(ccp(posX,posY))
            checkPointSp:setAnchorPoint(ccp(0.5,0.5))
            checkPointSp:setTouchPriority(-(self.layerNum-1)*20-5)
            checkPointSp:setIsSallow(true)
            cell:addChild(checkPointSp)
            checkPointSp:setScale(0.8)

            local lockPointSp=GraySprite:createWithSpriteFrameName(cityIconStr)
            lockPointSp:setAnchorPoint(ccp(0.5,0.5))
            lockPointSp:setPosition(ccp(posX,posY))
            cell:addChild(lockPointSp)
            lockPointSp:setScale(0.8)

            self.citySp[i]={}
            self.citySp[i].checkPointSp = checkPointSp
            self.citySp[i].lockPointSp = lockPointSp
            self.citySp[i].arrow = arrow
      end


     

    local dingSp = CCSprite:createWithSpriteFrameName("acYijizaitan_dingwei.png")
    cell:addChild(dingSp)
    self.dingSp=dingSp
    dingSp:setAnchorPoint(ccp(0.5,0))
    dingSp:setVisible(false)

      self:updateShowMap()



    return cell
  elseif fn=="ccTouchBegan" then
    self.isMoved=false
    return true
  elseif fn=="ccTouchMoved" then
    self.isMoved=true
  elseif fn=="ccTouchEnded"  then

  end
end

function acYijizaitanTab1:tick()
	local today=acYijizaitanVoApi:isToday()
	if self.isToday~=today then
		acYijizaitanVoApi:updateVipHadTansuoNum()
		self:updateVipNUm()
		self:updateShowBtn()
		self.isToday=today
	end
  self:updateAcTime()
end

function acYijizaitanTab1:fastTick()
    if self.state == 3 then
      self.touchDialogBg:setIsSallow(false) 
        self:stopPlayAnimation()
    end
end

function acYijizaitanTab1:updateAcTime()
  local acVo=acYijizaitanVoApi:getAcVo()
  if acVo and self.timeLb then
    G_updateActiveTime(acVo,self.timeLb)
  end
end

function acYijizaitanTab1:stopPlayAnimation()

  local showIndex = acYijizaitanVoApi:getShowCityID()
  local function callback()
    self.state = 0
    self.touchDialogBg:setIsSallow(false) 
    self.dingSp:stopAllActions()
    self.dingSp:setVisible(false)

    self.addSp:stopAllActions()
    self.addSp:setVisible(false)
  end
  if showIndex==1 then
    callback()
  else
    local acArr=CCArray:create()

    local function setPostion()
      local posTb = self["posTb" .. showIndex-1]
      local num=SizeOfTable(posTb)
      self.dingSp:setPosition(posTb[num][1],posTb[num][2])
    end
    local delay=CCDelayTime:create(0.2)
    local callFunc=CCCallFunc:create(setPostion)
    local callFunc1=CCCallFunc:create(callback)

    acArr:addObject(callFunc)
    acArr:addObject(delay)
    acArr:addObject(callFunc1)
    local seq=CCSequence:create(acArr)
    self.dingSp:runAction(seq)
  end
  
end
function acYijizaitanTab1:startPalyAnimation()
    self.state = 2
    self:runaction()
end

function acYijizaitanTab1:runaction()
    self.addSp:setVisible(true) 
    local showIndex = acYijizaitanVoApi:getShowCityID()
    self.addSp:setPosition(self.yingPos[self.oldShowIndex][1], self.yingPos[self.oldShowIndex][2])

    local pzArr=CCArray:create()
    local starK
    local endK
    local everyK
    if showIndex==1 then
      starK=16
      endK=1
      everyK=-1
    else
      starK=1
      endK=16
      everyK=1
    end
    if showIndex and self.oldShowIndex~=4 then
      for kk=starK,endK,everyK do
          local nameStr="t10114Anim_"..kk..".png"
          local frame = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(nameStr)
          --  if showIndex==1 then
          --   print("++++++++")
          --   -- t10124Anim.png
          --   -- local graySp=GraySprite:createWithSpriteFrameName(nameStr)
          --   -- frame=graySp:displayFrame()
          --   frame=CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("t10124Anim.png")
          -- end
          pzArr:addObject(frame)

      end
      local animation=CCAnimation:createWithSpriteFrames(pzArr)
      animation:setDelayPerUnit(0.1)
      local animate=CCAnimate:create(animation)
      local function callBack()
        self.addSp:stopAllActions()
        self.addSp:setVisible(false)
        if showIndex==1 then
          self.touchDialogBg:setIsSallow(false)
        end
      end
      local callFunc=CCCallFunc:create(callBack)
      local seq=CCSequence:createWithTwoActions(animate,callFunc)
      self.addSp:runAction(seq)
    end

    if self.oldShowIndex==4 then
      self.touchDialogBg:setIsSallow(false)
    end


    if showIndex==1 then
    else
      local posTb = self["posTb" .. showIndex-1]
      self.dingSp:setPosition(posTb[1][1],posTb[1][2])
      self.dingSp:setVisible(true)

      local acArr=CCArray:create()
      for k,v in pairs(posTb) do
        local function setPostion()
            self.dingSp:setPosition(v[1],v[2])
        end
        local delay=CCDelayTime:create(0.2)
        local callFunc=CCCallFunc:create(setPostion)
        acArr:addObject(callFunc)
        acArr:addObject(delay)
      end
      local function stopAction()
        local num=SizeOfTable(posTb)
        self.dingSp:setPosition(posTb[num][1],posTb[num][2])
        self:stopPlayAnimation()
      end
      local callFunc=CCCallFunc:create(stopAction)
      acArr:addObject(callFunc)
      local seq=CCSequence:create(acArr)
      self.dingSp:runAction(seq)

    end

    
end

function acYijizaitanTab1:showBattle()
  local battleStr=acYijizaitanVoApi:returnTankData()
  local report=G_Json.decode(battleStr)
  local isAttacker=true
  local data={data={report=report},isAttacker=isAttacker,isReport=true}
  battleScene:initData(data)
end
function acYijizaitanTab1:dispose()
  self.timeLb=nil
	self.tv1 = nil
  self.oldShowIndex = nil
  spriteController:removePlist("serverWar/serverWar.plist")
  spriteController:removeTexture("serverWar/serverWar.pvr.ccz")
  CCSpriteFrameCache:sharedSpriteFrameCache():removeSpriteFramesFromFile("public/serverWarLocal/serverWarLocalCity.plist")
  CCSpriteFrameCache:sharedSpriteFrameCache():removeSpriteFramesFromFile("public/acYijizaitan.plist")
end