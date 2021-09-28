local soliderUpgrade = class("soliderUpgrade", import(".panelBase"))
local star = import("..common.star")
local progress = import("..common.progress")
local item = import("..common.item")
local LEVEL_MAX = 50
local tipStr = [[
1��������������ӽ�ɫѪ���������ԡ�
2��̫����������ӽ�ɫѪ��������������������ɱ�����������䵶��������׵������ٻ����޵��˺���̫������ʮ��ʱ���ٻ����޽�����Ϊŭ֮ʥ�ޡ�ŭ֮ʥ�޶�ʥ������һ���ĵֿ������˵ĵȼ�Խ�ߣ��ֿ��ļ���ҲԽ�ߡ�
3���������������һ𽣷������ս��������ǻ��ꡢ����������Ѫ������������˺����������һ��ʮ�ǣ��м��ʴ���ŭ֮�һ�ŭ֮���ꡢŭ֮��Ѫ��������һ��ʮ��/����ʮ��/����ʮ��/�߽�ʮ�Ǵ���ŭ֮�һ�/����/��Ѫ�ļ���Ϊ3%/6%/8%/10%������������ʮ��/�Ľ�ʮ��/���ʮ��/�˽�ʮ��/�Ž�ʮ��/ʮ��ʮ�ǣ�������ŭ֮�һ�/����/��Ѫ���˺��������˺�ֵΪ20/40/60/80/100/120��
4���쾧��������������ԣ�����׷�Ĵ̡�����ѩ�ء��򽣹��ڵ��˺���
5��ŭ֮�һ��ͷ��һ𽣷�ʱ���ʴ�������Ŀ��Ϊ���ģ�ʹ3*3��Χ�ڵ�Ŀ���ܵ�1.2���һ𽣷����˺���
6��ŭ֮���꣺�ͷ����ǻ���ʱ���ʴ����������ٻ����λ���׹�䣬�˺�ֵΪ���ǻ����1.8����
7��ŭ֮��Ѫ���ͷ���Ѫ��ʱ���ʴ�������Ŀ��Ϊ���ģ�ʹ3*3��Χ�ڵ�Ŀ���ܵ�1.2����Ѫ�����˺���
8�����Ľ�ҡ�����ʯ/������ʯ�������������������ֱ�Ӵӱ����۳������ȿ۳��󶨲��ϡ�
9�����Ľ�ҡ�����ʯ/�󶨼���ʯ������̫����������������쾧���������ֱ�Ӵӱ����۳������ȿ۳��󶨲��ϡ�]]
soliderUpgrade.ctor = function (self, params)
	self.super.ctor(self)
	self.setMoveable(self, true)

	self.curSoliderIdx = params.idx or 1

	return 
end
soliderUpgrade.onEnter = function (self)
	self.initPanelUI(self, {
		title = "���",
		bg = "pic/common/black_2.png"
	})
	self.setupUI(self)
	self.pos(self, display.cx - 102, display.cy)
	self.bindNetEvent(self, SM_UpdateGodWeapon, self.onSM_UpdateGodWeapon)
	self.bindNotify(self, "M_SOLIDE_DATA_CHG", self.onM_SOLIDE_DATA_CHG)

	return 
end
soliderUpgrade.setupUI = function (self)
	self.contentNode = display.newNode():addTo(self.bg)
	self.contentNode.controls = {}
	self.contentNode.data = {}

	an.newBtn(res.gettex2("pic/common/question.png"), function ()
		sound.playSound("103")
		an.newMsgbox(tipStr, nil, {
			contentLabelSize = 20,
			title = "��ʾ"
		})

		return 
	end, {
		pressBig = true,
		pressImage = res.gettex2("pic/common/question.png")
	}).pos(slot1, 160, 383):addto(self.bg)
	self.loadSoldierPage(self)

	return 
end
soliderUpgrade.copyPetData = function (self)
	self.soliderData = {}

	return 
end
soliderUpgrade.onCloseWindow = function (self)
	main_scene.ui:hidePanel("soliderPreview")
	main_scene.ui:hidePanel("soliderSkillPreview")

	return self.super.onCloseWindow(self)
end
soliderUpgrade.loadSoldierPage = function (self)
	self.copyPetData(self)

	local leftNode = display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(14, 14):size(125, 390):addTo(self.contentNode, 1)
	local rightNode = display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(139, 14):size(275, 390):addTo(self.contentNode)

	display.newSprite(res.gettex2("pic/panels/solider/gemstone_bg.png")):anchor(0, 0):pos(3, 2):add2(rightNode)

	self.contentNode.controls.rightNode = rightNode
	local propNode = display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(415, 14):size(215, 390):addTo(self.contentNode)
	self.contentNode.controls.propNode = propNode
	local listView = self.newListView(self, 0, 0, 125, 390, 4, {
		topMargin = 10
	}):add2(leftNode)
	self.contentNode.controls.listView = listView
	local lblTitle = an.newLabel("", 22, 1, {
		color = cc.c3b(220, 210, 190)
	}):anchor(0.5, 0.5):pos(135, 374):add2(rightNode)
	self.contentNode.controls.lblTitle = lblTitle
	local activeNode = display.newNode():add2(rightNode)
	self.contentNode.controls.activeNode = activeNode
	local stars = star.new({
		total = 10,
		light = 0
	}):add2(rightNode):anchor(0.5, 0.5):pos(132, 148)
	self.contentNode.controls.star = stars
	local progress = progress.new({}):anchor(0.5, 0.5):add2(rightNode):pos(145, 117)
	self.contentNode.controls.progress = progress
	local btnSearchNode = display.newNode():add2(rightNode)
	self.contentNode.controls.btnSearchNode = btnSearchNode

	display.newSprite(res.gettex2("pic/panels/wingUpgrade/button_search.png")):anchor(0.5, 0.5):pos(25, 175):add2(btnSearchNode)
	an.newLabel("ŭ֮����", 20, nil, {
		color = cc.c3b(240, 200, 150)
	}):addTo(btnSearchNode):pos(40, 176):anchor(0, 0.5):addUnderline():enableClick(handler(self, self.onSoliderSkillPreview))
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/button_search.png")):anchor(0.5, 0.5):pos(175, 175):add2(rightNode)
	an.newLabel("���Ԥ��", 20, nil, {
		color = cc.c3b(240, 200, 150)
	}):addTo(rightNode):pos(190, 176):anchor(0, 0.5):addUnderline():enableClick(handler(self, self.onSoliderPreview))

	local btnUpgrade = an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		sound.playSound("103")
		self:doUpgrade()

		return 
	end, {
		pressImage = res.gettex2("pic/common/btn21.png"),
		label = {
			"��  ��",
			16,
			0,
			{
				color = def.colors.Cf0c896
			}
		}
	}).add2(slot10, rightNode):anchor(0.5, 0.5):pos(146, 34)
	self.contentNode.controls.btnUpgrade = btnUpgrade

	ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("animation/GemUpgrade/Upgrade.csb")

	self.expAnim = ccs.Armature:create("Upgrade")

	self.expAnim:anchor(0.5, 0.5)
	self.expAnim:setPosition(134, 265)
	self.expAnim:setVisible(false)
	rightNode.addChild(rightNode, self.expAnim, 99999)

	local data = {
		1,
		2,
		3,
		4
	}

	self.fillList(self, {
		data = data,
		tcb = function (id)
			return {
				{
					def.solider.nameCfg[id],
					def.colors.Cf0c896
				}
			}
		end,
		default = self.curSoliderIdx
	})

	return 
end
soliderUpgrade.fillList = function (self, params)
	local listView = self.contentNode.controls.listView
	local listItems = {}
	self.contentNode.controls.listItems = listItems

	if not params then
		return 
	end

	local data = params.data or {}
	local tcb = params.tcb or function ()
		return "title"
	end
	local img_nor = params.img_nor or "pic/common/btn60.png"
	local img_prs = params.img_prs or "pic/common/btn61.png"

	for i, d in ipairs(slot4) do
		local item = an.newBtn(res.gettex2(img_nor), function (btn)
			sound.playSound("103")
			self:onListSelect(btn)

			return 
		end, {
			support = "scroll",
			select = {
				res.gettex2(slot7)
			}
		})
		local lbl = an.newLabelM(item.getw(item), 20, 0, {
			manual = false,
			center = true
		}):add2(item):anchor(0.5, 0.5):pos(item.getw(item)/2, item.geth(item)/2):nextLine()
		local texts = tcb(d)

		if type(texts) == "string" then
			lbl.addLabel(lbl, texts)
		else
			for i, v in ipairs(texts) do
				if type(v) == "string" then
					lbl.addLabel(lbl, v)
				else
					lbl.addLabel(lbl, v[1], v[2])
				end
			end
		end

		listItems[i] = item
		item.id = i

		self.listViewPushBack(self, listView, item, {
			left = 7
		})
	end

	local default = 1

	if params and params.default and params.default <= #listItems then
		default = params.default
	end

	if 0 < #listItems then
		self.onListSelect(self, listItems[default])
	end

	return 
end
soliderUpgrade.onListSelect = function (self, btn)
	local wingBtns = self.contentNode.controls.listItems
	local lastBtn = self.contentNode.controls.lastBtn

	if lastBtn then
		lastBtn.unselect(lastBtn)
		lastBtn.setTouchEnabled(lastBtn, true)
	end

	btn.select(btn)

	self.contentNode.controls.lastBtn = btn

	btn.setTouchEnabled(btn, false)

	self.curSoliderIdx = btn.id

	self.onListSoliderSelect(self, btn)

	return 
end
soliderUpgrade.onListSoliderSelect = function (self, btn)
	local soliderInfo = g_data.solider:getSoliderInfo(btn.id)
	local lblTitle = self.contentNode.controls.lblTitle
	local activeNode = self.contentNode.controls.activeNode
	local star = self.contentNode.controls.star
	local progress = self.contentNode.controls.progress
	local propNode = self.contentNode.controls.propNode

	activeNode.removeAllChildren(activeNode)
	propNode.removeAllChildren(propNode)
	lblTitle.setString(lblTitle, def.wing.level2str(soliderInfo.level) .. "��" .. soliderInfo.name)
	display.newSprite("pic/panels/solider/" .. soliderInfo.img .. ".png"):anchor(0.5, 0.5):pos(142, 275):add2(activeNode)

	local curNeedCfg = def.solider:getNeedCfg(soliderInfo.id, soliderInfo.level, g_data.player.job)
	local curProps = def.solider:getProps(soliderInfo.id, soliderInfo.level, g_data.player.job)
	local nextNeedCfg = def.solider:getNeedCfg(soliderInfo.id, soliderInfo.level + 1, g_data.player.job)
	local nextProps = def.solider:getProps(soliderInfo.id, soliderInfo.level + 1, g_data.player.job)
	local btnSearchNode = self.contentNode.controls.btnSearchNode

	if soliderInfo.id == 3 or (g_data.player.job == 2 and soliderInfo.id == 2) then
		btnSearchNode.setVisible(btnSearchNode, true)
	else
		btnSearchNode.setVisible(btnSearchNode, false)
	end

	local showCount = 0

	if soliderInfo.level == 0 then
		showCount = 0
	elseif soliderInfo.level%10 ~= 0 then
		showCount = soliderInfo.level%10
	else
		showCount = 10
	end

	star.select(star, showCount)

	if nextNeedCfg then
		local itemIdx = def.items.getItemIdByName(nextNeedCfg.upNeedstff)

		if itemIdx then
			an.newLabel("���ģ�", 20, 1, {
				color = def.colors.title
			}):anchor(0.5, 0.5):pos(50, 73):add2(activeNode)

			local itemData = def.items.getStdItemById(itemIdx)
			local m1 = item.new(itemData, self, {
				scroll = true,
				donotMove = true,
				idx = idx
			}):add2(activeNode, 2):pos(100, 73)

			m1.setScale(m1, 0.7)

			if m1.dura then
				m1.dura:removeSelf()

				m1.dura = nil
			end

			local needStone = nextNeedCfg.upNeedstffCount
			local lblNeedCount = an.newLabel("*" .. needStone, 17, 1, {
				color = def.colors.title
			}):anchor(0, 0.5):pos(m1.getPositionX(m1) + 15, m1.getPositionY(m1)):add2(activeNode)

			an.newLabel("��", 20, 1, {
				color = cc.c3b(240, 200, 150)
			}):anchor(0, 0.5):pos(lblNeedCount.getPositionX(lblNeedCount) + lblNeedCount.getw(lblNeedCount) + 5, 73):add2(activeNode)

			local id = def.items.getItemIdByName("���1")
			local gold = def.items.getStdItemById(id)

			item.new(gold, self, {
				isGold = true,
				donotMove = true,
				tex = res.gettex2("pic/panels/bag/gold.png")
			}):add2(activeNode):pos(lblNeedCount.getPositionX(lblNeedCount) + lblNeedCount.getw(lblNeedCount) + 50, 73)

			slot21 = an.newLabel(nextNeedCfg.upNeedGold/10000 .. "��", 17, 1, {
				color = def.colors.labelTitle
			}):anchor(0, 0.5):pos(lblNeedCount.getPositionX(lblNeedCount) + lblNeedCount.getw(lblNeedCount) + 70, 73):add2(activeNode)
		end
	end

	local rect = cc.rect(0, 0, 195, 388)
	local scroll = an.newScroll(0, 0, rect.width, rect.height):add2(propNode)
	local contentNode = display.newNode()
	local posY = 0

	display.newSprite(res.gettex2("pic/panels/wingUpgrade/flag.png")):anchor(0, 0.5):pos(8, posY - 15):add2(contentNode)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/dqsx.png")):anchor(0, 0.5):pos(26, posY - 15):add2(contentNode)

	posY = posY - 35

	local function addPropLine(name, value, parent, y)
		local lblProp = an.newLabel(name, 18, 1, {
			color = cc.c3b(240, 200, 150)
		}):anchor(0, 0.5):pos(13, y):add2(parent)

		an.newLabel(value, 18, 1, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0, 0.5):pos(lblProp.getPositionX(lblProp) + lblProp.getw(lblProp), lblProp.getPositionY(lblProp)):add2(parent)

		return 
	end

	if 0 < soliderInfo.level and curNeedCfg then
		if 0 < curNeedCfg.upNeedLevel then
			slot18("��Ҫ����: ", common.getLevelText(curNeedCfg.upNeedLevel) .. "��", contentNode, posY)

			posY = posY - 20
		end

		if 0 < curNeedCfg.upNeedServerStep then
			addPropLine("��Ҫ�������׶�: ", common.getLevelText(curNeedCfg.upNeedServerStep) .. "��", contentNode, posY)

			posY = posY - 20
		end

		for i, v in pairs(curNeedCfg.upNeedSolider) do
			local name = def.solider.nameCfg[i]

			if 0 < v then
				addPropLine("��Ҫ" .. def.solider:convertPropName(name) .. ": ", def.wing.level2str(v), contentNode, posY)

				posY = posY - 20
			end
		end

		for i, v in pairs(curNeedCfg.upNeedSkillLevel) do
			addPropLine("��Ҫ" .. i .. ": ", v .. "��", contentNode, posY)

			posY = posY - 20
		end

		for i, v in ipairs(curProps.props) do
			local p = curProps.getPropStrings(curProps, v[1])
			local valueStr = (p[3] ~= nil and p[2] .. "-" .. p[3]) or "+" .. p[2]

			if p[1] == "��������ı�" then
				if v[2] == 1 and g_data.player.job == 2 then
					addPropLine("�ٻ�ŭ֮ʥ��", "", contentNode, posY)

					posY = posY - 20
				end
			else
				addPropLine(def.solider:convertPropName(p[1]) .. ": ", valueStr, contentNode, posY)

				posY = posY - 20
			end
		end
	else
		an.newLabel("��������", 20, 1, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0.5, 0.5):pos(97.5, posY - 82):add2(contentNode)

		posY = posY - 75
	end

	if -194 < posY then
		posY = -194
	end

	display.newSprite(res.gettex2("pic/panels/equipforge/irtJT.png")):anchor(0.5, 0):pos(80, posY - 5):add2(contentNode):setRotation(90)

	posY = posY - 70
	local posY2 = 0

	display.newSprite(res.gettex2("pic/panels/wingUpgrade/flag.png")):anchor(0, 0.5):pos(8, (posY + posY2) - 15):add2(contentNode)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/xjsx.png")):anchor(0, 0.5):pos(26, (posY + posY2) - 15):add2(contentNode)

	posY2 = posY2 - 35

	if nextNeedCfg then
		if 0 < nextNeedCfg.upNeedLevel then
			addPropLine("��Ҫ����: ", common.getLevelText(nextNeedCfg.upNeedLevel) .. "��", contentNode, posY + posY2)

			posY2 = posY2 - 20
		end

		if 0 < nextNeedCfg.upNeedServerStep then
			addPropLine("��Ҫ�������׶�: ", nextNeedCfg.upNeedServerStep, contentNode, posY + posY2)

			posY2 = posY2 - 20
		end

		for i, v in pairs(nextNeedCfg.upNeedSolider) do
			local name = def.solider.nameCfg[i]

			if 0 < v then
				addPropLine("��Ҫ" .. def.solider:convertPropName(name) .. ": ", def.wing.level2str(v), contentNode, posY + posY2)

				posY2 = posY2 - 20
			end
		end

		for i, v in pairs(nextNeedCfg.upNeedSkillLevel) do
			addPropLine("��Ҫ" .. i .. ": ", v .. "��", contentNode, posY + posY2)

			posY2 = posY2 - 20
		end

		for i, v in ipairs(nextProps.props) do
			local p = nextProps.getPropStrings(nextProps, v[1])
			local valueStr = (p[3] ~= nil and p[2] .. "-" .. p[3]) or "+" .. p[2]

			if p[1] == "��������ı�" then
				if v[2] == 1 and curProps.get(curProps, "��������ı�") ~= 1 and g_data.player.job == 2 then
					addPropLine("�ٻ�ŭ֮ʥ��", "", contentNode, posY + posY2)

					posY2 = posY2 - 20
				end
			else
				addPropLine(def.solider:convertPropName(p[1]) .. ": ", valueStr, contentNode, posY + posY2)

				posY2 = posY2 - 20
			end
		end
	else
		an.newLabel("�ȼ������", 20, 1, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0.5, 0.5):pos(97.5, (posY + posY2) - 30):add2(contentNode)

		posY2 = posY2 - 75
	end

	if -194 < posY2 then
		posY2 = -194
	end

	local scrollHeight = -(posY + posY2)

	contentNode.pos(contentNode, 0, scrollHeight):add2(scroll)
	scroll.setScrollSize(scroll, rect.width, scrollHeight)

	local rollbg = display.newScale9Sprite(res.getframe2("pic/scale/scale9.png"), 195, 1, cc.size(20, 388)):addTo(propNode):anchor(0, 0)
	local rollCeil = res.get2("pic/common/scrollShow.png"):anchor(0.5, 0):pos(rollbg.getw(rollbg)*0.5, rollbg.geth(rollbg) - 42):add2(rollbg)

	scroll.setListenner(scroll, function (event)
		if event.name == "moved" then
			local x, y = scroll:getScrollOffset()
			local scrollHeight = scrollHeight + 1
			local maxOffset = scrollHeight - scroll:geth()

			if y < 0 then
				y = 0
			end

			if maxOffset < y then
				y = maxOffset or y
			end

			local s = (rollbg:geth() - 42)*(y/maxOffset - 1)

			rollCeil:setPositionY(s)
		end

		return 
	end)
	progress.setValue(slot6, {
		extValue = 0,
		currentValue = soliderInfo.haveStuff,
		totalValue = (nextNeedCfg and nextNeedCfg.upNeedstffCount) or 0
	})

	return 
end
soliderUpgrade.onSoliderPreview = function (self)
	local lastBtn = self.contentNode.controls.lastBtn

	if lastBtn and lastBtn.id then
		main_scene.ui:togglePanel("soliderPreview", lastBtn.id)
	end

	return 
end
soliderUpgrade.onSoliderSkillPreview = function (self)
	local lastBtn = self.contentNode.controls.lastBtn

	if lastBtn and lastBtn.id then
		main_scene.ui:togglePanel("soliderSkillPreview", lastBtn.id)
	end

	return 
end
soliderUpgrade.doUpgrade = function (self)
	local lastBtn = self.contentNode.controls.lastBtn

	if not lastBtn or not lastBtn.id then
		return 
	end

	local soliderInfo = g_data.solider:getSoliderInfo(lastBtn.id)
	local nextNeedCfg = def.solider:getNeedCfg(soliderInfo.id, soliderInfo.level + 1)
	local nextCfg = soliderInfo.getNextCfg(soliderInfo)

	if not nextCfg then
		main_scene.ui:tip("�Ѵﵽ����")

		return 
	end

	if g_data.login.serverLevel < nextNeedCfg.upNeedServerStep then
		main_scene.ui:tip("����ʧ�ܣ���ǰ�������׶�δ�ﵽҪ��")

		return 
	end

	local level = g_data.player.ability.FLevel

	if level < nextNeedCfg.upNeedLevel then
		main_scene.ui:tip("����ʧ�ܣ���ǰ��ɫ�ȼ�δ�ﵽҪ��")

		return 
	end

	local haveCount = g_data.bag:getItemCount(nextNeedCfg.upNeedstff) + g_data.bag:getItemCount("��" .. nextNeedCfg.upNeedstff)

	if haveCount == 0 then
		main_scene.ui:tip("����ʧ�ܣ����ϲ���")

		return 
	end

	for i, v in pairs(nextNeedCfg.upNeedSolider) do
		local info = g_data.solider:getSoliderInfo(i)

		if info then
			if info.level < v then
				main_scene.ui:tip(string.format("����ʧ�ܣ�%s�ȼ�δ�ﵽҪ��", info.name))

				return 
			end
		else
			main_scene.ui:tip("����ʧ�ܣ�δ֪���� " .. i)

			return 
		end
	end

	self.requestUpgrade(self, lastBtn.id)

	return 
end
soliderUpgrade.requestUpgrade = function (self, id)
	local rsb = DefaultClientMessage(CM_UpdateGodWeapon)
	rsb.FID = id

	MirTcpClient:getInstance():postRsb(rsb)
	main_scene.ui.waiting:show(10, "SOLIDER_UPGRADE")

	return 
end
soliderUpgrade.onSM_UpdateGodWeapon = function (self, result)
	main_scene.ui.waiting:close("SOLIDER_UPGRADE")

	if not result then
		return 
	end

	if result.FOK then
		local rsb = DefaultClientMessage(CM_QueryGodWeaponList)

		MirTcpClient:getInstance():postRsb(rsb)
		self.expAnim:setVisible(true)
		self.expAnim:getAnimation():play("Animation1", -1, 0)
	end

	return 
end
soliderUpgrade.onM_SOLIDE_DATA_CHG = function (self)
	local lastBtn = self.contentNode.controls.lastBtn

	if not lastBtn or not lastBtn.id then
		return 
	end

	self.onListSoliderSelect(self, lastBtn)

	return 
end

return soliderUpgrade
