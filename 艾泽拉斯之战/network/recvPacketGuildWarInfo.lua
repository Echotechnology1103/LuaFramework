-- ����ս���оݵ����Ϣ

function packetHandlerGuildWarInfo()
	local tempArrayCount = 0;
	local postsInfo = {};

-- �ݵ����Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		postsInfo[i] = ParseGuildWarPlanInfo();
	end

	GuildWarInfoHandler( postsInfo );
end

