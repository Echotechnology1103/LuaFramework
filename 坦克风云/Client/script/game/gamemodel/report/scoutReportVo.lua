

scoutReportVo={}
function scoutReportVo:new()
    local nc={}
    setmetatable(nc,self)
    self.__index=self
    return nc
end

--report={type=3,target=targetStr,place={x="142",y="540"},time=time,shipTab=shipTab,resource={name="scout_content_product_4",num="2000"},helpDefender="",islandType=3}
--type 类型为2，侦察报告
--islandType 岛屿类型 1~5资源岛，6玩家，7叛军
--defender 目标信息 {id,name,level}
--place 地点 {x,y}
--level 岛屿等级
--islandOwner 是否被占领 1被占领 0未被占领
--resource 玩家 可以掠夺5种最大资源量, 资源岛 占领并采集一种资源 每小时资源量
--defendShip 防守战船
--helpDefender 驻守玩家
--allianceName 被侦查玩家或驻守玩家的公会名字
--landform 侦查地形类型
--richLevel 富矿当前的等级
--goldMineLv 金矿当前等级
--disappearTime 金矿消失剩余时间
--rebel 叛军数据
--aistatus AI部队生产状态（1：正在生产中，0：没有生产）
--tskinList :部队皮肤数据
function scoutReportVo:initWithData(rid,type,islandType,defender,place,level,time,islandOwner,resource,defendShip,helpDefender,allianceName,landform,richLevel,boom,boomMax,boomTs,boomBmd,goldMineLv,disappearTime,rebel,aistatus,tskinList,privateMine)
    self.rid           =rid
    self.type          =type
    self.islandType    =islandType
    self.defender      =defender
    self.place         =place
    self.level         =level
    self.time          =time
    self.islandOwner   =islandOwner
    self.resource      =resource
    self.defendShip    =defendShip
    self.helpDefender  =helpDefender
    self.allianceName  =allianceName
    self.landform      =landform
    self.richLevel     =richLevel
    self.boom          = boom
    self.boomMax       =boomMax
    self.boomTs        =boomTs
    self.boomBmd       =boomBmd
    self.goldMineLv    =goldMineLv or 0
    self.disappearTime =disappearTime or 0
    self.rebel         =rebel
    self.aistatus      =aistatus or 0
    self.tskinList     =tskinList or {}
    self.privateMine   =privateMine
end