-- ���������Ա��Ϣ

function packetHandlerSyncGuildApplicants()
	local tempArrayCount = 0;
	local members = {};

-- ���еĹ����Ա��Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		members[i] = ParseGuildApplicantInfo();
	end

	SyncGuildApplicantsHandler( members );
end

