-- ɾ����Ʒ

function packetHandlerDelItemResult()
	local tempArrayCount = 0;
	local bagType = nil;
	local positions = {};

-- ��������
	bagType = networkengine:parseInt();
-- λ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		positions[i] = networkengine:parseInt();
	end

	DelItemResultHandler( bagType, positions );
end

