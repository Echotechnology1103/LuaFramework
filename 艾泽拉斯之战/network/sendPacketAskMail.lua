-- �ʼ���������

function sendAskMail(opcode, param, param2)
	networkengine:beginsend(29);
-- ��������
	networkengine:pushInt(opcode);
-- ����
	networkengine:pushInt(param);
-- ����2
	networkengine:pushInt(param2);
	networkengine:send();
end

