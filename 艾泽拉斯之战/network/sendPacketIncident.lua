-- �������

function sendIncident(incidentIndex)
	networkengine:beginsend(49);
-- ���ʵ��������,��0��ʼ, �����Ҫˢ��ȫ��������д-1
	networkengine:pushInt(incidentIndex);
	networkengine:send();
end

