-- ����������

function packetHandlerSyncApplyGuilds()
	local tempArrayCount = 0;
	local guilds = {};

-- player������Ĺ����б�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		guilds[i] = networkengine:parseInt();
	end

	SyncApplyGuildsHandler( guilds );
end

