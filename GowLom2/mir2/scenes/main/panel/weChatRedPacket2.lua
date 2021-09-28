local weChatRedPacket = class("weChatRedPacket", function ()
	return display.newNode()
end)
local item = import("..common.item")

table.merge(slot0, {
	selectedChargeBtnIndex = 0,
	selectedBtnIndex = 0,
	tableGradeRP = {},
	tableLoginRP = {},
	tableChargeRP = {},
	tableLuckyRP = {},
	showingTable = {},
	infoCell = {},
	bgCell = {},
	subTable = {}
})

local tabNames = {
	"�ȼ����",
	"�ۼƵ�¼",
	"�׳���",
	"����ͬ��"
}
weChatRedPacket.ctor = function (self, btnPageIndex)
	self.tableGradeRP = {}
	self.tableLoginRP = {}
	self.tableChargeRP = {}
	self.tableLuckyRP = {}
	self.showingTable = {}
	self.infoCell = {}
	self.bgCell = {}
	self.subTable = {}
	self._supportMove = true
	self.bg = display.newSprite(res.gettex2("pic/common/black_2.png")):anchor(0, 0):addTo(self)

	self.size(self, self.bg:getw(), self.bg:geth()):anchor(0.5, 0.5):center()
	display.newScale9Sprite(res.getframe2("pic/common/black_5.png"), 0, 0, cc.size(136, 389)):addTo(self.bg):pos(12, 405):anchor(0, 1)

	self.rightFrame = display.newScale9Sprite(res.getframe2("pic/common/black_5.png"), 0, 0, cc.size(470, 389)):addTo(self.bg):pos(156, 405):anchor(0, 1)

	an.newLabel("΢������", 20, 0, {
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
	self.bindMsg(self)

	local rsbGetInfo = DefaultClientMessage(CM_MicroCGiftSendAll)

	MirTcpClient:getInstance():postRsb(rsbGetInfo)

	local test = {}

	return 
end
weChatRedPacket.bindMsg = function (self)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_MicroCGiftSendAll, self, self.onSM_MicroCGiftSendAll)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_MicroCGiftGetCode, self, self.onSM_MicroCGiftGetCode)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_MicroCGiftSendStarList, self, self.onSM_MicroCGiftSendStarList)

	return 
end
weChatRedPacket.onSM_MicroCGiftSendAll = function (self, result, protoId)
	self.tableRP = {}

	for i = 1, #tabNames, 1 do
		self.tableRP[i] = {}
	end

	for i, v in ipairs(result.Fgiftlist) do
		if v.Fgtype == 1 then
			self.tableRP[1][#self.tableRP[1] + 1] = v
		elseif v.Fgtype == 2 then
			self.tableRP[2][#self.tableRP[2] + 1] = v
		elseif v.Fgtype == 3 or v.Fgtype == 4 then
			self.tableRP[3][#self.tableRP[3] + 1] = v
		elseif v.Fgtype == 5 then
			self.tableRP[4][#self.tableRP[4] + 1] = v
		end
	end

	local btnPageNames = {}

	for i = 1, #tabNames, 1 do
		if 0 < #self.tableRP[i] then
			btnPageNames[i] = tabNames[i]
		end
	end

	self.pageBtns = {}

	local function btnPageCB(btn)
		sound.playSound("103")

		for i, v in pairs(self.pageBtns) do
			if v then
				if v == btn then
					v.select(v)
				else
					v.unselect(v)
				end
			end
		end

		if btn.btnIndex ~= self.selectedBtnIndex then
			self.selectedBtnIndex = btn.btnIndex

			self:showPageContent(self.selectedBtnIndex)
		end

		return 
	end

	local count = 0

	for i = 1, #tabNames, 1 do
		if btnPageNames[i] then
			count = count + 1
			self.pageBtns[i] = an.newBtn(res.gettex2("pic/common/btn60.png"), slot4, {
				label = {
					btnPageNames[i],
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
			}):add2(self.bg):anchor(0, 0.5):pos(26, (count - 1)*54 - 370)
			self.pageBtns[i].btnIndex = i
		end
	end

	for i = 1, #tabNames, 1 do
		if self.pageBtns[i] then
			btnPageCB(self.pageBtns[i])

			break
		end
	end

	return 
end
weChatRedPacket.onSM_MicroCGiftGetCode = function (self, result, protoId)
	if result.Fretcode == 1 then
		main_scene.ui:tip("΢�������ʼ��ʧ��")
	elseif result.Fretcode == 2 then
		main_scene.ui:tip("δ��ȷ��΢���������")
	elseif result.Fretcode == 3 then
		main_scene.ui:tip("δ�����ȡ����")
	elseif result.Fretcode == 4 then
		main_scene.ui:tip("ϵͳ��æ�������ĵȴ�")
	elseif result.Fretcode == 5 then
		main_scene.ui:tip("�һ��뷢���ˣ���ȡ�Ѵ�����")
	elseif result.Fretcode == 0 then
		main_scene.ui:tip("��ȡ�ɹ�")

		local labelCode = nil

		if self.selectedBtnIndex ~= 4 then
			for i, v in ipairs(self.subTable) do
				if result.Fid == self.subTable[i].Fid then
					self.subTable[i].Fcode = result.Fcode

					self.infoCell[i].getBtn:setVisible(false)
					self.infoCell[i].codeLabel:setVisible(false)
					self.infoCell[i].input:setText(result.Fcode)

					if self.selectedBtnIndex == 2 then
						self.infoCell[i].remainingNumLabel:setString(tostring(v.Fmaxcnt - v.Fcurcnt - 1))
					end

					break
				end
			end
		else
			self.btnGetLuckyPrize.label:setString("����ȡ")

			self.tableRP[4].Fcode = result.Fcode
		end
	end

	return 
end
weChatRedPacket.onSM_MicroCGiftSendStarList = function (self, result, protoId)
	for i, v in ipairs(result.Fgiftlist) do
		an.newLabel(v.Fname, 20, 0, {
			color = def.colors.text
		}):anchor(0.5, 0.5):pos(110, (i - 1)*25 - 165):addTo(self.scrollStar)
	end

	return 
end
weChatRedPacket.createCell = function (self, showingTable, chargeNum)
	local moneyMin = {}
	local moneyMax = {}
	self.subTable = {}

	if chargeNum == 9800 then
		moneyMin = {
			5,
			10,
			10
		}
		moneyMax = {
			15,
			30,
			30
		}
	elseif chargeNum == 19800 then
		moneyMin = {
			10,
			15,
			15
		}
		moneyMax = {
			30,
			45,
			45
		}
	elseif chargeNum == 29800 then
		moneyMin = {
			15,
			20,
			30
		}
		moneyMax = {
			45,
			60,
			90
		}
	elseif chargeNum == 64800 then
		moneyMin = {
			30,
			40,
			50
		}
		moneyMax = {
			90,
			120,
			150
		}
	end

	if chargeNum ~= nil then
		for i, v in ipairs(showingTable) do
			if chargeNum == v.Fval2 then
				self.subTable[#self.subTable + 1] = v
			end
		end
	else
		self.subTable = self.tableRP[self.selectedBtnIndex]
	end

	self.input = {}

	for i, v in ipairs(self.subTable) do
		self.infoCell[i] = {}

		if self.selectedBtnIndex == 1 then
			self.bgCell[i] = display.newScale9Sprite(res.getframe2("pic/scale/edit.png"), 0, 0, cc.size(458, 110)):addTo(self.scroll):pos(4, (i - 1)*113 - 95):anchor(0, 0)
		else
			self.bgCell[i] = display.newScale9Sprite(res.getframe2("pic/scale/edit.png"), 0, 0, cc.size(458, 110)):addTo(self.scroll):pos(4, (i - 1)*113 - 127):anchor(0, 0)

			if showingTable == self.tableRP[3][2] then
				self.bgCell[i]:setPositionY(14)
			end
		end

		if self.selectedBtnIndex == 1 or self.selectedBtnIndex == 3 then
			an.newLabel("����������Ը��ƶһ���", 18, 0, {
				color = def.colors.labelGray
			}):anchor(0.5, 0.5):pos(350, 90):addTo(self.bgCell[i])
		elseif self.selectedBtnIndex == 2 then
			an.newLabel("ʣ��:", 16, 0, {
				color = def.colors.text
			}):anchor(0.5, 0.5):pos(390, 90):addTo(self.bgCell[i])

			self.infoCell[i].remainingNumLabel = an.newLabel(tostring(v.Fmaxcnt - v.Fcurcnt), 16, 0, {
				color = cc.c3b(0, 191, 96)
			}):anchor(0.5, 0.5):pos(430, 90):addTo(self.bgCell[i])

			an.newLabel("����������Ը��ƶһ���", 18, 0, {
				color = def.colors.labelGray
			}):anchor(0.5, 0.5):pos(265, 90):addTo(self.bgCell[i])
		end

		self.bgCell[i]:retain()

		if showingTable == self.tableRP[3] and i == 1 then
			an.newLabel(v.Ftitle .. "(" .. v.Fcurval/100 .. "/" .. v.Fval .. ")", 20, 0, {
				color = def.colors.Cf0c896
			}):anchor(0, 0):pos(8, 80):addTo(self.bgCell[i])
		else
			an.newLabel(v.Ftitle .. "(" .. v.Fcurval .. "/" .. v.Fval .. ")", 20, 0, {
				color = def.colors.Cf0c896
			}):anchor(0, 0):pos(8, 80):addTo(self.bgCell[i])
		end

		an.newLabel(v.Fdesc, 16, 0, {
			color = def.colors.text
		}):anchor(0, 0):pos(8, 55):addTo(self.bgCell[i])

		local bgCode = display.newScale9Sprite(res.getframe2("pic/scale/edit.png"), 0, 0, cc.size(310, 41)):addTo(self.bgCell[i]):pos(8, 8):anchor(0, 0)
		self.infoCell[i].input = an.newInputNew(175, 20, 200, 30, 50, {
			return_call = function ()
				self.infoCell[i].input:setText(v.Fcode)

				return 
			end
		}).anchor(slot12, 0.5, 0.5):addto(bgCode)
		local tipString = ""
		self.infoCell[i].codeLabel = an.newLabel("΢������һ���", 16, 0, {
			color = def.colors.text
		}):anchor(0.5, 0.5):pos(150, 21):addTo(bgCode)

		if v.Fcode ~= "" then
			self.infoCell[i].codeLabel:setVisible(false)
			self.infoCell[i].input:setText(v.Fcode)
		end

		local function btnCB(btn)
			sound.playSound("103")

			if v.Fcurval < v.Fval then
				main_scene.ui:tip("δ�����ȡ����")
			elseif v.Fcode ~= "" then
				main_scene.ui:tip("����ȡ")
			else
				local rsbGetPrize = DefaultClientMessage(CM_MicroCGiftGetCode)
				rsbGetPrize.Fid = v.Fid

				MirTcpClient:getInstance():postRsb(rsbGetPrize)
			end

			return 
		end

		self.infoCell[i].getBtn = an.newBtn(res.gettex2("pic/common/btn20.png"), slot12, {
			label = {
				"δ���",
				20,
				0,
				{
					color = def.colors.Cf0c896
				}
			},
			pressImage = res.gettex2("pic/common/btn21.png")
		}):addTo(self.bgCell[i]):anchor(0.5, 0.5):pos(390, 28)

		self.infoCell[i].getBtn:retain()

		if self.selectedBtnIndex == 2 or self.selectedBtnIndex == 3 then
			if v.Fval <= v.Fcurval and v.Fcode == "" then
				self.infoCell[i].getBtn.label:setString("��ȡ")
			elseif v.Fcode ~= "" then
				self.infoCell[i].getBtn:setVisible(false)
			end
		elseif self.selectedBtnIndex == 1 then
			if i == 1 then
				print("Fcurval=" .. v.Fcurval .. "Fval=" .. v.Fval)
				print("Fcurval2=" .. v.Fcurval2 .. "Fval2=" .. v.Fval2)
				print("Fcode=" .. v.Fcode)
			end

			if v.Fval <= v.Fcurval and v.Fcurval2 == v.Fval2 and v.Fcode == "" then
				self.infoCell[i].getBtn.label:setString("��ȡ")
			elseif v.Fcode ~= "" then
				self.infoCell[i].getBtn:setVisible(false)
			end
		end
	end

	return 
end
weChatRedPacket.showPageContent = function (self, selectedBtnIndex)
	if self.nodePageContent then
		self.nodePageContent:removeSelf()
	end

	self.nodePageContent = display.newNode():addTo(self.rightFrame)

	self.nodePageContent:size(470, 389):anchor(0, 0):pos(2, 2)

	if selectedBtnIndex ~= 4 then
		self.scroll = an.newScroll(0, 0, 470, 386):addTo(self.nodePageContent)

		res.get2("pic/panels/activity/everyday.png"):anchor(0, 0):addto(self.scroll):pos(4, 240)

		if selectedBtnIndex == 1 then
			res.get2("pic/panels/weChatRP/gradeRP.png"):anchor(0, 0):addto(self.scroll):pos(20, 285)

			self.showingTable = self.tableRP[1]
			local btnsCharge = {}
			local chargeNums = {
				64800,
				29800,
				19800,
				9800
			}
			local zorder = #chargeNums + 1

			local function btnChargePageCB(btn)
				sound.playSound("103")

				for i, v in ipairs(btnsCharge) do
					if v == btn then
						v.select(v)
						v.setLocalZOrder(v, zorder)
					else
						v.unselect(v)
						v.setLocalZOrder(v, zorder - i)
					end
				end

				if btn.btnIndex ~= self.selectedChargeBtnIndex then
					self.selectedChargeBtnIndex = btn.btnIndex

					for i, v in ipairs(self.bgCell) do
						v.removeSelf(v)
					end

					self:createCell(self.showingTable, chargeNums[btn.btnIndex])
				end

				return 
			end

			local chargeTexts = {
				"���ʳ�648",
				"���ʳ�298",
				"���ʳ�198",
				"���ʳ�98"
			}

			for i, v in ipairs(slot6) do
				btnsCharge[i] = an.newBtn(res.gettex2("pic/panels/weChatRP/btnUnselect.png"), btnChargePageCB, {
					label = {
						chargeTexts[i],
						20,
						0,
						{
							color = def.colors.Cf0c896
						}
					},
					select = {
						res.gettex2("pic/panels/weChatRP/btnSelect.png"),
						manual = true
					}
				}):add2(self.scroll):anchor(0.5, 0.5):pos((i - 1)*106 - 395, 223)
				btnsCharge[i].btnIndex = i

				btnsCharge[i].label:pos(50, 15)
			end

			for i, v in ipairs(chargeNums) do
				for m, n in ipairs(self.showingTable) do
					if v == n.Fcurval2 then
						res.get2("pic/panels/weChatRP/click.png"):anchor(0, 0):addto(btnsCharge[i]):pos(95, 3)
					end
				end
			end

			btnChargePageCB(btnsCharge[4])
		elseif selectedBtnIndex == 2 then
			self.selectedChargeBtnIndex = 0

			res.get2("pic/panels/weChatRP/loginRP2.png"):anchor(0, 0):addto(self.scroll):pos(20, 285)

			self.showingTable = self.tableRP[2]

			self.createCell(self, self.tableRP[2], nil)
		elseif selectedBtnIndex == 3 then
			self.selectedChargeBtnIndex = 0

			res.get2("pic/panels/weChatRP/chargeRP2.png"):anchor(0, 0):addto(self.scroll):pos(20, 285)

			self.showingTable = self.tableRP[3]

			self.createCell(self, self.tableRP[3], nil)
		end

		local beginTime = self.showingTable[1].Fopenfrom
		local endTime = self.showingTable[1].Fopento
		local activityTime = "�ʱ��:" .. os.date("%m-%d %H:%M", beginTime) .. " �� " .. os.date("%m-%d %H:%M", endTime)

		an.newLabel(activityTime, 20, 0, {
			color = def.colors.text
		}):pos(185, 260):addTo(self.scroll):anchor(0.5, 0.5)

		local function helpBtnCB()
			sound.playSound("103")

			local texts = {}

			if selectedBtnIndex == 2 then
				texts[1] = {
					"1.�ʱ�����ۼƵ�¼ָ���������ɻ��΢������һ��뽱����\n"
				}
			elseif selectedBtnIndex == 3 then
				texts[1] = {
					"1.�ʱ���������ֵ���ɻ��΢������һ��뽱����\n"
				}
			end

			texts[2] = {
				"2.�����ȡ����ʾ΢������һ��롣\n"
			}
			texts[3] = {
				"3.��������������ɸ��Ƽ����롣\n"
			}
			texts[4] = {
				"4.���������\"fgcq39\"΢�Ź��ں���ʹ�á�\n"
			}
			local msgbox = an.newMsgbox(texts)

			return 
		end

		an.newBtn(res.gettex2("pic/common/question.png"), slot5, {
			pressBig = true,
			pressImage = res.gettex2("pic/common/question.png")
		}):pos(435, 355):addTo(self.scroll)
	elseif selectedBtnIndex == 4 then
		local Fval = tostring(math.floor(self.tableRP[4][1].Fval/100))
		self.selectedChargeBtnIndex = 0

		display.newScale9Sprite(res.getframe2("pic/common/black_5.png"), 0, 0, cc.size(450, 140)):addTo(self.nodePageContent):pos(10, 10):anchor(0, 0)
		res.get2("pic/panels/weChatRP/luckyRP2.png"):anchor(0, 0):addto(self.nodePageContent):pos(0, 0)

		local label = cc.Label:createWithCharMap(res.gettex2("pic/panels/weChatRP/num.png"), 25, 32, string.byte("0")):pos(350, 350):addto(self.nodePageContent, 10):anchor(0, 0.5)

		label.setString(label, tostring(Fval))

		local bgIntroduction = display.newScale9Sprite(res.getframe2("pic/common/black_5.png"), 0, 0, cc.size(220, 210)):addTo(self.nodePageContent):pos(10, 10):anchor(0, 0)
		local scroll = an.newScroll(4, 5, 210, 200):addTo(bgIntroduction)
		local labelM = an.newLabelM(220, 16, 0, {}):add2(scroll):pos(0, 198):anchor(0, 1)
		local desText = {
			{
				text = "1.��ڼ䵥�ʳ�ֵ",
				color = def.colors.text
			},
			{
				text = tostring(Fval),
				color = def.colors.labelYellow
			},
			{
				text = "Ԫ����������ȡ���Ͻ���(��1��)��\n2.ͬʱ��ȫ����һ��յ�һ��΢������һ����ʼ���ÿ���һ������ǰ100�������ȡ��(ÿ�˽�����һ��)\n3.��ȡ��ʽ:��ע\"fgcq39\"΢�Ź��ںţ�����һ��뼴����ȡ΢�������",
				color = def.colors.text
			}
		}

		for i = 1, #desText, 1 do
			labelM.addLabel(labelM, desText[i].text, desText[i].color)
		end

		local bgStar = display.newScale9Sprite(res.getframe2("pic/common/black_5.png"), 0, 0, cc.size(220, 210)):addTo(self.nodePageContent):pos(237, 10):anchor(0, 0)
		self.scrollStar = an.newScroll(0, 0, 220, 210):addTo(bgStar)

		res.get2("pic/panels/weChatRP/starTopbg.png"):anchor(0.5, 0.5):addto(self.scrollStar):pos(105, 193)

		local awardNameTitle = ""

		self.scrollStar:retain()

		local rsbGetStarList = DefaultClientMessage(CM_MicroCGiftSendStarList)

		MirTcpClient:getInstance():postRsb(rsbGetStarList)

		local LuckyRP = self.tableRP[4][1]

		if LuckyRP.Fgetawards and LuckyRP.Fgetawards ~= "" and LuckyRP.Fgetawards ~= "0" then
			local awards = string.split(LuckyRP.Fgetawards, "/")

			for i, v in ipairs(awards) do
				local value = string.split(v, "|")

				if not string.find(value[1], "�ƺ�:") then
					local awardFrame = res.get2("pic/panels/shop/frame.png"):anchor(0, 0):pos((i - 1)*75 + 25, 225):add2(self.nodePageContent)

					for index, stditem in ipairs(_G.def.items) do
						if stditem.name == value[1] then
							local baseItem = {
								FIndex = index
							}

							if 150 < stditem.stdMode then
								baseItem.FDura = value[2]
							else
								baseItem.FDura = stditem.duraMax
							end

							baseItem.FDuraMax = stditem.duraMax
							baseItem.FItemValueList = {}
							baseItem.FItemIdent = 1

							setmetatable(baseItem, {
								__index = gItemOp
							})
							baseItem.decodedCallback(baseItem)
							item.new(baseItem, self, {
								donotMove = true
							}):addTo(awardFrame):anchor(0.5, 0.5):pos(39, 35)

							if not baseItem.isPileUp(baseItem) and value[2] and 1 < tonumber(value[2]) then
								an.newLabel(value[2], 12, 1, {
									color = cc.c3b(0, 255, 0)
								}):anchor(1, 0):pos(60, 10):add2(awardFrame)
							end

							break
						end
					end
				else
					local temp = string.gsub(value[1], "�ƺ�:", "")
					awardNameTitle = temp .. "����"
				end
			end
		end

		an.newLabel("�귨��ʿ����", 22, 0, {
			color = cc.c3b(250, 240, 0)
		}):addto(self.scrollStar):pos(105, 193):anchor(0.5, 0.5)

		local function btnGetPrizeCB(btn)
			if LuckyRP.Fcode ~= "" then
				main_scene.ui:tip("����ȡ")
			elseif LuckyRP.Fval <= LuckyRP.Fcurval then
				local rsbGetPrize = DefaultClientMessage(CM_MicroCGiftGetCode)
				rsbGetPrize.Fid = LuckyRP.Fid

				MirTcpClient:getInstance():postRsb(rsbGetPrize)
			else
				main_scene.ui:tip("δ�����ȡ����")
			end

			return 
		end

		self.btnGetLuckyPrize = an.newBtn(res.gettex2("pic/common/btn20.png"), slot12, {
			label = {
				"δ���",
				20,
				0,
				{
					color = def.colors.Cf0c896
				}
			},
			pressImage = res.gettex2("pic/common/btn21.png")
		}):addTo(self.nodePageContent):anchor(0.5, 0.5):pos(386, 270)
		local beginTime = LuckyRP.Fopenfrom
		local endTime = LuckyRP.Fopento
		local activityTime = "" .. os.date("%m-%d %H:%M", beginTime) .. " �� " .. os.date("%m-%d %H:%M", endTime)

		an.newLabel(activityTime, 16, 0, {
			color = def.colors.text
		}):pos(350, 235):addTo(self.nodePageContent):anchor(0.5, 0.5)

		if LuckyRP.Fval <= LuckyRP.Fcurval and LuckyRP.Fcode == "" then
			self.btnGetLuckyPrize.label:setString("��ȡ")
		elseif LuckyRP.Fcode ~= "" then
			self.btnGetLuckyPrize.label:setString("����ȡ")
		end

		self.btnGetLuckyPrize:retain()
	end

	return 
end

return weChatRedPacket
