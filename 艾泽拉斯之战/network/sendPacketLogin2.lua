-- ��½��2

function sendLogin2(data)
	networkengine:beginsend(90);
-- ����
	networkengine:pushInt(string.len(data));
	networkengine:pushString(data, string.len(data));
	networkengine:send();
end

