local GUILeftBottom={}

local var = {}
local CHANNEL_TAG = {
	ALL = 1, --综合
	-- HORN = 2,
	WORLD = 2, 
	GUILD = 3,
	GROUP = 4,
	CURRENT = 5,
	PRIVATE = 6,
	SYSTEM = 7,
}

local channelInfo = {
	[CHANNEL_TAG.ALL]  	  = {color = "f2e900", strChannel = GameConst.str_chat_system,		},
	-- [CHANNEL_TAG.HORN]	  = {color = "ff1fec", strChannel = GameConst.str_chat_horn,	},
	[CHANNEL_TAG.WORLD]   = {color = "bd5fff", strChannel = GameConst.str_chat_world,	voiceChanne = "VoiceChannelWorld"},
	[CHANNEL_TAG.GUILD]   = {color = "3ff200", strChannel = GameConst.str_chat_guild,	voiceChanne = "VoiceChannelGuild"},
	[CHANNEL_TAG.GROUP]   = {color = "009af2", strChannel = GameConst.str_chat_group,	voiceChanne = "VoiceChannelGroup"},
	[CHANNEL_TAG.CURRENT] = {color = "f2ab00", strChannel = GameConst.str_chat_near,	voiceChanne = "VoiceChannelNear"},
	[CHANNEL_TAG.PRIVATE] = {color = "C8C8C8", strChannel = GameConst.str_chat_private,	},
}
local msg_img_key ={
	[GameConst.str_chat_all]	={	img = "img_chat_world",		colorStr = "fff843",	typeColor = "ff0000",	},
	[GameConst.str_chat_system]	={	img = "img_chat_system",	colorStr = "FFFF00",	typeColor = "FFFF00",	},
	[GameConst.str_chat_world]	={	img = "img_chat_world",		colorStr = "3ff200",	typeColor = "3ff200",	},
	[GameConst.str_chat_private]={	img = "img_chat_private",	colorStr = "FF11CF",	typeColor = "FF11CF",	},
	[GameConst.str_chat_guild]	={	img = "img_chat_guild",		colorStr = "f2e900",	typeColor = "f2e900",	},
	[GameConst.str_chat_group]	={	img = "img_chat_group",		colorStr = "009af2",	typeColor = "009af2",	},
	[GameConst.str_chat_shout]	={	img = "img_chat_horn",		colorStr = "ffffff",	typeColor = "e60ed4",	},
	[GameConst.str_chat_horn]	={	img = "img_chat_horn",		colorStr = "ffffff",	typeColor = "ff1fec",	},
	[GameConst.str_chat_common]	={	img = "img_chat_common",	colorStr = "ffffff",	typeColor = "ff9743",	},
	[GameConst.str_chat_near]	={	img = "img_chat_near",		colorStr = "fde5b2",	typeColor = "f2ab00",	},
}
local charsize = 16
local function setExpEffectPos(percent)
	if var.imgExpEffect then
		-- print("///////////////////setExpEffectPos////////////////////", percent)
		var.imgExpEffect:setPositionX(percent * 840 + 5)
	end
end

function GUILeftBottom.init_ui (leftBottom)	
	var = {
		leftBottom,
		chatBg,
		chatIndex = 0,
		privateMsgNum = 0,--私聊 信息数量
		expBar,
		listChat,
		boxSwitchChat,
		voiceBtns = {},
		voicePlayList = {},--自动播放语音队列
		clickClock=0,--防止双击箭头误触语音按钮
		chanelClock = 0, --频道锁定
	}
	var.intimeChat = GameSetting.getConf("VoiceInTime");--实时语音
	var.leftBottom = leftBottom

	var.leftBottom:getWidgetByName("post_right_bg"):setPositionY(display.height*0.01)

	--var.listChat = leftBottom:getWidgetByName("list_chat")
	var.listChat = GUICenterBottom.listChat
	---var.listChat:setSwallowTouches(false):setGravity(ccui.ListViewGravity.bottom)
	var.chatBg = leftBottom:getWidgetByName("chat_bg")
	var.chatBg:setTouchEnabled(true)
	-- var.chatBg:setContentSize(cc.size(GameConst.VISIBLE_WIDTH,var.chatBg:getContentSize().height))
	local btn_chatarrow = var.leftBottom:getWidgetByName("btn_chatarrow")
	var.chatBg.chatScale = false
	GameUtilSenior.addMutilClickListener(var.chatBg, function (pSender)
	end, function (pSender)
		if not var.chatBg.chatScale then
			GameSocket:dispatchEvent({name = GameMessageCode.EVENT_OPEN_PANEL, str = "panel_chat" ,} )
			GameSocket:PushLuaTable("count.onClientData", GameUtilSenior.encode({cmd = "点击聊天"}))
		end
		-- GUILeftBottom.clickArrow(btn_chatarrow)
	end)

	var.boxSwitchChat = leftBottom:getWidgetByName("box_switch_chat"):hide()
	var.expBar = leftBottom:getWidgetByName("exp_bar")
		:setFontSize(16)
		:setFormatString("%s/%s")
		:setFormat2String( "(%.2f%%)" )
		:setPercent(GameSocket.mCharacter.mCurExperience,GameSocket.mCharacter.mCurrentLevelMaxExp)
	-- leftBottom:getWidgetByName("barseperate"):setPosition(cc.p(0,0))
	local expLayout = ccui.Layout:create()
		:align(display.CENTER, 445, 14)
		:setContentSize(cc.size(840,14))
		:addTo(leftBottom:getWidgetByName("exp_bg"))
		:setClippingEnabled(true)

	var.imgExpEffect = ccui.ImageView:create("img_exp_effect", ccui.TextureResType.plistType)
		:align(display.CENTER_RIGHT, 0, 7)
		:addTo(expLayout)

	setExpEffectPos(GameSocket.mCharacter.mCurExperience/GameSocket.mCharacter.mCurrentLevelMaxExp)


	GUILeftBottom.handleSideChange({hand = "normal"})

	cc.EventProxy.new(GameSocket,leftBottom)
		:addEventListener(GameMessageCode.EVENT_EXP_CHANGE,GUILeftBottom.handleExpChange)
		:addEventListener(GameMessageCode.EVENT_CHAT_MSG,GUILeftBottom.handleChatMsg)
		:addEventListener(GameMessageCode.EVENT_HAND_MODEL,GUILeftBottom.handleSideChange)
		:addEventListener(GameMessageCode.EVENT_ADD_ALERT, GUILeftBottom.handleMsg) 
		:addEventListener(GameMessageCode.EVENT_CHAT_VISIBLE, function (event)
			var.chatBg:setVisible(event.visible and true or false)
		end)
		:addEventListener(GameMessageCode.EVENT_VOICE_PLAY_FINISH,GUILeftBottom.onVoicePlayFinish)
			
	asyncload_frames("ui/sprite/GUIEmoj",".png",function ()
		GUILeftBottom.handleChatMsg()
	end,var.leftBottom)

	if PLATFORM_BANSHU then
		var.boxSwitchChat:hide()
		for i=1,4 do
			var.leftBottom:getWidgetByName("btn_voice"..i):hide()
		end
		var.leftBottom:getWidgetByName("btn_chatarrow"):hide()
		--var.listChat:pos(0,0):size(330,106)
	else
		--var.listChat:pos(10,5):size(320,96)
		GUILeftBottom.initArrowBtn()
		GUILeftBottom.initIntimeChatBtn()
	end
	--显示系统消息
	for i,v in ipairs(GameSocket.mChatHistroy) do
		local event = {}
		event.msg=v
		GUILeftBottom.handleChatMsg(event)
	end
	var.leftBottom:getWidgetByName("btn_show"):addClickEventListener(GUICenterBottom.handleSetPKNoraml)
end

function GUILeftBottom.setVoiceChannelVisible(vis)
	local btn_voice
	for i=1,4 do
		local pos = 38+(i-1)*65
		btn_voice = var.leftBottom:getWidgetByName("btn_voice"..i):stopAllActions()
		btn_voice:runAction(cca.seq({
			cca.cb(function(target)
				target:setPositionY(vis and 38 or pos)
				target:setVisible(true)
			end),
			cca.moveTo(0.2, 30, vis and pos or 38),
			cca.cb(function(target)
				target:setPositionY(vis and pos or 38)
				target:setVisible(vis or i<=1)
			end),
		}))
	end
	var.chatBg.chatScale = vis
	var.chatBg:setScale9Enabled(true):setContentSize(cc.size(330,vis and 300 or 106))
	var.listChat:setContentSize(cc.size(var.listChat:getContentSize().width,vis and 300 or 106))
	var.listChat:scrollToBottom(0.1,true)
	var.chatBg:getWidgetByName("doubleclick"):setVisible(not vis)
end
local voice_btn_name = {"","btn_voice1","btn_voice4","btn_voice3","btn_voice2"}
function GUILeftBottom.changeChatChannel(index)
	var.chanelClock = index
	if index >= 2 and index <= 5 then
		for i,v in ipairs(voice_btn_name) do
			local btn = var.leftBottom:getWidgetByName(v)
			if index == i then
				if btn then
					btn:show()
					btn:setPosition(30, 38)
				end
			else
				if btn then
					btn:hide()
				end
			end
		end
		--var.listChat:removeAllChildren()
		--GUILeftBottom.updateChanelMsg()
	end
end
--改变频道后聊天内容
function GUILeftBottom.updateChanelMsg()
	local netInfo = {}
	for i,v in ipairs(GameSocket.mChatHistroy) do
		if v.m_strType == channelInfo[var.chanelClock].strChannel then
			table.insert(netInfo,v)
		end
	end
	if #netInfo > 0 then
		for i=#netInfo-3,#netInfo do
			if netInfo[i] then
				 local richWidget = GUILeftBottom.newChatMsg( netInfo[i] )
				 if not richWidget then return end
				 if var.listChat:getContentSize().height < var.listChat:getInnerContainerSize().height then
				 	var.listChat:removeItem(0)
				 end
				 var.listChat:pushBackCustomItem(richWidget)
			end
		end
		var.listChat:scrollToBottom(0.1,true)
	end
end


function GUILeftBottom.clickArrow(sender)
	var.clickClock = GameBaseLogic.ClockTick
	if sender:getScaleY() ==1 then
		GameSocket:dispatchEvent({name = GameMessageCode.EVENT_OPEN_PANEL, str = "panel_chat" ,} )
		GameSocket:PushLuaTable("count.onClientData", GameUtilSenior.encode({cmd = "点击聊天"}))
	-- 	sender:runAction(cca.seq({
	-- 		cca.moveTo(0.2, sender:getPositionX(), 88+3*65),
	-- 		cca.cb(function() sender:setScaleY(-1) end)
	-- 	}))
	-- 	GUILeftBottom.setVoiceChannelVisible(true)
	-- else
	-- 	sender:runAction(cca.seq({
	-- 		cca.moveTo(0.2, sender:getPositionX(), 88),
	-- 		cca.cb(function() sender:setScaleY(1) end)
	-- 	}))
	-- 	GUILeftBottom.setVoiceChannelVisible(false)
	end
end
function GUILeftBottom.initArrowBtn()
	local btn_chatarrow = var.leftBottom:getWidgetByName("btn_chatarrow")
	btn_chatarrow:addClickEventListener(GUILeftBottom.clickArrow)
	local channel = {"VoiceChannelWorld","VoiceChannelNear","VoiceChannelGroup","VoiceChannelGuild"}
	for i=1,4 do
		local btn_voice = var.leftBottom:getWidgetByName("btn_voice"..i)
		btn_voice:addTouchEventListener(function (sender,touchType)
			if GameBaseLogic.ClockTick-var.clickClock <=10  then return end
			if i == 3 then
				if #GameSocket.mGroupMembers == 0 then
					return GameSocket:alertLocalMsg("请先加入队伍！", "alert")
				end
			elseif i ==4 then
				local mGuildName = GameCharacter._mainAvatar:NetAttr(GameConst.net_guild_name)
				if not mGuildName or mGuildName=="" then
					return GameSocket:alertLocalMsg("请先加入帮会！", "alert")
				end
			end
			if touchType == ccui.TouchEventType.began then
				GDivRecord.voiceHandler({vis = true,channel = channel[i]})
			elseif touchType == ccui.TouchEventType.canceled or touchType == ccui.TouchEventType.ended then
				GDivRecord.voiceHandler({vis = false, send = GameUtilSenior.hitTest(sender, sender:getTouchEndPosition())})
			else
				GDivRecord.voiceHandler({charVis = not GameUtilSenior.hitTest(sender, sender:getTouchMovePosition())})
			end
			-- GameSocket:PushLuaTable("count.onClientData", GameUtilSenior.encode({cmd = "点击聊天"}))
		end)
	end
end

function GUILeftBottom.initIntimeChatBtn()
	local btn_intimevoice = var.leftBottom:getWidgetByName("btn_intimevoice1")
	local btn_intimevoice2 = var.leftBottom:getWidgetByName("btn_intimevoice2")
	local btn_intimevoice3 = var.leftBottom:getWidgetByName("btn_intimevoice3")
	local btn_voice_switch = var.leftBottom:getWidgetByName("btn_voice_switch")
	btn_voice_switch:addClickEventListener(function(sender)
		local channel = btn_intimevoice:getWidgetByName("lbl_model"):getString()
		if channel ~="静音" then
			var.intimeChat = not var.intimeChat
			var.leftBottom:getWidgetByName("img_voice_switch"):loadTexture(var.intimeChat and "img_voice_on" or "img_voice_off", ccui.TextureResType.plistType)
			GameSetting.setConf("VoiceInTime",var.intimeChat)
			-- print(var.intimeChat and "开始实时语音" or "关闭实时语音")
		end
	end)
	local function setIntimeChat(sender)
		local lbl_modelNow = btn_intimevoice:getWidgetByName("lbl_model")
		local lbl_modelclick = sender:getWidgetByName("lbl_model")
		local nowstr = lbl_modelNow:getString()
		local selectstr = lbl_modelclick:getString()
		lbl_modelNow:setString(selectstr)
		lbl_modelclick:setString(nowstr)
		local str3 = btn_intimevoice3:getWidgetByName("lbl_model"):getString()
		if str3 == "静音" then
			str1 = btn_intimevoice2:getWidgetByName("lbl_model"):getString()
			btn_intimevoice3:getWidgetByName("lbl_model"):setString(str1)
			btn_intimevoice2:getWidgetByName("lbl_model"):setString(str3)
		end
		if selectstr == "静音" then
			GameSetting.setConf("VoiceInTimeChannel","")
			--静音模式关闭实时语音
			var.intimeChat = false
		elseif selectstr == "帮会" then
			GameSetting.setConf("VoiceInTimeChannel","guild")
			var.intimeChat = true
		elseif selectstr == "队伍" then
			GameSetting.setConf("VoiceInTimeChannel","group")
			var.intimeChat = true
		end
		var.leftBottom:getWidgetByName("img_voice_switch"):loadTexture(var.intimeChat and "img_voice_on" or "img_voice_off", ccui.TextureResType.plistType)
		GameSetting.setConf("VoiceInTime",var.intimeChat)

		print("-----------------实时语音频道",selectstr)
		--[[
		GameCCBridge.callVoiceChat(var.intimeChat and "voice_resume" or"voice_pause")
		]]

		local action = cca.moveTo(0.2, 35, 20)
		btn_intimevoice2:runAction(action:clone())
		btn_intimevoice3:runAction(action:clone())
		var.leftBottom:getWidgetByName("img_chat_flag"):setRotation(0)
	end
	btn_intimevoice:addClickEventListener(function(sender)
		local img_chat_flag = var.leftBottom:getWidgetByName("img_chat_flag")
		local rotation = img_chat_flag:getRotation()==0 and 180 or 0
		img_chat_flag:setRotation(rotation)
		local posy
		for i=2,2 do
			posy = 20+(i-1)*35
			var.leftBottom:getWidgetByName("btn_intimevoice"..i):stopAllActions():runAction(cca.seq({
				cca.show(),
				cca.moveTo(0.2, 35,rotation==0 and 20 or posy),
				cca.cb(function (target)
					target:setVisible(rotation>0)
				end)
			}))
		end
	end)
	btn_intimevoice2:addClickEventListener(setIntimeChat)
	btn_intimevoice3:addClickEventListener(setIntimeChat)
end

function GUILeftBottom.handleMsg(event)
	local configs = {
		-- ["right"]				=	{parentName = "post_right_bg",				msgTable = GameSocket.m_alertListRight,				color = cc.c3b(0,255,0)},
		["centerEXP"]			=	{parentName = "post_centerEXP_bg",			msgTable = GameSocket.m_alertListCenterEXP,			color = cc.c3b(0,255,0)},
		["centerMoney"]			=	{parentName = "post_centerMoney_bg",		msgTable = GameSocket.m_alertListCenterMoney,		color = cc.c3b(0,255,0)},
		["centerInnerPower"]	=	{parentName = "post_centerInnerPower_bg",	msgTable = GameSocket.m_alertListCenterInnerPower,	color = cc.c3b(0,255,0)},

	}
	if configs[event.type] then
		local singleConfig = configs[event.type]
		local color = singleConfig.color
		if event.param and event.param.color then
			color = event.param.color
		end

		local param = {
			fontSize=24,
			parent = var.leftBottom:getWidgetByName(singleConfig.parentName),
			msg = singleConfig.msgTable[1],
			msgTable = singleConfig.msgTable,
			color = color 
		}

		if event.param and event.param.panel then
			param.onClick = function ()
				local param = {
					name = GameMessageCode.EVENT_SHOW_TIPS, str = "confirm",lblConfirm = "是否跳转到相应界面?",
					confirmCallBack = function ()
						GameSocket:dispatchEvent({name=GameMessageCode.EVENT_OPEN_PANEL,str = event.param.panel,})
					end
				}
				GameSocket:dispatchEvent(param)
			end
		end

		param.firstInQueue = event.param.firstInQueue
		if event.type == "right" then
			param.parent.msgMidMax = 4
			param.parent.msgMargin = 16
			param.parent.disapperIntarval = 5
			param.fontSize = 15
			param.parent.anchor = display.BOTTOM_LEFT
			param.richlabel = true
			param.type = "right"
			GUINumToast.handleAttrPlus(param.parent,param)
		elseif string.find(event.type,"center") then
			param.parent.msgMidMax = 1
			param.parent:setAnchorPoint(cc.p(0,0))
			param.parent.msgMargin = 22
			param.parent.disapperIntarval = 0.3
			param.parent.anchor = display.LEFT_BOTTOM
			param.richlabel = true
			if event.type == "centerEXP" then
				param.parent.type = "centerEXP"
			elseif event.type == "centerMoney" then
				param.parent.type = "centerMoney"
			elseif event.type == "centerInnerPower" then
				param.parent.type = "centerInnerPower"
			end
			GUINumToast.handleAttrPlus(param.parent,param)
		end
	end
end

function GUILeftBottom.handleSideChange(event)
	local posParam = {
		normal={
			-- {name="exp_bg",		x=0, 	y=0,	align=7},
			-- {name="chat_bg",	x=0, 	y=17, 	align=7},
			{name="news_bg",	x=280, 	y=40, 	align=7},
		},
		reverse={
			-- {name="exp_bg",		x=0, 	y=0,	align=8},
			-- {name="chat_bg",	x=0, 	y=10, 	align=8},
			{name="news_bg",	x=-280, y=40, 	align=8},
		},
	}
	if event and event.hand then
		local param = posParam[event.hand]
		for _,v in ipairs(param) do
			var.leftBottom:getWidgetByName(v.name):align(v.align,v.x,v.y)
		end
		if event.hand == "normal" then
			var.leftBottom:setPosition(GameConst.leftBottom())
		else
			var.leftBottom:setPosition(GameConst.rightBottom())
		end
		
	end
end

function GUILeftBottom.newChatMsg( netLastMsg )
	local msgText = ""
	local typeColor = msg_img_key[netLastMsg.m_strType].typeColor
	local colorStr = msg_img_key[netLastMsg.m_strType].colorStr
	local m_strMsg = netLastMsg.m_strMsg--GUILeftBottom.clipMsg( netLastMsg )
	-- local vip = ""
	-- if netLastMsg.m_vip and netLastMsg.m_vip>0 then vip = "<font color=#ff0000>[VIP"..netLastMsg.m_vip.."]</font>" end
	if (netLastMsg.localPath or netLastMsg.httpPath) and netLastMsg.duration>1 then
		m_strMsg = "<pic src=\'img_chat_voice\' rotation=180/>"..m_strMsg
	end

	if netLastMsg.m_strType == GameConst.str_chat_private then 
		if not netLastMsg.m_MyName then
			msgText = "<font color=\'#"..typeColor.."\'>"..netLastMsg.m_strType.."</font><font color=\'#"..colorStr.."\'><font color='00cae2'>"..netLastMsg.m_strName.."对我说</font>:"..m_strMsg.."</font>"
		else
			msgText = "<font color=\'#"..typeColor.."\'>"..netLastMsg.m_strType.."</font><font color=\'#"..colorStr.."\'><font color='00cae2'>我对"..netLastMsg.m_strName.."说</font>:"..m_strMsg.."</font>"
		end
		-- return nil
	else
		if netLastMsg.m_strName and netLastMsg.m_strName ~= "" then
			msgText =  "<font color=\'#"..typeColor.."\'>"..netLastMsg.m_strType.."</font><font outline=\'0,0,0,0,1\' color=#"..colorStr.."><font color='00cae2'>"..netLastMsg.m_strName.."</font>:"..m_strMsg.."</font>"
		else
			msgText = "<font color=\'#"..typeColor.."\'>"..netLastMsg.m_strType.."<font outline=\'0,0,0,0,1\' color=\'#"..colorStr.."\'>"..m_strMsg.."</font>"
		end
	end
	if string.find(msgText,"/") then
		for j=1,20 do
			msgText,num = string.gsub(msgText,GameConst.expressions_item[j][1],"<pic src=\'img_"..GameConst.expressions_item[j][2].."\'/>")
		end
	end
	-- for k,v in pairs(channelInfo) do
		-- msgText,num = string.gsub(msgText,v.strChannel,"<pic src=\'"..msg_img_key[v.strChannel].img.."\'/>")
	-- end
	--禁止超链接
	-- if string.find(msgText,"<a") then
	-- 	msgText,_ = string.gsub(msgText,"<a","<font")
	-- 	msgText,_ = string.gsub(msgText,"</a>","</font>")
	-- end
	-- if string.find(msgText,"<p ") then
	-- 	msgText,_ = string.gsub(msgText,"<p ","<font color='#00ff00'")
	-- 	msgText,_ = string.gsub(msgText,"</p>","</font>")
	-- 	msgText,_ = string.gsub(msgText,"##","")
	-- end
	
	local richWidget = GUIRichLabel.new({size = cc.size(var.listChat:getContentSize().width-charsize, 30), space=3,name = "bottomsMsg"})

	richWidget:setRichLabel(msgText,"panel_chat",charsize)
	return richWidget
end

function GUILeftBottom.handleChatMsg(event)
	if not event or not event.msg then return end
	local netChat = event.msg
	if var.listChat:getContentSize().height*10 < var.listChat:getInnerContainerSize().height then
		var.listChat:removeItem(0)
	end
	--[[
	if channelInfo[var.chanelClock] and var.chanelClock >=2 and var.chanelClock<=5 then
		if netChat.m_strType ~= channelInfo[var.chanelClock].strChannel then
			return
		end
	end
	]]--
	local richWidget = GUILeftBottom.newChatMsg( netChat )
	
	if not richWidget then return end
	var.listChat:pushBackCustomItem(richWidget)
	var.listChat:scrollToBottom(0.1,true)
	if (netChat.httpPath or netChat.localPath) and netChat.duration>0 then
		if netChat.m_strType == GameConst.str_chat_near and GameSetting.getConf("VoiceChannelNear") then
			table.insert(var.voicePlayList,netChat)
		elseif netChat.m_strType == GameConst.str_chat_guild and GameSetting.getConf("VoiceChannelGuild") then
			table.insert(var.voicePlayList,netChat)
		elseif netChat.m_strType == GameConst.str_chat_group and GameSetting.getConf("VoiceChannelGroup") then
			table.insert(var.voicePlayList,netChat)
		elseif netChat.m_strType == GameConst.str_chat_world and GameSetting.getConf("VoiceChannelWorld") then
			table.insert(var.voicePlayList,netChat)
		end
		if not GameBaseLogic.isPlayVoice then
			GUILeftBottom.onVoicePlayFinish({flag = -1})
		end
	end
end
--自动播放语音留言
function GUILeftBottom.onVoicePlayFinish(event)
	if not event or not event.flag then return end
	for i,v in ipairs(var.voicePlayList) do
		if v.flag == event.flag then
			table.remove(var.voicePlayList,i)
		end
	end
	if #var.voicePlayList > 30 then
		table.remove(var.voicePlayList,1)
	end
	--非实时语音则播放
	GameBaseLogic.isPlayVoice = false
	if not var.intimeChat and #var.voicePlayList>0 then
		local netChat = var.voicePlayList[1]
		if netChat.m_strName == GameBaseLogic.chrName or netChat.m_MyName == GameBaseLogic.chrName then
			--GameCCBridge.callVoiceChat("play_voice",{url=netChat.localPath,flag = netChat.flag})
		else
			--GameCCBridge.callVoiceChat("play_voice",{url=netChat.httpPath,flag = netChat.flag})
		end
			cc.YvMsg:getInstance():YvPlayRecord(netChat.httpPath,netChat.flag)	
			table.remove(var.voicePlayList,1)		
	end
end

function GUILeftBottom.clipMsg( netChat,size ) --根据字体大小计算长度
	local strMsg = netChat.m_strMsg
	if not size then size = 22 end
	local len,num,charCount = 0,0,0
	local cloneStr,n = GameBaseLogic.clearHtmlText(strMsg)
	local length = cc.SystemUtil:getUtf8StrLen(cloneStr) --中文字符数量
	len = (#cloneStr+length)*(size/4) + n/2*10 --加超链接的要多加10像素
	local arr={0,0xc0,0xe0,0xf0,0xf8,0xfc}
	if len >950 then
		charCount = 75
		for k=1,6 do
			local tmp = string.byte(strMsg,charCount+k)
			local i=#arr
			while arr[i] and tmp do
				if tmp>= arr[i] then 
					charCount = charCount+k-i
					break 
				end
				i= i-1
			end
		end
		strMsg = string.sub(cloneStr,1,charCount-1)
		strMsg = strMsg.."..."
	end
	return strMsg
end

function GUILeftBottom.handleExpChange(event)
	if var.expBar then
		var.expBar:setPercent(GameSocket.mCharacter.mCurExperience,GameSocket.mCharacter.mCurrentLevelMaxExp)
		setExpEffectPos(GameSocket.mCharacter.mCurExperience/GameSocket.mCharacter.mCurrentLevelMaxExp)
	end
end

function GUILeftBottom.hitTestCall(pos)
	return GameUtilSenior.hitTest(var.chatBg, pos) --or GameUtilSenior.hitTest(var.boxSwitchChat, pos);
end

function GUILeftBottom.set_chat_visible( vis )
	--var.chatBg:setVisible(vis)
	var.leftBottom:getWidgetByName("btn_show"):setVisible(false)
	var.chatBg:runAction(cca.seq({
		cca.moveTo(0.2, var.chatBg:getPositionX()+330*(vis and 1 or -1), var.chatBg:getPositionY()),
		cca.cb(function ( target )
			var.leftBottom:getWidgetByName("btn_show"):setVisible(not vis)	
		end)
	}))
	
end

return GUILeftBottom