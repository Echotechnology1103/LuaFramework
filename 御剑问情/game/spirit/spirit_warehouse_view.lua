SpiritWarehouseView = SpiritWarehouseView or BaseClass(BaseView)

-- 常亮定义
local MAX_GRID_NUM = 120
local ROW = 4
local COLUMN = 6

function SpiritWarehouseView:__init()
	self.ui_config = {"uis/views/spiritview_prefab","WarehouseContent"}

end

function SpiritWarehouseView:__delete()

end


function SpiritWarehouseView:ReleaseCallBack()
   	if self.cell_list ~= nil then
		for k, v in pairs(self.cell_list) do
			v:DeleteMe()
		end
	end
	self.cell_list = nil
	self.page_count = nil
	self.page_toggle_list = nil
	self.list_view = nil
	self.show_toggle_list = nil
	self.auto_purple = nil
end


function SpiritWarehouseView:LoadCallBack()
	self.cell_list = {}
	self.list_view = self:FindObj("ListView")
	local list_delegate = self.list_view.list_simple_delegate
	list_delegate.NumberOfCellsDel = BindTool.Bind(self.GetNumOfCells, self)
	list_delegate.CellRefreshDel = BindTool.Bind(self.RefreshCell, self)
	self:ListenEvent("OnClickRecovery", BindTool.Bind(self.OnClickRecovery, self))
	self:ListenEvent("OnClickTakeOut", BindTool.Bind(self.OnClickTakeOut, self))
	self:ListenEvent("CloseView", BindTool.Bind(self.CloseView, self))
    -- self.show_warehouse = self:FindVariable("ShowWareHouse1")
    -- self.show_warehouse:SetValue(true)

	self.page_toggle_list = {}
	for i=1,14 do
		self.page_toggle_list[i] = self:FindObj("PageToggle" .. i).toggle
	end

	self.show_toggle_list = {}
	for i=1, 9 do
		self.show_toggle_list[i] = self:FindVariable("ShowPageToggle" .. i + 5 )
	end

	self.auto_purple = self:FindObj("AutoPurple")
	self.page_count = 5
	self:FlushBagView()
end

function SpiritWarehouseView:CloseView()
	self:Close()
end

function SpiritWarehouseView:GetNumOfCells()
	local item_list = SpiritData.Instance:GetHuntSpiritWarehouseList()
	local diff = #item_list - MAX_GRID_NUM
	local more_then_num = ((diff > 0)) and (math.ceil(diff / ROW / COLUMN)) or 0
	return (MAX_GRID_NUM + more_then_num * ROW * COLUMN) / ROW
end

function SpiritWarehouseView:RefreshCell(cell, data_index)
	local item_list = SpiritData.Instance:GetHuntSpiritWarehouseList()
	local group = self.cell_list[cell]
	if group == nil then
		group = SpiritItemGroup.New(cell.gameObject)
		group:SetToggleGroup(self.list_view.toggle_group)
		self.cell_list[cell] = group
	end

	local page = math.floor(data_index / COLUMN)
	local column = data_index - page * COLUMN
	local grid_count = COLUMN * ROW
	for i = 1, ROW do
		local index = (i - 1) * COLUMN + column + (page * grid_count)
		local data = item_list[index + 1]
		data = data or {}
		if data.index == nil then
			data.index = index
		end
		group:SetData(i, data)
		group:ListenClick(i, BindTool.Bind(self.OnClickCell, self, data, group, i))
		group:SetInteractable(i, nil ~= data.item_id)
		group:SetHighLight(i, false)
	end
end

function SpiritWarehouseView:FlushBagView()
	if self.list_view then
		if self.list_view.scroller.isActiveAndEnabled then
			local item_list = SpiritData.Instance:GetHuntSpiritWarehouseList()
			local diff = #item_list - MAX_GRID_NUM
			local more_then_num = ((diff > 0)) and (math.ceil(diff / ROW / COLUMN)) or 0
			local list_page_scroll = self.list_view.list_page_scroll

			if more_then_num > 0 and more_then_num <= 5 then
				for i = 1, more_then_num do
					self.show_toggle_list[i]:SetValue(true)
				end
				if more_then_num ~= 5 then
					for i = more_then_num + 1, 5 do
						self.show_toggle_list[i]:SetValue(false)
					end
				end
			else
				for i = 1, more_then_num do
					self.show_toggle_list[i]:SetValue(false)
				end
			end
			list_page_scroll:SetPageCount(more_then_num + 5)

			if self.page_count ~= (more_then_num + 5) then
				self.list_view.scroller:ReloadData(0)
				if self.cur_index then
					local page = self.cur_index > 0 and (math.floor(self.cur_index / ROW / COLUMN) + 1) or 1
					if self.cur_index > 0 and self.cur_index % (ROW * COLUMN) == 0 then
						page = page - 1
					end

					list_page_scroll:JumpToPageImmidate(page)
					self.page_toggle_list[page].isOn = true
				end
			else
				self.list_view.scroller:RefreshActiveCellViews()
			end

			self.cur_index = -1
			self.page_count = more_then_num + 5
		end
	end
end

function SpiritWarehouseView:OnClickCell(data, group, group_index)
	self.cur_index = data.index
	group:SetHighLight(group_index, false)
	local close_call_back = function()
		self.cur_index = nil
		group:SetHighLight(group_index, false)
		-- group:SetToggle(group_index,false)
	end
	TipsCtrl.Instance:OpenItem(data, TipsFormDef.FROM_STORGE_ON_SPRITRT_STORGE, nil, close_call_back)
end

function SpiritWarehouseView:OnClickRecovery()
	local func1 = function ()
		SpiritCtrl.Instance:SendRecoverySpirit(CHEST_SHOP_TYPE.CHEST_SHOP_TYPE_JINGLING, GameEnum.ITEM_COLOR_PURPLE)
	end
	if self.auto_purple.toggle.isOn then
		TipsCtrl.Instance:ShowCommonTip(func1, nil, Language.JingLing.OneKeyRecylePurple , nil, nil, false, false)
		return
	end
	local func2 = function ()
		SpiritCtrl.Instance:SendRecoverySpirit(CHEST_SHOP_TYPE.CHEST_SHOP_TYPE_JINGLING, GameEnum.ITEM_COLOR_BLUE)
	end
	TipsCtrl.Instance:ShowCommonTip(func2, nil, Language.JingLing.OneKeyRecyle , nil, nil, false, false)
end

function SpiritWarehouseView:OnClickTakeOut()
	SpiritCtrl.Instance:SendTakeOutJingLingReq(-1, 1, CHEST_SHOP_TYPE.CHEST_SHOP_TYPE_JINGLING)
end


-- 精灵仓库格子
SpiritItemGroup = SpiritItemGroup or BaseClass(BaseRender)

function SpiritItemGroup:__init(instance)
	self.cells = {}
	for i = 1, 4 do
		self.cells[i] = ItemCell.New()
		self.cells[i]:SetInstanceParent(self:FindObj("Item"..i))
	end
end

function SpiritItemGroup:__delete()
	for k, v in pairs(self.cells) do
		v:DeleteMe()
	end
	self.cells = {}
end

function SpiritItemGroup:SetData(i, data)
	self.cells[i]:SetData(data)
end

function SpiritItemGroup:ListenClick(i, handler)
	self.cells[i]:ListenClick(handler)
end

function SpiritItemGroup:SetToggleGroup(toggle_group)
	self.cells[1]:SetToggleGroup(toggle_group)
	self.cells[2]:SetToggleGroup(toggle_group)
	self.cells[3]:SetToggleGroup(toggle_group)
	self.cells[4]:SetToggleGroup(toggle_group)
end

function SpiritItemGroup:SetHighLight(i, enable)
	self.cells[i]:SetHighLight(false)
end

function SpiritItemGroup:ShowHighLight(i, enable)
	self.cells[i]:ShowHighLight(enable)
end

function SpiritItemGroup:SetInteractable(i, enable)
	self.cells[i]:SetInteractable(enable)
end

function SpiritItemGroup:SetToggle(i, enable)
	self.cells[i]:SetToggle(enable)
end