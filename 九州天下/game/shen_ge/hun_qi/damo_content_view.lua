DaMoContentView = DaMoContentView or BaseClass(BaseRender)

local ItemCount = 3					--最大物品数量
local MaxAttrCount = 3				--最大属性条数
local MaxStarCount = 10				--最大星星数

local Attr_List = {"maxhp", "gongji", "fangyu"}

local LevelColorList = {
	[0] = "Green",
	[1] = "Green",
	[2] = "Blue",
	[3] = "Blue",
	[4] = "Purple",
	[5] = "Purple",
	[6] = "Orange",
	[7] = "Orange",
	[8] = "Red",
	[9] = "Red",
	[10] = "Red",
}

function DaMoContentView:__init()
	self.item_list = {}
	for i = 1, ItemCount do
		local item_cell = ItemCell.New()
		item_cell:SetInstanceParent(self:FindObj("Item" .. i))
		table.insert(self.item_list, item_cell)
	end

	self.star_list = {}
	for i = 1, MaxStarCount do
		local star_res = self:FindVariable("StarRes" .. i)
		table.insert(self.star_list, star_res)
	end

	self.power = self:FindVariable("Power")								--战斗力
	self.show_attr_num = self:FindVariable("ShowAttrNum")				--展示几条属性
	self.show_up_attr = self:FindVariable("ShowUpAttr")					--展示升级属性
	self.exp_pro = self:FindVariable("ExpPro")							--经验进度条
	self.pro_text = self:FindVariable("ProText")						--经验文本
	self.level_img_bg = self:FindVariable("LevelImgBg")					--等级图标
	self.level_name = self:FindVariable("LevelName")					--等级名字

	self.attr_list = {}
	for i = 1, MaxAttrCount do
		local data = {}
		data.attr_name = self:FindVariable("Attr".. i .."Name")
		data.now_value = self:FindVariable("Attr".. i .."NowText")
		data.up_value = self:FindVariable("Attr".. i .."UpText")
		data.icon_res = self:FindVariable("Attr".. i .."Res")
		table.insert(self.attr_list, data)
	end

	self:ListenEvent("ClickButton", BindTool.Bind(self.ClickButton, self))
	self:ListenEvent("ClickExChange", BindTool.Bind(self.ClickExChange, self))
	self:ListenEvent("ClickHelp", BindTool.Bind(self.ClickHelp, self))
end

function DaMoContentView:__delete()
	for _, v in ipairs(self.item_list) do
		v:DeleteMe()
	end
	self.item_list = {}
end

function DaMoContentView:ClickButton()
	local not_num_count = 0
	for k, v in ipairs(self.item_list) do
		local data = v:GetData()
		local num = data.num or 0
		if num <= 0 then
			not_num_count = not_num_count + 1
		end
		if not_num_count >= ItemCount then
			SysMsgCtrl.Instance:ErrorRemind(Language.HunQi.NotMineralDes)
			return
		end
	end
	HunQiCtrl.Instance:SendOneKeyOperaReq()
end

function DaMoContentView:ClickExChange()
	local times = HunQiData.Instance:GetExChangeTimes()
	local exchange_list = HunQiData.Instance:GetExChangeCfg()
	if nil == exchange_list then
		return
	end
	local data = nil
	for k, v in ipairs(exchange_list) do
		if v.seq == times then
			data = v
			break
		end
	end
	if nil == data then
		SysMsgCtrl.Instance:ErrorRemind(Language.HunQi.NotExChangeTimeDes)
		return
	end
	ViewManager.Instance:Open(ViewName.DaMoExChangeTips)
end

function DaMoContentView:ClickHelp()
	TipsCtrl.Instance:ShowHelpTipView(166)
end

function DaMoContentView:ChangeStarLevel()
	local big_level = HunQiData.Instance:GetIdentifyLevel()
	local small_level = HunQiData.Instance:GetIdentifyStarLevel()

	for k, v in ipairs(self.star_list) do
		if k <= small_level then
			v:SetAsset(ResPath.GetNewStarIcon(big_level + 1))
		else
			v:SetAsset(ResPath.GetNewStarIcon(big_level))
		end
	end
end

function DaMoContentView:FlushAttr(is_init)
	local big_level = HunQiData.Instance:GetIdentifyLevel()
	local small_level = HunQiData.Instance:GetIdentifyStarLevel()

	local attr_info = HunQiData.Instance:GetidentifyLevelInfo(big_level, small_level)
	if nil == attr_info then
		return
	end
	attr_info = attr_info[1]
	--刷新等级展示
	local img_res_name = LevelColorList[big_level]
	local level_bg_res_id = "DaMoLevel_" .. img_res_name
	local level_asset, level_bunble = ResPath.GetHunQiImg(level_bg_res_id)
	self.level_img_bg:SetAsset(level_asset, level_bunble)
	self.level_name:SetValue(attr_info.name)

	--刷新经验进度条
	local now_exp = HunQiData.Instance:GetNowExp()
	local need_exp = attr_info.need_exp
	local exp_value = now_exp/need_exp
	if is_init then
		self.exp_pro:InitValue(exp_value)
	else
		self.exp_pro:SetValue(exp_value)
	end
	local pro_des = "已满"
	if now_exp < need_exp then
		pro_des = now_exp .. "/" .. need_exp
	end
	self.pro_text:SetValue(pro_des)

	--计算战斗力
	local capability = CommonDataManager.GetCapability(attr_info)
	self.power:SetValue(capability)

	--判断显示的属性个数
	local maxhp = attr_info.maxhp or 0
	local gongji = attr_info.gongji or 0
	local fangyu = attr_info.fangyu or 0

	local attr_count = 0
	if maxhp > 0 then
		attr_count = attr_count + 1
	end
	if gongji > 0 then
		attr_count = attr_count + 1
	end
	if fangyu > 0 then
		attr_count = attr_count + 1
	end
	if attr_count == 0 then
		attr_count = MaxAttrCount
	end
	self.show_attr_num:SetValue(attr_count)

	--获取下一级属性
	local next_big_level = 0
	local next_small_level = 0
	if small_level >= MaxStarCount then
		next_big_level = big_level + 1
	else
		next_big_level = big_level
		next_small_level = small_level + 1
	end

	local next_attr_info = HunQiData.Instance:GetidentifyLevelInfo(next_big_level, next_small_level)
	if nil == next_attr_info then
		self.show_up_attr:SetValue(false)
	else
		next_attr_info = next_attr_info[1]
		self.show_up_attr:SetValue(true)
	end

	--设置属性展示
	for i = 1, attr_count do
		local attr_data = self.attr_list[i]
		local attr_type = Attr_List[i]
		local name = Language.Common.AttrNameNoUnderline[attr_type] or ""
		attr_data.attr_name:SetValue(name)
		local now_attr = attr_info[attr_type]
		attr_data.now_value:SetValue(now_attr)
		local next_attr = 0
		if nil ~= next_attr_info then
			next_attr = next_attr_info[attr_type]
		end
		up_attr = next_attr - now_attr
		attr_data.up_value:SetValue(up_attr)
		attr_data.icon_res:SetAsset(ResPath.GetBaseAttrIcon(attr_type))
	end
end

function DaMoContentView:FlushItemList()
	local item_data_list = HunQiData.Instance:GetIdentifyItemList()
	if nil == item_data_list then
		return
	end
	for k, v in ipairs(self.item_list) do
		local data = item_data_list[k]
		local item_id = data.consume_item_id
		local num = ItemData.Instance:GetItemNumInBagById(item_id)
		v:SetData({item_id = item_id, num = num})
		if num <= 0 then
			v:SetIconGrayScale(true)
			v:ShowQuality(false)
		else
			v:SetIconGrayScale(false)
			v:ShowQuality(true)
		end
	end
end

function DaMoContentView:InitView()
	self:ChangeStarLevel()
	self:FlushAttr(true)
	self:FlushItemList()
end

function DaMoContentView:FlushView()
	self:ChangeStarLevel()
	self:FlushAttr()
	self:FlushItemList()
end