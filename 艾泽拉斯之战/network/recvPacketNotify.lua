-- ϵͳ֪ͨ

function packetHandlerNotify()
	local tempArrayCount = 0;
	local notifyType = nil;
	local text = nil;
	local wildCardParams = {};

-- ������������ͻ��˷���֪ͨ������
	notifyType = networkengine:parseInt();
-- ֪ͨ����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		text = networkengine:parseString(strlength);
else
		text = "";
end
-- ͨ�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
	local strlength = networkengine:parseInt();
if strlength > 0 then
			wildCardParams[i] = networkengine:parseString(strlength);
else
			wildCardParams[i] = "";
end
	end

	NotifyHandler( notifyType, text, wildCardParams );
end

