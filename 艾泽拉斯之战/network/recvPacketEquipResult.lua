-- ��жװ��

function packetHandlerEquipResult()
	local tempArrayCount = 0;
	local bagTypeA = nil;
	local positionA = nil;
	local bagTypeB = nil;
	local positionB = nil;

-- ��������
	bagTypeA = networkengine:parseInt();
-- ��Ʒ����λ��
	positionA = networkengine:parseInt();
-- ��������
	bagTypeB = networkengine:parseInt();
-- ��Ʒ����λ��
	positionB = networkengine:parseInt();

	EquipResultHandler( bagTypeA, positionA, bagTypeB, positionB );
end

