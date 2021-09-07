MarryEquipInfoView = MarryEquipInfoView or BaseClass(BaseRender)


local EquipIdList = {[0] = {[0] = 50511, 51511, 52511, 53511}, [1] = {[0] = 50111, 51111, 52111, 53111}}

function MarryEquipInfoView:__init(instance, mother_view)
	self.equip_t = {}
	self.up_t = {}
	self.lover_equip_t = {}
end

function MarryEquipInfoView:LoadCallBack()
	self.all_cap = self:FindVariable("AllCap")
	self.marry_lv = self:FindVariable("MarryLevel")
	self.lover_cap = self:FindVariable("LoverCap")
	self.lover_marry_lv = self:FindVariable("LoverMarryLevel")
	self.my_sex = self:FindVariable("MySex")
	self.has_lover = self:FindVariable("HasLover")
	self.add_per = self:FindVariable("AddPer")
	local equip_add_per = ConfigManager.Instance:GetAutoConfig("qingyuanconfig_auto").other[1].equip_add_per or 0
	self.add_per:SetValue(equip_add_per / 100)

	self.display = self:FindObj("Display")
	self.model = RoleModel.New("marry_equip_view", 300)
	self.model:SetDisplay(self.display.ui3d_display)

	self.lover_display = self:FindObj("LoverDisplay")
	self.lover_model = RoleModel.New("marry_equip_view", 500)
	self.lover_model:SetDisplay(self.lover_display.ui3d_display)

	for i=0,3 do
		local item_cell = ItemCell.New()
		item_cell:SetInstanceParent(self:FindObj("Equip" .. i + 1))
		item_cell.root_node.transform:SetAsFirstSibling()
		local data = {}
		data.item_id = EquipIdList[self.sex or 1][i]
		item_cell:SetData(data)
		item_cell:ShowQuality(false)
		item_cell:SetIconGrayScale(true)
		item_cell:ListenClick(BindTool.Bind(self.EquipClick, self, i, item_cell))
		self.equip_t[i] = item_cell
		self.up_t[i] = self:FindVariable("ShowUp" .. i + 1)
	end

	for i=0,3 do
		local item_cell = ItemCell.New()
		item_cell:SetInstanceParent(self:FindObj("LoverEquip"))
		local data = {}
		data.item_id = EquipIdList[self.sex == 1 and 0 or 1][i]
		item_cell:SetData(data)
		item_cell:ShowQuality(false)
		item_cell:SetIconGrayScale(true)
		item_cell:SetIsShowGrade(false)
		item_cell:ListenClick(BindTool.Bind(self.LoverEquipClick, self, i, item_cell))
		self.lover_equip_t[i] = item_cell
	end
	self.sex = GameVoManager.Instance:GetMainRoleVo().sex

	self:ListenEvent("OnClickTuodan",BindTool.Bind(self.OnClickTuodan, self))
	self:OpenCallBack()
end

function MarryEquipInfoView:__delete()
	if self.equip_t then
		for k,v in pairs(self.equip_t) do
			v:DeleteMe()
		end
		self.equip_t = {}
	end
	if self.lover_equip_t then
		for k,v in pairs(self.lover_equip_t) do
			v:DeleteMe()
		end
		self.lover_equip_t = {}
	end
	if self.model then
		self.model:DeleteMe()
		self.model = nil
	end
	if self.lover_model then
		self.lover_model:DeleteMe()
		self.lover_model = nil
	end
end

function MarryEquipInfoView:LoverEquipClick(index, cell)
	local marry_equip_info = MarryEquipData.Instance:GetLoverMarryEquipInfo()
	if marry_equip_info[index] and marry_equip_info[index].item_id > 0 then
		local close_callback = function ()
			cell:SetHighLight(false)
		end
		TipsCtrl.Instance:OpenItem(cell:GetData(), nil, nil, close_callback)
	else
		cell:SetHighLight(false)
		if GameVoManager.Instance:GetMainRoleVo().lover_uid <= 0 then
			TipsCtrl.Instance:ShowSystemMsg(Language.Marriage.SuitTips)
		end
	end
end

function MarryEquipInfoView:EquipClick(index, cell)
	local better_equip = MarryEquipData.Instance:GetMaxCapEquip(index)
	if better_equip then
		PackageCtrl.Instance:SendUseItem(better_equip.index, 1, index, 0)
		cell:SetHighLight(false)
	else
		local marry_equip_info = MarryEquipData.Instance:GetMarryEquipInfo()
		if marry_equip_info[index] and marry_equip_info[index].item_id > 0 then
			local close_callback = function ()
				cell:SetHighLight(false)
			end
			TipsCtrl.Instance:OpenItem(cell:GetData(), TipsFormDef.FROM_BAG_EQUIP, {fromIndex = index}, close_callback)
		else
			cell:SetHighLight(false)
			TipsCtrl.Instance:ShowSystemMsg(Language.Marriage.MarryEquipGetTips)
		end
	end
end

function MarryEquipInfoView:OnClickTuodan()
	MarriageCtrl.Instance:ShowMonomerView()
end

function MarryEquipInfoView:OpenCallBack()
	self:Flush()
end

function MarryEquipInfoView:OnFlush()
	self:FlushDisPlay()
	local marry_info = MarryEquipData.Instance:GetMarryInfo()
	local marry_equip_info = MarryEquipData.Instance:GetMarryEquipInfo()
	for k, v in pairs(marry_equip_info) do
		if v.item_id <= 0 then
			local data = {}
			data.item_id = EquipIdList[self.sex or 1][k]
			self.equip_t[k]:SetData(data)
			self.equip_t[k]:SetIconGrayScale(true)
			self.equip_t[k]:SetIsShowGrade(false)
			self.equip_t[k]:ShowQuality(false)
			-- self.equip_t[k]:ShowEquipGrade(false)
		else

			self.equip_t[k]:SetData(v)
			self.equip_t[k]:SetIconGrayScale(false)
			--显示品质
			self.equip_t[k]:ShowQuality(true)
		end
	end
	for k,v in pairs(self.up_t) do
		v:SetValue(MarryEquipData.Instance:GetMaxCapEquip(k) ~= nil)
	end
	local all_cap = MarryEquipData.Instance:GetMarryEquipAllCap()
	self.all_cap:SetValue(all_cap)
	self.marry_lv:SetValue(marry_info.marry_level)

	local lover_marry_info = MarryEquipData.Instance:GetLoverMarryInfo()
	local lover_marry_equip_info = MarryEquipData.Instance:GetLoverMarryEquipInfo()
	for k, v in pairs(lover_marry_equip_info) do
		if v.item_id <= 0 then
			local data = {}
			data.item_id = EquipIdList[self.sex == 1 and 0 or 1][k]
			self.lover_equip_t[k]:SetData(data)
			self.lover_equip_t[k]:SetIconGrayScale(true)
			self.lover_equip_t[k]:SetIsShowGrade(false)
			self.lover_equip_t[k]:ShowQuality(false)
			-- self.lover_equip_t[k]:ShowEquipGrade(false)
		else

			self.lover_equip_t[k]:SetData(v)
			self.lover_equip_t[k]:SetIconGrayScale(false)
			--显示品质
			self.lover_equip_t[k]:ShowQuality(true)
		end
	end
	all_cap = MarryEquipData.Instance:GetLoverMarryEquipAllCap()
	self.lover_cap:SetValue(all_cap)
	self.lover_marry_lv:SetValue(lover_marry_info.marry_level)
end

function MarryEquipInfoView:FlushDisPlay()
	local main_role_vo = GameVoManager.Instance:GetMainRoleVo()
	local role_vo = {}
	role_vo.prof = main_role_vo.prof
	role_vo.sex = main_role_vo.sex
	role_vo.appearance = {}
	local model_data =  MarriageData.Instance:GetModelCfgById(role_vo.prof)
	role_vo.appearance.fashion_wuqi = model_data.weapon_model
	role_vo.appearance.fashion_body = model_data.role_model
	self.model:SetModelResInfo(role_vo, true, true, true)

	--有伴侣才加载伴侣模型
	GlobalTimerQuest:AddDelayTimer(function()
		if main_role_vo.lover_uid > 0 then
			local lover_vo = {}
			lover_vo.prof = MarriageData.Instance:GetLoverProf()
			lover_vo.sex = main_role_vo.sex == 0 and 1 or 0
			lover_vo.appearance = {}
			local model_data =  MarriageData.Instance:GetModelCfgById(lover_vo.prof)
			lover_vo.appearance.fashion_wuqi = model_data.weapon_model
			lover_vo.appearance.fashion_body = model_data.role_model
			self.lover_model:SetModelResInfo(lover_vo, true, true, true)
		end
	end, 0)
	self.my_sex:SetValue(self.sex or 0)
	self.has_lover:SetValue(main_role_vo.lover_uid > 0)
end