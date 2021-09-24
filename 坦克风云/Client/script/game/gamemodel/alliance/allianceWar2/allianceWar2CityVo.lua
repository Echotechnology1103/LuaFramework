allianceWar2CityVo={}
function allianceWar2CityVo:new()
	local nc={}
	setmetatable(nc,self)
	self.__index=self
	return nc
end

function allianceWar2CityVo:initWithData(data)
	self.id=data.areaid							--城市的ID
	-- local ownerID=tonumber(data.ownerID)
	-- if(ownerID~=nil and ownerID>0)then
	-- 	self.ownerID=data.oID			--当前占领城市的军团ID
	-- 	self.ownerName=data.oName		--当前占领城市的军团名字
	-- else
	-- 	self.ownerID=nil
	-- 	self.ownerName=nil
	-- end
	local hasOwn=false
	if data.owns then
		for k,v in pairs(data.owns) do
			if v and v.areaid and v.areaid==self.id then
				self.ownerID=v.oID			--当前占领城市的军团ID
				self.ownerName=v.oName		--当前占领城市的军团名字
				hasOwn=true
			end
		end
	end
	if hasOwn==false then
		self.ownerID=nil
		self.ownerName=nil
	end

	allianceWar2VoApi:setOwnsData(data.owns)

	if(data.rank)then
		self.bidList=data.rank 				--本城市的投标列表
	else
		self.bidList={}
	end
	if(data.applycount)then
		self.applycount=tonumber(data.applycount)
	else
		self.applycount=0
	end
	if(data.inWar and tonumber(data.inWar)==0)then
		self.inWar=false
	else
		self.inWar=true
	end
	if self.bidList[1] then
		self.allianceID1=self.bidList[1].aid	--参加本次争夺的两个军团ID
		self.allianceName1=self.bidList[1].name	--参加本次争夺的两个军团名字
	end
	if self.bidList[2] then
		self.allianceID2=self.bidList[2].aid	--参加本次争夺的两个军团ID
		self.allianceName2=self.bidList[2].name	--参加本次争夺的两个军团名字
	end
	if(self.allianceID2 and tonumber(self.allianceID2)==tonumber(allianceVoApi:getSelfAlliance().aid))then
		local tmpID=self.allianceID2
		local tmpName=self.allianceName2
		self.allianceID2=self.allianceID1
		self.allianceName2=self.allianceName1
		self.allianceID1=tmpID
		self.allianceName1=tmpName
	end
	self.updateTime=base.serverTime		 --本城市数据刷新的时间
end