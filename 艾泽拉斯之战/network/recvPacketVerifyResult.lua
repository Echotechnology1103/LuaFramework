-- �����������֤ƾ֤�Ľ��

function packetHandlerVerifyResult()
	local tempArrayCount = 0;
	local verifyResult = nil;
	local transaction_id = nil;

-- �ʼ������������,�����typedef��VERIFY_RESULTö��
	verifyResult = networkengine:parseInt();

	print("packetHandlerVerifyResult");
	print(verifyResult);
	-- ��֤�ɹ���Ľ���id
	local strlength = networkengine:parseInt();
	print(strlength);

if strlength > 0 then
		transaction_id = networkengine:parseString(strlength);
else
		transaction_id = "";
end
	
	print(transaction_id);
	VerifyResultHandler( verifyResult, transaction_id );
end

