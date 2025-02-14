FangFeiQiQiuRank =  FangFeiQiQiuRank or BaseClass(BaseRender)

function FangFeiQiQiuRank:__init()
	self.rank_list = {}

	self.title_asset = self:FindVariable("TitleAsset")
	self.my_rank = self:FindVariable("MyRank")
	self.my_time = self:FindVariable("MyTimes")
	self.count_down_time = self:FindVariable("CountDownTime")

	self.rank_item_list = {}
	self.rank_list_view = self:FindObj("RankListView")
	local rank_list_delegate = self.rank_list_view.list_simple_delegate
	rank_list_delegate.NumberOfCellsDel = BindTool.Bind(self.GetNumberOfRankCells, self)
	rank_list_delegate.CellRefreshDel = BindTool.Bind(self.RefreshRankCell, self)

	self.part_reward = ItemCell.New()
	self.part_reward:SetInstanceParent(self:FindObj("RewardItem"))

	self:ListenEvent("ClickTitle", BindTool.Bind(self.OnClickTitle, self))
	self:ListenEvent("ClickHelp", BindTool.Bind(self.OnClickHelp, self))
end

function FangFeiQiQiuRank:__delete()
	self.title_asset = nil
	self.my_rank = nil
	self.my_time = nil
    self.count_down_time = nil

	for k,v in pairs(self.rank_item_list) do
		v:DeleteMe()
	end
	self.rank_item_list = {}
	self.rank_list_view = nil

	if self.part_reward then
		self.part_reward:DeleteMe()
		self.part_reward = nil
	end

	if self.count_down then
        CountDown.Instance:RemoveCountDown(self.count_down)
        self.count_down = nil
    end
end

function FangFeiQiQiuRank:OpenCallBack()
	self:Flush()
end

function FangFeiQiQiuRank:CloseCallBack()
end

function FangFeiQiQiuRank:OnFlush()
 	self.rank_list = FestivalActivityQiQiuData.Instance:GetFangFeiRankList()
	self:FlushTitle()
	self:FlushBottom()
	self.rank_list_view.scroller:ReloadData(0)
end

function FangFeiQiQiuRank:GetNumberOfRankCells()
	return FestivalActivityQiQiuData.Instance:GetFangFeiRankListCount()
end

function FangFeiQiQiuRank:RefreshRankCell(cell, cell_index)
	cell_index = cell_index + 1
	local rank_cell = self.rank_item_list[cell]
	if rank_cell == nil then
		rank_cell = FangFeiQiQiuRankCell.New(cell.gameObject, self)
		self.rank_item_list[cell] = rank_cell
	end
	rank_cell:SetIndex(cell_index)
	if nil == self.rank_list then
		return
	end

	local reward_list = FestivalActivityQiQiuData.Instance:GetRankRewardByIndex(cell_index)
	rank_cell:SetData(self.rank_list[cell_index], reward_list.watering_rank_reward)
end

function FangFeiQiQiuRank:FlushTitle()
	local title_asset_id = FestivalActivityQiQiuData.Instance:GetWaterTitle()
	local bundle, asset = ResPath.GetTitleIcon(title_asset_id)
	self.title_asset:SetAsset(bundle, asset)

	-- 刷新倒计时
	local activity_end_time = FestivalActivityData.Instance:GetActivityActTimeLeftById(ACTIVITY_TYPE.RAND_ACTIVITY_TYPE_FANGFEI_QIQIU)
    if self.count_down then
        CountDown.Instance:RemoveCountDown(self.count_down)
        self.count_down = nil
    end

    self.count_down = CountDown.Instance:AddCountDown(activity_end_time, 1, function ()
        activity_end_time = activity_end_time - 1

        if activity_end_time > 3600 * 24 then
			self.count_down_time:SetValue(TimeUtil.FormatSecond(activity_end_time, 7))
		elseif activity_end_time > 3600 then
			self.count_down_time:SetValue(TimeUtil.FormatSecond(activity_end_time, 1))
		else
			self.count_down_time:SetValue(TimeUtil.FormatSecond(activity_end_time, 4))
		end
    end)
end

function FangFeiQiQiuRank:FlushBottom()
	local cfg = ServerActivityData.Instance:GetCurrentRandActivityConfigOtherCfg()
	if nil == cfg then
		return
	end
	local part_reward_data = cfg.planting_tree_canyu_reward
	self.part_reward:SetData(part_reward_data)
	local my_rank = FestivalActivityQiQiuData.Instance:GetMyChuiQiQiuInfo()
	
	if 0 == my_rank.rank then
		self.my_rank:SetValue(Language.Rank.NoInRank)
	else
		self.my_rank:SetValue(my_rank.rank)
	end
	self.my_time:SetValue(my_rank.times)
end

function FangFeiQiQiuRank:OnClickTitle()
	local reward_list = FestivalActivityQiQiuData.Instance:GetRankRewardByIndex(1)
	if nil ~= reward_list then
		TipsCtrl.Instance:OpenItem(reward_list.watering_rank_reward[0])
	end
end

function FangFeiQiQiuRank:OnClickHelp()
	TipsCtrl.Instance:ShowHelpTipView(283)
end

--------------------------FangFeiQiQiuRankCell---------------------------------
FangFeiQiQiuRankCell = FangFeiQiQiuRankCell or BaseClass(BaseCell)

function FangFeiQiQiuRankCell:__init()
	self.rank = self:FindVariable("Rank")
	self.name = self:FindVariable("Name")
	self.transfigure_times = self:FindVariable("TransfigureTimes")
	self.rank_image = self:FindVariable("RankImg")
	self.is_show_rank_image = self:FindVariable("IsShowRankImage")

	self.reward_item_list = {}
	for i = 1, 3 do
		self.reward_item_list[i] = ItemCell.New()
		self.reward_item_list[i]:SetInstanceParent(self:FindObj("Item"..i))
	end

	--头像UI
	self.show_image = self:FindVariable("ShowImage")
	self.image_res = self:FindVariable("ImageRes")
	self.raw_image_obj = self:FindObj("RawImage")
end

function FangFeiQiQiuRankCell:__delete()
	for k,v in pairs(self.reward_item_list) do
		v:DeleteMe()
	end
end

function FangFeiQiQiuRankCell:SetIndex(cell_index)
	self.index = cell_index
end

function FangFeiQiQiuRankCell:SetData(data, reward_list)
	self.data = data
	if nil == data or nil == reward_list then
		return
	end
	self.name:SetValue(data.name or "")
	self.transfigure_times:SetValue(data.opera_items or 0)

	if self.index > 3 then
		self.is_show_rank_image:SetValue(false)
		self.rank:SetValue(self.index)
	else
		self.is_show_rank_image:SetValue(true)
		local bundle, asset = ResPath.GetMidAutumnRankIcon(self.index)
		self.rank_image:SetAsset(bundle, asset)
	end

	for i = 1, 3 do
		if reward_list[i - 1] ~= nil then
			self.reward_item_list[i]:SetData(reward_list[i - 1])
		else
			self.reward_item_list[i]:SetParentActive(false)
		end
	end

	-- 设置头像
	local role_id = self.data.uid

	local function download_callback(path)
		if nil == self.raw_image_obj or IsNil(self.raw_image_obj.gameObject) then
			return
		end
		if self.data.uid ~= role_id then
			return
		end
		local avatar_path = path or AvatarManager.GetFilePath(role_id, true)
		self.raw_image_obj.raw_image:LoadSprite(avatar_path,
		function()
			if self.data.uid ~= role_id then
				return
			end
			self.show_image:SetValue(false)
		end)
	end
	CommonDataManager.NewSetAvatar(role_id, self.show_image, self.image_res, self.raw_image_obj, self.data.sex, self.data.prof, false, download_callback)
end