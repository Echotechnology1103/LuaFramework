limitedActivityPvpOnline = class("limitedActivityPvpOnline", limitedActivityBase);

function limitedActivityPvpOnline:isTaskComplete()

	-- 
	return dataManager.pvpData:getTotalTimes() >= self.config.params[1];
	
end

-- ���ǰ���Ĵ���Ĭ���ǿ�
function limitedActivityPvpOnline:onClickGoto()

	eventManager.dispatchEvent({name = global_event.ACTIVITYS_HIDE});
	homeland.arenaHandle();
	
end
