-- �ݵ���ϸ��Ϣ�Ļظ�

function packetHandlerGuildWarBattleResult()
	local tempArrayCount = 0;
	local resultType = nil;
	local index = nil;

-- ͻ�ƻ�����һ��
	resultType = networkengine:parseInt();
-- �ڼ���
	index = networkengine:parseInt();

	GuildWarBattleResultHandler( resultType, index );
end

