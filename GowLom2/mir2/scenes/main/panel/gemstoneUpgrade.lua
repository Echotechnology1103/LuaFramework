local pointTip = import("..common.pointTip")
local gemstoneUpgrade = class("gemstoneUpgrade", function ()
	return display.newNode()
end)
local item = import("..common.item")
ccui.TouchEventType = {
	moved = 1,
	began = 0,
	canceled = 3,
	ended = 2
}

table.merge(slot1, {
	showDiamondMaxLevel = 0
})

gemstoneUpgrade.bindMsg = function (self)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_UPDATEDIAMOND, self, self.onSM_UPDATEDIAMOND)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_QUERYDIAMONDLIST, self, self.onSM_QUERYDIAMONDLIST)

	return 
end
gemstoneUpgrade.ctor = function (self, targetName)
	print("targetName = ", targetName)

	self.curItemId = targetName

	self.setNodeEventEnabled(self, true)

	self._scale = self.getScale(self)
	self._supportMove = true
	self.rootPanel = ccs.GUIReader:getInstance():widgetFromBinaryFile("ui/gemstoneDetail/gemstoneDetail_1.csb")

	self.rootPanel:pos(0, 0)

	local bg = self.rootPanel

	self.size(self, bg.getw(bg), bg.geth(bg)):anchor(0.5, 0.5):pos(display.cx - 102, display.cy)
	self.rootPanel:add2(self)

	local function clickClose(sender, eventType)
		if eventType ~= ccui.TouchEventType.ended then
			return 
		end

		sound.playSound("103")

		if self.animHandle then
			scheduler.unscheduleGlobal(self.animHandle)
		end

		self:hidePanel()

		return 
	end

	local btnClose = ccui.Helper.seekWidgetByName(slot4, self.rootPanel, "Button_close")

	btnClose.addTouchEventListener(btnClose, clickClose)

	local function clickPreview(sender, eventType)
		if eventType ~= ccui.TouchEventType.ended then
			return 
		end

		main_scene.ui:togglePanel("gemstonePreview", self.curItemId)

		return 
	end

	local btnPreview = ccui.Helper.seekWidgetByName(slot6, self.rootPanel, "Button_preview")

	btnPreview.addTouchEventListener(btnPreview, clickPreview)

	local function clickHelp(sender, eventType)
		if eventType ~= ccui.TouchEventType.ended then
			return 
		end

		local msgbox = an.newMsgbox("1����������������Ӧ�׶Σ�������ȼ��ﵽҪ��󼴿ɼ�����Ӧ��ʯ��\n" .. "2����Ѫ��ǿ�����������ػ���ʯ���ﵽ����ʮ�Ǻ󣬲ſɼ�����Ա�ʯ��\n" .. "3��Ѫ��ʯ�����ӽ�ɫѪ�������������ԡ�\n" .. "4��ǿ����ʯ������ǿ�����ʼ�����ǿ���˺������������ԡ�\n" .. "5��������ʯ�����ӱ������ʼ���������˺���������ɫѪ����\n" .. "6���ظ���ʯ�����Ӻ�ҩʱ�Ļظ��ٶȼ�ҩƷ�����ظ�����������ɫѪ����\n" .. "7���ػ���ʯ�������ػ����ʺ��ػ����������������ɫѪ����\n" .. "8����Ա�ʯÿ��ʮ�ǿɴ�����ӽ�ɫ������ԣ���ߴ�����Լ��ʺ����Ч��ʱ�䣩��������ɫ�������ԡ�\n" .. "һ��ʮ�����ʱ��1.5�룬��ս/Զ����Լ���3%/2%��\n" .. "����ʮ�����ʱ��2�룬��ս/Զ����Լ���5.8%/3.5%��\n" .. "����ʮ�����ʱ��2.6�룬��ս/Զ����Լ���9%/5.5%��\n" .. "�Ľ�ʮ�����ʱ��4�룬��ս/Զ����Լ���15.8%/9.5%��\n" .. "���ʮ�����ʱ��5�룬��ս/Զ����Լ���20%/12%��\n" .. "����ʮ�����ʱ��6�룬��ս/Զ����Լ���23.8%/14.3%��\n" .. "�߽�ʮ�����ʱ��7�룬��ս/Զ����Լ���27.2%/16.4%��\n" .. "9�����Ķ�Ӧ�ı�ʯ��Ƭ��������Ӧ��ʯ�Ǽ�����Ƭ��ֱ�Ӵӱ����п۳���\n" .. "10�����Ķ��ױ�ʯ��Ƭ��������Ѫ��ǿ�����������ػ���ʯ�Ǽ�����Ƭ��ֱ�Ӵӱ����۳���", nil, {
			center = false
		})

		return 
	end

	local btnHelp = ccui.Helper.seekWidgetByName(slot8, self.rootPanel, "Button_help")

	btnHelp.addTouchEventListener(btnHelp, clickHelp)

	self.detailBg = ccui.Helper:seekWidgetByName(self.rootPanel, "Image_detailBg")

	an.newLabel("��ʯԤ��", 20, nil, {
		color = cc.c3b(240, 200, 150)
	}):addTo(self.detailBg):pos(185, 168):anchor(0, 0.5):addUnderline():enableClick(function ()
		main_scene.ui:togglePanel("gemstonePreview", self.curItemId)

		return 
	end)
	ccs.ArmatureDataManager.getInstance(slot9):addArmatureFileInfo("animation/GemUpgrade/Upgrade.csb")

	self.expAnim = ccs.Armature:create("Upgrade")

	self.expAnim:anchor(0.5, 0.5)
	self.expAnim:setPosition(134, 265)
	self.expAnim:setVisible(false)
	self.detailBg:addChild(self.expAnim, 99999)

	self.tGemstoneTxtBtn = {}
	local gemstoneBg = ccui.Helper:seekWidgetByName(self.rootPanel, "Image_gemstoneBg")
	local infoView = an.newScroll(3, 4, 127, 380):add2(gemstoneBg)

	local function clickItm(sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			self.curItemId = sender.id

			self:refreshUI()
		end

		return 
	end

	local tShowItem = self.getShowGemstoneItme(slot0)
	local num = #tShowItem
	local h = 54

	for i = 1, num, 1 do
		local item = ccs.GUIReader:getInstance():widgetFromBinaryFile("ui/gemstoneTxtItem/gemstoneTxtItem_1.csb")

		item.pos(item, 5, (infoView.getScrollSize(infoView).height + 3) - i*h):add2(infoView)

		local btn = ccui.Helper:seekWidgetByName(item, "Button_2")

		btn.setSwallowTouches(btn, false)
		btn.addTouchEventListener(btn, clickItm)

		btn.id = tShowItem[i].FID

		table.insert(self.tGemstoneTxtBtn, btn)
	end

	infoView.setScrollSize(infoView, 127, math.max(380, num*h))
	self.refreshUI(self)
	self.bindMsg(self)
	g_data.eventDispatcher:addListener("M_POINTTIP", self, self.onPointTip)
	self.onPointTip(self, "gemstone_active", nil)

	return 
end
gemstoneUpgrade.refreshUI = function (self)
	local tShowItem = self.getShowGemstoneItme(self)

	if tShowItem == nil then
		return 
	end

	if self.gemstoneIcon then
		self.gemstoneIcon:removeSelf()

		self.gemstoneIcon = nil
	end

	local curConfigItemData, selectItmeData = nil
	self.gemstoneIcon = display.newSprite(res.gettex2("pic/panels/gemstones/2_1.png"), nil, nil, {
		class = cc.FilteredSpriteWithOne
	})

	self.gemstoneIcon:setPosition(138, 277)
	self.gemstoneIcon:add2(self.detailBg)

	for i, t in ipairs(self.tGemstoneTxtBtn) do
		print("cxxxxx", t.id, "curItemId", self.curItemId)

		if t.id == self.curItemId then
			t.setBright(t, false)
			t.setEnabled(t, false)
		else
			t.setBright(t, true)
			t.setEnabled(t, true)
		end

		local configGemstoneData = nil

		for k, v in pairs(def.gemstone.tConfigData) do
			if v.ID == tShowItem[i].FID and v.DiamondLevel == tShowItem[i].FLevel then
				configGemstoneData = v

				break
			end
		end

		for k, v in pairs(def.gemstone.tConfigData) do
			if v.ID == self.curItemId and v.NeedStuffIdx == 0 and v.DiamondLevel ~= 0 then
				self.showDiamondMaxLevel = v.DiamondLevel

				break
			end
		end

		local str = nil

		if tShowItem[i].FLevel == 0 then
			str = self.numToGBK(self, 1)
		elseif tShowItem[i].FLevel%10 == 0 then
			str = self.numToGBK(self, math.floor(tShowItem[i].FLevel/10))
		else
			str = self.numToGBK(self, math.floor(tShowItem[i].FLevel/10) + 1)
		end

		t.setTitleText(t, str .. "��" .. configGemstoneData.DiamondType)

		if tShowItem[i].FID == self.curItemId then
			curConfigItemData = configGemstoneData
			selectItmeData = tShowItem[i]
		end
	end

	if curConfigItemData and selectItmeData then
		local infoBg = ccui.Helper:seekWidgetByName(self.rootPanel, "Image_infoBg")
		local title = ccui.Helper:seekWidgetByName(self.rootPanel, "Label_title")
		local name = ccui.Helper:seekWidgetByName(infoBg, "Label_name")
		local starBgNode = ccui.Helper:seekWidgetByName(infoBg, "Panel_starBg")
		local progressBar = ccui.Helper:seekWidgetByName(infoBg, "ProgressBar_45")
		local stuffNum = ccui.Helper:seekWidgetByName(infoBg, "Label_46")
		local consumeItemTxt = ccui.Helper:seekWidgetByName(infoBg, "Label_47")
		local consumeItemNumTxt1 = ccui.Helper:seekWidgetByName(infoBg, "Label_48")
		local consumeItemNumTxt2 = ccui.Helper:seekWidgetByName(infoBg, "Label_49")
		local upgradeBtn = ccui.Helper:seekWidgetByName(infoBg, "Button_48")
		self.upgradeBtn = upgradeBtn

		title.setString(title, "��ʯ")
		print("curConfigItemData.ID, curConfigItemData.DiamondLevel", curConfigItemData.ID, curConfigItemData.DiamondLevel)

		local iconName = self.getIconName(self, curConfigItemData.ID, curConfigItemData.DiamondLevel)
		local frameName = res.getframe2(iconName)

		print("iconNameiconName", iconName)

		if frameName then
			self.gemstoneIcon:setSpriteFrame(frameName)
		end

		local starNum = nil

		if curConfigItemData.DiamondLevel == 0 then
			starNum = 0

			self.gemstoneIcon:setFilter(res.getFilter("gray"))
		elseif curConfigItemData.DiamondLevel%10 ~= 0 then
			starNum = curConfigItemData.DiamondLevel%10
		else
			starNum = 10
		end

		for i = 1, 10, 1 do
			local star = ccui.Helper:seekWidgetByName(starBgNode, "Image_star" .. i)

			if i <= starNum then
				star.setVisible(star, true)
			else
				star.setVisible(star, false)
			end
		end

		local haveStuff = selectItmeData.FHaveStuff
		local percent = 0

		if 0 < curConfigItemData.NeedStuffNum then
			percent = math.floor(haveStuff/curConfigItemData.NeedStuffNum*100)
		else
			percent = 100
		end

		progressBar.setPercent(progressBar, percent)
		stuffNum.setString(stuffNum, haveStuff .. "/" .. curConfigItemData.NeedStuffNum)

		if self.material1 then
			self.material1:removeSelf()

			self.material1 = nil
		end

		if self.material2 then
			self.material2:removeSelf()

			self.material2 = nil
		end

		if selectItmeData.FLevel == 0 then
			upgradeBtn.setTitleText(upgradeBtn, "�� ��")
			self.setPointTip(self, upgradeBtn)
			consumeItemTxt.setVisible(consumeItemTxt, false)
			consumeItemNumTxt1.setVisible(consumeItemNumTxt1, false)
			consumeItemNumTxt2.setVisible(consumeItemNumTxt2, false)
		else
			upgradeBtn.setTitleText(upgradeBtn, "�� ��")
			self.setPointTip(self, upgradeBtn)
			consumeItemTxt.setVisible(consumeItemTxt, true)
			consumeItemNumTxt1.setVisible(consumeItemNumTxt1, true)

			local baseItem = {
				FIndex = curConfigItemData.NeedStuffIdx,
				FItemValueList = {},
				FItemIdent = 1
			}

			setmetatable(baseItem, {
				__index = gItemOp
			})
			baseItem.decodedCallback(baseItem)

			baseItem.isPileUp = false

			if curConfigItemData.DiamondLevel < self.showDiamondMaxLevel then
				self.material1 = item.new(baseItem, self, {
					donotMove = true
				}):addto(self.detailBg):pos(145, 72)
			end

			consumeItemNumTxt1.setPositionY(consumeItemNumTxt1, 70)
			consumeItemTxt.setPositionY(consumeItemTxt, 70)
			consumeItemNumTxt2.setPositionY(consumeItemNumTxt2, 70)
			consumeItemNumTxt2.setPositionX(consumeItemNumTxt2, 227)

			if curConfigItemData.DiamondLevel == self.showDiamondMaxLevel then
				consumeItemTxt.setVisible(consumeItemTxt, false)
				consumeItemNumTxt1.setVisible(consumeItemNumTxt1, false)
				consumeItemNumTxt2.setVisible(consumeItemNumTxt2, false)
			elseif curConfigItemData.DiamondLevel <= 10 and curConfigItemData.DiamondType ~= "�ظ�" and curConfigItemData.DiamondType ~= "���" then
				consumeItemNumTxt2.setVisible(consumeItemNumTxt2, false)
				consumeItemTxt.setPositionX(consumeItemTxt, 100)
				consumeItemNumTxt1.setPositionX(consumeItemNumTxt1, 180)
				consumeItemNumTxt1.setString(consumeItemNumTxt1, "*" .. curConfigItemData.NeedStuffNum)
			elseif 10 < curConfigItemData.DiamondLevel and curConfigItemData.DiamondType ~= "�ظ�" and curConfigItemData.DiamondType ~= "���" and curConfigItemData.DiamondLevel < self.showDiamondMaxLevel then
				consumeItemNumTxt2.setVisible(consumeItemNumTxt2, true)
				consumeItemTxt.setPositionX(consumeItemTxt, 40)
				consumeItemNumTxt1.setPositionX(consumeItemNumTxt1, 125)
				self.material1:setPositionX(80)
				consumeItemNumTxt1.setString(consumeItemNumTxt1, "*" .. curConfigItemData.NeedStuffNum .. "��")
				consumeItemNumTxt2.setString(consumeItemNumTxt2, "*" .. curConfigItemData.NeedStuffNum)

				local baseItem = {
					FIndex = curConfigItemData.NeedStuffIdx1,
					FItemValueList = {},
					FItemIdent = 1
				}

				setmetatable(baseItem, {
					__index = gItemOp
				})
				baseItem.decodedCallback(baseItem)

				baseItem.isPileUp = false
				self.material2 = item.new(baseItem, self, {
					donotMove = true
				}):addto(self.detailBg):pos(182, 72)
			elseif curConfigItemData.DiamondType == "�ظ�" or curConfigItemData.DiamondType == "���" then
				consumeItemNumTxt2.setVisible(consumeItemNumTxt2, false)
				consumeItemTxt.setPositionX(consumeItemTxt, 100)
				consumeItemNumTxt1.setPositionX(consumeItemNumTxt1, 180)
				consumeItemNumTxt1.setString(consumeItemNumTxt1, "*" .. curConfigItemData.NeedStuffNum)
			end
		end

		local function clickUpgrade(sender, eventType)
			if eventType ~= ccui.TouchEventType.ended then
				return 
			end

			local numMaterial1 = 0
			local numCrystal = 0
			local numToLevelUp = curConfigItemData.NeedStuffNum - selectItmeData.FHaveStuff
			local k, dataMaterial1 = g_data.bag:getItemByIndex(curConfigItemData.NeedStuffIdx)
			numCrystal = g_data.bag:getItemTotalNumByIndex(curConfigItemData.NeedStuffIdx1)

			if dataMaterial1 then
				numMaterial1 = dataMaterial1.FDura
			end

			local numActuralCostCrystal = 0

			if numCrystal < numToLevelUp then
				numActuralCostCrystal = numCrystal
			else
				numActuralCostCrystal = numToLevelUp
			end

			if numMaterial1 == 0 and 0 < numCrystal and 10 < curConfigItemData.DiamondLevel then
				local text = {
					{
						"��ǰ��Ƭ���㣬�Ƿ�����\n",
						cc.c3b(255, 255, 255)
					},
					{
						tostring(numActuralCostCrystal),
						cc.c3b(255, 0, 0)
					},
					{
						"�Ŷ��ױ�ʯ�ᾧ������ʯ?",
						cc.c3b(255, 255, 255)
					}
				}
				slot9 = an.newMsgbox(text, function (idx)
					if idx == 1 then
						local rsb = DefaultClientMessage(CM_UPDATEDIAMOND)
						rsb.FID = self.curItemId
						rsb.FMaterialType = 1

						MirTcpClient:getInstance():postRsb(rsb)
						sender:setEnabled(false)
						sender:run(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
							if sender then
								sender:setEnabled(true)
							end

							return 
						end)))
					end

					return 
				end, {
					disableScroll = true,
					center = true,
					hasCancel = true
				})
			else
				print("eventType = ", selectItmeData)

				local rsb = DefaultClientMessage(CM_UPDATEDIAMOND)
				rsb.FID = self.curItemId
				rsb.FMaterialType = 0

				print("rsb.FID", rsb.FID)
				MirTcpClient:getInstance():postRsb(rsb)
				sender.setEnabled(sender, false)
				sender.run(sender, cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
					if sender then
						sender:setEnabled(true)
					end

					return 
				end)))
			end

			return 
		end

		upgradeBtn.addTouchEventListener(slot13, clickUpgrade)

		local str = nil

		if curConfigItemData.DiamondLevel == 0 then
			str = self.numToGBK(self, 1)
		elseif curConfigItemData.DiamondLevel%10 == 0 then
			str = self.numToGBK(self, math.floor(curConfigItemData.DiamondLevel/10))
		else
			str = self.numToGBK(self, math.floor(curConfigItemData.DiamondLevel/10) + 1)
		end

		name.setString(name, str .. "�ס�" .. curConfigItemData.DiamondType .. "��ʯ")

		local function doPropertyUI(propertyType, configData)
			local careerProp = {
				[0] = {
					"��������",
					"��������",
					"սʿ����ֵ",
					"սʿǿ������",
					"սʿǿ���˺�",
					"սʿ��������",
					"սʿ����ϵ��",
					"սʿ��Ѫ����",
					"սʿ��ħ����",
					"սʿ��Ѫ�ٶ�",
					"սʿ�ػ�����",
					"սʿ�ػ�����"
				},
				{
					"ħ������",
					"ħ������",
					"��ʦ����ֵ",
					"��ʦǿ������",
					"��ʦǿ���˺�",
					"��ʦ��������",
					"��ʦ����ϵ��",
					"��ʦ��Ѫ����",
					"��ʦ��ħ����",
					"��ʦ��Ѫ�ٶ�",
					"��ʦ�ػ�����",
					"��ʦ�ػ�����"
				},
				{
					"��������",
					"��������",
					"��ʿ����ֵ",
					"��ʿǿ������",
					"��ʿǿ���˺�",
					"��ʿ��������",
					"��ʿ����ϵ��",
					"��ʿ��Ѫ����",
					"��ʿ��ħ����",
					"��ʿ��Ѫ�ٶ�",
					"��ʿ�ػ�����",
					"��ʿ�ػ�����"
				}
			}
			local career = {
				[0] = "����",
				"ħ��",
				"����"
			}
			local job = g_data.player.job
			local currencePropertyBg = ccui.Helper:seekWidgetByName(self.rootPanel, "Image_bottom" .. propertyType)

			currencePropertyBg.removeAllChildren(currencePropertyBg)

			local headData = {}
			local propData = {}
			local prop2Data = {}

			if configData then
				headData[#headData + 1] = {
					"��Ҫ�ȼ�: ",
					common.getLevelText(configData.NeedLevel) .. "��"
				}
			end

			if configData and configData.NeedServerStep and 0 < configData.NeedServerStep then
				headData[#headData + 1] = {
					"��Ҫ�������׶�:",
					configData.NeedServerStep .. "�׶�"
				}
			end

			if configData and configData.DiamondProperty then
				local items = string.split(configData.DiamondProperty, ";")

				for k, v in pairs(items) do
					if v and v ~= "" then
						local single = string.split(v, "=")
						local exist = false

						for m, n in pairs(careerProp) do
							for s, t in pairs(n) do
								if t == single[1] then
									exist = true

									break
								end
							end
						end

						if exist then
							for q, w in pairs(careerProp[job]) do
								if single[1] == w then
									table.insert(prop2Data, v)
								end
							end
						elseif single[2] and tonumber(single[2]) and 0 < tonumber(single[2]) then
							table.insert(propData, v)
						end
					end
				end
			end

			local up = 0
			local down = 0

			for k, v in pairs(prop2Data) do
				local split = string.split(v, "=")

				if split[1] == career[job] .. "����" then
					down = split[2]
				elseif split[1] == career[job] .. "����" then
					up = split[2]
				elseif split[2] and tonumber(split[2]) and 0 < tonumber(split[2]) then
					table.insert(propData, v)
				end
			end

			if (tonumber(up) and 0 < tonumber(up)) or (tonumber(down) and 0 < tonumber(down)) then
				table.insert(propData, string.format("%s=%d-%d", career[job], up, down))
			end

			if propertyType == 2 and not configData then
				local s = "������"

				an.newLabel(s, 20, 1, {
					color = def.colors.labelTitle
				}):anchor(0.5, 0.5):pos(currencePropertyBg.getw(currencePropertyBg)/2, currencePropertyBg.geth(currencePropertyBg)/2):addTo(currencePropertyBg)
			else
				local scroll = an.newScroll(0, 0, 206, 155):anchor(0, 0):add2(currencePropertyBg)
				local label = an.newLabelM(206, 19, 1):anchor(0, 1):pos(8, 152):add2(scroll)

				for i, v in ipairs(headData) do
					label.nextLine(label)
					label.addLabel(label, v[1], def.colors.labelTitle)
					label.addLabel(label, v[2], def.colors.text)
				end

				for i, v in ipairs(propData) do
					local single = string.split(v, "=")

					if single and type(single) == "table" then
						local txt = single[1]

						if single[1] == "սʿ����ֵ" or single[1] == "��ʿ����ֵ" or single[1] == "��ʦ����ֵ" then
							txt = "����ֵ"
						elseif single[1] == "սʿǿ������" or single[1] == "��ʿǿ������" or single[1] == "��ʦǿ������" then
							txt = "ǿ������"
						elseif single[1] == "սʿǿ���˺�" or single[1] == "��ʿǿ���˺�" or single[1] == "��ʦǿ���˺�" then
							txt = "ǿ���˺�"
						elseif single[1] == "սʿ��������" or single[1] == "��ʿ��������" or single[1] == "��ʦ��������" then
							txt = "��������"
						elseif single[1] == "սʿ����ϵ��" or single[1] == "��ʿ����ϵ��" or single[1] == "��ʦ����ϵ��" then
							txt = "����ϵ��"
						elseif single[1] == "սʿ��Ѫ����" or single[1] == "��ʿ��Ѫ����" or single[1] == "��ʦ��Ѫ����" then
							txt = "��Ѫ����"
						elseif single[1] == "սʿ��ħ����" or single[1] == "��ʿ��ħ����" or single[1] == "��ʦ��ħ����" then
							txt = "��ħ����"
						elseif single[1] == "սʿ��Ѫ�ٶ�" or single[1] == "��ʿ��Ѫ�ٶ�" or single[1] == "��ʦ��Ѫ�ٶ�" then
							txt = "��Ѫ�ٶ�"
						elseif single[1] == "սʿ�ػ�����" or single[1] == "��ʿ�ػ�����" or single[1] == "��ʦ�ػ�����" then
							txt = "�ػ�����"
						elseif single[1] == "սʿ�ػ�����" or single[1] == "��ʿ�ػ�����" or single[1] == "��ʦ�ػ�����" then
							txt = "�ػ�����"
						end

						local value = single[2]

						if tonumber(value) then
							value = "+" .. value
						end

						label.nextLine(label)
						label.addLabel(label, stringPadding(txt, 5, "  "), def.colors.labelTitle)
						label.addLabel(label, value, def.colors.text)
					end
				end
			end

			return 
		end

		slot21(1, curConfigItemData)

		local nextLvlData = nil

		for k, v in pairs(def.gemstone.tConfigData) do
			if v.ID == selectItmeData.FID and v.DiamondLevel == selectItmeData.FLevel + 1 then
				nextLvlData = v

				break
			end
		end

		doPropertyUI(2, nextLvlData)
	end

	return 
end
gemstoneUpgrade.onSM_UPDATEDIAMOND = function (self, result)
	if result.FOK then
		self.expAnim:setVisible(true)
		self.expAnim:getAnimation():play("Animation1", -1, 0)

		self.animHandle = scheduler.performWithDelayGlobal(function ()
			self.animHandle = nil

			if self.expAnim then
				self.expAnim:setVisible(false)
			end

			return 
		end, 0.7)
		local rsb = DefaultClientMessage(CM_QUERYDIAMONDLIST)

		MirTcpClient.getInstance(slot3):postRsb(rsb)

		main_scene.ui.requestFromDrumUpgrade = false
		g_data.heroEquip.gemstoneRequestFromEquip = false
	end

	return 
end
gemstoneUpgrade.onSM_QUERYDIAMONDLIST = function (self, result)
	if main_scene.ui.requestFromDrumUpgrade == true then
		return 
	end

	g_data.player:setGemstonesInfo(result)
	self.refreshUI(self)

	return 
end
gemstoneUpgrade.getShowGemstoneItme = function (self)
	local tShowGemstone = {}
	local ability = g_data.player.ability

	for idx, cfg in ipairs(def.gemstone.tOpenItem) do
		local stoneInfo = g_data.player.gemstonesInfo[cfg.ID]
		local item = {}

		if stoneInfo.exist then
			item.FID = stoneInfo.ID
			item.FLevel = stoneInfo.FLevel
			item.FHaveStuff = stoneInfo.FHaveStuff
		else
			item.FID = stoneInfo.ID
			item.FLevel = 0
			item.FHaveStuff = 0
		end

		if item.FID ~= 6 then
			table.insert(tShowGemstone, item)
		end
	end

	return tShowGemstone
end
gemstoneUpgrade.getIconName = function (self, id, lvl)
	local icons = {
		10,
		20,
		30,
		40,
		50,
		60,
		70,
		80,
		90,
		100
	}

	for i = 1, #icons, 1 do
		if lvl <= icons[i] then
			return string.format("pic/panels/gemstones/%d_%d.png", id, math.floor(icons[i]/10))
		end
	end

	return nil
end
gemstoneUpgrade.numToGBK = function (self, num)
	local TXT_NUM = {
		"һ",
		"��",
		"��",
		"��",
		"��",
		"��",
		"��",
		"��",
		"��",
		"ʮ"
	}

	if TXT_NUM[num] then
		return TXT_NUM[num]
	else
		return TXT_NUM[1]
	end

	return 
end
gemstoneUpgrade.onPointTip = function (self, type, visible)
	if type ~= "gemstone_active" and type ~= "gemstone_upgrade" then
		return 
	end

	self.setPointTip(self, self.upgradeBtn)

	return 
end
gemstoneUpgrade.setPointTip = function (self, btn)
	if self.tip then
		self.tip:removeFromParent()

		self.tip = nil
	end

	local stoneInfo = g_data.player.gemstonesInfo[self.curItemId]
	local upgrade = table.indexof(g_data.player.gemstonesUpgradeInfo, self.curItemId)

	if stoneInfo.canActive or upgrade then
		self.tip = pointTip.attach(btn, {
			dir = "right",
			type = 1,
			visible = true
		})
	end

	return 
end

return gemstoneUpgrade
