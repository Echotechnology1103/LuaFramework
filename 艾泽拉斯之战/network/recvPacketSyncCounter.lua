-- ͳ�Ƽ���ͬ��

function packetHandlerSyncCounter()
	local tempArrayCount = 0;
	local syncCounterType = nil;
	local arrayType = nil;
	local index = nil;
	local value = nil;

-- 1,ͳ�Ƽ��� 2,������� 3,�����
	syncCounterType = networkengine:parseInt();
-- ���counterType=2 �������ö��
	arrayType = networkengine:parseInt();
-- index��������
	index = networkengine:parseInt();
-- ֵ
	value = networkengine:parseInt();

	SyncCounterHandler( syncCounterType, arrayType, index, value );
end

