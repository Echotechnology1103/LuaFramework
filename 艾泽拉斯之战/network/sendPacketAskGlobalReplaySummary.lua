-- ������¼����ţB�������

function sendAskGlobalReplaySummary(battleType, progressID)
	networkengine:beginsend(126);
-- ս������
	networkengine:pushInt(battleType);
-- �ڼ���
	networkengine:pushInt(progressID);
	networkengine:send();
end

