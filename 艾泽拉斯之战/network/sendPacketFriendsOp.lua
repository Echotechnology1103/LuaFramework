-- ���Ѳ���

function sendFriendsOp(opcode, targetID)
	networkengine:beginsend(95);
-- �����������
	networkengine:pushInt(opcode);
-- Ŀ���id
	networkengine:pushInt(targetID);
	networkengine:send();
end

