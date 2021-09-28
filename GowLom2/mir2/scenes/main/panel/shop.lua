local common = import("..common.common")
local waiting = import("..common.waiting")
local shop = class("shop", function ()
	return display.newNode()
end)

table.merge(slot2, {})

shop.ctor = function (self, panelType)
	g_data.shop:clearGoods()

	local bg = res.get2("pic/common/black_2.png"):addTo(self):anchor(0, 0)
	local bgSize = bg.getContentSize(bg)
	self.bg = bg

	self.size(self, bgSize)
	self.pos(self, display.width/2 - bgSize.width/2, display.height/2 - bgSize.height/2)

	self._supportMove = true

	an.newLabel("�̳�", 20, 0, {
		color = def.colors.Cd2b19c
	}):anchor(0.5, 0.5):addTo(bg):pos(bg.getw(bg)/2, bg.geth(bg) - 22)
	an.newBtn(res.gettex2("pic/common/close10.png"), function ()
		sound.playSound("103")
		self:hidePanel()

		return 
	end, {
		pressImage = res.gettex2("pic/common/close11.png"),
		size = cc.size(64, 64)
	}).addTo(slot4, bg):pos(bg.getw(bg) - 9, bg.geth(bg) - 9):anchor(1, 1)

	local tabInfo = {
		"��\n��",
		"��\nֵ"
	}

	if VERSION_REVIEW then
		tabInfo = {
			"��\n��"
		}
	end

	local tags = {
		"shop",
		"charge"
	}

	if VERSION_BLOCK_CHAIN then
		table.insert(tabInfo, "G\n��")
		table.insert(tags, "hongZuan")
	end

	if g_data.player:getIsCrossServer() then
		tabInfo = {
			"��\n��"
		}
		slot6 = {
			"shop"
		}
	end

	if g_data.login:getServerType() == 1 then
		tabInfo = {
			"��\n��"
		}
		slot6 = {
			"shop"
		}
	end

	local tabs = common.tabs(bg, {
		ox = 4,
		size = 20,
		strokeSize = 1,
		oy = 8,
		strs = tabInfo,
		lc = {
			normal = def.colors.Ca6a197,
			select = def.colors.Cf0c896
		}
	}, function (idx, btn)
		self.panel_type = idx
		self.tag1 = tags[idx]

		if self.tag1 == "shop" then
			self:load("hot")
		elseif self.tag1 == "charge" then
			local rsb = DefaultClientMessage(CM_RechargeList)

			MirTcpClient:getInstance():postRsb(rsb)
			main_scene.ui.waiting:show(10, "CM_RechargeList")
		elseif self.tag1 == "hongZuan" then
			self:load("hot")
		end

		return 
	end, {
		tabTp = 1,
		pos = {
			offset = 70,
			x = 0,
			y = bg.geth(slot2) - 38,
			anchor = cc.p(1, 1)
		}
	})
	self.panel_type = panelType

	tabs.click(panelType)
	MirTcpClient:getInstance():subscribeMemberOnProtocol(SM_NewOrder, self, self.onSM_NewOrder)

	return 
end
shop.load = function (self)
	if self.tag1Node then
		self.tag1Node:removeSelf()
	end

	self.tag1Node = display.newNode():addTo(self)

	display.newScale9Sprite(res.getframe2("pic/common/black_5.png"), 0, 0, cc.size(127, 336)):addTo(self.tag1Node):pos(12, 405):anchor(0, 1)
	display.newScale9Sprite(res.getframe2("pic/common/black_5.png"), 0, 0, cc.size(480, 336)):addTo(self.tag1Node):pos(146, 405):anchor(0, 1)

	local strs = {
		shop = {
			"����",
			"����",
			"װ��",
			"����",
			"����",
			tags = {
				{
					"hot",
					1
				},
				{
					"dep",
					2
				},
				{
					"ornament",
					3
				},
				{
					"function",
					4
				},
				{
					"holiday",
					5
				}
			}
		},
		charge = {}
	}

	if VERSION_BLOCK_CHAIN then
		strs = {
			shop = {
				"����",
				"����",
				"װ��",
				"����",
				"����",
				tags = {
					{
						"hot",
						1
					},
					{
						"dep",
						2
					},
					{
						"ornament",
						3
					},
					{
						"function",
						4
					},
					{
						"holiday",
						5
					}
				}
			},
			hongZuan = {
				"����",
				"����",
				"װ��",
				"����",
				"����",
				tags = {
					{
						"hot",
						1
					},
					{
						"dep",
						2
					},
					{
						"ornament",
						3
					},
					{
						"function",
						4
					},
					{
						"holiday",
						5
					}
				}
			},
			charge = {}
		}
	end

	common.tabs(self.tag1Node, {
		size = 20,
		strs = strs[self.tag1],
		lc = {
			normal = def.colors.Cf0c896,
			select = def.colors.Cf0c896
		}
	}, function (idx, btn)
		if not strs[self.tag1].tags then
			return 
		end

		self.tag2 = strs[self.tag1].tags[idx][1]
		self.curSubIdx = strs[self.tag1].tags[idx][2]
		local items = nil

		if self.tag1 == "shop" then
			items = g_data.shop:getCurTypePageGoods(self.curSubIdx)
		elseif self.tag1 == "hongZuan" then
			items = g_data.shop:getCurHZTypePageGoods(self.curSubIdx)
		end

		if #items == 0 then
			if self.tag1 == "shop" then
				local rsb = DefaultClientMessage(CM_SHOP_QUERY)
				rsb.ShopType = self.curSubIdx

				MirTcpClient:getInstance():postRsb(rsb)
			elseif self.tag1 == "hongZuan" then
				local rsb = DefaultClientMessage(CM_BLOCKCHAIN_SHOP_Query)
				rsb.ShopType = self.curSubIdx

				MirTcpClient:getInstance():postRsb(rsb)
			end

			if self.tag2Node then
				self.tag2Node:removeSelf()

				self.tag2Node = nil
			end
		else
			self:processUpt(self.curSubIdx, items)
		end

		return 
	end, {
		tabTp = 2,
		pos = {
			offset = 50,
			x = 21,
			y = self.geth(common) - 84,
			anchor = cc.p(0, 0.5)
		}
	})

	local txts = {
		shop = {
			"����һ�",
			"��ȯ�һ�"
		}
	}

	if VERSION_BLOCK_CHAIN then
		txts.hongZuan = {
			"�ҵ�G��"
		}
	end

	local function clickBottomBtn(param)
		sound.playSound("103")

		if self.tag1 == "shop" and param == 1 then
			self:showExchangeLingFu()
		elseif self.tag1 == "shop" and param == 2 then
			self:showExchangeJiangQuan()
		elseif self.tag1 == "hongZuan" and param == 1 then
			print("hongZuan")
			GRedCoinSdk:getInstance():showWallet(function (info)
				print("showWallet success")

				return 
			end, function (error)
				print("showWallet failed", error)

				if error == 2 or error == 4 or error == -10331003 then
					local rsb = DefaultClientMessage(CM_BlockChainChannelLogin)

					MirTcpClient:getInstance():postRsb(rsb)
				end

				return 
			end)
		end

		return 
	end

	for i = 1, #txts[self.tag1], 1 do
		an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
			return clickBottomBtn(i)
		end, {
			pressImage = res.gettex2("pic/common/btn21.png"),
			label = {
				txts[self.tag1][i],
				20,
				0,
				{
					color = cc.c3b(240, 200, 150)
				}
			}
		}).pos(slot8, (i - 1)*110 - 568, 40):addto(self.tag1Node)
	end

	return 
end
shop.processUpt = function (self, tag2Num, items)
	if self.curSubIdx ~= tag2Num or not items then
		return 
	end

	if self.tag2Node then
		self.tag2Node:removeSelf()
	end

	self.tag2Node = display.newNode():addTo(self)

	if #items == 0 then
		an.newLabel("������Ʒ��", 20, 0):anchor(0.5, 0.5):add2(self.tag2Node):pos(392, 246)

		return 
	end

	local infoView = an.newScroll(150, 74, 478, 326):add2(self.tag2Node)
	local h = 161

	infoView.setScrollSize(infoView, 478, math.max(326, math.modf((#items - 1)/2)*h))

	for i, v in ipairs(items) do
		local indexOf0 = string.find(v.FItemStr, "0")
		local itemNameRemoved0102 = ""

		if indexOf0 == nil then
			itemNameRemoved0102 = v.FItemStr
		else
			itemNameRemoved0102 = string.sub(v.FItemStr, 1, indexOf0 - 1)
		end

		local index = def.items.name2Index[itemNameRemoved0102] or 0
		local stdItem = def.items[index]

		if stdItem then
			local node = res.get2("pic/panels/shop/shopitembg.png"):anchor(0, 1):pos((i%2 == 0 and 240) or 0, infoView.getScrollSize(infoView).height - math.modf((i - 1)/2)*h):add2(infoView)

			res.get2("pic/panels/shop/frame.png"):pos(50, 60):add2(node):enableClick(function (x, y)
				self:showItemInfo(v, cc.p(x, y))

				return 
			end)
			res.get("items", stdItem.getVar(slot13, "looks") or 0):pos(50, 60):add2(node)
			an.newLabel(v.FItemCnt, 14, 1, {
				color = cc.c3b(0, 255, 0)
			}):anchor(0.5, 0.5):pos(70, 43):add2(node)
			an.newLabel(itemNameRemoved0102, 20, 1, {
				color = cc.c3b(240, 200, 150)
			}):anchor(0.5, 0.5):add2(node):pos(node.getw(node)*0.5, node.geth(node) - 26)
			res.get2("pic/panels/shop/line02.png"):pos(node.getw(node)*0.5, node.geth(node) - 40):add2(node)

			local butPos = {}

			if v.FYBPrice == 0 or v.FYDPrice == 0 then
				butPos[1] = {
					160,
					60
				}
				butPos[2] = {
					160,
					60
				}
			else
				butPos[1] = {
					160,
					86
				}
				butPos[2] = {
					160,
					34
				}
			end

			if v.FHZPrice ~= 0 then
				butPos[1] = {
					160,
					60
				}
				butPos[2] = {
					160,
					60
				}
			end

			if v.FYBPrice ~= 0 then
				local texts = {
					{
						"��ȷ��ʹ��",
						cc.c3b(255, 255, 255)
					},
					{
						v.FYBPrice .. "Ԫ��",
						cc.c3b(255, 0, 0)
					},
					{
						"����",
						cc.c3b(255, 255, 255)
					},
					{
						itemNameRemoved0102,
						cc.c3b(240, 200, 150)
					},
					{
						"��",
						cc.c3b(255, 255, 255)
					}
				}

				an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
					sound.playSound("103")

					local box = an.newMsgbox(texts, function (isOk)
						if isOk == 1 then
							self:buyShopItem(v.FItemStr, 1)
						end

						return 
					end, {
						disableScroll = true,
						fontSize = 20,
						title = "�̳ǹ���",
						center = true,
						hasCancel = true
					})

					return 
				end, {
					pressImage = res.gettex2("pic/common/btn21.png"),
					label = {
						v.FYBPrice .. "",
						18,
						0,
						{
							color = def.colors.Cf0c896
						}
					},
					labelOffset = cc.p(-20, 0),
					sprite = res.gettex2("pic/console/infobar/yb.png"),
					spriteOffset = cc.p(20, 0)
				}).add2(slot17, node):anchor(0.5, 0.5):pos(butPos[1][1], butPos[1][2])
			end

			if v.FYDPrice ~= 0 then
				local texts = {
					{
						"��ȷ��ʹ��",
						cc.c3b(255, 255, 255)
					},
					{
						v.FYDPrice .. "����",
						cc.c3b(255, 0, 0)
					},
					{
						"����",
						cc.c3b(255, 255, 255)
					},
					{
						itemNameRemoved0102,
						cc.c3b(240, 200, 150)
					},
					{
						"��",
						cc.c3b(255, 255, 255)
					}
				}

				an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
					sound.playSound("103")

					local box = an.newMsgbox(texts, function (isOk)
						if isOk == 1 then
							self:buyShopItem(v.FItemStr, 2)
						end

						return 
					end, {
						disableScroll = true,
						fontSize = 20,
						title = "�̳ǹ���",
						center = true,
						hasCancel = true
					})

					return 
				end, {
					pressImage = res.gettex2("pic/common/btn21.png"),
					label = {
						v.FYDPrice .. "",
						18,
						0,
						{
							color = def.colors.Cf0c896
						}
					},
					labelOffset = cc.p(-20, 0),
					sprite = res.gettex2("pic/console/infobar/sycee.png"),
					spriteOffset = cc.p(20, 0)
				}).add2(slot17, node):anchor(0.5, 0.5):pos(butPos[2][1], butPos[2][2])
			end

			if v.FHZPrice ~= 0 then
				local texts = {
					{
						"��ȷ��ʹ��",
						cc.c3b(255, 255, 255)
					},
					{
						v.FHZPrice .. "G��",
						cc.c3b(255, 0, 0)
					},
					{
						"����",
						cc.c3b(255, 255, 255)
					},
					{
						v.FItemStr .. "��",
						cc.c3b(240, 200, 150)
					},
					{
						"\n(���֧��",
						cc.c3b(255, 255, 255)
					},
					{
						"0.001G��",
						cc.c3b(255, 0, 0)
					},
					{
						"��Ϊ�󹤷�)",
						cc.c3b(255, 255, 255)
					},
					{
						"\n�������Ʒ����",
						cc.c3b(255, 255, 255)
					},
					{
						"10���Ӻ�",
						cc.c3b(255, 0, 0)
					},
					{
						"ͨ��",
						cc.c3b(255, 255, 255)
					},
					{
						"�ʼ�",
						cc.c3b(255, 0, 0)
					},
					{
						"\n��ʽ���š�",
						cc.c3b(255, 255, 255)
					}
				}

				an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
					sound.playSound("103")

					local box = an.newMsgbox(texts, function (isOk)
						if isOk == 1 then
							self:buyShopItem(v.FItemStr, 3)
						end

						return 
					end, {
						disableScroll = true,
						fontSize = 20,
						title = "G�깺��",
						center = true,
						hasCancel = true
					})

					return 
				end, {
					pressImage = res.gettex2("pic/common/btn21.png"),
					label = {
						v.FHZPrice .. "",
						18,
						0,
						{
							color = def.colors.Cf0c896
						}
					},
					labelOffset = cc.p(-20, 0),
					sprite = res.gettex2("pic/console/infobar/hz.png"),
					spriteOffset = cc.p(20, 0)
				}).add2(slot17, node):anchor(0.5, 0.5):pos(butPos[2][1], butPos[2][2])
			end

			if v.FBoHotLogo == 1 then
				res.get2("pic/panels/shop/hot.png"):anchor(0, 1):pos(0, node.geth(node) - 6):add2(node)
			end
		end
	end

	return 
end
shop.buyShopItem = function (self, sItemName, sCostType)
	if type(self.curSubIdx) ~= "number" or type(sItemName) ~= "string" or type(sCostType) ~= "number" then
		return 
	end

	if sCostType == 3 then
		local rsb = DefaultClientMessage(CM_BLOCKCHAIN_BUY_SHOPITEM)
		rsb.ShopItemName = sItemName
		rsb.MoneyType = sCostType

		MirTcpClient:getInstance():postRsb(rsb)
	else
		local rsb = DefaultClientMessage(CM_BUY_SHOPITEM)
		rsb.ShopItemName = sItemName
		rsb.MoneyType = sCostType

		MirTcpClient:getInstance():postRsb(rsb)
		main_scene.ui.waiting:show(10, "SHOPBUY", 1)
	end

	return 
end
shop.showItemInfo = function (self, data, scenePos)
	local indexOf0 = string.find(data.FItemStr, "0")
	local itemNameRemoved0102 = ""

	if indexOf0 == nil then
		itemNameRemoved0102 = data.FItemStr
	else
		itemNameRemoved0102 = string.sub(data.FItemStr, 1, indexOf0 - 1)
	end

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

	local bg = display.newScale9Sprite(res.getframe2("pic/scale/scale24.png")).addto(slot6, layer):anchor(0, 1):pos(scenePos.x, scenePos.y)
	local node = display.newNode():addTo(bg)
	local stdItem = def.items[def.items.name2Index[itemNameRemoved0102] or 0]

	res.get2("pic/panels/shop/frame.png"):pos(50, -50):add2(node)
	res.get("items", stdItem.getVar(stdItem, "looks") or 0):pos(50, -50):add2(node)
	an.newLabel(itemNameRemoved0102, 20, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0.5, 0.5):add2(node):pos(164, -50)

	local needH = -100
	local textInfo = nil

	if data.FItemExplain ~= "" then
		local discr = string.gsub(data.FItemExplain, "|", "\n")
		textInfo = an.newLabel(discr, 20, 1):anchor(0, 1):add2(node):pos(18, needH)

		textInfo.setWidth(textInfo, math.min(textInfo.getw(textInfo), 264))

		needH = needH - textInfo.geth(textInfo)
	end

	needH = needH - 40

	if data.FYBPrice ~= 0 then
		local texts = {
			{
				"��ȷ��ʹ��",
				cc.c3b(255, 255, 255)
			},
			{
				data.FYBPrice .. "Ԫ��",
				cc.c3b(255, 0, 0)
			},
			{
				"����",
				cc.c3b(255, 255, 255)
			},
			{
				itemNameRemoved0102,
				cc.c3b(240, 200, 150)
			},
			{
				"��",
				cc.c3b(255, 255, 255)
			}
		}

		an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
			sound.playSound("103")

			local box = an.newMsgbox(texts, function (isOk)
				if isOk == 1 then
					self:buyShopItem(data.FItemStr, 1)
				end

				return 
			end, {
				disableScroll = true,
				fontSize = 20,
				title = "�̳ǹ���",
				center = true,
				hasCancel = true
			})

			return 
		end, {
			pressImage = res.gettex2("pic/common/btn21.png"),
			label = {
				data.FYBPrice .. "",
				18,
				1,
				{
					color = def.colors.Cf0c896
				}
			},
			labelOffset = cc.p(-20, 0),
			sprite = res.gettex2("pic/console/infobar/yb.png"),
			spriteOffset = cc.p(20, 0)
		}).add2(slot12, node):anchor(0.5, 0.5):pos(70, needH)
	end

	if data.FYDPrice ~= 0 then
		local texts = {
			{
				"��ȷ��ʹ��",
				cc.c3b(255, 255, 255)
			},
			{
				data.FYDPrice .. "����",
				cc.c3b(255, 0, 0)
			},
			{
				"����",
				cc.c3b(255, 255, 255)
			},
			{
				itemNameRemoved0102,
				cc.c3b(240, 200, 150)
			},
			{
				"��",
				cc.c3b(255, 255, 255)
			}
		}

		an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
			sound.playSound("103")

			local box = an.newMsgbox(texts, function (isOk)
				if isOk == 1 then
					self:buyShopItem(data.FItemStr, 2)
				end

				return 
			end, {
				disableScroll = true,
				fontSize = 20,
				title = "�̳ǹ���",
				center = true,
				hasCancel = true
			})

			return 
		end, {
			pressImage = res.gettex2("pic/common/btn21.png"),
			label = {
				data.FYDPrice .. "",
				18,
				1,
				{
					color = def.colors.Cf0c896
				}
			},
			labelOffset = cc.p(-20, 0),
			sprite = res.gettex2("pic/console/infobar/sycee.png"),
			spriteOffset = cc.p(20, 0)
		}).add2(slot12, node):anchor(0.5, 0.5):pos(190, needH)
	end

	local widthBg = math.max((textInfo and textInfo.getw(textInfo) + 36) or 254, 254)
	needH = needH - 40

	bg.size(bg, math.min(300, widthBg), -needH)
	node.pos(node, 0, -needH)

	local bgPX = scenePos.x
	local bgPY = scenePos.y

	if display.width < bgPX + bg.getw(bg) then
		bgPX = bgPX - bg.getw(bg)
	end

	if bgPY - bg.geth(bg) < 0 then
		bgPY = bg.geth(bg)
	end

	bg.pos(bg, bgPX, bgPY)

	return 
end
shop.BuyItemBackResult = function (self, result)
	main_scene.ui.waiting:close("SHOPBUY")

	return 
end
shop.showExchangeLingFu = function (self)
	local lingfu, yuanbao = nil
	local msgbox = an.newMsgbox("", function (isOk)
		sound.playSound("103")

		if isOk == 1 and lingfu and yuanbao and tonumber(lingfu:getString()) ~= 0 then
			local valueLF = tonumber(lingfu:getString()) or 0
			local valueYB = tonumber(yuanbao:getString()) or 0
			local texts = {
				{
					"��ȷ��ʹ��",
					cc.c3b(255, 255, 255)
				},
				{
					valueYB .. "Ԫ��",
					cc.c3b(255, 0, 0)
				},
				{
					"�һ�",
					cc.c3b(255, 255, 255)
				},
				{
					valueLF .. "�����",
					cc.c3b(240, 200, 150)
				},
				{
					"ô��",
					cc.c3b(255, 255, 255)
				}
			}

			an.newMsgbox(texts, function (isOk)
				if isOk == 1 then
					local rsb = DefaultClientMessage(CM_YB_EXCHANGE_LF)
					rsb.LFCnt = valueYB

					MirTcpClient:getInstance():postRsb(rsb)
					main_scene.ui.waiting:show(10, "EXCHANGE_LF", 1)
				end

				return 
			end, {
				disableScroll = true,
				fontSize = 20,
				title = "�̳ǹ���",
				center = true,
				hasCancel = true
			})
		end

		return 
	end, {
		disableScroll = true,
		title = "����һ�",
		hasCancel = true
	})

	an.newLabel("��ѡ����Ҫ�һ����������:", 18, 1, {
		color = cc.c3b(240, 200, 150)
	}).anchor(slot4, 0.5, 0.5):addTo(msgbox.bg):pos(msgbox.bg:getw()/2 - 14, 210)
	an.newLabel("�һ������:", 18, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):addTo(msgbox.bg):pos(msgbox.bg:getw()/2 - 160, 100)
	an.newLabel("����Ԫ��:", 18, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):addTo(msgbox.bg):pos(msgbox.bg:getw()/2 + 40, 100)

	lingfu = an.newLabel("1", 18, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):addTo(msgbox.bg):pos(msgbox.bg:getw()/2 - 52, 100)
	yuanbao = an.newLabel("1", 18, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):addTo(msgbox.bg):pos(msgbox.bg:getw()/2 + 128, 100)
	local maxNum = 5000
	local slider = an.newSlider(res.gettex2("pic/scale/sliderBar.png"), nil, res.gettex2("pic/panels/setting/button.png"), {
		value = 0.001,
		scale9 = cc.size(msgbox.bg:getw() - 170, 15),
		valueChange = function (value)
			self:opacity(64)

			local num = math.floor(value*maxNum)

			lingfu:setString(tostring(num))
			yuanbao:setString(tostring(num))

			return 
		end,
		valueChangeEnd = function (value)
			self:opacity(255)

			local num = math.floor(value*maxNum)

			lingfu:setString(tostring(num))
			yuanbao:setString(tostring(num))

			return 
		end
	}).add2(slot5, msgbox.bg):pos(msgbox.bg:getw()/2, 148):anchor(0.5, 0.5)

	local function changeSlider(value)
		if maxNum < value then
			value = maxNum or value
		end

		if value < 0 then
			value = 0
		end

		slider:setValue(value/maxNum)
		lingfu:setString(tostring(value))
		yuanbao:setString(tostring(value))

		return 
	end

	slot6(1)

	local schedule = nil

	an.newBtn(res.gettex2("pic/common/minus_n.png"), function ()
		sound.playSound("103")

		local value = tonumber(lingfu:getString()) or 0

		changeSlider(value - 1)

		return 
	end, {
		pressImage = res.gettex2("pic/common/minus_s.png"),
		sprite = res.gettex2("pic/common/minus.png")
	}).pos(slot8, msgbox.bg:getw()/2 - 170, 148):addto(msgbox.bg):addNodeEventListener(cc.NODE_TOUCH_CAPTURE_EVENT, function (event)
		if event.name == "began" then
			schedule = scheduler.scheduleGlobal(function ()
				local value = (tonumber(lingfu:getString()) or 0) - 100

				changeSlider(value)

				if value <= 0 then
					scheduler.unscheduleGlobal(schedule)
				end

				return 
			end, 1)
		elseif event.name == "ended" then
			scheduler.unscheduleGlobal(schedule)
		end

		return true
	end)
	an.newBtn(res.gettex2("pic/common/add_n.png"), function ()
		sound.playSound("103")

		local value = tonumber(lingfu:getString()) or 0

		changeSlider(value + 1)

		return 
	end, {
		pressImage = res.gettex2("pic/common/add_s.png"),
		sprite = res.gettex2("pic/common/plus.png")
	}).pos(slot8, msgbox.bg:getw()/2 + 170, 148):addto(msgbox.bg):addNodeEventListener(cc.NODE_TOUCH_CAPTURE_EVENT, function (event)
		if event.name == "began" then
			schedule = scheduler.scheduleGlobal(function ()
				local value = (tonumber(lingfu:getString()) or 0) + 100

				changeSlider(value)

				if maxNum <= value then
					scheduler.unscheduleGlobal(schedule)
				end

				return 
			end, 1)
		elseif event.name == "ended" then
			scheduler.unscheduleGlobal(schedule)
		end

		return true
	end)

	return 
end
shop.showExchangeJiangQuan = function (self)
	local lingfu, jiangquan = nil
	local msgbox = an.newMsgbox("", function (isOk)
		sound.playSound("103")

		if isOk == 1 and lingfu and jiangquan and tonumber(lingfu:getString()) ~= 0 then
			local valueLF = tonumber(lingfu:getString()) or 0
			local valueJQ = tonumber(jiangquan:getString()) or 0
			local texts = {
				{
					"��ȷ��ʹ��",
					cc.c3b(255, 255, 255)
				},
				{
					valueLF .. "�����",
					cc.c3b(255, 0, 0)
				},
				{
					"�һ�",
					cc.c3b(255, 255, 255)
				},
				{
					valueJQ .. "�Ž�ȯ",
					cc.c3b(240, 200, 150)
				},
				{
					"ô��",
					cc.c3b(255, 255, 255)
				}
			}

			an.newMsgbox(texts, function (isOk)
				if isOk == 1 then
					local rsb = DefaultClientMessage(CM_LF_EXCHANGE_JQ)
					rsb.JQCnt = valueLF

					MirTcpClient:getInstance():postRsb(rsb)
				end

				return 
			end, {
				disableScroll = true,
				fontSize = 20,
				title = "�̳ǹ���",
				center = true,
				hasCancel = true
			})
		end

		return 
	end, {
		disableScroll = true,
		title = "��ȯ�һ�",
		hasCancel = true
	})

	an.newLabel("��ѡ����Ҫ�һ��Ľ�ȯ����:", 18, 1, {
		color = cc.c3b(240, 200, 150)
	}).anchor(slot4, 0.5, 0.5):addTo(msgbox.bg):pos(msgbox.bg:getw()/2 - 14, 210)
	an.newLabel("�һ���ȯ��:", 18, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):addTo(msgbox.bg):pos(msgbox.bg:getw()/2 - 160, 100)
	an.newLabel("�������:", 18, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):addTo(msgbox.bg):pos(msgbox.bg:getw()/2 + 40, 100)

	jiangquan = an.newLabel("1", 18, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):addTo(msgbox.bg):pos(msgbox.bg:getw()/2 - 52, 100)
	lingfu = an.newLabel("1", 18, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):addTo(msgbox.bg):pos(msgbox.bg:getw()/2 + 128, 100)
	local maxNum = 5000
	local slider = an.newSlider(res.gettex2("pic/scale/sliderBar.png"), nil, res.gettex2("pic/panels/setting/button.png"), {
		value = 0.001,
		scale9 = cc.size(msgbox.bg:getw() - 170, 15),
		valueChange = function (value)
			self:opacity(64)

			local num = math.floor(value*maxNum)

			lingfu:setString(tostring(num))
			jiangquan:setString(tostring(num))

			return 
		end,
		valueChangeEnd = function (value)
			self:opacity(255)

			local num = math.floor(value*maxNum)

			lingfu:setString(tostring(num))
			jiangquan:setString(tostring(num))

			return 
		end
	}).add2(slot5, msgbox.bg):pos(msgbox.bg:getw()/2, 148):anchor(0.5, 0.5)

	local function changeSlider(value)
		if maxNum < value then
			value = maxNum or value
		end

		if value < 0 then
			value = 0
		end

		slider:setValue(value/maxNum)
		lingfu:setString(tostring(value))
		jiangquan:setString(tostring(value))

		return 
	end

	slot6(1)

	local schedule = nil

	an.newBtn(res.gettex2("pic/common/minus_n.png"), function ()
		sound.playSound("103")

		local value = tonumber(lingfu:getString()) or 0

		changeSlider(value - 1)

		return 
	end, {
		pressImage = res.gettex2("pic/common/minus_s.png"),
		sprite = res.gettex2("pic/common/minus.png")
	}).pos(slot8, msgbox.bg:getw()/2 - 170, 148):addto(msgbox.bg):addNodeEventListener(cc.NODE_TOUCH_CAPTURE_EVENT, function (event)
		if event.name == "began" then
			schedule = scheduler.scheduleGlobal(function ()
				local value = (tonumber(lingfu:getString()) or 0) - 10

				changeSlider(value)

				if value <= 0 then
					scheduler.unscheduleGlobal(schedule)
				end

				return 
			end, 0.5)
		elseif event.name == "ended" then
			scheduler.unscheduleGlobal(schedule)
		end

		return true
	end)
	an.newBtn(res.gettex2("pic/common/add_n.png"), function ()
		sound.playSound("103")

		local value = tonumber(lingfu:getString()) or 0

		changeSlider(value + 1)

		return 
	end, {
		pressImage = res.gettex2("pic/common/add_s.png"),
		sprite = res.gettex2("pic/common/plus.png")
	}).pos(slot8, msgbox.bg:getw()/2 + 170, 148):addto(msgbox.bg):addNodeEventListener(cc.NODE_TOUCH_CAPTURE_EVENT, function (event)
		if event.name == "began" then
			schedule = scheduler.scheduleGlobal(function ()
				local value = (tonumber(lingfu:getString()) or 0) + 10

				changeSlider(value)

				if maxNum <= value then
					scheduler.unscheduleGlobal(schedule)
				end

				return 
			end, 0.5)
		elseif event.name == "ended" then
			scheduler.unscheduleGlobal(schedule)
		end

		return true
	end)

	return 
end
shop.EXCHANGE_LF = function (self, result)
	main_scene.ui.waiting:close("EXCHANGE_LF")

	return 
end
shop.EXCHANGE_JQ = function (self, result)
	main_scene.ui.waiting:close("EXCHANGE_JQ")

	return 
end
local iosTutorials = {
	{
		"��γ�ֵ",
		def.colors.Cf0c896
	},
	{
		"\n1.����App Store��",
		def.colors.Cdcd2be
	},
	{
		"\n2.����ײ� Apple ID��",
		def.colors.Cdcd2be
	},
	{
		"\n3.����鿴 Apple ID��",
		def.colors.Cdcd2be
	},
	{
		"\n4.ѡ�񸶿ʽ�������˻�����",
		def.colors.Cdcd2be
	},
	{
		"\n5.��д�ֻ���֤�롣",
		def.colors.Cdcd2be
	},
	{
		"\n6.��ɺ󼴿�����Ϸ�ڳ�ֵ��",
		def.colors.Cdcd2be
	}
}
local androidTutorials = {
	{
		"��γ�ֵ",
		def.colors.Cf0c896
	},
	{
		"\n1.ѡ��֧����ʽ��",
		def.colors.Cdcd2be
	},
	{
		"\n2.��װ��Ӧ�Ŀͻ��ˡ�",
		def.colors.Cdcd2be
	},
	{
		"\n3.������Ӧ��ʾ���ݽ��г�ֵ��",
		def.colors.Cdcd2be
	}
}
shop.getRecharOpenLoadRecharge = function (self)
	p2("net", "shop:getRecharOpenLoadRecharge")

	local function callback(allowOrder)
		main_scene.ui.waiting:close("GET_RECHARGE_FLAG_SHOP")

		if main_scene.ui.panels.shop then
			main_scene.ui.panels.shop:load2(allowOrder)
		end

		return 
	end

	if device.platform == "ios" then
		main_scene.ui.waiting.show(slot2, 10, "GET_RECHARGE_FLAG_SHOP")
		self.load2(self, false)
		common.getRechargeOpen(callback)
	else
		self.load2(self, true)
	end

	return 
end
local testList = {
	{
		FDescription = "��������5%����",
		FBoMark = false,
		FName = "6Ԫ��(ÿ����һ��)",
		FPrice = "6",
		FSellPrice = "1.0",
		FProductId = "com.sjfgcq.sdwl.RMB6"
	},
	{
		FDescription = "��������5%����",
		FBoMark = false,
		FName = "50Ԫ��",
		FPrice = "50",
		FSellPrice = "1.0",
		FProductId = "com.sjfgcq.sdwl.RMB50"
	},
	{
		FDescription = "��������5%����",
		FBoMark = false,
		FName = "98Ԫ��",
		FPrice = "98",
		FSellPrice = "1.0",
		FProductId = "com.sjfgcq.sdwl.RMB98"
	},
	{
		FDescription = "��������5%����",
		FBoMark = false,
		FName = "198Ԫ��(ÿ����һ��)",
		FPrice = "198",
		FSellPrice = "1.0",
		FProductId = "com.sjfgcq.sdwl.RMB198"
	},
	{
		FDescription = "��������5%����",
		FBoMark = false,
		FName = "328Ԫ��",
		FPrice = "328",
		FSellPrice = "1.0",
		FProductId = "com.sjfgcq.sdwl.RMB328"
	},
	{
		FDescription = "��������5%����",
		FBoMark = false,
		FName = "512Ԫ��",
		FPrice = "512",
		FSellPrice = "1.0",
		FProductId = "com.sjfgcq.sdwl.RMB512"
	}
}
shop.load2 = function (self, allowOrder)
	if g_data.player:getIsCrossServer() then
		main_scene.ui:tip("�ù��ܲ���ʹ��")

		return 
	end

	if self.tag1Node then
		self.tag1Node:removeSelf()

		self.tag1Node = nil
	end

	if not g_data.chargeList then
		g_data.chargeList = {}
	end

	self.tag1Node = display.newNode():addTo(self)

	if self.tag2Node then
		self.tag2Node:removeSelf()
	end

	self.tag2Node = display.newNode():addTo(self)
	self.curSubIdx = nil

	display.newScale9Sprite(res.getframe2("pic/panels/shop/banner.png")):addto(self.tag2Node):anchor(0, 1):pos(10, 410):size(622, 76)
	an.newBtn(res.gettex2("pic/panels/activity/chargegift.png"), function ()
		if g_data.player:getIsCrossServer() then
			main_scene.ui:tip("�ù��ܲ���ʹ��")

			return 
		end

		local rsb = DefaultClientMessage(CM_Act_DetailRequest)
		rsb.FActId = 0
		rsb.FParamA = 0
		rsb.FParamB = 0
		rsb.FStrParam = "tab1"

		MirTcpClient:getInstance():postRsb(rsb)
		main_scene.ui.waiting:show(10, "ACTIVITY_TAB1")
		self:hidePanel()
		main_scene.ui:togglePanel("activity", {
			dftab2 = 105
		})

		return 
	end, {
		pressImage = res.gettex2("pic/panels/activity/chargegift.png"),
		label = {
			"",
			20,
			0,
			{
				color = cc.c3b(240, 200, 150)
			}
		}
	}).add2(testList, self.tag2Node):anchor(0, 0.5):pos(self.getw(self) - 150, self.geth(self) - 80)
	an.newBtn(res.gettex2("pic/common/help.png"), function ()
		if device.platform == "ios" then
			an.newMsgbox(iosTutorials, nil, {
				btnTexts = {
					"ȷ  ��",
					"ȡ  ��"
				}
			})
		elseif device.platform == "windows" then
			an.newMsgbox(iosTutorials, nil, {
				btnTexts = {
					"ȷ  ��",
					"ȡ  ��"
				}
			})
		elseif device.platform == "android" then
			an.newMsgbox(androidTutorials, nil, {
				btnTexts = {
					"ȷ  ��",
					"ȡ  ��"
				}
			})
		end

		return 
	end, {
		pressImage = res.gettex2("pic/common/help.png"),
		label = {
			"",
			20,
			0,
			{
				color = cc.c3b(240, 200, 150)
			}
		}
	}).add2(testList, self.tag2Node):anchor(0, 0.5):pos(10, self.geth(self) - 22)

	local infoView = an.newScroll(12, 10, self.getw(self) - 18, self.geth(self) - 132):add2(self.tag2Node)
	self.infoView = infoView
	local h = 158

	infoView.setScrollSize(infoView, self.getw(self) - 28, math.max(self.geth(self) - 134, math.ceil(#g_data.chargeList/4)*h))

	if device.platform == "windows" and (not g_data.chargeList or #g_data.chargeList == 0) then
		g_data.chargeList = testList
	end

	for i, v in ipairs(g_data.chargeList) do
		local node = res.get2("pic/panels/shop/bg2.png"):anchor(0, 1):pos((i - 1)%4*155, infoView.getScrollSize(infoView).height - 10 - math.floor((i - 1)/4)*h):add2(infoView)

		res.get2("pic/console/infobar/yb.png"):pos(node.getw(node)*0.5, node.geth(node) - 32):add2(node)

		local ibsize = 20

		if 6 < #v.FName then
			ibsize = 16
		end

		an.newLabel(v.FName, ibsize, 0, {
			color = def.colors.Cf0c896
		}):anchor(0.5, 0.5):add2(node):pos(node.getw(node)*0.5, node.geth(node) - 55)
		an.newLabel(v.FDescription, 16, 0, {
			color = def.colors.Cf0c896
		}):anchor(0.5, 0.5):add2(node):pos(node.getw(node)*0.5, node.geth(node) - 75)
		an.newBtn(res.gettex2("pic/common/btn20.png"), function (clickBtn)
			sound.playSound("103")

			if not allowOrder then
				main_scene.ui:togglePanel("wechatRecharge")

				return 
			end

			main_scene.ui.waiting:show(35, "SHOPPAY", 1)

			self.lastClickPayIndex = clickBtn.getTag(clickBtn)
			local curChargeInfo = g_data.chargeList[clickBtn.getTag(clickBtn)]
			local channelUserId = MirSDKAgent:getUserID() or ""
			local rsb = DefaultClientMessage(CM_NewOrder)
			rsb.FProductId = curChargeInfo.FProductId
			rsb.FPlatType = 0
			rsb.FChannelUserId = channelUserId
			rsb.FExtendData = self.lastClickPayIndex

			if (device.platform == "ios" or device.platform == "android") and not FORCE_ACCOUNT_LOGIN then
				if device.platform == "ios" then
					rsb.FPlatType = 1
				elseif device.platform == "android" then
					rsb.FPlatType = 0
				end
			else
				an.newMsgbox("�ð汾�ݲ�֧�ֳ�ֵ" .. curChargeInfo.FPrice .. "���뻨Ǯ�����ڴ�......", nil, {
					btnTexts = {
						"ȷ  ��",
						"ȡ  ��"
					}
				})
			end

			MirTcpClient:getInstance():postRsb(rsb)

			return 
		end, {
			pressImage = res.gettex2("pic/common/btn21.png"),
			label = {
				"�� " .. v.FPrice,
				22,
				0,
				{
					color = def.colors.Cf0c896
				}
			}
		}).add2(slot11, node):anchor(0.5, 0.5):pos(node.getw(node)*0.5, 35):setTag(i)

		if v.FBoMark == true then
			res.get2("pic/panels/shop/recommend.png"):anchor(0, 1):pos(2, node.geth(node)):add2(node)
		end
	end

	return 
end
local err_msg = {
	[1.0] = "��ɫ�˺Ŵ���"
}
shop.onSM_NewOrder = function (self, result, proIc)
	local curChargeInfo, errLog = nil

	print("shop:onSM_NewOrder")
	print_r(result)

	while true do
		if not result then
			errLog = "not result"

			break
		end

		if result.Flag ~= 0 then
			errLog = "flag not 0"

			break
		end

		local errcode = result.FErr

		if errcode and errcode ~= 0 then
			errLog = err_msg[errcode] or tostring(result.FErr)

			break
		end

		if not result.FOrderId or result.FOrderId == "" then
			errLog = "result.FOrderId is empty"

			break
		end

		local curPayIndex = self.lastClickPayIndex

		if result.FProductId and result.FProductId ~= "" then
			curPayIndex = result.FExtendData
			curChargeInfo = g_data.chargeList[curPayIndex]

			if curChargeInfo.FProductId ~= result.FProductId then
				curChargeInfo = nil
				errLog = "curChargeInfo.FProductId ~= result.FProductId"

				break
			end
		else
			curChargeInfo = g_data.chargeList[curPayIndex]
		end

		if not curChargeInfo then
			errLog = "not charge info"

			break
		end

		local pruductInfo = {
			coinName = "Ԫ��",
			productDesc = "",
			orderId = tostring(result.FOrderId),
			productID = tostring(curChargeInfo.FProductId),
			productName = tostring(curChargeInfo.FName),
			productPrice = tostring(curChargeInfo.FPrice),
			productAmount = tostring(1),
			roleId = tostring(g_data.select:getCurUserId()),
			roleName = tostring(g_data.select:getCurName()),
			roleLevel = tostring(g_data.select:getCurLevel()),
			serverId = tostring(g_data.login.zoneId),
			serverName = tostring(g_data.login.zoneId),
			ext = tostring(curChargeInfo.FProductId)
		}

		dump(pruductInfo)
		MirSDKAgent:payForProduct(pruductInfo, function (code, msg)
			release_print("===>payForProduct callback code", code, msg)

			if code == 0 then
			end

			return 
		end)

		break
	end

	main_scene.ui.waiting.close(slot5, "SHOPPAY")

	if curChargeInfo == nil and result.FOrderId and result.FOrderId ~= "" and (device.platform == "ios" or device.platform == "android") and not FORCE_ACCOUNT_LOGIN then
		an.newMsgbox("֧���쳣����ȷ���������������ԣ�", nil, {
			btnTexts = {
				"ȷ  ��",
				"ȡ  ��"
			}
		})
	end

	if errLog then
		luaReportException("buy RMBGift failed", "activity:onSM_NewOrder", errLog)
	end

	return 
end

return shop
