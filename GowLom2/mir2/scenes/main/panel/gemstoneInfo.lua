local info = {
	show = function (data, scenePos, params)
		local maxWidth = 300
		local layer = display.newNode():size(display.width, display.height):addto(params.parent or display.getRunningScene(), params.z or an.z.max)

		layer.setTouchEnabled(layer, true)
		layer.setTouchSwallowEnabled(layer, false)

		if not params.fromSmelting then
			layer.addNodeEventListener(layer, cc.NODE_TOUCH_CAPTURE_EVENT, function (event)
				if event.name == "ended" then
					g_data.player.showTips = false

					layer:runs({
						cc.DelayTime:create(0.01),
						cc.RemoveSelf:create(true)
					})

					info.layer = nil
				end

				return true
			end)
		end

		info.layer = layer
		local labels = {}

		function add(text, color, fontSize)
			text = text or ""
			labels[#labels + 1] = an.newLabel(text, fontSize or 20, 1, {
				color = color
			})

			if maxWidth < labels[#labels]:getw() then
				labels[#labels]:setWidth(maxWidth)
				labels[#labels]:setLineBreakWithoutSpace(true)
				labels[#labels]:updateContent()
			end

			return 
		end

		local str = nil

		if data.state == "unactivie" then
			str = "��������"
			local diamondeConfData = nil

			for i, v in ipairs(def.gemstone.tConfigData) do
				if v.ID == tonumber(data.ID) and v.DiamondLevel == 1 then
					diamondeConfData = slot12

					break
				end
			end

			if diamondeConfData == nil then
				return 
			end

			local stepNum = 10

			if diamondeConfData.ID == 6 then
				stepNum = 7
			end

			if diamondeConfData.NeedLevel and diamondeConfData.NeedLevel ~= 0 then
				add("* ����ȼ��ﵽ" .. common.getLevelText(diamondeConfData.NeedLevel) .. "��", display.COLOR_WHITE)
			end

			if diamondeConfData.NeedServerStep and diamondeConfData.NeedServerStep ~= 0 then
				add("* �������׶δﵽ" .. info.numToGBK(diamondeConfData.NeedServerStep) .. "��", display.COLOR_WHITE)
			end

			if diamondeConfData.NeedStr and diamondeConfData.NeedStr ~= 0 then
				local ss = string.split(diamondeConfData.NeedStr, "/")

				for _, v in ipairs(ss) do
					local sss = string.split(v, "|")
					local needStone = tonumber(sss[2])
					local needLv = tonumber(sss[3])
					local stoneName = def.gemstone.type2str(needStone)
					local need = stoneName .. "��ʯ�ȼ��ﵽ" .. def.gemstone.level2str(needLv, stepNum)

					add("* " .. need, display.COLOR_WHITE)
				end
			end
		else
			if data.info == nil or (data.info and type(data.info) ~= "table") then
				return 
			end

			if data.info.FDesTxt then
				add(data.info.FDesTxt, display.COLOR_WHITE)
			end

			local gemstoneData = {
				FID = tonumber(data.info.FID),
				FLevel = tonumber(data.info.FLevel)
			}
			params = params or {}
			local diamondeConfData = nil

			for i, v in ipairs(def.gemstone.tConfigData) do
				if v.ID == tonumber(gemstoneData.FID) and v.DiamondLevel == tonumber(gemstoneData.FLevel) then
					diamondeConfData = v

					break
				end
			end

			if diamondeConfData == nil then
				return 
			end

			local propStrSeq = {
				"����ֵ",
				"��������",
				"��������",
				"ħ������",
				"ħ������",
				"��������",
				"��������",
				"��������",
				"��������",
				"ħ������",
				"ħ������",
				"��Ѫ�ٶ�",
				"��Ѫ����",
				"��ħ����",
				"ǿ������",
				"ǿ���˺�",
				"��������",
				"����ϵ��",
				"�ػ�����",
				"�ػ�����",
				"��ʥ�˺�",
				"�˺�����",
				"�˺�����",
				"ħ������",
				"���",
				"׼ȷ",
				"����",
				"����"
			}
			local specialProps = {
				"����",
				"ħ��",
				"����",
				"����",
				"ħ��"
			}
			local diamPros = nil

			if params.curStone then
				diamPros = string.split(diamondeConfData.CurDiamondProperty, ";")
			else
				diamPros = string.split(diamondeConfData.DiamondProperty, ";")
			end

			if not diamPros then
				print("not find data")

				return 
			end

			local allProps = {}

			for k, v in ipairs(diamPros) do
				local aPro = string.split(v, "=")

				if (data.job == 0 and not string.find(aPro[1], "��ʦ") and not string.find(aPro[1], "��ʿ") and aPro[1] ~= "ħ������" and aPro[1] ~= "��������" and aPro[1] ~= "ħ������" and aPro[1] ~= "��������") or (data.job == 1 and not string.find(aPro[1], "սʿ") and not string.find(aPro[1], "��ʿ") and aPro[1] ~= "��������" and aPro[1] ~= "��������" and aPro[1] ~= "��������" and aPro[1] ~= "��������") or (data.job == 2 and not string.find(aPro[1], "սʿ") and not string.find(aPro[1], "��ʦ") and aPro[1] ~= "��������" and aPro[1] ~= "ħ������" and aPro[1] ~= "��������" and aPro[1] ~= "ħ������") then
					aPro[1] = string.gsub(aPro[1], "սʿ", "")
					aPro[1] = string.gsub(aPro[1], "��ʦ", "")
					aPro[1] = string.gsub(aPro[1], "��ʿ", "")
					allProps[#allProps + 1] = {
						aPro[1],
						aPro[2]
					}
				end
			end

			local speProp = {}

			for k, v in ipairs(propStrSeq) do
				for _k, _v in ipairs(allProps) do
					if v == _v[1] then
						local isSpecialProp = false

						for m, n in ipairs(specialProps) do
							speProp[n] = speProp[n] or {}

							if _v[1] == n .. "����" then
								isSpecialProp = true
								speProp[n].down = _v[2]
							elseif _v[1] == n .. "����" then
								isSpecialProp = true
								speProp[n].up = _v[2]
							end

							if isSpecialProp and speProp[n] and speProp[n].down and speProp[n].up and (tonumber(speProp[n].down) ~= 0 or tonumber(speProp[n].up) ~= 0 or false) then
								add(n .. ":" .. speProp[n].down .. "-" .. speProp[n].up, display.COLOR_WHITE)
							end
						end

						if not isSpecialProp and _v[2] and tonumber(_v[2]) ~= 0 then
							if _v[1] == "�˺�����" or _v[1] == "�˺�����" then
								add(_v[1] .. ":+" .. _v[2] .. "%", display.COLOR_WHITE)
							else
								add(_v[1] .. ":+" .. _v[2], display.COLOR_WHITE)
							end
						end
					end
				end

				local stepNum = 10

				if gemstoneData.FID == 6 then
					stepNum = 7
				end

				if gemstoneData.FLevel == 0 then
					str = info.numToGBK(1)
				elseif gemstoneData.FLevel%stepNum == 0 then
					str = info.numToGBK(math.floor(gemstoneData.FLevel/stepNum))
				else
					str = info.numToGBK(math.floor(gemstoneData.FLevel/stepNum) + 1)
				end

				local starNum = nil

				if gemstoneData.FLevel == 0 then
					starNum = 0
				elseif gemstoneData.FLevel%stepNum ~= 0 then
					starNum = gemstoneData.FLevel%stepNum
				else
					starNum = stepNum
				end

				starNum = info.numToGBK(starNum)
				str = str .. "��" .. starNum .. "��" .. diamondeConfData.DiamondType .. "��ʯ"
			end
		end

		local bg = display.newScale9Sprite(res.getframe2("pic/scale/scale24.png")):addto(layer):anchor(0, 1)
		local w = 0
		local h = 7
		local space = -2

		for i = #labels, 1, -1 do
			local lh = 0
			w = math.max(w, labels[i]:getw())
			lh = labels[i]:geth()

			labels[i]:addto(bg, 99):pos(10, h):anchor(0, 0)

			local words = utf8strs(labels[i]:getString())
			h = h + lh + space
		end

		local content = an.newLabelM(maxWidth, 20, 1):anchor(0, 0):addto(bg, 99):pos(10, h):anchor(0, 0)

		content.addLabel(content, str, cc.c3b(255, 255, 0))

		local lineNode = content.getCurLabel(content)
		h = h + lineNode.geth(lineNode) + space
		w = math.max(w, content.widthCnt)
		w = w + 20
		h = h + 10

		bg.size(bg, w, h)

		local rect = cc.rect(params.minx or 0, params.miny or 0, params.maxx or display.width, params.maxy or display.height)
		local p = scenePos

		if p.x < rect.x then
			p.x = rect.x
		end

		if rect.width < p.x + w then
			p.x = p.x - w
		end

		if params.showType == "up" then
			if rect.height < p.y + h then
				p.y = rect.height - h
			end

			if p.y < rect.y then
				p.y = p.y
			end

			bg.pos(bg, p.x, p.y + h)
		else
			if rect.height < p.y then
				p.y = rect.height
			end

			if p.y - h < rect.y then
				p.y = p.y + h

				if rect.height < p.y then
					p.y = rect.height
				end
			end

			bg.pos(bg, p.x, p.y)
		end

		return layer
	end,
	close = function ()
		if info.layer then
			g_data.player.showTips = false

			info.layer:runs({
				cc.DelayTime:create(0.01),
				cc.RemoveSelf:create(true)
			})

			info.layer = nil
		end

		return 
	end,
	clear = function ()
		info.layer = nil

		return 
	end,
	numToGBK = function (num)
		local TXT_NUM = {
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

		if TXT_NUM[num] then
			return TXT_NUM[num]
		else
			return TXT_NUM[1]
		end

		return 
	end
}

return info
