-- ������ɫ

function sendCreateRole(icon, name)
	networkengine:beginsend(77);
-- ͷ��ID
	networkengine:pushInt(icon);
-- ��ɫ����
	networkengine:pushInt(string.len(name));
	networkengine:pushString(name, string.len(name));
	networkengine:send();
end

