-- ��Ʒ����ȡ��Ʒ

function sendAskGift(code)
	networkengine:beginsend(124);
-- ��Ʒ��
	networkengine:pushInt(string.len(code));
	networkengine:pushString(code, string.len(code));
	networkengine:send();
end

