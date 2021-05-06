local CTerraWarMainView = class("CTerraWarMainView", CViewBase)
--~CTerraWarMainView:ShowView()
function CTerraWarMainView.ctor(self, cb)
	CViewBase.ctor(self, "UI/TerraWar/TerraWarMainView.prefab", cb)
	self.m_GroupName = "main"
	self.m_ExtendClose = "Shelter"
	self.m_Timer = nil
end

function CTerraWarMainView.OnCreateView(self)
	self.m_Container = self:NewUI(1, CWidget)
	self.m_CloseBtn = self:NewUI(2, CButton)
	self.m_BtnGrid = self:NewUI(3, CGrid)
	self.m_BtnBox = self:NewUI(4, CBox)
	self.m_HelpBtn = self:NewUI(5, CButton)
	self.m_TimeLabel = self:NewUI(6, CLabel)
	self.m_ScoreLabel = self:NewUI(7, CLabel)
	self.m_BackBtn = self:NewUI(10, CButton)
	self.m_GotoBtn = self:NewUI(11, CButton)
	self.m_TerraWarMapPage = self:NewPage(12, CTerraWarMapPage)
	self.m_TerraWarMinePage = self:NewPage(13, CTerraWarMinePage)
	self.m_TerraWarServerRankPage = self:NewPage(14, CTerraWarServerRankPage)
	self.m_TerraWarOrgRankPage = self:NewPage(15, CTerraWarOrgRankPage)
	self.m_TerraWarLogPage = self:NewPage(16, CTerraWarLogPage)
	self:InitContent()
end

function CTerraWarMainView.InitContent(self)
	UITools.ResizeToRootSize(self.m_Container)
	--据点地图，我的据点，全服排行榜，公会排行榜，奖励显示，游戏规则，前往
	self.m_BtnInfoList = {
		{name = "据点地图", callbackFunc = callback(self, "OnTerraWarMapPage"), hint = "terrawar_map"},
		{name = "己方据点", callbackFunc = callback(self, "OnTerraWarMinePage"), hint = "terrawar_mine"},
		{name = "公会排行榜", callbackFunc = callback(self, "OnTerraWarServerRankPage"), hint = "terrawar_serverrank"},
		{name = "内部排行榜", callbackFunc = callback(self, "OnTerraWarOrgRankPage"), hint = "terrawar_orgrank"},
		{name = "军情界面", callbackFunc = callback(self, "OnTerraWarLogPage"), hint = "terrawar_orgrank"},
	}
	self.m_BtnBoxArr = {}

	self.m_CloseBtn:AddUIEvent("click", callback(self, "OnClose"))
	self.m_HelpBtn:AddUIEvent("click", callback(self, "OnClickHelp"))
	self.m_BackBtn:AddUIEvent("click", callback(self, "OnClose"))
	self.m_GotoBtn:AddUIEvent("click", callback(self, "OnGoto"))
	self:SetBtnData()
	self:OnSelectPage(self.m_BtnBoxArr[1])
end

function CTerraWarMainView.OnClickHelp(self)
	CHelpView:ShowView(function (oView)
		oView:ShowHelp(self:GetHint())
	end)
end

function CTerraWarMainView.GetHint(self)
	return self.m_CurrentBtn.m_Data.hint
end

function CTerraWarMainView.SetBtnData(self)
	for i = 1, #self.m_BtnInfoList do
		self.m_BtnBoxArr[i] = self:CreateBtn()
		self.m_BtnBoxArr[i]:SetData(self.m_BtnInfoList[i])
	end
	self.m_BtnBox:SetActive(false)
end

function CTerraWarMainView.CreateBtn(self)
	local oBtnBox = self.m_BtnBox:Clone()
	oBtnBox.m_OnSelectSprite = oBtnBox:NewUI(1, CSprite)
	oBtnBox.m_UnSelectLabel = oBtnBox:NewUI(2, CLabel)
	oBtnBox.m_SelectLabel = oBtnBox:NewUI(3, CLabel)

	self.m_BtnGrid:AddChild(oBtnBox)
	oBtnBox:SetClickSounPath(define.Audio.SoundPath.Tab)
	oBtnBox:AddUIEvent("click", callback(self, "OnSelectPage", oBtnBox))

	function oBtnBox.SetData(self, oData)
		oBtnBox.m_Data = oData
		oBtnBox.m_UnSelectLabel:SetText(oData.name)
		oBtnBox.m_SelectLabel:SetText(oData.name)
	end

	return oBtnBox
end

function CTerraWarMainView.OnSelectPage(self, oBtnBox)
	if self.m_CurrentBtn ~= nil then
		self.m_CurrentBtn.m_OnSelectSprite:SetActive(false)
		self.m_CurrentBtn.m_UnSelectLabel:SetActive(true)
	end
	self.m_CurrentBtn = oBtnBox
	self.m_CurrentBtn.m_OnSelectSprite:SetActive(true)
	self.m_CurrentBtn.m_UnSelectLabel:SetActive(false)
	self.m_HelpBtn:SetActive(self.m_CurrentBtn.m_Data.hint ~= nil)
	self.m_CurrentBtn.m_Data.callbackFunc()
end

function CTerraWarMainView.OnTerraWarMapPage(self, oBtnBox)
	self:ShowSubPage(self.m_TerraWarMapPage)
end

function CTerraWarMainView.OnTerraWarMinePage(self, oBtnBox)
	self:ShowSubPage(self.m_TerraWarMinePage)
	g_TerrawarCtrl:C2GSTerrawarMine()
end

function CTerraWarMainView.OnTerraWarServerRankPage(self, oBtnBox)
	self:ShowSubPage(self.m_TerraWarServerRankPage)
end

function CTerraWarMainView.OnTerraWarOrgRankPage(self, oBtnBox)
	self:ShowSubPage(self.m_TerraWarOrgRankPage)
end

function CTerraWarMainView.OnTerraWarLogPage(self, oBtnBox)
	self:ShowSubPage(self.m_TerraWarLogPage)
	g_TerrawarCtrl:C2GSTerrawarsLog()
end

function CTerraWarMainView.RefreshInfo(self, personal_points, org_points, end_time, contribution, status)
	personal_points = personal_points
	org_points = org_points
	--end_time = self:GetEndTime(end_time)
	contribution = contribution
	status = status
	self:RefreshTime(status, end_time)
	self.m_ScoreLabel:SetText(string.format("总公会积分：%d  个人积分：%d  贡献度：%d", org_points, personal_points, contribution))
end

function CTerraWarMainView.GetEndTime(self, end_time)
	local curdate = os.date("*t", g_TimeCtrl:GetTimeS())
	if end_time.end_day < curdate.wday then
		end_time.end_day = end_time.end_day + 7
	end
	local wday = end_time.end_day - curdate.wday + 1
	local enddate = {
		year = curdate.year,
		month = curdate.month,
		day = curdate.day + wday,
		hour = end_time.end_hour,
		min = end_time.end_min,
		sec = 0,
	}
	local time = os.time(enddate)
	return os.time(enddate)
end

function CTerraWarMainView.RefreshTime(self, status, end_time)
	if self.m_Timer then
		Utils.DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	if status == define.Terrawar.Open.Yes then
		local time = end_time - g_TimeCtrl:GetTimeS()
		local txt = "[896055FF]据点攻防战剩余时间：[-][FF0000FF]%s"
		local function countdown()
			if Utils.IsNil(self) then
				return 
			end
			if time >= 0 then
				self.m_TimeLabel:SetText(string.format(txt, g_TimeCtrl:GetLeftTime(time, true)))
				time = time - 1
				return true
			else
				self.m_TimeLabel:SetText(string.format(txt, "00:00:00"))
			end
		end
		self.m_Timer = Utils.AddTimer(countdown, 1, 0)
	elseif g_TerrawarCtrl:IsYure() then
		local _, time = g_TerrawarCtrl:GetYureLeftTime()
		local txt = "[896055FF]据点攻防战即将开启：[-][FF0000FF]%s"
		local function countdown()
			if Utils.IsNil(self) then
				return 
			end
			if time >= 0 then
				self.m_TimeLabel:SetText(string.format(txt, g_TimeCtrl:GetLeftTime(time, true)))
				time = time - 1
				return true
			else
				self.m_TimeLabel:SetText(string.format(txt, "00:00:00"))
			end
		end
		self.m_Timer = Utils.AddTimer(countdown, 1, 0)
	else
		local _, time = g_TerrawarCtrl:GetNextLeftTime()
		local txt = "[896055FF]距离下次据点战开启：[-][FF0000FF]%s"
		local function countdown()
			if Utils.IsNil(self) then
				return 
			end
			if time >= 0 then
				self.m_TimeLabel:SetText(string.format(txt, g_TimeCtrl:GetLeftTime(time, true)))
				time = time - 1
				return true
			else
				self.m_TimeLabel:SetText(string.format(txt, "00:00:00"))
			end
		end
		self.m_Timer = Utils.AddTimer(countdown, 1, 0)
	end
end

function CTerraWarMainView.OnGoto(self, oBtn)
	if g_TerrawarCtrl:IsOpenTerrawar() then
		local mapID = self.m_TerraWarMapPage:GetTerraWarMapID()
		local curMapID = g_MapCtrl:GetMapID()
		if curMapID ~= mapID then
			local oHero = g_MapCtrl:GetHero()
			netscene.C2GSClickWorldMap(g_MapCtrl:GetSceneID(), oHero.m_Eid, mapID)
		end
		self:CloseView()
	else
		g_NotifyCtrl:FloatMsg("据点战尚未开启")
	end
end

function CTerraWarMainView.OnChangeTab(self, rankListId)
	if self.m_RankID == rankListId then
		return false
	end
	self.m_RankID = rankListId
	if rankListId == define.Rank.RankId.TerrawarOrg then
		self.m_TerraWarOrgRankPage:RefreshOrgRank()
	elseif rankListId == define.Rank.RankId.TerrawarServer then
		self.m_TerraWarServerRankPage:RefreshServerRank()
	end
	return true
end

return CTerraWarMainView