local reconnectLogic = class("reconnectLogic")

table.merge(reconnectLogic, {
	reconnectTimes = 1,
	isReconnect = false
})

local ggErrorMsg = {
	[-3.0] = "��Ϸ������δ׼����",
	[-1.0] = "Session����",
	[-2.0] = "ͬ�ʺ��ظ���¼"
}
local lgErrorMsg = {
	[101.0] = "����������ά����",
	[102.0] = "��������Ա",
	[104.0] = "��֤ʧ�ܣ������µ�¼",
	[106.0] = "�����˺ű���ͣ������ϵ�ͷ�",
	[103.0] = "����������ʱ",
	[105.0] = "�����豸����ͣ������ϵ�ͷ�"
}
local reConnectGGId = nil
local scErrorMsg = {
	[-6.0] = "ѡ��ɫ�Ŷӵȴ�",
	[-1.0] = "��ɫ����������ʱ����ʹ��",
	[-4.0] = "��ɫ���ݶ�ȡʧ��",
	[-7.0] = "�ý�ɫ����ֹ��½",
	[-3.0] = "��Ϸ��������ʱ������",
	[-5.0] = "�ý�ɫ�Ѿ�ɾ��",
	[-2.0] = "��ɫ������",
	[-8.0] = "ѡ���ɫͨ��ʧ��Э��"
}
local SM_LoginConnetState, reConnetGGState, loginGGSuccess, loginLGSuccess, reconnectLG = nil

function loginGGSuccess(result, proIc)
	if result then
		if result.Flag == 1 then
			g_data.eventDispatcher:dispatch("NET_RECONNECTED")

			g_data.netReconnect = false
			reconnectLogic.reconnectTimes = 0

			sound.playSound("104")
			game.gotoscene("main", nil, "fade", 0.1, display.COLOR_BLACK)

			local rsb = DefaultClientMessage(CM_INITOK)

			MirTcpClient:getInstance():postRsb(rsb)
			print("re loginGGSuccess����������������������������")
		elseif ggErrorMsg[result.Flag] then
			tip(ggErrorMsg[result.Flag], function ()
				g_data.eventDispatcher:dispatch("BIG_EXIT")

				return 
			end)
		else
			tip("δ֪����:" .. tostring(result.Flag), function ()
				g_data.eventDispatcher:dispatch("BIG_EXIT")

				return 
			end)
		end
	end

	return 
end

function loginLGSuccess(result, proIc)
	if result then
		if result.FServerState == 1 then
			local ip = result.FIP
			local port = result.FPort
			sessionId = result.FSessionID

			g_data.login:setSelectServer(ip, port, sessionId)
			print("loginLGSuccess result.FServerState == 1 ====begin")
			print("loginLGSuccess result.FServerState == 1 ====end")
			MirTcpClient:getInstance():clearRemoteHosts()
			MirTcpClient:getInstance():clearAllSunscribeScriptOnProtocol()
			MirTcpClient:getInstance():clearAllSubscribeOnState()
			MirTcpClient:getInstance():subscribeOnState(reConnetGGState)

			reConnectGGId = MirTcpClient:getInstance():subscribeOnProtocol(SM_LoginAuthRsp, loginGGSuccess)

			MirTcpClient:getInstance():addRemoteHost(g_data.login.ip, g_data.login.port)
			MirTcpClient:getInstance():connect()
		elseif lgErrorMsg[result.FServerState] then
			tip(lgErrorMsg[result.FServerState], function ()
				g_data.eventDispatcher:dispatch("BIG_EXIT")

				return 
			end)
		else
			tip("δ֪����:" .. tostring(result.FServerState), function ()
				g_data.eventDispatcher:dispatch("BIG_EXIT")

				return 
			end)
		end

		local loginTcp = g_data.login.getLoginTCP(loginGGSuccess)

		if loginTcp and loginTcp.isConnected(loginTcp) then
			loginTcp.clearAllSubscribeOnState(loginTcp)
			print("loginLGSuccess disconnect")
			loginTcp.disconnect(loginTcp, false)
		end
	end

	return 
end

function reConnetGGState(state, msg)
	if state == TcpClientState.ecsUnknow then
		print("GG ecsUnknow")
	elseif state == TcpClientState.ecsConnecting then
		print("GG ecsConnecting")
	elseif state == TcpClientState.ecsConnected then
		local rsb = DefaultClientMessage(CM_LoginSDK)
		rsb.sessionID = g_data.login.sessionid

		MirTcpClient:getInstance():postRsb(rsb)
		print("GG ecsConnected")
	elseif state == TcpClientState.ecsTryConnecting then
		print("GG ecsTryConnecting")
	elseif state == TcpClientState.ecsDisconnected then
		if g_data.isKickOut or g_data.inPhoneCall then
			return 
		end

		if not main_scene then
			return 
		elseif main_scene.ground.player and main_scene.ground.player.die then
			return 
		end

		print("GG ecsDisconnected")
		g_data.eventDispatcher:dispatch("NET_DISCONNECTED")

		g_data.netReconnect = true
		reconnectHandle = scheduler.performWithDelayGlobal(reconnectLG, reconnectLogic.reconnectTimes*2 + 2)
	end

	return 
end

function SM_LoginConnetState(state, msg)
	local loginTcp = g_data.login:getLoginTCP()

	if state == TcpClientState.ecsUnknow then
		print("reLG ecsUnknow")
	elseif state == TcpClientState.ecsConnecting then
		print("reLG ecsConnecting")
	elseif state == TcpClientState.ecsConnected then
		local rsb = DefaultClientMessage(CM_ReqReTryLogin)
		rsb.FSessionID = g_data.login.sessionid

		if not FORCE_ACCOUNT_LOGIN then
			rsb.DeviceID = MirDevices:getInstance():getDeviceId()
			rsb.Channel = platformSdk:channelid()
		end

		loginTcp.postRsb(loginTcp, rsb)
		print("reLG ecsConnected")
	elseif state == TcpClientState.ecsTryConnecting then
		print("reLG ecsTryConnecting")
	elseif state == TcpClientState.ecsDisconnected then
		print("reLG ecsDisconnected 1")

		if g_data.netReconnect then
			print("reLG ecsDisconnected 2")
			scheduler.performWithDelayGlobal(function ()
				reconnectLogic.reconnectTimes = reconnectLogic.reconnectTimes + 1

				if reconnectLogic.reconnectTimes <= 5 then
					reconnectLG()
				else
					g_data.eventDispatcher:dispatch("NET_RECONNECT_TIME_OUT")

					g_data.netReconnect = false
					g_data.netTimeOut = true
					reconnectLogic.reconnectTimes = 0

					print("GG Connecting time out g_data.netReconnect = false")
				end

				return 
			end, reconnectLogic.reconnectTimes*2 + 2)
		end
	end

	return 
end

function reconnectLG()
	if g_data.login.isEnterGame then
		print("�ٶ�sdk���л��˺Ž���")

		if reconnectHandle then
			scheduler:unscheduleGlobal(reconnectHandle)

			reconnectHandle = nil
		end

		g_data.login:setEnterGameState(false)

		return 
	else
		print("goto_main")
	end

	local loginTcp = g_data.login:getLoginTCP()

	loginTcp.clearRemoteHosts(loginTcp)
	loginTcp.clearAllSunscribeScriptOnProtocol(loginTcp)
	loginTcp.clearAllSubscribeOnState(loginTcp)

	if loginTcp and loginTcp.isConnected(loginTcp) then
		print("reconnecting() nil ~= loginTcp=========")
		loginTcp.disconnect(loginTcp, true)
	end

	loginTcp.subscribeOnState(loginTcp, SM_LoginConnetState)
	loginTcp.subscribeOnProtocol(loginTcp, SM_GGServerInfo, loginLGSuccess)
	loginTcp.addRemoteHost(loginTcp, def.ip, def.port)
	loginTcp.connect(loginTcp)
	print("reconnectLG() reconnectLogic.reconnectTimes:" .. reconnectLogic.reconnectTimes)

	return 
end

reconnectLogic.ctor = function (self)
	MirTcpClient:getInstance():clearAllSubscribeOnState()
	MirTcpClient:getInstance():subscribeOnState(reConnetGGState)

	return 
end
reconnectLogic.forceReConnect = function (self)
	if MirTcpClient:getInstance():isConnected() then
		print("forceReConnect disconnect")
		MirTcpClient:getInstance():disconnect(false)
	end

	print("reconnectLogic:forceReConnect() =========== begin" .. ycFunction:getTimeStrByMS(os.time()))

	if g_data.netReconnect == true then
		print("reconnectLogic:forceReConnect() g_data.netReconnect==true return=========")

		return 
	end

	if g_data.netTimeOut then
		print("reconnectLogic:forceReConnect() g_data.netTimeOut==true return=========")

		return 
	end

	return 
end
reconnectLogic.manualConnect = function (self)
	print("reconnectLogic:manualConnect() =========== begin" .. ycFunction:getTimeStrByMS(os.time()))

	if g_data.netReconnect == true then
		print("reconnectLogic:manualConnect() g_data.netReconnect==true return=========")

		return 
	end

	if g_data.netTimeOut then
		print("reconnectLogic:manualConnect() g_data.netTimeOut==true return=========")

		return 
	end

	g_data.eventDispatcher:dispatch("NET_DISCONNECTED")

	g_data.netReconnect = true

	scheduler.performWithDelayGlobal(reconnectLG, reconnectLogic.reconnectTimes*2 + 2)

	return 
end
reconnectLogic.getloginLGSuccess = function (self, result)
	return loginLGSuccess(result)
end
reconnectLogic.getReConnetGGState = function (self)
	return reConnetGGState
end

return reconnectLogic
