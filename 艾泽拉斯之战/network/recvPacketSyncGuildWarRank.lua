-- ������Ϣ

function packetHandlerSyncGuildWarRank()
	local tempArrayCount = 0;
	local guilds = {};

-- ���еĹ�����Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		guilds[i] = ParseGuildWarRankInfo();
	end

	SyncGuildWarRankHandler( guilds );
end

