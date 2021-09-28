TreasureContentView = TreasureContentView or BaseClass(BaseRender)

TREASURE_FUNCTION_OPEN = 40

function TreasureContentView:__init(instance)
	self.show_frame = TreasureFrameItem.New(self:FindObj("show_frame"))
	self:ListenEvent("open_one_click", BindTool.Bind(self.OpenOneClick, self))
	self:ListenEvent("open_ten_click", BindTool.Bind(self.OpenTenClick, self))
	self:ListenEvent("open_fifty_click", BindTool.Bind(self.OpenFiftyClick, self))
	self:ListenEvent("mask_click", BindTool.Bind(self.CheckBoxClick, self))
	self:ListenEvent("OnClickDanMu", BindTool.Bind(self.OnClickDanMu, self))

	self.show_mask = self:FindVariable("is_mask")
	self.open_ten_money = self:FindVariable("open_ten_money")
	self.open_fifty_money = self:FindVariable("open_fifty_money")
	self.open_one_money = self:FindVariable("open_one_money")
	self.open_one_free_text = self:FindVariable("open_one_free_text")

	self.show_free_text = self:FindVariable("show_free_text")
	self.show_key_one_text = self:FindVariable("show_key_one_text")
	self.show_key_ten_text = self:FindVariable("show_key_ten_text")
	self.show_key_fifty_text = self:FindVariable("show_key_fifty_text")
	self.key_one_text = self:FindVariable("key_one_text")
	self.key_ten_text = self:FindVariable("key_ten_text")
	self.key_fifty_text = self:FindVariable("key_fifty_text")
	self.show_coin_text = self:FindVariable("show_coin_text")
	self.show_ten_coin_text = self:FindVariable("show_ten_coin_text")
	self.show_fifty_coin_text = self:FindVariable("show_fifty_coin_text")

	self.dan_mu_toggle = self:FindObj("DanMuToggle").toggle


	self.show_mask:SetValue(TreasureData.Instance:GetIsShield())
	local treasure_data = TreasureData.Instance
	self.open_one_money:SetValue(treasure_data:GetTreasurePrice(CHEST_SHOP_MODE.CHEST_SHOP_MODE_1))
	self.open_ten_money:SetValue(treasure_data:GetTreasurePrice(CHEST_SHOP_MODE.CHEST_SHOP_MODE_10))
	self.open_fifty_money:SetValue(treasure_data:GetTreasurePrice(CHEST_SHOP_MODE.CHEST_SHOP_MODE_50))

	--引导用按钮
	self.one_times_btn = self:FindObj("OneTimesBtn")

	self.contain_cell_list = {}
	self.item_cfg_list = TreasureData.Instance:GetShowCfg()
	self.list_view = self:FindObj("list_view")
	local list_delegate = self.list_view.list_simple_delegate
	list_delegate.NumberOfCellsDel = BindTool.Bind(self.GetNumberOfCells, self)
	list_delegate.CellRefreshDel = BindTool.Bind(self.RefreshCell, self)
end

function TreasureContentView:__delete()
	if self.show_frame then
		self.show_frame:DeleteMe()
	end
	for k,v in pairs(self.contain_cell_list) do
		v:DeleteMe()
	end

	self:DeleteTimeQuest()

	self.contain_cell_list = {}
end

function TreasureContentView:OpenOneClick()
	TreasureData.Instance:SetChestShopMode(CHEST_SHOP_MODE.CHEST_SHOP_MODE_1)
	TreasureCtrl.Instance:SendXunbaoReq(CHEST_SHOP_MODE.CHEST_SHOP_MODE_1, CHEST_SHOP_TYPE.CHEST_SHOP_TYPE_EQUIP)
end

function TreasureContentView:OpenTenClick()
	TreasureData.Instance:SetChestShopMode(CHEST_SHOP_MODE.CHEST_SHOP_MODE_10)
	TreasureCtrl.Instance:SendXunbaoReq(CHEST_SHOP_MODE.CHEST_SHOP_MODE_10, CHEST_SHOP_TYPE.CHEST_SHOP_TYPE_EQUIP)
end

function TreasureContentView:OpenFiftyClick()
	TreasureData.Instance:SetChestShopMode(CHEST_SHOP_MODE.CHEST_SHOP_MODE_50)
	TreasureCtrl.Instance:SendXunbaoReq(CHEST_SHOP_MODE.CHEST_SHOP_MODE_50, CHEST_SHOP_TYPE.CHEST_SHOP_TYPE_EQUIP)
end

function TreasureContentView:OnClickDanMu()
	RollingBarrageData.Instance:RecordBarrageState(CHEST_SHOP_TYPE.CHEST_SHOP_TYPE_EQUIP, self.dan_mu_toggle.isOn)

	if self.dan_mu_toggle.isOn then
		ViewManager.Instance:Close(ViewName.RollingBarrageView)
	else
		RollingBarrageData.Instance:SetNowCheckType(CHEST_SHOP_TYPE.CHEST_SHOP_TYPE_EQUIP)
		ViewManager.Instance:Open(ViewName.RollingBarrageView)
	end
end

function TreasureContentView:GetNumberOfCells()
	local temp = (#self.item_cfg_list/2)%4
	if temp == 0 then
		return #self.item_cfg_list/2
	else
		return #self.item_cfg_list/2 + (4 - temp)
	end
end

function TreasureContentView:RefreshCell(cell, cell_index)
	local contain_cell = self.contain_cell_list[cell]
	if contain_cell == nil then
		contain_cell = TreasureShowCell.New(cell.gameObject,self)
		self.contain_cell_list[cell] = contain_cell
	end
	cell_index = cell_index + 1
	contain_cell:SetIndex(cell_index)
	contain_cell:Flush()
end

function TreasureContentView:CheckBoxClick()
	local treasure_data = TreasureData.Instance
	local is_shield = treasure_data:GetIsShield()
	treasure_data:SetIsShield(not is_shield)
	self.show_mask:SetValue(not is_shield)
end

function TreasureContentView:OnFlush()
	local zhen_xi_list = TreasureData.Instance:GetXunBaoZhenXiCfg()
	self.show_frame:SetData(zhen_xi_list[1].rare_item_id)
	self:FlushTime()
	self:FlushText()

	self.dan_mu_toggle.isOn = RollingBarrageData.Instance:GetRecordBarrageState(CHEST_SHOP_TYPE.CHEST_SHOP_TYPE_EQUIP)
end

function TreasureContentView:DeleteTimeQuest()
	if self.timer_quest then
		GlobalTimerQuest:CancelQuest(self.timer_quest)
		self.timer_quest = nil
	end
end

function TreasureContentView:FlushTime()
	self:DeleteTimeQuest()
	self.timer_quest = GlobalTimerQuest:AddRunQuest(function()
		local can_chest_time = TreasureData.Instance:GetChestFreeTime()
		local remain_time = can_chest_time - TimeCtrl.Instance:GetServerTime()
		self.show_free_text:SetValue(remain_time < 0)
		if remain_time < 0 then
			self.show_coin_text:SetValue(false)
			GlobalTimerQuest:CancelQuest(self.timer_quest)
		else
			local time_str = string.format(Language.Treasure.ShowFreeTime, TimeUtil.FormatSecond(remain_time))
			self.open_one_free_text:SetValue(time_str)
		end
	end, 0)
end

function TreasureContentView:FlushText()
	local cfg = TreasureData.Instance:GetOtherCfg()
	local item_1 = cfg.equip_use_itemid
	local item_2 = cfg.equip_10_use_itemid
	local item_3 = cfg.equip_30_use_itemid
	local item_data = ItemData.Instance
	local my_item_1_count = item_data:GetItemNumInBagById(item_1)
	local my_item_2_count = item_data:GetItemNumInBagById(item_2)
	local my_item_3_count = item_data:GetItemNumInBagById(item_3)

	local can_chest_time = TreasureData.Instance:GetChestFreeTime()
	local remain_time = can_chest_time - TimeCtrl.Instance:GetServerTime()
	local is_free = remain_time <= 0
	if is_free then
		self.show_coin_text:SetValue(false)
		self.show_free_text:SetValue(true)
	else
		self.show_free_text:SetValue(false)
	end
	self.show_key_one_text:SetValue(my_item_1_count > 0 and not is_free)
	self.show_key_ten_text:SetValue(my_item_2_count > 0)
	self.show_key_fifty_text:SetValue(my_item_3_count > 0)

	self.show_coin_text:SetValue(my_item_1_count <= 0 and not is_free)
	self.show_ten_coin_text:SetValue(my_item_2_count <= 0)
	self.show_fifty_coin_text:SetValue(my_item_3_count <= 0)

	self.key_one_text:SetValue(item_data:GetItemConfig(item_1).name..Language.Common.X.. my_item_1_count)
	self.key_ten_text:SetValue(item_data:GetItemConfig(item_2).name..Language.Common.X.. my_item_2_count)
	self.key_fifty_text:SetValue(item_data:GetItemConfig(item_3).name..Language.Common.X.. my_item_3_count)
end

----------------------------------------------------------------------
TreasureFrameItem = TreasureFrameItem or BaseClass(BaseCell)
function TreasureFrameItem:__init()
	self.mount_display = self:FindObj("model")
	self.effect_obj_pos = self:FindObj("effect")
	self.model_view = RoleModel.New("treasure_content_view")
	self.model_view:SetDisplay(self.mount_display.ui3d_display)
	self.is_load_effect = false
	self.can_exchange = self:FindVariable("can_exchange")
end

function TreasureFrameItem:__delete()
	if nil ~= self.model_view then
		self.model_view:DeleteMe()
		self.model_view = nil
	end
	if self.time_runquest then
		GlobalTimerQuest:CancelQuest(self.time_runquest)
		self.time_runquest = nil
	end
end

function TreasureFrameItem:OnFlush()
	if self.time_runquest then
		GlobalTimerQuest:CancelQuest(self.time_runquest)
		self.time_runquest = nil
	end

	local cfg = TreasureData.Instance:GetSingleXunBaoZhenXiCfg(self.data)
	local asset, name = ResPath.GetModelAsset(cfg.model_type, self.data)
	self.model_view:SetMainAsset(asset, name)
	self.model_view:SetTrigger(GoddessData.Instance:GetShowTriggerName(1))

	self.time_runquest = GlobalTimerQuest:AddRunQuest(function()  
	self.model_view:SetTrigger(GoddessData.Instance:GetShowTriggerName(1)) 
	end,15) --播放一次动画

	self:SetModelEffect()
	self.model_view:SetTransform(TreasureData.Instance:GetModelCfg())

	local now_day = TimeCtrl.Instance:GetCurOpenServerDay()
	self.can_exchange:SetValue(now_day <= 7)
end

function TreasureFrameItem:SetModelEffect()
	-- if not self.is_load_effect then
	-- 	self.is_load_effect = true
	-- 	local bundle = "effects/prefabs"
	-- 	local asset = "UI_tongyongbaoju_1"

	-- 	PrefabPool.Instance:Load(AssetID(bundle, asset), function(prefab)
	-- 		if prefab then
	-- 				if self.effect_obj  ~= nil then
	-- 					GameObject.Destroy(self.effect_obj)
	-- 					self.effect_obj = nil
	-- 				end
	-- 				local obj = GameObject.Instantiate(prefab)
	-- 				PrefabPool.Instance:Free(prefab)

	-- 				local transform = obj.transform
	-- 				transform:SetParent(self.effect_obj_pos.transform, false)
	-- 				self.effect_obj = obj.gameObject
	-- 				self.effect_obj.transform.localScale = Vector3(1, 1, 1)
	-- 				self.is_load_effect = false
	-- 				end
	-- 		end)
	-- end
end
----------------------------------------------------------------
--------------cell----------------------------------------------
----------------------------------------------------------------
TreasureShowCell = TreasureShowCell  or BaseClass(BaseCell)
function TreasureShowCell:__init()
	self.item_cells = {}
	for i=1,2 do
		self.item_cells[i] = {}
		self.item_cells[i] = ItemCell.New()
		self.item_cells[i]:SetInstanceParent(self:FindObj("item_"..i))
	end
	self.show_cfg = TreasureData.Instance:GetShowCfg()
end

function TreasureShowCell:__delete()
	for i=1,2 do
		if self.item_cells[i] then
			self.item_cells[i]:DeleteMe()
		end
	end
end

function TreasureShowCell:OnFlush()
	for i=1,2 do
		local index = CommonDataManager.GetCellIndexList(self.index, 4, 2)[i]
		self.item_cells[i]:SetData(self.show_cfg[index])
		self.item_cells[i]:IsDestoryActivityEffect(index > 6)
		self.item_cells[i]:SetActivityEffect()
	end
end

