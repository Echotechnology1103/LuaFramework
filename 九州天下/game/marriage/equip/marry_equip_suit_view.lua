MarryEquipSuitView = MarryEquipSuitView or BaseClass(BaseRender)
order = {
	"一",
	"二",
	"三",
	"四",
	"五",
	"六",
	"七",
	"八",
	"九",
	"十",
}
function MarryEquipSuitView:__init(instance, mother_view)
	self.current_suit_index = 0
	self.item_cell_list = {}
	self.item_cell_list_1 = {}
	self.contain_cell_list = {}
end

function MarryEquipSuitView:LoadCallBack()
	MarryEquipSuitView.Instance = self
	self.main_role_vo = GameVoManager.Instance:GetMainRoleVo()
	self.qingyuan_equip_handbook = MarryEquipData.Instance:GetCurrentHandBook()

	self.model_display = self:FindObj("ModelDisplay")
	self.model_display_1 = self:FindObj("ModelDisplay1")
	self.list_view = self:FindObj("ListView")
	local list_delegate = self.list_view.list_simple_delegate
	list_delegate.NumberOfCellsDel = BindTool.Bind(self.GetNumberOfCells, self)
	list_delegate.CellRefreshDel = BindTool.Bind(self.RefreshCell, self)

	self.item_cell_list_obj = self:FindObj("EquipList")
	for i = 0, 3 do
		local equip_obj = self.item_cell_list_obj.transform:GetChild(i).gameObject
		local equip_cell = MarryEquipSuitEquipItem.New(equip_obj)
		equip_cell:SetSuitType(self.current_suit_index)
		equip_cell:SetIndex(i)
		equip_cell:SetSex(self.main_role_vo.sex)
		equip_cell:SetData(self.qingyuan_equip_handbook[self.current_suit_index][i + 1])
		table.insert(self.item_cell_list, equip_cell)
	end

	--if self.main_role_vo.lover_uid > 0 then
		self.item_cell_list_obj_1 = self:FindObj("EquipList1")
		for i = 0, 3 do
			local equip_obj = self.item_cell_list_obj_1.transform:GetChild(i).gameObject
			local equip_cell = LoverMarryEquipSuitEquipItem.New(equip_obj)
			equip_cell:SetSuitType(self.current_suit_index)
			equip_cell:SetIndex(i)
			equip_cell:SetSex(self.main_role_vo.sex == 0 and 1 or 0)
			equip_cell:SetData(self.qingyuan_equip_handbook[self.current_suit_index][i + 1])
			table.insert(self.item_cell_list_1, equip_cell)
		end
	--end

	self.is_self = self:FindVariable("is_self")
	self:ListenEvent("ClickFere", BindTool.Bind(self.ClickFere, self))
	self:ListenEvent("ClickHelp", BindTool.Bind(self.ClickHelp, self))
	self:ListenEvent("ClickGetPere", BindTool.Bind(self.ClickGetPere, self))
	self.fight_power = self:FindVariable("fight_power")
	self.fight_power_1 = self:FindVariable("fight_power1")
	self.has_pere = self:FindVariable("has_pere")
	self.is_man = self:FindVariable("is_man")
	self.lover_marry_info = self:FindVariable("lover_marry_info")
	self.lover_marry_info_1 = self:FindVariable("lover_marry_info_1")
	self.add_percent = self:FindVariable("add_percent")
	self:OpenCallBack()
end

function MarryEquipSuitView:__delete()
	for k,v in pairs(self.item_cell_list) do
		v:DeleteMe()
	end
	self.item_cell_list = {}

	for k,v in pairs(self.item_cell_list_1) do
		v:DeleteMe()
	end
	self.item_cell_list_1 = {}

	for k,v in pairs(self.contain_cell_list) do
		v:DeleteMe()
	end
	self.contain_cell_list = {}

	if nil ~= self.model then
		self.model:DeleteMe()
		self.model = nil
	end

	if nil ~= self.model_1 then
		self.model_1:DeleteMe()
		self.model_1 = nil
	end
end

function MarryEquipSuitView:OpenCallBack()
	if self.is_self then
		self.is_self:SetValue(true)
	end
	self:Flush()
end

function MarryEquipSuitView:OnFlush()
	self:FlushView()
end

function MarryEquipSuitView:FlushView()
	self.lover_marry_info_1:SetValue(MarryEquipData.Instance:GetLoverMarryInfo().marry_level)
	self.lover_marry_info:SetValue(MarryEquipData.Instance:GetMarryInfo().marry_level)
	self:FlushModel()
	self.main_role_vo = GameVoManager.Instance:GetMainRoleVo()
	self:FlushLeftCell()
	self.list_view.scroller:ReloadData(0)
end

function MarryEquipSuitView:GetNumberOfCells()
	return #self.qingyuan_equip_handbook + 1
end

function MarryEquipSuitView:RefreshCell(cell, cell_index)
	local contain_cell = self.contain_cell_list[cell]
	if contain_cell == nil then
		contain_cell = MarryEquipSuitViewItem.New(cell.gameObject)
		self.contain_cell_list[cell] = contain_cell
		contain_cell:SetClickCallBack(BindTool.Bind(self.OnClickSuit, self))
		contain_cell:SetToggleGroup(self.list_view.toggle_group)
	end
	cell_index = cell_index + 1
	contain_cell:SetIndex(cell_index)
	contain_cell:SetSex(self.main_role_vo.sex)
	contain_cell:SetData(self.qingyuan_equip_handbook[cell_index - 1])
	if (cell_index - 1) ~= self.current_suit_index then
		contain_cell.bg_toggle.toggle.isOn = false
	else
		contain_cell.bg_toggle.toggle.isOn = true
	end
end

function MarryEquipSuitView:FlushFightPower()
	local power = 0
	local all_equip_info = self.qingyuan_equip_handbook[self.current_suit_index]
	for i = 0, 3 do
		if MarryEquipData.Instance:GetMarrySuitActive(self.current_suit_index, i) then
			power = power + CommonDataManager.GetCapability(all_equip_info[ i + 1])
		end
	end
	self.fight_power:SetValue(power)

	self.add_percent:SetValue(all_equip_info[1].banlv_add_per * 0.01)

	power = 0
	for i = 0, 3 do
		if MarryEquipData.Instance:GetLoverMarrySuitActive(self.current_suit_index, i) then
			power = power + CommonDataManager.GetCapability(all_equip_info[ i + 1])
		end
	end
 	self.fight_power_1:SetValue(power)
end

function MarryEquipSuitView:FlushModel()
	if nil == self.model then
		self.model = RoleModel.New("marry_equip_view", 200)
		self.model:SetDisplay(self.model_display.ui3d_display)
	end

	local role_vo = {}
	role_vo.prof = self.main_role_vo.prof
	role_vo.sex = self.main_role_vo.sex
	role_vo.appearance = {}
	local model_data =  MarriageData.Instance:GetModelCfgById(role_vo.prof)
	role_vo.appearance.fashion_wuqi = model_data.weapon_model
	role_vo.appearance.fashion_body = model_data.role_model
	self.model:SetModelResInfo(role_vo, true, true, true)	

		--有伴侣才加载伴侣模型
	if self.main_role_vo.lover_uid > 0 then
		self.has_pere:SetValue(true)
		if nil == self.model_1 then
			self.model_1 = RoleModel.New("marry_equip_view", 400)
			self.model_1:SetDisplay(self.model_display_1.ui3d_display)
		end
		local lover_vo = {}
		lover_vo.prof = MarriageData.Instance:GetLoverProf()
		lover_vo.sex = self.main_role_vo.sex == 0 and 1 or 0
		lover_vo.appearance = {}
		local model_data =  MarriageData.Instance:GetModelCfgById(lover_vo.prof)
		lover_vo.appearance.fashion_wuqi = model_data.weapon_model
		lover_vo.appearance.fashion_body = model_data.role_model
		self.model_1:SetModelResInfo(lover_vo, true, true, true)
	else
		self.is_man:SetValue(self.main_role_vo.sex == 1)
		self.has_pere:SetValue(false)
	end
end

function MarryEquipSuitView:OnFlush()
	self:FlushFightPower()
	self:FlushView()
	self:FlushModel()
	self:FlushLeftCell()
end

function MarryEquipSuitView:OnClickSuit(suit_cell)
	self.current_suit_index = suit_cell:GetIndex() - 1
	self:FlushLeftCell()
	if not suit_cell:GetActive() then
		local str = string.format(Language.Marriage.SuitTips1, order[self.current_suit_index + 1])
		SysMsgCtrl.Instance:ErrorRemind(str)
	end
end

function MarryEquipSuitView:FlushLeftCell()
	for k,v in pairs(self.item_cell_list) do
		v:SetSuitType(self.current_suit_index)
		v:SetIndex(k)
		v:SetSex(self.main_role_vo.sex)
		v:SetData(self.qingyuan_equip_handbook[self.current_suit_index][k])
	end
	for k,v in pairs(self.item_cell_list_1) do
		v:SetSuitType(self.current_suit_index)
		v:SetIndex(k)
		v:SetSex(self.main_role_vo.sex == 0 and 1 or 0)
		v:SetData(self.qingyuan_equip_handbook[self.current_suit_index][k])
	end
	self:FlushFightPower()
end

function MarryEquipSuitView:ClickFere()
	if self.main_role_vo.lover_uid > 0 then
		self.is_self:SetValue(not self.is_self:GetBoolean())
		self.current_suit_index = 0
		self:FlushView()
	end
end

function MarryEquipSuitView:ClickHelp()
	TipsCtrl.Instance:ShowHelpTipView(227)
end

function MarryEquipSuitView:ClickGetPere()
	MarriageCtrl.Instance:ShowMonomerView()
end
----------------------------MarryEquipSuitEquipItem-----------------------------------
MarryEquipSuitEquipItem = MarryEquipSuitEquipItem or BaseClass(BaseCell)
function MarryEquipSuitEquipItem:__init()
	self.show_red_point = self:FindVariable("ShowRedPoint")
	self:ListenEvent("ClickEquipQuick", BindTool.Bind(self.ClickEquipQuick, self))
	self.item_cell_obj = self:FindObj("item")
	self.is_can_equip = self:FindVariable("is_can_equip")
	self.item_cell = ItemCell.New()
	self.item_cell:SetInstanceParent(self.item_cell_obj)
	self.item_cell:ListenClick(BindTool.Bind(self.OnClick, self))
end

function MarryEquipSuitEquipItem:__delete()
	if self.item_cell then
		self.item_cell:DeleteMe()
		self.item_cell = nil
	end
end

function MarryEquipSuitEquipItem:OnClick()
	if not self.is_active then
		SysMsgCtrl.Instance:ErrorRemind(Language.Marriage.MarryEquipGetTips)
		self.item_cell:ShowHighLight(false)
	else
		self.item_cell:OnClickItemCell()
	end
end

function MarryEquipSuitEquipItem:SetSuitType(suit_type)
	self.suit_type = suit_type
end

function MarryEquipSuitEquipItem:SetSex(sex)
	self.sex = sex
end

function MarryEquipSuitEquipItem:OnFlush()
	self.data = self:GetData()
	if not next(self.data) then
		return 
	end
	self.item_id = 0
	if self.sex == 1 then
		self.item_id = self.data.man_item
	else
		self.item_id = self.data.woman_item
	end
	self.item_cell:SetData({item_id = self.item_id,})
	self.is_active = MarryEquipData.Instance:GetMarrySuitActive(self.suit_type,self.data.slot)
	self.item_cell:ShowQuality(self.is_active)
	self.item_cell:SetIsShowGrade(self.is_active)
	self.item_cell:SetIconGrayScale(not self.is_active)
	self.is_can_equip:SetValue(MarryEquipData.Instance:CanBeUpGrade(self.suit_type, self.data.slot))
end

function MarryEquipSuitEquipItem:ClickEquipQuick()
	local index_in_bag = ItemData.Instance:GetItemIndex(self.item_id)
	MarryEquipCtrl.Instance.SendActiveQingyuanSuit(self.suit_type, self.data.slot, index_in_bag)
end

--------------------------------------------------------------------------
LoverMarryEquipSuitEquipItem = LoverMarryEquipSuitEquipItem or BaseClass(BaseCell)
function LoverMarryEquipSuitEquipItem:__init()
	self.show_red_point = self:FindVariable("ShowRedPoint")
	self.item_cell_obj = self:FindObj("item")
	self.item_cell = ItemCell.New()
	self.item_cell:SetInstanceParent(self.item_cell_obj)
	self.item_cell:ListenClick(BindTool.Bind(self.OnClick, self))
end

function LoverMarryEquipSuitEquipItem:__delete()
	if self.item_cell then
		self.item_cell:DeleteMe()
		self.item_cell = nil
	end
end

function LoverMarryEquipSuitEquipItem:OnClick()
	if not self.is_active then
		SysMsgCtrl.Instance:ErrorRemind(Language.Marriage.SuitTips)
		self.item_cell:ShowHighLight(false)
	else
		self.item_cell:OnClickItemCell()
	end
end

function LoverMarryEquipSuitEquipItem:SetSuitType(suit_type)
	self.suit_type = suit_type
end

function LoverMarryEquipSuitEquipItem:SetSex(sex)
	self.sex = sex
end

function LoverMarryEquipSuitEquipItem:OnFlush()
	self.data = self:GetData()
	if not next(self.data) then
		return 
	end
	self.item_id = 0
	if self.sex == 1 then
		self.item_id = self.data.man_item
	else
		self.item_id = self.data.woman_item
	end
	self.item_cell:SetData({item_id = self.item_id,})
	self.is_active = MarryEquipData.Instance:GetLoverMarrySuitActive(self.suit_type,self.data.slot)
	self.item_cell:ShowQuality(self.is_active)
	self.item_cell:SetIsShowGrade(self.is_active)
	self.item_cell:SetIconGrayScale(not self.is_active)
end

----------------------------MarryEquipSuitViewItem------------------------------------
MarryEquipSuitViewItem = MarryEquipSuitViewItem or BaseClass(BaseCell)

function MarryEquipSuitViewItem:__init()
	self.suit_name = self:FindVariable("suit_name")
	self.suit_count = self:FindVariable("suit_count")
	self:ListenEvent("OnClickSuit", BindTool.Bind(self.OnClick, self))
	self.item_cell_obj = self:FindObj("item")
	self.bg_toggle = self:FindObj("bg_toggle")
	self.show_rep = self:FindVariable("show_rep")
	self.order = self:FindVariable("order")
	self.is_active = self:FindVariable("is_active")
	self.item_cell = ItemCell.New()
	self.item_cell:SetInstanceParent(self.item_cell_obj)
end

function MarryEquipSuitViewItem:__delete()
	if self.item_cell then
		self.item_cell:DeleteMe()
		self.item_cell = nil
	end
end

function MarryEquipSuitViewItem:SetSex(sex)
	self.sex = sex
end

function MarryEquipSuitViewItem:SetIndex(index)
	self.index = index
end

function MarryEquipSuitViewItem:GetActive()
	return self.is_active:GetBoolean()
end

function MarryEquipSuitViewItem:OnFlush()
	self.show_rep:SetValue(false)
	self.order:SetValue(order[self.index])
	self.data = self:GetData()
	if next(self.data) then
		self.suit_name:SetValue(self.data[1].name)
		self.item_cell:SetData({item_id = self.data[1].res,})
		self.item_cell.show_equip_grade:SetValue(false)
		local count = 0
		for i = 0, 3 do
			if MarryEquipData.Instance:GetMarrySuitActive(self.index - 1, i) then
				count = count + 1
			end
		end
		self.is_active:SetValue(MarryEquipData.Instance:IsSuitActive(self.index - 1))
		self.suit_count:SetValue(count < 4 and count.."/4" or string.format(Language.Common.ShowGreenStr,count.."/4"))
		self.show_rep:SetValue(false)
		for i = 0, 3 do
			if MarryEquipData.Instance:CanBeUpGrade(self.index - 1, i) then
				self.show_rep:SetValue(true)
				return
			end
		end	
	end
end

function MarryEquipSuitViewItem:SetToggleGroup(toggle_group)
	if self.bg_toggle.toggle then
		self.bg_toggle.toggle.group = toggle_group
	end
end