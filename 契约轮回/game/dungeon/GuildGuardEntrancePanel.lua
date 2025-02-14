---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by win 10.
--- DateTime: 18/11/19 17:34
---
GuildGuardEntrancePanel = GuildGuardEntrancePanel or class("GuildGuardEntrancePanel", BaseItem)
local this = GuildGuardEntrancePanel

function GuildGuardEntrancePanel:ctor(parent_node, layer)
    self.abName = "dungeon"
    self.image_ab = "dungeon_image";
    self.assetName = "GuildGuardEntrancePanel"
    self.layer = "UI"
    self.panel_type = 2;
    self.events = {};
    self.model = FactionModel:GetInstance();
    self.dungeon_type = enum.SCENE_STYPE.SCENE_STYPE_GUILDGUARD;
    DungeonCtrl:GetInstance():RequestDungeonPanel(self.dungeon_type)
    GuildGuardEntrancePanel.super.Load(self);
end

function GuildGuardEntrancePanel:dctor()
    destroyTab(self.items);
    self.items = nil;
    destroyTab(self.awarditems);
    self.awarditems = nil;
    GlobalEvent:RemoveTabListener(self.events);

    if self.UIModel then
        self.UIModel:destroy();
    end
    self.UIModel = nil;
    self.values = nil;
end

function GuildGuardEntrancePanel:Open(tabIndex)

end

function GuildGuardEntrancePanel:LoadCallBack()
    self.nodes = {
        "enter_btn", "modelCon", "entrance_bg", "passText", "awardCon", "des/prop_title", "play",
        "des/v5", "des/v3", "des/v4", "des/v1", "des/v2",
        "play/wenhao",
    }
    self:GetChildren(self.nodes);

    SetLocalPosition(self.transform, -62, 12, 0);

    self:InitUI();
    self:AddEvent();

    local res = "guild_guard_entrance_bg";
    lua_resMgr:SetImageTexture(self, self.entrance_bg, "iconasset/icon_big_bg_" .. res, res, false);
end

--建议<color=#46CB53>两人以上</color>组队闯关,\n在限定时间内击杀怪物,\n能提升<color=#46CB53>首领难度</color>,难度越高,\n奖励越好,掉落每人一份。
--
--
--
function GuildGuardEntrancePanel:InitUI()
    self.entrance_bg = GetImage(self.entrance_bg);
    --self.tip_text = GetText(self.tip_text);
    --self.cishuText = GetText(self.cishuText);
    self.prop_title = GetText(self.prop_title);
    self.values = {};
    for i = 1, 5 do
        self.values[i] = GetText(self["v" .. i]);
    end
    self.prop_title = GetText(self.prop_title);
    self.enter_btn = GetButton(self.enter_btn);
    self.values[2].text = "No limit";
    self.values[3].text = "Guild Event";
    local actConfig = Config.db_activity[FactionModel.GUILD_ACTIVITY_ID]
    if actConfig then
        local config = Config.db_dunge[actConfig.scene];
        local timeTab = String2Table(actConfig.time);
        if timeTab then
            local start = timeTab[1];
            local endTime = timeTab[2];
            self.values[1].text = start[1] .. ":" .. string.format("%02d" , tonumber(start[2])) .. "-" .. endTime[1] .. ":" .. string.format("%02d" , tonumber(endTime[2]));
        end

        if config then
            self:InitAwards(config.reward_show);

            self.prop_title.text = config.name;
            self.values[5].text = config.des;

            local level = RoleInfoModel:GetInstance():GetMainRoleLevel();
            if level < tonumber(config.level or 1) then
                self.values[4].text = "<color=#ff0000>Lv." .. config.level .. "Above</color>";
            else
                self.values[4].text = "Lv." .. config.level .. "or above";
            end

        end
    end


end

function GuildGuardEntrancePanel:InitAwards(reward_show)
    if reward_show then
        local awardTab = LString2Table(reward_show);
        destroyTab(self.awarditems);
        self.awarditems = {};

        for i = 1, #awardTab, 1 do
            local tab = awardTab[i];
            local aitem = GoodsIconSettorTwo(self.awardCon.transform)
            local param = {}
            --param["model"] = self.model;
            param["item_id"] = tab[1];
            --param["num"] = num1;
            param["can_click"] = true;
            param["bind"] = true;
            param["size"] = { x = 64, y = 64 }
            aitem:SetIcon(param);

            --local awardItem = AwardItem(self.awardCon);
            ----local num = BagModel:GetInstance():GetItemNumByItemID(tab[i]);
            --awardItem:SetData(tab[i], 0);
            --awardItem:AddClickTips();
            table.insert(self.awarditems, aitem);
        end
    end

end

function GuildGuardEntrancePanel:AddEvent()
    local helptip = function()
        ShowHelpTip(HelpConfig.GuildGuardDungeon.HowToFuck , true);
    end
    AddClickEvent(self.play.gameObject, helptip);

    AddClickEvent(self.enter_btn.gameObject, handler(self, self.HandleEnter));

    local function call_back(dungeon_type, data)
        --if dungeon_type == self.dungeon_type then
        --    self:UpdateData(data)
        --end
    end
    self.events[#self.events + 1] = GlobalEvent:AddListener(DungeonEvent.UpdateDungeonData, call_back)

    -- 后面改
    local function call_back(dungeon_type, data)
        --if dungeon_type == self.dungeon_type then
        --    self:UpdateInfo(data)
        --end
    end
    self.events[#self.events + 1] = GlobalEvent:AddListener(DungeonEvent.UpdateDungeonTime, call_back);

    AddClickEvent(self.wenhao.gameObject, handler(self, self.HandleTip));
end

function GuildGuardEntrancePanel:HandleEnter(target, x, y)
    local roleLevel = RoleInfoModel:GetInstance():GetMainRoleLevel();
    local vipLevel = RoleInfoModel:GetInstance():GetMainRoleVipLevel();
    local config = Config.db_dunge[self.model.GUILD_DUNGE_ID];
    if config then
        if config.level > roleLevel then
            Notify.ShowText("Insufficient level. Please upgrade and come back");
            return ;
        end

        local mainrole_data = RoleInfoModel.GetInstance():GetMainRoleData();
        if not mainrole_data then
            Notify.ShowText("Failed to find guild info");
            return ;
        end
        if mainrole_data.guild and tostring(mainrole_data.guild) == "0" then
            Notify.ShowText("You didn't join any guild yet");
            return ;
        end

        if not ActivityModel:GetInstance():GetActivity(FactionModel:GetInstance().GUILD_ACTIVITY_ID) then
            Notify.ShowText("Event locked");
            return
        end

        DungeonCtrl:GetInstance():RequestEnterDungeon(self.dungeon_type);
    else
        Notify.ShowText("Failed to find guardian guild configuration, please contact cs");
    end
end

function GuildGuardEntrancePanel:HandleTip(go, x, y)
    ShowHelpTip(HelpConfig.GuildGuardDungeon.HowToFuck , true);
end