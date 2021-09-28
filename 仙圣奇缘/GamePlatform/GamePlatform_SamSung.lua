-- 文件名:	GamePlatform_SamSung.lua
-- 版  权:	(C)深圳美天互动科技有限公司
-- 创建人:	张齐
-- 日  期:	
-- 版  本:	1.0
-- 描  述:	
-- 应  用:  本例子是用类对象的方式实现
-- 渠  道:  三星   

GamePlatform_SamSung = class("GamePlatform_SamSung", function () return PlatformBase:new() end)
GamePlatform_SamSung.__index = GamePlatform_SamSung

function GamePlatform_SamSung:PlatformInit()
	g_MsgMgr:registerCallBackFunc(msgid_pb.MSGID_SDK_SAMSUNG_LOGIN_RESPONSE , handler(self, self.OnRespondLoginSDK))
end

--服务器平台类型
function GamePlatform_SamSung:GetServerPlatformType()
	return macro_pb.LOGIN_PLATFORM_SAMSUNG
end

function GamePlatform_SamSung:GetPlatformType()
	return CGamePlatform:SharedInstance():GetCurPlatform()
end
    
function GamePlatform_SamSung:LoginPlatformSuccessCallBack(Account,  password)
	self:RequestLoginSDK(Account, password)
end

function GamePlatform_SamSung:GameLogin()
	if g_OnExitGame then
		CGamePlatform:SharedInstance():ShowSDKCenter(-1)-- -1表示无意义参数
	else
		CGamePlatform:SharedInstance():ShowSDKCenter()
	end
	return true
end

function GamePlatform_SamSung:GamePlatformStart()
	PlatformBase:GamePlatformStart()
	CGamePlatform:SharedInstance():GamePlatformStartSDK("", "")
end

function GamePlatform_SamSung:GameLoginOut()
	CGamePlatform:SharedInstance():LogOut()
end

function GamePlatform_SamSung:LoginOutCallBack()
	PlatformBase:GameLoginOut()
end
    
function GamePlatform_SamSung:CenterDidShowCallBack()

end

function GamePlatform_SamSung:CenterDidCloseCallBack()

end
	
------------------------------------协议--------------------------------
function GamePlatform_SamSung:RequestLoginSDK(sid, token)

	cclog("--------------GamePlatform_SamSung:MIPlatformLoginRequest---------- "..token)
	local Msg = account_pb.PlatformSamsungReq()
    Msg.token = token
    Msg.uin = sid
    cclog("登陆token:"..Msg.token)
	g_MsgMgr:sendMsg(msgid_pb.MSGID_SDK_SAMSUNG_LOGIN_REQUEST, Msg)
	g_MsgNetWorkWarning:showWarningText()
end

function GamePlatform_SamSung:OnRespondLoginSDK(tbMsg)
	cclog("--------------GamePlatform_SamSung:OnRespondLoginSDK()----------------------")
	local msgDetail = account_pb.PlatformSamsungResp()
	msgDetail:ParseFromString(tbMsg.buffer)
	cclog(tostring(msgDetail))

    if msgDetail.ret == 1 then
		g_GamePlatformSystem:SetAccount_PlatformID(msgDetail.uin)
		g_GamePlatformSystem:SetPlatformAccountInfo(msgDetail.uin)
		--请求服务器列表
		g_ServerList:RequestServerListInfo()
		cclog("-------GamePlatform_SamSung:OnRespondLoginSDK()-------------")
	else
        
	end

	AccountRegResponse(false)
	g_MsgNetWorkWarning:closeNetWorkWarning()

end
