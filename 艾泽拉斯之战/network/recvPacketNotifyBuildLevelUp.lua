-- �������֪ͨ

function packetHandlerNotifyBuildLevelUp()
	local tempArrayCount = 0;
	local buildType = nil;
	local level = nil;

-- ��������
	buildType = networkengine:parseInt();
-- ����������ĵȼ�
	level = networkengine:parseInt();

	NotifyBuildLevelUpHandler( buildType, level );
end

