-- ���󹫻�����

function sendAskGuildAppoint(playerID, property)
	networkengine:beginsend(135);
-- ������ҵ�id
	networkengine:pushInt(playerID);
-- ������Ȩ��
	networkengine:pushInt(property);
	networkengine:send();
end

