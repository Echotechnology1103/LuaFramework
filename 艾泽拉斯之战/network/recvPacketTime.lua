-- ͬ��������ʱ��

function packetHandlerTime()
	local tempArrayCount = 0;
	local time = nil;
	local timezone = nil;
	local refleshDays = nil;
	local serverBeginTime = nil;

-- ��������ǰʱ��
	time = networkengine:parseUInt64();
-- ʱ����ֵΪ0~24����ȥ12����ȡ�෴��������UTC
	timezone = networkengine:parseInt();
-- ����������������ˢ�����������˺����а�
	refleshDays = networkengine:parseInt();
-- ������������������ʱ��
	serverBeginTime = networkengine:parseUInt64();

	TimeHandler( time, timezone, refleshDays, serverBeginTime );
end

