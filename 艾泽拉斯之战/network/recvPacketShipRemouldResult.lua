-- �����췵��

function packetHandlerShipRemouldResult()
	local tempArrayCount = 0;
	local index = nil;
	local level = nil;

-- ��index
	index = networkengine:parseInt();
-- ����ǰ�ȼ�
	level = networkengine:parseInt();

	ShipRemouldResultHandler( index, level );
end

