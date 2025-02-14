MainuiActivityHallView = MainuiActivityHallView or BaseClass(BaseView)
local PAGE_COUNT = 8
function MainuiActivityHallView:__init()
	self.ui_config = {"uis/views/main_prefab", "MainuiActivityHall"}
	-- self.view_layer = UiLayer.Pop
	self.list_cell = {}
	self.data_list = {}
end

function MainuiActivityHallView:__delete()

end

function MainuiActivityHallView:ReleaseCallBack()
	for k,v in pairs(self.list_cell) do
		if nil ~= v then
			v:DeleteMe()
		end
	end
	self.list_cell = {}
	self.data_list = {}

	self.list_view = nil
	self.data_count = nil
	if self.remind_change then
		RemindManager.Instance:UnBind(self.remind_change)
		self.remind_change = nil
	end
	if self.delay_time then
		GlobalTimerQuest:CancelQuest(self.delay_time)
		self.delay_time = nil
	end
end

function MainuiActivityHallView:LoadCallBack()

	self.list_view = self:FindObj("ListView")

	local list_delegate = self.list_view.list_simple_delegate
	list_delegate.NumberOfCellsDel = BindTool.Bind(self.GetNumberOfCells, self)
	list_delegate.CellRefreshDel = BindTool.Bind(self.RefreshCell, self)

	self.data_count = self:FindVariable("DataCount")

	self:ListenEvent("CloseWindow", BindTool.Bind(self.CloseWindow, self))
	self.remind_change = BindTool.Bind(self.RemindChangeCallBack, self)
	RemindManager.Instance:Bind(self.remind_change, RemindName.ACTIVITY_JUAN_ZHOU)
end

function MainuiActivityHallView:RemindChangeCallBack(remind_name, num)
	self:FlushRankActivityRed()
end
function MainuiActivityHallView:GetNumberOfCells()
	local count = math.ceil(#self.data_list / PAGE_COUNT)
	if self.data_count then
		self.data_count:SetValue(count)
		self.list_view.list_page_scroll:SetPageCount(count)
	end
	return count
end

function MainuiActivityHallView:RefreshCell(cell, data_index)
	-- 构造Cell对象.
	local item = self.list_cell[cell]
	if nil == item then
		item = MainuiActivityHallGroup.New(cell)
		self.list_cell[cell] = item
	end

	local data = {}
	for i = 1, PAGE_COUNT do
		if self.data_list[data_index * PAGE_COUNT + i] then
			table.insert(data, self.data_list[data_index * PAGE_COUNT + i])
		else
			break
		end
	end
	item:SetData(data)

end

function MainuiActivityHallView:CloseWindow()
	self:Close()
end

function MainuiActivityHallView:CloseCallBack()

end

function MainuiActivityHallView:OpenCallBack()
	self:Flush()
	-- MainuiActivityHallData.Instance:FlushActRedPoint()
end

function MainuiActivityHallView:OnFlush()
	local data_list = {}
	local list = ActivityData.Instance:GetActivityHallDatalist()
	for k,v in pairs(list) do
		if v.type == ACTIVITY_TYPE.RAND_ACTIVITY_TYPE_SHAKE_MONEY then
			local gold = CrazyMoneyTreeData.Instance:GetMoney() or 0
			local max_chongzhi_num = CrazyMoneyTreeData.Instance:GetMaxChongZhiNum() or 0
			if gold < max_chongzhi_num then
				table.insert(data_list,v)
			end
		elseif v.type == ACTIVITY_TYPE.RAND_ACTIVITY_TYPE_SINGLE_REBATE then
			local today_recharge = DailyChargeData.Instance:GetChongZhiInfo().today_recharge
			if not (today_recharge and today_recharge > 0) then
				table.insert(data_list,v) 														--如果当天没有充值，显示单笔返利活动
			end
		else
			table.insert(data_list,v)
		end
	end
	self.data_list = data_list
	if self.delay_time == nil then
		self.delay_time = GlobalTimerQuest:AddDelayTimer(function()
			self.delay_time = nil
			self.list_view.scroller:ReloadData(0)
		end, 0.2)
	end
end

function MainuiActivityHallView:FlushRankActivityRed()
	if self.delay_time == nil then
		self.delay_time = GlobalTimerQuest:AddDelayTimer(function()
			self.delay_time = nil
			if self.list_view and self.list_view.scroller.isActiveAndEnabled then
				self.list_view.scroller:RefreshAndReloadActiveCellViews(true)
			end
		end, 0.2)
	end
end

----------------------------------------------------------------------------
--MainuiActivityHallGroup 		列表滚动条格子
----------------------------------------------------------------------------

MainuiActivityHallGroup = MainuiActivityHallGroup or BaseClass(BaseCell)

function MainuiActivityHallGroup:__init()
	self.cell_list = {}
	self.data = {}
	for i = 1, PAGE_COUNT do
		PrefabPool.Instance:Load(AssetID("uis/views/main_prefab", "MainuiActivityHallIcon"), function (prefab)
			if nil == prefab then
				return
			end
			local obj = GameObject.Instantiate(prefab)
			local obj_transform = obj.transform
			obj_transform:SetParent(self.root_node.transform, false)
			local item = MainuiActivityHallCell.New(obj)
			table.insert(self.cell_list, item)
			PrefabPool.Instance:Free(prefab)
			if #self.cell_list == PAGE_COUNT then
				self:SetData(self.data)
			end
		end)
	end
end

function MainuiActivityHallGroup:__delete()
	for k,v in pairs(self.cell_list) do
		v:DeleteMe()
	end
	self.cell_list = {}
end

function MainuiActivityHallGroup:SetData(data)
	self.data = data
	if #self.cell_list < PAGE_COUNT then return end
	for k,v in pairs(self.cell_list) do
		v:SetData(data[k])
		v:SetActive(data[k] ~= nil)
	end
end


----------------------------------------------------------------------------
--MainuiActivityHallCell 		列表滚动条格子
----------------------------------------------------------------------------

MainuiActivityHallCell = MainuiActivityHallCell or BaseClass(BaseCell)

function MainuiActivityHallCell:__init()
	self.res = self:FindVariable("Res")
	self.red = self:FindVariable("Red")
	self.eff = self:FindVariable("ShowEffect")
	self.show = self:FindVariable("Show")
	self.act_times = self:FindVariable("ActTimes")
	self.name = self:FindVariable("Name")
	self.hide_acttime = self:FindVariable("Hide_ActTime")
	self:ListenEvent("Click",BindTool.Bind(self.OnButtonClick, self))
end

function MainuiActivityHallCell:__delete()
	if self.act_next_timer then
		GlobalTimerQuest:CancelQuest(self.act_next_timer)
		self.act_next_timer = nil
	end
end

function MainuiActivityHallCell:OnFlush()
	if not self.data or not next(self.data) then return end
	if self.act_next_timer then
		GlobalTimerQuest:CancelQuest(self.act_next_timer)
		self.act_next_timer = nil
	end
	if self.data.is_teshu then
		self.res:SetAsset(ResPath.GetMainUI(self.data.icon))
		self.name:SetAsset(ResPath.GetMainRandomActRes("randactivity_"..self.data.name))
		self.red:SetValue(false)
		self:ShowEff(ActivityData.SCROLL_CLICK_EFF[self.data.type or 0] == true)
		self.act_times:SetValue("")
	else
		-- fun_name存在表示是功能非活动
		local icon = ""
		local icon_name = ""
		if nil ~= self.data.fun_name then
			icon = self.data.icon
			icon_name = self.data.icon_name
			self.hide_acttime:SetValue(true)
		else
			self.hide_acttime:SetValue(false)
			local act_cfg = ActivityData.Instance:GetActivityConfig(self.data.type)
			if act_cfg then
				icon = act_cfg.icon
				icon_name = act_cfg.act_id
			end
			self:SetHuoDongActTime(self.data.type)
		end
		self:FlushActRedPointInCell()
		self.res:SetAsset(ResPath.GetMainUI(icon))
		self.name:SetAsset(ResPath.GetMainRandomActRes("randactivity_"..icon_name))
	end
end

function MainuiActivityHallCell:SetActive(value)
	self.show:SetValue(value)
	if self.data ~= nil and self.data.fun_name ~= ViewName.LongXingView then
		if not self.data.is_teshu then
			local act_time = self:GetActEndTime(self.data.type)
			if act_time <= 0 then
	  			self.show:SetValue(false)
			end
		end
	end
end

-- 红点刷新
function MainuiActivityHallCell:FlushActRedPointInCell()
	if not self.data.is_teshu then
		local act_red = ActivityData.Instance:GetActivityRedPointState(self.data.type)
		local act_num = ActivityData.Instance:GetActivityRedPointNum()
		self.red:SetValue(act_red)
		local show = MainuiActivityHallData.Instance:GetShowOnceEff(self.data.type)
		local bendi_day = UnityEngine.PlayerPrefs.GetInt("activity_hall_day" .. self.data.type)
		local cur_day = TimeCtrl.Instance:GetCurOpenServerDay()
		-- if cur_day ~= bendi_day then
		-- 	self:ShowEff(true)
		-- else
		-- 	self:ShowEff(ActivityData.SCROLL_CLICK_EFF[self.data.type or 0] == true)
		-- end
		self:ShowEff(ActivityData.SCROLL_CLICK_EFF[self.data.type or 0] == true)

		if act_num == 0 then
			-- 开启活动时，卷轴里面的活动默认显示红点
			self.red:SetValue(true)
			-- self:ShowEff(true)
		end
	end
end

function MainuiActivityHallCell:ShowEff(value)
	if self.eff:GetBoolean() ~= value then
		self.eff:SetValue(value)
	end
end

function MainuiActivityHallCell:OnButtonClick()
	-- ViewManager.Instance:Close(ViewName.ActivityHall)
	if nil ~= self.data.fun_name then
		ViewManager.Instance:Open(self.data.open_name)
	else
		self:OnActButtonClick()
	end
end

function MainuiActivityHallCell:OnActButtonClick()
	if not self.data.is_teshu then
		local act_cfg = ActivityData.Instance:GetActivityConfig(self.data.type)
		if act_cfg then

			if act_cfg.open_name == ViewName.KaifuActivityView then
				ViewManager.Instance:Open(act_cfg.open_name, act_cfg.act_id + 100000)
			else
				ViewManager.Instance:Open(act_cfg.open_name)
			end

			MainuiActivityHallData.Instance:SetShowOnceEff(self.data.type,false)
			ActivityData.SCROLL_CLICK_EFF[self.data.type] = false
			self:ShowEff(ActivityData.SCROLL_CLICK_EFF[self.data.type or 0] == true)

			local cur_day = TimeCtrl.Instance:GetCurOpenServerDay()
			if cur_day > -1 then
				UnityEngine.PlayerPrefs.SetInt("activity_hall_day" .. self.data.type, cur_day)
			end
		end
	else
		ViewManager.Instance:Open(self.data.view_name)
	end
end


-- 活动倒计时
function MainuiActivityHallCell:SetHuoDongActTime(act_type)
	self:FlushNextTime(act_type)
	if nil == self.act_next_timer then
		self.act_next_timer = GlobalTimerQuest:AddRunQuest(BindTool.Bind(self.FlushNextTime, self,act_type), 1)
	end
end

function MainuiActivityHallCell:FlushNextTime(act_type)
	local act_time = self:GetActEndTime(act_type)
	-- 如果大于10天
	if act_time >= (24 * 3600 * 10) then
		-- 00天00时
		self.act_times:SetValue(TimeUtil.FormatSecond2DHMS(act_time, TIME_FORMAT_TYPE.DAY_HOUR_HOLD_TWO))
	elseif act_time > (24 * 3600) then
		-- 求余
		local hour_time = act_time - math.floor(act_time / (24 * 3600)) * (24 * 3600)
        if hour_time >= (10 * 3600) then
        	-- 如果大于10小时
        	-- 0天00时
			self.act_times:SetValue(TimeUtil.FormatSecond2DHMS(act_time,TIME_FORMAT_TYPE.DAY_HOLD_TWO_HOUR))
    	else
    		-- 0天0时
			self.act_times:SetValue(TimeUtil.FormatSecond2DHMS(act_time,TIME_FORMAT_TYPE.DAY_HOUR))
    	end
	elseif act_time > 3600 then
  		self.act_times:SetValue(TimeUtil.FormatSecond2DHMS(act_time,TIME_FORMAT_TYPE.HOUR_MIN))
	else
		self.act_times:SetValue(TimeUtil.FormatSecond(act_time, 2))
	end
	if act_time <= 0 then
		if self.act_next_timer then
			GlobalTimerQuest:CancelQuest(self.act_next_timer)
			self.act_next_timer = nil
		end
		self.show:SetValue(false)
	end
end

--返回活动结束时间
function MainuiActivityHallCell:GetActEndTime(act_type)
	local act_info = ActivityData.Instance:GetActivityStatuByType(act_type)
	if act_info then
		local next_time = act_info.next_time
		local time = math.max(next_time - TimeCtrl.Instance:GetServerTime() , 0)
		if act_type == RA_OPEN_SERVER_ACTIVITY_TYPE.RAND_ACTIVITY_TYPE_SINGLE_CHARGE_2 then
			IncreaseCapabilityData.Instance:SetRestTime(time)
		end
		if act_type == RA_OPEN_SERVER_ACTIVITY_TYPE.RAND_ACTIVITY_TYPE_SINGLE_CHARGE_3 then
			IncreaseSuperiorData.Instance:SetRestTime(time)
		end
		if act_type == ACTIVITY_TYPE.RAND_ACTIVITY_LUCKYDRAW then
			LuckyDrawData.Instance:SetRestTime(time)
		end
		if act_type == ACTIVITY_TYPE.RAND_HAPPY_RECHARGE then
			HappyRechargeData.Instance:SetRestTime(time)
		end
		if act_type == ACTIVITY_TYPE.RAND_ACTIVITY_TYPE_TIME_LIMIT_GIFT then
			local open_flag = TimeLimitGiftData.Instance:GetTimeLimitGiftInfo().open_flag

			if 0 == open_flag then
				local limit_gift_info = ActivityData.Instance:GetActivityStatuByType(ACTIVITY_TYPE.RAND_ACTIVITY_TYPE_TIME_LIMIT_GIFT)
				ActivityData.Instance:SetActivityStatus(ACTIVITY_TYPE.RAND_ACTIVITY_TYPE_TIME_LIMIT_GIFT, ACTIVITY_STATUS.CLOSE,
					limit_gift_info.next_time,limit_gift_info.start_time,limit_gift_info.end_time,limit_gift_info.open_type)
			else
				-- local limit_gift_info = ActivityData.Instance:GetActivityStatuByType(ACTIVITY_TYPE.RAND_ACTIVITY_TYPE_TIME_LIMIT_GIFT)
				-- ActivityData.Instance:SetActivityStatus(ACTIVITY_TYPE.RAND_ACTIVITY_TYPE_TIME_LIMIT_GIFT, ACTIVITY_STATUS.OPEN,
				-- 	limit_gift_info.next_time,limit_gift_info.start_time,limit_gift_info.end_time,limit_gift_info.open_type)
				local data_time = TimeLimitGiftData.Instance:GetLimitGiftCfg().limit_time
				local begin_timestamp = TimeLimitGiftData.Instance:GetTimeLimitGiftInfo().begin_timestamp
				local end_time = begin_timestamp + data_time
				time = end_time - TimeCtrl.Instance:GetServerTime()
			end

		end

		if act_type == ACTIVITY_TYPE.RAND_ACTIVITY_TYPE_TIME_LIMIT_BIG_GIFT then
			local open_flag = TimeLimitBigGiftData.Instance:GetTimeLimitGiftInfo().open_flag

			if 0 == open_flag then
				local limit_gift_info =  ActivityData.Instance:GetActivityStatuByType(ACTIVITY_TYPE.RAND_ACTIVITY_TYPE_TIME_LIMIT_BIG_GIFT)
				ActivityData.Instance:SetActivityStatus(ACTIVITY_TYPE.RAND_ACTIVITY_TYPE_TIME_LIMIT_BIG_GIFT, ACTIVITY_STATUS.CLOSE,
					limit_gift_info.next_time,limit_gift_info.start_time,limit_gift_info.end_time,limit_gift_info.open_type)
			else
				local data_time = TimeLimitBigGiftData.Instance:GetLimitGiftCfg().limit_time
				local begin_timestamp = TimeLimitBigGiftData.Instance:GetTimeLimitGiftInfo().begin_timestamp
				local end_time = begin_timestamp + data_time
				time = end_time - TimeCtrl.Instance:GetServerTime()
			end
		end

 		return time
 	else
		if act_type == ACTIVITY_TYPE.KF_KUAFUCHONGZHI then
 			local time = 0
			local act_info = ActivityData.Instance:GetCrossRandActivityStatusByType(ACTIVITY_TYPE.KF_KUAFUCHONGZHI)
			if act_info then
				time = act_info.next_time - TimeCtrl.Instance:GetServerTime()
			end
			return time
		end
	end
	return 0
end