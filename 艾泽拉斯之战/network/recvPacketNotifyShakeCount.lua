-- �������֪ͨ

function packetHandlerNotifyShakeCount()
	local tempArrayCount = 0;
	local addShakeCount = nil;

-- ��ǰ���ӵĶ������
	addShakeCount = networkengine:parseInt();

	NotifyShakeCountHandler( addShakeCount );
end

