-- ��ǰ�ݵ������

function packetHandlerSyncGuildWarPlans()
	local tempArrayCount = 0;
	local plans = {};

-- �þݵ�ķ�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		plans[i] = networkengine:parseInt();
	end

	SyncGuildWarPlansHandler( plans );
end

