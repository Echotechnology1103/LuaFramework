-- ɨ��

function sendSweep(adventureID, adventureType, count)
	networkengine:beginsend(53);
-- �ؿ�ID
	networkengine:pushInt(adventureID);
-- �ؿ�����
	networkengine:pushInt(adventureType);
-- ɨ������
	networkengine:pushInt(count);
	networkengine:send();
end

