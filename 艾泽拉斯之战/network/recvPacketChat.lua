-- ����ͬ��

function packetHandlerChat()
	local tempArrayCount = 0;
	local channel = nil;
	local chatType = nil;
	local playerID = nil;
	local level = nil;
	local icon = nil;
	local vip = nil;
	local miracle = nil;
	local talker = nil;
	local content = nil;
	local params = {};

-- Ƶ��
	channel = networkengine:parseInt();
-- ��������
	chatType = networkengine:parseInt();
-- �����ߵ�id
	playerID = networkengine:parseInt();
-- �����ߵȼ�
	level = networkengine:parseInt();
-- ������ͷ��
	icon = networkengine:parseInt();
-- �����ߵ�vip
	vip = networkengine:parseInt();
-- �����ߵ��漣�ȼ�
	miracle = networkengine:parseInt();
-- ����������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		talker = networkengine:parseString(strlength);
else
		talker = "";
end
-- ����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		content = networkengine:parseString(strlength);
else
		content = "";
end
-- ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		params[i] = networkengine:parseInt();
	end

	ChatHandler( channel, chatType, playerID, level, icon, vip, miracle, talker, content, params );
end

