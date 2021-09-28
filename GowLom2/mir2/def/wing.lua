local wing = {}
local activateCfg = import("csv2cfg.WingActivateCfg")
local baseCfg = import("csv2cfg.WingBaseCfg")
local showCfg = import("csv2cfg.WingShowCfg")

for i, v in ipairs(activateCfg) do
	v.idx = i
end

wing.level2str = function (wingLevel)
	if wingLevel <= 0 then
		return "һ��"
	end

	local level = wingLevel
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
	local l = math.floor(level/10)
	local r = level%10

	if 0 < r then
		l = l + 1
	elseif r == 0 then
		r = 10
	end

	return n2s[l] .. "��" .. n2s[r] .. "��"
end
wing.getAllActivateCfg = function ()
	return activateCfg
end
wing.getAllBaseCfg = function ()
	return baseCfg
end
wing.getAllShowCfg = function ()
	return showCfg
end
wing.getWingNameColor = function (fid)
	local colors = {
		cc.c3b(55, 148, 251),
		cc.c3b(55, 148, 251),
		cc.c3b(207, 21, 225),
		cc.c3b(207, 21, 225),
		cc.c3b(241, 237, 2),
		cc.c3b(241, 237, 2)
	}

	return colors[fid] or cc.c3b(55, 148, 251)
end
wing.getUpgradeCfg = function (level)
	return baseCfg[level]
end
wing.getShowCfg = function (fid)
	return showCfg[fid]
end
wing.getActiveCfg = function (fid)
	return activateCfg[fid]
end
wing.getUpgradeMax = function ()
	return #baseCfg
end
wing.getUpgradeMin = function ()
	return 1
end

return wing
