-- ������ѷ���

function packetHandlerFriendApplyResult()
	local tempArrayCount = 0;
	local targetID = nil;
	local param = nil;

-- �����Ŀ��id
	targetID = networkengine:parseInt();
-- ������Ϣ,1����ɹ�,2����ɹ����һ���ɺ���
	param = networkengine:parseInt();

	FriendApplyResultHandler( targetID, param );
end

