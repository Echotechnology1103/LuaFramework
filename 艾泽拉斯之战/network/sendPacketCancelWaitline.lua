-- �����Ŷ�

function sendCancelWaitline(waitlineType)
	networkengine:beginsend(51);
-- ���������Ŷ����� ��typedef��WaitLineType
	networkengine:pushInt(waitlineType);
	networkengine:send();
end

