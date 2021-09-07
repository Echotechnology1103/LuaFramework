require("game/vip/recharge_data")
RechargeCtrl = RechargeCtrl or BaseClass(BaseController)
function RechargeCtrl:__init()
	if RechargeCtrl.Instance then
		print_error("[RechargeCtrl] Attemp to create a singleton twice !")
	end
	RechargeCtrl.Instance = self
	self.data = RechargeData.New()
	self:RegisterProtocol(SCChongZhiInfo, "OnSCChongZhiInfo")
end

function RechargeCtrl:__delete()
	RechargeCtrl.Instance = nil
	self.data:DeleteMe()
end

function RechargeCtrl:GetData()
	return self.data
end

--充值信息返回
function RechargeCtrl:OnSCChongZhiInfo(protocol)
	DailyChargeData.Instance:OnSCChongZhiInfo(protocol)
	self.data:SetChongZhi7DayFetchReward(protocol)
	local first_charge_view = FirstChargeContentView.Instance
	DailyChargeCtrl.Instance:FlushBtnState()
	-- TipsCtrl.Instance:OnFlushAccumulateChargeView()
	GlobalTimerQuest:AddDelayTimer(function()
		ActiviteHongBaoCtrl.Instance:CheckIsActivite()
	end, 2)
	RemindManager.Instance:Fire(RemindName.Recharge)
	ViewManager.Instance:FlushView(ViewName.VipView)
	ViewManager.Instance:FlushView(ViewName.Main, "jubaopen")
	FirstChargeCtrl.Instance:FlusView()
	DailyChargeCtrl.Instance:FlusView()
	LeiJiRDailyCtrl.Instance:FlusView()

end

--领取充值奖励
function RechargeCtrl:SendChongzhiFetchReward(type, param, param2)
	local protocol = ProtocolPool.Instance:GetProtocol(CSChongzhiFetchReward)
	protocol.type = type
	protocol.param = param --seq
	protocol.param2 = param2 --CHONGZHI_REWARD_TYPE_DAILY时表示选择的奖励索引
	protocol:EncodeAndSend()
end

--充值
function RechargeCtrl:Recharge(money)
	if money and money ~= 0 then
		AgentAdapter.Instance:Pay(Language.Common.Gold, money)
		ReportManager:ReportPay(money)
	else
		SysMsgCtrl.Instance:ErrorRemind("充值操作失败！")
	end
end

--领取7天返利
function RechargeCtrl:SendChongZhi7DayFetchReward()
	local protocol = ProtocolPool.Instance:GetProtocol(CSChongZhi7DayFetchReward)
	protocol:EncodeAndSend()
end
