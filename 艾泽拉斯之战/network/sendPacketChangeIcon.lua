-- ��ͷ��

function sendChangeIcon(icon)
	networkengine:beginsend(79);
-- ͷ��
	networkengine:pushInt(icon);
	networkengine:send();
end

