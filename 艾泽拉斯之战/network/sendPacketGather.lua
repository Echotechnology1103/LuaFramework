-- �Ӹ��ཨ�����ռ�

function sendGather(buildType)
	networkengine:beginsend(4);
-- ��������
	networkengine:pushInt(buildType);
	networkengine:send();
end

