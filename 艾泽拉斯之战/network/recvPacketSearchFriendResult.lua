-- ���Һ��ѽ��

function packetHandlerSearchFriendResult()
	local tempArrayCount = 0;
	local friends = {};

-- ���ҵó�����Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		friends[i] = ParseFriendSearchInfo();
	end

	SearchFriendResultHandler( friends );
end

