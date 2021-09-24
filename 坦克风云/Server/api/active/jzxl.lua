--
--desc:集中训练
--user:chenyunhe
--
local function api_active_jzxl(request)
    local self = {
        response = {
            ret = -1,
            msg ='error',
            data = {},
        },
        aname = 'jzxl',
    }
    
    function self.before(request)
        local response = self.response
        local uid=request.uid
        local uobjs = getUserObjs(uid)
        uobjs.load({'useractive'})
        local mUseractive = uobjs.getModel('useractive')

        if not uid then
            response.ret = -102
            return response
        end

        -- 活动检测
        local activStatus = mUseractive.getActiveStatus(self.aname)
        if activStatus ~= 1 then
            response.ret = activStatus
            return response
        end

    end

    -- 刷新
    function self.action_refresh(request)
        local response = self.response
        local uid=request.uid
        local uobjs = getUserObjs(uid)
        uobjs.load({"userinfo",'useractive'})
        local mUseractive = uobjs.getModel('useractive')
        local mUserinfo = uobjs.getModel('userinfo')

        local flag = mUseractive.initAct(self.aname)
        if flag then
            if not uobjs.save() then
                response.ret = -106
                return response
            end
        end

        response.data[self.aname] = mUseractive.info[self.aname]
        response.ret = 0
        response.msg = 'Success'

        return response
    end

    -- 抽奖
    function self.action_lottery(request)
        local uid = request.uid
        local response = self.response
        local num = tonumber(request.params.num) -- 1单抽 10十连抽
        local free = tonumber(request.params.free) -- 0非免费 1免费
        local train = request.params.t -- 抽奖类型 1：射击,2：阵型,3：协作
        local ts= getClientTs()
        local weeTs = getWeeTs()
        
        if not table.contains({0,1},free) or not table.contains({1,10},num) and not table.contains({1,2,3},train)  then
       	   response.ret=-102
       	   return response
        end

        local uobjs = getUserObjs(uid)
        uobjs.load({"userinfo","props","bag",'useractive',"alienweapon"})
        local mUseractive = uobjs.getModel('useractive')
        local mUserinfo = uobjs.getModel('userinfo')
        local mAweapon = uobjs.getModel('alienweapon')

        local activeCfg = mUseractive.getActiveConfig(self.aname)

        -- 消耗钻石
        local gems = 0
        -- 阵型训练是有免费的
        if train ==2 then 
            -- 免费时 单抽
            if free ==1 and num>1 then
                response.ret = -102
                return response
            end

            if mUseractive.info[self.aname].t < weeTs then
                mUseractive.info[self.aname].v = 0
                mUseractive.info[self.aname].t = weeTs
            end

            if mUseractive.info[self.aname].v==1 and free==1 then
                response.ret = -102
                return response
            end

            -- 判断是否有免费次数
            if mUseractive.info[self.aname].v == 0 and free ~=1 then
                response.ret = -102
                return response
            end

            if free==1 then
                 mUseractive.info[self.aname].v=1
            else
                if num ==1 then
                    gems = activeCfg.cost1[train]
                else
                    num = 10
                    gems = activeCfg.cost2[train]
                end
            end
        else
            if free ==1 then
                response.ret = -102
                return response
            end
            if num ==1 then
                gems = activeCfg.cost1[train]
            else
                num = 10
                gems = activeCfg.cost2[train]
            end
        end
       
        local reward={}
        local report={}
        local score,scorekey = getRewardByPool(activeCfg.serverreward['pool_s'..train],1)
        for i=1,num do 
	 		local result,rewardkey = getRewardByPool(activeCfg.serverreward['pool_g'..train],1)
            local double = 1
            if score[1]>=activeCfg.doubleScore[train] then
                double = 2
            end
           
            for k,v in pairs (result) do
                for rk,rv in pairs(v) do
                    reward[rk]=(reward[rk] or 0)+rv*double
                end
            end            
        end

        if score[1] ==10 then
            mUseractive.info[self.aname]['jz'..train] = (mUseractive.info[self.aname]['jz'..train] or 0) + num
        end

        mUseractive.info[self.aname]['jz4'] = (mUseractive.info[self.aname]['jz4'] or 0) + score[1]*num
        if not takeReward(uid,reward) then    
            response.ret=-403
            return response
        end

        for k,v in pairs(reward) do
            table.insert(report, formatReward({[k]=v}))
        end

        if not mUserinfo.useGem(gems) then
            response.ret = -109
            return response
        end
        regActionLogs(uid,1,{action=206,item="",value=gems,params={num=num}})
        local clientReport= copyTable(report)
        -- 和谐版判断
        local harCReward={}
        if moduleIsEnabled('harmonyversion') ==1 then
            local hReward,hClientReward = harVerGifts('active','jzxl',num)
            if not takeReward(uid,hReward) then
                response.ret = -403
                return response
            end
            harCReward = hClientReward
        end

        if uobjs.save() then
 			local redis =getRedis()
            local redkey ="zid."..getZoneId()..self.aname..mUseractive.info[self.aname].st.."uid."..uid
            local data =redis:get(redkey)
            data =json.decode(data)
            if type (data)~="table" then data={}  end
            
            table.insert(data,1,{ts,report,num,harCReward,train,score[1]*num})
            if next(data) then
                for i=#data,11,-1 do
                    table.remove(data)
                end

                data=json.encode(data)
                redis:set(redkey,data)
                redis:expireat(redkey,mUseractive.info[self.aname].et+86400)
            end        	
            response.data[self.aname] =mUseractive.info[self.aname]
            if next(harCReward) then
                response.data[self.aname].hReward=harCReward
            end
            response.data[self.aname].reward=clientReport
            response.data[self.aname].score= score[1] --分数
            response.ret = 0
            response.msg = 'Success'
        else
            response.ret=-106
        end

        return response
    end

	-- 获取记录
    function self.action_getReportLog(request)
        local response = self.response
        local uid = request.uid
   
        local uobjs = getUserObjs(uid)
        uobjs.load({"useractive"})
        local mUseractive = uobjs.getModel('useractive')

        local redis =getRedis()
        local redkey ="zid."..getZoneId()..self.aname..mUseractive.info[self.aname].st.."uid."..uid
        local data =redis:get(redkey)
        data =json.decode(data)

        if type(data) ~= 'table' then data = {} end
        response.ret = 0
        response.msg = 'Success'
        response.data.report=data

        return response
    end
    
    -- 任务奖励
    function self.action_task(request)
        local response = self.response
        local uid = request.uid
        local tid = request.params.tid -- 任务下标

        if not tid then
            response.ret =-102
            return response
        end
        local uobjs = getUserObjs(uid)
        uobjs.load({"useractive"})
        local mUseractive = uobjs.getModel('useractive')
        if mUseractive.info[self.aname].task[tid] ==1 then
            response.ret = -1976
            return response
        end

        local activeCfg = mUseractive.getActiveConfig(self.aname)
        local taskcfg = activeCfg.serverreward.taskList[tid]
        if not taskcfg then
            response.ret = -102
            return response
        end

        if mUseractive.info[self.aname][taskcfg.type] < taskcfg.num then
            response.ret = -102
            return response
        end

        if not takeReward(uid,taskcfg.serverreward) then    
            response.ret=-403
            return response
        end

        mUseractive.info[self.aname].task[tid] = 1
        if uobjs.save() then
            response.data[self.aname] =mUseractive.info[self.aname]
            response.data[self.aname].reward= formatReward(taskcfg.serverreward)
            response.ret = 0
            response.msg = 'Success'
        else
            response.ret=-106
        end

        return response
    end

    return self
end

return api_active_jzxl