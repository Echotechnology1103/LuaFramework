-- ����Ʒ

function sendTrade(items)
	networkengine:beginsend(48);
-- ������Ʒ��Ϣ
	local arrayLength = #items;
	if arrayLength > 256 then arrayLength = 256 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(items) do
		sendPushSellItemInfo(v);
	end

	networkengine:send();
end

