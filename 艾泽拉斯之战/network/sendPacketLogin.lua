-- ��½��

function sendLogin(name, password, version, mac, serverID)
	networkengine:beginsend(6);
-- �˺�����
	networkengine:pushInt(string.len(name));
	networkengine:pushString(name, string.len(name));
-- ����
	networkengine:pushInt(string.len(password));
	networkengine:pushString(password, string.len(password));
-- Э��汾��
	networkengine:pushInt(version);
-- �豸Ψһ��ʶ
	networkengine:pushInt(string.len(mac));
	networkengine:pushString(mac, string.len(mac));
-- serverID
	networkengine:pushInt(serverID);
	networkengine:send();
end

