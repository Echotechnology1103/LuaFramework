-- pvp���ݽ���

function packetHandlerLadderReward()
	local tempArrayCount = 0;
	local oldBestRank = nil;
	local newBestRank = nil;
	local reward = nil;

-- �ϵ��������
	oldBestRank = networkengine:parseInt();
-- �µ��������
	newBestRank = networkengine:parseInt();
-- ������ʯ����
	reward = networkengine:parseInt();

	LadderRewardHandler( oldBestRank, newBestRank, reward );
end

