--[[
�����Ƽ�ʹ��
���������������½ǵ�������UI��������ҵ�ǰ���������ʹ�ã������ֱ��ʹ��
lizhuangzhuang
2015��5��5��16:33:25
]]

ItemNumCScriptCfg:Add(
{
	name = "itemguideuse",
	execute = function(bag,pos,tid)
		local bagVO = BagModel:GetBag(bag);
		if not bagVO then return; end
		local item = bagVO:GetItemByPos(pos);
		if not item then return; end
		--����ﵽÿ������,������
		if BagModel:GetItemCanUseNum(tid) == 0 then
			return;
		end
		UIItemGuideUse:Open(item:GetId());
	end
}
);