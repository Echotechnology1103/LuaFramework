-- guildWar����

function sendGuildWarInspire(type, postID)
	networkengine:beginsend(144);
-- ��������
	networkengine:pushInt(type);
-- ����ǹ������,ָ����������ĸ��ݵ�
	networkengine:pushInt(postID);
	networkengine:send();
end

