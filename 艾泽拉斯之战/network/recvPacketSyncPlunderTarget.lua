-- �Ӷ����ˢ��

function packetHandlerSyncPlunderTarget()
	local tempArrayCount = 0;
	local plunderTargets = {};

-- �Ӷ�����ѡ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		plunderTargets[i] = ParseLadderPlayer();
	end

	SyncPlunderTargetHandler( plunderTargets );
end

