-- ������Ϣ���

function packetHandlerSyncGuildInfoChange()
	local tempArrayCount = 0;
	local id = nil;
	local notice = nil;
	local warScore = nil;
	local __optional_flag__ = GameClient.Bitset:new(2);
	networkengine:parseBitset(2, __optional_flag__);

-- ����id
	id = networkengine:parseInt();
	if __optional_flag__:isSetbit(0) then
		-- ���ṫ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		notice = networkengine:parseString(strlength);
else
		notice = "";
end
	end
	if __optional_flag__:isSetbit(1) then
		-- �������
	warScore = networkengine:parseInt();
	end

	SyncGuildInfoChangeHandler( __optional_flag__, id, notice, warScore );
	__optional_flag__:delete();
end

