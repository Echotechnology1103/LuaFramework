-- �������guild����

function sendApplyGuild(guildID)
	networkengine:beginsend(153);
-- ����guildID
	networkengine:pushInt(guildID);
	networkengine:send();
end

