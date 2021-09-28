local pointTip = import("..common.pointTip")
local redPacket = class("redPacket", function ()
	return display.newNode()
end)

table.merge(slot1, {
	openingRPID = 0,
	inputRPNum = 0,
	inputYBNum = 0,
	receiveRPPlayerName = "",
	openingRPIndex = 0,
	sendYBNum = 1,
	numGuildPlayer = 0,
	queryingRPID = 0,
	currentBlessing = "",
	receiverExist = false,
	selectedBtnIndex = 0,
	infoRP = {},
	bgReceivedRP = {}
})

redPacket.ctor = function (self, btnPageIndex)
	self._supportMove = true
	self.bg = display.newSprite(res.gettex2("pic/common/black_2.png")):anchor(0, 0):addTo(self)

	self.size(self, self.bg:getw(), self.bg:geth()):anchor(0.5, 0.5):center()
	display.newScale9Sprite(res.getframe2("pic/common/black_5.png"), 0, 0, cc.size(127, 387)):addTo(self.bg):pos(12, 405):anchor(0, 1)

	self.rightFrame = display.newScale9Sprite(res.getframe2("pic/common/black_5.png"), 0, 0, cc.size(486, 387)):addTo(self.bg):pos(146, 405):anchor(0, 1)

	an.newLabel("���", 20, 0, {
		color = def.colors.labelTitle
	}):anchor(0.5, 0.5):pos(self.bg:getw()/2, self.bg:geth() - 23):addTo(self.bg)
	an.newBtn(res.gettex2("pic/common/close10.png"), function ()
		sound.playSound("103")
		self:hidePanel()

		return 
	end, {
		pressImage = res.gettex2("pic/common/close11.png"),
		size = cc.size(64, 64)
	}).anchor(slot2, 1, 1):pos(self.getw(self) - 9, self.geth(self) - 9):addTo(self)

	local function helpBtnCB()
		sound.playSound("103")

		local texts = {
			{
				"1.�ȼ��ﵽ"
			},
			{
				"30���Ľ�ɫ",
				display.COLOR_RED
			},
			{
				"���Է��ź�������ź����Ԫ���ܽ�����Ϊ"
			},
			{
				"����",
				display.COLOR_RED
			},
			{
				"��\n2.�����л�����ȫ��������������������Сֵ�������"
			},
			{
				"0.05Ԫ��",
				display.COLOR_RED
			},
			{
				"��\n3.�����л������������������ڵ���"
			},
			{
				"2",
				display.COLOR_RED
			},
			{
				"С�ڵ���"
			},
			{
				"99",
				display.COLOR_RED
			},
			{
				"��������ȫ��������������������ڵ���"
			},
			{
				"10",
				display.COLOR_RED
			},
			{
				"С�ڵ���"
			},
			{
				"99",
				display.COLOR_RED
			},
			{
				"�����ҷ���Ԫ���ܽ�������ڵ���"
			},
			{
				"10Ԫ��",
				display.COLOR_RED
			},
			{
				"��\n4.�������"
			},
			{
				"24",
				display.COLOR_RED
			},
			{
				"Сʱ��δ����ȡ�Ĳ��ֻ����ʼ�����ʽȫ��������\n5."
			},
			{
				"ͬ�л�",
				display.COLOR_RED
			},
			{
				"�Ľ�ɫ�ſ��Կ����л�������ɫ�ȼ��ﵽ"
			},
			{
				"40��",
				display.COLOR_RED
			},
			{
				"����"
			},
			{
				"��֤���÷�",
				display.COLOR_RED
			},
			{
				"�Ľ�ɫ�ſ��Կ���ȫ�������\n6.��ͬ���ÿ����ɫֻ�ܿ���"
			},
			{
				"1",
				display.COLOR_RED
			},
			{
				"�Ρ�\n7.����������Ԫ��ʱ����Ҫ����"
			},
			{
				"3%",
				display.COLOR_RED
			},
			{
				"��Ԫ�����˰�����ȿ۳������������ٿ۳�"
			},
			{
				"0.01Ԫ��",
				display.COLOR_RED
			},
			{
				"��\n8.�ѷ��ź����������Ϊ"
			},
			{
				"50��",
				display.COLOR_RED
			},
			{
				"�����ź���ﵽ���޺���ȵ��ѷ��͵ĺ������ȡ���˻زſ��Լ������š�"
			}
		}
		local msgbox = an.newMsgbox(texts)

		return 
	end

	an.newBtn(res.gettex2("pic/common/question.png"), slot2, {
		pressBig = true,
		pressImage = res.gettex2("pic/common/question.png")
	}):pos(118, 38):addTo(self.bg)

	local btnPageNames = {
		"getRP",
		"sendGuildRP",
		"sendPersonalRP",
		"sendInServerRP",
		"alreadySendedRP"
	}
	local btnLabelNames = {
		"��ȡ���",
		"���л���",
		"�����˺��",
		"��ȫ�����",
		"�ѷ��ͺ��"
	}
	self.pageBtns = {}

	local function btnPageCB(btn)
		sound.playSound("103")

		for i, v in ipairs(self.pageBtns) do
			if v == btn then
				v.select(v)
			else
				v.unselect(v)
			end
		end

		if btn.btnIndex ~= self.selectedBtnIndex then
			self.selectedBtnIndex = btn.btnIndex

			self:showPageInfo(self.selectedBtnIndex)
		end

		return 
	end

	for i, v in ipairs(slot3) do
		self.pageBtns[i] = an.newBtn(res.gettex2("pic/common/btn60.png"), btnPageCB, {
			clickSpace = 2,
			label = {
				btnLabelNames[i],
				20,
				0,
				{
					color = def.colors.Cf0c896
				}
			},
			select = {
				res.gettex2("pic/common/btn61.png"),
				manual = true
			}
		}):add2(self.bg):anchor(0, 0.5):pos(22, (i - 1)*54 - 370)
		self.pageBtns[i].btnIndex = i
	end

	if btnPageIndex == nil then
		btnPageCB(self.pageBtns[1])
	else
		btnPageCB(self.pageBtns[btnPageIndex])
	end

	self.bindMsg(self)
	g_data.eventDispatcher:addListener("M_POINTTIP", self, self.onPointTip)
	self.setTabPointTip(self, self.pageBtns[1], g_data.pointTip:isVisible("redPacket"))

	return 
end
redPacket.onPointTip = function (self, type, visible)
	if type ~= "redPacket" then
		return 
	end

	local tab = self.pageBtns[1]

	if tab then
		self.setTabPointTip(self, tab, visible)
	end

	return 
end
redPacket.setTabPointTip = function (self, btn, visible)
	local tip = btn.getChildByName(btn, "tip")

	if not visible then
		if tip then
			tip.removeFromParent(tip)
		end

		return 
	end

	if not tip then
		tip = pointTip.attach(btn, {
			type = 1,
			visible = true,
			dir = "right",
			custom = true,
			pos = cc.p(106, 41)
		})

		tip.setName(tip, "tip")
	end

	return 
end
redPacket.setPacketPointTip = function (self, btn, visible)
	local tip = btn.getChildByName(btn, "tip")

	if not visible then
		if tip then
			tip.removeFromParent(tip)
		end

		return 
	end

	if not tip then
		tip = pointTip.attach(btn, {
			dir = "right",
			type = 1
		})

		tip.setName(tip, "tip")
	end

	return 
end
redPacket.bindMsg = function (self)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_CashGiftCreate, self, self.onSM_CashGiftCreate)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_CashGiftListAll, self, self.onSM_CashGiftListAll)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_CashGiftListMine, self, self.onSM_CashGiftListMine)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_GildInfo, self, self.onSM_GildInfo)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_GildList, self, self.onSM_GildList)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_CashGiftQuery, self, self.onSM_CashGiftQuery)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_CashGiftOpen, self, self.onSM_CashGiftOpen)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_CashGiftDetail, self, self.onSM_CashGiftDetail)

	return 
end
redPacket.onSM_CashGiftCreate = function (self, result, protoId)
	local sendRPErrTexts = {
		"���ϵͳδ��ʼ����ϣ�������ʹ��",
		[-6.0] = "ȫ��������Ÿ������󣬷���ʧ��",
		[-13.0] = "���ͺ�������Ѵ�50������ʧ��",
		[-1.0] = "�ܽ��Ϊ0������ʧ��",
		[-7.0] = "ȫ����������ܽ����󣬷���ʧ��",
		[-3.0] = "�������� ������ʧ��",
		[-8.0] = "�������������0.05������ʧ��",
		[-9.0] = "������������󣬷���ʧ��",
		[-10.0] = "����������󣬷���ʧ��",
		[-4.0] = "û���л� ������ʧ��",
		[-11.0] = "�ۿ�����󣬷���ʧ��",
		[-12.0] = "���˺�����ܷ����Լ�������ʧ��",
		[-5.0] = "�л������Ÿ������󣬷���ʧ��",
		[-2.0] = "��ɫԪ�����㣬����ʧ��",
		[-14.0] = "���͹���Ƶ��������ʧ��"
	}

	if result.Fretcode == 0 then
		main_scene.ui:tip("���ͳɹ�")
	else
		return 
	end

	return 
end
redPacket.onSM_CashGiftOpen = function (self, result, protoId)
	main_scene.ui.waiting:close("VISITRP")
	print("*** �յ��򿪺������ *** ")
	main_scene.ui.waiting:close("GETRP")

	if result.Fretcode == 0 then
		local giftType = 0
		local ownerName = ""
		local sendWord = ""
		local getCount = #result.Fuserlist
		local allowCount = 0
		local labelSelecting = nil
		local cashType = 0
		local bgReceivedRP = nil

		for k, v in ipairs(self.infoRP) do
			if self.infoRP[k].RPID == self.openingRPID then
				giftType = self.infoRP[k].giftType
				ownerName = self.infoRP[k].ownerName
				sendWord = self.infoRP[k].sendWord
				allowCount = self.infoRP[k].allowCount
				labelSelecting = self.infoRP[k].labelSelecting
				cashType = self.infoRP[k].cashType
				bgReceivedRP = self.infoRP[k].bgReceivedRP
				self.openingRPIndex = k
			end
		end

		if labelSelecting == nil then
			main_scene.ui:tip("δ֪����23")
		end

		self.infoRP[self.openingRPIndex].geted = true
		local nodeRPInfo = display.newNode():size(display.width, display.height):enableClick(function ()
			return 
		end).add2(slot11, main_scene.ui, an.z.max)
		local infoBg = nil
		local titleStr = ""

		if giftType == 1 then
			infoBg = res.get2("pic/panels/redPacket/Scale9BgReceiveRP.png"):addTo(nodeRPInfo):anchor(0, 0)
			titleStr = ownerName .. "�ĺ��"

			labelSelecting.setString(labelSelecting, "����ȡ")
		else
			infoBg = res.get2("pic/panels/redPacket/bgRPLong.png"):addTo(nodeRPInfo):anchor(0, 0)
			titleStr = (cashType == 1 and ownerName .. "����ͨ���") or ownerName .. "��������"
			local lblStr = "����ȡ��" .. tostring(getCount) .. "/" .. tostring(allowCount)

			an.newLabel(lblStr, 20, 0, {
				color = def.colors.labelYellow
			}):pos(infoBg.getw(infoBg)/2, 285):addTo(infoBg):anchor(0.5, 0.5)

			local scrollReceivedInfo = an.newScroll(0, 70, 284, 200):addTo(infoBg)

			for k, v in ipairs(result.Fuserlist) do
				local bgCell = display.newScale9Sprite(res.getframe2("pic/panels/redPacket/BgNumYB.png"), 0, 0, cc.size(265, 25)):pos(16, scrollReceivedInfo.geth(scrollReceivedInfo) - (k - 1)*33):addTo(scrollReceivedInfo):anchor(0, 1)

				an.newLabel(result.Fuserlist[k].Fownername, 20, 0, {
					color = def.colors.labelYellow
				}):pos(20, 0):addTo(bgCell):anchor(0, 0)
				an.newLabel(string.format("%.2f", result.Fuserlist[k].Fcash/100), 20, 0, {
					color = def.colors.labelYellow
				}):pos(155, 0):addTo(bgCell):anchor(0, 0)
				res.get2("pic/console/infobar/yb.png"):anchor(0, 0):pos(215, 0):addTo(bgCell)
			end

			if labelSelecting then
				labelSelecting.setString(labelSelecting, "���죺" .. tostring(getCount) .. "/" .. tostring(allowCount))
			end
		end

		self.setPacketPointTip(self, bgReceivedRP, false)

		self.unreadCount = self.unreadCount - 1
		local size = infoBg.getContentSize(infoBg)

		infoBg.pos(infoBg, display.width/2 - math.floor(size.width/2), display.height/2 - math.floor(size.height/2))
		an.newLabel(titleStr, 20, 0, {
			color = def.colors.C500605
		}):pos(infoBg.getw(infoBg)/2, infoBg.geth(infoBg) - 85):addTo(infoBg):anchor(0.5, 0.5)
		an.newLabel(sendWord, 22, 0):pos(infoBg.getw(infoBg)/2, infoBg.geth(infoBg) - 120):addTo(infoBg):anchor(0.5, 0.5)

		local bgYB = display.newScale9Sprite(res.getframe2("pic/panels/redPacket/BgNumYB.png"), 0, 0, cc.size(113, 25)):pos(180, infoBg.geth(infoBg) - 160):addTo(infoBg)

		res.get2("pic/console/infobar/yb.png"):anchor(0, 0):pos(0, 0):addTo(bgYB)
		an.newLabel("��ã�", 20, 0, {
			color = def.colors.labelYellow
		}):pos(-34, 13):addTo(bgYB):anchor(0.5, 0.5)
		an.newLabel(string.format("%.2f", result.Fcashget/100), 20, 0, {
			color = def.colors.labelYellow
		}):pos(70, 15):addTo(bgYB):anchor(0.5, 0.5)
		an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
			sound.playSound("103")
			nodeRPInfo:removeSelf()

			return 
		end, {
			pressImage = res.gettex2("pic/common/btn21.png"),
			label = {
				"ȷ��",
				18,
				0,
				{
					color = def.colors.Cf0c896
				}
			}
		}).add2(slot16, infoBg):anchor(0.5, 0.5):pos(infoBg.getw(infoBg)/2, 40)
		self.sortRP(self)
	else
		main_scene.ui:tip("��ȡʧ��")
	end

	if self.unreadCount == 0 then
		g_data.pointTip:set("redPacket", false)
	end

	return 
end
redPacket.onSM_CashGiftDetail = function (self, result, protoId)
	main_scene.ui.waiting:close("VISITRP")

	if result.Fgeted == false then
		return 
	end

	local giftType = 0
	local cashType = 0
	local ownerName = ""
	local sendWord = ""
	local allowCount = 0
	local getCount = result.Fgetcount
	local allowCount = 0
	local labelSelecting = nil

	for k, v in ipairs(self.infoRP) do
		if self.infoRP[k].RPID == self.queryingRPID then
			giftType = self.infoRP[k].giftType
			ownerName = self.infoRP[k].ownerName
			sendWord = self.infoRP[k].sendWord
			allowCount = self.infoRP[k].allowCount
			cashType = self.infoRP[k].cashType
			labelSelecting = self.infoRP[k].labelSelecting
		end
	end

	if labelSelecting == nil then
		main_scene.ui:tip("δ֪����24")
	end

	local nodeRPInfo = display.newNode():size(display.width, display.height):enableClick(function ()
		return 
	end).add2(slot11, main_scene.ui, an.z.max)
	local infoBg = nil
	local titleStr = ""

	if giftType == 1 then
		infoBg = res.get2("pic/panels/redPacket/Scale9BgReceiveRP.png"):addTo(nodeRPInfo):anchor(0, 0)
		titleStr = ownerName .. "�ĺ��"
	else
		infoBg = res.get2("pic/panels/redPacket/bgRPLong.png"):addTo(nodeRPInfo):anchor(0, 0)
		titleStr = (cashType == 1 and ownerName .. "����ͨ���") or ownerName .. "��������"
		local lblStr = "����ȡ��" .. tostring(getCount) .. "/" .. tostring(allowCount)

		an.newLabel(lblStr, 20, 0, {
			color = def.colors.labelYellow
		}):pos(infoBg.getw(infoBg)/2, 285):addTo(infoBg):anchor(0.5, 0.5)

		local scrollReceivedInfo = an.newScroll(0, 70, 284, 200):addTo(infoBg)

		for k, v in ipairs(result.Fuserlist) do
			local bgCell = display.newScale9Sprite(res.getframe2("pic/panels/redPacket/BgNumYB.png"), 0, 0, cc.size(265, 25)):pos(16, scrollReceivedInfo.geth(scrollReceivedInfo) - (k - 1)*33):addTo(scrollReceivedInfo):anchor(0, 1)

			an.newLabel(result.Fuserlist[k].Fownername, 20, 0, {
				color = def.colors.labelYellow
			}):pos(20, 0):addTo(bgCell):anchor(0, 0)
			an.newLabel(string.format("%.2f", result.Fuserlist[k].Fcash/100), 20, 0, {
				color = def.colors.labelYellow
			}):pos(155, 0):addTo(bgCell):anchor(0, 0)
			res.get2("pic/console/infobar/yb.png"):anchor(0, 0):pos(215, 0):addTo(bgCell)
		end

		if labelSelecting then
			labelSelecting.setString(labelSelecting, "���죺" .. tostring(getCount) .. "/" .. tostring(allowCount))
		end
	end

	local size = infoBg.getContentSize(infoBg)

	infoBg.pos(infoBg, display.width/2 - math.floor(size.width/2), display.height/2 - math.floor(size.height/2))
	an.newLabel(titleStr, 20, 0, {
		color = def.colors.C500605
	}):pos(infoBg.getw(infoBg)/2, infoBg.geth(infoBg) - 85):addTo(infoBg):anchor(0.5, 0.5)
	an.newLabel(sendWord, 22, 0):pos(infoBg.getw(infoBg)/2, infoBg.geth(infoBg) - 120):addTo(infoBg):anchor(0.5, 0.5)

	local bgYB = display.newScale9Sprite(res.getframe2("pic/panels/redPacket/BgNumYB.png"), 0, 0, cc.size(113, 25)):pos(180, infoBg.geth(infoBg) - 160):addTo(infoBg)

	res.get2("pic/console/infobar/yb.png"):anchor(0, 0):pos(0, 0):addTo(bgYB)
	an.newLabel("�ѻ�ã�", 20, 0, {
		color = def.colors.labelYellow
	}):pos(-34, 13):addTo(bgYB):anchor(0.5, 0.5)
	an.newLabel(string.format("%.2f", result.Fcashget/100), 20, 0, {
		color = def.colors.labelYellow
	}):pos(70, 15):addTo(bgYB):anchor(0.5, 0.5)
	an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		sound.playSound("103")
		nodeRPInfo:removeSelf()

		return 
	end, {
		pressImage = res.gettex2("pic/common/btn21.png"),
		label = {
			"ȷ��",
			18,
			0,
			{
				color = def.colors.Cf0c896
			}
		}
	}).add2(slot16, infoBg):anchor(0.5, 0.5):pos(infoBg.getw(infoBg)/2, 40)

	return 
end
redPacket.sortRP = function (self)
	local numRP = #self.infoRP

	for i, v in ipairs(self.infoRP) do
		if self.openingRPIndex < i then
			self.infoRP[i].bgReceivedRP:setPosition((i - 2)%3*156.75 + 11.75, math.modf((i - 2)/3)*180 - 373)
		end
	end

	self.infoRP[self.openingRPIndex].bgReceivedRP:setPosition((numRP - 1)%3*156.75 + 11.75, math.modf((numRP - 1)/3)*180 - 373)

	local temp = self.infoRP[self.openingRPIndex]

	for i = self.openingRPIndex, numRP - 1, 1 do
		self.infoRP[i] = self.infoRP[i + 1]
	end

	self.infoRP[numRP] = temp

	for i, v in ipairs(self.infoRP) do
		self.infoRP[i].bgReceivedRP:removeNodeEventListenersByEvent(cc.NODE_TOUCH_EVENT)

		local moveBgRP = false

		self.infoRP[i].bgReceivedRP:setTouchEnabled(true)
		self.infoRP[i].bgReceivedRP:setTouchSwallowEnabled(false)

		local function bgReceivedRPCB(sender)
			if self.infoRP[i].geted == true then
				local rsbQueryRP = DefaultClientMessage(CM_CashGiftSendDetail)
				self.queryingRPID = self.infoRP[i].RPID
				rsbQueryRP.Fqueryid = self.infoRP[i].RPID

				MirTcpClient:getInstance():postRsb(rsbQueryRP)
			else
				local rsbOpenRP = DefaultClientMessage(CM_CashGiftOpen)
				self.openingRPID = self.infoRP[i].RPID
				rsbOpenRP.Fopenid = self.infoRP[i].RPID

				MirTcpClient:getInstance():postRsb(rsbOpenRP)
				print("*** �򿪺�������ѷ��� *** ")
				main_scene.ui.waiting:show(10, "GETRP")
			end

			return 
		end

		self.infoRP[i].bgReceivedRP.listener = bgReceivedRPCB

		self.infoRP[i].bgReceivedRP.addNodeEventListener(slot10, cc.NODE_TOUCH_EVENT, handler(self.infoRP[i].bgReceivedRP, self.infoRP[i].bgReceivedRP.handleTouch))
	end

	return 
end
redPacket.onSM_CashGiftListAll = function (self, result, protoId)
	if next(result.Fgiftlist) == nil then
		an.newLabel("û�п���ȡ�ĺ��", 20, 0, {
			color = def.colors.Cf0c896
		}):pos(245, 200):addTo(self.nodePageContent):anchor(0.5, 0.5)

		return 
	end

	self.unreadCount = 0
	local numRP = #result.Fgiftlist
	local numGetRP = 0

	for i, v in ipairs(result.Fgiftlist) do
		for index = 1, numRP - numGetRP, 1 do
			if result.Fgiftlist[index].Fgeted == true then
				numGetRP = numGetRP + 1
				local temp = result.Fgiftlist[index]

				for k = index, numRP - 1, 1 do
					result.Fgiftlist[k] = result.Fgiftlist[k + 1]
				end

				result.Fgiftlist[numRP] = temp

				break
			end
		end
	end

	self.infoRP = {}
	local scrollSendedRP = an.newScroll(0, 0, 482, 383):addTo(self.nodePageContent)

	for i, v in ipairs(result.Fgiftlist) do
		self.infoRP[i] = {
			RPID = result.Fgiftlist[i].Fid,
			giftType = result.Fgiftlist[i].Fgifttype,
			ownerName = result.Fgiftlist[i].Fownername,
			sendWord = result.Fgiftlist[i].Fsendword,
			allowCount = result.Fgiftlist[i].Fallowcount,
			getCount = result.Fgiftlist[i].Fgetcount,
			cashType = result.Fgiftlist[i].Fcashtype,
			geted = result.Fgiftlist[i].Fgeted
		}

		local function bgReceivedRPCB(sender)
			if self.infoRP[i].geted == true then
				local rsbQueryRP = DefaultClientMessage(CM_CashGiftSendDetail)
				self.queryingRPID = self.infoRP[i].RPID
				rsbQueryRP.Fqueryid = self.infoRP[i].RPID

				MirTcpClient:getInstance():postRsb(rsbQueryRP)
			else
				local rsbOpenRP = DefaultClientMessage(CM_CashGiftOpen)
				self.openingRPID = self.infoRP[i].RPID
				rsbOpenRP.Fopenid = self.infoRP[i].RPID

				MirTcpClient:getInstance():postRsb(rsbOpenRP)
				print("*** �򿪺�������ѷ��� *** ")
				main_scene.ui.waiting:show(10, "GETRP")
			end

			return 
		end

		local bgReceivedRP = an.newBtn(res.gettex2("pic/panels/redPacket/RedPacket.png"), slot11, {
			support = "scroll"
		}):anchor(0, 1):pos((i - 1)%3*156.75 + 11.75, math.modf((i - 1)/3)*180 - 373):add2(scrollSendedRP)
		self.infoRP[i].bgReceivedRP = bgReceivedRP
		local strResBgRP = ""

		if result.Fgiftlist[i].Fgifttype == 1 then
			strResBgRP = "pic/panels/redPacket/CharacterGe.png"
		elseif result.Fgiftlist[i].Fgifttype == 2 then
			strResBgRP = "pic/panels/redPacket/CharacterHang.png"
		elseif result.Fgiftlist[i].Fgifttype == 3 then
			strResBgRP = "pic/panels/redPacket/CharacterQu.png"
		end

		local bgRP = res.get2(strResBgRP):pos(70, 140):add2(bgReceivedRP)
		local sendWord = string.sub(result.Fgiftlist[i].Fsendword, 1, 12) .. "��\n" .. string.sub(result.Fgiftlist[i].Fsendword, 16, 27) .. "��"

		an.newLabel(sendWord, 18, 0, {
			color = def.colors.labelYellow
		}):pos(78, 97):addTo(bgReceivedRP):anchor(0.5, 0.5)
		an.newLabel(result.Fgiftlist[i].Fownername, 18, 0, {
			color = def.colors.labelYellow
		}):pos(70, 60):addTo(bgReceivedRP):anchor(0.5, 0.5)

		self.infoRP[i].labelSelecting = an.newLabel("", 18, 0, {
			color = def.colors.Cf0c896
		}):pos(70, 30):addTo(bgReceivedRP):anchor(0.5, 0.5)
		local strLabel = ""

		if result.Fgiftlist[i].Fgeted == false then
			strLabel = "�����ȡ"

			self.setPacketPointTip(self, self.infoRP[i].bgReceivedRP, true)

			self.unreadCount = self.unreadCount + 1
		else
			strLabel = "���죺" .. tostring(result.Fgiftlist[i].Fgetcount) .. "/" .. tostring(result.Fgiftlist[i].Fallowcount)

			if result.Fgiftlist[i].Fgifttype == 1 then
				strLabel = "����ȡ"
			end
		end

		self.infoRP[i].labelSelecting:setString(strLabel)
		self.infoRP[i].labelSelecting:retain()
		self.infoRP[i].bgReceivedRP:retain()
	end

	return 
end
redPacket.onSM_CashGiftListMine = function (self, result, protoId)
	if next(result.Fgiftlist) == nil then
		an.newLabel("û���ѷ��͵ĺ��", 20, 0, {
			color = def.colors.Cf0c896
		}):pos(240, 175):addTo(self.nodePageContent):anchor(0.5, 0.5)
	end

	local scrollSendedRP = an.newScroll(0, 0, 482, 353):addTo(self.nodePageContent)

	for i, v in ipairs(result.Fgiftlist) do
		local bgSendedRP = res.get2("pic/panels/redPacket/RedPacket.png"):anchor(0, 1):pos((i - 1)%3*156.75 + 11.75, math.modf((i - 1)/3)*180 - 343):add2(scrollSendedRP)
		local strResBgRP = ""

		if result.Fgiftlist[i].Fgifttype == 1 then
			strResBgRP = "pic/panels/redPacket/CharacterGe.png"
		elseif result.Fgiftlist[i].Fgifttype == 2 then
			strResBgRP = "pic/panels/redPacket/CharacterHang.png"
		elseif result.Fgiftlist[i].Fgifttype == 3 then
			strResBgRP = "pic/panels/redPacket/CharacterQu.png"
		end

		local bgRP = res.get2(strResBgRP):pos(70, 140):add2(bgSendedRP)
		local str1 = "03-07 18 ��00"

		an.newLabel(os.date("%m-%d %H:%M", result.Fgiftlist[i].Fcreatedatetime), 20, 0, {
			color = def.colors.labelYellow
		}):pos(70, 100):addTo(bgSendedRP):anchor(0.5, 0.5)

		local str2 = "����10/99"

		if result.Fgiftlist[i].Fgifttype == 1 then
			an.newLabel(result.Fgiftlist[i].Fownername, 20, 0, {
				color = def.colors.labelYellow
			}):pos(70, 70):addTo(bgSendedRP):anchor(0.5, 0.5)
		else
			local strLabel = "����:" .. result.Fgiftlist[i].Fgetcount .. "/" .. result.Fgiftlist[i].Fallowcount

			an.newLabel(strLabel, 20, 0, {
				color = def.colors.labelYellow
			}):pos(70, 70):addTo(bgSendedRP):anchor(0.5, 0.5)
		end

		local bgYB = display.newScale9Sprite(res.getframe2("pic/panels/redPacket/BgNumYB.png"), 0, 0, cc.size(106, 29)):pos(70, 35):addTo(bgSendedRP)

		res.get2("pic/console/infobar/yb.png"):anchor(0, 0):pos(0, 0):addTo(bgYB)
		an.newLabel(tostring(result.Fgiftlist[i].Fcash/100), 20, 0, {
			color = def.colors.labelYellow
		}):pos(70, 15):addTo(bgYB):anchor(0.5, 0.5)
	end

	an.newLabel("�ѷ��ͺ��������" .. #result.Fgiftlist .. " ��", 20, 0, {
		color = def.colors.Cf0c896
	}):pos(360, -22):addTo(self.nodePageContent):anchor(0.5, 0.5)

	return 
end
redPacket.onSM_GildInfo = function (self, result, protoId)
	self.numGuildPlayer = result.FTotalCount

	self.showPageSendingRP(self, 2)

	return 
end
redPacket.onSM_GildList = function (self, result, protoId)
	an.newLabel("��δ�����л�", 20, 0, {
		color = def.colors.Cf0c896
	}):anchor(0.5, 0.5):pos(240, 200):addTo(self.nodePageContent)

	return 
end
redPacket.onSM_CashGiftQuery = function (self, result, protoId)
	self.receiverExist = (result.Fquertres == 1 and true) or false

	if self.receiverExist == false then
		main_scene.ui:tip("���պ����ɫ�����ڣ��޷����ͺ��")

		return 
	else
		textsSendingRP = {
			{
				"��ȷ��Ҫ����"
			},
			{
				tostring(self.sendYBNum),
				display.COLOR_RED
			},
			{
				"Ԫ���ĺ����"
			},
			{
				self.receiveRPPlayerName,
				display.COLOR_RED
			},
			{
				"��"
			}
		}
		slot3 = an.newMsgbox(textsSendingRP, function (idx)
			if idx == 1 then
				local rsb = DefaultClientMessage(CM_CashGiftCreate)
				rsb.FCashType = 1
				rsb.FGiftType = 1
				rsb.FCashTotal = self.sendYBNum*100
				rsb.FSendWord = self.currentBlessing
				rsb.FValidName = self.receiveRPPlayerName
				rsb.FAllowCount = 1
				rsb.Fistest = false

				MirTcpClient:getInstance():postRsb(rsb)
			end

			return 
		end, {
			disableScroll = true,
			center = true,
			hasCancel = true
		})
	end

	return 
end
redPacket.showPageInfo = function (self, selectedBtnIndex)
	if self.nodePageContent then
		self.nodePageContent:removeSelf()
	end

	self.nodePageContent = display.newNode():addTo(self.rightFrame)

	self.nodePageContent:size(482, 383):anchor(0, 0):pos(2, 2)

	if selectedBtnIndex == 1 then
		self.rightFrame:setContentSize(486, 387)

		local rsbReceivedRP = DefaultClientMessage(CM_CashGiftSendAll)

		MirTcpClient:getInstance():postRsb(rsbReceivedRP)
		main_scene.ui.notice:removeRPCnt()
		g_data.redPacket:readAllRP()
	elseif selectedBtnIndex == 2 then
		self.rightFrame:setContentSize(486, 387)

		local rsb = DefaultClientMessage(CM_GildInfo)

		MirTcpClient:getInstance():postRsb(rsb)
	elseif selectedBtnIndex == 3 then
		self.rightFrame:setContentSize(486, 387)
		self.showPageSendingRP(self, 3)
	elseif selectedBtnIndex == 4 then
		self.rightFrame:setContentSize(486, 387)
		self.showPageSendingRP(self, 4)
	elseif selectedBtnIndex == 5 then
		self.rightFrame:setContentSize(486, 357)

		local rsbSendedRP = DefaultClientMessage(CM_CashGiftSendMine)

		MirTcpClient:getInstance():postRsb(rsbSendedRP)
	end

	return 
end
redPacket.showPageSendingRP = function (self, selectedBtnIndex)
	local bg = display.newSprite(res.gettex2("pic/panels/redPacket/BgSendRP.png")):anchor(0, 0):addTo(self.nodePageContent):pos(0, 0)
	local redPacket = display.newSprite(res.gettex2("pic/panels/redPacket/RedPacket.png")):anchor(0.5, 0.5):addTo(bg):pos(120, 230)
	local bgYB = display.newScale9Sprite(res.getframe2("pic/panels/redPacket/BgNumYB.png"), 0, 0, cc.size(106, 29)):anchor(0, 0):pos(redPacket.getw(redPacket)/2 - 53, redPacket.geth(redPacket)/2 - 60):addTo(redPacket)

	display.newSprite(res.gettex2("pic/console/infobar/yb.png")):anchor(0, 0):pos(0, 0):addTo(bgYB)
	an.newLabel("�����ܽ��", 20, 0, {
		color = def.colors.labelYellow
	}):anchor(0.5, 0.5):pos(redPacket.getw(redPacket)/2, redPacket.geth(redPacket)/2 - 10):addTo(redPacket)
	an.newLabel("�������24Сʱ��δ����ȡ��Ԫ��\n��ͨ���ʼ�ȫ��������", 20, 0, {
		color = def.colors.labelYellow
	}):anchor(0, 0):pos(12, 12):addTo(bg)

	self.sendYBNum = 1
	local minYBNum = (selectedBtnIndex == 4 and 10) or 1
	self.receiveRPPlayerName = ""
	local sendRPNum = 1
	local minSendRPNum = 1
	local typeRP = 1

	local function inputYBNumCB()
		self.sendYBNum = tonumber(self.inputYBNum:getText()) or minYBNum
		self.sendYBNum = (math.floor(self.sendYBNum) < self.sendYBNum and math.floor(self.sendYBNum)) or self.sendYBNum
		self.sendYBNum = (self.sendYBNum < minYBNum and minYBNum) or self.sendYBNum

		if self.inputYBNum:getText() == "" then
			self.inputYBNum:setString("")
		else
			self.inputYBNum:setString(tostring(self.sendYBNum))
		end

		return 
	end

	self.inputYBNum = an.newInput(45, 16, 70, 40, 6, {
		stop_call = inputYBNumCB,
		tip = {
			tostring(slot5),
			20,
			1,
			{
				color = def.colors.Cf0c896
			}
		}
	}):addTo(bgYB):anchor(0, 0.5)

	self.inputYBNum.tip:setPositionX(10)

	local blessingContent = {
		"��ϲ���ƣ��󼪴�����",
		"ͬ��Э�����Ʋ��ɵ���",
		"�ֵ����꣬��ĵ��ϣ�",
		"��־�ɳǣ�ͬ����飡",
		"���տ��֣������³ɣ�",
		"���곤�棬�쳤�ؾã�",
		"Я��֮�֣���ͷ���ϣ�"
	}
	self.currentBlessing = blessingContent[1]
	local blessWidget = self.createSelectTab(self, {
		parent = self.nodePageContent,
		texts = blessingContent,
		color = def.colors.Cf0c896,
		curtext = blessingContent[1],
		size = cc.size(128, 24),
		endFunc = function (obj)
			self.currentBlessing = obj

			return 
		end
	}, self.nodePageContent).anchor(slot11, 0, 0.5):pos(205, 190):add2(bg, 2)

	display.newSprite(res.getframe2("pic/panels/guild/downarrow.png"), 0, 0):anchor(0.5, 0.5):add2(blessWidget):pos(230, 12)
	an.newLabel("������� :", 20, 0, {
		color = def.colors.labelYellow
	}):anchor(0, 0):pos(0, 40):addTo(blessWidget)

	local function btnSendCB()
		sound.playSound("103")

		local actualYBNum = tonumber(g_data.player:getIngotShow())

		if g_data.player.ability.FLevel < 30 then
			main_scene.ui:tip("��ɫδ��30�����޷����ͺ��")

			return 
		elseif actualYBNum < self.sendYBNum then
			main_scene.ui:tip("ʣ��Ԫ�����㣬�޷����ͺ��")

			return 
		elseif self.sendYBNum < 1 then
			main_scene.ui:tip("���ٷ���1��Ԫ��")

			return 
		elseif self.sendYBNum < 10 and selectedBtnIndex == 4 then
			main_scene.ui:tip("ȫ��������ٷ���10��Ԫ��")

			return 
		elseif sendRPNum < 2 and selectedBtnIndex == 2 then
			main_scene.ui:tip("�л�����������Ϊ2��")

			return 
		elseif sendRPNum < 10 and selectedBtnIndex == 4 then
			main_scene.ui:tip("ȫ�������������Ϊ10��")

			return 
		elseif self.sendYBNum/sendRPNum < 0.05 then
			main_scene.ui:tip("������������Сֵ���ͣ��޷����ͺ��")

			return 
		elseif selectedBtnIndex == 3 then
			if self.receiveRPPlayerName == main_scene.ground.map.player.info.name.texts[1] then
				main_scene.ui:tip("���˺�����ܷ����Լ���")

				return 
			else
				local rsb = DefaultClientMessage(CM_CashGiftQuery)
				rsb.Fquerytype = 0
				rsb.Fquerystring = self.receiveRPPlayerName

				MirTcpClient:getInstance():postRsb(rsb)

				return 
			end
		end

		local giftType = 1
		local textsSendingRP = {}
		local nameRPType = (typeRP == 1 and "��ͨ") or "���"

		if selectedBtnIndex == 2 then
			giftType = 2
			textsSendingRP[1] = {
				"��ȷ��Ҫ����"
			}
			textsSendingRP[2] = {
				tostring(sendRPNum),
				display.COLOR_RED
			}
			textsSendingRP[3] = {
				"����"
			}
			textsSendingRP[4] = {
				tostring(self.sendYBNum),
				display.COLOR_RED
			}
			textsSendingRP[5] = {
				"Ԫ����"
			}
			textsSendingRP[6] = {
				nameRPType,
				display.COLOR_RED
			}
			textsSendingRP[7] = {
				"������л���"
			}
		elseif selectedBtnIndex == 4 then
			giftType = 3
			textsSendingRP[1] = {
				"��ȷ��Ҫ����"
			}
			textsSendingRP[2] = {
				tostring(sendRPNum),
				display.COLOR_RED
			}
			textsSendingRP[3] = {
				"����"
			}
			textsSendingRP[4] = {
				tostring(self.sendYBNum),
				display.COLOR_RED
			}
			textsSendingRP[5] = {
				"Ԫ����"
			}
			textsSendingRP[6] = {
				nameRPType,
				display.COLOR_RED
			}
			textsSendingRP[7] = {
				"�����ȫ����"
			}
		end

		local msgbox = an.newMsgbox(textsSendingRP, function (idx)
			if idx == 1 then
				local rsb = DefaultClientMessage(CM_CashGiftCreate)
				rsb.FCashType = typeRP
				rsb.FGiftType = giftType
				rsb.FCashTotal = self.sendYBNum*100
				rsb.FSendWord = self.currentBlessing
				rsb.FValidName = self.receiveRPPlayerName
				rsb.FAllowCount = sendRPNum
				rsb.Fistest = false

				MirTcpClient:getInstance():postRsb(rsb)
			end

			return 
		end, {
			disableScroll = true,
			center = true,
			hasCancel = true
		})

		return 
	end

	local sendBtn = an.newBtn(res.gettex2("pic/common/btn20.png"), slot12, {
		label = {
			"����",
			20,
			0,
			{
				color = def.colors.Cf0c896
			}
		},
		pressImage = res.gettex2("pic/common/btn21.png")
	}):addTo(bg):anchor(0.5, 0.5)

	sendBtn.pos(sendBtn, bg.getw(bg) - sendBtn.getw(sendBtn)/2 - 20, 25)

	if selectedBtnIndex == 2 or selectedBtnIndex == 4 then
		self.sendYBNum = minYBNum
		local characterTip = nil

		if selectedBtnIndex == 2 then
			characterTip = display.newSprite(res.gettex2("pic/panels/redPacket/CharacterHang.png")):anchor(0.5, 0.5):pos(redPacket.getw(redPacket)/2, redPacket.geth(redPacket)/2 + 50):addTo(redPacket)

			an.newLabel("�л����� :", 20, 0, {
				color = def.colors.labelYellow
			}):anchor(0, 0):pos(205, 295):addTo(bg)
			an.newLabel(tostring(self.numGuildPlayer) .. " ��", 20, 0, {
				color = def.colors.Cf0c896
			}):anchor(0, 0):pos(340, 295):addTo(bg)

			minSendRPNum = 2
		else
			characterTip = display.newSprite(res.gettex2("pic/panels/redPacket/CharacterQu.png")):anchor(0.5, 0.5):pos(redPacket.getw(redPacket)/2, redPacket.geth(redPacket)/2 + 50):addTo(redPacket)
			minSendRPNum = 10
		end

		sendRPNum = minSendRPNum

		an.newLabel("������� :", 20, 0, {
			color = def.colors.labelYellow
		}):anchor(0, 0):pos(205, 265):addTo(bg)

		local numRPBg = display.newScale9Sprite(res.getframe2("pic/scale/edit.png"), 0, 0, cc.size(75, 29)):addTo(bg):pos(320, 263):anchor(0, 0)

		an.newLabel("��", 20, 0, {
			color = def.colors.Cf0c896
		}):anchor(0, 0):pos(83, 2):addTo(numRPBg)

		local function inputRPNumCB()
			sendRPNum = tonumber(self.inputRPNum:getText()) or minSendRPNum
			sendRPNum = (sendRPNum < minSendRPNum and minSendRPNum) or sendRPNum

			if self.inputRPNum:getText() == "" then
				self.inputRPNum:setString("")
			else
				self.inputRPNum:setString(tostring(sendRPNum))
			end

			return 
		end

		self.inputRPNum = an.newInput(28, 0, 75, 27, 2, {
			stop_call = inputRPNumCB,
			tip = {
				tostring(slot7),
				20,
				1,
				{
					color = def.colors.Cf0c896
				}
			}
		}):addTo(numRPBg):anchor(0, 0)

		self.inputRPNum.tip:setPositionX(10)
		an.newLabel("������� :", 20, 0, {
			color = def.colors.labelYellow
		}):anchor(0, 0):pos(205, 235):addTo(bg)

		local function btnNormalRPCB()
			self.btnNormalRP:select()
			self.btnRandomRP:unselect()

			typeRP = 1

			return 
		end

		local function btnRandomRPCB()
			self.btnNormalRP:unselect()
			self.btnRandomRP:select()

			typeRP = 2

			return 
		end

		self.btnNormalRP = an.newBtn(res.gettex2("pic/common/toggle12.png"), slot17, {
			support = "easy",
			select = {
				res.gettex2("pic/common/toggle13.png"),
				manual = true
			}
		}):anchor(0, 0):pos(205, 202):addTo(bg)

		an.newLabel("��ͨ", 20, 0, {
			color = def.colors.Cf0c896
		}):anchor(0, 0):pos(40, 0):addTo(self.btnNormalRP)
		self.btnNormalRP:select()

		self.btnRandomRP = an.newBtn(res.gettex2("pic/common/toggle12.png"), btnRandomRPCB, {
			support = "easy",
			select = {
				res.gettex2("pic/common/toggle13.png"),
				manual = true
			}
		}):anchor(0, 0):pos(337, 202):addTo(bg)

		an.newLabel("���", 20, 0, {
			color = def.colors.Cf0c896
		}):anchor(0, 0):pos(40, 0):addTo(self.btnRandomRP)
		self.btnRandomRP:unselect()
		blessWidget.setPositionY(blessWidget, 150)
	elseif selectedBtnIndex == 3 then
		local characterTip = display.newSprite(res.gettex2("pic/panels/redPacket/CharacterGe.png")):anchor(0.5, 0.5):pos(redPacket.getw(redPacket)/2, redPacket.geth(redPacket)/2 + 50):addTo(redPacket)

		an.newLabel("��ɫ���� :", 20, 0, {
			color = def.colors.labelYellow
		}):anchor(0, 0):pos(205, 305):addTo(bg)

		local inputBg = display.newScale9Sprite(res.getframe2("pic/scale/edit.png"), 0, 0, cc.size(215, 32)):addTo(bg):pos(205, 265):anchor(0, 0)
		local labelReceiverName = an.newLabel("�պ�����ǳ�", 20, 1, {
			color = def.colors.Cf0c896
		}):pos(8, 16):add2(inputBg):anchor(0, 0.5)
		local labelReceiverNameEx = an.newLabel("                             ", 20, 1):pos(8, 16):add2(inputBg):anchor(0, 0.5)

		labelReceiverNameEx.enableClick(labelReceiverNameEx, function ()
			g_data.mark:addNear(main_scene.ground.map:getHeroNameList())

			local msgbox = nil
			msgbox = an.newMsgbox("\n������Է����֣�\n", function ()
				self.receiveRPPlayerName = msgbox.input:getString()

				if msgbox.input:getString() == "" then
					labelReceiverName:setString("�պ�����ǳ�")
				else
					labelReceiverName:setString(msgbox.input:getString())
				end

				return 
			end, {
				disableScroll = true,
				input = 20,
				inputList = {
					"<����Ҫѡ>",
					g_data.mark.getNames(slot6)
				}
			})

			msgbox.input:setString("")

			return 
		end, {
			size = cc.size(labelReceiverName.getw(slot16), 17),
			anchor = cc.p(0, 1),
			pos = cc.p(0, 0)
		})
	end

	return 
end
redPacket.createSelectTab = function (self, params, content)
	params = params or {}
	params.size = params.size or size(60, 30)
	params.texts = params.texts or {
		""
	}
	params.res = params.res or ""
	params.curtext = params.curtext or "��ϲ���ƣ��󼪴�����"
	params.fontSize = params.fontSize or 20
	params.strokeSize = params.strokeSize or 1
	params.color = params.color or def.colors.labelGray
	params.tabBackColor = params.tabBackColor or cc.c3b(120, 120, 120)

	if type(params.texts) == "string" then
		params.texts = string.split(params.texts, ",")
	end

	local function getIconTex(i)
		local iconImg = (type(params.res) == "table" and params.res[i]) or string.format(params.res, i)
		local scale = params.scale

		if type(iconImg) == "table" then
			scale = iconImg[2]
			iconImg = iconImg[1]
		end

		return iconImg, scale
	end

	local control, showLabel, showIcon = nil
	slot7 = display.newScale9Sprite(res.getframe2("pic/scale/edit.png"), 0, 0, cc.size(250, 32)).enableClick(slot7, function (eventX, eventY)
		local pt = control:getParent():convertToNodeSpace(cc.p(eventX, eventY))

		if cc.rectContainsPoint(control:getBoundingBox(), pt) then
			control:setTouchSwallowEnabled(false)

			params.size = control:getContentSize()

			local function createTabCell(index, object)
				local cell = display.newScale9Sprite(nil, 0, 0, cc.size(250, 40))
				local img, scale = getIconTex(index)
				local icon = res.get2(img):anchor(0.5, 0.5):pos(32, 32):add2(cell, 2)

				icon.setScale(icon, scale or icon.getw(icon)/50)
				an.newLabel(object, params.fontSize, params.strokeSize, {
					color = params.color
				}):anchor(0.5, 0.5):pos(cell.getw(cell)*0.45, cell.geth(cell)*0.5):addTo(cell):addUnderline(display.Cf0c896)

				return cell
			end

			if params.texts then
				local cellList = {}
				local showListExcludingCurrent = {}
				local index = 1

				for i, v in ipairs(params.texts) do
					if params.texts[i] ~= self.currentBlessing then
						showListExcludingCurrent[index] = params.texts[i]
						index = index + 1
					end
				end

				for i, v in ipairs(showIcon) do
					local cell = {
						cellCls = function ()
							return createTabCell(i, v)
						end,
						w = 250,
						h = 30,
						object = v,
						index = i
					}
					cellList[#cellList + 1] = cell
				end

				local h = 148

				if #params.texts < 5 then
					h = #params.texts*37 + 10
				end

				local menu = common.createOperationMenu(showLabel, 5, function (popMenu, cell)
					local object = cell.object
					local index = cell.index

					showLabel:setString(object)

					local img, scale = getIconTex(index)

					showIcon:setTex(res.gettex2(img))
					showIcon:scale(scale or showIcon:getw()/45)
					popMenu.removeSelf(popMenu)

					if params.endFunc then
						params.endFunc(object)
					end

					return 
				end, {
					bgTex = "pic/common/black_3.png",
					scroll = {
						w = 250,
						h = h
					}
				}).anchor(slot8, 0, 1)

				if params.parent then
					menu.add2(menu, params.parent)

					local pos = cc.p(0, 0)
					pos = control:convertToWorldSpace(pos)
					pos = params.parent:convertToNodeSpace(pos)

					menu.pos(menu, pos.x, pos.y)
				else
					local x, y = control:getPosition()

					menu.add2(menu, control:getParent(), 50):pos(x, y - 20)
				end
			end
		end

		return 
	end)
	control = slot7
	showLabel = an.newLabel(params.curtext, params.fontSize, params.strokeSize, {
		color = params.color
	}):anchor(0.5, 0.5):pos(control.getw(control)*0.45, control.geth(control)*0.5):addTo(control)
	local img, scale = getIconTex(1)
	showIcon = res.get2(img):anchor(0.5, 0.5):pos(31, 34):add2(control, 2)

	showIcon.setScale(showIcon, scale or showIcon.getw(showIcon)/45)

	for i, v in ipairs(params.texts) do
		if v == params.curtext then
			local img, scale = getIconTex(i)

			showIcon.setTex(showIcon, res.gettex2(img))
			showIcon.setScale(showIcon, scale or showIcon.getw(showIcon)/45)
		end
	end

	return control
end

return redPacket
