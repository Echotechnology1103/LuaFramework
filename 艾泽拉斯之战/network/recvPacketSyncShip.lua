-- ��

function packetHandlerSyncShip()
	local tempArrayCount = 0;
	local ships = {};

-- player�Ĵ���Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		ships[i] = ParseShipInfo();
	end

	SyncShipHandler( ships );
end

