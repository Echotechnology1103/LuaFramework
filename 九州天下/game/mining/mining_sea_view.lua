MiningSeaView = MiningSeaView or BaseClass(BaseRender)

function MiningSeaView:__init(instance)
	self.view_type = MINING_VIEW_TYPE.SEA
	self.list_selected_index = 1
	self.list_show_line = 1
	self.list_max_line = 1
	self.list_can_reward = false
	self.mine_list = {}
	self.record_cell = {}
end

function MiningSeaView:LoadCallBack()
	self.text_mine_num = self:FindVariable("text_mine_num")
	self.text_go_num = self:FindVariable("text_go_num")
	self.btn_left_show = self:FindVariable("btn_left_show")
	self.btn_right_show = self:FindVariable("btn_right_show")
	self.btn_enter_show = self:FindVariable("btn_enter_show")
	self.btn_enter_text = self:FindVariable("btn_enter_text")
	self.btn_is_on_text = self:FindVariable("btn_is_on_text")
	self.is_red_show = self:FindVariable("is_red_show")
	self.is_red_record = self:FindVariable("is_red_record")

	self.text_tip = self:FindVariable("text_tip")
	self.text_tip:SetValue(Language.Mining.MiningSeaTip)

	for i = 0, 4 do
		self["mine_item_" .. i] = MiningSeaItem.New(self:FindObj("sea_ship_" .. i))
	end

	self:ListenEvent("EnterClick",BindTool.Bind(self.EnterClick, self))
	self:ListenEvent("OpenHelp",BindTool.Bind(self.OpenHelp, self))
	self:ListenEvent("BtnLeftClick", BindTool.Bind(self.BtnLeftClick, self))
	self:ListenEvent("BtnRightClick", BindTool.Bind(self.BtnRightClick, self))
	self:ListenEvent("OnClickRecord", BindTool.Bind(self.OnClickRecord, self))

	for i = 0, 4 do
		self:ListenEvent("OnClickSeaShipItem" .. i,BindTool.Bind(self.OnClickSeaShipItem, self, i))
	end

	self:InitRecordListView()
	self:Flush()
end

function MiningSeaView:__delete()
	self:CloseCallBack()
	for i = 0, 4 do
		if nil ~= self["mine_item_" .. i] then
			self["mine_item_" .. i]:RemoveCountDown()
			self["mine_item_" .. i]:DeleteMe()
			self["mine_item_" .. i] = nil
		end
	end
	for k, v in pairs(self.record_cell) do
		v:DeleteMe()
		v = nil 
	end
	self.text_tip = nil 
	self.text_mine_num = nil
	self.text_go_num = nil
	self.btn_left_show = nil 
	self.btn_right_show = nil 
	self.btn_enter_show = nil
	self.btn_enter_text = nil
	self.btn_is_on_text = nil
	self.list_selected_index = 1
	self.list_show_line = 1
	self.is_red_record = nil
	self.is_red_show = nil
	self.list_can_reward = false
end

function MiningSeaView:OpenCallBack()
	self:Flush()
	self:RemoveTimeQuest()
	if self.time_quest == nil then
		self.time_quest = GlobalTimerQuest:AddRunQuest(
			BindTool.Bind2(self.AddTimeQuest, self), 30)
	end
end

-- 移除启动红点定时器刷新红点
function MiningSeaView:RemoveTimeQuest()
	if self.time_quest then
		GlobalTimerQuest:CancelQuest(self.time_quest)
		self.time_quest = nil
	end
end

function MiningSeaView:AddTimeQuest()
	MiningController.Instance:SendCSFightingMiningReq(MINING_MINE_REQ_TYPE.REQ_TYPE_SEA_MINING_INFO)
end

function MiningSeaView:CloseCallBack()
	self:RemoveCountDown()
	self:RemoveTimeQuest()
end

function MiningSeaView:OnFlush()
	self:UpdataTimeText()
	self:UpdataMineList()
	self:UpdataBtnShow()
	self:UpdataRecordList()
	self:UpdataRecordRed()
end

function MiningSeaView:UpdataBtnShow()
	local info_data = MiningData.Instance:GetMiningSeaMyInfo()
	self:RemoveCountDown()

	local is_show_red = MiningData.Instance:GetMiningSeaRemindView()
	self.is_red_show:SetValue(is_show_red == 1)
	if info_data.mining_end_time > 0 then
		local time = math.max(info_data.mining_end_time - TimeCtrl.Instance:GetServerTime(), 0)
    	if time == 0 then
  			self.btn_enter_text:SetValue(Language.Mining.SeaBtnText[3])
   			self.btn_enter_show:SetValue(true)
   			self.list_can_reward = true
   			self.btn_is_on_text:SetValue("")
  		else
  			self:SetCountDown(time)
  			self.btn_enter_text:SetValue(Language.Mining.SeaBtnText[2])
   			self.btn_enter_show:SetValue(false)
   			self.list_can_reward = false
   		end
	else
		self.btn_enter_show:SetValue(true)
		self.btn_enter_text:SetValue(Language.Mining.SeaBtnText[1])
		self.btn_is_on_text:SetValue("")
		self.list_can_reward = false
	end
end

function MiningSeaView:SetCountDown(time)
	if not self.count_down then
		self.btn_is_on_text:SetValue("00:00")
		if time > 0 then
			self:DiffTime(0, time)
			self.count_down = CountDown.Instance:AddCountDown(time, 1, BindTool.Bind(self.DiffTime, self))
		end
	end
end

function MiningSeaView:DiffTime(elapse_time, total_time)
	local left_time = math.floor(total_time - elapse_time)
	local the_time_text = TimeUtil.FormatSecond2MS(left_time)
	self.btn_is_on_text:SetValue(the_time_text)
	if left_time <= 0 then
		MiningController.Instance:OpenSeaRewardView()
		self:RemoveCountDown()
	end
end

function MiningSeaView:RemoveCountDown()
	if self.count_down ~= nil then
		CountDown.Instance:RemoveCountDown(self.count_down)
		self.count_down = nil
		self.btn_is_on_text:SetValue("")
	end
end

function MiningSeaView:EnterClick()
	print("self.list_can_reward-->>",self.list_can_reward)
	if self.list_can_reward then
		MiningController.Instance:OpenSeaRewardView()
	else
		MiningController.Instance:OpenSeaSelectedView()
	end
end

function MiningSeaView:OpenHelp()
	local tips_id = 201
	TipsCtrl.Instance:ShowHelpTipView(tips_id)
end

function MiningSeaView:BtnLeftClick()
	self.list_show_line = (self.list_show_line - 1) > 0 and (self.list_show_line - 1) or 0
	self.list_selected_index = self:GetIndexByLine(self.list_show_line)
	self:UpdataMineListShow()
end

function MiningSeaView:BtnRightClick()
	self.list_show_line = (self.list_show_line + 1) <= self.list_max_line and (self.list_show_line + 1) or self.list_max_line
	self.list_selected_index = self:GetIndexByLine(self.list_show_line)
	self:UpdataMineListShow()
end

function MiningSeaView:OnClickRecord()
	MiningController.Instance:OpenMiningRecordListView(self.view_type)
end

function MiningSeaView:OnClickSeaShipItem(index)
	if self["mine_item_" .. index] ~= nil then
		local item_data = self["mine_item_" .. index]:GetItemData()
		if item_data ~= nil then
			if MiningData.Instance:GetIsMyMining(item_data.owner_uid) == false then
				MiningController.Instance:OpenMiningTargetView(self.view_type, MINING_TARGET_TYPE.QIANG_DUO, item_data)
				-- MiningController.Instance:SendCSFightingMiningReq(MINING_MINE_REQ_TYPE.REQ_TYPE_ROB_MINE, 0, item_data.owner_uid)
			end
		end
	end
end

function MiningSeaView:UpdataTimeText()
	if self.text_mine_num ~= nil then
		self.text_mine_num:SetValue(MiningData.Instance:GetMiningSeaDayTimes())
	end
	if self.text_go_num ~= nil then
		self.text_go_num:SetValue(MiningData.Instance:GetMiningSeaRobTimes())
	end
end

function MiningSeaView:UpdataMineList()
	self.mine_list, self.list_len = MiningData.Instance:GetMiningSeaList()

	self.list_max_line = self:GetLineByIndex(self.list_len)

	self:UpdataMineListShow()
end

function MiningSeaView:GetLineByIndex(index)
	if index == nil then
		return 0
	end
	return math.max(math.floor((index - 1) / 5), 0)
end

function MiningSeaView:GetIndexByLine(line)
	if line == nil then
		return 1
	end
	return (line * 5) + 1
end

function MiningSeaView:UpdataMineListShow()
	local now_line = self:GetLineByIndex(self.list_selected_index)
	self.list_show_line = now_line

	if self.list_show_line > self.list_max_line then
		self.list_show_line = self.list_max_line
		self.list_selected_index = self:GetIndexByLine(self.list_show_line)
	end

	self.btn_left_show:SetValue(self.list_show_line > 0)
	self.btn_right_show:SetValue((self.list_show_line ~= self.list_max_line) and self.list_len > 5)
	local now_show_line = self:GetIndexByLine(self.list_show_line)

	for i = 0, 4 do
		if self.mine_list[now_show_line + i] ~= nil then
			self["mine_item_" .. i]:SetActive(true)
			self["mine_item_" .. i]:SetItemData(self.mine_list[now_show_line + i])
		else
			self["mine_item_" .. i]:RemoveCountDown()
			self["mine_item_" .. i]:SetActive(false)
		end
	end
end

-------------------全服抽奖记录---------------------
function MiningSeaView:InitRecordListView()
	self.record_list_view = self:FindObj("record_list")
	local list_delegate = self.record_list_view.list_simple_delegate
	-- 有有多少个cell
	list_delegate.NumberOfCellsDel = BindTool.Bind(self.GetRecordInfoCount, self)
	-- 更新cell
	list_delegate.CellRefreshDel = BindTool.Bind(self.RecordRefreshCell, self)
end

function MiningSeaView:GetRecordInfoCount()
	return #MiningData.Instance:GetSeaRecordClientList() or 0
end

function MiningSeaView:RecordRefreshCell(cell, data_index)
	data_index = data_index + 1
	local record_cell = self.record_cell[cell]
	if record_cell == nil then
		record_cell = RecordListClientItem.New(cell.gameObject)
		record_cell.root_node.toggle.group = self.record_list_view.toggle_group
		self.record_cell[cell] = record_cell
	end
 	
	local record_cell_info = MiningData.Instance:GetSeaRecordClientList()
	if record_cell_info then
		local data = record_cell_info[data_index]
		record_cell:SetIndex(data_index)
		record_cell:SetData(data)
	end
end

function MiningSeaView:UpdataRecordList()
 	if self.record_list_view and self.record_list_view.scroller.isActiveAndEnabled then
		self.record_list_view.scroller:RefreshAndReloadActiveCellViews(true)
	end
end

function MiningSeaView:UpdataRecordRed()
 	self.is_red_record:SetValue(MiningData.Instance:GetFightingBeenRobSea())
end

-------------------------------------------矿物item
MiningSeaItem = MiningSeaItem or BaseClass(BaseRender)
function MiningSeaItem:__init()
	self.icon_time = self:FindVariable("icon_time")
	self.icon_name = self:FindVariable("icon_name")
	self.tip_show = self:FindVariable("tip_show")
	self.tip_show_text = self:FindVariable("tip_show_text")
	self.tip_show_bg = self:FindVariable("tip_show_bg")

	for i = 0, 3 do
		self["is_show_ship_" .. i] = self:FindVariable("is_show_ship_" .. i)
	end

	self.tip = self:FindObj("tip")
	self.item_data = nil
	self:Flush()
end

function MiningSeaItem:__delete()
	self:RemoveCountDown()
	self.tip = nil
	self.img_icon = nil
	self.icon_time = nil
	self.icon_name = nil
	self.tip_show = nil
	self.tip_show_text = nil
	self.tip_show_bg = nil
	self.item_data = nil
	for i = 0, 3 do
		self["is_show_ship_" .. i] = nil
	end
end

function MiningSeaItem:OnFlush()
	self:UpdataIconShow()
end

function MiningSeaItem:SetItemData(info_data)
	self.item_data = info_data
	self:UpdataIconShow()
end

function MiningSeaItem:GetItemData()
	return self.item_data
end

function MiningSeaItem:UpdataIconShow()
	if self.item_data ~= nil then
		self:RemoveCountDown()
		local time = math.max(self.item_data.mining_end_time - TimeCtrl.Instance:GetServerTime(), 0)
		if time > 0 then
			self:SetCountDown(time)
		end

		self.icon_time:SetValue(self.item_data.index)

		local name = self.item_data.owner_name
		if MiningData.Instance:GetIsMyMining(self.item_data.owner_uid) == true then
			local info_data = MiningData.Instance:GetMiningSeaCfg(self.item_data.cur_type)

			local item_name = ""
			if info_data ~= nil then
				item_name = info_data.name 
			end
			name = string.format(Language.Mining.ItemName, item_name)
			
	    elseif self.item_data.random_index >= 0 and self.item_data.owner_uid == 0 then
	        name = MiningData.Instance:GetRandomNameByRandNum(self.item_data.random_index)
	    end

		self.icon_name:SetValue(name)

		for i = 0, 3 do
			self["is_show_ship_" .. i]:SetValue(i == self.item_data.cur_type)
		end

		self.tip_show:SetValue(MiningData.Instance:GetIsMyMining(self.item_data.owner_uid) == false)
		-- self.tip_show:SetValue(false)
		-- self.tip_show_text:SetValue(false)
		-- self.tip_show_bg:SetAsset(ResPath.GetMiningRes("mining_tip_1"))
	end
end

function MiningSeaItem:SetCountDown(time)
	if not self.count_down then
		if time > 0 then
			self:DiffTime(0, time)
			self.count_down = CountDown.Instance:AddCountDown(time, 1, BindTool.Bind(self.DiffTime, self))
		end
	end
end

function MiningSeaItem:DiffTime(elapse_time, total_time)
	local left_time = math.floor(total_time - elapse_time)
	local the_time_text = TimeUtil.FormatSecond2MS(left_time)
	self.icon_time:SetValue(the_time_text)
	if left_time <= 0 then
		self:RemoveCountDown()
		self.icon_time:SetValue("")
	end
end

function MiningSeaItem:RemoveCountDown()
	if self.count_down ~= nil then
		CountDown.Instance:RemoveCountDown(self.count_down)
		self.count_down = nil
	end
end