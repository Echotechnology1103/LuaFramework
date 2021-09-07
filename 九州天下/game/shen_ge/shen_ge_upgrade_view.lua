ShenGeUpgradeView = ShenGeUpgradeView or BaseClass(BaseView)

function ShenGeUpgradeView:__init()
	self.ui_config = {"uis/views/shengeview", "ShenGeUpgradeView"}
	self.play_audio = true
	self.fight_info_view = true
	self.is_from_bag = true
end

function ShenGeUpgradeView:ReleaseCallBack()
	self.item:DeleteMe()
	self.item = nil

	if nil ~= ShenGeData.Instance then
		ShenGeData.Instance:UnNotifyDataChangeCallBack(self.data_change_event)
		self.data_change_event = nil
	end

	-- 清理变量
	self.shen_ge_name = nil
	self.fragment = nil
	self.show_next_attr = nil
	self.all_fragment = nil
	self.next_name = nil
	self.shen_ge_level = nil
	self.next_level = nil
	self.cur_attr_var_list = nil
	self.next_attr_var_list = nil
	self.cur_fight_power = nil
	self.next_fight_power = nil
	self.show_from_bag = nil
end

function ShenGeUpgradeView:LoadCallBack()
	self:ListenEvent("OnClickUpgrade",BindTool.Bind(self.OnClickUpgrade, self))
	self:ListenEvent("OnClickClose",BindTool.Bind(self.OnClickClose, self))
	self:ListenEvent("OnClickDecompose",BindTool.Bind(self.OnClickDecompose, self))
	self:ListenEvent("OnClickChange",BindTool.Bind(self.OnClickChange, self))
	self:ListenEvent("OnClickTakeOff",BindTool.Bind(self.OnClickTakeOff, self))
	self:ListenEvent("OnClickTakeOn",BindTool.Bind(self.OnClickTakeOn, self))

	self.shen_ge_name = self:FindVariable("Name")
	self.next_name = self:FindVariable("NextName")
	self.shen_ge_level = self:FindVariable("Level")
	self.next_level = self:FindVariable("NextLevel")
	self.fragment = self:FindVariable("Fragment")
	self.all_fragment = self:FindVariable("AllFragments")
	self.show_next_attr = self:FindVariable("ShowNextAttr")
	self.cur_fight_power = self:FindVariable("CurFightPower")
	self.next_fight_power = self:FindVariable("NextFightPower")
	self.show_from_bag = self:FindVariable("ShowFromBag")

	self.cur_attr_var_list = {}
	self.next_attr_var_list = {}
	for i = 1, 3 do
		self.cur_attr_var_list[i] = {
			attr = self:FindVariable("Att"..i),
			show = self:FindVariable("ShowCurAttr"..i),
			icon = self:FindVariable("CurIcon"..i),
		}
		self.next_attr_var_list[i] = {
			attr = self:FindVariable("NextAttr"..i),
			show = self:FindVariable("ShowNextAttr"..i),
			icon = self:FindVariable("NextIcon"..i),
		}
	end

	self.item = ItemCell.New()
	self.item:SetInstanceParent(self:FindObj("ItemCell"))
	self.item:ShowQuality(false)
	self.item:SetData()
	self.item:SetItemCellBg()
end

function ShenGeUpgradeView:OpenCallBack()
	self.data_change_event = BindTool.Bind(self.OnDataChange, self)
	ShenGeData.Instance:NotifyDataChangeCallBack(self.data_change_event)
	self:SetPanelData()
end

function ShenGeUpgradeView:CloseCallBack()
	self.shen_ge_name:SetValue("")
	self.next_name:SetValue("")
	self.shen_ge_level:SetValue("")
	self.next_level:SetValue("")
	if nil ~= self.close_call_back then
		self.close_call_back()
		self.close_call_back = nil
	end

	ShenGeData.Instance:UnNotifyDataChangeCallBack(self.data_change_event)
	self.data_change_event = nil
end

function ShenGeUpgradeView:OnClickUpgrade()
	local shen_ge_data = self.data.shen_ge_data
	local next_attr_cfg = ShenGeData.Instance:GetShenGeAttributeCfg(shen_ge_data.type, shen_ge_data.quality, shen_ge_data.level + 1)
	if nil == next_attr_cfg then
		TipsCtrl.Instance:ShowSystemMsg(Language.ShenGe.MaxLevelTip)
		return
	end

	local cur_page = ShenGeData.Instance:GetCurPageIndex()
	local param1 = self.is_from_bag and 0 or 1
	local param2 = self.is_from_bag and shen_ge_data.index or cur_page
	ShenGeCtrl.Instance:SendShenGeSystemReq(SHENGE_SYSTEM_REQ_TYPE.SHENGE_SYSTEM_REQ_TYPE_UPLEVEL, param1, param2, shen_ge_data.index)
end

function ShenGeUpgradeView:OnClickTakeOff()
	local cur_page = ShenGeData.Instance:GetCurPageIndex()
	ShenGeCtrl.Instance:SendShenGeSystemReq(SHENGE_SYSTEM_REQ_TYPE.SHENGE_SYSTEM_REQ_TYPE_UNLOAD_SHENGE, cur_page, self.data.shen_ge_data.index)
	self:Close()
end

function ShenGeUpgradeView:OnClickChange()
	local index = self.data.shen_ge_data.index
	local quyu = math.floor(index / 4) + 1
	local call_back = function(data)
		if nil == data then
			self:Close()
			return
		end
		local cur_page = ShenGeData.Instance:GetCurPageIndex()
		ShenGeCtrl.Instance:SendShenGeSystemReq(SHENGE_SYSTEM_REQ_TYPE.SHENGE_SYSTEM_REQ_TYPE_SET_RUAN, data.shen_ge_data.index, cur_page, index)
		self:Close()
	end
	ShenGeCtrl.Instance:ShowSelectView(call_back, {[1] = quyu}, "from_inlay")
end

function ShenGeUpgradeView:OnClickTakeOn()
	local cur_page = ShenGeData.Instance:GetCurPageIndex()
	local slot_state_list = ShenGeData.Instance:GetSlotStateList()
	local shen_ge_data = self.data.shen_ge_data
	local attr_cfg = ShenGeData.Instance:GetShenGeAttributeCfg(shen_ge_data.type, shen_ge_data.quality, shen_ge_data.level)
	if nil == attr_cfg then return end

	local min_index = (attr_cfg.quyu - 1) * 4
	local max_index = min_index + 3
	for i = min_index, max_index do
		local inlay_data = ShenGeData.Instance:GetInlayData(cur_page, i)
		if slot_state_list[i] and (nil == inlay_data or inlay_data.item_id <= 0) then
			ShenGeCtrl.Instance:SendShenGeSystemReq(SHENGE_SYSTEM_REQ_TYPE.SHENGE_SYSTEM_REQ_TYPE_SET_RUAN, self.data.shen_ge_data.index, cur_page, i)
			self:Close()
			return
		end
	end
	TipsCtrl.Instance:ShowSystemMsg(Language.ShenGe.HaveNoShenGeCanUse)
	self:Close()
end

function ShenGeUpgradeView:OnClickDecompose()
	ShenGeCtrl.Instance:SendShenGeSystemReq(SHENGE_SYSTEM_REQ_TYPE.SHENGE_SYSTEM_REQ_TYPE_DECOMPOSE, 0, 0, 0, 0, 1, {[1] = self.data.shen_ge_data.index})
	self:Close()
end

function ShenGeUpgradeView:SetData(data)
	self.data = data
	if nil == self.data or self.data.item_id <= 0 then
		return
	end
	self:Open()
end

function ShenGeUpgradeView:SetCallBack(close_call_back)
	self.close_call_back = close_call_back
end

function ShenGeUpgradeView:SetIsFromBag(value)
	self.is_from_bag = value or false
end

function ShenGeUpgradeView:OnDataChange(info_type, param1, param2, param3, bag_list)
	if not self:IsOpen() then return end

	if self.is_from_bag and info_type == SHENGE_SYSTEM_INFO_TYPE.SHENGE_SYSTEM_INFO_TYPE_SIGLE_CHANGE then
		self.data = ShenGeData.Instance:GetShenGeItemData(self.data.shen_ge_data.index)
		self:SetPanelData()
	elseif not self.is_from_bag and info_type == SHENGE_SYSTEM_INFO_TYPE.SHENGE_SYSTEM_INFO_TYPE_SHENGE_INFO then
		self.data = ShenGeData.Instance:GetInlayData(param1, self.data.shen_ge_data.index)
		self:SetPanelData()
	end
end

function ShenGeUpgradeView:SetPanelData()
	self.item:SetData(self.data)
	if nil == self.data or nil == self.data.shen_ge_data then
		return
	end
	local shen_ge_data = self.data.shen_ge_data
	local attr_cfg = ShenGeData.Instance:GetShenGeAttributeCfg(shen_ge_data.type, shen_ge_data.quality, shen_ge_data.level)
	if nil == attr_cfg then return end

	local item_cfg = ItemData.Instance:GetItemConfig(self.data.item_id)
	if nil == item_cfg then
		return
	end

	local level_str = attr_cfg.name.." Lv."..self.data.shen_ge_data.level
	local level_to = "<color="..SOUL_NAME_COLOR[item_cfg.color]..">"..attr_cfg.level.."</color>"
	-- local level_to_color = "<color="..SOUL_NAME_COLOR[item_cfg.color]..">"..level_str.."</color>"
	local level_to_color = level_str 
	self.shen_ge_level:SetValue(level_to)
	self.shen_ge_name:SetValue(level_to_color)
	local fragment_str = "<color=#532f1e>"..attr_cfg.next_level_need_marrow_score.."</color>"
	self.fragment:SetValue(fragment_str)

	local had_fragments = ShenGeData.Instance:GetFragments(true)
	local had_fragments_str = ShenGeData.Instance:GetFragments()
	local str = ""
	if had_fragments < attr_cfg.next_level_need_marrow_score then
		str = string.format(Language.Mount.ShowRedStr, "  " .. had_fragments_str)
	else
		str = string.format(Language.Mount.ShowGreenStr,"  " .. had_fragments_str)
	end
	self.all_fragment:SetValue(str)

	self:SetCurAttr(attr_cfg)

	self:SetNextAttr(shen_ge_data, item_cfg)

	self.show_from_bag:SetValue(self.is_from_bag)
end

function ShenGeUpgradeView:SetCurAttr(attr_cfg)
	local attr_list = {}
	for k, v in pairs(self.cur_attr_var_list) do
		local attr_value = attr_cfg["add_attributes_"..(k - 1)]
		local attr_type = attr_cfg["attr_type_"..(k - 1)]
		local attr_key = Language.ShenGe.AttrType[attr_type]
		if attr_value > 0 then
			v.show:SetValue(true)
			--v.icon:SetAsset(ResPath.GetBaseAttrIcon(attr_key))
			attr_list[attr_key] = attr_value
			--v.attr:SetValue(Language.ShenGe.AttrTypeName[attr_type].."  +"..attr_value)
			v.attr:SetValue(string.format("%s<color=#503635FF>%s</color>",
			 Language.ShenGe.AttrTypeName[attr_type].."  +",attr_value))
		else
			v.attr:SetValue("")
			v.show:SetValue(false)
		end
	end

	local power = CommonDataManager.GetCapabilityCalculation(attr_list)
	self.cur_fight_power:SetValue(power + attr_cfg.capbility)
end

function ShenGeUpgradeView:SetNextAttr(shen_ge_data, item_cfg)
	local next_attr_cfg = ShenGeData.Instance:GetShenGeAttributeCfg(shen_ge_data.type, shen_ge_data.quality, shen_ge_data.level + 1)

	self.show_next_attr:SetValue(nil ~= next_attr_cfg)

	if nil == next_attr_cfg then return end

	local attr_list = {}
	for k, v in pairs(self.next_attr_var_list) do
		local attr_value = next_attr_cfg["add_attributes_"..(k  - 1)]
		local attr_type = next_attr_cfg["attr_type_"..(k  - 1)]
		local attr_key = Language.ShenGe.AttrType[attr_type]
		if attr_value > 0 then
			v.show:SetValue(true)
			--v.icon:SetAsset(ResPath.GetBaseAttrIcon(attr_key))
			
			attr_list[attr_key] = attr_value
			v.attr:SetValue(string.format("%s<color=#503635FF>%s</color>",
			 Language.ShenGe.AttrTypeName[attr_type].."  +",attr_value))
		else
			v.attr:SetValue("")
			v.show:SetValue(false)
		end
	end

	local next_level_str = next_attr_cfg.name
	-- local next_level = "<color="..SOUL_NAME_COLOR[item_cfg.color]..">"..next_attr_cfg.level.."</color>"
	local next_level = next_attr_cfg.level
	-- local next_level_to_color = "<color="..SOUL_NAME_COLOR[item_cfg.color]..">"..next_level_str.."</color>"
	local next_level_to_color = next_level_str.." Lv."..self.data.shen_ge_data.level + 1
	self.next_level:SetValue(next_level)

	self.next_name:SetValue(next_level_to_color)
	local power = CommonDataManager.GetCapabilityCalculation(attr_list)
	self.next_fight_power:SetValue(power + next_attr_cfg.capbility)
end

function ShenGeUpgradeView:OnClickClose()
	self:Close()
end