-- ����ǰ�Լ��˺�����

function sendAskTopRank(topType)
	networkengine:beginsend(67);
-- ���а����ͣ�����typedef��TYPE_DEFö��
	networkengine:pushInt(topType);
	networkengine:send();
end

