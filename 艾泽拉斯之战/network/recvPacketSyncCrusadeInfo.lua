-- ͬ����ҵ�Զ������

function packetHandlerSyncCrusadeInfo()
	local tempArrayCount = 0;
	local level = nil;
	local food = nil;
	local power = nil;
	local attr = {};

-- ��ҵȼ�
	level = networkengine:parseInt();
-- ƽ���˿�
	food = networkengine:parseInt();
-- ս����
	power = networkengine:parseInt();
-- ������Ϣ
	attr = ParseShipAttrBase();

	SyncCrusadeInfoHandler( level, food, power, attr );
end

