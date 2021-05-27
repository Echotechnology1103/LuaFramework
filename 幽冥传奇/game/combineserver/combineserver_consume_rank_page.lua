CombineServerConsumeRankPage = CombineServerConsumeRankPage or BaseClass()

function CombineServerConsumeRankPage:__init()
	
end

function CombineServerConsumeRankPage:__delete()
	self:RemoveEvent()
	if self.sports_rank_list then
		self.sports_rank_list:DeleteMe()
		self.sports_rank_list = nil
	end

	self.view = nil
end

--初始化页面接口
function CombineServerConsumeRankPage:InitPage(view)
	--绑定要操作的元素
	if self.view then return end
	self.view = view
	self:CreateRankInfoList()
	self:InitEvent()
end	

--初始化事件
function CombineServerConsumeRankPage:InitEvent()
	self.view.node_t_list.btn_charge_1.node:addClickEventListener(BindTool.Bind(self.GetChargeData, self))
	
end

function CombineServerConsumeRankPage:RemoveEvent()

end

function CombineServerConsumeRankPage:CreateRankInfoList()
	if not self.sports_rank_list then
		local ph = self.view.ph_list.ph_item_list
		self.sports_rank_list = ListView.New()
		self.sports_rank_list:Create(ph.x, ph.y, ph.w, ph.h, direction, CombineServerConsumeRankItem, nil, false, self.view.ph_list.ph_list_item_1)
		self.sports_rank_list:SetItemsInterval(2)
		self.sports_rank_list:SetJumpDirection(ListView.Top)
		self.view.node_t_list.layout_addchange.node:addChild(self.sports_rank_list:GetView(), 100)
	end
end

function CombineServerConsumeRankPage:UpdateData(index)
	local data = nil
	local rank_data = CombineServerData.Instance:GetChanrgeConsumeRankData(9)

		data = CombineServerData.Instance:GetConsumeRankCfg()
		self.view.node_t_list.txt_my_charge.node:setString(string.format(Language.CombineServerActivity.ConsumeYuanbao, rank_data.my_money))
		self.view.node_t_list.txt_my_rank.node:setString(string.format(Language.CombineServerActivity.Rank, rank_data.my_rank))
		if rank_data.my_rank == 0 then
			self.view.node_t_list.txt_my_rank.node:setString(Language.RankingList.MyRanking)
		end
	self.sports_rank_list:SetDataList(data)
	

end


function CombineServerConsumeRankPage:GetChargeData()
	ViewManager.Instance:Open(ViewName.ChargePlatForm)
end




--
CombineServerConsumeRankItem = CombineServerConsumeRankItem or BaseClass(BaseRender)
function CombineServerConsumeRankItem:__init()
	self.cells_list = {}
	self.cells_view_container = nil
end

function CombineServerConsumeRankItem:__delete()
	for k, v in pairs(self.cells_list) do
		v:DeleteMe()
	end
	self.cells_list = {}
	self.cells_view_container:removeFromParent()
	self.cells_view_container = nil
	self.awar_icon = nil
	if self.timer_quest then
		GlobalTimerQuest:CancelQuest(self.timer_quest)
		self.timer_quest = nil
	end
end

function CombineServerConsumeRankItem:CreateChild()
	BaseRender.CreateChild(self)
	self:CreateCellsContainer()
end

function CombineServerConsumeRankItem:OnFlush()
	if not self.data then return end
	if not self.awar_icon then
		local img_ph = self.ph_list.ph_open_cell
		local path = ResPath.GetOperateActsRes("icon_" .. self.data.icon)
		self.awar_icon = XUI.CreateImageView(img_ph.x, img_ph.y, path, true)
		self.view:addChild(self.awar_icon, 100)
	else
		local path = ResPath.GetOperateActsRes("icon_" .. self.data.icon)
		self.awar_icon:loadTexture(path)
	end
	self:SetAwardCells(self.data.award)
	self.node_tree.txt_item_name.node:setString(self.data.desc)


end

function CombineServerConsumeRankItem:CreateCellsContainer()
	if not self.cells_view_container then
		local ph = self.ph_list.ph_cells_container
		self.cells_view_container = XLayout:create(0, 80)
		self.cells_view_container:setAnchorPoint(0.5, 0)
		self.cells_view_container:setPosition(ph.x, ph.y)
		self.view:addChild(self.cells_view_container, 100)
	end
end

function CombineServerConsumeRankItem:SetAwardCells(awards_data)
	if not awards_data or not next(awards_data) then return end

	local gap = 2
	local award_cnt = #awards_data
	local need_width = (80 * award_cnt) + (award_cnt - 1) * gap
	self.cells_view_container:setContentWH(need_width, 80)
	-- 多余的删除掉
	if #self.cells_list > award_cnt then
		local no_need_cnt = #self.cells_list - award_cnt
		for i = 1, no_need_cnt do
			local cell = table.remove(self.cells_list, #self.cells_list)
			if cell then
				cell:GetView():removeFromParent()
				cell:DeleteMe()
			end
		end
	end

	for i, v in ipairs(awards_data) do
		if not self.cells_list[i] then
			local cell = BaseCell.New()
			cell:SetPosition((i - 1) * (80 + gap), 0)
			cell:SetData(v)
			self.cells_view_container:addChild(cell:GetView(), 100)
			self.cells_list[i] = cell
		else
			local cell = self.cells_list[i]
			cell:GetView():setPositionX((i - 1) * (80 + gap))
			cell:SetData(v)
		end
	end
end

-- 创建选中特效
function CombineServerConsumeRankItem:CreateSelectEffect()
	
end