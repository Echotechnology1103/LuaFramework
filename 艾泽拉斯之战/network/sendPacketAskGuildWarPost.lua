-- ���󹥻�xx�ݵ�

function sendAskGuildWarPost(postID)
	networkengine:beginsend(155);
-- �ݵ�id
	networkengine:pushInt(postID);
	networkengine:send();
end

