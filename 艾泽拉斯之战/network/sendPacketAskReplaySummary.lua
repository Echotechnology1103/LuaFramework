-- ���󲥷�¼��

function sendAskReplaySummary(count)
	networkengine:beginsend(75);
-- ¼������
	networkengine:pushInt(count);
	networkengine:send();
end

