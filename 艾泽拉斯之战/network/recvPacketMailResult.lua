-- �ʼ��������

function packetHandlerMailResult()
	local tempArrayCount = 0;
	local mailResult = nil;
	local param1 = nil;
	local param2 = nil;

-- �ʼ������������,�����typedef��MAIL_RESULT_TYPEö��
	mailResult = networkengine:parseInt();
-- �����typedef��MAIL_RESULT_TYPEö��
	param1 = networkengine:parseInt();
-- �����typedef��MAIL_RESULT_TYPEö��
	param2 = networkengine:parseInt();

	MailResultHandler( mailResult, param1, param2 );
end

