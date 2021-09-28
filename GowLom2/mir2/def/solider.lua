local allUpCfg = import("csv2cfg.GodWeapon")
local solider = {}
local UPGRADE_MATERIAL1 = "����ʯ"
local UPGRADE_MATERIAL2 = "����ʯ"
local KEY_NEED_SERVER_STEP = "�������׶�"
local KEY_NEED_PLAYER_LEVEL = "����ȼ�"
local KEY_NEED_GOLD = "���"
solider.nameCfg = {
	"����",
	"̫��",
	"���",
	"�쾧"
}
solider.imgCfg = {
	"sw",
	"tx",
	"fh",
	"tj"
}
solider.allUpCfg = allUpCfg
local BASIC_SKILL_LIST = {
	"��������",
	"��ɱ����",
	"�����䵶",
	"�һ𽣷�",
	"���ս���",
	"׷�Ĵ�",
	"�����",
	"�׵���",
	"���ǻ���",
	"������",
	"����ѩ��",
	"�ٻ�����",
	"��Ѫ��",
	"�����",
	"�򽣹���"
}
local job_skill_prop = {
	�ٻ�����ŭ֮�˺� = 2,
	ŭ֮�һ��� = 0,
	�׵���ŭ֮�˺� = 1,
	�һ𽣷�ŭ֮�˺� = 0,
	ŭ֮���꼸�� = 1,
	ŭ֮�һ�����˺� = 0,
	������ŭ֮�˺� = 1,
	��Ѫ��ŭ֮�˺� = 2,
	�����ŭ֮�˺� = 2,
	ŭ֮��Ѫ���� = 2,
	ŭ֮��Ѫ�����˺� = 2,
	��������ŭ֮�˺� = 0,
	����ѩ��ŭ֮�˺� = 1,
	׷�Ĵ�ŭ֮�˺� = 0,
	��ɱ����ŭ֮�˺� = 0,
	���ǻ���ŭ֮�˺� = 1,
	ŭ֮��������˺� = 1,
	�����䵶ŭ֮�˺� = 0,
	�򽣹���ŭ֮�˺� = 2,
	�����ŭ֮�˺� = 1,
	���ս���ŭ֮�˺� = 0
}
local PROP_ALIAS = {
	�쾧 = "�쾧",
	��������ŭ֮�˺� = "���������˺�",
	ħ������ = "ħ������",
	��ɱ����ŭ֮�˺� = "��ɱ�����˺�",
	�׵���ŭ֮�˺� = "�׵����˺�",
	�򽣹��ڵȼ� = "�򽣹��ڵȼ�",
	�������� = "��������",
	�����䵶ŭ֮�˺� = "�����䵶�˺�",
	�������׶� = "�������׶�",
	��ʦ����ֵ = "����ֵ",
	��� = "���",
	�һ𽣷��ȼ� = "�һ𽣷��ȼ�",
	�������ȼ� = "�������ȼ�",
	���ս���ŭ֮�˺� = "���ս����˺�",
	���ǻ���ŭ֮�˺� = "���ǻ����˺�",
	�һ𽣷�ŭ֮�˺� = "�һ𽣷��˺�",
	�ٻ����޵ȼ� = "�ٻ����޵ȼ�",
	��Ѫ��ŭ֮�˺� = "��Ѫ���˺�",
	��ʿ����ֵ = "����ֵ",
	��� = "���",
	�����ŭ֮�˺� = "������˺�",
	�������� = "��������",
	ŭ֮���꼸�� = "ŭ֮���꼸��",
	սʿ����ֵ = "����ֵ",
	����ʯ = "����ʯ",
	ŭ֮�һ�����˺� = "ŭ֮�һ��˺�",
	�����ŭ֮�˺� = "������˺�",
	��������ı� = "�ٻ�ŭ֮ʥ��",
	ŭ֮��Ѫ�����˺� = "ŭ֮��Ѫ�˺�",
	׷�Ĵ�ŭ֮�˺� = "׷�Ĵ��˺�",
	����ѩ�صȼ� = "����ѩ�صȼ�",
	̫�� = "̫��",
	�ٻ�����ŭ֮�˺� = "�ٻ������˺�",
	�������� = "��������",
	ŭ֮�һ��� = "ŭ֮�һ���",
	������ŭ֮�˺� = "�������˺�",
	����ȼ� = "����ȼ�",
	׷�Ĵ̵ȼ� = "׷�Ĵ̵ȼ�",
	����ѩ��ŭ֮�˺� = "����ѩ���˺�",
	����ʯ = "����ʯ",
	ŭ֮��Ѫ���� = "ŭ֮��Ѫ����",
	ħ������ = "ħ������",
	���� = "����",
	ŭ֮��������˺� = "ŭ֮�����˺�",
	�򽣹���ŭ֮�˺� = "�򽣹����˺�",
	�������� = "��������"
}

local function nameInSolider(name)
	for i, v in pairs(def.solider.nameCfg) do
		if v == name then
			return true, i
		end
	end

	return false
end

local function nameInSkill(name)
	for i, v in ipairs(BASIC_SKILL_LIST) do
		if v .. "�ȼ�" == name then
			return true
		end
	end

	return false
end

solider.getCfg = function (self, id, level)
	for i, v in ipairs(allUpCfg) do
		if v.ID == id and v.GodWeaponLevel == level then
			return v
		end
	end

	return nil
end
solider.getNeedCfg = function (self, id, level, job)
	local cfg = self.getCfg(self, id, level)

	if not cfg then
		return nil
	end

	local ret = {
		upNeedstffCount = "",
		upNeedGold = 0,
		upNeedstff = "",
		upNeedLevel = 0,
		upNeedServerStep = 0,
		upProps = {},
		upNeedSolider = {},
		upNeedSkillLevel = {}
	}
	local prop = def.property.dumpPropertyStr(cfg.Request)

	if prop.get(prop, UPGRADE_MATERIAL1) then
		ret.upNeedstff = UPGRADE_MATERIAL1
	elseif prop.get(prop, UPGRADE_MATERIAL2) then
		ret.upNeedstff = UPGRADE_MATERIAL2
	end

	ret.upNeedstffCount = prop.get(prop, ret.upNeedstff)
	ret.upNeedLevel = prop.get(prop, KEY_NEED_PLAYER_LEVEL) or 0
	ret.upNeedServerStep = prop.get(prop, KEY_NEED_SERVER_STEP) or 0
	ret.upNeedGold = prop.get(prop, KEY_NEED_GOLD) or 0

	for i, v in ipairs(prop.props) do
		local name = v[1]
		local value = v[2]
		local inSolider, soliderIdx = nameInSolider(name)

		if inSolider then
			ret.upNeedSolider[soliderIdx] = value
		elseif nameInSkill(name) then
			local len = string.utf8len(name)
			local skillname = string.utf8sub(name, 1, len - 2)

			if job then
				if job == def.magic.getMagicJob(skillname) then
					ret.upNeedSkillLevel[skillname] = value
				end
			else
				ret.upNeedSkillLevel[skillname] = value
			end
		end
	end

	return ret
end
solider.getProps = function (self, id, level, job)
	local cfg = self.getCfg(self, id, level)

	if not cfg then
		return nil
	end

	local prop = def.property.dumpPropertyStr(cfg.GodWeaponProperty):clearZero():toStdProp()

	if job then
		prop.grepJob(prop, job)
	end

	local i = 1

	while i <= #prop.props do
		local v = prop.props[i]
		local j = job_skill_prop[v[1]]

		if j ~= nil and j ~= job then
			prop.del(prop, v[1])
		else
			i = i + 1
		end
	end

	return prop
end
solider.convertPropName = function (self, name)
	return PROP_ALIAS[name] or name
end

return solider
