-- ������������

local UPGRADE = 0;-- ��������
local CANCEL = 1;-- ȡ������
local IMMEDIATE_UPGRADE = 2;-- ��������

function sendUpgradeBuild(operation, buildType)
	networkengine:beginsend(16);
-- ��������
	networkengine:pushInt(operation);
-- ��������
	networkengine:pushInt(buildType);
	networkengine:send();
end

