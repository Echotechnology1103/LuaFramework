-- 添加好友

function api_friends_add(request)
    local response = {
        ret=-1,
        msg='error',
        data = {},
    }

    local uid = request.uid
    local mid = 0
    local puid = request.params.uid
    if puid == nil then
        mid = userGetUidByNickname(request.params.name)
    else
        mid = userLogin(request.params.uid)
    end
    if uid == nil or mid < 1  then
        response.ret = -102
        return response
    end

    local uobjs = getUserObjs(uid)
    uobjs.load({"friends"})
   
    local mFriends = uobjs.getModel('friends')
    if type(mFriends.info)~='table' then  mFriends.info={} end
   
    local flag=table.contains(mFriends.info,mid)
    if(flag)then
        response.ret=-12001
        return response
    end

    local num = getConfig('player.friendNum')
    table.insert(mFriends.info,mid)
    local len = #mFriends.info
    if len>num then
        response.ret=-12003
        return response
    end

    if  uobjs.save() then
        response.ret = 0
        response.msg = 'Success'
    end

    return response

end