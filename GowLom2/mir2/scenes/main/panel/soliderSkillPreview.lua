local soliderSkillPreview = class("soliderSkillPreview", import(".panelBase"))
local tip = import(".wingInfo")
local widgetDef = g_data.widgetDef
local iconFunc = import("..console.iconFunc")
local skillDesc = {
	[0] = {
		[3] = {
			icon = "66",
			desc2 = "�ͷ��һ𽣷�ʱ���ʴ�������Ŀ��Ϊ���ģ�ʹ3*3��Χ�ڵ�Ŀ���ܵ�1.2���һ𽣷����˺���",
			desc1 = "���������һ��ʮ�ǣ�ʹ���һ𽣷�ʱ���м��ʴ���ŭ֮�һ�",
			skillName = "ŭ֮�һ�",
			needSkill = "�һ𽣷�",
			needLevel = 10
		}
	},
	{
		[3] = {
			icon = "67",
			desc2 = "�ͷ����ǻ���ʱ���ʴ����������ٻ����λ���׹�䣬�˺�ֵΪ���ǻ����1.8����",
			desc1 = "���������һ��ʮ�ǣ��ͷ����ǻ���ʱ���м��ʴ���ŭ֮���ꡣ",
			skillName = "ŭ֮����",
			needSkill = "���ǻ���",
			needLevel = 10
		}
	},
	{
		[2] = {
			icon = "68",
			desc2 = "�ٻ�ŭ֮ʥ����Ϊ�Լ�����ӣ�ŭ֮ʥ�޶�ʥ������һ���ĵֿ������˵ĵȼ�Խ�ߣ��ֿ��ļ���ҲԽ�ߡ�",
			desc1 = "̫������������ʮ�ǣ����ٻ�ǿ���ŭ֮ʥ����Ϊ��ӡ�",
			skillName = "ŭ֮ʥ��",
			needSkill = "�ٻ�����",
			needLevel = 30
		},
		[3] = {
			icon = "69",
			desc2 = "�ͷ���Ѫ��ʱ���ʴ�������Ŀ��Ϊ���ģ�ʹ3*3��Χ�ڵ�Ŀ���ܵ�1.2����Ѫ�����˺���",
			desc1 = "���������һ��ʮ�ǣ��ͷ���Ѫ��ʱ���м��ʴ���ŭ֮��Ѫ��",
			skillName = "ŭ֮��Ѫ",
			needSkill = "��Ѫ��",
			needLevel = 10
		}
	}
}
soliderSkillPreview.ctor = function (self, soliderId)
	self.super.ctor(self)

	self.id = soliderId
	self.job = g_data.player.job

	self.setMoveable(self, true)

	return 
end
soliderSkillPreview.onEnter = function (self)
	self.initPanelUI(self, {
		title = "ŭ֮����",
		bg = "pic/panels/wingUpgrade/previewBg.png"
	})
	self.pos(self, display.cx + 320, display.cy)
	self.loadMainPage(self)

	return 
end
soliderSkillPreview.loadMainPage = function (self)
	self.content = self.bg
	local cfg = skillDesc[self.job][self.id]

	if not cfg then
		return 
	end

	local posY = self.content:geth() - 53
	local showNode = display.newSprite(res.gettex2("pic/panels/wingUpgrade/previewItem.png")):add2(self.content):anchor(0, 1):pos(20, posY)
	local magicId = nil
	magicId = def.magic.getMagicIdByName(cfg.needSkill, self.job)

	if magicId < 0 then
		print("��Ҫ�ļ����������ò���ȷ")

		return 
	end

	local soliderInfo = g_data.solider:getSoliderInfo(self.id)
	local skillLvl = soliderInfo.level

	an.newLabel(cfg.skillName, 20, 1, {
		color = def.colors.title
	}):anchor(0, 0.5):pos(67, 48):addto(showNode)

	if skillLvl < cfg.needLevel then
		an.newLabel("δѧϰ", 20, 1, {
			color = def.colors.Cf0c896
		}):anchor(0, 0.5):pos(67, 22):addto(showNode)
	else
		an.newLabel("��ѧϰ", 20, 1, {
			color = def.colors.Cf0c896
		}):anchor(0, 0.5):pos(67, 22):addto(showNode)
	end

	local filter = nil

	if skillLvl < cfg.needLevel then
		filter = res.getFilter("gray")
	end

	display.newSprite(res.gettex2("pic/console/iconbg6.png")):pos(37, 37):add2(showNode)

	local icon = display.newFilteredSprite(res.gettex2("pic/panels/solider/" .. cfg.icon .. ".png")):pos(37, 37):add2(showNode):scale(0.83)

	if filter then
		icon.setFilter(icon, filter)
	end

	posY = posY - 95

	an.newLabel("����������", 20, 1, {
		color = def.colors.title
	}):anchor(0, 0.5):pos(20, posY):add2(self.content)

	posY = posY - 25
	local lblDesc = an.newLabelM(180, 18, 0, {
		manual = false,
		center = false
	}):add2(self.content):anchor(0, 1):pos(20, posY):nextLine()

	if skillLvl < cfg.needLevel then
		lblDesc.addLabel(lblDesc, cfg.desc1)
	else
		lblDesc.addLabel(lblDesc, cfg.desc2)
	end

	return 
end

return soliderSkillPreview
