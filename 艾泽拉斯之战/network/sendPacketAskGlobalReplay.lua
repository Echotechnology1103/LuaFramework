-- ������¼��

function sendAskGlobalReplay(battleType, progressID)
	networkengine:beginsend(125);
-- ս������
	networkengine:pushInt(battleType);
-- �ڼ���
	networkengine:pushInt(progressID);
	networkengine:send();
end

