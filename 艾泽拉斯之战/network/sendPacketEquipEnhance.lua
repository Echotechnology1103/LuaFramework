-- װ��ǿ��

function sendEquipEnhance(bagType, position, enhanceType)
	networkengine:beginsend(22);
-- ��������
	networkengine:pushInt(bagType);
-- ��Դ�����е�λ��
	networkengine:pushInt(position);
-- ǿ������,ENHANCE_TYPE
	networkengine:pushInt(enhanceType);
	networkengine:send();
end

