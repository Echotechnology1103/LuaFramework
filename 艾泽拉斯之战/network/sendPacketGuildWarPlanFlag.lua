-- ����guildWar����

function sendGuildWarPlanFlag(postID, guardID, enterFlag)
	networkengine:beginsend(160);
-- �ݵ�id
	networkengine:pushInt(postID);
-- �������id
	networkengine:pushInt(guardID);
-- ���뻹���뿪�������
	networkengine:pushInt(enterFlag);
	networkengine:send();
end

