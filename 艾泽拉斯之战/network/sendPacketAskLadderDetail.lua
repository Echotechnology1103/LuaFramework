-- ����������ϸ����

function sendAskLadderDetail(playerID, rank)
	networkengine:beginsend(72);
-- ��ҵ�id
	networkengine:pushInt(playerID);
-- ����.��id=-1����Ŀ��λrobot��ʱ�򣩣�ʹ��rank����
	networkengine:pushInt(rank);
	networkengine:send();
end

