-- �ں�ħ��

function sendFuseMagic(star)
	networkengine:beginsend(82);
-- ѡ�����ں�
	networkengine:pushInt(star);
	networkengine:send();
end

