-- ��������ͬ��

function packetHandlerSyncKing()
	local tempArrayCount = 0;
	local icon = nil;
	local name = nil;
	local miracle = nil;
	local intelligence = nil;
	local force = nil;
	local level = nil;
	local mp = nil;
	local maxMP = nil;
	local costRatio = nil;

-- ����ͼ��
	icon = networkengine:parseInt();
-- ��������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		name = networkengine:parseString(strlength);
else
		name = "";
end
-- �����漣�ȼ�
	miracle = networkengine:parseInt();
-- ����
	intelligence = networkengine:parseInt();
-- ���ط�
	force = networkengine:parseInt();
-- �ȼ�
	level = networkengine:parseInt();
-- mp
	mp = networkengine:parseInt();
-- ���mp
	maxMP = networkengine:parseInt();
-- ħ�����ı���
	costRatio = networkengine:parseInt();

	SyncKingHandler( icon, name, miracle, intelligence, force, level, mp, maxMP, costRatio );
end

