local RankListModel = {}

RankListModel.listVec       = {}
RankListModel.myRankVec     = {}


local LEVEL_TYPE      = 1
local BATTLE_TYPE     = 2
local JIANGHU_TYPE    = 3
local ARENA_TYPE      = 4

RANK_LIST_KEY = {
NO_ONE_KEY           = 3200109,         --�����б�û�����
AGREE_SUC_KEY        = 3200110,         --��Ӻ��ѳɹ�
REJECT_SUC_KEY       = 3200111,         --�ܾ����ѳɹ�
SEND_NAILI_SUC_KEY   = 3200112,			--�ɹ����ͶԷ�1������
GET_NAILI_SUC_KEY    = 3200106,         --��ȡ�����ɹ�
NAI_LI_FULL_KEY      = 3200002,         --��������
GET_ALL_NAILI_KEY    = 3200113,			--��ȡ��������������
AGREE_FRIEND_KEY     = 3200114,         --���ܺ���
SEND_APPLY_KEY       = 3200115,         --������
NUM_PLZ_KEY          = 3200101,			--�������idֻ���������֣�����������
CANNOT_EMPTY_KEY     = 3200102,			--�������ݲ���Ϊ�գ�
TOO_MUCH_CHAR_KEY    = 3200103,			--�������ݳ���40���֣������±༭
REV_FRIEND_SUC_KEY   = 3200104,			--ɾ�����ѳɹ�
NO_PLAYER_KEY        = 3200105,			--����������Ҳ����ڣ�
TOO_MUCH_NAME_KEY    = 3200116,         --������Ʋ��ó����߸���

NUM_LIMIT_KEY	     = 3200004,         --�Һ���������

FRIEND_NUM_LIMIT_KEY = 3200005          --�Է���������

}

RankListModel.MAX_NAME_LEN      = 7
RankListModel.MAX_TEXT_LEN      = 30

function RankListModel.resetType(type)
	--��������type��ǰ�˵Ĳ�һ��
	--��������type:������=1;�ȼ�=2;ս��=3;����=4;
	if type == 1 then
		return 2
	elseif type == 2 then
		return 3
	elseif type == 3 then
		return 4
	else
		return 1
	end
end

--��ȡ�б�����
function RankListModel.sendListReq(param)
	local requestType = RankListModel.resetType(param.listType)
	RequestHelper.sendRankListReq({
	callback = function(data)
		RankListModel.initData(param.listType,data)
		param.callback()
	end,
	listType = requestType
	})
end

function RankListModel.initData(type,data)
	RankListModel.listVec[type] = data.infos
	RankListModel.myRankVec[type] = data.myRank
end

function RankListModel.getList(type)
	return RankListModel.listVec[type]
end

function RankListModel.getMyRank(type)
	return RankListModel.myRankVec[type]
end


return RankListModel