limitedActivityUnitCount = class("limitedActivityUnitCount", limitedActivityBase);

function limitedActivityUnitCount:isTaskComplete()
	-- ӵ�е��ܾ�����  ��    �� Դ �� �� ww w . w k ym w .com
	
	return cardData.getOwnedCardCount() >= self.config.params[1];
	
end

-- ���ǰ���Ĵ���Ĭ���ǿ�
function limitedActivityUnitCount:onClickGoto()
	eventManager.dispatchEvent({name = global_event.ACTIVITYS_HIDE});
	
	homeland.corpsHandle();
end
