-- �̵�����,�̵�ˢ��

function sendShopRefresh(refreshType, shopType)
	networkengine:beginsend(57);
-- ˢ������
	networkengine:pushInt(refreshType);
-- �̵�����
	networkengine:pushInt(shopType);
	networkengine:send();
end

