function main(skillIndex)
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
		"���ǻ���"
	}

	if not SHOW_GUIDE then
		return 
	end

	if skillIndex == 3 then
		if PlayerSex == 0 then
			actor = createRole("С��", "hero", 5, 55, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("С��", "hero", 6, 55, 1, 1, nil, off2p(-2, 1), 7)
		end

		�� = createRole("��", 11, 160, 0, 0, 0, nil, off2p(-1, 1), 7)

		actor:say("��ѧ���������ɣ�����������ܵõȼ����������������׼ȷ���ԡ�", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(3, ��, nil, DIR.right)
			delay(2)
		end
	elseif skillIndex == 7 then
		if PlayerSex == 0 then
			actor = createRole("Сսʿ", "hero", 10, 57, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("Сսʿ", "hero", 11, 57, 1, 1, nil, off2p(-2, 1), 7)
		end

		����սʿ = createRole("����սʿ", 14, 22, 0, 0, 0, nil, off2p(-1, 1), 7)

		actor:say("��ɱ����������߹������˺����ȼ�������������׼ȷ��", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(7, ����սʿ, nil, DIR.right)
			delay(1)

			����սʿ.dir = DIR.left

			����սʿ:playAct(ACTS.STRUCK)
			delay(1)
		end
	elseif skillIndex == 12 then
		if PlayerSex == 0 then
			actor = createRole("սʿ", "hero", 25, 35, 0, 0, nil, off2p(-2, 1), 8.3)
		else
			actor = createRole("սʿ", "hero", 22, 35, 1, 1, nil, off2p(-2, 1), 8.3)
		end

		��Ұ�� = createRole("��Ұ��", 19, 110, 0, 0, 0, nil, off2p(-1, 1), 4)
		��Ұ��.dir = DIR.left
		��Ұ��1 = createRole("��Ұ��", 19, 110, 0, 0, 0, nil, off2p(0, 1), 4)
		��Ұ��1.dir = DIR.left

		actor:say("25������ѧϰ��ɱ���������ܶԸ�λ�ĵ�������˺����������ѧ�������λ��", nil)
		delay(0.5)

		for i = 1, 6, 1 do
			if i < 4 then
				actor:magic(12, ��Ұ��, nil, DIR.right)
				delay(0.7)
				��Ұ��:playAct(ACTS.STRUCK)
				��Ұ��1:playAct(ACTS.STRUCK)
			elseif i == 4 then
				actor:say("����㻹�ᷢ�֣�ʹ�ø�λ��ɱ���Ը�ħ���ܺ�һЩ�ر�Ĺ��������Ч��", nil)

				actor1 = createRole("�з�ʦ", "hero", 243, 56, 0, 0, nil, pos(actor.x + 2, actor.y), 4)

				actor1:addState("stMagicShield")
				actor:magic(12, actor1, nil, DIR.right)
				delay(0.7)
				actor1:playAct(ACTS.STRUCK)
			else
				actor:magic(12, actor1, nil, DIR.right)
				delay(0.7)
				actor1:playAct(ACTS.STRUCK)
			end

			delay(0.5)
		end
	elseif skillIndex == 25 then
		if PlayerSex == 0 then
			actor = createRole("սʿ", "hero", 246, 36, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("սʿ", "hero", 247, 36, 1, 1, nil, off2p(-2, 1), 7)
		end

		��Ұ�� = createRole("��Ұ��", 19, 111, 0, 0, 0, nil, off2p(-1, 0), 7)
		��Ұ��1 = createRole("��Ұ��", 19, 111, 0, 0, 0, nil, off2p(-1, 1), 7)
		��Ұ��2 = createRole("��Ұ��", 19, 111, 0, 0, 0, nil, off2p(-1, 2), 7)
		��Ұ��3 = createRole("��Ұ��", 19, 111, 0, 0, 0, nil, off2p(-2, 2), 7)
		��Ұ��4 = createRole("��Ұ��", 19, 111, 0, 0, 0, nil, off2p(-3, 2), 7)
		��Ұ��.dir = DIR.left
		��Ұ��1.dir = DIR.left
		��Ұ��2.dir = DIR.leftUp
		��Ұ��3.dir = DIR.up
		��Ұ��4.dir = DIR.up

		actor:say("28���Ϳ���ѧϰ�����䵶��������ͬʱ��������������Χ�����е��ˡ�", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(25, ��Ұ��, nil, DIR.right)
			delay(0.7)
			��Ұ��:playAct(ACTS.STRUCK)
			��Ұ��1:playAct(ACTS.STRUCK)
			��Ұ��2:playAct(ACTS.STRUCK)
			��Ұ��3:playAct(ACTS.STRUCK)
			��Ұ��4:playAct(ACTS.STRUCK)
			delay(1)
		end
	elseif skillIndex == 27 then
		if PlayerSex == 0 then
			actor = createRole("սʿ", "hero", 246, 32, 0, 0, nil, off2p(-2, 1), 8)
		else
			actor = createRole("սʿ", "hero", 247, 32, 1, 1, nil, off2p(-2, 1), 8)
		end

		actor:say("30��������ϰҰ����ײ��ײ�����������ĵ��ˡ����ҪС�ı�ײ���ϰ����ϡ�", nil)

		actor.dir = DIR.right
		������ = createRole("������", 17, 27, 19, 1, 0, nil, pos(actor.x + 1, actor.y), 8)
		������.dir = DIR.left

		delay(1.5)
		actor:magic(skillIndex, nil, pos(3, 0), DIR.right)
		������:playAct(ACTS.ACT_BACKSTEP, pos(3, 0), DIR.left)
		������:playAct(ACTS.STRUCK)
		delay(1.5)
		actor:say("�����������������3������ᷢ�ָ��ྪϲ����Ȼǰ������Ҫ�ѵȼ�������38����", nil)

		������1 = createRole("������", 17, 27, 19, 1, 0, nil, pos(actor.x + 2, actor.y), 4.8)
		������1.dir = DIR.right
		������.dir = DIR.right
		actor.dir = DIR.bottom

		actor:playAct(ACT_WALK, pos(0, 1), DIR.bottom)
		delay(0.5)

		actor.dir = DIR.right

		actor:playAct(ACT_WALK, pos(3, 0), DIR.right)
		delay(0.5)

		actor.dir = DIR.up

		actor:playAct(ACT_WALK, pos(0, -1), DIR.up)
		delay(0.5)

		actor.dir = DIR.left

		delay(2)
		actor:magic(skillIndex, nil, pos(-3, 0), DIR.left)
		������:playAct(ACTS.ACT_BACKSTEP, pos(-3, 0), DIR.right)
		������:playAct(ACTS.STRUCK)
		������1:playAct(ACTS.ACT_BACKSTEP, pos(-3, 0), DIR.right)
		������1:playAct(ACTS.STRUCK)
	elseif skillIndex == 26 then
		if PlayerSex == 0 then
			actor = createRole("����ʥս", "hero", 328, 325, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("����ʥս", "hero", 331, 325, 1, 1, nil, off2p(-2, 1), 7)
		end

		��Ұ�� = createRole("��Ұ��", 19, 112, 0, 0, 0, nil, off2p(-1, 1), 7)

		actor:say("�ﵽ35�����Ѿ�����ѧϰ�һ𽣷��ˡ�����սʿ��Ҫ���˺����ܣ���7�����ȴʱ�䡣", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(26, ��Ұ��, nil, DIR.right)

			��Ұ��.dir = DIR.left

			delay(1)
			��Ұ��:playAct(ACTS.STRUCK)
			delay(1)
		end
	elseif skillIndex == 43 then
		if PlayerSex == 0 then
			actor = createRole("����ʥս", "hero", 352, 208, 0, 0, nil, off2p(-3, 2), 7)
		else
			actor = createRole("����ʥս", "hero", 353, 208, 1, 1, nil, off2p(-3, 2), 7)
		end

		��Ұ�� = createRole("��Ұ��", 19, 110, 0, 0, 0, nil, pos(actor.x + 1, actor.y), 3)
		��Ұ��1 = createRole("��Ұ��", 19, 110, 0, 0, 0, nil, pos(actor.x - 1, actor.y), 3)
		��Ұ��2 = createRole("��Ұ��", 19, 110, 0, 0, 0, nil, pos(actor.x, actor.y + 1), 3)
		��Ұ��3 = createRole("��Ұ��", 19, 110, 0, 0, 0, nil, pos(actor.x, actor.y - 1), 3)
		��Ұ��.dir = DIR.left
		��Ұ��1.dir = DIR.right
		��Ұ��2.dir = DIR.up

		actor:say("�����ѧϰʨ�Ӻ��ˣ�ʹ�������ù�����ʱ��ԡ�", nil)
		delay(1)
		actor:magic(43, ��Ұ��, nil, DIR.left)
		delay(1)
		��Ұ��:addState("stPoisonStone")
		��Ұ��1:addState("stPoisonStone")
		��Ұ��2:addState("stPoisonStone")
		��Ұ��3:addState("stPoisonStone")
		delay(1)

		����ս�� = createRole("����ս��", 19, 33, 0, 0, 0, nil, pos(actor.x + 2, actor.y + 2), 4)
		����ս��1 = createRole("����ս��", 19, 33, 0, 0, 0, nil, pos(actor.x + 2, actor.y), 4)
		����ս��2 = createRole("����ս��", 19, 33, 0, 0, 0, nil, pos(actor.x + 2, actor.y - 2), 4)
		����ս��3 = createRole("����ս��", 19, 33, 0, 0, 0, nil, pos(actor.x, actor.y + 2), 4)
		����ս��4 = createRole("����ս��", 19, 33, 0, 0, 0, nil, pos(actor.x, actor.y - 2), 4)
		����ս��5 = createRole("����ս��", 19, 33, 0, 0, 0, nil, pos(actor.x - 2, actor.y + 2), 4)
		����ս��6 = createRole("����ս��", 19, 33, 0, 0, 0, nil, pos(actor.x - 2, actor.y), 4)
		����ս��7 = createRole("����ս��", 19, 33, 0, 0, 0, nil, pos(actor.x - 2, actor.y - 2), 4)
		����ս��.dir = DIR.leftUp
		����ս��1.dir = DIR.left
		����ս��2.dir = DIR.leftBottom
		����ս��3.dir = DIR.up
		����ս��5.dir = DIR.rightUp
		����ս��6.dir = DIR.right
		����ս��7.dir = DIR.rightBottom

		actor:say("������ȼ������������ܹ���Ը����ǿ�Ĺ��", nil)
		delay(1)
		actor:magic(43, ����ս��, nil, DIR.left)
		delay(1)
		����ս��:addState("stPoisonStone")
		����ս��1:addState("stPoisonStone")
		����ս��2:addState("stPoisonStone")
		����ս��3:addState("stPoisonStone")
		����ս��4:addState("stPoisonStone")
		����ս��5:addState("stPoisonStone")
		����ս��6:addState("stPoisonStone")
		����ս��7:addState("stPoisonStone")
	elseif skillIndex == 58 then
		if PlayerSex == 0 then
			actor = createRole("����ʥս", "hero", 350, 347, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("����ʥս", "hero", 351, 347, 1, 1, nil, off2p(-2, 1), 7)
		end

		ţħ���� = createRole("ţħ����", 19, 204, 0, 0, 0, nil, pos(actor.x + 1, actor.y), 7)
		ţħ����1 = createRole("ţħ����", 19, 204, 0, 0, 0, nil, pos(actor.x + 2, actor.y), 7)
		ţħ����2 = createRole("ţħ����", 19, 204, 0, 0, 0, nil, pos(actor.x + 3, actor.y), 7)
		ţħ����3 = createRole("ţħ����", 19, 204, 0, 0, 0, nil, pos(actor.x + 4, actor.y), 7)
		ţħ����.dir = DIR.left
		ţħ����1.dir = DIR.left
		ţħ����2.dir = DIR.left
		ţħ����3.dir = DIR.left

		actor:say("47������ѧϰսʿ�߼��������ս��������ܹ���ֱ����4��ĵ��ˣ���10�����ȴʱ�䡣", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(58, ţħ����, nil, DIR.right)
			delay(0.5)
			ţħ����:playAct(ACTS.STRUCK)
			ţħ����1:playAct(ACTS.STRUCK)
			ţħ����2:playAct(ACTS.STRUCK)
			ţħ����3:playAct(ACTS.STRUCK)
			delay(1.5)
		end
	elseif skillIndex == 1 then
		if PlayerSex == 0 then
			actor = createRole("С��", "hero", 5, 55, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("С��", "hero", 6, 55, 1, 1, nil, off2p(-2, 1), 7)
		end

		�� = createRole("��", 11, 160, 0, 0, 0, nil, off2p(2, 1), 7)

		actor:say("�������Ƿ�ʦ�Ļ����������ܶ�Զ���ĵ�����ɵ����˺���", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(1, ��, nil, DIR.left)
			delay(1)
			��:playAct(ACTS.STRUCK)
			delay(1)
		end
	elseif skillIndex == 8 then
		if PlayerSex == 0 then
			actor = createRole("С��", "hero", 5, 55, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("С��", "hero", 6, 55, 1, 1, nil, off2p(-2, 1), 7)
		end

		actor:say("12������ѧϰ���ܻ𻷣������ƿ����ܵĵ��ˣ�ǰ�������Ǽ������͡�", nil)
		delay(0.5)

		for i = 1, 2, 1 do
			����è = createRole("����è", 17, 26, 0, 0, 0, nil, pos(actor.x + 1, actor.y), 3)
			����è1 = createRole("����è", 17, 26, 0, 0, 0, nil, pos(actor.x - 1, actor.y), 3)

			delay(1)
			actor:magic(8, ����è, nil, DIR.left)
			����è:playAct(ACTS.ACT_BACKSTEP, pos(2, 0), DIR.left)
			����è1:playAct(ACTS.ACT_BACKSTEP, pos(-2, 0), DIR.right)
			delay(2)
		end
	elseif skillIndex == 20 then
		if PlayerSex == 0 then
			actor = createRole("С��ʦ", "hero", 10, 34, 0, 0, nil, off2p(-2, 1), 9)
		else
			actor = createRole("С��ʦ", "hero", 11, 34, 1, 1, nil, off2p(-2, 1), 9)
		end

		������ = createRole("������", 19, 100, 0, 0, 0, nil, off2p(2, 1), 9)
		������.dir = DIR.left

		delay(1)

		x, y, mapid = getPlayerLocation()

		actor:say("13������ѧϰ�ջ�֮�⡣���ܸ��Ź���ʹ�����޷��������������ջ����ǳ�Ϊ��ı�����", nil)
		actor:magic(20, ������, nil, DIR.left)
		delay(1)
		������:playAct(ACT_WALK, pos(-1, 0), DIR.left)
		delay(1)
		actor:magic(20, ������, nil, DIR.left)
		delay(1)
		������:setNameColor(color(175, 105, 47))
		delay(1)
		actor:magic(20, ������, nil, DIR.left)
		delay(1)
		������.role.info:setName("������(" .. actor.name .. ")")
		delay(1)
		actor:say("����ȥ�ջ�һ�����������԰ɣ�������ȼ����������㽫�ܹ��ջ����ǿ���Ĺ��", nil)
	elseif skillIndex == 9 then
		if PlayerSex == 0 then
			actor = createRole("С��ʦ", "hero", 10, 34, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("С��ʦ", "hero", 11, 34, 1, 1, nil, off2p(-2, 1), 7)
		end

		ɭ��ѩ�� = createRole("ɭ��ѩ��", 10, 1, 0, 0, 0, nil, pos(actor.x + 5, actor.y), 7)
		ɭ��ѩ��1 = createRole("ɭ��ѩ��", 10, 1, 0, 0, 0, nil, pos(actor.x + 2, actor.y), 7)
		ɭ��ѩ��2 = createRole("ɭ��ѩ��", 10, 1, 0, 0, 0, nil, pos(actor.x + 3, actor.y), 7)
		ɭ��ѩ��3 = createRole("ɭ��ѩ��", 10, 1, 0, 0, 0, nil, pos(actor.x + 4, actor.y), 7)
		ɭ��ѩ��.dir = DIR.left
		ɭ��ѩ��1.dir = DIR.left
		ɭ��ѩ��2.dir = DIR.left
		ɭ��ѩ��3.dir = DIR.left

		actor:say("16������ѧϰ���������Ƿ�ʦ��һ��Ⱥ�����ܣ����Զ�ǰ��5��ĵ�������˺���", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(9, ɭ��ѩ��, nil, DIR.right)
			delay(1)
			ɭ��ѩ��:playAct(ACTS.STRUCK)
			ɭ��ѩ��1:playAct(ACTS.STRUCK)
			ɭ��ѩ��2:playAct(ACTS.STRUCK)
			ɭ��ѩ��3:playAct(ACTS.STRUCK)
			delay(0.5)
		end
	elseif skillIndex == 11 then
		if PlayerSex == 0 then
			actor = createRole("С��ʦ", "hero", 10, 34, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("С��ʦ", "hero", 11, 34, 1, 1, nil, off2p(-2, 1), 7)
		end

		����սʿ = createRole("����սʿ", 19, 30, 0, 0, 0, nil, off2p(2, 1), 7)

		actor:say("17������ѧϰ��ʦ�ĺ��ļ����׵������������ǿ��ĵ����˺���", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(11, ����սʿ, nil, DIR.left)
			delay(1)
			����սʿ:playAct(ACTS.STRUCK)
			delay(1)
		end

		actor:say("��������ǲ���ϵ����Ķ��Σ��㲻���������úͽ�ʬ��ɧ���ˡ�", nil)
	elseif skillIndex == 21 then
		if PlayerSex == 0 then
			actor = createRole("��ʦ", "hero", 26, 82, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ʦ", "hero", 23, 82, 1, 1, nil, off2p(-2, 1), 7)
		end

		actor:say("19������ѧϰ˲Ϣ�ƶ���ʹ�ü��ܻ�����ɵ��ϴ�·�����������ڵĵ�ͼ��", nil)
		delay(0.5)
		actor:magic(21, nil, nil, DIR.left)
		delay(0.5)
		actor:playAct(ACTS.SPACEMOVE_SHOW, pos(3, 3), DIR.bottom)
		delay(1.5)
		actor:magic(21, nil, nil, DIR.left)
		delay(0.5)
		actor:playAct(ACTS.SPACEMOVE_SHOW, pos(-1, -3), DIR.bottom)
		delay(1.5)
		actor:magic(21, nil, nil, DIR.left)
		delay(0.5)
		actor:playAct(ACTS.SPACEMOVE_SHOW, pos(-2, -2), DIR.bottom)
		delay(1.5)
		actor:say("�ú�ʹ�ã����԰���ʡ�ºܶ�������Ѿ�", nil)
	elseif skillIndex == 5 then
		if PlayerSex == 0 then
			actor = createRole("��ʦ", "hero", 26, 82, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ʦ", "hero", 23, 82, 1, 1, nil, off2p(-2, 1), 7)
		end

		����սʿ = createRole("����սʿ", 19, 151, 0, 0, 0, nil, off2p(2, 1), 7)

		actor:say("19��������ѧϰ�������ɱ�С�����������ˡ�", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(5, ����սʿ, nil, DIR.left)
			delay(1)
			����սʿ:playAct(ACTS.STRUCK)
			delay(1)
		end
	elseif skillIndex == 23 then
		if PlayerSex == 0 then
			actor = createRole("��ʦ", "hero", 243, 56, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ʦ", "hero", 242, 56, 1, 1, nil, off2p(-2, 1), 7)
		end

		����ս�� = {
			createRole("����ս��", 19, 33, 0, 0, 0, nil, off2p(2, 1), 7),
			createRole("����ս��", 19, 33, 0, 0, 0, nil, off2p(3, 1), 7),
			createRole("����ս��", 19, 33, 0, 0, 0, nil, off2p(1, 1), 7),
			createRole("����ս��", 19, 33, 0, 0, 0, nil, off2p(2, 0), 7),
			createRole("����ս��", 19, 33, 0, 0, 0, nil, off2p(2, 2), 7),
			createRole("����ս��", 19, 33, 0, 0, 0, nil, off2p(3, 2), 7),
			createRole("����ս��", 19, 33, 0, 0, 0, nil, off2p(1, 0), 7),
			createRole("����ս��", 19, 33, 0, 0, 0, nil, off2p(3, 0), 7),
			createRole("����ս��", 19, 33, 0, 0, 0, nil, off2p(1, 2), 7)
		}

		actor:say("22������ѧϰ���ѻ��棬���ܶ�3X3�ķ�Χ����˺���", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(23, ����ս��[1], nil, DIR.left)
			delay(0.5)

			for i = 1, 9, 1 do
				����ս��[i]:playAct(ACTS.STRUCK)
			end

			delay(1.5)
		end
	elseif skillIndex == 22 then
		if PlayerSex == 0 then
			actor = createRole("��ʦ", "hero", 243, 166, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ʦ", "hero", 242, 166, 1, 1, nil, off2p(-2, 1), 7)
		end

		��ɫ���� = {
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(2, 1), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(1, 1), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(3, 1), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(2, 2), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(2, 5), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(2, 4), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(2, 6), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(3, 5), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(-3, -3), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(-3, -4), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(-3, -2), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(-2, -3), 7)
		}

		actor:say("24�������ѧϰ��ǽ�ˣ��ͷ�֮������ȼ�գ���ǽ�еĵ��˻��ܵ������˺���", nil)
		delay(0.5)
		actor:magic(22, ��ɫ����[1], nil, DIR.left)
		delay(1)

		for i = 1, 4, 1 do
			��ɫ����[i]:playAct(ACTS.STRUCK)
		end

		delay(1)
		actor:magic(22, ��ɫ����[5], nil, DIR.left)
		delay(1)

		for i = 1, 8, 1 do
			��ɫ����[i]:playAct(ACTS.STRUCK)
		end

		delay(1)
		actor:magic(22, ��ɫ����[9], nil, DIR.left)
		delay(1)

		for i = 1, 12, 1 do
			��ɫ����[i]:playAct(ACTS.STRUCK)
		end

		delay(1)
		actor:say("������ħ�����ͼ��ܵȼ�����������ʩ�ŵĻ�ǽ��Խ��Խ���ȡ�", nil)
	elseif skillIndex == 10 then
		if PlayerSex == 0 then
			actor = createRole("��ʦ", "hero", 243, 166, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ʦ", "hero", 242, 166, 1, 1, nil, off2p(-2, 1), 7)
		end

		��Ұ�� = {
			createRole("��Ұ��", 19, 111, 0, 0, 0, nil, off2p(2, 1), 7),
			createRole("��Ұ��", 19, 111, 0, 0, 0, nil, off2p(3, 1), 7),
			createRole("��Ұ��", 19, 111, 0, 0, 0, nil, off2p(4, 1), 7),
			createRole("��Ұ��", 19, 111, 0, 0, 0, nil, off2p(5, 1), 7),
			createRole("��Ұ��", 19, 111, 0, 0, 0, nil, off2p(6, 1), 7)
		}

		actor:say("26������ѧϰ�����Ӱ���ܹ��Զ�ֱ���ϵĵ�������˺���", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(10, ��Ұ��[1], nil, DIR.left)
			delay(1)

			for i = 1, 5, 1 do
				��Ұ��[i]:playAct(ACTS.STRUCK)
			end

			delay(1)
		end
	elseif skillIndex == 24 then
		if PlayerSex == 0 then
			actor = createRole("��ʦ", "hero", 243, 221, 0, 0, nil, off2p(2, 2), 7)
		else
			actor = createRole("��ʦ", "hero", 242, 221, 1, 1, nil, off2p(2, 2), 7)
		end

		��ʬ = {
			createRole("��ʬ", 41, 50, 0, 0, 0, nil, off2p(2, 1), 7),
			createRole("��ʬ", 41, 50, 0, 0, 0, nil, off2p(1, 3), 7),
			createRole("��ʬ", 41, 50, 0, 0, 0, nil, off2p(2, 3), 7),
			createRole("��ʬ", 41, 50, 0, 0, 0, nil, off2p(1, 2), 7),
			createRole("��ʬ", 41, 50, 0, 0, 0, nil, off2p(3, 1), 7),
			createRole("��ʬ", 41, 50, 0, 0, 0, nil, off2p(3, 2), 7),
			createRole("��ʬ", 41, 50, 0, 0, 0, nil, off2p(1, 1), 7),
			createRole("��ʬ", 41, 50, 0, 0, 0, nil, off2p(3, 3), 7)
		}

		actor:say("30������ѧϰ�����׹⣬��������ܹ������ܶ������ϵ��������˺���", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(24, ��ʬ[1], nil, DIR.left)

			for i = 1, 8, 1 do
				��ʬ[i]:dirTo(actor)
				��ʬ[i]:playAct(ACTS.STRUCK)
			end

			delay(2)
		end

		actor:say("�����������һ��ʹ��������ܣ��ù����Ǻ��޻���֮���ɡ�", nil)
	elseif skillIndex == 31 then
		if PlayerSex == 0 then
			actor = createRole("��ʦ", "hero", 243, 221, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ʦ", "hero", 242, 221, 1, 1, nil, off2p(-2, 1), 7)
		end

		actor:say("31���ܹ�ѧϰħ���ܣ����Ƿ�ʦ����Ҫ�ķ������ܡ�", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(31, nil, nil, DIR.left)
			delay(0.5)
			actor:addState("stMagicShield")
			delay(1.5)
		end

		actor:say("�������ڡ����á��п����Զ�ħ���ܡ�", nil)
	elseif skillIndex == 32 then
		if PlayerSex == 0 then
			actor = createRole("��ʦ", "hero", 243, 221, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ʦ", "hero", 242, 221, 1, 1, nil, off2p(-2, 1), 7)
		end

		��Ұ�� = {
			createRole("��Ұ��", 19, 111, 0, 0, 0, nil, off2p(2, 1), 7),
			createRole("��Ұ��", 19, 111, 0, 0, 0, nil, off2p(1, 2), 7),
			createRole("��Ұ��", 19, 111, 0, 0, 0, nil, off2p(2, 0), 7)
		}

		actor:say("32������ѧϰʥ��������һ�������ܹ���ɱ����ϵ���", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(32, ��Ұ��[i], nil, DIR.left)
			delay(1)
			��Ұ��[i]:playAct(ACTS.NOWDEATH)
			delay(1)
		end
	elseif skillIndex == 33 then
		if PlayerSex == 0 then
			actor = createRole("Ʈ�ݷ���", "hero", 329, 324, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("Ʈ�ݷ���", "hero", 332, 324, 1, 1, nil, off2p(-2, 1), 7)
		end

		��ɫ���� = {
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(2, 2), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(2, 1), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(1, 3), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(2, 3), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(1, 2), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(3, 1), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(3, 2), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(1, 1), 7),
			createRole("��ɫ����", 19, 74, 0, 0, 0, nil, off2p(3, 3), 7)
		}

		actor:say("�ﵽ35�����Ѿ�����ѧϰ�������ˣ����ܶ�3X3��Χ�ĵ�����ɼ�����˺���", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(33, ��ɫ����[1], nil, DIR.left)
			delay(1)

			for i = 1, 9, 1 do
				��ɫ����[i]:playAct(ACTS.STRUCK)
			end

			delay(1)
		end
	elseif skillIndex == 39 then
		if PlayerSex == 0 then
			actor = createRole("Ʈ�ݷ���", "hero", 402, 210, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("Ʈ�ݷ���", "hero", 403, 210, 1, 1, nil, off2p(-2, 1), 7)
		end

		��Ұ�� = createRole("��Ұ��", 19, 110, 0, 0, 0, nil, off2p(1, 1), 7)

		actor:say("�����ѧϰ�������ˣ��������ܹ�����˺������м����ƶ����������ĵ��ˡ�", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(39, ��Ұ��, nil, DIR.left)
			delay(1)
			��Ұ��:playAct(ACTS.ACT_BACKSTEP, pos(1, 0), DIR.left)
			delay(1)
		end
	elseif skillIndex == 35 then
		if PlayerSex == 0 then
			actor = createRole("Ʈ�ݷ���", "hero", 402, 210, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("Ʈ�ݷ���", "hero", 403, 210, 1, 1, nil, off2p(-2, 1), 7)
		end

		��Ұ�� = createRole("��Ұ��", 19, 112, 0, 0, 0, nil, off2p(2, 1), 7)

		actor:say("�����ѧϰ������ˣ��������ܹ�����˺������ܹ����յ��˵�ħ��ֵ��", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(35, ��Ұ��, nil, DIR.left)
			delay(0.5)
			��Ұ��:playAct(ACTS.STRUCK)
			delay(1)
		end
	elseif skillIndex == 59 then
		if PlayerSex == 0 then
			actor = createRole("Ʈ�ݷ���", "hero", 350, 348, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("Ʈ�ݷ���", "hero", 351, 348, 1, 1, nil, off2p(-2, 1), 7)
		end

		�������� = {
			createRole("��������", 20, 31, 0, 0, 0, nil, off2p(2, 2), 7),
			createRole("��������", 20, 31, 0, 0, 0, nil, off2p(2, 1), 7),
			createRole("��������", 20, 31, 0, 0, 0, nil, off2p(1, 3), 7),
			createRole("��������", 20, 31, 0, 0, 0, nil, off2p(2, 3), 7),
			createRole("��������", 20, 31, 0, 0, 0, nil, off2p(1, 2), 7),
			createRole("��������", 20, 31, 0, 0, 0, nil, off2p(3, 1), 7),
			createRole("��������", 20, 31, 0, 0, 0, nil, off2p(3, 2), 7),
			createRole("��������", 20, 31, 0, 0, 0, nil, off2p(1, 1), 7),
			createRole("��������", 20, 31, 0, 0, 0, nil, off2p(3, 3), 7)
		}

		actor:say("47������ѧϰ��ʦ�߼��������ǻ��ꡣ���˺���3X3�ķ�Χ��Ⱥ�弼�ܵĲ���֮ѡ��", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(59, ��������[1], nil, DIR.left)
			delay(1)

			for i = 1, 9, 1 do
				��������[i]:playAct(ACTS.STRUCK)
			end

			delay(1)
		end
	elseif skillIndex == 2 then
		if PlayerSex == 0 then
			actor = createRole("С��", "hero", 5, 55, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("С��", "hero", 6, 55, 1, 1, nil, off2p(-2, 1), 7)
		end

		actor:say("��ѧϰ�������ɣ�������Ϳ��Ը��Լ��Ͷ��ѻظ�Ѫ���ˡ�", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(2, "player", nil, DIR.left)
			delay(2)
		end
	elseif skillIndex == 4 then
		if PlayerSex == 0 then
			actor = createRole("С��", "hero", 5, 55, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("С��", "hero", 6, 55, 1, 1, nil, off2p(-2, 1), 7)
		end

		actor:say("������ս���Ǳ������ܣ����ܹ����������׼ȷ��", nil)
	elseif skillIndex == 6 then
		if PlayerSex == 0 then
			actor = createRole("С��ʿ", "hero", 10, 68, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("С��ʿ", "hero", 11, 68, 1, 1, nil, off2p(-2, 1), 7)
		end

		���� = createRole("����", 14, 20, 0, 0, 0, nil, off2p(2, 1), 7)

		actor:say("14������ѧϰʩ����������ʹ�ü���ʱ��������춾�����̶���", nil)
		delay(0.5)

		for i = 1, 2, 1 do
			actor:magic(6, ����, nil, DIR.left)
			delay(1)

			if i == 1 then
				����:addState("stPoisonGreen")
			else
				����:addState("stPoisonRed")
			end

			delay(2)
		end

		actor:say("�춾���Լӳ��˺�Ч�����̶��������������ظ���", nil)
	elseif skillIndex == 13 then
		if PlayerSex == 0 then
			actor = createRole("С��ʿ", "hero", 10, 68, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("С��ʿ", "hero", 11, 68, 1, 1, nil, off2p(-2, 1), 7)
		end

		��ʬ = createRole("��ʬ", 41, 50, 0, 0, 0, nil, off2p(2, 1), 7)

		actor:say("18����Ϳ���ѧϰ������ˣ����������Զ�̹������ˣ�����������������", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(13, ��ʬ, nil, DIR.left)
			delay(1)
			��ʬ:playAct(ACTS.STRUCK)
			delay(1)
		end
	elseif skillIndex == 17 then
		if PlayerSex == 0 then
			actor = createRole("С��ʿ", "hero", 10, 68, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("С��ʿ", "hero", 11, 68, 1, 1, nil, off2p(-2, 1), 7)
		end

		actor:say("19������ѧϰ�ٻ����ã����ܵȼ�Խ�ߣ����ñ����ĵȼ�Ҳ��Խ�ߡ�", nil)
		delay(0.5)
		actor:magic(17, nil, nil, DIR.left)
		delay(0.5)

		�������� = createRole("��������", 23, 37, 0, 0, 0, nil, pos(actor.x + 1, actor.y), 6)

		delay(3)
		actor:say("��Ҫ���������ٻ������ȣ�����ȥ�������Ƕ���ϰ���ܡ�", nil)
	elseif skillIndex == 18 then
		if PlayerSex == 0 then
			actor = createRole("��ʿ", "hero", 27, 83, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ʿ", "hero", 24, 83, 1, 1, nil, off2p(-2, 1), 7)
		end

		actor:say("20������ѧϰ��������ʹ�ü����ܹ�ʹ�󲿷ֹ��ﶼ�޷������㡣", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(18, nil, nil, DIR.left)
			delay(0.5)
			actor:addState("stHidden")
			delay(1.5)
		end
	elseif skillIndex == 19 then
		if PlayerSex == 0 then
			actor = createRole("��ʿ", "hero", 27, 83, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ʿ", "hero", 24, 83, 1, 1, nil, off2p(-2, 1), 7)
		end

		actor_1 = createRole("��ʦ", "hero", 243, 56, 0, 0, nil, off2p(2, 1), 7)
		actor_2 = createRole("��ʦ", "hero", 242, 56, 1, 1, nil, off2p(3, 1), 7)
		actor_3 = createRole("սʿ", "hero", 25, 35, 0, 0, nil, off2p(2, 2), 7)
		actor_4 = createRole("սʿ", "hero", 22, 35, 1, 1, nil, off2p(1, 1), 7)

		actor:say("21������ѧϰ������������������Ҳ���԰�������ʵ������Ч���ˡ�", nil)
		delay(1)

		for i = 1, 3, 1 do
			actor:magic(19, actor_1, nil, DIR.left)
			delay(1)
			actor_1:addState("stHidden")
			actor_2:addState("stHidden")
			actor_3:addState("stHidden")
			actor_4:addState("stHidden")
			delay(1)
		end
	elseif skillIndex == 14 then
		if PlayerSex == 0 then
			actor = createRole("��ʿ", "hero", 245, 33, 0, 0, nil, off2p(-2, 0), 7)
		else
			actor = createRole("��ʿ", "hero", 244, 33, 1, 1, nil, off2p(-2, 0), 7)
		end

		actor:say("22������ѧϰ����ܣ��ܹ�������Χ�ڶ������ħ����", nil)

		actor.dir = DIR.right

		delay(0.5)

		for i = 1, 3, 1 do
			x, y = getPlayerLocation()

			actor:magic(14, "player", nil, DIR.right)
			delay(2)
		end
	elseif skillIndex == 15 then
		if PlayerSex == 0 then
			actor = createRole("��ʿ", "hero", 245, 33, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ʿ", "hero", 244, 33, 1, 1, nil, off2p(-2, 1), 7)
		end

		actor:say("25������ѧϰ��ʥս�������ܹ�������Χ�ڶ�����߷�����", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(15, "player", nil, DIR.right)
			delay(2)
		end
	elseif skillIndex == 28 then
		if PlayerSex == 0 then
			actor = createRole("��ʿ", "hero", 245, 165, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ʿ", "hero", 244, 165, 1, 1, nil, off2p(-2, 1), 7)
		end

		�������� = createRole("��������", 23, 37, 0, 0, 0, nil, off2p(2, 1), 7)

		actor:say("26������ѧϰ������ʾ�����������������һ��ʱ���ڲ鿴Ŀ�������ֵ��", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(28, ��������, nil, DIR.left)
			delay(2)
		end
	elseif skillIndex == 16 then
		if PlayerSex == 0 then
			actor = createRole("��ʿ", "hero", 245, 209, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ʿ", "hero", 244, 209, 1, 1, nil, off2p(-2, 1), 7)
		end

		��Ӭ = createRole("��Ӭ", 43, 41, 0, 0, 0, nil, off2p(2, 1), 7)

		actor:say("28������ѧϰ��ħ�䣬����ס��Χ�ڵĹ�������󻹿��ԶԸ�����ǿ���Ĺ��", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(16, ��Ӭ, nil, DIR.left)
			delay(2)
		end
	elseif skillIndex == 29 then
		if PlayerSex == 0 then
			actor = createRole("��ʿ", "hero", 245, 209, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ʿ", "hero", 244, 209, 1, 1, nil, off2p(-2, 1), 7)
		end

		actor_1 = createRole("��ʦ", "hero", 243, 56, 0, 0, nil, off2p(2, 1), 7)
		actor_2 = createRole("��ʦ", "hero", 242, 56, 1, 1, nil, off2p(3, 1), 7)
		actor_3 = createRole("սʿ", "hero", 25, 35, 0, 0, nil, off2p(2, 2), 7)
		actor_4 = createRole("սʿ", "hero", 22, 35, 1, 1, nil, off2p(1, 1), 7)

		actor:say("33������ѧϰȺ�����������ɻָ�ʩ�ŷ�Χ��������ҵ�����ֵ��", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(29, actor_1, nil, DIR.left)
			delay(2)
		end
	elseif skillIndex == 30 then
		if PlayerSex == 0 then
			actor = createRole("��ң����", "hero", 330, 326, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ң����", "hero", 333, 326, 1, 1, nil, off2p(-2, 1), 7)
		end

		delay(0.5)
		actor:say("�ﵽ35�����Ѿ�����ѧϰ�ٻ������ˣ�������ޱ����ǳ�ǿ��", nil)
		actor:magic(30, nil, nil, DIR.left)
		delay(0.5)

		���� = createRole("����", 54, 170, 0, 0, 0, nil, pos(actor.x + 1, actor.y), 2)

		delay(2)

		���� = createRole("����", 55, 171, 0, 0, 0, nil, pos(actor.x + 1, actor.y), 4)

		����:playAct(ACTS.DIGUP)
		delay(1)
	elseif skillIndex == 37 then
		if PlayerSex == 0 then
			actor = createRole("��ң����", "hero", 404, 326, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ң����", "hero", 405, 326, 1, 1, nil, off2p(-2, 1), 7)
		end

		actor:say("�����ѧϰ�������ˣ�ֻҪ�ǵȼ�������ߵĵ��ˣ�������ƿ���", nil)
		delay(0.5)

		for i = 1, 2, 1 do
			���� = createRole("����", 54, 170, 0, 0, 0, nil, pos(actor.x + 1, actor.y), 3)
			����1 = createRole("����", 54, 170, 0, 0, 0, nil, pos(actor.x - 1, actor.y), 3)

			delay(1)
			actor:magic(37, nil, nil, DIR.left)
			����:playAct(ACTS.ACT_BACKSTEP, pos(2, 0), DIR.left)
			����1:playAct(ACTS.ACT_BACKSTEP, pos(-2, 0), DIR.right)
			delay(2)
		end
	elseif skillIndex == 36 then
		if PlayerSex == 0 then
			actor = createRole("��ң����", "hero", 404, 326, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ң����", "hero", 405, 326, 1, 1, nil, off2p(-2, 1), 7)
		end

		actor:say("�����ѧϰ�޼������ˣ��ܹ��ڴ����������ĵ�����", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(36, nil, nil, DIR.left)
			delay(2)
		end
	elseif skillIndex == 48 then
		if PlayerSex == 0 then
			actor = createRole("��ң����", "hero", 350, 349, 0, 0, nil, off2p(-2, 1), 7)
		else
			actor = createRole("��ң����", "hero", 351, 349, 1, 1, nil, off2p(-2, 1), 7)
		end

		������ʿ = createRole("������ʿ", 19, 151, 0, 0, 0, nil, off2p(2, 1), 7)

		actor:say("47������ѧϰ��ʿ�߼�������Ѫ�顣�������ӵ��ζԵ�������˺���", nil)
		delay(0.5)

		for i = 1, 3, 1 do
			actor:magic(48, ������ʿ, nil, DIR.left)
			delay(1)
			������ʿ:playAct(ACTS.STRUCK)
			delay(1)
		end
	end

	return 
end

return 
