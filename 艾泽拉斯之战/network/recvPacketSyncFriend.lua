-- ����

function packetHandlerSyncFriend()
	local tempArrayCount = 0;
	local friends = {};

-- player��friends��Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		friends[i] = ParseFriendInfo();
	end

	SyncFriendHandler( friends );
end

