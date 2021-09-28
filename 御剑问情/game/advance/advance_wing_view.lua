AdvanceWingView = AdvanceWingView or BaseClass(BaseRender)

WingImageFulingType = {
	Type = 1
}

local EFFECT_CD = 1.8
function AdvanceWingView:__init(instance)
	self:ListenEvent("StartAdvance",
		BindTool.Bind(self.OnStartAdvance, self))
	self:ListenEvent("AutomaticAdvance",
		BindTool.Bind(self.OnAutomaticAdvance, self))
	self:ListenEvent("OnClickUse",
		BindTool.Bind(self.OnClickUse, self))
	self:ListenEvent("OnClickZiZhi",
		BindTool.Bind(self.OnClickZiZhi, self))
	self:ListenEvent("OnClickHuanHua",
		BindTool.Bind(self.OnClickHuanHua, self))
	self:ListenEvent("OnClickLastButton",
		BindTool.Bind(self.OnClickLastButton, self))
	self:ListenEvent("OnClickNextButton",
		BindTool.Bind(self.OnClickNextButton, self))
	self:ListenEvent("OnClickEquipBtn",
		BindTool.Bind(self.OnClickEquipBtn, self))
	self:ListenEvent("OnClickSendMsg",
		BindTool.Bind(self.OnClickSendMsg, self))
	self:ListenEvent("OnClickFuLing",
		BindTool.Bind(self.OnClickFuLing, self))
	self:ListenEvent("OnClickBiPingReward",
		BindTool.Bind(self.OnClickBiPingReward, self))
	self:ListenEvent("OnClickAllAttrBtn",
		BindTool.Bind(self.OnClickAllAttrBtn, self))
	self:ListenEvent("OnClickJinJieAward",
		BindTool.Bind(self.OnClickJinJieAward, self))
	--self:ListenEvent("OnClickOpenSmallTarget",
	--	BindTool.Bind(self.OnClickOpenSmallTarget, self))

	self.wing_name = self:FindVariable("Name")
	self.wing_rank = self:FindVariable("Rank")
	self.exp_radio = self:FindVariable("ExpRadio")
	self.sheng_ming = self:FindVariable("HPValue")
	self.fight_power = self:FindVariable("FightPower")
	self.gong_ji = self:FindVariable("GongJi")
	self.fang_yu = self:FindVariable("FangYu")
	self.ming_zhong = self:FindVariable("MingZhong")
	self.shan_bi = self:FindVariable("ShanBi")
	self.bao_ji = self:FindVariable("BaoJi")
	self.jian_ren = self:FindVariable("JianRen")
	self.jia_shang = self:FindVariable("JiaShang")
	self.jian_shang = self:FindVariable("JianShang")
	self.su_du = self:FindVariable("SuDu")
	self.remainder_num = self:FindVariable("RemainderNum")
	-- self.need_num = self:FindVariable("NeedNun")
	self.quality = self:FindVariable("QualityBG")
	self.auto_btn_text = self:FindVariable("AutoButtonText")
	self.look_btn_text = self:FindVariable("LookBtnText")

	self.show_use_button = self:FindVariable("UseButton")
	self.show_use_image = self:FindVariable("UseImage")
	self.show_left_button = self:FindVariable("LeftButton")
	self.show_right_button = self:FindVariable("RightButton")
	self.show_effect = self:FindVariable("ShowEffect")
	self.hide_effect = self:FindVariable("HideEffect")
	self.show_on_look = self:FindVariable("IsOnLookState")
	self.show_equip_remind = self:FindVariable("ShowEquipRemind")
	self.show_fuling_remind = self:FindVariable("ShowFulingRemind")
	self.show_stars = self:FindVariable("ShowStars")
	self.show_stars:SetValue(false)

	self.prop_name = self:FindVariable("PropName")
	self.cur_bless = self:FindVariable("CurBless")
	self.show_zizhi_redpoint = self:FindVariable("ShowZizhiRedPoint")
	self.show_huanhua_redpoint = self:FindVariable("ShowHuanhuaRedPoint")
	self.show_skill_arrow1 = self:FindVariable("ShowSkillUplevel1")
	self.show_skill_arrow2 = self:FindVariable("ShowSkillUplevel2")
	self.show_skill_arrow3 = self:FindVariable("ShowSkillUplevel3")

	self.have_pro_num = self:FindVariable("ActivateProNum")
	self.need_pro_num = self:FindVariable("ExchangeNeedNum")

	self.auto_buy_toggle = self:FindObj("AutoToggle")
	self.start_button = self:FindObj("StartButton")
	self.auto_button = self:FindObj("AutoButton")
	self.gray_use_button = self:FindObj("GrayUseButton")
	self.button_text = self:FindVariable("button_text")
	self.button_ismax = self:FindVariable("button_ismax")

	self.bipin_reward = self:FindVariable("BiPinIconReward")
	local is_get_reward = CompetitionActivityData.Instance:IsGetReward(TabIndex.wing_jinjie)
	local vis = CompetitionActivityData.Instance:GetBiPinRewardTips(TabIndex.wing_jinjie)
	self.bipin_reward:SetValue(vis and not is_get_reward)
	self.bipin_redpoint = self:FindVariable("BiPinRedPoint")
	self.clear_luck_val = self:FindVariable("ClearLuckVal")

	self.all_attr_panel = self:FindObj("AllAttrPanel")
	self.all_attr_percent = self:FindVariable("AllAttrPercent")
	self.active_need_grade = self:FindVariable("ActiveNeedGrade")
	self.all_attr_btn_gray = self:FindVariable("AllAttrBtnGray")

	--进阶奖励相关
	self.show_jin_jie_reward = self:FindVariable("ShowJinJieAward")
	self.jin_jie_image = self:FindVariable("JinJieImage")
	self.add_text = self:FindVariable("AddText")
	self.show_jin_jie_reward_red_point = self:FindVariable("ShowJinjieRedPoint")
	self.jin_jie_add_per = self:FindVariable("JinJieAddPer")
	self.jin_jie_str = self:FindVariable("JinJieStr")
	self.jin_jie_free_time = self:FindVariable("JinJieFreeTime")
	self.jin_jie_is_free = self:FindVariable("JinJieIsFree")
	self.jin_jie_is_active = self:FindVariable("JinJieIsActive")
	--小目标相关
	self.is_show_small_target = self:FindVariable("IsShowSmallTarget")
	self.small_target_title_image = self:FindVariable("SmallTargetTitleImage")
	self.is_can_free_get_small_target = self:FindVariable("IsCanFreeGetSmallTarget")
	self.small_target_power = self:FindVariable("SmallTargetPower")
	self.small_target_free_time = self:FindVariable("SmallTargetFreeTime")
	self.free_get_small_target_is_end = self:FindVariable("FreeGetSmallTargetIsEnd")

	self.btn_tip_anim = self:FindObj("BtnTipAnim")
	self.btn_tip_anim_flag = true

	self.stars_list = {}
	local stars_obj = self:FindObj("Stars")
	for i = 1, 10 do
		self.stars_list[i] = stars_obj:FindObj("Star"..i)
	end

	self.stars_hide_list = {}
	for i=1,10 do
		self.stars_hide_list[i] = {
		hide_star = self:FindVariable("HideStar"..i)
	}
	end

	self.skill_mask_list = {}
	for i=1,3 do
		self.skill_mask_list[i] = {
		skill_mask = self:FindVariable("skill_mask"..i)
	}
	end

	self.display = self:FindObj("display")
	self.model_view = RoleModel.New("advance_wing_panel")
	self.model_view:SetDisplay(self.display.ui3d_display)

	self.item = ItemCell.New()
	self.item:SetInstanceParent(self:FindObj("item"))

	self.wing_skill_list = {}

	self:GetWingSkill()

	self.is_auto = false
	self.is_can_auto = true
	self.jinjie_next_time = 0
	self.old_attrs = {}
	self.skill_fight_power = 0
	self.fix_show_time = 10
	self.res_id = -1
	self.cur_select_grade = -1
	self.temp_grade = -1
	self.is_on_look = false
	self.prefab_preload_id = 0
	self.wing_asset_id = 0
	self.now_level = 0
end

function AdvanceWingView:__delete()
	self:RemoveCountDown()
	self.jinjie_next_time = nil
	self.is_auto = nil
	self.wing_skill_list = nil
	self.old_attrs = {}
	self.skill_fight_power = nil
	self.fix_show_time = nil
	self.res_id = nil
	self.have_pro_num = nil
	self.need_pro_num = nil
	self.show_jin_jie_reward = nil
	self.jin_jie_image = nil
	self.add_text = nil
	self.show_jin_jie_reward_red_point = nil
	self.jin_jie_add_per = nil
	self.jin_jie_str = nil
	self.jin_jie_free_time = nil
	self.jin_jie_is_free = nil
	self.jin_jie_is_active = nil
	self.is_show_small_target = nil
	self.small_target_title_image = nil
	self.is_can_free_get_small_target = nil
	self.small_target_power = nil
	self.small_target_free_time = nil
	self.free_get_small_target_is_end = nil

	if self.count_down ~= nil then
		CountDown.Instance:RemoveCountDown(self.count_down)
		self.count_down = nil
	end
	if self.item_data_event ~= nil then
		ItemData.Instance:UnNotifyDataChangeCallBack(self.item_data_event)
		self.item_data_event = nil
	end
	if self.upgrade_timer_quest then
		GlobalTimerQuest:CancelQuest(self.upgrade_timer_quest)
		self.upgrade_timer_quest = nil
	end

	if self.model_view then
		self.model_view:DeleteMe()
		self.model_view = nil
	end

	if self.item ~= nil then
		self.item:DeleteMe()
		self.item = nil
	end

	if self.delay_timer then
		GlobalTimerQuest:CancelQuest(self.delay_timer)
		self.delay_timer = nil
	end

	self.btn_tip_anim = nil
	self.btn_tip_anim_flag = nil
	self.bipin_redpoint = nil

	PrefabPreload.Instance:StopLoad(self.prefab_preload_id)
end

-- 开始进阶
function AdvanceWingView:OnStartAdvance()
	local wing_info = WingData.Instance:GetWingInfo()
	if not wing_info or not next(wing_info) then return end

	if wing_info.grade == 0 then
		return
	end
	--判断羽翼比拼是否开启
	-- if TipsCtrl.Instance:GetBiPingView():IsOpen() and wing_info.grade == 6 then
	-- 	TipsCtrl.Instance:GetBiPingView():SetTipViewFiveLevelcfg()
	-- 	return
	-- end

	local wing_grade_cfg = WingData.Instance:GetWingGradeCfg(wing_info.grade)
	local is_auto_buy_toggle = self.auto_buy_toggle.toggle.isOn
	if nil == wing_grade_cfg or wing_info.grade >= WingData.Instance:GetMaxGrade() then
		return
	end

	local stuff_item_id = wing_grade_cfg.upgrade_stuff_id
	-- local wing_info = WingData.Instance:GetWingInfo()
	local pack_num = wing_grade_cfg.upgrade_stuff_count
	local num = ItemData.Instance:GetItemNumInBagById(wing_grade_cfg.upgrade_stuff_id) + ItemData.Instance:GetItemNumInBagById(wing_grade_cfg.upgrade_stuff2_id)
	if num < pack_num and not is_auto_buy_toggle then
		self.is_auto = false
		self.is_can_auto = true
		self:SetAutoButtonGray()
		-- 物品不足，弹出TIP框
		local item_cfg = ConfigManager.Instance:GetAutoConfig("shop_auto").item[stuff_item_id]
		if item_cfg == nil then
			TipsCtrl.Instance:ShowSystemMsg(Language.Exchange.NotEnoughItem)
			return
		end

		if item_cfg.bind_gold == 0 then
			TipsCtrl.Instance:ShowShopView(stuff_item_id, 2)
			return
		end

		local func = function(item_id, item_num, is_bind, is_use, is_buy_quick)
			MarketCtrl.Instance:SendShopBuy(item_id, item_num, is_bind, is_use)
			if is_buy_quick then
				self.auto_buy_toggle.toggle.isOn = true
			end
		end
		TipsCtrl.Instance:ShowCommonBuyView(func, stuff_item_id, nofunc, 1)
		return
	end

	local is_auto_buy = self.auto_buy_toggle.toggle.isOn and 1 or 0
	local next_time = wing_grade_cfg and wing_grade_cfg.next_time or 0.1
	WingCtrl.Instance:SendUpGradeReq(is_auto_buy, self.is_auto, math.floor(num / pack_num))
	self.jinjie_next_time = Status.NowTime + next_time

end

function AdvanceWingView:CallOnStartAdvance()
	local wing_info = WingData.Instance:GetWingInfo()
	if not wing_info or not next(wing_info) then return end

	if wing_info.grade == 0 then
		return
	end
	--判断羽翼比拼是否开启
	-- if TipsCtrl.Instance:GetBiPingView():IsOpen() and wing_info.grade == 6 then
	-- 	TipsCtrl.Instance:GetBiPingView():SetTipViewFiveLevelcfg()
	-- 	return
	-- end

	local wing_grade_cfg = WingData.Instance:GetWingGradeCfg(wing_info.grade)

	local is_auto_buy_toggle = self.auto_buy_toggle.toggle.isOn

	if wing_grade_cfg == nil or wing_info.grade >= WingData.Instance:GetMaxGrade() then
		return
	end

	local stuff_item_id = wing_grade_cfg.upgrade_stuff_id
	local pack_num = wing_grade_cfg.upgrade_stuff_count
	local num = ItemData.Instance:GetItemNumInBagById(wing_grade_cfg.upgrade_stuff_id) + ItemData.Instance:GetItemNumInBagById(wing_grade_cfg.upgrade_stuff2_id)
	if num < pack_num and not is_auto_buy_toggle then
		self.is_auto = false
		self.is_can_auto = true
		self:SetAutoButtonGray()
		-- 物品不足，弹出TIP框
		local item_cfg = ConfigManager.Instance:GetAutoConfig("shop_auto").item[stuff_item_id]
		if item_cfg == nil then
			TipsCtrl.Instance:ShowSystemMsg(Language.Exchange.NotEnoughItem)
			return
		end

		if item_cfg.bind_gold == 0 then
			TipsCtrl.Instance:ShowShopView(stuff_item_id, 2)
			return
		end
		return
	end

	local is_auto_buy = self.auto_buy_toggle.toggle.isOn and 1 or 0
	local next_time = wing_grade_cfg and wing_grade_cfg.next_time or 0.1
	WingCtrl.Instance:SendUpGradeReq(is_auto_buy, self.is_auto, math.floor(num / pack_num)) -- , self.is_auto
	self.jinjie_next_time = Status.NowTime + next_time
end

function AdvanceWingView:AutoUpGradeOnce()
	local jinjie_next_time = 0
	if nil ~= self.upgrade_timer_quest then
		if self.jinjie_next_time >= Status.NowTime then
			jinjie_next_time = self.jinjie_next_time - Status.NowTime
		end
		GlobalTimerQuest:CancelQuest(self.upgrade_timer_quest)
	end

	if self.cur_select_grade > 0 and self.cur_select_grade <= WingData.Instance:GetMaxGrade() then
		if self.is_auto then
			self.upgrade_timer_quest = GlobalTimerQuest:AddDelayTimer(BindTool.Bind2(self.CallOnStartAdvance,self), jinjie_next_time)
		end
	end
end

function AdvanceWingView:WingUpgradeResult(result)
	self.is_can_auto = true
	if 0 == result then
		self.is_auto = false
		self:SetAutoButtonGray()
	else
		self:AutoUpGradeOnce()
	end
end

-- 自动进阶
function AdvanceWingView:OnAutomaticAdvance()
	local wing_info = WingData.Instance:GetWingInfo()
	if not wing_info or not next(wing_info) then return end

	if wing_info.grade == 0 then
		return
	end
	local wing_grade_cfg = WingData.Instance:GetWingGradeCfg(wing_info.grade)
	if nil == wing_grade_cfg then
		return
	end
	--判断羽翼比拼是否开启
	-- if TipsCtrl.Instance:GetBiPingView():IsOpen() and wing_info.grade == 6 then
	-- 	TipsCtrl.Instance:GetBiPingView():SetTipViewFiveLevelcfg()
	-- 	return
	-- end
	if not self.is_can_auto then
		return
	end

	--物品不足，弹出购买UI
	local stuff_item_id = wing_grade_cfg.upgrade_stuff_id
	local pack_num = wing_grade_cfg.upgrade_stuff_count
	local num = ItemData.Instance:GetItemNumInBagById(wing_grade_cfg.upgrade_stuff_id) + ItemData.Instance:GetItemNumInBagById(wing_grade_cfg.upgrade_stuff2_id)
	if num < pack_num and not self.auto_buy_toggle.toggle.isOn then
		local func = function(item_id, item_num, is_bind, is_use, is_buy_quick)
			MarketCtrl.Instance:SendShopBuy(item_id, item_num, is_bind, is_use)
			if is_buy_quick then
				self.auto_buy_toggle.toggle.isOn = true
			end
		end
		TipsCtrl.Instance:ShowCommonBuyView(func, stuff_item_id, nofunc, 1)
	end

	self.is_auto = self.is_auto == false
	self.is_can_auto = false
	self:CallOnStartAdvance()
	self:SetAutoButtonGray()
end

function AdvanceWingView:OnClickSendMsg()
	local wing_info = WingData.Instance:GetWingInfo()
	if not wing_info or not next(wing_info) then return end

	-- 发送冷却CD
	if not ChatData.Instance:GetChannelCdIsEnd(CHANNEL_TYPE.WORLD) then
		local time = ChatData.Instance:GetChannelCdEndTime(CHANNEL_TYPE.WORLD) - Status.NowTime
		time = math.ceil(time)
		TipsCtrl.Instance:ShowSystemMsg(string.format(Language.Chat.SendFail, time))
		return
	end

	local wing_grade = wing_info.grade
	local name = ""
	local color = TEXT_COLOR.WHITE
	local btn_color = 0
	if wing_grade > 1000 then
		local image_list = WingData.Instance:GetSpecialImageCfg(wing_grade - 1000)
		if nil ~= image_list and nil ~= image_list.image_name then
			name = image_list.image_name
			local item_cfg = ItemData.Instance:GetItemConfig(image_list.item_id)
			if nil ~= item_cfg then
				color = SOUL_NAME_COLOR_CHAT[item_cfg.color]
				btn_color = item_cfg.color
			end
		end
	else
		local image_list = WingData.Instance:GetWingImageCfg()[wing_info.used_imageid]
		if nil ~= image_list and nil ~= image_list.image_name then
			name = image_list.image_name
			local temp_grade = WingData.Instance:GetWingGradeByUseImageId(wing_info.used_imageid)
			local temp_color = (temp_grade / 3 + 1) >= 5 and 5 or math.floor(temp_grade / 3 + 1)
			color = SOUL_NAME_COLOR_CHAT[temp_color]
			btn_color = temp_color
		end
	end

	local game_vo = GameVoManager.Instance:GetMainRoleVo()
	local content = string.format(Language.Chat.AdvancePreviewLinkList[1], game_vo.role_id, name, color, btn_color, CHECK_TAB_TYPE.WING)
	ChatCtrl.SendChannelChat(CHANNEL_TYPE.WORLD, content, CHAT_CONTENT_TYPE.TEXT)

	ChatData.Instance:SetChannelCdEndTime(CHANNEL_TYPE.WORLD)
	TipsCtrl.Instance:ShowSystemMsg(Language.Chat.SendSucc)
end

-- 形象赋灵
function AdvanceWingView:OnClickFuLing()
	ViewManager.Instance:Open(ViewName.ImageFuLing, TabIndex.img_fuling_content, "fuling_type_tab", {IMG_FULING_JINGJIE_TYPE.IMG_FULING_JINGJIE_TYPE_WING})
end

function AdvanceWingView:OnClickBiPingReward()
	if self.btn_tip_anim_flag then
		self.btn_tip_anim.animator:SetBool("isClick", false)
	end
	ViewManager.Instance:Open(ViewName.CompetitionTips)
end

-- 显示全属性加成面板
function AdvanceWingView:OnClickAllAttrBtn()
	if self.delay_timer then
		GlobalTimerQuest:CancelQuest(self.delay_timer)
		self.delay_timer = nil
	end

	self.all_attr_panel:SetActive(not self.all_attr_panel.gameObject.activeSelf)
end

function AdvanceWingView:SetAllAttrPanel()
	local all_attr_percent = WingData.Instance:GetAllAttrPercent()
	local active_need_grade = WingData.Instance:GetActiveNeedGrade()
	local cur_grade = WingData.Instance:GetGrade()
	local jinjie_attr_percent, jinjie_name = JinJieRewardData.Instance:GetSystemShowPercentAndName(JINJIE_TYPE.JINJIE_TYPE_WING)

	self.all_attr_percent:SetValue(all_attr_percent)
	self.active_need_grade:SetValue(active_need_grade - 1) --客户端显示的阶数比服务端少一，所以这里减一
	self.jin_jie_add_per:SetValue(jinjie_attr_percent)
	self.jin_jie_str:SetValue(jinjie_name)
end

function AdvanceWingView:FlushAllAttrPanel()
	local active_need_grade = WingData.Instance:GetActiveNeedGrade()
	local cur_grade = WingData.Instance:GetGrade()
	self.all_attr_btn_gray:SetValue(cur_grade >= active_need_grade)
end

-- 使用当前羽翼
function AdvanceWingView:OnClickUse()
	if self.cur_select_grade == nil then
		return
	end
	local grade_cfg = WingData.Instance:GetWingGradeCfg(self.cur_select_grade)
	if not grade_cfg then return end
	WingCtrl.Instance:SendUseWingImage(grade_cfg.image_id)
end

--显示上一阶形象
function AdvanceWingView:OnClickLastButton()
	if not self.cur_select_grade or self.cur_select_grade <= 0 then
		return
	end
	self.cur_select_grade = self.cur_select_grade - 1
	self:SetArrowState(self.cur_select_grade)
	self:SwitchGradeAndName(self.cur_select_grade)
	self:OnFlush()
end

--显示下一阶形象
function AdvanceWingView:OnClickNextButton()
	local wing_info = WingData.Instance:GetWingInfo()
	if not self.cur_select_grade or self.cur_select_grade > wing_info.grade or wing_info.grade == 0 then
		return
	end
	self.cur_select_grade = self.cur_select_grade + 1
	self:SetArrowState(self.cur_select_grade)
	self:SwitchGradeAndName(self.cur_select_grade)
	-- if self.wing_display ~= nil then
		-- self.wing_display.ui3d_display:ResetRotation()
	-- end
	self:OnFlush()
end

function AdvanceWingView:SwitchGradeAndName(index)
	if index == nil then return end

	local wing_grade_cfg = WingData.Instance:GetWingGradeCfg(index)
	local image_cfg = WingData.Instance:GetWingImageCfg()
	if wing_grade_cfg == nil then return end

	local bundle, asset = nil, nil
	if math.floor(index / 3 + 1) >= 5 then
		 bundle, asset = ResPath.GetWingGradeQualityBG(5)
	else
		 bundle, asset = ResPath.GetWingGradeQualityBG(math.floor(index / 3 + 1))
	end
	self.quality:SetAsset(bundle, asset)
	self.wing_rank:SetValue(wing_grade_cfg.gradename)
	if image_cfg[wing_grade_cfg.image_id] and self.res_id ~= image_cfg[wing_grade_cfg.image_id].res_id then
		local color = (index / 3 + 1) >= 5 and 5 or math.floor(index / 3 + 1)
		local name_str = image_cfg[wing_grade_cfg.image_id].image_name
		self.wing_name:SetValue(string.format("<color=%s>%s</color>", SOUL_NAME_COLOR[color], name_str))

		local call_back = function(model, obj)
			local cfg = model:GetModelDisplayParameterCfg(DISPLAY_MODEL_TYPE[DISPLAY_TYPE.ROLE_WING], WingData.Instance:GetWingModelResCfg(), DISPLAY_PANEL.FULL_PANEL)
			if obj then
				if cfg then
					obj.transform.localPosition = cfg.position
					obj.transform.localRotation = Quaternion.Euler(cfg.rotation.x, cfg.rotation.y, cfg.rotation.z)
					obj.transform.localScale = cfg.scale
				else
					obj.transform.localPosition = Vector3(0, 0, 0)
					obj.transform.localRotation = Quaternion.Euler(0, 0, 0)
					obj.transform.localScale = Vector3(1, 1, 1)
				end
			end
		end
		UIScene:SetModelLoadCallBack(call_back)

		PrefabPreload.Instance:StopLoad(self.prefab_preload_id)

		bundle, asset = ResPath.GetWingModel(image_cfg[wing_grade_cfg.image_id].res_id)
		self.wing_bundle = bundle
		self.wing_asset = asset
		local load_list = {{bundle, asset}}
		self.prefab_preload_id = PrefabPreload.Instance:LoadPrefables(load_list, function()
				local vo = GameVoManager.Instance:GetMainRoleVo()
				local info = {}
				info.wing_info = {used_imageid = wing_grade_cfg.image_id}
				info.prof = PlayerData.Instance:GetRoleBaseProf()
				info.sex = vo.sex
				info.is_not_show_weapon = true
				info.shizhuang_part_list = {{use_index = 0}, {use_index = vo.appearance.fashion_body}}
				UIScene:SetRoleModelResInfo(info)
			end)
		self.res_id = image_cfg[wing_grade_cfg.image_id].res_id
	end
end

-- 资质
function AdvanceWingView:OnClickZiZhi()
	ViewManager.Instance:Open(ViewName.TipZiZhi, nil, "wingzizhi", {item_id = WingDanId.ZiZhiDanId})
end

-- 点击进阶装备
function AdvanceWingView:OnClickEquipBtn()
	local is_active, activite_grade = WingData.Instance:IsOpenEquip()
	if not is_active then
		local name = Language.Advance.PercentAttrNameList[TabIndex.wing_jinjie] or ""
		TipsCtrl.Instance:ShowSystemMsg(string.format(Language.Advance.OnOpenEquipTip, name, CommonDataManager.GetDaXie(activite_grade)))
		return
	end
	ViewManager.Instance:Open(ViewName.AdvanceEquipView, TabIndex.wing_jinjie)
end

-- 幻化
function AdvanceWingView:OnClickHuanHua()
	ViewManager.Instance:Open(ViewName.WingHuanHua)
	WingHuanHuaCtrl.Instance:FlushView("winghuanhua")
end

-- 点击羽翼技能
function AdvanceWingView:OnClickWingSkill(index)
	ViewManager.Instance:Open(ViewName.TipSkillUpgrade, nil, "wingskill", {index = index - 1})
end

function AdvanceWingView:GetWingSkill()
	for i = 1, 4 do
		local skill = self:FindObj("WingSkill"..i)
		local icon = skill:FindObj("Image")
		table.insert(self.wing_skill_list, {skill = skill, icon = icon})
	end
	for k, v in pairs(self.wing_skill_list) do
		local bundle, asset = ResPath.GetWingSkillIcon(k)
		v.icon.image:LoadSprite(bundle, asset)
		v.skill.toggle:AddValueChangedListener(BindTool.Bind(self.OnClickWingSkill, self, k))
	end
end

function AdvanceWingView:FlushSkillIcon()
	local wing_skill_list = WingData.Instance:GetWingInfo().skill_level_list
	if nil == wing_skill_list then return end

	for k, v in pairs(self.wing_skill_list) do
		if v.icon.grayscale then
			v.icon.grayscale.GrayScale = wing_skill_list[k - 1] > 0 and 0 or 255
		end
	end
	for k,v in pairs(self.skill_mask_list) do
		v.skill_mask:SetValue(wing_skill_list[k-1]>0)
	end
end

-- 设置羽翼属性
function AdvanceWingView:SetWingAtrr()
	local wing_info = WingData.Instance:GetWingInfo()
	local image_cfg = WingData.Instance:GetWingImageCfg()
	if wing_info == nil or wing_info.grade == nil then
		self:SetAutoButtonGray()
		return
	end

	if wing_info.wing_level == 0 or wing_info.grade == 0 then
		local wing_grade_cfg = WingData.Instance:GetWingGradeCfg(1)
		self:SetAutoButtonGray()
		local num = ItemData.Instance:GetItemNumInBagById(wing_grade_cfg.upgrade_stuff_id) + ItemData.Instance:GetItemNumInBagById(wing_grade_cfg.upgrade_stuff2_id)
		self.remainder_num:SetValue(num)
		return
	end
	local wing_grade_cfg = WingData.Instance:GetWingGradeCfg(wing_info.grade)

	if not wing_grade_cfg then return end
	local stuff_item_id = wing_grade_cfg.upgrade_stuff_id

	self.clear_luck_val:SetValue(wing_grade_cfg.is_clear_bless == 1)
	local data = {item_id = stuff_item_id, is_bind = 0}
	self.item:SetData(data)
	if self.temp_grade < 0 then
		if wing_grade_cfg.show_grade == 0 then
			self.cur_select_grade = wing_info.grade
		else
			self.cur_select_grade = wing_info.used_imageid >= GameEnum.MOUNT_SPECIAL_IMA_ID and wing_info.grade
									or WingData.Instance:GetWingGradeByUseImageId(wing_info.used_imageid)
		end
		self:SetAutoButtonGray()
		self:SetArrowState(self.cur_select_grade)
		self:SwitchGradeAndName(self.cur_select_grade)
		self.temp_grade = wing_info.grade
	else
		if self.temp_grade < wing_info.grade then
			-- 升级成功音效
			AudioService.Instance:PlayAdvancedAudio()
			-- 升级特效
			if not self.effect_cd or self.effect_cd <= Status.NowTime then
				self.show_effect:SetValue(false)
				self.show_effect:SetValue(true)
				self.effect_cd = EFFECT_CD + Status.NowTime
			end

			if wing_grade_cfg.show_grade == 0 then
				self.cur_select_grade = wing_info.grade
			else
				self.cur_select_grade = wing_info.used_imageid >= GameEnum.MOUNT_SPECIAL_IMA_ID and wing_info.grade
										or WingData.Instance:GetWingGradeByUseImageId(wing_info.used_imageid)
			end
			self.is_auto = false
			self.res_id = -1
			self:SetAutoButtonGray()
			self:SetArrowState(self.cur_select_grade)
			self:SwitchGradeAndName(wing_info.grade)

			self.show_on_look:SetValue(false)
			self.look_btn_text:SetValue(Language.Common.Look)
		end
		self.temp_grade = wing_info.grade
	end
	self:SetUseImageButtonState(self.cur_select_grade)

	if wing_info.grade >= WingData.Instance:GetMaxGrade() then
		self:SetAutoButtonGray()
		self.cur_bless:SetValue(Language.Common.YiMan)
		self.exp_radio:InitValue(1)
		self.hide_effect:SetValue(true)
	else
		self.cur_bless:SetValue(wing_info.grade_bless_val.."/"..wing_grade_cfg.bless_val_limit)
		if self.is_first then
			self.exp_radio:InitValue(wing_info.grade_bless_val/wing_grade_cfg.bless_val_limit)
			self.is_first = false
		else
			self.exp_radio:SetValue(wing_info.grade_bless_val/wing_grade_cfg.bless_val_limit)
		end
	end

	local skill_capability = 0
	for i = 0, 3 do
		if WingData.Instance:GetWingSkillCfgById(i) then
			skill_capability = skill_capability + WingData.Instance:GetWingSkillCfgById(i).capability
		end
	end
	self.skill_fight_power = skill_capability
	local attr =  CommonDataManager.GetAttributteByClass(wing_grade_cfg)--WingData.Instance:GetWingAttrSum()
	local capability = CommonDataManager.GetCapabilityCalculation(attr)
	local all_attr_percent_cap = WingData.Instance:CalculateAllAttrCap(capability)
	self.old_attrs = attr

	self.fight_power:SetValue(capability + skill_capability + all_attr_percent_cap)
	self.sheng_ming:SetValue(attr.max_hp)
	self.gong_ji:SetValue(attr.gong_ji)
	self.fang_yu:SetValue(attr.fang_yu)
	self.ming_zhong:SetValue(attr.ming_zhong)
	self.shan_bi:SetValue(attr.shan_bi)
	self.bao_ji:SetValue(attr.bao_ji)
	self.jian_ren:SetValue(attr.jian_ren)

	local bag_num = ItemData.Instance:GetItemNumInBagById(stuff_item_id) + ItemData.Instance:GetItemNumInBagById(wing_grade_cfg.upgrade_stuff2_id)
	local bag_num_str = string.format(Language.Mount.ShowGreenNum, bag_num)
	if bag_num <= 0 then
		bag_num_str = string.format(Language.Mount.ShowRedNum, bag_num)
	end
	self.remainder_num:SetValue(bag_num_str)

	local item_cfg = ItemData.Instance:GetItemConfig(stuff_item_id)
	local name_str = "<color="..SOUL_NAME_COLOR[item_cfg.color]..">"..item_cfg.name.."</color>"
	self.prop_name:SetValue(name_str)

	self.jia_shang:SetValue(attr.per_pofang)
	self.jian_shang:SetValue(attr.per_mianshang)
	self.show_zizhi_redpoint:SetValue(WingData.Instance:IsShowZizhiRedPoint())
	self.show_huanhua_redpoint:SetValue(WingData.Instance:IsCanHuanhuaUpgrade() ~= false)
	local can_uplevel_skill_list = WingData.Instance:CanSkillUpLevelList()
	self.show_skill_arrow1:SetValue(can_uplevel_skill_list[1] ~= nil)
	self.show_skill_arrow2:SetValue(can_uplevel_skill_list[2] ~= nil)
	self.show_skill_arrow3:SetValue(can_uplevel_skill_list[3] ~= nil)

	self.show_equip_remind:SetValue(WingData.Instance:CalAllEquipRemind() > 0)
	self.show_fuling_remind:SetValue(AdvanceData.Instance:CalFulingRemind(WingImageFulingType.Type))
end

function AdvanceWingView:SetArrowState(cur_select_grade)
	local wing_info = WingData.Instance:GetWingInfo()
	local max_grade = WingData.Instance:GetMaxGrade()
	local grade_cfg = WingData.Instance:GetWingGradeCfg(cur_select_grade)
	if not wing_info or not wing_info.grade or not cur_select_grade or not max_grade or not grade_cfg then
		return
	end
	self.show_right_button:SetValue(cur_select_grade < wing_info.grade + 1 and cur_select_grade < max_grade)
	self.show_left_button:SetValue(grade_cfg.image_id > 1 or (wing_info.grade  == 1 and cur_select_grade > wing_info.grade))
	self:SetUseImageButtonState(cur_select_grade)
end

--设置使用形象按钮
function AdvanceWingView:SetUseImageButtonState(cur_select_grade)
	local wing_info = WingData.Instance:GetWingInfo()
	local max_grade = WingData.Instance:GetMaxGrade()
	local grade_cfg = WingData.Instance:GetWingGradeCfg(cur_select_grade)

	if not wing_info or not wing_info.grade or not cur_select_grade or not max_grade or not grade_cfg then
		return
	end
	self.show_use_button:SetValue(cur_select_grade <= wing_info.grade and grade_cfg.image_id ~= wing_info.used_imageid)
	self.show_use_image:SetValue(grade_cfg.image_id == wing_info.used_imageid)
end

-- 点击自动进阶，服务器返回信息，设置按钮状态
function AdvanceWingView:SetAutoButtonGray()
	local wing_info = WingData.Instance:GetWingInfo()
	if wing_info.grade == nil then return end

	local max_grade = WingData.Instance:GetMaxGrade()

	if not wing_info or not wing_info.grade or wing_info.grade <= 0
		or wing_info.grade >= max_grade then
		self.auto_btn_text:SetValue(Language.Common.ZiDongJinJie)
		self.start_button.button.interactable = false
		self.auto_button.button.interactable = false
		self.button_ismax:SetValue(false)
		return
	end

	if self.is_auto then
		self.auto_btn_text:SetValue(Language.Common.Stop)
		self.start_button.button.interactable = false
		self.auto_button.button.interactable = true
		self.button_text:SetValue(false)
	else
		self.auto_btn_text:SetValue(Language.Common.ZiDongJinJie)
		self.start_button.button.interactable = true
		self.auto_button.button.interactable = true
		self.button_text:SetValue(true)
		self.button_ismax:SetValue(true)
	end
end

-- 物品不足，购买成功后刷新物品数量
function AdvanceWingView:ItemDataChangeCallback(item_id, index, reason, put_reason, old_num, new_num)
	local wing_info = WingData.Instance:GetWingInfo()
	if not wing_info or not next(wing_info) then return end
	local wing_grade_cfg = WingData.Instance:GetWingGradeCfg(wing_info.grade)
	if wing_grade_cfg == nil  or self.remainder_num == nil then
		return
	end

	local bag_num = ItemData.Instance:GetItemNumInBagById(wing_grade_cfg.upgrade_stuff_id) + ItemData.Instance:GetItemNumInBagById(wing_grade_cfg.upgrade_stuff2_id)
	local bag_num_str = string.format(Language.Common.ShowYellowStr, bag_num)
	if bag_num <= 0 then
		bag_num_str = string.format(Language.Mount.ShowRedNum, bag_num)
	end
	self.remainder_num:SetValue(bag_num_str)
	self.have_pro_num:SetValue(bag_num_str)
end

function AdvanceWingView:SetModle(is_show)
	if is_show then
		if not WingData.Instance:IsActiviteWing() then
			return
		end
		local wing_info = WingData.Instance:GetWingInfo()
		if not wing_info or not next(wing_info) then return end
		local used_imageid = wing_info.used_imageid
		local wing_grade_cfg = WingData.Instance:GetWingGradeCfg(wing_info.grade)
		if used_imageid >= GameEnum.MOUNT_SPECIAL_IMA_ID then
			used_imageid = WingData.Instance:GetWingGradeCfg(wing_info.grade).image_id
		end

		-- 还原到非预览状态
		self.is_on_look = false
		self.show_on_look:SetValue(false)
		self.look_btn_text:SetValue(Language.Common.Look)

		if wing_grade_cfg and used_imageid and self.cur_select_grade < 0 then
			local cur_select_grade = wing_grade_cfg.show_grade == 0 and wing_info.grade or WingData.Instance:GetWingGradeByUseImageId(used_imageid)
			self:SetArrowState(cur_select_grade)
			self:SwitchGradeAndName(cur_select_grade)
			self.cur_select_grade = self.cur_select_grade and cur_select_grade
		end
	else
		self.temp_grade = -1
		self.cur_select_grade = -1
		if self.show_effect then
			self.show_effect:SetValue(false)
		end
	end
end

function AdvanceWingView:ClearTempData()
	self.res_id = -1
	self.cur_select_grade = -1
	self.temp_grade = -1
	self.is_auto = false
	self.wing_asset_id = 0
	self:RemoveCountDown()
end

function AdvanceWingView:RemoveNotifyDataChangeCallBack()
	self:RemoveCountDown()
	if self.count_down ~= nil then
		CountDown.Instance:RemoveCountDown(self.count_down)
		self.count_down = nil
	end
	self.temp_grade = -1
	self.res_id = -1
	self.cur_select_grade = -1
	if self.upgrade_timer_quest then
		GlobalTimerQuest:CancelQuest(self.upgrade_timer_quest)
		self.upgrade_timer_quest = nil
	end
end

function AdvanceWingView:OpenCallBack()
	if self.show_effect then
		self.show_effect:SetValue(false)
	end
	self.is_first = true

	local info = WingData.Instance:GetWingInfo() or {}
	self.now_level = info.grade or 0

	self:ShowTextTip()
	self:SetAllAttrPanel()
end

function AdvanceWingView:ShowTextTip()
	local info = WingData.Instance:GetWingInfo() or {}
	local level = info.grade or 0

	if level > 5 and level < 8 then
		if self.delay_timer then
			GlobalTimerQuest:CancelQuest(self.delay_timer)
			self.delay_timer = nil
		end

		if self.all_attr_panel then
			self.all_attr_panel:SetActive(true)
		end

		self.delay_timer = GlobalTimerQuest:AddDelayTimer(function ()
			if self.all_attr_panel then
				self.all_attr_panel:SetActive(false)
			end
		end, 3)
	end
end

function AdvanceWingView:OnFlush(param_list, uplevel_list)
	if not WingData.Instance:IsActiviteWing() then
		return
	end

	self:JinJieReward()

	local is_get_reward = CompetitionActivityData.Instance:IsGetReward(TabIndex.wing_jinjie)
	local vis = CompetitionActivityData.Instance:GetBiPinRewardTips(TabIndex.wing_jinjie)
	self.bipin_reward:SetValue(vis and not is_get_reward)
	local bipin_redpoint = CompetitionActivityData.Instance:GetIsShowRedptByTabIndex(TabIndex.wing_jinjie)
    self.bipin_redpoint:SetValue(bipin_redpoint)

	self:GetMountProNum()

	if param_list == "wing" or type(param_list) == "table" then
		if self.root_node.gameObject.activeSelf then
			self:SetWingAtrr()
			self:FlushSkillIcon()
		end
	end
	local bundle = self.wing_bundle
	local asset = self.wing_asset
	if nil ~= bundle and nil ~= asset and self.wing_asset_id ~= asset then
		local main_role = Scene.Instance:GetMainRole()
		self.model_view:SetRoleResid(main_role:GetRoleResId())
		self.model_view:SetWingResid(asset)
		local part = self.model_view.draw_obj:GetPart(SceneObjPart.Wing)
		if part then
			part:SetTrigger("action")
		end
		self.wing_asset_id = asset
	end

	local info = WingData.Instance:GetWingInfo() or {}
	local level = info.grade or 0
	if self.now_level ~= level and level > 5 and level < 8 then
		self.now_level = level
		self:ShowTextTip()
	end

	self:FlushAllAttrPanel()
end

function AdvanceWingView:GetMountProNum()
	local wing_info = WingData.Instance:GetWingInfo()
	if not wing_info or not next(wing_info) then return end
	local wing_grade_cfg = WingData.Instance:GetWingGradeCfg(wing_info.grade)
	if nil == wing_grade_cfg then return end
	local upgrade_stuff_count = wing_grade_cfg.upgrade_stuff_count
	local count = ItemData.Instance:GetItemNumInBagById(wing_grade_cfg.upgrade_stuff_id) + ItemData.Instance:GetItemNumInBagById(wing_grade_cfg.upgrade_stuff2_id)

	if count < upgrade_stuff_count  then
		count = string.format(Language.Mount.ShowRedNum, count)
	else
		count = string.format(Language.Common.ShowYellowStr, count)
	end
	self.have_pro_num:SetValue(count)
	self.need_pro_num:SetValue(upgrade_stuff_count)
end

--------------------------------------------------进阶奖励相关显示---------------------------------------------------
--进阶奖励相关
function AdvanceWingView:JinJieReward()
	local system_type = JINJIE_TYPE.JINJIE_TYPE_WING
	local is_show_small_target = JinJieRewardData.Instance:IsShowSmallTarget(system_type)
	self.is_show_small_target:SetValue(is_show_small_target)
	if is_show_small_target then --小目标
	--	local target_type = JIN_JIE_REWARD_TARGET_TYPE.SMALL_TARGET
	--	self:SmallTargetConstantData(system_type, target_type)
	--	self:SmallTargetNotConstantData(system_type, target_type)
	else -- 大目标
		local target_type = JIN_JIE_REWARD_TARGET_TYPE.BIG_TARGET
		self:BigTargetConstantData(system_type, target_type)
		self:BigTargetNotConstantData(system_type, target_type)
	end
	
	JinJieRewardData.Instance:SetCurSystemType(system_type)
end

--清除大目标/小目标免费数据 target_type 目标类型  不传默认大目标
function AdvanceWingView:ClearJinJieFreeData(target_type)
	if target_type and target_type == JIN_JIE_REWARD_TARGET_TYPE.SMALL_TARGET then --小目标
		self.small_target_free_time:SetValue("")
		self.free_get_small_target_is_end:SetValue(false)
	else    --大目标
		self.jin_jie_free_time:SetValue("")
		self.jin_jie_is_free:SetValue(false)		
	end
end

--大目标 变动显示
function AdvanceWingView:BigTargetNotConstantData(system_type, target_type)
	local is_show_jin_jie = JinJieRewardData.Instance:IsShowJinJieRewardIcon(system_type)
	local speical_is_active = JinJieRewardData.Instance:GetSystemIsActiveSpecialImage(system_type)
	local active_is_end = JinJieRewardData.Instance:GetSystemFreeIsEnd(system_type)

	self.show_jin_jie_reward:SetValue(is_show_jin_jie)
	self.show_jin_jie_reward_red_point:SetValue(not speical_is_active)
	self.jin_jie_is_active:SetValue(speical_is_active)
	self.jin_jie_is_free:SetValue(not active_is_end)
	self:RemoveCountDown()

	if active_is_end then
		self:ClearJinJieFreeData(target_type)
		return
	end

	local end_time = JinJieRewardData.Instance:GetSystemFreeEndTime(system_type, target_type)
	self:FulshJinJieFreeTime(end_time, target_type)
end

--小目标 变动显示
function AdvanceWingView:SmallTargetNotConstantData(system_type, target_type)
	local is_free_end = JinJieRewardData.Instance:GetSystemSmallTargetFreeIsEnd(system_type)
	local is_can_free = JinJieRewardData.Instance:GetSystemSmallIsCanFreeLingQuFromInfo(system_type)
	self.is_can_free_get_small_target:SetValue(is_can_free)
	self.free_get_small_target_is_end:SetValue(not is_free_end)
	self:RemoveCountDown()

	if is_free_end then
		self:ClearJinJieFreeData(target_type)
		return
	end

	local end_time = JinJieRewardData.Instance:GetSystemFreeEndTime(system_type, target_type)
	self:FulshJinJieFreeTime(end_time, target_type)
end

--小目标固定显示
function AdvanceWingView:SmallTargetConstantData(system_type, target_type)
	if self.set_small_target then
		return 
	end

	self.set_small_target = true
	local small_target_title_image = JinJieRewardData.Instance:GetSingleRewardCfgParam0(system_type, target_type)
	local bundle, asset = ResPath.GetTitleIcon(small_target_title_image)
	self.small_target_title_image:SetAsset(bundle, asset)

	local power = JinJieRewardData.Instance:GetSmallTargetTitlePower(target_type)
	self.small_target_power:SetValue(power)
end

--大目标固定显示
function AdvanceWingView:BigTargetConstantData(system_type, target_type)
	local flag = JinJieRewardData.Instance:IsShowJinJieRewardIcon(system_type)
	if not flag or self.set_big_target then
		return
	end

	self.set_big_target = true
	local item_id = JinJieRewardData.Instance:GetSingleRewardCfgRewardId(system_type, target_type)
	local item_cfg = ItemData.Instance:GetItemConfig(item_id)
	if item_cfg and self.jin_jie_image then
		local item_bundle, item_asset = ResPath.GetItemIcon(item_cfg.icon_id)
		self.jin_jie_image:SetAsset(item_bundle, item_asset)
	end

	local per = JinJieRewardData.Instance:GetSingleAttrCfgAttrAddPer(system_type)
	local per_text = per * 0.01
	self.add_text:SetValue(per_text)
end

--刷新免费时间
function AdvanceWingView:FulshJinJieFreeTime(end_time, target_type)
	if end_time == 0 then
		self:ClearJinJieFreeData(target_type)
		return
	end

	local now_time = TimeCtrl.Instance:GetServerTime()
	local rest_time = end_time - now_time
	self:SetJinJieFreeTime(rest_time, target_type)
	if rest_time >= 0 and nil == self.least_time_timer then
		self.least_time_timer = CountDown.Instance:AddCountDown(rest_time, 1, function ()
			rest_time = rest_time - 1
			self:SetJinJieFreeTime(rest_time, target_type)
		end)
	else
		self:RemoveCountDown()
		self:ClearJinJieFreeData(target_type)
	end	
end

--设置进阶时间
function AdvanceWingView:SetJinJieFreeTime(time, target_type)
	if time > 0 then
		local time_str = ""
		if time > 3600 * 24 then
			time_str = TimeUtil.FormatSecond(time, 7)
		else
			local time_list = TimeUtil.Format2TableDHMS(time)
			if time > 3600 then
				time_str = time_list.hour .. Language.Common.TimeList.h
			elseif time > 60 then
				time_str = time_list.min .. Language.Common.TimeList.min
			else
				time_str = time_list.s .. Language.Common.TimeList.s
			end
		end
		self:FreeTimeShow(time_str, target_type)
	else
		self:RemoveCountDown()
		self:ClearJinJieFreeData(target_type)
		self:JinJieReward()
	end
end

--免费时间显示
function AdvanceWingView:FreeTimeShow(time, target_type)
	if target_type and target_type == JIN_JIE_REWARD_TARGET_TYPE.SMALL_TARGET then --小目标
		self.small_target_free_time:SetValue(time)
	else    --大目标
		self.jin_jie_free_time:SetValue(time)
	end
end

--移除倒计时
function AdvanceWingView:RemoveCountDown()
	if self.least_time_timer then
		CountDown.Instance:RemoveCountDown(self.least_time_timer)
		self.least_time_timer = nil
	end
end

--打开大目标面板
function AdvanceWingView:OnClickJinJieAward()
	JinJieRewardCtrl.Instance:OpenJinJieAwardView(JINJIE_TYPE.JINJIE_TYPE_WING)
end

--打开小目标面板
function AdvanceWingView:OnClickOpenSmallTarget()
	local function callback()
		local param1 = JINJIE_TYPE.JINJIE_TYPE_WING
		local param2 = JIN_JIE_REWARD_TARGET_TYPE.SMALL_TARGET
		local req_type = JINJIESYS_REWARD_OPEAR_TYPE.JINJIESYS_REWARD_OPEAR_TYPE_BUY

		local is_can_free = JinJieRewardData.Instance:GetSystemSmallIsCanFreeLingQuFromInfo(param1)
		if is_can_free then
			req_type = JINJIESYS_REWARD_OPEAR_TYPE.JINJIESYS_REWARD_OPEAR_TYPE_FETCH
		end
		JinJieRewardCtrl.Instance:SendJinJieRewardOpera(req_type, param1, param2)
	end

	local data = JinJieRewardData.Instance:GetSmallTargetShowData(JINJIE_TYPE.JINJIE_TYPE_WING, callback)
	TipsCtrl.Instance:ShowTimeLimitTitleView(data)
end