CCangkuFrameItem = class("CCangkuFrameItem", function()
  return Widget:create()
end)
function CCangkuFrameItem:ctor(itemPos, exGetNumFunc, exGetCanUpgradeFunc, exGetCanNotUseFunc, params)
  self.m_ExGetNumFunc = exGetNumFunc or function(itemIns)
    return itemIns:getProperty(ITEM_PRO_NUM)
  end
  self.m_ExGetCanUpgradeFunc = exGetCanUpgradeFunc or function(itemIns)
    return false
  end
  self.m_ExGetCanNotUseFunc = exGetCanNotUseFunc or function(itemIns)
    return false
  end
  local params = params or {}
  self.m_curPageNum = params.curPage
  self.m_needToLockPage = params.needToLockPage or 0
  local isNeedToAddGrid = params.isNeedToAddGrid or false
  local hasExpandGrid = params.hasExpandGrid or 0
  self.m_curGridNum = params.gridNum or 1
  self.m_hasBuyTheGrid = params.hasBuytheGrid
  local itemBg = ""
  if isNeedToAddGrid == true and self.m_curPageNum >= self.m_needToLockPage then
    if self.m_hasBuyTheGrid == true then
      itemBg = display.newSprite("xiyou/item/itembg.png")
    else
      itemBg = display.newSprite("xiyou/item/itembg_lock.png")
    end
  else
    itemBg = display.newSprite("xiyou/item/itembg.png")
  end
  self.m_ItemBg = itemBg
  itemBg:setAnchorPoint(ccp(0, 0))
  self:addNode(itemBg)
  self.m_bgSize = itemBg:getContentSize()
  self.m_ItemIcon = nil
  self.m_ItemNumLabel = nil
  self.m_ItemTopRightIcon = nil
  self.m_ItemCanNotUseIcon = nil
  self.m_ItemPos = itemPos
  self:SetIconImage()
  self:setTouchEnabled(false)
  self:setNodeEventEnabled(true)
  MessageEventExtend.extend(self)
  self:ListenMessage(MsgID_ItemInfo)
end
function CCangkuFrameItem:getBoxSize()
  return self.m_bgSize
end
function CCangkuFrameItem:IsHasBuyTheGrid()
  return self.m_hasBuyTheGrid
end
function CCangkuFrameItem:getGirdNum()
  return self.m_curGridNum
end
function CCangkuFrameItem:SetIconImage()
  local itemID = g_LocalPlayer:GetCangkuItemIdByCangkuPos(self.m_ItemPos)
  if self.m_ItemIcon then
    self:removeNode(self.m_ItemIcon)
    self.m_ItemIcon = nil
    self.m_ItemNumLabel = nil
    self.m_ItemTopRightIcon = nil
    self.m_ItemCanNotUseIcon = nil
  end
  if itemID ~= nil then
    local player = g_DataMgr:getPlayer()
    local itemObj = player:GetOneCangkuItem(itemID)
    local itemShape = itemObj:getProperty(ITEM_PRO_SHAPE)
    local iconPath = data_getItemPathByShape(itemShape)
    local itemIcon = display.newSprite(iconPath)
    self.m_ItemIcon = itemIcon
    itemIcon:setAnchorPoint(ccp(0, 0))
    self:addNode(itemIcon)
    local iconSize = itemIcon:getContentSize()
    local x, y = (self.m_bgSize.width - iconSize.width) / 2, (self.m_bgSize.height - iconSize.height) / 2
    itemIcon:setPosition(x, y)
    local canUpgradeFlag = self.m_ExGetCanUpgradeFunc(itemObj)
    if canUpgradeFlag then
      local topRightIcon = display.newSprite("xiyou/pic/pic_item_canupgrade.png")
      local size = itemIcon:getContentSize()
      topRightIcon:setPosition(size.width - 10, size.height - 10)
      itemIcon:addChild(topRightIcon)
      self.m_ItemTopRightIcon = topRightIcon
    end
    local canNotUseFlag = self.m_ExGetCanNotUseFunc(itemObj)
    if canNotUseFlag then
      local canNotUseIcon = display.newSprite("xiyou/pic/pic_item_notuse.png")
      local size = itemIcon:getContentSize()
      canNotUseIcon:setPosition(-2, size.height + 2)
      canNotUseIcon:setAnchorPoint(ccp(0, 1))
      itemIcon:addChild(canNotUseIcon)
      self.m_ItemCanNotUseIcon = canNotUseIcon
    end
    local canMerge = itemObj:getProperty(ITEM_PRO_CANMERGE)
    if canMerge ~= 0 and canMerge ~= 1 then
      local num = self.m_ExGetNumFunc(itemObj)
      local numLabel = CCLabelTTF:create(string.format("%s", num), ITEM_NUM_FONT, 22)
      numLabel:setAnchorPoint(ccp(1, 0))
      numLabel:setPosition(ccp(self.m_bgSize.width - 6 - x, 5 - y))
      numLabel:setColor(ccc3(255, 255, 255))
      itemIcon:addChild(numLabel)
      AutoLimitObjSize(numLabel, 70)
      self.m_ItemNumLabel = numLabel
    end
  end
end
function CCangkuFrameItem:getItemID()
  return g_LocalPlayer:GetCangkuItemIdByCangkuPos(self.m_ItemPos)
end
function CCangkuFrameItem:setTouchState(flag)
  if self.m_curPageNum >= self.m_needToLockPage and self.m_hasBuyTheGrid == false then
  elseif g_LocalPlayer:GetCangkuItemIdByCangkuPos(self.m_ItemPos) == nil then
    return
  end
  if flag then
    self.m_ItemBg:setColor(ccc3(200, 200, 200))
  else
    self.m_ItemBg:setColor(ccc3(255, 255, 255))
  end
end
function CCangkuFrameItem:setFadeIn()
  local dt = 0.5
  self.m_ItemBg:setOpacity(0)
  self.m_ItemBg:runAction(CCFadeIn:create(dt))
  if self.m_ItemIcon ~= nil then
    self.m_ItemIcon:setOpacity(0)
    self.m_ItemIcon:runAction(CCFadeIn:create(dt))
  end
  if self.m_ItemNumLabel ~= nil then
    self.m_ItemNumLabel:setOpacity(0)
    self.m_ItemNumLabel:runAction(CCFadeIn:create(dt))
  end
  if self.m_ItemTopRightIcon ~= nil then
    self.m_ItemTopRightIcon:setOpacity(0)
    self.m_ItemTopRightIcon:runAction(CCFadeIn:create(dt))
  end
  if self.m_ItemCanNotUseIcon ~= nil then
    self.m_ItemCanNotUseIcon:setOpacity(0)
    self.m_ItemCanNotUseIcon:runAction(CCFadeIn:create(dt))
  end
  if self.m_ChoosedFrame ~= nil then
    self.m_ChoosedFrame:setOpacity(0)
    self.m_ChoosedFrame:runAction(CCFadeIn:create(dt))
  end
end
function CCangkuFrameItem:setSelected(flag)
  if flag == true then
    if self.m_ChoosedFrame == nil then
      self.m_ChoosedFrame = display.newSprite("xiyou/item/selecteditem.png")
      self:addNode(self.m_ChoosedFrame, 10)
      local size = self.m_ItemBg:getContentSize()
      self.m_ChoosedFrame:setPosition(ccp(size.width / 2, size.height / 2))
    end
  elseif self.m_ChoosedFrame ~= nil then
    self.m_ChoosedFrame:removeFromParent()
    self.m_ChoosedFrame = nil
  end
end
function CCangkuFrameItem:onCleanup()
  self.m_ExGetNumFunc = nil
  self.m_ExGetCanUpgradeFunc = nil
  self.m_ExGetCanNotUseFunc = nil
  self:RemoveAllMessageListener()
end
function CCangkuFrameItem:OnMessage(msgSID, ...)
  local arg = {
    ...
  }
  if msgSID == MsgID_ItemInfo_CangkuItemUpdate then
    local para = arg[1]
    local itemID = g_LocalPlayer:GetCangkuItemIdByCangkuPos(self.m_ItemPos)
    if para.itemId == itemID then
      self:SetIconImage()
    end
  elseif msgSID == MsgID_ItemInfo_ItemCangkuPosUpdate then
    local para = arg[1]
    local itemID = g_LocalPlayer:GetCangkuItemIdByCangkuPos(self.m_ItemPos)
    if para.itemId == itemID then
      self:SetIconImage()
    end
  elseif msgSID == MsgID_ItemInfo_PosClear and arg[1] == self.m_ItemPos then
    self:SetIconImage()
  end
end
CCangkuFrame = class("CCangkuFrame", function()
  return Widget:create()
end)
function CCangkuFrame:ctor(listType, clickListener, pageListener, listParam, exSelectFunc, exGetNumFunc, inRoleFlag, exGetCanUpgradeFunc, exGetCanNotUseFunc, isNeedToAddGrid, needToLockPage, clickEmtyItemListener)
  self.m_ListType = listType
  self.m_ClickListener = clickListener
  self.m_ClickEmtyItemListener = clickEmtyItemListener
  self.m_PageListener = pageListener
  self.m_ExSelectFunc = exSelectFunc or function(itemIns)
    return true
  end
  self.m_ExGetNumFunc = exGetNumFunc or function(itemIns)
    return itemIns:getProperty(ITEM_PRO_NUM)
  end
  self.m_ExGetCanUpgradeFunc = exGetCanUpgradeFunc or function(itemIns)
    return false
  end
  self.m_ExGetCanNotUseFunc = exGetCanNotUseFunc or function(itemIns)
    return false
  end
  if listParam == nil then
    listParam = {}
  end
  self.m_hasExpandGrid = g_LocalPlayer:GetExpandCangkuGird() or 0
  self.m_MaxPackageGird = MAX_CANGKU_NUM
  self.m_ListParam = listParam
  self.m_XYSpace = listParam.xySpace or ccp(5, 2)
  self.m_ItemSize = listParam.itemSize or CCSize(100, 94)
  self.m_PageLines = listParam.pageLines or 4
  self.m_OneLineNum = listParam.oneLineNum or 5
  self.m_PageItemNum = self.m_PageLines * self.m_OneLineNum
  self.m_MaxPageNum = listParam.maxPageNum or 6
  self.m_PageIconOffY = listParam.pageIconOffY or -30
  if inRoleFlag == nil then
    inRoleFlag = false
  end
  self.m_InRoleFlag = inRoleFlag
  local mWidth = self.m_OneLineNum * self.m_ItemSize.width + (self.m_OneLineNum - 1) * self.m_XYSpace.x
  local mHeight = self.m_PageLines * self.m_ItemSize.height + (self.m_PageLines - 1) * self.m_XYSpace.y
  self.m_CurrPageIndex = -1
  self.m_CurrPageItemObjs = {}
  self:setTotalItemPosList()
  self.m_PagePoint = {}
  self:ignoreContentAdaptWithSize(false)
  self:setSize(CCSize(mWidth, mHeight))
  self:ShowPackagePage(1, listParam.fadeoutAction)
  self:setAnchorPoint(ccp(0, 0))
  self:setTouchEnabled(true)
  self:addTouchEventListener(function(touchObj, event)
    self:OnTouchEvent(touchObj, event)
  end)
  self:setNodeEventEnabled(true)
  MessageEventExtend.extend(self)
  self:ListenMessage(MsgID_ItemInfo)
  self.m_SelectedID = nil
end
function CCangkuFrame:getListType()
  return self.m_ListType
end
function CCangkuFrame:getTotalPageNum()
  return self.m_TotalPageNum
end
function CCangkuFrame:getCurrPageIndex()
  return self.m_CurrPageIndex
end
function CCangkuFrame:getCurPageObj()
  return self.m_CurrPageItemObjs
end
function CCangkuFrame:getFrameSize()
  local w = self.m_OneLineNum * self.m_ItemSize.width + (self.m_OneLineNum - 1) * self.m_XYSpace.x
  local h = self.m_PageLines * self.m_ItemSize.height + (self.m_PageLines - 1) * self.m_XYSpace.y
  return CCSize(w, h)
end
function CCangkuFrame:setTotalItemPosList()
  if self.m_TotalItemPosList == nil then
    self.m_TotalItemPosList = {}
  end
  local player = g_DataMgr:getPlayer()
  if self.m_ListType == nil then
    self.m_TotalItemPosList = {}
    for i = 1, self.m_MaxPackageGird do
      self.m_TotalItemPosList[#self.m_TotalItemPosList + 1] = i
    end
  else
    local OldPosList = DeepCopyTable(self.m_TotalItemPosList)
    self.m_TotalItemPosList = {}
    local typeList = PACKAGE_NAME_TYPELIST_DICT[self.m_ListType]
    for _, typeName in pairs(typeList) do
      local tempItemList
      if self.m_InRoleFlag then
        tempItemList = player:GetItemTypeListIncludeRole(typeName)
      else
        tempItemList = player:GetItemTypeList(typeName)
      end
      for _, itemId in pairs(tempItemList) do
        local tempItemIns = player:GetOneCangkuItem(itemId)
        if tempItemIns ~= nil and self.m_ExSelectFunc(tempItemIns) then
          local tempPos = tempItemIns:getProperty(ITME_PRO_PACKAGE_POS)
          if tempPos ~= 0 and tempPos ~= nil then
            self.m_TotalItemPosList[#self.m_TotalItemPosList + 1] = tempPos
          end
        end
      end
    end
    table.sort(self.m_TotalItemPosList)
    for index, oldPos in ipairs(OldPosList) do
      local tempId = g_LocalPlayer:GetCangkuItemIdByCangkuPos(oldPos)
      local tempItemIns = player:GetOneCangkuItem(tempId)
      if tempItemIns ~= nil then
        local tempLargeType = tempItemIns:getType()
        local isChooseLargeType = false
        for _, typeName in pairs(typeList) do
          if tempLargeType == typeName then
            isChooseLargeType = true
            break
          end
        end
        if isChooseLargeType and self.m_ExSelectFunc(tempItemIns) then
        else
          OldPosList[index] = 0
        end
      end
    end
    local newItemPosList = {}
    for _, newPos in ipairs(self.m_TotalItemPosList) do
      local inFlag = false
      for _, oldPos in ipairs(OldPosList) do
        if oldPos == newPos then
          inFlag = true
          break
        end
      end
      if not inFlag then
        local hasEmptyFlag = false
        for index, oldPos in ipairs(OldPosList) do
          local tempId = g_LocalPlayer:GetCangkuItemIdByCangkuPos(oldPos)
          if tempId == nil or tempId == 0 then
            OldPosList[index] = newPos
            hasEmptyFlag = true
            break
          end
        end
        if not hasEmptyFlag then
          OldPosList[#OldPosList + 1] = newPos
        end
      end
    end
    self.m_TotalItemPosList = DeepCopyTable(OldPosList)
  end
  if self.m_MaxPageNum then
    self.m_TotalPageNum = self.m_MaxPageNum
  else
    self.m_TotalPageNum = math.max(math.ceil(#self.m_TotalItemPosList / self.m_PageItemNum), 1)
  end
end
function CCangkuFrame:ShowPackagePage(pageIndex, showAction)
  if self.m_CurrPageIndex == pageIndex then
    return
  end
  self.m_CurrPageIndex = pageIndex
  for _, obj in pairs(self.m_CurrPageItemObjs) do
    obj:removeFromParentAndCleanup(true)
  end
  self.m_CurrPageItemObjs = {}
  local pageItemIdList = {}
  local idIndex = 1 + self.m_PageItemNum * (self.m_CurrPageIndex - 1)
  local iWidth = self.m_ItemSize.width
  local iHeight = self.m_ItemSize.height
  local spacex = self.m_XYSpace.x
  local spacey = self.m_XYSpace.y
  for line = 1, self.m_PageLines do
    for i = 1, self.m_OneLineNum do
      local gridNum = (line - 1) * self.m_OneLineNum + i
      local tempPos = self.m_TotalItemPosList[idIndex]
      local itemID = g_LocalPlayer:GetCangkuItemIdByCangkuPos(tempPos)
      local itemIns = g_LocalPlayer:GetOneCangkuItem(itemID)
      local hasBuytheGrid = false
      if self.m_hasExpandGrid >= (self.m_CurrPageIndex - CangKuLockPage) * 20 + gridNum then
        hasBuytheGrid = true
      end
      local params = {
        gridNum = gridNum,
        curPage = self.m_CurrPageIndex,
        isNeedToAddGrid = true,
        hasExpandGrid = 0,
        hasBuytheGrid = hasBuytheGrid,
        needToLockPage = CangKuLockPage
      }
      local itemObj = CCangkuFrameItem.new(tempPos, self.m_ExGetNumFunc, self.m_ExGetCanUpgradeFunc, self.m_ExGetCanNotUseFunc, params)
      itemObj:setSelected(self.m_SelectedID ~= nil and itemID == self.m_SelectedID)
      self:addChild(itemObj)
      local ox, oy = (iWidth + spacex) * (i - 1), (iHeight + spacey) * (self.m_PageLines - line)
      itemObj.m_OriPosXY = ccp(ox, oy)
      itemObj:setPosition(itemObj.m_OriPosXY)
      self.m_CurrPageItemObjs[#self.m_CurrPageItemObjs + 1] = itemObj
      idIndex = idIndex + 1
      if showAction == true then
        itemObj:setFadeIn()
      end
    end
  end
  if self.m_PageListener then
    self.m_PageListener(self.m_CurrPageIndex, self.m_TotalPageNum)
  end
  self:SetPagePoint()
end
function CCangkuFrame:SetPagePoint()
  for page, pagePoint in pairs(self.m_PagePoint) do
    pagePoint:removeFromParent()
  end
  self.m_PagePoint = {}
  if self.m_TotalPageNum > 1 then
    local size = self:getSize()
    local midx = size.width / 2
    local spacex = 25
    for page = 1, self.m_TotalPageNum do
      local pagePointBg = display.newSprite("views/pic/pic_page_unsel.png")
      pagePointBg:setAnchorPoint(ccp(0.5, 0.5))
      self:addNode(pagePointBg)
      self.m_PagePoint[#self.m_PagePoint + 1] = pagePointBg
      local x = midx + (page - (self.m_TotalPageNum + 1) / 2) * spacex
      pagePointBg:setPosition(x, self.m_PageIconOffY)
    end
    local curPage = self.m_CurrPageIndex
    local pagePoint = display.newSprite("views/pic/pic_page_sel.png")
    pagePoint:setAnchorPoint(ccp(0.5, 0.5))
    self:addNode(pagePoint)
    local x = midx + (curPage - (self.m_TotalPageNum + 1) / 2) * spacex
    self.m_PagePoint[#self.m_PagePoint + 1] = pagePoint
    pagePoint:setPosition(x, self.m_PageIconOffY)
  end
end
function CCangkuFrame:ShowPrePackagePage()
  if self.m_CurrPageIndex <= 1 then
    return false
  end
  self:ShowPackagePage(self.m_CurrPageIndex - 1, true)
  return true
end
function CCangkuFrame:ShowNextPackagePage()
  if self.m_CurrPageIndex >= self.m_TotalPageNum then
    return false
  end
  self:ShowPackagePage(self.m_CurrPageIndex + 1, true)
  return true
end
function CCangkuFrame:ReloadCurrPackge()
  self:setTotalItemPosList()
  self.m_TouchBeganItem = nil
  local temp = self.m_CurrPageIndex
  self.m_CurrPageIndex = -1
  if temp > self.m_TotalPageNum then
    temp = self.m_TotalPageNum
  end
  self:ShowPackagePage(temp, false)
end
function CCangkuFrame:ClickPackageItem(itemID, gridNum, isHasBuyTheGrid)
  print("CCangkuFrame:ClickPackageItem", itemID, gridNum, isHasBuyTheGrid)
  if self.m_CurrPageIndex >= CangKuLockPage then
    if isHasBuyTheGrid == false then
      self:popPackageGridBuyView(gridNum)
    elseif self.m_ClickListener and itemID ~= nil then
      self.m_ClickListener(itemID)
    end
  elseif self.m_ClickListener and itemID ~= nil then
    self.m_ClickListener(itemID)
  end
end
function CCangkuFrame:popPackageGridBuyView(gridNum)
  local goldPrice = data_CangkuExpand[self.m_hasExpandGrid + 1].CostGold
  local text = string.format("是否需要花费%d#<IR2>#\n解锁一个仓库格？", goldPrice)
  local confirmBoxDlg = CPopWarning.new({
    title = "提示",
    text = text,
    confirmFunc = function()
      if g_LocalPlayer:getGold() >= goldPrice then
        netsend.netcangku.reqExpendCangku()
      else
        ShowNotifyTips(string.format("元宝不足%d", goldPrice))
        ShowRechargeView({resType = RESTYPE_GOLD})
      end
    end,
    cancelText = "取消",
    confirmText = "确定",
    align = CRichText_AlignType_Center,
    autoConfirmTime = autoConfirmTime,
    autoCancelTime = autoCancelTime,
    hideInWar = hideInWar
  })
  confirmBoxDlg:ShowCloseBtn(false)
end
function CCangkuFrame:OnTouchEvent(touchObj, event)
  if event == TOUCH_EVENT_BEGAN then
    self:ResetToOriPosXY()
    local startPos = touchObj:getTouchStartPos()
    self.m_TouchBeganItem = self:checkTouchBeganPos(startPos)
    self.m_HasTouchMoved = false
  elseif event == TOUCH_EVENT_MOVED then
    local startPos = touchObj:getTouchStartPos()
    local movePos = touchObj:getTouchMovePos()
    if not self.m_HasTouchMoved and math.abs(startPos.x - movePos.x) + math.abs(startPos.y - movePos.y) > 40 then
      self.m_HasTouchMoved = true
    end
    if self.m_HasTouchMoved then
      if self.m_TouchBeganItem then
        self.m_TouchBeganItem:setTouchState(false)
        self.m_TouchBeganItem = nil
      end
      self:DrugCurrPage(movePos.x - startPos.x)
    end
  elseif event == TOUCH_EVENT_ENDED or event == TOUCH_EVENT_CANCELED then
    if self.m_HasTouchMoved then
      if self.m_TouchBeganItem ~= nil then
        self.m_TouchBeganItem:setTouchState(false)
        self.m_TouchBeganItem = nil
      end
      local startPos = touchObj:getTouchStartPos()
      local endPos = touchObj:getTouchEndPos()
      self:DrugAtPos(startPos, endPos)
    else
      self:ClickAtPos()
    end
  end
end
function CCangkuFrame:checkTouchBeganPos(pos)
  local touchPos = self:convertToNodeSpace(ccp(pos.x, pos.y))
  for _, itemObj in pairs(self.m_CurrPageItemObjs) do
    local x, y = itemObj:getPosition()
    if x <= touchPos.x and touchPos.x <= x + self.m_ItemSize.width and y <= touchPos.y and touchPos.y <= y + self.m_ItemSize.height then
      itemObj:setTouchState(true)
      return itemObj
    end
  end
  return nil
end
function CCangkuFrame:getTouchBeganItem()
  return self.m_TouchBeganItem
end
function CCangkuFrame:getItemById(itemId)
  for _, itemObj in pairs(self.m_CurrPageItemObjs) do
    if itemObj.getItemID and itemObj:getItemID() == itemId then
      return itemObj
    end
  end
  return nil
end
function CCangkuFrame:JumpToItemPage(itemObjId, selectedFlag, showAction)
  if itemObjId == nil then
    return
  end
  local pageIndex, jumpToItemIndex
  for itemIndex, tempPos in pairs(self.m_TotalItemPosList) do
    local itemId = g_LocalPlayer:GetCangkuItemIdByCangkuPos(tempPos)
    if itemId == itemObjId and itemId ~= nil then
      jumpToItemIndex = itemIndex
      break
    end
  end
  if jumpToItemIndex ~= nil then
    if jumpToItemIndex % self.m_PageItemNum == 0 then
      pageIndex = jumpToItemIndex / self.m_PageItemNum
    else
      pageIndex = math.floor(jumpToItemIndex / self.m_PageItemNum) + 1
    end
  end
  if pageIndex ~= nil then
    self:ShowPackagePage(pageIndex, showAction)
  end
  if selectedFlag ~= false then
    self.m_SelectedID = itemObjId
    for _, item in pairs(self.m_CurrPageItemObjs) do
      if item:getItemID() == itemObjId then
        self.m_TouchBeganItem = item
        if self.m_TouchBeganItem:getItemID() ~= nil and self.m_ClickEmtyItemListener then
          self.m_TouchBeganItem_Old = self.m_TouchBeganItem
        end
        self:ClickPackageItem(itemObjId)
      end
      item:setSelected(false)
    end
    if self.m_SelectedID ~= nil then
      self.m_TouchBeganItem:setSelected(true)
    end
    self.m_TouchBeganItem:setTouchState(true)
    self.m_TouchBeganItem = nil
  end
  return pageIndex
end
function CCangkuFrame:ClickAtPos(startPos)
  if self.m_TouchBeganItem == nil then
    return
  end
  local isHasBuyTheGrid = self.m_TouchBeganItem:IsHasBuyTheGrid()
  local gridNum = self.m_TouchBeganItem:getGirdNum()
  self:ClickPackageItem(self.m_TouchBeganItem:getItemID(), gridNum, isHasBuyTheGrid)
  self.m_SelectedID = self.m_TouchBeganItem:getItemID()
  for _, item in pairs(self.m_CurrPageItemObjs) do
    item:setSelected(false)
  end
  if self.m_SelectedID ~= nil then
    self.m_TouchBeganItem:setSelected(true)
  end
  if self.m_ClickEmtyItemListener then
    if self.m_TouchBeganItem:getItemID() ~= nil then
      self.m_TouchBeganItem_Old = self.m_TouchBeganItem
    end
    if self.m_TouchBeganItem:getItemID() == nil then
      self.m_ClickEmtyItemListener(self.m_TouchBeganItem_Old)
    end
  end
  self.m_TouchBeganItem:setTouchState(false)
  self.m_TouchBeganItem = nil
end
function CCangkuFrame:DrugAtPos(startPos, endPos)
  local offx = endPos.x - startPos.x
  if offx > 20 then
    if not self:ShowPrePackagePage() then
      self:BackToOriPosXY()
    end
  elseif offx < -20 then
    if not self:ShowNextPackagePage() then
      self:BackToOriPosXY()
    end
  else
    self:BackToOriPosXY()
  end
end
function CCangkuFrame:ClearSelectItem()
  self.m_SelectedID = nil
  for _, item in pairs(self.m_CurrPageItemObjs) do
    item:setSelected(false)
  end
end
function CCangkuFrame:ResetToOriPosXY()
  for _, itemObj in pairs(self.m_CurrPageItemObjs) do
    itemObj:stopAllActions()
    local oriPosXY = itemObj.m_OriPosXY
    itemObj:setPosition(oriPosXY)
  end
end
function CCangkuFrame:DrugCurrPage(offx)
  for _, itemObj in pairs(self.m_CurrPageItemObjs) do
    local oriPosXY = itemObj.m_OriPosXY
    local dx = offx / 30
    if dx < -7 then
      dx = -7
    elseif dx > 7 then
      dx = 7
    end
    itemObj:setPosition(ccp(oriPosXY.x + dx, oriPosXY.y))
  end
end
function CCangkuFrame:BackToOriPosXY()
  for _, itemObj in pairs(self.m_CurrPageItemObjs) do
    local oriPosXY = itemObj.m_OriPosXY
    itemObj:stopAllActions()
    itemObj:runAction(CCMoveTo:create(0.3, oriPosXY))
  end
end
function CCangkuFrame:OnMessage(msgSID, ...)
  local arg = {
    ...
  }
  if msgSID == MsgID_ItemInfo_AddCangkuItem then
    self:ReloadCurrPackge()
  elseif msgSID == MsgID_ItemInfo_DelCangkuItem then
    self:ReloadCurrPackge()
  elseif msgSID == MsgID_ItemInfo_FinishedCangkuZhenli then
    self:ReloadCurrPackge()
  elseif msgSID == MsgID_ItemInfo_ExpandCangkuGird then
    self.m_hasExpandGrid = arg[1]
    self:ReloadCurrPackge()
  end
end
function CCangkuFrame:onCleanup()
  self.m_ClickListener = nil
  self.m_PageListener = nil
  self.m_ExSelectFunc = nil
  self.m_ExGetNumFunc = nil
  self.m_ExGetCanUpgradeFunc = nil
  self.m_ExGetCanNotUseFunc = nil
  self.m_ClickEmtyItemListener = nil
  self.m_TouchBeganItem_Old = nil
  self:RemoveAllMessageListener()
end
