-- ɾ������֪ͨ

function packetHandlerSyncFriendDel()
	local tempArrayCount = 0;
	local friendID = nil;

-- ����id
	friendID = networkengine:parseInt();

	SyncFriendDelHandler( friendID );
end

