-- �˺�����

function packetHandlerSyncShakeRank()
	local tempArrayCount = 0;
	local rankInfo = {};

-- ���а�����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		rankInfo[i] = ParseShakeRankInfo();
	end

	SyncShakeRankHandler( rankInfo );
end

