-- ¼����Ϣ

function packetHandlerReplaySummary()
	local tempArrayCount = 0;
	local replays = {};

-- ¼����Ϣ
	tempArrayCount = networkengine:parseInt();
	for i=1, tempArrayCount do
		replays[i] = ParseReplayInfo();
	end

	ReplaySummaryHandler( replays );
end

