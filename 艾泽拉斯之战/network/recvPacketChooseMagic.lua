-- ѡ��ħ��

function packetHandlerChooseMagic()
	local tempArrayCount = 0;
	local chooses = {};

-- ѡ���б�
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		chooses[i] = ParseMagicChoose();
	end

	ChooseMagicHandler( chooses );
end

