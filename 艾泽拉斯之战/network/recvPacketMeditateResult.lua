-- ڤ����

function packetHandlerMeditateResult()
	local tempArrayCount = 0;
	local magic = {};
	local overflowExp = nil;

-- ڤ������ѡ��Ľ��
	magic = ParseMagicChoose();
-- �����ħ�����exp
	overflowExp = networkengine:parseInt();

	MeditateResultHandler( magic, overflowExp );
end

