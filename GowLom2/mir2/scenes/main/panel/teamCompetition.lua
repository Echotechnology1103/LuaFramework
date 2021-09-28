local teamCompetition = class("teamCompetition", import(".panelBase"))
local tip = import(".wingInfo")
teamCompetition.ctor = function (self, params)
	self.super.ctor(self)
	self.setMoveable(self, true)

	self.params = params or {}
	self.page = self.params.page or 1
	self.tabCallbacks = {}

	return 
end
teamCompetition.onEnter = function (self)
	local tabstr = {
		"ѵ\n��\n��",
		"��\n��\n��"
	}
	local tabcb = {
		self.xunLianYing,
		self.jinBiaoSai
	}
	self.tabCallbacks = tabcb

	self.initPanelUI(self, {
		title = "5v5ս����",
		bg = "pic/common/black_2.png",
		tab = {
			fontsize = 15,
			strs = tabstr,
			default = self.page
		}
	})
	self.pos(self, display.cx - 102, display.cy)
	self.bindNetEvent(self, SM_Group5v5ReqList, self.onSM_Group5v5ReqList)
	self.bindNetEvent(self, SM_Group5v5ReqEnter, self.onSM_Group5v5ReqEnter)
	self.bindNetEvent(self, SM_Group5v5ReqPk, self.onSM_Group5v5ReqPk)
	self.bindNetEvent(self, SM_GroupBattleReqList, self.onSM_GroupBattleReqList)

	return 
end
teamCompetition.onCloseWindow = function (self)
	return self.super.onCloseWindow(self)
end
teamCompetition.clearContentNode = function (self)
	if self.contentNode then
		self.contentNode:removeSelf()

		self.rightNode = nil
	end

	self.contentNode = display.newNode():addTo(self.bg)
	self.contentNode.controls = {}
	self.contentNode.data = {}

	return 
end
teamCompetition.onTabClick = function (self, idx, btn)
	self.clearContentNode(self)

	self.curTab = self.tabCallbacks[idx]
	self.curIdx = idx

	self.tabCallbacks[idx](self)

	return 
end
teamCompetition.xunLianYing = function (self)
	local rsb = DefaultClientMessage(CM_Group5v5ReqList)

	MirTcpClient:getInstance():postRsb(rsb)

	return 
end
teamCompetition.updateXunLianYing = function (self, result)
	self.clearContentNode(self)

	local texts = {
		{
			"1�����ӽ���ս�������󣬷ֱ������������ࡣ10���׼��ʱ��󣬲ſ��Խ�����������ս������\n",
			cc.c3b(255, 255, 255)
		},
		{
			"2��������ÿ��һ��ְҵ��ȫ�ӳ�Ա����",
			cc.c3b(255, 255, 255)
		},
		{
			"10%����ֵ",
			cc.c3b(255, 0, 0)
		},
		{
			"�����30%��\n",
			cc.c3b(255, 255, 255)
		},
		{
			"3��ÿ����ɫ��",
			cc.c3b(255, 255, 255)
		},
		{
			"2��",
			cc.c3b(255, 0, 0)
		},
		{
			"�����������ɫ�����ܺ�5���Զ��������볡�㣬û�и�������Ľ�ɫ���������޷����\n",
			cc.c3b(255, 255, 255)
		},
		{
			"4����ս�������в�����ʹ�ûظ�ҩƷ��\n",
			cc.c3b(255, 255, 255)
		},
		{
			"5����ս�������ж��߻�ص�ս����׼���ң��޷�������������ȷ����������ȶ���\n",
			cc.c3b(255, 255, 255)
		},
		{
			"6��",
			cc.c3b(255, 255, 255)
		},
		{
			"5����",
			cc.c3b(255, 0, 0)
		},
		{
			"�ڣ����ܶԷ����г�Ա��ս��ֱ�ӻ�ʤ��˫��������Ҵ��ʱ������˴ζ��ս�ӻ�ʤ���������ͬ�������ӻ�ʤ��",
			cc.c3b(255, 255, 255)
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
	}).pos(slot3, 27, 432):addto(self.contentNode)

	local rect = cc.rect(10.5, 60, 620, 345)
	local scroll = an.newScroll(rect.x, rect.y, rect.width, rect.height, {
		dir = 2
	}):addto(self.contentNode)
	local ticketNum = result.Fticket or 0

	an.newLabel("ʣ��ս�飺" .. ticketNum, 20, 1, {
		color = cc.c3b(240, 200, 150)
	}):anchor(0, 0.5):pos(20, 35):add2(self.contentNode)
	an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		sound.playSound("103")

		local rsb = DefaultClientMessage(CM_Group5v5ReqList)

		MirTcpClient:getInstance():postRsb(rsb)

		return 
	end, {
		pressImage = res.gettex2("pic/common/btn21.png"),
		label = {
			"ˢ ��",
			20,
			0,
			{
				color = def.colors.Cf0c896
			}
		}
	}).add2(slot6, self.contentNode):pos(575, 35)

	local function getRoomInfo(id)
		for _k, _v in ipairs(result.FFieldList) do
			if _v.Fid == id then
				return _v
			end
		end

		return 
	end

	for k, v in ipairs(result.FPKList) do
		local bgName = ""
		local titleStr = ""
		local titleColor = nil

		if v.Ffieldid == 1 then
			bgName = "bg_hj.png"
			titleStr = "�ƽ�����"
			titleColor = def.colors.Cfad264
		elseif v.Ffieldid == 2 then
			bgName = "bg_by.png"
			titleStr = "��������"
			titleColor = def.colors.Ccf15e1
		elseif v.Ffieldid == 3 then
			bgName = "bg_qt.png"
			titleStr = "��ͭ����"
			titleColor = def.colors.C3794fb
		else
			return 
		end

		local bg = display.newSprite(res.gettex2("pic/panels/teamCompetition/" .. slot12)):anchor(0, 0):pos((k - 1)*185, 5):add2(scroll)

		display.newSprite(res.gettex2("pic/panels/common/titleBg.png")):anchor(0.5, 0.5):pos(90, 315):add2(bg)
		an.newLabel(titleStr, 20, 1, {
			color = titleColor,
			sc = def.colors.C180a07
		}):anchor(0.5, 0.5):pos(90, 315):add2(bg)

		local roomInfo = getRoomInfo(v.Ffieldid) or {}
		local needTicket = roomInfo.Fneedcnt or 0

		local function enterRoom(bPK)
			local texts = {}

			if bPK then
				texts = {
					{
						"ȷ������",
						cc.c3b(255, 255, 255)
					},
					{
						needTicket,
						cc.c3b(255, 0, 0)
					},
					{
						"��ս�����������ս������",
						cc.c3b(255, 255, 255)
					}
				}
			else
				texts = {
					{
						"ȷ������",
						cc.c3b(255, 255, 255)
					},
					{
						needTicket,
						cc.c3b(255, 0, 0)
					},
					{
						"��ս����������ȴ�������\n",
						cc.c3b(255, 255, 255)
					},
					{
						"��ǰ�볡ս����Ϊ����",
						cc.c3b(255, 0, 0)
					}
				}
			end

			an.newMsgbox(texts, function (idx)
				if idx == 1 then
					if bPK then
						local rsb = DefaultClientMessage(CM_Group5v5ReqPk)
						rsb.Fpkid = v.Fid

						MirTcpClient:getInstance():postRsb(rsb)
					else
						local rsb = DefaultClientMessage(CM_Group5v5ReqEnter)
						rsb.Ffieldid = v.Ffieldid

						MirTcpClient:getInstance():postRsb(rsb)
					end
				end

				return 
			end, {
				center = true,
				btnTexts = {
					"ȷ��",
					"ȡ��"
				}
			})

			return 
		end

		if v.Fstatus == 0 then
			display.newSprite(res.gettex2("pic/panels/teamCompetition/zt_kx.png")).anchor(slot19, 0.5, 0.5):pos(90, 80):add2(bg)
			an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
				sound.playSound("103")
				enterRoom(false)

				return 
			end, {
				pressImage = res.gettex2("pic/common/btn21.png"),
				label = {
					"�� ��",
					20,
					0,
					{
						color = def.colors.Cf0c896
					}
				}
			}).anchor(slot19, 0.5, 0.5):pos(90, 30):add2(bg)
		elseif v.Fstatus == 1 then
			display.newSprite(res.gettex2("pic/panels/teamCompetition/zt_ddtz.png")):anchor(0.5, 0.5):pos(90, 80):add2(bg)
			an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
				sound.playSound("103")

				local leaderName = v.FAleadername or ""
				local leaderJob = v.FLeaderJob or 0
				local leaderLevel = v.FLeaderLevel or 0
				local job_name = {
					[0] = "սʿ",
					"��ʦ",
					"��ʿ"
				}
				local leaderStr = job_name[leaderJob] or ""
				local texts = {
					{
						"�����ж������\n",
						cc.c3b(255, 255, 255)
					},
					{
						"�ӳ���",
						cc.c3b(255, 255, 255)
					},
					{
						leaderName .. "\n",
						cc.c3b(255, 0, 0)
					},
					{
						"�ȼ���",
						cc.c3b(255, 255, 255)
					},
					{
						common.getLevelText(leaderLevel) .. "\n",
						cc.c3b(255, 0, 0)
					},
					{
						"ְҵ��",
						cc.c3b(255, 255, 255)
					},
					{
						leaderStr .. "\n",
						cc.c3b(255, 0, 0)
					},
					{
						"�Ƿ�����",
						cc.c3b(255, 255, 255)
					},
					{
						needTicket .. "",
						cc.c3b(255, 0, 0)
					},
					{
						"��ս�����������ս����",
						cc.c3b(255, 255, 255)
					}
				}

				an.newMsgbox(texts, function (idx)
					if idx == 1 then
						enterRoom(true)
					end

					return 
				end, {
					btnTexts = {
						"ȷ��",
						"ȡ��"
					}
				})

				return 
			end, {
				pressImage = res.gettex2("pic/common/btn21.png"),
				label = {
					"������Ϣ",
					20,
					0,
					{
						color = def.colors.Cf0c896
					}
				}
			}).anchor(slot19, 0.5, 0.5):pos(90, 30):add2(bg)
		elseif 2 <= v.Fstatus and v.Fstatus <= 4 then
			display.newSprite(res.gettex2("pic/panels/teamCompetition/zt_tzz.png")):anchor(0.5, 0.5):pos(90, 80):add2(bg)
		end
	end

	return 
end
teamCompetition.onSM_Group5v5ReqList = function (self, result)
	if result and result.Fres == 0 and self.curTab == self.xunLianYing then
		self.updateXunLianYing(self, result)
	end

	return 
end
teamCompetition.onSM_Group5v5ReqEnter = function (self, result)
	if result and result.Fres == 0 and self.curTab == self.xunLianYing then
		if self.onCloseWindow(self) then
			self.hidePanel(self)
		else
			print("��ֹ�˴��ڹر�")
		end
	end

	return 
end
teamCompetition.onSM_Group5v5ReqPk = function (self, result)
	if result and result.Fres == 0 and self.curTab == self.xunLianYing then
		if self.onCloseWindow(self) then
			self.hidePanel(self)
		else
			print("��ֹ�˴��ڹر�")
		end
	end

	return 
end
teamCompetition.jinBiaoSai = function (self)
	local rsb = DefaultClientMessage(CM_GroupBattleReqList)

	MirTcpClient:getInstance():postRsb(rsb)

	return 
end
teamCompetition.updateJinBiaoSai = function (self)
	display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(12, 70):size(125, 336):addTo(self.contentNode)
	display.newScale9Sprite(res.getframe2("pic/common/black_5.png")):anchor(0, 0):pos(140, 70):size(490, 336):addTo(self.contentNode)

	local leftScroll = self.newListView(self, 12, 73, 125, 330, 7, {}):add2(self.contentNode)
	local leftItemName = {
		"������",
		"��̭��"
	}
	local leftItemCb = {
		self.jiFenComp,
		self.taoTaiComp
	}

	local function onItemSelect(btn)
		for k, v in ipairs(self.contentNode.controls.leftItems) do
			v.unselect(v)
			v.setTouchEnabled(v, true)
		end

		btn.select(btn)
		btn.setTouchEnabled(btn, false)

		if leftItemCb[btn.key] then
			leftItemCb[btn.key](self)
		end

		return 
	end

	self.contentNode.controls.leftItems = {}

	for i, v in ipairs(slot2) do
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
		item.key = i

		table.insert(self.contentNode.controls.leftItems, slot10)
		self.listViewPushBack(self, leftScroll, item, {
			left = 9
		})
	end

	onItemSelect(self.contentNode.controls.leftItems[1])

	return 
end
teamCompetition.jiFenComp = function (self)
	if self.contentNode.RightNode then
		self.contentNode.RightNode:removeSelf()
	end

	self.contentNode.RightNode = display.newNode():addTo(self.contentNode)
	local Titlelabel = {
		"�жԶӳ�",
		"���",
		"������",
		"��ʱ"
	}
	local titlebg = display.newScale9Sprite(res.getframe2("pic/panels/guild/titlebg.png"), 0, 0, cc.size(480, 42)):anchor(0, 1):pos(145, 402):add2(self.contentNode.RightNode)

	display.newScale9Sprite(res.getframe2("pic/panels/guild/split.png"), 0, 0, cc.size(4, 42)):anchor(0, 0):pos(143.25, 0):add2(titlebg)
	display.newScale9Sprite(res.getframe2("pic/panels/guild/split.png"), 0, 0, cc.size(4, 42)):anchor(0, 0):pos(255.5, 0):add2(titlebg)
	display.newScale9Sprite(res.getframe2("pic/panels/guild/split.png"), 0, 0, cc.size(4, 42)):anchor(0, 0):pos(367.75, 0):add2(titlebg)

	for k, v in ipairs(Titlelabel) do
		local posBegin = 87.125

		if k == 1 then
			posBegin = 71.625
		end

		an.newLabel(v, 20, 0, {
			color = def.colors.Cf0c896
		}):anchor(0.5, 0.5):pos(posBegin + (k - 1)*112.25, titlebg.geth(titlebg)/2):addTo(titlebg)
	end

	local jbsData = self.contentNode.data.JinBiaoSaiData

	if not jbsData then
		return 
	end

	local jifenData = jbsData.FAHistory or {}
	local cellHeight = 42
	local rect = cc.rect(140, 72, 486, 288)
	local scroll = self.newListView(self, rect.x, rect.y, rect.width, rect.height, 4, {}):add2(self.contentNode.RightNode)

	scroll.setScrollSize(scroll, rect.width, math.max(rect.height + 1, #jifenData*cellHeight))

	local posY = math.max(rect.height + 1, #jifenData*cellHeight)

	for k, v in ipairs(jifenData) do
		local cellBg = res.getframe2((k%2 == 0 and "pic/scale/scale18.png") or "pic/scale/scale19.png")
		local cell = an.newBtn(cellBg, function ()
			return 
		end, {
			support = "scroll",
			scale9 = cc.size(rect.width, slot5)
		}):anchor(0, 1):pos(5, posY):addto(scroll)

		an.newLabel(v.Fleadername, 18, 0, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0.5, 0.5):pos(71.625, cell.geth(cell)/2):addTo(cell)

		local resStr = (v.Fwarres == 1 and "ʤ") or "��"

		an.newLabel(resStr, 18, 0, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0.5, 0.5):pos(199.375, cell.geth(cell)/2):addTo(cell)
		an.newLabel(v.Fwincnt, 18, 0, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0.5, 0.5):pos(311.625, cell.geth(cell)/2):addTo(cell)

		local timeStr = os.date("%M:%S", v.Fdt)

		an.newLabel(timeStr, 18, 0, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0.5, 0.5):pos(423.875, cell.geth(cell)/2):addTo(cell)

		posY = posY - cellHeight
	end

	local timeStr = os.date("%H:%M", jbsData.FNextWarTime)

	an.newLabel("���ֿ�ʼʱ�䣺", 18, 0, {
		color = def.colors.Cf0c896
	}):anchor(0, 0.5):pos(15, 40):addTo(self.contentNode.RightNode)
	an.newLabel(timeStr, 18, 0, {
		color = cc.c3b(220, 210, 190)
	}):anchor(0, 0.5):pos(140, 40):addTo(self.contentNode.RightNode)
	an.newBtn(res.gettex2("pic/common/btn20.png"), function ()
		sound.playSound("103")
		main_scene.ui:togglePanel("teamCompetitionTop")

		return 
	end, {
		pressImage = res.gettex2("pic/common/btn21.png"),
		label = {
			"��ǰ����",
			20,
			0,
			{
				color = def.colors.Cf0c896
			}
		}
	}).add2(slot10, self.contentNode.RightNode):pos(580, 40)

	return 
end
teamCompetition.taoTaiComp = function (self)
	if self.contentNode.RightNode then
		self.contentNode.RightNode:removeSelf()
	end

	self.contentNode.RightNode = display.newNode():addTo(self.contentNode)
	local Titlelabel = {
		"�жԶӳ�",
		"���",
		"������",
		"��ʱ"
	}
	local titlebg = display.newScale9Sprite(res.getframe2("pic/panels/guild/titlebg.png"), 0, 0, cc.size(480, 42)):anchor(0, 1):pos(145, 402):add2(self.contentNode.RightNode)

	display.newScale9Sprite(res.getframe2("pic/panels/guild/split.png"), 0, 0, cc.size(4, 42)):anchor(0, 0):pos(143.25, 0):add2(titlebg)
	display.newScale9Sprite(res.getframe2("pic/panels/guild/split.png"), 0, 0, cc.size(4, 42)):anchor(0, 0):pos(255.5, 0):add2(titlebg)
	display.newScale9Sprite(res.getframe2("pic/panels/guild/split.png"), 0, 0, cc.size(4, 42)):anchor(0, 0):pos(367.75, 0):add2(titlebg)

	for k, v in ipairs(Titlelabel) do
		local posBegin = 87.125

		if k == 1 then
			posBegin = 71.625
		end

		an.newLabel(v, 20, 0, {
			color = def.colors.Cf0c896
		}):anchor(0.5, 0.5):pos(posBegin + (k - 1)*112.25, titlebg.geth(titlebg)/2):addTo(titlebg)
	end

	local jbsData = self.contentNode.data.JinBiaoSaiData

	if not jbsData then
		return 
	end

	local taotaiData = jbsData.FBHistory or {}
	local cellHeight = 42
	local rect = cc.rect(140, 72, 486, 288)
	local scroll = self.newListView(self, rect.x, rect.y, rect.width, rect.height, 4, {}):add2(self.contentNode.RightNode)

	scroll.setScrollSize(scroll, rect.width, math.max(rect.height + 1, #taotaiData*cellHeight))

	local posY = math.max(rect.height + 1, #taotaiData*cellHeight)

	for k, v in ipairs(taotaiData) do
		local cellBg = res.getframe2((k%2 == 0 and "pic/scale/scale18.png") or "pic/scale/scale19.png")
		local cell = an.newBtn(cellBg, function ()
			return 
		end, {
			support = "scroll",
			scale9 = cc.size(rect.width, slot5)
		}):anchor(0, 1):pos(5, posY):addto(scroll)

		an.newLabel(v.Fleadername, 18, 0, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0.5, 0.5):pos(71.625, cell.geth(cell)/2):addTo(cell)

		local resStr = (v.Fwarres == 1 and "ʤ") or "��"

		an.newLabel(resStr, 18, 0, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0.5, 0.5):pos(199.375, cell.geth(cell)/2):addTo(cell)
		an.newLabel(v.Fwincnt, 18, 0, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0.5, 0.5):pos(311.625, cell.geth(cell)/2):addTo(cell)

		local timeStr = os.date("%M:%S", v.Fdt)

		an.newLabel(timeStr, 18, 0, {
			color = cc.c3b(220, 210, 190)
		}):anchor(0.5, 0.5):pos(423.875, cell.geth(cell)/2):addTo(cell)

		posY = posY - cellHeight
	end

	local timeStr = os.date("%H:%M", jbsData.FNextWarTime)

	an.newLabel("���ֿ�ʼʱ�䣺", 18, 0, {
		color = def.colors.Cf0c896
	}):anchor(0, 0.5):pos(15, 40):addTo(self.contentNode.RightNode)
	an.newLabel(timeStr, 18, 0, {
		color = cc.c3b(220, 210, 190)
	}):anchor(0, 0.5):pos(140, 40):addTo(self.contentNode.RightNode)
	an.newLabel("ʣ�����������", 18, 0, {
		color = def.colors.Cf0c896
	}):anchor(0, 0.5):pos(330, 40):addTo(self.contentNode.RightNode)
	an.newLabel(jbsData.FBLeftGroupCnt, 18, 0, {
		color = cc.c3b(220, 210, 190)
	}):anchor(0, 0.5):pos(455, 40):addTo(self.contentNode.RightNode)

	return 
end
teamCompetition.onSM_GroupBattleReqList = function (self, result)
	if result and result.Fres == 0 and self.curTab == self.jinBiaoSai then
		self.contentNode.data.JinBiaoSaiData = result

		self.updateJinBiaoSai(self)
	end

	return 
end

return teamCompetition
