-- �ʼ�Ԥ��

function packetHandlerMailPreview()
	local tempArrayCount = 0;
	local beginIndex = nil;
	local mailPreviews = {};

-- �ʼ��б���ʼ����
	beginIndex = networkengine:parseInt();
-- �ʼ�Ԥ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		mailPreviews[i] = ParseMailPreview();
	end

	MailPreviewHandler( beginIndex, mailPreviews );
end

