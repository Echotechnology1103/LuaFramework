-- ����ħ�����ǻ����»����ʾ

function packetHandlerPrompt()
	local tempArrayCount = 0;
	local promptType = nil;
	local id = nil;
	local preExp = nil;
	local exp = nil;
	local preStar = nil;
	local star = nil;
	local overflow = nil;
	local firstGain = nil;

-- ���ƻ���ħ��
	promptType = networkengine:parseInt();
-- ���ƻ���ħ����ID��
	id = networkengine:parseInt();
-- ֮ǰ�ľ���
	preExp = networkengine:parseInt();
-- ��ǰ�ľ���
	exp = networkengine:parseInt();
-- ֮ǰ���Ǽ�
	preStar = networkengine:parseInt();
-- �Ǽ�
	star = networkengine:parseInt();
-- �������
	overflow = networkengine:parseInt();
-- �Ƿ�����Ʒ
	firstGain = networkengine:parseBool();

	PromptHandler( promptType, id, preExp, exp, preStar, star, overflow, firstGain );
end

