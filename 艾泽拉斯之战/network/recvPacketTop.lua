-- ����ժҪ��Ϣ

function packetHandlerTop()
	local tempArrayCount = 0;
	local topType = nil;
	local palyers = {};

-- ���а����ͣ�����typedef��TYPE_DEFö��
	topType = networkengine:parseInt();
-- �����Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		palyers[i] = ParseTopSummary();
	end

	TopHandler( topType, palyers );
end

