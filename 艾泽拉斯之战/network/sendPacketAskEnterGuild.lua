-- ������빫��

function sendAskEnterGuild(guildID)
	networkengine:beginsend(135);
-- ����id
	networkengine:pushInt(guildID);
	networkengine:send();
end

