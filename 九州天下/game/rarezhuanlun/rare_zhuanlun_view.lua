RareDialView = RareDialView or BaseClass(BaseView)

function RareDialView:__init()
	self.full_screen = false-- 是否是全屏界面
	self.ui_config = {"uis/views/zhenxizhuanlun", "RareDialView"}
	self.play_audio = true
	self:SetMaskBg()
end

function RareDialView:LoadCallBack()
	self.is_cancel = false
	self.data = RareDialData.Instance
	local open_day = TimeCtrl.Instance:GetCurOpenServerDay()
	self.rare_data = self.data:GetDrawDataRareByOpenDay(open_day)
	self.return_data = self.data:GetDrawReturnDataByOpenDay(open_day)
	self.total_time = self.data:GetDrawDataMaxNumber()

	self:ListenEvent("Close", BindTool.Bind(self.CloseView, self))
	self:ListenEvent("ClickDraw", BindTool.Bind(self.ClickDraw, self))
	self:ListenEvent("ClickFlush", BindTool.Bind(self.ClickFlush, self))
	self:ListenEvent("ClickWare", BindTool.Bind(self.ClickWare, self))
	self:ListenEvent("ClickCancle", BindTool.Bind(self.ClickCancel, self))
	self:ListenEvent("ClickQuestion", BindTool.Bind(self.ClickQuestion, self))

	self.left_cell_list = {}
	self.left_list = self:FindObj("LeftList")
	self.left_list_view_delegate = self.left_list.list_simple_delegate
	
	self.right_cell_list = {}
	self.right_list = self:FindObj("RightList")
	self.right_list_view_delegate = self.right_list.list_simple_delegate

	self.cell_list = {}
	for i = 1, GameEnum.RA_EXTREME_LUCKY_REWARD_COUNT do
		self.cell_list[i] = DrawItem.New(self:FindObj("Item" .. i))
	end

	self.current_time_value = self:FindVariable("CurrentTime")
	self.total_time_value = self:FindVariable("TotalTime")
	self.draw_spend_value = self:FindVariable("DrawSpend")
	self.flush_spend_value = self:FindVariable("FlushSpend")
	self.nest_time_value = self:FindVariable("NestTime")
	self.leiji_times_value = self:FindVariable("LeijiTimes")
	self.in_anim_value = self:FindVariable("InAnim")
	self.show_free_value = self:FindVariable("ShowFree")
	self.free_times_value = self:FindVariable("FreeTimes")
	self.end_time_value = self:FindVariable("EndTime")

	self.select_effect = self:FindObj("SelectEffect")

	self.right_list_view_delegate.NumberOfCellsDel = BindTool.Bind(self.GetRightListNumberOfCells, self)
	self.right_list_view_delegate.CellRefreshDel = BindTool.Bind(self.RefreshRightListView, self)
	self.left_list_view_delegate.NumberOfCellsDel = BindTool.Bind(self.GetLeftListNumberOfCells, self)
	self.left_list_view_delegate.CellRefreshDel = BindTool.Bind(self.RefreshLeftListView, self)

	self.money_bar = MoneyBar.New()
	self.money_bar:SetInstanceParent(self:FindObj("MoneyBar"))
end

function RareDialView:ReleaseCallBack()
	self.left_list = nil
	self.left_list_view_delegate = nil
	self.right_list_view_delegate = nil
	self.right_list = nil
	self.rare_data = nil
	self.data = nil
	self.in_anim_value = nil
	self.end_time_value = nil
	
	self.current_time_value = nil
	self.total_time_value = nil
	self.draw_spend_value = nil
	self.flush_spend_value = nil
	self.nest_time_value = nil

	self.corrent_time = nil
	self.total_time = nil
	self.draw_spend = nil
	self.flush_spend = nil
	self.nest_time = nil
	self.nest_time = nil
	self.leiji_times_value = nil
	self.select_effect = nil
	self.show_free_value = nil
	self.free_times_value = nil

	self.tweener1 = nil
	self.tweener2 = nil

	for k, v in pairs(self.left_cell_list) do
		if v then
			v:DeleteMe()
		end
	end
	self.left_cell_list = nil 
	for k, v in pairs(self.right_cell_list) do
		if v then
			v:DeleteMe()
		end
	end
	self.right_cell_list = nil

	for k, v in pairs(self.cell_list) do
		if v then
			v:DeleteMe()
		end
	end
	self.cell_list = nil

	if self.count then
		CountDown.Instance:RemoveCountDown(self.count)
		self.count = nil
	end
	if self.count1 then
		CountDown.Instance:RemoveCountDown(self.count1)
		self.count1 = nil
	end

	if self.money_bar then
		self.money_bar:DeleteMe()
		self.money_bar = nil
	end
end


function RareDialView:OpenCallBack()
	RareDialCtrl.Instance:SendInfo(RA_EXTREME_LUCKY_OPERA_TYPE.RA_EXTREME_LUCKY_OPERA_TYPE_QUERY_INFO)
	self.in_anim_value:SetValue(false)
	self.select_effect.gameObject:SetActive(false)
	self:InitData()
end

function RareDialView:CloseCallBack()
	if nil ~= self.rotate_timer then
		GlobalTimerQuest:CancelQuest(self.rotate_timer)
	end
end

function RareDialView:OnFlush(type)
	self:InitData(type)
	-- self.left_list.scroller:RefreshAndReloadActiveCellViews(true)
	-- self.right_list.scroller:RefreshAndReloadActiveCellViews(true)
end

function RareDialView:CloseView()
	self:Close()
end

function RareDialView:ClickDraw() 
	RareDialCtrl.Instance:SendInfo(RA_EXTREME_LUCKY_OPERA_TYPE.RA_EXTREME_LUCKY_OPERA_TYPE_DRAW)
end

function RareDialView:ClickFlush()
	local flush_spend = self.flush_spend
	local data = self.data:GetItemInfoList()

	local have_not_get = false
	for k, v in pairs(data) do
		local reward_data = RareDialData.Instance:GetRewardBySeq(v.seq)
		if reward_data.is_rare == 1 then
			have_not_get = true
			break
		end
	end

	if have_not_get then
		local str = string.format(Language.RareZhuanLun.ContinueFlush, flush_spend)
		TipsCtrl.Instance:ShowCommonAutoView("rare_flush_spend", str, function ()
			RareDialCtrl.Instance:SendInfo(RA_EXTREME_LUCKY_OPERA_TYPE.RA_EXTREME_LUCKY_OPERA_TYPE_FLUSH)
		end)
	else
		local str = string.format(Language.RareZhuanLun.FlushSpend, flush_spend)
		TipsCtrl.Instance:ShowCommonAutoView("rare_flush_spend", str, function ()
			RareDialCtrl.Instance:SendInfo(RA_EXTREME_LUCKY_OPERA_TYPE.RA_EXTREME_LUCKY_OPERA_TYPE_FLUSH)
		end)
	end
	
end

function RareDialView:ClickQuestion()
	local tips_id = 222
	TipsCtrl.Instance:ShowHelpTipView(tips_id)
end


function RareDialView:ClickWare()
	ViewManager.Instance:Open(ViewName.Treasure, TabIndex.treasure_warehouse)
end

function RareDialView:ClickCancel()
	self.is_cancel = not self.is_cancel
end

function RareDialView:GetLeftListNumberOfCells()
	return #self.rare_data
end

function RareDialView:RefreshLeftListView(cell, data_index)
	local left_cell = self.left_cell_list[cell]
	if left_cell == nil then
		left_cell = RareRewardItem.New(cell.gameObject)
		self.left_cell_list[cell] = left_cell
	end
	self.left_cell_list[cell]:SetData(self.rare_data[data_index + 1])
end

function RareDialView:GetRightListNumberOfCells()
	return #self.return_data
end

function RareDialView:RefreshRightListView(cell, data_index)
	local right_cell = self.right_cell_list[cell]
	if right_cell == nil then
		right_cell = RareAwardItem.New(cell.gameObject)
		self.right_cell_list[cell] = right_cell
	end
	self.right_cell_list[cell]:SetIndex(data_index)
	self.right_cell_list[cell]:SetData(self.return_data[data_index + 1])

end

function RareDialView:InitData(type)
	self:ConstructData()
end

function RareDialView:ConstructData()
	self.corrent_time = self.data:GetCurrentTimes() 
	self.gold_time = self.data:GetGoldTimes()
	self.draw_spend = self.data:GetDrawSpend(self.gold_time)
	self.flush_spend = self.data:GetFlushSpend()
	self.nest_time_num = self.data:GetNextTime() - TimeCtrl.Instance:GetServerTime()
	self.leiji_times = self.data:GetToTalTimes()
	self.free_times = self.data:GetFreeTimes()
	local now_time = TimeCtrl.Instance:GetServerTime()
	self.end_time = ActivityData.Instance:GetActivityStatus()[ACTIVITY_TYPE.RAND_ACTIVITY_SUPER_LUCKY_STAR].end_time - now_time
	self:SetDataView()
end 

function RareDialView:SetDataView()
	self.current_time_value:SetValue(self.corrent_time)
	self.total_time_value:SetValue(self.total_time)
	self.draw_spend_value:SetValue(self.draw_spend)
	self.flush_spend_value:SetValue(self.flush_spend)
	self.free_times_value:SetValue(self.free_times)
	if self.count == nil then
		self.count = CountDown.Instance:AddCountDown(self.nest_time_num, 1, BindTool.Bind(self.FlushTimeView, self))
	else
		CountDown.Instance:RemoveCountDown(self.count)
		self.count = CountDown.Instance:AddCountDown(self.nest_time_num, 1, BindTool.Bind(self.FlushTimeView, self))
	end
	self.leiji_times_value:SetValue(self.leiji_times)
	local data = self.data:GetItemInfoList()
	for k, v in pairs(self.cell_list) do
		v:SetData(data[k])
	end
	if self.total_time ~= nil and self.total_time == self.data:GetCurrentTimes() then
		self.in_anim_value:SetValue(true)
		GlobalTimerQuest:AddDelayTimer(function ()
			RareDialCtrl.Instance:SendInfo(RA_EXTREME_LUCKY_OPERA_TYPE.RA_EXTREME_LUCKY_OPERA_TYPE_NEXT_FLUSH)
			self.in_anim_value:SetValue(false)
		end, 1)
	end
	if self.count1 then
		CountDown.Instance:RemoveCountDown(self.count1)
	end
	self.count1 = nil
	self.count1 = CountDown.Instance:AddCountDown(self.end_time, 1, function ()
		self.end_time = self.end_time - 1
		local end_time = TimeUtil.FormatSecond2DHMS(self.end_time - 1, 1)
		self.end_time_value:SetValue(end_time)
	end)
	for k, v in pairs(self.right_cell_list) do
		v:SetData(self.return_data[v.index + 1])
	end
	self:ShowDataView()
	
end

function RareDialView:FlushTimeView()
	self.nest_time_num = self.nest_time_num - 1
	self.nest_time_time = TimeUtil.FormatSecond(self.nest_time_num - 1)
	self.nest_time_value:SetValue(self.nest_time_time)
end

function RareDialView:ShowDataView()
	self.show_free_value:SetValue(self.free_times > 0)
end

function RareDialView:FlushItem()
	for i = 1, 10 do
		-- if self.tweener1 then
		-- self.tweener1:Pause()
		-- end
		self.cell_list[i].root_node.rect:SetLocalScale(1, 1, 1)
		local target_scale = Vector3(0, 1, 1)
		local target_scale2 = Vector3(1, 1, 1)
		self.tweener1 = self.cell_list[i].root_node.rect:DOScale(target_scale, 0.5)

		local func2 = function()
			self.tweener2 = self.cell_list[i].root_node.rect:DOScale(target_scale2, 0.5)
		end
		self.delay_timer2 = GlobalTimerQuest:AddDelayTimer(func2, 0.5)

	end
	-- local func = function()
	-- self:ResetItemGrid()
	-- end
	-- self.delay_timer = GlobalTimerQuest:AddDelayTimer(func, 0.5)
end

function RareDialView:FlushRightCell()
	self.right_list.scroller:RefreshAndReloadActiveCellViews(true)
end

function RareDialView:FlushAnimation()
	self.select_effect.gameObject:SetActive(true)
	local index = self.now_index or 1
	local speed_index = index
	local result_index = self.data:GetResultIndex()
	if self.is_cancel then
		if nil == self.cell_list[result_index] then return end
		local posx = self.cell_list[result_index].root_node.transform.position.x
		local posy = self.cell_list[result_index].root_node.transform.position.y
		local posz = self.cell_list[result_index].root_node.transform.position.z
		self.select_effect.transform.position = Vector3(posx, posy, posz)
		self.now_index = result_index
		-- if SuperLuckyStarData.Instance:ChcekIsNeedSendNextFlush() then
		-- SuperLuckyStarCtrl.Instance:SendMineReq(RA_EXTREME_LUCKY_OPERA_TYPE.RA_EXTREME_LUCKY_OPERA_TYPE_NEXT_FLUSH)
		-- end

		if nil ~= self.rotate_timer then
			GlobalTimerQuest:CancelQuest(self.rotate_timer)
		end
		self:InitData()
		-- self.select_effect.gameObject:SetActive(false)
		return
	else
		local loop_num = GameMath.Rand(2, 3)
		self.move_motion = function ()
			local quest = self.rotate_timer
			local quest_list = GlobalTimerQuest:GetRunQuest(quest)
			if nil == quest or nil == quest_list then return end
			if index == (loop_num * 10) + result_index then
				if nil == self.cell_list[result_index] then return end
				local posx = self.cell_list[result_index].root_node.transform.position.x
				local posy = self.cell_list[result_index].root_node.transform.position.y
				local posz = self.cell_list[result_index].root_node.transform.position.z
				self.select_effect.transform.position = Vector3(posx, posy, posz)
				self.now_index = result_index

				if nil ~= self.rotate_timer then
					GlobalTimerQuest:CancelQuest(self.rotate_timer)
					self.in_anim_value:SetValue(false)
					-- self.select_effect.gameObject:SetActive(false)
					self:InitData()
				end
				return
			else
				local read_index = ((index + 1) == 10 and 10) or ((index + 1) % 10 == 0 and 10) or ((index + 1) % 10)
				local posx = self.cell_list[read_index].root_node.transform.position.x
				local posy = self.cell_list[read_index].root_node.transform.position.y
				local posz = self.cell_list[read_index].root_node.transform.position.z
				self.select_effect.transform.position = Vector3(posx, posy, posz)
				-- 速度限制
				if index < speed_index + 3 then
					quest_list[2] = 0.25 -- 0.1 0.25 0.1 0.08
				elseif speed_index + 3 <= index and index <= speed_index + 6 then
					quest_list[2] = 0.1
				elseif index > ((loop_num * 10) + result_index) - 5 then
					quest_list[2] = 0.2
					if index > ((loop_num * 10) + result_index) - 2 then
						quest_list[2] = 0.3
					end
				else
					quest_list[2] = 0.08
				end
				index = index + 1
			end
		end

		if nil ~= self.rotate_timer then
			GlobalTimerQuest:CancelQuest(self.rotate_timer)
		end
		self.rotate_timer = GlobalTimerQuest:AddRunQuest(self.move_motion, 0.1)
		self.in_anim_value:SetValue(true)
	end
end

----------------------------------RareRewardItem-------------------------------------
RareRewardItem = RareRewardItem or BaseClass(BaseRender)

function RareRewardItem:__init()
	self.item = self:FindObj("Item")
	self.item_cell = ItemCell.New()
	self.item_cell:SetInstanceParent(self.item)
end

function RareRewardItem:__delete()
	if self.item_cell then
		self.item_cell:DeleteMe()
	end
end

function RareRewardItem:SetData(data)
	if not data then return end
	self.item_cell:SetData(data.reward_item)
	-- self.item_cell:ShowSpecialEffect(true)
	-- local bunble, asset = ResPath.GetItemActivityEffect()
	-- self.item_cell:SetSpecialEffect(bunble, asset)
	self.item_cell:SetActivityEffect(false)
end

----------------------------------RareAwardItem-------------------------------------
RareAwardItem = RareAwardItem or BaseClass(BaseRender)

function RareAwardItem:__init()
	self.item = self:FindObj("Item")
	self.times = self:FindVariable("Times")
	self.item_cell = ItemCell.New()
	self.item_cell:SetInstanceParent(self.item)
	self.have_got = self:FindVariable("HaveGot")
	self.show_eff = self:FindVariable("ShowEff")
	self.show_red = self:FindVariable("showRed")
end

function RareAwardItem:__delete()
	if self.item_cell then
		self.item_cell:DeleteMe()
	end
end

function RareAwardItem:SetIndex(data_index)
	self.index = data_index
end

function RareAwardItem:SetData(data)
	if not data then return end
	self.times:SetValue(string.format(Language.RareZhuanLun.FlushText, data.draw_times))
	local can_get = RareDialData.Instance:GetToTalTimes() >= data.draw_times
	self.show_eff:SetValue(false)
	if RareDialData.Instance:GetFetchInfo(data.seq) == 1 then
		self.show_red:SetValue(false)
		self.have_got:SetValue(true)
	else
		self.show_red:SetValue(can_get)
		self.have_got:SetValue(false)
		local click_func = nil
		if can_get then
			click_func = function()
				self.item_cell:SetHighLight(false)
				RareDialCtrl.Instance:SendInfo(RA_EXTREME_LUCKY_OPERA_TYPE.RA_EXTREME_LUCKY_OPREA_TYPE_FETCH_REWARD, data.seq)
				RareDialCtrl.Instance:FetchAward()
				AudioService.Instance:PlayRewardAudio()
			end
		else
			click_func = function()
				TipsCtrl.Instance:OpenItem(data.reward_item)
				self.item_cell:SetHighLight(false)
			end
		end
		self.item_cell:ListenClick(click_func)
	end
	self:ShowData(can_get and RareDialData.Instance:GetFetchInfo(data.seq) ~= 1)
	self.item_cell:SetData(data.reward_item)
end

function RareAwardItem:ShowData(is_show)
	if self.item_cell and is_show then
		self.item_cell:IsDestroyEffect(true)
		self.show_eff:SetValue(true)
	end
end

------------------------------DrawItem-------------------------------
DrawItem = DrawItem or BaseClass(BaseRender)

function DrawItem:__init()
	self.item_name = self:FindVariable("item_name")
	self.show_get = self:FindVariable("show_get")

	self.item = self:FindObj("Item")
	self.item_cell = ItemCell.New()
	self.item_cell:SetInstanceParent(self.item)
end

function DrawItem:__delete()
	if self.item_cell then
		self.item_cell:DeleteMe()
	end
end

function DrawItem:SetData(data)
	self.data = data
	self:Flush()
end

function DrawItem:OnFlush()
	local data = self.data
	if not data then return end
	local reward_data = RareDialData.Instance:GetRewardBySeq(data.seq)
	if not reward_data then return end
	local name = ItemData.Instance:GetItemName(reward_data.reward_item.item_id)
	self.item_cell:SetData(reward_data.reward_item)
	if reward_data.is_rare == 1 then
		self.item_cell:SetActivityEffect(false)
		-- local bunble, asset = ResPath.GetItemActivityEffect()
		-- self.item_cell:SetSpecialEffect(bunble, asset)
	else
		self.item_cell:SetActivityEffect(true)
	end
	self.item_name:SetValue(name)
	if tonumber(data.has_fetch) == 0 then
		self:ShowGet(false)
	else 
		self:ShowGet(true)
	end
end

function DrawItem:ShowGet(enable)
	self.show_get:SetValue(enable)
end