-- �����ɢ

function packetHandlerGuildDelete()
	local tempArrayCount = 0;
	local guildID = nil;

-- ����ID
	guildID = networkengine:parseInt();

	GuildDeleteHandler( guildID );
end

