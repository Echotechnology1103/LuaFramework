-- Զ����������

function packetHandlerCrusader()
	local tempArrayCount = 0;
	local units = {};
	local kingInfo = {};

-- Զ����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		units[i] = ParseUnitInfo();
	end
-- Զ��������Ϣ
	kingInfo = ParseKingInfo();

	CrusaderHandler( units, kingInfo );
end

