limitedActivityKingLevel = class("limitedActivityKingLevel", limitedActivityBase);

function limitedActivityKingLevel:isTaskComplete()
	-- �����ȼ� ��    �� Դ �� �� ww w . w k ym w .com
	
	return dataManager.playerData:getLevel() >= self.config.params[1];
	
end

-- �Ƿ���ʾǰ����ť
function limitedActivityKingLevel:isShowGotoButton()
	return false;
end

