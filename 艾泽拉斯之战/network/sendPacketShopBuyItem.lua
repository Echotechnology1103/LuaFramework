-- �̵깺����Ʒ

function sendShopBuyItem(position, shopType)
	networkengine:beginsend(58);
-- �̵����λ��
	networkengine:pushInt(position);
-- �̵�����
	networkengine:pushInt(shopType);
	networkengine:send();
end

