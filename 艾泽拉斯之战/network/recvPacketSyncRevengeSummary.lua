-- �����б�

function packetHandlerSyncRevengeSummary()
	local tempArrayCount = 0;
	local revengers = {};

-- �����б�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		revengers[i] = ParseRevenge();
	end

	SyncRevengeSummaryHandler( revengers );
end

