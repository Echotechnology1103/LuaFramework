-- ѡ��ħ�����

function sendChooseMagicResult(magicID)
	networkengine:beginsend(43);
-- ѡ��ħ����id
	networkengine:pushInt(magicID);
	networkengine:send();
end

