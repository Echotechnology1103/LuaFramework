-- ϵͳ����

function sendSystemReward(rewardType, id)
	networkengine:beginsend(46);
-- ������type
	networkengine:pushInt(rewardType);
-- ������id
	networkengine:pushInt(id);
	networkengine:send();
end

