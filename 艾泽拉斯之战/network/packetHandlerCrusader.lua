function CrusaderHandler( units, kingInfo )
	
	-- ��1��ʼ
	local stageIndex = dataManager.crusadeActivityData:getCurrentStageIndex();
	dataManager.crusadeActivityData:setStageInfo(stageIndex, units, kingInfo);
	
			
end
