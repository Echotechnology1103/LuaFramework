-- �����Ƽ�

function packetHandlerFriendRecommend()
	local tempArrayCount = 0;
	local friendRecommends = {};

-- player��friends��Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		friendRecommends[i] = ParseFriendInfo();
	end

	FriendRecommendHandler( friendRecommends );
end

