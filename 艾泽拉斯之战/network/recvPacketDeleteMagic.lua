-- ɾ��ħ��

function packetHandlerDeleteMagic()
	local tempArrayCount = 0;
	local magicID = nil;

-- ��ɾ��ħ����ID���
	magicID = networkengine:parseInt();

	DeleteMagicHandler( magicID );
end

