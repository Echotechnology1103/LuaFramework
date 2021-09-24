--
-- 跨服战录像
-- User: luoning
-- Date: 14-10-15
-- Time: 下午8:59
--
function api_cross_report(request)

    
    local response = {
        ret=-1,
        msg='error',
        data = {},
    }

    local uid = request.uid
    local params = request.params

    if uid == nil  then
        response.ret = -102
        return response
    end

    --检查比赛是否可押注
    require "model.matches"
    local mMatches = model_matches()

    if not next(mMatches.base) then
        response.ret = mMatches.errorCode
        return response
    end

    response.data.report = mMatches.getReportInfo(params)
    response.msg = "Success"
    response.ret = 0
    return response
end
