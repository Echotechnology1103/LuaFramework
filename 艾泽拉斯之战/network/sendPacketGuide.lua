-- ����ָ����ʾ

function sendGuide(guides)
	networkengine:beginsend(91);
-- �ͻ���������������ָ����־λ
	local arrayLength = #guides;
	if arrayLength > 32 then arrayLength = 32 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(guides) do
		sendPushGuideInfo(v);
	end

	networkengine:send();
end

