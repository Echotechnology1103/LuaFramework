-- �ݵ���Ϣ�Ļظ�

function packetHandlerGuildWarPost()
	local tempArrayCount = 0;
	local index = nil;
	local inspireCount = nil;
	local step = nil;
	local fighting = {};
	local precent = {};
	local players = {};

-- postID
	index = networkengine:parseInt();
-- �������
	inspireCount = networkengine:parseInt();
-- �ڼ��ݶ�
	step = networkengine:parseInt();
-- �Ƿ���ս��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		fighting[i] = networkengine:parseInt();
	end
-- ÿ��������ҵ�ǰѪ���ٷֱ�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		precent[i] = networkengine:parseInt();
	end
-- �����Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		players[i] = ParseLadderPlayer();
	end

	GuildWarPostHandler( index, inspireCount, step, fighting, precent, players );
end

