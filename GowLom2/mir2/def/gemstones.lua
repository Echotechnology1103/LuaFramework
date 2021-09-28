local HPDiamond = import("csv2cfg.HPDiamond")
local RapeDiamond = import("csv2cfg.RapeDiamond")
local CriticalDiamond = import("csv2cfg.CriticalDiamond")
local RecoverDiamond = import("csv2cfg.RecoverDiamond")
local StoneDiamond = import("csv2cfg.StoneDiamond")
local ShieldDiamond = import("csv2cfg.ShieldDiamond")
local ChaosDiamond = import("csv2cfg.ChaosDiamond")
local diamonds = {}

table.insert(diamonds, HPDiamond)
table.insert(diamonds, RapeDiamond)
table.insert(diamonds, CriticalDiamond)
table.insert(diamonds, RecoverDiamond)
table.insert(diamonds, StoneDiamond)
table.insert(diamonds, ShieldDiamond)
table.insert(diamonds, ChaosDiamond)

local gemstones = {}

local function loadGenstones()
	gemstones.tConfigData = {}
	gemstones.tOpenItem = {}

	for i = 1, #diamonds, 1 do
		for m, n in ipairs(diamonds[i]) do
			setmetatable(n, g_itemConf)
			table.insert(gemstones.tConfigData, n)

			if n.DiamondLevel == 1 then
				table.insert(gemstones.tOpenItem, n)
			end
		end
	end

	return 
end

scheduler.performWithDelayGlobal(function ()
	loadGenstones()

	return 
end, 0)

local type2str = {
	[0] = "����",
	"ǿ��",
	"Ѫ��",
	"�ظ�",
	"�ػ�",
	"���",
	"����"
}
gemstones.type2str = function (id)
	return type2str[id]
end
gemstones.level2str = function (level, stepNum)
	local n2s = {
		[0] = "��",
		"һ",
		"��",
		"��",
		"��",
		"��",
		"��",
		"��",
		"��",
		"��",
		"ʮ"
	}
	local num = level
	local l = math.floor(level/stepNum)
	local r = level%stepNum

	if 0 < r then
		l = l + 1
	elseif r == 0 then
		r = stepNum
	end

	return n2s[l] .. "��" .. n2s[r] .. "��"
end

return gemstones
