-- ս������

function packetHandlerReward()
	local tempArrayCount = 0;
	local battleType = nil;
	local firstWin = nil;
	local firstWinReward = {};
	local reward = {};
	local randomRewards = {};

-- ս������ �ذ�ȷ��
	battleType = networkengine:parseInt();
-- ����Ǵ򸱱��������Ƿ���ͨ �ذ�ȷ��
	firstWin = networkengine:parseBool();
-- ��ͨ����
	firstWinReward = ParseRewardList();
-- �صý���
	reward = ParseRewardList();
-- �������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		randomRewards[i] = ParseRewardList();
	end

	RewardHandler( battleType, firstWin, firstWinReward, reward, randomRewards );
end

