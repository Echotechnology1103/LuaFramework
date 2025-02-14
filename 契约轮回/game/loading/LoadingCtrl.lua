---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by win 10.
--- DateTime: 18/11/10 10:57
---

require("game/loading/RequireLoading");

LoadingCtrl = LoadingCtrl or class("LoadingCtrl", BaseController)
local this = LoadingCtrl

function LoadingCtrl:ctor()
    LoadingCtrl.Instance = self;
    self.events = {};
    self:AddEvents()
    self:RegisterAllProtocal();

end

function LoadingCtrl:dctor()
    GlobalEvent:RemoveTabListener(self.events);
end

function LoadingCtrl:GetInstance()
    if not LoadingCtrl.Instance then
        LoadingCtrl()
    end
    return LoadingCtrl.Instance;
end

function LoadingCtrl:RegisterAllProtocal()

end

function LoadingCtrl:AddEvents()
    AddEventListenerInTab(EventName.ChangeSceneStart, handler(self, self.HandleLoadingOpen), self.events);
    AddEventListenerInTab(EventName.ChangeSceneEnd, handler(self, self.HandleLoading), self.events);
    -- AddEventListenerInTab(EventName.CLOSE_LOADING, handler(self, self.HandleLoadingClose), self.events);
end

function LoadingCtrl:HandleLoading()
    if self.loadingPanel then
        --local callback = function()
        --    if self.loadingPanel then
        --        --print2(debug.traceback());
        --        self:HandleLoadingClose();
        --    end
        --    GlobalSchedule.StopFun(self.checkCloseSchedule);
        --end
        --if self.checkCloseSchedule then
        --    GlobalSchedule.StopFun(self.checkCloseSchedule);
        --end
        --self.checkCloseSchedule = nil;
        --self.checkCloseSchedule = GlobalSchedule.StartFun(callback, 5, -1)
        --self.loadingPanel:TweenAlpha()
    end
end

function LoadingCtrl:HandleLoadingOpen(data)
    -- self:HandleLoadingClose(true);
    if AppConfig.QuickEnterGame then
        SceneManager.Instance:CreateScene(SceneManager:GetInstance():GetSceneId())
        return
    end
    MapManager:GetInstance():CloseLoadingSchedule();
    local curSceneId = SceneManager:GetInstance().last_scene_id

    --logWarn(data);
    --logWarn(curSceneId);

    local sceneCfg = Config.db_scene[data]

    local lastSceneCfg = Config.db_scene[curSceneId] or {}
    --logWarn(Table2String(sceneCfg))
    --logWarn(Table2String(lastSceneCfg))
    if not sceneCfg then
        -- 当前存在loading但是又切换场景，而且最新场景不需要loading
        self:HandleLoadingClose(true);
        SceneManager.Instance:CreateScene(SceneManager:GetInstance():GetSceneId())
        return
    end
    --全部改 is_loading了
    if self:IsNeedLoading(data) then
        self.preLoadingId = data;
    else
        self:HandleLoadingClose(true);
        SceneManager.Instance:CreateScene(SceneManager:GetInstance():GetSceneId())
        return ;
    end
    ----新手BOSS副本不需要Loading,
    --if sceneCfg and sceneCfg.stype and lastSceneCfg and lastSceneCfg.stype then
    --    if sceneCfg.stype == enum.SCENE_STYPE.SCENE_STYPE_DUNGE_NEWBIE or lastSceneCfg.stype == enum.SCENE_STYPE.SCENE_STYPE_DUNGE_NEWBIE then
    --        --print2("这次是新手副本了");
    --        -- 当前存在loading但是又切换场景，而且最新场景不需要loading
    --        self:HandleLoadingClose(true);
    --        SceneManager.Instance:CreateScene(SceneManager:GetInstance():GetSceneId())
    --        return
    --    end
    --
    --    if sceneCfg.type == enum.SCENE_TYPE.SCENE_TYPE_BOSS or lastSceneCfg.type == enum.SCENE_TYPE.SCENE_TYPE_BOSS then
    --        --print2("这次是boss副本了");
    --        -- 当前存在loading但是又切换场景，而且最新场景不需要loading
    --        self:HandleLoadingClose(true);
    --        SceneManager.Instance:CreateScene(SceneManager:GetInstance():GetSceneId())
    --        return
    --    end
    --
    --    if sceneCfg.stype == enum.SCENE_STYPE.SCENE_STYPE_DUNGE_ARENA or lastSceneCfg.stype == enum.SCENE_STYPE.SCENE_STYPE_DUNGE_ARENA  then  --竞技场
    --        self:HandleLoadingClose(true);
    --        SceneManager.Instance:CreateScene(SceneManager:GetInstance():GetSceneId())
    --        return
    --    end
    --
    --    if sceneCfg.stype == enum.SCENE_STYPE.SCENE_STYPE_DUNGE_EQUIP or lastSceneCfg.stype == enum.SCENE_STYPE.SCENE_STYPE_DUNGE_EQUIP  then  --装备副本
    --        self:HandleLoadingClose(true);
    --        SceneManager.Instance:CreateScene(SceneManager:GetInstance():GetSceneId())
    --        return
    --    end
    --
    --    if sceneCfg.stype == enum.SCENE_STYPE.SCENE_STYPE_CANDYROOM or lastSceneCfg.stype == enum.SCENE_STYPE.SCENE_STYPE_CANDYROOM  then  --糖果屋
    --        self:HandleLoadingClose(true);
    --        SceneManager.Instance:CreateScene(SceneManager:GetInstance():GetSceneId())
    --        return
    --    end
    --    if sceneCfg.stype == enum.SCENE_STYPE.SCENE_STYPE_MELEEWAR or lastSceneCfg.stype == enum.SCENE_STYPE.SCENE_STYPE_MELEEWAR  then  --乱斗
    --        self:HandleLoadingClose(true);
    --        SceneManager.Instance:CreateScene(SceneManager:GetInstance():GetSceneId())
    --        return
    --    end
    --else
    --    logWarn("没有找到场景配置");
    --    logWarn(Table2String(sceneCfg));
    --    logWarn(Table2String(lastSceneCfg));
    --end

    --BOSS副本也不需要

    -- 需要删除的立即把当前销毁 再重新创建 不能走 HandleLoadingClose
    if self.loadingPanel then
        local panel = self.loadingPanel
        -- 一定要把引用先删除，否则要派发两次destroy当前loading的事件
        self.loadingPanel = nil
        panel:destroy()
    end

    local callback = function()
        if self.loadingPanel then
            --print2(debug.traceback());
            self:HandleLoadingClose(true);
            print2("20秒还没有关闭,应该没有派发ChangeSceneEnd");
        end
        GlobalSchedule.StopFun(self.checkSchedule);
    end
    if self.checkSchedule then
        --print2(debug.traceback());
        GlobalSchedule.StopFun(self.checkSchedule);
    end
    self.checkSchedule = nil;

    if lua_resMgr.down_load_all_count > 100 then
        self.checkSchedule = GlobalSchedule.StartFun(callback, 50, -1)
    else
        self.checkSchedule = GlobalSchedule.StartFun(callback, 30, -1)
    end

    --self:ShowMask(true);
    self.loadingPanel = LoadingPanel(LayerManager:GetInstance():GetLayerByName(LayerManager.LayerNameList.Max));
end
--function LoadingCtrl:ShowMask(bool)
--    bool= toBool(bool)
--    if self.mask then
--        destroy(self.mask);
--    end
--    if bool then
--        self.mask = AddBgMask(LayerManager:GetInstance():GetLayerByName(LayerManager.LayerNameList.Top).gameObject , 0,0,0,255)
--    end
--end

function LoadingCtrl:HandleLoadingClose(bool)
    bool = toBool(bool);
    --if bool then
    --    SceneManager.Instance:CreateScene(SceneManager:GetInstance():GetSceneId())
    --end
    if self.loadingPanel then
        if bool then
            self.loadingPanel:destroy();
        else
            self.loadingPanel:CloseInSecond();
        end

        --logWarn("LoadingCtrl:HandleLoadingClose" .. Time.timeSinceLevelLoad);
        --logWarn(debug.traceback());
        --if self.loadingPanel.destroySchedule then
        --    self.loadingPanel:destroy();
        --else
        --    self.loadingPanel.isTwoSecOrDownCom = true;
        --    --print2("还没够2秒...");
        --end

    end
    self.loadingPanel = nil;
end

function LoadingCtrl:IsCanSave(key)
    if key and not self[key] then
        self[key] = true;
        return true;
    end
    return false;
end

function LoadingCtrl:ClearAll()
    if self.checkSchedule then
        GlobalSchedule.StopFun(self.checkSchedule);
    end
    self.checkSchedule = nil;

    if self.checkCloseSchedule then
        GlobalSchedule.StopFun(self.checkCloseSchedule);
    end
    self.checkCloseSchedule = nil;
end
function LoadingCtrl:IsNeedLoading(sceneid)
    if self.preLoadingId == sceneid then
        print2(debug.traceback());
        print2("不需要loading");
        return false;
    end
    local sceneCfg = Config.db_scene[sceneid]
    local abName = "mapasset/mapres_" .. sceneid .. AssetsBundleExtName
    if (sceneCfg and sceneCfg.is_loading == 1) or lua_resMgr:IsInDownLoadList(abName) then
        print2(debug.traceback());
        print2("需要loading");
        return true;
    end
    print2(debug.traceback());
    print2("不需要loading");
    return false;
end