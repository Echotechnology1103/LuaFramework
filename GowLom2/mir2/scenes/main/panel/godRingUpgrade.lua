local godRingUpgrade = class("godRingUpgrade", import(".panelBase"))
local CommonItem = import("..common.item")
local CommonItemInfo = import("..common.itemInfo")
local tip = import(".wingInfo")
local godRingDesText = {
	[[
1������ɫ�ܵ��˺�ʱ�������ָ���԰��ٷֱȼ���˴��ܵ����˺���
2��ÿ����1���˺���ս/��/����Ҫ����0.2/2/1.5��ħ����
3���Ի����ָ�������������ף���������˺�����ı�����
4��ħ��ֵ����300ʱ�������ָ��������Ч��]],
	[[
1���Է�����ָ�������ף����Ի�÷�����Ч��
2������ɫ�ܵ��˺����Ҹô��˺�ʹ�ý�ɫʣ��Ѫ��������Ѫ����35%ʱ���ᴥ��������Чʹ�ô��˺���Ч��
3������������Чʱ����ظ���ɫѪ����ս/��/���ֱ�ظ�100/40/100��Ѫ��
4������������Чʱ�����ý�ɫ�����޵�״̬���޵�״̬�£������ܵ��κ��˺���
5��������Ч��������ȴʱ�䣬��ȴʱ�����ᴥ��������Ч����ʼ��ȴʱ�䣺300�롣
6���ܵ���������150���Ľ�ɫ����ʱ�������ᴥ��������Ч��Ҳ�����÷�����Ч������ȴ��]],
	[[
1����ɫ����ʱ���и��ʽ��з�������
2���������Ľ�ɫ���ж����ܵ����ƣ�ֻ���߲����ܣ�ͬʱ�˺��������30%��
3���Ա�˪��ָ�������������ף�������߽�ɫ������ֵ��������ֵԽ�ߣ������������˵ĸ���Խ�ߡ��������˵�ʱ��Խ����
4������ʱ���޷�������������150���Ľ�ɫ��]],
	[[
1�����������ָ�󣬿��Ի��������Ч��
2������ɫ���ϴ��и���״̬ʱ���ᴥ��������Ч���������ϵĸ���״̬��������״̬���ж�/����/��ԣ�
3������������Чʱ�����ý�ɫ��������״̬������״̬�£������ܵ��κθ���״̬Ӱ�졣
4��������Ч��������ȴʱ�䣬��ȴʱ�����ᴥ��������Ч����ʼ��ȴʱ�䣺300�롣
5��ӵ�������ָ�󣬽�ɫ�ڰ�ȫ�����Ӷ���ظ�Ч����ÿ10�밴�ٷֱȻظ�����Ѫ����ħ����
6���������ָ�������������ף�������������״̬����ʱ�䡢��߰�ȫ���ظ��ٷֱȲ�����������Ч��������ȴʱ�䡣]]
}
godRingUpgrade.ctor = function (self, params)
	self.super.ctor(self)
	self.setMoveable(self, true)

	self.params = params or {}
	self.page = params.page or 1
	self.selType = params.type or "����"
	self.selGodRingId = params.godRingId or 1
	self.firstIn = true
	self.isOtherPlayer = params.playerName ~= nil
	self.bindJob = (self.isOtherPlayer and params.job) or g_data.player.job
	self.tabCallbacks = {}

	return 
end
godRingUpgrade.onEnter = function (self)
	local tabstr = {
		"��\n��",
		"��\n��"
	}
	local tabcb = {
		self.upGodRingLvPage,
		self.UpGodRingStepPage
	}
	self.tabCallbacks = tabcb

	self.initPanelUI(self, {
		title = "���",
		bg = "pic/common/black_2.png",
		tab = {
			strs = tabstr,
			default = self.page
		}
	})
	self.pos(self, display.cx - 102, display.cy)
	self.bindNetEvent(self, SM_UpdateGodRingLv, self.onSM_UpdateGodRingLv)
	self.bindNetEvent(self, SM_UpdateGodRingStep, self.onSM_UpdateGodRingStep)
	self.bindNotify(self, "M_GODRING_DATA_CHG", self.onM_GODRING_DATA_CHG)

	return 
end
godRingUpgrade.onCloseWindow = function (self)
	self.closePreviewPanel(self)

	if self.animHandle then
		scheduler.unscheduleGlobal(self.animHandle)
	end

	g_data.eventDispatcher:dispatch("M_GODRING_DATA_CHG")

	return self.super.onCloseWindow(self)
end
godRingUpgrade.clearContentNode = function (self)
	if self.contentNode then
		self.contentNode:removeSelf()

		self.rightNode = nil
	end

	self.contentNode = display.newNode():addTo(self.bg)
	self.contentNode.controls = {}
	self.contentNode.data = {}

	return 
end
godRingUpgrade.onTabClick = function (self, idx, btn)
	self.clearContentNode(self)
	self.closePreviewPanel(self)

	if self.firstIn then
		self.firstIn = false
	elseif not self.firstIn then
		self.selGodRingId = 1
	end

	self.curTab = self.tabCallbacks[idx]
	self.curIdx = idx

	self.tabCallbacks[idx](self)

	return 
end
godRingUpgrade.closePreviewPanel = function (self)
	if main_scene.ui.panels.godRingLvlPreview then
		main_scene.ui:togglePanel("godRingLvlPreview")
	end

	if main_scene.ui.panels.godRingSteplPreview then
		main_scene.ui:togglePanel("godRingSteplPreview")
	end

	return 
end
godRingUpgrade.loadGodRingPage = function (self)
	display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(12, 13):size(160, 393):addTo(self.contentNode)
	display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(173, 13):size(275, 393):addTo(self.contentNode)
	display.newSprite(res.gettex2("pic/panels/solider/gemstone_bg.png")):anchor(0, 0):pos(175, 16):add2(self.contentNode)
	display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(449, 13):size(181, 393):addTo(self.contentNode)

	local scrollRect = cc.rect(0, 0, 160, 387)
	self.contentNode.controls.GodRingLeftScroll = self.newListView(self, 12, 16, scrollRect.width, scrollRect.height, 4, {}):add2(self.contentNode)
	self.rightNode = display.newNode():addTo(self.contentNode)

	ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("animation/GemUpgrade/Upgrade.csb")

	self.expAnim = ccs.Armature:create("Upgrade")

	self.expAnim:anchor(0.5, 0.5)
	self.expAnim:setPosition(308, 285)
	self.expAnim:setVisible(false)
	self.contentNode:addChild(self.expAnim, 99999)

	return 
end
godRingUpgrade.upGodRingLvPage = function (self)
	self.selType = "����"

	self.loadGodRingPage(self)

	local leftScroll = self.contentNode.controls.GodRingLeftScroll

	if not leftScroll then
		return 
	end

	leftScroll.removeAllChildren(leftScroll)

	self.contentNode.controls.UpGodRingLvItems = {}

	local function onGodRingItemSelect(btn)
		for k, v in ipairs(self.contentNode.controls.UpGodRingLvItems) do
			v.unselect(v)
			v.setTouchEnabled(v, true)
		end

		btn.select(btn)
		btn.setTouchEnabled(btn, false)

		self.selGodRingId = btn.info.FID

		self:updateRightInfo()

		return 
	end

	for i, v in ipairs(g_data.player.godRingList) do
		local itemLv = v.FLevel or 0
		local itemName = def.godring.nameCfg[v.FID] or ""
		local item = an.newBtn(res.gettex2("pic/panels/picIdentify/equipTypeUnselect.png"), function (btn)
			sound.playSound("103")
			onGodRingItemSelect(btn)

			return 
		end, {
			support = "scroll",
			select = {
				res.gettex2("pic/panels/picIdentify/equipTypeSelect.png")
			},
			label = {
				slot8 .. "��" .. itemName,
				20,
				0,
				{
					color = def.colors.Cf0c896
				}
			}
		})
		item.info = v

		table.insert(self.contentNode.controls.UpGodRingLvItems, item)
		self.listViewPushBack(self, leftScroll, item, {
			left = 5
		})

		if self.selGodRingId and self.selGodRingId == v.FID then
			item.select(item)
			item.setTouchEnabled(item, false)
		else
			item.unselect(item)
			item.setTouchEnabled(item, true)
		end
	end

	self.updateRightInfo(self)

	return 
end
godRingUpgrade.UpGodRingStepPage = function (self)
	self.selType = "����"

	self.loadGodRingPage(self)

	local leftScroll = self.contentNode.controls.GodRingLeftScroll

	if not leftScroll then
		return 
	end

	leftScroll.removeAllChildren(leftScroll)

	self.contentNode.controls.UpGodRingStepItems = {}

	local function onGodRingItemSelect(btn)
		for k, v in ipairs(self.contentNode.controls.UpGodRingStepItems) do
			v.unselect(v)
			v.setTouchEnabled(v, true)
		end

		btn.select(btn)
		btn.setTouchEnabled(btn, false)

		self.selGodRingId = btn.info.FID

		self:updateRightInfo()

		return 
	end

	for i, v in ipairs(g_data.player.godRingList) do
		local itemStep = v.FStep or 0
		local itemName = def.godring.nameCfg[v.FID] or ""
		local item = an.newBtn(res.gettex2("pic/panels/picIdentify/equipTypeUnselect.png"), function (btn)
			sound.playSound("103")
			onGodRingItemSelect(btn)

			return 
		end, {
			support = "scroll",
			select = {
				res.gettex2("pic/panels/picIdentify/equipTypeSelect.png")
			},
			label = {
				(itemStep == 0 and itemName) or common.numToUpperNum(slot8) .. "��" .. itemName,
				20,
				0,
				{
					color = def.colors.Cf0c896
				}
			}
		})
		item.info = v

		table.insert(self.contentNode.controls.UpGodRingStepItems, item)
		self.listViewPushBack(self, leftScroll, item, {
			left = 5
		})

		if self.selGodRingId and self.selGodRingId == v.FID then
			item.select(item)
			item.setTouchEnabled(item, false)
		else
			item.unselect(item)
			item.setTouchEnabled(item, true)
		end
	end

	self.updateRightInfo(self)

	return 
end
godRingUpgrade.updateRightInfo = function (self)
	local info = nil
	local type = self.selType

	for k, v in ipairs(g_data.player.godRingList) do
		if v.FID == self.selGodRingId then
			info = v
		end
	end

	local itemLv = info.FLevel or 0
	local itemStep = info.FStep or 0
	local itemName = def.godring.nameCfg[info.FID] or ""

	if not itemName or itemName == "" then
		return 
	end

	if self.rightNode then
		self.rightNode:removeAllChildren()
	end

	if info and type == "����" then
		self.haveStuff = info.FHaveStuffForLevel
	elseif info and type == "����" then
		self.haveStuff = info.FHaveStuffForStep
	end

	local title = ""

	if type == "����" then
		title = itemLv .. "����" .. itemName
	elseif type == "����" then
		title = (itemStep == 0 and itemName) or common.numToUpperNum(itemStep) .. "�ס�" .. itemName
	end

	an.newLabel(title, 20, 0, {
		color = def.colors.Cdcd2be
	}):anchor(0.5, 0.5):addto(self.rightNode):pos(310, 388)

	if type == "����" then
		local curGodRing = def.godring.getPlayerGodRing(info.FID)
		local colorBg = nil

		if curGodRing and 1 <= curGodRing.FStep and curGodRing.FStep <= 2 then
			colorBg = res.get2("pic/panels/godRing/bg_l.png")
		elseif curGodRing and 3 <= curGodRing.FStep and curGodRing.FStep <= 4 then
			colorBg = res.get2("pic/panels/godRing/bg_z.png")
		elseif curGodRing and 5 <= curGodRing.FStep then
			colorBg = res.get2("pic/panels/godRing/bg_c.png")
		end

		if colorBg then
			colorBg.pos(colorBg, 313, 292):anchor(0.5, 0.5):addto(self.rightNode)
		end
	end

	display.newSprite(res.gettex2("pic/panels/godRing/" .. def.godring.imgCfg[info.FID] .. ".png")):anchor(0.5, 0.5):pos(313, 292):add2(self.rightNode)

	local preViewLabel = an.newLabel(itemName .. "Ч��", 20, 0, {
		color = def.colors.Cf0c896
	}):anchor(0, 0.5):addTo(self.rightNode):pos(180, 170)

	preViewLabel.addUnderline(preViewLabel)
	preViewLabel.setTouchEnabled(preViewLabel, true)
	preViewLabel.setTouchSwallowEnabled(preViewLabel, true)
	preViewLabel.addNodeEventListener(preViewLabel, cc.NODE_TOUCH_EVENT, function (event)
		local touchInBtn = preViewLabel:getCascadeBoundingBox():containsPoint(cc.p(event.x, event.y))

		if event.name == "began" then
			preViewLabel:scale(1.1, 1.1)

			return true
		elseif event.name == "ended" then
			preViewLabel:scale(1, 1)
			sound.playSound("103")
			an.newMsgbox(godRingDesText[info.FID] or "", nil, {
				contentLabelSize = 20,
				title = itemName or ""
			})
		end

		return 
	end)
	an.newBtn(res.gettex2("pic/common/button_search.png"), function (btn)
		sound.playSound("103")

		if type == "����" then
			main_scene.ui:togglePanel("godRingLvlPreview", info.FID)
		else
			main_scene.ui:togglePanel("godRingSteplPreview", info.FID)
		end

		return 
	end, {
		select = {
			res.gettex2("pic/common/button_search.png")
		}
	}).add2(slot8, self.rightNode):anchor(0.5, 0.5):pos(343, 167)

	local preViewLabel = an.newLabel(type .. "Ԥ��", 20, 0, {
		color = def.colors.Cf0c896
	}):anchor(0.5, 0.5):addTo(self.rightNode):pos(400, 170)

	preViewLabel.addUnderline(preViewLabel)
	preViewLabel.setTouchEnabled(preViewLabel, true)
	preViewLabel.setTouchSwallowEnabled(preViewLabel, true)
	preViewLabel.addNodeEventListener(preViewLabel, cc.NODE_TOUCH_EVENT, function (event)
		local touchInBtn = preViewLabel:getCascadeBoundingBox():containsPoint(cc.p(event.x, event.y))

		if event.name == "began" then
			preViewLabel:scale(1.1, 1.1)

			return true
		elseif event.name == "ended" then
			preViewLabel:scale(1, 1)
			sound.playSound("103")

			if type == "����" then
				main_scene.ui:togglePanel("godRingLvlPreview", info.FID)
			else
				main_scene.ui:togglePanel("godRingSteplPreview", info.FID)
			end
		end

		return 
	end)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/flag.png")).anchor(slot9, 0, 0.5):pos(458, 389):add2(self.rightNode)
	display.newSprite(res.gettex2((type == "����" and "pic/panels/wingUpgrade/dqsx.png") or "pic/panels/godRing/bjsx.png")):anchor(0, 0.5):pos(476, 389):add2(self.rightNode)
	display.newScale9Sprite(res.getframe2("pic/scale/scale29.png")):anchor(0, 1):pos(455, 377):size(170, 165):addTo(self.rightNode)

	local curScroll = an.newScroll(455, 375, 170, 160, {
		labelM = {
			20,
			0
		}
	}):addTo(self.rightNode):anchor(0, 1)

	display.newSprite(res.gettex2("pic/panels/wingUpgrade/flag.png")):anchor(0, 0.5):pos(458, 196):add2(self.rightNode)
	display.newSprite(res.gettex2((type == "����" and "pic/panels/wingUpgrade/xjsx.png") or "pic/panels/godRing/xjsx.png")):anchor(0, 0.5):pos(476, 196):add2(self.rightNode)
	display.newScale9Sprite(res.getframe2("pic/scale/scale29.png")):anchor(0, 1):pos(455, 185):size(170, 165):addTo(self.rightNode)

	local nextScroll = an.newScroll(455, 183, 170, 160, {
		labelM = {
			20,
			0
		}
	}):addTo(self.rightNode):anchor(0, 1)
	local curProp, nextProp, nextGodRing = nil

	if type == "����" then
		curProp = def.godring.getPropByIdAndLevel(info.FID, info.FLevel, self.bindJob)
		nextProp = def.godring.getPropByIdAndLevel(info.FID, info.FLevel + 1, self.bindJob)
		curGodRing = def.godring.getGodRingByIdAndLevel(info.FID, info.FLevel)
		nextGodRing = def.godring.getGodRingByIdAndLevel(info.FID, info.FLevel + 1)
	else
		curProp = def.godring.getPropByIdAndStep(info.FID, info.FStep, self.bindJob)
		nextProp = def.godring.getPropByIdAndStep(info.FID, info.FStep + 1, self.bindJob)
		curGodRing = def.godring.getGodRingByIdAndStep(info.FID, info.FStep)
		nextGodRing = def.godring.getGodRingByIdAndStep(info.FID, info.FStep + 1)
	end

	local startPosY = 160
	local propIdx = 1

	local function addProp(scroll, left, right, colCount)
		left = left or ""
		right = right or ""
		colCount = colCount or 1
		local col = (propIdx - 1)%colCount
		local row = math.floor((propIdx - 1)/colCount)
		local lblProp = an.newLabel(left, 18, 1, {
			color = cc.c3b(240, 200, 150)
		}):anchor(0, 1):pos((col == 0 and 5) or 147, startPosY - row*25):add2(scroll)

		an.newLabel(right, 18, 1, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0, 1):pos(lblProp.getPositionX(lblProp) + lblProp.getw(lblProp), lblProp.getPositionY(lblProp)):add2(scroll)

		propIdx = propIdx + 1

		return 
	end

	startPosY = 160
	propIdx = 1

	if #curProp == 0 then
		slot16(curScroll, "��")
	end

	for k, v in ipairs(curProp) do
		local strs = string.split(v, ":")

		if #strs == 2 then
			if strs[1] == "��������˺�����" or strs[1] == "����Ч������ʱ��" or strs[1] == "���������ȴʱ��" or strs[1] == "��˪�����ȴʱ��" or strs[1] == "����Ч������ʱ��" or strs[1] == "���������ȴʱ��" or strs[1] == "��ȫ����Ѫ�ٷֱ�" then
				addProp(curScroll, strs[1])
				addProp(curScroll, "", strs[2])
			else
				addProp(curScroll, strs[1], strs[2])
			end
		end
	end

	startPosY = 160
	propIdx = 1

	if type == "����" and nextGodRing then
		if 0 < nextGodRing.NeedLevel and nextGodRing.NeedLevel ~= curGodRing.NeedLevel then
			addProp(nextScroll, "��Ҫ�ȼ�:", common.getLevelText(nextGodRing.NeedLevel) .. "��")
		end

		if 0 < nextGodRing.NeedSeverStep and nextGodRing.NeedSeverStep ~= curGodRing.NeedSeverStep then
			addProp(nextScroll, "��Ҫ�������׶�:")
			addProp(nextScroll, "", nextGodRing.NeedSeverStep .. "�׶�")
		end

		if nextGodRing.SpecialNeed ~= 0 and nextGodRing.SpecialNeed ~= "" then
			local spNeedStrs = string.split(nextGodRing.SpecialNeed, ";")

			for k, v in ipairs(spNeedStrs) do
				local aSpNeed = string.split(v, "|")

				if #aSpNeed == 2 then
					addProp(nextScroll, "��Ҫ" .. aSpNeed[1] .. "��ָ�ȼ�:")
					addProp(nextScroll, "", aSpNeed[2] .. "��")
				end
			end
		end
	elseif type == "����" and not nextGodRing then
		addProp(nextScroll, "������")
	elseif type == "����" and nextGodRing then
		if nextGodRing.SpecialNeed ~= 0 and nextGodRing.SpecialNeed ~= "" then
			local spNeedStrs = string.split(nextGodRing.SpecialNeed, ";")

			for k, v in ipairs(spNeedStrs) do
				local aSpNeed = string.split(v, "|")

				if #aSpNeed == 2 then
					addProp(nextScroll, "��Ҫ" .. aSpNeed[1] .. "��ָ�ȼ�:")
					addProp(nextScroll, "", aSpNeed[2] .. "��")
				end
			end
		end
	elseif type == "����" and not nextGodRing then
		addProp(nextScroll, "������")
	end

	if #nextProp == 0 and nextGodRing then
		addProp(nextScroll, "��")
	end

	for k, v in ipairs(nextProp) do
		local strs = string.split(v, ":")

		if #strs == 2 then
			if strs[1] == "��������˺�����" or strs[1] == "����Ч������ʱ��" or strs[1] == "���������ȴʱ��" or strs[1] == "��˪�����ȴʱ��" or strs[1] == "����Ч������ʱ��" or strs[1] == "���������ȴʱ��" or strs[1] == "��ȫ����Ѫ�ٷֱ�" then
				addProp(nextScroll, strs[1])
				addProp(nextScroll, "", strs[2])
			else
				addProp(nextScroll, strs[1], strs[2])
			end
		end
	end

	local needs = {}
	local needItemName = ""
	local needItemNum = 0

	if nextGodRing then
		local needitems = string.split(nextGodRing.NeedStuff, ";")

		for k, v in ipairs(needitems) do
			local needItem = string.split(v, "|")

			if #needItem == 2 then
				local name = ""
				local value = tonumber(needItem[2])
				local needItemNames = string.split(needItem[1], "&")

				if #needItemNames == 2 then
					name = needItemNames[2]
				else
					name = needItemNames[1]
				end

				needs[#needs + 1] = {
					name,
					value
				}
			end
		end
	end

	if 0 < #needs then
		needItemName = needs[1][1]
		needItemNum = needs[1][2]

		an.newLabel("���ģ�", 18, 0, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0, 0.5):addTo(self.rightNode, 2):pos(190, 90)

		local itemIdx = def.items.getItemIdByName(needItemName)

		if not itemIdx then
			return 
		end

		local needItem = CommonItem.new(def.items.getStdItemById(itemIdx), self, {
			donotMove = true,
			idx = idx
		}):add2(self.rightNode, 2):anchor(0, 0.5):pos(260, 90)

		if needItem.dura then
			needItem.dura:removeSelf()

			needItem.dura = nil
		end

		local lblNeedCount = an.newLabel("*" .. needItemNum, 18, 0, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0, 0.5):addTo(self.rightNode):pos(285, 90)

		an.newLabel("��", 18, 0, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0, 0.5):pos(lblNeedCount.getPositionX(lblNeedCount) + lblNeedCount.getw(lblNeedCount) + 5, 90):add2(self.rightNode)

		local id = def.items.getItemIdByName("���1")
		local gold = def.items.getStdItemById(id)

		CommonItem.new(gold, self, {
			isGold = true,
			donotMove = true,
			tex = res.gettex2("pic/panels/bag/gold.png")
		}):add2(self.rightNode):pos(lblNeedCount.getPositionX(lblNeedCount) + lblNeedCount.getw(lblNeedCount) + 50, 90)

		local needGoldLabel = an.newLabel(nextGodRing.NeedGold/10000 .. "��", 18, 0, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0, 0.5):pos(lblNeedCount.getPositionX(lblNeedCount) + lblNeedCount.getw(lblNeedCount) + 75, 90):add2(self.rightNode)

		if g_data.player.gold < nextGodRing.NeedGold then
			needGoldLabel.setColor(needGoldLabel, cc.c3b(255, 0, 0))
		end
	end

	local progress = an.newProgress(res.gettex2("pic/common/slider2.png"), res.gettex2("pic/common/sliderBg2.png"), {
		x = 3,
		y = 5
	}):anchor(0.5, 0.5):pos(310, 125):add2(self.rightNode)
	local progressLabel = an.newLabel("0/0", 18, 1, {
		color = cc.c3b(220, 210, 190)
	}):anchor(0.5, 0.5):addTo(progress, 2):pos(progress.getw(progress)/2, progress.geth(progress)/2 + 2)

	if not nextGodRing then
		progress.setp(progress, 1)
	else
		self.haveStuff = self.haveStuff or 0
		local p = self.haveStuff/needItemNum

		if 1 < p then
			p = 1
		end

		if p < 0 then
			p = 0
		end

		progress.setp(progress, p)
		progressLabel.setText(progressLabel, self.haveStuff .. "/" .. needItemNum)
	end

	local btnName = ""

	if type == "����" and info.FLevel == 0 then
		btnName = "��  ��"
	elseif type == "����" and 0 < info.FLevel then
		btnName = "��  ��"
	elseif type == "����" then
		btnName = "��  ��"
	end

	local btnUpgrade = an.newBtn(res.gettex2("pic/common/btn20.png"), function (btn)
		sound.playSound("103")

		if type == "����" then
			local rsb = DefaultClientMessage(CM_UpDateGodRingLv)
			rsb.FID = info.FID

			MirTcpClient:getInstance():postRsb(rsb)
		else
			local rsb = DefaultClientMessage(CM_UpDateGodRingStep)
			rsb.FID = info.FID

			MirTcpClient:getInstance():postRsb(rsb)
		end

		return 
	end, {
		pressImage = res.gettex2("pic/common/btn21.png"),
		label = {
			btnName,
			16,
			0,
			{
				color = def.colors.Cf0c896
			}
		}
	}).add2(slot23, self.rightNode):anchor(0.5, 0.5):pos(310, 45)

	return 
end
godRingUpgrade.onM_GODRING_DATA_CHG = function (self)
	if self.selType == "����" then
		self.clearContentNode(self)
		self.upGodRingLvPage(self)
	elseif self.selType == "����" then
		self.clearContentNode(self)
		self.UpGodRingStepPage(self)
	end

	return 
end
godRingUpgrade.onSM_UpdateGodRingLv = function (self, result)
	if result and result.FOK then
		g_data.player.godRingList = def.godring.setGodRingData(g_data.player.godRingList, result.FGodRingList)

		if self.expAnim then
			self.expAnim:setVisible(true)
			self.expAnim:getAnimation():play("Animation1", -1, 0)
		end

		self.animHandle = scheduler.performWithDelayGlobal(function ()
			self.animHandle = nil

			if self.expAnim then
				self.expAnim:setVisible(false)
			end

			g_data.eventDispatcher:dispatch("M_GODRING_DATA_CHG")

			return 
		end, 0.7)
	end

	return 
end
godRingUpgrade.onSM_UpdateGodRingStep = function (self, result)
	if result and result.FOK then
		g_data.player.godRingList = def.godring.setGodRingData(g_data.player.godRingList, result.FGodRingList)

		if self.expAnim then
			self.expAnim:setVisible(true)
			self.expAnim:getAnimation():play("Animation1", -1, 0)
		end

		self.animHandle = scheduler.performWithDelayGlobal(function ()
			self.animHandle = nil

			if self.expAnim then
				self.expAnim:setVisible(false)
			end

			g_data.eventDispatcher:dispatch("M_GODRING_DATA_CHG")

			return 
		end, 0.7)
	end

	return 
end

return godRingUpgrade
