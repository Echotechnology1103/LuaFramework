LingChongHuanHuaView = LingChongHuanHuaView or BaseClass(BaseView)

function LingChongHuanHuaView:__init()
	self.ui_config = {"uis/views/advanceview_prefab", "LingChongHuanHuaView"}
	self.click_func = BindTool.Bind(self.ClickItem, self)
	self.item_change_func = BindTool.Bind(self.ItemChangeCallBack, self)
end

function LingChongHuanHuaView:__delete()
end

function LingChongHuanHuaView:ReleaseCallBack()
	if self.model then
		self.model:DeleteMe()
		self.model = nil
	end

	if self.item_cell then
		self.item_cell:DeleteMe()
		self.item_cell = nil
	end

	for _, v in pairs(self.cell_list) do
		v:DeleteMe()
	end
	self.cell_list = nil

	self.list_view = nil
	self.name = nil
	self.maxhp = nil
	self.gongji = nil
	self.fangyu = nil
	self.fight_power = nil
	self.item_str = nil
	self.is_active = nil
	self.is_max = nil
	self.power_up_value = nil
	self.is_used = nil
end

function LingChongHuanHuaView:LoadCallBack()
	self.select_index = 1

	self:ListenEvent("CloseWindow",
		BindTool.Bind(self.CloseWindow, self))
	self:ListenEvent("ClickUpGrade",
		BindTool.Bind(self.ClickUpGrade, self))
	self:ListenEvent("ClickUsed",
		BindTool.Bind(self.ClickUsed, self))

	self.name = self:FindVariable("name")
	self.maxhp = self:FindVariable("maxhp")
	self.gongji = self:FindVariable("gongji")
	self.fangyu = self:FindVariable("fangyu")
	self.fight_power = self:FindVariable("fight_power")
	self.item_str = self:FindVariable("item_str")
	self.is_active = self:FindVariable("is_active")
	self.is_max = self:FindVariable("is_max")
	self.power_up_value = self:FindVariable("power_up_value")
	self.is_used = self:FindVariable("is_used")

	self.list_data = {}
	self.cell_list = {}
	self.list_view = self:FindObj("list_view")
	local list_delegate = self.list_view.list_simple_delegate
	list_delegate.NumberOfCellsDel = BindTool.Bind(self.GetNumberOfCells, self)
	list_delegate.CellRefreshDel = BindTool.Bind(self.RefreshCell, self)

	self.model = RoleModel.New()
	self.model:SetDisplay(self:FindObj("display").ui3d_display)

	self.item_cell = ItemCell.New()
	self.item_cell:SetInstanceParent(self:FindObj("item_cell"))
end

function LingChongHuanHuaView:CloseWindow()
	self:Close()
end

function LingChongHuanHuaView:ClickUpGrade()
	local data = self.list_data[self.select_index]
	if data == nil then
		return
	end

	LingChongCtrl.Instance:SendLingChongSpecialImgUpgrade(data.image_id)
end

function LingChongHuanHuaView:ClickUsed()
	local data = self.list_data[self.select_index]
	if data == nil then
		return
	end

	--特殊形象加1000
	LingChongCtrl.Instance:SendUseLingChongImage(data.image_id + 1000)
end

function LingChongHuanHuaView:GetNumberOfCells()
	return #self.list_data
end

function LingChongHuanHuaView:RefreshCell(cell, data_index)
	data_index = data_index + 1

	local huanhua_cell = self.cell_list[cell]
	if nil == huanhua_cell then
		huanhua_cell = LingChongHuanHuaCell.New(cell.gameObject)
		huanhua_cell:SetToggleGroup(self.list_view.toggle_group)
		huanhua_cell:SetClickCallBack(self.click_func)

		self.cell_list[cell] = huanhua_cell
	end

	--重新设置高亮
	huanhua_cell:SetToggleIsOn(self.select_index == data_index)

	huanhua_cell:SetIndex(data_index)
	huanhua_cell:SetData(self.list_data[data_index])
end

function LingChongHuanHuaView:ClickItem(cell)
	if cell == nil then
		return
	end

	local data = cell:GetData()
	if data == nil then
		return
	end

	local index = cell:GetIndex()
	if self.select_index == index then
		return
	end

	self.select_index = index

	self:FlushView()
end

function LingChongHuanHuaView:FlushView()
	self:FlushContent()
	self:FlushItem()
	self:FlushModel()
end

function LingChongHuanHuaView:FlushContent()
	local data = self.list_data[self.select_index]
	if data == nil then
		return
	end

	local image_id = data.image_id

	local huanhua_cfg_info = LingChongData.Instance:GetHuanHuaCfgInfo(image_id)
	if huanhua_cfg_info == nil then
		return
	end

	local now_level = LingChongData.Instance:GetHuanHuaGrade(image_id)
	local max_level = LingChongData.Instance:GetSpecialImgMaxLevel()

	self.maxhp:SetValue(huanhua_cfg_info.maxhp)
	self.gongji:SetValue(huanhua_cfg_info.gongji)
	self.fangyu:SetValue(huanhua_cfg_info.fangyu)
	local power = CommonDataManager.GetCapabilityCalculation(huanhua_cfg_info)
	self.fight_power:SetValue(power)

	local next_hunahua_cfg_info = nil
	if now_level >= max_level then
		self.is_max:SetValue(true)
	else
		self.is_max:SetValue(false)

		--获取下一级的幻化信息
		next_hunahua_cfg_info = LingChongData.Instance:GetHuanHuaCfgInfo(image_id, now_level + 1)
	end

	if next_hunahua_cfg_info ~= nil then
		local add_power = CommonDataManager.GetCapabilityCalculation(next_hunahua_cfg_info) - power
		self.power_up_value:SetValue(add_power)
	end

	local is_active = LingChongData.Instance:GetHuanHuaIsActiveByImageId(image_id)
	self.is_active:SetValue(is_active)

	local is_used = LingChongData.Instance:GetHuanHuaIdIsUsed(image_id, true)
	self.is_used:SetValue(is_used)
end

function LingChongHuanHuaView:FlushItem()
	local data = self.list_data[self.select_index]
	if data == nil then
		return
	end

	local image_id = data.image_id

	--已满级不处理
	if LingChongData.Instance:GetHuanHuaGrade(image_id) >= LingChongData.Instance:GetSpecialImgMaxLevel() then
		self.item_str:SetValue("")
		return
	end

	local item_id = data.item_id
	self.item_cell:SetData({item_id = item_id})

	local huanhua_cfg_info = LingChongData.Instance:GetHuanHuaCfgInfo(image_id)
	if huanhua_cfg_info == nil then
		return
	end

	local item_str = ""
	local have_num = ItemData.Instance:GetItemNumInBagById(item_id)
	local need_num = huanhua_cfg_info.stuff_num
	if have_num >= need_num then
		item_str = string.format("%s / %s", ToColorStr(have_num, TEXT_COLOR.RED), need_num)
	else
		item_str = string.format("%s / %s", ToColorStr(have_num, TEXT_COLOR.BLUE_4), need_num)
	end

	self.item_str:SetValue(item_str)
end

function LingChongHuanHuaView:FlushModel()
	local data = self.list_data[self.select_index]
	if data == nil then
		return
	end

	self.model:ResetRotation()

	local main_vo = GameVoManager.Instance:GetMainRoleVo()
	local info = {}
	info.prof = main_vo.prof
	info.sex = main_vo.sex
	info.appearance = {}
	info.appearance.fashion_body = main_vo.appearance.fashion_body

	self.model:SetModelResInfo(info)
	self.model:SetLingChongResid(data.res_id)
end

function LingChongHuanHuaView:FlushList()
	self.list_data = LingChongData.Instance:GetHuanHuaCfgList() or {}
	self.list_view.scroller:ReloadData(0)
end

function LingChongHuanHuaView:FlushListRemind()
	for _, v in pairs(self.cell_list) do
		v:FlushRemind()
	end
end

function LingChongHuanHuaView:ItemChangeCallBack()
	self:Flush("flush_item")
end

function LingChongHuanHuaView:OpenCallBack()
	ItemData.Instance:NotifyDataChangeCallBack(self.item_change_func)

	self.select_index = 1

	self:FlushList()
	self:Flush()
end

function LingChongHuanHuaView:CloseCallBack()
	ItemData.Instance:UnNotifyDataChangeCallBack(self.item_change_func)
end

function LingChongHuanHuaView:OnFlush(param_t)
	for k, v in pairs(param_t) do
		if "flush_item" then
			self:FlushItem()
			self:FlushListRemind()
		else
			self:FlushView()
		end
	end
end

LingChongHuanHuaCell = LingChongHuanHuaCell or BaseClass(BaseCell)
function LingChongHuanHuaCell:__init()
	self.name = self:FindVariable("name")
	self.remind = self:FindVariable("remind")
	self.is_use = self:FindVariable("is_use")
	self.can_use = self:FindVariable("can_use")

	self.item_cell = ItemCell.New()
	self.item_cell:SetInstanceParent(self:FindObj("ItemCell"))

	self:ListenEvent("Click", BindTool.Bind(self.OnClick, self))
end

function LingChongHuanHuaCell:__delete()
	if self.item_cell then
		self.item_cell:DeleteMe()
		self.item_cell = nil
	end
end

function LingChongHuanHuaCell:SetToggleGroup(group)
	self.root_node.toggle.group = group
end

function LingChongHuanHuaCell:SetToggleIsOn(is_on)
	self.root_node.toggle.isOn = is_on
end

function LingChongHuanHuaCell:FlushRemind()
	if self.data == nil then
		return
	end

	local image_id = self.data.image_id

	--已满级没红点
	if LingChongData.Instance:GetHuanHuaGrade(image_id) >= LingChongData.Instance:GetSpecialImgMaxLevel() then
		self.remind:SetValue(false)
		return
	end

	local huanhua_cfg_info = LingChongData.Instance:GetHuanHuaCfgInfo(image_id)
	if huanhua_cfg_info == nil then
		return
	end

	if ItemData.Instance:GetItemNumIsEnough(self.data.item_id, huanhua_cfg_info.stuff_num) then
		self.remind:SetValue(true)
	else
		self.remind:SetValue(false)
	end
end

function LingChongHuanHuaCell:OnFlush()
	if self.data == nil then
		return
	end

	local image_id = self.data.image_id

	local is_active = LingChongData.Instance:GetHuanHuaIsActiveByImageId(image_id)
	self.can_use:SetValue(is_active)

	local is_use = LingChongData.Instance:GetHuanHuaIdIsUsed(image_id, true)
	self.is_use:SetValue(is_use)

	self.item_cell:SetData({item_id = self.data.item_id})

	self.name:SetValue(self.data.image_name)

	self:FlushRemind()
end