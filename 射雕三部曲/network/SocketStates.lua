--[[
	文件名: SocketStates.lua
	描述:socket服务端错误号定义
	创建人: 廖元刚
	创建时间:2016.11.1
--]]

SocketStates = {}

-- 神域和圣渊大陆服务器错误码
SocketStates.errorCode = {
    [-10] = TR("获取战斗数据失败"),
	[-12] = TR("无效的用户自定义编号"),
    [-13] = TR("未找到目标方法"),
    [-14] = TR("数据错误"),
    [-47] = TR("参数不匹配"),
    [-48] = TR("参数无效"),
    [-52] = TR("客户端请求数据格式错误"),
    [-1101] = TR("重复登录"),
    [-1116] = TR("未找到玩家对象"),
    [-1144] = TR("玩家尚未登录"),
    [-8801] = TR("玩家死亡"),
    [-8802] = TR("玩家不能移动"),
    [-8803] = TR("目标玩家死亡"),
    [-8804] = TR("玩家不能取消匹配"),
    [-8805] = TR("玩家不在岛内部"),
    [-8806] = TR("玩家不在岛上面"),
    [-8810] = TR("目标岛不存在"),
    [-8811] = TR("前往岛重复"),
    [-8812] = TR("目标岛不能前往"),
    [-8813] = TR("岛中还有敌方玩家"),
    [-8814] = TR("岛正在占领中"),
    [-8815] = TR("岛已被己方占领"),
    [-8816] = TR("双方不在同一个岛"),
    [-8817] = TR("获取战斗结果失败"),
    ------------------以下为圣渊大陆添加
    [-8818] = TR("神符不存在"),
    [-8819] = TR("玩家已经拥有该物品"),
    [-8820] = TR("玩家正在战斗中"),
    [-8821] = TR("敌人正在战斗中"),
    [-8822] = TR("玩家正在保护中"),
    [-8823] = TR("敌人正在保护中"),
    [-8824] = TR("玩家正在进入保护时间内"),
    ------------------以下为绝情谷添加
    [-10000] = TR("道具已被拾取"),
    [-10001] = TR("该道具不能被投掷"),
    [-10002] = TR("武器未击中"),
    [-10003] = TR("包裹已被拾取"),
    [-10004] = TR("距离目标太远"),
    [-10005] = TR("道具不存在"),
    [-10007] = TR("道具已被拾取"),
    ------------------以下为冰火岛添加
    [-15508] = TR("冰火岛玩家没有初始化"),
    [-15509] = TR("冰火岛玩家已经初始化"),
    [-15510] = TR("冰火岛玩家数据错误"),
    [-15511] = TR("冰火岛当前选择的频道人数过多"),
    [-15512] = TR("冰火岛玩家神行值已满"),
    [-15513] = TR("冰火岛频道不存在"),
    [-15514] = TR("冰火岛BossId错误"),
    [-15515] = TR("冰火岛Boss不存在"),
    [-15516] = TR("冰火岛Boss已经被击杀"),
    [-15517] = TR("冰火岛玩家神行值不足"),
    [-15518] = TR("冰火岛移动位置错误"),
    [-15519] = TR("冰火岛移动当前位置和"),
    [-15520] = TR("冰火岛玩家已经在队伍"),
    [-15521] = TR("冰火岛玩家队伍不存在"),
    [-15522] = TR("冰火岛玩家不是队长"),
    [-15523] = TR("冰火岛组队人数已满"),
    [-15524] = TR("冰火岛玩家未在队伍中"),
    [-15525] = TR("冰火岛玩家在其它队伍中"),
    [-15526] = TR("冰火岛玩家队伍人数不足"),
    [-15527] = TR("冰火岛玩家已经离线"),
    [-15528] = TR("冰火岛玩家未加入频道"),
    [-15529] = TR("冰火岛玩家未在当前频道中"),
    [-15530] = TR("冰火岛队长已经离开频道"),
    [-15531] = TR("冰火岛Boss距离限制"),
    [-15532] = TR("冰火岛玩家已经在队伍中，不能加入其它队伍"),
}

-- 聊天服务器错误码
SocketStates.chatCode = {
    [0] = TR("成功"),           -- Success

    [-1] = TR("数据错误"), -- "DataError"
    [-2] = TR("客户端数据错误"), -- "ClientDataError"
    [-3] = TR("签名错误"), -- "SignError"
    [-4] = TR("聊天频道未定义"), -- "ChannelTypeNotDefined"
    [-5] = TR("找不到目标方法"), -- "NoTargetMethod"
    [-6] = TR("参数不匹配"), -- "ParamNotMatch"
    [-7] = TR("参数无效"), -- "ParamInValid"

    [-11] = TR("尚未登陆"), -- "NoLogin"
    [-12] = TR("不在帮派中"), -- "NotInUnion"
    [-13] = TR("不在帮派中"), -- "NotInguide"
    [-14] = TR("未找到目标玩家"), -- "NotFoundTarget"
    [-15] = TR("玩家不存在"), -- "PlayerNotExist"
    [-16] = TR("服务器组不存在"), -- "ServerGroupNotExist"
    [-17] = TR("不在队伍中"), -- "NotInTeam"
    [-18] = TR("在另一台设备上登录"), --  "LoginOnAnotherDevice"

    [-21] = TR("不能给自己发消息"), -- "CantSendMessageToSelf"
    [-22] = TR("IP无效"), -- "InvalidIP"
    [-23] = TR("资源不足"), -- "ResourceNotEnough"
    [-24] = TR("网络错误"), -- "NetworkError"
    
    [-31] = TR("含有屏蔽词语"), -- "ContainForbiddenWord"
    [-32] = TR("发送消息太快"), -- "SendMessageTooFast"
    [-33] = TR("等级不足，系统未开放"), -- "LvIsNotEnough"
    [-34] = TR("重复次数太多"), -- "RepeatTooMuch"
}
