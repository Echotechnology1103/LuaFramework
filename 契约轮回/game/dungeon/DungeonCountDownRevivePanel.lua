---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by win 10.
--- DateTime: 18/11/23 19:38
---
DungeonCountDownRevivePanel = DungeonCountDownRevivePanel or class("DungeonCountDownRevivePanel", BaseItem)
local this = DungeonCountDownRevivePanel

function DungeonCountDownRevivePanel:ctor(parent_node , data)
    self.abName = "dungeon";
    self.image_ab = "dungeon_image";
    self.assetName = "DungeonCountDownRevivePanel"
    self.layer = "Bottom"
    self.data = data;

    self.model = DungeonModel.GetInstance();
    self.events = {};
    self.schedules = {};
    DungeonCountDownRevivePanel.super.Load(self);
end

function DungeonCountDownRevivePanel:dctor()
    self.model = nil;
    GlobalEvent:RemoveTabListener(self.events);
    self:StopAllSchedules();
    if self.countdownitem then
        self.countdownitem:destroy();
    end
end

--function DungeonCountDownRevivePanel:Open(data)
--    self.data = data;
--    WindowPanel.Open(self)
--end

function DungeonCountDownRevivePanel:LoadCallBack()
    self.nodes = {
        "revive_mask","revive_mask/revive_frame","countdown/countdowntext","countdown",
    }
    self:GetChildren(self.nodes)

    SetLocalPosition(self.transform, 0, 0, 0)
    AddBgMask(self.gameObject , 0,0,0,190);
    self:Init();
    self:AddEvent();
end

function DungeonCountDownRevivePanel:Init()
    --fillAmount
    self.revive_mask = GetImage(self.revive_mask);
    self.revive_mask.fillAmount = 1;
    local param = {
        isShowMin = false,
        duration = 0.033;
        formatTime="%d"
    }
    self.countdownitem = CountDownText(self.countdown , param);

    if self.data then
        self.elapseTime = self.data.time - 0.5;
        self.fullTime = self.data.time;
        self.countdownitem:StartSechudle(self.data.time + os.time(), handler(self , self.Finish) , handler(self , self.CDUpdate));
    end
end

function DungeonCountDownRevivePanel:Finish()
    self:destroy();
end

function DungeonCountDownRevivePanel:CDUpdate(timeTab)
    if self.elapseTime and self.fullTime then
        self.elapseTime = self.elapseTime - 0.033;
        self.revive_mask.fillAmount = tonumber(self.elapseTime) / self.fullTime;
    end
end

function DungeonCountDownRevivePanel:AddEvent()

end

function DungeonCountDownRevivePanel:StopAllSchedules()
    for i = 1, #self.schedules, 1 do
        GlobalSchedule:Stop(self.schedules[i]);
    end
    self.schedules = {};
end
