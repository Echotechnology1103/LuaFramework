-- ����guildWar����

function sendGuildWarPlan(postID, guardID, addFlag)
	networkengine:beginsend(145);
-- �ݵ�id
	networkengine:pushInt(postID);
-- �������id
	networkengine:pushInt(guardID);
-- ����ӻ���ɾ��
	networkengine:pushInt(addFlag);
	networkengine:send();
end

