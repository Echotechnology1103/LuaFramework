-- ͬ��playerID

function packetHandlerSyncPlayerID()
	local tempArrayCount = 0;
	local playerID = nil;

-- player��database ID
	playerID = networkengine:parseInt();

	SyncPlayerIDHandler( playerID );
end

