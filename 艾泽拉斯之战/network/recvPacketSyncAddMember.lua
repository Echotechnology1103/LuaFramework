-- �¼ӳ�Ա

function packetHandlerSyncAddMember()
	local tempArrayCount = 0;
	local member = {};

-- �����ӵĳ�Ա
	member = ParseGuildMemberInfo();

	SyncAddMemberHandler( member );
end

