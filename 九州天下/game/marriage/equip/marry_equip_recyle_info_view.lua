MarryEquipReclyeInfoView = MarryEquipReclyeInfoView or BaseClass(BaseRender)

local BAG_MAX_GRID_NUM = 140			-- 最大格子数
local BAG_PAGE_NUM = 7					-- 页数
local BAG_PAGE_COUNT = 20				-- 每页个数
local BAG_ROW = 4						-- 行数
local BAG_COLUMN = 5					-- 列数
MarryEquipReclyeInfoView.SELECT_INDEX_LIST = {}
function MarryEquipReclyeInfoView:__init(instance, mother_view)
	self.bag_cell = {}
	self.check_lover = false
end

function MarryEquipReclyeInfoView:LoadCallBack()
	self.cap = self:FindVariable("Cap")
	self.cur_lv = self:FindVariable("CurLv")
	self.next_lv = self:FindVariable("NextLv")
	self.prog = self:FindVariable("Prog")
	self.prog_txt = self:FindVariable("ProgTxt")
	-- self.next_cap = self:FindVariable("NextCap")
	self.maxhp = self:FindVariable("Hp")
	self.gongji = self:FindVariable("Gongji")
	self.fangyu = self:FindVariable("Fangyu")
	self.mingzhong = self:FindVariable("Mingzhong")
	self.shanbi = self:FindVariable("Shanbi")
	self.baoji = self:FindVariable("Baoji")
	self.jianren = self:FindVariable("kangbao")

	-- 获取控件
	self.bag_list_view = self:FindObj("ListView")
	self.btn_recycle = self:FindObj("BtnRecycle")
	self.recycle_text = self:FindObj("RecycleText")

	local list_delegate = self.bag_list_view.page_simple_delegate
	list_delegate.NumberOfCellsDel = BindTool.Bind(self.BagGetNumberOfCells, self)
	list_delegate.CellRefreshDel = BindTool.Bind(self.BagRefreshCell, self)


	self:ListenEvent("OnClickGuaji",BindTool.Bind(self.OnClickGuaji, self))
	self:ListenEvent("OnClickRecyle",BindTool.Bind(self.OnClickRecyle, self))
	self:ListenEvent("OnClickDoRecyle",BindTool.Bind(self.OnClickDoRecyle, self))
	self:OpenCallBack()
end

function MarryEquipReclyeInfoView:__delete()
	if self.bag_cell then
		for k,v in pairs(self.bag_cell) do
			v:DeleteMe()
		end
		self.bag_cell = {}
	end
end

function MarryEquipReclyeInfoView:OpenCallBack()
	MarryEquipReclyeInfoView.SELECT_INDEX_LIST = {}
	if self.bag_list_view and self.bag_list_view.list_page_scroll2.isActiveAndEnabled then
		self.bag_list_view.list_page_scroll2:JumpToPageImmidate(0)
	end
	self:Flush()
end

function MarryEquipReclyeInfoView:OnClickGuaji()
	MarryEquipCtrl.Instance:OpenGuajiView()
end

function MarryEquipReclyeInfoView:OnClickRecyle()
	MarryEquipCtrl.Instance:OpenRecyleView(BindTool.Bind(self.AutoRecyleColor, self))
end

function MarryEquipReclyeInfoView:OnClickDoRecyle()
	for k,v in pairs(MarryEquipReclyeInfoView.SELECT_INDEX_LIST) do
		PackageCtrl.Instance:SendDiscardItem(v.index, v.num, v.item_id, v.num, 1)
	end
	MarryEquipReclyeInfoView.SELECT_INDEX_LIST = {}
end

function MarryEquipReclyeInfoView:AutoRecyleColor(color)
	local data_list = MarryEquipData.Instance:GetAllQingYuanEquipList()
	local check_flag = false
	for i = 1, BAG_MAX_GRID_NUM do
		if data_list[i] then
			local item_cfg = ItemData.Instance:GetItemConfig(data_list[i].item_id)
			local has_better = MarryEquipData.Instance:IsBetterMarryEquip(data_list[i].item_id)
			if has_better and not check_flag then
				check_flag = true
			end

			if item_cfg and item_cfg.color <= color and not has_better then
				MarryEquipReclyeInfoView.SELECT_INDEX_LIST[data_list[i].index] = data_list[i]
			else
				MarryEquipReclyeInfoView.SELECT_INDEX_LIST[data_list[i].index] = nil
			end
		end
	end


	if self.bag_list_view and self.bag_list_view.list_page_scroll2.isActiveAndEnabled then
		self.bag_list_view.list_view:Reload()
	end
	self:SetProgTxt()

	if check_flag then
		SysMsgCtrl.Instance:ErrorRemind(Language.Marriage.HasBetterEquipTip)
	end
end

function MarryEquipReclyeInfoView:BagGetNumberOfCells()
	return BAG_MAX_GRID_NUM
end

function MarryEquipReclyeInfoView:BagRefreshCell(index, cellObj)
	-- 构造Cell对象.
	local cell = self.bag_cell[cellObj]
	if nil == cell then
		cell = ItemCell.New(cellObj)
		-- cell:SetToggleGroup(self.root_node.toggle_group)
		self.bag_cell[cellObj] = cell
	end

	local page = math.floor(index / BAG_PAGE_COUNT)
	local cur_colunm = math.floor(index / BAG_ROW) + 1 - page * BAG_COLUMN
	local cur_row = math.floor(index % BAG_ROW) + 1
	local grid_index = (cur_row - 1) * BAG_COLUMN - 1 + cur_colunm  + page * BAG_ROW * BAG_COLUMN

	-- 获取数据信息
	local data = MarryEquipData.Instance:GetAllQingYuanEquipList()[grid_index + 1] or {}

	local cell_data = {}
	cell_data.item_id = data.item_id
	cell_data.index = data.index or grid_index
	cell_data.param = data.param
	cell_data.num = data.num
	cell_data.is_bind = data.is_bind
	cell_data.invalid_time = data.invalid_time

	cell:SetIconGrayScale(false)
	cell:ShowQuality(nil ~= cell_data.item_id)
	cell:ShowHighLight(false)
	cell:SetGetImgVis(data.index ~= nil and MarryEquipReclyeInfoView.SELECT_INDEX_LIST[data.index] ~= nil)
	cell:SetData(cell_data, true)
	cell:ListenClick(BindTool.Bind(self.HandleBagOnClick, self, cell, data.index))
	cell:SetInteractable((nil ~= cell_data.item_id or cell_data.locked))
end

function MarryEquipReclyeInfoView:HandleBagOnClick(cell, index)
	local data = cell:GetData()
	if index and MarryEquipReclyeInfoView.SELECT_INDEX_LIST[index] then
		MarryEquipReclyeInfoView.SELECT_INDEX_LIST[index] = nil
		cell:SetGetImgVis(false)
	elseif index and data and data.item_id and data.item_id > 0 then
		MarryEquipReclyeInfoView.SELECT_INDEX_LIST[index] = data
		cell:SetGetImgVis(true)
	end
	self:SetProgTxt()
end

function MarryEquipReclyeInfoView:OnFlush()
	for k,v in pairs(MarryEquipReclyeInfoView.SELECT_INDEX_LIST) do
		if ItemData.Instance:GetItemNumInBagByIndex(k) <= 0 then
			MarryEquipReclyeInfoView.SELECT_INDEX_LIST[k] = nil
		end
	end
	if self.bag_list_view and self.bag_list_view.list_page_scroll2.isActiveAndEnabled then
		self.bag_list_view.list_view:Reload()
	end
	local marry_info = MarryEquipData.Instance:GetMarryInfo()

	local marry_level_cfg = MarryEquipData.Instance:GetMarryLevelCfg(marry_info.marry_level)
	if nil == marry_level_cfg then return end
	local cap = CommonDataManager.GetCapability(marry_level_cfg)
	self.cap:SetValue(cap)
	self.cur_lv:SetValue(marry_info.marry_level)
	self.maxhp:SetValue(marry_level_cfg.maxhp)
	self.gongji:SetValue(marry_level_cfg.gongji)
	self.fangyu:SetValue(marry_level_cfg.fangyu)
	self.mingzhong:SetValue(marry_level_cfg.mingzhong)
	self.shanbi:SetValue(marry_level_cfg.shanbi)
	self.baoji:SetValue(marry_level_cfg.baoji)
	self.jianren:SetValue(marry_level_cfg.jianren)

	local marry_level_n_cfg = MarryEquipData.Instance:GetMarryLevelCfg(marry_info.marry_level + 1)
	if marry_level_n_cfg then
		self.next_lv:SetValue(marry_info.marry_level + 1)
		self.prog:SetValue(marry_info.marry_level_exp / marry_level_cfg.up_level_exp)
	else
		self.next_lv:SetValue(marry_info.marry_level)
		self.prog:SetValue(1)
	end
	self:SetProgTxt()
end

function MarryEquipReclyeInfoView:SetProgTxt()
	local marry_info = MarryEquipData.Instance:GetMarryInfo()
	local marry_level_cfg = MarryEquipData.Instance:GetMarryLevelCfg(marry_info.marry_level)
	local marry_level_n_cfg = MarryEquipData.Instance:GetMarryLevelCfg(marry_info.marry_level + 1)
	if marry_level_cfg and marry_level_n_cfg then
		local add_exp = self:GetAllSelectEquipScore()
		add_exp = add_exp > 0 and "<color=#00ff00>(+" .. self:GetAllSelectEquipScore() .. ")</color>" or ""
		self.prog_txt:SetValue(marry_info.marry_level_exp .. add_exp .. "/" .. marry_level_cfg.up_level_exp)
	else
		self.prog_txt:SetValue(Language.Common.YiManJi)
		self.btn_recycle.grayscale.GrayScale = 255
		self.recycle_text.grayscale.GrayScale = 255
		self.btn_recycle.button.interactable = false
	end
end

function MarryEquipReclyeInfoView:GetAllSelectEquipScore()
	local score = 0
	for k,v in pairs(MarryEquipReclyeInfoView.SELECT_INDEX_LIST) do
		local item_cfg = ItemData.Instance:GetItemConfig(v.item_id)
		if item_cfg then
			score = score + item_cfg.recyclget
		end
	end
	return score
end