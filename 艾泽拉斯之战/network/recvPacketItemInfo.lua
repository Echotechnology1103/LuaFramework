-- ��Ʒ��Ϣ

function packetHandlerItemInfo()
	local tempArrayCount = 0;
	local opcode = nil;
	local bagType = nil;
	local items = {};

-- ��������1,add,2,update
	opcode = networkengine:parseInt();
-- ��������
	bagType = networkengine:parseInt();
-- ��Ʒ��Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		items[i] = ParseItemInfoData();
	end

	ItemInfoHandler( opcode, bagType, items );
end

