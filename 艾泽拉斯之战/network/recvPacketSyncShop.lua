-- �̵�

function packetHandlerSyncShop()
	local tempArrayCount = 0;
	local diamondRefreshCount = nil;
	local refreshTime = nil;
	local shopType = nil;
	local shopItems = {};

-- ��ʯˢ�´���
	diamondRefreshCount = networkengine:parseInt();
-- �ϴ�ˢ��ʱ��
	refreshTime = networkengine:parseUInt64();
-- �̵�����
	shopType = networkengine:parseInt();
-- player��Shop��Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		shopItems[i] = ParseShopItemInfo();
	end

	SyncShopHandler( diamondRefreshCount, refreshTime, shopType, shopItems );
end

