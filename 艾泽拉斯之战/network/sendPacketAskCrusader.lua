-- ����Զ���ؿ���Ϣ

function sendAskCrusader(stageIndex)
	networkengine:beginsend(112);
-- �ؿ���������0��ʼ
	networkengine:pushInt(stageIndex);
	networkengine:send();
end

