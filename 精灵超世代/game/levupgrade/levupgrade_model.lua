-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @author: xxx@syg.com(必填, 创建模块的人员)
-- @editor: xxx@syg.com(必填, 后续维护以及修改的人员)
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- <br/>Create: 2018-09-20
-- --------------------------------------------------------------------
LevupgradeModel = LevupgradeModel or BaseClass()

function LevupgradeModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function LevupgradeModel:config()
end

function LevupgradeModel:__delete()
end
