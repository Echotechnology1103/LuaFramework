-- ս������

function packetHandlerBattleSettlement()
	local tempArrayCount = 0;
	local battleType = nil;
	local win = nil;

-- ս������ �ذ�ȷ��
	battleType = networkengine:parseInt();
-- �Լ��Ƿ�ʤ��
	win = networkengine:parseBool();

	BattleSettlementHandler( battleType, win );
end

