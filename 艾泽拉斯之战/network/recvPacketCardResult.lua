-- �鿨���

function packetHandlerCardResult()
	local tempArrayCount = 0;
	local cardResultType = nil;
	local cardInfo = {};

-- �������ݸı�,��ʲôʱ�̷�����,����type.def
	cardResultType = networkengine:parseInt();
-- ������������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		cardInfo[i] = ParseCardUpgrade();
	end

	CardResultHandler( cardResultType, cardInfo );
end

