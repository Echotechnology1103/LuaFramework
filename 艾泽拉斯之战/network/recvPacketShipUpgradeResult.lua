-- ����������

function packetHandlerShipUpgradeResult()
	local tempArrayCount = 0;
	local index = nil;
	local level = nil;

-- ��index
	index = networkengine:parseInt();
-- ����ǰ�ȼ�
	level = networkengine:parseInt();

	ShipUpgradeResultHandler( index, level );
end

