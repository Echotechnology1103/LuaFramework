-- ����ͬ��

function packetHandlerSyncMoney()
	local tempArrayCount = 0;
	local money = {};
	local lastReason = nil;

-- ��������
	local __optional_flag__money = GameClient.Bitset:new(16);
 	networkengine:parseBitset(16, __optional_flag__money);
	tempArrayCount = 16;
	for i=1, tempArrayCount do
		if __optional_flag__money:isSetbit(i-1) then
			money[i] = networkengine:parseInt64();
		end
	end
-- ���һ�λ��ұ仯��ԭ�����ڿͻ��˵�ĳЩ���ֲ���
	lastReason = networkengine:parseInt();

	SyncMoneyHandler( __optional_flag__money,  money, lastReason );
	__optional_flag__money:delete();
end

