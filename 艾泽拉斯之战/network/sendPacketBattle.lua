-- ����ս��

function sendBattle(battleType, adventureID, param1)
	networkengine:beginsend(1);
-- ս�����ͣ���typedef��BattleType
	networkengine:pushInt(battleType);
-- �������߻��ID
	networkengine:pushInt(adventureID);
-- param1 ���ڹ���սpostID�µ�ladderPlayer.id
	networkengine:pushInt(param1);
	networkengine:send();
end

