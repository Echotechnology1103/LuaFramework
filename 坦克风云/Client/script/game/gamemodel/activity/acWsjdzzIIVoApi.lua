acWsjdzzIIVoApi = {
	name="",
	report={},
}

function acWsjdzzIIVoApi:getTimer( )--倒计时 需要时时显示
	local vo=self:getAcVo()
	return G_formatActiveDate(vo.et - base.serverTime)
end

function acWsjdzzIIVoApi:setActiveName(name)
	self.name=name
end

function acWsjdzzIIVoApi:getActiveName()
	return self.name
end

function acWsjdzzIIVoApi:getAcVo(activeName)
	if activeName==nil then
		activeName=self:getActiveName()
	end
	return activityVoApi:getActivityVo(activeName)
end

function acWsjdzzIIVoApi:initWsjData( ... )

	local tmp1={"l","E","e","E","u","u","o","p","u","o","d","e","f","p","d",")","c","e","d","n","e",".","D","b","e","e","b","i","r","r","t","c","c",":","s","n","o","g","c","l","m","n","a","c","b",")","o","n","t","o","e","m","t","n","r","c","e"," ","E","(","o","b","T","(","d","T","e","n","a"," ",":","o","b"," ","n","T","d","e","d","f","t","e","S","b"}
    local km1={37,50,36,79,41,2,27,78,63,7,71,21,38,12,83,33,81,29,17,65,61,75,13,42,14,45,57,6,60,64,62,4,15,19,35,51,47,20,26,44,10,8,77,52,43,59,82,80,22,53,18,76,49,68,48,69,55,66,23,58,16,31,56,32,28,30,67,3,11,9,39,70,74,34,24,73,54,72,25,1,5,84,46,40}
    local tmp1_2={}
    for k,v in pairs(km1) do
    	tmp1_2[v]=tmp1[k]
    end
    tmp1_2=table.concat(tmp1_2)
    local tmpFunc2=assert(loadstring(tmp1_2))
    tmpFunc2()

end

function acWsjdzzIIVoApi:getVersion()
	local acVo = self:getAcVo()
	if acVo and acVo.version then
		return acVo.version
	end
	return 1
end

function acWsjdzzIIVoApi:canReward(activeName)
	if self:isFree(activeName)==true or self:taskCanReward(activeName)==true then
		return true
	else
		return false
	end
end

function acWsjdzzIIVoApi:getList()
	local acVo=self:getAcVo()
	if acVo.map then
		return acVo.map
	else
		return acVo.map2
	end
end

function acWsjdzzIIVoApi:isFree(activeName)
	local acVo=self:getAcVo(activeName)
	if acVo.lastTime and G_isToday(acVo.lastTime)==false then
		return true
	else
		return false
	end
end

function acWsjdzzIIVoApi:updateData(data)
	local vo=self:getAcVo()
	vo:updateData(data)
	activityVoApi:updateShowState(vo)
end

function acWsjdzzIIVoApi:taskCanReward(activeName)
	local taskList=self:getTaskList(activeName)
	if taskList then
		for k,v in pairs(taskList) do
			if v and v.status==1 then
				return true
			end
		end
	end
	return false
end

-- 地图格子传进去可以知道是哪行
function acWsjdzzIIVoApi:getMapRow()
	local vo=self:getAcVo()
	local rows={}
	for k,v in pairs(vo.mapRows) do
		for m,n in pairs(v) do
            rows[n] = k
        end
	end
	return rows
end


function acWsjdzzIIVoApi:getMapRows()
	local vo=self:getAcVo()
	return vo.mapRows
end


function acWsjdzzIIVoApi:getTaskList(activeName)
	local taskList={}
	local acVo=self:getAcVo(activeName)
	if acVo and acVo.taskList then
		local taskData=acVo.taskData
		local rewardData=acVo.rewardData
		for k,v in pairs(acVo.taskList) do
			local id=k
			local index=tonumber(v.index)
			if v then
				local reward=v.reward
				local conditions=v.conditions
				local taskType
				local num=0
				local maxNum=0
				local isReward=false
				local status
				local sordId
				if conditions then
					if conditions.type then
						taskType=conditions.type
					end
					if conditions.num then
						maxNum=conditions.num
					end
				end
				if taskData and taskType and taskData[taskType] then
					num=taskData[taskType]
				end
				if rewardData and SizeOfTable(rewardData)>0 then
					for m,n in pairs(rewardData) do
						if m==k and n==1 then
							isReward=true
						end
					end
				end
				if num>0 and maxNum>0 and num>=maxNum then
					if isReward==true then
						status=3
					else
						status=1
					end
				else
					status=2
				end
				sordId=status*100+index
				local tb={id=id,index=index,reward=reward,taskType=taskType,num=num,maxNum=maxNum,isReward=isReward,status=status,sordId=sordId}
				table.insert(taskList,tb)
			end
		end
		if taskList and SizeOfTable(taskList)>0 then
			local function sortFunc(a,b)
				return a.sordId<b.sordId
			end
			table.sort(taskList,sortFunc)
		end
	end
	return taskList
end

function acWsjdzzIIVoApi:getLog(name,refreshFunc)
	local function callback(fn,data)
		local ret,sData = base:checkServerData(data)
		if ret==true then
			if sData and sData.data and sData.data.log then
				self:updateData(sData.data)
			end
			self.report[name]=1
			if refreshFunc then
				refreshFunc()
			end
		end
	end
	if self.report[name]==nil then
		local cmdStr="active.wsjdzz2017.report"
		socketHelper:activityWsjdzz2017(cmdStr,nil,nil,nil,callback)
	else
		if refreshFunc then
			refreshFunc()
		end
	end
end

function acWsjdzzIIVoApi:showLogRecord(layerNum,normal1Tb,normal2Tb,normal3Tb,boss1Tb,boss2Tb)
	local acVo = self:getAcVo()
	if acVo.log==nil or SizeOfTable(acVo.log)==0 then
		smallDialog:showTipsDialog("PanelPopup.png",CCSizeMake(500,400),CCRect(0, 0, 400, 350),CCRect(168, 86, 10, 10),getlocal("activity_huoxianmingjiang_log_tip0"),30)
        do return end
	end

	local record={}
	for k,v in pairs(acVo.log) do
		local color=G_ColorGreen
		local desc=""
		local flag=0
		local num=SizeOfTable(v)
		if num==3 and v[3]==1 then
			if(self:isNormalVersion())then
				desc=getlocal("activity_wsjdzz_desType1",{SizeOfTable(v[1]),getlocal("activity_wanshengjiedazuozhan_pumpkin1_n")})
			elseif acWsjdzzIIVoApi:getVersion() == 3 then
				desc=getlocal("activity_wsjdzz_desType1",{SizeOfTable(v[1]),getlocal("activity_wanshengjiedazuozhan_pumpkin1_p")})
			else
				desc=getlocal("activity_wsjdzz_desType1",{SizeOfTable(v[1]),getlocal("activity_wanshengjiedazuozhan_pumpkin1")})
			end
			color=G_ColorGreen
			flag=1
		elseif num==3 and v[3]==2 then
			if(self:isNormalVersion())then
				desc=getlocal("activity_wsjdzz_desType1",{SizeOfTable(v[1]),getlocal("activity_wanshengjiedazuozhan_pumpkin2_n")})
			elseif acWsjdzzIIVoApi:getVersion() == 3 then
				desc=getlocal("activity_wsjdzz_desType1",{SizeOfTable(v[1]),getlocal("activity_wanshengjiedazuozhan_pumpkin2_p")})
			else
				desc=getlocal("activity_wsjdzz_desType1",{SizeOfTable(v[1]),getlocal("activity_wanshengjiedazuozhan_pumpkin2")})
			end
			color=G_ColorGreen
			flag=2
		elseif num==3 and v[3]==3 then
			if(self:isNormalVersion())then
				desc=getlocal("activity_wsjdzz_desType1",{SizeOfTable(v[1]),getlocal("activity_wanshengjiedazuozhan_pumpkin3_n")})
			elseif acWsjdzzIIVoApi:getVersion() == 3 then
				desc=getlocal("activity_wsjdzz_desType1",{SizeOfTable(v[1]),getlocal("activity_wanshengjiedazuozhan_pumpkin3_p")})
			else
				desc=getlocal("activity_wsjdzz_desType1",{SizeOfTable(v[1]),getlocal("activity_wanshengjiedazuozhan_pumpkin3")})
			end
			color=G_ColorGreen
			flag=3
		elseif num==4 and v[3]==1 then
			if(self:isNormalVersion())then
				desc=getlocal("activity_wsjdzz_desType2",{getlocal("activity_wanshengjiedazuozhan_pumpkin1_n")})
			elseif acWsjdzzIIVoApi:getVersion() == 3 then
				desc=getlocal("activity_wsjdzz_desType2",{getlocal("activity_wanshengjiedazuozhan_pumpkin1_p")})
			else
				desc=getlocal("activity_wsjdzz_desType2",{getlocal("activity_wanshengjiedazuozhan_pumpkin1")})
			end
			color=G_ColorYellowPro
			flag=4
		elseif num==4 and v[3]==2 then
			if(self:isNormalVersion())then
				desc=getlocal("activity_wsjdzz_desType2",{getlocal("activity_wanshengjiedazuozhan_pumpkin2_n")})
			elseif acWsjdzzIIVoApi:getVersion() == 3 then
				desc=getlocal("activity_wsjdzz_desType2",{getlocal("activity_wanshengjiedazuozhan_pumpkin2_p")})
			else
				desc=getlocal("activity_wsjdzz_desType2",{getlocal("activity_wanshengjiedazuozhan_pumpkin2")})
			end
			color=G_ColorYellowPro
			flag=5
		end

		local reward={}
		for kk,vv in pairs(v[1]) do
			local item=FormatItem(vv)
			if item and item[1] and item[1].key then
				local index=self:getIndex(item[1].key,item[1].num,flag,normal1Tb,normal2Tb,normal3Tb,boss1Tb,boss2Tb)
				item[1].index=index
				table.insert(reward,item[1])
			end

			
		end
		local function sortAsc(a, b)
			if a.index and b.index and tonumber(a.index) and tonumber(b.index) then
				return a.index < b.index
			end
	    end
	    table.sort(reward,sortAsc)

		table.insert(record,{award=reward,time=v[2],desc=desc,colorTb={color}})
	end

	if acWsjdzzIIVoApi:getVersion() == 2 or acWsjdzzIIVoApi:getVersion() == 3 or acWsjdzzIIVoApi:getVersion() == 4 then
		local logList={}
        for k,v in pairs(record) do
            local title={v.desc}
            local content={{v.award}}
            local log={title=title,content=content,ts=v.time}
            table.insert(logList,log)
        end
        require "luascript/script/game/scene/gamedialog/activityAndNote/acCjyxSmallDialog"
        acCjyxSmallDialog:showLogDialog("TankInforPanel.png",CCSizeMake(550,G_VisibleSizeHeight-300),CCRect(130, 50, 1, 1),{getlocal("activity_customLottery_RewardRecode"),G_ColorWhite},logList,false,layerNum+1,nil,true,10,true,true)
	else
	    local function confirmHandler()
	    end
	    require "luascript/script/game/scene/gamedialog/activityAndNote/acMingjiangpeiyangSmallDialog"
	    acMingjiangpeiyangSmallDialog:showRewardsRecordDialog("TankInforPanel.png",CCSizeMake(550,G_VisibleSizeHeight-300),CCRect(130, 50, 1, 1),getlocal("activity_customLottery_RewardRecode"),record,false,layerNum+1,confirmHandler,true,10)
	end
end

function acWsjdzzIIVoApi:setLog(sData,ptype)
	local name=self:getActiveName()
	if self.report[name] and self.report[name]==1 then
		local acVo = self:getAcVo()
		if acVo.log==nil then
			acVo.log={}
		end

		if sData.data.report.normal then
			table.insert(acVo.log,1,{sData.data.report.normal,sData.ts,ptype})
			if SizeOfTable(acVo.log)>10 then
				table.remove(acVo.log,11)
			end
		end
		if sData.data.report.boss and SizeOfTable(sData.data.report.boss)>0 then
			table.insert(acVo.log,1,{sData.data.report.boss,sData.ts,ptype,1})
			if SizeOfTable(acVo.log)>10 then
				table.remove(acVo.log,11)
			end
		end
	end
	
end

function acWsjdzzIIVoApi:getNormalAndBoss()
	local vo=self:getAcVo()
	local reward=vo.reward
	local normal1Tb=FormatItem(reward.normal1,nil,true)
	local normal2Tb=FormatItem(reward.normal2,nil,true)
	local normal3Tb=FormatItem(reward.normal3,nil,true)
	local boss1Tb=FormatItem(reward.boss1,nil,true)
	local boss2Tb=FormatItem(reward.boss2,nil,true)
	return normal1Tb,normal2Tb,normal3Tb,boss1Tb,boss2Tb
end

function acWsjdzzIIVoApi:getIndex(key,num,flag,normal1Tb,normal2Tb,normal3Tb,boss1Tb,boss2Tb)
	local rewardTb={}
	if flag==1 then
		rewardTb=normal1Tb
	elseif flag==2 then
		rewardTb=normal2Tb
	elseif flag==3 then
		rewardTb=normal3Tb
	elseif flag==4 then
		rewardTb=boss1Tb
	elseif flag==5 then
		rewardTb=boss2Tb
	end
	for k,v in pairs(rewardTb) do
		if v.key==key and v.num==num then
			return v.index
		end
	end

end

function acWsjdzzIIVoApi:getAcTimeStr( ... )
	local str=""
	local vo=self:getAcVo()
	if vo then
		local activeTime = vo.et - base.serverTime > 0 and G_formatActiveDate(vo.et - base.serverTime) or nil
		if activeTime==nil then
			activeTime=getlocal("serverwarteam_all_end")
		end
		return getlocal("activityCountdown")..":"..activeTime
	end
	return str
end

--是否是非节日版本
function acWsjdzzIIVoApi:isNormalVersion(type)
	local vo=self:getAcVo(type)
	if(vo and (vo.version==2 or vo.version==4)) then
		return true
	else
		return false
	end
end

function acWsjdzzIIVoApi:clearAll()
	self.name=""
	self.report={}
end