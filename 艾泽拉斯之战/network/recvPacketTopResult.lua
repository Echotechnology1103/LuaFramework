-- �˺���ս���

function packetHandlerTopResult()
	local tempArrayCount = 0;
	local topType = nil;
	local maxScore = nil;
	local currentScore = nil;
	local rank = nil;

-- ���а�����
	topType = networkengine:parseInt();
-- ��߻���
	maxScore = networkengine:parseInt();
-- ���λ���
	currentScore = networkengine:parseInt();
-- ��ǰ����
	rank = networkengine:parseInt();

	TopResultHandler( topType, maxScore, currentScore, rank );
end

