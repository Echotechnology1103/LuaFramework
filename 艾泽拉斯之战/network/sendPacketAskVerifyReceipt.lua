-- ������֤֧��ƾ֤��Ȼ�󷢷ŵ���

function sendAskVerifyReceipt(rechargeID, receipt)
	networkengine:beginsend(166);

	print("sendAskVerifyReceipt");
-- ��ֵID
	networkengine:pushInt(rechargeID);
	print("rechargeID "..rechargeID);
-- base64֮���ƾ֤
	networkengine:pushInt(string.len(receipt));
	print("receipt "..receipt);
	networkengine:pushString(receipt, string.len(receipt));
	networkengine:send();
end

