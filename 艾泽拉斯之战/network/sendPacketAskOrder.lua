-- ����֧������

function sendAskOrder(rechargeID)
	networkengine:beginsend(106);
-- ��ֵid
	networkengine:pushInt(rechargeID);
	networkengine:send();
end

