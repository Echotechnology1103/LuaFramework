-- ���Ա䳤��

function sendTestVariant(len, value)
	networkengine:beginsend(14);
-- �������ݳ���
	networkengine:pushInt(len);
-- ��������
	local arrayLength = #value;
	if arrayLength > 256 then arrayLength = 256 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(value) do
		networkengine:pushInt(v);
	end

	networkengine:send();
end

