-- ���󹥻�xx�ݵ���ϸ��Ϣ

function sendAskGuildWarPostDetail(postID, playerID)
	networkengine:beginsend(158);
-- �ݵ�id
	networkengine:pushInt(postID);
-- �ݵ��id��ҵ���ϸ��Ϣ
	networkengine:pushInt(playerID);
	networkengine:send();
end

