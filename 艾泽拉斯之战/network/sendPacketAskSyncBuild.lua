-- ����ͬ����������

function sendAskSyncBuild(buildType)
	networkengine:beginsend(0);
-- ��������
	networkengine:pushInt(buildType);
	networkengine:send();
end

