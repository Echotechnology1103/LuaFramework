
--��ѡ����ս��
local xuanbaBattleScene = class("xuanbaBattleScene", function()
	return display.newScene("xuanbaBattleScene")
end)

function xuanbaBattleScene:ctor(param)
	display.addSpriteFramesWithFile("ui/ui_battle.plist", "ui/ui_battle.png")
	game.runningScene = self
	local _data = param.data --ս������
	local enemyName = param.enemyName or "test" --�з���ɫ����
	local enemyCombat = param.enemyCombat --����ս����
	local heroName = param.heroName --��ɫ����
	local heroCombat = param.heroCombat --����ս����
	local function _resultFunc(data)
		if param.beRace then
			pop_scene()
		else
			local resultLayer = require("game.kuafuzhan.xuanbaBattleResultLayer").new({
			data = data,
			name1 = heroName or game.player:getPlayerName(),
			name2 = enemyName,
			attack1 = heroCombat or 1000,
			attack2 = enemyCombat,
			battleInfo = param
			})
			self:addChild(resultLayer, 1000)
		end
	end
	local initData = {
	fubenType = KUAFU_ZHAN,
	fubenId = 3,
	battleData = _data,
	resultFunc = _resultFunc
	}
	local battleLayer = UIManager:getLayer("game.Battle.BattleLayer_sy", nil, initData)
	self:addChild(battleLayer)
end

function xuanbaBattleScene:onEnter()
	game.runningScene = self
end

return xuanbaBattleScene