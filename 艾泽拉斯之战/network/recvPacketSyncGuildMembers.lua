-- �����Ա��Ϣ

function packetHandlerSyncGuildMembers()
	local tempArrayCount = 0;
	local name = nil;
	local notice = nil;
	local warScore = nil;
	local members = {};

-- name
	local strlength = networkengine:parseInt();
if strlength > 0 then
		name = networkengine:parseString(strlength);
else
		name = "";
end
-- ����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		notice = networkengine:parseString(strlength);
else
		notice = "";
end
-- ս���÷���
	warScore = networkengine:parseInt();
-- ���еĹ����Ա��Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		members[i] = ParseGuildMemberInfo();
	end

	SyncGuildMembersHandler( name, notice, warScore, members );
end

