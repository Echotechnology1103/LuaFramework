-- ��¼����

function packetHandlerQueue()
	local tempArrayCount = 0;
	local num = nil;
	local time = nil;

-- ǰ���ж�����
	num = networkengine:parseInt();
-- ��ʼ��ʱʱ��
	time = networkengine:parseUInt64();

	QueueHandler( num, time );
end

