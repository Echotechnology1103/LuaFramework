-- ��client����ָ��index��pvp��ѡ�˵�rank

function packetHandlerPvpCandidateRankResult()
	local tempArrayCount = 0;
	local player = {};

-- ���º��ѡ�˵���Ϣ
	player = ParseLadderPlayer();

	PvpCandidateRankResultHandler( player );
end

