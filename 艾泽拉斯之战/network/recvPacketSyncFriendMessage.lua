-- ��������

function packetHandlerSyncFriendMessage()
	local tempArrayCount = 0;
	local senderID = nil;
	local messages = {};

-- ������id
	senderID = networkengine:parseInt();
-- ������Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		messages[i] = ParseFriendMessage();
	end

	SyncFriendMessageHandler( senderID, messages );
end

