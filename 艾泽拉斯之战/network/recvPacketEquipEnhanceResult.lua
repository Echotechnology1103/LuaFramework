-- ǿ��װ��

function packetHandlerEquipEnhanceResult()
	local tempArrayCount = 0;
	local isEnhanceToMax = nil;

-- �Ƿ���������ǰ���ȼ�
	isEnhanceToMax = networkengine:parseInt();

	EquipEnhanceResultHandler( isEnhanceToMax );
end

