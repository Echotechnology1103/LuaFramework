-- ����һ�΢�ź��

function sendAskWeixinBonus(count)
	networkengine:beginsend(129);
-- �һ�����
	networkengine:pushInt(count);
	networkengine:send();
end

