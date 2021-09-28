--------------------------------------------------------------------------------------
-- 文件名:	XXX.lua
-- 版  权:	(C)深圳美天互动科技有限公司
-- 创建人:	张齐
-- 日  期:	2015-6-8
-- 版  本:	1.0
-- 描  述:	开服累计召唤活动
-- 应  用:  
---------------------------------------------------------------------------------------

Act_SummonTotal = class("Act_SummonTotal",Act_Template)
Act_SummonTotal.__index = Act_Template
--初始化
function Act_SummonTotal:init(panel, tbItemList)
	if not panel then
		return 
	end
    self.super.init(self, panel, tbItemList)
    self.mTotalSummonTtf = tolua.cast(panel:getChildByName("Label_CurrentNum"), "Label")
    --设置开服累计召唤次数
    self:setSummonNum(g_Hero:getTotalSummon())
end

function Act_SummonTotal:updateStatus()
    if not self.tbMissions then
        --活动不存在或者活动已经结束
		return false
	end

    local rank_again = false
    --判断当前任务的状态是否已经更新
    for i,v in pairs(self.tbMissions) do
        if self.tbMissions_old[i] ~= v then
            rank_again = true
            self.tbMissions_old[i] = v
        end
    end
    
    if rank_again then --任务状态已经更新，更新listView
        self:sortAndUpdate()
    end
    --设置开服累计召唤次数
    self:setSummonNum(g_Hero:getTotalSummon())
end

function Act_SummonTotal:setSummonNum(nSummon)
    local strTip = string.format(_T("您已累计高级召唤%d次"), nSummon)
    self.mTotalSummonTtf:setText(strTip)
end