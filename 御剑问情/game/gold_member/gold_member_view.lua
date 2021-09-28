GoldMemberView = GoldMemberView or BaseClass(BaseView)

function GoldMemberView:__init()
	self.ui_config = {"uis/views/goldmember_prefab","GoldMemberView"}
	self.full_screen = false
	self.play_audio = true
	self.def_index = 0
end

function GoldMemberView:BackOnClick()
	ViewManager.Instance:Close(ViewName.GoldMemberView)
end

function GoldMemberView:__delete()
   if self.vip_time_coundown then
		GlobalTimerQuest:CancelQuest(self.vip_time_coundown)
		self.vip_time_coundown = nil
	end
end

function GoldMemberView:ReleaseCallBack()
	if self.item_cell then
		self.item_cell:DeleteMe()
		self.item_cell = nil
	end

	-- 清理变量和对象
	self.button_show = nil
	self.tiem_text = nil
	self.gold_text = nil
	self.button_text = nil
	self.title_icon = nil
	self.fp = nil
	self.isbind_image = nil
	self.show_shop_redpoint = nil
	self.timeover = nil
	self.continue_days = nil
	self.bottom_tip = nil
end

function GoldMemberView:LoadCallBack()
	self:ListenEvent("close_view", BindTool.Bind(self.BackOnClick, self))
	self:ListenEvent("reward_btn", BindTool.Bind(self.RewardOnClick, self))
	self:ListenEvent("shop_btn", BindTool.Bind(self.ShopOnClick, self))

	self.item_cell = ItemCell.New()
	self.item_cell:SetInstanceParent(self:FindObj("Item"))
	self.bottom_tip = self:FindObj("BottomTip")

	self.button_show = self:FindVariable("ShowButton")
	self.tiem_text = self:FindVariable("TiemText")
	self.gold_text = self:FindVariable("GoldText")
	self.button_text = self:FindVariable("ButtonText")
	self.title_icon = self:FindVariable("TitleIcon")
	self.fp = self:FindVariable("Fp")
	self.isbind_image = self:FindVariable("IsBindImage")
	self.show_shop_redpoint = self:FindVariable("ShowShopRedPoint")
	self.timeover = self:FindVariable("timeover")
	self.continue_days = self:FindVariable("continue_days")
	self:Flush()

end

function GoldMemberView:OpenCallBack()
	self.show_shop_redpoint:SetValue(GoldMemberData.Instance:CheckScoreIsOk())
end

function GoldMemberView:CloseCallBack()

end

function GoldMemberView:OnFlush(param_list)
	local active_cfg = GoldMemberData.Instance:GetGoldCfg()[1]
	local vip_info = GoldMemberData.Instance:GetGoldVipInfo()
	local title_time = GoldMemberData.Instance:GetActivitionTime()

	self.continue_days:SetValue(title_time .. "天")
	self.bottom_tip:SetActive(false)
	if active_cfg then
		local bundle, asset = ResPath.GetTitleIcon(active_cfg.gold_vip_title_id)
		self.title_icon:SetAsset(bundle, asset)
		self.fp:SetValue(active_cfg.title_zhanli)
		local num = active_cfg.return_gold
		local is_bind = 1
		local item_id = ResPath.CurrencyToIconId["diamond"]
		self.isbind_image:SetValue(is_bind == 0)
		self.item_cell:SetActivityEffect()
		self.item_cell:SetData({item_id = item_id, num = num, is_bind = is_bind})
		self.gold_text:SetValue(active_cfg.need_gold)
	end

	local valid_day = GoldMemberData.Instance:GetGoldMemberValidDay()					--距离可领取时间
	if valid_day > 0 then
		self.button_text:SetValue(Language.GoldMember.Member_btn_titile[2])
		self.button_show:SetValue(false)
		self.timeover:SetValue(true)

		local content_time = string.format(Language.GoldMember.Member_vip_time, valid_day)
		self.tiem_text:SetValue(content_time)
	else
		if vip_info.can_fetch_return_reward == 1 then
			self.button_text:SetValue(Language.GoldMember.Member_btn_titile[2])
		else
			self.bottom_tip:SetActive(true)
			self.button_text:SetValue(Language.GoldMember.Member_btn_titile[3])
		end
		self.button_show:SetValue(true)
		self.tiem_text:SetValue("")
		self.timeover:SetValue(false)
	end
	-- self.show_shop_redpoint:SetValue(GoldMemberData.Instance:CheckScoreIsOk())
end


--关闭黄金会员面板
function GoldMemberView:BackOnClick()
	ViewManager.Instance:Close(ViewName.GoldMemberView)
end

function GoldMemberView:RewardOnClick()
	local gold_vip_info = GoldMemberData.Instance:GetGoldVipInfo()
	local active_cfg = GoldMemberData.Instance:GetGoldCfg()[1]
	if PlayerData.Instance.role_vo.level < GoldMemberData.Instance:GetActivitionLevel() then
		SysMsgCtrl.Instance:ErrorRemind(Language.GoldMember.Member_shop_level)
		return
	end

	if gold_vip_info.can_fetch_return_reward == 1 then
		GoldMemberCtrl.Instance:SendGoldVipOperaReq(GOLD_VIP_OPERA_TYPE.OPERA_TYPE_FETCH_RETURN_REWARD)
		return
	end

	local function ok_callback()
		GoldMemberCtrl.Instance:SendGoldVipOperaReq(GOLD_VIP_OPERA_TYPE.OPERA_TYPE_ACTIVE)
	end
	local des = string.format(Language.Common.CostGoldBuyTip, active_cfg.need_gold)
	TipsCtrl.Instance:ShowCommonAutoView("gold_vip", des, ok_callback)
end

function GoldMemberView:ShopOnClick()
	-- if GoldMemberData.Instance:GetGoldMemberValidDay() > 0 then
	 	ViewManager.Instance:Open(ViewName.GoldMemberShop)
	-- else
	-- 	SysMsgCtrl.Instance:ErrorRemind(Language.GoldMember.Member_shop_open_tips)
	-- end
end
