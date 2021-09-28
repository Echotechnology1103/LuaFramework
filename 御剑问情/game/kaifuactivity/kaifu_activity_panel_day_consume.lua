OpenActDayConsume =  OpenActDayConsume or BaseClass(BaseRender)

function OpenActDayConsume:__init()
	self.contain_cell_list = {}
end

function OpenActDayConsume:__delete()
	self.list_view = nil
	self.rest_time = nil
	self.contain_cell_list = nil
end

function OpenActDayConsume:OpenCallBack()
    self.list_view = self:FindObj("ListView")
	local list_delegate = self.list_view.list_simple_delegate
	list_delegate.NumberOfCellsDel = BindTool.Bind(self.GetNumberOfCells, self)
	list_delegate.CellRefreshDel = BindTool.Bind(self.RefreshCell, self)

	self.rest_time = self:FindVariable("rest_time")
	self.xiaofei_count = self:FindVariable("xiaofei_count")
	
	local info = KaifuActivityData.Instance:GetDailyTotalConsumeInfo()
	local  xiaofei_count =info.consume_gold or 0
	self.xiaofei_count:SetValue(xiaofei_count)

	if self.least_time_timer then
		CountDown.Instance:RemoveCountDown(self.least_time_timer)
        self.least_time_timer = nil
	end
	local rest_time, next_time = ActivityData.Instance:GetActivityResidueTime(RA_OPEN_SERVER_ACTIVITY_TYPE.RAND_ACTIVITY_TYPE_DAY_CONSUME)
	self:SetTime(0, rest_time)
	self.least_time_timer = CountDown.Instance:AddCountDown(rest_time, 1, BindTool.Bind(self.SetTime, self))

	self:ListenEvent("ClickReChange", BindTool.Bind(self.ClickReChange, self))
	self.reward_list = KaifuActivityData.Instance:GetOpenActDailyTotalConsumeReward()
end

function OpenActDayConsume:CloseCallBack()
	if self.least_time_timer then
        CountDown.Instance:RemoveCountDown(self.least_time_timer)
        self.least_time_timer = nil
    end
end

function OpenActDayConsume:ClickReChange()
	ViewManager.Instance:Open(ViewName.Shop, TabIndex.shop_youhui)
end

function OpenActDayConsume:OnFlush()
	self.reward_list = KaifuActivityData.Instance:GetOpenActDailyTotalConsumeReward()
	if self.list_view then
		self.list_view.scroller:ReloadData(0)
	end
	local info = KaifuActivityData.Instance:GetDailyTotalConsumeInfo()
	local  xiaofei_count =info.consume_gold or 0;
	self.xiaofei_count:SetValue(xiaofei_count)
end

function OpenActDayConsume:FlushTotalConsume()
	self:Flush()
end

function OpenActDayConsume:SetTime(elapse_time, total_time)
	local rest_time = math.floor(total_time - elapse_time)
	-- local time_tab = TimeUtil.Format2TableDHMS(rest_time)
	-- local temp = {}
	-- for k,v in pairs(time_tab) do
	-- 	if k ~= "day" then
	-- 		if v < 10 then
	-- 			v = tostring('0'..v)
	-- 		end
	-- 	end
	-- 	temp[k] = v
	-- end
	-- local  str
	-- if(temp.day>=1) then
	-- str = string.format(Language.Activity.ChongZhiRankRestTime, temp.day)
	-- else
	-- str = string.format(Language.Activity.ChongZhiRankRestTime2,temp.hour, temp.min,temp.s)	
 --    end

	--local str = string.format(Language.Activity.ChongZhiRankRestTime, temp.day, temp.hour, temp.min, temp.s)
	--str = TimeUtil.FormatSecond(rest_time,6)
	local time_str = ""
	local day_second = 24 * 60 * 60         -- 一天有多少秒
	local left_day = math.floor(rest_time / day_second)
	if left_day > 0 then
		time_str = TimeUtil.FormatSecond(rest_time, 7)
	elseif rest_time < day_second then
		if math.floor(rest_time / 3600) > 0 then
			time_str = TimeUtil.FormatSecond(rest_time, 1)
		else
			time_str = TimeUtil.FormatSecond(rest_time, 2)
		end
	end

	self.rest_time:SetValue(time_str)
end

function OpenActDayConsume:GetNumberOfCells()
	return #self.reward_list
end

function OpenActDayConsume:RefreshCell(cell, cell_index)
	local contain_cell = self.contain_cell_list[cell]
	if contain_cell == nil then
		contain_cell = OpenActDayConsumeCell.New(cell.gameObject, self)
		self.contain_cell_list[cell] = contain_cell
	end
	cell_index = cell_index + 1
	contain_cell:SetData(self.reward_list[cell_index])
	contain_cell:Flush()
end

----------------------------OpenActDayConsumeCell---------------------------------
OpenActDayConsumeCell = OpenActDayConsumeCell or BaseClass(BaseCell)

function OpenActDayConsumeCell:__init()
	self.data = {}
	self.total_value = self:FindVariable("total_value")
	self.cur_value = self:FindVariable("cur_value")
	self.show_interactable = self:FindVariable("show_interactable")
	self.show_text = self:FindVariable("show_text")
	self.total_consume_tip = self:FindVariable("total_consume_tip")
	self.can_lingqu = self:FindVariable("can_lingqu")
	self.color = self:FindVariable("color")
	self.is_show_red = self:FindVariable("show_red")
	self.item_cell_obj_list = {}
	self.item_cell_list = {}
	self:ListenEvent("OnClickGet", BindTool.Bind(self.OnClickGet, self))
	for i = 1, 4 do
		self.item_cell_obj_list[i] = self:FindObj("item_"..i)
		local item_cell = ItemCell.New()
		self.item_cell_list[i] = item_cell
		item_cell:SetInstanceParent(self.item_cell_obj_list[i])
	end
end

function OpenActDayConsumeCell:__delete()
	self.total_value = nil
	self.cur_value = nil
	self.show_text = nil
	self.show_interactable = nil
	self.total_consume_tip = nil
	self.can_lingqu = nil
	self.color = nil
	self.item_cell_obj_list = {}
	for k,v in pairs(self.item_cell_list) do
		v:DeleteMe()
	end
	self.item_cell_list = {}
end

function OpenActDayConsumeCell:SetData(data)
	self.data = data
end

function OpenActDayConsumeCell:OnFlush()
	local info = KaifuActivityData.Instance:GetDailyTotalConsumeInfo()
	local cur_value = info.consume_gold or 0
	local color = cur_value >= self.data.need_consume_gold and TEXT_COLOR.BLUE_SPECIAL or COLOR.RED
	self.color:SetValue(color)
	self.total_value:SetValue(self.data.need_consume_gold)
	self.cur_value:SetValue(cur_value)
	self.total_consume_tip:SetValue(string.format(Language.Activity.DayConsumeTip, self.data.need_consume_gold))
	local reward_list = ServerActivityData.Instance:GetCurrentRandActivityRewardCfg(self.data.reward_item, true)

	for i = 1, 4 do
		if reward_list[i] then
			self.item_cell_list[i]:SetData(reward_list[i])
			self.item_cell_obj_list[i]:SetActive(true)
		else
			self.item_cell_obj_list[i]:SetActive(false)
		end
	end

	local fetch_reward_flag = self.data.fetch_reward_flag == 1
	local str = fetch_reward_flag and Language.Common.YiLingQu or (cur_value >= self.data.need_consume_gold and Language.Common.LingQu or Language.Common.WEIDACHENG)
	self.show_text:SetValue(str)
	local result = not fetch_reward_flag and cur_value >= self.data.need_consume_gold
	self.show_interactable:SetValue(result)
	self.is_show_red:SetValue(result)
	self.can_lingqu:SetValue(result)
end

function OpenActDayConsumeCell:OnClickGet()
	KaifuActivityCtrl.Instance:SendRandActivityOperaReq(ACTIVITY_TYPE.RAND_DAY_CONSUME_GOLD, RA_SINGLE_CHONGZHI_OPERA_TYPE.RA_SINGLE_CHONGZHI_OPERA_TYPE_FETCH_REWARD, self.data.seq)
end