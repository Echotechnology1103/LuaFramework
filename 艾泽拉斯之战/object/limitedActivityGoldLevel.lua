limitedActivityGoldLevel = class("limitedActivityGoldLevel", limitedActivityBase);

function limitedActivityGoldLevel:isTaskComplete()
	-- ���ȼ�
	
	return dataManager.goldMineData:getLevel() >= self.config.params[1];
	
end

-- ���ǰ���Ĵ���Ĭ���ǿ�
function limitedActivityGoldLevel:onClickGoto()
	eventManager.dispatchEvent({name = global_event.ACTIVITYS_HIDE});
	
	homeland.goldHandle();
end
