-- ÿ��������ĸ�����ħ��

function packetHandlerSyncGreatMagic()
	local tempArrayCount = 0;
	local greatMagics = {};

-- ÿ��4������ħ��
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		greatMagics[i] = networkengine:parseInt();
	end

	SyncGreatMagicHandler( greatMagics );
end

