limitedActivityEquipEnhance = class("limitedActivityEquipEnhance", limitedActivityBase);

function limitedActivityEquipEnhance:isTaskComplete()

	-- ��װ��ǿ��
	return dataManager.bagData:hasMaxEnhancedEquipByStar(3, self.config.params[1]);
	
end

-- ���ǰ���Ĵ���Ĭ���ǿ�
function limitedActivityEquipEnhance:onClickGoto()
	eventManager.dispatchEvent({name = global_event.ACTIVITYS_HIDE});
	eventManager.dispatchEvent({name = global_event.ROLE_EQUIP_SHOW, ship = 1});
end
