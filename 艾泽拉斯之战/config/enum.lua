enum = {};

enum.BUFF_SPECIAL_EFFECT = {
	BUFF_SPECIAL_EFFECT_INVALID = -1, -- null
	BUFF_SPECIAL_EFFECT_AI = 0x00000001, -- ai
	BUFF_SPECIAL_EFFECT_MOVE_TYPE = 0x00000002, -- 移动类型
	BUFF_SPECIAL_EFFECT_PER_RETALIATE = 0x00000004, -- 前置反击
}

enum.DAILY_TASK_TYPE = {
	DAILY_TASK_TYPE_ADVENTURE = 0, -- 通关任意副本
	DAILY_TASK_TYPE_NORMAL = 1, -- 通关任意普通副本
	DAILY_TASK_TYPE_ELITE = 2, -- 通关任意精英副本
	DAILY_TASK_TYPE_PVP_ONLINE = 3, -- 进行同步PVP
	DAILY_TASK_TYPE_PVP_OFFLINE = 4, -- 进行异步PVP
	DAILY_TASK_TYPE_PURCHASE_GOLD = 5, -- 购买金币
	DAILY_TASK_TYPE_PURCHASE_LUMBER = 6, -- 购买木材
	DAILY_TASK_TYPE_MEDITATION = 7, -- 冥想
	DAILY_TASK_TYPE_MONTH_RIGHT = 8, -- 月卡
	DAILY_TASK_TYPE_SWIEEP_TICKET = 9, -- 扫荡券
}

enum.DAMAGE_FLAG = {
	DAMAGE_FLAG_INVALID = -1, -- null
	DAMAGE_FLAG_NORMAL = 0, -- 伤害
	DAMAGE_FLAG_DOGE = 1, -- 闪避
	DAMAGE_FLAG_IMMUNE = 2, -- 免疫
	DAMAGE_FLAG_BLOCK = 3, -- 格挡
	DAMAGE_FLAG_ABSORB = 4, -- 吸收
	DAMAGE_FLAG_CRITICAL = 5, -- 暴击
}

enum.DAMAGE_TYPE = {
	DAMAGE_TYPE_INVALID = -1, -- null
	DAMAGE_TYPE_PHYSIC = 0, -- 物理
	DAMAGE_TYPE_PIERCE = 1, -- 穿刺
	DAMAGE_TYPE_MAGIC = 2, -- 法术
	DAMAGE_TYPE_HOLY = 3, -- 神圣
	DAMAGE_TYPE_COUNT = 4, -- DAMAGE_TYPE_COUNT
}

enum.DRAW_CARD_TYPE = {
	DRAW_CARD_TYPE_INVALID = -1, -- null
	DRAW_CARD_TYPE_FREE = 0, -- 免费抽
	DRAW_CARD_TYPE_ONCE = 1, -- 抽一次
	DRAW_CARD_TYPE_TENTIMES = 2, -- 抽十次
}

enum.EQUIP_ATTR = {
	EQUIP_ATTR_INVALID = -1, -- 无
	EQUIP_ATTR_ATTACK = 0, -- 攻击等级
	EQUIP_ATTR_DEFENCE = 1, -- 防御等级
	EQUIP_ATTR_CRITICAL = 2, -- 暴击等级
	EQUIP_ATTR_RESILIENCE = 3, -- 韧性等级
	EQUIP_ATTR_COUNT = 4, -- EQUIP_ATTR_COUNT
}

enum.EQUIP_PART = {
	EQUIP_PART_INVALID = -1, -- null
	EQUIP_PART_WEAPON = 0, -- 武器
	EQUIP_PART_GLOVE = 1, -- 手套
	EQUIP_PART_BREASTPLATE = 2, -- 胸甲
	EQUIP_PART_LEGGINGS = 3, -- 护腿
	EQUIP_PART_HELMENT = 4, -- 头盔
	EQUIP_PART_SHOES = 5, -- 鞋子
	EQUIP_PART_COUNT = 6, -- EQUIP_PART_COUNT
}

enum.ITEM_TYPE = {
	ITEM_TYPE_INVALID = -1, -- 无
	ITEM_TYPE_EQUIP = 0, -- 装备
	ITEM_TYPE_DEBRIS = 1, -- 碎片
	ITEM_TYPE_MATERIAL = 2, -- 材料
	ITEM_TYPE_USED = 3, -- 可使用物品
	ITEM_TYPE_COUNT = 4, -- ITEM_TYPE_COUNT
}

enum.MAGIC_AI = {
	MAGIC_AI_RANGED = 0, -- 优先远程
	MAGIC_AI_MELEE = 1, -- 优先近战
	MAGIC_AI_MAX_ENEMY = 2, -- 周围敌方目标最多
	MAGIC_AI_MAX_FRIEND = 3, -- 周围友方目标最多
	MAGIC_AI_MAX_LOSS = 4, -- 血量百分比最低
	MAGIC_AI_MAX_ATTACK = 5, -- 攻击最高
	MAGIC_AI_MAX_HP = 6, -- 血量最高
	MAGIC_MAX_ATTACK_DIV_HP = 7, -- 攻血比最高
	MAGIC_AI_CAUSE_DAMAGE = 8, -- 造成伤害最高
	MAGIC_AI_MAX_POSITIVE_STATUS = 9, -- 正面状态最多
	MAGIC_AI_MAX_NEGATIVE_STATUS = 10, -- 负面状态最多
	MAGIC_AI_RANDOM = 11, -- 随机
	MAGIC_AI_DIRECT_CAST = 12, -- 直接施放
}

enum.MAGIC_LABEL = {
	MAGIC_LABEL_DAMAGE = 0, -- 伤害
	MAGIC_LABEL_BUFF = 1, -- 增益
	MAGIC_LABEL_DEBUFF = 2, -- 减益
	MAGIC_LABEL_ELSE = 3, -- 其他
}

enum.MAGIC_SHAPE = {
	MAGIC_SHAPE_INVALID = -1, -- null
	MAGIC_SHAPE_POINT = 0, -- 点
	MAGIC_SHAPE_CIRCLE = 1, -- 目标圆
	MAGIC_SHAPE_TARGETROW = 2, -- 目标行
	MAGIC_SHAPE_EJECTION = 3, -- 弹射_不可重复
	MAGIC_SHAPE_GLOBAL = 4, -- 全屏
}

enum.MAGIC_TARGET_TYPE = {
	MAGIC_TARGET_TYPE_INVALID = -1, -- null
	MAGIC_TARGET_TYPE_ENEMY = 0, -- 敌军
	MAGIC_TARGET_TYPE_FRIEND = 1, -- 友军
	MAGIC_TARGET_TYPE_UNIT = 2, -- 敌我双方
	MAGIC_TARGET_TYPE_SPACE = 3, -- 空地
	MAGIC_TARGET_TYPE_ANY = 4, -- 全部
	MAGIC_TARGET_TYPE_NONE = 5, -- 无目标
	MAGIC_TARGET_TYPE_FRIEND_DEAD = 6, -- 友军死亡单位
}

enum.MOMENT = {
	MOMENT_INVALID = 0, -- null
	MOMENT_BORN = 0x00000001, -- 出生时
	MOMENT_BEGINBATTLE = 0x00000002, -- 战斗开始时
	MOMENT_ACTIONBEFORE = 0x00000004, -- 行动开始前
	MOMENT_ACTIONBEGIN = 0x00000008, -- 行动开始时
	MOMENT_MOVE = 0x00000010, -- 移动后
	MOMENT_SKIPMOVE = 0x00000020, -- 跳过移动阶段时
	MOMENT_BEFOREATTACK = 0x00000040, -- 进行攻击前
	MOMENT_BEFOREHIT = 0x00000080, -- 受到攻击前
	MOMENT_AFTERATTACK = 0x00000100, -- 进行攻击后
	MOMENT_AFTERHIT = 0x00000200, -- 受到攻击后
	MOMENT_BEFOREDAMAGE = 0x00000400, -- 造成伤害前
	MOMENT_BEFOREHURT = 0x00000800, -- 受到伤害前
	MOMENT_BEFORECURE = 0x00001000, -- 受到治疗前
	MOMENT_BEFOREHURT2 = 0x00002000, -- 受到伤害前2
	MOMENT_AFTERDAMAGE = 0x00004000, -- 造成伤害后
	MOMENT_AFTERHURT = 0x00008000, -- 受到伤害后
	MOMENT_ACTIONEND = 0x00010000, -- 行动结束时
	MOMENT_KILLANOTHER = 0x00020000, -- 灭亡军团时
	MOMENT_DEAD = 0x00040000, -- 军团灭亡时
	MOMENT_AFTERMAGIC = 0x00100000, -- 我方魔法回合结束时
	MOMENT_ENDBATTLE = 0x00200000, -- 战斗结束时
	MOMENT_GETBUFF = 0x00400000, -- 获得状态时
	MOMENT_NULL = 0x00800000, -- 无
	MOMENT_BEFORECOUNTER = 0x01000000, -- 进行反击前
	MOMENT_AFTERCOUNTER = 0x02000000, -- 进行反击后
	MOMENT_BEFORECOUNTERED = 0x04000000, -- 受到反击前
	MOMENT_AFTERCOUNTERED = 0x08000000, -- 受到反击后
	MEOMENT_ABSOLUTE_DEAD = 0x10000000, -- 死透了
}

enum.MOVE_TYPE = {
	MOVE_TYPE_INVALID = -1, -- null
	MOVE_TYPE_WALK = 0, -- 陆地
	MOVE_TYPE_FLY = 1, -- 飞行
	MOVE_TYPE_BLINK = 2, -- 闪烁
	MOVE_TYPE_PHANTOM = 3, -- 幻影
	MOVE_TYPE_COUNT = 4, -- MOVE_TYPE_COUNT
}

enum.RACE = {
	RACE_INVALID = -1, -- null
	RACE_HUMAN = 0, -- 人类
	RACE_ORCS = 1, -- 兽族
	RACE_DARK_NIGHT = 2, -- 暗夜
	RACE_UNDEAD = 3, -- 不死
	RACE_SPECIAL = 4, -- 特殊
	RACE_COUNT = 5, -- RACE_COUNT
}

enum.RANGE_TYPE = {
	RANGE_TYPE_INVALID = -1, -- null
	RANGE_TYPE_MELEE = 0, -- 近战
	RANGE_TYPE_RANGED = 1, -- 远程
	RANGE_TYPE_COUNT = 2, -- RANGE_TYPE_COUNT
}

enum.SIDE = {
	SIDE_INVALID = -1, -- null
	SIDE_NONE = 0, -- 无
	SIDE_ENEMY = 1, -- 敌军
	SIDE_FRIEND = 2, -- 友军
	SIDE_BOTH = 3, -- 敌我双方
}

enum.SKILL_RANGE = {
	SKILL_RANGE_INVALID = -1, -- null
	SKILL_RANGE1 = 1, -- 1格
	SKILL_RANGE2 = 2, -- 2格
	SKILL_RANGE3 = 3, -- 3格
	SKILL_RANGE4 = 4, -- 4格
	SKILL_RANGE5 = 5, -- 5格
	SKILL_RANGE6 = 6, -- 6格
	SKILL_RANGE_ATTACK = 7, -- 单位攻击距离
}

enum.SKILL_SHAPE = {
	SKILL_SHAPE_INVALID = -1, -- null
	SKILL_SHAPE_POINT = 0, -- 点
	SKILL_SHAPE_SELFCIRCLE = 1, -- 自身圆
	SKILL_SHAPE_TARGETCIRCLE = 2, -- 目标圆
	SKILL_SHAPE_FAN = 3, -- 扇形
	SKILL_SHAPE_LINE = 4, -- 直线
	SKILL_SHAPE_TARGETWITHBACK = 5, -- 目标及其身后
	SKILL_SHAPE_TARGETROW = 6, -- 目标行
	SKILL_SHAPE_EJECTIONREPEAT = 7, -- 弹射_不可重复
	SKILL_SHAPE_EJECTION = 8, -- 弹射_可重复
	SKILL_SHAPE_ALL = 9, -- 全屏
}

enum.STATUS = {
	STATUS_INVAID = -1, -- null
	STATUS_IMMUNE_DEBUFF = 0, -- 免疫负面状态
	STATUS_IMMUNE_CHARM = 1, -- 免疫心智控制
	STATUS_IMMUNE_POISON = 2, -- 免疫中毒
	STATUS_IMMUNE_VAMPIRISM = 3, -- 免疫吸血
	STATUS_CHARM = 4, -- 魅惑
	STATUS_NO_MOVE = 5, -- 无法移动
	STATUS_NO_ATTACK = 6, -- 无法攻击
	STATUS_NO_RETALIATE = 7, -- 无法反击
	STATUS_NO_SKILL = 8, -- 无法施法
	STATUS_NO_BE_RETALIATE = 9, -- 无法被反击
	STATUS_DEATH_COUNTDOWN = 10, -- 死亡倒数
	STATUS_TAUNT = 11, -- 嘲讽
	STATUS_COUNT = 12, -- STATUS_COUNT
}

enum.TARGET_TYPE = {
	TARGET_TYPE_INVALID = -1, -- null
	TARGET_TYPE_DEFAULT = 0, -- 默认AI
	TARGET_TYPE_RANDOM = 1, -- 随机
	TARGET_TYPE_MAX_DAMANGE = 2, -- 受损最严重
	TARGET_TYPE_TARGET = 3, -- 参数目标
	TARGET_TYPE_MIN_STATE = 4, -- 对应状态时间最短
	TARGET_TYPE_MATCH_CONDITION = 5, -- 条件响应_匹配者[0]
}

enum.UNIT_ATTR = {
	UNIT_ATTR_INVALID = -1, -- null
	UNIT_ATTR_ATTACK_RANGE = 0, -- 攻击距离
	UNIT_ATTR_MOVE_RANGE = 1, -- 移动距离
	UNIT_ATTR_DEFENCE = 2, -- 防御
	UNIT_ATTR_PHYSIC_DODGE = 3, -- 闪避[0]
	UNIT_ATTR_PIERCE_DODGE = 4, -- 闪避[1]
	UNIT_ATTR_MAGIC_DODGE = 5, -- 闪避[2]
	UNIT_ATTR_MAX_RETALIATE_COUNT = 6, -- 反击次数
	UNIT_ATTR_ATTACK_COUNT = 7, -- 攻击次数
	UNIT_ATTR_IGNORE_DEFENCE = 8, -- 无视护甲值
	UNIT_ATTR_SOLDIER_HP = 9, -- 单兵血量
	UNIT_ATTR_SOLDIER_DAMAGE = 10, -- 单兵伤害
	UNIT_ATTR_SPEED = 11, -- 行动速度
	UNIT_ATTR_PHYSIC_DAMAGE_PERCENT = 12, -- 受伤系数[0]
	UNIT_ATTR_PIERCE_DAMAGE_PERCENT = 13, -- 受伤系数[1]
	UNIT_ATTR_MAGIC_DAMAGE_PERCENT = 14, -- 受伤系数[2]
	UNIT_ATTR_CURE_RATE = 15, -- 治疗系数
	UNIT_ATTR_EXTRA_DAMAGE = 16, -- 额外攻击力
	UNIT_ATTR_COUNT = 17, -- UNIT_ATTR_COUNT
}


