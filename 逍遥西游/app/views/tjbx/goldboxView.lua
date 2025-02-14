function ShowGoldBoxViewDlg(itemId)
  if g_GoldBoxView ~= nil then
    return
  end
  getCurSceneView():addSubView({
    subView = CGoldBoxView.new(itemId),
    zOrder = MainUISceneZOrder.menuView
  })
end
function ReadyToShowGoldBoxResult(itemTypeId, index, itemNum)
  if g_GoldBoxView ~= nil then
    g_GoldBoxView:OnReceiveBoxResult(itemTypeId, index, itemNum)
  else
    ShowGoldBoxResultViewDlg(itemTypeId, itemNum)
  end
end
function ShowGoldBoxResultViewDlg(itemTypeId, itemNum)
  if g_GoldBoxView ~= nil then
    g_GoldBoxView:CloseSelf()
    g_GoldBoxView = nil
  end
  getCurSceneView():addSubView({
    subView = CGoldBoxResult.new(itemTypeId, itemNum),
    zOrder = MainUISceneZOrder.menuView
  })
end
function CloseGoldBoxViewDlg(itemId)
  if g_GoldBoxView ~= nil and g_GoldBoxView:getItemId() == itemId then
    g_GoldBoxView:CloseSelf()
    g_GoldBoxView = nil
  end
end
local ITEM_NUM = 14
local START_SPEED = 0.03
local END_SPEED = 0.5
local MINS_SPEED = 1.5
g_GoldBoxView = nil
CGoldBoxView = class("CGoldBoxView", CcsSubView)
function CGoldBoxView:ctor(itemId)
  print("CGoldBoxView:ctor")
  CGoldBoxView.super.ctor(self, "views/goldbox.json", {
    isAutoCenter = true,
    opacityBg = 100,
    clickOutSideToClose = false
  })
  local btnBatchListener = {
    btn_open = {
      listener = handler(self, self.OnBtn_Open),
      variName = "btn_open"
    },
    btn_close = {
      listener = handler(self, self.OnBtn_Close),
      variName = "btn_close"
    }
  }
  self:addBatchBtnListener(btnBatchListener)
  self.m_ItemId = itemId
  self.m_ItemsList = {}
  self.m_Speed = START_SPEED
  self.m_MyIndex = 1
  self.m_ResultIndex = nil
  self.m_ResultItemTypeId = nil
  self.m_ResultItemNum = 1
  self.m_CanStopFlag = false
  self.m_RunTimes = 0
  self:SetItems()
  g_GoldBoxView = self
  if g_CMainMenuHandler then
    g_CMainMenuHandler:ShowQuickUseBoard()
  end
end
function CGoldBoxView:getItemId()
  return self.m_ItemId
end
function CGoldBoxView:SetItems()
  for i = 1, ITEM_NUM do
    local posLayer = self:getNode(string.format("itempos_%d", i))
    if posLayer == nil then
      break
    end
    posLayer:setVisible(false)
    posLayer:setTouchEnabled(false)
    local data = data_GoldBaoXiang[i]
    if data then
      local itemTypeId = data.ItemId
      local item = CGoldBoxViewItem.new(itemTypeId)
      self.m_ItemsList[i] = item
      self:addChild(item.m_UINode, 99)
      local x, y = posLayer:getPosition()
      item:setPosition(ccp(x, y))
      item:setSelect(false)
    end
  end
end
function CGoldBoxView:RunToNext()
  self:stopAllActions()
  self:SelectItemByIndex(self.m_MyIndex)
  if self.m_RunTimes > 14 then
    if self.m_ResultIndex ~= nil then
      self.m_Speed = self.m_Speed * MINS_SPEED
      local myEndSpeed = END_SPEED
      if myEndSpeed < self.m_Speed then
        self.m_CanStopFlag = true
        self.m_Speed = myEndSpeed
      end
    end
    if self.m_CanStopFlag and self.m_MyIndex == self.m_ResultIndex then
      local a1 = CCDelayTime:create(0.3)
      local a2 = CCCallFunc:create(function()
        ShowGoldBoxResultViewDlg(self.m_ResultItemTypeId, self.m_ResultItemNum)
      end)
      self:runAction(transition.sequence({a1, a2}))
      return
    end
  end
  self.m_RunTimes = self.m_RunTimes + 1
  local act1 = CCDelayTime:create(self.m_Speed)
  local act2 = CCCallFunc:create(function()
    self.m_MyIndex = (self.m_MyIndex + 1) % ITEM_NUM
    if self.m_MyIndex == 0 then
      self.m_MyIndex = ITEM_NUM
    end
    self:RunToNext()
  end)
  self:runAction(transition.sequence({act1, act2}))
end
function CGoldBoxView:SelectItemByIndex(index)
  for i = 1, ITEM_NUM do
    local item = self.m_ItemsList[i]
    if item then
      item:setSelect(i == index)
    end
  end
end
function CGoldBoxView:OnReceiveBoxResult(itemTypeId, index, itemNum)
  self.m_ResultItemTypeId = itemTypeId
  self.m_ResultItemNum = itemNum
  self.m_ResultIndex = index
  self.btn_close:setVisible(false)
  self.btn_close:setTouchEnabled(false)
  self.btn_open:setTouchEnabled(false)
  self.btn_open:setBright(false)
  self:RunToNext()
end
function CGoldBoxView:OnBtn_Open(btnObj, touchType)
  local goldCost = data_BaoXiangVar.GoldBaoXiang_PickUpNeedGold or 120
  local tempView = CPopWarning.new({
    title = "提示",
    text = string.format("本次开启金宝箱需要花费%d#<IR2>#，是否需要开启呢？", goldCost),
    cancelText = "取消",
    confirmText = "确定",
    confirmFunc = function()
      self:confirmOpenBox(goldCost)
    end,
    align = CRichText_AlignType_Left
  })
  tempView:ShowCloseBtn(false)
end
function CGoldBoxView:confirmOpenBox(goldCost)
  local myGold = g_LocalPlayer:getGold()
  if goldCost <= myGold then
    netsend.netmap.pickupMapTreasure(self.m_ItemId)
  else
    ShowNotifyTips("元宝不足")
    ShowRechargeView({resType = RESTYPE_GOLD})
  end
end
function CGoldBoxView:OnBtn_Close()
  if self.m_ResultItemTypeId ~= nil and self.m_ResultItemNum ~= nil then
    ShowGoldBoxResultViewDlg(self.m_ResultItemTypeId, self.m_ResultItemNum)
  end
  self:CloseSelf()
end
function CGoldBoxView:Clear()
  if g_GoldBoxView == self then
    g_GoldBoxView = nil
  end
  if g_CMainMenuHandler then
    g_CMainMenuHandler:ShowQuickUseBoard()
  end
  print("CGoldBoxView:Clear")
end
CGoldBoxViewItem = class("CGoldBoxViewItem", CcsSubView)
function CGoldBoxViewItem:ctor(itemTypeId)
  CGoldBoxViewItem.super.ctor(self, "views/goldbox_item.json")
  self.m_ItemTypeId = itemTypeId
  self.m_Img = nil
  self.m_Pos1 = nil
  self.m_Pos2 = nil
  self.m_SelectImg = nil
  self:setData()
end
function CGoldBoxViewItem:setData()
  local nameTxt = data_getItemName(self.m_ItemTypeId)
  self:getNode("txt_name"):setText(nameTxt)
  AutoLimitObjSize(self:getNode("txt_name"), 75)
  self.m_Pos1 = ccp(3, 33)
  self.m_Pos2 = ccp(12, 40)
  local bgPath = "views/mainviews/pic_headiconbg.png"
  if self.m_ItemTypeId == ITEM_DEF_OTHER_XQJZ_2 then
    bgPath = "views/mainviews/pic_headiconbg_s.png"
    self.m_Pos1 = ccp(-5, 30)
    self.m_Pos2 = ccp(4, 40)
  end
  self.m_Img = createClickItem({
    itemID = self.m_ItemTypeId,
    autoSize = nil,
    num = 0,
    LongPressTime = nil,
    clickListener = nil,
    LongPressListener = nil,
    LongPressEndListner = nil,
    clickDel = nil,
    noBgFlag = nil,
    bgPath = bgPath
  })
  self:addChild(self.m_Img)
end
function CGoldBoxViewItem:setSelect(flag)
  if flag then
    self.m_Img:setScale(1)
    self.m_Img:setPosition(self.m_Pos1)
    self.m_Img._BgIcon:setOpacity(255)
    self.m_Img._Icon:setOpacity(255)
    if self.m_SelectImg == nil then
      self.m_SelectImg = display.newSprite("views/rolelist/pic_role_selected.png")
      self:addNode(self.m_SelectImg, 100)
      self.m_SelectImg:setPosition(ccp(52, 80))
    else
      self.m_SelectImg:setVisible(true)
    end
  else
    self.m_Img:setScale(0.8)
    self.m_Img:setPosition(self.m_Pos2)
    self.m_Img._BgIcon:setOpacity(200)
    self.m_Img._Icon:setOpacity(200)
    if self.m_SelectImg ~= nil then
      self.m_SelectImg:setVisible(false)
    end
  end
end
function CGoldBoxViewItem:getItemTypeId()
  return self.m_ItemTypeId
end
CGoldBoxResult = class("CGoldBoxResult", CcsSubView)
function CGoldBoxResult:ctor(itemTypeId, itemNum)
  CGoldBoxResult.super.ctor(self, "views/goldbox_result.json", {
    isAutoCenter = true,
    opacityBg = 100,
    clickOutSideToClose = false
  })
  local btnBatchListener = {
    btn_close = {
      listener = handler(self, self.OnBtn_Close),
      variName = "btn_close",
      param = {3}
    },
    btn_continue = {
      listener = handler(self, self.OnBtn_Close),
      variName = "btn_continue"
    }
  }
  self:addBatchBtnListener(btnBatchListener)
  local nameTxt = data_getItemName(itemTypeId)
  self:getNode("title_name"):setText(nameTxt)
  local itemIcon = createClickItem({
    itemID = itemTypeId,
    autoSize = nil,
    num = 0,
    LongPressTime = 0,
    clickListener = nil,
    LongPressListener = nil,
    LongPressEndListner = nil,
    clickDel = nil,
    noBgFlag = nil
  })
  self:addChild(itemIcon, 100)
  local pos_body = self:getNode("pos_body")
  pos_body:setVisible(false)
  local x, y = pos_body:getPosition()
  local size1 = pos_body:getSize()
  local size2 = itemIcon:getSize()
  itemIcon:setPosition(ccp(x + size1.width / 2 - size2.width / 2, y + size1.height / 2 - size2.height / 2))
  local imgPath = "views/peticon/boxlight1.png"
  local imgSprite = display.newSprite(imgPath)
  imgSprite:setPosition(ccp(x + size1.width / 2, y + size1.height / 2))
  self:addNode(imgSprite)
  imgSprite:setScale(0)
  imgSprite:runAction(transition.sequence({
    CCScaleTo:create(0.3, 1.4),
    CCCallFunc:create(function()
      soundManager.playSound("xiyou/sound/openbox.wav")
    end),
    CCScaleTo:create(0.2, 1)
  }))
  imgSprite:runAction(CCRepeatForever:create(CCRotateBy:create(1.5, 360)))
  if g_MessageMgr then
    local name = data_getItemName(itemTypeId)
    local txt = string.format("获得#<II%d>##<CI:%d>%sx%d#", itemTypeId, itemTypeId, name, itemNum)
    ShowNotifyTips(txt)
    g_MessageMgr:receivePersonXinxiMessage(txt)
  end
end
function CGoldBoxResult:OnBtn_Close()
  self:CloseSelf()
end
function CGoldBoxResult:Clear()
  if g_GoldBoxView then
    g_GoldBoxView:CloseSelf()
  end
end
