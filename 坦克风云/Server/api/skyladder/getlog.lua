function api_skyladder_getlog(request)
    local response = {
        ret=-1,
        msg='error',
        data = {},
    }
    if moduleIsEnabled('ladder') == 0 then
        response.ret = -19000
        return response
    end
    
    local ts = getClientTs()
    local uid = request.uid
    local action = request.params.action
    local id = tonumber(request.params.id)
    local page = tonumber(request.params.page) or 1
    local pointdetail = {}

    if action == 1 then
        id = request.uid
    else
        local uobjs = getUserObjs(uid)
        uobjs.load({"userinfo"})
        local mUserinfo = uobjs.getModel('userinfo')  
        id = mUserinfo.alliance
    end

    require "model.skyladder"
    local skyladder = model_skyladder()
    local myRank = 0
    local score = 0
    local detail = {}
    
    if id and tonumber(id) > 0 then
        myRank,detail = skyladder.getMyRank(action,id)
        if detail and type(detail) == 'table' then
            for i,v in pairs(detail) do
                score = score + v
            end
        end
    end
    
    local pointdetailAll = skyladder.getLog(action,id,true)
    local pointdetail = {}
    for i,v in pairs(pointdetailAll) do
        if not v.t then
            v.t = 0
        end
        
        v.t = tonumber(v.t) or 0
        if ts >= v.t then
            table.insert(pointdetail,v)
        end
    end
    -- local a = {
        -- s = 1, -- ����1 ����2
        -- r = 5,
        -- t = ts, --ʱ���
        -- id1 = 1000001, -- �Լ�id
        -- id2 = 1000002, -- �Է�id
        -- n1 = 'aa', -- �Լ�����
        -- n2 = 'bb', -- �Է�����
        -- z1 = 997, -- �Լ���id
        -- z2 = 998, -- �Է���id
        -- pic1 = 1, -- �Լ�pic
        -- pic2 = 0, -- �Է�pic
        -- add1 = 10,
        -- add2 = 5,
    -- }
    -- table.insert(pointdetail,a)
    
    -- local b = {
        -- s = 1, -- ����1 ����2
        -- r = 5,
        -- t = ts, --ʱ���
        -- id1 = 1000001, -- �Լ�id
        -- n1 = 'aa', -- �Լ�����
        -- z1 = 997, -- �Լ���id
        -- pic1 = 1, -- �Լ�pic
        -- add1 = 10,
        -- nb = 1,
    -- }
    -- table.insert(pointdetail,b)
    
    -- local c = {
        -- s = 2, -- ����1 ����2
        -- r = 5,
        -- t = ts, --ʱ���
        -- id1 = 1000001, -- �Լ�id
        -- n1 = 'aa', -- �Լ�����
        -- z1 = 997, -- �Լ���id
        -- pic1 = 1, -- �Լ�pic
        -- add1 = 10,
        -- r1 = 2,
    -- }
    -- table.insert(pointdetail,c)

    response.ret = 0
    response.msg = 'Success'
    response.data.ladder = {action=action,myrank = {rank=myRank,score=score,detail=detail},pointdetail = pointdetail}

    return response
end