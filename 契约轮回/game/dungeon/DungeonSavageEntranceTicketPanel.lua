---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by win 10.
--- DateTime: 2018/10/10 10:53
---
DungeonSavageEntranceTicketPanel = DungeonSavageEntranceTicketPanel or class("DungeonSavageEntranceTicketPanel", WindowPanel)
local this = DungeonSavageEntranceTicketPanel
--[[
挑战五行圣殿
需要消耗五行圣券：

可消耗<color=#00BE00>90</color>钻石或者绑钻进入，优先消耗绑钻

注:该地图属于自由挑战区域，可能会遭遇玩家攻击
--]]

function DungeonSavageEntranceTicketPanel:ctor(parent_node)
    self.abName = "dungeon";
    self.image_ab = "dungeon_image";
    self.assetName = "DungeonSavageEntranceTicketPanel"
    self.layer = "UI"
    self.panel_type = 4;
    self.model = DungeonModel.GetInstance()
    self.events = {};
    self.schedules = {};

    --DungeonSavageEntranceTicketPanel.super.Load(self)
end

function DungeonSavageEntranceTicketPanel:dctor()
    self.model = nil;
    GlobalEvent:RemoveTabListener(self.events);
    self:StopAllSchedules()

    if self.item then
        self.item:destroy();
    end
    self.data = nil;
end

function DungeonSavageEntranceTicketPanel:Open(data)
    self.data = data;
    WindowPanel.Open(self)
end

function DungeonSavageEntranceTicketPanel:LoadCallBack()
    self.nodes = {
        "ticket_label", "qianwangBtn", "qianwangBtn/qianwangText", "ticket_label3", "ticket_label2", "icon", "ticket_text",
    }
    self:GetChildren(self.nodes)

    SetLocalPosition(self.transform, 0, 0, 0)

    self:SetTileTextImage("dungeon_image", "dungeon_savage_boss_ticket_title");
    self:InitUI();

    self:AddEvent();
end

function DungeonSavageEntranceTicketPanel:InitUI()
    self.item = GoodsIconSettorTwo(self.icon.transform)
    local param = {}
    param["item_id"] = self.data.itemID;
    --param["num"] = num1;
    param["can_click"] = true;
    param["bind"] = true;
    param["size"] = { x = 80, y = 80 }
    self.item:SetIcon(param);
    --self.item:SetNumText()
    --self.item = AwardItem(self.icon.transform);
    --self.item:SetData(self.data.itemID, 0);
    self.num = BagModel:GetInstance():GetItemNumByItemID(self.data.itemID);
    --self.item:UpdateNum(self.num);
    if self.num >= self.data.num then
        self.item:UpdateNum(self.num .. "/" .. self.data.num)
    else
        self.item:UpdateNum("<color=#ff0000>" .. self.num .. "</color>/" .. self.data.num)
    end


    self.ticket_label = GetText(self.ticket_label);
    self.ticket_label2 = GetText(self.ticket_label2);
    self.ticket_label3 = GetText(self.ticket_label3);

    self.ticket_text = GetText(self.ticket_text);
    self.ticket_text.text = tostring(self.data.num);
    SetGameObjectActive(self.ticket_text);

    local num = BagModel:GetInstance():GetItemNumByItemID(self.data.itemID);
    local itemConfig = Config.db_item[self.data.itemID];
    if itemConfig then
        self.ticket_label.text = "Challenge" ..  self.data.sceneName .. "\nCosts"  .. itemConfig.name .. "：<color=#00BE00>" ..self.data.num .. "</color>"
    end


    if num >= self.data.num then
        SetGameObjectActive(self.ticket_label2, false);
        --AddClickEvent(self.qianwangBtn.gameObject, self.data.call_back);
    else
        local vtab = Config.db_voucher[self.data.itemID];
        if vtab then
            self.ticket_label2.text = "Available<color=#00BE00>" .. (self.data.num * vtab.price) .. "</color>Diamonds or Bound Diamonds to enter.Bound Diamonds will be used first"
        else
            self.ticket_label2.text = "Available<color=#00BE00>" .. (self.data.num * 80) .. "</color>Diamonds or Bound Diamonds to enter.Bound Diamonds will be used first"
        end
        --AddClickEvent(self.qianwangBtn.gameObject, handler(self, self.HandleEnter));
    end

end

--@ling autofun
function DungeonSavageEntranceTicketPanel:HandleEnter(target, x, y)
    local call_back = function()
        if self.data.call_back then
            self.data.call_back();
            self:Close();
        end
    end
    Dialog.ShowTwo("Tip", "Insufficient item, spend: 200 bound diamonds or diamonds to enter?", "Confirm", call_back , nil, "Cancel", nil, nil);
end

function DungeonSavageEntranceTicketPanel:AddEvent()
    if self.data then
        AddClickEvent(self.qianwangBtn.gameObject, self.data.call_back);
    end
end

function DungeonSavageEntranceTicketPanel:StopAllSchedules()
    for i = 1, #self.schedules, 1 do
        GlobalSchedule:Stop(self.schedules[i]);
    end
    self.schedules = {};
end