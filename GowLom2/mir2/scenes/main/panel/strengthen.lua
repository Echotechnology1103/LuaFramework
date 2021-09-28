local common = import("..common.common")
local item = import("..common.item")
local itemInfo = import("..common.itemInfo")
local strengthen = class("strengthen", function ()
	return display.newNode()
end)

table.merge(slot3, {
	items = {},
	effects = {},
	replaces = {
		"�����۶�",
		"�����۶�",
		"�����۶�",
		"ǿ���۶�",
		"ս���۶�"
	},
	specil = {
		"�������ۼ�",
		"�������ۼ�",
		"�������ۼ�",
		"ǿ�����ۼ�",
		"ս�����ۼ�"
	},
	dec = {
		"����",
		"����",
		"����",
		"ǿ��",
		"ս��"
	}
})

strengthen.ctor = function (self)
	self._scale = self.getScale(self)
	self._supportMove = true
	local bg = res.get2("pic/panels/fusion/bg1.png"):anchor(0, 0):addto(self)
	local center = res.get2("pic/panels/fusion/bg.png"):anchor(0.5, 0):pos(bg.getw(bg)/2, 12):addto(bg)

	display.newSprite(res.gettex2("pic/panels/fusion/fsqh.png")):anchor(0.5, 0.5):pos(bg.getw(bg)*0.5, bg.geth(bg) - 20):add2(bg)
	self.size(self, cc.size(bg.getContentSize(bg).width, bg.getContentSize(bg).height)):anchor(0, 1):pos(10, display.height - 80)
	self.setNodeEventEnabled(self, true)
	self.showBag(self)
	an.newBtn(res.gettex2("pic/common/close10.png"), function ()
		sound.playSound("103")
		self:hidePanel()

		return 
	end, {
		pressImage = res.gettex2("pic/common/close11.png"),
		size = cc.size(64, 64)
	}).anchor(slot3, 1, 1):pos(self.getw(self) - 4, self.geth(self) - 4):addto(self)

	local loopEffAni = res.getani2("pic/panels/fusion/effect/1/%d.png", 1, 8, 0.12)

	loopEffAni.retain(loopEffAni)

	local loopEffSpr = res.get2("pic/panels/fusion/effect/1/1.png"):pos(center.getw(center)*0.5, center.geth(center)*0.5):add2(center, 1)

	loopEffSpr.runForever(loopEffSpr, cc.Animate:create(loopEffAni))

	self.boxs = {}
	local files = {
		"equip",
		"equip",
		"equip",
		"equip",
		"equip",
		"equip2",
		"equip"
	}
	local boxPos = {
		{
			x = 94,
			y = 344
		},
		{
			x = 284,
			y = 344
		},
		{
			x = 94,
			y = 146
		},
		{
			x = 284,
			y = 146
		},
		{
			x = 186,
			y = 248
		}
	}
	local floatLabel = {
		"cyss",
		"cyss",
		"cyss",
		"diamond",
		"cloth"
	}

	res.get2("pic/panels/fusion/equip3.png"):pos(boxPos[5].x, boxPos[5].y):add2(bg, 2)

	for i = 1, 5, 1 do
		self.boxs[i] = res.get2("pic/panels/fusion/" .. files[i] .. ".png"):pos(boxPos[i].x, boxPos[i].y):add2(bg, 2)

		res.get2("pic/panels/fusion/" .. floatLabel[i] .. ".png"):pos(boxPos[i].x, boxPos[i].y):add2(bg, 2)
	end

	an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		local canFusion = true
		local count = 0

		for i = 5, 1, -1 do
			if not self.items[i] then
				if 1 <= i and i <= 3 then
					main_scene.ui:tip("���ȷ�����¼�����", 6)

					return 
				end

				if i == 4 then
					main_scene.ui:tip("�������ʯx888", 6)

					return 
				end

				if i == 5 then
					main_scene.ui:tip("�����Ҫǿ�����·�", 6)

					return 
				end
			elseif i == 4 and self.items[i].data.FDura < 888 then
				main_scene.ui:tip("���ʯ��������888", 6)

				return 
			end
		end

		local msgbox = nil
		local texts = {
			{
				"��ȷ������ʼǿ��\"" .. self.items[5].data:getVar("name") .. "\"��",
				cc.c3b(255, 255, 255)
			},
			{
				"\nǿ�������в���,�������κͽ��ʯ���Զ�����",
				cc.c3b(255, 0, 0)
			}
		}
		slot4 = an.newMsgbox(texts, function (idx)
			if idx == 1 then
				local data = {}

				for i = 1, 4, 1 do
					if self.items[i].isItems then
						data[#data + 1] = {
							"int",
							self.items[i].data.FItemIdent
						}
					end
				end

				if 0 < #data then
					dump(data)

					local rsb = DefaultClientMessage(CM_UPDATE_CLOTHES)
					rsb.TargetItemIdent = self.items[5].data.FItemIdent
					rsb.DiamondIdent = self.items[4].data.FItemIdent
					rsb.materialIdent = self.items[1].data.FItemIdent
					rsb.MaterialIdent2 = self.items[2].data.FItemIdent
					rsb.MaterialIdent3 = self.items[3].data.FItemIdent

					MirTcpClient:getInstance():postRsb(rsb)
				end
			end

			return 
		end, {
			disableScroll = true,
			center = true,
			hasCancel = true
		})
		msgbox = slot4

		return 
	end, {
		pressImage = res.gettex2("pic/common/btn21.png"),
		sprite = res.gettex2("pic/panels/fusion/ksqh.png")
	}).add2(slot8, center, 2):anchor(0.5, 0.5):pos(center.getw(center)*0.5, 36)
	an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		self:oneKey()

		return 
	end, {
		pressImage = res.gettex2("pic/common/btn21.png"),
		sprite = res.gettex2("pic/panels/fusion/allin.png")
	}).add2(slot8, center, 2):anchor(0.5, 0.5):pos(center.getw(center)*0.5 - 114, 36)
	an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		self:itemsBack2bag()

		return 
	end, {
		pressImage = res.gettex2("pic/common/btn21.png"),
		sprite = res.gettex2("pic/panels/fusion/allout.png")
	}).add2(slot8, center, 2):anchor(0.5, 0.5):pos(center.getw(center)*0.5 + 114, 36)

	local frame = 1
	local tmpTex = ""
	self.effects[1] = res.get2("pic/panels/fusion/effect/4/1.png"):add2(self):pos(62, 208):hide()
	self.effects[2] = res.get2("pic/panels/fusion/effect/4/1.png"):add2(self):pos(128, 126):hide()
	self.effects[3] = res.get2("pic/panels/fusion/effect/4/1.png"):add2(self):pos(258, 126):hide()
	self.effects[4] = res.get2("pic/panels/fusion/effect/3/1.png"):add2(self, 4):pos(190, 228):hide()
	local centerAni = res.getani2("pic/panels/fusion/effect/3/%d.png", 1, 16, 0.26)

	centerAni.retain(centerAni)
	self.effects[4]:runForever(cc.Animate:create(centerAni))

	local time = display.newNode():add2(self)

	time.runForever(time, transition.sequence({
		cc.DelayTime:create(0.2),
		cc.CallFunc:create(function ()
			frame = frame + 1
			frame = (10 < frame and 1) or frame
			tmpTex = "pic/panels/fusion/effect/4/" .. frame .. ".png"

			for i = 1, 3, 1 do
				self.effects[i]:setTex(res.gettex2(tmpTex))
			end

			return 
		end)
	}))

	self.items = {}

	self.addNodeEventListener(slot0, cc.NODE_EVENT, function (event)
		if event.name == "cleanup" then
			self:itemsBack2bag()
		end

		return 
	end)

	return 
end
strengthen.showResult = function (self)
	local loopEffAni = res.getani2("pic/panels/fusion/effect/2/%d.png", 1, 8, 0.16)

	loopEffAni.retain(loopEffAni)

	local loopEffSpr = res.get2("pic/panels/fusion/effect/2/1.png"):pos(self.getw(self)*0.5, self.geth(self)*0.5):add2(self, 9)

	loopEffSpr.runs(loopEffSpr, {
		cc.Animate:create(loopEffAni),
		cc.CallFunc:create(function ()
			loopEffSpr:removeSelf()

			return 
		end)
	})

	return 
end
strengthen.showBag = function (self)
	if main_scene.ui.panels then
		if main_scene.ui.panels.bag then
			main_scene.ui.panels.bag:pos(self.getw(self) + 10, display.height - 80):anchor(0, 1)
		else
			main_scene.ui:togglePanel("bag")
			main_scene.ui.panels.bag:pos(self.getw(self) + 10, display.height - 80)
		end
	end

	return 
end
strengthen.showEffect = function (self, bShow)
	for i = 1, 4, 1 do
		if bShow then
			self.effects[i]:show()
		else
			self.effects[i]:hide()
		end
	end

	return 
end
strengthen.uptItem = function (self, makeIndex)
	local item = g_data.bag:getItemStrengthen(makeIndex)

	if not item then
		return 
	end

	for i, v in pairs(self.items) do
		if v and v.isItems and v.data.FItemIdent == makeIndex then
			v.data = item

			break
		end
	end

	return 
end
strengthen.putItem = function (self, item, x, y)
	local form = item.formPanel.__cname
	local target = nil

	for i = 1, 5, 1 do
		local tmpX, tmpY = self.idx2pos(self, i)

		if (tmpX - x)*(tmpX - x) < 1600 and (tmpY - y)*(tmpY - y) < 1600 then
			target = i
		end
	end

	if not target then
		return 
	end

	if form == "bag" and g_data.client:checkLastTime("strengthen", 2) then
		local data = item.data

		self.getItemFromBg(self, data, target)
	end

	return 
end
strengthen.getBackItem = function (self, item)
	local data = item.data

	if not data then
		return 
	end

	g_data.bag:addItem(data)

	if main_scene.ui.panels.bag then
		main_scene.ui.panels.bag:addItem(data.FItemIdent)
	end

	local target = nil

	for i, v in pairs(self.items) do
		if v and v.isItems and v.data.FItemIdent == data.FItemIdent then
			target = i

			v.removeSelf(v)

			self.items[i] = nil
			g_data.bag.strengthen[i] = nil

			break
		end
	end

	return 
end
strengthen.getItemFromBg = function (self, data, pos)
	local tmpItem = self.items[pos]

	g_data.bag:delItem(data.FItemIdent)

	if main_scene.ui.panels.bag then
		main_scene.ui.panels.bag:delItem(data.FItemIdent)
	end

	g_data.client:setLastTime("strengthen", true)
	self.addItem(self, pos, data)

	return 
end
strengthen.delItem = function (self, itemIndex)
	for i, v in pairs(self.items) do
		if v and v.isItems and v.data.FItemIdent == itemIndex then
			v.removeSelf(v)

			self.items[i] = nil
			g_data.bag.strengthen[i] = nil

			break
		end
	end

	return 
end
strengthen.duraChange = function (self, makeindex)
	local data = g_data.bag:getItemStrengthen(makeindex)

	for k, v in pairs(self.items) do
		if makeindex == v.data.FItemIdent then
			v.data = data

			if k == 4 then
				self.rebackBag(self, data)

				g_data.bag.strengthen[k] = nil

				v.removeSelf(v)

				self.items[k] = nil
			end

			return 
		end
	end

	return 
end
strengthen.rebackBag = function (self, data)
	g_data.bag:addItem(data)

	if main_scene.ui.panels.bag then
		main_scene.ui.panels.bag:addItem(data.FItemIdent)
	end

	return 
end
strengthen.oneKey = function (self)
	local itemsName = {
		"ʥս",
		"����",
		"����",
		"����",
		"����",
		"��ָ",
		"ͷ��"
	}

	local function getJew()
		for i = 1, 3, 1 do
			for k = 4, 7, 1 do
				local name = itemsName[i] .. itemsName[k]
				local bagItem = g_data.bag:getItemWithName(name)

				if bagItem then
					return bagItem
				end
			end
		end

		return 
	end

	local jewTip = false

	for i = 1, 3, 1 do
		if not self.items[i] then
			local target = slot2()

			if target then
				self.getItemFromBg(self, target, i)
			elseif not jewTip then
				main_scene.ui:tip("�������β���", 6)

				jewTip = true
			end
		end
	end

	if not self.items[4] then
		local target = g_data.bag:getItemWithNameAndDura("���ʯ", 888)

		if not target then
			main_scene.ui:tip("���ʯ����", 6)
		else
			self.getItemFromBg(self, target, 4)
		end
	end

	if not self.items[5] then
		local cloth = {
			"����ս��",
			"����ħ��",
			"��â����"
		}
		local target = g_data.bag:getItemWithShortName(cloth)

		if not target then
			main_scene.ui:tip("������û��\"����ս��\",\"����ħ��\",\"��â����\"�е�һ��", 6)
		else
			self.getItemFromBg(self, target, 5)
		end
	end

	return 
end
strengthen.itemsBack2bag = function (self)
	local makeIndexs = {}

	for i, v in pairs(self.items) do
		if v.isItems then
			g_data.bag:addItem(v.data)

			makeIndexs[#makeIndexs + 1] = v.data.FItemIdent
		end

		v.removeSelf(v)
	end

	self.items = {}

	if main_scene.ui.panels.bag then
		for i, v in ipairs(makeIndexs) do
			main_scene.ui.panels.bag:addItem(v)
		end
	end

	g_data.bag.strengthen = {}

	return 
end
strengthen.addItem = function (self, idx, data)
	sound.play("item", data)

	if 1 <= idx and idx <= 3 and not self.isNeedJewelry(self, data) then
		main_scene.ui:tip("�������ȷ�ĳ��¼�����", 6)
		self.rebackBag(self, data)

		return 
	end

	if idx == 4 and data.getVar(data, "name") ~= "���ʯ" then
		main_scene.ui:tip("�������ʯ", 6)
		self.rebackBag(self, data)

		return 
	end

	if idx == 5 then
		local cloth = {
			"����ս��",
			"����ħ��",
			"��â����"
		}
		local isIn = false
		local name = data.getVar(data, "name")

		for i, v in ipairs(cloth) do
			if string.find(name, v) then
				isIn = true
			end
		end

		if not isIn then
			main_scene.ui:tip("�����\"����ս��\",\"����ħ��\",\"��â����\"�е�һ��", 6)
			self.rebackBag(self, data)

			return 
		end
	end

	local tmpItem = self.items[idx]

	if tmpItem then
		if tmpItem.isItems then
			g_data.bag:addItem(tmpItem.data)

			if main_scene.ui.panels.bag then
				main_scene.ui.panels.bag:addItem(tmpItem.data.FItemIdent)
			end
		end

		tmpItem.removeSelf(tmpItem)
	end

	self.items[idx] = item.new(data, self, {
		idx = idx
	}):addto(self, 3):pos(self.idx2pos(self, idx))
	self.items[idx].isItems = true
	g_data.bag.strengthen[idx] = data

	return 
end
strengthen.isNeedJewelry = function (self, data)
	local jewelry = {
		"��ָ",
		"����",
		"����",
		"ͷ��"
	}
	local job = {
		"����",
		"ʥս",
		"����"
	}

	local function isInName(name, list)
		if type(list) == "table" and type(name) == "string" then
			for i, v in ipairs(list) do
				if string.find(name, v) then
					return true
				end
			end
		end

		return 
	end

	if slot4(data.getVar(data, "name"), jewelry) and isInName(data.getVar(data, "name"), job) then
		return true
	end

	return 
end
strengthen.idx2pos = function (self, idx)
	local boxPos = {
		{
			x = 94,
			y = 344
		},
		{
			x = 284,
			y = 344
		},
		{
			x = 94,
			y = 146
		},
		{
			x = 284,
			y = 146
		},
		{
			x = 186,
			y = 248
		}
	}

	return boxPos[idx].x, boxPos[idx].y
end
strengthen.showReplaceTips = function (self, scenePos)
	if not self.items[1] or not self.items[1].isItems then
		return 
	end

	local name = self.items[1].data:getVar("name")
	local layer = display.newNode():size(display.width, display.height):addto(main_scene.ui, main_scene.ui.z.textInfo)

	layer.setTouchEnabled(layer, true)
	layer.setTouchSwallowEnabled(layer, false)
	layer.addNodeEventListener(layer, cc.NODE_TOUCH_CAPTURE_EVENT, function (event)
		if event.name == "ended" then
			layer:runs({
				cc.DelayTime:create(0.01),
				cc.RemoveSelf:create(true)
			})
		end

		return true
	end)

	local labels = {
		an.newLabel(self.replaces[self.level], 20, 1, {
			color = cc.c3b(255, 255, 0)
		}),
		an.newLabel("���滻" .. slot2 .. "����װ���ϳɡ�", 20, 1),
		an.newLabel("�۸�" .. self.price .. "Ԫ����", 20, 1),
		an.newLabel("װ�������ֱ���滻��", 20, 1)
	}
	local bg = display.newScale9Sprite(res.getframe2("pic/scale/scale4.png")):addto(layer):anchor(0, 1)
	local w = 0
	local h = 7
	local space = -2

	for i = #labels, 1, -1 do
		local v = labels[i]:addto(bg, 99):anchor(0, 0):pos(10, h)
		w = math.max(w, v.getw(v))
		h = h + v.geth(v) + space
	end

	w = w + 20
	h = h + 10
	local rect = cc.rect(0, 0, display.width, display.height)
	local p = scenePos

	if p.x < rect.x then
		p.x = rect.x
	end

	if rect.width < p.x + w then
		p.x = rect.width - w
	end

	if rect.height < p.y then
		p.y = rect.height
	end

	if p.y - h < rect.y then
		p.y = h + rect.y
	end

	bg.size(bg, w, h):pos(p.x, p.y)

	return 
end
strengthen.showSimpleTips = function (self, targetList, scenePos)
	local layer = display.newNode():size(display.width, display.height):addto(main_scene.ui, main_scene.ui.z.textInfo)

	layer.setTouchEnabled(layer, true)
	layer.setTouchSwallowEnabled(layer, false)
	layer.addNodeEventListener(layer, cc.NODE_TOUCH_CAPTURE_EVENT, function (event)
		if event.name == "ended" then
			layer:runs({
				cc.DelayTime:create(0.01),
				cc.RemoveSelf:create(true)
			})
		end

		return true
	end)

	local labels = {}

	function add(text, color)
		text = text or ""
		labels[#labels + 1] = an.newLabel(text, 20, 1, {
			color = color
		})

		return 
	end

	function addAttr(data, text, key)
		local front = data[key] or 0
		local after = data["max" .. key] or 0

		if 0 < front or 0 < after then
			add(text .. front .. "-" .. after)
		end

		return 
	end

	function addAttr2(text, value, normalValue, color, attachText)
		attachText = attachText or ""

		add(text .. value .. attachText, color)

		return 
	end

	function needColor(a, b)
		return (b <= a and display.COLOR_GREEN) or display.COLOR_RED
	end

	function addNeed(data)
		local need = data.need
		local needLevel = data.needLevel

		if need == 0 then
			local strlvl = common.getLevelText(needLevel)

			add("��Ҫ�ȼ�: " .. strlvl .. "��", display.COLOR_RED)
		elseif need == 1 then
			add("��Ҫ������: " .. needLevel, display.COLOR_RED)
		elseif need == 2 then
			add("��Ҫħ����: " .. needLevel, display.COLOR_RED)
		elseif need == 3 then
			add("��Ҫ������: " .. needLevel, display.COLOR_RED)
		elseif need == 4 then
			add("��Ҫת���ȼ�: " .. needLevel, display.COLOR_GREEN)
		elseif need == 40 then
			add("��Ҫת��&�ȼ�: " .. needLevel, display.COLOR_GREEN)
		elseif need == 41 then
			add("��Ҫת��&������: " .. needLevel, display.COLOR_GREEN)
		elseif need == 42 then
			add("��Ҫת��&ħ����: " .. needLevel, display.COLOR_GREEN)
		elseif need == 43 then
			add("��Ҫת��&��������: " .. needLevel, display.COLOR_GREEN)
		elseif need == 44 then
			add("��Ҫת��&������: " .. needLevel, display.COLOR_GREEN)
		elseif need == 5 then
			add("��Ҫ������: " .. needLevel, display.COLOR_GREEN)
		elseif need == 6 then
			add("�л��Աר��", display.COLOR_GREEN)
		elseif need == 60 then
			add("�л�����ר��", display.COLOR_GREEN)
		elseif need == 7 then
			add("ɳ�ǳ�Աר��", display.COLOR_GREEN)
		elseif need == 70 then
			add("ɳ������ר��", display.COLOR_GREEN)
		elseif need == 8 then
			add("��Աר��", display.COLOR_GREEN)
		elseif need == 81 then
			add("��Ա���� =" .. Loword(needLevel) .. "���ȼ�>=" .. Hiword(needLevel), display.COLOR_GREEN)
		elseif need == 82 then
			add("��Ա���� >= " .. Loword(needLevel) .. "���ȼ�>=" .. Hiword(needLevel), display.COLOR_GREEN)
		end

		return 
	end

	local function tmpModf(value)
		local int, f = math.modf(value)

		return (0.5 <= f and int + 1) or int
	end

	if 1 < #targetList then
		labels[#labels + 1] = an.newLabel("�ɻ��������Ʒ�е����һ��", 20, 1, {
			color = cc.c3b(255, 0, 0)
		})
	end

	for i, v in ipairs(slot1) do
		local data = def.items[v] or {}

		if 1 < #targetList then
			labels[#labels + 1] = an.newLabel("     ", 20, 1, {
				color = cc.c3b(255, 255, 0)
			})
		end

		labels[#labels + 1] = an.newLabel(data.name, 20, 1, {
			color = cc.c3b(255, 255, 0)
		})
		labels[#labels + 1] = an.newLabel("����: " .. data.weight, 20, 1)

		add("�־�: " .. data.duraMax/1000 .. "/" .. data.duraMax/1000)

		local AC = data.getVar(data, "AC")
		local maxAC = data.getVar(data, "maxAC")
		local MAC = data.getVar(data, "MAC")
		local maxMAC = data.getVar(data, "maxMAC")
		local ACN = data.getVar(data, "AC")
		local maxACN = data.getVar(data, "maxAC")
		local MACN = data.getVar(data, "MAC")
		local maxMACN = data.getVar(data, "maxMAC")
		local stdMode = data.getVar(data, "stdMode")

		if stdMode == 19 or stdMode == 53 then
			if 0 < maxAC then
				addAttr2("ħ�����: +", maxAC, maxACN, display.COLOR_GREEN, "0��")
			end

			if 0 < maxMAC then
				addAttr2("����: +", maxMAC, maxMACN, display.COLOR_GREEN)
			end

			if 0 < MAC then
				add("����: +" .. MAC, display.COLOR_RED)
			end
		elseif stdMode == 20 or stdMode == 24 then
			if 0 < AC then
				addAttr2("׼ȷ: +", maxAC, maxACN, display.COLOR_GREEN)
			end

			if 0 < MAC then
				addAttr2("����: +", maxMAC, maxMACN, display.COLOR_GREEN)
			end
		elseif stdMode == 21 then
			if 0 < maxAC then
				addAttr2("�����ָ�: +", maxAC, maxACN, display.COLOR_GREEN, "0��")
			end

			if 0 < maxMAC then
				addAttr2("ħ���ָ�: +", maxMAC, maxMACN, display.COLOR_GREEN, "0��")
			end

			if 0 < AC then
				addAttr2("�����ٶ�: +", AC, ACN, display.COLOR_GREEN)
			end

			if 0 < MAC then
				add("�����ٶ�: -" .. MAC, display.COLOR_RED)
			end
		elseif stdMode == 23 then
			if 0 < maxAC then
				addAttr2("������: +", maxAC, maxACN, display.COLOR_GREEN, "0��")
			end

			if 0 < maxMAC then
				addAttr2("�ж��ָ�: +", maxMAC, maxMACN, display.COLOR_GREEN, "0��")
			end

			if 0 < AC then
				addAttr2("�����ٶ�: +", AC, ACN, display.COLOR_GREEN)
			end

			if 0 < MAC then
				add("�����ٶ�: -" .. MAC, display.COLOR_RED)
			end
		elseif stdMode == 28 or stdMode == 27 then
			addAttr("����: ", "AC")
			addAttr("ħ��: ", "MAC")

			if 0 < getData("aniCount") then
				add("����: +" .. getData("aniCount"), display.COLOR_GREEN)
			end
		elseif stdMode == 63 then
			if 0 < AC then
				add("HP: +" .. AC, display.COLOR_GREEN)
			end

			if 0 < maxAC then
				add("MP: +" .. maxAC, display.COLOR_GREEN)
			end

			if 0 < maxMAC then
				addAttr2("����: +", maxMAC, maxMACN, display.COLOR_GREEN)
			end

			if 0 < MAC then
				add("����: +" .. MAC, display.COLOR_RED)
			end
		else
			addAttr(data, "����: ", "AC")
			addAttr(data, "ħ��: ", "MAC")
		end

		addAttr(data, "����: ", "DC")
		addAttr(data, "ħ��: ", "MC")
		addAttr(data, "����: ", "SC")

		if stdMode ~= 52 then
			addNeed(data)
		end
	end

	local bg = display.newScale9Sprite(res.getframe2("pic/scale/scale4.png")):addto(layer):anchor(0, 1)
	local w = 0
	local h = 7
	local space = -2

	for i = #labels, 1, -1 do
		local v = labels[i]:addto(bg, 99):anchor(0, 0):pos(10, h)
		w = math.max(w, v.getw(v))
		h = h + v.geth(v) + space
	end

	w = w + 20
	h = h + 10
	local rect = cc.rect(0, 0, display.width, display.height)
	local p = scenePos

	if p.x < rect.x then
		p.x = rect.x
	end

	if rect.width < p.x + w then
		p.x = rect.width - w
	end

	if rect.height < p.y then
		p.y = rect.height
	end

	if p.y - h < rect.y then
		p.y = h + rect.y
	end

	bg.size(bg, w, h):pos(p.x, p.y)

	return 
end
strengthen.showError = function (self, errorCode)
	local errorMsg = {
		[-1] = "δ�ڱ������ҵ����װ��",
		[-2] = "������·�������Ҫ��",
		[-3] = "�㴩�����·��Ѿ�ǿ����3���ˣ������ٴ�ǿ��",
		[-4] = "δ�ṩ�㹻�ĳ���װ��",
		[-5] = "�ύ�Ľ��ʯ����",
		[-6] = "ǿ��ʧ��"
	}

	main_scene.ui:tip(errorMsg[errorCode] or "δ֪����", 6)

	return 
end

return strengthen
