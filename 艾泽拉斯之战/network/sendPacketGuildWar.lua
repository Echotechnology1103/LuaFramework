-- ����guildWar

function sendGuildWar(postIndex)
	networkengine:beginsend(143);
-- ���󹥻���һ���ݵ�
	networkengine:pushInt(postIndex);
	networkengine:send();
end

