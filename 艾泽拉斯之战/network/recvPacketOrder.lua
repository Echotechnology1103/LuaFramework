-- �·�֧������

function packetHandlerOrder()
	local tempArrayCount = 0;
	local rechargeID = nil;
	local orderID = nil;

-- ��ֵid
	rechargeID = networkengine:parseInt();
-- ������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		orderID = networkengine:parseString(strlength);
else
		orderID = "";
end

	OrderHandler( rechargeID, orderID );
end

