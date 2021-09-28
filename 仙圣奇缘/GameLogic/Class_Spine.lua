--------------------------------------------------------------------------------------
-- �ļ���:	Hero.lua
-- ��  Ȩ:	(C)�������컥���Ƽ����޹�˾
-- ������:	zgj
-- ��  ��:	2015-05-25 18:21
-- ��  ��:	1.0
-- ��  ��:	spine
-- Ӧ  ��:
---------------------------------------------------------------------------------------
CSpine = class("CSpine")
CSpine.__index = CSpine

function CSpine:loadBuZhenSpine()
	local count = 0
	local tbBattleList = g_Hero:getBattleCardList()
	for k,v in pairs(tbBattleList) do		
	    tbCardBattle = g_Hero:getCardObjByServID(v.nServerID)
		if(tbCardBattle)then
			local CSV_CardBase = tbCardBattle:getCsvBase()
			-- echoj("CSpine:loadBuZhenSpine", CSV_CardBase)
			count = count + 1
			if CSV_CardBase.SpineAnimation and CSV_CardBase.SpineAnimation ~= "" then
				g_CocosSpineAnimation(CSV_CardBase.SpineAnimation, 1, true)
			end
			
		end
    end
    for i = count+1,3 do  
    	local tbCard = g_Hero:getCardsInfoByIndex(i)
    	if tbCard then
            local CSV_CardBase = tbCard:getCsvBase()
            g_CocosSpineAnimation(CSV_CardBase.SpineAnimation, 1, true)
        end
    end
end

g_Spine = CSpine:new()