-- �����Ӷ����

function sendAskPlunderTarget(primalsType)
	networkengine:beginsend(116);
-- ��Ҫ�Ӷ��ԭ����Դ����
	networkengine:pushInt(primalsType);
	networkengine:send();
end

