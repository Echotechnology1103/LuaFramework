local luckyGift = class("luckyGift", function ()
	return display.newNode()
end)
local itemUse = import("..common.itemUse")
local special = common.getSpecialItemIcon()

table.merge(slot0, {
	remainingRefreshNum = 0,
	typeLuckyGift = 0,
	openNeedJQ = 0,
	refreshNeedJQ = 0,
	bigFrames = {},
	smallFrames = {},
	locks = {},
	btnsOpenGift = {},
	awards = {},
	awardsNum = {},
	luckyPic = {}
})

local btnPosY = 100
local labelPosY = 50
luckyGift.ctor = function (self, params)
	self.bigFrames = {}
	self.smallFrames = {}
	self.locks = {}
	self.btnsOpenGift = {}
	self.awards = {}
	self.awardsNum = {}
	self.iconJQ = nil
	self.jqNum = nil
	self.openNeedJQ = params.openNum
	self.refreshNeedJQ = params.refreshNum
	self.btnRefresh = nil
	self.btnGetAwards = nil
	self._supportMove = true
	self.remainingRefreshNum = 0
	self.luckyPic = {}
	self.typeLuckyGift = tonumber(params.type)

	main_scene.ui:togglePanel("npc")

	local bigBg = display.newSprite(res.gettex2("pic/common/black_2.png")):anchor(0, 0):addTo(self)
	self.bg = display.newSprite(res.gettex2("pic/panels/luckyGift/bg.jpg")):anchor(0, 0):addTo(bigBg):pos(10, 10)

	self.size(self, bigBg.getw(bigBg), bigBg.geth(bigBg)):center():anchor(0.5, 0.5)
	an.newLabel("�踣��", 20, 0, {
		color = def.colors.labelTitle
	}):anchor(0.5, 0.5):pos(bigBg.getw(bigBg)/2, bigBg.geth(bigBg) - 23):addTo(bigBg)
	an.newBtn(res.gettex2("pic/common/close10.png"), function ()
		sound.playSound("103")
		self:hidePanel()

		return 
	end, {
		pressImage = res.gettex2("pic/common/close11.png"),
		size = cc.size(64, 64)
	}).anchor(slot3, 1, 1):pos(self.getw(self) - 9, self.geth(self) - 9):addTo(self)

	local function helpBtnCB()
		sound.playSound("103")

		local texts = {
			{
				"1.���Ĳ�ͬ�����Ľ�ȯ���Բ�ͬ�ĺ踣������ͬ�踣�����ز�ͬ�������ͨ�����մ�ʹ��ѯ��\n"
			},
			{
				"2.�����踣�����ֱ��չʾ6��Ʒ��\n"
			},
			{
				"3.����һ����ȯ��ˢ�½�Ʒ����ˢ�µ�ǰ��Ʒ������һ��Ʒ��ÿ���踣�����ˢ��6�Ρ�\n"
			},
			{
				"4.�������ȡ��Ʒ���ɽ���ǰչʾ�Ľ�Ʒ��ȡ����������ȷ�������ռ���㡣\n"
			},
			{
				"5.�ʱ�����ʱ�����δ�콱�ĺ踣�����뼰ʱ��ȡ��Ʒ��"
			}
		}
		local msgbox = an.newMsgbox(texts)

		return 
	end

	an.newBtn(res.gettex2("pic/common/question.png"), slot3, {
		pressBig = true,
		pressImage = res.gettex2("pic/common/question.png")
	}):pos(30, 30):addTo(self.bg)
	an.newLabel("ʣ�ཱȯ��", 18, 0, {
		color = def.colors.Cf0c896
	}):addTo(self.bg):anchor(0.5, 0.5):pos(self.bg:getw()/2 - 130, labelPosY)

	self.remaingJQ = an.newLabel(g_data.player:getCoupon(), 18, 0, {
		color = def.colors.white
	}):addTo(self.bg):anchor(0, 0.5):pos(self.bg:getw()/2 - 75, labelPosY)

	an.newLabel("ʣ�࿪��������", 18, 0, {
		color = def.colors.Cf0c896
	}):addTo(self.bg):anchor(0.5, 0.5):pos(self.bg:getw()/2 + 130, labelPosY)

	self.labelCanOpenTimes = an.newLabel("0", 18, 0, {
		color = def.colors.white
	}):addTo(self.bg):anchor(0, 0.5):pos(self.bg:getw()/2 + 200, labelPosY)

	self.showFrameWithLocks(self)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_OpenHongFuBag, self, self.onSM_OpenHongFuBag)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_GetHongFuBagItem, self, self.onSM_GetHongFuBagItem)

	if params.tInfo then
		local awardItems = string.split(params.tInfo.FHongFuBagItemList, "/")

		self.showAwards(self, awardItems)
		self.showRefreshAndGetGiftBtns(self, params.tInfo.FHongFuBagFlashTime)
		self.showRefreshJQ(self, self.refreshNeedJQ)
		self.labelCanOpenTimes:setString(params.tInfo.FUserCanOpenNum)
	else
		local rsb = DefaultClientMessage(CM_OpenHongFuBag)
		rsb.FBagType = self.typeLuckyGift
		rsb.FOpenType = 1

		MirTcpClient:getInstance():postRsb(rsb)
	end

	return 
end
luckyGift.showFrameWithLocks = function (self)
	for i = 1, 12, 1 do
		self.bigFrames[i] = res.get2("pic/panels/activity/itembg.png"):addto(self.bg):pos((i - 1)%6*95 + 75, (math.ceil(i/6) - 1)*85 - 280)
		self.smallFrames[i] = res.get2("pic/panels/bag/itembg.png"):addto(self.bigFrames[i]):pos(self.bigFrames[i]:getw()/2, self.bigFrames[i]:geth()/2)
		self.locks[i] = res.get2("pic/panels/storage/icon_lock_bg.png"):addto(self.bigFrames[i]):pos(self.bigFrames[i]:getw()/2, self.bigFrames[i]:geth()/2)
	end

	return 
end
luckyGift.showContinueOpenBtns = function (self)
	if self.btnRefresh then
		self.btnRefresh:removeSelf()

		self.btnRefresh = nil
	end

	if self.btnGetAwards then
		self.btnGetAwards:removeSelf()

		self.btnGetAwards = nil
	end

	self.continueOpenBtn = an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		sound.playSound("103")

		local rsb = DefaultClientMessage(CM_OpenHongFuBag)
		rsb.FBagType = self.typeLuckyGift
		rsb.FOpenType = 1

		MirTcpClient:getInstance():postRsb(rsb)

		return 
	end, {
		clickSpace = 1,
		label = {
			"��������",
			18,
			0,
			{
				color = def.colors.Cf0c896
			}
		},
		pressImage = res.gettex2("pic/common/btn21.png")
	}).addTo(slot1, self.bg):pos(self.bg:getw()/2, btnPosY + 23)

	return 
end
luckyGift.showRefreshAndGetGiftBtns = function (self, _refreshNum)
	if self.continueOpenBtn then
		self.continueOpenBtn:removeSelf()

		self.continueOpenBtn = nil
	end

	if not self.btnRefresh then
		local function sendRefreshAwards()
			local rsb = DefaultClientMessage(CM_OpenHongFuBag)
			rsb.FBagType = self.typeLuckyGift
			rsb.FOpenType = 0

			MirTcpClient:getInstance():postRsb(rsb)

			g_data.luckyGift.firstRefreshAwards = false

			return 
		end

		local function showLuckyTip()
			if 0 < #self.luckyPic then
				local texts = {
					{
						"��ǰ��Ʒ����"
					},
					{
						"ϡ�н�Ʒ",
						display.COLOR_RED
					},
					{
						"��ˢ�½�"
					},
					{
						"���³�ȡ",
						display.COLOR_RED
					},
					{
						"��Ʒ��ȷ��ˢ����"
					}
				}

				an.newMsgbox(texts, function (idx)
					if idx == 1 then
						sendRefreshAwards()
					end

					return 
				end, {
					disableScroll = true,
					title = "��ʾ",
					center = true,
					hasCancel = true,
					btnTexts = {
						"ȷ��",
						"ȡ��"
					}
				})
			else
				sendRefreshAwards()
			end

			return 
		end

		self.btnRefresh = an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
			if g_data.luckyGift.firstRefreshAwards then
				local texts = {
					{
						"ȷ������"
					},
					{
						self.refreshNeedJQ .. "��ȯ",
						display.COLOR_RED
					},
					{
						"ˢ�º踣����Ʒ��"
					}
				}

				an.newMsgbox(texts, function (idx)
					if idx == 1 then
						showLuckyTip()
					end

					return 
				end, {
					disableScroll = true,
					title = "��ʾ",
					center = true,
					hasCancel = true,
					btnTexts = {
						"ȷ��",
						"ȡ��"
					}
				})
			else
				showLuckyTip()
			end

			return 
		end, {
			clickSpace = 1,
			label = {
				"ˢ��(" .. slot1 .. ")",
				20,
				0,
				{
					color = def.colors.Cf0c896
				}
			},
			pressImage = res.gettex2("pic/common/btn21.png")
		}):addTo(self.bg):pos(self.bg:getw()/2 - 130, btnPosY)
	else
		self.btnRefresh.label:setString("ˢ��(" .. _refreshNum .. ")")
	end

	if not self.btnGetAwards then
		local function sendGetAwardsMsg()
			sound.playSound("103")

			local rsb = DefaultClientMessage(CM_GetHongFuBagItem)
			rsb.FBagType = self.typeLuckyGift

			MirTcpClient:getInstance():postRsb(rsb)

			return 
		end

		self.btnGetAwards = an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
			if 0 < self.remainingRefreshNum then
				local texts = {
					{
						"��ǰ���п�ˢ�½�Ʒ�Ļ��ᣬȷ��ֱ����ȡ��ǰ��Ʒ��"
					}
				}

				an.newMsgbox(texts, function (idx)
					if idx == 1 then
						sendGetAwardsMsg()
					end

					return 
				end, {
					disableScroll = true,
					title = "��ʾ",
					center = true,
					hasCancel = true,
					btnTexts = {
						"ȷ��",
						"ȡ��"
					}
				})
			else
				sendGetAwardsMsg()
			end

			return 
		end, {
			label = {
				"��ȡ��Ʒ",
				20,
				0,
				{
					color = def.colors.Cf0c896
				}
			},
			pressImage = res.gettex2("pic/common/btn21.png")
		}).addTo(slot3, self.bg):pos(self.bg:getw()/2 + 130, btnPosY)
	end

	return 
end
luckyGift.createJQIcon = function (self)
	local itemJQ = nil
	itemJQ = res.get("items", special.��ȯ)

	itemJQ.setTouchEnabled(itemJQ, true)
	itemJQ.setTouchSwallowEnabled(itemJQ, true)
	itemJQ.addNodeEventListener(itemJQ, cc.NODE_TOUCH_EVENT, function (event)
		if event.name == "began" then
			self.nodeSpecialItem = display.newNode():size(display.width, display.height):addto(display.getRunningScene(), an.z.max)
			local posFrameCenter = itemJQ:convertToWorldSpace(cc.p(itemJQ:getw()/2, itemJQ:geth()/2))
			local bg = display.newScale9Sprite(res.getframe2("pic/scale/scale24.png")):addTo(self.nodeSpecialItem):pos(posFrameCenter.x, posFrameCenter.y + 70)
			local infoT = an.newLabel("��ȯ", 24, 0):addTo(bg):pos(10, 4)

			bg.size(bg, infoT.getw(infoT) + 20, infoT.geth(infoT) + 8)

			return true
		elseif event.name == "ended" then
			self.nodeSpecialItem:removeSelf()
		end

		return 
	end)

	return itemJQ
end
luckyGift.showContinueOpenJQ = function (self, _openNeedJQ)
	self.iconJQ:pos(self.bg:getw()/2 - 15, btnPosY - 23)
	self.jqNum:pos(self.bg:getw()/2 + 15, btnPosY - 23)
	self.jqNum:setString("x" .. self.openNeedJQ)

	return 
end
luckyGift.showRefreshJQ = function (self, _num)
	local poxX = self.bg:getw()/2 - 150

	if not self.iconJQ then
		self.iconJQ = self.createJQIcon(self):add2(self.bg):pos(poxX + 90, btnPosY)
	else
		self.iconJQ:pos(poxX + 90, btnPosY)
	end

	if not self.jqNum then
		self.jqNum = an.newLabel("x" .. _num, 18, 0, {
			color = def.colors.white
		}):add2(self.bg):anchor(0, 0.5):pos(poxX + 120, btnPosY)
	else
		self.jqNum:pos(poxX + 120, btnPosY)
		self.jqNum:setString("x" .. _num)
	end

	return 
end
luckyGift.showAwards = function (self, _awardItems)
	for k, v in pairs(self.awards) do
		v.removeSelf(v)

		v = nil
	end

	for k, v in pairs(self.awardsNum) do
		v.removeSelf(v)

		v = nil
	end

	for k, v in pairs(self.luckyPic) do
		v.removeSelf(v)

		v = nil
	end

	self.luckyPic = {}

	for k, v in pairs(_awardItems) do
		if self.locks[k] then
			self.locks[k]:removeSelf()

			self.locks[k] = nil
		end

		local tAwardInfo = string.split(v, "|")
		local awardName = tAwardInfo[1]
		local tAwardNumTag = string.split(tAwardInfo[2], "#")
		local awardNum = tAwardNumTag[1]
		local awardTag = tAwardNumTag[2]
		self.awards[k], self.awardsNum[k] = itemUse:addFrameWithItemByName(self.smallFrames[k], awardName, awardNum)

		if tonumber(awardTag) == 2 then
			self.luckyPic[#self.luckyPic + 1] = res.get2("pic/panels/activity/minus.png"):addto(self.smallFrames[k], 2):pos(self.smallFrames[k]:getw()/2 + 8, self.smallFrames[k]:geth()/2 + 5)
		elseif tonumber(awardTag) == 1 then
			self.luckyPic[#self.luckyPic + 1] = res.get2("pic/panels/luckyGift/good.png"):addto(self.smallFrames[k], 2):pos(self.smallFrames[k]:getw()/2 + 8, self.smallFrames[k]:geth()/2 + 5)
		end
	end

	return 
end
luckyGift.onSM_OpenHongFuBag = function (self, result, protoId)
	local awardItemsStr = ""
	local refreshNum = 0
	local canOpenNum = 0

	for k, v in pairs(result.FPlayerHongFuBagList) do
		if v.FHongFuBagActType == self.typeLuckyGift then
			awardItemsStr = v.FHongFuBagItemList
			refreshNum = v.FHongFuBagFlashTime
			canOpenNum = v.FUserCanOpenNum
		end
	end

	if awardItemsStr == "" then
		self.hidePanel(self)

		return 
	end

	self.remainingRefreshNum = refreshNum
	local awardItems = string.split(awardItemsStr, "/")

	self.showAwards(self, awardItems)
	self.showRefreshAndGetGiftBtns(self, refreshNum)
	self.showRefreshJQ(self, self.refreshNeedJQ)
	self.remaingJQ:setString(g_data.player:getCoupon())
	self.labelCanOpenTimes:setString(canOpenNum)

	return 
end
luckyGift.onSM_GetHongFuBagItem = function (self, result, protoId)
	for k, v in pairs(self.bigFrames) do
		v.removeSelf(v)

		v = nil
	end

	self.showFrameWithLocks(self)
	self.showContinueOpenBtns(self)
	self.showContinueOpenJQ(self, self.openNeedJQ)

	return 
end

return luckyGift
