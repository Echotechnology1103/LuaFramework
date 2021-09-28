local equipSuiteAct = class("equipSuiteAct", import(".panelBase"))
local CommonItem = import("..common.item")
local CommonItemInfo = import("..common.itemInfo")
equipSuiteAct.ctor = function (self, params)
	self.super.ctor(self)
	self.setMoveable(self, true)

	self.params = params or {}

	return 
end
equipSuiteAct.onEnter = function (self)
	self.initPanelUI(self, {
		title = "��װ����",
		bg = "pic/common/black_2.png"
	})
	self.pos(self, display.cx - 102, display.cy)
	self.clearContentNode(self)
	self.loadEquipSuitePage(self)
	self.bindNetEvent(self, SM_ActEquipSuite, self.onSM_ActEquipSuite)

	return 
end
equipSuiteAct.onCloseWindow = function (self)
	return self.super.onCloseWindow(self)
end
equipSuiteAct.clearContentNode = function (self)
	if self.contentNode then
		self.contentNode:removeSelf()
	end

	self.contentNode = display.newNode():addTo(self.bg)
	self.contentNode.controls = {}
	self.contentNode.data = {}

	return 
end
equipSuiteAct.loadEquipSuitePage = function (self)
	display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(12, 13):size(129, 393):addTo(self.contentNode)
	display.newSprite(res.gettex2("pic/panels/equipSuiteAct/equipSuite_bg.png")):anchor(0, 0):pos(142.5, 13):add2(self.contentNode)
	display.newScale9Sprite(res.getframe2("pic/common/black_4.png")):anchor(0, 0):pos(418, 13):size(212, 393):addTo(self.contentNode)

	local scrollRect = cc.rect(0, 0, 160, 387)
	self.contentNode.controls.EquipSuiteLeftScroll = self.newListView(self, 12, 16, scrollRect.width, scrollRect.height, 4, {}):add2(self.contentNode)

	display.newSprite(res.gettex2("pic/panels/wingUpgrade/flag.png")):anchor(0, 0.5):pos(425, 385):add2(self.contentNode)
	display.newSprite(res.gettex2("pic/panels/equipSuiteAct/dqsxsx.png")):anchor(0, 0.5):pos(442, 385):add2(self.contentNode)
	display.newScale9Sprite(res.getframe2("pic/scale/scale29.png")):anchor(0, 1):pos(421, 373):size(182, 355):addTo(self.contentNode)

	local rightSroll = an.newScroll(421, 373, 182, 350, {
		labelM = {
			20,
			0
		}
	}):addTo(self.contentNode):anchor(0, 1)

	rightSroll.setScrollSize(rightSroll, 182, 351)

	local rollbg = display.newScale9Sprite(res.getframe2("pic/scale/scale9.png"), 605, 19, cc.size(20, 353)):addTo(self.contentNode):anchor(0, 0)
	local rightSrollCeil = res.get2("pic/common/scrollShow.png"):anchor(0.5, 0):pos(rollbg.getw(rollbg)*0.5, rollbg.geth(rollbg) - 42):add2(rollbg)

	rightSroll.setListenner(rightSroll, function (event)
		if event.name == "moved" then
			local x, y = rightSroll:getScrollOffset()
			local maxOffset = rightSroll:getScrollSize().height - rightSroll:geth()

			if y < 0 then
				y = 0
			end

			if maxOffset < y then
				y = maxOffset or y
			end

			local s = (rollbg:geth() - 42)*(y/maxOffset - 1)

			rightSrollCeil:setPositionY(s)
		end

		return 
	end)

	self.contentNode.controls.rightSroll = rightSroll
	self.contentNode.controls.rightSrollCeil = rightSrollCeil
	local texts = {
		{
			"1������������������װ��������װ���ԡ�\n"
		},
		{
			"2����װ������Ҫ�������������װ���Լ����ͽ�ҡ�\n"
		},
		{
			"3��ֻ�д��������������װ�����ܼ�����װ���ԡ�\n"
		},
		{
			"4����װ���ԣ����������������Ϊ3��6��9������������Ρ�\n"
		},
		{
			"5������ʱ����������3��6��9�����ԵĲ�μ��\n"
		},
		{
			"6���߼����װ����������ͼ����װ�������Լ������ԡ����������߼�װ�������������װ����\n"
		},
		{
			"7����������ԣ��ڴ��������������������װ�󣬲�����Ч��\n"
		},
		{
			"8����װ���Կ��ۼӣ����ɻ�á�3�����ԡ�+��6�����ԡ�+��9�����ԡ���\n"
		},
		{
			"9��ͬ������ԣ�ֻ����Ч�ϸ߼���һ��������������3�����ԣ�����������3������ͬʱ��Ч����\n"
		},
		{
			"10����װ9��������Ч�󣬴������ԣ�����ʾΪ�������ʾ�������������Ƿ���ʾ��\n"
		}
	}

	an.newBtn(res.gettex2("pic/common/question.png"), function ()
		sound.playSound("103")
		an.newMsgbox(texts, nil, {
			contentLabelSize = 20,
			title = "��ʾ"
		})

		return 
	end, {
		pressBig = true,
		pressImage = res.gettex2("pic/common/question.png")
	}).pos(slot6, 165, 385):addto(self.contentNode)
	self.upLeftList(self)
	self.upRightPropScroll(self, g_data.player.equipSuiteActList)

	return 
end
equipSuiteAct.upLeftList = function (self)
	local suiteScroll = self.contentNode.controls.EquipSuiteLeftScroll
	suiteScroll.itemMargin = 7
	local types = def.equipSuite.getSuiteTypes()
	self.items = {}

	local function onItemSelect(btn)
		for k, v in ipairs(self.items) do
			v.unselect(v)
			v.setTouchEnabled(v, true)
		end

		btn.select(btn)
		btn.setTouchEnabled(btn, false)

		self.contentNode.data.selType = btn.type
		self.contentNode.data.selLevel = nil

		self:updateEquipSuiteInfo()

		return 
	end

	for k, v in ipairs(slot2) do
		local item = an.newBtn(res.gettex2("pic/common/btn60.png"), function (btn)
			sound.playSound("103")
			onItemSelect(btn)

			return 
		end, {
			support = "scroll",
			select = {
				res.gettex2("pic/common/btn61.png")
			},
			label = {
				v,
				20,
				0,
				{
					color = def.colors.Cf0c896
				}
			}
		})
		item.type = v
		self.items[#self.items + 1] = item

		self.listViewPushBack(slot0, suiteScroll, item, {
			left = 10
		})
	end

	if self.contentNode.data.selType then
		for k, v in ipairs(self.items) do
			if v.type == self.contentNode.data.selType then
				onItemSelect(v)
			end
		end
	elseif self.items[1] then
		onItemSelect(self.items[1])
	end

	return 
end
equipSuiteAct.updateEquipSuiteInfo = function (self)
	local type = self.contentNode.data.selType
	local rightNode = self.contentNode.data.rightNode

	if rightNode then
		rightNode.removeSelf(rightNode)
	end

	rightNode = display.newNode():addTo(self.contentNode)
	self.contentNode.data.rightNode = rightNode
	local selLev = self.contentNode.data.selLevel or 1
	local suiteInfo = def.equipSuite.getSuiteByTypeAndLevel(type, selLev)

	if not suiteInfo then
		return 
	end

	self.contentNode.controls.EquipSuiteTitle = an.newLabel(suiteInfo.ESName, 20, 0, {
		color = def.colors.Cdcd2be
	}):anchor(0.5, 0.5):addto(rightNode):pos(280, 388)

	display.newSprite(res.gettex2("pic/panels/wingUpgrade/flag.png")):anchor(0.5, 0.5):pos(225, 350):add2(rightNode):setRotation(180)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/flag.png")):anchor(0.5, 0.5):pos(335, 350):add2(rightNode)
	an.newLabel("��Ч������", 18, 0, {
		color = def.colors.Cf0c896
	}):anchor(0.5, 0.5):addto(rightNode):pos(280, 350)

	local propH = 158
	local propScroll = an.newScroll(280, 327, 220, 130, {
		labelM = {
			20,
			0
		}
	}):addTo(rightNode):anchor(0.5, 1)
	local propTable = def.equipSuite.dumpPropertyStr(suiteInfo.PropertyStr, g_data.player.job)

	for k, v in ipairs(propTable) do
		local strs = string.split(v, ":")

		if #strs == 2 then
			local lblProp = an.newLabel(strs[1] .. ":", 18, 1, {
				color = cc.c3b(240, 200, 150)
			}):anchor(0, 1):pos(50, k*25 - 158):add2(propScroll)

			an.newLabel(strs[2], 18, 1, {
				color = cc.c3b(220, 210, 190)
			}):anchor(0, 1):pos(lblProp.getPositionX(lblProp) + lblProp.getw(lblProp), lblProp.getPositionY(lblProp)):add2(propScroll)

			propH = k*25 - 158
		end
	end

	if suiteInfo.SpecShapeName and suiteInfo.SpecShapeName ~= "" then
		local lblProp = an.newLabel("[��Ч]" .. suiteInfo.SpecShapeName, 18, 1, {
			color = cc.c3b(240, 200, 150)
		}):anchor(0, 1):pos(50, propH - 25):add2(propScroll)
		propH = propH - 25
		local speProps = def.equipSuite.dumpPropertyStr(suiteInfo.SpePropStr, g_data.player.job)

		for propk, propv in ipairs(speProps) do
			local strs = string.split(propv, ":")

			if #strs == 2 then
				local lblProp = an.newLabel(strs[1] .. ":", 18, 1, {
					color = cc.c3b(240, 200, 150)
				}):anchor(0, 1):pos(50, propH - propk*25):add2(propScroll)

				an.newLabel(strs[2], 18, 1, {
					color = cc.c3b(220, 210, 190)
				}):anchor(0, 1):pos(lblProp.getPositionX(lblProp) + lblProp.getw(lblProp), lblProp.getPositionY(lblProp)):add2(propScroll)
			end
		end
	end

	display.newSprite(res.gettex2("pic/panels/equipSuiteAct/lvBtnBg.png")):anchor(0.5, 0.5):pos(280, 168):add2(rightNode)

	self.lvBtns = {}
	local pos = {
		{
			x = 200,
			y = 168
		},
		{
			x = 280,
			y = 168
		},
		{
			x = 360,
			y = 168
		}
	}

	local function onLvBtnSelect(btn)
		for k, v in ipairs(self.lvBtns) do
			v.unselect(v)
			v.setTouchEnabled(v, true)
			v.removeChildByName(v, "Circle")
		end

		btn.select(btn)
		btn.setTouchEnabled(btn, false)

		local lightCircle = display.newSprite(res.gettex2("pic/panels/equipSuiteAct/light_circle.png")):anchor(0.5, 0.5):pos(btn.getw(btn)/2, btn.geth(btn)/2):add2(btn)

		lightCircle.setName(lightCircle, "Circle")

		if self.contentNode.data.selLevel ~= btn.level then
			self.contentNode.data.selLevel = btn.level

			self:updateEquipSuiteInfo()
		end

		return 
	end

	for i = 1, 3, 1 do
		local btn = an.newBtn(res.gettex2("pic/panels/equipSuiteAct/blackBtn" .. slot13 .. ".png"), function (btn)
			sound.playSound("103")
			onLvBtnSelect(btn)

			return 
		end, {
			select = {
				res.gettex2("pic/panels/equipSuiteAct/lightBtn" .. slot13 .. ".png")
			}
		}):anchor(0.5, 0.5):pos(pos[i].x, pos[i].y):add2(rightNode)
		btn.level = i
		self.lvBtns[#self.lvBtns + 1] = btn

		an.newLabel(i*3 .. "��Ч��", 18, 0, {
			color = def.colors.Cdcd2be
		}):anchor(0.5, 0.5):addto(rightNode):pos(pos[i].x, pos[i].y - 32)
	end

	for k, v in ipairs(self.lvBtns) do
		if v.level == selLev then
			onLvBtnSelect(v)
		end
	end

	local needstrs = string.split(suiteInfo.NeedStuff, ";")
	local needItemName = ""
	local needItemNum = 0

	if 0 < #needstrs then
		local needItemStrs = string.split(needstrs[1], "|")

		if #needItemStrs == 2 then
			needItemNum = tonumber(needItemStrs[2])
			needItemNames = string.split(needItemStrs[1], "&")

			if #needItemNames == 2 then
				needItemName = needItemNames[2]
			elseif #needItemNames == 1 then
				needItemName = needItemNames[1]
			end
		end
	end

	an.newLabel("���ģ�", 18, 0, {
		color = def.colors.Cf0c896
	}):anchor(0.5, 0.5):addto(rightNode):pos(185, 100)

	local itemIdx = def.items.getItemIdByName(needItemName)

	if not itemIdx then
		return 
	end

	local needItem = CommonItem.new(def.items.getStdItemById(itemIdx), self, {
		donotMove = true,
		idx = idx
	}):add2(rightNode, 2):anchor(0, 0.5):pos(225, 100):scale(0.7)

	if needItem.dura then
		needItem.dura:removeSelf()

		needItem.dura = nil
	end

	an.newLabel("*" .. needItemNum, 18, 0, {
		color = def.colors.Cf0c896
	}):anchor(0, 0.5):addto(rightNode):pos(240, 100)
	an.newLabel("��ң�" .. math.floor(suiteInfo.NeedGoldNum/10000) .. "��", 18, 0, {
		color = def.colors.Cf0c896
	}):anchor(0, 0.5):addTo(rightNode, 2):pos(302, 100)

	local bAct = false

	for k, v in ipairs(g_data.player.equipSuiteActList) do
		if suiteInfo.ESType == v.FESType and suiteInfo.ESLv == v.FESLv then
			bAct = true
		end
	end

	slot17 = res.gettex2("pic/common/btn20.png")
	local actBtn = an.newBtn(slot17, function (btn)
		sound.playSound("103")

		local rsb = DefaultClientMessage(CM_ActEquipSuite)
		rsb.FESType = suiteInfo.ESType
		rsb.FESLv = suiteInfo.ESLv

		MirTcpClient:getInstance():postRsb(rsb)
		main_scene.ui.waiting:show(10, "CM_ActEquipSuite")

		return 
	end, {
		pressImage = res.gettex2("pic/common/btn21.png"),
		label = {
			(bAct and "�� �� ��") or "��  ��",
			16,
			0,
			{
				color = def.colors.Cf0c896
			}
		}
	}).add2(slot16, rightNode):anchor(0.5, 0.5):pos(280, 55)

	return 
end
equipSuiteAct.upRightPropScroll = function (self, actList)
	local rightSroll = self.contentNode.controls.rightSroll

	rightSroll.removeAllChildren(rightSroll)

	local usedList = def.equipSuite.getUsedList(g_data.equip.items, actList)
	local suiteInfos = {}
	local suiteProps = {}
	local suiteColors = {
		def.colors.C3794fb,
		def.colors.Ccf15e1,
		def.colors.Cf1ed02
	}
	local h = 0

	for i, v in ipairs(usedList) do
		local suiteInfo = def.equipSuite.getSuiteByTypeAndLevel(v.FESType, v.FESLv)
		local props = def.equipSuite.dumpPropertyStr(suiteInfo.PropertyStr, g_data.player.job)
		suiteInfos[#suiteInfos + 1] = suiteInfo
		suiteProps[#suiteProps + 1] = props
		h = h + #props*25
	end

	rightSroll.setScrollSize(rightSroll, 182, math.max(351, h))

	self.contentNode.data.startPosY = math.max(351, h)
	self.contentNode.data.propIdx = 1

	for k, v in ipairs(suiteInfos) do
		self.addProp(self, rightSroll, v.ESName, "", suiteColors[k] or cc.c3b(220, 210, 190))

		slot13 = ipairs
		slot14 = suiteProps[k] or {}

		for propk, propv in slot13(slot14) do
			local strs = string.split(propv, ":")

			if #strs == 2 then
				self.addProp(self, rightSroll, strs[1] .. "��", strs[2])
			end
		end

		if v.SpecShapeName and v.SpecShapeName ~= "" then
			self.addProp(self, rightSroll, "[��Ч]" .. v.SpecShapeName, "", cc.c3b(240, 200, 150))

			local speProps = def.equipSuite.dumpPropertyStr(v.SpePropStr, g_data.player.job)

			for propk, propv in ipairs(speProps) do
				local strs = string.split(propv, ":")

				if #strs == 2 then
					self.addProp(self, rightSroll, strs[1] .. "��", strs[2])
				end
			end
		end
	end

	return 
end
equipSuiteAct.addProp = function (self, scroll, left, right, leftColor, rightColor, colCount)
	local propIdx = self.contentNode.data.propIdx or 1
	local startPosY = self.contentNode.data.startPosY
	left = left or ""
	right = right or ""
	colCount = colCount or 1
	local col = (propIdx - 1)%colCount
	local row = math.floor((propIdx - 1)/colCount)
	slot12 = an.newLabel(left, 18, 1, {
		color = leftColor or cc.c3b(240, 200, 150)
	}):anchor(0, 1)
	local lblProp = an.newLabel(left, 18, 1, {
		color = leftColor or cc.c3b(240, 200, 150)
	}).anchor(0, 1).pos(slot12, (col == 0 and 5) or 147, startPosY - row*25):add2(scroll)

	an.newLabel(right, 18, 1, {
		color = rightColor or cc.c3b(220, 210, 190)
	}):anchor(0, 1):pos(lblProp.getPositionX(lblProp) + lblProp.getw(lblProp), lblProp.getPositionY(lblProp)):add2(scroll)

	propIdx = propIdx + 1
	self.contentNode.data.propIdx = propIdx

	return 
end
equipSuiteAct.onSM_ActEquipSuite = function (self, result)
	main_scene.ui.waiting:close("CM_ActEquipSuite")

	if result.FBackValue and result.FBackValue == 0 then
		local actList = g_data.player.equipSuiteActList
		local noPut = true

		for k, v in ipairs(actList) do
			if v.FESType == result.FESType and v.FESLv == result.FESLv then
				noPut = false
			end
		end

		if noPut then
			actList[#actList + 1] = {
				FESLv == result.FESLv,
				FBoShowSpecShape = false,
				FESType = result.FESType
			}
		end

		g_data.player.equipSuiteActList = actList

		self.updateEquipSuiteInfo(self)
		self.upRightPropScroll(self, g_data.player.equipSuiteActList)
	end

	return 
end

return equipSuiteAct
