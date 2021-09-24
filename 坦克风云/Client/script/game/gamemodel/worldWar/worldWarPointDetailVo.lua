worldWarPointDetailVo={}
function worldWarPointDetailVo:new()
	local nc={}
	setmetatable(nc,self)
	self.__index=self
	return nc
end


function worldWarPointDetailVo:initWithData(type,time,message,color)
	self.type=type
	self.time=time or 0
	self.message=message or ""
	self.color=color or G_ColorGreen
end