-- ���뱻�ܾ�

function packetHandlerFriendReject()
	local tempArrayCount = 0;
	local targetID = nil;

-- �����Ŀ��id
	targetID = networkengine:parseInt();

	FriendRejectHandler( targetID );
end

