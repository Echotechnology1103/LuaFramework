-- ����ĳ����ҵ�Ȩ�޵ı��

function packetHandlerMemberProperty()
	local tempArrayCount = 0;
	local memberID = nil;
	local property = nil;

-- ��Աid
	memberID = networkengine:parseInt();
-- Ȩ��
	property = networkengine:parseInt();

	MemberPropertyHandler( memberID, property );
end

