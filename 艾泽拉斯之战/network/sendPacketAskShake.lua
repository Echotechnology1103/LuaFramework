-- ����ҡ���

function sendAskShake(type)
	networkengine:beginsend(130);
-- ��ע��ҡ��������Ƿ������Ӵ��� enum_shake_type
	networkengine:pushInt(type);
	networkengine:send();
end

