-- �ݵ���ϸ��Ϣ�Ļظ�

function packetHandlerGuildWarPostDetail()
	local tempArrayCount = 0;
	local player = {};

-- �����Ϣ
	player = ParseLadderPlayer();

	GuildWarPostDetailHandler( player );
end

