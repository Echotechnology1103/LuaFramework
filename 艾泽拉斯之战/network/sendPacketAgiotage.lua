-- ���Ҷһ�Э��

function sendAgiotage(agiotageType, adventureID)
	networkengine:beginsend(37);
-- �һ�����,����typedef��AGIOTAGE_TYPE
	networkengine:pushInt(agiotageType);
-- ���ø���id�ţ�����Ƕһ����ң���д-1
	networkengine:pushInt(adventureID);
	networkengine:send();
end

