-- gmָ��

function sendGm(script)
	networkengine:beginsend(5);
-- �����ı�
	networkengine:pushInt(string.len(script));
	networkengine:pushString(script, string.len(script));
	networkengine:send();
end

