-- ��������

function sendAskChat(channel, chatType, content, params)
	networkengine:beginsend(92);
-- Ƶ��
	networkengine:pushInt(channel);
-- ��������
	networkengine:pushInt(chatType);
-- ����
	networkengine:pushInt(string.len(content));
	networkengine:pushString(content, string.len(content));
-- ����
	local arrayLength = #params;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(params) do
		networkengine:pushInt(v);
	end

	networkengine:send();
end

