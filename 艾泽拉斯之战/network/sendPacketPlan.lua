-- ս������

function sendPlan(planType, shipPlans, magicPlans)
	networkengine:beginsend(39);
-- ��������,��typedef��attleType
	networkengine:pushInt(planType);
-- �������ã���typedef��ShipPlanInfo
	local arrayLength = #shipPlans;
	if arrayLength > 6 then arrayLength = 6 end;
	networkengine:pushInt(arrayLength);
	for i,v in ipairs(shipPlans) do
		sendPushShipPlanInfo(v);
	end

-- ħ��������
	sendPushActionBar(magicPlans);
	networkengine:send();
end

