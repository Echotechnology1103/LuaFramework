function SyncGuildMemberInfoChangeHandler( __optional_flag__, id, warScore  )

	if __optional_flag__:isSetbit(0) then
		-- ���˻���
		
		local player = dataManager.guildData:getPlayerByID(id);
		player:setWarScore(warScore);
		
	end
	
end
