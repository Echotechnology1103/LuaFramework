-- �鿨

function sendDrawCard(drawType)
	networkengine:beginsend(17);
-- �鿨����
	networkengine:pushInt(drawType);
	networkengine:send();
end

