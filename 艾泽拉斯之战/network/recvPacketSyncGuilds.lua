-- ������Ϣ

function packetHandlerSyncGuilds()
	local tempArrayCount = 0;
	local guilds = {};

-- ���еĹ�����Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		guilds[i] = ParseGuildInfo();
	end

	SyncGuildsHandler( guilds );
end

