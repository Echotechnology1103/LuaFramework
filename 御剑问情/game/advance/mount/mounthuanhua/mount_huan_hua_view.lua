MountHuanHuaView = MountHuanHuaView or BaseClass(BaseView)

local DISPLAYNAME = {
	[7035001] = "mount_huanhua_panel_special1",
	[7029001] = "mount_huanhua_panel_special2",
	[7304001] = "mount_huanhua_panel_special3",
}

function MountHuanHuaView:__init()
	self.ui_config = {"uis/views/advanceview_prefab","MountHuanHuaView"}
	self.play_audio = true
	self.item_id = 0
	self.index = 1
	self.grade = nil
	self.mount_special_image = nil
	self.res_id = nil
	self.fix_show_time = 15
	self.used_imageid = nil
	self.cell_list = {}
	self.prefab_preload_id = 0
end

function MountHuanHuaView:LoadCallBack()
	self.expense_cfg = MountData.Instance:GetExpenseCfg()
	self.mount_display = self:FindObj("MountDisplay")

	self.have_pro_num = self:FindVariable("ActivateProNum")
	self.need_pro_num = self:FindVariable("ExchangeNeedNum")
	self.button_text = self:FindVariable("ButtonText")

	self.gong_ji = self:FindVariable("GongJi")
	self.fang_yu = self:FindVariable("FangYu")
	self.sheng_ming = self:FindVariable("ShengMing")
	-- self.ming_zhong = self:FindVariable("MingZhong")
	-- self.shan_bi = self:FindVariable("ShanBi")
	-- self.bao_ji = self:FindVariable("BaoJi")
	-- self.jian_ren = self:FindVariable("JianRen")
	-- self.zizhi_dan_limit = self:FindVariable("ZiZhiDan")
	self.fight_power = self:FindVariable("FightPower")

	self.mount_name = self:FindVariable("ZuoQiName")
	self.show_upgrade_btn = self:FindVariable("IsShowUpGrade")
	self.show_activate_btn = self:FindVariable("IsShowActivate")
	self.show_use_ima_btn = self:FindVariable("IsShowUseImaButton")
	self.show_use_image = self:FindVariable("IsShowUseImage")
	self.cur_level = self:FindVariable("CurrentLevel")
	self.show_cur_level = self:FindVariable("ShowCurrentLevel")

	self.mount_model = RoleModel.New("mount_huanhua_panel")
	self.mount_model:SetDisplay(self.mount_display.ui3d_display)

	self:ListenEvent("OnClickActivate",
		BindTool.Bind(self.OnClickActivate, self))
	self:ListenEvent("Close",
		BindTool.Bind(self.OnClickClose, self))
	self:ListenEvent("OnClickUpGrade",
		BindTool.Bind(self.OnClickUpGrade, self))
	self:ListenEvent("OnClickUseIma",
		BindTool.Bind(self.OnClickUseIma, self))

	self.list_view = self:FindObj("ListView")
	self.upgrade_btn = self:FindObj("UpGradeButton")
	self.item = ItemCell.New()
	self.item:SetInstanceParent(self:FindObj("Item"))

	self.next_up = self:FindVariable("TextUp")
	self.showup_text = self:FindVariable("ShowUpText")

	local list_delegate = self.list_view.list_simple_delegate
	list_delegate.NumberOfCellsDel = BindTool.Bind(self.GetMountNumberOfCells, self)
	list_delegate.CellRefreshDel = BindTool.Bind(self.RefreshMountCell, self)
end

function MountHuanHuaView:__delete()
	self.index = 1
	self.grade = nil
	self.item_id = nil
	self.mount_special_image = nil

end

function MountHuanHuaView:ReleaseCallBack()
	if self.mount_model ~= nil then
		self.mount_model:DeleteMe()
		self.mount_model = nil
	end

	for k, v in pairs(self.cell_list) do
		v:DeleteMe()
	end
	self.cell_list = {}

	if self.item ~= nil then
		self.item:DeleteMe()
		self.item = nil
	end
	PrefabPreload.Instance:StopLoad(self.prefab_preload_id)

	-- 清理变量和对象
	self.mount_display = nil
	self.have_pro_num = nil
	self.need_pro_num = nil
	self.button_text = nil
	self.gong_ji = nil
	self.fang_yu = nil
	self.sheng_ming = nil
	self.fight_power = nil
	self.mount_name = nil
	self.show_upgrade_btn = nil
	self.show_activate_btn = nil
	self.show_use_ima_btn = nil
	self.show_use_image = nil
	self.cur_level = nil
	self.show_cur_level = nil
	self.list_view = nil
	self.upgrade_btn = nil
	self.NextUp=nil
	self.showup_text = nil
	self.next_up = nil
end

function MountHuanHuaView:GetMountNumberOfCells()
	local temp_table = MountData.Instance:GetHuanHuaMountCfg()
	return #temp_table
end

function MountHuanHuaView:RefreshMountCell(cell, cell_index)
	local mount_special_image = MountData.Instance:GetHuanHuaMountCfg()

	local mount_cell = self.cell_list[cell]
	if mount_cell == nil then
		mount_cell = MountHuanHuaCell.New(cell.gameObject)
		self.cell_list[cell] = mount_cell
	end
	mount_cell:SetToggleGroup(self.list_view.toggle_group)
	local data = {}
	data.head_id = mount_special_image[cell_index+1].head_id
	data.image_name = mount_special_image[cell_index+1].image_name
	data.item_id = mount_special_image[cell_index+1].item_id
	data.index = mount_special_image[cell_index+1].image_id
	data.is_show = MountData.Instance:CanHuanhuaUpgrade()[data.index] ~= nil
	mount_cell:SetData(data)
	mount_cell:SetHighLight(self.index == data.index)
	mount_cell:ListenClick(BindTool.Bind(self.OnClickListCell, self, mount_special_image[cell_index+1], data.index, mount_cell))
end

function MountHuanHuaView:OnClickClose()
	self:Close()
	self.grade = nil
	if self.time_quest then
		GlobalTimerQuest:CancelQuest(self.time_quest)
		self.time_quest = nil
	end
	self.res_id = nil
	self.used_imageid = nil
end

function MountHuanHuaView:OpenCallBack()
	self:Flush("mounthuanhua")
	self.index = 1
	self:SetModleRestAni()
end

--点击激活按钮
function MountHuanHuaView:OnClickActivate()
	local data_list = ItemData.Instance:GetBagItemDataList()
	local mount_special_image = MountData.Instance:GetSpecialImagesCfg()
	self.item_id = mount_special_image[self.index].item_id
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

--点击升级按钮
function MountHuanHuaView:OnClickUpGrade()
	local attr_cfg = MountData.Instance:GetSpecialImageUpgradeInfo(self.index)
	if attr_cfg ~= nil then
		if attr_cfg.grade >= MountData.Instance:GetSpecialImageMaxUpLevelById(attr_cfg.special_img_id) then
			return
		end
		if ItemData.Instance:GetItemNumInBagById(attr_cfg.stuff_id) < attr_cfg.stuff_num then
			local item_cfg = ConfigManager.Instance:GetAutoConfig("shop_auto").item[attr_cfg.stuff_id]
			if item_cfg == nil then
				TipsCtrl.Instance:ShowItemGetWayView(attr_cfg.stuff_id)
				return
			end

			if item_cfg.bind_gold == 0 then
				TipsCtrl.Instance:ShowShopView(attr_cfg.stuff_id, 2)
				return
			end

			local func = function(stuff_id, item_num, is_bind, is_use)
				MarketCtrl.Instance:SendShopBuy(stuff_id, item_num, is_bind, is_use)
			end

			TipsCtrl.Instance:ShowCommonBuyView(func, attr_cfg.stuff_id, nil, attr_cfg.stuff_num)
			return
		end
	end

	MountHuanHuaCtrl.Instance:MountSpecialImaUpgrade(self.index)
end

--点击使用当前形象
function MountHuanHuaView:OnClickUseIma()

	-- 如果正在使用双人坐骑则先下双人坐骑
	local index = MultiMountData.Instance:GetCurUseMountId()
	local role_vo = GameVoManager.Instance:GetMainRoleVo()
	if index ~= 0 then
		MultiMountCtrl.Instance:SendMultiModuleReq(MULTI_MOUNT_REQ_TYPE.MULTI_MOUNT_REQ_TYPE_SELECT_MOUNT, index)
		if role_vo.multi_mount_res_id > 0 then
			MultiMountCtrl.Instance:SendMultiModuleReq(MULTI_MOUNT_REQ_TYPE.MULTI_MOUNT_REQ_TYPE_UNRIDE)
		end
	end

	MountCtrl.Instance:SendUseMountImage(self.index + GameEnum.MOUNT_SPECIAL_IMA_ID)

	local info = MountData.Instance:GetMountInfo()
	if info.mount_flag == 0 then
		MountCtrl.Instance:SendGoonMountReq(1)
	end
end

function MountHuanHuaView:OnClickListCell(mount_special_data, index, mount_cell)
	self.mount_special_image = mount_special_data
	mount_cell:SetHighLight(true)
	if self.index == index then return end
	self.index = index or 1
	self.item_id = mount_special_data.item_id
	self:SetSpecialImageAttr(mount_special_data, index)
end

--获取激活坐骑符数量
function MountHuanHuaView:GetHaveProNum(item_id, need_num)
	local count = ItemData.Instance:GetItemNumInBagById(item_id)
	if count < need_num then
		count = string.format(Language.Mount.ShowRedNum, count)
	end
	self.have_pro_num:SetValue(count)
end

function MountHuanHuaView:SetModleRestAni()
	self.timer = self.fix_show_time
	if self.time_quest then
		GlobalTimerQuest:CancelQuest(self.time_quest)
		self.time_quest = nil
	end
	if not self.time_quest then
		self.time_quest = GlobalTimerQuest:AddRunQuest(function()
			self.timer = self.timer - UnityEngine.Time.deltaTime
			if self.timer <= 0 then
				if self.mount_model then
					local part = self.mount_model.draw_obj:GetPart(SceneObjPart.Main)
					if part then
						part:SetTrigger("rest")
					end
				end
				self.timer = self.fix_show_time
			end
		end, 0)
	end
end


function MountHuanHuaView:SetSpecialImageAttr(mount_special_data, index)
	if mount_special_data == nil then
		return
	end
	local temp_table = MountData.Instance:GetHuanHuaMountCfg()
	local upgrade_cfg = MountData.Instance:GetSpecialImageUpgradeInfo(mount_special_data.image_id)
	local image_cfg = MountData.Instance:GetHuanHuaMountCfgByIndex(index)
	local info_list = MountData.Instance:GetMountInfo()
	local active_flag = info_list.active_special_image_flag
	local active_flag2 = info_list.active_special_image_flag2
	local bit_list = bit:d2b(active_flag2)
	local bit_list2 = bit:d2b(active_flag)
	for i,v in ipairs(bit_list2) do
		table.insert(bit_list, v)
	end

	local item_cfg = ItemData.Instance:GetItemConfig(image_cfg.item_id)
	local color = self.expense_cfg[image_cfg.item_id].color
	self.mount_name:SetValue("<color="..Common_Five_Rank_Color[color]..">"..mount_special_data.image_name.."</color>")

	if self.res_id ~= image_cfg.res_id then

		PrefabPreload.Instance:StopLoad(self.prefab_preload_id)
		local bundle, asset = ResPath.GetMountModel(image_cfg.res_id)
		local load_list = {{bundle, asset}}
		self.prefab_preload_id = PrefabPreload.Instance:LoadPrefables(load_list, function()
				-- self.mount_model:SetModelTransformParameter(DISPLAY_MODEL_TYPE[DISPLAY_TYPE.MOUNT], image_cfg.res_id, DISPLAY_PANEL.HUAN_HUA)
				self.mount_model:SetPanelName(self:SetSpecialModle(image_cfg.res_id))
				self.mount_model:SetMainAsset(ResPath.GetMountModel(image_cfg.res_id))
			end)
		-- local cfg = self.mount_model:GetModelDisplayParameterCfg(DISPLAY_MODEL_TYPE[DISPLAY_TYPE.MOUNT], image_cfg.res_id, DISPLAY_PANEL.HUAN_HUA)
		-- if cfg then
		-- 	GlobalTimerQuest:AddDelayTimer(function()
		-- 		self.mount_model.draw_obj.root.transform.localPosition = cfg.position
		-- 		self.mount_model.draw_obj.root.transform.localRotation = Quaternion.Euler(cfg.rotation.x, cfg.rotation.y, cfg.rotation.z)
		-- 		self.mount_model.draw_obj.root.transform.localScale = cfg.scale
		-- 		end, 0.1)
		-- end
		local part = self.mount_model.draw_obj:GetPart(SceneObjPart.Main)
		if part then
			part:SetTrigger("rest")
			self.timer = self.fix_show_time
		end
		self.res_id = image_cfg.res_id
	end
	local attr = CommonStruct.Attribute()
	local attr_cfg = MountData.Instance:GetSpecialImageUpgradeInfo(index)

	--当前战斗力的值
	if attr_cfg ~= nil then
		attr.max_hp =  attr_cfg.maxhp
		attr.gong_ji = attr_cfg.gongji
		attr.fang_yu = attr_cfg.fangyu
		-- attr.ming_zhong =  attr_cfg.mingzhong
		-- attr.shan_bi = attr_cfg.shanbi
		-- attr.bao_ji = attr_cfg.baoji
		-- attr.jian_ren = attr_cfg.jianren
		self.grade = 0 ~= bit_list[64 - index] and attr_cfg.grade or -1
		-- self.zizhi_dan_limit:SetValue(attr_cfg.shuxingdan_count)
		local str = string.format(Language.Mount.HuanHuaLevel, Common_Five_Rank_Color[color], attr_cfg.grade)
		self.cur_level:SetValue(str)
		self.need_pro_num:SetValue(upgrade_cfg.stuff_num or 1)
		self:GetHaveProNum(mount_special_data.item_id, upgrade_cfg.stuff_num)
	end

	--print_error(self.grade)

	self.used_imageid = info_list.used_imageid

	local capability = CommonDataManager.GetCapability(attr)
	self.fight_power:SetValue(capability)
	self.sheng_ming:SetValue(attr.max_hp)
	self.gong_ji:SetValue(attr.gong_ji)
	self.fang_yu:SetValue(attr.fang_yu)
	-- self.ming_zhong:SetValue(attr.ming_zhong)
	-- self.shan_bi:SetValue(attr.shan_bi)
	-- self.bao_ji:SetValue(attr.bao_ji)
	-- self.jian_ren:SetValue(attr.jian_ren)

	local data = {item_id = mount_special_data.item_id, is_bind = 0}
	self.item:SetData(data)
	self:IsGrayUpgradeButton(self.index)
	self:IsShowActivate(self.index)
	self:IsShowUpGrade(self.index)
	if self.grade == -1 then
		self.showup_text:SetValue(false)
	else
		--下一级战斗力属性
		local attr_next = CommonStruct.Attribute()

		local attr_next_cfg = MountData.Instance:GetSpecialImageUpgradeInfo(index, nil, true)
		if attr_next ~= nil and attr_next_cfg ~= nil then
			attr_next.max_hp = attr_next_cfg.maxhp
			attr_next.gong_ji = attr_next_cfg.gongji
			attr_next.fang_yu = attr_next_cfg.fangyu
		end
		--战力计算
		local capability_next = CommonDataManager.GetCapability(attr_next)

	  	--下一级战力的值与当前战力的差
		local next_up = capability_next - capability
		self.next_up:SetValue(next_up)
		self.showup_text:SetValue(next_up > 0)
	end

end

--设置激活按钮显示和隐藏
function MountHuanHuaView:IsShowActivate(image_id)
	if image_id == nil then
		return
	end
	local info_list = MountData.Instance:GetMountInfo()
	local active_flag = info_list.active_special_image_flag
	local active_flag2 = info_list.active_special_image_flag2
	local bit_list = bit:d2b(active_flag2)
	local bit_list2 = bit:d2b(active_flag)
	for i,v in ipairs(bit_list2) do
		table.insert(bit_list, v)
	end
	self.show_activate_btn:SetValue(0 == bit_list[64 - image_id]) --把64位转换成table,返回1，表示激活
	self.show_use_ima_btn:SetValue(0 ~= bit_list[64 - image_id])
	self.show_use_image:SetValue(0 ~= bit_list[64 - image_id])
	self.show_cur_level:SetValue(0 ~= bit_list[64 - image_id])
	if info_list.used_imageid >= GameEnum.MOUNT_SPECIAL_IMA_ID then
		-- self.show_use_ima_btn:SetValue(image_id ~= (info_list.used_imageid - GameEnum.MOUNT_SPECIAL_IMA_ID)
		-- 											and 0 ~= bit_list[64 - image_id])
		-- self.show_use_image:SetValue(image_id == (info_list.used_imageid - GameEnum.MOUNT_SPECIAL_IMA_ID)
		-- 											and 0 ~= bit_list[64 - image_id])

		local btn_flag = image_id ~= (info_list.used_imageid - GameEnum.MOUNT_SPECIAL_IMA_ID) and 0 ~= bit_list[64 - image_id]
		local img_flag = image_id == (info_list.used_imageid - GameEnum.MOUNT_SPECIAL_IMA_ID) and 0 ~= bit_list[64 - image_id]

		-- 双骑状态下标签显示
		local multi_mount_flag = MultiMountData.Instance:GetCurUseMountId()
		if multi_mount_flag ~= 0 then
			if btn_flag == true or img_flag == true then
				self.show_use_ima_btn:SetValue(true)
				self.show_use_image:SetValue(false)
			else
				self.show_use_ima_btn:SetValue(false)
				self.show_use_image:SetValue(false)
			end
		else
			self.show_use_ima_btn:SetValue(btn_flag)
			self.show_use_image:SetValue(img_flag)
		end

	else
		self.show_use_ima_btn:SetValue(0 ~= bit_list[64 - image_id])
		self.show_use_image:SetValue(false)
	end
end

--设置升级按钮显示和隐藏
function MountHuanHuaView:IsShowUpGrade(image_id)
	if image_id == nil then
		return
	end
	local special_img_up = MountData.Instance:GetSpecialImageUpgradeCfg()
	local info_list = MountData.Instance:GetMountInfo()
	local active_flag = info_list.active_special_image_flag
	local active_flag2 = info_list.active_special_image_flag2
	local bit_list = bit:d2b(active_flag2)
	local bit_list2 = bit:d2b(active_flag)
	for i,v in ipairs(bit_list2) do
		table.insert(bit_list, v)
	end
	for k, v in pairs(special_img_up) do
		if v.special_img_id == image_id then
			self.show_upgrade_btn:SetValue(0 ~= bit_list[64 - image_id])
			break
		else
			self.show_upgrade_btn:SetValue(false)
		end
	end
end

--升级按钮是否置灰
function MountHuanHuaView:IsGrayUpgradeButton(index)
	if index == nil or index < 0 then return end
	local mount_special_image = MountData.Instance:GetSpecialImagesCfg()
	local upgrade_cfg = MountData.Instance:GetSpecialImageUpgradeInfo(mount_special_image[index].image_id)
	if upgrade_cfg.grade < MountData.Instance:GetSpecialImageMaxUpLevelById(mount_special_image[index].image_id) then
		self.upgrade_btn.button.interactable = true
		self.button_text:SetValue(Language.Common.UpGrade)
	else
		self.upgrade_btn.button.interactable = false
		self.button_text:SetValue(Language.Common.YiManJi)
	end
end

function MountHuanHuaView:OnFlush(param_list)
	for k, v in pairs(param_list) do
		if k == "mounthuanhua" then
			local mount_special_image = MountData.Instance:GetSpecialImagesCfg()
			local upgrade_cfg = MountData.Instance:GetSpecialImageUpgradeInfo(mount_special_image[self.index].image_id)
			local info_list = MountData.Instance:GetMountInfo()
			local active_flag = info_list.active_special_image_flag
			local active_flag2 = info_list.active_special_image_flag2
			local bit_list = bit:d2b(active_flag2)
			local bit_list2 = bit:d2b(active_flag)
			for i,v in ipairs(bit_list2) do
				table.insert(bit_list, v)
			end
			if not self.grade or (self.grade < upgrade_cfg.grade and 0 ~= bit_list[64 - self.index]) or (self.used_imageid ~= info_list.used_imageid) then
				self:GetHaveProNum(self.item_id, upgrade_cfg.stuff_num)
				self:IsShowActivate(self.index)
				self:IsShowUpGrade(self.index)
				self:SetSpecialImageAttr(mount_special_image[self.index], self.index)
				self:IsGrayUpgradeButton(self.index)
				self.list_view.scroller:RefreshActiveCellViews()
			end
		end
	end
end

function MountHuanHuaView:SetSpecialModle(modle_id)
	local display_name = "mount_huanhua_panel"
	local id = tonumber(modle_id)
	for k,v in pairs(DISPLAYNAME) do
		if id == k then
			display_name = v
			return display_name
		end
	end
	return display_name
end

MountHuanHuaCell = MountHuanHuaCell or BaseClass(BaseRender)

function MountHuanHuaCell:__init()
	self.name = self:FindVariable("Name")
	self.show_red_ponit = self:FindVariable("ShowRedPoint")
	self.item_cell = ItemCell.New()
	self.item_cell:SetInstanceParent(self:FindObj("ItemCell"))
	self.is_own = self:FindVariable("IsOwn")
	self.is_used = self:FindVariable("IsUse")
end

function MountHuanHuaCell:__delete()
	if self.item_cell then
		self.item_cell:DeleteMe()
		self.item_cell = nil
	end
end

function MountHuanHuaCell:SetData(data)
	if data == nil then
		return
	end
	self.item_cell:SetData(data)

	local item_cfg = ItemData.Instance:GetItemConfig(data.item_id)
	if item_cfg == nil then return end
	local name_str = "<color="..SOUL_NAME_COLOR[item_cfg.color]..">".. data.image_name .."</color>"
	self.name:SetValue(name_str)
	self.show_red_ponit:SetValue(data.is_show)
	self:ShowLabel(data.index)
end

function MountHuanHuaCell:ListenClick(handler)
	self:ClearEvent("Click")
	self:ListenEvent("Click", handler)
end

function MountHuanHuaCell:SetToggleGroup(toggle_group)
	self.root_node.toggle.group = toggle_group
end

function MountHuanHuaCell:SetHighLight(enable)
	self.root_node.toggle.isOn = enable
end

function MountHuanHuaCell:ShowLabel(image_id)
	if image_id == nil then
		return
	end

	local info_list = MountData.Instance:GetMountInfo()
	local active_flag = info_list.active_special_image_flag
	local active_flag2 = info_list.active_special_image_flag2
	local bit_list = bit:d2b(active_flag2)
	local bit_list2 = bit:d2b(active_flag)
	for i,v in ipairs(bit_list2) do
		table.insert(bit_list, v)
	end
	self.is_own:SetValue(0 ~= bit_list[64 - image_id])
	self.is_used:SetValue(0 ~= bit_list[64 - image_id])
	if info_list.used_imageid >= GameEnum.MOUNT_SPECIAL_IMA_ID then
		self.is_own:SetValue(image_id ~= (info_list.used_imageid - GameEnum.MOUNT_SPECIAL_IMA_ID)
													and 0 ~= bit_list[64 - image_id])
		self.is_used:SetValue(image_id == (info_list.used_imageid - GameEnum.MOUNT_SPECIAL_IMA_ID)
													and 0 ~= bit_list[64 - image_id])
	else
		self.is_own:SetValue(0 ~= bit_list[64 - image_id])
		self.is_used:SetValue(false)
	end
end


