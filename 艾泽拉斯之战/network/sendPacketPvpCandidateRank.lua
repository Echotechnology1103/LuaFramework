-- pvp��ѡ�˵�����

function sendPvpCandidateRank(index)
	networkengine:beginsend(62);
-- ��ѡ�˵�index
	networkengine:pushInt(index);
	networkengine:send();
end

