-- ������Ϣ

function packetHandlerSyncRevengeTarget()
	local tempArrayCount = 0;
	local revengeTarget = {};

-- ��Ҿ�����Ϣ
	revengeTarget = ParseLadderPlayer();

	SyncRevengeTargetHandler( revengeTarget );
end

