-- �������ù��ṫ��

function sendAskSetGuildNotice(notice)
	networkengine:beginsend(138);
-- ���ù��ṫ��
	networkengine:pushInt(string.len(notice));
	networkengine:pushString(notice, string.len(notice));
	networkengine:send();
end

