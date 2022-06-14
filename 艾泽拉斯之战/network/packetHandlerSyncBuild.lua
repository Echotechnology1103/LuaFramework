 
function SyncBuildHandler( buildType, level, gatherTime, upgradeTime, stack, medicatePoint )
 		print("syncBuildHandler buildType "..buildType.." level "..level.." gatherTime "..gatherTime:GetUInt().." upgradeTime "..upgradeTime:GetUInt());
		
		homeland.askBuildResult = true;
		
		local buildData = dataManager.build[buildType] 
		if(buildData)then		
				buildData:setLevel(level)
				buildData:setGatherTime(gatherTime)
				buildData:setLevelUpTime(upgradeTime)
				buildData:setReserves(stack)
				
				eventManager.dispatchEvent({name = global_event.BUILD_ATTR_SYNC,buildType = buildType});	
		end
		
		-- ����һЩ�������Դ
		if buildType == BUILD.BUILD_MAGIC_TOWER then
			-- ��ʦ�����е�ڤ�����
			dataManager.magicTower:setMedicatePoint(medicatePoint);
			print(" medicatePoint "..medicatePoint);
		end
end
