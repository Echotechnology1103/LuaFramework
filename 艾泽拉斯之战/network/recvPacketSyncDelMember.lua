-- �˳�����

function packetHandlerSyncDelMember()
	local tempArrayCount = 0;
	local member = nil;

-- �˳�����ĳ�Աid
	member = networkengine:parseInt();

	SyncDelMemberHandler( member );
end

