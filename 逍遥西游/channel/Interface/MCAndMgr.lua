MCAndMgr = class("MCAndMgr", ChannelClassBase)
MCAndMgr.cls_and = "com/hk/channel/MCInter"
local className = "com/snowfish/cn/ganga/base/SFLuaAdaper"
MCAndMgr.appID = "ex_xycq_bXwEMhv"
local md_iap_products = {
  [1] = "com.mgame1.xycq.1",
  [2] = "com.mgame1.xycq.2",
  [3] = "com.mgame1.xycq.3",
  [4] = "com.mgame1.xycq.4",
  [5] = "com.mgame1.xycq.5",
  [6] = "com.mgame1.xycq.6",
  [7] = "com.mgame1.xycq.7",
  [8] = "com.mgame1.xycq.8",
  [9] = "com.mgame1.xycq.9",
  [10] = "com.mgame1.xycq.10",
  [11] = "com.mgame1.xycq.11",
  [112] = "com.mgame1.xycq.15",
  [113] = "com.mgame1.xycq.16",
  [114] = "com.mgame1.xycq.17",
  [115] = "com.mgame1.xycq.18",
  [116] = "com.mgame1.xycq.19",
  [117] = "com.mgame1.xycq.20",
  [12] = "com.mgame1.xycq.12",
  [13] = "com.mgame1.xycq.13",
  [14] = "com.mgame1.xycq.14",
  [15] = "com.mgame1.xycq.21"
}
function MCAndMgr:ctor()
  print(" 正在初始化      MCAndMgr       ")
  self.m_LoginInfo = {}
  self.m_Listener = nil
  self.m_ReqFriendListListener = nil
  self.m_ReqAddFriendListener = nil
  self.m_ReqShareToUserListener = nil
  self.m_IsLoginSucceedCallback = false
  g_DataMgr.isPaying = false
  self.m_UserInfo = nil
  callStaticMethodJava(MCAndMgr.cls_and, "setMessageListener", {
    handler(self, self.MessageCallBack)
  })
end
function MCAndMgr:setSDKInitListener(callback)
  print("yj call setSDKInitListener ", prama)
  local signs = "(I)V"
  local methodName = "setInitListener"
  local args = {callback}
  luaj.callStaticMethod(className, methodName, args, signs)
end
function MCAndMgr:MessageCallBack(data, isSucceed)
  if data == nil then
    printLog("ERROR", "回调参数出错")
    return
  end
  local typ = tonumber(data.type)
  local param = data.param
  print(string.format([[

-------------------------------------
 MCAndMgr:MessageCallBack:%s,%s
]], tostring(typ), tostring(param)))
  if typ == 0 then
    self:_callback(ChannelCallbackStatus.kInitSuccess)
  elseif typ == -1 then
    self:_callback(ChannelCallbackStatus.kInitFail)
  elseif typ == 1 then
    self.m_IsLoginSucceedCallback = true
    self.m_LoginInfo.userName = param.user
    self.m_LoginInfo.account = param.user
    self.m_LoginInfo.sign = param.sign
    self.m_LoginInfo.loginTime = param.logintime
    self.m_UserInfo = param.user
    print("------->>>userName:", self.m_LoginInfo.userName)
    print("------->>>sign:", self.m_LoginInfo.sign)
    self:_callback(ChannelCallbackStatus.kLoginSuccess)
  elseif typ == 10 then
    self:_callback(ChannelCallbackStatus.kLoginFail)
  elseif typ == 2 then
    self:_callback(ChannelCallbackStatus.kLoginFail)
  elseif typ == 4 then
    self:_callback(ChannelCallbackStatus.kTokenInvild)
  elseif typ == 3 then
    print("Momo 退出帐号成功")
    self:_callback(ChannelCallbackStatus.kLogoutSuccess)
  elseif typ == 13 then
    print(" 获取好友列表失败 ")
    self:CallbackReqFriendListListener(false, param.errorCode, param.errorMsg)
  elseif typ == 14 then
    print(" 获取好友列表成功 ")
    for k, v in pairs(param) do
      print(k, v)
    end
    self:CallbackReqFriendListListener(true, param)
  elseif typ == 21 then
    self:CallbackReqAddFriendListener(true)
  elseif typ == 22 then
    self:CallbackReqAddFriendListener(false, param.errorCode, param.errorMsg)
  elseif typ == 25 then
    self:CallbackReqShareToUserListener(true)
  elseif typ == 26 then
    self:CallbackReqShareToUserListener(false, param.errorCode, param.errorMsg)
  elseif typ == 31 then
    print("MomoIOS IAP 充值成功")
    self:CallAfterPayDelay(ChannelPayResult.kPaySucceed)
  elseif typ == 32 then
    print("MomoIOS IAP 充值失败")
    self:CallAfterPayDelay(ChannelPayResult.kPayFailed)
  elseif typ == 33 then
    self:CallAfterPayDelay(ChannelPayResult.kPayViewClosed)
  elseif typ == 61 then
    self:callExitGame_(0)
  elseif typ == 62 then
    self:callExitGame_(1)
  elseif rbtype == 63 then
    self.m_IsLoginSucceedCallback = false
    self.m_UserInfo = nil
    self.m_loginfo = {}
    self:_callback(ChannelCallbackStatus.kAccountSwitchSuccess)
  end
end
function MCAndMgr:sdkInitCallbackFunc(jPrama)
  require("json")
  local data = json.decode(jPrama)
  if data.tag == "success" then
    print("YJ SDK初始化成功！")
    self:_callback(ChannelCallbackStatus.kInitSuccess)
  elseif data.tag == "fail" then
    print("YJ SDK初始化失败！")
    self:_callback(ChannelCallbackStatus.kInitFail)
  end
end
function MCAndMgr:setLoginListener(callback)
  print("yj call setLoginListener ", prama)
  local signs = "(I)V"
  local methodName = "setLoginListener"
  local args = {callback}
  luaj.callStaticMethod(className, methodName, args, signs)
end
function MCAndMgr:loginCallback(jPrama)
  require("json")
  local data = json.decode(jPrama)
  print("yj loginCallback ", jPrama)
  if data.result == "success" then
    print("yj loginCallback 登陆成功")
    print("登陆验证中...")
    self.m_IsLoginSucceedCallback = true
    self.m_LoginInfo.userName = userInfo.channelUserId
    self.m_LoginInfo.sign = userInfo.token
    self.m_LoginInfo.loginTime = ""
    self.m_UserInfo = userInfo.channelUserId
    print("------->>>userName:", self.m_LoginInfo.userName)
    print("------->>>sign:", self.m_LoginInfo.sign)
    self:_callback(ChannelCallbackStatus.kLoginSuccess)
    loginCheck(data)
  elseif data.result == "fail" then
    self:_callback(ChannelCallbackStatus.kTokenInvild)
    print("yj login fail loginfo:", loginfo)
    print("登陆失败")
  elseif data.result == "logout" then
    print("退出登陆")
  end
end
function MCAndMgr:payCallback(jPrama)
  require("json")
  local data = json.decode(jPrama)
  print("yj payCallback ", jPrama)
  if data.result == "success" then
    print("支付成功")
    self:CallAfterPayDelay(ChannelPayResult.kPaySucceed)
  elseif data.result == "oderno" then
    print(data.remain)
  elseif data.result == "fail" then
    print("支付失败")
    self:CallAfterPayDelay(ChannelPayResult.kPayFailed)
  end
end
function MCAndMgr:encodeURI(s)
  s = string.gsub(s, "([^%w%.%- ])", function(c)
    return string.format("%%%02X", string.byte(c))
  end)
  return string.gsub(s, " ", "+")
end
function MCAndMgr:loginCheck(userInfo)
  local xhr = cc.XMLHttpRequest:new()
  xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING
  local urlStr = cpLoginCheckUrl .. "?app=" .. userInfo.productCode
  urlStr = urlStr .. "&sdk=" .. userInfo.channelId
  urlStr = urlStr .. "&uin=" .. encodeURI(userInfo.channelUserId)
  urlStr = urlStr .. "&sess=" .. encodeURI(userInfo.token)
  print("yj loginCheck=", urlStr)
  xhr:open("GET", urlStr)
  local function onReadyStateChange()
    local reponse = string.upper(xhr.response)
    print("yj response = ", reponse)
    if reponse == "SUCCESS" then
      print("yj验证失败")
    else
      print("yj验证失败")
    end
  end
  xhr:registerScriptHandler(onReadyStateChange)
  xhr:send()
end
function MCAndMgr:login(prama)
  print("yj call login ", prama)
  local signs = "(Ljava/lang/String;)V"
  local methodName = "login"
  local args = {prama}
  luaj.callStaticMethod(className, methodName, args, signs)
end
function MCAndMgr:logout(prama)
  print("yj call logout ", prama)
  local signs = "(Ljava/lang/String;)V"
  local methodName = "logout"
  local args = {prama}
  luaj.callStaticMethod(className, methodName, args, signs)
end
function MCAndMgr:exit(exitCallback)
  print("yj call exit ")
  local signs = "(I)V"
  local methodName = "exit"
  local args = {exitCallback}
  luaj.callStaticMethod(className, methodName, args, signs)
end
function MCAndMgr:isMusicEnable()
  print("yj call isMusicEnable ")
  local signs = "()Z"
  local methodName = "isMusicEnabled"
  local args = {}
  local ok, ret = luaj.callStaticMethod(className, methodName, args, signs)
  if not ok then
    print("callExit error")
    return false
  else
    print("callExit ret:", ret)
    return ret
  end
end
function MCAndMgr:charge(name, price, count, callbackInfo, callbackurl, callbackFunc)
  print("yj call charge ", name, price, count, callbackInfo, callbackurl, callbackFunc)
  local signs = "(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;I)V"
  local methodName = "charge"
  local args = {
    name,
    price,
    count,
    callbackInfo,
    callbackurl,
    callbackFunc
  }
  luaj.callStaticMethod(className, methodName, args, signs)
end
function MCAndMgr:pay(price, name, count, callbackInfo, callbackurl, callbackFunc)
  print("yj call pay ", price, name, count, callbackInfo, callbackurl, callbackFunc)
  local signs = "(ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V"
  local methodName = "pay"
  local args = {
    price,
    name,
    count,
    callbackInfo,
    callbackurl,
    callbackFunc
  }
  luaj.callStaticMethod(className, methodName, args, signs)
end
function MCAndMgr:payExtend(price, name, itemCode, remian, count, callbackInfo, callbackUrl, callbackFunc)
  print("yj call payExtend ", price, name, itemCode, remian, count, callbackInfo, callbackUrl, callbackFunc)
  local signs = "(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V"
  local methodName = "payExtend"
  local args = {
    price,
    name,
    itemCode,
    remian,
    count,
    callbackInfo,
    callbackUrl,
    callbackFunc
  }
  luaj.callStaticMethod(className, methodName, args, signs)
end
function MCAndMgr:setRoleData(id, nmae, level, zoneId, zoneName)
  print("yj call setRoleData ", id, nmae, level, zoneId, zoneName)
  local signs = "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V"
  local methodName = "setRoleData"
  local args = {
    id,
    nmae,
    level,
    zoneId,
    zoneName
  }
  luaj.callStaticMethod(className, methodName, args, signs)
end
function MCAndMgr:enterGame(roleParam)
  if roleParam == nil then
    roleParam = {}
  end
  if roleParam.serverId == nil then
    roleParam.serverId = "1"
  end
  local getsid = string.gmatch(roleParam.serverId, "%d+")
  local mserverId = getsid()
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "setRoleData", {
    roleParam.roleId,
    roleParam.roleName,
    roleParam.roleLv,
    roleParam.serverId,
    roleParam.serverName
  }, "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;")
  if ok == false then
    return false
  end
  ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "setData", {
    "enterServer",
    roleParam.roleId,
    roleParam.roleName,
    roleParam.roleLv,
    mserverId,
    roleParam.serverName,
    roleParam.balance,
    roleParam.viplv,
    roleParam.bpName
  }, "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;")
  if ok == true and ret == "1" then
    return true
  end
  return false
end
function MCAndMgr:setDataInt(key, value)
  print("yj call setDataInt ", key, value)
  local signs = "(Ljava/lang/String;I)V"
  local methodName = "setDataInt"
  local args = {key, value}
  luaj.callStaticMethod(className, methodName, args, signs)
end
function MCAndMgr:setDataBoolean(key, value)
  print("yj call setDataBoolean ", key, value)
  local signs = "(Ljava/lang/String;Z)V"
  local methodName = "setDataBoolean"
  local args = {key, value}
  luaj.callStaticMethod(className, methodName, args, signs)
end
function MCAndMgr:setDataString(key, value)
  print("yj call setDataString ", key, value)
  local signs = "(Ljava/lang/String;Ljava/lang/String;)V"
  local methodName = "setDataString"
  local args = {key, value}
  luaj.callStaticMethod(className, methodName, args, signs)
end
function MCAndMgr:setDataFloat(key, value)
  print("yj call setDataFloat ", key, value)
  local signs = "(Ljava/lang/String;F)V"
  local methodName = "setDataFloat"
  local args = {key, value}
  luaj.callStaticMethod(className, methodName, args, signs)
end
function MCAndMgr:extend(data, count, callbackFunc)
  print("yj call extend ", data, count, callbackFunc)
  local signs = "(Ljava/lang/String;II)V"
  local methodName = "extend"
  local args = {
    data,
    count,
    callbackFunc
  }
  local ok, ret = luaj.callStaticMethod(className, methodName, args, signs)
  if not ok then
    print("extend error")
    return nil
  else
    print("extend ret", ret)
    return ret
  end
end
function MCAndMgr:_callback(code, param)
  if self.m_Listener ~= nil then
    self.m_Listener(code, param)
  else
    print("--->> self.m_Listener = nil")
  end
end
function MCAndMgr:CallAfterPayDelay(cbkey)
  print("================>>>>>    MCAndMgr:CallAfterPayDelay  ")
  g_DataMgr.isPaying = false
  self:_callback(cbkey)
  scheduler.performWithDelayGlobal(function()
    print("  =================>>>>  delay  233333333333333  ")
    soundManager.OnEnterForeroundFlush()
    soundManager.setIsPlayingVideo(false)
    soundManager.resumeSoundTemp()
  end, 2)
end
function MCAndMgr:Init(gameParam, listener)
  print("   ********* getDeviceName = ", "--|" .. SyNative.getDeviceName() .. "|--")
  print("MCAndMgr:Init:", listener)
  self.m_Listener = listener
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "InitSDK", {
    MCAndMgr.appID
  }, "(Ljava/lang/String;)Ljava/lang/String;")
  print(" **********************  ok, ret  ", ok, ret)
  if ok ~= true then
    self:_callback(ChannelCallbackStatus.kInitFail)
  end
end
function MCAndMgr:isLogined()
  local result, token, userType, userName = self:getCacheAuthInfo()
  print("MCAndMgr:isLogined   ========>>> ", result, token, userType, userName)
  self.m_LoginInfo.userType = userType
  self.m_LoginInfo.userName = userName
  if result == true and token ~= nil then
    return true
  end
  return false
end
function MCAndMgr:momoPushInit()
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "momoPushInit", {}, "()Ljava/lang/String;")
  if ok ~= true and ret == "1" then
    return true
  end
  return false
end
function MCAndMgr:getCacheAuthInfo()
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "getAuthInfo", {}, "()Ljava/lang/String;")
  if ok and ret ~= nil and ret.token ~= nil then
    return true, ret.token, ret.userType, ret.userName
  end
  return false
end
function MCAndMgr:Login()
  self.m_IsLoginSucceedCallback = false
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "Login", {}, "()Ljava/lang/String;")
  if ok ~= true then
    self:_callback(ChannelCallbackStatus.kLoginFail)
  end
end
function MCAndMgr:LoginFinished_(isCloseLoginView)
  if self.m_IsLoginSucceedCallback == true or self:isLogined() then
    self:_callback(ChannelCallbackStatus.kLoginSuccess)
  elseif isCloseLoginView == true then
    self:_callback(ChannelCallbackStatus.kLoginCancel)
  else
    self:_callback(ChannelCallbackStatus.kLoginFail)
  end
end
function MCAndMgr:getAccount()
  return self.m_LoginInfo.userId
end
function MCAndMgr:getUserInfo()
  if self.m_LoginInfo then
    return self.m_UserInfo
  end
end
function MCAndMgr:setGameServer(serverParam)
  if serverParam == nil then
    serverParam = {}
  end
  local mserverId = serverParam.serverId or "0"
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "setGameServer", {mserverId}, "(Ljava/lang/String;)Ljava/lang/String;")
  if ok == true and ret == "1" then
    return true
  end
  return false
end
function MCAndMgr:Logout()
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "Logout", {}, "()Ljava/lang/String;")
  if ok ~= true then
    self:_callback(ChannelCallbackStatus.kLogoutFail)
  end
end
function MCAndMgr:sendLoginProtocol(gameType, deveceType)
  print("---->> MCAndMgr:sendLoginProtocol")
  local vToken = self.m_LoginInfo.sign
  if vToken == nil then
    print("----->> token == nil")
    return
  end
  local market = SyNative.getAppChannelInfo("market", "A")
  local ver = GetVersionStr()
  if not channel.needUpdate then
    ver = "999.999.999"
  end
  NetSend({
    s_gf = gameType,
    s_userid = self.m_LoginInfo.userid,
    s_account = self.m_LoginInfo.account,
    s_vtoken = vToken,
    s_logintime = self.m_LoginInfo.loginTime,
    i_dtp = deveceType,
    t_v = ver,
    m_mk = market
  }, S2C_Account, "P25")
  return true
end
function MCAndMgr:showToolBar(place)
  do return end
  if place == nil or type(place) ~= "number" or place >= 4 or place < 0 then
    place = 0
  end
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "setShowMomoLogo", {1, place}, "(II)Ljava/lang/String;")
  if ok == true and ret == "1" then
    return true
  end
  return false
end
function MCAndMgr:hideToolBar()
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "setShowMomoLogo", {0, 1}, "(II)Ljava/lang/String;")
  if ok == true and ret == "1" then
    return true
  end
  return false
end
function MCAndMgr:enterPersonCenter()
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "showPersonalCenter", {}, "()Ljava/lang/String;")
  if ok == true and ret == "1" then
    return true
  end
  return false
end
function MCAndMgr:startPay(payParam)
  if payParam == nil then
    self:_callback(ChannelPayResult.kPayFailed)
    return
  end
  local sendParam = {
    payParam.roleId,
    payParam.amount,
    payParam.serverId,
    payParam.payDataName,
    "商品描述",
    payParam.customInfo
  }
  dump(sendParam, "startpay sendParam")
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "startPay", sendParam, "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;")
  if ok == true and ret == "1" then
    return true
  end
  self:_callback(ChannelPayResult.kPayFailed)
  return false
end
function serialize(obj)
  local lua = ""
  local t = type(obj)
  if t == "number" then
    lua = lua .. obj
  elseif t == "boolean" then
    lua = lua .. tostring(obj)
  elseif t == "string" then
    lua = lua .. string.format("%q", obj)
  elseif t == "table" then
    lua = lua .. "{"
    for k, v in pairs(obj) do
      lua = lua .. "[" .. serialize(k) .. "]=" .. serialize(v) .. ","
    end
    local metatable = getmetatable(obj)
    if metatable ~= nil and type(metatable.__index) == "table" then
      for k, v in pairs(metatable.__index) do
        lua = lua .. "[" .. serialize(k) .. "]=" .. serialize(v) .. ","
      end
    end
    lua = lua .. "}"
  elseif t == "nil" then
    return nil
  else
    error("can not serialize a " .. t .. " type.")
  end
  return lua
end
function table2string(tablevalue)
  local stringtable = serialize(tablevalue)
  print(stringtable)
  return stringtable
end
function MCAndMgr:getDid()
  return 2
end
function MCAndMgr:Clean()
  g_DataMgr.isPaying = false
  self:__printInterNotImplement("Clean")
end
function MCAndMgr:requestExitGame(listener)
  self.m_ExitGameListener = listener
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "requestExitGame", {}, "()V")
  if ok == true then
    return true
  end
  return false
end
function MCAndMgr:callExitGame_(result)
  local listener = self.m_ExitGameListener
  self.m_ExitGameListener = nil
  if listener then
    listener(result)
  end
end
function MCAndMgr:showFAQView()
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "questionCommint", {}, "()Ljava/lang/String;")
  if ok == true and ret == "1" then
    return true
  end
  return false
end
function MCAndMgr:enterForumOrTieba()
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "launchToTieba", {}, "()Ljava/lang/String;")
  if ok == true and ret == "1" then
    return true
  end
  return false
end
function MCAndMgr:getFriendList(listener)
  self.m_ReqFriendListListener = listener
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "getFriendList", {0}, "(I)Ljava/lang/String;")
  if ok == true and ret == "1" then
    return true
  end
  self:CallbackReqFriendListListener(false)
  return false
end
function MCAndMgr:CallbackReqFriendListListener(...)
  listener = self.m_ReqFriendListListener
  print("获取陌陌好友成功返回   5555555  *******************  ", listener == nil)
  print(...)
  self.m_ReqFriendListListener = nil
  if listener then
    listener(...)
  end
end
function MCAndMgr:addFriend(userId, listener, extParam)
  listener = self.m_ReqAddFriendListener
  local reson = extParam.reason or "邀请你一起玩转《缘定星辰》！"
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "addFriend", {userId, reson}, "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;")
  if ok == true and ret == "1" then
    return true
  end
  self:CallbackReqAddFriendListener(false)
  return false
end
function MCAndMgr:CallbackReqAddFriendListener(...)
  listener = self.m_ReqAddFriendListener
  self.m_ReqAddFriendListener = nil
  if listener then
    listener(...)
  end
end
function MCAndMgr:shareToUser(userId, listener, contend, extParam)
  self.m_ReqShareToUserListener = listener
  local shareType = extParam.shareType
  if shareType == nil then
    shareType = 1
  end
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "shareToUser", {
    userId,
    contend,
    shareType
  }, "(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;")
  if ok == true and ret == "1" then
    return true
  end
  self:CallbackReqShareToUserListener(false)
  return false
end
function MCAndMgr:CallbackReqShareToUserListener(...)
  listener = self.m_ReqShareToUserListener
  self.m_ReqShareToUserListener = nil
  if listener then
    listener(...)
  end
end
function MCAndMgr:createRole(roleParam)
  if roleParam == nil then
    roleParam = {}
  end
  if roleParam.serverId == nil then
    roleParam.serverId = "1"
  end
  local getsid = string.gmatch(roleParam.serverId, "%d+")
  local mserverId = getsid()
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "setData", {
    "createrole",
    roleParam.roleId,
    roleParam.roleName,
    roleParam.roleLv,
    mserverId,
    roleParam.serverName,
    roleParam.balance,
    roleParam.viplv,
    roleParam.bpName
  }, "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;")
  if ok == true and ret == "1" then
    return true
  end
  return false
end
function MCAndMgr:RoleLevelUp(roleParam)
  if roleParam == nil then
    roleParam = {}
  end
  if roleParam.serverId == nil then
    roleParam.serverId = "1"
  end
  local getsid = string.gmatch(roleParam.serverId, "%d+")
  local mserverId = getsid()
  local ok, ret = callStaticMethodJava(MCAndMgr.cls_and, "setData", {
    "levelup",
    tostring(roleParam.roleId),
    tostring(roleParam.roleName),
    tostring(roleParam.roleLv),
    tostring(mserverId),
    tostring(roleParam.serverName),
    tostring(roleParam.balance),
    tostring(roleParam.viplv),
    tostring(roleParam.bpName)
  }, "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;")
  if ok == true and ret == "1" then
    return true
  end
  return false
end
return MCAndMgr
