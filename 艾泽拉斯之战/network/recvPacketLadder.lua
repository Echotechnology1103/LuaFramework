-- ����ժҪ��Ϣ

function packetHandlerLadder()
	local tempArrayCount = 0;
	local players = {};

-- �����Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		players[i] = ParseLadderPlayerSummary();
	end

	LadderHandler( players );
end

