-- ������ؽ��

function packetHandlerIncidentResult()
	local tempArrayCount = 0;
	local incidentIndex = nil;
	local eventID = nil;

-- �������,��0��ʼ
	incidentIndex = networkengine:parseInt();
-- ����¼�ID��,��1��ʼ,����incident.xls
	eventID = networkengine:parseInt();

	IncidentResultHandler( incidentIndex, eventID );
end

