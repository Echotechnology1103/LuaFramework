-- ÿ�ռ���,ÿ����Ϊ����

function packetHandlerCounter()
	local tempArrayCount = 0;
	local counter = {};
	local counterArray = {};
	local counterActivity = {};

-- ͳ�Ƽ���
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		counter[i] = networkengine:parseInt();
	end
-- ͳ�Ƽ�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		counterArray[i] = ParseCounterArray();
	end
-- ��ʱ�������(��ǰֻ�г�ֵ������)
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		counterActivity[i] = networkengine:parseInt();
	end

	CounterHandler( counter, counterArray, counterActivity );
end

