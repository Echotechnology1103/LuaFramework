local tbUi = Ui:CreateClass("YXJQ_MainPanel")
tbUi.tbOnClick = {
	BtnPanelOpen = function (self)
		self:OpenRankBoard()
	end;
	BtnClose = function (self)
		Ui:CloseWindow(self.UI_NAME)
	end;
	BtnWish1 = function (self)
		self:ReadMyQS()
	end;
	BtnPanelClose = function (self)
		self:CloseRankBoard()
	end;
	BtnLeft = function (self)
		self.nRankBoardPage = math.max(self.nRankBoardPage - 1, 1)
		self:UpdateRankBoard()
	end;
	BtnRight = function (self)
		self.nRankBoardPage = math.min(self.nRankBoardPage + 1, self.nMaxPage or 1)
		self:UpdateRankBoard()
	end;
	BtnMy = function (self)
		local nMyRankPos = self.nMyRankPos
		if not nMyRankPos or nMyRankPos == 0 then
			return
		end
		local nPage = math.ceil(nMyRankPos /  RankBoard.PAGE_NUM)
		if self.nRankBoardPage == nPage then
			return
		end
		self.nRankBoardPage = nPage
		self:UpdateRankBoard()
	end;
}
for i = 1, 12 do
	tbUi.tbOnClick["WishBar" .. i] = function (self)
		self:ReadFriendQS(i)
	end
end
for i = 1, 7 do
	tbUi.tbOnClick["RankingsList" .. i] = function (self)
		self:ReadRankBoardQS(i)
	end	
end

function tbUi:OnOpen()
	self.nRankBoardPage = 1
	if self.bShowRankBoard then
		self:UpdateRankBoard()
	end
	self:UpdateFriendQSList()
end

function tbUi:OpenRankBoard()
	if self.bShowRankBoard then
		return
	end
	self.pPanel:SetActive("BackGround", true)
	self.bShowRankBoard = true
	self:UpdateRankBoard()
end

function tbUi:CloseRankBoard()
	if not self.bShowRankBoard then
		return
	end
	self.pPanel:SetActive("BackGround", false)
	self.bShowRankBoard = false
end

function tbUi:OnSynRankData()
	if not self.bShowRankBoard then
		return
	end
	self:UpdateRankBoard()
end

function tbUi:UpdateRankBoard()
	local tbData = RankBoard:CheckUpdateData("YinXingJiQingAct", self.nRankBoardPage) or {}
	self.tbRankBoardPlayer = {}
	for i = 1, RankBoard.PAGE_NUM do
		local tbRecord = tbData[i]
		self.pPanel:SetActive("RankingsList" .. i, tbRecord or false)
		if tbRecord then
			self.tbRankBoardPlayer[i] = tbRecord.dwUnitID
			local pPanel = self["RankingsList" .. i].pPanel
			local ImgPrefix, Atlas = Player:GetHonorImgPrefix(tbRecord.nHonorLevel)
			if ImgPrefix then
				pPanel:SetActive("PlayerTitle", true)
				pPanel:Sprite_Animation("PlayerTitle", ImgPrefix, Atlas)
			else
				pPanel:SetActive("PlayerTitle", false)
			end
			pPanel:Label_SetText("lbLevel", tbRecord.nLevel)
			pPanel:Label_SetText("lbRoleName", tbRecord.szName)
			pPanel:Label_SetText("PraiseTxt", tbRecord.szValue)
			local szPortrait, szAtlas = PlayerPortrait:GetSmallIcon(tbRecord.nPortrait)
			pPanel:Sprite_SetSprite("SpRoleHead", szPortrait, szAtlas)
			pPanel:Label_SetText("RankingsTxt", tbRecord.nPosition)
			pPanel:SetActive("RankingsGroup", true)
			for j = 1, 3 do
				pPanel:SetActive("Rankings" .. j, tbRecord.nPosition == j)
			end
			local szFaction = Faction:GetIcon(tbRecord.nFaction)
			pPanel:Sprite_SetSprite("SpFaction", szFaction)
		end
	end
	local tbMyInfo = RankBoard.tbMyRankInfo["YinXingJiQingAct"] or {}
	local nMaxNum  = tbMyInfo.nLength or 0
	self.nMaxPage  = math.max(math.ceil(nMaxNum / RankBoard.PAGE_NUM), 1)
	self.nMyRankPos = tbMyInfo.nPosition
	self.pPanel:Label_SetText("Pages", string.format("%d/%d", self.nRankBoardPage, self.nMaxPage))
end

local tbAct = Activity.YinXingJiQingAct
function tbUi:UpdateFriendQSList()
	self.tbFriendList = {}
	local tbData = tbAct:GetFriendQSList()
	local tbIdx = {}
	for i = 1, 12 do
		table.insert(tbIdx, i)
	end
	if #tbData < 10 then
		tbIdx = Lib:RandomArray(tbIdx)
	end
	for i, nIdx in ipairs(tbIdx) do
		local nPlayerId = tbData[i]
		local tbRecord = FriendShip:GetFriendDataInfo(nPlayerId) or Kin:GetMemberData(nPlayerId)
		self.pPanel:SetActive("WishBar" .. nIdx, tbRecord or false)
		if tbRecord then
			self.pPanel:Label_SetText("RoleName" .. nIdx, tbRecord.szName)
			local ImgPrefix, Atlas = Player:GetHonorImgPrefix(tbRecord.nHonorLevel)
			self.pPanel:SetActive("RoleTitle" .. nIdx, ImgPrefix or false)
			if ImgPrefix then
				self.pPanel:Sprite_Animation("RoleTitle" .. nIdx, ImgPrefix, Atlas)
			end
			local szPortrait, szAtlas = PlayerPortrait:GetSmallIcon(tbRecord.nPortrait)
			self.pPanel:Sprite_SetSprite("SpRoleHead" .. nIdx, szPortrait, szAtlas)
			local szFaction = Faction:GetIcon(tbRecord.nFaction)
			self.pPanel:Sprite_SetSprite("SpFaction" .. nIdx, szFaction)
			self.tbFriendList[nIdx] = nPlayerId
		end
	end
end

function tbUi:ReadFriendQS(nIdx)
	local nPlayerId = self.tbFriendList[nIdx]
	if not nPlayerId then
		return
	end
	tbAct:OpenQS(nPlayerId)
end

function tbUi:ReadRankBoardQS(nIdx)
	local nPlayerId = self.tbRankBoardPlayer[nIdx]
	if not nPlayerId then
		return
	end
	tbAct:OpenQS(nPlayerId)
end

function tbUi:ReadMyQS()
	tbAct:OpenQS(me.dwID)
end

function tbUi:OnYXJQDataUpdate(nType)
	if nType == 1 then
		self:UpdateFriendQSList()
	end
end

function tbUi:RegisterEvent()
	return {
		{ UiNotify.emNOTIFY_SYNC_RANKBOARD_DATA, self.OnSynRankData, self },
		{ UiNotify.emNOTIFY_SYNC_YXJQ_DATA, self.OnYXJQDataUpdate, self },
	}
end