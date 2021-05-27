------------------------------------------------------------
-- "龙魂圣域"视图 配置 dragonSoulSacredAreaCfg
------------------------------------------------------------

local DragonSoulChildView = BaseClass(SubView)

function DragonSoulChildView:__init()
	self.texture_path_list[1] = 'res/xui/fire_vision.png'
	self.config_tab = {
		{"dragon_soul_ui_cfg", 2, {0}},
	}

	self.item_cell = {} -- 物品配置
	self.copy_id = dragonSoulSacredAreaCfg.fbid -- 跨服副本ID
	self.copy_list = nil
end

function DragonSoulChildView:__delete()
end

function DragonSoulChildView:ReleaseCallBack()

	-- if self.shop_mystical_grid then
	-- 	self.shop_mystical_grid:DeleteMe()
	-- 	self.shop_mystical_grid = nil
	-- end

	if self.item_cell then
		for _, v in pairs(self.item_cell) do
			if v then
				v:DeleteMe()
				v = nil
			end
		end
		self.item_cell = {}
	end
	self:CancelTimer()
end

function DragonSoulChildView:LoadCallBack(index, loaded_times)
	self.data = DragonSoulData.Instance:GetData() -- 索引龙魂圣域数据(只需获取一次)
	self.copy_list = CrossServerData.Instance:GetCopyData() -- 获取跨服副本数据列表(只需获取一次)

	self:CreateCellView()
	self:CreateTextBtn()
	self.node_t_list["img_refresh"].node:setVisible(false)

	--按钮监听
	XUI.AddClickEventListener(self.node_t_list["btn_1"].node, BindTool.Bind(self.OnBtn, self)) --"参加挑战"按钮
	XUI.AddClickEventListener(self.node_t_list["btn_tip"].node, BindTool.Bind(self.OnTipBtn, self)) --"提示"按钮

	-- 数据监听
	EventProxy.New(DragonSoulData.Instance, self):AddEventListener(DragonSoulData.DRAGON_SOUL_DATA_CHANGE, BindTool.Bind(self.OnDragonSoulDataChange, self))
	EventProxy.New(CrossServerData.Instance, self):AddEventListener(CrossServerData.COPY_DATA_CHANGE, BindTool.Bind(self.OnCopyDataChange, self))

end

--显示索引回调
function DragonSoulChildView:ShowIndexCallBack(index)
	local text = "剩余可击杀数：" .. self.data.num .. "只"
	self.node_t_list["lbl_num"].node:setString(text)

	if nil ~= self.copy_list[self.copy_id] then
		self.node_t_list["lbl_name"].node:setString(self.copy_list[self.copy_id].boss_list[427].player_name)
		self:CheckTimer() -- 检查或创建记时器
	end
end

function DragonSoulChildView:CloseCallBack(is_all)
	self:CancelTimer()
end

----------视图函数----------

-- 创建"购买击杀次数"按钮
function DragonSoulChildView:CreateTextBtn()
	local ph = self.ph_list["ph_text_btn"]
	local text = RichTextUtil.CreateLinkText(Language.FireVision.TextBtn, 19, COLOR3B.GREEN, nil, true)
	text:setPosition(ph.x, ph.y)
	self.node_t_list["layout_fire_vision"].node:addChild(text, 20)
	XUI.AddClickEventListener(text, BindTool.Bind(self.OnTextBtn, self), true)
end

-- 创建"物品图标"视图
function DragonSoulChildView:CreateCellView()
	local data = DragonSoulData.Instance:GetItemData()
	
	local ph = self.ph_list.ph_items_show
	local grid_scroll = GridScroll.New()
	grid_scroll:Create(ph.x, ph.y, ph.w, ph.h, 1, 102, self.ItemsShow, ScrollDir.Vertical, false, self.ph_list.ph_items_cell)
	self.node_t_list['layout_fire_vision'].node:addChild(grid_scroll:GetView(), 2)
	grid_scroll:SetDataList(data)
	grid_scroll:JumpToTop()
end

----------end----------

----------计时器----------

-- 检查或创建记时器
function DragonSoulChildView:CheckTimer()
	self:FlushLeftTimeView()
	local left_time = CrossServerData.Instance:GetBossRefreshTime(self.copy_list[self.copy_id].boss_list[427]) -- 剩于时间
	if left_time > 0 then
		if nil == self.timer then
			self.timer = GlobalTimerQuest:AddRunQuest(BindTool.Bind(self.TimerCallBack, self), 1)
			self.node_t_list["img_dead"].node:setVisible(true)
			self.node_t_list["img_refresh"].node:setVisible(false)
		end
	else
		self:CancelTimer()
		self.node_t_list["img_dead"].node:setVisible(false)
		self.node_t_list["img_refresh"].node:setVisible(true)
	end
end

-- 取消计时器
function DragonSoulChildView:CancelTimer()
	GlobalTimerQuest:CancelQuest(self.timer)
	self.timer = nil
end

-- 计时器每秒回调
function DragonSoulChildView:TimerCallBack()
	local left_time = CrossServerData.Instance:GetBossRefreshTime(self.copy_list[self.copy_id].boss_list[427])
	self:FlushLeftTimeView()
	if left_time == 0 then
		self:CheckTimer()
	end
end

-- 刷新剩余时间视图
function DragonSoulChildView:FlushLeftTimeView()
	if not(ViewManager.Instance:IsOpen(ViewDef.DragonSoul)) then
		self:CancelTimer()
		return
	end
	local left_time = CrossServerData.Instance:GetBossRefreshTime(self.copy_list[self.copy_id].boss_list[427])
	self.node_t_list["lbl_time"].node:setString(TimeUtil.FormatSecond(left_time, 3))
end

----------end----------

-- "参加挑战"按钮点击回调
function DragonSoulChildView:OnBtn()
	-- 请求进入龙魂圣域(144, 2)
	CrossServerCtrl.Instance.SentJoinCrossServerReq(3, 1)
end

-- "购买击杀次数"按钮点击回调
function DragonSoulChildView:OnTextBtn()
	-- 请求购买击杀次数(144, 11)
	DragonSoulCtrl.Instance.CSDragonSoulDataReq(2)
end

-- "说明"按钮点击回调
function DragonSoulChildView:OnTipBtn()
	-- 显示提示内容
	DescTip.Instance:SetContent(CLIENT_GAME_GLOBAL_CFG.dragon_soul_tip_content, "说明：")
end

-- "跨服副本"数据改变回调
function DragonSoulChildView:OnCopyDataChange()
	self:CheckTimer()
	self.node_t_list["lbl_name"].node:setString(self.copy_list[self.copy_id].boss_list[427].player_name)
end

-- "龙魂圣域"数据改变回调
function DragonSoulChildView:OnDragonSoulDataChange()

	-- 剩余可击杀BOSS的次数
	local text = "剩余可击杀数：" .. self.data.num .. "只"
	self.node_t_list["lbl_num"].node:setString(text)
end

----------------------------------------
-- 物品显示(可滑动)
----------------------------------------

DragonSoulChildView.ItemsShow = BaseClass(BaseRender)
local ItemsShow = DragonSoulChildView.ItemsShow
function ItemsShow:__init()
	self.item_cell = nil
end

function ItemsShow:__delete()
	if self.item_cell then
		self.item_cell:DeleteMe()
		self.item_cell = nil
	end
end

function ItemsShow:CreateChild()
	BaseRender.CreateChild(self)
	self.item_cell = BaseCell.New()
	self.item_cell:SetPosition(self.ph_list.ph_cell.x, self.ph_list.ph_cell.y)
	self.item_cell:SetCellBg(ResPath.GetCommon("cell_111"))
	self.view:addChild(self.item_cell:GetView(), 7)
end

function ItemsShow:OnFlush()
	if nil == self.data then return end
	self.item_cell:SetData(self.data)
end

function ItemsShow:CreateSelectEffect()
	return
end

function ItemsShow:OnClickBuyBtn()
	if nil ~= self.click_callback then
		self.click_callback(self)
	end
end

function ItemsShow:OnClick()
	if nil ~= self.click_callback then
		-- self.click_callback(self)
	end
end
--------------------

return DragonSoulChildView