local horseUpgrade = class("horseUpgrade", import(".panelBase"))
local star = import("..common.star")
local item = import("..common.item")
local CommonItem = import("..common.item")
local CommonItemInfo = import("..common.itemInfo")
local tip = import(".wingInfo")
local tipStr_upgrade = [[
1.�ڱ�����˫�����ƣ��ɻ�ö�Ӧ���
2.ÿ����������ֻ�ܻ��һƥ���ѻ�ø�������������޷�ʹ�ø��������ơ�
3.ÿ����ʱ������ظ���ã���ú�ʣ��ʱ���ۼӣ������Բ��ۼӡ�
4.���������Ƿ�չʾ�����ɻ��ͼ�����Լӳɣ���ͬ�����ͼ�����Կ����ۼӡ�
5.������ѡ����Ҫչʾ�����
6.���ڡ��Զ�����桱�н���������ť�϶��������棬���������������ﲢ�ı�����ʱװ������������ջ�����ָ�����ԭ��ʱװ��
7.�չ����ͷż��ܣ����Զ�����]]
local tipStr_quality = [[
1.��ҿ�ͨ��ʹ�����ƻ�ö�Ӧ���
2.ÿƥ������3��ְҵƫ�򣺹�����ħ����������ʹ������ʱ������һ�֡�
3.����Ʒ���ɵ͵�������Ϊ���ף��̣������ϣ��ȣ�ʹ������ʱ�����ðס�����������һ�֡�
4.��ҿ�ͨ��������ɫ����Ʒ�ʵ�ͬ��������������Ʒ�ʣ���ɫ�������ﲻ������Ʒ�ʡ�]]
local tipStr_zizhi = [[
1.��ҿ�ͨ��ʹ�����ƻ�ö�Ӧ���
2.ÿƥ������3��ְҵƫ�򣺹�����ħ����������ʹ������ʱ������һ�֡�
3.ʹ�����ʵ���ϴ���������ʣ����ʵ���ֱ�Ӵӱ����п۳���
4.ϴ�����������������滻����ť���ܱ��棨���滻ԭ�����ԣ���
5.���Ĳ���ʱ���������İ����ʵ������������ʵ���]]
local tipStr_inherit = [[
1.��ҿ�ͨ��ʹ�����ƻ�ö�Ӧ���
2.ÿƥ������3��ְҵƫ�򣺹�����������ʹ������ʱ������һ�֡�
3.��������ɽ�����ȼ����������ԣ�ת�Ƹ��̳����������ԭ���ĵȼ����������ԡ�
4.���к󣬴�������ĵȼ���������ա�
5.�̳�����ĵȼ����ޱ�����ڻ���ڴ�������ĵ�ǰ�ȼ��������໥���С�
6.ÿ�δ�����Ҫ���Ľ�ҡ�
7.�̳������ϡ�ж�Խ�ߣ����ĵĽ������Խ�ࡣ
]]
local UPGRADE_MATERIAL = "���"
horseUpgrade.ctor = function (self, params)
	self.super.ctor(self)
	self.setMoveable(self, true)

	self.params = params or {}
	self.page = params.page or 1
	self.horseInfo = params.horseInfo or g_data.horse
	self.isOtherPlayer = params.playerName ~= nil
	self.bindJob = (self.isOtherPlayer and params.job) or g_data.player.job
	self.max = 5
	self.items = {}
	self.haveStuff = 0
	self.curSoulData = nil
	self.nextSoulData = nil
	self.curSoulProps = nil
	self.nextSoulProps = nil
	self.tabCallbacks = {}

	return 
end
horseUpgrade.onEnter = function (self)
	self.copyPetData(self)

	local tabstr = {}
	local tabcb = {}
	tabstr[#tabstr + 1] = "ͼ\n��"
	tabcb[#tabcb + 1] = self.loadHorsePage

	if not self.isOtherPlayer and 2 <= g_data.client.serverState and 110 <= g_data.client.openDay then
		tabstr[#tabstr + 1] = "��\n��"
		tabcb[#tabcb + 1] = self.loadHorseSoulPage
	end

	self.tabCallbacks = tabcb

	self.initPanelUI(self, {
		title = "",
		bg = "pic/common/black_2.png",
		tab = {
			strs = tabstr,
			default = self.page
		}
	})
	self.pos(self, display.cx - 102, display.cy)
	self.bindNetEvent(self, SM_HorseToPlay, self.onSM_HorseToPlay)
	self.bindNotify(self, "M_HORSE_LIST_CHG", self.onM_HORSE_LIST_CHG)
	self.bindNotify(self, "HORSE_STATE_CHG", self.onHORSE_STATE_CHG)
	self.bindNetEvent(self, SM_UpMonSoul, self.onSM_UpMonSoul)
	self.bindNotify(self, "ITEM_USE", self.onITEM_USE)
	self.bindNotify(self, "M_BAGITEM_CHG", self.onM_BAGITEM_CHG)

	return 
end
horseUpgrade.onCloseWindow = function (self)
	return self.super.onCloseWindow(self)
end
horseUpgrade.clearContentNode = function (self)
	if self.contentNode then
		self.contentNode:removeAllChildren()
	end

	self.contentNode = display.newNode():addTo(self.bg)
	self.contentNode.controls = {}
	self.contentNode.data = {}

	return 
end
horseUpgrade.onTabClick = function (self, idx, btn)
	self.clearContentNode(self)

	self.curTab = self.tabCallbacks[idx]
	self.curIdx = idx

	self.tabCallbacks[idx](self)

	return 
end
horseUpgrade.copyPetData = function (self)
	self.horseData = {}
	local idx = 1

	for i, v in pairs(def.horse:getBaseCfg()) do
		local horseData = self.horseInfo:getHorseById(i)

		if not horseData.istime or (horseData.istime and horseData.have) then
			self.horseData[idx] = horseData
			idx = idx + 1
		end
	end

	table.sort(self.horseData, function (a, b)
		if a.id == self.horseInfo.FCurrIdent then
			return true
		elseif b.id == self.horseInfo.FCurrIdent then
			return false
		end

		if a.have and not b.have then
			return true
		elseif not a.have and b.have then
			return false
		end

		if a.id < b.id then
			return true
		elseif b.id < a.id then
			return false
		end

		return false
	end)

	return 
end
horseUpgrade.loadHorsePage = function (self)
	local titleStr = ""

	if self.isOtherPlayer then
		titleStr = self.params.playerName .. "������"
	else
		titleStr = "����"
	end

	self.setTitle(self, titleStr)

	local leftNode = display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(14, 14):size(157, 390):addTo(self.contentNode, 1)
	local rightNode = display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(171, 14):size(457, 390):addTo(self.contentNode)

	display.newSprite(res.gettex2("pic/panels/horseUpgrade/bg.png")):anchor(0, 0):pos(3, 2):add2(rightNode)

	self.contentNode.controls.rightNode = rightNode

	display.newScale9Sprite(res.getframe2("pic/panels/wingUpgrade/propertyBg.png")):anchor(0, 0):pos(284, 3):size(164, 383):addTo(rightNode)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/flag.png")):anchor(0, 0.5):pos(285, 370):add2(rightNode)
	display.newSprite(res.gettex2("pic/panels/horseUpgrade/horse_prop.png")):anchor(0, 0.5):pos(306, 370):add2(rightNode)

	local listView = self.newListView(self, 0, 0, 168, 390, 4, {}):add2(leftNode)
	self.contentNode.controls.listView = listView

	an.newBtn(res.gettex2("pic/common/question.png"), function ()
		sound.playSound("103")
		an.newMsgbox(tipStr_upgrade, nil, {
			contentLabelSize = 20,
			title = "��ʾ"
		})

		return 
	end, {
		pressBig = true,
		pressImage = res.gettex2("pic/common/question.png")
	}).pos(slot5, 25, 365):addto(rightNode)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/title_bg.png")):anchor(0.5, 0.5):pos(159, 366):add2(rightNode)

	local lblTitle = an.newLabel("", 20, 1, {
		color = def.colors.clBlue
	}):anchor(0.5, 0.5):pos(159, 366):add2(rightNode)
	self.contentNode.controls.lblTitle = lblTitle
	local lblDesc = an.newLabelM(160, 18, 1, {
		manual = false,
		center = false
	}):add2(rightNode):anchor(0.5, 0):pos(371, 27):nextLine()
	self.contentNode.controls.lblDesc = lblDesc
	local activeNode = display.newNode():add2(rightNode)
	self.contentNode.controls.activeNode = activeNode
	local data = self.horseData

	self.fillWingList(self, {
		data = data
	})

	return 
end
horseUpgrade.loadUpgradePage = function (self)
	local leftNode = display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(14, 14):size(157, 390):addTo(self.contentNode, 1)
	local rightNode = display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(171, 14):size(457, 390):addTo(self.contentNode)

	display.newSprite(res.gettex2("pic/panels/horseUpgrade/bg.png")):anchor(0, 0):pos(3, 2):add2(rightNode)

	self.contentNode.controls.rightNode = rightNode
	local propNode = display.newScale9Sprite(res.getframe2("pic/panels/wingUpgrade/propertyBg.png")):anchor(0, 0):pos(284, 3):size(164, 383):addTo(rightNode)

	display.newSprite(res.gettex2("pic/panels/wingUpgrade/flag.png")):anchor(0, 0.5):pos(8, 369):add2(propNode)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/dqsx.png")):anchor(0, 0.5):pos(26, 369):add2(propNode)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/flag.png")):anchor(0, 0.5):pos(8, 153):add2(propNode)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/xjsx.png")):anchor(0, 0.5):pos(26, 153):add2(propNode)

	local listView = self.newListView(self, 0, 0, 168, 390, 4, {}):add2(leftNode)
	self.contentNode.controls.listView = listView

	an.newBtn(res.gettex2("pic/common/question.png"), function ()
		sound.playSound("103")
		an.newMsgbox(tipStr_upgrade, nil, {
			contentLabelSize = 20,
			title = "��ʾ"
		})

		return 
	end, {
		pressBig = true,
		pressImage = res.gettex2("pic/common/question.png")
	}).pos(slot5, 25, 365):addto(rightNode)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/title_bg.png")):anchor(0.5, 0.5):pos(159, 366):add2(rightNode)

	local lblTitle = an.newLabel("", 20, 1, {
		color = def.colors.clBlue
	}):anchor(0.5, 0.5):pos(159, 366):add2(rightNode)
	self.contentNode.controls.lblTitle = lblTitle
	local activeNode = display.newNode():add2(rightNode)
	self.contentNode.controls.activeNode = activeNode
	local stars = star.new({
		total = 10,
		light = 6
	}):add2(rightNode):anchor(0.5, 0.5):pos(132, 148)
	local curExp = 0
	local processBg = display.newScale9Sprite(res.getframe2("pic/panels/wingUpgrade/pg_bg.png"), 0, 0, cc.size(255, 25)):anchor(0.5, 0.5):add2(rightNode):pos(145, 117)
	local processBar = display.newScale9Sprite(res.getframe2("pic/panels/wingUpgrade/pg.png"), 0, 0, cc.size(279, 17)):anchor(0, 0.5):add2(processBg):pos(3, processBg.geth(processBg)/2)

	processBar.setScaleX(processBar, 0.65)

	self.contentNode.controls.processBar = processBar
	local lblProcess = an.newLabel(string.format("%d/%d", curExp, (wingCfg and wingCfg.UpNeedExp) or 0), 18, 1, {
		color = cc.c3b(220, 210, 190)
	}):anchor(0.5, 0.5):pos(processBg.getPositionX(processBg), processBg.getPositionY(processBg)):add2(rightNode)

	display.newSprite(res.gettex2("pic/panels/wingUpgrade/button_search.png")):anchor(0.5, 0.5):pos(183, 175):add2(rightNode)
	an.newLabel("����Ԥ��", 20, nil, {
		color = cc.c3b(240, 200, 150)
	}):addTo(rightNode):pos(198, 176):anchor(0, 0.5):addUnderline():enableClick(handler(self, self.onHorsePreview))
	an.newLabel("���ģ�", 20, 1, {
		color = def.colors.title
	}):anchor(0.5, 0.5):pos(70, 70):add2(rightNode)

	local itemIdx = def.items.getItemIdByName("��ɫ��ë")
	local itemData = def.items.getStdItemById(itemIdx)
	local m1 = item.new(itemData, self, {
		scroll = true,
		donotMove = true,
		idx = idx
	}):add2(rightNode, 2):pos(128, 73)

	m1.setScale(m1, 0.7)

	if m1.dura then
		m1.dura:removeSelf()

		m1.dura = nil
	end

	an.newLabel("*1", 20, 1, {
		color = def.colors.title
	}):anchor(0, 0.5):pos(30, m1.geth(m1)/2):add2(m1)

	local m2 = item.new(itemData, self, {
		scroll = true,
		donotMove = true,
		idx = idx
	}):add2(rightNode, 2):pos(290, 73)

	m2.setScale(m2, 0.7)

	if m2.dura then
		m2.dura:removeSelf()

		m2.dura = nil
	end

	an.newLabel("*10", 20, 1, {
		color = def.colors.title
	}):anchor(0, 0.5):pos(30, m2.geth(m2)/2):add2(m2)
	an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		sound.playSound("103")

		return 
	end, {
		pressImage = res.gettex2("pic/common/btn21.png"),
		label = {
			"ʹ��һ��",
			16,
			0,
			{
				color = def.colors.Cf0c896
			}
		}
	}).add2(slot16, rightNode):anchor(0.5, 0.5):pos(86, 34)
	an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		sound.playSound("103")

		return 
	end, {
		pressImage = res.gettex2("pic/common/btn21.png"),
		label = {
			"ʹ��ʮ��",
			16,
			0,
			{
				color = def.colors.Cf0c896
			}
		}
	}).add2(slot16, rightNode):anchor(0.5, 0.5):pos(210, 34)
	an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		sound.playSound("103")
		self:onEatHorse()

		return 
	end, {
		pressImage = res.gettex2("pic/common/btn21.png"),
		label = {
			"��������",
			16,
			0,
			{
				color = def.colors.Cf0c896
			}
		}
	}).add2(slot16, rightNode):anchor(0.5, 0.5):pos(370, 34)

	local data = def.horse:getBaseCfg()

	self.fillWingList(self, {
		data = data,
		tcb = function (data)
			return data.Name
		end
	})

	return 
end
horseUpgrade.loadQualityPage = function (self)
	local leftNode = display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(14, 14):size(157, 390):addTo(self.contentNode, 1)
	local rightNode = display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(171, 14):size(457, 390):addTo(self.contentNode)

	display.newSprite(res.gettex2("pic/panels/horseUpgrade/bg.png")):anchor(0, 0):pos(3, 2):add2(rightNode)

	self.contentNode.controls.rightNode = rightNode
	local propNode = display.newScale9Sprite(res.getframe2("pic/panels/wingUpgrade/propertyBg.png")):anchor(0, 0):pos(284, 3):size(164, 383):addTo(rightNode)

	display.newSprite(res.gettex2("pic/panels/wingUpgrade/flag.png")):anchor(0, 0.5):pos(8, 369):add2(propNode)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/dqsx.png")):anchor(0, 0.5):pos(26, 369):add2(propNode)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/flag.png")):anchor(0, 0.5):pos(8, 153):add2(propNode)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/xjsx.png")):anchor(0, 0.5):pos(26, 153):add2(propNode)

	local listView = self.newListView(self, 0, 0, 168, 390, 4, {}):add2(leftNode)
	self.contentNode.controls.listView = listView

	an.newBtn(res.gettex2("pic/common/question.png"), function ()
		sound.playSound("103")
		an.newMsgbox(tipStr_upgrade, nil, {
			contentLabelSize = 20,
			title = "��ʾ"
		})

		return 
	end, {
		pressBig = true,
		pressImage = res.gettex2("pic/common/question.png")
	}).pos(slot5, 25, 365):addto(rightNode)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/title_bg.png")):anchor(0.5, 0.5):pos(159, 366):add2(rightNode)

	local lblTitle = an.newLabel("", 20, 1, {
		color = def.colors.clBlue
	}):anchor(0.5, 0.5):pos(159, 366):add2(rightNode)
	self.contentNode.controls.lblTitle = lblTitle
	local activeNode = display.newNode():add2(rightNode)
	self.contentNode.controls.activeNode = activeNode
	local curExp = 0
	local processBg = display.newScale9Sprite(res.getframe2("pic/panels/wingUpgrade/pg_bg.png"), 0, 0, cc.size(255, 25)):anchor(0.5, 0.5):add2(rightNode):pos(145, 117)
	local processBar = display.newScale9Sprite(res.getframe2("pic/panels/wingUpgrade/pg.png"), 0, 0, cc.size(279, 17)):anchor(0, 0.5):add2(processBg):pos(3, processBg.geth(processBg)/2)

	processBar.setScaleX(processBar, 0.65)

	self.contentNode.controls.processBar = processBar

	an.newLabel("Ʒ��: ", 20, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):pos(114, 146):add2(rightNode)

	local lblProcess = an.newLabel(string.format("%d/%d", curExp, (wingCfg and wingCfg.UpNeedExp) or 0), 18, 1, {
		color = cc.c3b(220, 210, 190)
	}):anchor(0.5, 0.5):pos(processBg.getPositionX(processBg), processBg.getPositionY(processBg)):add2(rightNode)

	an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		sound.playSound("103")

		return 
	end, {
		pressImage = res.gettex2("pic/common/btn21.png"),
		label = {
			"ͻ  ��",
			16,
			0,
			{
				color = def.colors.Cf0c896
			}
		}
	}).add2(slot11, rightNode):anchor(0.5, 0.5):pos(146, 66)
	an.newLabel("����Ʒ��: ", 20, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):pos(13, 21):add2(rightNode)
	an.newLabelM(100, 20, 1, {
		manual = true
	}):anchor(0, 0.5):pos(111, 19):add2(rightNode):nextLine():addLabel("��", def.horse:getRareColor(1)):addLabel("<��", def.horse:getRareColor(2)):addLabel("<��", def.horse:getRareColor(3)):addLabel("<��", def.horse:getRareColor(4)):addLabel("<��", def.horse:getRareColor(5))

	local data = def.horse:getBaseCfg()

	self.fillWingList(self, {
		data = data,
		tcb = function (data)
			return data.Name
		end
	})

	return 
end
horseUpgrade.loadZizhiPage = function (self)
	local leftNode = display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(14, 14):size(157, 390):addTo(self.contentNode, 1)
	local rightNode = display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(171, 14):size(457, 390):addTo(self.contentNode)

	display.newSprite(res.gettex2("pic/panels/horseUpgrade/bg.png")):anchor(0, 0):pos(3, 2):add2(rightNode)

	self.contentNode.controls.rightNode = rightNode
	local propNode = display.newScale9Sprite(res.getframe2("pic/panels/wingUpgrade/propertyBg.png")):anchor(0, 0):pos(284, 3):size(164, 383):addTo(rightNode)

	display.newSprite(res.gettex2("pic/panels/wingUpgrade/flag.png")):anchor(0, 0.5):pos(285, 370):add2(rightNode)
	display.newSprite(res.gettex2("pic/panels/horseUpgrade/horse_prop.png")):anchor(0, 0.5):pos(306, 370):add2(rightNode)

	local listView = self.newListView(self, 0, 0, 168, 390, 4, {}):add2(leftNode)
	self.contentNode.controls.listView = listView

	an.newBtn(res.gettex2("pic/common/question.png"), function ()
		sound.playSound("103")
		an.newMsgbox(tipStr_upgrade, nil, {
			contentLabelSize = 20,
			title = "��ʾ"
		})

		return 
	end, {
		pressBig = true,
		pressImage = res.gettex2("pic/common/question.png")
	}).pos(slot5, 25, 365):addto(rightNode)
	display.newSprite(res.gettex2("pic/panels/wingUpgrade/title_bg.png")):anchor(0.5, 0.5):pos(159, 366):add2(rightNode)

	local lblTitle = an.newLabel("", 20, 1, {
		color = def.colors.clBlue
	}):anchor(0.5, 0.5):pos(159, 366):add2(rightNode)
	self.contentNode.controls.lblTitle = lblTitle
	local activeNode = display.newNode():add2(rightNode)
	self.contentNode.controls.activeNode = activeNode

	an.newLabel("����: ", 20, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):pos(114, 156):add2(rightNode)
	an.newLabel("����: ", 20, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):pos(114, 114):add2(rightNode)
	an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		sound.playSound("103")

		return 
	end, {
		pressImage = res.gettex2("pic/common/btn21.png"),
		label = {
			"ϴ  ��",
			16,
			0,
			{
				color = def.colors.Cf0c896
			}
		}
	}).add2(slot7, rightNode):anchor(0.5, 0.5):pos(85, 58)
	an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		sound.playSound("103")

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
	}).add2(slot7, rightNode):anchor(0.5, 0.5):pos(215, 58)
	an.newLabel("����Ʒ��: ", 20, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):pos(13, 21):add2(rightNode)
	an.newLabelM(100, 20, 1, {
		manual = true
	}):anchor(0, 0.5):pos(111, 19):add2(rightNode):nextLine():addLabel("��", def.horse:getRareColor(1)):addLabel("<��", def.horse:getRareColor(2)):addLabel("<��", def.horse:getRareColor(3)):addLabel("<��", def.horse:getRareColor(4)):addLabel("<��", def.horse:getRareColor(5))

	local data = def.horse:getBaseCfg()

	self.fillWingList(self, {
		data = data,
		tcb = function (data)
			return data.Name
		end
	})

	return 
end
horseUpgrade.loadInheritPage = function (self)
	local leftNode = display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(14, 14):size(203, 390):addTo(self.contentNode, 1)
	local rightNode = display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(219, 14):size(410, 390):addTo(self.contentNode)
	self.contentNode.controls.rightNode = rightNode
	local listView = self.newListView(self, 0, 0, 203, 390, 4, {}):add2(leftNode)
	self.contentNode.controls.listView = listView

	an.newBtn(res.gettex2("pic/common/question.png"), function ()
		sound.playSound("103")
		an.newMsgbox(tipStr_inherit, nil, {
			contentLabelSize = 20,
			title = "��ʾ"
		})

		return 
	end, {
		pressBig = true,
		pressImage = res.gettex2("pic/common/question.png")
	}).pos(slot4, 19, 369):addto(rightNode)
	an.newLabel("���к�����ȼ����������Խ�������", 18, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):pos(79, 370):add2(rightNode)
	display.newScale9Sprite(res.getframe2("pic/scale/scale21.png"), 0, 0, cc.size(172, 277)):anchor(0, 0):pos(7, 74):add2(rightNode)
	display.newScale9Sprite(res.getframe2("pic/scale/scale21.png"), 0, 0, cc.size(172, 277)):anchor(0, 0):pos(235, 74):add2(rightNode)
	display.newSprite(res.getframe2("pic/panels/horseUpgrade/chuancheng.png")):anchor(0.5, 0.5):pos(90, 330):add2(rightNode)
	display.newSprite(res.getframe2("pic/panels/horseUpgrade/jicheng.png")):anchor(0.5, 0.5):pos(321, 330):add2(rightNode)
	display.newSprite(res.gettex2("pic/panels/equipforge/specialEquipBg.png")):anchor(0.5, 0.5):pos(90, 274):addTo(rightNode)
	display.newSprite(res.gettex2("pic/panels/equipforge/specialEquipBg.png")):anchor(0.5, 0.5):pos(321, 274):addTo(rightNode)
	an.newLabel("���Ĳ���: ", 20, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):pos(13, 39):add2(rightNode)
	an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		sound.playSound("103")

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
	}).add2(slot4, rightNode):anchor(0.5, 0.5):pos(353, 39)

	local lblWingName = an.newLabel("", 20, 1, {
		color = def.colors.clBlue
	}):anchor(0.5, 0.5):pos(159, 366):add2(rightNode)
	self.contentNode.controls.lblWingName = lblWingName
	local activeNode = display.newNode():add2(rightNode)
	self.contentNode.controls.activeNode = activeNode
	local data = def.horse:getBaseCfg()

	self.fillInheritList(self, {
		data = data,
		tcb = function (data)
			return data.Name
		end
	})

	return 
end
horseUpgrade.fillWingList = function (self, params)
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
	local img_nor = params.img_nor or "pic/panels/picIdentify/equipTypeUnselect.png"
	local img_prs = params.img_prs or "pic/panels/picIdentify/equipTypeSelect.png"

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

		an.newLabel((d.have and d.name .. "(�ѻ��)") or d.name, 16, 0, {
			color = def.colors.Cf0c896
		}):anchor(0.5, 0.5):pos(item.getw(item)/2, item.geth(item)/2):add2(item)

		listItems[i] = item
		item.data = d

		if d.id == self.horseInfo.FCurrIdent then
			display.newSprite(res.gettex2("pic/panels/horseUpgrade/showing.png")):pos(126, 23):add2(item)
		end

		if not d.have then
			local f = res.getFilter("gray")

			item.bg:setColor(cc.c3b(127, 127, 127))
		end

		self.listViewPushBack(self, listView, item)
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
horseUpgrade.fillInheritList = function (self, params)
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
	local img_nor = params.img_nor or "pic/panels/horseUpgrade/eat_item.png"
	local img_prs = params.img_prs or "pic/panels/horseUpgrade/eat_item_light.png"

	for i, d in ipairs(slot4) do
		local item = an.newBtn(res.gettex2(img_nor), function (btn)
			sound.playSound("103")
			self:onListSelect(btn)

			return 
		end, {
			support = "scroll",
			select = {
				res.gettex2(slot7)
			},
			label = {
				tcb(d),
				16,
				0,
				{
					color = def.colors.Cf0c896
				}
			}
		})
		listItems[i] = item
		item.data = d

		self.listViewPushBack(self, listView, item, {
			left = 2
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
horseUpgrade.onListSelect = function (self, btn)
	local wingBtns = self.contentNode.controls.listItems
	local lastBtn = self.contentNode.controls.lastBtn

	if lastBtn then
		lastBtn.unselect(lastBtn)
		lastBtn.setTouchEnabled(lastBtn, true)
	end

	btn.select(btn)

	self.contentNode.controls.lastBtn = btn

	btn.setTouchEnabled(btn, false)

	if self.curTab == self.loadHorsePage then
		self.onListHorseSelect(self, btn)
	elseif self.curTab == self.loadUpgradePage then
		self.onListUpgradeSelect(self, btn)
	elseif self.curTab == self.loadQualityPage then
		self.onListQualitySelect(self, btn)
	elseif self.curTab == self.loadZizhiPage then
		self.onListZizhiSelect(self, btn)
	elseif self.curTab == self.loadInheritPage then
		self.onListInheritSelect(self, btn)
	end

	return 
end
horseUpgrade.onListHorseSelect = function (self, btn)
	local horseInfo = btn.data
	local rightNode = self.contentNode.controls.rightNode
	local lblTitle = self.contentNode.controls.lblTitle
	local lblDesc = self.contentNode.controls.lblDesc
	local lblRarity = self.contentNode.controls.lblRarity
	local image = self.contentNode.controls.image
	local activeNode = self.contentNode.controls.activeNode

	activeNode.removeAllChildren(activeNode)
	lblTitle.setString(lblTitle, horseInfo.name)
	lblTitle.setColor(lblTitle, def.horse:getRareColor(1))
	lblDesc.clear(lblDesc)
	lblDesc.addLabel(lblDesc, horseInfo.desc, cc.c3b(230, 105, 70))
	display.newSprite("pic/panels/horseUpgrade/" .. horseInfo.shape .. ".png"):anchor(0.5, 0):pos(142, 162):add2(activeNode)

	if horseInfo.have then
		if not self.isOtherPlayer then
			if horseInfo.id ~= self.horseInfo.FCurrIdent then
				an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
					sound.playSound("103")
					self:onShow()

					return 
				end, {
					pressImage = res.gettex2("pic/common/btn21.png"),
					label = {
						"չ  ʾ",
						16,
						0,
						{
							color = def.colors.Cf0c896
						}
					}
				}).add2(slot9, activeNode):anchor(0.5, 0.5):pos(148, 73)
			else
				local txt = (g_data.player.horseInfo.state == 0 and "��  ��") or "��  ��"

				an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
					sound.playSound("103")
					main_scene.ui:changeHorseState()

					return 
				end, {
					pressImage = res.gettex2("pic/common/btn21.png"),
					label = {
						txt,
						16,
						0,
						{
							color = def.colors.Cf0c896
						}
					}
				}).add2(slot10, activeNode):anchor(0.5, 0.5):pos(148, 73)
			end
		end

		if horseInfo.istime then
			local ts = ""
			local curTime = g_data.serverTime:getTime()
			local lastTime = tonumber(horseInfo.lasttime)
			local d, h = common.convertDayTimeFromSec(lastTime - curTime)

			if d < 0 then
				d = 0
			end

			if h < 0 then
				h = 0
			end

			ts = string.format("%d��%dСʱ", d, h)

			an.newLabel(string.format("ʣ��: %s", ts), 18, 1, {
				color = cc.c3b(216, 231, 232)
			}):anchor(0.5, 0.5):pos(148, 110):add2(activeNode)
		end
	else
		display.newSprite(res.gettex2("pic/panels/wingUpgrade/prop_split.png")):pos(156, 84):add2(activeNode)
		display.newSprite(res.gettex2("pic/panels/wingUpgrade/prop_split.png")):pos(156, 53):add2(activeNode)
		an.newLabel("��δ���", 20, 1, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0.5, 0.5):pos(148, 70):add2(activeNode)
	end

	local function addPropLine(name, value, line, startY)
		local lblProp = an.newLabel(name, 18, 1, {
			color = cc.c3b(240, 200, 150)
		}):anchor(0, 0.5):pos(296, startY - line*25):add2(activeNode)

		an.newLabel(value, 18, 1, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0, 0.5):pos(lblProp.getPositionX(lblProp) + lblProp.getw(lblProp), lblProp.getPositionY(lblProp)):add2(activeNode)

		return 
	end

	local job = self.bindJob
	local props = def.property.dumpPropertyStr(horseInfo.propstr).clearZero(slot11):toStdProp():grepJob(job)

	if 0 < #props.props then
		local idx = 0

		for i, v in ipairs(props.props) do
			local p = props.getPropStrings(props, v[1])

			addPropLine(p[1] .. ": ", (p[3] ~= nil and p[2] .. "-" .. p[3]) or "+" .. p[2], idx, 346)

			idx = idx + 1
		end
	else
		an.newLabel("��������", 20, 1, {
			color = cc.c3b(240, 200, 150)
		}):anchor(0.5, 0.5):pos(370, 200):add2(activeNode)
	end

	return 
end
horseUpgrade.onListUpgradeSelect = function (self, btn)
	local data = btn.data
	local rightNode = self.contentNode.controls.rightNode
	local lblTitle = self.contentNode.controls.lblTitle
	local lblRarity = self.contentNode.controls.lblRarity
	local image = self.contentNode.controls.image
	local activeNode = self.contentNode.controls.activeNode
	local jobTrend = 1
	local horseLevel = 1

	activeNode.removeAllChildren(activeNode)

	local horseCfg = def.horse:getBaseCfgByID(data.idx)
	local horseData = self.horseInfo:getDataById(data.idx)

	lblTitle.setString(lblTitle, data.Name)
	lblTitle.setColor(lblTitle, def.horse:getRareColor(horseCfg.Rare))
	an.newLabel(string.format("(%s)", def.horse:getHorseRare(horseCfg.Rare)), 20, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):pos(lblTitle.getPositionX(lblTitle) + lblTitle.getw(lblTitle)/2, lblTitle.getPositionY(lblTitle)):add2(activeNode)
	display.newSprite("pic/panels/horseUpgrade/" .. def.horse:getJobPicName(jobTrend)):anchor(0.5, 1):pos(77, 388):add2(activeNode)
	display.newSprite("pic/panels/horseUpgrade/" .. horseCfg.idx .. ".png"):anchor(0.5, 0):pos(142, 162):add2(activeNode)

	return 
end
horseUpgrade.onListQualitySelect = function (self, btn)
	local data = btn.data
	local rightNode = self.contentNode.controls.rightNode
	local lblTitle = self.contentNode.controls.lblTitle
	local lblRarity = self.contentNode.controls.lblRarity
	local image = self.contentNode.controls.image
	local activeNode = self.contentNode.controls.activeNode
	local jobTrend = 1
	local horseLevel = 1

	activeNode.removeAllChildren(activeNode)

	local horseCfg = def.horse:getBaseCfgByID(data.idx)
	local horseData = self.horseInfo:getDataById(data.idx)

	lblTitle.setString(lblTitle, data.Name)
	lblTitle.setColor(lblTitle, def.horse:getRareColor(horseCfg.Rare))
	an.newLabel(string.format("(%s)", def.horse:getHorseRare(horseCfg.Rare)), 20, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):pos(lblTitle.getPositionX(lblTitle) + lblTitle.getw(lblTitle)/2, lblTitle.getPositionY(lblTitle)):add2(activeNode)
	display.newSprite("pic/panels/horseUpgrade/" .. def.horse:getJobPicName(jobTrend)):anchor(0.5, 1):pos(77, 388):add2(activeNode)
	display.newSprite("pic/panels/horseUpgrade/" .. horseCfg.idx .. ".png"):anchor(0.5, 0):pos(142, 162):add2(activeNode)
	an.newLabel(def.horse:getHorseRare(horseCfg.Rare), 20, 1, {
		color = def.horse:getRareColor(horseCfg.Rare)
	}):anchor(0, 0.5):pos(167, 146):add2(activeNode)

	return 
end
horseUpgrade.onListZizhiSelect = function (self, btn)
	local data = btn.data
	local rightNode = self.contentNode.controls.rightNode
	local lblTitle = self.contentNode.controls.lblTitle
	local lblRarity = self.contentNode.controls.lblRarity
	local image = self.contentNode.controls.image
	local activeNode = self.contentNode.controls.activeNode
	local jobTrend = 1
	local horseLevel = 1

	activeNode.removeAllChildren(activeNode)

	local horseCfg = def.horse:getBaseCfgByID(data.idx)
	local horseData = self.horseInfo:getDataById(data.idx)

	lblTitle.setString(lblTitle, data.Name)
	lblTitle.setColor(lblTitle, def.horse:getRareColor(horseCfg.Rare))
	an.newLabel(string.format("(%s)", def.horse:getHorseRare(horseCfg.Rare)), 20, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):pos(lblTitle.getPositionX(lblTitle) + lblTitle.getw(lblTitle)/2, lblTitle.getPositionY(lblTitle)):add2(activeNode)
	display.newSprite("pic/panels/horseUpgrade/" .. def.horse:getJobPicName(jobTrend)):anchor(0.5, 1):pos(77, 388):add2(activeNode)
	display.newSprite("pic/panels/horseUpgrade/" .. horseCfg.idx .. ".png"):anchor(0.5, 0):pos(142, 162):add2(activeNode)

	return 
end
horseUpgrade.onListInheritSelect = function (self, btn)
	return 
end
horseUpgrade.onHorsePreview = function (self)
	local lastBtn = self.contentNode.controls.lastBtn

	if lastBtn and lastBtn.data then
		local horseid = lastBtn.data.idx

		main_scene.ui:togglePanel("horsePreview", horseid)
	end

	return 
end
horseUpgrade.onEatHorse = function (self)
	local lastBtn = self.contentNode.controls.lastBtn

	if lastBtn and lastBtn.data then
		local horseid = lastBtn.data.idx

		main_scene.ui:togglePanel("horseEat", horseid)
	end

	return 
end
horseUpgrade.onShow = function (self)
	local lastBtn = self.contentNode.controls.lastBtn

	if lastBtn and lastBtn.data then
		self.requestShow(self, lastBtn.data.id)
	end

	return 
end
horseUpgrade.requestShow = function (self, id)
	local rsb = DefaultClientMessage(CM_HorseToPlay)
	rsb.FHorseID = id

	MirTcpClient:getInstance():postRsb(rsb)
	main_scene.ui.waiting:show(10, "HORSE_UPGRADE")

	return 
end
horseUpgrade.onSM_HorseToPlay = function (self, result)
	main_scene.ui.waiting:close("HORSE_UPGRADE")

	if not result then
		return 
	end

	if result.FBackValue == 0 then
		self.horseInfo:setCurrentIdent(result.FHorseID)
	else
		return 
	end

	if self.curTab == self.loadHorsePage then
		self.copyPetData(self)
		self.onTabClick(self, self.curIdx)
	end

	return 
end
horseUpgrade.onM_HORSE_LIST_CHG = function (self)
	if self.curTab == self.loadHorsePage then
		self.copyPetData(self)

		local lastBtn = self.contentNode.controls.lastBtn

		if lastBtn then
			self.onTabClick(self, self.curIdx)
		end
	end

	return 
end
horseUpgrade.onHORSE_STATE_CHG = function (self)
	if self.curTab == self.loadHorsePage then
		local lastBtn = self.contentNode.controls.lastBtn

		if self.curTab == self.loadHorsePage and lastBtn then
			self.onListHorseSelect(self, lastBtn)
		end
	end

	return 
end
horseUpgrade.loadHorseSoulPage = function (self)
	self.setTitle(self, "�޻�")
	display.newSprite(res.gettex2("pic/panels/horseSoul/horseSoulBg1.png")):add2(self.contentNode):anchor(0, 0):pos(12, 13)

	self.contentNode.controls.propPanel = display.newScale9Sprite(res.getframe2("pic/scale/scale26.png")):anchor(0, 0):pos(413, 13):size(196, 394):addTo(self.contentNode)

	self.loadItemBox(self, false)

	local texts = {
		{
			"1���������ﵽ2�׶��ҿ��������ﵽ110�죬�ſ����޻�ϵͳ��\n"
		},
		{
			"2�������޻�ȼ������ӽ�ɫѪ���������ԡ�\n"
		},
		{
			"3���޻�ӵ��5���޻�ʯ�ۣ��޻�ʯ�����޻�ȼ����������ο��ţ��޻�ʯ��ֻ����Ƕ��Ӧ������޻�ʯ��\n"
		},
		{
			"4���޻�ʯ�������£�����ʯ/����ʯ/ħ��ʯ/���ʯ/����ʯ��\n"
		},
		{
			"5����Ƕ��ͬ�ȼ����޻�ʯ�����޻�ȼ�Ҳ�в�ͬ��Ҫ��\n"
		},
		{
			"6�����Ľ�ҡ��޻굤���������޻꣬����ֱ�Ӵӱ����۳������ȿ۳��󶨲��ϡ�\n"
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
	}).pos(slot2, 390, 385):addto(self.contentNode)

	self.contentNode.controls.soulTitle = an.newLabel("һ�ס��޻�", 20, 0, {
		color = cc.c3b(220, 210, 190)
	}):anchor(0.5, 0.5):addto(self.contentNode):pos(207, 390)

	an.newBtn(res.gettex2("pic/common/button_search.png"), function (btn)
		sound.playSound("103")
		main_scene.ui:togglePanel("horseSoulPreview", 6)

		return 
	end, {
		select = {
			res.gettex2("pic/common/button_search.png")
		}
	}).add2(slot2, self.contentNode):anchor(0.5, 0.5):pos(308, 162)

	local preViewLabel = an.newLabel("�޻�Ԥ��", 20, 0, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0.5, 0.5):addTo(self.contentNode):pos(365, 165)

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
			main_scene.ui:togglePanel("horseSoulPreview", 6)
		end

		return 
	end)
	an.newBtn(res.gettex2("pic/panels/horseSoul/comSoulStone.png"), function (btn)
		sound.playSound("103")
		main_scene.ui:togglePanel("horseSoulComposition")

		return 
	end, {
		select = {
			res.gettex2("pic/panels/horseSoul/comSoulStone.png")
		}
	}).add2(slot3, self.contentNode):anchor(0.5, 0.5):pos(53, 374)

	local preViewLabel = an.newLabel("�ϳ��޻�ʯ", 16, 0, {
		color = def.colors.Cf0c896
	}):anchor(0.5, 0.5):addTo(self.contentNode):pos(53, 340)

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
			main_scene.ui:togglePanel("horseSoulComposition")
		end

		return 
	end)
	an.newBtn(res.gettex2("pic/panels/horseSoul/horseSoul.png"), function ()
		sound.playSound("103")

		return 
	end, {
		clickSpace = 1,
		pressImage = res.gettex2("pic/panels/horseSoul/horseSoul.png")
	}).add2(slot4, self.contentNode):pos(207, 228)
	an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		sound.playSound("103")
		self:requestUpMonSoul()

		return 
	end, {
		clickSpace = 0.5,
		pressImage = res.gettex2("pic/common/btn21.png"),
		label = {
			"�� ��",
			18,
			0,
			{
				color = def.colors.Cf0c896
			}
		}
	}).add2(slot4, self.contentNode):pos(207, 45)

	self.contentNode.controls.progressNode = display.newNode():addTo(self.contentNode)
	self.contentNode.controls.needItemsNode = display.newNode():addTo(self.contentNode)

	self.updateHorseSoulStone(self)

	local job = g_data.player.job
	self.curSoulData = def.horseSoul.getHorseSoulByLevel(g_data.player.monSoulLevel)

	if self.curSoulData then
		self.curSoulProps = def.property.dumpPropertyStr(self.curSoulData.PropertyStr):clearZero():toStdProp():grepJob(job)
	end

	self.nextSoulData = def.horseSoul.getHorseSoulByLevel(g_data.player.monSoulLevel + 1)

	if self.nextSoulData then
		self.nextSoulProps = def.property.dumpPropertyStr(self.nextSoulData.PropertyStr):clearZero():toStdProp():grepJob(job)
	end

	self.updateSoulPanel(self)
	self.requestMonSoulInfo(self)

	return 
end
horseUpgrade.showBag = function (self)
	if main_scene.ui.panels then
		if main_scene.ui.panels.bag then
			local w = self.getw(self)

			main_scene.ui.panels.bag:pos(display.width, display.cy):anchor(1, 0.5)
		else
			main_scene.ui:togglePanel("bag")
			main_scene.ui.panels.bag:pos(display.width, display.cy):anchor(1, 0.5)
		end
	end

	return 
end
horseUpgrade.loadItemBox = function (self)
	for k, v in pairs(self.items) do
		v.removeSelf(v)
	end

	self.items = {}

	for i = 1, self.max, 1 do
		local itembg = an.newBtn(res.gettex2("pic/panels/horseSoul/hole" .. i .. ".png"), function ()
			sound.playSound("103")

			local canInlayData = def.horseSoul.getCanInlayDataByPos(i)

			if canInlayData and canInlayData.NeedMonSoulLv <= g_data.player.monSoulLevel and not self.items[i] then
				main_scene.ui:tip("�òۿ���Ƕ��" .. canInlayData.CanInlayStone, 6)
				self:showBag()
			end

			return 
		end, {
			pressImage = res.gettex2("pic/panels/horseSoul/hole" .. slot4 .. ".png")
		}):add2(self.contentNode):pos(self.idx2pos(self, i))
		local lock = res.get2("pic/panels/horseSoul/lock.png"):addTo(itembg):pos(itembg.getw(itembg)/2, itembg.geth(itembg)/2)
		self.items[#self.items + 1] = lock
	end

	return 
end
horseUpgrade.idx2pos = function (self, idx)
	if idx == 1 then
		return 77, 217
	elseif idx == 2 then
		return 110, 301
	elseif idx == 3 then
		return 209, 332
	elseif idx == 4 then
		return 307, 301
	elseif idx == 5 then
		return 338, 217
	end

	return self.getw(self)/2, self.geth(self)/2
end
horseUpgrade.updateSoulPanel = function (self)
	local soulTitle = self.contentNode.controls.soulTitle

	if soulTitle then
		local levelstr = string.split(def.horseSoul.level2str(g_data.player.monSoulLevel), "��")

		soulTitle.setText(soulTitle, levelstr[1] .. "�ס��޻�")
	end

	self.updateHorseSoulProgress(self)
	self.updateNeedItems(self)
	self.updatePropPanel(self)
	self.updateHorseSoulStone(self)

	return 
end
horseUpgrade.updateHorseSoulStone = function (self)
	for k, v in pairs(self.items) do
		v.removeSelf(v)
	end

	self.items = {}
	local stoneItemData = def.horseSoul.getUsedHorseSoulStoneItems(g_data.equip.items)

	for i = 1, self.max, 1 do
		local canInlayData = def.horseSoul.getCanInlayDataByPos(i)

		if g_data.player.monSoulLevel < canInlayData.NeedMonSoulLv then
			local lock = an.newBtn(res.gettex2("pic/panels/horseSoul/lock.png"), function ()
				sound.playSound("103")

				local text = {}

				table.insert(text, {
					canInlayData.CanInlayStone .. "�ۣ�",
					cc.c3b(255, 255, 0)
				})
				table.insert(text, {
					"*���޻�ȼ���" .. def.horseSoul.level2str(canInlayData.NeedMonSoulLv),
					display.COLOR_WHITE
				})
				table.insert(text, {
					"*����Ƕ��" .. canInlayData.CanInlayStone,
					display.COLOR_WHITE
				})
				tip.show(text, self.contentNode:convertToWorldSpace(cc.p(self:idx2pos(i))), {})

				return 
			end, {
				clickSpace = 1,
				pressImage = res.gettex2("pic/panels/horseSoul/lock.png")
			}).add2(slot7, self.contentNode):pos(self.idx2pos(self, i))
			self.items[i] = lock
		end
	end

	for k, v in pairs(stoneItemData) do
		if self.items[k - 20] then
			self.items[k - 20]:removeSelf()
		end

		self.items[k - 20] = CommonItem.new(v, self, {
			scroll = true,
			donotMove = false,
			idx = k
		}):add2(self.contentNode, 2):pos(self.idx2pos(self, k - 20))
	end

	return 
end
horseUpgrade.updateHorseSoulProgress = function (self)
	local progressNode = self.contentNode.controls.progressNode

	if progressNode then
		progressNode.removeAllChildren(progressNode)
	end

	local showCount = g_data.player.monSoulLevel%10

	if showCount == 0 and 0 < g_data.player.monSoulLevel then
		showCount = 10
	end

	for i = 1, 10, 1 do
		local star = an.newBtn(res.gettex2("pic/panels/wingUpgrade/starBg.png"), function ()
			sound.playSound("103")

			return 
		end, {
			select = {
				res.gettex2("pic/panels/wingUpgrade/star.png")
			}
		}).add2(slot7, progressNode):anchor(0.5, 0.5):pos(i*24 + 80, 132)

		star.setTouchEnabled(star, false)

		if i <= showCount then
			star.select(star)
		end
	end

	if not self.nextSoulData then
		local progress = an.newProgress(res.gettex2("pic/common/slider2.png"), res.gettex2("pic/common/sliderBg2.png"), {
			x = 3,
			y = 5
		}):anchor(0.5, 0.5):pos(213, 110):add2(progressNode)
		local progressLabel = an.newLabel("0/0", 18, 1, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0.5, 0.5):addTo(progress, 2):pos(progress.getw(progress)/2, progress.geth(progress)/2 + 2)

		progress.setp(progress, 1)

		return 
	end

	local progress = an.newProgress(res.gettex2("pic/common/slider2.png"), res.gettex2("pic/common/sliderBg2.png"), {
		x = 3,
		y = 5
	}):anchor(0.5, 0.5):pos(213, 110):add2(progressNode)
	local progressLabel = an.newLabel(self.haveStuff .. "/" .. self.nextSoulData.UpNeedSoulDan, 18, 1, {
		color = cc.c3b(220, 210, 190)
	}):anchor(0.5, 0.5):addTo(progress, 2):pos(progress.getw(progress)/2, progress.geth(progress)/2 + 2)
	local p = self.haveStuff/self.nextSoulData.UpNeedSoulDan

	if 1 < p then
		p = 1
	end

	if p < 0 then
		p = 0
	end

	progress.setp(progress, p)

	return 
end
horseUpgrade.updateNeedItems = function (self)
	local needItemsNode = self.contentNode.controls.needItemsNode

	if needItemsNode then
		needItemsNode.removeAllChildren(needItemsNode)
	end

	if not self.nextSoulData then
		return 
	end

	an.newLabel("���ģ�", 18, 0, {
		color = cc.c3b(220, 210, 190)
	}):anchor(0.5, 0.5):addTo(needItemsNode, 2):pos(120, 85)

	local itemIdx = def.items.getItemIdByName("�޻굤")
	local needItem = CommonItem.new(def.items.getStdItemById(itemIdx), self, {
		donotMove = true,
		idx = idx
	}):add2(needItemsNode, 2):anchor(0, 0.5):pos(160, 85):scale(0.55)

	if needItem.dura then
		needItem.dura:removeSelf()

		needItem.dura = nil
	end

	an.newLabel("*" .. self.nextSoulData.UpNeedSoulDan, 18, 0, {
		color = cc.c3b(220, 210, 190)
	}):anchor(0, 0.5):addTo(needItemsNode, 2):pos(175, 85)
	an.newLabel("��ң�" .. math.floor(self.nextSoulData.UpNeedJB/10000) .. "��", 18, 0, {
		color = cc.c3b(220, 210, 190)
	}):anchor(0, 0.5):addTo(needItemsNode, 2):pos(235, 85)

	return 
end
horseUpgrade.updatePropPanel = function (self)
	local propPanel = self.contentNode.controls.propPanel

	if propPanel then
		propPanel.removeAllChildren(propPanel)
	end

	local rect = cc.rect(0, 0, 198, 390)
	local scroll = an.newScroll(0, 2, rect.width, rect.height):addto(propPanel)
	local rollbg = display.newScale9Sprite(res.getframe2("pic/scale/scale9.png"), 198, 0, cc.size(20, 394)):addTo(propPanel):anchor(0, 0)
	local rollCeil = res.get2("pic/common/scrollShow.png"):anchor(0.5, 0):pos(rollbg.getw(rollbg)*0.5, rollbg.geth(rollbg) - 42):add2(rollbg)

	scroll.setListenner(scroll, function (event)
		if event.name == "moved" then
			local x, y = scroll:getScrollOffset()
			local maxOffset = scroll:getScrollSize().height - scroll:geth()

			if y < 0 then
				y = 0
			end

			if maxOffset < y then
				y = maxOffset or y
			end

			rollCeil:setPositionY((rollbg:geth() - 42)*(y/maxOffset - 1))
		end

		return 
	end)

	local propTypes = {
		{
			"�޻�ʯ����",
			"ssssx.png"
		},
		{
			"�޻굱ǰ����",
			"sh_dqsx.png"
		},
		{
			"�޻��¼�����",
			"sh_xjsh.png"
		}
	}
	local scrollH = self.getPropHeight(slot0, "�޻�ʯ����") + self.getPropHeight(self, "�޻굱ǰ����") + self.getPropHeight(self, "�޻��¼�����") + 90

	scroll.setScrollSize(scroll, rect.width, math.max(rect.height + 1, scrollH))

	local posY = math.max(rect.height + 1, scrollH - 5)

	for k, v in ipairs(propTypes) do
		local type = v[1]
		local texName = v[2]

		display.newSprite(res.gettex2("pic/panels/wingUpgrade/flag.png")):add2(scroll):anchor(0, 1):pos(5, posY - 3)
		display.newSprite(res.gettex2("pic/panels/horseSoul/" .. texName)):add2(scroll):anchor(0, 1):pos(22, posY)

		posY = posY - 25
		local propHeight = self.getPropHeight(self, type)
		local propBg = display.newScale9Sprite(res.getframe2("pic/scale/scale29.png")):anchor(0, 1):pos(4, posY):size(188, propHeight):addTo(scroll)
		posY = posY - propHeight - 5

		self.addPropTexts(self, propBg, v[1])
	end

	return 
end
horseUpgrade.addPropTexts = function (self, parentNode, propType)
	local texts = {}

	if propType == "�޻�ʯ����" then
		local stonePropStr = def.horseSoul.getUsedSoulStoneProps(g_data.equip.items)
		local job = g_data.player.job
		local props = def.property.dumpPropertyStr(stonePropStr):clearZero():toStdProp()

		for i, v in ipairs(props.props) do
			local p = props.formatPropString(props, v[1], "%s:+%s", "%s:%s-%s")

			table.insert(texts, p)
		end
	elseif propType == "�޻굱ǰ����" then
		if self.curSoulData then
			for k, v in ipairs(self.curSoulProps.props) do
				local p = self.curSoulProps:formatPropString(v[1], "%s:+%s", "%s:%s-%s")
				texts[#texts + 1] = p
			end
		else
			texts = {}
		end
	elseif propType == "�޻��¼�����" then
		if self.nextSoulData then
			local curNeedLevel = 0
			local curNeedStep = 0
			local curNeedDay = 0

			if self.curSoulData then
				curNeedLevel = self.curSoulData.UpNeedPlayerLevel
				curNeedStep = self.curSoulData.UpNeedServerStep
				curNeedDay = self.curSoulData.UpNeedOpenDays
			end

			local nextNeedLevel = self.nextSoulData.UpNeedPlayerLevel
			local nextNeedStep = self.nextSoulData.UpNeedServerStep
			local nextNeedDay = self.nextSoulData.UpNeedOpenDays

			if 0 < nextNeedLevel and nextNeedLevel ~= curNeedLevel then
				texts[#texts + 1] = "��Ҫ�ȼ�:" .. common.getLevelText(nextNeedLevel)
			end

			if 0 < nextNeedStep and nextNeedStep ~= curNeedStep then
				texts[#texts + 1] = "��Ҫ�������׶�:" .. nextNeedStep .. "�׶�"
			end

			if 0 < nextNeedDay and nextNeedDay ~= curNeedDay then
				texts[#texts + 1] = "��Ҫ��������:" .. nextNeedDay .. "��"
			end

			for k, v in ipairs(self.nextSoulProps.props) do
				local p = self.nextSoulProps:formatPropString(v[1], "%s:+%s", "%s:%s-%s")
				texts[#texts + 1] = p
			end
		else
			texts = {}
		end
	end

	for k, v in ipairs(texts) do
		local strs = string.split(v, ":")

		if #strs == 2 then
			local label1 = an.newLabel(strs[1] .. ":", 16, 0, {
				color = def.colors.Cf0c896
			}):anchor(0, 1):addTo(parentNode):pos(10, (parentNode.geth(parentNode) - k*25 + 25) - 5)
			slot11 = an.newLabel(strs[2], 16, 0, {
				color = cc.c3b(220, 210, 190)
			}):anchor(0, 1):addTo(parentNode):pos(label1.getw(label1) + 15, (parentNode.geth(parentNode) - k*25 + 25) - 5)
		end
	end

	if #texts == 0 then
		slot4 = an.newLabel("��", 16, 0, {
			color = def.colors.Cf0c896
		}):anchor(0, 1):addTo(parentNode):pos(10, parentNode.geth(parentNode) - 5)
	end

	return 
end
horseUpgrade.getPropHeight = function (self, propType)
	local job = g_data.player.job
	local hight = 0

	if propType == "�޻�ʯ����" then
		local stonePropStr = def.horseSoul.getUsedSoulStoneProps(g_data.equip.items)
		local props = def.property.dumpPropertyStr(stonePropStr):clearZero():toStdProp()
		hight = #props.props*25
	elseif propType == "�޻굱ǰ����" then
		if self.curSoulProps then
			hight = #self.curSoulProps.props*25
		end
	elseif propType == "�޻��¼�����" and self.nextSoulProps then
		hight = #self.nextSoulProps.props*25
		local curNeedLevel = 0
		local curNeedStep = 0
		local curNeedDay = 0

		if self.curSoulData then
			curNeedLevel = self.curSoulData.UpNeedPlayerLevel
			curNeedStep = self.curSoulData.UpNeedServerStep
			curNeedDay = self.curSoulData.UpNeedOpenDays
		end

		local nextNeedLevel = self.nextSoulData.UpNeedPlayerLevel
		local nextNeedStep = self.nextSoulData.UpNeedServerStep
		local nextNeedDay = self.nextSoulData.UpNeedOpenDays

		if 0 < nextNeedLevel and nextNeedLevel ~= curNeedLevel then
			hight = hight + 25
		end

		if 0 < nextNeedStep and nextNeedStep ~= curNeedStep then
			hight = hight + 25
		end

		if 0 < nextNeedDay and nextNeedDay ~= curNeedDay then
			hight = hight + 25
		end
	end

	if 0 < hight then
		return math.max(100, hight + 10)
	else
		return 100
	end

	return 
end
horseUpgrade.putItem = function (self, item, x, y)
	local form = item.formPanel.__cname
	local target = nil

	for i = 1, self.max, 1 do
		local tmpX, tmpY = self.idx2pos(self, i)

		if (tmpX - x)*(tmpX - x) < 900 and (tmpY - y)*(tmpY - y) < 900 then
			target = i
		end
	end

	if not target then
		return 
	end

	if form == "bag" then
		local canInlayData = def.horseSoul.getCanInlayDataByPos(target)

		if canInlayData and g_data.player.monSoulLevel < canInlayData.NeedMonSoulLv then
			main_scene.ui:tip("���޻�ʯ��δ����", 6)

			return 
		end

		local data = item.data

		if data.getVar(data, "stdMode") ~= 37 then
			main_scene.ui:tip("���������������޻�ʯ", 6)

			return 
		end

		local name = data.getVar(data, "name")

		if canInlayData and not string.find(name, canInlayData.CanInlayStone) then
			main_scene.ui:tip("��λ��ֻ����Ƕ" .. canInlayData.CanInlayStone, 6)

			return 
		end

		item.use(item, target + 20)
	end

	return 
end
horseUpgrade.delItem = function (self, itemIndex)
	for i, v in pairs(self.items) do
		if v and v.data and v.data.FItemIdent == itemIndex then
			v.removeSelf(v)

			self.items[i] = nil

			break
		end
	end

	return 
end
horseUpgrade.onITEM_USE = function (self, data)
	if self.curTab == self.loadHorseSoulPage and data and data._item.stdMode == 37 then
		self.updateHorseSoulStone(self)
		self.updatePropPanel(self)
	end

	return 
end
horseUpgrade.onM_BAGITEM_CHG = function (self)
	if self.curTab == self.loadHorseSoulPage then
		self.updateHorseSoulStone(self)
		self.updatePropPanel(self)
	end

	return 
end
horseUpgrade.requestMonSoulInfo = function (self)
	local rsb = DefaultClientMessage(CM_QuaryMonSoulInfo)

	MirTcpClient:getInstance():postRsb(rsb)
	main_scene.ui.waiting:show(10, "CM_QuaryMonSoulInfo")

	return 
end
horseUpgrade.requestUpMonSoul = function (self)
	local rsb = DefaultClientMessage(CM_UpMonSoul)

	MirTcpClient:getInstance():postRsb(rsb)
	main_scene.ui.waiting:show(10, "CM_UpMonSoul")

	return 
end
horseUpgrade.onSM_QuaryMonSoulInfo = function (self, result)
	main_scene.ui.waiting:close("CM_QuaryMonSoulInfo")

	if not result then
		return 
	end

	g_data.player.monSoulLevel = result.FMonSoulLevel
	self.haveStuff = result.FMonSoulHaveStuff

	if self.curTab == self.loadHorseSoulPage then
		self.updateSoulPanel(self)
	end

	return 
end
horseUpgrade.onSM_UpMonSoul = function (self, result)
	main_scene.ui.waiting:close("CM_UpMonSoul")

	if not result then
		return 
	end

	local msg = {
		[-6.0] = "��Ҳ���",
		[-1.0] = "��ǰ�޻�ȼ��ﵽ���",
		[-4.0] = "��������δ�ﵽ",
		[-7.0] = "��ҿ۳�ʧ��",
		[-3.0] = "�������׶�δ�ﵽ",
		[-5.0] = "�޻굤����",
		[-2.0] = "��ɫ�ȼ�δ�ﵽ",
		[-8.0] = "�޻굤�۳�ʧ��"
	}
	g_data.player.monSoulLevel = result.FMonSoulLevel
	self.haveStuff = result.FMonSoulHaveStuff
	local job = g_data.player.job
	self.curSoulData = def.horseSoul.getHorseSoulByLevel(g_data.player.monSoulLevel)

	if self.curSoulData then
		self.curSoulProps = def.property.dumpPropertyStr(self.curSoulData.PropertyStr):clearZero():toStdProp():grepJob(job)
	else
		self.curSoulProps = nil
	end

	self.nextSoulData = def.horseSoul.getHorseSoulByLevel(g_data.player.monSoulLevel + 1)

	if self.nextSoulData then
		self.nextSoulProps = def.property.dumpPropertyStr(self.nextSoulData.PropertyStr):clearZero():toStdProp():grepJob(job)
	else
		self.nextSoulProps = nil
	end

	if self.curTab == self.loadHorseSoulPage then
		self.updateSoulPanel(self)
	end

	return 
end

return horseUpgrade
