-- ��������

function sendAskLadder(startRank, endRank)
	networkengine:beginsend(64);
-- ��ʼ����
	networkengine:pushInt(startRank);
-- ĩβ����
	networkengine:pushInt(endRank);
	networkengine:send();
end

