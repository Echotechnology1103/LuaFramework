-- ÿ��������ĸ�����ħ��

function packetHandlerSyncChallengeInfo()
	local tempArrayCount = 0;
	local greatMagics = {};
	local challengeDamageDefence = nil;
	local challengeDamageResilience = nil;

-- ������ս��ÿ��4������ħ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		greatMagics[i] = networkengine:parseInt();
	end
-- �˺���սboss�����͹����ȼ�
	challengeDamageDefence = networkengine:parseInt();
-- �˺���սboss���������Եȼ�
	challengeDamageResilience = networkengine:parseInt();

	SyncChallengeInfoHandler( greatMagics, challengeDamageDefence, challengeDamageResilience );
end

