KaifuActivityRechargeRebate =  KaifuActivityRechargeRebate or BaseClass(BaseRender)

function KaifuActivityRechargeRebate:__init()
	self.contain_cell_list = {}
end

function KaifuActivityRechargeRebate:__delete()
	self.list_view = nil
	self.rest_time = nil
	self.contain_cell_list = nil
end

function KaifuActivityRechargeRebate:OpenCallBack()
    self.list_view = self:FindObj("ListView")
	local list_delegate = self.list_view.list_simple_delegate
	list_delegate.NumberOfCellsDel = BindTool.Bind(self.GetNumberOfCells, self)
	list_delegate.CellRefreshDel = BindTool.Bind(self.RefreshCell, self)

	self.rest_time = self:FindVariable("rest_time")
	self.xiaofei_count = self:FindVariable("xiaofei_count")
	
	if self.least_time_timer then
		CountDown.Instance:RemoveCountDown(self.least_time_timer)
        self.least_time_timer = nil
	end
	local rest_time, next_time = ActivityData.Instance:GetActivityResidueTime(RA_OPEN_SERVER_ACTIVITY_TYPE.RAND_DAY_CHONGZHI_FANLI)
	self:SetTime(0, rest_time)
	self.least_time_timer = CountDown.Instance:AddCountDown(rest_time, 1, BindTool.Bind(self.SetTime, self))

	self:ListenEvent("ClickReChange", BindTool.Bind(self.ClickReChange, self))
	self.reward_list = KaifuActivityData.Instance:GetKaifuActivityRechargeRebateReward()
	KaifuActivityCtrl.Instance:SendRandActivityOperaReq(ACTIVITY_TYPE.RAND_DAY_CHONGZHI_FANLI, RA_SINGLE_CHONGZHI_OPERA_TYPE.RA_SINGLE_CHONGZHI_OPERA_TYPE_INFO, 0)
end

function KaifuActivityRechargeRebate:CloseCallBack()
	if self.least_time_timer then
        CountDown.Instance:RemoveCountDown(self.least_time_timer)
        self.least_time_timer = nil
    end
end

function KaifuActivityRechargeRebate:ClickReChange()
	VipData.Instance:SetOpenType(OPEN_VIP_RECHARGE_TYPE.RECHANRGE)
	ViewManager.Instance:Open(ViewName.VipView)
end

function KaifuActivityRechargeRebate:OnFlush()
	self.reward_list = KaifuActivityData.Instance:GetKaifuActivityRechargeRebateReward()
	if self.list_view then
		self.list_view.scroller:ReloadData(0)
	end
	local info = KaifuActivityData.Instance:GetRARechargeRebateInfo()
	if self.xiaofei_count then
		self.xiaofei_count:SetValue(info.chongzhi_gold or 0)
	end
end

function KaifuActivityRechargeRebate:FlushTotalConsume()
	self:Flush()
end

function KaifuActivityRechargeRebate:SetTime(elapse_time, total_time)
	local rest_time = math.floor(total_time - elapse_time)
	local time_tab = TimeUtil.Format2TableDHMS(rest_time)
	local time_str = ""
	local left_day = math.floor(rest_time / 86400)
	if left_day > 0 then
		time_str = TimeUtil.FormatSecond(rest_time, 8)
	else
		time_str = TimeUtil.FormatSecond(rest_time)
	end
	self.rest_time:SetValue(time_str)
end

function KaifuActivityRechargeRebate:GetNumberOfCells()
	return #self.reward_list
end

function KaifuActivityRechargeRebate:RefreshCell(cell, cell_index)
	local contain_cell = self.contain_cell_list[cell]
	if contain_cell == nil then
		contain_cell = KaifuActivityRechargeRebateCell.New(cell.gameObject, self)
		self.contain_cell_list[cell] = contain_cell
	end

	cell_index = cell_index + 1
	contain_cell:SetData(self.reward_list[cell_index])
	contain_cell:Flush()
end

----------------------------KaifuActivityRechargeRebateCell---------------------------------
KaifuActivityRechargeRebateCell = KaifuActivityRechargeRebateCell or BaseClass(BaseCell)

function KaifuActivityRechargeRebateCell:__init()
	self.data = {}
	self.total_value = self:FindVariable("total_value")
	self.cur_value = self:FindVariable("cur_value")
	self.show_interactable = self:FindVariable("show_interactable")
	self.show_text = self:FindVariable("show_text")
	self.can_lingqu = self:FindVariable("can_lingqu")
	self.color = self:FindVariable("color")
	self.is_get = self:FindVariable("is_get")
	self.is_gray = self:FindVariable("is_gray")
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

function KaifuActivityRechargeRebateCell:__delete()
	self.total_value = nil
	self.cur_value = nil
	self.show_text = nil
	self.show_interactable = nil
	self.can_lingqu = nil
	self.color = nil
	self.is_get = nil
	self.item_cell_obj_list = {}
	for k,v in pairs(self.item_cell_list) do
		v:DeleteMe()
	end
	self.item_cell_list = {}
end

function KaifuActivityRechargeRebateCell:SetData(data)
	self.data = data
end

function KaifuActivityRechargeRebateCell:OnFlush()
	local info = KaifuActivityData.Instance:GetRARechargeRebateInfo()
	local cur_value = info.chongzhi_gold or 0
	local color = cur_value >= self.data.need_gold and COLOR.BLUE_4 or COLOR.RED
	self.color:SetValue(color)
	self.total_value:SetValue(self.data.need_gold)
	self.cur_value:SetValue(cur_value)
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
	local str = fetch_reward_flag and Language.Common.YiLingQu or (cur_value >= self.data.need_gold and Language.Common.LingQu or Language.Common.WEIDACHENG)
	self.show_text:SetValue(str)
	self.show_interactable:SetValue(not fetch_reward_flag and cur_value >= self.data.need_gold)
	self.can_lingqu:SetValue(not fetch_reward_flag and cur_value >= self.data.need_gold)
	self.is_get:SetValue(fetch_reward_flag)
	self.is_gray:SetValue(cur_value >= self.data.need_gold)
end

function KaifuActivityRechargeRebateCell:OnClickGet()
	KaifuActivityCtrl.Instance:SendRandActivityOperaReq(ACTIVITY_TYPE.RAND_DAY_CHONGZHI_FANLI, RA_SINGLE_CHONGZHI_OPERA_TYPE.RA_SINGLE_CHONGZHI_OPERA_TYPE_FETCH_REWARD, self.data.seq)
end