local GComponentFriendCall = {}--class("GComponentFriendCall")
--好友召唤
--同时收到多条好友召唤

function GComponentFriendCall:initView( extend )
	if self.xmlTips then

		-- GameUtilSenior.asyncload(self.xmlTips, "tipsbg", "ui/image/prompt_bg.png")
		self.playerName = extend.playerName or ""
		self.xmlTips:getWidgetByName("lblname"):setString(self.playerName)

		local btns = {"btn_agree","btn_refuse"}
		local function clickBtns( sender )
			local name = sender:getName()
			if name == btns[1] then
				-- print("agree call",self.playerName)
				GameSocket:PushLuaTable("gui.PanelFriend.onPanelData", GameUtilSenior.encode({actionid = "gotoFriend", param = {self.playerName,"agree"}}))
			elseif name == btns[2] then
				-- print("refuse call",self.playerName)
				GameSocket:PushLuaTable("gui.PanelFriend.onPanelData", GameUtilSenior.encode({actionid = "gotoFriend", param = {self.playerName,"refuse"}}))
			end
			GameSocket:dispatchEvent({name = GameMessageCode.EVENT_HIDE_TIPS,str = extend.str})
		end
		
		for k,v in pairs(btns) do
			self.xmlTips:getWidgetByName(v):addClickEventListener(clickBtns)
		end
		local count = 30
		local lblcountdown = self.xmlTips:getWidgetByName("lblcountdown")
		lblcountdown:setString("取消倒计时30秒")
		self.xmlTips:stopAllActions()
		self.xmlTips:runAction(cca.rep(cca.seq({
			cca.delay(1),
			cca.cb(function()
				count = count - 1
				lblcountdown:setString("取消倒计时"..count.."秒")
				if count==0 then
					GameSocket:PushLuaTable("gui.PanelFriend.onPanelData", GameUtilSenior.encode({actionid = "gotoFriend", param = {self.playerName,"noOperate"}}))
					GameSocket:dispatchEvent({name = GameMessageCode.EVENT_HIDE_TIPS,str = extend.str})
				end
			end)
		}),count))

	end
end

function GComponentFriendCall:closeCall()
	
end

return GComponentFriendCall