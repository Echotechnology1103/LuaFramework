-- ����������

function packetHandlerSyncFriendApplicants()
	local tempArrayCount = 0;
	local friends = {};

-- player��friends��Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		friends[i] = ParseFriendApplicant();
	end

	SyncFriendApplicantsHandler( friends );
end

