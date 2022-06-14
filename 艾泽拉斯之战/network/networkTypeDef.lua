------------------typedef vector2i ----------------------------------
function sendPushvector2i(data)
-- vector x
	networkengine:pushInt(data.x);
-- vector y
	networkengine:pushInt(data.y);
end

function Parsevector2i()
	local tempArrayCount = 0;
	local data = {};

-- vector x
	data['x'] = networkengine:parseInt();
-- vector y
	data['y'] = networkengine:parseInt();

	return data;
end

------------------typedef MagicInfo ----------------------------------
function sendPushMagicInfo(data)
-- ħ��id
	networkengine:pushInt(data.id);
-- ħ���ȼ�
	networkengine:pushInt(data.level);
-- �ڿ�����е�λ��
	networkengine:pushInt(data.position);
end

function ParseMagicInfo()
	local tempArrayCount = 0;
	local data = {};

-- ħ��id
	data['id'] = networkengine:parseInt();
-- ħ���ȼ�
	data['level'] = networkengine:parseInt();
-- �ڿ�����е�λ��
	data['position'] = networkengine:parseInt();

	return data;
end

------------------typedef CardUpgrade ----------------------------------
function sendPushCardUpgrade(data)
-- ����ID
	networkengine:pushInt(data.cardID);
-- ����������ľ���ֵ
	networkengine:pushInt(data.cardExp);
-- �Ƿ��»��
	networkengine:pushBool(data.firstGain);
-- ֮ǰ�Ǽ�
	networkengine:pushInt(data.preStar);
-- �����Ǽ�
	networkengine:pushInt(data.currentStar);
end

function ParseCardUpgrade()
	local tempArrayCount = 0;
	local data = {};

-- ����ID
	data['cardID'] = networkengine:parseInt();
-- ����������ľ���ֵ
	data['cardExp'] = networkengine:parseInt();
-- �Ƿ��»��
	data['firstGain'] = networkengine:parseBool();
-- ֮ǰ�Ǽ�
	data['preStar'] = networkengine:parseInt();
-- �����Ǽ�
	data['currentStar'] = networkengine:parseInt();

	return data;
end

------------------typedef ShipUnitInfo ----------------------------------
function sendPushShipUnitInfo(data)
-- ship�ϵ�cardtype
	networkengine:pushInt(data.cardType);
-- ship��unit������
	networkengine:pushInt(data.unitCount);
end

function ParseShipUnitInfo()
	local tempArrayCount = 0;
	local data = {};

-- ship�ϵ�cardtype
	data['cardType'] = networkengine:parseInt();
-- ship��unit������
	data['unitCount'] = networkengine:parseInt();

	return data;
end

------------------typedef IncidentSummary ----------------------------------
function sendPushIncidentSummary(data)
-- ����������¼�ID
	networkengine:pushInt(data.eventID);
-- ����¼��ĵ�ͼ�ؿ�λ��(���ܷ�������û����)
	networkengine:pushInt(data.position);
-- ����¼��´οɴ�����ʱ���
	networkengine:pushUInt64(data.nextTime);
end

function ParseIncidentSummary()
	local tempArrayCount = 0;
	local data = {};

-- ����������¼�ID
	data['eventID'] = networkengine:parseInt();
-- ����¼��ĵ�ͼ�ؿ�λ��(���ܷ�������û����)
	data['position'] = networkengine:parseInt();
-- ����¼��´οɴ�����ʱ���
	data['nextTime'] = networkengine:parseUInt64();

	return data;
end

------------------typedef Reward ----------------------------------
function sendPushReward(data)
-- ��������
	networkengine:pushInt(data.type);
-- ����id
	networkengine:pushInt(data.id);
-- ��������
	networkengine:pushInt(data.count);
end

function ParseReward()
	local tempArrayCount = 0;
	local data = {};

-- ��������
	data['type'] = networkengine:parseInt();
-- ����id
	data['id'] = networkengine:parseInt();
-- ��������
	data['count'] = networkengine:parseInt();

	return data;
end

------------------typedef MailPreview ----------------------------------
function sendPushMailPreview(data)
-- �ʼ�id
	networkengine:pushInt(data.id);
-- �ʼ�����
	networkengine:pushInt(string.len(data.caption));
	networkengine:pushString(data.caption, string.len(data.caption));
-- �ʼ�ʱ��
	networkengine:pushUInt64(data.time);
-- �Ƿ��Ѷ�
	networkengine:pushBool(data.isReaded);
end

function ParseMailPreview()
	local tempArrayCount = 0;
	local data = {};

-- �ʼ�id
	data['id'] = networkengine:parseInt();
-- �ʼ�����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['caption'] = networkengine:parseString(strlength);
else
		data['caption'] = "";
end
-- �ʼ�ʱ��
	data['time'] = networkengine:parseUInt64();
-- �Ƿ��Ѷ�
	data['isReaded'] = networkengine:parseBool();

	return data;
end

------------------typedef MailAttachment ----------------------------------
function sendPushMailAttachment(data)
-- ����id
	networkengine:pushInt(data.id);
-- ��Դ
	networkengine:pushInt(data.source);
-- ��������
	networkengine:pushInt(data.type);
-- ����������
	networkengine:pushInt(data.subType);
-- �ѵ�����
	networkengine:pushInt(data.overlay);
end

function ParseMailAttachment()
	local tempArrayCount = 0;
	local data = {};

-- ����id
	data['id'] = networkengine:parseInt();
-- ��Դ
	data['source'] = networkengine:parseInt();
-- ��������
	data['type'] = networkengine:parseInt();
-- ����������
	data['subType'] = networkengine:parseInt();
-- �ѵ�����
	data['overlay'] = networkengine:parseInt();

	return data;
end

------------------typedef ShipPlanInfo ----------------------------------
function sendPushShipPlanInfo(data)
-- ���ϵĿ���ID
	networkengine:pushInt(data.cardID);
-- λ��
	sendPushvector2i(data.position);
end

function ParseShipPlanInfo()
	local tempArrayCount = 0;
	local data = {};

-- ���ϵĿ���ID
	data['cardID'] = networkengine:parseInt();
-- λ��
	data['position'] = Parsevector2i();

	return data;
end

------------------typedef ShipInfo ----------------------------------
function sendPushShipInfo(data)
-- ship index
	networkengine:pushInt(data.index);
-- ship level
	networkengine:pushInt(data.level);
-- ������ȼ�
	networkengine:pushInt(data.remouldLevel);
-- ����������Ϣ
	local arrayLength = #data.plans;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.plans) do
		sendPushShipPlanInfo(v);
	end

end

function ParseShipInfo()
	local tempArrayCount = 0;
	local data = {};

	data['plans'] = {};
-- ship index
	data['index'] = networkengine:parseInt();
-- ship level
	data['level'] = networkengine:parseInt();
-- ������ȼ�
	data['remouldLevel'] = networkengine:parseInt();
-- ����������Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['plans'][i] = ParseShipPlanInfo();
	end

	return data;
end

------------------typedef FriendInfo ----------------------------------
function sendPushFriendInfo(data)
-- ����id
	networkengine:pushInt(data.friendID);
-- headID
	networkengine:pushInt(data.headID);
-- �ȼ�
	networkengine:pushInt(data.level);
-- ����vip
	networkengine:pushInt(data.vip);
-- �漣�ȼ�
	networkengine:pushInt(data.miracle);
-- ���ͱ��0:����δ����, 1:�з�������
	networkengine:pushInt(data.sendFlag);
-- ���ܱ��0:����û������, 1:����������, 2:������ȡ��������
	networkengine:pushInt(data.recvFlag);
-- �����ǳ�
	networkengine:pushInt(string.len(data.nickname));
	networkengine:pushString(data.nickname, string.len(data.nickname));
-- ���һ�ε�¼ʱ��
	networkengine:pushUInt64(data.lastLoginTime);
end

function ParseFriendInfo()
	local tempArrayCount = 0;
	local data = {};

-- ����id
	data['friendID'] = networkengine:parseInt();
-- headID
	data['headID'] = networkengine:parseInt();
-- �ȼ�
	data['level'] = networkengine:parseInt();
-- ����vip
	data['vip'] = networkengine:parseInt();
-- �漣�ȼ�
	data['miracle'] = networkengine:parseInt();
-- ���ͱ��0:����δ����, 1:�з�������
	data['sendFlag'] = networkengine:parseInt();
-- ���ܱ��0:����û������, 1:����������, 2:������ȡ��������
	data['recvFlag'] = networkengine:parseInt();
-- �����ǳ�
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['nickname'] = networkengine:parseString(strlength);
else
		data['nickname'] = "";
end
-- ���һ�ε�¼ʱ��
	data['lastLoginTime'] = networkengine:parseUInt64();

	return data;
end

------------------typedef FriendMessage ----------------------------------
function sendPushFriendMessage(data)
-- ����
	networkengine:pushInt(string.len(data.content));
	networkengine:pushString(data.content, string.len(data.content));
end

function ParseFriendMessage()
	local tempArrayCount = 0;
	local data = {};

-- ����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['content'] = networkengine:parseString(strlength);
else
		data['content'] = "";
end

	return data;
end

------------------typedef FriendApplicant ----------------------------------
function sendPushFriendApplicant(data)
-- ������id
	networkengine:pushInt(data.applyID);
-- head index
	networkengine:pushInt(data.headID);
-- level
	networkengine:pushInt(data.level);
-- Ŀ���vip
	networkengine:pushInt(data.vip);
-- Ŀ����漣�ȼ�
	networkengine:pushInt(data.miracle);
-- �ǳ�
	networkengine:pushInt(string.len(data.nickname));
	networkengine:pushString(data.nickname, string.len(data.nickname));
end

function ParseFriendApplicant()
	local tempArrayCount = 0;
	local data = {};

-- ������id
	data['applyID'] = networkengine:parseInt();
-- head index
	data['headID'] = networkengine:parseInt();
-- level
	data['level'] = networkengine:parseInt();
-- Ŀ���vip
	data['vip'] = networkengine:parseInt();
-- Ŀ����漣�ȼ�
	data['miracle'] = networkengine:parseInt();
-- �ǳ�
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['nickname'] = networkengine:parseString(strlength);
else
		data['nickname'] = "";
end

	return data;
end

------------------typedef FriendSearchInfo ----------------------------------
function sendPushFriendSearchInfo(data)
-- id
	networkengine:pushInt(data.id);
-- head icon
	networkengine:pushInt(data.icon);
-- nickname
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- level
	networkengine:pushInt(data.level);
-- ��ҵ�vip
	networkengine:pushInt(data.vip);
-- �漣�ȼ�
	networkengine:pushInt(data.miracle);
end

function ParseFriendSearchInfo()
	local tempArrayCount = 0;
	local data = {};

-- id
	data['id'] = networkengine:parseInt();
-- head icon
	data['icon'] = networkengine:parseInt();
-- nickname
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- level
	data['level'] = networkengine:parseInt();
-- ��ҵ�vip
	data['vip'] = networkengine:parseInt();
-- �漣�ȼ�
	data['miracle'] = networkengine:parseInt();

	return data;
end

------------------typedef ShopItemInfo ----------------------------------
function sendPushShopItemInfo(data)
-- table�������id
	networkengine:pushInt(data.rowIndex);
-- row����Ʒ���������
	networkengine:pushInt(data.arrayIndex);
-- ʣ�µ�����
	networkengine:pushInt(data.count);
end

function ParseShopItemInfo()
	local tempArrayCount = 0;
	local data = {};

-- table�������id
	data['rowIndex'] = networkengine:parseInt();
-- row����Ʒ���������
	data['arrayIndex'] = networkengine:parseInt();
-- ʣ�µ�����
	data['count'] = networkengine:parseInt();

	return data;
end

------------------typedef ItemInfoData ----------------------------------
function sendPushItemInfoData(data)
-- item server id
	networkengine:pushUInt64(data.itemSID);
-- Item Type
	networkengine:pushInt(data.itemType);
-- Bag Type
	networkengine:pushInt(data.bagType);
-- Item TableID
	networkengine:pushInt(data.tableID);
-- position
	networkengine:pushInt(data.position);
-- ��������
	networkengine:pushInt(data.overlap);
-- װ��ǿ���ȼ�
	networkengine:pushInt(data.enhanceExp);
-- װ��ǿ�������˶���Ǯ
	networkengine:pushUInt64(data.enhanceGold);
-- ��Ʒ�Ĵ���ʱ��
	networkengine:pushUInt64(data.createTime);
end

function ParseItemInfoData()
	local tempArrayCount = 0;
	local data = {};

-- item server id
	data['itemSID'] = networkengine:parseUInt64();
-- Item Type
	data['itemType'] = networkengine:parseInt();
-- Bag Type
	data['bagType'] = networkengine:parseInt();
-- Item TableID
	data['tableID'] = networkengine:parseInt();
-- position
	data['position'] = networkengine:parseInt();
-- ��������
	data['overlap'] = networkengine:parseInt();
-- װ��ǿ���ȼ�
	data['enhanceExp'] = networkengine:parseInt();
-- װ��ǿ�������˶���Ǯ
	data['enhanceGold'] = networkengine:parseUInt64();
-- ��Ʒ�Ĵ���ʱ��
	data['createTime'] = networkengine:parseUInt64();

	return data;
end

------------------typedef UnitInfo ----------------------------------
function sendPushUnitInfo(data)
-- UnitID
	networkengine:pushInt(data.id);
-- unit��ս���ϵ�index
	networkengine:pushInt(data.index);
-- unit�ǽ��������Ƿ��ط�
	networkengine:pushInt(data.force);
-- ʿ������
	networkengine:pushInt(data.count);
-- λ��
	sendPushvector2i(data.position);
-- ��������
	sendPushShipAttrBase(data.shipAttr);
end

function ParseUnitInfo()
	local tempArrayCount = 0;
	local data = {};

-- UnitID
	data['id'] = networkengine:parseInt();
-- unit��ս���ϵ�index
	data['index'] = networkengine:parseInt();
-- unit�ǽ��������Ƿ��ط�
	data['force'] = networkengine:parseInt();
-- ʿ������
	data['count'] = networkengine:parseInt();
-- λ��
	data['position'] = Parsevector2i();
-- ��������
	data['shipAttr'] = ParseShipAttrBase();

	return data;
end

------------------typedef CounterArray ----------------------------------
function sendPushCounterArray(data)
-- ��������
	local arrayLength = #data.counterArray;
	if arrayLength > 512 then arrayLength = 512 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.counterArray) do
		networkengine:pushChar(v);
	end

end

function ParseCounterArray()
	local tempArrayCount = 0;
	local data = {};

	data['counterArray'] = {};
-- ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['counterArray'][i] = networkengine:parseChar();
	end

	return data;
end

------------------typedef MagicChoose ----------------------------------
function sendPushMagicChoose(data)
-- ħ��id
	networkengine:pushInt(data.id);
-- �Ǽ�
	networkengine:pushInt(data.star);
end

function ParseMagicChoose()
	local tempArrayCount = 0;
	local data = {};

-- ħ��id
	data['id'] = networkengine:parseInt();
-- �Ǽ�
	data['star'] = networkengine:parseInt();

	return data;
end

------------------typedef ActionBar ----------------------------------
function sendPushActionBar(data)
-- ���id
	local arrayLength = #data.shortcuts;
	if arrayLength > 16 then arrayLength = 16 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.shortcuts) do
		networkengine:pushInt(v);
	end

end

function ParseActionBar()
	local tempArrayCount = 0;
	local data = {};

	data['shortcuts'] = {};
-- ���id
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['shortcuts'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef IntArray ----------------------------------
function sendPushIntArray(data)
-- 16int����
end

function ParseIntArray()
	local tempArrayCount = 0;
	local data = {};

-- 16int����

	return data;
end

------------------typedef IntArray32 ----------------------------------
function sendPushIntArray32(data)
-- 16int����
	local arrayLength = #data.intarray32;
	if arrayLength > 32 then arrayLength = 32 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.intarray32) do
		networkengine:pushInt(v);
	end

end

function ParseIntArray32()
	local tempArrayCount = 0;
	local data = {};

	data['intarray32'] = {};
-- 16int����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['intarray32'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RewardList ----------------------------------
function sendPushRewardList(data)
-- �����б�
	local arrayLength = #data.rewardList;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardList) do
		sendPushReward(v);
	end

end

function ParseRewardList()
	local tempArrayCount = 0;
	local data = {};

	data['rewardList'] = {};
-- �����б�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardList'][i] = ParseReward();
	end

	return data;
end

------------------typedef KingInfo ----------------------------------
function sendPushKingInfo(data)
-- ��������
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- ����ͼ��
	networkengine:pushInt(data.icon);
-- �����漣�ȼ�
	networkengine:pushInt(data.miracle);
-- ��Ӫ
	networkengine:pushInt(data.force);
-- �ȼ�
	networkengine:pushInt(data.level);
-- ����
	networkengine:pushInt(data.intelligence);
-- ���mp
	networkengine:pushInt(data.maxMP);
-- ħ���б�
	local arrayLength = #data.magics;
	if arrayLength > 16 then arrayLength = 16 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.magics) do
		sendPushMagicInfo(v);
	end

end

function ParseKingInfo()
	local tempArrayCount = 0;
	local data = {};

	data['magics'] = {};
-- ��������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- ����ͼ��
	data['icon'] = networkengine:parseInt();
-- �����漣�ȼ�
	data['miracle'] = networkengine:parseInt();
-- ��Ӫ
	data['force'] = networkengine:parseInt();
-- �ȼ�
	data['level'] = networkengine:parseInt();
-- ����
	data['intelligence'] = networkengine:parseInt();
-- ���mp
	data['maxMP'] = networkengine:parseInt();
-- ħ���б�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['magics'][i] = ParseMagicInfo();
	end

	return data;
end

------------------typedef LadderPlayer ----------------------------------
function sendPushLadderPlayer(data)
-- ����
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- ����
	networkengine:pushInt(data.rank);
-- ͷ��
	networkengine:pushInt(data.icon);
-- �����漣�ȼ�
	networkengine:pushInt(data.miracle);
-- ��Ӧ�����id
	networkengine:pushInt(data.playerID);
-- ��Ӧ�����ս����
	networkengine:pushInt(data.playerPower);
-- ������Ϣ
	sendPushKingInfo(data.kingInfo);
-- ������Ϣ�б�
	local arrayLength = #data.units;
	if arrayLength > 21 then arrayLength = 21 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.units) do
		sendPushUnitInfo(v);
	end

-- �Ƿ��ڷ���ս����
	networkengine:pushInt(data.status);
-- Դ������
	local arrayLength = #data.primals;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.primals) do
		networkengine:pushInt(v);
	end

-- �Ӷᱣ��ʱ��
	networkengine:pushUInt64(data.plunderTime);
end

function ParseLadderPlayer()
	local tempArrayCount = 0;
	local data = {};

	data['units'] = {};
	data['primals'] = {};
-- ����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- ����
	data['rank'] = networkengine:parseInt();
-- ͷ��
	data['icon'] = networkengine:parseInt();
-- �����漣�ȼ�
	data['miracle'] = networkengine:parseInt();
-- ��Ӧ�����id
	data['playerID'] = networkengine:parseInt();
-- ��Ӧ�����ս����
	data['playerPower'] = networkengine:parseInt();
-- ������Ϣ
	data['kingInfo'] = ParseKingInfo();
-- ������Ϣ�б�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['units'][i] = ParseUnitInfo();
	end
-- �Ƿ��ڷ���ս����
	data['status'] = networkengine:parseInt();
-- Դ������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['primals'][i] = networkengine:parseInt();
	end
-- �Ӷᱣ��ʱ��
	data['plunderTime'] = networkengine:parseUInt64();

	return data;
end

------------------typedef Revenge ----------------------------------
function sendPushRevenge(data)
-- ���ݿ�ID
	networkengine:pushInt(data.dbid);
-- �Ƿ��첽
	networkengine:pushBool(data.async);
-- ���id
	networkengine:pushInt(data.enemyID);
-- �����
	networkengine:pushInt(string.len(data.enemyName));
	networkengine:pushString(data.enemyName, string.len(data.enemyName));
-- ��ҵȼ�
	networkengine:pushInt(data.enemyLevel);
-- ���ս��
	networkengine:pushInt(data.enemyPwoer);
-- ���ͼ��
	networkengine:pushInt(data.enemyIcon);
-- ��������Դ����
	networkengine:pushInt(data.primalType);
-- ���ٷ�����ʱ��
	networkengine:pushUInt64(data.time);
-- �Ƿ����¼�
	networkengine:pushBool(data.isNew);
end

function ParseRevenge()
	local tempArrayCount = 0;
	local data = {};

-- ���ݿ�ID
	data['dbid'] = networkengine:parseInt();
-- �Ƿ��첽
	data['async'] = networkengine:parseBool();
-- ���id
	data['enemyID'] = networkengine:parseInt();
-- �����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['enemyName'] = networkengine:parseString(strlength);
else
		data['enemyName'] = "";
end
-- ��ҵȼ�
	data['enemyLevel'] = networkengine:parseInt();
-- ���ս��
	data['enemyPwoer'] = networkengine:parseInt();
-- ���ͼ��
	data['enemyIcon'] = networkengine:parseInt();
-- ��������Դ����
	data['primalType'] = networkengine:parseInt();
-- ���ٷ�����ʱ��
	data['time'] = networkengine:parseUInt64();
-- �Ƿ����¼�
	data['isNew'] = networkengine:parseBool();

	return data;
end

------------------typedef TopInfo ----------------------------------
function sendPushTopInfo(data)
-- ���ID
	networkengine:pushInt(data.playerID);
-- �������
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- �÷�
	networkengine:pushInt(data.score);
-- ��ҵȼ�
	networkengine:pushInt(data.level);
-- ���ͼ��
	networkengine:pushInt(data.iconID);
-- ����漣�ȼ�
	networkengine:pushInt(data.miracle);
-- ƽ�������ȼ�
	networkengine:pushInt(data.attack);
-- ƽ�������ȼ�
	networkengine:pushInt(data.critical);
-- ��������
	networkengine:pushInt(string.len(data.unitPlan));
	networkengine:pushString(data.unitPlan, string.len(data.unitPlan));
-- ħ������
	networkengine:pushInt(string.len(data.magicPlan));
	networkengine:pushString(data.magicPlan, string.len(data.magicPlan));
-- ¼��ID
	networkengine:pushInt(data.replayID);
end

function ParseTopInfo()
	local tempArrayCount = 0;
	local data = {};

-- ���ID
	data['playerID'] = networkengine:parseInt();
-- �������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- �÷�
	data['score'] = networkengine:parseInt();
-- ��ҵȼ�
	data['level'] = networkengine:parseInt();
-- ���ͼ��
	data['iconID'] = networkengine:parseInt();
-- ����漣�ȼ�
	data['miracle'] = networkengine:parseInt();
-- ƽ�������ȼ�
	data['attack'] = networkengine:parseInt();
-- ƽ�������ȼ�
	data['critical'] = networkengine:parseInt();
-- ��������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['unitPlan'] = networkengine:parseString(strlength);
else
		data['unitPlan'] = "";
end
-- ħ������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['magicPlan'] = networkengine:parseString(strlength);
else
		data['magicPlan'] = "";
end
-- ¼��ID
	data['replayID'] = networkengine:parseInt();

	return data;
end

------------------typedef LadderPlayerSummary ----------------------------------
function sendPushLadderPlayerSummary(data)
-- ���id�������robot����Ϊ-1
	networkengine:pushInt(data.playerID);
-- ����
	networkengine:pushInt(data.rank);
-- �ȼ�
	networkengine:pushInt(data.level);
-- ����
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- ͷ��
	networkengine:pushInt(data.icon);
-- �漣�ȼ�
	networkengine:pushInt(data.miracle);
end

function ParseLadderPlayerSummary()
	local tempArrayCount = 0;
	local data = {};

-- ���id�������robot����Ϊ-1
	data['playerID'] = networkengine:parseInt();
-- ����
	data['rank'] = networkengine:parseInt();
-- �ȼ�
	data['level'] = networkengine:parseInt();
-- ����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- ͷ��
	data['icon'] = networkengine:parseInt();
-- �漣�ȼ�
	data['miracle'] = networkengine:parseInt();

	return data;
end

------------------typedef TopSummary ----------------------------------
function sendPushTopSummary(data)
-- ����
	networkengine:pushInt(data.rank);
-- ����
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- ͼ��
	networkengine:pushInt(data.iconID);
-- ����漣�ȼ�
	networkengine:pushInt(data.miracle);
-- �ȼ�
	networkengine:pushInt(data.level);
-- �÷�
	networkengine:pushInt(data.score);
-- ¼��ID
	networkengine:pushInt(data.replayID);
end

function ParseTopSummary()
	local tempArrayCount = 0;
	local data = {};

-- ����
	data['rank'] = networkengine:parseInt();
-- ����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- ͼ��
	data['iconID'] = networkengine:parseInt();
-- ����漣�ȼ�
	data['miracle'] = networkengine:parseInt();
-- �ȼ�
	data['level'] = networkengine:parseInt();
-- �÷�
	data['score'] = networkengine:parseInt();
-- ¼��ID
	data['replayID'] = networkengine:parseInt();

	return data;
end

------------------typedef ReplayInfo ----------------------------------
function sendPushReplayInfo(data)
-- ¼��id
	networkengine:pushInt(data.id);
-- ���id
	networkengine:pushInt(data.playerID);
-- ��ҵȼ�
	networkengine:pushInt(data.playerLevel);
-- �������
	networkengine:pushInt(string.len(data.playerName));
	networkengine:pushString(data.playerName, string.len(data.playerName));
-- ���ͷ��
	networkengine:pushInt(data.playerIcon);
-- ʤ��ʧ��
	networkengine:pushBool(data.win);
-- �����仯
	networkengine:pushInt(data.rankChanged);
-- ս��ʱ��
	networkengine:pushUInt64(data.battleTime);
-- �Լ��Ƿ�����ս��
	networkengine:pushBool(data.isChallenger);
end

function ParseReplayInfo()
	local tempArrayCount = 0;
	local data = {};

-- ¼��id
	data['id'] = networkengine:parseInt();
-- ���id
	data['playerID'] = networkengine:parseInt();
-- ��ҵȼ�
	data['playerLevel'] = networkengine:parseInt();
-- �������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['playerName'] = networkengine:parseString(strlength);
else
		data['playerName'] = "";
end
-- ���ͷ��
	data['playerIcon'] = networkengine:parseInt();
-- ʤ��ʧ��
	data['win'] = networkengine:parseBool();
-- �����仯
	data['rankChanged'] = networkengine:parseInt();
-- ս��ʱ��
	data['battleTime'] = networkengine:parseUInt64();
-- �Լ��Ƿ�����ս��
	data['isChallenger'] = networkengine:parseBool();

	return data;
end

------------------typedef SellItemInfo ----------------------------------
function sendPushSellItemInfo(data)
-- λ����Ϣ
	networkengine:pushInt(data.position);
-- ��Ʒ����
	networkengine:pushInt(data.itemCount);
end

function ParseSellItemInfo()
	local tempArrayCount = 0;
	local data = {};

-- λ����Ϣ
	data['position'] = networkengine:parseInt();
-- ��Ʒ����
	data['itemCount'] = networkengine:parseInt();

	return data;
end

------------------typedef ShakeRankInfo ----------------------------------
function sendPushShakeRankInfo(data)
-- ���id
	networkengine:pushInt(data.id);
-- ���icon
	networkengine:pushInt(data.icon);
-- ҡ����Ǯ��
	networkengine:pushInt64(data.money);
-- �������
	networkengine:pushInt(string.len(data.playerName));
	networkengine:pushString(data.playerName, string.len(data.playerName));
end

function ParseShakeRankInfo()
	local tempArrayCount = 0;
	local data = {};

-- ���id
	data['id'] = networkengine:parseInt();
-- ���icon
	data['icon'] = networkengine:parseInt();
-- ҡ����Ǯ��
	data['money'] = networkengine:parseInt64();
-- �������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['playerName'] = networkengine:parseString(strlength);
else
		data['playerName'] = "";
end

	return data;
end

------------------typedef GuildInfo ----------------------------------
function sendPushGuildInfo(data)
-- ����id
	networkengine:pushInt(data.id);
-- ��������
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- �᳤����
	networkengine:pushInt(string.len(data.creater));
	networkengine:pushString(data.creater, string.len(data.creater));
-- ��ҵȼ���
	networkengine:pushInt(data.allLevel);
-- ��ǰ����
	networkengine:pushInt(data.count);
end

function ParseGuildInfo()
	local tempArrayCount = 0;
	local data = {};

-- ����id
	data['id'] = networkengine:parseInt();
-- ��������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- �᳤����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['creater'] = networkengine:parseString(strlength);
else
		data['creater'] = "";
end
-- ��ҵȼ���
	data['allLevel'] = networkengine:parseInt();
-- ��ǰ����
	data['count'] = networkengine:parseInt();

	return data;
end

------------------typedef GuildMemberInfo ----------------------------------
function sendPushGuildMemberInfo(data)
-- ��ҵ�id
	networkengine:pushInt(data.id);
-- ����ǳ�
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- ͷ��id
	networkengine:pushInt(data.head);
-- ��ҵȼ�
	networkengine:pushInt(data.level);
-- vip level
	networkengine:pushInt(data.vip);
-- Ȩ��
	networkengine:pushInt(data.property);
-- ���һ������ʱ��
	networkengine:pushUInt64(data.lastOfflineTIme);
-- ��Ա���ʱ��
	networkengine:pushUInt64(data.enterTime);
-- ս���÷�
	networkengine:pushInt(data.warScore);
end

function ParseGuildMemberInfo()
	local tempArrayCount = 0;
	local data = {};

-- ��ҵ�id
	data['id'] = networkengine:parseInt();
-- ����ǳ�
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- ͷ��id
	data['head'] = networkengine:parseInt();
-- ��ҵȼ�
	data['level'] = networkengine:parseInt();
-- vip level
	data['vip'] = networkengine:parseInt();
-- Ȩ��
	data['property'] = networkengine:parseInt();
-- ���һ������ʱ��
	data['lastOfflineTIme'] = networkengine:parseUInt64();
-- ��Ա���ʱ��
	data['enterTime'] = networkengine:parseUInt64();
-- ս���÷�
	data['warScore'] = networkengine:parseInt();

	return data;
end

------------------typedef GuildApplicantInfo ----------------------------------
function sendPushGuildApplicantInfo(data)
-- �������id
	networkengine:pushInt(data.id);
-- ����ǳ�
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- ͷ��id
	networkengine:pushInt(data.head);
-- ���vip
	networkengine:pushInt(data.vip);
-- ��ҵȼ�
	networkengine:pushInt(data.level);
end

function ParseGuildApplicantInfo()
	local tempArrayCount = 0;
	local data = {};

-- �������id
	data['id'] = networkengine:parseInt();
-- ����ǳ�
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- ͷ��id
	data['head'] = networkengine:parseInt();
-- ���vip
	data['vip'] = networkengine:parseInt();
-- ��ҵȼ�
	data['level'] = networkengine:parseInt();

	return data;
end

------------------typedef GuildWarPlanInfo ----------------------------------
function sendPushGuildWarPlanInfo(data)
-- ��ǰ��״̬,�ɹ���,�Ѿ�����...
	networkengine:pushInt(data.status);
-- ����id
	networkengine:pushInt(data.id);
-- ��������
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- �������
	networkengine:pushInt(data.inspireCount);
end

function ParseGuildWarPlanInfo()
	local tempArrayCount = 0;
	local data = {};

-- ��ǰ��״̬,�ɹ���,�Ѿ�����...
	data['status'] = networkengine:parseInt();
-- ����id
	data['id'] = networkengine:parseInt();
-- ��������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- �������
	data['inspireCount'] = networkengine:parseInt();

	return data;
end

------------------typedef GuildWarRankInfo ----------------------------------
function sendPushGuildWarRankInfo(data)
-- ����id
	networkengine:pushInt(data.id);
-- ��������
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- �᳤ͷ��
	networkengine:pushInt(data.createrHead);
-- ��ǰ����
	networkengine:pushInt(data.warScore);
end

function ParseGuildWarRankInfo()
	local tempArrayCount = 0;
	local data = {};

-- ����id
	data['id'] = networkengine:parseInt();
-- ��������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- �᳤ͷ��
	data['createrHead'] = networkengine:parseInt();
-- ��ǰ����
	data['warScore'] = networkengine:parseInt();

	return data;
end

------------------typedef ShipAttrBase ----------------------------------
function sendPushShipAttrBase(data)
-- �����ȼ�
	networkengine:pushInt(data.attack);
-- �����ȼ�
	networkengine:pushInt(data.defence);
-- �����ȼ�
	networkengine:pushInt(data.critical);
-- ���Եȼ�
	networkengine:pushInt(data.resilience);
end

function ParseShipAttrBase()
	local tempArrayCount = 0;
	local data = {};

-- �����ȼ�
	data['attack'] = networkengine:parseInt();
-- �����ȼ�
	data['defence'] = networkengine:parseInt();
-- �����ȼ�
	data['critical'] = networkengine:parseInt();
-- ���Եȼ�
	data['resilience'] = networkengine:parseInt();

	return data;
end

------------------typedef ShipAttrRatio ----------------------------------
function sendPushShipAttrRatio(data)
-- �����ȼ�
	networkengine:pushInt(data.attack);
-- �����ȼ�
	networkengine:pushInt(data.defence);
-- �����ȼ�
	networkengine:pushInt(data.critical);
-- ���Եȼ�
	networkengine:pushInt(data.resilience);
end

function ParseShipAttrRatio()
	local tempArrayCount = 0;
	local data = {};

-- �����ȼ�
	data['attack'] = networkengine:parseInt();
-- �����ȼ�
	data['defence'] = networkengine:parseInt();
-- �����ȼ�
	data['critical'] = networkengine:parseInt();
-- ���Եȼ�
	data['resilience'] = networkengine:parseInt();

	return data;
end

------------------typedef MagicAchievement ----------------------------------
function sendPushMagicAchievement(data)
-- ϵͳ����-��������7-����ħ���ﵽ4��
	networkengine:pushInt(data.condition);
-- ϵͳ����-��������7-����ħ���ﵽ4��
	networkengine:pushInt(string.len(data.notify));
	networkengine:pushString(data.notify, string.len(data.notify));
end

function ParseMagicAchievement()
	local tempArrayCount = 0;
	local data = {};

-- ϵͳ����-��������7-����ħ���ﵽ4��
	data['condition'] = networkengine:parseInt();
-- ϵͳ����-��������7-����ħ���ﵽ4��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['notify'] = networkengine:parseString(strlength);
else
		data['notify'] = "";
end

	return data;
end

------------------typedef CardAchievement ----------------------------------
function sendPushCardAchievement(data)
-- ϵͳ����-��������5-������Ŵﵽ4��
	networkengine:pushInt(data.condition);
-- ϵͳ����-��������5-������Ŵﵽ4��
	networkengine:pushInt(string.len(data.notify));
	networkengine:pushString(data.notify, string.len(data.notify));
end

function ParseCardAchievement()
	local tempArrayCount = 0;
	local data = {};

-- ϵͳ����-��������5-������Ŵﵽ4��
	data['condition'] = networkengine:parseInt();
-- ϵͳ����-��������5-������Ŵﵽ4��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['notify'] = networkengine:parseString(strlength);
else
		data['notify'] = "";
end

	return data;
end

------------------typedef PvpOfflineCombo ----------------------------------
function sendPushPvpOfflineCombo(data)
-- ϵͳ����-��������1-������ʤ8��
	networkengine:pushInt(data.condition);
-- ϵͳ����-��������1-������ʤ8��
	networkengine:pushInt(string.len(data.notify));
	networkengine:pushString(data.notify, string.len(data.notify));
end

function ParsePvpOfflineCombo()
	local tempArrayCount = 0;
	local data = {};

-- ϵͳ����-��������1-������ʤ8��
	data['condition'] = networkengine:parseInt();
-- ϵͳ����-��������1-������ʤ8��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['notify'] = networkengine:parseString(strlength);
else
		data['notify'] = "";
end

	return data;
end

------------------typedef ChapterRewardList ----------------------------------
function sendPushChapterRewardList(data)
-- ��ͨģʽ������������
	local arrayLength = #data.type;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.type) do
		networkengine:pushInt(v);
	end

-- ��ͨģʽ��������ID
	local arrayLength = #data.id;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.id) do
		networkengine:pushInt(v);
	end

-- ��ͨģʽ������������
	local arrayLength = #data.count;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.count) do
		networkengine:pushInt(v);
	end

end

function ParseChapterRewardList()
	local tempArrayCount = 0;
	local data = {};

	data['type'] = {};
	data['id'] = {};
	data['count'] = {};
-- ��ͨģʽ������������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['type'][i] = networkengine:parseInt();
	end
-- ��ͨģʽ��������ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['id'][i] = networkengine:parseInt();
	end
-- ��ͨģʽ������������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['count'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef InitialMeditation ----------------------------------
function sendPushInitialMeditation(data)
-- �鿨��ħ����-��һ�γ鿨ħ�������Χ
	local arrayLength = #data.randomRange;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.randomRange) do
		networkengine:pushInt(v);
	end

-- �鿨��ħ����-��һ�γ鿨���ħ�����Ǽ�
	networkengine:pushInt(data.starLevel);
end

function ParseInitialMeditation()
	local tempArrayCount = 0;
	local data = {};

	data['randomRange'] = {};
-- �鿨��ħ����-��һ�γ鿨ħ�������Χ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['randomRange'][i] = networkengine:parseInt();
	end
-- �鿨��ħ����-��һ�γ鿨���ħ�����Ǽ�
	data['starLevel'] = networkengine:parseInt();

	return data;
end

------------------typedef RowBuild ----------------------------------
function sendPushRowBuild(data)
-- �����ȼ�
	networkengine:pushInt(data.id);
-- ��������ľ��
	networkengine:pushInt(data.lumberCost);
-- ����ʱ��
	networkengine:pushInt(data.timeCost);
-- �ṩ������
	networkengine:pushInt(data.hammer);
-- ����ʱ��Ҫ�����صȼ�
	networkengine:pushInt(data.levelLimit);
-- ����һ������Ӣ�۵ȼ�
	networkengine:pushInt(data.heroLevel);
-- ����һ����Ҫ������
	networkengine:pushInt(data.hammerRequire);
end

function ParseRowBuild()
	local tempArrayCount = 0;
	local data = {};

-- �����ȼ�
	data['id'] = networkengine:parseInt();
-- ��������ľ��
	data['lumberCost'] = networkengine:parseInt();
-- ����ʱ��
	data['timeCost'] = networkengine:parseInt();
-- �ṩ������
	data['hammer'] = networkengine:parseInt();
-- ����ʱ��Ҫ�����صȼ�
	data['levelLimit'] = networkengine:parseInt();
-- ����һ������Ӣ�۵ȼ�
	data['heroLevel'] = networkengine:parseInt();
-- ����һ����Ҫ������
	data['hammerRequire'] = networkengine:parseInt();

	return data;
end

------------------typedef InitialDraw ----------------------------------
function sendPushInitialDraw(data)
-- �鿨�����ţ�-��һ�γ鿨������ID�����Χ
	local arrayLength = #data.randomRange;
	if arrayLength > 16 then arrayLength = 16 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.randomRange) do
		networkengine:pushInt(v);
	end

-- �鿨�����ţ�-��һ�γ鿨��þ��ŵ��Ǽ�
	networkengine:pushInt(data.starLevel);
end

function ParseInitialDraw()
	local tempArrayCount = 0;
	local data = {};

	data['randomRange'] = {};
-- �鿨�����ţ�-��һ�γ鿨������ID�����Χ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['randomRange'][i] = networkengine:parseInt();
	end
-- �鿨�����ţ�-��һ�γ鿨��þ��ŵ��Ǽ�
	data['starLevel'] = networkengine:parseInt();

	return data;
end

------------------typedef Adventure ----------------------------------
function sendPushAdventure(data)
-- ��ͼ-��ͨģʽ��������
	networkengine:pushInt(data.cost);
-- ��ͼ-��ͨģʽʧ����������
	networkengine:pushInt(data.failCost);
-- ��ͼ-��ͨģʽʤ����þ���
	networkengine:pushInt(data.exp);
-- ��ͼ-��ͨģʽʧ�ܻ�þ���
	networkengine:pushInt(data.failExp);
end

function ParseAdventure()
	local tempArrayCount = 0;
	local data = {};

-- ��ͼ-��ͨģʽ��������
	data['cost'] = networkengine:parseInt();
-- ��ͼ-��ͨģʽʧ����������
	data['failCost'] = networkengine:parseInt();
-- ��ͼ-��ͨģʽʤ����þ���
	data['exp'] = networkengine:parseInt();
-- ��ͼ-��ͨģʽʧ�ܻ�þ���
	data['failExp'] = networkengine:parseInt();

	return data;
end

------------------typedef Limit ----------------------------------
function sendPushLimit(data)
-- ��ͨģʽ�ؿ�ID
	networkengine:pushInt(data.stageID);
-- ��ͨģʽ�ȼ�����
	networkengine:pushInt(data.level);
-- ��ͨģʽ��������
	networkengine:pushInt(data.count);
end

function ParseLimit()
	local tempArrayCount = 0;
	local data = {};

-- ��ͨģʽ�ؿ�ID
	data['stageID'] = networkengine:parseInt();
-- ��ͨģʽ�ȼ�����
	data['level'] = networkengine:parseInt();
-- ��ͨģʽ��������
	data['count'] = networkengine:parseInt();

	return data;
end

------------------typedef RowGuildWarPer ----------------------------------
function sendPushRowGuildWarPer(data)
-- id
	networkengine:pushInt(data.id);
-- ��ǿϵ��
	networkengine:pushInt(data.personalRat);
end

function ParseRowGuildWarPer()
	local tempArrayCount = 0;
	local data = {};

-- id
	data['id'] = networkengine:parseInt();
-- ��ǿϵ��
	data['personalRat'] = networkengine:parseInt();

	return data;
end

------------------typedef RowGuildWarRank ----------------------------------
function sendPushRowGuildWarRank(data)
-- id
	networkengine:pushInt(data.id);
-- ����
	networkengine:pushInt(data.rank);
-- �صý�������
	local arrayLength = #data.rewardType;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- �صý���ID
	local arrayLength = #data.rewardID;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- �صý�������
	local arrayLength = #data.rewardCount;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

end

function ParseRowGuildWarRank()
	local tempArrayCount = 0;
	local data = {};

	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
-- id
	data['id'] = networkengine:parseInt();
-- ����
	data['rank'] = networkengine:parseInt();
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- �صý���ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RowGuildWar ----------------------------------
function sendPushRowGuildWar(data)
-- �ݵ�ID
	networkengine:pushInt(data.id);
-- �ݵ�����
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- �״�ƥ������
	networkengine:pushInt(data.gwRankMatch);
-- ��ǿϵ��
	local arrayLength = #data.gwDefRat;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.gwDefRat) do
		networkengine:pushFloat(v);
	end

-- ���ָ���
	local arrayLength = #data.gwScore;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.gwScore) do
		networkengine:pushInt(v);
	end

-- �ݵ㽱������
	local arrayLength = #data.rewardType;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- �ݵ㽱��ID
	local arrayLength = #data.rewardID;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- �ݵ㽱������
	local arrayLength = #data.rewardCount;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

-- Ĭ�Ͼݵ���������
	networkengine:pushInt(data.defaultNum);
end

function ParseRowGuildWar()
	local tempArrayCount = 0;
	local data = {};

	data['gwDefRat'] = {};
	data['gwScore'] = {};
	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
-- �ݵ�ID
	data['id'] = networkengine:parseInt();
-- �ݵ�����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- �״�ƥ������
	data['gwRankMatch'] = networkengine:parseInt();
-- ��ǿϵ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['gwDefRat'][i] = networkengine:parseFloat();
	end
-- ���ָ���
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['gwScore'][i] = networkengine:parseInt();
	end
-- �ݵ㽱������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- �ݵ㽱��ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- �ݵ㽱������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end
-- Ĭ�Ͼݵ���������
	data['defaultNum'] = networkengine:parseInt();

	return data;
end

------------------typedef RowRedEnvelope ----------------------------------
function sendPushRowRedEnvelope(data)
-- id
	networkengine:pushInt(data.id);
-- ����ʱ��
	networkengine:pushInt(string.len(data.openTime));
	networkengine:pushString(data.openTime, string.len(data.openTime));
-- �ر�ʱ��
	networkengine:pushInt(string.len(data.closeTime));
	networkengine:pushString(data.closeTime, string.len(data.closeTime));
-- ��ҡ������
	networkengine:pushInt(data.lotteryNum);
-- ʱ�η�������Ӵ���
	networkengine:pushInt(data.lotteryAddNum);
-- ��������
	local arrayLength = #data.moneyNum;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.moneyNum) do
		networkengine:pushFloat(v);
	end

-- �齱��ý��
	local arrayLength = #data.giftTypeId;
	if arrayLength > 32 then arrayLength = 32 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.giftTypeId) do
		networkengine:pushFloat(v);
	end

-- �齱���Ͷ�Ӧ����
	local arrayLength = #data.giftTypeChance;
	if arrayLength > 32 then arrayLength = 32 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.giftTypeChance) do
		networkengine:pushInt(v);
	end

end

function ParseRowRedEnvelope()
	local tempArrayCount = 0;
	local data = {};

	data['moneyNum'] = {};
	data['giftTypeId'] = {};
	data['giftTypeChance'] = {};
-- id
	data['id'] = networkengine:parseInt();
-- ����ʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['openTime'] = networkengine:parseString(strlength);
else
		data['openTime'] = "";
end
-- �ر�ʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['closeTime'] = networkengine:parseString(strlength);
else
		data['closeTime'] = "";
end
-- ��ҡ������
	data['lotteryNum'] = networkengine:parseInt();
-- ʱ�η�������Ӵ���
	data['lotteryAddNum'] = networkengine:parseInt();
-- ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['moneyNum'][i] = networkengine:parseFloat();
	end
-- �齱��ý��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['giftTypeId'][i] = networkengine:parseFloat();
	end
-- �齱���Ͷ�Ӧ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['giftTypeChance'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RowMiracle ----------------------------------
function sendPushRowMiracle(data)
-- �漣�ȼ�
	networkengine:pushInt(data.id);
-- �����¼���������Ǽ�
	networkengine:pushInt(data.starCount);
-- �����¼�����������
	networkengine:pushInt(data.goldCost);
-- �����¼�����ľ������
	networkengine:pushInt(data.lumberCost);
-- ShipAttrRatio
	local arrayLength = #data.shipAttrRatio;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.shipAttrRatio) do
		sendPushShipAttrRatio(v);
	end

-- �˿�
	networkengine:pushInt(data.soldier);
end

function ParseRowMiracle()
	local tempArrayCount = 0;
	local data = {};

	data['shipAttrRatio'] = {};
-- �漣�ȼ�
	data['id'] = networkengine:parseInt();
-- �����¼���������Ǽ�
	data['starCount'] = networkengine:parseInt();
-- �����¼�����������
	data['goldCost'] = networkengine:parseInt();
-- �����¼�����ľ������
	data['lumberCost'] = networkengine:parseInt();
-- ShipAttrRatio
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['shipAttrRatio'][i] = ParseShipAttrRatio();
	end
-- �˿�
	data['soldier'] = networkengine:parseInt();

	return data;
end

------------------typedef RowContinuousSignIn ----------------------------------
function sendPushRowContinuousSignIn(data)
-- ����ǩ��
	networkengine:pushInt(data.id);
-- ����ǩ����������
	local arrayLength = #data.rewardType;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- ����ǩ������ID
	local arrayLength = #data.rewardID;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- ����ǩ����������
	local arrayLength = #data.rewardCount;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

end

function ParseRowContinuousSignIn()
	local tempArrayCount = 0;
	local data = {};

	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
-- ����ǩ��
	data['id'] = networkengine:parseInt();
-- ����ǩ����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- ����ǩ������ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- ����ǩ����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RowFirstSignIn ----------------------------------
function sendPushRowFirstSignIn(data)
-- �״�ǩ��
	networkengine:pushInt(data.id);
-- �״�ǩ����������
	local arrayLength = #data.rewardType;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- �״�ǩ������ID
	local arrayLength = #data.rewardID;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- �״�ǩ����������
	local arrayLength = #data.rewardCount;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

end

function ParseRowFirstSignIn()
	local tempArrayCount = 0;
	local data = {};

	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
-- �״�ǩ��
	data['id'] = networkengine:parseInt();
-- �״�ǩ����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- �״�ǩ������ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- �״�ǩ����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RowSignIn ----------------------------------
function sendPushRowSignIn(data)
-- ǩ������
	networkengine:pushInt(data.id);
-- ǩ����������
	local arrayLength = #data.rewardType;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- ǩ������ID
	local arrayLength = #data.rewardID;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- ǩ����������
	local arrayLength = #data.rewardCount;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

end

function ParseRowSignIn()
	local tempArrayCount = 0;
	local data = {};

	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
-- ǩ������
	data['id'] = networkengine:parseInt();
-- ǩ����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- ǩ������ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- ǩ����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RowGift ----------------------------------
function sendPushRowGift(data)
-- ���
	networkengine:pushInt(data.id);
-- ����
	networkengine:pushInt(data.groupID);
-- �صý�������
	local arrayLength = #data.rewardType;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- �صý���ID
	local arrayLength = #data.rewardID;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- �صý�������
	local arrayLength = #data.rewardCount;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

-- ���ظ���ȡ
	networkengine:pushBool(data.isRepeatable);
end

function ParseRowGift()
	local tempArrayCount = 0;
	local data = {};

	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
-- ���
	data['id'] = networkengine:parseInt();
-- ����
	data['groupID'] = networkengine:parseInt();
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- �صý���ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end
-- ���ظ���ȡ
	data['isRepeatable'] = networkengine:parseBool();

	return data;
end

------------------typedef RowPlunder ----------------------------------
function sendPushRowPlunder(data)
-- ���
	networkengine:pushInt(data.id);
-- ���Ѷȹؿ�
	networkengine:pushInt(data.hard);
-- ���Ѷȹؿ�
	networkengine:pushInt(data.medium);
-- ���Ѷȹؿ�
	networkengine:pushInt(data.easy);
end

function ParseRowPlunder()
	local tempArrayCount = 0;
	local data = {};

-- ���
	data['id'] = networkengine:parseInt();
-- ���Ѷȹؿ�
	data['hard'] = networkengine:parseInt();
-- ���Ѷȹؿ�
	data['medium'] = networkengine:parseInt();
-- ���Ѷȹؿ�
	data['easy'] = networkengine:parseInt();

	return data;
end

------------------typedef RowCrusadeLevel ----------------------------------
function sendPushRowCrusadeLevel(data)
-- Զ���ؿ�ID
	networkengine:pushInt(data.id);
-- Զ��-ƥ������
	networkengine:pushInt(data.crusadeRankMatch);
-- Զ��-�ؿ��б�
	networkengine:pushInt(data.crusadeStage);
-- Զ��-ƥ���Ǽ�
	networkengine:pushInt(data.crusadeStarMatch);
end

function ParseRowCrusadeLevel()
	local tempArrayCount = 0;
	local data = {};

-- Զ���ؿ�ID
	data['id'] = networkengine:parseInt();
-- Զ��-ƥ������
	data['crusadeRankMatch'] = networkengine:parseInt();
-- Զ��-�ؿ��б�
	data['crusadeStage'] = networkengine:parseInt();
-- Զ��-ƥ���Ǽ�
	data['crusadeStarMatch'] = networkengine:parseInt();

	return data;
end

------------------typedef RowChallengeStage ----------------------------------
function sendPushRowChallengeStage(data)
-- ������ս�ؿ�ID
	networkengine:pushInt(data.id);
-- ������ս-��ͨ����
	networkengine:pushInt(data.normal);
-- ������ս-ج�θ���
	networkengine:pushInt(data.elite);
-- ������ս-��������
	networkengine:pushInt(data.hall);
-- ������ս-�ȼ�����
	networkengine:pushInt(data.levelLimit);
end

function ParseRowChallengeStage()
	local tempArrayCount = 0;
	local data = {};

-- ������ս�ؿ�ID
	data['id'] = networkengine:parseInt();
-- ������ս-��ͨ����
	data['normal'] = networkengine:parseInt();
-- ������ս-ج�θ���
	data['elite'] = networkengine:parseInt();
-- ������ս-��������
	data['hall'] = networkengine:parseInt();
-- ������ս-�ȼ�����
	data['levelLimit'] = networkengine:parseInt();

	return data;
end

------------------typedef RowIdolStatue ----------------------------------
function sendPushRowIdolStatue(data)
-- ����ȼ�
	networkengine:pushInt(data.id);
-- �����¼����������
	networkengine:pushInt(data.retuireItemCount);
-- �����¼���������
	networkengine:pushInt(data.goldCost);
-- �����¼�����ľ����
	networkengine:pushInt(data.lumberCost);
-- �˿�
	networkengine:pushInt(data.soldier);
-- ShipAttrBase
	local arrayLength = #data.shipAttrBase;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.shipAttrBase) do
		sendPushShipAttrBase(v);
	end

end

function ParseRowIdolStatue()
	local tempArrayCount = 0;
	local data = {};

	data['shipAttrBase'] = {};
-- ����ȼ�
	data['id'] = networkengine:parseInt();
-- �����¼����������
	data['retuireItemCount'] = networkengine:parseInt();
-- �����¼���������
	data['goldCost'] = networkengine:parseInt();
-- �����¼�����ľ����
	data['lumberCost'] = networkengine:parseInt();
-- �˿�
	data['soldier'] = networkengine:parseInt();
-- ShipAttrBase
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['shipAttrBase'][i] = ParseShipAttrBase();
	end

	return data;
end

------------------typedef RowCrusadeReward ----------------------------------
function sendPushRowCrusadeReward(data)
-- id
	networkengine:pushInt(data.id);
-- ս����
	networkengine:pushInt(data.power);
-- ����ϵ��
	networkengine:pushFloat(data.ratio);
end

function ParseRowCrusadeReward()
	local tempArrayCount = 0;
	local data = {};

-- id
	data['id'] = networkengine:parseInt();
-- ս����
	data['power'] = networkengine:parseInt();
-- ����ϵ��
	data['ratio'] = networkengine:parseFloat();

	return data;
end

------------------typedef RowSysNotify ----------------------------------
function sendPushRowSysNotify(data)
-- ������
	networkengine:pushInt(data.id);
-- PvpOfflineCombo
	local arrayLength = #data.pvpOfflineCombo;
	if arrayLength > 3 then arrayLength = 3 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.pvpOfflineCombo) do
		sendPushPvpOfflineCombo(v);
	end

-- ϵͳ����-��������4-������ʤ�����δﵽ5
	networkengine:pushInt(data.pvpOnlineComboCondition);
-- ϵͳ����-��������4-������ʤ�����δﵽ5
	networkengine:pushInt(string.len(data.pvpOnlineComboNotify));
	networkengine:pushString(data.pvpOnlineComboNotify, string.len(data.pvpOnlineComboNotify));
-- CardAchievement
	local arrayLength = #data.cardAchievement;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.cardAchievement) do
		sendPushCardAchievement(v);
	end

-- MagicAchievement
	local arrayLength = #data.magicAchievement;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.magicAchievement) do
		sendPushMagicAchievement(v);
	end

-- ϵͳ����-��������9-������ս���а����ǰ10
	networkengine:pushInt(data.challengeSpeedCondition);
-- ϵͳ����-��������9-������ս���а����ǰ10
	networkengine:pushInt(string.len(data.challengeSpeedNotify));
	networkengine:pushString(data.challengeSpeedNotify, string.len(data.challengeSpeedNotify));
-- ϵͳ����-��������10-�˺����а����ǰ10��
	networkengine:pushInt(data.challengeDamageRankCondition);
-- ϵͳ����-��������10-�˺����а����ǰ10��
	networkengine:pushInt(string.len(data.challengeDamageRankNotify));
	networkengine:pushString(data.challengeDamageRankNotify, string.len(data.challengeDamageRankNotify));
-- ϵͳ����-��������11-�������а����ǰ10��
	networkengine:pushInt(data.pvpOfflineRankCondition);
-- ϵͳ����-��������11-�������а����ǰ10��
	networkengine:pushInt(string.len(data.pvpOfflineRankNotify));
	networkengine:pushString(data.pvpOfflineRankNotify, string.len(data.pvpOfflineRankNotify));
-- ϵͳ����-��������12-ͬ��PVP����ʱ��1
	networkengine:pushInt(string.len(data.pvpOnlineNotify));
	networkengine:pushString(data.pvpOnlineNotify, string.len(data.pvpOnlineNotify));
-- ϵͳ����-�㱻�˼�������
	networkengine:pushInt(string.len(data.plunderByAnohter));
	networkengine:pushString(data.plunderByAnohter, string.len(data.plunderByAnohter));
-- ϵͳ����-Զ�����ȫ���˹�
	networkengine:pushInt(string.len(data.crusadeNotify));
	networkengine:pushString(data.crusadeNotify, string.len(data.crusadeNotify));
-- ϵͳ����-ҡ�������
	networkengine:pushInt(string.len(data.redEnvelopeNotify));
	networkengine:pushString(data.redEnvelopeNotify, string.len(data.redEnvelopeNotify));
-- ϵͳ����-���ƾݵ�
	networkengine:pushInt(string.len(data.guildWarBreak));
	networkengine:pushString(data.guildWarBreak, string.len(data.guildWarBreak));
-- �ַ������ػ���
	networkengine:pushInt(string.len(data.guildWarNPCName));
	networkengine:pushString(data.guildWarNPCName, string.len(data.guildWarNPCName));
-- �ַ���-��ʾ-�ӳ�����ݵ�
	networkengine:pushInt(string.len(data.guildWarInspireDefMsg));
	networkengine:pushString(data.guildWarInspireDefMsg, string.len(data.guildWarInspireDefMsg));
-- �ַ���-��ʾ-��Ա��������
	networkengine:pushInt(string.len(data.guildWarInspireAttMsg));
	networkengine:pushString(data.guildWarInspireAttMsg, string.len(data.guildWarInspireAttMsg));
-- �ַ���-��ʾ-���빫��
	networkengine:pushInt(string.len(data.guildEnterAMsg));
	networkengine:pushString(data.guildEnterAMsg, string.len(data.guildEnterAMsg));
-- �ַ���-��ʾ-�뿪����
	networkengine:pushInt(string.len(data.guildLeaveAMsg));
	networkengine:pushString(data.guildLeaveAMsg, string.len(data.guildLeaveAMsg));
-- �ַ���-��ʾ-�޸�Ȩ�� xx��xx����Ϊxx
	networkengine:pushInt(string.len(data.guildChangePower));
	networkengine:pushString(data.guildChangePower, string.len(data.guildChangePower));
end

function ParseRowSysNotify()
	local tempArrayCount = 0;
	local data = {};

	data['pvpOfflineCombo'] = {};
	data['cardAchievement'] = {};
	data['magicAchievement'] = {};
-- ������
	data['id'] = networkengine:parseInt();
-- PvpOfflineCombo
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['pvpOfflineCombo'][i] = ParsePvpOfflineCombo();
	end
-- ϵͳ����-��������4-������ʤ�����δﵽ5
	data['pvpOnlineComboCondition'] = networkengine:parseInt();
-- ϵͳ����-��������4-������ʤ�����δﵽ5
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['pvpOnlineComboNotify'] = networkengine:parseString(strlength);
else
		data['pvpOnlineComboNotify'] = "";
end
-- CardAchievement
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['cardAchievement'][i] = ParseCardAchievement();
	end
-- MagicAchievement
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['magicAchievement'][i] = ParseMagicAchievement();
	end
-- ϵͳ����-��������9-������ս���а����ǰ10
	data['challengeSpeedCondition'] = networkengine:parseInt();
-- ϵͳ����-��������9-������ս���а����ǰ10
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['challengeSpeedNotify'] = networkengine:parseString(strlength);
else
		data['challengeSpeedNotify'] = "";
end
-- ϵͳ����-��������10-�˺����а����ǰ10��
	data['challengeDamageRankCondition'] = networkengine:parseInt();
-- ϵͳ����-��������10-�˺����а����ǰ10��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['challengeDamageRankNotify'] = networkengine:parseString(strlength);
else
		data['challengeDamageRankNotify'] = "";
end
-- ϵͳ����-��������11-�������а����ǰ10��
	data['pvpOfflineRankCondition'] = networkengine:parseInt();
-- ϵͳ����-��������11-�������а����ǰ10��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['pvpOfflineRankNotify'] = networkengine:parseString(strlength);
else
		data['pvpOfflineRankNotify'] = "";
end
-- ϵͳ����-��������12-ͬ��PVP����ʱ��1
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['pvpOnlineNotify'] = networkengine:parseString(strlength);
else
		data['pvpOnlineNotify'] = "";
end
-- ϵͳ����-�㱻�˼�������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['plunderByAnohter'] = networkengine:parseString(strlength);
else
		data['plunderByAnohter'] = "";
end
-- ϵͳ����-Զ�����ȫ���˹�
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['crusadeNotify'] = networkengine:parseString(strlength);
else
		data['crusadeNotify'] = "";
end
-- ϵͳ����-ҡ�������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['redEnvelopeNotify'] = networkengine:parseString(strlength);
else
		data['redEnvelopeNotify'] = "";
end
-- ϵͳ����-���ƾݵ�
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['guildWarBreak'] = networkengine:parseString(strlength);
else
		data['guildWarBreak'] = "";
end
-- �ַ������ػ���
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['guildWarNPCName'] = networkengine:parseString(strlength);
else
		data['guildWarNPCName'] = "";
end
-- �ַ���-��ʾ-�ӳ�����ݵ�
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['guildWarInspireDefMsg'] = networkengine:parseString(strlength);
else
		data['guildWarInspireDefMsg'] = "";
end
-- �ַ���-��ʾ-��Ա��������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['guildWarInspireAttMsg'] = networkengine:parseString(strlength);
else
		data['guildWarInspireAttMsg'] = "";
end
-- �ַ���-��ʾ-���빫��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['guildEnterAMsg'] = networkengine:parseString(strlength);
else
		data['guildEnterAMsg'] = "";
end
-- �ַ���-��ʾ-�뿪����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['guildLeaveAMsg'] = networkengine:parseString(strlength);
else
		data['guildLeaveAMsg'] = "";
end
-- �ַ���-��ʾ-�޸�Ȩ�� xx��xx����Ϊxx
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['guildChangePower'] = networkengine:parseString(strlength);
else
		data['guildChangePower'] = "";
end

	return data;
end

------------------typedef RowLimitActivity ----------------------------------
function sendPushRowLimitActivity(data)
-- id
	networkengine:pushInt(data.id);
-- ��������
	local arrayLength = #data.rewardType;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- ����ID
	local arrayLength = #data.rewardID;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- ��������
	local arrayLength = #data.rewardCount;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

-- ��ʱ����ö��
	networkengine:pushInt(data.limitActivityTime);
-- ��ʼʱ��
	local arrayLength = #data.beginTime;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.beginTime) do
		networkengine:pushInt(v);
	end

-- ����ʱ��
	local arrayLength = #data.endTime;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.endTime) do
		networkengine:pushInt(v);
	end

-- �콱����ö��
	networkengine:pushInt(data.limitActivityCondition);
-- �콱��������
	local arrayLength = #data.params;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.params) do
		networkengine:pushInt(v);
	end

-- ÿ������������
	networkengine:pushInt(data.amount);
-- �ʼ�ID
	networkengine:pushInt(data.mailID);
end

function ParseRowLimitActivity()
	local tempArrayCount = 0;
	local data = {};

	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
	data['beginTime'] = {};
	data['endTime'] = {};
	data['params'] = {};
-- id
	data['id'] = networkengine:parseInt();
-- ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- ����ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end
-- ��ʱ����ö��
	data['limitActivityTime'] = networkengine:parseInt();
-- ��ʼʱ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['beginTime'][i] = networkengine:parseInt();
	end
-- ����ʱ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['endTime'][i] = networkengine:parseInt();
	end
-- �콱����ö��
	data['limitActivityCondition'] = networkengine:parseInt();
-- �콱��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['params'][i] = networkengine:parseInt();
	end
-- ÿ������������
	data['amount'] = networkengine:parseInt();
-- �ʼ�ID
	data['mailID'] = networkengine:parseInt();

	return data;
end

------------------typedef RowGuide ----------------------------------
function sendPushRowGuide(data)
-- ID
	networkengine:pushInt(data.id);
-- Ĭ�ϼ���
	networkengine:pushBool(data.active);
end

function ParseRowGuide()
	local tempArrayCount = 0;
	local data = {};

-- ID
	data['id'] = networkengine:parseInt();
-- Ĭ�ϼ���
	data['active'] = networkengine:parseBool();

	return data;
end

------------------typedef RowRecharge ----------------------------------
function sendPushRowRecharge(data)
-- ���
	networkengine:pushInt(data.id);
-- ����
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- ����
	networkengine:pushInt(data.type);
-- iosID
	networkengine:pushInt(string.len(data.iosid));
	networkengine:pushString(data.iosid, string.len(data.iosid));
-- �۸�Ԫ��
	networkengine:pushInt(data.rmb);
-- ��ʯ����
	networkengine:pushInt(data.diamond);
-- ��ƷID
	networkengine:pushInt(data.itemID);
end

function ParseRowRecharge()
	local tempArrayCount = 0;
	local data = {};

-- ���
	data['id'] = networkengine:parseInt();
-- ����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- ����
	data['type'] = networkengine:parseInt();
-- iosID
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['iosid'] = networkengine:parseString(strlength);
else
		data['iosid'] = "";
end
-- �۸�Ԫ��
	data['rmb'] = networkengine:parseInt();
-- ��ʯ����
	data['diamond'] = networkengine:parseInt();
-- ��ƷID
	data['itemID'] = networkengine:parseInt();

	return data;
end

------------------typedef RowRemould ----------------------------------
function sendPushRowRemould(data)
-- ս���ȼ�
	networkengine:pushInt(data.id);
-- ����������Ʒ
	local arrayLength = #data.requireItem;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.requireItem) do
		networkengine:pushInt(v);
	end

-- ������Ʒ����
	local arrayLength = #data.retuireItemCount;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.retuireItemCount) do
		networkengine:pushInt(v);
	end

-- �˿�����
	networkengine:pushInt(data.soldier);
end

function ParseRowRemould()
	local tempArrayCount = 0;
	local data = {};

	data['requireItem'] = {};
	data['retuireItemCount'] = {};
-- ս���ȼ�
	data['id'] = networkengine:parseInt();
-- ����������Ʒ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['requireItem'][i] = networkengine:parseInt();
	end
-- ������Ʒ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['retuireItemCount'][i] = networkengine:parseInt();
	end
-- �˿�����
	data['soldier'] = networkengine:parseInt();

	return data;
end

------------------typedef RowMagicRound ----------------------------------
function sendPushRowMagicRound(data)
-- �����ܺ�
	networkengine:pushInt(data.id);
-- ħ��׼���غ�
	networkengine:pushInt(data.round);
end

function ParseRowMagicRound()
	local tempArrayCount = 0;
	local data = {};

-- �����ܺ�
	data['id'] = networkengine:parseInt();
-- ħ��׼���غ�
	data['round'] = networkengine:parseInt();

	return data;
end

------------------typedef RowStrengthen ----------------------------------
function sendPushRowStrengthen(data)
-- ǿ���ȼ�
	networkengine:pushInt(data.id);
-- �ü�������ϵ��
	networkengine:pushFloat(data.attrFactor);
-- �����ü��Ľ������ϵ��
	networkengine:pushFloat(data.costFactor);
end

function ParseRowStrengthen()
	local tempArrayCount = 0;
	local data = {};

-- ǿ���ȼ�
	data['id'] = networkengine:parseInt();
-- �ü�������ϵ��
	data['attrFactor'] = networkengine:parseFloat();
-- �����ü��Ľ������ϵ��
	data['costFactor'] = networkengine:parseFloat();

	return data;
end

------------------typedef RowStage ----------------------------------
function sendPushRowStage(data)
-- id
	networkengine:pushInt(data.id);
-- ����
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- Ӣ�۵ȼ�
	networkengine:pushInt(data.heroLevel);
-- ShipAttrBase
	local arrayLength = #data.shipAttrBase;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.shipAttrBase) do
		sendPushShipAttrBase(v);
	end

-- ����
	networkengine:pushInt(data.intelligence);
-- ħ��ֵ
	networkengine:pushInt(data.mp);
-- ħ���б�
	local arrayLength = #data.magics;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.magics) do
		networkengine:pushInt(v);
	end

-- ħ���ȼ�
	local arrayLength = #data.magicLevels;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.magicLevels) do
		networkengine:pushInt(v);
	end

-- ����
	local arrayLength = #data.units;
	if arrayLength > 16 then arrayLength = 16 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.units) do
		networkengine:pushInt(v);
	end

-- ����
	local arrayLength = #data.unitCount;
	if arrayLength > 16 then arrayLength = 16 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.unitCount) do
		networkengine:pushInt(v);
	end

-- X����
	local arrayLength = #data.positionsX;
	if arrayLength > 16 then arrayLength = 16 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.positionsX) do
		networkengine:pushInt(v);
	end

-- Y����
	local arrayLength = #data.positionsY;
	if arrayLength > 16 then arrayLength = 16 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.positionsY) do
		networkengine:pushInt(v);
	end

-- ��ͨ��������
	local arrayLength = #data.firstRewardType;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.firstRewardType) do
		networkengine:pushInt(v);
	end

-- ��ͨ����ID
	local arrayLength = #data.firstRewardID;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.firstRewardID) do
		networkengine:pushInt(v);
	end

-- ��ͨ��������
	local arrayLength = #data.firstRewardCount;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.firstRewardCount) do
		networkengine:pushInt(v);
	end

-- �صý�������
	local arrayLength = #data.rewardType;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- �صý���ID
	local arrayLength = #data.rewardID;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- �صý�������
	local arrayLength = #data.rewardCount;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

-- ��1�������
	networkengine:pushInt(data.randomCount1);
-- �����������
	local arrayLength = #data.randomReward1Type;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.randomReward1Type) do
		networkengine:pushInt(v);
	end

-- �������ID
	local arrayLength = #data.randomReward1ID;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.randomReward1ID) do
		networkengine:pushInt(v);
	end

-- �����������
	local arrayLength = #data.randomReward1Count;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.randomReward1Count) do
		networkengine:pushInt(v);
	end

-- ����
	local arrayLength = #data.chance1;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.chance1) do
		networkengine:pushInt(v);
	end

-- ��2�������
	networkengine:pushInt(data.randomCount2);
-- �����������
	local arrayLength = #data.randomReward2Type;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.randomReward2Type) do
		networkengine:pushInt(v);
	end

-- �������ID
	local arrayLength = #data.randomReward2ID;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.randomReward2ID) do
		networkengine:pushInt(v);
	end

-- �����������
	local arrayLength = #data.randomReward2Count;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.randomReward2Count) do
		networkengine:pushInt(v);
	end

-- ����
	local arrayLength = #data.chance2;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.chance2) do
		networkengine:pushInt(v);
	end

-- ��������
	networkengine:pushInt(string.len(data.kingName));
	networkengine:pushString(data.kingName, string.len(data.kingName));
-- ����ͷ��ID
	networkengine:pushInt(data.kingIcon);
-- �Ƿ���Ӧ�ȼ�
	networkengine:pushBool(data.needAdjust);
-- �ȼ�offset
	networkengine:pushInt(data.adjustLevel);
-- �漣�ȼ�
	networkengine:pushInt(data.miracleLevel);
end

function ParseRowStage()
	local tempArrayCount = 0;
	local data = {};

	data['shipAttrBase'] = {};
	data['magics'] = {};
	data['magicLevels'] = {};
	data['units'] = {};
	data['unitCount'] = {};
	data['positionsX'] = {};
	data['positionsY'] = {};
	data['firstRewardType'] = {};
	data['firstRewardID'] = {};
	data['firstRewardCount'] = {};
	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
	data['randomReward1Type'] = {};
	data['randomReward1ID'] = {};
	data['randomReward1Count'] = {};
	data['chance1'] = {};
	data['randomReward2Type'] = {};
	data['randomReward2ID'] = {};
	data['randomReward2Count'] = {};
	data['chance2'] = {};
-- id
	data['id'] = networkengine:parseInt();
-- ����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- Ӣ�۵ȼ�
	data['heroLevel'] = networkengine:parseInt();
-- ShipAttrBase
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['shipAttrBase'][i] = ParseShipAttrBase();
	end
-- ����
	data['intelligence'] = networkengine:parseInt();
-- ħ��ֵ
	data['mp'] = networkengine:parseInt();
-- ħ���б�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['magics'][i] = networkengine:parseInt();
	end
-- ħ���ȼ�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['magicLevels'][i] = networkengine:parseInt();
	end
-- ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['units'][i] = networkengine:parseInt();
	end
-- ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['unitCount'][i] = networkengine:parseInt();
	end
-- X����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['positionsX'][i] = networkengine:parseInt();
	end
-- Y����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['positionsY'][i] = networkengine:parseInt();
	end
-- ��ͨ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['firstRewardType'][i] = networkengine:parseInt();
	end
-- ��ͨ����ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['firstRewardID'][i] = networkengine:parseInt();
	end
-- ��ͨ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['firstRewardCount'][i] = networkengine:parseInt();
	end
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- �صý���ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end
-- ��1�������
	data['randomCount1'] = networkengine:parseInt();
-- �����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['randomReward1Type'][i] = networkengine:parseInt();
	end
-- �������ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['randomReward1ID'][i] = networkengine:parseInt();
	end
-- �����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['randomReward1Count'][i] = networkengine:parseInt();
	end
-- ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['chance1'][i] = networkengine:parseInt();
	end
-- ��2�������
	data['randomCount2'] = networkengine:parseInt();
-- �����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['randomReward2Type'][i] = networkengine:parseInt();
	end
-- �������ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['randomReward2ID'][i] = networkengine:parseInt();
	end
-- �����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['randomReward2Count'][i] = networkengine:parseInt();
	end
-- ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['chance2'][i] = networkengine:parseInt();
	end
-- ��������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['kingName'] = networkengine:parseString(strlength);
else
		data['kingName'] = "";
end
-- ����ͷ��ID
	data['kingIcon'] = networkengine:parseInt();
-- �Ƿ���Ӧ�ȼ�
	data['needAdjust'] = networkengine:parseBool();
-- �ȼ�offset
	data['adjustLevel'] = networkengine:parseInt();
-- �漣�ȼ�
	data['miracleLevel'] = networkengine:parseInt();

	return data;
end

------------------typedef RowSkill ----------------------------------
function sendPushRowSkill(data)
-- ����ID
	networkengine:pushInt(data.id);
-- ��������
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- ȡ������
	networkengine:pushBool(data.cancelAttack);
-- ��ȡ������
	networkengine:pushBool(data.canRetaliate);
-- ����ʱ��
	networkengine:pushInt(data.moment);
-- ���ȼ�
	networkengine:pushInt(data.priority);
-- �ɱ���Ĭ
	networkengine:pushBool(data.canBeSilent);
-- ������ȴ
	networkengine:pushInt(data.bornCooldown);
-- ��ȴ
	networkengine:pushInt(data.cooldown);
-- ��Ŀ��
	networkengine:pushInt(data.targetType);
-- ����
	networkengine:pushInt(data.casterRange);
-- Ŀ������
	networkengine:pushInt(data.side);
-- ��Χ����
	networkengine:pushInt(data.skillShape);
-- ��Χ����
	networkengine:pushInt(data.targetRange);
end

function ParseRowSkill()
	local tempArrayCount = 0;
	local data = {};

-- ����ID
	data['id'] = networkengine:parseInt();
-- ��������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- ȡ������
	data['cancelAttack'] = networkengine:parseBool();
-- ��ȡ������
	data['canRetaliate'] = networkengine:parseBool();
-- ����ʱ��
	data['moment'] = networkengine:parseInt();
-- ���ȼ�
	data['priority'] = networkengine:parseInt();
-- �ɱ���Ĭ
	data['canBeSilent'] = networkengine:parseBool();
-- ������ȴ
	data['bornCooldown'] = networkengine:parseInt();
-- ��ȴ
	data['cooldown'] = networkengine:parseInt();
-- ��Ŀ��
	data['targetType'] = networkengine:parseInt();
-- ����
	data['casterRange'] = networkengine:parseInt();
-- Ŀ������
	data['side'] = networkengine:parseInt();
-- ��Χ����
	data['skillShape'] = networkengine:parseInt();
-- ��Χ����
	data['targetRange'] = networkengine:parseInt();

	return data;
end

------------------typedef RowShop ----------------------------------
function sendPushRowShop(data)
-- id
	networkengine:pushInt(data.id);
-- �ȼ��λ��ֵ�
	networkengine:pushInt(data.level);
-- ����̵���Ʒ����
	local arrayLength = #data.goldGoodsType;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.goldGoodsType) do
		networkengine:pushInt(v);
	end

-- ����̵���ƷID
	local arrayLength = #data.goldGoodsID;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.goldGoodsID) do
		networkengine:pushInt(v);
	end

-- ����̵���Ʒ����
	local arrayLength = #data.goldGoodsCount;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.goldGoodsCount) do
		networkengine:pushInt(v);
	end

-- ����̵���Ʒ�۸�
	local arrayLength = #data.goldGoodsPrice;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.goldGoodsPrice) do
		networkengine:pushInt(v);
	end

-- �����Ʒ���ּ��ʣ�Ȩֵ��ӣ�
	local arrayLength = #data.goldGoodsChance;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.goldGoodsChance) do
		networkengine:pushInt(v);
	end

-- ��ʯ�̵���Ʒ����
	local arrayLength = #data.diamondGoodsType;
	if arrayLength > 64 then arrayLength = 64 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.diamondGoodsType) do
		networkengine:pushInt(v);
	end

-- ��ʯ�̵���ƷID
	local arrayLength = #data.diamondGoodsID;
	if arrayLength > 64 then arrayLength = 64 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.diamondGoodsID) do
		networkengine:pushInt(v);
	end

-- ��ʯ�̵���Ʒ����
	local arrayLength = #data.diamondGoodsCount;
	if arrayLength > 64 then arrayLength = 64 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.diamondGoodsCount) do
		networkengine:pushInt(v);
	end

-- ��ʯ�̵���Ʒ�۸�
	local arrayLength = #data.diamondGoodsPrice;
	if arrayLength > 64 then arrayLength = 64 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.diamondGoodsPrice) do
		networkengine:pushInt(v);
	end

-- ��ʯ��Ʒ���ּ��ʣ�Ȩֵ��ӣ�
	local arrayLength = #data.diamondGoodsChance;
	if arrayLength > 64 then arrayLength = 64 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.diamondGoodsChance) do
		networkengine:pushInt(v);
	end

-- �����̵���Ʒ����
	local arrayLength = #data.honorGoodsType;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.honorGoodsType) do
		networkengine:pushInt(v);
	end

-- �����̵���ƷID
	local arrayLength = #data.honorGoodsID;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.honorGoodsID) do
		networkengine:pushInt(v);
	end

-- �����̵���Ʒ����
	local arrayLength = #data.honorGoodsCount;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.honorGoodsCount) do
		networkengine:pushInt(v);
	end

-- �����̵���Ʒ�۸�
	local arrayLength = #data.honorGoodsPrice;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.honorGoodsPrice) do
		networkengine:pushInt(v);
	end

-- ������Ʒ���ּ��ʣ�Ȩֵ��ӣ�
	local arrayLength = #data.honorGoodsChance;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.honorGoodsChance) do
		networkengine:pushInt(v);
	end

-- �����̵���Ʒ����
	local arrayLength = #data.conquestGoodsType;
	if arrayLength > 64 then arrayLength = 64 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.conquestGoodsType) do
		networkengine:pushInt(v);
	end

-- �����̵���ƷID
	local arrayLength = #data.conquestGoodsID;
	if arrayLength > 64 then arrayLength = 64 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.conquestGoodsID) do
		networkengine:pushInt(v);
	end

-- �����̵���Ʒ����
	local arrayLength = #data.conquestGoodsCount;
	if arrayLength > 64 then arrayLength = 64 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.conquestGoodsCount) do
		networkengine:pushInt(v);
	end

-- �����̵���Ʒ�۸�
	local arrayLength = #data.conquestGoodsPrice;
	if arrayLength > 64 then arrayLength = 64 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.conquestGoodsPrice) do
		networkengine:pushInt(v);
	end

-- ������Ʒ���ּ��ʣ�Ȩֵ��ӣ�
	local arrayLength = #data.conquestGoodsChance;
	if arrayLength > 64 then arrayLength = 64 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.conquestGoodsChance) do
		networkengine:pushInt(v);
	end

end

function ParseRowShop()
	local tempArrayCount = 0;
	local data = {};

	data['goldGoodsType'] = {};
	data['goldGoodsID'] = {};
	data['goldGoodsCount'] = {};
	data['goldGoodsPrice'] = {};
	data['goldGoodsChance'] = {};
	data['diamondGoodsType'] = {};
	data['diamondGoodsID'] = {};
	data['diamondGoodsCount'] = {};
	data['diamondGoodsPrice'] = {};
	data['diamondGoodsChance'] = {};
	data['honorGoodsType'] = {};
	data['honorGoodsID'] = {};
	data['honorGoodsCount'] = {};
	data['honorGoodsPrice'] = {};
	data['honorGoodsChance'] = {};
	data['conquestGoodsType'] = {};
	data['conquestGoodsID'] = {};
	data['conquestGoodsCount'] = {};
	data['conquestGoodsPrice'] = {};
	data['conquestGoodsChance'] = {};
-- id
	data['id'] = networkengine:parseInt();
-- �ȼ��λ��ֵ�
	data['level'] = networkengine:parseInt();
-- ����̵���Ʒ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['goldGoodsType'][i] = networkengine:parseInt();
	end
-- ����̵���ƷID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['goldGoodsID'][i] = networkengine:parseInt();
	end
-- ����̵���Ʒ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['goldGoodsCount'][i] = networkengine:parseInt();
	end
-- ����̵���Ʒ�۸�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['goldGoodsPrice'][i] = networkengine:parseInt();
	end
-- �����Ʒ���ּ��ʣ�Ȩֵ��ӣ�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['goldGoodsChance'][i] = networkengine:parseInt();
	end
-- ��ʯ�̵���Ʒ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['diamondGoodsType'][i] = networkengine:parseInt();
	end
-- ��ʯ�̵���ƷID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['diamondGoodsID'][i] = networkengine:parseInt();
	end
-- ��ʯ�̵���Ʒ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['diamondGoodsCount'][i] = networkengine:parseInt();
	end
-- ��ʯ�̵���Ʒ�۸�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['diamondGoodsPrice'][i] = networkengine:parseInt();
	end
-- ��ʯ��Ʒ���ּ��ʣ�Ȩֵ��ӣ�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['diamondGoodsChance'][i] = networkengine:parseInt();
	end
-- �����̵���Ʒ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['honorGoodsType'][i] = networkengine:parseInt();
	end
-- �����̵���ƷID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['honorGoodsID'][i] = networkengine:parseInt();
	end
-- �����̵���Ʒ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['honorGoodsCount'][i] = networkengine:parseInt();
	end
-- �����̵���Ʒ�۸�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['honorGoodsPrice'][i] = networkengine:parseInt();
	end
-- ������Ʒ���ּ��ʣ�Ȩֵ��ӣ�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['honorGoodsChance'][i] = networkengine:parseInt();
	end
-- �����̵���Ʒ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['conquestGoodsType'][i] = networkengine:parseInt();
	end
-- �����̵���ƷID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['conquestGoodsID'][i] = networkengine:parseInt();
	end
-- �����̵���Ʒ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['conquestGoodsCount'][i] = networkengine:parseInt();
	end
-- �����̵���Ʒ�۸�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['conquestGoodsPrice'][i] = networkengine:parseInt();
	end
-- ������Ʒ���ּ��ʣ�Ȩֵ��ӣ�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['conquestGoodsChance'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RowShip ----------------------------------
function sendPushRowShip(data)
-- ս���ȼ�
	networkengine:pushInt(data.id);
-- ���������Ǯ
	networkengine:pushInt(data.money);
-- ��������ľ��
	networkengine:pushInt(data.wood);
-- ����������Ʒ
	local arrayLength = #data.requireItem;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.requireItem) do
		networkengine:pushInt(v);
	end

-- ������Ʒ����
	local arrayLength = #data.retuireItemCount;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.retuireItemCount) do
		networkengine:pushInt(v);
	end

-- �˿�����
	networkengine:pushInt(data.soldier);
end

function ParseRowShip()
	local tempArrayCount = 0;
	local data = {};

	data['requireItem'] = {};
	data['retuireItemCount'] = {};
-- ս���ȼ�
	data['id'] = networkengine:parseInt();
-- ���������Ǯ
	data['money'] = networkengine:parseInt();
-- ��������ľ��
	data['wood'] = networkengine:parseInt();
-- ����������Ʒ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['requireItem'][i] = networkengine:parseInt();
	end
-- ������Ʒ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['retuireItemCount'][i] = networkengine:parseInt();
	end
-- �˿�����
	data['soldier'] = networkengine:parseInt();

	return data;
end

------------------typedef RowPvpOnline ----------------------------------
function sendPushRowPvpOnline(data)
-- id
	networkengine:pushInt(data.id);
-- ʤ����
	networkengine:pushInt(data.wins);
-- �صý�������
	local arrayLength = #data.rewardType;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- �صý���ID
	local arrayLength = #data.rewardID;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- �صý�������
	local arrayLength = #data.rewardCount;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

end

function ParseRowPvpOnline()
	local tempArrayCount = 0;
	local data = {};

	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
-- id
	data['id'] = networkengine:parseInt();
-- ʤ����
	data['wins'] = networkengine:parseInt();
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- �صý���ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RowPvpOffline ----------------------------------
function sendPushRowPvpOffline(data)
-- id
	networkengine:pushInt(data.id);
-- ����
	networkengine:pushInt(data.rank);
-- ƥ��ֵ���
	local arrayLength = #data.bracket;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.bracket) do
		networkengine:pushInt(v);
	end

-- �صý�������
	local arrayLength = #data.rewardType;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- �صý���ID
	local arrayLength = #data.rewardID;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- �صý�������
	local arrayLength = #data.rewardCount;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

-- ��ʯ����
	networkengine:pushFloat(data.diamondPerRank);
-- ��������
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- ����ͷ��
	networkengine:pushInt(data.icon);
-- Ӣ�۵ȼ�
	networkengine:pushInt(data.heroLevel);
-- ShipAttrBase
	local arrayLength = #data.shipAttrBase;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.shipAttrBase) do
		sendPushShipAttrBase(v);
	end

-- ����
	networkengine:pushInt(data.intelligence);
-- ħ��ֵ
	networkengine:pushInt(data.mp);
-- ħ���б�
	local arrayLength = #data.magics;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.magics) do
		networkengine:pushInt(v);
	end

-- ħ���ȼ�
	local arrayLength = #data.magicLevels;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.magicLevels) do
		networkengine:pushInt(v);
	end

-- ����
	local arrayLength = #data.units;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.units) do
		networkengine:pushInt(v);
	end

-- ����
	local arrayLength = #data.unitCount;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.unitCount) do
		networkengine:pushInt(v);
	end

-- X����
	local arrayLength = #data.positionsX;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.positionsX) do
		networkengine:pushInt(v);
	end

-- Y����
	local arrayLength = #data.positionsY;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.positionsY) do
		networkengine:pushInt(v);
	end

-- �漣�ȼ�
	networkengine:pushInt(data.miracleLevel);
end

function ParseRowPvpOffline()
	local tempArrayCount = 0;
	local data = {};

	data['bracket'] = {};
	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
	data['shipAttrBase'] = {};
	data['magics'] = {};
	data['magicLevels'] = {};
	data['units'] = {};
	data['unitCount'] = {};
	data['positionsX'] = {};
	data['positionsY'] = {};
-- id
	data['id'] = networkengine:parseInt();
-- ����
	data['rank'] = networkengine:parseInt();
-- ƥ��ֵ���
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['bracket'][i] = networkengine:parseInt();
	end
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- �صý���ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end
-- ��ʯ����
	data['diamondPerRank'] = networkengine:parseFloat();
-- ��������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- ����ͷ��
	data['icon'] = networkengine:parseInt();
-- Ӣ�۵ȼ�
	data['heroLevel'] = networkengine:parseInt();
-- ShipAttrBase
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['shipAttrBase'][i] = ParseShipAttrBase();
	end
-- ����
	data['intelligence'] = networkengine:parseInt();
-- ħ��ֵ
	data['mp'] = networkengine:parseInt();
-- ħ���б�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['magics'][i] = networkengine:parseInt();
	end
-- ħ���ȼ�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['magicLevels'][i] = networkengine:parseInt();
	end
-- ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['units'][i] = networkengine:parseInt();
	end
-- ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['unitCount'][i] = networkengine:parseInt();
	end
-- X����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['positionsX'][i] = networkengine:parseInt();
	end
-- Y����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['positionsY'][i] = networkengine:parseInt();
	end
-- �漣�ȼ�
	data['miracleLevel'] = networkengine:parseInt();

	return data;
end

------------------typedef RowPrice ----------------------------------
function sendPushRowPrice(data)
-- ����
	networkengine:pushInt(data.id);
-- ������������ʯ
	networkengine:pushInt(data.vigor);
-- ����������ʯ
	networkengine:pushInt(data.gold);
-- ��ľ��������ʯ
	networkengine:pushInt(data.lumber);
-- ����ð�չؿ�����������ʯ
	networkengine:pushInt(data.resetStage);
-- ˢ���̵�������ʯ
	networkengine:pushInt(data.resetShop);
-- ÿ�ջع�����������ʯ
	networkengine:pushInt(data.lostExp);
-- ��ħ������������ʯ
	networkengine:pushInt(data.magicExp);
-- �����Ӷ����������ʯ
	networkengine:pushInt(data.resetPlunder);
-- ���򹫻�ս��ս����������ʯ
	networkengine:pushInt(data.guildWarTime);
-- ���򹫻�ս��������������ʯ
	networkengine:pushInt(data.guildWarDef);
-- ���򹫻�ս������������ľ��
	networkengine:pushInt(data.guildWarAtkWood);
end

function ParseRowPrice()
	local tempArrayCount = 0;
	local data = {};

-- ����
	data['id'] = networkengine:parseInt();
-- ������������ʯ
	data['vigor'] = networkengine:parseInt();
-- ����������ʯ
	data['gold'] = networkengine:parseInt();
-- ��ľ��������ʯ
	data['lumber'] = networkengine:parseInt();
-- ����ð�չؿ�����������ʯ
	data['resetStage'] = networkengine:parseInt();
-- ˢ���̵�������ʯ
	data['resetShop'] = networkengine:parseInt();
-- ÿ�ջع�����������ʯ
	data['lostExp'] = networkengine:parseInt();
-- ��ħ������������ʯ
	data['magicExp'] = networkengine:parseInt();
-- �����Ӷ����������ʯ
	data['resetPlunder'] = networkengine:parseInt();
-- ���򹫻�ս��ս����������ʯ
	data['guildWarTime'] = networkengine:parseInt();
-- ���򹫻�ս��������������ʯ
	data['guildWarDef'] = networkengine:parseInt();
-- ���򹫻�ս������������ľ��
	data['guildWarAtkWood'] = networkengine:parseInt();

	return data;
end

------------------typedef RowPlayer ----------------------------------
function sendPushRowPlayer(data)
-- Ӣ�۵ȼ�
	networkengine:pushInt(data.id);
-- �����¼����辭��
	networkengine:pushInt(data.exp);
-- ��ǿ
	networkengine:pushInt(data.intelligence);
-- ħ��ֵ����
	networkengine:pushInt(data.maxMP);
-- �������õ�����
	networkengine:pushInt(data.vigorRegeneration);
-- ShipAttrBase
	local arrayLength = #data.shipAttrBase;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.shipAttrBase) do
		sendPushShipAttrBase(v);
	end

-- ����ϵ��
	networkengine:pushInt(data.numberRatio);
-- ����ϵ��
	networkengine:pushFloat(data.rewardRatio);
-- Զ������ƥ��
	local arrayLength = #data.crusadeCountMatch;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.crusadeCountMatch) do
		networkengine:pushFloat(v);
	end

-- Զ��װ��ƥ��
	local arrayLength = #data.crusadeAttrMatch;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.crusadeAttrMatch) do
		networkengine:pushFloat(v);
	end

-- �����ܻ�õĽ��
	networkengine:pushInt(data.plunderWinGold);
end

function ParseRowPlayer()
	local tempArrayCount = 0;
	local data = {};

	data['shipAttrBase'] = {};
	data['crusadeCountMatch'] = {};
	data['crusadeAttrMatch'] = {};
-- Ӣ�۵ȼ�
	data['id'] = networkengine:parseInt();
-- �����¼����辭��
	data['exp'] = networkengine:parseInt();
-- ��ǿ
	data['intelligence'] = networkengine:parseInt();
-- ħ��ֵ����
	data['maxMP'] = networkengine:parseInt();
-- �������õ�����
	data['vigorRegeneration'] = networkengine:parseInt();
-- ShipAttrBase
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['shipAttrBase'][i] = ParseShipAttrBase();
	end
-- ����ϵ��
	data['numberRatio'] = networkengine:parseInt();
-- ����ϵ��
	data['rewardRatio'] = networkengine:parseFloat();
-- Զ������ƥ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['crusadeCountMatch'][i] = networkengine:parseFloat();
	end
-- Զ��װ��ƥ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['crusadeAttrMatch'][i] = networkengine:parseFloat();
	end
-- �����ܻ�õĽ��
	data['plunderWinGold'] = networkengine:parseInt();

	return data;
end

------------------typedef RowMainBase ----------------------------------
function sendPushRowMainBase(data)
-- ���1�ȼ�
	local arrayLength = #data.home;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.home) do
		networkengine:pushInt(v);
	end

-- ��������
	networkengine:pushInt(data.maxFood);
end

function ParseRowMainBase()
	local tempArrayCount = 0;
	local data = {};

	data['home'] = {};
-- ���1�ȼ�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['home'][i] = networkengine:parseInt();
	end
-- ��������
	data['maxFood'] = networkengine:parseInt();

	return data;
end

------------------typedef RowMailString ----------------------------------
function sendPushRowMailString(data)
-- ID
	networkengine:pushInt(data.id);
-- �ʼ�����
	networkengine:pushInt(string.len(data.caption));
	networkengine:pushString(data.caption, string.len(data.caption));
-- �ʼ�����
	networkengine:pushInt(string.len(data.text));
	networkengine:pushString(data.text, string.len(data.text));
end

function ParseRowMailString()
	local tempArrayCount = 0;
	local data = {};

-- ID
	data['id'] = networkengine:parseInt();
-- �ʼ�����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['caption'] = networkengine:parseString(strlength);
else
		data['caption'] = "";
end
-- �ʼ�����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['text'] = networkengine:parseString(strlength);
else
		data['text'] = "";
end

	return data;
end

------------------typedef RowMagicTower ----------------------------------
function sendPushRowMagicTower(data)
-- ��ʦ����ѡ��������
	networkengine:pushInt(data.candidateSkillNum);
-- ����
	local arrayLength = #data.starChance;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.starChance) do
		networkengine:pushInt(v);
	end

-- ÿ�����ĵ�ڤ�����
	networkengine:pushInt(data.meditationCost);
-- ڤ���������
	networkengine:pushInt(data.meditationCostLimit);
end

function ParseRowMagicTower()
	local tempArrayCount = 0;
	local data = {};

	data['starChance'] = {};
-- ��ʦ����ѡ��������
	data['candidateSkillNum'] = networkengine:parseInt();
-- ����
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['starChance'][i] = networkengine:parseInt();
	end
-- ÿ�����ĵ�ڤ�����
	data['meditationCost'] = networkengine:parseInt();
-- ڤ���������
	data['meditationCostLimit'] = networkengine:parseInt();

	return data;
end

------------------typedef RowMagic ----------------------------------
function sendPushRowMagic(data)
-- ID
	networkengine:pushInt(data.id);
-- ħ������
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- ��ʩ�Ŵ���
	networkengine:pushInt(data.castTimes);
-- ��������
	local arrayLength = #data.cost;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.cost) do
		networkengine:pushInt(v);
	end

-- ������ȴ
	networkengine:pushInt(data.cooldownOnStart);
-- ��ȴ
	networkengine:pushInt(data.cooldown);
-- ��������
	networkengine:pushInt(data.targetType);
-- ��Χ����
	networkengine:pushInt(data.shape);
-- ��Χ����
	networkengine:pushInt(data.scope);
-- ��������
	networkengine:pushInt(data.side);
-- ���buffID
	networkengine:pushInt(data.buffID);
-- AI
	networkengine:pushInt(data.magicAI);
-- ��ʼ�Ǽ�
	networkengine:pushInt(data.startLevel);
-- �Ƿ�����ս�ħ��
	networkengine:pushBool(data.isGreatMagic);
end

function ParseRowMagic()
	local tempArrayCount = 0;
	local data = {};

	data['cost'] = {};
-- ID
	data['id'] = networkengine:parseInt();
-- ħ������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- ��ʩ�Ŵ���
	data['castTimes'] = networkengine:parseInt();
-- ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['cost'][i] = networkengine:parseInt();
	end
-- ������ȴ
	data['cooldownOnStart'] = networkengine:parseInt();
-- ��ȴ
	data['cooldown'] = networkengine:parseInt();
-- ��������
	data['targetType'] = networkengine:parseInt();
-- ��Χ����
	data['shape'] = networkengine:parseInt();
-- ��Χ����
	data['scope'] = networkengine:parseInt();
-- ��������
	data['side'] = networkengine:parseInt();
-- ���buffID
	data['buffID'] = networkengine:parseInt();
-- AI
	data['magicAI'] = networkengine:parseInt();
-- ��ʼ�Ǽ�
	data['startLevel'] = networkengine:parseInt();
-- �Ƿ�����ս�ħ��
	data['isGreatMagic'] = networkengine:parseBool();

	return data;
end

------------------typedef RowLumberMill ----------------------------------
function sendPushRowLumberMill(data)
-- ÿ��ԭľ�Ĳ�������
	networkengine:pushInt(data.criticalBase);
-- ��ʯ������ľ����
	networkengine:pushInt(data.diamondToLumber);
end

function ParseRowLumberMill()
	local tempArrayCount = 0;
	local data = {};

-- ÿ��ԭľ�Ĳ�������
	data['criticalBase'] = networkengine:parseInt();
-- ��ʯ������ľ����
	data['diamondToLumber'] = networkengine:parseInt();

	return data;
end

------------------typedef RowLoginReward ----------------------------------
function sendPushRowLoginReward(data)
-- ��½����
	networkengine:pushInt(data.id);
-- ��������
	local arrayLength = #data.rewardType;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- ����ID
	local arrayLength = #data.rewardID;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- ��������
	local arrayLength = #data.rewardCount;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

end

function ParseRowLoginReward()
	local tempArrayCount = 0;
	local data = {};

	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
-- ��½����
	data['id'] = networkengine:parseInt();
-- ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- ����ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RowLevelReward ----------------------------------
function sendPushRowLevelReward(data)
-- id
	networkengine:pushInt(data.id);
-- ����ȼ�
	networkengine:pushInt(data.level);
-- ��������
	local arrayLength = #data.rewardType;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- ����ID
	local arrayLength = #data.rewardID;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- ��������
	local arrayLength = #data.rewardCount;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

end

function ParseRowLevelReward()
	local tempArrayCount = 0;
	local data = {};

	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
-- id
	data['id'] = networkengine:parseInt();
-- ����ȼ�
	data['level'] = networkengine:parseInt();
-- ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- ����ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RowUseItem ----------------------------------
function sendPushRowUseItem(data)
-- ID
	networkengine:pushInt(data.id);
-- �����ȼ�����
	networkengine:pushInt(data.kingLevelLimit);
-- ����Կ������
	networkengine:pushInt(data.needCount);
-- ����Կ��ID
	networkengine:pushInt(data.needItemID);
-- ��������Ʒ
	networkengine:pushBool(data.isRandItem);
-- ��������
	local arrayLength = #data.rewardType;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- ����ID
	local arrayLength = #data.rewardID;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- ��������
	local arrayLength = #data.rewardNum;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardNum) do
		networkengine:pushInt(v);
	end

-- ��������
	local arrayLength = #data.rewardOdds;
	if arrayLength > 128 then arrayLength = 128 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardOdds) do
		networkengine:pushInt(v);
	end

end

function ParseRowUseItem()
	local tempArrayCount = 0;
	local data = {};

	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardNum'] = {};
	data['rewardOdds'] = {};
-- ID
	data['id'] = networkengine:parseInt();
-- �����ȼ�����
	data['kingLevelLimit'] = networkengine:parseInt();
-- ����Կ������
	data['needCount'] = networkengine:parseInt();
-- ����Կ��ID
	data['needItemID'] = networkengine:parseInt();
-- ��������Ʒ
	data['isRandItem'] = networkengine:parseBool();
-- ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- ����ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardNum'][i] = networkengine:parseInt();
	end
-- ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardOdds'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RowDebris ----------------------------------
function sendPushRowDebris(data)
-- ID
	networkengine:pushInt(data.id);
-- ��ƷID
	networkengine:pushInt(data.productID);
-- �ϳ���������
	networkengine:pushInt(data.needCount);
end

function ParseRowDebris()
	local tempArrayCount = 0;
	local data = {};

-- ID
	data['id'] = networkengine:parseInt();
-- ��ƷID
	data['productID'] = networkengine:parseInt();
-- �ϳ���������
	data['needCount'] = networkengine:parseInt();

	return data;
end

------------------typedef RowEquip ----------------------------------
function sendPushRowEquip(data)
-- ID
	networkengine:pushInt(data.id);
-- ��λ
	networkengine:pushInt(data.part);
-- ��������ȼ�
	networkengine:pushInt(data.requireLevel);
-- ����1����
	networkengine:pushInt(data.attr);
-- ����1����ֵ
	networkengine:pushInt(data.baseAttrValue);
-- ����1ǿ��ֵ
	networkengine:pushInt(data.enhanceValue);
-- ����2����
	networkengine:pushInt(data.attr2);
-- ����2����ֵ
	networkengine:pushInt(data.baseAttrValue2);
-- ����2ǿ��ֵ
	networkengine:pushInt(data.enhanceValue2);
-- ����ǿ��
	networkengine:pushBool(data.noEnhance);
-- ǿ������
	networkengine:pushInt(data.enhanceMax);
-- ǿ�����û���
	networkengine:pushInt(data.enhanceCost);
end

function ParseRowEquip()
	local tempArrayCount = 0;
	local data = {};

-- ID
	data['id'] = networkengine:parseInt();
-- ��λ
	data['part'] = networkengine:parseInt();
-- ��������ȼ�
	data['requireLevel'] = networkengine:parseInt();
-- ����1����
	data['attr'] = networkengine:parseInt();
-- ����1����ֵ
	data['baseAttrValue'] = networkengine:parseInt();
-- ����1ǿ��ֵ
	data['enhanceValue'] = networkengine:parseInt();
-- ����2����
	data['attr2'] = networkengine:parseInt();
-- ����2����ֵ
	data['baseAttrValue2'] = networkengine:parseInt();
-- ����2ǿ��ֵ
	data['enhanceValue2'] = networkengine:parseInt();
-- ����ǿ��
	data['noEnhance'] = networkengine:parseBool();
-- ǿ������
	data['enhanceMax'] = networkengine:parseInt();
-- ǿ�����û���
	data['enhanceCost'] = networkengine:parseInt();

	return data;
end

------------------typedef RowItem ----------------------------------
function sendPushRowItem(data)
-- ID
	networkengine:pushInt(data.id);
-- ���
	networkengine:pushInt(data.type);
-- ����ID
	networkengine:pushInt(data.subID);
-- ����
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- �Ǽ�
	networkengine:pushInt(data.star);
-- ��������
	networkengine:pushBool(data.noSell);
-- �����
	networkengine:pushInt(data.sellToShop);
-- ���ɶѵ�
	networkengine:pushBool(data.noOverlap);
end

function ParseRowItem()
	local tempArrayCount = 0;
	local data = {};

-- ID
	data['id'] = networkengine:parseInt();
-- ���
	data['type'] = networkengine:parseInt();
-- ����ID
	data['subID'] = networkengine:parseInt();
-- ����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- �Ǽ�
	data['star'] = networkengine:parseInt();
-- ��������
	data['noSell'] = networkengine:parseBool();
-- �����
	data['sellToShop'] = networkengine:parseInt();
-- ���ɶѵ�
	data['noOverlap'] = networkengine:parseBool();

	return data;
end

------------------typedef RowUnitCompatable ----------------------------------
function sendPushRowUnitCompatable(data)
-- ����ID
	networkengine:pushInt(data.id);
-- ����ID
	local arrayLength = #data.starLevel;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.starLevel) do
		networkengine:pushInt(v);
	end

end

function ParseRowUnitCompatable()
	local tempArrayCount = 0;
	local data = {};

	data['starLevel'] = {};
-- ����ID
	data['id'] = networkengine:parseInt();
-- ����ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['starLevel'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RowIncidentChance ----------------------------------
function sendPushRowIncidentChance(data)
-- id
	networkengine:pushInt(data.id);
-- �����Χ
	local arrayLength = #data.chance;
	if arrayLength > 64 then arrayLength = 64 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.chance) do
		networkengine:pushInt(v);
	end

end

function ParseRowIncidentChance()
	local tempArrayCount = 0;
	local data = {};

	data['chance'] = {};
-- id
	data['id'] = networkengine:parseInt();
-- �����Χ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['chance'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RowIncident ----------------------------------
function sendPushRowIncident(data)
-- id
	networkengine:pushInt(data.id);
-- �ؿ�id
	networkengine:pushInt(data.stageId);
-- �صý�������
	local arrayLength = #data.rewardType;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- �صý���ID
	local arrayLength = #data.rewardID;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- �صý�������
	local arrayLength = #data.rewardCount;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

-- ʱ�������룩
	networkengine:pushInt(data.incidentInterval);
-- Լ���������
	networkengine:pushInt(data.condition);
-- Լ�������ж�
	networkengine:pushInt(data.compare);
-- Լ����������
	networkengine:pushInt(data.argument);
end

function ParseRowIncident()
	local tempArrayCount = 0;
	local data = {};

	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
-- id
	data['id'] = networkengine:parseInt();
-- �ؿ�id
	data['stageId'] = networkengine:parseInt();
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- �صý���ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end
-- ʱ�������룩
	data['incidentInterval'] = networkengine:parseInt();
-- Լ���������
	data['condition'] = networkengine:parseInt();
-- Լ�������ж�
	data['compare'] = networkengine:parseInt();
-- Լ����������
	data['argument'] = networkengine:parseInt();

	return data;
end

------------------typedef RowGoldMine ----------------------------------
function sendPushRowGoldMine(data)
-- ÿСʱ��Ҳ���
	networkengine:pushInt(data.output);
end

function ParseRowGoldMine()
	local tempArrayCount = 0;
	local data = {};

-- ÿСʱ��Ҳ���
	data['output'] = networkengine:parseInt();

	return data;
end

------------------typedef RowDailyTask ----------------------------------
function sendPushRowDailyTask(data)
-- id
	networkengine:pushInt(data.id);
-- ��������
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- ��ȡ����ȼ�
	networkengine:pushInt(data.level);
-- ���齱��
	networkengine:pushInt(data.exp);
-- ������������
	local arrayLength = #data.rewardType;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- ��������ID
	local arrayLength = #data.rewardID;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- ������������
	local arrayLength = #data.rewardCount;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

-- �����������
	networkengine:pushInt(data.finishType);
-- �����������
	networkengine:pushInt(data.finishParam);
end

function ParseRowDailyTask()
	local tempArrayCount = 0;
	local data = {};

	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
-- id
	data['id'] = networkengine:parseInt();
-- ��������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- ��ȡ����ȼ�
	data['level'] = networkengine:parseInt();
-- ���齱��
	data['exp'] = networkengine:parseInt();
-- ������������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- ��������ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- ������������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end
-- �����������
	data['finishType'] = networkengine:parseInt();
-- �����������
	data['finishParam'] = networkengine:parseInt();

	return data;
end

------------------typedef RowConfig ----------------------------------
function sendPushRowConfig(data)
-- ������
	networkengine:pushInt(data.id);
-- ����ʱ��
	networkengine:pushInt(string.len(data.openServerData));
	networkengine:pushString(data.openServerData, string.len(data.openServerData));
-- �ۺ�-��ҵȼ�����
	networkengine:pushInt(data.playerMaxLevel);
-- �ۺ�-�����Ǽ���Ӧ�ľ���ֵ
	local arrayLength = #data.startLevelTable;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.startLevelTable) do
		networkengine:pushInt(v);
	end

-- �ۺ�-ħ���Ǽ���Ӧ�ľ���ֵ
	local arrayLength = #data.magicLevelExp;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.magicLevelExp) do
		networkengine:pushInt(v);
	end

-- �ۺ�-��ʼ���Ż�����ID
	local arrayLength = #data.bornCardID;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.bornCardID) do
		networkengine:pushInt(v);
	end

-- �ۺ�-��ʼ�����Ǽ�
	local arrayLength = #data.bornCardStarLevel;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.bornCardStarLevel) do
		networkengine:pushInt(v);
	end

-- �ۺ�-���������Ƭת�����ı���
	networkengine:pushInt(data.overflowCardexpToHonor);
-- �ۺ�-��ʼħ��ID
	local arrayLength = #data.bornMagicID;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.bornMagicID) do
		networkengine:pushInt(v);
	end

-- �ۺ�-��ʼħ���Ǽ�
	local arrayLength = #data.bornMagicStarLevel;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.bornMagicStarLevel) do
		networkengine:pushInt(v);
	end

-- �ۺ�-�¿���Ч����
	networkengine:pushInt(data.monthCardDays);
-- �ۺ�-����߼�ˢ��ʱ���
	networkengine:pushInt(string.len(data.playerRefleshTime));
	networkengine:pushString(data.playerRefleshTime, string.len(data.playerRefleshTime));
-- �ۺ�-1��ʯ��Ӧ����Ľ���ʱ�䣨�룩
	networkengine:pushInt(data.diamondCost_upgradeImmediate);
-- �ۺ�-�������ƻ�����ʯ
	networkengine:pushInt(data.renameCost);
-- ս��ƽ����-ս���˺���������
	networkengine:pushFloat(data.criticalFactor);
-- ս��ƽ����-ս������������
	networkengine:pushFloat(data.baseCritical);
-- ս��ƽ����-ÿ��ս�����غ���
	networkengine:pushInt(data.maxRounds);
-- ս��ƽ����-Զ�̾��ŶԽ���Ŀ����˺�ϵ��
	networkengine:pushFloat(data.damageDistanceRatio);
-- �׳佱��-��������
	local arrayLength = #data.firstChargeRewardType;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.firstChargeRewardType) do
		networkengine:pushInt(v);
	end

-- �׳佱��-����ID
	local arrayLength = #data.firstChargeRewardID;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.firstChargeRewardID) do
		networkengine:pushInt(v);
	end

-- �׳佱��-��������
	local arrayLength = #data.firstChargeRewardCount;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.firstChargeRewardCount) do
		networkengine:pushInt(v);
	end

-- ����-��ʯ�����õ�����
	networkengine:pushInt(data.diamondToVigor);
-- ����-�����ȡ��õ�����
	networkengine:pushInt(data.freeVigor);
-- ����-�Զ��ָ�������룩
	networkengine:pushInt(data.vigorRegenerationInterval);
-- ��ͼ-ɨ��ȯID
	networkengine:pushInt(data.sweepScrollID);
-- ��ͼ-ɨ��ȯÿ������ID
	networkengine:pushInt(data.sweepTaskID);
-- ��ͼ-vip�ı�ɨ��ȯ�����ʼ�ID
	networkengine:pushInt(data.sweepCompensateMailID);
-- ��ͼ-���������������������
	networkengine:pushInt(data.adventurePerfectLimit);
-- ��ͼ-��Ӣ�ؿ�����������ͨ�ؿ����ȣ�������
	networkengine:pushInt(data.eliteAdventureLimit);
-- Adventure
	local arrayLength = #data.adventure;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.adventure) do
		sendPushAdventure(v);
	end

-- ���-��ʯ�������൱�ڼ�Сʱ�������Ľ��
	networkengine:pushInt(data.diamondToGold);
-- ���-����ʼ��ң��룩
	networkengine:pushInt(data.goldMineStack);
-- ��ʦ��-��ʦ����ʼڤ��������㣩
	networkengine:pushInt(data.meditationStack);
-- ÿ������ʯ����ħ�������ĸ���
	networkengine:pushInt(data.diamondToMagicExp);
-- InitialMeditation
	local arrayLength = #data.initialMeditation;
	if arrayLength > 3 then arrayLength = 3 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.initialMeditation) do
		sendPushInitialMeditation(v);
	end

-- ��ľ��-��ľ����ʼԭľ��
	networkengine:pushInt(data.lumberMillStack);
-- ��ľ��-��ľ��ԭľ����������룩
	networkengine:pushInt(data.lumberMillInterval);
-- ��ľ��-ľ�ļӹ���ʽ���ָ���
	local arrayLength = #data.woodToLumber_p;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.woodToLumber_p) do
		networkengine:pushInt(v);
	end

-- ��ľ��-�ӹ���ʽ��Ӧ�Ĳ���ϵ��
	local arrayLength = #data.woodToLumber_output;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.woodToLumber_output) do
		networkengine:pushInt(v);
	end

-- ������-װ��ǿ���������ָ���
	local arrayLength = #data.equipEhanceChance;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.equipEhanceChance) do
		networkengine:pushInt(v);
	end

-- ������-װ��ǿ�����ӵ���ɶ�
	local arrayLength = #data.equipEhanceValue;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.equipEhanceValue) do
		networkengine:pushInt(v);
	end

-- �鿨�����ţ�-��ѳ鿨��ʱ������Сʱ��
	networkengine:pushInt(data.freeDrawInterval);
-- �鿨�����ţ�-��һ��������ʯ����
	networkengine:pushInt(data.drawOnceCost);
-- �鿨�����ţ�-��ʮ��������ʯ����
	networkengine:pushInt(data.drawTentimesCost);
-- �鿨�����ţ�-����ż��δ��������ڻ���
	networkengine:pushInt(data.cardAwardsNode);
-- �鿨�����ţ�-�鿨ϵͳ���Ǽ����ָ���
	local arrayLength = #data.drawCardProbabilty;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.drawCardProbabilty) do
		networkengine:pushInt(v);
	end

-- InitialDraw
	local arrayLength = #data.initialDraw;
	if arrayLength > 3 then arrayLength = 3 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.initialDraw) do
		sendPushInitialDraw(v);
	end

-- �̵�-�����̵깦��������ҵȼ�
	networkengine:pushInt(data.shopLevelLimit);
-- �̵�-�̵��Զ�ˢ��ʱ���
	local arrayLength = #data.shopRefleshTimes;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.shopRefleshTimes) do
		networkengine:pushInt(string.len(v));
		networkengine:pushString(v, string.len(v));
	end

-- ͬ��pvp-�ȼ�����
	networkengine:pushInt(data.pvpOnlineLevelLimit);
-- ͬ��pvp-���ʤ������
	networkengine:pushInt(data.pvpOnlineWinLimit);
-- ͬ��pvp-���ʧ�ܳ���
	networkengine:pushInt(data.pvpOnlineFailLimit);
-- ͬ��pvp-��ʼʱ��
	local arrayLength = #data.pvpBeginTime;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.pvpBeginTime) do
		networkengine:pushInt(string.len(v));
		networkengine:pushString(v, string.len(v));
	end

-- ͬ��pvp-����ʱ��
	local arrayLength = #data.pvpEndTime;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.pvpEndTime) do
		networkengine:pushInt(string.len(v));
		networkengine:pushString(v, string.len(v));
	end

-- ͬ��PVP-��������ʱ��
	networkengine:pushInt(string.len(data.pvpOnlineRewardTime));
	networkengine:pushString(data.pvpOnlineRewardTime, string.len(data.pvpOnlineRewardTime));
-- ͬ��PVP-�ݲ�ʱ���飨�룩
	local arrayLength = #data.pvpTolerance;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.pvpTolerance) do
		networkengine:pushInt(v);
	end

-- ͬ��PVPƥ��CDʱ��
	networkengine:pushInt(data.pvpOnlineCoolDown);
-- ͬ��PVPħ���ͷų�ʱʱ�䣨�룩
	networkengine:pushInt(data.pvpOnlineTimeOut);
-- ͬ��PVP-�ʼ��ı�ID
	networkengine:pushInt(data.pvpOnlineMailStringID);
-- �첽PVP-�ȼ�����
	networkengine:pushInt(data.pvpOfflineLevelLimit);
-- �첽PVP-��������ʱ��
	networkengine:pushInt(string.len(data.pvpOfflineRewardTime));
	networkengine:pushString(data.pvpOfflineRewardTime, string.len(data.pvpOfflineRewardTime));
-- �첽PVP-���а񱣴�ʱ��
	networkengine:pushInt(string.len(data.ladderSaveTime));
	networkengine:pushString(data.ladderSaveTime, string.len(data.ladderSaveTime));
-- �첽PVP-��ս����ˢ��ʱ���
	local arrayLength = #data.pvpOfflineRefleshTimes;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.pvpOfflineRefleshTimes) do
		networkengine:pushInt(string.len(v));
		networkengine:pushString(v, string.len(v));
	end

-- �첽PVP-��ս����
	networkengine:pushInt(data.pvpOfflineFightTimes);
-- �첽PVP-������ս�������ѵ���ʯ
	networkengine:pushInt(data.pvpOfflineResetTimes);
-- �첽PVP-��ս��ȴʱ�䣨�룩
	networkengine:pushInt(data.pvpOfflineCD);
-- �첽PVP-VIP�ȼ����ڵ��ڸ�ֵʱ����ս��ȴʱ��
	networkengine:pushInt(data.pvpOfflineCDVipLevel);
-- �첽PVP-1��ʯ��Ӧ����ȴʱ�䣨�룩
	networkengine:pushInt(data.pvpOfflineDiamondCost);
-- �첽PVP-���а��������
	networkengine:pushInt(data.pvpOfflineMaxRank);
-- �첽PVP-����ƥ�䰴ť����ȴʱ�䣨�룩
	networkengine:pushInt(data.pvpOfflineRematchCD);
-- �첽PVP-�ʼ��ı�ID
	networkengine:pushInt(data.pvpOfflineMailStringID);
-- ������ս-�ȼ�����
	networkengine:pushInt(data.challengeSpeedLevelLimit);
-- ������ս-�ر�ʱ��
	networkengine:pushInt(string.len(data.challengeSpeedCloseTime));
	networkengine:pushString(data.challengeSpeedCloseTime, string.len(data.challengeSpeedCloseTime));
-- ������ս-�ؿ�ID
	local arrayLength = #data.challengeSpeedStageID;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.challengeSpeedStageID) do
		networkengine:pushInt(v);
	end

-- ������ս-ħ��ID
	local arrayLength = #data.challengeSpeedMagicID;
	if arrayLength > 16 then arrayLength = 16 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.challengeSpeedMagicID) do
		networkengine:pushInt(v);
	end

-- ������ս-�ʼ��ı�ID
	networkengine:pushInt(data.challengeSpeedMailStringID);
-- ������ս-�����־
	networkengine:pushBool(data.challengeSpeedLog);
-- �˺����а�-�ȼ�����
	networkengine:pushInt(data.challengeDamageLevelLimit);
-- �˺����а�-�ر�ʱ��
	networkengine:pushInt(string.len(data.challengeDamageCloseTime));
	networkengine:pushString(data.challengeDamageCloseTime, string.len(data.challengeDamageCloseTime));
-- �˺����а�-ÿ�մ�������
	networkengine:pushInt(data.challengeDamageTimesLimit);
-- �˺����а�-�ؿ�ID
	local arrayLength = #data.challengeDamageStageID;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.challengeDamageStageID) do
		networkengine:pushInt(v);
	end

-- �˺����а�-��������ǰ�ı���¼��
	networkengine:pushInt(data.challengeDamageMaxSaveRank);
-- �˺����а�-�ı�ID
	networkengine:pushInt(data.challengeDamageMailStringID);
-- �˺����а�-�Ѷ�ϵ��
	networkengine:pushFloat(data.challengeDamageDegree);
-- ��������������ս-ÿ����ս����(����)
	networkengine:pushInt(data.challengeStageTimesLimit);
-- ������ս-��ս��ȴʱ�䣨�룩
	networkengine:pushInt(data.challengeStageCD);
-- ����������������ʱ�䣨������
	local arrayLength = #data.FoodReleaseTime;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.FoodReleaseTime) do
		networkengine:pushInt(v);
	end

-- ���������������ű�����������
	networkengine:pushInt(data.FoodReleaseRatio);
-- ս��������-�����Ǽ�ϵ��
	local arrayLength = #data.startLevelRatio;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.startLevelRatio) do
		networkengine:pushFloat(v);
	end

-- ս��������-����Ʒ��ϵ��
	local arrayLength = #data.classLevelRatio;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.classLevelRatio) do
		networkengine:pushFloat(v);
	end

-- ս��������-ħ���Ǽ�ϵ��
	local arrayLength = #data.magicLevelRatio;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.magicLevelRatio) do
		networkengine:pushFloat(v);
	end

-- ս��������-ս����ϵ��A
	networkengine:pushFloat(data.fightingCapacityRatioA);
-- ս��������-ս����ϵ��B
	networkengine:pushFloat(data.fightingCapacityRatioB);
-- ս��������-ս����ϵ��C
	networkengine:pushFloat(data.fightingCapacityRatioC);
-- ��������-ս���Զ������ȼ�����
	networkengine:pushInt(data.shipAutoLvUpLv);
-- ��ʼս��λ��X
	local arrayLength = #data.initShipPosX;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.initShipPosX) do
		networkengine:pushInt(v);
	end

-- ��ʼս��λ��Y
	local arrayLength = #data.initShipPosY;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.initShipPosY) do
		networkengine:pushInt(v);
	end

-- �ܾ����ʱ��
	networkengine:pushInt(string.len(data.clearFriendReject));
	networkengine:pushString(data.clearFriendReject, string.len(data.clearFriendReject));
-- �������Ի����ʱ�䣨��һ�������������ڼ��죩
	local arrayLength = #data.limitActivityPvpOfflineStamp;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.limitActivityPvpOfflineStamp) do
		networkengine:pushInt(v);
	end

-- �������Ի����ID�飨limitActivity.xls�е�ID��
	local arrayLength = #data.limitActivityPvpOfflineID;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.limitActivityPvpOfflineID) do
		networkengine:pushInt(v);
	end

-- Զ��װ��ϵ��
	networkengine:pushFloat(data.crusadeEquipRatio);
-- Զ������-�����Ǽ�ϵ��
	local arrayLength = #data.starCrusadeRatio;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.starCrusadeRatio) do
		networkengine:pushFloat(v);
	end

-- Զ������-����Ʒ��ϵ��
	local arrayLength = #data.classCrusadeRatio;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.classCrusadeRatio) do
		networkengine:pushFloat(v);
	end

-- Զ��-������������
	networkengine:pushInt(data.crusadeDayLimit);
-- Զ��-�ȼ�����
	networkengine:pushInt(data.crusadeLevelLimit);
-- Զ��-ÿ�չر�ʱ��
	networkengine:pushInt(string.len(data.crusadeCloseTime));
	networkengine:pushString(data.crusadeCloseTime, string.len(data.crusadeCloseTime));
-- Զ��-���⽱������
	networkengine:pushFloat(data.crusadeExtraCondition);
-- Զ����������
	local arrayLength = #data.crusadeExtraRewardType;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.crusadeExtraRewardType) do
		networkengine:pushInt(v);
	end

-- Զ������ID
	local arrayLength = #data.crusadeExtraRewardID;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.crusadeExtraRewardID) do
		networkengine:pushInt(v);
	end

-- Զ����������
	local arrayLength = #data.crusadeExtraRewardCount;
	if arrayLength > 1 then arrayLength = 1 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.crusadeExtraRewardCount) do
		networkengine:pushInt(v);
	end

-- ����ع�-ÿ�ι�������
	networkengine:pushInt(data.redeemExpCount);
-- �������-VIP�ȼ�����
	networkengine:pushInt(data.redeemVigorLimit);
-- �������-�����ʼ�id
	networkengine:pushInt(data.redeemVigorMailID);
-- �����һ�-������սVIP�ȼ�����
	networkengine:pushInt(data.redeemChallengeSpeedLimit);
-- �����һ�-������ս�����ʼ�id
	networkengine:pushInt(data.redeemChallengeSpeedMailID);
-- �����һ�-������ս��������ϵ��
	networkengine:pushFloat(data.redeemChallengeSpeedRatio);
-- �����һ�-Զ��VIP�ȼ�����
	networkengine:pushInt(data.redeemCrusadeLimit);
-- �����һ�-Զ�������ʼ�id
	networkengine:pushInt(data.redeemCrusadeMailID);
-- �����һ�-Զ������ϵ��
	networkengine:pushFloat(data.redeemCrusadeRatio);
-- ����-������������
	networkengine:pushInt(data.friendsGiftsVigorTimes);
-- ����-��ȡ��������
	networkengine:pushInt(data.friendsGetVigorTimes);
-- ����-ÿ����ȡ��������
	networkengine:pushInt(data.friendsVigorCount);
-- ����ϵͳ-������������ȼ�
	networkengine:pushInt(data.idolLevelLimit);
-- ����ϵͳ-��ϵͳĿǰ���ŵ����ȼ�
	networkengine:pushInt(data.idolMaxLevel);
-- ����ϵͳ-���ټ����ܱ��������ڱ�������
	networkengine:pushInt(data.plunderLevelLimit);
-- ����ϵͳ-ÿ��ˢ���ڣ��������ٴΣ�һ��ˢ3���أ�
	networkengine:pushInt(data.plunderTimes);
-- ����ϵͳ-ÿ��ˢ�µ�CDʱ�䣬��λΪ��
	networkengine:pushInt(data.plunderCollDown);
-- ����ϵͳ-��������Դ�ĸ��ʣ��Ӹߵ��ͣ�
	local arrayLength = #data.plunderProbability;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.plunderProbability) do
		networkengine:pushInt(v);
	end

-- ����ʤ���ص���������
	networkengine:pushInt(data.plunderWinHonor);
-- ��������߸���֮��ϵͳ����ı���ʱ��
	networkengine:pushInt(data.plunderProtectTime);
-- ���ᱣ��ʱ��,ÿ�ι���ļ۸�
	networkengine:pushInt(data.purchaseProtectTimePrice);
-- ���ᱣ��ʱ�䣬ÿ�ι����ʱ���������Σ��ۼӣ�
	networkengine:pushInt(data.purchaseProtectTime);
-- ΢��ǩ��-����ǩ�����������ʼ�id
	networkengine:pushInt(data.signInMailID);
-- ΢��ǩ��-�״�ǩ�����������ʼ�id
	networkengine:pushInt(data.firstSignInMailID);
-- ΢��ǩ��-��������ǩ�����������ʼ�id
	networkengine:pushInt(data.continuousSignInMailID);
-- ҡ�������ʱ��
	networkengine:pushInt(string.len(data.redEnvelopeOpenTime));
	networkengine:pushString(data.redEnvelopeOpenTime, string.len(data.redEnvelopeOpenTime));
-- ҡ�������ʱ��
	networkengine:pushInt(string.len(data.redEnvelopeCloseTime));
	networkengine:pushString(data.redEnvelopeCloseTime, string.len(data.redEnvelopeCloseTime));
-- ҡ����ȼ�����
	networkengine:pushInt(data.redEnvelopeLevelLimit);
-- ҡ�������ο���
	local arrayLength = #data.redEnvelopeLotteryLimit;
	if arrayLength > 16 then arrayLength = 16 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.redEnvelopeLotteryLimit) do
		networkengine:pushFloat(v);
	end

-- ҡ����ʼ�ID
	networkengine:pushInt(data.redEnvelopeMailID);
-- ����-�����ȼ�
	networkengine:pushInt(data.guildLevelLimit);
-- ����-��������������ʯ����
	networkengine:pushInt(data.createGuildPrice);
-- ����-��������
	networkengine:pushInt(data.guildPeopleLimit);
-- ����-���ǩ����������
	networkengine:pushInt(data.guildSignInGoldRewardCount);
-- ����-�����б���������
	networkengine:pushInt(data.guildApplicationListPeopleLimit);
-- ���Ὺʼʱ��
	networkengine:pushInt(string.len(data.guildWarBegin));
	networkengine:pushString(data.guildWarBegin, string.len(data.guildWarBegin));
-- �������ʱ��
	networkengine:pushInt(string.len(data.guildWarFinish));
	networkengine:pushString(data.guildWarFinish, string.len(data.guildWarFinish));
-- ����ս��Ա��๥������
	networkengine:pushInt(data.guildMaxFightCount);
-- �����г��ϵ��������
	networkengine:pushInt(data.guildMaxMangers);
-- ����ս�����������Ӿ�������
	networkengine:pushInt(data.guildWarBuffAtk);
-- ����ս�����������Ӿ�������
	networkengine:pushInt(data.guildWarBuffDef);
-- �ݵ���ƽ������ϵ���ӳ�
	local arrayLength = #data.guildWarTypeRat;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.guildWarTypeRat) do
		networkengine:pushInt(v);
	end

-- ����ս���������������ڼ���
	networkengine:pushInt(data.guildWarOpenDays);
-- ����ս����������������������������
	networkengine:pushInt(data.guildWarInspireTime);
-- ����ս�����ʼ�id
	networkengine:pushInt(data.guildWarRewardMailID);
-- ����ս���ƾݵ㽱��
	networkengine:pushInt(data.guildWarBreakPostMailID);
-- ������־-����᳤
	networkengine:pushInt(string.len(data.guildLeaderName));
	networkengine:pushString(data.guildLeaderName, string.len(data.guildLeaderName));
-- ������־-���᳤��
	networkengine:pushInt(string.len(data.guildManagerName));
	networkengine:pushString(data.guildManagerName, string.len(data.guildManagerName));
-- ������־-�����Ա
	networkengine:pushInt(string.len(data.guildMemberName));
	networkengine:pushString(data.guildMemberName, string.len(data.guildMemberName));
end

function ParseRowConfig()
	local tempArrayCount = 0;
	local data = {};

	data['startLevelTable'] = {};
	data['magicLevelExp'] = {};
	data['bornCardID'] = {};
	data['bornCardStarLevel'] = {};
	data['bornMagicID'] = {};
	data['bornMagicStarLevel'] = {};
	data['firstChargeRewardType'] = {};
	data['firstChargeRewardID'] = {};
	data['firstChargeRewardCount'] = {};
	data['adventure'] = {};
	data['initialMeditation'] = {};
	data['woodToLumber_p'] = {};
	data['woodToLumber_output'] = {};
	data['equipEhanceChance'] = {};
	data['equipEhanceValue'] = {};
	data['drawCardProbabilty'] = {};
	data['initialDraw'] = {};
	data['shopRefleshTimes'] = {};
	data['pvpBeginTime'] = {};
	data['pvpEndTime'] = {};
	data['pvpTolerance'] = {};
	data['pvpOfflineRefleshTimes'] = {};
	data['challengeSpeedStageID'] = {};
	data['challengeSpeedMagicID'] = {};
	data['challengeDamageStageID'] = {};
	data['FoodReleaseTime'] = {};
	data['startLevelRatio'] = {};
	data['classLevelRatio'] = {};
	data['magicLevelRatio'] = {};
	data['initShipPosX'] = {};
	data['initShipPosY'] = {};
	data['limitActivityPvpOfflineStamp'] = {};
	data['limitActivityPvpOfflineID'] = {};
	data['starCrusadeRatio'] = {};
	data['classCrusadeRatio'] = {};
	data['crusadeExtraRewardType'] = {};
	data['crusadeExtraRewardID'] = {};
	data['crusadeExtraRewardCount'] = {};
	data['plunderProbability'] = {};
	data['redEnvelopeLotteryLimit'] = {};
	data['guildWarTypeRat'] = {};
-- ������
	data['id'] = networkengine:parseInt();
-- ����ʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['openServerData'] = networkengine:parseString(strlength);
else
		data['openServerData'] = "";
end
-- �ۺ�-��ҵȼ�����
	data['playerMaxLevel'] = networkengine:parseInt();
-- �ۺ�-�����Ǽ���Ӧ�ľ���ֵ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['startLevelTable'][i] = networkengine:parseInt();
	end
-- �ۺ�-ħ���Ǽ���Ӧ�ľ���ֵ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['magicLevelExp'][i] = networkengine:parseInt();
	end
-- �ۺ�-��ʼ���Ż�����ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['bornCardID'][i] = networkengine:parseInt();
	end
-- �ۺ�-��ʼ�����Ǽ�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['bornCardStarLevel'][i] = networkengine:parseInt();
	end
-- �ۺ�-���������Ƭת�����ı���
	data['overflowCardexpToHonor'] = networkengine:parseInt();
-- �ۺ�-��ʼħ��ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['bornMagicID'][i] = networkengine:parseInt();
	end
-- �ۺ�-��ʼħ���Ǽ�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['bornMagicStarLevel'][i] = networkengine:parseInt();
	end
-- �ۺ�-�¿���Ч����
	data['monthCardDays'] = networkengine:parseInt();
-- �ۺ�-����߼�ˢ��ʱ���
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['playerRefleshTime'] = networkengine:parseString(strlength);
else
		data['playerRefleshTime'] = "";
end
-- �ۺ�-1��ʯ��Ӧ����Ľ���ʱ�䣨�룩
	data['diamondCost_upgradeImmediate'] = networkengine:parseInt();
-- �ۺ�-�������ƻ�����ʯ
	data['renameCost'] = networkengine:parseInt();
-- ս��ƽ����-ս���˺���������
	data['criticalFactor'] = networkengine:parseFloat();
-- ս��ƽ����-ս������������
	data['baseCritical'] = networkengine:parseFloat();
-- ս��ƽ����-ÿ��ս�����غ���
	data['maxRounds'] = networkengine:parseInt();
-- ս��ƽ����-Զ�̾��ŶԽ���Ŀ����˺�ϵ��
	data['damageDistanceRatio'] = networkengine:parseFloat();
-- �׳佱��-��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['firstChargeRewardType'][i] = networkengine:parseInt();
	end
-- �׳佱��-����ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['firstChargeRewardID'][i] = networkengine:parseInt();
	end
-- �׳佱��-��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['firstChargeRewardCount'][i] = networkengine:parseInt();
	end
-- ����-��ʯ�����õ�����
	data['diamondToVigor'] = networkengine:parseInt();
-- ����-�����ȡ��õ�����
	data['freeVigor'] = networkengine:parseInt();
-- ����-�Զ��ָ�������룩
	data['vigorRegenerationInterval'] = networkengine:parseInt();
-- ��ͼ-ɨ��ȯID
	data['sweepScrollID'] = networkengine:parseInt();
-- ��ͼ-ɨ��ȯÿ������ID
	data['sweepTaskID'] = networkengine:parseInt();
-- ��ͼ-vip�ı�ɨ��ȯ�����ʼ�ID
	data['sweepCompensateMailID'] = networkengine:parseInt();
-- ��ͼ-���������������������
	data['adventurePerfectLimit'] = networkengine:parseInt();
-- ��ͼ-��Ӣ�ؿ�����������ͨ�ؿ����ȣ�������
	data['eliteAdventureLimit'] = networkengine:parseInt();
-- Adventure
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['adventure'][i] = ParseAdventure();
	end
-- ���-��ʯ�������൱�ڼ�Сʱ�������Ľ��
	data['diamondToGold'] = networkengine:parseInt();
-- ���-����ʼ��ң��룩
	data['goldMineStack'] = networkengine:parseInt();
-- ��ʦ��-��ʦ����ʼڤ��������㣩
	data['meditationStack'] = networkengine:parseInt();
-- ÿ������ʯ����ħ�������ĸ���
	data['diamondToMagicExp'] = networkengine:parseInt();
-- InitialMeditation
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['initialMeditation'][i] = ParseInitialMeditation();
	end
-- ��ľ��-��ľ����ʼԭľ��
	data['lumberMillStack'] = networkengine:parseInt();
-- ��ľ��-��ľ��ԭľ����������룩
	data['lumberMillInterval'] = networkengine:parseInt();
-- ��ľ��-ľ�ļӹ���ʽ���ָ���
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['woodToLumber_p'][i] = networkengine:parseInt();
	end
-- ��ľ��-�ӹ���ʽ��Ӧ�Ĳ���ϵ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['woodToLumber_output'][i] = networkengine:parseInt();
	end
-- ������-װ��ǿ���������ָ���
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['equipEhanceChance'][i] = networkengine:parseInt();
	end
-- ������-װ��ǿ�����ӵ���ɶ�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['equipEhanceValue'][i] = networkengine:parseInt();
	end
-- �鿨�����ţ�-��ѳ鿨��ʱ������Сʱ��
	data['freeDrawInterval'] = networkengine:parseInt();
-- �鿨�����ţ�-��һ��������ʯ����
	data['drawOnceCost'] = networkengine:parseInt();
-- �鿨�����ţ�-��ʮ��������ʯ����
	data['drawTentimesCost'] = networkengine:parseInt();
-- �鿨�����ţ�-����ż��δ��������ڻ���
	data['cardAwardsNode'] = networkengine:parseInt();
-- �鿨�����ţ�-�鿨ϵͳ���Ǽ����ָ���
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['drawCardProbabilty'][i] = networkengine:parseInt();
	end
-- InitialDraw
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['initialDraw'][i] = ParseInitialDraw();
	end
-- �̵�-�����̵깦��������ҵȼ�
	data['shopLevelLimit'] = networkengine:parseInt();
-- �̵�-�̵��Զ�ˢ��ʱ���
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
	local strlength = networkengine:parseInt();
if strlength > 0 then
			data['shopRefleshTimes'][i] = networkengine:parseString(strlength);
else
			data['shopRefleshTimes'][i] = "";
end
	end
-- ͬ��pvp-�ȼ�����
	data['pvpOnlineLevelLimit'] = networkengine:parseInt();
-- ͬ��pvp-���ʤ������
	data['pvpOnlineWinLimit'] = networkengine:parseInt();
-- ͬ��pvp-���ʧ�ܳ���
	data['pvpOnlineFailLimit'] = networkengine:parseInt();
-- ͬ��pvp-��ʼʱ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
	local strlength = networkengine:parseInt();
if strlength > 0 then
			data['pvpBeginTime'][i] = networkengine:parseString(strlength);
else
			data['pvpBeginTime'][i] = "";
end
	end
-- ͬ��pvp-����ʱ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
	local strlength = networkengine:parseInt();
if strlength > 0 then
			data['pvpEndTime'][i] = networkengine:parseString(strlength);
else
			data['pvpEndTime'][i] = "";
end
	end
-- ͬ��PVP-��������ʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['pvpOnlineRewardTime'] = networkengine:parseString(strlength);
else
		data['pvpOnlineRewardTime'] = "";
end
-- ͬ��PVP-�ݲ�ʱ���飨�룩
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['pvpTolerance'][i] = networkengine:parseInt();
	end
-- ͬ��PVPƥ��CDʱ��
	data['pvpOnlineCoolDown'] = networkengine:parseInt();
-- ͬ��PVPħ���ͷų�ʱʱ�䣨�룩
	data['pvpOnlineTimeOut'] = networkengine:parseInt();
-- ͬ��PVP-�ʼ��ı�ID
	data['pvpOnlineMailStringID'] = networkengine:parseInt();
-- �첽PVP-�ȼ�����
	data['pvpOfflineLevelLimit'] = networkengine:parseInt();
-- �첽PVP-��������ʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['pvpOfflineRewardTime'] = networkengine:parseString(strlength);
else
		data['pvpOfflineRewardTime'] = "";
end
-- �첽PVP-���а񱣴�ʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['ladderSaveTime'] = networkengine:parseString(strlength);
else
		data['ladderSaveTime'] = "";
end
-- �첽PVP-��ս����ˢ��ʱ���
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
	local strlength = networkengine:parseInt();
if strlength > 0 then
			data['pvpOfflineRefleshTimes'][i] = networkengine:parseString(strlength);
else
			data['pvpOfflineRefleshTimes'][i] = "";
end
	end
-- �첽PVP-��ս����
	data['pvpOfflineFightTimes'] = networkengine:parseInt();
-- �첽PVP-������ս�������ѵ���ʯ
	data['pvpOfflineResetTimes'] = networkengine:parseInt();
-- �첽PVP-��ս��ȴʱ�䣨�룩
	data['pvpOfflineCD'] = networkengine:parseInt();
-- �첽PVP-VIP�ȼ����ڵ��ڸ�ֵʱ����ս��ȴʱ��
	data['pvpOfflineCDVipLevel'] = networkengine:parseInt();
-- �첽PVP-1��ʯ��Ӧ����ȴʱ�䣨�룩
	data['pvpOfflineDiamondCost'] = networkengine:parseInt();
-- �첽PVP-���а��������
	data['pvpOfflineMaxRank'] = networkengine:parseInt();
-- �첽PVP-����ƥ�䰴ť����ȴʱ�䣨�룩
	data['pvpOfflineRematchCD'] = networkengine:parseInt();
-- �첽PVP-�ʼ��ı�ID
	data['pvpOfflineMailStringID'] = networkengine:parseInt();
-- ������ս-�ȼ�����
	data['challengeSpeedLevelLimit'] = networkengine:parseInt();
-- ������ս-�ر�ʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['challengeSpeedCloseTime'] = networkengine:parseString(strlength);
else
		data['challengeSpeedCloseTime'] = "";
end
-- ������ս-�ؿ�ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['challengeSpeedStageID'][i] = networkengine:parseInt();
	end
-- ������ս-ħ��ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['challengeSpeedMagicID'][i] = networkengine:parseInt();
	end
-- ������ս-�ʼ��ı�ID
	data['challengeSpeedMailStringID'] = networkengine:parseInt();
-- ������ս-�����־
	data['challengeSpeedLog'] = networkengine:parseBool();
-- �˺����а�-�ȼ�����
	data['challengeDamageLevelLimit'] = networkengine:parseInt();
-- �˺����а�-�ر�ʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['challengeDamageCloseTime'] = networkengine:parseString(strlength);
else
		data['challengeDamageCloseTime'] = "";
end
-- �˺����а�-ÿ�մ�������
	data['challengeDamageTimesLimit'] = networkengine:parseInt();
-- �˺����а�-�ؿ�ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['challengeDamageStageID'][i] = networkengine:parseInt();
	end
-- �˺����а�-��������ǰ�ı���¼��
	data['challengeDamageMaxSaveRank'] = networkengine:parseInt();
-- �˺����а�-�ı�ID
	data['challengeDamageMailStringID'] = networkengine:parseInt();
-- �˺����а�-�Ѷ�ϵ��
	data['challengeDamageDegree'] = networkengine:parseFloat();
-- ��������������ս-ÿ����ս����(����)
	data['challengeStageTimesLimit'] = networkengine:parseInt();
-- ������ս-��ս��ȴʱ�䣨�룩
	data['challengeStageCD'] = networkengine:parseInt();
-- ����������������ʱ�䣨������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['FoodReleaseTime'][i] = networkengine:parseInt();
	end
-- ���������������ű�����������
	data['FoodReleaseRatio'] = networkengine:parseInt();
-- ս��������-�����Ǽ�ϵ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['startLevelRatio'][i] = networkengine:parseFloat();
	end
-- ս��������-����Ʒ��ϵ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['classLevelRatio'][i] = networkengine:parseFloat();
	end
-- ս��������-ħ���Ǽ�ϵ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['magicLevelRatio'][i] = networkengine:parseFloat();
	end
-- ս��������-ս����ϵ��A
	data['fightingCapacityRatioA'] = networkengine:parseFloat();
-- ս��������-ս����ϵ��B
	data['fightingCapacityRatioB'] = networkengine:parseFloat();
-- ս��������-ս����ϵ��C
	data['fightingCapacityRatioC'] = networkengine:parseFloat();
-- ��������-ս���Զ������ȼ�����
	data['shipAutoLvUpLv'] = networkengine:parseInt();
-- ��ʼս��λ��X
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['initShipPosX'][i] = networkengine:parseInt();
	end
-- ��ʼս��λ��Y
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['initShipPosY'][i] = networkengine:parseInt();
	end
-- �ܾ����ʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['clearFriendReject'] = networkengine:parseString(strlength);
else
		data['clearFriendReject'] = "";
end
-- �������Ի����ʱ�䣨��һ�������������ڼ��죩
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['limitActivityPvpOfflineStamp'][i] = networkengine:parseInt();
	end
-- �������Ի����ID�飨limitActivity.xls�е�ID��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['limitActivityPvpOfflineID'][i] = networkengine:parseInt();
	end
-- Զ��װ��ϵ��
	data['crusadeEquipRatio'] = networkengine:parseFloat();
-- Զ������-�����Ǽ�ϵ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['starCrusadeRatio'][i] = networkengine:parseFloat();
	end
-- Զ������-����Ʒ��ϵ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['classCrusadeRatio'][i] = networkengine:parseFloat();
	end
-- Զ��-������������
	data['crusadeDayLimit'] = networkengine:parseInt();
-- Զ��-�ȼ�����
	data['crusadeLevelLimit'] = networkengine:parseInt();
-- Զ��-ÿ�չر�ʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['crusadeCloseTime'] = networkengine:parseString(strlength);
else
		data['crusadeCloseTime'] = "";
end
-- Զ��-���⽱������
	data['crusadeExtraCondition'] = networkengine:parseFloat();
-- Զ����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['crusadeExtraRewardType'][i] = networkengine:parseInt();
	end
-- Զ������ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['crusadeExtraRewardID'][i] = networkengine:parseInt();
	end
-- Զ����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['crusadeExtraRewardCount'][i] = networkengine:parseInt();
	end
-- ����ع�-ÿ�ι�������
	data['redeemExpCount'] = networkengine:parseInt();
-- �������-VIP�ȼ�����
	data['redeemVigorLimit'] = networkengine:parseInt();
-- �������-�����ʼ�id
	data['redeemVigorMailID'] = networkengine:parseInt();
-- �����һ�-������սVIP�ȼ�����
	data['redeemChallengeSpeedLimit'] = networkengine:parseInt();
-- �����һ�-������ս�����ʼ�id
	data['redeemChallengeSpeedMailID'] = networkengine:parseInt();
-- �����һ�-������ս��������ϵ��
	data['redeemChallengeSpeedRatio'] = networkengine:parseFloat();
-- �����һ�-Զ��VIP�ȼ�����
	data['redeemCrusadeLimit'] = networkengine:parseInt();
-- �����һ�-Զ�������ʼ�id
	data['redeemCrusadeMailID'] = networkengine:parseInt();
-- �����һ�-Զ������ϵ��
	data['redeemCrusadeRatio'] = networkengine:parseFloat();
-- ����-������������
	data['friendsGiftsVigorTimes'] = networkengine:parseInt();
-- ����-��ȡ��������
	data['friendsGetVigorTimes'] = networkengine:parseInt();
-- ����-ÿ����ȡ��������
	data['friendsVigorCount'] = networkengine:parseInt();
-- ����ϵͳ-������������ȼ�
	data['idolLevelLimit'] = networkengine:parseInt();
-- ����ϵͳ-��ϵͳĿǰ���ŵ����ȼ�
	data['idolMaxLevel'] = networkengine:parseInt();
-- ����ϵͳ-���ټ����ܱ��������ڱ�������
	data['plunderLevelLimit'] = networkengine:parseInt();
-- ����ϵͳ-ÿ��ˢ���ڣ��������ٴΣ�һ��ˢ3���أ�
	data['plunderTimes'] = networkengine:parseInt();
-- ����ϵͳ-ÿ��ˢ�µ�CDʱ�䣬��λΪ��
	data['plunderCollDown'] = networkengine:parseInt();
-- ����ϵͳ-��������Դ�ĸ��ʣ��Ӹߵ��ͣ�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['plunderProbability'][i] = networkengine:parseInt();
	end
-- ����ʤ���ص���������
	data['plunderWinHonor'] = networkengine:parseInt();
-- ��������߸���֮��ϵͳ����ı���ʱ��
	data['plunderProtectTime'] = networkengine:parseInt();
-- ���ᱣ��ʱ��,ÿ�ι���ļ۸�
	data['purchaseProtectTimePrice'] = networkengine:parseInt();
-- ���ᱣ��ʱ�䣬ÿ�ι����ʱ���������Σ��ۼӣ�
	data['purchaseProtectTime'] = networkengine:parseInt();
-- ΢��ǩ��-����ǩ�����������ʼ�id
	data['signInMailID'] = networkengine:parseInt();
-- ΢��ǩ��-�״�ǩ�����������ʼ�id
	data['firstSignInMailID'] = networkengine:parseInt();
-- ΢��ǩ��-��������ǩ�����������ʼ�id
	data['continuousSignInMailID'] = networkengine:parseInt();
-- ҡ�������ʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['redEnvelopeOpenTime'] = networkengine:parseString(strlength);
else
		data['redEnvelopeOpenTime'] = "";
end
-- ҡ�������ʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['redEnvelopeCloseTime'] = networkengine:parseString(strlength);
else
		data['redEnvelopeCloseTime'] = "";
end
-- ҡ����ȼ�����
	data['redEnvelopeLevelLimit'] = networkengine:parseInt();
-- ҡ�������ο���
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['redEnvelopeLotteryLimit'][i] = networkengine:parseFloat();
	end
-- ҡ����ʼ�ID
	data['redEnvelopeMailID'] = networkengine:parseInt();
-- ����-�����ȼ�
	data['guildLevelLimit'] = networkengine:parseInt();
-- ����-��������������ʯ����
	data['createGuildPrice'] = networkengine:parseInt();
-- ����-��������
	data['guildPeopleLimit'] = networkengine:parseInt();
-- ����-���ǩ����������
	data['guildSignInGoldRewardCount'] = networkengine:parseInt();
-- ����-�����б���������
	data['guildApplicationListPeopleLimit'] = networkengine:parseInt();
-- ���Ὺʼʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['guildWarBegin'] = networkengine:parseString(strlength);
else
		data['guildWarBegin'] = "";
end
-- �������ʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['guildWarFinish'] = networkengine:parseString(strlength);
else
		data['guildWarFinish'] = "";
end
-- ����ս��Ա��๥������
	data['guildMaxFightCount'] = networkengine:parseInt();
-- �����г��ϵ��������
	data['guildMaxMangers'] = networkengine:parseInt();
-- ����ս�����������Ӿ�������
	data['guildWarBuffAtk'] = networkengine:parseInt();
-- ����ս�����������Ӿ�������
	data['guildWarBuffDef'] = networkengine:parseInt();
-- �ݵ���ƽ������ϵ���ӳ�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['guildWarTypeRat'][i] = networkengine:parseInt();
	end
-- ����ս���������������ڼ���
	data['guildWarOpenDays'] = networkengine:parseInt();
-- ����ս����������������������������
	data['guildWarInspireTime'] = networkengine:parseInt();
-- ����ս�����ʼ�id
	data['guildWarRewardMailID'] = networkengine:parseInt();
-- ����ս���ƾݵ㽱��
	data['guildWarBreakPostMailID'] = networkengine:parseInt();
-- ������־-����᳤
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['guildLeaderName'] = networkengine:parseString(strlength);
else
		data['guildLeaderName'] = "";
end
-- ������־-���᳤��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['guildManagerName'] = networkengine:parseString(strlength);
else
		data['guildManagerName'] = "";
end
-- ������־-�����Ա
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['guildMemberName'] = networkengine:parseString(strlength);
else
		data['guildMemberName'] = "";
end

	return data;
end

------------------typedef RowChapter ----------------------------------
function sendPushRowChapter(data)
-- ���
	networkengine:pushInt(data.id);
-- �ؿ��ڵ�
	networkengine:pushInt(data.adventureID);
-- ChapterRewardList
	local arrayLength = #data.chapterRewardList;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.chapterRewardList) do
		sendPushChapterRewardList(v);
	end

end

function ParseRowChapter()
	local tempArrayCount = 0;
	local data = {};

	data['chapterRewardList'] = {};
-- ���
	data['id'] = networkengine:parseInt();
-- �ؿ��ڵ�
	data['adventureID'] = networkengine:parseInt();
-- ChapterRewardList
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['chapterRewardList'][i] = ParseChapterRewardList();
	end

	return data;
end

------------------typedef RowChallengeSpeed ----------------------------------
function sendPushRowChallengeSpeed(data)
-- id
	networkengine:pushInt(data.id);
-- ����
	networkengine:pushInt(data.rank);
-- �صý�������
	local arrayLength = #data.rewardType;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- �صý���ID
	local arrayLength = #data.rewardID;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- �صý�������
	local arrayLength = #data.rewardCount;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

end

function ParseRowChallengeSpeed()
	local tempArrayCount = 0;
	local data = {};

	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
-- id
	data['id'] = networkengine:parseInt();
-- ����
	data['rank'] = networkengine:parseInt();
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- �صý���ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RowChallengeDamage ----------------------------------
function sendPushRowChallengeDamage(data)
-- id
	networkengine:pushInt(data.id);
-- ����
	networkengine:pushInt(data.rank);
-- �صý�������
	local arrayLength = #data.rewardType;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardType) do
		networkengine:pushInt(v);
	end

-- �صý���ID
	local arrayLength = #data.rewardID;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardID) do
		networkengine:pushInt(v);
	end

-- �صý�������
	local arrayLength = #data.rewardCount;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.rewardCount) do
		networkengine:pushInt(v);
	end

end

function ParseRowChallengeDamage()
	local tempArrayCount = 0;
	local data = {};

	data['rewardType'] = {};
	data['rewardID'] = {};
	data['rewardCount'] = {};
-- id
	data['id'] = networkengine:parseInt();
-- ����
	data['rank'] = networkengine:parseInt();
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardType'][i] = networkengine:parseInt();
	end
-- �صý���ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardID'][i] = networkengine:parseInt();
	end
-- �صý�������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['rewardCount'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef RowBuff ----------------------------------
function sendPushRowBuff(data)
-- ID
	networkengine:pushInt(data.id);
-- ������
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- BuffӰ������
	networkengine:pushInt(data.type);
-- ������ʱ��
	networkengine:pushInt(data.moment);
-- ������
	networkengine:pushInt(data.maxOverlapCount);
-- ����״̬����
	networkengine:pushInt(data.buffFlag);
-- ������ɢ
	networkengine:pushBool(data.disperse);
-- ������ʧ
	networkengine:pushBool(data.dieDisappear);
-- ��͸����ʧ
	networkengine:pushBool(data.absoluteDieDisappear);
-- ������ʧ
	networkengine:pushBool(data.injuredDisappear);
-- ʩ����������ʧ
	networkengine:pushBool(data.casterDieDisappear);
-- ������
	networkengine:pushBool(data.increase);
-- �µĸ����ϵ�
	networkengine:pushBool(data.override);
-- ��ǩ
	networkengine:pushInt(data.tag);
-- ��������
	networkengine:pushInt(data.special);
-- Я������
	networkengine:pushBool(data.addskill);
-- ������Ѫ
	networkengine:pushBool(data.hot);
-- �����˺�
	networkengine:pushInt(data.dot);
-- ����1
	networkengine:pushInt(data.attr1);
-- ���԰ٷֱ�1
	networkengine:pushInt(data.percent1);
-- ״̬1
	networkengine:pushInt(data.status1);
-- ����2
	networkengine:pushInt(data.attr2);
-- ���԰ٷֱ�2
	networkengine:pushInt(data.percent2);
-- ״̬2
	networkengine:pushInt(data.status2);
-- ����3
	networkengine:pushInt(data.attr3);
-- ���԰ٷֱ�3
	networkengine:pushInt(data.percent3);
-- ״̬3
	networkengine:pushInt(data.status3);
-- ����4
	networkengine:pushInt(data.attr4);
-- ���԰ٷֱ�4
	networkengine:pushInt(data.percent4);
-- ״̬4
	networkengine:pushInt(data.status4);
end

function ParseRowBuff()
	local tempArrayCount = 0;
	local data = {};

-- ID
	data['id'] = networkengine:parseInt();
-- ������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- BuffӰ������
	data['type'] = networkengine:parseInt();
-- ������ʱ��
	data['moment'] = networkengine:parseInt();
-- ������
	data['maxOverlapCount'] = networkengine:parseInt();
-- ����״̬����
	data['buffFlag'] = networkengine:parseInt();
-- ������ɢ
	data['disperse'] = networkengine:parseBool();
-- ������ʧ
	data['dieDisappear'] = networkengine:parseBool();
-- ��͸����ʧ
	data['absoluteDieDisappear'] = networkengine:parseBool();
-- ������ʧ
	data['injuredDisappear'] = networkengine:parseBool();
-- ʩ����������ʧ
	data['casterDieDisappear'] = networkengine:parseBool();
-- ������
	data['increase'] = networkengine:parseBool();
-- �µĸ����ϵ�
	data['override'] = networkengine:parseBool();
-- ��ǩ
	data['tag'] = networkengine:parseInt();
-- ��������
	data['special'] = networkengine:parseInt();
-- Я������
	data['addskill'] = networkengine:parseBool();
-- ������Ѫ
	data['hot'] = networkengine:parseBool();
-- �����˺�
	data['dot'] = networkengine:parseInt();
-- ����1
	data['attr1'] = networkengine:parseInt();
-- ���԰ٷֱ�1
	data['percent1'] = networkengine:parseInt();
-- ״̬1
	data['status1'] = networkengine:parseInt();
-- ����2
	data['attr2'] = networkengine:parseInt();
-- ���԰ٷֱ�2
	data['percent2'] = networkengine:parseInt();
-- ״̬2
	data['status2'] = networkengine:parseInt();
-- ����3
	data['attr3'] = networkengine:parseInt();
-- ���԰ٷֱ�3
	data['percent3'] = networkengine:parseInt();
-- ״̬3
	data['status3'] = networkengine:parseInt();
-- ����4
	data['attr4'] = networkengine:parseInt();
-- ���԰ٷֱ�4
	data['percent4'] = networkengine:parseInt();
-- ״̬4
	data['status4'] = networkengine:parseInt();

	return data;
end

------------------typedef RowAura ----------------------------------
function sendPushRowAura(data)
-- ID
	networkengine:pushInt(data.id);
-- ������
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- �⻷����
	networkengine:pushInt(data.type);
-- ��Χ
	networkengine:pushInt(data.range);
-- ����ɸѡ
	networkengine:pushInt(data.forceSelect);
-- ����ɸѡ
	networkengine:pushInt(data.raceSelect);
-- ��Զ��ɸѡ
	networkengine:pushInt(data.rangeSelect);
-- �ƶ�����ɸѡ
	networkengine:pushInt(data.moveTypeSelect);
-- �˺�����ɸѡ
	networkengine:pushInt(data.damageTypeSelect);
-- Я������
	networkengine:pushBool(data.addskill);
-- ����1
	networkengine:pushInt(data.attr1);
-- ���԰ٷֱ�1
	networkengine:pushInt(data.percent1);
-- ״̬1
	networkengine:pushInt(data.status1);
-- ����2
	networkengine:pushInt(data.attr2);
-- ���԰ٷֱ�2
	networkengine:pushInt(data.percent2);
-- ״̬2
	networkengine:pushInt(data.status2);
-- ����3
	networkengine:pushInt(data.attr3);
-- ���԰ٷֱ�3
	networkengine:pushInt(data.percent3);
-- ״̬3
	networkengine:pushInt(data.status3);
-- ����4
	networkengine:pushInt(data.attr4);
-- ���԰ٷֱ�4
	networkengine:pushInt(data.percent4);
-- ״̬4
	networkengine:pushInt(data.status4);
end

function ParseRowAura()
	local tempArrayCount = 0;
	local data = {};

-- ID
	data['id'] = networkengine:parseInt();
-- ������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- �⻷����
	data['type'] = networkengine:parseInt();
-- ��Χ
	data['range'] = networkengine:parseInt();
-- ����ɸѡ
	data['forceSelect'] = networkengine:parseInt();
-- ����ɸѡ
	data['raceSelect'] = networkengine:parseInt();
-- ��Զ��ɸѡ
	data['rangeSelect'] = networkengine:parseInt();
-- �ƶ�����ɸѡ
	data['moveTypeSelect'] = networkengine:parseInt();
-- �˺�����ɸѡ
	data['damageTypeSelect'] = networkengine:parseInt();
-- Я������
	data['addskill'] = networkengine:parseBool();
-- ����1
	data['attr1'] = networkengine:parseInt();
-- ���԰ٷֱ�1
	data['percent1'] = networkengine:parseInt();
-- ״̬1
	data['status1'] = networkengine:parseInt();
-- ����2
	data['attr2'] = networkengine:parseInt();
-- ���԰ٷֱ�2
	data['percent2'] = networkengine:parseInt();
-- ״̬2
	data['status2'] = networkengine:parseInt();
-- ����3
	data['attr3'] = networkengine:parseInt();
-- ���԰ٷֱ�3
	data['percent3'] = networkengine:parseInt();
-- ״̬3
	data['status3'] = networkengine:parseInt();
-- ����4
	data['attr4'] = networkengine:parseInt();
-- ���԰ٷֱ�4
	data['percent4'] = networkengine:parseInt();
-- ״̬4
	data['status4'] = networkengine:parseInt();

	return data;
end

------------------typedef RowAdventure ----------------------------------
function sendPushRowAdventure(data)
-- ���
	networkengine:pushInt(data.id);
-- Limit
	local arrayLength = #data.limit;
	if arrayLength > 2 then arrayLength = 2 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.limit) do
		sendPushLimit(v);
	end

-- ����Ҫ�ؿ�
	networkengine:pushBool(data.isMain);
-- �Ի�_���뱸սǰ
	networkengine:pushInt(data.textPrepare);
-- �Ի�_��սʱ
	networkengine:pushInt(data.textBefore);
-- �Ի�_ս��ʤ����
	networkengine:pushInt(data.testAfter);
end

function ParseRowAdventure()
	local tempArrayCount = 0;
	local data = {};

	data['limit'] = {};
-- ���
	data['id'] = networkengine:parseInt();
-- Limit
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['limit'][i] = ParseLimit();
	end
-- ����Ҫ�ؿ�
	data['isMain'] = networkengine:parseBool();
-- �Ի�_���뱸սǰ
	data['textPrepare'] = networkengine:parseInt();
-- �Ի�_��սʱ
	data['textBefore'] = networkengine:parseInt();
-- �Ի�_ս��ʤ����
	data['testAfter'] = networkengine:parseInt();

	return data;
end

------------------typedef RowVip ----------------------------------
function sendPushRowVip(data)
-- VIP�ȼ�
	networkengine:pushInt(data.id);
-- ��ֵ����(��)
	networkengine:pushInt(data.rmb);
-- ÿ�տ�����������
	networkengine:pushInt(data.buyVigorTimes);
-- ÿ�տ����Ҵ���
	networkengine:pushInt(data.buyGoldTimes);
-- ÿ�տ���ľ�Ĵ���
	networkengine:pushInt(data.buyLumberTimes);
-- ÿ��ÿ�ؿ������ô�������
	networkengine:pushInt(data.resetTimes);
-- ÿ�ջ��ɨ��ȯ����
	networkengine:pushInt(data.sweepScrollCount);
-- ��������
	networkengine:pushInt(data.maxVigor);
-- ���洢����ϵ��
	networkengine:pushInt(data.maxGoldRatio);
-- ��ľ��ԭľ�洢����
	networkengine:pushInt(data.maxLumberRatio);
-- ��ʹ�ö��ɨ������
	networkengine:pushBool(data.canSweep);
-- ÿ�ջع��������
	networkengine:pushInt(data.buyLostExpTimes);
-- ������ս����
	networkengine:pushInt(data.challengeStageTimes);
-- ÿ��ħ�������������
	networkengine:pushInt(data.buyMagicExpTimes);
-- vip�����������
	local arrayLength = #data.giftType;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.giftType) do
		networkengine:pushInt(v);
	end

-- vip�������ID
	local arrayLength = #data.giftID;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.giftID) do
		networkengine:pushInt(v);
	end

-- vip�����������
	local arrayLength = #data.giftCount;
	if arrayLength > 4 then arrayLength = 4 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.giftCount) do
		networkengine:pushInt(v);
	end

-- vip����۸�
	networkengine:pushInt(data.giftPrice);
-- ������սʧ�ܴ�������
	networkengine:pushInt(data.challengeSpeedFailLimit);
-- ��Ҳ���ϵ��
	networkengine:pushFloat(data.goldRatio);
end

function ParseRowVip()
	local tempArrayCount = 0;
	local data = {};

	data['giftType'] = {};
	data['giftID'] = {};
	data['giftCount'] = {};
-- VIP�ȼ�
	data['id'] = networkengine:parseInt();
-- ��ֵ����(��)
	data['rmb'] = networkengine:parseInt();
-- ÿ�տ�����������
	data['buyVigorTimes'] = networkengine:parseInt();
-- ÿ�տ����Ҵ���
	data['buyGoldTimes'] = networkengine:parseInt();
-- ÿ�տ���ľ�Ĵ���
	data['buyLumberTimes'] = networkengine:parseInt();
-- ÿ��ÿ�ؿ������ô�������
	data['resetTimes'] = networkengine:parseInt();
-- ÿ�ջ��ɨ��ȯ����
	data['sweepScrollCount'] = networkengine:parseInt();
-- ��������
	data['maxVigor'] = networkengine:parseInt();
-- ���洢����ϵ��
	data['maxGoldRatio'] = networkengine:parseInt();
-- ��ľ��ԭľ�洢����
	data['maxLumberRatio'] = networkengine:parseInt();
-- ��ʹ�ö��ɨ������
	data['canSweep'] = networkengine:parseBool();
-- ÿ�ջع��������
	data['buyLostExpTimes'] = networkengine:parseInt();
-- ������ս����
	data['challengeStageTimes'] = networkengine:parseInt();
-- ÿ��ħ�������������
	data['buyMagicExpTimes'] = networkengine:parseInt();
-- vip�����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['giftType'][i] = networkengine:parseInt();
	end
-- vip�������ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['giftID'][i] = networkengine:parseInt();
	end
-- vip�����������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['giftCount'][i] = networkengine:parseInt();
	end
-- vip����۸�
	data['giftPrice'] = networkengine:parseInt();
-- ������սʧ�ܴ�������
	data['challengeSpeedFailLimit'] = networkengine:parseInt();
-- ��Ҳ���ϵ��
	data['goldRatio'] = networkengine:parseFloat();

	return data;
end

------------------typedef RowVigorReward ----------------------------------
function sendPushRowVigorReward(data)
-- id
	networkengine:pushInt(data.id);
-- ��ʼʱ��
	networkengine:pushInt(string.len(data.beginTime));
	networkengine:pushString(data.beginTime, string.len(data.beginTime));
-- ����ʱ��
	networkengine:pushInt(string.len(data.endTime));
	networkengine:pushString(data.endTime, string.len(data.endTime));
-- ��ȡ��������
	networkengine:pushInt(data.vigor);
end

function ParseRowVigorReward()
	local tempArrayCount = 0;
	local data = {};

-- id
	data['id'] = networkengine:parseInt();
-- ��ʼʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['beginTime'] = networkengine:parseString(strlength);
else
		data['beginTime'] = "";
end
-- ����ʱ��
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['endTime'] = networkengine:parseString(strlength);
else
		data['endTime'] = "";
end
-- ��ȡ��������
	data['vigor'] = networkengine:parseInt();

	return data;
end

------------------typedef RowUnit ----------------------------------
function sendPushRowUnit(data)
-- ����ID
	networkengine:pushInt(data.id);
-- ��������
	networkengine:pushInt(string.len(data.name));
	networkengine:pushString(data.name, string.len(data.name));
-- ����ID
	networkengine:pushInt(data.cardID);
-- Ʒ��
	networkengine:pushInt(data.quality);
-- �˿�
	networkengine:pushInt(data.food);
-- �Ǽ�
	networkengine:pushInt(data.starLevel);
-- �Ա�
	networkengine:pushInt(data.sex);
-- ����
	networkengine:pushInt(data.race);
-- ��������
	networkengine:pushInt(data.foodRatio);
-- ��������
	networkengine:pushInt(data.soldierHP);
-- ����ֵ
	networkengine:pushInt(data.defence);
-- ��Զ�̾���
	networkengine:pushBool(data.isRange);
-- �˺�����
	networkengine:pushInt(data.damageType);
-- ����������
	networkengine:pushInt(data.soldierDamage);
-- �������
	networkengine:pushInt(data.attackRange);
-- �ƶ�����
	networkengine:pushInt(data.moveType);
-- �ж��ٶ�
	networkengine:pushInt(data.actionSpeed);
-- �ƶ���
	networkengine:pushInt(data.moveRange);
-- ����ID
	local arrayLength = #data.skill;
	if arrayLength > 8 then arrayLength = 8 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(data.skill) do
		networkengine:pushInt(v);
	end

end

function ParseRowUnit()
	local tempArrayCount = 0;
	local data = {};

	data['skill'] = {};
-- ����ID
	data['id'] = networkengine:parseInt();
-- ��������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- ����ID
	data['cardID'] = networkengine:parseInt();
-- Ʒ��
	data['quality'] = networkengine:parseInt();
-- �˿�
	data['food'] = networkengine:parseInt();
-- �Ǽ�
	data['starLevel'] = networkengine:parseInt();
-- �Ա�
	data['sex'] = networkengine:parseInt();
-- ����
	data['race'] = networkengine:parseInt();
-- ��������
	data['foodRatio'] = networkengine:parseInt();
-- ��������
	data['soldierHP'] = networkengine:parseInt();
-- ����ֵ
	data['defence'] = networkengine:parseInt();
-- ��Զ�̾���
	data['isRange'] = networkengine:parseBool();
-- �˺�����
	data['damageType'] = networkengine:parseInt();
-- ����������
	data['soldierDamage'] = networkengine:parseInt();
-- �������
	data['attackRange'] = networkengine:parseInt();
-- �ƶ�����
	data['moveType'] = networkengine:parseInt();
-- �ж��ٶ�
	data['actionSpeed'] = networkengine:parseInt();
-- �ƶ���
	data['moveRange'] = networkengine:parseInt();
-- ����ID
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['skill'][i] = networkengine:parseInt();
	end

	return data;
end

------------------typedef DeviceInfo ----------------------------------
function sendPushDeviceInfo(data)
-- mac��ַ���豸Ψһ��ʶ
	networkengine:pushInt(string.len(data.mac));
	networkengine:pushString(data.mac, string.len(data.mac));
-- �豸��½���������
	networkengine:pushInt(string.len(data.platform));
	networkengine:pushString(data.platform, string.len(data.platform));
-- password
	networkengine:pushInt(string.len(data.password));
	networkengine:pushString(data.password, string.len(data.password));
-- phoneNum
	networkengine:pushInt(string.len(data.phoneNum));
	networkengine:pushString(data.phoneNum, string.len(data.phoneNum));
-- �豸��½��ƽ̨ID
	networkengine:pushInt(data.os);
-- ��Ϸ��½�����ID
	networkengine:pushInt(data.entry);
end

function ParseDeviceInfo()
	local tempArrayCount = 0;
	local data = {};

-- mac��ַ���豸Ψһ��ʶ
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['mac'] = networkengine:parseString(strlength);
else
		data['mac'] = "";
end
-- �豸��½���������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['platform'] = networkengine:parseString(strlength);
else
		data['platform'] = "";
end
-- password
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['password'] = networkengine:parseString(strlength);
else
		data['password'] = "";
end
-- phoneNum
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['phoneNum'] = networkengine:parseString(strlength);
else
		data['phoneNum'] = "";
end
-- �豸��½��ƽ̨ID
	data['os'] = networkengine:parseInt();
-- ��Ϸ��½�����ID
	data['entry'] = networkengine:parseInt();

	return data;
end

------------------typedef GuideInfo ----------------------------------
function sendPushGuideInfo(data)
-- ���
	networkengine:pushInt(data.id);
-- ״̬
	networkengine:pushBool(data.active);
end

function ParseGuideInfo()
	local tempArrayCount = 0;
	local data = {};

-- ���
	data['id'] = networkengine:parseInt();
-- ״̬
	data['active'] = networkengine:parseBool();

	return data;
end

