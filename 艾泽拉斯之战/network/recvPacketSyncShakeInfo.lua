-- ҡ�����Ϣ

function packetHandlerSyncShakeInfo()
	local tempArrayCount = 0;
	local shakeCount = nil;
	local addShakeCount = nil;
	local shakeMoney = nil;
	local redEnvelopMoney = nil;

-- Ŀǰ�Ѿ�ҡ�Ĵ���
	shakeCount = networkengine:parseInt();
-- ����������ӵĴ���
	addShakeCount = networkengine:parseInt();
-- ҡ����Ǯ
	shakeMoney = networkengine:parseInt64();
-- ����ĵ�ǰ�ܽ��
	redEnvelopMoney = networkengine:parseInt64();

	SyncShakeInfoHandler( shakeCount, addShakeCount, shakeMoney, redEnvelopMoney );
end

