-- ���Դ��

function sendTestBig(value)
	networkengine:beginsend(12);
-- ��������
	local arrayLength = #value;
	if arrayLength > 4096 then arrayLength = 4096 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(value) do
		networkengine:pushChar(v);
	end

	networkengine:send();
end

