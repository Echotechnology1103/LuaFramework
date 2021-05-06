local CChatPEPage = class("CChatPEPage", CPageBase)

function CChatPEPage.ctor(self, obj)
	CPageBase.ctor(self, obj)
end

function CChatPEPage.OnInitPage(self)
	self.m_FactoryScroll = self:NewUI(1, CLinkScrollBox)
	self.m_FilterBtnList = {}
	self.m_InputItemList = {}
	self:InitContent()
end

function CChatPEPage.InitContent(self)
	self:InitFactory()
	self.m_ParentView:Send("")
end

function CChatPEPage.GetItemData(self, itype)
	local amount = 12
	local itemList = g_ItemCtrl:GetPartnerEquip()
	itemList = self:SortList(itemList)
	local resultlist = {}
	local data = {}
	for _, oItem in ipairs(itemList) do
		table.insert(data, oItem.m_ID)
		if #data >= amount then
			table.insert(resultlist, data)
			data = {}
		end
	end
	if #data > 0 then
		table.insert(resultlist, data)
	end
	return resultlist
end

function CChatPEPage.SortList(self, list)
	local sortList = {}
	for _, oItem in ipairs(list) do
		local parid = 0
		if oItem:GetValue("parid") > 0 then
			parid = 1
		end
		local t = {
			oItem,
			oItem:GetValue("star"), 
			parid,
			oItem:GetValue("level"), 
			-oItem:GetValue("pos"),
			oItem.m_ID, 
		}
		table.insert(sortList, t)
	end
	local function cmp(listA, listB)
		for i = 2, 6 do
			if listA[i] ~= listB[i] then
				return listA[i] > listB[i]
			end
		end
		return false
	end
	table.sort(sortList, cmp)
	list = {}
	for _, t in ipairs(sortList) do
		table.insert(list, t[1])
	end
	return list
end

function CChatPEPage.InitFactory(self)
	local function factory(oPage, dData)
		if dData then
			if not oPage.m_Init then
				oPage.m_Grid = oPage:NewUI(1, CGrid)
				oPage.m_CloneBox = oPage:NewUI(2, CBox)
				oPage.m_CloneBox:SetActive(false)
				oPage.m_Init = true
			end
			oPage.m_Grid:Clear()
			for k, v in ipairs(dData) do
				local box = oPage.m_CloneBox:Clone()
				box.m_IconSpr = box:NewUI(1, CSprite)
				box.m_RareSpr = box:NewUI(2, CSprite)
				box.m_GreySpr = box:NewUI(3, CSprite)
				box.m_StarGrid = box:NewUI(4, CGrid)
				box.m_ClickBox = box:NewUI(5, CBox)
				box.m_ParSpr = box:NewUI(6, CSprite)
				box.m_StarSpr = box:NewUI(7,CSprite)
				box.m_LevelLabel = box:NewUI(8, CLabel)
				box.m_ClickBox:AddUIEvent("drag", callback(self, "OnDrag"))
				box.m_ClickBox:AddUIEvent("dragend", callback(self, "OnDragEnd"))
				self:UpdateBox(box, v)
				box:SetActive(true)
				box.m_StarSpr:SetActive(false)
				oPage.m_Grid:AddChild(box)
			end
			oPage.m_Grid:Reposition()
			oPage:SetActive(true)
			return oPage
		end
	end
	self.m_FactoryScroll:SetFactoryFunc(factory)
	self.m_FactoryScroll:SetDataSource(self:GetItemData())
	self.m_FactoryScroll:InitPage()
	g_LinkInfoCtrl:AddCtrlEvent(self:GetInstanceID(), callback(self, "OnLinkCtrlEvent"))
end

function CChatPEPage.OnLinkCtrlEvent(self, oCtrl)
	if oCtrl.m_EventID == define.Link.Event.UpdateIdx then
		if oCtrl.m_EventData.linktype == "item" then
			self:OnSendLink(oCtrl.m_EventData.itemid, oCtrl.m_EventData.idx)
		end
	
	elseif oCtrl.m_EventID == define.Link.Event.UpdateInputText then
		self:UpdateInputText(oCtrl.m_EventData)
	end
end

function CChatPEPage.UpdateBox(self, box, itemid)
	local oItem = g_ItemCtrl:GetItem(itemid)
	if table.index(self.m_InputItemList, itemid) then
		box.m_GreySpr:SetActive(true)
	else
		box.m_GreySpr:SetActive(false)
	end
	self:UpdateStar(box, oItem:GetValue("star"))
	self:UpdatePar(box, oItem:GetValue("parid"))
	box.m_LevelLabel:SetText("+"..tostring(oItem:GetValue("level")))
	local iShape =  CParEquipItem:GetIcon(oItem:GetValue("pos"), oItem:GetValue("stone_level"))
	box.m_IconSpr:SpriteItemShape(iShape)
	box.m_ID = itemid
	box.m_ClickBox:AddUIEvent("click", callback(self, "GetSendLink", itemid))
	box.m_ClickBox:AddUIEvent("longpress", callback(self, "OnPress", itemid))
end

function CChatPEPage.UpdateStar(self, box, star)
	if not box.m_StarGrid.m_Init then
		box.m_StarGrid:SetMaxPerLine(6)
		for i = 1, 6 do
			local spr = box.m_StarSpr:Clone()
			spr:SetActive(true)
			box.m_StarGrid:AddChild(spr)
		end
		box.m_StarGrid:Reposition()
		box.m_StarGrid.m_Init = true
	end
	for i, spr in ipairs(box.m_StarGrid:GetChildList()) do
		if star >= i then
			spr:SetSpriteName("pic_chouka_dianliang")
		else
			spr:SetSpriteName("pic_chouka_weidianliang")
		end
	end
end


function CChatPEPage.UpdatePos(self, box, pos)

end

function CChatPEPage.UpdatePar(self, box, iParID)
	if iParID == 0 then
		box.m_ParSpr:SetActive(false)
	else
		local oPartner = g_PartnerCtrl:GetPartner(iParID)
		if oPartner then
			box.m_ParSpr:SetActive(true)
			box.m_ParSpr:SpriteWarAvatar(oPartner:GetShape())
		else
			box.m_ParSpr:SetActive(false)
		end
	end
end

function CChatPEPage.UpdateInputText(self, sMsg)
	local dLinks = LinkTools.FindLinkList(sMsg, "ItemLink")
	local lItem = {}
	for _, oLink in ipairs(dLinks) do
		table.insert(lItem, oLink.iLinkid)
	end
	self.m_InputItemList = lItem
	self:RefreshContent(lItem)
end

function CChatPEPage.RefreshContent(self, lItem)
	local function updatefunc(oPage)
		for _, box in ipairs(oPage.m_Grid:GetChildList()) do
			if table.index(lItem, box.m_ID) then
				box.m_GreySpr:SetActive(true)
			else
				box.m_GreySpr:SetActive(false)
			end
		end
	end
	self.m_FactoryScroll:RefreshPageContent(updatefunc)
end

function CChatPEPage.OnDrag(self, obj, deltax)
	self.m_FactoryScroll:OnDrag(obj, deltax)
end

function CChatPEPage.OnDragEnd(self, obj)
	self.m_FactoryScroll:OnDragEnd(obj)
end

function CChatPEPage.OnPress(self, itemid, oBtn, bPress)
	if bPress then
		local oItem = g_ItemCtrl:GetItem(itemid)
		if oItem then
			g_WindowTipCtrl:SetWindowItemTipsPartnerEquipInfo(oItem, {hideui=true})
		end
	end
end

function CChatPEPage.GetSendLink(self, itemid)
	g_LinkInfoCtrl:GetItemLinkIdx(itemid)
end

function CChatPEPage.OnSendLink(self, itemid, idx)
	local oItem = g_ItemCtrl:GetItem(itemid)
	local iShape = oItem:GetValue("sid")
	local iAmount = oItem:GetValue("amount")
	local linkstr = LinkTools.GenerateItemLink(idx, itemid, iShape, iAmount)
	self.m_ParentView:Send(linkstr)
end
return CChatPEPage