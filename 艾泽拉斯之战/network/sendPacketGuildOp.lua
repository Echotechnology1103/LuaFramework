-- ����guild����

function sendGuildOp(opcode, targetID)
	networkengine:beginsend(149);
-- ��������
	networkengine:pushInt(opcode);
-- ���id
	networkengine:pushInt(targetID);
	networkengine:send();
end

