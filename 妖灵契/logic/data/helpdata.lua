module(...)
--auto generate data
DATA={
	PartnerEquipStrongView={
		content=[[[d9ceba]◆符文等级的提升可以提高2条主属性的效果，符文星级越高每次提升的效果也越多，最多可提升到15级
[d9ceba]◆每当强化等级达到[4edaad]3、6、9、12、15[d9ceba]时，会随机增加1条副属性或提升已有副属性
[d9ceba]◆使用星级以及等级越高的符文当强化素材时，提供的经验越多但同时消耗的金币也会越多
[d9ceba]◆星级越高的符文升级所需要的经验越多，当使用经验符文当素材时，所提供大量的符文经验
[d9ceba]◆一键添加仅可添加[4edaad]经验符文[d9ceba]和[4edaad]1~2星的常规符文[d9ceba]
[d9ceba]◆经验符文仅可作为素材提供符文经验，无法被强化]],
		key=[[PartnerEquipStrongView]],
		pichelp={},
		title=[[符文强化]],
	},
	anlei_main={
		content=[[[8c8783]探索规则：
[d9ceba]◆地图中点击标有指南针的地区可进行探索
◆探索地区消耗1探索点才可进行探索。
◆每天00:00系统提供[4edaad]50探索点[d9ceba]。
◆探索点不足可消耗水晶购买探索点。
◆每天最多可购买150探索点。
◆探索成功可获得奖励。
◆根据地图名称不同，所触发的[4edaad]精英怪[d9ceba]和[4edaad]秘宝猎人[d9ceba]会有所不同。
◆探索途中有机率遇见[4edaad]秘宝猎人[d9ceba]和[4edaad]精英怪[d9ceba]。
◆秘宝猎人和精英怪可组队进行。
◆秘宝猎人可获得[4edaad]大量金币[d9ceba]。
◆精英怪可获得[4edaad]稀有奖励[d9ceba]。]],
		key=[[anlei_main]],
		pichelp={
			[1]=[[pic_rukou_yuanhua_1;带指南针地区才能探索碎片掉落显示在地图下]],
			[2]=[[pic_rukou_yuanhua_2;每天0点恢复50点探索点，每次探索消耗1点]],
			[3]=[[pic_rukou_yuanhua_3;离线探索可支持30分钟，赶快开始探索吧！]],
		},
		title=[[探索提示]],
	},
	anlei_offline_tips={
		content=[[[8c8783]探索离线托管提示：
[d9ceba]◆探索中离线或切换后台时，可继续进行探索。
◆离线探索可支持30分钟。（月卡、终身卡可享受1小时。）
◆系统会在下线后开始计时，到达相应时间后可获得奖励。
◆奖励会在上线时直接获得。]],
		key=[[anlei_offline_tips]],
		pichelp={},
		title=[[探索离线托管提示]],
	},
	arena={
		content=[[◆周一至周五21:00-22:00，开启比武场，匹配分段相近的玩家进行战斗
◆胜者可在失败者身上获得比武积分，比武积分达到一定值可提升比武段位
◆胜利可获得大量的荣誉，荣誉可在荣誉商店交换珍贵礼品；战败只能获得一半的荣誉
◆每周一0:00，根据所在的段位发放比武奖励，然后重置比武积分为当前段位的下一级]],
		key=[[arena]],
		pichelp={},
		title=[[竞技场]],
	},
	attr_main={
		content=[[[8c8783]◆人物战斗力来源：装备突破等级、宝石加成、淬灵属性、神格加成、套装等
◆伙伴战斗力来源：伙伴等级、星级、伙伴觉醒，符文和御灵]],
		key=[[attr_main]],
		pichelp={},
		title=[[人物属性]],
	},
	chouka1={
		content=[[[e3c280]◆勇者招募获取[43cb96]R/N[e3c280]的概率为[43cb96]20%/80%[e3c280]
[e3c280]◆王者招募获取[43cb96]SSR/SR/R[e3c280]的概率为[43cb96]2%/23%/75%[e3c280] ]],
		key=[[chouka1]],
		pichelp={},
		title=[[概率详情]],
	},
	chouka2={
		content=[[[e3c280]◆勇者招募每成功招募1个伙伴，可随机获取1个[43cb96]一星符文
[e3c280]◆王者招募每成功招募1个伙伴，可随机获取1个[43cb96]二星符文
[e3c280]◆每进行[43cb96]10[e3c280]次王者招募，则必定会出现[43cb96]SR[e3c280]或[43cb96]SSR[e3c280]伙伴，（一发入魂契约和欧洲偷渡契约不计入）
[e3c280]◆间隔[43cb96]24小时[e3c280]则可以[43cb96]免费[e3c280]进行1次王者招募，此次免费招募后，则开始计算下一次免费招募的间隔时间
[e3c280]◆当获取[43cb96]SSR伙伴[e3c280]后，则会在世界频道发放欧气，领取欧气的玩家可以大大提高稀有伙伴的出现
[e3c280]◆进行勇者招募时，每次默认招募[43cb96]5[e3c280]个伙伴，若不足5个勇者契约时，则根据当前剩余数量进行招募]],
		key=[[chouka2]],
		pichelp={},
		title=[[其他规则]],
	},
	clubarena={
		content=[[[8c8783]武馆挑战
[d9ceba]◆玩家可手动进行战斗。
[d9ceba]◆战斗胜利，若防守方的武馆高于进攻方，双方武馆对调。
[d9ceba]◆每个玩家每天有5次免费发起战斗的机会，每天00:00重置次数。
[d9ceba]◆战斗结束后，进攻方可获得战斗奖励。
[d9ceba]◆战斗失败会有倒计时，倒计时结束后可继续进行挑战。
[d9ceba]◆正在战斗的敌人无法被选定为对手。
[d9ceba]◆每天00:00点结算排名，并通过邮件为武馆玩家（除新手馆）发放排名奖励。
[8c8783]馆主挑战
[d9ceba]◆战胜相同武馆馆员5次，可进行该武馆馆主挑战。
[d9ceba]◆馆主挑战不需要消耗挑战次数，只需消耗金币。
[d9ceba]◆战斗胜利，对调位置。
[d9ceba]◆馆主会根据时间累积馆主奖励。
[d9ceba]◆新人馆没有馆主。
[8c8783]武馆承载人数
[d9ceba]◆王者馆（10人）
[d9ceba]◆钻石馆（30人）
[d9ceba]◆黄金馆（60人）
[d9ceba]◆白银馆（150人）
[d9ceba]◆青铜馆（250人）]],
		key=[[clubarena]],
		pichelp={},
		title=[[武馆挑战]],
	},
	convoy={
		content=[[[d9ceba]◆每天可进行[4edaad]3[d9ceba]次护送，开始任务后则消耗1次，每天0点重置次数
[d9ceba]◆护送目标档次越高，获得的奖励也越高。通过[4edaad]刷新目标[d9ceba]可刷新此次护送的档次，将有概率获得[4edaad]更高[d9ceba]的档次
[d9ceba]◆每天有一定的[4edaad]免费[d9ceba]刷新次数，免费次数使用完毕后，可以消耗[4edaad]水晶[d9ceba]进行刷新
[d9ceba]◆护送过程中，将会有概率遇到拦路者，战斗胜利之后继续护送，战斗失败之后则任务失败，需要重新领取任务
[d9ceba]◆若中途停止护送，则此次任务失败，需要重新领取任务]],
		key=[[convoy]],
		pichelp={},
		title=[[帝都宅急便]],
	},
	editexpress={
		content=[[表白编辑]],
		key=[[editexpress]],
		pichelp={},
		title=[[表白编辑]],
	},
	endlesspve={
		content=[[[d9ceba]◆使用[4edaad]镜花水月[d9ceba]可开启月见幻境，[4edaad]镜花水月[d9ceba]可以通过[4edaad]每日活跃[d9ceba]获得。
[d9ceba]◆开启幻境时，需要在[4edaad]10分钟[d9ceba]内击退其不断袭来的幻影，根据击退的波数，可掉落丰厚的金币/伙伴符石奖励。
[d9ceba]◆幻境有三个难度，分别在46级/60级/75级开放。
[d9ceba]◆可以选择单人或者组队进入幻境，最多可[4edaad]2人[d9ceba]组队。加入别人创建的队伍不消耗镜花水月，但每天加入队伍次数限制为[4edaad]3次[d9ceba]。
[d9ceba]◆单人和组队击退相同的波数，每波获得的物品价值一样，[4edaad]推荐组队进入[d9ceba]，积极帮助其他玩家。]],
		key=[[endlesspve]],
		pichelp={},
		title=[[月见幻境]],
	},
	equalarena={
		content=[[[d9ceba]◆公平比武场于每周六日16:00-18:00，对53级以上玩家开启。
[d9ceba]◆玩家需要选择2名伙伴进入公平比武场，作为自带伙伴，匹配全服玩家进行战斗。
[d9ceba]◆匹配成功后，玩家需要轮流从系统给出的伙伴和符文中，选出4名伙伴和4套御灵（御灵只有核心效果）后，进入御灵核心选择界面。然后每人从合计6名伙伴中，选择4名装配御灵核心，并进入战斗。
[d9ceba]◆公平比武场的战斗数值由系统给出，相同的伙伴数值和技能等级完全相等。
[d9ceba]◆胜利可获得荣誉，荣誉可在荣誉商店交换珍贵礼品；战败只能获得一半的荣誉。前3回合逃跑的话，失败者不会获得荣誉奖励。
[d9ceba]◆胜者可在失败者身上获得公平比武积分，每月1日0:00根据积分的排名，发放公平比武奖励，然后重置为2000分。]],
		key=[[equalarena]],
		pichelp={},
		title=[[公平竞技场]],
	},
	equipfuben_1={
		content=[[[8c8783] 前庭
[d9ceba]◆前庭副本掉落装备突破材料与攻击/抗暴宝石，满星后可领取对应等级紫色武器/鞋子。
[d9ceba]◆每次副本通关时消耗[4edaad]12体力[d9ceba]；未通关副本则只消耗[4edaad]3体力[d9ceba]。]],
		key=[[equipfuben_1]],
		pichelp={},
		title=[[前庭]],
	},
	equipfuben_2={
		content=[[[8c8783] 暗道
[d9ceba]◆暗道副本掉落装备突破材料与暴击/防御宝石，满星后可领取对应等级紫色戒指/腰带。
[d9ceba]◆每次副本通关时消耗[4edaad]12体力[d9ceba]；未通关副本则只消耗[4edaad]3体力[d9ceba]。]],
		key=[[equipfuben_2]],
		pichelp={},
		title=[[暗道]],
	},
	equipfuben_3={
		content=[[[8c8783]秘牢
[d9ceba]◆秘牢副本掉落装备突破材料与速度/气血宝石，满星后可领取对应等级紫色衣服/项链。
[d9ceba]◆每次副本通关时消耗[4edaad]12体力[d9ceba]；未通关副本则只消耗[4edaad]3体力[d9ceba]。]],
		key=[[equipfuben_3]],
		pichelp={},
		title=[[秘牢]],
	},
	equipfuben_main={
		content=[[[d9ceba]◆装备副本产出大量优质装备和强化材料。
[d9ceba]◆装备副本分为[4edaad]三个副本[d9ceba]，每个副本一共有[4edaad]7层[d9ceba]，通关一层后才能解锁下一层。首次通关将会获得对应等级的蓝色装备。
[d9ceba]◆通关一个副本后，会根据表现评定星级。通关星级越高，掉落数量越多。
[d9ceba]◆通关副本的星级会累计，当在某个副本获得规定数量的星星时，将可以任选一件对应等级[4edaad]紫色[d9ceba]以上装备。
[d9ceba]◆三星通关后还能开启本副本的[4edaad]扫荡[d9ceba]功能，消耗2扫荡券（拥有终身卡无需扫荡券）立刻获得3星奖励。
[d9ceba]◆每次副本通关时消耗[4edaad]12体力[d9ceba]；未通关副本则只消耗[4edaad]3体力[d9ceba]。]],
		key=[[equipfuben_main]],
		pichelp={},
		title=[[装备副本]],
	},
	field_boss={
		content=[[[d9ceba]◆人形怪物会不定时间降临，请留意公告板时间
[d9ceba]◆人形怪物刷新后，[4edaad]55级以上[-]的玩家可参与讨伐
[d9ceba]◆结界中最多可容纳[4edaad]100人[-]，[4edaad]非同公会[-]和[4edaad]非队伍[-]的玩家可[4edaad]互相攻击[-]
[d9ceba]◆[4edaad]与玩家战斗失败[-]、[4edaad]主动逃离战斗[-]和[4edaad]主动退出场景[-]都会被[4edaad]传离结界[-]，且[4edaad]30s内[-]无法再次进入
[d9ceba]◆当人形怪物血量[4edaad]低于30%[-]后，结界入口将被[4edaad]封印[-]无法传入，且怪物会在[4edaad]3小时[-]后隐遁
[8c8783] 挑战奖励：
[d9ceba]◆每挑战一次，可获得相应的金币奖励，上限[4edaad]5次[-]（次数会在下次怪物降临后重置）
[8c8783] 成功消灭人形怪物后：
[d9ceba]◆存活到最后的所有勇士将会获得一份[4edaad]英勇奖励[-]
[d9ceba]◆最后一击的勇士额外获得一份[4edaad]击杀奖励[-]
[d9ceba]◆同时，幻境中还会[4edaad]掉落若干[-]个藏着无数珍贵宝物的[4edaad]宝箱[-] ]],
		key=[[field_boss]],
		pichelp={},
		title=[[人形讨伐]],
	},
	forge_composite={
		content=[[[d9ceba]◆可以使用装备部位原石、附魔材料和合成粉尘，合成具有特殊效果，并且数值属性优于普通紫装的橙色装备
[d9ceba]◆合成的武器单件即有强大的效果；其他装备同附魔的衣服+腰带+鞋子激活盔甲套效果，戒指+项链激活饰品套效果
[d9ceba]◆合成的装备等级越高，消耗的各种材料越多，但技能也越强大
[d9ceba]◆高级装备可使用低级装备补充材料无损耗合成]],
		key=[[forge_composite]],
		pichelp={},
		title=[[装备打造]],
	},
	forge_composite_random_1={
		content=[[[d9ceba]◆可使用武器原石、附魔原石、合成粉尘为原料，打造50~100级的橙色强力武器。高级的装备效果系数更大。
[d9ceba]◆打造成功后根据附魔后缀获得以下强力效果：
[d9ceba]【煌】使用了单体伤害技能的回合，40%概率获得斗气buff，下回合的单体技能造成15%~45%额外伤害，持续1次行动
[d9ceba]【磐】每回合开始前，有40%概率使攻击力上升防御力的50%~160%，持续1次行动
[d9ceba]【翼】有40%概率对每个技能有效目标造成有效目标数*3%~7%额外伤害
[d9ceba]【寒】每有一个敌方单位陷入控制类异常状态，40%概率立刻对其造成25%~75%攻击力的真实伤害
[d9ceba]【狂】施放技能前40%概率使主目标抗暴率降低3%~8%，持续到其下次行动
[d9ceba]【魂】敌我有单位气血回复时，40%概率对气血比例最低的我方单位造成攻击力20%~60%的气血回复
[d9ceba]◆六种附魔效果生成概率相等。]],
		key=[[forge_composite_random_1]],
		pichelp={},
		title=[[装备打造]],
	},
	forge_composite_random_2={
		content=[[[d9ceba]◆可使用项链原石、附魔原石、合成粉尘为原料，合成50~100级的橙色套装项链。高级的装备效果系数更大。
[d9ceba]◆装备同一附魔后缀名的项链、戒指时，获得以下强力效果（同后缀名即可激活，技能等级按较低等级的装备算）：
[d9ceba]【煌】对方释放群体技能时，5%~20%概率将所受的总伤害的20%附加到自己的攻击力，持续1次行动
[d9ceba]【磐】对方使用气血回复技能时，5%~20%概率将一个单位回血效果偷走，并为气血比例最低的我方单位回复气血
[d9ceba]【翼】对方打出暴击伤害时，5%~20%概率偷走其12%暴击率，各持续1次行动
[d9ceba]【寒】我方处于嘲讽状态的单位进行普攻时，5%~20%概率伤害提升350%
[d9ceba]【狂】对方使用单体技能时，5%~20%概率将所增加的比例怒气的300%同时附加到暴击伤害，持续1次行动
[d9ceba]【魂】我方单位被附加异常状态时，5%~20%概率减少一个单位的1回合持续时间
[d9ceba]◆六种附魔效果生成概率相等。]],
		key=[[forge_composite_random_2]],
		pichelp={},
		title=[[装备打造]],
	},
	forge_composite_random_3={
		content=[[[d9ceba]◆可使用衣服原石、附魔原石、合成粉尘为原料，合成50~100级的橙色套装衣服。高级的装备效果系数更大。
[d9ceba]◆装备同一附魔后缀名的衣服、腰带、鞋子时，获得以下强力效果（同后缀名即可激活，技能等级按较低等级的装备算）：
[d9ceba]【煌】队友被攻击时，8%概率使伤害来源受到的伤害增加4%~14%，持续1次行动
[d9ceba]【磐】队友被攻击时，8%概率为其抵挡伤害，并且减伤6%~18%
[d9ceba]【翼】队友被攻击时，10%概率为自己叠加该队友的4%~12%攻击和速度
[d9ceba]【寒】队友被攻击时，4%~9%概率沉默伤害来源
[d9ceba]【狂】队友被攻击时，8%概率提高该队友和自己的5%~20%暴击率，持续1回合
[d9ceba]【魂】队友被攻击时，8%概率对一名受伤队友回复10%~25%攻击力的气血
[d9ceba]◆六种附魔效果生成概率相等。]],
		key=[[forge_composite_random_3]],
		pichelp={},
		title=[[装备打造]],
	},
	forge_composite_random_4={
		content=[[[d9ceba]◆可使用戒指原石、附魔原石、合成粉尘为原料，合成50~100级的橙色套装戒指。高级的装备效果系数更大。
[d9ceba]◆装备同一附魔后缀名的项链、腰带、戒指时，获得以下强力效果（同后缀名即可激活，技能等级按较低等级的装备算）：
[d9ceba]【煌】对方释放群体技能时，5%~20%概率将所受的总伤害的20%附加到自己的攻击力，持续1次行动
[d9ceba]【磐】对方使用气血回复技能时，5%~20%概率将一个单位回血效果偷走，并为气血比例最低的我方单位回复气血
[d9ceba]【翼】对方打出暴击伤害时，5%~20%概率偷走其12%暴击率，各持续1次行动
[d9ceba]【寒】我方处于嘲讽状态的单位进行普攻时，5%~20%概率伤害提升350%
[d9ceba]【狂】对方使用单体技能时，5%~20%概率将所增加的比例怒气的300%同时附加到暴击伤害，持续1次行动
[d9ceba]【魂】我方单位被附加异常状态时，5%~20%概率减少一个单位的1回合持续时间
[d9ceba]◆六种附魔效果生成概率相等。]],
		key=[[forge_composite_random_4]],
		pichelp={},
		title=[[装备打造]],
	},
	forge_composite_random_5={
		content=[[[d9ceba]◆可使用腰带原石、附魔原石、合成粉尘为原料，合成50~100级的橙色套装腰带。高级的装备效果系数更大。
[d9ceba]◆装备同一附魔后缀名的衣服、腰带、鞋子时，获得以下强力效果（同后缀名即可激活，技能等级按较低等级的装备算）：
[d9ceba]【煌】队友被攻击时，8%概率使伤害来源受到的伤害增加4%~14%，持续1次行动
[d9ceba]【磐】队友被攻击时，8%概率为其抵挡伤害，并且减伤6%~18%
[d9ceba]【翼】队友被攻击时，10%概率为自己叠加该队友的4%~12%攻击和速度
[d9ceba]【寒】队友被攻击时，4%~9%概率沉默伤害来源
[d9ceba]【狂】队友被攻击时，8%概率提高该队友和自己的5%~20%暴击率，持续1回合
[d9ceba]【魂】队友被攻击时，8%概率对一名受伤队友回复10%~25%攻击力的气血
[d9ceba]◆六种附魔效果生成概率相等。]],
		key=[[forge_composite_random_5]],
		pichelp={},
		title=[[装备打造]],
	},
	forge_composite_random_6={
		content=[[[d9ceba]◆可使用鞋子原石、附魔原石、合成粉尘为原料，合成50~100级的橙色套装鞋子。高级的装备效果系数更大。
[d9ceba]◆装备同一附魔后缀名的衣服、腰带、鞋子时，获得以下强力效果（同后缀名即可激活，技能等级按较低等级的装备算）：
[d9ceba]【煌】队友被攻击时，8%概率使伤害来源受到的伤害增加4%~14%，持续1次行动
[d9ceba]【磐】队友被攻击时，8%概率为其抵挡伤害，并且减伤6%~18%
[d9ceba]【翼】队友被攻击时，10%概率为自己叠加该队友的4%~12%攻击和速度
[d9ceba]【寒】队友被攻击时，4%~9%概率沉默伤害来源
[d9ceba]【狂】队友被攻击时，8%概率提高该队友和自己的5%~20%暴击率，持续1回合
[d9ceba]【魂】队友被攻击时，8%概率对一名受伤队友回复10%~25%攻击力的气血
[d9ceba]◆六种附魔效果生成概率相等。]],
		key=[[forge_composite_random_6]],
		pichelp={},
		title=[[装备打造]],
	},
	forge_exchange={
		content=[[[d9ceba]◆可以消耗附魔材料将橙色武器/装备随机转化为其他后缀。
[d9ceba]◆推荐在需要凑齐附魔套装时使用。]],
		key=[[forge_exchange]],
		pichelp={},
		title=[[装备转换]],
	},
	forge_fuwen={
		content=[[[d9ceba]◆使用淬灵云晶可对装备的淬灵属性进行重置
[d9ceba]◆重置的淬灵属性需点击“保存”后才会生效
[d9ceba]◆淬灵属性的上限与当前装备的等级相关
[d9ceba]◆替换装备会自动继承之前的装备的淬灵属性
[d9ceba]◆65级之后可拥有两套相互独立的淬灵方案]],
		key=[[forge_fuwen]],
		pichelp={},
		title=[[装备淬灵]],
	},
	forge_gem={
		content=[[[d9ceba]◆每件装备可固定镶嵌一种宝石，每10级可解锁一个宝石槽。
[d9ceba]◆替换装备后，宝石会自动无损继承到新装备之上
[d9ceba]◆3颗同级的宝石可以合成更高一级的宝石
[d9ceba]◆装备中的宝石，需要拆卸之后才能合成
[d9ceba]◆【一键镶嵌】会按照最优方案镶嵌宝石]],
		key=[[forge_gem]],
		pichelp={},
		title=[[装备宝石]],
	},
	forge_resolve={
		content=[[[d9ceba]◆可以将橙色装备分解，返还为部分合成用到的材料
[d9ceba]◆分解后将无法还原，请谨慎操作]],
		key=[[forge_resolve]],
		pichelp={},
		title=[[装备分解]],
	},
	forge_strength={
		content=[[[d9ceba]◆突破等级上限与人物等级相关。
[d9ceba]◆突破是针对装备基础属性的百分比加强，最高可突破到当前的人物等级。
[d9ceba]◆替换装备时会自动继承之前的装备的突破等级和突破属性。
[d9ceba]◆“一键突破”功能会按最优方案自动帮你分配现有的突破材料，并会优先突破当前突破等级低的装备。]],
		key=[[forge_strength]],
		pichelp={},
		title=[[装备突破]],
	},
	haoyou={
		content=[[[d9ceba]◆上线提醒仅能提醒玩家双方为[4edaad]夫妻、同盟、师徒[d9ceba]以及[4edaad]基友[d9ceba]关系的好友
◆玩家设置拒绝陌生人消息和拒绝好友申请的等级不能大于玩家自身的等级
◆当打开自动回复好友信息时，当有收到好友的信息，将会自动回复设置的内容]],
		key=[[haoyou]],
		pichelp={},
		title=[[好友设置]],
	},
	hideplayer={
		content=[[[d9ceba]◆屏蔽除自己以及队友外的其他玩家]],
		key=[[hideplayer]],
		pichelp={},
		title=[[屏蔽玩家]],
	},
	house_buff={
		content=[[[d9ceba]◆宅邸总亲密度等级为持有的所有宅邸伙伴亲密度等级总和。
[d9ceba]◆当宅邸总亲密度等级达到宅邸属性阶段所需的等级时，会开启相应的宅邸属性。
[d9ceba]◆伙伴亲密度等级可通过抚摸、娱乐、送礼等提升。
]],
		key=[[house_buff]],
		pichelp={},
		title=[[总亲密度]],
	},
	huntpartnersoul={
		content=[[[d9ceba]◆可以花费金币进行猎灵并获得御灵散件
[d9ceba]◆猎灵共有[4edaad]5[d9ceba]个档次，每次猎灵后都有一定概率激活下一个档次
[d9ceba]◆猎灵的档次越高，获得高品质御灵散件的概率也越高
[d9ceba]◆猎灵过程中会产出灵气渣，该灵气渣仅可用于出售
[d9ceba]◆可以花费[4edaad]水晶[d9ceba]直接激活第4个档次，每间隔[4edaad]24[d9ceba]小时可免费激活1次]],
		key=[[huntpartnersoul]],
		pichelp={},
		title=[[猎灵]],
	},
	mapbook={
		content=[[[8c8783]藏书分类：
[8c8783]㈠ 伙伴档案
[614c32]◆[d9ceba]图书解锁：通过任意途径（[4edaad]招募[d9ceba]、[4edaad]合成[d9ceba]等）获得某伙伴后，该伙伴会自动入籍归档，传记书籍亦会开放。
[614c32]◆[d9ceba]传记阅读：[4edaad]完成解锁条件[d9ceba]可阅读更多伙伴传记故事

[8c8783]㈡ 人物档案
[8c8783]幻灵大陆人口普查已经展开。
[614c32]◆[d9ceba]图书解锁：前往要普查的[4edaad]人物处进行挑战[d9ceba]，其旧籍档案资料就会更新。
[614c32]◆[d9ceba]传记阅读：[4edaad]人物挑战次数达到规定数量[d9ceba]，即可[4edaad]阅读人物传记[d9ceba]故事
[614c32]◆[d9ceba]通知：因馆藏数据整理的需要，分馆人物档案的人物传记书库暂停开放。

[8c8783]㈢ 御灵禁录
[8c8783]这里保存着最全面的御灵信息。
[614c32]◆[d9ceba]通知：因馆藏数据整理的需要，分馆御灵禁录的佚书书库暂停开放。

[8c8783]㈣ 世界之源
[614c32]◆[d9ceba][4edaad]达成收集[d9ceba]伙伴条件即可解锁对应地图的大事件，并获得[4edaad]奖励[d9ceba]。

]],
		key=[[mapbook]],
		pichelp={},
		title=[[图书馆管理制度]],
	},
	monsteratkcity={
		content=[[[d9ceba]◆每[4edaad]周三[d9ceba]、[4edaad]周六20:00~21:00[d9ceba]开启怪物攻城玩法。
[d9ceba]◆活动开启后，怪物会在[4edaad]断魂崖[d9ceba]（[4edaad]4,6[d9ceba])、[4edaad]枫竹林[d9ceba]（[4edaad]5，5[d9ceba]）、[4edaad]八门村[d9ceba]（[4edaad]26,9[d9ceba]）出现。
[d9ceba]◆可在[4edaad]设置[d9ceba]中勾选[4edaad]屏蔽其他玩家[d9ceba]。
[d9ceba]◆活动开启后，地图上根据波数显示不同类型的怪物。
[d9ceba]◆活动共[4edaad]10波[d9ceba]怪物，波数完成获时间结束即结束活动。
[d9ceba]◆怪物们的最终目标点为[4edaad]帝都传送圈[d9ceba]，怪物到达传送圈帝都防守值会减少。
[d9ceba]◆怪物先锋和怪物精英为优先点击的玩家可挑战。
[d9ceba]◆每次攻击怪物可获得[4edaad]奖励[d9ceba]，活动结束后，根据帝都防御值[4edaad]结算奖励[d9ceba]发邮件至所有参与活动的玩家。]],
		key=[[monsteratkcity]],
		pichelp={},
		title=[[怪物攻城]],
	},
	org_build={
		content=[[[d9ceba]◆每天可在三种建设中选择一种进行建设
◆建设可以获取[4edaad]公会经验、公会资金、公会贡献[d9ceba]以及[4edaad]签到进度[d9ceba]
◆不同的建设花费的货币和数量也所不同，请根据需要选择对应的建设方式
◆每天0点重置签到进度，请务必在重置前领取建设奖励
◆签到进度达到一定的数量时，所有公会成员可以点击获取奖励]],
		key=[[org_build]],
		pichelp={},
		title=[[公会建设]],
	},
	org_info={
		content=[[[d9ceba]◆公会经验满即可升级，升级之后公会人数上限以及管理职位人数增加
◆公会经验可以通过[4edaad]每日建设、击杀赏金头领、公会战[d9ceba]等方式获得
◆公会资金可以通过[4edaad]每日建设、击杀赏金头领、公会战[d9ceba]等方式获得
◆公会声望可以通过[4edaad]击杀赏金头领、据点战、公会战[d9ceba]等方式获得
◆公会排名根据公会的[4edaad]声望[d9ceba]进行排名
◆公会活跃度由各成员[4edaad]每日活跃度[d9ceba]累积计算，若该周内活跃度未达到要求，则下周一公会等级会下降1级
◆若公会降级时公会只有1级，则公会解散
◆创建公会的当个周期内，未达到需求的活跃度则不会降级
◆离开公会后，个人公会贡献不会变化，公会中的贡献累积会清零
◆当会长连续7天处于离线时，则会自动转让会长
◆刚加入公会为[4edaad]新人[d9ceba]职位，当贡献度达到[4edaad]360[d9ceba]点时会自动升成普通成员职位，进入公会[4edaad]2[d9ceba]天内贡献度未达到成员要求，则会被自动请离公会
◆会长和副会长每天仅能请离一定数量的成员，请离连续2天未上线的成员将不会记录次数。随着公会等级的提升，每天可请离的成员数量也提升
◆每天公会仅可发送3次邮件通告，每天0点重置次数
◆离开公会后，[4edaad]12[d9ceba]小时内无法加入公会（首次退会不会有冷却时间）]],
		key=[[org_info]],
		pichelp={},
		title=[[公会信息]],
	},
	org_tuitu={
		content=[[[d9ceba]◆副本每天可挑战[4edaad]2[d9ceba]次，每天0点重置次数
◆挑战完成后，可以获得公会贡献奖励
◆击杀当前的赏金头领，才可以解下一个赏金头领
◆每击杀一个赏金头领，都可以获取奖励
◆每周一可[4edaad]免费重置[d9ceba]1次副本，会长和副会长可以消耗公会资金重置进度
◆当天已参与过赏金战斗的伙伴无法继续出战
◆未参与过该赏金头领战斗的成员在击杀赏金头领后将不会获得奖励]],
		key=[[org_tuitu]],
		pichelp={},
		title=[[公会赏金]],
	},
	org_war={
		content=[[[d9ceba]◆公会战中，主动发起战斗、进攻\防守水晶都需要2人以上队伍。
[d9ceba]◆每个参战公会的防御水晶颜色是随机分配的。
[d9ceba]◆在准备大厅和战场中玩家，只能邀请同在准备大厅和战场中玩家，不能邀请其它地图的玩家加入队伍。
[d9ceba]◆公会战开始后，请合理安排人员，一部分队伍去攻敌方水晶，一部分队伍防御我方水晶。
[d9ceba]◆当水晶被攻击时，每秒会扣除1点气血。多支队伍同时攻击，并不会加快扣血。
[d9ceba]◆防守水晶时，会自动和敌方进攻水晶的队伍发生战斗。战斗期间，水晶不会扣血。
[d9ceba]◆战斗失败后会被踢出战场，3分钟后才能再次进入战场。
[d9ceba]◆战斗中逃跑会判定为战斗失败，会被踢出战场，同时会被踢出队伍。
[d9ceba]◆每场战斗胜利可获得丰厚奖励，战斗失败获得少量奖励。
[d9ceba]◆最终获胜公会的可获得丰厚奖励，且参战玩家可获得额外奖励。]],
		key=[[org_war]],
		pichelp={},
		title=[[公会战]],
	},
	org_wish={
		content=[[[d9ceba]◆每天每种许愿仅可许愿[4edaad]1[d9ceba]次，每天0点重置
◆根据玩家所许愿的伙伴品质不同，所许愿的碎片数量也不同
◆玩家50级开启装备材料许愿，根据玩家所许愿的装备材料类型不同，所许愿的材料数量也不同
◆当许愿需求获得其他玩家给予时，需要再次进入界面或者处于许愿界面获取奖励
◆玩家给予其他玩家伙伴碎片或者装备材料可以获取[4edaad]公会贡献[d9ceba]奖励]],
		key=[[org_wish]],
		pichelp={},
		title=[[公会许愿]],
	},
	orgmemberbuff={
		content=[[[8c8783]属性加成
[d9ceba]◆根据玩家所在公会的职位不同，对玩家属性有不同的加成。
[d9ceba]◆公会、副会长：[4edaad]攻击+5% 气血+5%
[d9ceba]◆精英：[4edaad]攻击+2% 气血+2%
[8c8783]职位数量
[d9ceba]◆随着公会等级的提升，可容纳的成员数量以及各职位数量有不同的改变
[d9ceba]◆1级公会：[4edaad]公会总人数[4edaad]100[d9ceba]人，会长[4edaad]1[d9ceba]名、副会长[4edaad]1[d9ceba]名、精英[4edaad]6[d9ceba]名
[d9ceba]◆2级公会：[4edaad]公会总人数[4edaad]125[d9ceba]人，会长[4edaad]1[d9ceba]名、副会长[4edaad]1[d9ceba]名、精英[4edaad]8[d9ceba]名
[d9ceba]◆3级公会：[4edaad]公会总人数[4edaad]150[d9ceba]人，会长[4edaad]1[d9ceba]名、副会长[4edaad]1[d9ceba]名、精英[4edaad]10[d9ceba]名
[d9ceba]◆4级公会：[4edaad]公会总人数[4edaad]175[d9ceba]人，会长[4edaad]1[d9ceba]名、副会长[4edaad]2[d9ceba]名、精英[4edaad]12[d9ceba]名
[d9ceba]◆5级公会：[4edaad]公会总人数[4edaad]200[d9ceba]人，会长[4edaad]1[d9ceba]名、副会长[4edaad]2[d9ceba]名、精英[4edaad]14[d9ceba]名]],
		key=[[orgmemberbuff]],
		pichelp={},
		title=[[成员信息]],
	},
	parequip_stone={
		content=[[[d9ceba]◆消耗对应[4edaad]符石[d9ceba]可提升符文的符石属性，强化后符石则消失
[d9ceba]◆不同部位的符文仅能使用对应类型的符石进行强化
[d9ceba]◆不同等级的符石随着[4edaad]符文星级[d9ceba]的提高而逐渐[4edaad]解锁[d9ceba]
[d9ceba]◆不同等级的符石可强化的数量也不同，等级越高可强化的数量也越多
[d9ceba]◆符文的[4edaad]颜色[d9ceba]会随着符石强化的[4edaad]进度[d9ceba]对应改变]],
		key=[[parequip_stone]],
		pichelp={},
		title=[[符石强化]],
	},
	parequip_upgrade={
		content=[[[d9ceba]◆消耗[4edaad]深蓝琥珀[d9ceba]可提升符文的等级，升级后可提升符文属性
[d9ceba]◆符文最大等级为[4edaad]10[d9ceba]级，达到最大等级之后，必须进行[4edaad]升星[d9ceba]后才能继续进行升级强化
[d9ceba]◆符文的等级和星级越高，每次升级所需要的深蓝琥珀也越多]],
		key=[[parequip_upgrade]],
		pichelp={},
		title=[[符文升级]],
	},
	parequip_upstar={
		content=[[[d9ceba]◆消耗对应[4edaad]云母[d9ceba]可提升符文的星级
[d9ceba]◆符文升星后可[4edaad]提升符文属性[d9ceba]、[4edaad]重置符文的强化等级[d9ceba]以及[4edaad]解锁一条符石的强化[d9ceba]
[d9ceba]◆符文必须达到[4edaad]10[d9ceba]级才可进行升星
[d9ceba]◆符文最大星级[4edaad]6[d9ceba]星，达到最大星级后则无法继续升星]],
		key=[[parequip_upstar]],
		pichelp={},
		title=[[符文升星]],
	},
	parsoul_upgrade={
		content=[[[d9ceba]◆吞食其他[4edaad]御灵散件[d9ceba]可提升散件的等级，升级后可提高散件的属性
[d9ceba]◆御灵散件的品质越高、升级所需经验也越高、每级提升的属性也越高
[d9ceba]◆御灵散件最大等级为[4edaad]15[d9ceba]级，达到满级后则无法强化
[d9ceba]◆吞食已强化的御散件，可[4edaad]无损继承[d9ceba]该御灵散件中已包含的经验]],
		key=[[parsoul_upgrade]],
		pichelp={},
		title=[[御灵升级]],
	},
	parstone_compose={
		content=[[[d9ceba]◆同类型同等级的符石可以通过合成提升符石的等级
[d9ceba]◆符石合成的比例为[4edaad]3合1[d9ceba]，合成率[4edaad]100%[d9ceba]
[d9ceba]◆符石最大等级为[4edaad]7[d9ceba]级，已达到最大等级的符石无法继续合成]],
		key=[[parstone_compose]],
		pichelp={},
		title=[[符石合成]],
	},
	partner_awake={
		content=[[[d9ceba]◆伙伴觉醒后，可以大幅增加伙伴的属性以及获得对应的觉醒消耗
[d9ceba]◆每个伙伴仅可进行[4edaad]1[d9ceba]次觉醒
[d9ceba]◆不同的伙伴消耗的觉醒材料和金币也不同
[d9ceba]◆伙伴觉醒后，可以获得该伙伴的觉醒皮肤]],
		key=[[partner_awake]],
		pichelp={},
		title=[[伙伴觉醒]],
	},
	partner_equip={
		content=[[[8c8783]符文基础
[d9ceba]◆每个伙伴可佩带[4edaad]4[d9ceba]件符文，不同部位的符文提供的属性不一样
[d9ceba]◆符文可通过升级、升星的方式提高主属性，也可以吞食对应的符石提高符石属性
[d9ceba]◆符文通过[4edaad]金币购买[d9ceba]，购买得到的符文默认为1星1级
[d9ceba]◆若出售[4edaad]已进行强化[d9ceba]的符文，则出售后强化消耗的材料不会返回
[8c8783]符文升级
[d9ceba]◆消耗[4edaad]深蓝琥珀[d9ceba]可提升符文的等级，升级后可提升符文属性
[d9ceba]◆符文最大等级为[4edaad]10[d9ceba]级，达到最大等级之后，必须进行[4edaad]升星[d9ceba]后才能继续进行升级强化
[d9ceba]◆符文的等级和星级越高，每次升级所需要的深蓝琥珀也越多
[8c8783]符文升星
[d9ceba]◆消耗对应[4edaad]云母[d9ceba]可提升符文的星级
[d9ceba]◆符文升星后可[4edaad]提升符文属性[d9ceba]、[4edaad]重置符文的强化等级[d9ceba]以及[4edaad]解锁高级符石的强化[d9ceba]
[d9ceba]◆符文必须达到[4edaad]10[d9ceba]级才可进行升星
[d9ceba]◆符文最大星级[4edaad]6[d9ceba]星，达到最大星级后则无法继续升星
[8c8783]符石强化
[d9ceba]◆消耗对应[4edaad]符石[d9ceba]可提升符文的符石属性，强化后符石则消失
[d9ceba]◆不同部位的符文仅能使用对应类型的符石进行强化
[d9ceba]◆不同等级的符石随着[4edaad]符文星级[d9ceba]的提高而逐渐[4edaad]解锁[d9ceba]
[d9ceba]◆不同等级的符石可强化的数量也不同，等级越高可强化的数量也越多
[d9ceba]◆符文的[4edaad]颜色[d9ceba]会随着符石强化的[4edaad]进度[d9ceba]对应改变]],
		key=[[partner_equip]],
		pichelp={},
		title=[[伙伴符文]],
	},
	partner_hire={
		content=[[[d9ceba]◆通过消耗[4edaad]金币[d9ceba]或[4edaad]荣誉[d9ceba]直接招募伙伴
[d9ceba]◆可招募的伙伴仅可进行[4edaad]1[d9ceba]次招募，招募之后无法继续招募
[d9ceba]◆若招募时已拥有该伙伴，则招募的伙伴自动转换成碎片获取
[d9ceba]◆个别伙伴的有[4edaad]特殊[d9ceba]的获取方式，完成对应的内容即可获得该伙伴]],
		key=[[partner_hire]],
		pichelp={},
		title=[[招募]],
	},
	partner_rank={
		content=[[[d9ceba]◆伙伴排行榜刷新周期为1小时，刷新后按照伙伴战力进行排名。
[d9ceba]◆周一0点刷新排行榜后，战力排名第1的伙伴可获得专属称号，称号持续一周。
]],
		key=[[partner_rank]],
		pichelp={},
		title=[[伙伴排行榜]],
	},
	partner_soul={
		content=[[[d9ceba]◆御灵分为2个部分，分别是[4edaad]核心[d9ceba]和[4edaad]散件[d9ceba]
[d9ceba]◆御灵核心提供核心效果，每个伙伴可任意使用一种核心
[d9ceba]◆御灵散件可提供属性效果，穿戴对应的核心才可穿戴散件
[d9ceba]◆御灵散件穿戴个数随着主角等级的提升逐渐开启
[d9ceba]◆可通过点击[4edaad]快速装备[d9ceba]快速切换核心和散件的穿戴]],
		key=[[partner_soul]],
		pichelp={
			[1]=[[pic_rukou_yuanhua_7;点击添加御灵核心]],
			[2]=[[pic_rukou_yuanhua_8;选择相应的核心后点击确定]],
			[3]=[[pic_rukou_yuanhua_9;选择快速装备就穿戴好啦喵！]],
			[4]=[[pic_rukou_yuanhua_10;没有御灵可以点击这里前往获取！]],
		},
		title=[[伙伴御灵]],
	},
	partner_upgrade={
		content=[[[d9ceba]◆消耗[4edaad]鲜肉包[d9ceba]可提升伙伴的等级，升级后可提升伙伴属性
[d9ceba]◆伙伴等级不能超过主角等级[4edaad]5[d9ceba]级，大于5级的伙伴无法获得伙伴经验
[d9ceba]◆可以点击[4edaad]升一级[d9ceba]和[4edaad]升五级[d9ceba]快速提高伙伴的等级]],
		key=[[partner_upgrade]],
		pichelp={},
		title=[[伙伴升级]],
	},
	partner_upskill={
		content=[[[d9ceba]◆消耗[4edaad]焦糖包[d9ceba]可提升伙伴的技能等级
[d9ceba]◆每次提升将会随机选择一个已解锁且未满级的技能提升[4edaad]1[d9ceba]级
[d9ceba]◆不同的伙伴升级技能消耗的焦糖包的数量也不同]],
		key=[[partner_upskill]],
		pichelp={},
		title=[[伙伴升技]],
	},
	partner_upstar={
		content=[[[d9ceba]◆消耗[4edaad]同名伙伴碎片[d9ceba]可提升伙伴的星级，升星后可提升伙伴属性
[d9ceba]◆伙伴最大星级为[4edaad]5[d9ceba]星，达到最大星级时则无法升星
[d9ceba]◆不同星级需要达到对应的等级。伙伴升至[4edaad]2/3/4/5[d9ceba]星需要伙伴达到[4edaad]20/30/40/50[d9ceba]级
[d9ceba]◆不同星级升星所需要的碎片数量也会提高，伙伴升[4edaad]2/3/4/5[d9ceba]星需要同名碎片[4edaad]20/50/120/220[d9ceba]个]],
		key=[[partner_upstar]],
		pichelp={},
		title=[[伙伴升星]],
	},
	pata_main={
		content=[[[8c8783]战斗规则
[614c32]◆[d9ceba]地牢共100层，成功击杀怪物，才可通关至下一层。
[614c32]◆[d9ceba]逃跑或战斗失败均判定为失败。
[614c32]◆[d9ceba]伙伴血条不会重置，主角血条每层重置。
[614c32]◆[d9ceba]上一层死亡的伙伴，下一层无法使用。
[8c8783]其他规则
[614c32]◆[d9ceba]每天可[4edaad]重置1次[d9ceba]，次数在次日[4edaad]0点[d9ceba]重置。
[614c32]◆[d9ceba]重置后，所有伙伴血条重置，死亡伙伴也可复活。
[614c32]◆[d9ceba]重置后，可进行扫荡，规定时间后直接获得奖励。
[614c32]◆[d9ceba]每天可[4edaad]邀请3次好友伙伴[d9ceba]参与助战，[4edaad]次日0点重置[d9ceba]。
[8c8783]奖励规则
[614c32]◆[d9ceba]每成功通关一层，即可获得通关奖励。
[614c32]◆[d9ceba]每层首通可获得[4edaad]首通奖励[d9ceba]，点击左上方宝箱查看。
[614c32]◆[d9ceba]奖励中有[4edaad]地牢勋章[d9ceba]，地牢勋章可在[4edaad]商店兑换道具[d9ceba]。
[8c8783]排行榜规则
[614c32]◆[d9ceba]根据地牢层数进行排行。]],
		key=[[pata_main]],
		pichelp={},
		title=[[[fefbc8]地牢]],
	},
	pefuben_droplist={
		content=[[[d9ceba]◆周一至周五，可以查看本日御灵副本将会产出的对应御灵散件。
[d9ceba]◆周六、周日，可以选择周一至周五的一套御灵掉落方案。未选择时则由系统随机给予一套掉落方案。
[d9ceba]◆点击御灵图标，可以看到御灵核心效果。]],
		key=[[pefuben_droplist]],
		pichelp={},
		title=[[御灵副本]],
	},
	pefuben_info={
		content=[[[d9ceba]◆御灵副本产出大量[4edaad]伙伴御灵[d9ceba]，是个性化伙伴战斗方式的重要手段。
[d9ceba]◆御灵副本共[4edaad]10层[d9ceba]，通关一层后解锁下一层。越高级的副本产出的御灵星级越高。
[d9ceba]◆每次通关御灵副本消耗[4edaad]12体力[d9ceba]，未能通关则消耗[4edaad]3体力[d9ceba]。进入副本前，转动转盘，接下来的副本战斗通关后必定获得一件指针所指的套装和部位。
[d9ceba]◆每次攻击副本前，转动转盘免费，再次转动则需要消耗金币，所需金币与通关层数有关。
[d9ceba]◆御灵副本通关后根据存活单位数和使用回合数评定星级，三星后开启当层扫荡功能，每次扫荡消耗2扫荡券，终身卡特权免费扫荡。
[d9ceba]◆周一至周五，副本固定产出六套套装的御灵，亦可使用水晶选择其他方案，选择方案后本日有效，所需水晶与当前通关层数有关；周六、日，可以免费选择周一至周五的一套掉落方案。点击“查看掉落组”按钮了解更多信息。]],
		key=[[pefuben_info]],
		pichelp={},
		title=[[御灵副本]],
	},
	qqvip={
		content=[[[d9ceba]◆新手礼包：[4edaad]388#w2[d9ceba]，[4edaad]60#tl[d9ceba]，[4edaad]5万#w1[d9ceba]。
[d9ceba]◆超级会员礼包：[4edaad]888#w2[d9ceba]，[4edaad]120#tl[d9ceba]，[4edaad]15万#w1[d9ceba]。
[d9ceba]◆开通/续费超级会员礼包：
      [4edaad]灵魂钥匙X5[d9ceba]，[4edaad]240#tl[d9ceba]，[4edaad]30万#w1[d9ceba]。
[d9ceba]◆QQ超级会员礼包1：
      [4edaad]称号：不做大多数[d9ceba]，[4edaad]688#w2[d9ceba]，[4edaad]5万#w1[d9ceba]。
[d9ceba]◆QQ超级会员礼包2：
      [4edaad]一发入魂碎片X5[d9ceba]，[4edaad]万能碎片X2[d9ceba]，[4edaad]10万#w1[d9ceba]。]],
		key=[[qqvip]],
		pichelp={},
		title=[[腾讯福利礼包]],
	},
	question_answer={
		content=[[[8c8783]参与条件
[614c32]◆[d9ceba]玩家角色达到[4edaad]36级[d9ceba]
[614c32]◆[d9ceba]每周一、三、五、日的[4edaad]12:00-12:10[d9ceba]为活动[4edaad]报名[d9ceba]准备[4edaad]时间[d9ceba]；
[614c32]◆[d9ceba]只有在准备时间内，[4edaad]点击屏幕下方[d9ceba]喵小萌对话框并成功报名的玩家才可以正式参加活动
[614c32]◆[d9ceba]12:11分活动正式开始
[614c32]◆[d9ceba]共20道题
[8c8783]金币奖励
[614c32]◆[4edaad]回答正确[d9ceba]即可获得基础金币，
[614c32]◆[4edaad]抢答第一[d9ceba]额外获得200%的金币
[614c32]◆[d9ceba]每[4edaad]连续答对[d9ceba]1题，金币奖励增加2.5%，可叠加
[614c32]◆[d9ceba]回答错误可以重新答题，但连续答对题数清零
[8c8783]积分奖励
[614c32]◆[d9ceba]每正确回答一道题，获得100积分
[614c32]◆[d9ceba]前5秒内作答并回答正确，可额外获得50积分
[614c32]◆[d9ceba]前10名回答正确者，依次额外获得100-10积分
[614c32]◆[d9ceba]最终根据积分排行高低获得不同奖励]],
		key=[[question_answer]],
		pichelp={},
		title=[[学渣的逆袭]],
	},
	rewardback={
		content=[[[d9ceba]◆可以找回部分昨日未完成的活动的奖励。
[d9ceba]◆使用免费找回，可以获得一半的奖励；使用水晶找回，可以获得全额的奖励。]],
		key=[[rewardback]],
		pichelp={},
		title=[[奖励找回]],
	},
	richenghuoyue={
		content=[[[8c8783]副本
[d9ceba]◆可以独行独立，也可以成群结队，这就是战力成长重要途径。
[8c8783]挑战
[d9ceba]◆突破自我，挑战更高的成就，一帮实力彪悍的匪徒正凝视着你。
[8c8783]休闲
[d9ceba]◆轻轻松松涨经验，快快乐乐拿道具。
[8c8783]限时活动
[d9ceba]◆只在限定时间开启的活动，把握时机才能赢得世界。
[8c8783]活跃任务
[d9ceba]◆每天随机刷出13种任务，完成任务可获取[4edaad]经验[d9ceba]和[4edaad]精美奖励[d9ceba]。
[8c8783]活跃度兑换
[d9ceba]◆每天获得的活跃度会在商店活跃度标签中积累，积累后可兑换[4edaad]稀有道具[d9ceba]。
]],
		key=[[richenghuoyue]],
		pichelp={},
		title=[[活跃]],
	},
	richengxitong={
		content=[[[8c8783]副本
[d9ceba]◆可以独行独立，也可以成群结队，这就是战力成长重要途径。
[8c8783]挑战
[d9ceba]◆突破自我，挑战更高的成就，一帮实力彪悍的匪徒正凝视着你。
[8c8783]休闲
[d9ceba]◆轻轻松松涨经验，快快乐乐拿道具。
[8c8783]限时活动
[d9ceba]◆只在限定时间开启的活动，把握时机才能赢得世界。
[8c8783]活跃任务
[d9ceba]◆每天随机刷出13种任务，完成任务可获取[4edaad]经验[d9ceba]和[4edaad]精美奖励[d9ceba]。
[8c8783]活跃度兑换
[d9ceba]◆每天获得的活跃度会在商店活跃度标签中积累，积累后可兑换[4edaad]稀有道具[d9ceba]。
]],
		key=[[richengxitong]],
		pichelp={},
		title=[[冒险]],
	},
	scene_exam={
		content=[[[8c8783]参与条件
[614c32]◆[d9ceba]玩家角色达到[4edaad]36级[d9ceba]
[614c32]◆[d9ceba]每周二、四、六的[4edaad]12:00-12:10[d9ceba]为活动[4edaad]报名[d9ceba]准备[4edaad]时间[d9ceba]；
[614c32]◆[d9ceba]只有在准备时间内，[4edaad]点击屏幕下方[d9ceba]喵小萌对话框并成功报名的玩家才可以正式参加活动
[614c32]◆[d9ceba]报名成功后，请[4edaad]尽快进场[d9ceba]，活动将在规定场地进行
[614c32]◆[d9ceba]12:11分活动正式开始
[8c8783]玩法介绍
[614c32]◆[d9ceba]共20条题目
[614c32]◆[d9ceba]活动开始，[4edaad]点击题目选项[d9ceba]可移动到固定判断区
[614c32]◆[d9ceba]直接[4edaad]点击地面[d9ceba]，也可以移动到所选地点
[614c32]◆[4edaad]每条题目倒计时结束，根据所站立的区域判断对错
[614c32]◆[4edaad]中立区的玩家将被判断为“回答错误”
[8c8783]金币奖励
[614c32]◆[4edaad]回答正确[d9ceba]即可获得基础金币
[614c32]◆[d9ceba]每[4edaad]连续答对[d9ceba]1题，金币奖励增加2.5%，可叠加
[8c8783]积分奖励
[614c32]◆[d9ceba]每正确回答一道题，获得100积分
[614c32]◆[d9ceba]每[4edaad]连续答对[d9ceba]1题，积分增加5%，无叠加上限
[614c32]◆[d9ceba]最终根据积分排行高低获得不同奖励]],
		key=[[scene_exam]],
		pichelp={},
		title=[[学霸去哪儿]],
	},
	shijieboss={
		content=[[[d9ceba]◆周一、二、四、五[4edaad]20:00[d9ceba]，BOSS将会出现在封印之地
[d9ceba]◆全服共享BOSS血条
[d9ceba]◆每人每日可讨伐BOSS[4edaad]3次[d9ceba]，但是每日在讨伐BOSS中倒下的伙伴不能再上场
[d9ceba]◆BOSS会把最好的奖励留给伤害他最深的人们，另外在最后打败BOSS的勇士也有幸运大奖
[d9ceba]◆若[4edaad]21:00[d9ceba]前成功消灭BOSS，所有参与击杀者获得额外击杀奖励
[d9ceba]◆BOSS被消灭一定次数后，下次回来时会变得更加强大，做好准备吧！]],
		key=[[shijieboss]],
		pichelp={},
		title=[[封印之地]],
	},
	teaart={
		content=[[[8c8783]厨艺属性
[614c32]◆[d9ceba]玩家每次进行料理即可获得料理经验。
[614c32]◆[d9ceba]料理经验饱满后，可升厨艺等级。
[8c8783]料理台开启
[614c32]◆[d9ceba]根据宅邸伙伴数量会开启新的料理台。
[614c32]◆[d9ceba]初始默认开启1个料理台。
[614c32]◆[d9ceba]宅邸伙伴数量4个开启第二个，宅邸总亲密度达到80级开启第三个。
[8c8783]礼物开启
[614c32]◆[d9ceba]根据玩家厨艺等级可解锁新的料理。
[614c32]◆[d9ceba]每次进行料理，玩家可在解锁的料理中随机获得料理。
[614c32]◆[d9ceba]料理完成后，礼物会直接进入伙伴送礼界面。
[614c32]◆[d9ceba]根据礼物不同，获得的亲密度也会不同。
[8c8783]好友料理
[614c32]◆[d9ceba]游戏好友可在我的料理台进行料理。
[614c32]◆[d9ceba]可帮好友进行料理加速。
[614c32]◆[d9ceba]好友料理完成后，好友获得料理，玩家可获得奖励。
[614c32]◆[d9ceba]奖励会发送至邮件。]],
		key=[[teaart]],
		pichelp={},
		title=[[[fefbc8]料理台提示]],
	},
	team_arena={
		content=[[[d9ceba]◆每周六、周日晚21:00~22:00开启协同比武，活动开启[4edaad]前10分钟[d9ceba]可[4edaad]提前[d9ceba]进入场景
[d9ceba]◆可两人提前组队进入场景中，也可在场景中寻找合适的队友
[d9ceba]◆若两人组队匹配成功后，则两人为队友一起战斗。若[4edaad]单人匹配[d9ceba]，则随机匹配一名队友
[d9ceba]◆在协同比武战斗中，每人同一场战斗中最多可上阵[4edaad]2[d9ceba]名伙伴，请合理搭配
[d9ceba]◆每场战斗结束后，都可以获得一定的奖励，胜利的一方还可以获得[4edaad]积分[d9ceba]奖励，失败的一方将不会有积分奖励
[d9ceba]◆当失败场数累计到[4edaad]10[d9ceba]场时，则会被自动请离出场景且无法参与今天的协同比武活动
[d9ceba]◆在活动期间，玩家在协同比武中完成[4edaad]累计胜场[d9ceba]达到[4edaad]1/3/5/10[d9ceba]以及[4edaad]连胜场数[d9ceba]达到[4edaad]3/5/10[d9ceba]等，都可以获得[4edaad]额外奖励[d9ceba]
[d9ceba]◆活动结束后，根据此次活动的排名可以领取对应的奖励，[4edaad]积分相同[d9ceba]时，则领取该积分[4edaad]最高[4edaad]的排名奖励。]],
		key=[[team_arena]],
		pichelp={},
		title=[[协同比武]],
	},
	teampvp_rank={
		content=[[[d9ceba]◆每周六、周日晚21:00~22:00开启协同比武，活动开启[4edaad]前10分钟[d9ceba]可[4edaad]提前[d9ceba]进入场景
[d9ceba]◆可两人提前组队进入场景中，也可在场景中寻找合适的队友
[d9ceba]◆若两人组队匹配成功后，则两人为队友一起战斗。若[4edaad]单人匹配[d9ceba]，则随机匹配一名队友
[d9ceba]◆在协同比武战斗中，每人同一场战斗中最多可上阵[4edaad]2[d9ceba]名伙伴，请合理搭配
[d9ceba]◆每场战斗结束后，都可以获得一定的奖励，胜利的一方还可以获得[4edaad]积分[d9ceba]奖励，失败的一方将不会有积分奖励
[d9ceba]◆当失败场数累计到[4edaad]10[d9ceba]场时，则会被自动请离出场景且无法参与今天的协同比武活动
[d9ceba]◆在活动期间，玩家在协同比武中完成[4edaad]累计胜场[d9ceba]达到[4edaad]1/3/5/10[d9ceba]以及[4edaad]连胜场数[d9ceba]达到[4edaad]3/5/10[d9ceba]等，都可以获得[4edaad]额外奖励[d9ceba]
[d9ceba]◆计分板中最多可显示排名前50的玩家，50名以外的玩家则显示为榜外
[d9ceba]◆活动结束后，根据此次活动的排名可以领取对应的奖励，[4edaad]积分相同[d9ceba]时，则领取该积分[4edaad]最高[4edaad]的排名奖励。]],
		key=[[teampvp_rank]],
		pichelp={},
		title=[[协同比武排行]],
	},
	tequanka={
		content=[[[8c8783]特权详情：
◆多处特权标识显示，尽显尊贵身份
◆每日提供额外探索点数25点
◆游戏内商城购买道具85折优惠
◆每月可额外获得3次补签机会
◆小幅度欧气加成
◆每周可获得1张星象图
◆每天获得100水晶赠送
◆符文副本每日可获得一次额外抽取机会]],
		key=[[tequanka]],
		pichelp={},
		title=[[终身特权卡]],
	},
	terrawar_map={
		content=[[[8c8783]开启时间：
[614c32]◆[4edaad]开服第三天[d9ceba]开启，活动持续3天。活动结束后间隔4天开启下一轮。
[8c8783]战斗条件：
[614c32]◆[d9ceba]玩法开启后，地图上显示据点，据点初始为无领主状态。
[614c32]◆[d9ceba]玩家等级[4edaad]>=15级[d9ceba]，且有公会的玩家。
[614c32]◆[d9ceba]玩家拥有[4edaad]3个或3个以上>=20级的伙伴[d9ceba]可进行攻击据点。
[614c32]◆[d9ceba]相同伙伴无法同时驻守两个据点。
[614c32]◆[d9ceba]每次进行占领、攻击或支援会消耗[4edaad]1灵力[d9ceba]。
[614c32]◆[d9ceba]灵力上限为[4edaad]10灵力[d9ceba]，玩法开始系统默认提供10灵力，每小时回复1灵力，[4edaad]可购买灵力[d9ceba]。
[8c8783]进攻据点&防守：
[614c32]◆[d9ceba]地图上移动且点击非友方占领的据点即可完成进攻操作。
[614c32]◆[d9ceba]进攻方击败据点中防守方的驻守伙伴后才能占领据点。
[614c32]◆[d9ceba]双方战斗前有[4edaad]30秒[d9ceba]的准备时间，准备时间内防守方可选择加入该战斗。
[8c8783]战斗介绍：
[614c32]◆[d9ceba]双方出战队伍按照到达据点攻击或支援的时间进行排序。
[614c32]◆[d9ceba]根据排列顺序进行单支队伍对决。
[614c32]◆[d9ceba]战斗中新加入的队伍，按照攻击或支援时间排序加入战斗队列。
[614c32]◆[d9ceba]排队队列支援方最多可排6队，攻击方最多排5队。
[614c32]◆[d9ceba]主角可支援自己，如主角不支援，支援方与攻击方相同，排5队。
[614c32]◆[d9ceba]当一支队伍被消灭后，进入30秒的倒计时，胜利方继续出战，失败方出战下一支队伍。
[614c32]◆[d9ceba]胜利方保存剩余血量进入下一场战斗，已死亡的英雄将无法进行战斗。
[614c32]◆[d9ceba]据点归属判定以一方队列出战全部失败，胜利方获得占领据点权。
[614c32]◆[d9ceba]据点发生战斗后，点击据点会显示‘观战’按钮，可进入观战。
[614c32]◆[d9ceba]占领据点后，会有[4edaad]15分钟[d9ceba]的保护时间。
[614c32]◆[d9ceba]战斗结束后，占领者会保存剩余血量，根据分为单位进行回复。
[8c8783]据点收益：
[614c32]◆[d9ceba]据点大小不同，获得收益不同。
[614c32]◆[d9ceba]据点每分钟会产出[4edaad]公会积分[d9ceba]、[4edaad]个人积分[d9ceba]和[4edaad]贡献[d9ceba]。
[614c32]◆[d9ceba]随着占领时间的变久，据点收益会下降。
[614c32]◆[d9ceba]每次进行占领、攻击、支援都可获得公会积分、个人积分和贡献。
[8c8783]区域暴升：
[614c32]◆[d9ceba]占领连线成三角形的三个区域的据点，即可触发[4edaad]区域暴升效果[d9ceba]。
[614c32]◆[d9ceba]区域暴升效果触发后，区域周边的[4edaad]据点收益会加成[d9ceba]。
[8c8783]排行榜：
[614c32]◆[d9ceba]活动结束后，根据整体公会积分排名发放[4edaad]公会奖励[d9ceba]。
[614c32]◆[d9ceba]活动结束后，根据个人积分排名发放公会[4edaad]内部奖励[d9ceba]。
]],
		key=[[terrawar_map]],
		pichelp={
			[1]=[[pic_rukou_yuanhua_13;初始据点都为无领主状态]],
			[2]=[[pic_rukou_yuanhua_14;点击无领主据点可查看详情及前往寻路该据点]],
			[3]=[[pic_rukou_yuanhua_17;点击无领主据点可进行占领]],
			[4]=[[pic_rukou_yuanhua_18;只需3个20级以上伙伴就可占领喵]],
			[5]=[[pic_rukou_yuanhua_15;已被占领的据点，点击可攻击]],
			[6]=[[pic_rukou_yuanhua_16;与你最强大的伙伴一起战斗吧喵！]],
			[7]=[[pic_rukou_yuanhua_19;占领三角区域还会大幅增加贡献和积分哦！]],
		},
		title=[[[fefbc8]据点攻防战规则]],
	},
	terrawar_mine={
		content=[[[8c8783]开启时间：
[614c32]◆[4edaad]开服第三天[d9ceba]开启，活动持续3天。活动结束后间隔4天开启下一轮。
[8c8783]战斗条件：
[614c32]◆[d9ceba]玩法开启后，地图上显示据点，据点初始为无领主状态。
[614c32]◆[d9ceba]玩家等级[4edaad]>=15级[d9ceba]，且有公会的玩家。
[614c32]◆[d9ceba]玩家拥有[4edaad]3个或3个以上>=20级的伙伴[d9ceba]可进行攻击据点。
[614c32]◆[d9ceba]相同伙伴无法同时驻守两个据点。
[614c32]◆[d9ceba]每次进行占领、攻击或支援会消耗[4edaad]1灵力[d9ceba]。
[614c32]◆[d9ceba]灵力上限为[4edaad]10灵力[d9ceba]，玩法开始系统默认提供10灵力，每小时回复1灵力，[4edaad]可购买灵力[d9ceba]。
[8c8783]进攻据点&防守：
[614c32]◆[d9ceba]地图上移动且点击非友方占领的据点即可完成进攻操作。
[614c32]◆[d9ceba]进攻方击败据点中防守方的驻守伙伴后才能占领据点。
[614c32]◆[d9ceba]双方战斗前有[4edaad]30秒[d9ceba]的准备时间，准备时间内防守方可选择加入该战斗。
[8c8783]战斗介绍：
[614c32]◆[d9ceba]双方出战队伍按照到达据点攻击或支援的时间进行排序。
[614c32]◆[d9ceba]根据排列顺序进行单支队伍对决。
[614c32]◆[d9ceba]战斗中新加入的队伍，按照攻击或支援时间排序加入战斗队列。
[614c32]◆[d9ceba]排队队列支援方最多可排6队，攻击方最多排5队。
[614c32]◆[d9ceba]主角可支援自己，如主角不支援，支援方与攻击方相同，排5队。
[614c32]◆[d9ceba]当一支队伍被消灭后，进入30秒的倒计时，胜利方继续出战，失败方出战下一支队伍。
[614c32]◆[d9ceba]胜利方保存剩余血量进入下一场战斗，已死亡的英雄将无法进行战斗。
[614c32]◆[d9ceba]据点归属判定以一方队列出战全部失败，胜利方获得占领据点权。
[614c32]◆[d9ceba]据点发生战斗后，点击据点会显示‘观战’按钮，可进入观战。
[614c32]◆[d9ceba]占领据点后，会有[4edaad]15分钟[d9ceba]的保护时间。
[614c32]◆[d9ceba]战斗结束后，占领者会保存剩余血量，根据分为单位进行回复。
[8c8783]据点收益：
[614c32]◆[d9ceba]据点大小不同，获得收益不同。
[614c32]◆[d9ceba]据点每分钟会产出[4edaad]公会积分[d9ceba]、[4edaad]个人积分[d9ceba]和[4edaad]贡献[d9ceba]。
[614c32]◆[d9ceba]随着占领时间的变久，据点收益会下降。
[614c32]◆[d9ceba]每次进行占领、攻击、支援都可获得公会积分、个人积分和贡献。
[8c8783]区域暴升：
[614c32]◆[d9ceba]占领连线成三角形的三个区域的据点，即可触发[4edaad]区域暴升效果[d9ceba]。
[614c32]◆[d9ceba]区域暴升效果触发后，区域周边的[4edaad]据点收益会加成[d9ceba]。
[8c8783]排行榜：
[614c32]◆[d9ceba]活动结束后，根据整体公会积分排名发放[4edaad]公会奖励[d9ceba]。
[614c32]◆[d9ceba]活动结束后，根据个人积分排名发放公会[4edaad]内部奖励[d9ceba]。
]],
		key=[[terrawar_mine]],
		pichelp={},
		title=[[[fefbc8]据点攻防战规则]],
	},
	terrawar_orgrank={
		content=[[[8c8783]开启时间：
[614c32]◆[4edaad]开服第三天[d9ceba]开启，活动持续3天。活动结束后间隔4天开启下一轮。
[8c8783]战斗条件：
[614c32]◆[d9ceba]玩法开启后，地图上显示据点，据点初始为无领主状态。
[614c32]◆[d9ceba]玩家等级[4edaad]>=15级[d9ceba]，且有公会的玩家。
[614c32]◆[d9ceba]玩家拥有[4edaad]3个或3个以上>=20级的伙伴[d9ceba]可进行攻击据点。
[614c32]◆[d9ceba]相同伙伴无法同时驻守两个据点。
[614c32]◆[d9ceba]每次进行占领、攻击或支援会消耗[4edaad]1灵力[d9ceba]。
[614c32]◆[d9ceba]灵力上限为[4edaad]10灵力[d9ceba]，玩法开始系统默认提供10灵力，每小时回复1灵力，[4edaad]可购买灵力[d9ceba]。
[8c8783]进攻据点&防守：
[614c32]◆[d9ceba]地图上移动且点击非友方占领的据点即可完成进攻操作。
[614c32]◆[d9ceba]进攻方击败据点中防守方的驻守伙伴后才能占领据点。
[614c32]◆[d9ceba]双方战斗前有[4edaad]30秒[d9ceba]的准备时间，准备时间内防守方可选择加入该战斗。
[8c8783]战斗介绍：
[614c32]◆[d9ceba]双方出战队伍按照到达据点攻击或支援的时间进行排序。
[614c32]◆[d9ceba]根据排列顺序进行单支队伍对决。
[614c32]◆[d9ceba]战斗中新加入的队伍，按照攻击或支援时间排序加入战斗队列。
[614c32]◆[d9ceba]排队队列支援方最多可排6队，攻击方最多排5队。
[614c32]◆[d9ceba]主角可支援自己，如主角不支援，支援方与攻击方相同，排5队。
[614c32]◆[d9ceba]当一支队伍被消灭后，进入30秒的倒计时，胜利方继续出战，失败方出战下一支队伍。
[614c32]◆[d9ceba]胜利方保存剩余血量进入下一场战斗，已死亡的英雄将无法进行战斗。
[614c32]◆[d9ceba]据点归属判定以一方队列出战全部失败，胜利方获得占领据点权。
[614c32]◆[d9ceba]据点发生战斗后，点击据点会显示‘观战’按钮，可进入观战。
[614c32]◆[d9ceba]占领据点后，会有[4edaad]15分钟[d9ceba]的保护时间。
[614c32]◆[d9ceba]战斗结束后，占领者会保存剩余血量，根据分为单位进行回复。
[8c8783]据点收益：
[614c32]◆[d9ceba]据点大小不同，获得收益不同。
[614c32]◆[d9ceba]据点每分钟会产出[4edaad]公会积分[d9ceba]、[4edaad]个人积分[d9ceba]和[4edaad]贡献[d9ceba]。
[614c32]◆[d9ceba]随着占领时间的变久，据点收益会下降。
[614c32]◆[d9ceba]每次进行占领、攻击、支援都可获得公会积分、个人积分和贡献。
[8c8783]区域暴升：
[614c32]◆[d9ceba]占领连线成三角形的三个区域的据点，即可触发[4edaad]区域暴升效果[d9ceba]。
[614c32]◆[d9ceba]区域暴升效果触发后，区域周边的[4edaad]据点收益会加成[d9ceba]。
[8c8783]排行榜：
[614c32]◆[d9ceba]活动结束后，根据整体公会积分排名发放[4edaad]公会奖励[d9ceba]。
[614c32]◆[d9ceba]活动结束后，根据个人积分排名发放公会[4edaad]内部奖励[d9ceba]。
]],
		key=[[terrawar_orgrank]],
		pichelp={},
		title=[[[fefbc8]据点攻防战规则]],
	},
	terrawar_serverrank={
		content=[[[8c8783]开启时间：
[614c32]◆[4edaad]开服第三天[d9ceba]开启，活动持续3天。活动结束后间隔4天开启下一轮。
[8c8783]战斗条件：
[614c32]◆[d9ceba]玩法开启后，地图上显示据点，据点初始为无领主状态。
[614c32]◆[d9ceba]玩家等级[4edaad]>=15级[d9ceba]，且有公会的玩家。
[614c32]◆[d9ceba]玩家拥有[4edaad]3个或3个以上>=20级的伙伴[d9ceba]可进行攻击据点。
[614c32]◆[d9ceba]相同伙伴无法同时驻守两个据点。
[614c32]◆[d9ceba]每次进行占领、攻击或支援会消耗[4edaad]1灵力[d9ceba]。
[614c32]◆[d9ceba]灵力上限为[4edaad]10灵力[d9ceba]，玩法开始系统默认提供10灵力，每小时回复1灵力，[4edaad]可购买灵力[d9ceba]。
[8c8783]进攻据点&防守：
[614c32]◆[d9ceba]地图上移动且点击非友方占领的据点即可完成进攻操作。
[614c32]◆[d9ceba]进攻方击败据点中防守方的驻守伙伴后才能占领据点。
[614c32]◆[d9ceba]双方战斗前有[4edaad]30秒[d9ceba]的准备时间，准备时间内防守方可选择加入该战斗。
[8c8783]战斗介绍：
[614c32]◆[d9ceba]双方出战队伍按照到达据点攻击或支援的时间进行排序。
[614c32]◆[d9ceba]根据排列顺序进行单支队伍对决。
[614c32]◆[d9ceba]战斗中新加入的队伍，按照攻击或支援时间排序加入战斗队列。
[614c32]◆[d9ceba]排队队列支援方最多可排6队，攻击方最多排5队。
[614c32]◆[d9ceba]主角可支援自己，如主角不支援，支援方与攻击方相同，排5队。
[614c32]◆[d9ceba]当一支队伍被消灭后，进入30秒的倒计时，胜利方继续出战，失败方出战下一支队伍。
[614c32]◆[d9ceba]胜利方保存剩余血量进入下一场战斗，已死亡的英雄将无法进行战斗。
[614c32]◆[d9ceba]据点归属判定以一方队列出战全部失败，胜利方获得占领据点权。
[614c32]◆[d9ceba]据点发生战斗后，点击据点会显示‘观战’按钮，可进入观战。
[614c32]◆[d9ceba]占领据点后，会有[4edaad]15分钟[d9ceba]的保护时间。
[614c32]◆[d9ceba]战斗结束后，占领者会保存剩余血量，根据分为单位进行回复。
[8c8783]据点收益：
[614c32]◆[d9ceba]据点大小不同，获得收益不同。
[614c32]◆[d9ceba]据点每分钟会产出[4edaad]公会积分[d9ceba]、[4edaad]个人积分[d9ceba]和[4edaad]贡献[d9ceba]。
[614c32]◆[d9ceba]随着占领时间的变久，据点收益会下降。
[614c32]◆[d9ceba]每次进行占领、攻击、支援都可获得公会积分、个人积分和贡献。
[8c8783]区域暴升：
[614c32]◆[d9ceba]占领连线成三角形的三个区域的据点，即可触发[4edaad]区域暴升效果[d9ceba]。
[614c32]◆[d9ceba]区域暴升效果触发后，区域周边的[4edaad]据点收益会加成[d9ceba]。
[8c8783]排行榜：
[614c32]◆[d9ceba]活动结束后，根据整体公会积分排名发放[4edaad]公会奖励[d9ceba]。
[614c32]◆[d9ceba]活动结束后，根据个人积分排名发放公会[4edaad]内部奖励[d9ceba]。
]],
		key=[[terrawar_serverrank]],
		pichelp={},
		title=[[[fefbc8]据点攻防战规则]],
	},
	travel_adventure={
		content=[[[d9ceba]◆每次触发奇遇商人最多可进行[4edaad]2[d9ceba]次奇遇玩法，玩完2次后，奇遇商人将会离去
[d9ceba]◆每进行1次奇遇玩法，都要耗费一定的金币，每次消耗的金币相同
[d9ceba]◆奇遇玩法获取的积分，可兑换伙伴觉醒材料、游历道具以及星象图等道具
[d9ceba]◆每次奇遇玩法会有8秒的观察时间，结束后将有30秒的时间进行猜选，选中相同的伙伴即可获得积分奖励。]],
		key=[[travel_adventure]],
		pichelp={},
		title=[[奇遇商人]],
	},
	travel_exchange={
		content=[[[d9ceba]◆可花费积分兑换想要的道具]],
		key=[[travel_exchange]],
		pichelp={},
		title=[[游历兑换提示]],
	},
	travel_item={
		content=[[[d9ceba]◆使用游历道具后，限定时间内可以增加游历过程中的金币或者经验的收益]],
		key=[[travel_item]],
		pichelp={},
		title=[[游历道具提示]],
	},
	travel_main={
		content=[[[8c8783]队伍规则：
[d9ceba]◆同时可派遣[4edaad]4[d9ceba]个伙伴加入自己的游历队伍以及派遣[4edaad]1[d9ceba]个伙伴加入他人的游历队伍
[d9ceba]◆游历开始后，可以邀请[4edaad]1[d9ceba]名其他玩家的伙伴加入自己的队伍
[d9ceba]◆加入其他队伍的游历伙伴时间等同于该队伍游历的剩余时间
[d9ceba]◆每次游历正常结束后，可触发奇遇商人
[8c8783]奖励规则：
[d9ceba]◆游历开始后，每[4edaad]60分钟[d9ceba]会触发[4edaad]1[d9ceba]次奖励，队伍人数越多获取高级奖励的概率也越高
[d9ceba]◆使用游历道具后，限定时间内可以增加游历过程中的收益
[d9ceba]◆加入其他队伍的游历伙伴获取的[4edaad]经验[d9ceba]归[4edaad]伙伴自身[d9ceba]，获取的[4edaad]道具[d9ceba]奖励归游历[4edaad]队伍[d9ceba]所有
[d9ceba]◆游历过程中，每次奖励有概率遇见奇遇商人。每次游历正常结束后必定会遇见奇遇商人。奇遇商人存在时，则不会遇见新的奇遇商人]],
		key=[[travel_main]],
		pichelp={},
		title=[[游历提示]],
	},
	tujian={
		content=[[[d9ceba]◆最多可以拖入[4edaad]6[d9ceba]个伙伴进行展示
◆已拖入的伙伴可以在列表右侧选中后并调整原画的[4edaad]层级[d9ceba]
◆点击列表中伙伴右上角“X”取消已拖入的伙伴
◆右侧列表可以调整已拖入原画的左右朝向]],
		key=[[tujian]],
		pichelp={},
		title=[[相依相伴]],
	},
	yjfuben={
		content=[[[d9ceba]◆梦魇狩猎副本主要产出橙色套装材料
[d9ceba]◆副本有三种难度可选，通关时间为60分钟
[d9ceba]◆每天免费挑战2次，消耗水晶可再挑战1次
[d9ceba]◆终生卡特权用户每天额外获得1次挑战机会
[d9ceba]◆时限内击杀所有boss，能获得一次翻牌奖励
[d9ceba]◆每周三、日排行榜刷新后，排名前20的玩家可以获得额外奖励。]],
		key=[[yjfuben]],
		pichelp={},
		title=[[梦魇狩猎]],
	},
	youhaodu={
		content=[[[d9ceba]◆双方互为好友才会增加友好度，初始值为[4edaad]1[d9ceba]
◆任何一方删除好友都将使友好度[4edaad]清0[d9ceba]
◆与好友组队并在战斗中获得胜利，双方间的友好度[4edaad]+1[d9ceba]（非活动擂台战斗除外）
◆友好度上限为50000]],
		key=[[youhaodu]],
		pichelp={},
		title=[[友好度提示]],
	},
	yueka={
		content=[[[d9ceba]◆[4edaad]30元[d9ceba]购买超值月卡，立刻获得[4edaad]300#w2
[d9ceba]◆[4edaad]30天[d9ceba]内享有以下特权：
[d9ceba]◆每天领取[4edaad]100#w2
[d9ceba]◆每天领取[4edaad]5扫荡券
[d9ceba]◆体力上限[4edaad]+20点
[d9ceba]◆探索离线托管[4edaad]1小时
[d9ceba]◆每日[4edaad]宅急便[d9ceba]免费刷新次数[4edaad]+1
[d9ceba]◆宅邸女神培养亲密度[4edaad]+5%
礼包商店增加[4edaad]每日限购优惠礼包[d9ceba]
离线后探索时间增加到[4edaad]1小时[d9ceba] ]],
		key=[[yueka]],
		pichelp={},
		title=[[超值月卡]],
	},
	zhongshenka={
		content=[[[d9ceba]◆[4edaad]98元[d9ceba]购买最强终身卡，立刻获得[4edaad]980#w2
[d9ceba]◆并且[4edaad]永久享有以下特权：
[d9ceba]◆每天领取[4edaad]110#w2
[d9ceba]◆每天领取[4edaad]10扫荡券
[d9ceba]◆装备/御灵副本扫荡[4edaad]免费
[d9ceba]◆体力上限[4edaad]+30点
[d9ceba]◆每日免费进入[4edaad]梦魇狩猎[d9ceba]次数[4edaad]+1
[d9ceba]◆每日[4edaad]宅急便[d9ceba]免费刷新次数[4edaad]+2
[d9ceba]◆宅邸女神培养亲密度[4edaad]+10%
礼包商店增加[4edaad]每日限购优惠礼包[d9ceba]
离线后探索时间增加到[4edaad]1小时[d9ceba] ]],
		key=[[zhongshenka]],
		pichelp={},
		title=[[终身卡]],
	},
	zoom_lens={
		content=[[[d9ceba]◆在非战斗的场景中，用两手指按住屏幕
[d9ceba]◆向内滑动拉远镜头，向外滑动缩进镜头]],
		key=[[zoom_lens]],
		pichelp={},
		title=[[镜头缩放]],
	},
}
