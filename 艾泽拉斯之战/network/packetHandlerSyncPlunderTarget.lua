function SyncPlunderTargetHandler( plunderTargets )
	
	--dump(plunderTargets);
	
	dataManager.idolBuildData:setPlunderTargets(plunderTargets);
	
	eventManager.dispatchEvent({name = global_event.IDOLSTATUSROB_SHOW, });
	eventManager.dispatchEvent({name = global_event.IDOLSTATUSROB_UPDATE, });
	
-- data struct
--[==[
[[
	data['units'] = {};
	data['primals'] = {};
-- ����
	local strlength = networkengine:parseInt();
if strlength > 0 then
		data['name'] = networkengine:parseString(strlength);
else
		data['name'] = "";
end
-- ����
	data['rank'] = networkengine:parseInt();
-- ͷ��
	data['icon'] = networkengine:parseInt();
-- ��Ӧ�����id
	data['playerID'] = networkengine:parseInt();
-- ��Ӧ�����ս����
	data['playerPower'] = networkengine:parseInt();
-- ������Ϣ
	data['kingInfo'] = ParseKingInfo();
-- ������Ϣ�б�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['units'][i] = ParseUnitInfo();
	end
-- �Ƿ��ڷ���ս����
	data['status'] = networkengine:parseInt();
-- Դ������
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		data['primals'][i] = networkengine:parseInt();
	end
-- �Ӷᱣ��ʱ��
	data['plunderTime'] = networkengine:parseUInt64();
]]
--]==]

end
