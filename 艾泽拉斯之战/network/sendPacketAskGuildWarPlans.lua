-- ����guildWar����

function sendAskGuildWarPlans(postID)
	networkengine:beginsend(143);
-- �ݵ�id
	networkengine:pushInt(postID);
	networkengine:send();
end

