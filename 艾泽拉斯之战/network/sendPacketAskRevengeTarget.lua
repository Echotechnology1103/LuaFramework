-- �����Ӷ����

function sendAskRevengeTarget(revengeID)
	networkengine:beginsend(117);
-- ����ĳ����б��dbid��ע�ⲻ�ǳ�ҵ�playerID��
	networkengine:pushInt(revengeID);
	networkengine:send();
end

