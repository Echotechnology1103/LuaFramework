-- ս������

function packetHandlerSyncPlan()
	local tempArrayCount = 0;
	local planType = nil;
	local shipPlans = {};
	local magicPlans = {};

-- ��������,��typedef��attleType
	planType = networkengine:parseInt();
-- �������ã���typedef��ShipPlanInfo
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		shipPlans[i] = ParseShipPlanInfo();
	end
-- ħ��������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		magicPlans[i] = networkengine:parseInt();
	end

	SyncPlanHandler( planType, shipPlans, magicPlans );
end

