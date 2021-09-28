local util = {}
local current = ...
util.getDir = function (from, to)
	local offX = to.x - from.x
	local offY = to.y - from.y
	local angle = math.atan(offY/offX)

	if angle <= math.pi/8 and -math.pi/8 < angle then
		if 0 < offX then
			return def.role.dir.right, 1, 0
		else
			return def.role.dir.left, -1, 0
		end
	elseif angle < (math.pi*3)/8 and math.pi/8 < angle then
		if 0 < offX then
			return def.role.dir.rightBottom, 1, 1
		else
			return def.role.dir.leftUp, -1, -1
		end
	elseif (math.pi*3)/8 <= angle or angle < (-math.pi*3)/8 then
		if 0 < offY then
			return def.role.dir.bottom, 0, 1
		else
			return def.role.dir.up, 0, -1
		end
	elseif angle <= -math.pi/8 and (-math.pi*3)/8 < angle then
		if offY < 0 then
			return def.role.dir.rightUp, 1, -1
		else
			return def.role.dir.leftBottom, -1, 1
		end
	end

	return def.role.dir.bottom, 0, 1
end
util.inSet = function (l, set)
	for k, v in ipairs(set) do
		if l == v then
			return true
		end
	end

	return false
end
util.off2p = function (x, y)
	local player = main_scene.ground.player
	local ret = cc.p(x + player.x, y + player.y)
	ret.off2 = true

	return ret
end
util.off2t = function (x, y, t)
	local ret = cc.p(x + t.x, y + t.y)
	ret.off2 = true

	return ret
end
util.featu = function (race, dress, feature, hair)
	return {
		race = race,
		dress = dress,
		feature = feature,
		hair = hair
	}
end
util.region = function (x, y, r)
	return {
		x = x,
		y = y,
		radio = r or 2
	}
end
util.stressTest = function (skill, useDress, move)
	if not util.dummy or not main_scene then
		return 
	end

	math.randomseed(0)

	local ret = {}
	local dress = {}

	for k, v in pairs(def.items) do
		if type(v) == "table" and (v.stdMode == 10 or v.stdMode == 11) then
			table.insert(dress, k)
		end
	end

	local magics = {
		"������",
		"������",
		"��������",
		"������ս��",
		"�����",
		"ʩ����",
		"��ɱ����",
		"���ܻ�",
		"������",
		"�����Ӱ",
		"�׵���",
		"��ɱ����",
		"�����",
		"�����",
		"��ʥս����",
		"��ħ��",
		"�ٻ�����",
		"������",
		"����������",
		"�ջ�֮��",
		"˲Ϣ�ƶ�",
		"��ǽ",
		"���ѻ���",
		"�����׹�",
		"�����䵶",
		"�һ𽣷�",
		"Ұ����ײ",
		"������ʾ",
		"Ⱥ��������",
		"�ٻ�����",
		"ħ����",
		"ʥ����",
		"������",
		nil,
		"�����",
		"�޼�����",
		"������",
		nil,
		"������",
		nil,
		nil,
		nil,
		"ʨ�Ӻ�",
		nil,
		nil,
		nil,
		nil,
		"��Ѫ��",
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		"���ս���",
		"���ǻ���"
	}
	local mid = {}

	for k, v in pairs(magics) do
		table.insert(mid, k)
	end

	local pre = nil

	for y = -10, 10, 1 do
		for x = 0, 30, 1 do
			local dre = nil

			if useDress then
				dre = dress[math.random(#dress)]
			end

			local d = util.dummy.new("" .. (dress[x] or y), "hero", dre, nil, 0, y%7, cc.p(x - 20, y), nil, nil)

			if skill and pre then
				local tpre = pre

				d.role.node:performWithDelay(function ()
					d.role.node:runForever(cca.seq({
						cca.callFunc(function ()
							local id = mid[math.random(#mid)]

							d:magic(id, tpre)

							return 
						end),
						d.actDelay(slot4, 10)
					}))

					return 
				end, math.random()*10)
			end

			if move then
				local spacing = 2
				local dir_move = {
					[0] = {
						x = 0,
						y = -spacing
					},
					{
						x = spacing,
						y = -spacing
					},
					{
						y = 0,
						x = spacing
					},
					{
						x = spacing,
						y = spacing
					},
					{
						x = 0,
						y = spacing
					},
					{
						x = -spacing,
						y = spacing
					},
					{
						y = 0,
						x = -spacing
					},
					{
						x = -spacing,
						y = -spacing
					}
				}
				local act = dummy.acts.RUN
				local space = 2
				local dir = math.random(8) - 1

				d.role.node.performWithDelay(slot23, function ()
					d.role.node:runForever(cca.seq({
						cca.callFunc(function ()
							dir = math.random(8) - 1

							d:playAct(act, dir_move[dir], dir)

							return 
						end),
						d.actDelay(slot4, 1)
					}))

					return 
				end, math.random()*10)
			end

			pre = slot17

			table.insert(ret, d)
		end
	end

	return function ()
		for k, v in pairs(ret) do
			v.removeSelf(v)
		end

		return 
	end
end

return util
