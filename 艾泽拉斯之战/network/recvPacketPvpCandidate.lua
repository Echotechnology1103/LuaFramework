-- ��client��������pvp�ĺ�ѡ��

function packetHandlerPvpCandidate()
	local tempArrayCount = 0;
	local candidates = {};

-- ����pvp��ѡ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		candidates[i] = ParseLadderPlayer();
	end

	PvpCandidateHandler( candidates );
end

