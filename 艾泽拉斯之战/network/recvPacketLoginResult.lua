-- ��½�����

function packetHandlerLoginResult()
	local tempArrayCount = 0;
	local result = nil;
	local exception = nil;

-- ��½���
	result = networkengine:parseInt();
-- ��½�쳣ԭ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		exception = networkengine:parseString(strlength);
else
		exception = "";
end

	LoginResultHandler( result, exception );
end

