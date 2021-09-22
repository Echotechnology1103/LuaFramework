local ContainerAttainment = {}
----------成就-----------
local var = {}
local btns = {
	{name = "btn_check",		str = "点击查看成就"},
	{name = "btn_activation",	str = "成就激活"},
	{name = "btn_go",			str = "立即前往"},
	{name = "Text_64",			str = "积分说明",touch = true},
	{name = "btn_upgrade",		str = "升级勋章"},
	{name = "btn_buy",			str = "立刻购买"},
	{name = "btn_charge",		str = "充值"},
	{name = "btn_arrow_left",	str = ""},
	{name = "btn_arrow_right",	str = ""},
}
local lblhint = {
	"<font color=#E7BA52 size=18>积分说明</font>",
	'1.	积分可用来兑换勋章，增加角色属性',
	'2.	积分通过完成成就，活动，使用成就令牌获得',
	'3.	成就令牌可通过商城或右侧链接购买',
}
local medalPos = -19*2
function ContainerAttainment.initView()
	var = {
		xmlPanel,
		defaultTab=1,
		keyName,
		keyIndex,
		tableview,
		ContainerAttainmentResult,
		tableviewData,
		curTaskId,
		tab,
		selectItem,
		selectItemIdx=1,
		unlockLayer,
		shopshow= false,
	}

	var.xmlPanel = GUIAnalysis.load("ui/layout/ContainerAttainment.uif")
	if var.xmlPanel then
		cc.EventProxy.new(GameSocket,var.xmlPanel)
			:addEventListener(GameMessageCode.EVENT_PUSH_PANEL_DATA, ContainerAttainment.handlePanelData)

		GameUtilSenior.asyncload(var.xmlPanel, "innerbg", "ui/image/img_achieve_bg.jpg")
		for k,v in pairs(btns) do
			if v.touch then
				var.xmlPanel:getWidgetByName(v.name):setTouchEnabled(true)
				var.xmlPanel:getWidgetByName(v.name):addTouchEventListener(ContainerAttainment.pushButton)
			else
				print("+===============(v.name",v.name)
				var.xmlPanel:getWidgetByName(v.name):addClickEventListener(ContainerAttainment.pushButton)
			end
		end
		var.tableview = var.xmlPanel:getWidgetByName("achieveList");
		var.tab = var.xmlPanel:getWidgetByName("tab")
		var.tab:setFontSize(18)
		var.tab:addTabEventListener(ContainerAttainment.clickTabEventListener)
		var.tab:setTabRes("tab_v4","tab_v4_sel",ccui.TextureResType.plistType)
		GameUtilSenior.asyncload(var.xmlPanel, "xunzhang_bg", "ui/image/img_xunzhang_bg.jpg")
		GameUtilSenior.asyncload(var.xmlPanel, "shop_bg", "ui/image/img_furnace_buy_bg.png")
		var.xmlPanel:getWidgetByName("progressbar"):setFontSize(18):setTextColor(GameBaseLogic.getColor(0xf7f0e2)):enableOutline(GameBaseLogic.getColor(0x000000), 1)

		var.xmlPanel:getWidgetByName("LayerShop"):setPosition(cc.p(168,-550+38))
		var.xmlPanel:getWidgetByName("shopcontainer"):pos(0,0):show()
		var.unlockLayer = var.xmlPanel:getWidgetByName("unlockLayer"):pos(0,0):hide()
		var.xmlPanel:getWidgetByName("btn_arrow_left"):setRotation(-180)
		return var.xmlPanel
	end
end

function ContainerAttainment.clickTabEventListener( sender )
	local tag = sender:getTag()
	if tag == 1 then
		var.xmlPanel:getWidgetByName("page1"):show()
		var.xmlPanel:getWidgetByName("page2"):hide()
		GameSocket:PushLuaTable("gui.ContainerAttainment.onPanelData", GameUtilSenior.encode({actionid = "updateList",}))
	elseif tag ==2 then
		var.xmlPanel:getWidgetByName("page2"):show()
		var.xmlPanel:getWidgetByName("page1"):hide()
		GameSocket:PushLuaTable("gui.ContainerAttainment.onPanelData", GameUtilSenior.encode({actionid = "updateXunzhang",}))
	end
end

function ContainerAttainment.onPanelOpen(event)
	if tonumber(event.tab) then
		var.defaultTab = event.tab
	end
	var.tab:setSelectedTab(var.defaultTab)
end

function ContainerAttainment.pushButton(psender,eventType)
	local name = psender:getName()
	if name == "btn_check" then
		if not var.ContainerAttainmentResult then
			var.ContainerAttainmentResult = require_ex("panels.ContainerAttainmentResult");
			var.ContainerAttainmentResult.xmlPanel = var.ContainerAttainmentResult.initView()
			local xmlsize = var.ContainerAttainmentResult.xmlPanel:getContentSize()
			var.ContainerAttainmentResult.xmlPanel:addTo(var.xmlPanel):align(display.CENTER,xmlsize.width/2,xmlsize.height/2)
		end
		var.ContainerAttainmentResult.xmlPanel:setVisible(true)
		var.ContainerAttainmentResult.onPanelOpen()
		-- GameSocket:dispatchEvent({name = GameMessageCode.EVENT_OPEN_PANEL,str = "main_achieveAward",from = "main_achieve"})
	elseif name == "btn_activation" then
		if var.curTaskId then
			GameSocket:PushLuaTable("gui.ContainerAttainment.onPanelData", GameUtilSenior.encode({actionid = "checkmoney",taskId = var.curTaskId}))
			-- psender:hide()
			-- var.xmlPanel:getWidgetByName("lbltaskneed"):hide()
			-- ContainerAttainment.activateAchieve(var.curTaskId)
		end
	elseif name=="btn_go" then
		if var.curTaskId then
			GameSocket:PushLuaTable("gui.ContainerAttainment.onPanelData", GameUtilSenior.encode({actionid = "btn_go",taskId = var.curTaskId}))
			GameSocket:dispatchEvent({name = GameMessageCode.EVENT_CLOSE_PANEL, str = "main_achieve"})
		end
	elseif name=="Text_64" then
		if eventType == ccui.TouchEventType.began then
			GameSocket:dispatchEvent({
				name = GameMessageCode.EVENT_PANEL_ON_ALERT, panel = "tips", visible = true, infoTable = lblhint,
			})
		elseif eventType == ccui.TouchEventType.ended or eventType == ccui.TouchEventType.canceled  then
			GameSocket:dispatchEvent({name = GameMessageCode.EVENT_PANEL_ON_ALERT, panel = "all", visible = false })
		end
	elseif name =="btn_upgrade" then
		GameSocket:PushLuaTable("gui.ContainerAttainment.onPanelData", GameUtilSenior.encode({actionid = "upgradeXZ",}))
	elseif name =="btn_charge" then
		GameSocket:PushLuaTable("server.showChongzhi", GameUtilSenior.encode({}))
	elseif name =="btn_buy" then
		psender:setTouchEnabled(false)
		local LayerShop = var.xmlPanel:getWidgetByName("LayerShop")
		LayerShop:stopAllActions()
		LayerShop:runAction(cca.seq({
			cca.moveTo(0.3, LayerShop:getPositionX(), var.shopshow and 38-550 or 0),
			cca.callFunc(function(target)
				psender:setTouchEnabled(true)
				var.shopshow = not var.shopshow;
		    end)
			}
		))
	elseif name =="btn_arrow_left" then
		var.tableview:moveToPreItem()
	elseif name =="btn_arrow_right" then
		var.tableview:moveToNextItem()
	end
end

function ContainerAttainment.handlePanelData(event)
	if event.type ~= "ContainerAttainment" then return end
	local result = GameUtilSenior.decode(event.data)
	if result.cmd == "updateList" then
		ContainerAttainment.initTableView( result.data )
		var.xmlPanel:getWidgetByName("score"):setString(result.score)
	elseif result.cmd == "activate" then
		var.xmlPanel:getWidgetByName("btn_activation"):setVisible(false)
		var.xmlPanel:getWidgetByName("lbltaskneed"):setVisible(false)
		var.tab:setSelectedTab(1)
	elseif result.cmd =="updateXunzhang" then
		ContainerAttainment.freshXunzhangView(result)
	elseif result.cmd == "updateAchieveWithId" then
		ContainerAttainment.freshAchieve(result.data)
	elseif result.cmd =="moneyenough" then
		var.xmlPanel:getWidgetByName("btn_activation"):hide()
		var.xmlPanel:getWidgetByName("lbltaskneed"):hide()
		ContainerAttainment.activateAchieve(var.curTaskId)
	end
end

function ContainerAttainment.activateAchieve(taskId)
	local haveNext = false
	local size = var.unlockLayer:getContentSize()
	local unlockEffect = var.unlockLayer:getChildByName("unlockEffect")
	if not unlockEffect then
		unlockEffect = cc.Sprite:create()
		unlockEffect:addTo(var.unlockLayer):pos(size.width/2, size.height/2):setName("unlockEffect")
	end

	for kk,vv in pairs(var.tableviewData) do
		if vv.taskId == taskId+1 then
			haveNext = true
			local res =  "ui/image/"..vv.huizhang..".png"
			--var.unlockLayer:getWidgetByName("unlockicon"):loadTexture(res, ccui.TextureResType.localType)
			asyncload_callback(res, var.unlockLayer:getWidgetByName("unlockicon"), function(path, texture)
				var.unlockLayer:getWidgetByName("unlockicon"):loadTexture(path)
			end)
			break
		end
	end
	if haveNext then
		var.unlockLayer:show()
		local animate = cc.AnimManager:getInstance():getPlistAnimate(4,65400,4,4,false,false,0,function(animate,shouldDownload)
							if animate then
								unlockEffect:runAction(cca.seq({
									animate,
									cca.cb(function ( target )
										var.unlockLayer:hide()
										GameSocket:PushLuaTable("gui.ContainerAttainment.onPanelData", GameUtilSenior.encode({actionid = "activation",taskId = taskId}))
									end)
								}))
							end
							if shouldDownload==true then
								unlockEffect:release()
								var.unlockLayer:release()
							end
						end,
						function(animate)
							unlockEffect:retain()
							var.unlockLayer:retain()
						end)--成就达成
		
	else
		var.unlockLayer:hide()
		GameSocket:PushLuaTable("gui.ContainerAttainment.onPanelData", GameUtilSenior.encode({actionid = "activation",taskId = taskId}))
	end
end

function ContainerAttainment.freshAchieve(config)
	var.curTaskId = config.taskId
	GameUtilSenior.asyncload(var.xmlPanel, "imgachieve", "ui/image/"..config.huizhang..".png")
	local curNum = config.curNum or 0
	curNum = GameUtilSenior.bound(0, curNum, config.num)
	var.xmlPanel:getWidgetByName("lbltasks_percent"):setString("")
	local richtext = var.xmlPanel:getWidgetByName("rich_percent")
	if not richtext then
		richtext = GUIRichLabel.new({name="rich_percent",ignoreSize = true,anchor = cc.p(0.5,0.5)})
		richtext:addTo(var.xmlPanel:getWidgetByName("lbltasks_percent"))
	end
	local desp = "<font color=#ff7800>"..config.completeDesp.."</font>"
	if not config.preShow then
		desp = desp.."<font color=#FFF843>(<font color=#"..(curNum<config.num and "ff0000" or "00ff00")..">"..curNum.."</font><font color=#00ff00>/"..config.num.."</font>)</font>"
	end
	richtext:setRichLabel(desp, "", 22)
	var.xmlPanel:getWidgetByName("lbltasks"):setString("")
	var.xmlPanel:getWidgetByName("lbltaskneed"):setVisible(not config.activate):setString(string.format("消耗%s绑定金币",config.coin))
	var.xmlPanel:getWidgetByName("cangetjf"):setString(config.achieveValue)
	var.xmlPanel:getWidgetByName("lbltasktitle"):setString("")

	--var.xmlPanel:getWidgetByName("taskinfobg"):loadTexture("ui/image/"..config.jiangli..".png",ccui.TextureResType.localType)
	
	asyncload_callback("ui/image/"..config.jiangli..".png", var.xmlPanel:getWidgetByName("taskinfobg"), function(path, texture)
		var.xmlPanel:getWidgetByName("taskinfobg"):loadTexture(path)
	end)
	
	local btn_go = var.xmlPanel:getWidgetByName("btn_go")

	if config.btn and config.btn~="null" and not config.preShow then
		btn_go:setVisible(config.curNum<config.num)
	else
		btn_go:hide()
	end
	var.xmlPanel:getWidgetByName("img_achieve_finish"):setVisible(config.curNum>=config.num)
	local btn_activation = var.xmlPanel:getWidgetByName("btn_activation")
	btn_activation:setVisible(not config.activate):setEnabled(config.curNum>=config.num)
	GUIAnalysis.attachEffect(btn_activation,"outline(076900,1)")
	if btn_go:isVisible() then
		btn_activation:hide()
		var.xmlPanel:getWidgetByName("lbltaskneed"):hide()
	end

	if config.curNum>=config.num and checkint(GameSocket.mCharacter.mGameMoneyBind)+checkint(GameSocket.mCharacter.mGameMoney)>=config.coin then
		GameUtilSenior.addHaloToButton(btn_activation, "btn_normal_light3")
	else
		if btn_activation:getWidgetByName("img_bln") then
			btn_activation:removeChildByName("img_bln")
		end
	end

end

function ContainerAttainment.initTableView( data )
	if not GameUtilSenior.isTable(data) then return end
	var.tableviewData = data;
	table.sort(data,function(A,B)
		if A.activate == B.activate then
			if checknumber(A.preShow)==checknumber(B.preShow) then
				if A.curNum/A.num == B.curNum/B.num then
					return A.taskId<B.taskId
				else
					return A.curNum/A.num > B.curNum/B.num
				end
			else
				return checknumber(A.preShow)<checknumber(B.preShow)
			end
		else
			return A.activate<B.activate
		end
	end)
	local function clickBtn(sender)
		if GameUtilSenior.isObjectExist(var.selectItem) then
			var.selectItem:getWidgetByName("modelimg_select"):hide()
		end
		var.selectItem = sender:getParent()
		var.selectItemIdx = var.selectItem.tag
		var.selectItem:getWidgetByName("modelimg_select"):show():setTouchEnabled(false)
		GameSocket:PushLuaTable("gui.ContainerAttainment.onPanelData", GameUtilSenior.encode({actionid = "updateAchieveWithId",taskId = sender.taskId}))
	end
	local fresh = false
	var.tableview:reloadData(#data,function( subItem )
		local d = data[subItem.tag]
		subItem:getWidgetByName("modelname"):setString(d.name)
		local modelimg = subItem:getWidgetByName("modelimg"):setTouchEnabled(true):setPressedActionEnabled(true)
		modelimg.taskId = d.taskId
		modelimg:setSwallowTouches(false)
		modelimg:addClickEventListener(clickBtn)

		local res =  "ui/image/"..d.huizhang..".png"
		--modelimg:loadTextures(res,"","",ccui.TextureResType.localType):setLocalZOrder(2):setBright(d.curNum>=d.num)--已完成
		
		asyncload_callback(res, modelimg, function(path, texture)
			modelimg:loadTexture(path):setLocalZOrder(2):setBright(d.curNum>=d.num)--已完成
		end)
		
		modelimg:setScale(0.55)
		subItem:getWidgetByName("modelgot"):setVisible(d.activate>0):setLocalZOrder(2)--已激活

		local size = subItem:getContentSize()
		local fireworks = subItem:getChildByName("fireworks")
		if not fireworks then
			fireworks = cc.Sprite:create()
			fireworks:addTo(subItem):pos(size.width/2, size.height/2+8):setName("fireworks"):setLocalZOrder(3)
		end
		local animate
		if d.curNum>=d.num and checknumber(d.activate) == 0 and not d.preShow then
			animate = cc.AnimManager:getInstance():getPlistAnimate(4,65401,4,4,false,false,0,function(animate,shouldDownload)
							if animate then
								fireworks:show():runAction(cca.loop(
									cca.seq(animate, 1)
								))
							end
							if shouldDownload==true then
								fireworks:release()
							end
						end,
						function(animate)
							fireworks:retain()
						end)--成就达成
		else
			fireworks:hide()
		end
		local lockSprite = subItem:getChildByName("lockSprite")
		if not lockSprite then
			lockSprite = cc.Sprite:create()
			lockSprite:addTo(subItem):pos(size.width/2, size.height/2):setName("lockSprite"):setLocalZOrder(4)
		end
		if not d.preShow then
			lockSprite:setSpriteFrame("null")
		else
			animate = cc.AnimManager:getInstance():getPlistAnimate(4,65400,4,4,false,false,0,function(animate,shouldDownload)
							lockSprite:show():stopAllActions()
							if animate then
								local frames = animate:getAnimation():getFrames()
								if frames[1] then
									lockSprite:setSpriteFrame(frames[1]:getSpriteFrame())
								end
							end
							if shouldDownload==true then
								lockSprite:release()
							end
						end,
						function(animate)
							lockSprite:retain()
						end)
		end
		subItem:getWidgetByName("modelimg_select"):setVisible(subItem.tag == var.selectItemIdx)
		if not fresh and subItem.tag == 1 then
			clickBtn(modelimg)
		end
		fresh= true
	end,false,0)
end

function ContainerAttainment.freshXunzhangView(result)

	var.xmlPanel:getWidgetByName("lblcoin"):setString(GameSocket.mCharacter.mVCoin or 0)
	var.xmlPanel:getWidgetByName("lblbindcoin"):setString(GameSocket.mCharacter.mVCoinBind or 0)
	var.xmlPanel:getWidgetByName("progressbar"):setPercent(result.score,result.scoreMax)
	local medalLv = result.medalLv
	local btn_upgrade = var.xmlPanel:getWidgetByName("btn_upgrade")
	if result.breath then
		GameUtilSenior.addHaloToButton(btn_upgrade, "btn_normal_light3")
	else
		if btn_upgrade:getWidgetByName("img_bln") then
			btn_upgrade:removeChildByName("img_bln")
		end
	end
	local btnstr = ""
	if medalLv==12 then
		btnstr = "已满级"
	elseif medalLv>0 then
		btnstr = "升级勋章"
	else
		btnstr = "领取勋章"
	end
	btn_upgrade:setTitleText(btnstr)
	ContainerAttainment.freshIconAndLabel(medalLv)
	local xzList = var.xmlPanel:getWidgetByName("xzList")
	local listshop = var.xmlPanel:getWidgetByName("listshop")
	local data = result.data
	xzList:reloadData(#data,function( subItem )
		local d = data[subItem.tag]
		local icon = subItem:getWidgetByName("icon")
		local modelname = subItem:getWidgetByName("modelname")
		-- icon:loadTexture(d.icon, ccui.TextureResType.plistType)
		GUIItem.getItem({
			parent = subItem:getWidgetByName("modelimg"),
			typeId = subItem.tag+14500000,
		})
		modelname:setString(d.name)
		subItem:getWidgetByName("modelget"):setVisible(medalLv>=subItem.tag)
	end)

	local shopData = result.medalShop or {}
	local clickTime = 0
	listshop:reloadData(#shopData, function(subItem)
		local t = shopData[subItem.tag];
		GUIItem.getItem({
			parent = subItem:getWidgetByName("modelicon"),
			typeId = t.id,
		})
		local modelname = subItem:getWidgetByName("modelname")
		modelname:setString(t.name)
		subItem:getWidgetByName("modellblcoin"):setString(t.money)
		local modelbtnbuy = subItem:getWidgetByName("modelbtnbuy")
		modelbtnbuy.storeId = t.storeId
		GUIAnalysis.attachEffect(modelbtnbuy,"outline(076900,1)")

		subItem:getWidgetByName("modelbtnbuy"):addClickEventListener(function( sender )
			if GameBaseLogic.getTime() - clickTime > 250 then
				GameSocket:PushLuaTable("gui.ContainerAttainment.onPanelData", GameUtilSenior.encode({actionid = "buy",param={sender.storeId}}))
				clickTime = GameBaseLogic.getTime()
			end
		end)

		local resource = {"coin","coin_bind","vcoin","vcoin_bind"}
		local res = resource[t.MoneyKind-99]
		subItem:getWidgetByName("modelcoin"):loadTexture(res,ccui.TextureResType.plistType)
	end,nil,false)
	if result.up then
		--刷新动画对象
		local fireworks = cc.Sprite:create():addTo(var.xmlPanel):pos(302.03, 414.19)
		local animate = cc.AnimManager:getInstance():getPlistAnimate(4,50024,4,4,false,false,0,function(animate,shouldDownload)
							-- print(animate:getAnimation():setDelayPerUnit(36/40))
							fireworks:runAction(cca.seq({
								cca.rep(animate, 1),
								cca.cb(function ()

								end),
								cca.removeSelf()
							}))
							if shouldDownload==true then
								fireworks:release()
							end
						end,
						function(animate)
							fireworks:retain()
						end)
	end

end

function ContainerAttainment.freshIconAndLabel(medalLv)
	local nextId = medalLv+14500001
	nextId = GameUtilSenior.bound(14500001, nextId, 14500012)
	local itemdef = GameSocket:getItemDefByID(nextId)
	var.xmlPanel:getWidgetByName("medalname"):setString(itemdef.mName)
	GUIItem.getItem({
		parent = var.xmlPanel:getWidgetByName("nextSprit"),
		typeId = nextId,
	})
	local lblpool,itemdef = {}
	local nItem = GameSocket:getNetItem(medalPos)
	if nItem then
		itemdef = GameSocket:getItemDefByID(nItem.mTypeID)
		if itemdef then
			table.insert(lblpool,{"物攻：",itemdef.mDC.."-"..itemdef.mDCMax})
			table.insert(lblpool,{"魔攻：",itemdef.mMC.."-"..itemdef.mMCMax})
			table.insert(lblpool,{"道攻：",itemdef.mSC.."-"..itemdef.mSCMax})
			for i=1,3 do
				if i<= #lblpool then
					var.xmlPanel:getWidgetByName("lblcurattr"..i):setString(lblpool[i][1])
					var.xmlPanel:getWidgetByName("curattr"..i):setString(lblpool[i][2])
				end
				var.xmlPanel:getWidgetByName("lblcurattr"..i):setVisible(i<= #lblpool)--:setPositionX(var.tp ~=3 and 80 or 60)
				var.xmlPanel:getWidgetByName("curattr"..i):setVisible(i<= #lblpool)--:setPositionX(var.tp ~=3 and 80 or 60)
			end
		end
	else
		for i=1,3 do
			var.xmlPanel:getWidgetByName("lblcurattr"..i):setString("")
			var.xmlPanel:getWidgetByName("curattr"..i):setString("")
		end
	end
	lblpool = {};
	if medalLv>=0 and medalLv<12 then
		itemdef = GameSocket:getItemDefByID(nextId)
		if itemdef then
			var.xmlPanel:getWidgetByName("medalname"):setString(itemdef.mName)
			GUIItem.getItem({
				parent = var.xmlPanel:getWidgetByName("nextSprit"),
				typeId = nextId,
			})
			table.insert(lblpool,{"物攻：",itemdef.mDC.."-"..itemdef.mDCMax})
			table.insert(lblpool,{"魔攻：",itemdef.mMC.."-"..itemdef.mMCMax})
			table.insert(lblpool,{"道攻：",itemdef.mSC.."-"..itemdef.mSCMax})
			for i=1,3 do
				if i<= #lblpool then
					var.xmlPanel:getWidgetByName("lblnextattr"..i):setString(lblpool[i][1])
					var.xmlPanel:getWidgetByName("nextattr"..i):setString(lblpool[i][2])
				end
				var.xmlPanel:getWidgetByName("lblnextattr"..i):setVisible(i<= #lblpool)--:setPositionX(var.tp ~=3 and 80 or 60)
				var.xmlPanel:getWidgetByName("nextattr"..i):setVisible(i<= #lblpool)--:setPositionX(var.tp ~=3 and 80 or 60)
			end
		end
	else
		for i=1,3 do
			var.xmlPanel:getWidgetByName("lblnextattr"..i):setString("")
			var.xmlPanel:getWidgetByName("nextattr"..i):setString("")
		end
	end
end

function ContainerAttainment.onPanelClose()
	-- local shopcontainer = var.xmlPanel:getWidgetByName("shopcontainer")
	-- if GameUtilSenior.isObjectExist(shopcontainer) then
	-- 	shopcontainer:hide()
	-- end
	if var.ContainerAttainmentResult and GameUtilSenior.isObjectExist(var.ContainerAttainmentResult.xmlPanel) then
		var.ContainerAttainmentResult.xmlPanel:setVisible(true)
	end
	GameSocket:dispatchEvent({name = GameMessageCode.EVENT_PANEL_ON_ALERT, panel = "all", visible = false })
end

return ContainerAttainment