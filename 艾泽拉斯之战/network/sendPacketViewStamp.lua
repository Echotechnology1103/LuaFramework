-- �ر�ͼ����ǩ

function sendViewStamp(stampType, id)
	networkengine:beginsend(94);
-- ���ͣ�����typedef��viewStampType
	networkengine:pushInt(stampType);
-- ��Ҫ�رյ�ID
	networkengine:pushInt(id);
	networkengine:send();
end

