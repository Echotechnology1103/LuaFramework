-- ��ս˫����������

function packetHandlerSyncBattle()
	local tempArrayCount = 0;
	local battleType = nil;
	local battleGuid = nil;
	local isReplay = nil;
	local force = nil;
	local attackPlan = {};
	local guardPlan = {};
	local attackMagics = {};
	local guardMagics = {};

-- ս�����ͣ��ذ�ȷ��
	battleType = networkengine:parseInt();
-- ս��guid
	battleGuid = networkengine:parseUInt();
-- �Ƿ���¼��
	isReplay = networkengine:parseBool();
-- ���ǽ��������Ƿ��ط�
	force = networkengine:parseInt();
-- ��������������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		attackPlan[i] = ParseUnitInfo();
	end
-- ���ط���������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		guardPlan[i] = ParseUnitInfo();
	end
-- ������ħ������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		attackMagics[i] = ParseMagicInfo();
	end
-- ���ط�ħ������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		guardMagics[i] = ParseMagicInfo();
	end

	SyncBattleHandler( battleType, battleGuid, isReplay, force, attackPlan, guardPlan, attackMagics, guardMagics );
end

