-- ��Ʒ�ϳ���ʹ�õȲ���

function sendUseItem(opcode, position)
	networkengine:beginsend(55);
-- ����ö��
	networkengine:pushInt(opcode);
-- �ڰ����е�λ��
	networkengine:pushInt(position);
	networkengine:send();
end

