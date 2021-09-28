function main(skillIndex)
	print("test")

	local testAll = false
	local testSkills = false
	local testWalkTo = false
	local testShowEquip = false
	local testNameColor = false
	local testSkillDir = false
	local testStateSkill = false
	local testAct = false
	local testGuide = false
	local testStage = false
	local testDialogNode = false
	local testEffect = false
	local testNewSkill = false
	local testSpaceMove = false
	local testRole = false
	local stress = true

	if testSkills or testAll then
		skillName = {
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
			"���ǻ���",
			[300.0] = "wer"
		}

		for skillIndex, v in pairs({
			[300.0] = "����"
		}) do
			HELPER:say("���ڷ�������:" .. skillName[skillIndex])

			if PlayerJob == "��ʦ" then
				actor = createRole("����ʦ", "hero", 24, 19, 1, 0, pos(1, 0), nil, 500)
			elseif PlayerJob == "սʿ" then
				actor = createRole("����սʿ", "hero", 24, 19, 1, 0, pos(1, 0), nil, 500)
			else
				actor = createRole("�����ʿ", "hero", 24, 19, 1, 0, pos(1, 0), nil, 500)
			end

			actor:dirTo("player")
			actor:setNameColor(color(255, 255, 0))

			if skillIndex == 27 then
				actor.dir = DIR.right

				delay(0.5)

				������ = createRole("������", 17, 27, 19, 1, 0, nil, pos(actor.x + 1, actor.y), 5)
				������.dir = DIR.left

				delay(1)
				actor:magic(skillIndex, nil, pos(2, 0), DIR.right)
				������:playAct(ACTS.ACT_BACKSTEP, pos(2, 0), DIR.left)
				������:playAct(ACTS.ACT_STRUCK, pos(2, 0), DIR.left)
			else
				target = HELPER

				delay(0.5)
				actor:magic(skillIndex, "player")
			end

			delay(2)
		end
	end

	if testWalkTo or testAll then
		HELPER:walkTo(330, 260, "0", "�ߵ�����330,260����������3�������������10", 3, 10, "waitEvt", "arriveEvt", "failtEvt", false)

		EVT.waitEvt = function ()
			HELPER:say("���ڵȴ����")

			return 
		end
		EVT.failtEvt = function ()
			HELPER:say("Ŀ�겻�ɴ�")
			HELPER:followPlayer()

			return 
		end

		waitEvt("arriveEvt")
		HELPER.say(slot17, "��������")
		HELPER:followPlayer()
	end

	if testShowEquip or testAll then
		actor = createRole("װ������", "hero", nil, 19, 1, 0, pos(1, 0), nil, 5)

		actor:showEquip(3)
		HELPER:say("��ʾ��Ӧ����Ů��װ��")
		delay(3)

		actor = createRole("װ������2", "hero", nil, 19, 0, 1, pos(1, 0), nil, 5)

		actor:showEquip(3)
		HELPER:say("��ʾ��Ӧ��������װ��")
		delay(3)
	end

	if testNameColor or testAll then
		actor = createRole("������ɫ", "hero", nil, 19, 1, 0, pos(1, 1), nil)
		actor2 = createRole("������ɫ", "hero", nil, 19, 1, 0, pos(2, 2), nil)
		actor3 = createRole("������ɫ", "hero", nil, 19, 1, 0, pos(3, 3), nil)
		actor4 = createRole("������ɫ", "hero", nil, 19, 1, 0, pos(4, 4), nil)
		actor5 = createRole("������ɫ", "hero", nil, 19, 1, 0, pos(5, 5), nil)

		for k = 200, 255, 5 do
			actor:setNameColor(k)

			actor.name = k

			actor2:setNameColor(k + 1)

			actor2.name = k + 1

			actor3:setNameColor(k + 2)

			actor3.name = k + 2

			actor4:setNameColor(k + 3)

			actor4.name = k + 3

			actor5:setNameColor(k + 4)

			actor5.name = k + 4

			delay(3)
		end

		actor:removeSelf()
	end

	if testSkillDir or testAll then
		actor = createRole("���ܷ���", "hero", nil, 19, 1, 0, pos(1, 0), nil, 5)

		for k = 1, 5, 1 do
			actor:magic(30, nil, nil, DIR.up)
			delay(1)
			actor:magic(30, nil, nil, DIR.rightUp)
			delay(1)
			actor:magic(30, nil, nil, DIR.right)
			delay(1)
			actor:magic(30, nil, nil, DIR.rightBottom)
			delay(1)
			actor:magic(30, nil, nil, DIR.bottom)
			delay(1)
			actor:magic(30, nil, nil, DIR.leftBottom)
			delay(1)
			actor:magic(30, nil, nil, DIR.left)
			delay(1)
			actor:magic(30, nil, nil, DIR.leftUp)
			delay(1)
		end
	end

	if testStateSkill or testAll then
		actor = createRole("��״̬���ܲ���", "hero", nil, 19, 1, 0, pos(1, 0), nil)
		actor2 = createRole("ħ���ܻ���", "hero", nil, 19, 1, 0, pos(1, 5), nil)

		HELPER:say("��ǽ,�����Ŀ��/����")
		actor:magic(22, actor2)
		delay(5)
		HELPER:say("��ħ��,�����Ŀ��/����")
		actor:magic(16, actor2)
		delay(5)
		HELPER:say("ħ����")
		actor:magic(31)
		delay(5)
		HELPER:say("������")
		actor:magic(18)
		delay(5)
		HELPER:say("������")
		actor:magic(18, actor2)
		delay(5)
		actor:removeSelf()
		actor2:removeSelf()
	end

	if testAct or testAll then
		actor = createRole("action�ද������", "hero", nil, 19, 1, 0, pos(1, 0), nil)

		runActs({
			action.delay(0.5),
			action.callFunc(function ()
				print("ok~")

				return 
			end),
			actor.actWalkTo(slot19, off2p(5, 5).x, off2p(5, 5).y),
			action.callFunc(function ()
				print("ok~2")

				return 
			end)
		})
	end

	if testGuide or testAll then
		local testTwinkle = false
		local testTipText = false
		local testDragGuide = false
		local test = nil

		if testTwinkle then
			local flashHandler = GUIDE.twinkleNodeWidthName(slot21, "diy_����", {
				w = 36,
				circle = false,
				h = 72
			})

			delay(5)
			GUIDE:stop()
		end

		if testTipText then
			local tip1 = GUIDE:showTipText("diy_����", {
				"�������򿪲������",
				22,
				1,
				align = "left"
			}, pos(400, 0))
			local tip2 = GUIDE:showTipText("diy_����", {
				"�������򿪲������",
				22,
				1,
				align = "top"
			}, pos(400, 0))
			local tip3 = GUIDE:showTipText("diy_����", {
				"�������򿪲������",
				22,
				1,
				align = "right"
			}, pos(400, 0))
			local tip4 = GUIDE:showTipText("diy_����", {
				"�������򿪲������",
				22,
				1,
				align = "bottom"
			}, pos(400, 0))

			delay(5)
			GUIDE:stop()
		end

		if testDragGuide then
			local handler1 = GUIDE:dragGuide("diy_����", "diy_����")
			local handler1 = GUIDE:dragGuide("diy_����", "diy_����", {
				finger = {
					flipY = true
				}
			})
			local handler2 = GUIDE:dragGuide("diy_����", "diy_����", {
				finger = {
					flipX = true
				}
			})
			local handler3 = GUIDE:dragGuide("diy_����", "diy_����", {
				finger = {
					flipY = true,
					flipX = true
				}
			})

			delay(7)
			GUIDE:stop()

			local handler1 = GUIDE:dragGuide("diy_����", "diy_����")

			delay(3)
			GUIDE:stop()
		end
	end

	if testStage then
		enterStage(0, 333, 260)
		enterStage(3, 333, 333)
		delay(0.5)
		stage:moveTo(340, 340, true, 10)
		delay(10)
		exitStage()
	end

	if testDialogNode then
		createSayDL("left::::", nil, 32, 5):pos(100, 100)
		createSayDR("right::::", nil, 32, 5):pos(400, 100)
	end

	if testEffect then
		print(EFFIDS.ET_FIRE)
		showEffect(EFFIDS.ET_FIRE, off2p(1, 1), 10)
	end

	if testNewSkill then
		actor = createRole("����սʿ", "hero", 24, 19, 1, 0, pos(1, 0), nil, 50)

		delay(1)
		actor:playBigSkill()

		return 
	end

	if testNewSkill then
		actor = createRole("����սʿ", "hero", 24, 19, 1, 0, pos(1, 0), nil, 50)

		delay(1)
		actor:playBigSkill1()
	end

	if testSpaceMove or testAll then
		actor = createRole("����սʿ", "hero", 24, 19, 1, 0, pos(1, 0), nil, 50)

		actor:playAct(ACTS.SPACEMOVE_SHOW)
	end

	if testRole then
		for k = 0, 7, 1 do
			actor = createRole("����", 14, 150, 0, 0, 0, pos(k*2, 0), nil)
			actor.dir = k

			runActsForever({
				actor:actAttack(3),
				actor:actDelay(1)
			})
		end

		for k = 0, 7, 1 do
			actor = createRole("���� ����_" .. k, "hero", 24, 19, 1, 0, pos(k*2, 3), nil)
			actor.dir = k

			runActsForever({
				actor:actAttack(3),
				actor:actDelay(1)
			})
		end

		local host = createRole("ʩ�� ����", "hero", 24, 19, 1, 0, pos(5, 8), nil)

		for k = 0, 7, 1 do
			local cfg = DIR["_" .. k]
			actor = createRole("ʩ�� ����_" .. k, "hero", 24, 19, 1, 0, pos(cfg[1]*2 + 5, cfg[2]*2 + 8), nil)
			actor.dir = k

			runActsForever({
				actor:actMagic("30", host, pos(1, 0)),
				actor:actDelay(1)
			})
		end
	end

	if stress then
		math.randomseed(0)

		local ret = {}
		local dress = {}

		for k, v in pairs(ITEMS) do
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

		enterStage("3", 504, 146, {
			disableSkip = true
		})

		local _pos = pos

		local function pos(x, y)
			return _pos(x + 504, y + 146)
		end

		local pre = nil
		useDress = true
		skill = true

		STAGE.setMapScale(slot24, 0.7)

		for _ = 1, 3, 1 do
			for y = -15, 15, 1 do
				for x = 0, 40, 1 do
					local dre = nil

					if useDress then
						dre = dress[math.random(#dress)]
					end

					local d = createRole("" .. (dress[x] or y), "hero", dre, nil, 0, y%7, nil, pos(x - 20, y), nil)

					if skill and pre then
						local tpre = pre

						d.role.node:performWithDelay(function ()
							d.role.node:runForever(action.seq({
								action.callFunc(function ()
									local id = mid[math.random(#mid)]

									d:magic(id, tpre)

									return 
								end),
								d.actDelay(slot4, math.random()*10)
							}))

							return 
						end, math.random()*10)
					elseif move then
						d.role.node.runs(slot38, {
							action.rep(action.seq(d.actPlayAct(d, ACTS.WALK, pos(-1, -1)), d.actDelay(d, 2)), 50)
						})
					end

					pre = d

					table.insert(ret, d)
				end
			end
		end
	end

	return 
end

return 
