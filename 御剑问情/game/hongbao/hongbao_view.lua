HongBaoView = HongBaoView or BaseClass(BaseView)

function HongBaoView:__init()
	self.ui_config = {"uis/views/tips/hongbaotips_prefab","HongBaoView"}
	self.play_audio = true
	self.hongbao_type = RED_PAPER_TYPE.RED_PAPER_TYPE_COMMON
end

function HongBaoView:__delete()

end

function HongBaoView:ReleaseCallBack()
	for k,v in pairs(self.panel3_cell_list) do
		v:DeleteMe()
	end
	self.panel3_cell_list = {}
	for k,v in pairs(self.panel4_cell_list) do
		v:DeleteMe()
	end
	self.panel4_cell_list = {}
	self.panel3_list = nil
	self.panel4_list = nil

	-- 清理变量和对象
	self.total_input = nil
	self.count_input = nil
	self.panel1 = nil
	self.panel2 = nil
	self.panel3 = nil
	self.panel4 = nil
	self.panel4 = nil
	self.panel3_avatar = nil
	self.panel4_avatar = nil
	self.total = nil
	self.money_text = nil
	self.money_name_text = nil
	self.from_name = nil
	self.can_send_gold = nil
	self.show_sure_btn = nil
	self.show_next_btn = nil
	self.is_normal = nil
	self.portrait = nil
	self.def_avatar = nil
end

function HongBaoView:CloseCallBack()

end

function HongBaoView:LoadCallBack()
	-- 查找组件
	self.total_input = self:FindObj("TotalInput")			--总额数
	self.count_input = self:FindObj("CountInput")			--红包个数
	self.panel1 = self:FindObj("Panel1")					--发送红包界面
	self.panel2 = self:FindObj("Panel2")					--红包金额界面
	self.panel3 = self:FindObj("Panel3")					--成功抢到界面
	self.panel4 = self:FindObj("Panel4")					--失败界面
	self.panel4 = self:FindObj("Panel4")					--失败界面
	self.panel3_avatar = self:FindObj("Panel3Avatar")
	self.panel4_avatar = self:FindObj("Panel4Avatar")
	self.def_avatar = self:FindObj("DefAvatar")

	-- 查找变量
	self.total = self:FindVariable("Total")					--总额/单个红包金额
	self.money_text = self:FindVariable("MoneyText")		--获得的钻石数
	self.money_name_text = self:FindVariable("MoneyString")	--钻石绑钻
	self.from_name = self:FindVariable("FromName")			--发送者名字
	self.can_send_gold = self:FindVariable("CanSendGold")	--可发送钻石数

	self.show_sure_btn = self:FindVariable("ShowSureBtn")	--是否显示确定btn
	self.show_next_btn = self:FindVariable("ShowNextBtn")	--是否显示下一个btn
	self.is_normal = self:FindVariable("IsNurmal")
	self.portrait = self:FindVariable("Portrait")

	-- 监听
	self:ListenEvent("OnClickLuck", BindTool.Bind(self.OnClickLuck, self))
	self:ListenEvent("OnClickNormal", BindTool.Bind(self.OnClickNormal, self))
	self:ListenEvent("OnClickSend", BindTool.Bind(self.OnClickSend, self))
	self:ListenEvent("OnClickClose", BindTool.Bind(self.OnClickClose, self))
	-- self:ListenEvent("TotalValueChange", BindTool.Bind(self.TotalValueChange, self))
	-- self:ListenEvent("CountValueChange", BindTool.Bind(self.CountValueChange, self))
	self:ListenEvent("NextBtnClick", BindTool.Bind(self.NextBtnClick, self))
	self:ListenEvent("OnClickSingleGold", BindTool.Bind(self.OnClickSingleGold, self))
	self:ListenEvent("OnClickCount", BindTool.Bind(self.OnClickCount, self))

	-- self:ListenEvent("OnClickGet", BindTool.Bind(self.OnClickGet, self))
	self.panel3_cell_list = {}
	self.panel4_cell_list = {}
end


function HongBaoView:CreateLogList(is_suc)
	local list = nil
	local cell_list = nil
	if is_suc then
		self.panel3_list = self:FindObj("Panel3List")
		list = self.panel3_list
		cell_list = self.panel3_cell_list
	else
		self.panel4_list = self:FindObj("Panel4List")
		list = self.panel4_list
		cell_list = self.panel4_cell_list
	end
	local list_delegate = list.list_simple_delegate
	list_delegate.NumberOfCellsDel = function ()
		return #HongBaoData.Instance:GetRedPaperLog()
	end
	list_delegate.CellRefreshDel = function (cell, data_index)
		local cell_item = cell_list[cell]
		if cell_item == nil then
			cell_item = HongbaoLogCell.New(cell.gameObject)
			cell_list[cell] = cell_item
		end
		local data_list = HongBaoData.Instance:GetRedPaperLog()
		local data = data_list[data_index + 1]
		cell_item:SetData(data)
	end
end

function HongBaoView:TotalValueChange(value)
	if value == "" then
		return
	end

	local total_num = tonumber(value)
	-- local count_num = tonumber(self.count_input.input_field.text)

	-- if not total_num then
	-- 	self.total_input.input_field.text = ""
	-- 	return
	-- end

	-- local gold = GameVoManager.Instance:GetMainRoleVo().gold
	-- local can_send_gold = HongBaoData.Instance:GetDailyCanSendGold()
	-- local can_send_only_gold = 200 <= can_send_gold and 200 or can_send_gold
	-- local max_total = gold <= can_send_gold and gold or can_send_gold								--总金额上限
	-- local max_only_total = max_total <= can_send_only_gold and max_total or can_send_only_gold		--单个红包上限
	-- local max_count = 100 > max_total and max_total	or 100											--红包最大个数

	-- if self.hongbao_type == RED_PAPER_TYPE.RED_PAPER_TYPE_RAND then
	-- 	if total_num > max_total then
	-- 		total_num = max_total
	-- 	end

	-- 	if total_num < max_count then
	-- 		max_count = total_num
	-- 	end

	-- 	if not count_num or count_num > max_count then
	-- 		count_num = max_count
	-- 	elseif total_num/count_num > max_only_total then
	-- 		count_num = math.ceil(total_num/max_only_total)
	-- 	end
	-- else
	-- 	if total_num > max_only_total then
	-- 		total_num = max_only_total
	-- 	end
	-- 	local max_num = math.floor(max_total/total_num)
	-- 	max_num = max_num < max_count and max_num or max_count
	-- 	if not count_num or count_num > max_num then
	-- 		count_num = max_num
	-- 	end
	-- end

	self.total_input.input_field.text = total_num
	-- self.count_input.input_field.text = count_num
end

function HongBaoView:CountValueChange(value)
	if value == "" then
		return
	end
	local count_num = tonumber(value)

	-- local total_num = tonumber(self.total_input.input_field.text)

	-- if not count_num then
	-- 	self.count_input.input_field.text = ""
	-- 	return
	-- end

	-- local gold = GameVoManager.Instance:GetMainRoleVo().gold
	-- local can_send_gold = HongBaoData.Instance:GetDailyCanSendGold()
	-- local can_send_only_gold = 200 <= can_send_gold and 200 or can_send_gold
	-- local max_total = gold <= can_send_gold and gold or can_send_gold								--总金额上限
	-- local max_only_total = max_total <= can_send_only_gold and max_total or can_send_only_gold		--单个红包上限
	-- local max_count = 100 > max_total and max_total	or 100											--红包最大个数

	-- if count_num > max_count then
	-- 	count_num = max_count
	-- else
	-- 	if not total_num then
	-- 		return
	-- 	end

	-- 	if self.hongbao_type == RED_PAPER_TYPE.RED_PAPER_TYPE_RAND then
	-- 		if count_num > total_num then
	-- 			count_num = total_num
	-- 		elseif total_num/count_num > max_only_total then
	-- 			count_num = math.ceil(total_num/max_only_total)
	-- 		end
	-- 	else
	-- 		local max_num = math.floor(max_total/total_num)
	-- 		if count_num > max_num then
	-- 			count_num = max_num
	-- 		end
	-- 	end

	-- end

	self.count_input.input_field.text = count_num
end

function HongBaoView:OpenCallBack()
	self:Flush()
end

function HongBaoView:OnFlush()
	if self.show_next_btn then
		local open_tpye = HongBaoData.Instance:GetOpenType()
		if open_tpye == GameEnum.HONGBAO_SEND then
			self:ShowView(1)
			local gold = HongBaoData.Instance:GetDailyCanSendGold()
			self.can_send_gold:SetValue(gold)
		else
			local red_result = HongBaoData.Instance:GetRedPaperFetchResult()
			if red_result.notify_reason ~= 0 then
				self:ShowView(4)
				self:FlushFailView()
			else
				self:ShowView(3)
				self:FlushSuccView()
			end
			local data = HongBaoData.Instance:GetRedPaperDetailInfo()
			--优先判断是否有boss_id
			if data.boss_id and data.boss_id > 0 then
				local monster_cfg = BossData.Instance:GetMonsterInfo(data.boss_id)
				if nil ~= monster_cfg then
					self.is_normal:SetValue(true)
					local headid = monster_cfg.headid
					local bundle, asset = ResPath.GetBossIcon(headid)
					self.portrait:SetAsset(bundle, asset)
					return
				end
			end
			if data.avatar_key_small then
				CommonDataManager.SetAvatar(data.creater_uid, self.panel3_avatar, self.def_avatar, self.portrait, data.sex, data.prof, true)
			end
		end

		local hongbao_type = HongBaoData.Instance:GetHongbaoType()
		local is_show_next = true
		if hongbao_type == RED_PAPER_TYPE.RED_PAPER_TYPE_GLOBAL then
			is_show_next = #HongBaoData.Instance:GetCurServerHongBaoIdList() > 0
		else
			is_show_next = #HongBaoData.Instance:GetCurHongBaoIdList() > 0
		end
		self.show_next_btn:SetValue(is_show_next)
		self.show_sure_btn:SetValue(not is_show_next)
	end
end

function HongBaoView:ShowView(index)
	for i = 1, 4 do
		if i == index then
			self["panel" .. i]:SetActive(true)
		else
			self["panel" .. i]:SetActive(false)
		end
	end
end

function HongBaoView:OnClickLuck()
	local gold = HongBaoData.Instance:GetDailyCanSendGold()
	if gold <= 0 then
		SysMsgCtrl.Instance:ErrorRemind(Language.RedEnvelopes.NotGoldToSend)
		return
	end
	self.hongbao_type = RED_PAPER_TYPE.RED_PAPER_TYPE_RAND
	self:ShowView(2)
	self:FlushTotalView()
end

function HongBaoView:OnClickNormal()
	local gold = HongBaoData.Instance:GetDailyCanSendGold()
	if gold <= 0 then
		SysMsgCtrl.Instance:ErrorRemind(Language.RedEnvelopes.NotGoldToSend)
		return
	end
	self.hongbao_type = RED_PAPER_TYPE.RED_PAPER_TYPE_COMMON
	self:ShowView(2)
	self:FlushTotalView()
end

function HongBaoView:OnClickSend()
	local total_num = self.total_input.input_field.text
	if total_num == "" or tonumber(total_num) <= 0 then
		if self.hongbao_type == RED_PAPER_TYPE.RED_PAPER_TYPE_COMMON then
			SysMsgCtrl.Instance:ErrorRemind(Language.RedEnvelopes.NotTotalNormal)
		else
			SysMsgCtrl.Instance:ErrorRemind(Language.RedEnvelopes.NotTotalLuck)
		end
		return
	end

	local count_num = self.count_input.input_field.text
	if count_num == "" or tonumber(count_num) <= 0 then
		SysMsgCtrl.Instance:ErrorRemind(Language.RedEnvelopes.NotCountNum)
		return
	end

	total_num = tonumber(total_num)
	count_num = tonumber(count_num)

	local send_gold = 0
	if self.hongbao_type == RED_PAPER_TYPE.RED_PAPER_TYPE_COMMON then
		send_gold = total_num * count_num
	else
		send_gold = total_num
	end
	local can_send_gold = HongBaoData.Instance:GetDailyCanSendGold()
	if send_gold > can_send_gold then
		local des = string.format(Language.RedEnvelopes.CanSendGoldDes, can_send_gold)
		SysMsgCtrl.Instance:ErrorRemind(des)
		return
	end

	local yes_button_text = Language.Common.Confirm
	local no_button_text = Language.Common.Cancel

	local desc = ""

	local function ok_func()
		HongBaoCtrl.Instance:SendRedPaperCreateReq(self.hongbao_type, total_num, count_num)
		self:Close()
	end

	if self.hongbao_type == RED_PAPER_TYPE.RED_PAPER_TYPE_RAND then
		if total_num < count_num then
			SysMsgCtrl.Instance:ErrorRemind(Language.RedEnvelopes.IsLessThan)
			return
		end
		desc = string.format(Language.RedEnvelopes.IsPaiFaPinShouQi, count_num, total_num)
		TipsCtrl.Instance:ShowCommonAutoView(nil, desc, ok_func)
	else
		total_num = total_num * count_num
		desc = string.format(Language.RedEnvelopes.IsPaiFaPutong, count_num, total_num)
		TipsCtrl.Instance:ShowCommonAutoView(nil, desc, ok_func)
	end
end

function HongBaoView:OnClickClose()
	self:Close()
end

function HongBaoView:NextBtnClick()
	local hongbao_type = HongBaoData.Instance:GetHongbaoType()
	if hongbao_type == RED_PAPER_TYPE.RED_PAPER_TYPE_GLOBAL then
		HongBaoCtrl.Instance:RecHongBao(HongBaoData.Instance:GetCurServerHongBaoIdList()[1].id)
	else
		HongBaoCtrl.Instance:RecHongBao(HongBaoData.Instance:GetCurHongBaoIdList()[1].id)
	end
end

function HongBaoView:OnClickGet()

end

--刷新选择红包类型
function HongBaoView:FlushChoseView()

end

--刷新金额界面
function HongBaoView:FlushTotalView()
	self.total_input.input_field.text = ""
	self.count_input.input_field.text = ""
	if self.hongbao_type == RED_PAPER_TYPE.RED_PAPER_TYPE_COMMON then
		self.total:SetValue(Language.RedEnvelopes.OneStr)
	else
		self.total:SetValue(Language.RedEnvelopes.TotalStr)
	end
end

--刷新成功界面
function HongBaoView:FlushSuccView()
	local red_result = HongBaoData.Instance:GetRedPaperFetchResult()
	self.from_name:SetValue(red_result.creater_name)
	self.money_text:SetValue(red_result.fetch_gold)
	if red_result.type == RED_PAPER_TYPE.RED_PAPER_TYPE_GLOBAL then
		self.money_name_text:SetValue(Language.RedEnvelopes.moneyBang)
	else
		self.money_name_text:SetValue(Language.RedEnvelopes.MoneyFei)
	end
	if red_result.creater_name and red_result.creater_name == "福利BOSS" then
		self.money_name_text:SetValue(Language.RedEnvelopes.moneyBang)
	end
	if self.panel3_list == nil then
		self:CreateLogList(true)
	else
		if self.panel3_list.scroller.isActiveAndEnabled then
			self.panel3_list.scroller:ReloadData(0)
		end
	end
end

--刷新失败界面
function HongBaoView:FlushFailView()
	if self.panel4_list == nil then
		self:CreateLogList()
	else
		if self.panel4_list.scroller.isActiveAndEnabled then
			self.panel4_list.scroller:ReloadData(0)
		end
	end
end

function HongBaoView:OnClickSingleGold()
	local can_send_gold = HongBaoData.Instance:GetDailyCanSendGold() or 0
	TipsCtrl.Instance:OpenCommonInputView(0, BindTool.Bind(self.TotalValueChange, self), nil, can_send_gold)
end

function HongBaoView:OnClickCount()
	if self.total_input.input_field.text == "" then
		SysMsgCtrl.Instance:ErrorRemind(Language.Chat.ShuRuJinE)
		return
	end
	TipsCtrl.Instance:OpenCommonInputView(0, BindTool.Bind(self.CountValueChange, self), nil, 100)
end


HongbaoLogCell = HongbaoLogCell or BaseClass(BaseCell)

function HongbaoLogCell:__init(instance)
	self.is_luck = self:FindVariable("IsLuck")
	self.name = self:FindVariable("Name")
	self.gold = self:FindVariable("Score")
end

function HongbaoLogCell:__delete()

end

function HongbaoLogCell:OnFlush()
	self.is_luck:SetValue(self.data.is_luck == true)
	self.name:SetValue(self.data.name)
	self.gold:SetValue(self.data.gold_num)
end
