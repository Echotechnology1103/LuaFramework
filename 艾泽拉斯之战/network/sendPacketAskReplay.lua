-- ����¼��

function sendAskReplay(id)
	networkengine:beginsend(74);
-- ¼��id
	networkengine:pushInt(id);
	networkengine:send();
end

