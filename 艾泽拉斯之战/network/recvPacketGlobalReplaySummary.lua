-- ����Ĺ���¼�������Ϣ

function packetHandlerGlobalReplaySummary()
	local tempArrayCount = 0;
	local battleType = nil;
	local progressID = nil;
	local name = nil;
	local icon = nil;

-- ս������
	battleType = networkengine:parseInt();
-- �ڼ���
	progressID = networkengine:parseInt();
-- ��ţ�������
	local strlength = networkengine:parseInt();
if strlength > 0 then
		name = networkengine:parseString(strlength);
else
		name = "";
end
-- ��ţ���ͼ��
	icon = networkengine:parseInt();

	GlobalReplaySummaryHandler( battleType, progressID, name, icon );
end

