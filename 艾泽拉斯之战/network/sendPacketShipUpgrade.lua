-- ������

function sendShipUpgrade(shipIndex)
	networkengine:beginsend(26);
-- ����index
	networkengine:pushInt(shipIndex);
	networkengine:send();
end

