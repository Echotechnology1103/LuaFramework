-- ����ս��

function packetHandlerBattleResult()
	local tempArrayCount = 0;
	local value = {};

-- ս����¼����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		value[i] = BattleResultParseRecordPtr();
	end

	BattleResultHandler( value );
end

