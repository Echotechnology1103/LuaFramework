-- ������ݰ���������λ��ɾ����Ʒ

function sendAskDelItem(destBagType, position)
	networkengine:beginsend(19);
-- ��������
	networkengine:pushInt(destBagType);
-- �ڰ����е�λ��
	networkengine:pushInt(position);
	networkengine:send();
end

