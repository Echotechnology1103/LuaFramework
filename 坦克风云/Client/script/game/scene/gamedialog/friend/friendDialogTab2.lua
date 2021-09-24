friendDialogTab2={}

function friendDialogTab2:new()
    local nc={}
    setmetatable(nc,self)
    self.__index=self
	
	self.normalHeight=140
	self.nofriendLabel=nil
	
    self.tv=nil
    self.bgLayer=nil
    self.layerNum=nil
	self.friendDialog=nil
    self.friendList=nil
    self.page = 0

    self.pageCellNum=20

    self.cellBackSprites={}--将每个cell的backsprite都存起来，用于异步加载图片回调的时候比较是否还是当前的backsprite
	
    return nc
end

function friendDialogTab2:init(layerNum,friendDialog)
    self.friendDialog=friendDialog
    self.bgLayer=CCLayer:create()
    self.layerNum=layerNum

    --从平台和后台获取好友信息
    local function onRefreshFriend()
        base:cancleWait()
        base:cancleNetWait()
        self.friendList=friendVoApi:getAllFriends()
        local function sortFunc(a,b)
           if(a[keyName]==b[keyName])then
                if(keyName=="lv")then
                    return a.power>b.power
                elseif(keyName=="power")then
                    if(a.lv==b.lv)then
                        return a.star>b.star
                    else
                        return a.lv>b.lv
                    end
                else
                    if(a.lv==b.lv)then
                        return a.power>b.power
                    else
                        return a.lv>b.lv
                    end
                end
            else
                return a[keyName]>b[keyName]
            end
        end
        table.sort(self.friendList,sortFunc)
        self:initTableView()
    end
    base:setWait()
    base:setNetWait()
    friendVoApi:refreshFriend(onRefreshFriend)
    return self.bgLayer
end

--设置对话框里的tableView
function friendDialogTab2:initTableView()
    if(friendVoApi:checkIfSimpleFriend())then
        self.tvHeight=self.bgLayer:getContentSize().height-385
    else
    	self.tvHeight=self.bgLayer:getContentSize().height-330
    end
    local function callBack(...)
    	return self:eventHandler(...)
    end
    local hd= LuaEventHandler:createHandler(callBack)
 	self.tv=LuaCCTableView:createWithEventHandler(hd,CCSizeMake(self.bgLayer:getContentSize().width-50,self.tvHeight),nil)
    self.tv:setTableViewTouchPriority(-(self.layerNum-1)*20-2)
    if(friendVoApi:checkIfSimpleFriend())then
        self.tv:setPosition(ccp(30,180))
    else
        self.tv:setPosition(ccp(30,120))
    end
    self.bgLayer:addChild(self.tv,1)
    self.tv:setMaxDisToBottomOrTop(self.normalHeight)

    --标签: 没有好友,在好友列表为空的时候显示
    self.noFriendLabel=GetTTFLabel(getlocal("nofriends"),30)
    self.noFriendLabel:setPosition(getCenterPoint(self.tv))
    self.noFriendLabel:setColor(G_ColorGray)
    self.tv:addChild(self.noFriendLabel,2)
    if(friendVoApi:getFriendNum()==0)then
        self.noFriendLabel:setVisible(true)
    else
        self.noFriendLabel:setVisible(false)
    end
    if(friendVoApi:getFriendNum()>self.pageCellNum)then
        self.friendDialog.pageDownBtn:setEnabled(true)
    end
end

--这里是tableView的详细逻辑 handler:方法索引  fn:方法名 idx:cell索引 cel:cell
function friendDialogTab2:eventHandler(handler,fn,idx,cel)
	if fn=="numberOfCellsInTableView" then
		local num=friendVoApi:getFriendNum()
        if(num > self.pageCellNum)then
            --如果不是最后一页，每页显示20个
            if(self.page~=math.ceil(friendVoApi:getFriendNum()/self.pageCellNum)-1)then
                return self.pageCellNum
            else
                --如果是最后一页而且最后一页正好有20个，显示20个
                if(friendVoApi:getFriendNum()%self.pageCellNum==0)then
                    return self.pageCellNum
                --否则就显示总数与20的余数
                else
                    return friendVoApi:getFriendNum()%self.pageCellNum
                end
            end
        else
        	return num
        end
	elseif fn=="tableCellSizeForIndex" then
		local tmpSize
		tmpSize=CCSizeMake(400,self.normalHeight)
		return  tmpSize
	elseif fn=="tableCellAtIndex" then
    	local cell=CCTableViewCell:new()
    	cell:autorelease()
        local capInSet = CCRect(20, 20, 10, 10);
        local function cellClick(hd,fn,idx)
        end
        local backSprie
        local rank=self.page*self.pageCellNum+idx+1
        if(rank>3)then
            backSprie =LuaCCScale9Sprite:createWithSpriteFrameName("panelItemBg.png",capInSet,cellClick)
        else
            backSprie =LuaCCScale9Sprite:createWithSpriteFrameName("rank"..rank.."ItemBg.png",capInSet,cellClick)
        end
        backSprie:setContentSize(CCSizeMake(self.bgLayer:getContentSize().width-60, self.normalHeight))
        backSprie:ignoreAnchorPointForPosition(false);
        backSprie:setAnchorPoint(ccp(0,0));
        backSprie:setPosition(ccp(0,0))
        backSprie:setTag(1000+idx)
        backSprie:setIsSallow(false)
        backSprie:setTouchPriority(-(self.layerNum-1)*20-2)
        cell:addChild(backSprie,1)
        self.cellBackSprites[idx+1]=backSprie
    	local friendVoData = self.friendList[self.page*self.pageCellNum+idx+1]
        local function onLoadIcon(fn,icon)
       		icon:setAnchorPoint(ccp(0,0.5))
    		icon:setPosition(ccp(60,self.normalHeight/2))
            icon:setScaleX(85/icon:getContentSize().width)
            icon:setScaleY(85/icon:getContentSize().height)
            if(backSprie == self.cellBackSprites[idx+1])then
            	backSprie:addChild(icon,2)
            end
        end
        if(friendVoData.picture~=nil and friendVoData.picture~="")then
            if(friendVoData.picture~="public/defaultFBIcon.jpg")then
                LuaCCWebImage:createWithURL(friendVoData.picture,onLoadIcon);
            else
                local icon=CCSprite:create(friendVoData.picture)
                icon:setAnchorPoint(ccp(0,0.5))
                icon:setPosition(ccp(60,self.normalHeight/2))
                icon:setScaleX(85/icon:getContentSize().width)
                icon:setScaleY(85/icon:getContentSize().height)
                backSprie:addChild(icon,2)
            end
        end

        local rankSign
        if(rank>3)then
            rankSign=GetTTFLabel(rank,23)
            rankSign:setAnchorPoint(ccp(0.5,0.5))
            rankSign:setPosition(ccp(rankSign:getContentSize().width/2,rankSign:getContentSize().height/2))
        else
            rankSign=CCSprite:createWithSpriteFrameName("top"..rank..".png")
            rankSign:setScale(0.7)
            local iconHalo=CCSprite:createWithSpriteFrameName("arrange"..rank..".png")
            iconHalo:setAnchorPoint(ccp(0,0.5))
            iconHalo:setPosition(ccp(54,self.normalHeight/2))
            backSprie:addChild(iconHalo,3)
        end
        rankSign:setAnchorPoint(ccp(0.5,0.5))
        rankSign:setPosition(ccp(30,self.normalHeight/2))
        backSprie:addChild(rankSign,2)

        local pNameLabel=GetTTFLabelWrap(friendVoData.pname,23,CCSizeMake(150,50),kCCTextAlignmentLeft,kCCVerticalTextAlignmentBottom)
        pNameLabel:setAnchorPoint(ccp(0,0));
        pNameLabel:setPosition(ccp(160,self.normalHeight/2+13));
        backSprie:addChild(pNameLabel,2);

    	local userNameLabel = GetTTFLabel(friendVoData.username,23)
        userNameLabel:setAnchorPoint(ccp(0,0.5));
        userNameLabel:setPosition(ccp(160,self.normalHeight/2));
        backSprie:addChild(userNameLabel,2);

    	local userDataStr
        if(self.friendDialog.selectedSubTabIndex==12)then
            userDataStr=getlocal("RankScene_star_num")..": "..friendVoData.star
        elseif(self.friendDialog.selectedSubTabIndex==11)then
            userDataStr=getlocal("showAttackRank")..": "..FormatNumber(friendVoData.power)
        else
            userDataStr=getlocal("alliance_info_level").." "..friendVoData.lv
        end
        local userDataLabel=GetTTFLabelWrap(userDataStr,23,CCSizeMake(150,50),kCCTextAlignmentLeft,kCCVerticalTextAlignmentTop)
        userDataLabel:setAnchorPoint(ccp(0,1));
        userDataLabel:setPosition(ccp(160,self.normalHeight/2-13));
        backSprie:addChild(userDataLabel,2);

        local function onClickRequestBtn(tag,object)
            local result=friendVoApi:sendRequest(friendVoData)
            if(result==2)then
                object:setEnabled(false)
                smallDialog:showSure("PanelHeaderPopup.png",CCSizeMake(550,400),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),getlocal("dialog_title_prompt"),getlocal("friend_ask_error"),nil,self.layerNum + 1)
            elseif(result==1)then
                smallDialog:showTipsDialog("PanelPopup.png",CCSizeMake(500,400),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),getlocal("friend_ask_success"),28)
                object:setEnabled(false)
            end
        end
        local requestGiftBtn = GetButtonItem("AskBtn.png","AskBtn_Down.png","AskBtn_Down.png",onClickRequestBtn,nil,nil,0)
        if(friendVoApi:checkCanRequest(friendVoData.uid)==false)then
            requestGiftBtn:setEnabled(false)
        end
        requestGiftBtn:setAnchorPoint(ccp(0,0.5))
        local requestGiftMenu=CCMenu:createWithItem(requestGiftBtn)
        requestGiftMenu:setAnchorPoint(ccp(0,0.5))
        requestGiftMenu:setPosition(ccp(backSprie:getContentSize().width-15-requestGiftBtn:getContentSize().width,self.normalHeight/2))
        requestGiftMenu:setTouchPriority(-42)
        backSprie:addChild(requestGiftMenu,2)

	    local function onClickSendBtn(tag,object)
            local result=friendVoApi:sendGift(friendVoData)
            if(result==2)then
                object:setEnabled(false)
                smallDialog:showSure("PanelHeaderPopup.png",CCSizeMake(550,400),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),getlocal("dialog_title_prompt"),getlocal("friend_send_error"),nil,self.layerNum + 1)
            elseif(result==1)then
                smallDialog:showTipsDialog("PanelPopup.png",CCSizeMake(500,400),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),getlocal("friend_send_success"),28)
                object:setEnabled(false)
            end
        end
        local sendGiftBtn = GetButtonItem("GivingBtn.png","GivingBtn_Down.png","GivingBtn_Down.png",onClickSendBtn,nil,nil,0)
        if(friendVoApi:checkCanSend(friendVoData.uid)==false)then
            sendGiftBtn:setEnabled(false)
        end
        sendGiftBtn:setAnchorPoint(ccp(0,0.5))
        local sendGiftMenu=CCMenu:createWithItem(sendGiftBtn)
        sendGiftMenu:setAnchorPoint(ccp(0,0.5))
        sendGiftMenu:setPosition(ccp(backSprie:getContentSize().width-30-requestGiftBtn:getContentSize().width-sendGiftBtn:getContentSize().width,self.normalHeight/2))
        sendGiftMenu:setTouchPriority(-42)
        backSprie:addChild(sendGiftMenu,2)
    	return cell
	elseif fn=="ccTouchBegan" then
		self.isMoved=false
		return true
	elseif fn=="ccTouchMoved" then
		self.isMoved=true
	elseif fn=="ccTouchEnded"  then

	end
end

function friendDialogTab2:sort()
    if(self.friendList==nil)then
        return
    end
    local keyName;
    if(self.friendDialog.selectedSubTabIndex==12)then
        keyName="star"
    elseif(self.friendDialog.selectedSubTabIndex==11)then
        keyName="power"
    else
        keyName="lv"
    end
    local function sortFunc(a,b)
        if(a[keyName]==b[keyName])then
            if(keyName=="lv")then
                return a.power>b.power
            elseif(keyName=="power")then
                if(a.lv==b.lv)then
                    return a.star>b.star
                else
                    return a.lv>b.lv
                end
            else
                if(a.lv==b.lv)then
                    return a.power>b.power
                else
                    return a.lv>b.lv
                end
            end
            return true
        else
            return a[keyName]>b[keyName]
        end
    end
    table.sort(self.friendList,sortFunc)
    self:refresh()
end

function friendDialogTab2:pageChange(p)
    local totalPage = math.ceil(friendVoApi:getFriendNum()/self.pageCellNum)
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
        if(self.page<math.ceil(friendVoApi:getFriendNum()/self.pageCellNum)-1)then
            self.friendDialog.pageDownBtn:setEnabled(true)
        else
            self.friendDialog.pageDownBtn:setEnabled(false)
        end
        self:refresh()
    end
end

function friendDialogTab2:refresh()
    if(self.tv~=nil)then
        self.tv:reloadData()
    end
end

function friendDialogTab2:dispose()
    self.noFriendLabel = nil
    self.tv=nil
    self.bgLayer=nil
    self.layerNum=nil
    self.friendDialog=nil
    self.friendList=nil
    self.page=nil
    self.cellBackSprites=nil
    self=nil
end






