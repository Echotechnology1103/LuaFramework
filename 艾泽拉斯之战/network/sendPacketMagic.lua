-- ʩ�Ź���ħ��

function sendMagic(skillID, posX, posY)
	networkengine:beginsend(8);
-- ħ����id
	networkengine:pushInt(skillID);
-- ħ���ͷŵ�λ��
	networkengine:pushInt(posX);
-- ħ���ͷŵ�λ��
	networkengine:pushInt(posY);
	networkengine:send();
end

