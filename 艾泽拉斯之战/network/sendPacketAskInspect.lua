-- �۲������������

function sendAskInspect(playerID)
	networkengine:beginsend(101);
-- ���ID
	networkengine:pushInt(playerID);
	networkengine:send();
end

