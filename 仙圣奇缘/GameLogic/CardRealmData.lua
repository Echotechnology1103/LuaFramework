--------------------------------------------------------------------------------------
-- �ļ���:	CardRealmData.lua
-- ��  Ȩ:	(C)�������컥���Ƽ����޹�˾
-- ������:	
-- ��  ��:	
-- ��  ��:	1.0
-- ��  ��:	�ɽ�����
-- Ӧ  ��:  
---------------------------------------------------------------------------------------

CardRealmData = class("CardRealmData")
CardRealmData.__index = CardRealmData


function CardRealmData:ctor()
	self.tbSelectSoulNum = {}
	self.tbSelectSoulStar ={}
	self.tbSelectSoulID ={}
	self.nAddExp = 0
	
	g_MsgMgr:registerCallBackFunc(msgid_pb.MSGID_UPGRADE_CARD_REALM_RESPONSE, handler(self,self.requestRealmRespone)) --������龳�����Ӧ
end


function CardRealmData:cardRealmInit()
	self.tbSelectSoulNum = {}
	self.tbSelectSoulStar ={}
	self.tbSelectSoulID ={}
	self.nAddExp = 0
end


--ѡ���˶��ٸ�Ԫ��
function CardRealmData:getSelectSoul(serverId)
	if serverId  and serverId > 0 then
		return self.tbSelectSoulNum[serverId]
	end
	return self.tbSelectSoulNum
end

function CardRealmData:setSelectSoul(serverId,num)
	self.tbSelectSoulNum[serverId] = num
end

--Ԫ���Ǽ�
function CardRealmData:getSelectSoulStar(serverId)
	if serverId  and serverId > 0 then
		return self.tbSelectSoulStar[serverId]
	end
	return self.tbSelectSoulStar
end


function CardRealmData:setSelectSoulStar(serverId,starLv)
	self.tbSelectSoulStar[serverId] = starLv
end

function CardRealmData:getSelectSoulID(serverId)
	if serverId  and serverId > 0 then
		return self.tbSelectSoulID[serverId]
	end
	return self.tbSelectSoulID
end

function CardRealmData:setSelectSoulID(serverId,soulId)
	self.tbSelectSoulID[serverId] = soulId
end

function CardRealmData:getAddExp()
	return self.nAddExp 
end

function CardRealmData:setAddExp(exps)
	self.nAddExp = self.nAddExp + exps
end

function CardRealmData:setMinusExp(exps)
	self.nAddExp = self.nAddExp - exps
end

function CardRealmData:setAddExpRemove()
	self.nAddExp = 0
end
--[[
	��ǰ����������
]]
function CardRealmData:resetNextFullExp(nCardID,nAddExp)
	local tbCardInfo = g_Hero:getCardObjByServID(nCardID)
	if not tbCardInfo then
		return false 
	end

	local nNewLev = tbCardInfo:getNewRealmLvByAddExp(nAddExp)
	local nMainLev = tbCardInfo:getRealmMainLev()
	local nNewMainLev = tbCardInfo:getRealmMainLevByNewLv(nNewLev)
	
	--�ڶɽ� ���� �ﵽ���ȼ���ʱ�� ִ��
	local nMaxLev = g_DataMgr:getCardRealmLevelCsvMaxLevel()
	if nNewLev >= nMaxLev then 
		local tbCsvCardRealmLevel = g_DataMgr:getCardRealmLevelCsv(nMaxLev)
		if tbCardInfo:getRealmExp() + nAddExp >= tbCsvCardRealmLevel.RealmPointsMax then 
			return true
		end
	end
	
	if nNewMainLev > nMainLev or nMainLev == 0 then
		return true
	end
	return false
end


function CardRealmData:getAddExpToNextRealmLv(tbCardInfo)
	local exps = self:getAddExp()
	local nNewLev = tbCardInfo:getNewRealmLvByAddExp(exps)
	local nMainLev = tbCardInfo:getRealmMainLev()
	local nNewMainLev = tbCardInfo:getRealmMainLevByNewLv(nNewLev)
	local nNewExpPercent = tbCardInfo:getNewRealmExpPercentByAddExp(exps)
	if nNewMainLev > nMainLev or nMainLev == 0 then
		if nNewMainLev > nMainLev then
			nNewExpPercent = 100
			nNewMainLev = nMainLev
			nNewLev = 8 * nNewMainLev
		end
	end
	return nNewLev,nNewExpPercent 
end

--��龳��
function CardRealmData:requestCardReleam(nCardID, tbCard)
	local msg = zone_pb.UpgradeCardRealmRequest()
	msg.upgrade_realm_cardid = nCardID
	--key Ԫ�������id value Ԫ������
	for key, value in pairs(tbCard) do
		table.insert(msg.cost_soul_list, key)
		table.insert(msg.cost_soul_num_list,value)
	end
	g_MsgMgr:sendMsg(msgid_pb.MSGID_UPGRADE_CARD_REALM_REQUEST, msg)

	g_ErrorMsg:ListenMsg(msgid_pb.MSGID_UPGRADE_CARD_REALM_REQUEST)
end


--��龳�����
function CardRealmData:requestRealmRespone(tbMsg)
	cclog("---------requestRealmRespone-------------")
	local protomessage = zone_pb.UpgradeCardRealmResponse()
	protomessage:ParseFromString(tbMsg.buffer)
	local msgInfo = tostring(protomessage)
	cclog(msgInfo)
	if not protomessage then 
		echoj("��ֵ========================")
		g_ErrorMsg:RelieveListenMsg(msgid_pb.MSGID_UPGRADE_CARD_REALM_REQUEST, msgid_pb.MSGID_UPGRADE_CARD_REALM_RESPONSE)
		return
	end
	if  protomessage.ret and  protomessage.ret ~= 0 then 
		echoj("�����쳣---------------------")
		g_ErrorMsg:RelieveListenMsg(msgid_pb.MSGID_UPGRADE_CARD_REALM_REQUEST, msgid_pb.MSGID_UPGRADE_CARD_REALM_RESPONSE)
		return 
	end
	
	for key,value in ipairs(protomessage.cost_soul_list) do
		local num = protomessage.cost_soul_num_list[key] 
		g_Hero:setSoul(value,num)
	end
	g_Hero:setCoins(protomessage.updated_money)
	
    local instance = g_WndMgr:getWnd("Game_CardDuJie")
    if instance then
	    instance:processMsgBackRealm(protomessage)
    end
	
	--�ɽٳɹ�
	DU_JIE_S = true
	self:setAddExpRemove()
    g_ErrorMsg:RelieveListenMsg(msgid_pb.MSGID_UPGRADE_CARD_REALM_REQUEST, msgid_pb.MSGID_UPGRADE_CARD_REALM_RESPONSE)
	
end


g_CardRealmData = CardRealmData.new()