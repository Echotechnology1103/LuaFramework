-- ���󴴽�����

function sendAskCreateGuild(name)
	networkengine:beginsend(134);
-- ��������
	networkengine:pushInt(string.len(name));
	networkengine:pushString(name, string.len(name));
	networkengine:send();
end

