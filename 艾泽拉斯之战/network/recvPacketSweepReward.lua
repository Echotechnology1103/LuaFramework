-- ս������

function packetHandlerSweepReward()
	local tempArrayCount = 0;
	local randomRewards = {};

-- �������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		randomRewards[i] = ParseRewardList();
	end

	SweepRewardHandler( randomRewards );
end

