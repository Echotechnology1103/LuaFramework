-- �˺�����

function packetHandlerSyncTopRank()
	local tempArrayCount = 0;
	local topType = nil;
	local rank = nil;

-- ���а�����
	topType = networkengine:parseInt();
-- ����,-1����������
	rank = networkengine:parseInt();

	SyncTopRankHandler( topType, rank );
end

