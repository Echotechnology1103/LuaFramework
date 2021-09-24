friendDialogTab1={}

function friendDialogTab1:new()
    local nc={}
    setmetatable(nc,self)
    self.__index=self
	
	self.cellHeight=100
	
    self.tv=nil
    self.bgLayer=nil
    self.layerNum=nil
	self.friendDialog=nil

    self.giftList=nil
    self.page = 0

    self.pageCellNum=30
	
    return nc
end

function friendDialogTab1:init(layerNum,friendDialog)
    self.bgLayer=CCLayer:create()
    self.layerNum=layerNum
    self.friendDialog=friendDialog

    local function onRefreshGift()
        self.giftList=friendVoApi:getAllGifts()
        self:initTableView()
    end
    base:setWait()
    base:setNetWait()
    friendVoApi:refreshGift(onRefreshGift)
    return self.bgLayer
end

--设置对话框里的tableView
function friendDialogTab1:initTableView()
    if(friendVoApi:checkIfSimpleFriend())then
        self.tvHeight=self.bgLayer:getContentSize().height-340
    else
        self.tvHeight=self.bgLayer:getContentSize().height-285
    end
    local function callBack(...)
    	return self:eventHandler(...)
    end
    local hd= LuaEventHandler:createHandler(callBack)
 	self.tv=LuaCCTableView:createWithEventHandler(hd,CCSizeMake(self.bgLayer:getContentSize().width-50,self.tvHeight),nil)
    self.tv:setTableViewTouchPriority(-(self.layerNum-1)*20-3)
    if(friendVoApi:checkIfSimpleFriend())then
        self.tv:setPosition(ccp(30,180))
    else
        self.tv:setPosition(ccp(30,120))
    end
    self.bgLayer:addChild(self.tv,1)
    self.tv:setMaxDisToBottomOrTop(self.cellHeight)

    if(friendVoApi:getGiftNum()>self.pageCellNum)then
        self.friendDialog.pageDownBtn:setEnabled(true)
    else
        self.friendDialog.pageDownBtn:setEnabled(false)
    end
end

--这里是tableView的详细逻辑 handler:方法索引  fn:方法名 idx:cell索引 cel:cell
function friendDialogTab1:eventHandler(handler,fn,idx,cel)
	if fn=="numberOfCellsInTableView" then
		local num=friendVoApi:getGiftNum()
        if(num > self.pageCellNum)then
            if(self.page~=math.ceil(friendVoApi:getGiftNum()/self.pageCellNum)-1)then
                return self.pageCellNum
            else
                return friendVoApi:getGiftNum()%self.pageCellNum
            end
        else
    		return num
        end
	elseif fn=="tableCellSizeForIndex" then
		local tmpSize
		tmpSize=CCSizeMake(400,self.cellHeight)
		return  tmpSize
	elseif fn=="tableCellAtIndex" then
    	local cell=CCTableViewCell:new()
    	cell:autorelease()
        local capInSet = CCRect(20, 20, 10, 10);
        local function cellClick(hd,fn,idx)
        end
        local backSprie =LuaCCScale9Sprite:createWithSpriteFrameName("panelItemBg.png",capInSet,cellClick)
        backSprie:setContentSize(CCSizeMake(self.bgLayer:getContentSize().width-60, self.cellHeight))
        backSprie:ignoreAnchorPointForPosition(false);
        backSprie:setAnchorPoint(ccp(0,0));
        backSprie:setPosition(ccp(0,0))
        backSprie:setTag(1000+idx)
        backSprie:setIsSallow(false)
        backSprie:setTouchPriority(-(self.layerNum-1)*20-2)
        cell:addChild(backSprie,1)
    	local giftVoData = self.giftList[self.page*self.pageCellNum+idx+1]

 	    local function onClickResponse()
            local function onAcceptEnd(retFlag,sData)
                if(retFlag==true)then
                    local award=FormatItem(sData.data.dailyfriend.reward) or {}
                    for k,v in pairs(award) do
                        G_addPlayerAward(v.type,v.key,v.id,v.num)
                    end
                    G_showRewardTip(award)
                    self:refresh()
                end
            end
            if(tonumber(giftVoData.senderid)~=tonumber(playerVoApi:getUid()))then
                if(friendVoApi:checkCanAccept())then
                    friendVoApi:acceptGift(giftVoData,onAcceptEnd)
                else
                    smallDialog:showSure("PanelHeaderPopup.png",CCSizeMake(550,400),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),getlocal("dialog_title_prompt"),getlocal("friend_gift_accept_max"),nil,self.layerNum + 1)
                end
            else
                local result=friendVoApi:acceptRequest(giftVoData)
                if(result==2)then
                    smallDialog:showSure("PanelHeaderPopup.png",CCSizeMake(550,400),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),getlocal("dialog_title_prompt"),getlocal("friend_send_error"),nil,self.layerNum + 1)
                elseif(result==1)then
                    smallDialog:showTipsDialog("PanelPopup.png",CCSizeMake(500,400),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),getlocal("friend_send_success"),28)
                end
                self:refresh()
            end
        end
        local btnStr
        if(giftVoData:checkIfGift())then
            btnStr=getlocal("accpet")
        else
            btnStr=getlocal("confirm")
        end
        local responseItem = GetButtonItem("BtnOkSmall.png","BtnOkSmall_Down.png","BtnOkSmall_Down.png",onClickResponse,nil,btnStr,28)
        responseItem:setAnchorPoint(ccp(0,0.5))
        local responseBtn=CCMenu:createWithItem(responseItem)
        responseBtn:setAnchorPoint(ccp(0,0.5))
        responseBtn:setPosition(backSprie:getContentSize().width-responseItem:getContentSize().width-15,self.cellHeight/2)
        responseBtn:setTouchPriority(-42)
        backSprie:addChild(responseBtn,2)

        local msg
        if(giftVoData:checkIfGift())then
            msg=getlocal("friend_gift_desc_1",{giftVoData.sendername})
        else
            msg=getlocal("friend_gift_desc_2",{giftVoData.receivername})
        end
        local msgLb=GetTTFLabelWrap(msg,26,CCSizeMake(backSprie:getContentSize().width-responseItem:getContentSize().width-60, 0),kCCTextAlignmentLeft,kCCVerticalTextAlignmentCenter)
        msgLb:setAnchorPoint(ccp(0,0.5));
        msgLb:setPosition(ccp(30,self.cellHeight/2));
        backSprie:addChild(msgLb,2);


    	return cell
	elseif fn=="ccTouchBegan" then
		self.isMoved=false
		return true
	elseif fn=="ccTouchMoved" then
		self.isMoved=true
	elseif fn=="ccTouchEnded"  then

	end
end

function friendDialogTab1:pageChange(p)
    local totalPage = math.ceil(friendVoApi:getGiftNum()/self.pageCellNum)
    if(self.page+p<0)then
        return
    elseif(self.page+p>=totalPage and totalPage>0)then
        return
    else
        self.page=self.page+p
        if(self.page>0)then
            self.friendDialog.pageUpBtn:setEnabled(true)
        else
            self.friendDialog.pageUpBtn:setEnabled(false)
        end
        if(self.page<math.ceil(friendVoApi:getGiftNum()/self.pageCellNum)-1)then
            self.friendDialog.pageDownBtn:setEnabled(true)
        else
            if(self.page>math.ceil(friendVoApi:getGiftNum()/self.pageCellNum)-1)then
                self.page=math.ceil(friendVoApi:getGiftNum()/self.pageCellNum)-1
            end
            self.friendDialog.pageDownBtn:setEnabled(false)
        end
        if(self.tv~=nil)then
           self.tv:reloadData()
        end
    end
end

function friendDialogTab1:refresh()
    self:pageChange(0)
end

function friendDialogTab1:dispose()
    self.noFriendLabel = nil
    self.tv=nil
    self.bgLayer=nil
    self.layerNum=nil
    self.selectedTabIndex=0
    self.friendDialog=nil
    self.giftList=nil
    self.page=nil
    self=nil
end






