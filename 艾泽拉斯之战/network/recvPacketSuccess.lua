-- ͨ�ò�����ɴ���

function packetHandlerSuccess()
	local tempArrayCount = 0;
	local responseID = nil;
	local code = nil;

-- ��Ӧ�İ�ID
	responseID = networkengine:parseInt();
-- �ɹ���
	code = networkengine:parseInt();

	SuccessHandler( responseID, code );
end

