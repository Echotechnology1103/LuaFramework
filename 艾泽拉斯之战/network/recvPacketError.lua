-- ͨ�ô������

function packetHandlerError()
	local tempArrayCount = 0;
	local responseID = nil;
	local code = nil;

-- ��Ӧ�İ�ID
	responseID = networkengine:parseInt();
-- �������
	code = networkengine:parseInt();

	ErrorHandler( responseID, code );
end

