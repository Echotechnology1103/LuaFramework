-- regist

function sendRegist(name, password, phoneNum, version, mac, serverID)
	networkengine:beginsend(165);
-- �˺�����
	networkengine:pushInt(string.len(name));
	networkengine:pushString(name, string.len(name));
-- ����
	networkengine:pushInt(string.len(password));
	networkengine:pushString(password, string.len(password));
-- phoneNum
	networkengine:pushInt(string.len(phoneNum));
	networkengine:pushString(phoneNum, string.len(phoneNum));
-- Э��汾��
	networkengine:pushInt(version);
-- �豸Ψһ��ʶ
	networkengine:pushInt(string.len(mac));
	networkengine:pushString(mac, string.len(mac));
-- serverID
	networkengine:pushInt(serverID);
	networkengine:send();
end

