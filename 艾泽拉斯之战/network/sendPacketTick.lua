-- ����Э��

function sendTick(verifyCode)
	networkengine:beginsend(80);
-- У���룬��ǰ�����д
	networkengine:pushInt(verifyCode);
	networkengine:send();
end

