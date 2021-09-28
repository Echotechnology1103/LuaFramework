-------------------------------------------------------
module(..., package.seeall)

local require = require;

local ui = require("ui/base");

-------------------------------------------------------
wnd_payActivity = i3k_class("wnd_payActivity", ui.wnd_base)

local first_pay_gift = 1 -- 首充 10
local pay_gift = 2 --累积充值20
local charge_every_day = 12  --每日充值奖励类型30
local charge_continuity = 13  --连续充值奖励类型40
local direct_purchase = 16 -- 直购礼包
local pay_rebate = 27 -- 充值返元宝


local WeekCardState = 1
local MonthCardState = 2
local SuperMonthCardState = 3
--local DragonCoinState = 4 --充值类型4 龙魂币
local CommemorativeCoin = 4 -- 纪念币增值活动

local isOpenSuperMonth = false  --是否直接开启逍遥卡

local TIME_SECOND_MAX = 2^31 - 1 --有符号int最大值
local MONTH_CARD_TIME_SECOND = 30*24*60*60 --充值一次增加的秒数

local activitySyncTbl =
{
	[first_pay_gift] =  	{sync = i3k_sbean.sync_activities_firstpaygift,		index = 0 ,	sort = 10},
	[pay_gift] = 	 		{sync = i3k_sbean.sync_activities_paygift,			index = 0, 	sort = 20},
	[charge_every_day] = 	{sync = i3k_sbean.pay_gift_everyday,				index = 0, 	sort = 30},
	[charge_continuity] = 	{sync = i3k_sbean.lastpaygift_sync,					index = 0, 	sort = 40},
	[direct_purchase] =		{sync = i3k_sbean.sync_direct_purchase,				index = 0, 	sort = 15},
	[pay_rebate] = 			{sync = i3k_sbean.syncPayRebate, 					index = 0, 	sort = 50},
}

function wnd_payActivity:ctor()
	self._time = 0
	self._activitiesList = {}
	self._firstFourRedPoints = {}

	self._dragonCoinUI = nil  --龙魂币UI
	self._comCoinActLeft = nil --纪念币UI
end

function wnd_payActivity:configure()
	self._layout.vars.closeBtn:onClick(self, self.onCloseUI)
end

function wnd_payActivity:onShow()

end

function wnd_payActivity:refresh(activityList, jumpMcId)
	self:updateActivitiesList(activityList, jumpMcId)
end

function wnd_payActivity:updateActivitiesList(acts, jumpMcId)
	self.fistfour = {
		[WeekCardState]    	  = {title = "热血特权卡", clickFun = self.onWeekCard, canget = false, syncFuc = function () i3k_sbean.sync_special_card(WEEK_CARD) end, sort = 1},
		[MonthCardState]	  = {title = "至尊月卡", clickFun = self.onMonthCard, canget = false, syncFuc = function () i3k_sbean.sync_special_card(MONTH_CARD) end, sort = 2},
		[SuperMonthCardState] = {title = "逍遥卡", clickFun = self.onSuperMonthCard, canget = false, syncFuc = function () i3k_sbean.sync_special_card(SUPER_MONTH_CARD) end, sort = 3},
		--[DragonCoinState]		= {title = "龙魂币",		clickFun = self.onDragonCoin, 		canget = false, 	syncFuc = function () i3k_sbean.sync_dragon_coin(DragonCoinState) end},
		[CommemorativeCoin]   = {title = "鼠年纪念金币", clickFun = self.OnCommemorativeCoin, canget = false, syncFuc = function () i3k_sbean.sync_activities_comCoin(false, true) end, sort = 19},
	}
	local activitiesList = self._layout.vars.ActivitiesList
	activitiesList:removeAllChildren()
	local itemsCollection = {}	--总体排序

	local hadReq = false -- 判断有无红点，优先跳转到红点？
	for i = 1 , #self.fistfour do
		if self:judgeOpenAct(i) then
			local info = self.fistfour[i]
			local item = require("ui/widgets/czhdt")()
			table.insert(itemsCollection, {item = item, sort = info.sort})
			item.vars.TitleName:setText(info.title)
			item.vars.bt:onClick(self, info.clickFun,item)
			item.vars.bt:setTag(i)
			item.vars.red_point:setVisible(info.canget == 1)
			self._firstFourRedPoints[i] = item.vars.red_point
			if (info.canget == 1 and hadReq == false) or jumpMcId == i then
				item.vars.select_icon:show()
				item.vars.bt:stateToPressed()
				self._current_bt = item.vars.bt
				self._current_select_icon = item.vars.select_icon
				info.syncFuc()
				hadReq = true
			end
			if i == CommemorativeCoin then 
				self._comCoinActLeft = item
				self:isShowComCoinActRedPoint()
		end
	end
	end
	local payActJump = self:getPaygiftJump(acts)
	local tmp_index = 0
	for k = 1 , #acts do
		local v = acts[k]
		local item = require("ui/widgets/czhdt")()
		local red_point = item.vars.red_point
		item.vars.TitleName:setText(v.title)
		item.vars.bt:onClick(self, self.updateSelectedListItem,{type = v.type, id = v.id , item = item })
		table.insert(itemsCollection, {item = item, sort = activitySyncTbl[v.type].sort})
		red_point:setVisible(v.notice == 1)
		item.vars.bt:stateToNormal()
		item.vars.select_icon:hide()
		item.vars.bt:setTag(#self.fistfour + k)
		self._activitiesList[k] = {
			id = v.id,
			atype = v.type,
			notice = v.notice,
			red_point = item.vars.red_point
		}
		if self:getActivitiesListisNeedJump(jumpMcId, v, hadReq, payActJump) then			
			item.vars.select_icon:show()
			item.vars.bt:stateToPressed()
			self:syncActivity(v.type, v.id)
			tmp_index = k
			self._current_bt = item.vars.bt
			self._current_select_icon = item.vars.select_icon
			hadReq = true
		end
	end
	table.sort(itemsCollection, function(a , b)
		return a.sort < b.sort
	end )
	for k = 1 , #itemsCollection do
		activitiesList:addItem(itemsCollection[k].item)
	end
	if hadReq == false then
		local index = self:getCardJump()
		local item = activitiesList:getAllChildren()[index]
		self._current_bt = item.vars.bt
		self._current_select_icon = item.vars.select_icon
		item.vars.select_icon:show()
		item.vars.bt:stateToPressed()
		self.fistfour[index].syncFuc()
	end
	if tmp_index > 0 then
		activitiesList:jumpToChildWithIndex(tmp_index + #self.fistfour)
	end
	self:updateLeftRedPoint(acts)
	self:updateMonthCardRedPoint() -- 月卡红点
	self:updateSuperMonthCardRedPoint() -- 逍遥卡红点
end
function wnd_payActivity:getPaygiftJump(acts)
	--notice按照位来解释，最低位还是原来的含义，表示是否可以领奖然后再加一位次低位，表示是否参与
	--2代表已经所有领取完 1代表可以领取 0代表为完成所有充值
	--其他的还是按照原来的逻辑notice 为1的时候可领奖
	local pays = {} 
	for _, v in ipairs(acts) do
		if v.type == pay_gift then
			table.insert(pays, v)
			if v.notice % 2 == 1 then
				return v.id
			end
		end
	end
	for _, v in ipairs(pays) do		
		if v.notice == 0 then
			return v.id
		end
	end
	return 0
end
function wnd_payActivity:getActivitiesListisNeedJump(jumpMcId, v, hadReq, payActJump)
	if jumpMcId then
		return false
	end
	if v.type == first_pay_gift then
		return true
	elseif v.type == pay_gift and not hadReq then 
		return v.id == payActJump
	else 
		if v.notice == 1 and not hadReq then
			return true
		end
	end
	return false
end
function wnd_payActivity:getCardJump()
	local endtime = g_i3k_game_context:getRoleSpecialCards(MONTH_CARD).cardEndTime
	local nowtime  = i3k_game_get_time()
	if endtime < nowtime then
		return MonthCardState
	end
	endtime = g_i3k_game_context:getRoleSpecialCards(SUPER_MONTH_CARD).cardEndTime
	if endtime < nowtime then
		return SuperMonthCardState
	end
	return WeekCardState
end

-- 如果都没有红点了，那么就清空？
function wnd_payActivity:updateLeftRedPoint(acts)
	self._notice = false
	for k,v in ipairs (acts) do
		if v.notice == 1 then
			self._notice = true
		end
	end
	if not self._notice then
		g_i3k_game_context:clearPayActivityRedPoint()
	end
end

function wnd_payActivity:updateSelectedListItem(sender,info)
	self.percent = self._layout.vars.ActivitiesList:getListPercent()
	g_i3k_game_context:SetDynamicActivityRedPointInfo(0)
	self:updateButtonState(info.item)
	self:syncActivity(info.type, info.id)

end

function wnd_payActivity:updateButtonState(item)
	if self._current_bt then
		self._current_bt:stateToNormal()
		self._current_select_icon:hide()
	end
	item.vars.select_icon:show()
	item.vars.bt:stateToPressed()
	self._current_bt = item.vars.bt
	self._current_select_icon = item.vars.select_icon
end
function wnd_payActivity:syncActivity(actType, actId, ...)
	local activityFunctions = activitySyncTbl[actType]
	if activityFunctions then
		activityFunctions.sync(actId,actType, ... )
	end
end
function wnd_payActivity:excessTime(control,time)
	----[[倒计时每个板子上写一个回调函数，把self 放到onupdate里（小于三天的时候，三天到一年内显示截至时间，否则显示不限时）
	local cur_Time = i3k_game_get_time()
	local totalDay = g_i3k_get_day(i3k_game_get_time())
	local lastDay = g_i3k_get_day(time.endTime)
	local days = lastDay - totalDay   --+ 1
	local havetime =(time.endTime - cur_Time- self._time)
	local min = math.floor(havetime / 60 %60)
	local hour = math.floor(havetime/3600%24)
	local day = math.floor(havetime/3600/24)
	if days <=  3  then--
		local time1 = havetime - self._time
		local str = string.format("%d天%d时%d分",day,hour,min)
		control.vars.ActivitiesTime:setText(str )
	else
		local finitetime =  g_i3k_get_ActDateRange(time.startTime, time.endTime)
		control.vars.ActivitiesTime:setText(finitetime)
	end
end
function wnd_payActivity:changeContentSize(control)
	local size = self._layout.vars.RightView:getContentSize()
	control.rootVar:setContentSize(size.width, size.height)
end
function wnd_payActivity:updateRightView(control)
	self._dragonCoinUI = nil
	local AddChild = self._layout.vars.RightView:getAddChild()
	for i,v in ipairs (AddChild) do
		self._layout.vars.RightView:removeChild(v)
	end
	self._layout.vars.RightView:addChild(control)
end
function wnd_payActivity:setLeftRedPoint(atype, id)
	self._notice = false
	for i, e in ipairs(self._activitiesList) do
		if id == e.id and atype == e.atype then
			if g_i3k_game_context:GetDynamicActivityRedPointInfo() == 1 then---
				e.red_point:show()
				e.notice = 1
			else
				e.red_point:hide()
				e.notice = 0
			end
		end
		if e.notice == 1 then
			self._notice = true
		end
	end
	if not self._notice then
		g_i3k_game_context:clearPayActivityRedPoint()
	end
end

function wnd_payActivity:onTips(sender,itemId)
	g_i3k_ui_mgr:ShowCommonItemInfo(itemId)
end

function wnd_payActivity:goPay(sender)
	g_i3k_logic:OpenChannelPayUI()
end

function wnd_payActivity:onXiaoYaoBt()
	g_i3k_ui_mgr:ShowTopMessageBox1(i3k_get_string(1404))
end

function wnd_payActivity:judgeOpenAct(index)
	--if index == DragonCoinState then
		--return g_i3k_db.i3k_db_check_gragon_coin_is_open() or g_i3k_game_context:getPinduoduoDragonCoinOpen()
	if index == SuperMonthCardState then
		if isOpenSuperMonth then
			return true
		end
		return g_i3k_game_context:getRoleSpecialCards(MONTH_CARD).cardEndTime > 0
	end
	--展示纪念币活动
	if index == CommemorativeCoin then
		return g_i3k_game_context:IsShowSouvenorCoinAct()
	end
	return true
end

-- 判断月卡和逍遥卡能否继续充值
function wnd_payActivity:judgeCanRechagre(endTime)
	if endTime + MONTH_CARD_TIME_SECOND >= TIME_SECOND_MAX then
		return false
	end
	return true
end

-------------特权卡-周卡begin-----------------------
function wnd_payActivity:updateWeekCardInfo()
	local weekCard = require("ui/widgets/tequanka")()
	self:updateRightView(weekCard)
	self:changeContentSize(weekCard)
	self:updateWeekCardItems(weekCard)
	self:updateWeekCardRedPoint()
	self._curSpecialCard = WEEK_CARD
end

function wnd_payActivity:onWeekCard(sender, item)
	i3k_sbean.sync_special_card(WEEK_CARD)
	self:updateButtonState(item)
end

function wnd_payActivity:updateWeekCardItems(widgets)
	local items = i3k_db_special_card[WEEK_CARD].reward
	for i= 1, 2 do
		local tmp_item = items[i]
		local tmp_bg = string.format("item_bg%s",i)
		local item_bg = widgets.vars[tmp_bg]
		local tmp_icon = string.format("item_icon%s",i)
		local item_icon = widgets.vars[tmp_icon]
		local tmp_btn = string.format("Btn%s",i)
		local Btn = widgets.vars[tmp_btn]
		local tmp_count_bg = string.format("count_bg%s",i)
		local count_bg = widgets.vars[tmp_count_bg]
		local tmp_suo = string.format("Item_suo%s",i)
		local Item_suo = widgets.vars[tmp_suo]
		local tmp_count = string.format("item_count%s",i)
		local item_count = widgets.vars[tmp_count]
		item_bg:setImage(g_i3k_db.i3k_db_get_common_item_rank_frame_icon_path(tmp_item.rewardID))
		item_icon:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(tmp_item.rewardID, i3k_game_context:IsFemaleRole()))
		count_bg:setVisible(tmp_item.count ~= 0)
		item_count:setVisible(tmp_item.count ~= 0)
		item_count:setText(string.format("×%s", tmp_item.count))
		Item_suo:setVisible(tmp_item.rewardID > 0)
		Btn:onClick(self, self.onTips, tmp_item.rewardID)
	end
	widgets.vars.GetBtn:onClick(self,self.buyWeekCard)
	widgets.vars.otherPayBtn:onClick(self, self.goPay)
	-- widgets.vars.GetBtn:disableWithChildren()
	local endtime = g_i3k_game_context:getRoleSpecialCards(WEEK_CARD).cardEndTime
	local nowtime  = i3k_game_get_time()
	if nowtime < endtime then
		-- widgets.vars.CreditBtnText:setText("领取")
		-- if g_i3k_game_context:getRoleSpecialCards(WEEK_CARD).reward == 0 then
		-- 	widgets.vars.topup:onClick(self,self.getWeekCardReward)
		-- 	widgets.vars.topup:enableWithChildren()
		-- else
		-- 	widgets.vars.topup:disableWithChildren()
		-- end
		local day = math.modf((endtime - nowtime)/(60*60*24))
		widgets.vars.month_card_desc:setText(string.format("热血特权卡生效中，剩余%s天。",day))
		widgets.vars.topup:disableWithChildren()
	else
		widgets.vars.topup:onClick(self,self.buyWeekCard)
		widgets.vars.CreditBtnText:setText("充值")
		widgets.vars.topup:enableWithChildren()
		widgets.vars.GetBtn:enableWithChildren()
		widgets.vars.month_card_desc:setText("热血特权卡未生效")
	end
	local cfg = i3k_db_special_card[WEEK_CARD]
	local roleLevel = g_i3k_game_context:GetLevel()
	widgets.vars.daw:setText(i3k_get_string(15364, cfg.autoSpriteHours, ((cfg.vit/10000) * 100) .."%"))
end
-- 领取周卡奖励
function wnd_payActivity:getWeekCardReward(sender)
	self:takeSpecialCardReward(WEEK_CARD)
end
-- 购买周卡
function wnd_payActivity:buyWeekCard(sender)
	self:buySpecialCard(WEEK_CARD, info)
end

function wnd_payActivity:updateWeekCardRedPoint()
	local state = false--g_i3k_game_context:getRoleSpecialCards(WEEK_CARD).reward == 0
	self._firstFourRedPoints[WeekCardState]:setVisible(state)
end
-----------特权卡-周卡end------------------------
function wnd_payActivity:updateSpecialCardBoth()
	if self._curSpecialCard == WEEK_CARD then
		self:updateWeekCardInfo()
	elseif self._curSpecialCard == MONTH_CARD then
		self:updateMonthCardInfo()
	elseif self._curSpecialCard == SUPER_MONTH_CARD then
		self:updateSuperMonthCardInfo()
	end
end
-- InvokeUIFunction
function wnd_payActivity:updateSpecialCard(cardType, id, info)
	self.specialCardInfo = {id = id, info = info}

	if cardType == WEEK_CARD then
		self:updateWeekCardInfo()
	elseif cardType == MONTH_CARD then
		self:updateMonthCardInfo()
	elseif cardType == SUPER_MONTH_CARD then
		self:updateSuperMonthCardInfo()
	end
end
function wnd_payActivity:takeSpecialCardReward(cardType)
	local cfg = i3k_db_special_card[cardType]
	local rewards = {}
	local gifts = {}
	for i, v in ipairs(cfg.reward) do
		if v.count ~= 0 then
			rewards[v.rewardID] = v.count
			gifts[i] = {id = v.rewardID, count = v.count}
		end
	end
	local isEnough = g_i3k_game_context:IsBagEnough(rewards)
	if isEnough then
		i3k_sbean.take_special_card_reward(cardType, gifts)
	else
		g_i3k_ui_mgr:PopupTipMessage("背包空间不足")
	end
end

-- 跳转到月卡周卡购买
function wnd_payActivity:buySpecialCard(cardType)
	local callback = function()
		if cardType == WEEK_CARD then
			self:updateWeekCardInfo()
		elseif cardType == MONTH_CARD then
			self:updateMonthCardInfo()
		elseif cardType == SUPER_MONTH_CARD then
			self:updateSuperMonthCardInfo()
		end
	end
	i3k_sbean.goto_channel_pay(self.specialCardInfo.id, self.specialCardInfo.info, callback)
end
--------------------月卡 begin--------------------
function wnd_payActivity:updateMonthCardInfo()
	self._curSpecialCard = MONTH_CARD
	local monthCardUI = require("ui/widgets/yuekalingqu")()
	self:updateRightView(monthCardUI)
	self:changeContentSize(monthCardUI)
	self:updateMonthCardRedPoint()
	self:updateMonthCardItems(monthCardUI)
end

function wnd_payActivity:onMonthCard(sender,item)
	i3k_sbean.sync_special_card(MONTH_CARD)
	self:updateButtonState(item)
end

function wnd_payActivity:updateMonthCardItems(monthCardLayer)
	-- local items = i3k_db_month_card_award[MonthCardState].awardItems
	local items = i3k_db_special_card[MONTH_CARD].reward
	for i= 1, 3 do
		local tmp_item = items[i]
		local tmp_bg = string.format("item_bg%s",i)
		local item_bg = monthCardLayer.vars[tmp_bg]
		local tmp_icon = string.format("item_icon%s",i)
		local item_icon = monthCardLayer.vars[tmp_icon]
		local tmp_btn = string.format("Btn%s",i)
		local Btn = monthCardLayer.vars[tmp_btn]
		local tmp_count_bg = string.format("count_bg%s",i)
		local count_bg = monthCardLayer.vars[tmp_count_bg]
		local tmp_suo = string.format("Item_suo%s",i)
		local Item_suo = monthCardLayer.vars[tmp_suo]
		local tmp_count = string.format("item_count%s",i)
		local item_count = monthCardLayer.vars[tmp_count]
		item_bg:setImage(g_i3k_db.i3k_db_get_common_item_rank_frame_icon_path(tmp_item.rewardID))
		item_icon:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(tmp_item.rewardID,i3k_game_context:IsFemaleRole()))
		count_bg:setVisible(tmp_item.count ~= 0)
		item_count:setVisible(tmp_item.count ~= 0)
		item_count:setText(string.format("×%s", tmp_item.count))
		Item_suo:setVisible(tmp_item.rewardID > 0)
		Btn:onClick(self, self.onTips, tmp_item.rewardID)
	end
	monthCardLayer.vars.GetBtn:onClick(self,self.buyMonthCard)
	monthCardLayer.vars.otherPayBtn:onClick(self, self.goPay)
	-- monthCardLayer.vars.GetBtn:disableWithChildren()
	local endtime = g_i3k_game_context:getRoleSpecialCards(MONTH_CARD).cardEndTime
	local nowtime  = i3k_game_get_time()
	if nowtime  < endtime then
		monthCardLayer.vars.CreditBtnText:setText("领取")
		if g_i3k_game_context:getRoleSpecialCards(MONTH_CARD).reward == 0 then
			monthCardLayer.vars.topup:onClick(self,self.onGetMonthCardAward)
			monthCardLayer.vars.topup:enableWithChildren()
		else
			monthCardLayer.vars.topup:disableWithChildren()
		end
		-- if endtime - nowtime < l_nThreeDaySecond then
		-- 	monthCardLayer.vars.GetBtn:enableWithChildren()
		-- end
		local day = math.modf((endtime - nowtime)/(60*60*24))
		monthCardLayer.vars.month_card_desc:setText(string.format("月卡生效中，剩余%s天。",day))
	else
		monthCardLayer.vars.topup:onClick(self,self.buyMonthCard)
		monthCardLayer.vars.CreditBtnText:setText("充值")
		monthCardLayer.vars.topup:enableWithChildren()
		monthCardLayer.vars.GetBtn:enableWithChildren()
		monthCardLayer.vars.month_card_desc:setText("储值USD4.99，立即获得225元宝，累积可领3600绑元")
	end

	if self.specialCardInfo.info and self.specialCardInfo.info.level == g_DISCOUNT_MONTH_CARD_ID then
		monthCardLayer.vars.discount:show()
	else
		monthCardLayer.vars.discount:hide()
	end
	monthCardLayer.vars.maxDayDesc:setText(i3k_get_string(17240))

	if not self:judgeCanRechagre(endtime) then
		monthCardLayer.vars.GetBtn:disableWithChildren()
	end
end

function wnd_payActivity:onGetMonthCardAward(sender)
	-- i3k_sbean.take_month_card_reward()
	self:takeSpecialCardReward(MONTH_CARD)
end
-- 购买月卡
function wnd_payActivity:buyMonthCard(sender)
	self:buySpecialCard(MONTH_CARD, info)
end
function wnd_payActivity:updateMonthCardRedPoint()
	local state = g_i3k_game_context:getRoleSpecialCards(MONTH_CARD).reward == 0
	local endtime = g_i3k_game_context:getRoleSpecialCards(MONTH_CARD).cardEndTime
	local nowtime  = i3k_game_get_time()
	if nowtime < endtime then
		self._firstFourRedPoints[MonthCardState]:setVisible(state)
	end
end

------------------------------月卡奖励end-----------------------------

--------------------逍遥卡（98元月卡） begin--------------------
function wnd_payActivity:updateSuperMonthCardInfo()
	self._curSpecialCard = SUPER_MONTH_CARD
	local superMonthCardUI = require("ui/widgets/xiaoyaoka")()
	self:updateRightView(superMonthCardUI)
	self:changeContentSize(superMonthCardUI)
	self:updateSuperMonthCardItems(superMonthCardUI)
	self:updateSuperMonthCardRedPoint() -- 逍遥卡红点
end

function wnd_payActivity:onSuperMonthCard(sender,item)
	i3k_sbean.sync_special_card(SUPER_MONTH_CARD)
	self:updateButtonState(item)
end

function wnd_payActivity:updateSuperMonthCardItems(monthCardLayer)
	local items = i3k_db_special_card[SUPER_MONTH_CARD].reward
	for i= 1, 3 do
		local tmp_item = items[i]
		local tmp_bg = string.format("item_bg%s",i)
		local item_bg = monthCardLayer.vars[tmp_bg]
		local tmp_icon = string.format("item_icon%s",i)
		local item_icon = monthCardLayer.vars[tmp_icon]
		local tmp_btn = string.format("Btn%s",i)
		local Btn = monthCardLayer.vars[tmp_btn]
		local tmp_count_bg = string.format("count_bg%s",i)
		local count_bg = monthCardLayer.vars[tmp_count_bg]
		local tmp_suo = string.format("Item_suo%s",i)
		local Item_suo = monthCardLayer.vars[tmp_suo]
		local tmp_count = string.format("item_count%s",i)
		local item_count = monthCardLayer.vars[tmp_count]
		item_bg:setImage(g_i3k_db.i3k_db_get_common_item_rank_frame_icon_path(tmp_item.rewardID))
		item_icon:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(tmp_item.rewardID,g_i3k_game_context:IsFemaleRole()))
		count_bg:setVisible(tmp_item.count ~= 0)
		item_count:setVisible(tmp_item.count ~= 0)
		item_count:setText(string.format("×%s", tmp_item.count))
		Item_suo:setVisible(tmp_item.rewardID > 0)
		Btn:onClick(self, self.onTips, tmp_item.rewardID)
	end
	monthCardLayer.vars.GetBtn:onClick(self,self.buySuperMonthCard)
	monthCardLayer.vars.otherPayBtn:onClick(self, self.goPay)
	monthCardLayer.vars.xiaoyao:onClick(self,self.onXiaoYaoBt)
	monthCardLayer.vars.discountBtn:onClick(self, self.ondiscountBtn)
	local endtime = g_i3k_game_context:getRoleSpecialCards(SUPER_MONTH_CARD).cardEndTime
	local nowtime  = i3k_game_get_time()
	if nowtime  < endtime then
		monthCardLayer.vars.CreditBtnText:setText("领取")
		if g_i3k_game_context:getRoleSpecialCards(SUPER_MONTH_CARD).reward == 0 then
			monthCardLayer.vars.topup:onClick(self,self.onGetSuperMonthCardAward)
			monthCardLayer.vars.topup:enableWithChildren()
		else
			monthCardLayer.vars.topup:disableWithChildren()
		end
		local day = math.modf((endtime - nowtime)/(60*60*24))
		monthCardLayer.vars.month_card_desc:show()
		monthCardLayer.vars.month_card_desc:setText(string.format("逍遥卡生效中，剩余%s天。",day))
	else
		monthCardLayer.vars.topup:onClick(self,self.buySuperMonthCard)
		monthCardLayer.vars.CreditBtnText:setText("充值")
		monthCardLayer.vars.topup:enableWithChildren()
		monthCardLayer.vars.GetBtn:enableWithChildren()
		monthCardLayer.vars.month_card_desc:hide()
	end
	monthCardLayer.vars.maxDayDesc:setText(i3k_get_string(17240))

	if not self:judgeCanRechagre(endtime) then
		monthCardLayer.vars.GetBtn:disableWithChildren()
	end
end

function wnd_payActivity:onGetSuperMonthCardAward(sender)
	self:takeSpecialCardReward(SUPER_MONTH_CARD)
end
-- 购买逍遥卡
function wnd_payActivity:buySuperMonthCard(sender)
	self:buySpecialCard(SUPER_MONTH_CARD, info)
end
function wnd_payActivity:updateSuperMonthCardRedPoint()
	local state = g_i3k_game_context:getRoleSpecialCards(SUPER_MONTH_CARD).reward == 0
	local endtime = g_i3k_game_context:getRoleSpecialCards(SUPER_MONTH_CARD).cardEndTime
	local nowtime  = i3k_game_get_time()
	if nowtime < endtime then
		self._firstFourRedPoints[SuperMonthCardState]:setVisible(state)
	end
end
------------------------------逍遥卡（98元月卡）end-----------------------------

----首冲
function wnd_payActivity:updateFirstPayGiftInfo(actType,actId,effectiveTime, cfg, log)
	local needValue = {actType = actType , actId = actId }
	local firstPayGiftUI = require("ui/widgets/shouchongsongli")()
	self:updateRightView(firstPayGiftUI)
	self:changeContentSize(firstPayGiftUI)
	self:updateFirstPayGiftMainInfo(firstPayGiftUI, cfg.time, log.pay)
	self:updatefirstpaygiftLevelItem(firstPayGiftUI,effectiveTime, log.id, cfg.gifts, log.reward ,cfg.biggift, log.pay,actType)
	self:setLeftRedPoint(actType, actId)
end

function wnd_payActivity:updateFirstPayGiftMainInfo(control, time, pay)
	local content = string.format("%d",pay)
end

function wnd_payActivity:updatefirstpaygiftLevelItem(item,effectiveTime, id, gifts, reward ,biggift,pay,actType)
	local firstPayGiftTb = {
		[1] = {root = item.vars.item_bg, icon = item.vars.item_icon ,btn = item.vars.Btn1, count = item.vars.item_count,suo = item.vars.Item_suo,bg = item.vars.count_bg},
		[2] = {root = item.vars.item_bg2, icon = item.vars.item_icon2 ,btn = item.vars.Btn2, count = item.vars.item_count2,suo = item.vars.Item_suo2,bg = item.vars.count_bg2},
		[3] = {root = item.vars.item_bg3, icon = item.vars.item_icon3 ,btn = item.vars.Btn3, count = item.vars.item_count3,suo = item.vars.Item_suo3,bg = item.vars.count_bg3},
		[4] = {root = item.vars.item_bg4, icon = item.vars.item_icon4 ,btn = item.vars.Btn4, count = item.vars.item_count4,suo = item.vars.Item_suo4,bg = item.vars.count_bg4},
		[5] = {root = item.vars.item_bg5, icon = item.vars.item_icon5 ,btn = item.vars.Btn5, count = item.vars.item_count5,suo = item.vars.Item_suo5,bg = item.vars.count_bg5},
		[6] = {root = item.vars.item_bg6, icon = item.vars.item_icon6,btn = item.vars.Btn6 , count = item.vars.item_count6,suo = item.vars.Item_suo6,bg = item.vars.count_bg6}
	}
	local _gift = {}
	for i,v in ipairs(gifts) do
		local curid = v.ids[g_i3k_game_context:GetRoleType()]
		firstPayGiftTb[i].root:show()
		firstPayGiftTb[i].root:setImage(g_i3k_db.i3k_db_get_common_item_rank_frame_icon_path(curid) )
		firstPayGiftTb[i].icon:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(curid,i3k_game_context:IsFemaleRole()))
		if v.count > 0 then
			firstPayGiftTb[i].count:setText("x"..v.count)
		else
			firstPayGiftTb[i].bg:hide()
			firstPayGiftTb[i].count:hide()
		end
		firstPayGiftTb[i].btn:onClick(self, self.onTips,curid)
		if curid == 3 or curid == 4 or curid == 31 or curid == 32 or curid == 33 or curid < 0 then
			firstPayGiftTb[i].suo:hide()
		else
			firstPayGiftTb[i].suo:show()
		end
		table.insert(_gift,{id = curid,count = v.count})
	end
	item.vars.ExItem_bg:setImage(g_i3k_db.i3k_db_get_common_item_rank_frame_icon_path(biggift.id))
	item.vars.ExItem_icon:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(biggift.id,i3k_game_context:IsFemaleRole()))
	item.vars.ExItem_name:setText(g_i3k_db.i3k_db_get_common_item_name(biggift.id))
	item.vars.ExItem_name:setTextColor(g_i3k_get_color_by_rank(g_i3k_db.i3k_db_get_common_item_rank(biggift.id)))
	if biggift.count >= 1 then
		item.vars.Exitem_count:setText("x"..biggift.count)
	else
		item.vars.Excount_bg:hide()
		item.vars.Exitem_count:hide()
	end
	if biggift.id == 3 or biggift.id == 4 or biggift.id == 31 or biggift.id== 32 or biggift.id == 33 or biggift.id < 0 then
		item.vars.ExItem_suo:hide()
	else
		item.vars.ExItem_suo:show()
	end
	item.vars.ExBtn:onClick(self, self.onTips,biggift.id)
	if pay > 0 then
		item.vars.topup:hide()
		if reward > 0 then
			item.vars.GetBtn:disableWithChildren()
			item.vars.GetBtnText:setText("已领取")
		else
			g_i3k_game_context:SetDynamicActivityRedPointInfo(1)
			local takeFirstPayGift = {Time = effectiveTime, index = id,gifts = _gift, actType = actType,giftEx = biggift,item=item}--key,value
			item.vars.GetBtn:onClick(self, self.onTakeGradeGiftReward,takeFirstPayGift)--领取
		end
	else
		item.vars.GetBtn:hide()
		item.vars.topup:onClick(self, self.onFirstPay)--充值--需要关闭当前
	end
end

function wnd_payActivity:onFirstPay(sender)
	local function callback()
		g_i3k_logic:OpenBattleUI()
		g_i3k_game_context:SetIsOpenFirstPayUI(true)
		g_i3k_logic:OpenPayActivityUI()
	end
	g_i3k_logic:OpenChannelPayUI(callback)
	-- g_i3k_ui_mgr:CloseUI(eUIID_Fuli)
end

function wnd_payActivity:onTakeGradeGiftReward(sender,needValue)
	self._percent = needValue.actType
	self._actID = needValue.index
	local giftsTb = needValue.gifts
	local giftsExTb = needValue.giftEx
	local isEnoughTable = { }
	local gift = {}
	local index = 0
	for i,v in pairs(giftsTb) do
		isEnoughTable[v.id] = v.count
	end
	isEnoughTable[giftsExTb.id] = giftsExTb.count
	local isEnough = g_i3k_game_context:IsBagEnough(isEnoughTable)
	for i,v in pairs (isEnoughTable) do
		index = index + 1
		gift[index] = {id = i,count = v}

	end
	if isEnough then
		if needValue.actType == 1 then
			i3k_sbean.activities_firstpaygift_take(needValue.Time,needValue.index,gift,index,needValue.actType)
		elseif needValue.actType == 4 then
			local percent = needValue.control.vars.GradeGiftList:getListPercent()
			activitySyncTbl[needValue.actType].index = needValue.control.vars.GradeGiftList:getListPercent()
			i3k_sbean.activities_gradegift_take(needValue.Time,needValue.index,needValue.level,needValue.actType,gift,percent,index)
		end
	else
		g_i3k_ui_mgr:PopupTipMessage("背包空间不足")
	end
end
--充值活动(累计充值送礼、宠物大礼包)
function wnd_payActivity:updatePayGiftInfo(actType, actId,effectiveTime, cfg, log,Index)
	local PayGiftUI = require("ui/widgets/chongzhisongli")()
	self:updateRightView(PayGiftUI)
	self:changeContentSize(PayGiftUI)
	self:updateCommonGiftMainInfo(PayGiftUI, cfg.time, cfg.title, cfg.content)
	self:updatePayGiftLevelsInfo(PayGiftUI, effectiveTime, cfg.levelGifts, log,actType,Index)
	self:setLeftRedPoint(actType, actId)
	PayGiftUI.vars.payBtn:onClick(self, self.goPay)
end
function wnd_payActivity:updateCommonGiftMainInfo(control, time, title, content)
	control.vars.ActivitiesTitle:setText(title)
	control.vars.ActivitiesContent:setText(content)
	self:excessTime(control,time)
end
function wnd_payActivity:updatePayGiftLevelsInfo(control, effectiveTime, lvlGifts, log,actType,Index)
	local PayGiftList = control.vars.giftList
	PayGiftList:removeAllChildren()
	for i, e in ipairs(lvlGifts) do
		self:appendPayGiftLevelItem(control, effectiveTime, log.id, log.pay,  e.gifts, e.pay, log.rewards[e.pay],actType)
	end
	local Index = activitySyncTbl[actType].index
	if Index ~= 0 then
		PayGiftList:jumpToListPercent(Index)
	else
		PayGiftList:jumpToListPercent(0)
	end
end

function wnd_payActivity:appendPayGiftLevelItem(control, effectiveTime, id, pay, gift, needPay,reward,actType)
	local PayGiftLevelWidgets = require("ui/widgets/czslt")()
	self:updatePayGiftLevelItem(PayGiftLevelWidgets, effectiveTime, id, pay, gift, needPay,reward ,control,actType)
	control.vars.giftList:addItem(PayGiftLevelWidgets)
end

function wnd_payActivity:updatePayGiftLevelItem(item, effectiveTime, id, pay, gift, needPay,reward,control,actType)
	local payGiftTb =
	{
		[1] = {root = item.vars.item_bg, icon = item.vars.item_icon, count = item.vars.item_count,suo = item.vars.item_suo,bg = item.vars.count_bg},
		[2] = {root = item.vars.item_bg2, icon = item.vars.item_icon2, count = item.vars.item_count2 ,suo = item.vars.item_suo2,bg = item.vars.count_bg2},
		[3] = {root = item.vars.item_bg3, icon = item.vars.item_icon3, count = item.vars.item_count3 ,suo = item.vars.item_suo3,bg = item.vars.count_bg3}
	}
	for k,v in ipairs(gift) do
		payGiftTb[k].root:show()
		payGiftTb[k].root:setImage(g_i3k_db.i3k_db_get_common_item_rank_frame_icon_path(v.id) )
		payGiftTb[k].icon:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(v.id,i3k_game_context:IsFemaleRole()))
		if v.count >= 1 then
			payGiftTb[k].count:setText("x"..v.count)
		else
			payGiftTb[k].bg:hide()
			payGiftTb[k].count:hide()
		end
		payGiftTb[k].icon:onClick(self, self.onTips,v.id)
		if v.id == 3 or v.id == 4 or v.id == 31 or v.id == 32 or v.id == 33 or v.id < 0 then
			payGiftTb[k].suo:hide()
		else
			payGiftTb[k].suo:show()
		end
	end
	local content = string.format("充值%s元宝可以获得",needPay)
	content = g_i3k_make_color_string(content,g_i3k_get_blue_color() )
	item.vars.GoalContent:setText(content)
	local goal = string.format("(%d/%d)",pay, needPay)
	item.vars.Count:setText(goal)
	if  pay >= needPay then
		item.vars.Count:setTextColor(g_i3k_get_cond_color(true))
		if reward then
			item.vars.GetImage:show()
			item.vars.alreadyGet1:show()
			item.vars.alreadyGet2:show()
			item.vars.alreadyGet3:show()
			item.vars.GetBtn:hide()
			item.vars.root_bg:setImage(g_i3k_db.i3k_db_get_icon_path(2423))
			item.vars.Count:hide()
		else
			g_i3k_game_context:SetDynamicActivityRedPointInfo(1)
			item.vars.Whole:show()
			local TakePayGift = {Time = effectiveTime , index = id , level = needPay,gifts = gift,control = control,actType = actType,item = item}
			item.vars.GetBtn:onClick(self, self.onTakeFirstPayGiftReward, TakePayGift)
			item.vars.root_bg:setImage(g_i3k_db.i3k_db_get_icon_path(2424))
		end
	else
		item.vars.root_bg:setImage(g_i3k_db.i3k_db_get_icon_path(2423))
		item.vars.GetBtnText:setText("未达标")
		item.vars.GetBtn:disableWithChildren()
	end
end
function wnd_payActivity:onTakeFirstPayGiftReward(sender,needValue)
	self._percent = needValue.actType
	self._actID = needValue.index
	local giftsTb = needValue.gifts
	local isEnoughTable = { }
	local index = 0
	for i,v in pairs(giftsTb) do
		index = index + 1
		isEnoughTable[v.id] = v.count
	end
	local isEnough = g_i3k_game_context:IsBagEnough(isEnoughTable)
	if isEnough then
		needValue.item.vars.GetBtn:disableWithChildren()
		if needValue.actType == 2 then
			local percent = needValue.control.vars.giftList:getListPercent()
			activitySyncTbl[needValue.actType].index = needValue.control.vars.giftList:getListPercent()
			i3k_sbean.activities_paygift_take(needValue.Time,needValue.index, needValue.level,needValue.actType ,needValue.gifts,percent,index)
		elseif needValue.actType == 3 then
			local percent = needValue.control.vars.giftList:getListPercent()
			activitySyncTbl[needValue.actType].index = needValue.control.vars.giftList:getListPercent()
			i3k_sbean.activities_consumegift_take(needValue.Time, needValue.index,needValue.level,needValue.actType,needValue.gifts,percent,index)

		elseif needValue.actType == 10 then
			local percent = needValue.control.vars.ExchangeGiftList:getListPercent()
			activitySyncTbl[needValue.actType].index = needValue.control.vars.ExchangeGiftList:getListPercent()
			i3k_sbean.activities_logingift_take(needValue.Time,needValue.index, needValue.days,needValue.actType,needValue.gifts,percent,index)
		end
	else
		g_i3k_ui_mgr:PopupTipMessage("背包空间不足")
	end
end

------------直购礼包活动begin--------------------
function wnd_payActivity:updateDirectPurchase(type, id, info)
	local ui = require("ui/widgets/chaozhilibao")()
	self:updateRightView(ui)
	self:changeContentSize(ui)
	self:updateDirectPurchaseInfo(ui, id, type, info)
	self:updateDirectPurchaseTime(ui, info.cfg.time)
end

function wnd_payActivity:updateDirectPurchaseTime(ui, time)
	self:excessTime(ui, time)
	-- ui.vars.ActivitiesTime:setText(time)
end

function wnd_payActivity:updateDirectPurchaseInfo(ui, id, type, info)

	for i, v in ipairs(info.cfg.levelPurchases) do
		local widgets = require("ui/widgets/chaozhilibaot")()
		ui.vars.giftList:addItem(widgets)
		local rewards = {}
		local gifts = {}
		for k = 1, 3 do
			if v.gifts[k] then
				local q = v.gifts[k]
				widgets.vars["item_bg"..k]:setImage(g_i3k_db.i3k_db_get_common_item_rank_frame_icon_path(q.id) )
				widgets.vars["item_icon"..k]:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(q.id))
				widgets.vars["item_count"..k]:setText("x"..q.count)
				widgets.vars["item_suo"..k]:setVisible(q.id > 0)
				widgets.vars["bt"..k]:onClick(self, self.onTips, q.id)
				rewards[q.id] = q.count
				gifts[k] = {id = q.id, count = q.count}
			else
				widgets.vars["item_bg"..k]:hide()
			end
		end
		local price = info.info.payLevels[v.payLevel].priceShow
		widgets.vars.desc:setText("花费"..price.."USD可购买")
		if info.log.rewardTimes[v.payLevel] and info.log.rewardTimes[v.payLevel] > 0 then -- 领过奖了
			widgets.vars.buyBtnLabel:setText("领奖")
			widgets.vars.buyBtn:disableWithChildren()
		elseif info.info.leftRewardTimes[v.payLevel] > 0  then -- 领奖
			local callback = function ()
				widgets.vars.buyBtn:disableWithChildren()
			end
			local data = {id = id, effectiveTime = info.effectiveTime, payLevel = v.payLevel, rewards = rewards, gifts = gifts, callback = callback}
			widgets.vars.buyBtn:onClick(self, self.onTakeDirectPurchase, data)
			widgets.vars.buyBtnLabel:setText("领奖")
		else
			local callback = function()
				i3k_sbean.sync_direct_purchase(id, type)
			end
			local levelReq = v.levelReq
			local vipReq = v.vipReq
			local cardReq = v.cardReq
			local data = {info = info.info.payLevels[v.payLevel], id = info.info.id, callback = callback, levelReq = levelReq, vipReq = vipReq, cardReq = cardReq}
			widgets.vars.buyBtn:onClick(self, self.onBuyDirectPurchase, data)
		end
	end
end

function wnd_payActivity:onBuyDirectPurchase(sender, data)
	if g_i3k_game_context:GetLevel() < data.levelReq then
		g_i3k_ui_mgr:PopupTipMessage("等级不足，达到"..data.levelReq.."级可以购买")
		return
	end
	if g_i3k_game_context:GetVipLevel() < data.vipReq then
		g_i3k_ui_mgr:PopupTipMessage(string.format(i3k_get_string(15376, data.vipReq)))
		return
	end
	local state = g_i3k_game_context:checkSpecialCardCondition(data.cardReq)
	if not state then
		local StringID = 15376
		g_i3k_ui_mgr:PopupTipMessage(i3k_get_string(StringID + data.cardReq))
	else
		self._directPurchaseCallback = data.callback
		i3k_sbean.goto_channel_pay(data.id, data.info, data.callback)
	end
end

-- InvokeUIFunction 直购礼包购买成功了，刷新一下
function wnd_payActivity:handleDirectPuschaseCallback()
	if self._directPurchaseCallback then
		self._directPurchaseCallback()
	end
	self._directPurchaseCallback = nil
end

function wnd_payActivity:onTakeDirectPurchase(sender, data)
	local isEnough = g_i3k_game_context:IsBagEnough(data.rewards)
	if isEnough then
		i3k_sbean.take_direct_purchase(data.id, data.effectiveTime, data.payLevel, data.gifts, data.callback)
	else
		g_i3k_ui_mgr:PopupTipMessage("背包空间不足")
	end
end
--------------直购礼包活动end--------------------

--每日充值送礼(宠物大礼包)begin----------------
function wnd_payActivity:updatePayGiftEveryDay(actType, actId, info)
	local MRCZSL = require(LAYER_MRCZSL)()
	self:updateRightView(MRCZSL)
	self:changeContentSize(MRCZSL)
	self:updatePayGiftEveryDayInfo(MRCZSL, info, actType, actId)
	self:setLeftRedPoint(actType, actId)
end

function wnd_payActivity:updatePayGiftEveryDayInfo(item, info, actType, actId)
	local firstPayGiftTb =
	{
		{root = item.vars.item_bg1, icon = item.vars.item_icon1 ,btn = item.vars.Btn1, count = item.vars.item_count1,suo = item.vars.Item_suo1,bg = item.vars.count_bg1},
		{root = item.vars.item_bg2, icon = item.vars.item_icon2 ,btn = item.vars.Btn2, count = item.vars.item_count2,suo = item.vars.Item_suo2,bg = item.vars.count_bg2},
		{root = item.vars.item_bg3, icon = item.vars.item_icon3 ,btn = item.vars.Btn3, count = item.vars.item_count3,suo = item.vars.Item_suo3,bg = item.vars.count_bg3},
		{root = item.vars.item_bg4, icon = item.vars.item_icon4 ,btn = item.vars.Btn4, count = item.vars.item_count4,suo = item.vars.Item_suo4,bg = item.vars.count_bg4},
		{root = item.vars.item_bg5, icon = item.vars.item_icon5 ,btn = item.vars.Btn5, count = item.vars.item_count5,suo = item.vars.Item_suo5,bg = item.vars.count_bg5},
		{root = item.vars.item_bg6, icon = item.vars.item_icon6,btn = item.vars.Btn6 , count = item.vars.item_count6,suo = item.vars.Item_suo6,bg = item.vars.count_bg6},
	}
	local current_time = i3k_game_get_time()
	local gifts = info.cfg.gifts
	local tmp_str = string.format(info.cfg.content, info.cfg.pay)
	item.vars.title_label:setText(tmp_str)
	item.vars.temp_label1:hide()
	item.vars.tmp_label2:hide()
	for i,v in ipairs(gifts) do
		firstPayGiftTb[i].root:show()
		firstPayGiftTb[i].root:setImage(g_i3k_db.i3k_db_get_common_item_rank_frame_icon_path(v.id) )
		firstPayGiftTb[i].icon:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(v.id,i3k_game_context:IsFemaleRole()))
		if v.count >= 1 then
			firstPayGiftTb[i].count:setText("x"..v.count)
		else
			firstPayGiftTb[i].bg:hide()
			firstPayGiftTb[i].count:hide()
		end
		firstPayGiftTb[i].btn:onClick(self, self.onTips,v.id)
		if v.id == 3 or v.id == 4 or v.id == 31 or v.id == 32 or v.id == 33 or v.id < 0 then
			firstPayGiftTb[i].suo:hide()
		else
			firstPayGiftTb[i].suo:show()
		end
	end
	local biggift = info.cfg.biggift
	item.vars.ExItem_bg:setImage(g_i3k_db.i3k_db_get_common_item_rank_frame_icon_path(biggift.id))
	item.vars.ExItem_icon:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(biggift.id,i3k_game_context:IsFemaleRole()))
	item.vars.ExItem_name:setText(g_i3k_db.i3k_db_get_common_item_name(biggift.id))
	item.vars.ExItem_name:setTextColor(g_i3k_get_color_by_rank(g_i3k_db.i3k_db_get_common_item_rank(biggift.id)))
	if biggift.count >= 1 then
		item.vars.Exitem_count:setText("x"..biggift.count)
	else
		item.vars.Excount_bg:hide()
		item.vars.Exitem_count:hide()
	end
	if biggift.id == 3 or biggift.id == 4 or biggift.id == 31 or biggift.id== 32 or biggift.id == 33 or biggift.id < 0 then
		item.vars.ExItem_suo:hide()
	else
		item.vars.ExItem_suo:show()
	end
	item.vars.ExBtn:onClick(self, self.onTips,biggift.id)
	local need_pay = info.cfg.pay
	if info.log.pay[info.curDay] and info.log.pay[info.curDay] >= need_pay then
		if info.log.reward[info.curDay] then
			item.vars.ChargeBtn:disableWithChildren()
			item.vars.GetBtnText:setText("已领取")
		else
			g_i3k_game_context:SetDynamicActivityRedPointInfo(1)
			local takeFirstPayGift = {Time = info.effectiveTime, id = actId,gifts = gifts, actType = actType,giftEx = biggift,item=item}--key,value

			item.vars.ChargeBtn:onClick(self, self.onTakeEveryDayGift,takeFirstPayGift)--领取
			item.vars.GetBtnText:setText("领取")
		end
	else
		item.vars.ChargeBtn:onClick(self, self.onStore)--充值--需要关闭当前
		item.vars.GetBtnText:setText("充值")
	end
	local tmp_str = string.format(" 已储值%s元宝",info.log.pay[info.curDay] or 0)
	item.vars.title_desc:setText(tmp_str)
end

function wnd_payActivity:onStore(sender)
	g_i3k_logic:OpenChannelPayUI()
	g_i3k_ui_mgr:CloseUI(eUIID_PayActivity)   --关闭当前
end

function wnd_payActivity:onTakeEveryDayGift(sender,needValue)
	local giftsTb = needValue.gifts
	local giftsExTb = needValue.giftEx
	local isEnoughTable = { }
	local gift = {}
	local index = 0
	for i,v in pairs(giftsTb) do
		isEnoughTable[v.id] = v.count
	end
	isEnoughTable[giftsExTb.id] = giftsExTb.count
	local isEnough = g_i3k_game_context:IsBagEnough(isEnoughTable)
	for i,v in pairs (isEnoughTable) do
		index = index + 1
		gift[index] = {id = i,count = v}
	end
	if isEnough then
		i3k_sbean.pay_gift_get_award(needValue.Time,needValue.actType,needValue.id,gift)
	else
		g_i3k_ui_mgr:PopupTipMessage("背包空间不足")
	end
end
--每日充值送礼end----------------

--------连续充值活动--begain-------------------
function wnd_payActivity:updateLastCharge(actType, actId,info)
	local MRCZSL = require("ui/widgets/lianxuchongzhi")()
	self.lianxuchongzhiInfo	 = {item = MRCZSL, info = info, actType = actType,actId = actId }
	self:updateRightView(MRCZSL)
	self:changeContentSize(MRCZSL)
	self:updateLastChargeInfo(MRCZSL,info,actType, actId,#info.log.reward+1)
	self:setLeftRedPoint(actType, actId)
	self:excessChargeTime(MRCZSL,info)
end

function wnd_payActivity:updateLastChargeInfo(item,info,actType,actId,index)
	local current_time = i3k_game_get_time()
	local curday = index  or 1
	if curday > 6 then
		curday = 6
	end
	local need_pay = info.cfg.lastPayNum
	item.vars.GetImage2:hide()
	local payDay = {}
	local dayPayNum = {}
	local keyTable = {}
	for k, v in pairs(info.log.payDay) do
		table.insert(keyTable, k)
	end
	table.sort(keyTable, function(a , b) return a < b end )
	for _, key in pairs(keyTable) do
		if info.log.dayPayNum[key] and info.log.dayPayNum[key] > 0 then
			table.insert(payDay,info.log.payDay[key])
			table.insert(dayPayNum,info.log.dayPayNum[key])
		end
	end

	local canget = 0
	for i = 1 , 6 do
		local gifts = info.cfg.gifts[i].gifts
		item.vars["reward_btn"..(i + 5)]:onClick(self, self.onShowLastChargeGift,i)--领取
		item.vars["reward_btn"..(i + 5)]:setTouchEnabled(true)
		if payDay[i] and dayPayNum[i] >= need_pay then --达到条件
			if info.log.reward[i] then -- 已领取
				item.vars["reward_get_icon"..(i + 5)]:show()
				item.vars["reward_icon"..(i + 5)]:hide()
				if i == curday then
					canget = 1
				end
			else -- 未领取
				item.vars.ChargeBtn:show()
				g_i3k_game_context:SetDynamicActivityRedPointInfo(1)
				if i == 1 then
					item.anis.c_bx.play()
				else
					item.anis[string.format("c_bx%s",i)].play()
				end
				item.vars["reward_get_icon"..(i + 5)]:hide()
				item.vars["reward_icon"..(i + 5)]:show()
				if i == curday then
					canget = 2
				end
			end
		else
			item.vars["reward_get_icon"..(i + 5)]:hide()
			item.vars["reward_icon"..(i + 5)]:show()
		end
		if i == curday then
			if canget ~= 1 then
	 			item.vars["select"..i]:show()
			end
	 	else
	 		item.vars["select"..i]:hide()
	 	end
	end

	local gifts = info.cfg.gifts[curday].gifts

	if canget == 0 then
		item.vars.ChargeBtn:show()
		item.vars.ChargeBtn:onClick(self, self.onStore)--充值--需要关闭当前
		item.vars.GetBtnText2:setText("充值")
	elseif canget == 1 then
		item.vars.ChargeBtn:hide()
		item.vars.GetImage2:show()
	elseif canget == 2 then
		local takeFirstPayGift = {time = info.effectiveTime, id = actId,actType = actType, gifts = gifts, index = curday }
		item.vars.ChargeBtn:onClick(self, self.onTakeLastChargeGift,takeFirstPayGift)--领取
		item.vars.GetBtnText2:setText("领取")
	end
	item.vars.listview:removeAllChildren()
	for i = 1 , #gifts do
		if gifts[i] and  gifts[i].count >= 1 then
			local temp = require("ui/widgets/lianxuchongzhit")()
			temp.vars.item_bg4:setImage(g_i3k_db.i3k_db_get_common_item_rank_frame_icon_path(gifts[i].id) )
			temp.vars.item_icon4:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(gifts[i].id,i3k_game_context:IsFemaleRole()))
			temp.vars.item_count4:setText("x"..gifts[i].count)
			temp.vars.Btn4:onClick(self, self.onTips,gifts[i].id)
			item.vars.listview:addItem(temp)
		end
	end

	item.vars.schedule2:setPercent(#payDay/#info.cfg.gifts*100)
	item.vars.fas:setText(string.format("已连续充值%d%s",#payDay,"天"))
	if need_pay > 0 then
		item.vars.GoalContent2:setText(string.format("每天储值%d%s",need_pay,"元宝即可领取奖励"))
	end
end
function wnd_payActivity:excessChargeTime(control, info)
	local cur_Time = i3k_game_get_time()
	local havetime = info.cfg.time.endTime - cur_Time
	local day = math.floor(havetime / 86400)
	local str = ""
	if table.nums(info.log.payDay) == 0 then
		local min = math.floor(havetime / 60 % 60)
		local hour = math.floor(havetime / 3600 % 24)
		str = string.format("%d天%d时%d分", day, hour, min)
	else
		str = string.format("%s-%s", g_i3k_get_ActDateStr(info.cfg.time.startTime), g_i3k_get_ActDateStr(info.cfg.time.endTime))
	end
	control.vars.ActivitiesTime:setText(str)
	local descStr = table.nums(info.log.payDay) == 0 and i3k_get_string(18347) or i3k_get_string(18348)
	control.vars.descText:setText(descStr)
end

function wnd_payActivity:onShowLastChargeGift(sender , index )
	self:updateLastChargeInfo(self.lianxuchongzhiInfo.item,self.lianxuchongzhiInfo.info,self.lianxuchongzhiInfo.actType, self.lianxuchongzhiInfo.actId,index)
end

function wnd_payActivity:onTakeLastChargeGift(sender,needValue)
	local giftsTb = needValue.gifts
	local isEnoughTable = { }
	for i,v in pairs(giftsTb) do
		isEnoughTable[v.id] = v.count
	end
	local isEnough = g_i3k_game_context:IsBagEnough(isEnoughTable)
	if isEnough then
		local gift = {}
		for i,v in pairs (isEnoughTable) do
			table.insert(gift,{id = i,count = v})
		end
		i3k_sbean.lastpaygift_take(needValue.time,needValue.index,gift,needValue.actType,needValue.id)
	else
		g_i3k_ui_mgr:PopupTipMessage("背包空间不足")
	end
end
--------连续充值活动 -----end----------------------

--------龙魂币充值 -----begin----------------------
function wnd_payActivity:onDragonCoin(sender, item)
	i3k_sbean.sync_dragon_coin(DragonCoinState)
	self:updateButtonState(item)
end

function wnd_payActivity:updateDragonCoin(id, payLevels)
	local dragonCoinUI = require("ui/widgets/longhunbi")()
	self:updateRightView(dragonCoinUI)
	self:changeContentSize(dragonCoinUI)
	self._dragonCoinUI = dragonCoinUI

	self:updateDragonCoinInfo(dragonCoinUI, id, payLevels)
end

function wnd_payActivity:updateDragonCoinInfo(control, id, payLevels)
	self:setMyDragonCoin()
	local dragonBuyList = control.vars.dragonBuyList
	dragonBuyList:stateToNoSlip()
	dragonBuyList:removeAllChildren()
	for _, v in ipairs(payLevels) do
		self:appendDragonCoinItem(control, id, v)
	end
end

function wnd_payActivity:appendDragonCoinItem(control, id, buyInfo)
	local dragonCoinWidgets = require("ui/widgets/longhunbit")()
	self:updateDragonCoinItem(dragonCoinWidgets, control, id, buyInfo)
	control.vars.dragonBuyList:addItem(dragonCoinWidgets)
end

function wnd_payActivity:updateDragonCoinItem(item, control, id, buyInfo)
	local pays = i3k_db_channel_pay[id]
	if pays then
		local payCfg = pays[buyInfo.level]
		item.vars.bgIcon:setImage(g_i3k_db.i3k_db_get_common_item_rank_frame_icon_path(payCfg.itemIcon))
		item.vars.icon:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(payCfg.itemIcon), g_i3k_game_context:IsFemaleRole())
		item.vars.suo:setVisible(g_i3k_db.i3k_db_get_reward_lock_visible(payCfg.itemIcon))	--jiasuo
		item.vars.count:setText(string.format("x%s", payCfg.coinNum))
		item.vars.bt:onClick(self, self.onTips, payCfg.itemIcon)
		item.vars.buyBtn:onClick(self, self.onBuyDragonCoin, {control = control, id = id, buyInfo = buyInfo})
	end
end

-- 购买龙魂币
function wnd_payActivity:onBuyDragonCoin(sender, data)
	local buyInfo = data
	i3k_sbean.goto_channel_pay(buyInfo.id, buyInfo.buyInfo)
end

function wnd_payActivity:setMyDragonCoin()
	if self._dragonCoinUI then
		local coinNum = g_i3k_game_context:GetDragonCoinCount()
		self._dragonCoinUI.vars.coinNum:setText(coinNum)
		self._dragonCoinUI.vars.coinImg:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(g_BASE_ITEM_DRAGON_COIN), g_i3k_game_context:IsFemaleRole())
	end
end
--------龙魂币充值-----end----------------------
------------- 纪念金币活动 --------------------
function wnd_payActivity:OnCommemorativeCoin(sender, item)
	local isRefreshChangeUI = false
	local isShowTop = true
	i3k_sbean.sync_activities_comCoin(isRefreshChangeUI, isShowTop)
	self:updateButtonState(item)
end
--同步纪念币信息
function wnd_payActivity:updateComCoinInfo(info, isShowTop)
	self._comCoinInfo = info
	self._comCoinInfo.nowDhScaleIndex = g_i3k_db.i3k_db_getCoin_changeScale()
	local ui = require("ui/widgets/shunianjnjb")()
	self:updateRightView(ui)
	self:changeContentSize(ui)
	self:updateCollectCoinStaticUI(ui)
	self:updateCollectCoinDynamicUI(ui, info, isShowTop)
end
function wnd_payActivity:updateCollectCoinStaticUI(ui)
	local t1 = g_i3k_get_MonthAndDayHourAndMinTime(i3k_db_commecoin_cfg.baseConfig.buyOpenTime)
	local t2 = g_i3k_get_MonthAndDayHourAndMinTime(i3k_db_commecoin_cfg.baseConfig.buyCloseTime)
	ui.vars.bottomText:setText(i3k_get_string(19104))
	ui.vars.maxDayDesc:setText(i3k_get_string(19088, t1, t2))
	for i = 1, 5 do
		ui.vars["gdbl"..i]:setText(string.format("1/%d", i3k_db_commecoin_cfg.exchangeConfig.scaleShow[i]))
	end
	ui.vars.coinIcon:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(i3k_db_commecoin_cfg.buyConfig.getPropId))
	ui.vars.coinBtn:onClick(self, self.onTips, i3k_db_commecoin_cfg.buyConfig.getPropId)
	ui.vars.buyBtn:onClick(self, self.OnBuyCollectCoin)
end
function wnd_payActivity:updateCollectCoinDynamicUI(ui, info, isShowTop)
	ui.vars.coinCount:setText(g_i3k_game_context:GetCommonItemCanUseCount(i3k_db_commecoin_cfg.buyConfig.getPropId))
	ui.vars.otherPayBtn:onClick(self, self.OnOpenExchangeCoinUI, info, isShowTop)
	for i = 2, #i3k_db_commecoin_addValueNode do
		local post = require("ui/widgets/shunianjnjb2")()
		ui.vars.lblist:addItem(post)
		local prop = g_i3k_db.i3k_db_get_JdtPercent_prop(i)
		local boxhight = post.vars.jdt:getContentSize().height * (1 - prop)
		post.vars.jdt:setPercent(prop * 100)
		post.vars.blnum:setPositionY(post.vars.blnum:getPosition().y - boxhight)
		post.vars.times:setText(g_i3k_get_commonDateMonthAndDayStr(i3k_db_commecoin_addValueNode[i].addValueTimeNode))
		local percentage = i3k_db_commecoin_addValueNode[i].scaleValue / i3k_db_commecoin_cfg.exchangeConfig.unitChangeScale
		post.vars.blnum:setText(string.format("%d%%", percentage * 100))
		post.vars.box:setVisible(i3k_db_commecoin_addValueNode[i].isHadBox > 0)
		post.vars.selectBg:setVisible(false)
		if i3k_db_commecoin_addValueNode[i].isHadBox > 0 then
			local canTake, isTaked = g_i3k_db.i3k_db_get_JNBbox_state(i, self._comCoinInfo.canTakeHoldReward, self._comCoinInfo.takeHoldReward)
			if isTaked then
				post.vars.bxbg:setVisible(false)
				post.vars.kbxbg:setVisible(true)
			elseif canTake then
				post.anis.c_bx:play()
			end
			post.vars.boxbtn:onClick(self, self.OnGetGiftRewards, {
				index = i, 
				canTake = canTake, 
				isTaked = isTaked
			})
		end
		if info.nowDhScaleIndex == i then
			post.vars.times:setTextColor("fffff600")
			post.vars.blnum:setTextColor("fffff600")
			post.vars.selectBg:setVisible(true)
		end
	end
end
--点击宝箱
function wnd_payActivity:OnGetGiftRewards(sender, tbl)
	if tbl.isTaked then
		g_i3k_ui_mgr:PopupTipMessage(i3k_get_string(19103))
	else
		if tbl.canTake then
			i3k_sbean.syncHoldTakeRewardComCoin(tbl.index)
		else
			local msg = i3k_get_string(19093, i3k_db_commecoin_addValueNode[tbl.index].needCoinNums)
			g_i3k_ui_mgr:OpenUI(eUIID_FestivalScoreBoxTips)
			local items = {}
			for i, value in ipairs(i3k_db_commecoin_addValueNode[tbl.index].rewards) do
				if value.count ~= 0  then
					table.insert(items, {itemID = value.id, itemCount = value.count})
				end
			end
			g_i3k_ui_mgr:RefreshUI(eUIID_FestivalScoreBoxTips, items, msg)
		end
	end
end
--购买
function wnd_payActivity:OnBuyCollectCoin(sender)
	if self._comCoinInfo.buyNum < i3k_db_commecoin_cfg.buyConfig.maxBuyNums then
		local nowtime = g_i3k_get_GMTtime(i3k_game_get_time())
		if nowtime < i3k_db_commecoin_cfg.baseConfig.buyOpenTime then
			g_i3k_ui_mgr:PopupTipMessage(i3k_get_string(19089))
		elseif i3k_db_commecoin_cfg.baseConfig.buyCloseTime < nowtime then
			g_i3k_ui_mgr:PopupTipMessage(i3k_get_string(19090))
		else
			local data = {}
			data.itemId = i3k_db_commecoin_cfg.buyConfig.getPropId
			data.limitTimes = math.max(i3k_db_commecoin_cfg.buyConfig.maxBuyNums - self._comCoinInfo.buyNum, 0)
			data.needItemId = i3k_db_commecoin_cfg.buyConfig.needPropId
			data.unitPrice = i3k_db_commecoin_cfg.buyConfig.unitPrice
			data.buyType = g_BUYCOLLECTCOIN_TYPE
			g_i3k_ui_mgr:OpenUI(eUIID_JnCoinBuyTips)
			g_i3k_ui_mgr:RefreshUI(eUIID_JnCoinBuyTips, data)
		end
	else
		g_i3k_ui_mgr:PopupTipMessage(i3k_get_string(19091, i3k_db_commecoin_cfg.buyConfig.maxBuyNums))
	end
end
--进入兑换
function wnd_payActivity:OnOpenExchangeCoinUI(sender, info, isShowTop)
	local data = {
		nowExchangeScale = i3k_db_commecoin_addValueNode[info.nowDhScaleIndex].scaleValue,
		exchangeItemNums = info.exchangeItemNums,
	}
	g_i3k_ui_mgr:OpenUI(eUIID_ExChangeCoin)
	g_i3k_ui_mgr:RefreshUI(eUIID_ExChangeCoin, data, true)
end
function wnd_payActivity:isShowComCoinActRedPoint()
	local isShow = g_i3k_game_context:IsCanTakeBoxForCoinAct()
	self._comCoinActLeft.vars.red_point:setVisible(isShow)
end
------------- 纪念金币活动end -----------------

------------- +12 充值返元宝 ------------------
function wnd_payActivity:updatePayRebate(id, type, info)
	local ui = require("ui/widgets/chongzhifanyuanbao")()
	self:updateRightView(ui)
	self:changeContentSize(ui)
	self:updatePayRebateInfo(ui, id, type, info)
	-- self:updatePayRebateTime(ui, info.cfg.time) -- 不使用通用逻辑
	self:updatePayRebateTime(ui, info.cfg.payEndTime)
end

function wnd_payActivity:updatePayRebateInfo(ui, id, type, info)
	ui.vars.buyBtn:onClick(self, self.onPayRebatePayBtn)

	ui.vars.des:setText(i3k_get_string(1275, info.cfg.returnConf.payReq, info.cfg.returnConf.dayReturn, info.cfg.returnConf.returnDays))
	ui.vars.des2:setText(i3k_get_string(1276, info.log.payNum, info.cfg.returnConf.payReq))
	local days = self:getPayRebateRewardDays(info)

	if info.log.finishDay == 0 then
		-- 不可以领奖,显示充值
		ui.vars.payRoot:show()
		ui.vars.rewardRoot:hide()
	elseif days == 0 then
		ui.vars.payRoot:hide()
		ui.vars.rewardRoot:show()
		ui.vars.buyBtn2:disableWithChildren()
		ui.vars.rewardLabel:setText("已领取")
		local dayReturn = info.cfg.returnConf.dayReturn
		local leftDays = self:getPayRebateLeftDays(info)
		ui.vars.des3:setText(i3k_get_string(1277, leftDays * dayReturn))
		local takeGifts = leftDays >= 0 and info.cfg.returnConf.takeGift or {}

		self:updatePayRebateScroll(ui, takeGifts, dayReturn * 1)


	elseif days > 0 then
		ui.vars.payRoot:hide()
		ui.vars.rewardRoot:show()
		local dayReturn = info.cfg.returnConf.dayReturn
		local leftDays = self:getPayRebateLeftDays(info)
		local takeGifts = leftDays >= 0 and info.cfg.returnConf.takeGift or {}
		self:updatePayRebateScroll(ui, takeGifts, dayReturn * days)
		ui.vars.des3:setText(i3k_get_string(1277, (days + leftDays) * dayReturn))
		local gifts = self:getPayRebateRewards(takeGifts, dayReturn * days)
		local data = {id = id, type = type, effectiveTime = info.effectiveTime, gifts = gifts}
		ui.vars.buyBtn2:onClick(self, self.onPayRebateTakeReward, data)
	end

end

-- 返回可以领奖的天数,大于0表示可以领奖的天数
function wnd_payActivity:getPayRebateRewardDays(info)
	local curDay = g_i3k_get_day(i3k_game_get_time())
	local index = math.min(curDay - info.log.finishDay + 1, info.cfg.returnConf.returnDays) - info.log.rewardIndex
	return index
end

-- 还可以领取多少天的奖励（扣除了当前已经领取或者未领取的）
function wnd_payActivity:getPayRebateLeftDays(info)
	local curDay = g_i3k_get_day(i3k_game_get_time())
	local finishDay = info.log.finishDay
	local returnDays = info.cfg.returnConf.returnDays
	local result =  returnDays - (curDay - finishDay) - 1
	return result > 0 and result or 0
end

function wnd_payActivity:getPayRebateRewards(data, diamondCount)
	local gifts = { {id = 1, count = diamondCount}}
	for k, v in ipairs(data) do
		table.insert(gifts, v)
	end
	return gifts
end

-- 设置滚动条中的数据
function wnd_payActivity:updatePayRebateScroll(ui, data, diamondCount)
	local scroll = ui.vars.scroll
	scroll:removeAllChildren()

	local widget = require("ui/widgets/chongzhifanyuanbaot")()
	local diamondID = 1 -- 绑定元宝
	widget.vars.lock:show()
	widget.vars.icon:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(diamondID), g_i3k_game_context:IsFemaleRole())
	widget.vars.bg:setImage(g_i3k_db.i3k_db_get_common_item_rank_frame_icon_path(diamondID))
	widget.vars.count:setText("x"..diamondCount)
	widget.vars.btn:onClick(self, self.onTips, diamondID)
	widget.vars.otherImg:hide()
	scroll:addItem(widget)

	for k, v in ipairs(data) do
		local widget2 = require("ui/widgets/chongzhifanyuanbaot")()
		widget2.vars.lock:show(v.id > 0)
		widget2.vars.icon:setImage(g_i3k_db.i3k_db_get_common_item_icon_path(v.id), g_i3k_game_context:IsFemaleRole())
		widget2.vars.bg:setImage(g_i3k_db.i3k_db_get_common_item_rank_frame_icon_path(v.id))
		widget2.vars.count:setText("x"..v.count)
		widget2.vars.btn:onClick(self, self.onTips, v.id)
		scroll:addItem(widget2)
	end
end

function wnd_payActivity:updatePayRebateTime(ui, time)
	-- self:excessTime(ui, time)
	ui.vars.ActivitiesTime:setText(i3k_get_string(1278, g_i3k_get_show_time(time)))
end

function wnd_payActivity:onPayRebatePayBtn(sender)
	g_i3k_logic:OpenChannelPayUI()
end

function wnd_payActivity:onPayRebateTakeReward(sender, data)
	i3k_sbean.takePayRebate(data)
end

function wnd_payActivity:ondiscountBtn(sender)
	g_i3k_ui_mgr:ShowTopMessageBox1(i3k_get_string(1709))
end
------------- +12 充值返元宝 end ------------------

function wnd_create(layout, ...)
	local wnd = wnd_payActivity.new()
	wnd:create(layout, ...)
	return wnd;
end
