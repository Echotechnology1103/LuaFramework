


local Util = require"Zeus.Logic.Util"
local ItemDetail = require "Zeus.UI.XmasterBag.ItemDetailMenu"
local CombatDetail = require "Zeus.UI.XmasterActor.UICombatDetail"
local _M = {
    selectItem = nil,selectEquip = nil,selectPos = nil,parent = nil,nodeItems = nil
}
_M.__index = _M

local ui_names = {
    {
        name = "btn_close1",
        click = function(self)
            self:Close()
        end
    },
    { name = "sp_list"},
    { name = "btn_forge",click = function(self)
        
        GlobalHooks.OpenUI(GlobalHooks.UITAG.GameUIItemGetDetail, 0, "equipVirtual"..self.selectPos)
        self:Close()
        
    end},
    { name = "cvs_equip_brief"},
    { name = "cvs_equipicon0"},
    { name = "root"},
    { name = "cvs_equip_list"},
    { name = "cvs_information_detailed"},
    { name = "lb_tips_equipnone"}
}

local buttons_unEquip = {
    {title = Util.GetText(TextConfig.Type.ITEM,'btnUnequip') ,eventName = "Event.UnEquipItem" }
}

local buttons_equip = {
    {title = Util.GetText(TextConfig.Type.ITEM,'btnEquip') , eventName = "Event.EquipItem"}
}

local function closeAllDetail(self)
    if self.detailOther then
        self.detailOther.menu.Visible = false
    end
    if self.detailMy then
        self.detailMy.menu.Visible = false
    end
    self:setMaskSize()
    for k, v in pairs(self.nodes) do
        if v then
            local ib_click = v:FindChildByEditName("ib_click", true)
            ib_click.Visible = false
        end
    end
end

function _M:Close()
    self:OnExit()
    closeAllDetail(self)
end

function _M:closeOtherItemDetail()
    if(self.detailOther) then
        self.detailOther.menu.Visible = false
    end
    self.detailMy.menu.X = 0  
    self:setMaskSize()
                                                                                                                                                                                                                             
end


















function _M:setMaskSize()
    local w = 0
    local x = 1000
    local w2 = 0
    if self.detailMy and self.detailMy.menu.Visible then
        w = w + 1500
        x = 0
        w2 = 1108
    end
    if self.detailOther and self.detailOther.menu.Visible then
        w = w + 1500
        x = x - 1000
        w2 = x+1108
    end
    
    self.mask.Size2D = Vector2.New(w,2000)
    self.mask.X = x 
    self.mask.Y = -500

    self.mask1.Size2D = Vector2.New(w,600)
    self.mask1.X = - 1300
    self.mask1.Y = -500

    self.mask2.Size2D = Vector2.New(w2,2000)
    self.mask2.X = x - 1300
    self.mask2.Y = -500

    self.mask3.Size2D = Vector2.New(w,600)
    self.mask3.X = - 1300
    self.mask3.Y = 582


end

function _M:setSelectItem(selectItem)
    self.itemData = selectItem
    self.selectItem = selectItem.detail
    self.selectPos = self.selectItem.itemSecondType
    self:initFilter()
    local detail_my = self.itemData.detail
    local isEquip_my = self.itemData.IsEquip

    local function operatorCallback(sender, name, item)
        if(name == "Event.UnEquipItem") then
            self.detailMy.menu.Visible = false
            self:setMaskSize()
            self:initFilter()
            self.selectItem = nil
            self.selectEquip = nil
        end
    end
    if(self.detailMy == nil) then
        self.detailMy = ItemDetail.CreateWithMiniXmlInside(1,self.parent.cvs_information_detailed,buttons_unEquip,operatorCallback)
    end
    self:setMaskSize()
    self.detailMy.menu.Visible = true
    self.detailMy:SetItem(self.itemData,isEquip_my)
    self:closeOtherItemDetail()
end

function _M:setSelectPos(itemSecondType)
    self.itemData = nil
    self.selectItem = nil
    self.selectPos = itemSecondType
    closeAllDetail(self)
    self:initFilter()
end

local function ClickItemshow(self, roleEquip, it)
    local detail = it.detail
    local isEquip = it.IsEquip
    if(self.detailOther == nil) then
        local function operatorCallback(sender, name, item)
            if(name == "Event.EquipItem") then
                self:setSelectItem(item)
                self:closeOtherItemDetail()  
            end
        end

        self.detailOther = ItemDetail.CreateWithMiniXmlInside(2,self.parent.cvs_information_detailed,buttons_equip,operatorCallback)
    end
    self.detailOther.menu.Visible = true
    self.detailOther:SetItem(it,isEquip)
    self.detailOther.menu.X = 100
    if(self.detailMy and self.selectItem ~= nil ) then
        self.detailMy.menu.X = self.detailOther.menu.X - self.detailMy.menu.Width
        self.detailMy.menu.Visible = true
    end
    self:setMaskSize()
end


local scores = {}
local function scoresSort (self)
    scores={}
    for i=1, self.Container.Filter.ItemCount do
        local itemData = self.filter_target:GetItemDataAt(i)
        if itemData then
            local scorenum = itemData.detail.equip.score
            table.insert(scores,{id=i,score=scorenum})
        end
    end
    table.sort(scores,function (a,b) return a.score>b.score end)
end

local function initNodeValue(self,node,index)
    local itemData = self.filter_target:GetItemDataAt(index)
    if itemData then
        local ctrlIcon = node:FindChildByEditName("cvs_equipicon0",true)
        if self.nodeItems[node] == nil then
            self.nodeItems[node] = Util.ShowItemShow(ctrlIcon, itemData.detail.static.Icon, itemData.detail.static.Qcolor)
        end
        self.nodeItems[node]:SetItemData(itemData)
        local lb_equipname = node:FindChildByEditName("lb_equipname",true)
        local lb_score = node:FindChildByEditName("lb_score",true)
        local ib_down = node:FindChildByEditName("ib_down",true)
        local ib_up = node:FindChildByEditName("ib_up",true)
        local btn_equip = node:FindChildByEditName("btn_equip",true)
        local btn_getoff = node:FindChildByEditName("btn_getoff",true)
        local btn_compose = node:FindChildByEditName("btn_compose",true)
        local lb_lv = node:FindChildByEditName("lb_lv",true)
        local detail = itemData.detail
        lb_equipname.Text = detail.static.Name
        lb_equipname.FontColor = GameUtil.GetQualityColorUnity(detail.static.Qcolor)
        lb_score.Text = detail.equip.score
        if(self.selectItem) then
            if(detail.equip.score > self.selectItem.equip.score) then
                ib_down.Visible = false
                ib_up.Visible = true
            elseif(detail.equip.score < self.selectItem.equip.score) then
                ib_down.Visible = true
                ib_up.Visible = false
            else
                ib_down.Visible = false
                ib_up.Visible = false
            end
        else
            ib_down.Visible = false
            ib_up.Visible = true
        end
        btn_getoff.Visible = false
        btn_compose.Visible = false
        btn_equip.event_PointerClick = function()
            self.parent:bindEventItem(itemData,btn_equip,"Event.EquipItem")
            CombatDetail.IsCreate(UserData.NotiFyStatus.ALL,true)
            
        end
        node.Enable = true
        node.TouchClick = function()
            self.item_click(false, itemData,true)
            for k,v in pairs(self.nodes) do
                if v then
                    local ib_click = v:FindChildByEditName("ib_click",true)
                    ib_click.Visible = false
                end
            end
            local ib_click = node:FindChildByEditName("ib_click",true)
            ib_click.Visible = true
        end
        local lv = DataMgr.Instance.UserData:TryToGetLongAttribute(UserData.NotiFyStatus.LEVEL,0)
        if detail.static.LevelReq > lv then
            btn_equip.Visible = false
            lb_lv.Visible=true
            lb_lv.Text = Util.GetText(TextConfig.Type.ATTRIBUTE, 114,detail.static.LevelReq)
        else
            lb_lv.Visible=false
            btn_equip.Visible = true
        end
    else
        node.Enable = false
    end
   
end

function _M:initFilter()
    self.Container = HZItemsContainer.New()
    self.Container.IsShowNew = true
    self.Container.IsShowStrengthenLv = true
    self.Container.IsShowLockUnlock = true
    self.Container.CellSize = HZItemShow.SelectSizeToBodySize(self.cvs_equipicon0.Size2D)
    local rolebag = DataMgr.Instance.UserData.RoleBag
    self.Container.ItemPack = rolebag
    local ProTable = GlobalHooks.DB.Find('Character',DataMgr.Instance.UserData.Pro)
    self.filter_target = ItemPack.FilterInfo.New()
    self.filter_target.IsSequence = true
    self.filter_target.Type = ItemData.TYPE_EQUIP
    self.filter_target.CheckHandle = function(item)
        local detail = item.detail
        if detail and detail.static.Pro == ProTable.ProName and self.selectPos == detail.itemSecondType then
            return true
        else
            return false
        end
    end
    self.item_click = function(roleEquip, it,isData)
        local itemData = nil
        if(isData == nil) then
            itemData = it.LastItemData
        else
            itemData = it
        end
        ClickItemshow(self, roleEquip, itemData)
    end
    self.Container.Filter = self.filter_target
    self.Container:OpenSelectMode(false, false, nil, function(con, it)
        if not it.LastItemData then return end
        if it:ContainCustomAttribute('detail_tips') then
            it:RemoveCustomAttribute('detail_tips')
            return
        end
        if self.item_click then
           self.item_click(false, it)
        end
    end )
    scoresSort(self)
    local count = self.Container.Filter.ItemCount
    self.sp_list.Scrollable:Reset(1,count)
    if(count > 0) then
        self.lb_tips_equipnone.Visible = false
    else
        self.lb_tips_equipnone.Visible = true
    end
end

local function Notify()
    
end


function _M:OnEnter()
    DataMgr.Instance.UserData:AttachLuaObserver(119, {Notify = Notify})
    self.menu.Visible = true
end

function _M:OnExit()
    DataMgr.Instance.FlagPushData:DetachLuaObserver(119)
    self.menu.Visible = false
    self.parent:closeEquipList()
end

function _M:OnDispose()
    self.nodeItems = nil
end

local function InitComponent(self, tag)
    self.menu = XmdsUISystem.CreateFromFile("xmds_ui/character/property_equiplist.gui.xml")
    for i = 1,#ui_names,1 do
        local ui = ui_names[i]
        local ctrl = self.menu:FindChildByEditName(ui.name,true)
        if(ctrl) then
            self[ui.name] = ctrl
            if(ui.click) then
                ctrl.TouchClick = function()
                    ui.click(self)
                end
            end
        end
    end
    self.cvs_equip_brief.Visible = false
    self.nodes = {}
    self.sp_list:Initialize(self.cvs_equip_brief.Width,self.cvs_equip_brief.Height,0,1,self.cvs_equip_brief,
        function(gx, gy, node)
            initNodeValue(self,node,scores[gy + 1].id)
            self.nodes[gy + 1] = node
        end , 
        function(cell) 
            cell.Visible = true    
        end
    )

    self.mask = HZCanvas.New()
    self.mask.UnityObject.name = "mask"
    self.mask.Size2D = Vector2.New(self.parent.cvs_character.Width,self.parent.cvs_character.Height)
    self.mask.X = - self.parent.cvs_information_detailed.X
    self.cvs_information_detailed:AddChild(self.mask)
    self.mask.Enable = true
    self.mask.IsInteractive = true
    self.mask.event_PointerClick = function()
        closeAllDetail(self)
    end

    self.mask1 = HZCanvas.New()
    self.mask1.UnityObject.name = "mask1"
    self.mask1.Size2D = Vector2.New(0,0)
    self.mask1.X = - self.parent.cvs_information_detailed.X
    self.cvs_information_detailed:AddChild(self.mask1)
    self.mask1.Enable = true
    self.mask1.IsInteractive = true
    self.mask1.event_PointerClick = function()
        closeAllDetail(self)
    end

    self.mask2 = HZCanvas.New()
    self.mask2.UnityObject.name = "mask2"
    self.mask2.Size2D = Vector2.New(0,0)
    self.mask2.X = - self.parent.cvs_information_detailed.X
    self.cvs_information_detailed:AddChild(self.mask2)
    self.mask2.Enable = true
    self.mask2.IsInteractive = true
    self.mask2.event_PointerClick = function()
        closeAllDetail(self)
    end

    self.mask3 = HZCanvas.New()
    self.mask3.UnityObject.name = "mask3"
    self.mask3.Size2D = Vector2.New(0,0)
    self.mask3.X = - self.parent.cvs_information_detailed.X
    self.cvs_information_detailed:AddChild(self.mask3)
    self.mask3.Enable = true
    self.mask3.IsInteractive = true
    self.mask3.event_PointerClick = function()
        closeAllDetail(self)
    end

    self.menu.Enable = true
    self.sp_list.Enable = true
    self.sp_list.IsInteractive = true
    self.sp_list.Scrollable.event_PointerClick = function()
        closeAllDetail(self)
    end
    self.nodeItems = {}
end

function _M.Create(tag,parent)
    local ret = {}
    setmetatable(ret,_M)
    ret.parent = parent
    InitComponent(ret,tag)
    return ret
end

return _M

