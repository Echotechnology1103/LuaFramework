-- ������

function sendShipRemould(shipIndex)
	networkengine:beginsend(85);
-- ����index
	networkengine:pushInt(shipIndex);
	networkengine:send();
end

