-- ����ժҪ��Ϣ

function packetHandlerLadderDetail()
	local tempArrayCount = 0;
	local player = {};

-- �����Ϣ
	player = ParseLadderPlayer();

	LadderDetailHandler( player );
end

