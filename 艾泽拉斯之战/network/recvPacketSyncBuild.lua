-- ����ͬ��

function packetHandlerSyncBuild()
	local tempArrayCount = 0;
	local buildType = nil;
	local level = nil;
	local gatherTime = nil;
	local upgradeTime = nil;
	local stack = nil;
	local meditatePoint = nil;

-- ��������
	buildType = networkengine:parseInt();
-- ������ǰ�ȼ�
	level = networkengine:parseInt();
-- �ϴ��ռ�ʱ��
	gatherTime = networkengine:parseUInt64();
-- ������ʼʱ��
	upgradeTime = networkengine:parseUInt64();
-- ��������Դ������
	stack = networkengine:parseInt();
-- ڤ�����
	meditatePoint = networkengine:parseInt();

	SyncBuildHandler( buildType, level, gatherTime, upgradeTime, stack, meditatePoint );
end

