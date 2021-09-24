acYijizaitanNewSmallDialog=smallDialog:new()

function acYijizaitanNewSmallDialog:new()
    local nc={}
    setmetatable(nc,self)
    self.__index=self


    self.parent=nil
    self.data=nil
    self.type=0       --是配件还是碎片
    self.selectedTabIndex=1  --当前选中的tab
    self.oldSelectedTabIndex=1 --上一次选中的tab
    self.isUseAmi =nil
    self.rewardList ={}
    self.layerNum =nil
    self.mustRewards ={}
    return nc
end

-- rewardList  列表信息
function acYijizaitanNewSmallDialog:init(bgSrc,size,tmpFunc,istouch,isuseami,layerNum,reward,mustReward,title,tabStr1,tabStr2,whiIdx)
    
    -- self.isTouch=istouch
    self.isUseAmi=isuseami
    self.rewardList1=reward
    self.layerNum=layerNum
    self.mustReward = mustReward

    local function tmpFunc()

    end
    local dialogBg = LuaCCScale9Sprite:createWithSpriteFrameName("TankInforPanel.png",CCRect(130, 50, 1, 1),tmpFunc)
    self.dialogLayer=CCLayer:create()
    self.bgLayer=dialogBg
    self.bgSize=size
    self.bgLayer:setContentSize(size)

    local downBgSp = CCSprite:createWithSpriteFrameName("expedition_down.png")
    downBgSp:setAnchorPoint(ccp(0.5,0))
    downBgSp:setScaleX(self.bgLayer:getContentSize().width/downBgSp:getContentSize().width)
    downBgSp:setPosition(ccp(self.bgLayer:getContentSize().width/2,7))
    self.bgLayer:addChild(downBgSp,6)




    local function close()
        if G_checkClickEnable()==false then
          do
              return
          end
      else
          base.setWaitTime=G_getCurDeviceMillTime()
      end 
        PlayEffect(audioCfg.mouseClick)
        return self:close()
    end
    local closeBtnItem = GetButtonItem("closeBtn.png","closeBtn_Down.png","closeBtn.png",close,nil,nil,nil);
    closeBtnItem:setPosition(ccp(0,0))
    closeBtnItem:setScale(0.9)
    closeBtnItem:setAnchorPoint(CCPointMake(0,0))
    
    self.closeBtn = CCMenu:createWithItem(closeBtnItem)
    self.closeBtn:setTouchPriority(-(self.layerNum-1)*20-6)
    self.closeBtn:setPosition(ccp(self.bgSize.width-closeBtnItem:getContentSize().width,self.bgSize.height-closeBtnItem:getContentSize().height))
    self.bgLayer:addChild(self.closeBtn,2)

    local titleLb=GetTTFLabelWrap(title,30,CCSizeMake(240,0),kCCTextAlignmentCenter,kCCVerticalTextAlignmentCenter)
    titleLb:setAnchorPoint(ccp(0.5,0.5))
    titleLb:setPosition(ccp(self.bgSize.width/2,self.bgSize.height-titleLb:getContentSize().height/2-35))
    dialogBg:addChild(titleLb,1)
    titleLb:setColor(G_ColorYellowPro)

    local needHeight = self.bgSize.height-titleLb:getContentSize().height/2
    local rect = CCRect(0, 0, 50, 50)
    local capInSet = CCRect(20, 20, 10, 10)
    local function cellClick(hd,fn,idx)
    end
    local bgSp1=LuaCCScale9Sprite:createWithSpriteFrameName("TaskHeaderBg.png",capInSet,cellClick)
    -- bgSp:setAnchorPoint(ccp(0,0.5))
    bgSp1:setContentSize(CCSizeMake(self.bgLayer:getContentSize().width-20,40))
    bgSp1:setPosition(ccp(self.bgSize.width/2,needHeight-85));
    dialogBg:addChild(bgSp1)

    local des1 = GetTTFLabelWrap(tabStr1,25,CCSizeMake(dialogBg:getContentSize().width-40,0),kCCTextAlignmentCenter,kCCVerticalTextAlignmentCenter)
    des1:setAnchorPoint(ccp(0.5,0.5))
    des1:setPosition(getCenterPoint(bgSp1))
    des1:setColor(G_ColorYellowPro)
    bgSp1:addChild(des1,2)


    --mustReward
    if mustReward and SizeOfTable(mustReward)>0 then
        local icon,iconScale = G_getItemIcon(mustReward,90,true,self.layerNum,nil,nil)
        icon:setTouchPriority(-(self.layerNum-1)*20-2)
        icon:setAnchorPoint(ccp(0,1))
        icon:setPosition(ccp(20,needHeight-113))
        dialogBg:addChild(icon)
        local needIconPosH = icon:getPositionY()-40
        local scaleNum = 1.4
        if whiIdx ==2 then
            scaleNum =2.0
        end
        G_addRectFlicker(icon,scaleNum,scaleNum)

        local name = GetTTFLabelWrap(mustReward.name,25,CCSizeMake(165,0),kCCTextAlignmentLeft,kCCVerticalTextAlignmentBottom)
        name:setAnchorPoint(ccp(0,0))
        local nomePos =20
        name:setPosition(nomePos+icon:getContentSize().width*iconScale+5,needIconPosH+10)
        dialogBg:addChild(name)

        local numLb = GetTTFLabel("x"..mustReward.num,25)
        numLb:setAnchorPoint(ccp(0,1))
        numLb:setPosition(nomePos+icon:getContentSize().width*iconScale+5,needIconPosH-10)
        dialogBg:addChild(numLb)
    else
        print(" mustReward is none!!!!!!!")
    end


    local bgSp2=LuaCCScale9Sprite:createWithSpriteFrameName("TaskHeaderBg.png",capInSet,cellClick)
    -- bgSp:setAnchorPoint(ccp(0,0.5))
    bgSp2:setContentSize(CCSizeMake(self.bgLayer:getContentSize().width-20, 40))
    bgSp2:setPosition(ccp(self.bgSize.width/2,needHeight-230));
    dialogBg:addChild(bgSp2)

    local des2 = GetTTFLabelWrap(tabStr2,25,CCSizeMake(dialogBg:getContentSize().width-40,0),kCCTextAlignmentCenter,kCCVerticalTextAlignmentCenter)
    des2:setAnchorPoint(ccp(0.5,0.5))
    des2:setColor(G_ColorYellowPro)
    des2:setPosition(bgSp2:getContentSize().width*0.5,bgSp2:getContentSize().height*0.5)
    bgSp2:addChild(des2,2)

    local function callBack(...)
        return self:eventHandler1(...)
    end
    local hd1= LuaEventHandler:createHandler(callBack)
    self.tv1=LuaCCTableView:createWithEventHandler(hd1,CCSizeMake(self.bgLayer:getContentSize().width-20,self.bgLayer:getContentSize().height-300),nil)
    self.tv1:setPosition(ccp(10,30))

    self.tv1:setMaxDisToBottomOrTop(80)
    self.tv1:setTableViewTouchPriority(-(layerNum-1)*20-3)
    self.bgLayer:addChild(self.tv1,1)


    local function forbidClick()
    end
    local rect2 = CCRect(0, 0, 50, 50);
    local capInSet = CCRect(20, 20, 10, 10);
    self.topforbidSp=LuaCCScale9Sprite:createWithSpriteFrameName("panelItemBg.png",capInSet,forbidClick)
    self.topforbidSp:setTouchPriority(-(layerNum-1)*20-3)
    self.topforbidSp:setAnchorPoint(ccp(0,0))
    self.topforbidSp:setContentSize(CCSize(self.bgSize.width, (G_VisibleSize.height-self.bgSize.height)/2+140))
    self.topforbidSp:setPosition(0,self.bgLayer:getContentSize().height-145)


    self.bottomforbidSp=LuaCCScale9Sprite:createWithSpriteFrameName("panelItemBg.png",capInSet,forbidClick)
    self.bottomforbidSp:setTouchPriority(-(layerNum-1)*20-3)
    self.bottomforbidSp:setContentSize(CCSize(self.bgSize.width,30))
    self.bottomforbidSp:setAnchorPoint(ccp(0,0))
    self.bottomforbidSp:setPosition(0,0)
    dialogBg:addChild(self.topforbidSp)
    dialogBg:addChild(self.bottomforbidSp)
    self.bottomforbidSp:setVisible(false)
    self.topforbidSp:setVisible(false)

    self:show()

    
    local function touchDialog()
        if self.isTouch~=nil then
            PlayEffect(audioCfg.mouseClick)
            self:close()
        end
      
    end
    local touchDialogBg = LuaCCScale9Sprite:createWithSpriteFrameName("BlackAlphaBg.png",CCRect(10, 10, 1, 1),touchDialog);
    touchDialogBg:setTouchPriority(-(layerNum-1)*20-2)
    local rect=CCSizeMake(640,G_VisibleSizeHeight)
    touchDialogBg:setContentSize(rect)
    touchDialogBg:setOpacity(180)
    touchDialogBg:setPosition(getCenterPoint(self.dialogLayer))
    self.dialogLayer:addChild(touchDialogBg,1);

    self.bgLayer:setPosition(getCenterPoint(self.dialogLayer))
    self.dialogLayer:addChild(self.bgLayer,2);
    self.dialogLayer:setPosition(ccp(0,0))
    self.dialogLayer:setTouchPriority(-(layerNum-1)*20-1)
    self:userHandler()
    return self.dialogLayer
    
end

function acYijizaitanNewSmallDialog:eventHandler1(handler,fn,idx,cel)
    if fn=="numberOfCellsInTableView" then
        return math.ceil(SizeOfTable(self.rewardList1)/2)
    elseif fn=="tableCellSizeForIndex" then
        local tmpSize
        self.cellHight = 100
        tmpSize = CCSizeMake(self.bgLayer:getContentSize().width - 20,self.cellHight)
        return  tmpSize
    elseif fn=="tableCellAtIndex" then
        local cell=CCTableViewCell:new()
        cell:autorelease()

        for i=1,2 do
            local numIndex = idx*2+i
            if self.rewardList1[numIndex] then
                local addH = (i-1)*265
               local icon,iconScale = G_getItemIcon(self.rewardList1[numIndex],90,true,self.layerNum,nil,self.tv1)
                icon:setTouchPriority(-(self.layerNum-1)*20-2)
                icon:setAnchorPoint(ccp(0,0.5))
                icon:setPosition(10+addH,self.cellHight/2)
                cell:addChild(icon)

                local name = GetTTFLabelWrap(self.rewardList1[numIndex].name,25,CCSizeMake(165,0),kCCTextAlignmentLeft,kCCVerticalTextAlignmentBottom)
                name:setAnchorPoint(ccp(0,0))
                local nomePos =20
                name:setPosition(nomePos+icon:getContentSize().width*iconScale+addH,self.cellHight/2+10)
                cell:addChild(name)

                local numLb = GetTTFLabel("x"..self.rewardList1[numIndex].num,25)
                numLb:setAnchorPoint(ccp(0,1))
                numLb:setPosition(nomePos+icon:getContentSize().width*iconScale+addH,self.cellHight/2-10)
                cell:addChild(numLb)
            end
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

function acYijizaitanNewSmallDialog:dispose()
    self.rewardList=nil
    self.selectedTabIndex=nil
    self.oldSelectedTabIndex=nil
    self.isUseAmi =nil
    self.rewardList =nil
    self.layerNum =nil
    self.mustRewards =nil
end