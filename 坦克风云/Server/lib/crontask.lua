_TimeCronVars = {
        startTime = 0,
        interval = 0,
        offsetTime = 0,
}

-- ����ʱ��,�ƻ�����ʱ��������ʱ��ļ��,�û��ֶ����ƫ��ʱ��
function setTimeCronVars(startTime,interval,offsetTime)
    _TimeCronVars.startTime = startTime
    _TimeCronVars.interval = interval
    _TimeCronVars.offsetTime = offsetTime
    writeLog({"����setTimeCronVars",startTime,interval,offsetTime},"gamecrond")
end

local osTime = os.time
function os.time()
        return _TimeCronVars.startTime + _TimeCronVars.interval + _TimeCronVars.offsetTime + (osTime() - _TimeCronVars.startTime )
end
