-- ����״̬

function packetHandlerFriendsStatus()
	local tempArrayCount = 0;
	local friendID = nil;
	local icon = nil;
	local level = nil;
	local vip = nil;
	local nickname = nil;
	local lastLoginTime = nil;
	local sendFlag = nil;
	local recvFlag = nil;
	local __optional_flag__ = GameClient.Bitset:new(7);
	networkengine:parseBitset(7, __optional_flag__);

-- ����id
	friendID = networkengine:parseInt();
	if __optional_flag__:isSetbit(0) then
		-- ͷ��
	icon = networkengine:parseInt();
	end
	if __optional_flag__:isSetbit(1) then
		-- �ȼ�
	level = networkengine:parseInt();
	end
	if __optional_flag__:isSetbit(2) then
		-- vip
	vip = networkengine:parseInt();
	end
	if __optional_flag__:isSetbit(3) then
		-- �ǳ�
	local strlength = networkengine:parseInt();
if strlength > 0 then
		nickname = networkengine:parseString(strlength);
else
		nickname = "";
end
	end
	if __optional_flag__:isSetbit(4) then
		-- �����Ƿ�����,����Ϊ0,���������ϴε�¼ʱ��
	lastLoginTime = networkengine:parseUInt64();
	end
	if __optional_flag__:isSetbit(5) then
		-- ���ͱ��
	sendFlag = networkengine:parseInt();
	end
	if __optional_flag__:isSetbit(6) then
		-- ���ܱ��
	recvFlag = networkengine:parseInt();
	end

	FriendsStatusHandler( __optional_flag__, friendID, icon, level, vip, nickname, lastLoginTime, sendFlag, recvFlag );
	__optional_flag__:delete();
end

