-- ���Һ���

function sendSearchFriend(content)
	networkengine:beginsend(96);
-- ����
	networkengine:pushInt(string.len(content));
	networkengine:pushString(content, string.len(content));
	networkengine:send();
end

