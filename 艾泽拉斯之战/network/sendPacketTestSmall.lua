-- ����С��

function sendTestSmall(value)
	networkengine:beginsend(13);
-- ��������
	networkengine:pushInt(value);
	networkengine:send();
end

