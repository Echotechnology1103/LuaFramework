-- ����жװ��

function sendEquip(opcode, srcBagType, srcPosition, destBagType, destPosition)
	networkengine:beginsend(21);
-- ��������0,����1ж
	networkengine:pushInt(opcode);
-- ��ƷԴ����
	networkengine:pushInt(srcBagType);
-- ��ƷԴ�������λ��
	networkengine:pushInt(srcPosition);
-- Ŀ���������
	networkengine:pushInt(destBagType);
-- Ŀ������е�λ��
	networkengine:pushInt(destPosition);
	networkengine:send();
end

