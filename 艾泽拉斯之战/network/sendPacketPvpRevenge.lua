-- ����pvp����

function sendPvpRevenge(playerID)
	networkengine:beginsend(88);
-- �����𷽵�playerID
	networkengine:pushInt(playerID);
	networkengine:send();
end

