-- �����˺����а�

function sendAskTop(topType, startRank, endRank)
	networkengine:beginsend(69);
-- �ο�typedef�е�TOP_TYPEö��
	networkengine:pushInt(topType);
-- ��ʼ����
	networkengine:pushInt(startRank);
-- ĩβ����
	networkengine:pushInt(endRank);
	networkengine:send();
end

