SpiritHaloHuanHuaView = SpiritHaloHuanHuaView or BaseClass(BaseView)

function SpiritHaloHuanHuaView:__init()
	self.ui_config = {"uis/views/spiritview_prefab", "SpiritHaloHuanHuaView"}
	self.cell_list = {}
end

function SpiritHaloHuanHuaView:LoadCallBack()
	self:ListenEvent("Close", BindTool.Bind(self.OnClickClose, self))
	self:ListenEvent("OnClickActivate", BindTool.Bind(self.OnClickActivate, self))
	self:ListenEvent("OnClickUseIma", BindTool.Bind(self.OnClickUseIma, self))
	self:ListenEvent("OnClickUpGrade", BindTool.Bind(self.OnClickUpGrade, self))

	self.gongji = self:FindVariable("GongJi")
	self.fangyu = self:FindVariable("FangYu")
	self.maxhp = self:FindVariable("ShengMing")
	self.mingzhong = self:FindVariable("MingZhong")
	self.shanbi = self:FindVariable("ShanBi")
	self.baoji = self:FindVariable("BaoJi")
	self.jianren = self:FindVariable("JianRen")

	self.spirit_name = self:FindVariable("ZuoQiName")
	self.fight_power = self:FindVariable("FightPower")
	self.cur_level = self:FindVariable("CurrentLevel")
	self.need_prop_num = self:FindVariable("ExchangeNeedNum")
	self.had_prop_num = self:FindVariable("ActivateProNum")

	self.show_active_button = self:FindVariable("IsShowActivate")
	self.show_use_iamge_button = self:FindVariable("IsShowUseImaButton")
	self.show_use_image_sprite = self:FindVariable("IsShowUseImage")
	self.show_cur_level = self:FindVariable("ShowCurrentLevel")
	self.show_upgrade_button = self:FindVariable("IsShowUpGrade")

	self.display = self:FindObj("Display")
	self.model = RoleModel.New()
	self.model:SetDisplay(self.display.ui3d_display)
	self.list_view = self:FindObj("ListView")
	self.upgrade_button = self:FindObj("UpGradeButton")
	self.use_image_button = self:FindObj("UseImageButton")

	self.item = ItemCell.New()
	self.item:SetInstanceParent(FindObj("Item"))

	local list_delegate = self.list_view.list_simple_delegate
	list_delegate.NumberOfCellsDel = BindTool.Bind(self.GetNumberOfCells, self)
	list_delegate.CellRefreshDel = BindTool.Bind(self.HuanHuaRefreshCell, self)

	self.cur_index = 1
end

function SpiritHaloHuanHuaView:__delete()
end

function SpiritHaloHuanHuaView:ReleaseCallBack()
	for k, v in pairs(self.cell_list) do
		v:DeleteMe()
	end
	self.cell_list = {}

	if self.item ~= nil then
		self.item:DeleteMe()
		self.item = nil
	end

	if self.model then
		self.model:DeleteMe()
		self.model = nil
	end

	-- 清理变量和对象
	self.gongji = nil
	self.fangyu = nil
	self.maxhp = nil
	self.mingzhong = nil
	self.shanbi = nil
	self.baoji = nil
	self.jianren = nil
	self.spirit_name = nil
	self.fight_power = nil
	self.cur_level = nil
	self.need_prop_num = nil
	self.had_prop_num = nil
	self.show_active_button = nil
	self.show_use_iamge_button = nil
	self.show_use_image_sprite = nil
	self.show_cur_level = nil
	self.show_upgrade_button = nil
	self.display = nil
	self.list_view = nil
	self.upgrade_button = nil
	self.use_image_button = nil
end

function SpiritHaloHuanHuaView:OpenCallBack()
	self:Flush()
end

function SpiritHaloHuanHuaView:CloseCallBack()
	self.res_id = nil
end

function SpiritHaloHuanHuaView:OnClickActivate()
	local data_list = ItemData.Instance:GetBagItemDataList()
	local special_image = SpiritData.Instance:GetSpiritHaloSpecialImageCfg()
	self.item_id = special_image[self.cur_index].item_id
	for k, v in pairs(data_list) do
		if v.item_id == self.item_id then
			PackageCtrl.Instance:SendUseItem(v.index, 1, v.sub_type, 0)
			return
		end
	end
	local item_cfg = ConfigManager.Instance:GetAutoConfig("shop_auto").item[self.item_id]
	if item_cfg == nil then
		TipsCtrl.Instance:ShowItemGetWayView(self.item_id)
		return
	end

	if item_cfg.bind_gold == 0 then
		TipsCtrl.Instance:ShowShopView(self.item_id, 2)
		return
	end

	local func = function(item_id, item_num, is_bind, is_use)
		MarketCtrl.Instance:SendShopBuy(item_id, item_num, is_bind, is_use)
	end

	TipsCtrl.Instance:ShowCommonBuyView(func, self.item_id, nil, 1)
	return
	-- TipsCtrl.Instance:ShowSystemMsg(Language.Card.CanNotUpTips)
end

function SpiritHaloHuanHuaView:OnClickUseIma()
	SpiritCtrl.Instance:SendSpiritHaloUseImage(self.cur_index + GameEnum.MOUNT_SPECIAL_IMA_ID)
end

function SpiritHaloHuanHuaView:OnClickUpGrade()
	local upgrade_cfg = SpiritData.Instance:GetHaloSpecialImgUpgradeCfg(self.cur_index)
	if upgrade_cfg then
		if ItemData.Instance:GetItemNumInBagById(upgrade_cfg.stuff_id) < upgrade_cfg.stuff_num then
			local item_cfg = ConfigManager.Instance:GetAutoConfig("shop_auto").item[upgrade_cfg.stuff_id]
			if item_cfg == nil then
				TipsCtrl.Instance:ShowItemGetWayView(upgrade_cfg.stuff_id)
				return
			end

			if item_cfg.bind_gold == 0 then
				TipsCtrl.Instance:ShowShopView(upgrade_cfg.stuff_id, 2)
				return
			end

			local func = function(stuff_id, item_num, is_bind, is_use)
				MarketCtrl.Instance:SendShopBuy(stuff_id, item_num, is_bind, is_use)
			end

			TipsCtrl.Instance:ShowCommonBuyView(func, upgrade_cfg.stuff_id, nil, upgrade_cfg.stuff_num)
			return
		end
	end
	SpiritCtrl.Instance:SendSpiritHaloSpecialImgUpgrade(self.cur_index)
end

function SpiritHaloHuanHuaView:GetNumberOfCells()
	return SpiritData.Instance:GetMaxSpiritHaloSpecialImage()
end

function SpiritHaloHuanHuaView:HuanHuaRefreshCell(cell, data_index)
	local huanhua_cell = self.cell_list[cell]
	local spirit_info = SpiritData.Instance:GetSpiritHaloInfo()
	if huanhua_cell == nil then
		huanhua_cell = SpiritHaloHuanHuaList.New(cell.gameObject)
		self.cell_list[cell] = huanhua_cell
	end
	huanhua_cell:SetToggleGroup(self.list_view.toggle_group)
	local upgrade_cfg = SpiritData.Instance:GetHaloSpecialImgUpgradeCfg(data_index)
	local image_cfg = SpiritData.Instance:GetSpiritHaloSpecialImageCfg()[data_index + 1]
	local is_show = SpiritData.Instance:ShowHaloHuanhuaRedPoint()[data_index + 1] and true or false
	huanhua_cell:SetData(image_cfg, is_show)
	huanhua_cell:ListenClick(BindTool.Bind(self.OnClickItemCell, self, data_index + 1, upgrade_cfg, huanhua_cell))
	huanhua_cell:SetHighLight(self.cur_index == data_index + 1)
end

function SpiritHaloHuanHuaView:OnClickItemCell(index, data, huanhua_cell)
	self:SetSelectAttr(index)
	self.cur_index = index
	self:SetButtonState(index)
	huanhua_cell:SetHighLight(true)
end

function SpiritHaloHuanHuaView:SetSelectAttr(index)
	index = index or self.cur_index

	local data = SpiritData.Instance:GetHaloSpecialImgUpgradeCfg(index)
	local image_cfg = SpiritData.Instance:GetSpiritHaloSpecialImageCfg()[index]
	local attr_list = CommonDataManager.GetAttributteNoUnderline(data)
	local spirit_info = SpiritData.Instance:GetSpiritInfo()
	if not image_cfg then return end

	local spirit_cfg = nil
	if spirit_info.use_jingling_id and spirit_info.use_jingling_id > 0 then
		spirit_cfg = SpiritData.Instance:GetSpiritResIdByItemId(spirit_info.use_jingling_id)
	elseif spirit_info.jingling_list and next(spirit_info.jingling_list) then
		for k, v in pairs(spirit_info.jingling_list) do
			spirit_cfg = SpiritData.Instance:GetSpiritResIdByItemId(v.item_id)
			break
		end
	else
		local item_id = 15016
		spirit_cfg = SpiritData.Instance:GetSpiritResIdByItemId(item_id)
	end
	if self.res_id ~= image_cfg.res_id and spirit_cfg then
		self.model:SetMainAsset(ResPath.GetSpiritModel(spirit_cfg.res_id))
		self.model:SetHaloResid(image_cfg.res_id)
		self.res_id = image_cfg.res_id
	end

	self.gongji:SetValue(attr_list.gongji)
	self.fangyu:SetValue(attr_list.fangyu)
	self.maxhp:SetValue(attr_list.maxhp)
	self.mingzhong:SetValue(attr_list.mingzhong)
	self.shanbi:SetValue(attr_list.shanbi)
	self.baoji:SetValue(attr_list.baoji)
	self.jianren:SetValue(attr_list.jianren)

	self.fight_power:SetValue(CommonDataManager.GetCapability(attr_list))
	local huanhua_cfg = SpiritData.Instance:GetSpiritHaloSpecialImageCfg()[index]

	local item_cfg = ItemData.Instance:GetItemConfig(image_cfg.item_id)
	self.spirit_name:SetValue("<color="..SOUL_NAME_COLOR[item_cfg and item_cfg.color or 5]..">"..huanhua_cfg.image_name.."</color>")

	self.need_prop_num:SetValue(data.stuff_num)
	local count = ItemData.Instance:GetItemNumInBagById(data.stuff_id)
	if count < data.stuff_num then
		count = string.format(Language.Mount.ShowRedNum, count)
	else
		count = string.format(Language.Mount.ShowGreenNum, count)
	end
	self.had_prop_num:SetValue(count)
	self.cur_level:SetValue(data.grade)

	local item_data = {item_id = data.stuff_id, is_bind = 0}
	self.item:SetData(item_data)
end

function SpiritHaloHuanHuaView:SetButtonState(index)
	index = index or self.cur_index
	local spirit_info = SpiritData.Instance:GetSpiritHaloInfo()
	local bit_list = bit:d2b(spirit_info.active_special_image_flag)
	local used_imageid = spirit_info.used_imageid - GameEnum.MOUNT_SPECIAL_IMA_ID

	self.show_use_image_sprite:SetValue(used_imageid == index)
	self.show_use_iamge_button:SetValue((bit_list[32 - index] == 1) and used_imageid ~= index)
	self.show_cur_level:SetValue(bit_list[32 - index] == 1)
	self.show_upgrade_button:SetValue(bit_list[32 - index] == 1)
	self.upgrade_button.button.interactable = SpiritData.Instance:GetHaloMaxUpgrade(index) > spirit_info.special_img_grade_list[index] + 1
	self.show_active_button:SetValue(bit_list[32 - index] == 0)
end

function SpiritHaloHuanHuaView:OnClickClose()
	self:Close()
end

function SpiritHaloHuanHuaView:OnFlush(param_t)
	for k, v in pairs(param_t) do
		if k == "all" and v and v.item_id then
			local cfg = SpiritData.Instance:GetSpiritHuanConfigByItemId(v.item_id)
			self.cur_index = cfg and (cfg.type + 1) or self.cur_index
		end
	end
	self:SetSelectAttr(self.cur_index)
	self:SetButtonState(self.cur_index)

	if self.list_view.scroller.isActiveAndEnabled then
		self.list_view.scroller:RefreshActiveCellViews()
	end
end



-- 精灵幻化形象列表
SpiritHaloHuanHuaList = SpiritHaloHuanHuaList or BaseClass(BaseRender)

function SpiritHaloHuanHuaList:__init(instance)
	self.icon = self:FindVariable("Icon")
	self.name = self:FindVariable("Name")
	self.show_fight_icon = self:FindVariable("ShowFight")
	self.show_help_icon = self:FindVariable("ShowHelp")
	self.show_red_point = self:FindVariable("ShowRedPoint")
end

function SpiritHaloHuanHuaList:ListenClick(handler)
	self:ClearEvent("Click")
	self:ListenEvent("Click", handler)
end

function SpiritHaloHuanHuaList:SetToggleGroup(toggle_group)
	self.root_node.toggle.group = toggle_group
end

function SpiritHaloHuanHuaList:SetHighLight(enable)
	self.root_node.toggle.isOn = enable
end

function SpiritHaloHuanHuaList:SetData(data, is_show)
	self.name:SetValue(data.image_name)
	self.show_red_point:SetValue(is_show)
end