-- �ʼ�����

function packetHandlerMail()
	local tempArrayCount = 0;
	local id = nil;
	local caption = nil;
	local text = nil;
	local time = nil;
	local wildCardParams = {};
	local attachements = {};

-- �ʼ�ID
	id = networkengine:parseInt();
-- �ʼ�����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		caption = networkengine:parseString(strlength);
else
		caption = "";
end
-- �ʼ�����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		text = networkengine:parseString(strlength);
else
		text = "";
end
-- �ʼ�ʱ��
	time = networkengine:parseUInt64();
-- ͨ�������,���5��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
	local strlength = networkengine:parseInt();
if strlength > 0 then
			wildCardParams[i] = networkengine:parseString(strlength);
else
			wildCardParams[i] = "";
end
	end
-- ������,���20
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		attachements[i] = ParseMailAttachment();
	end

	MailHandler( id, caption, text, time, wildCardParams, attachements );
end

