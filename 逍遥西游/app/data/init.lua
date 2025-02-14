import(".data_Hero")
import(".data_Pet")
if data_Monster == nil then
  data_Monster = {}
end
local idx = 1
while true do
  do
    local tName = string.format("data_Monster_%d", idx)
    local ret
    pcall(function()
      if WAR_CODE_IS_SERVER ~= true then
        ret = require("app.data." .. tName)
      else
        ret = require("gamelogic.data." .. tName)
      end
    end)
    if ret ~= 1 then
      break
    end
    idx = idx + 1
  end
end
import(".data_Skill")
import(".data_NormalPetSkill")
import(".data_SeniorPetSkill")
import(".data_SupremePetSkill")
import(".data_SpecialPetSkill")
import(".data_Effect")
import(".data_SkillAni")
import(".data_WarRole")
import(".data_Catch")
import(".data_CatchAward")
import(".data_Shape")
import(".data_Name")
import(".data_PetSkillPos")
import(".data_DelPetSkillCost")
import(".data_Drug")
import(".data_TaskItem")
import(".data_GiftItem")
import(".data_Neidan")
import(".data_Stuff")
import(".data_Lianyaoshi")
import(".data_OtherItem")
import(".data_Weapon")
import(".data_Hat")
import(".data_Cloth")
import(".data_Shoes")
import(".data_Necklace")
import(".data_SeniorWeapon")
import(".data_SeniorHat")
import(".data_SeniorCloth")
import(".data_SeniorShoes")
import(".data_SeniorNecklace")
import(".data_SeniorDecoration")
import(".data_SeniorWing")
import(".data_XqCloth")
import(".data_XqHat")
import(".data_XqShoes")
import(".data_XqWeapon")
import(".data_XqNecklace")
import(".data_HbCloth")
import(".data_HbHat")
import(".data_HbShoes")
import(".data_HbWeapon")
import(".data_HbNecklace")
import(".data_HbDecoration")
import(".data_NpcTypeInfo")
import(".data_NpcInfo")
import(".data_NpcRubbish")
import(".data_MapInfo")
import(".data_MapTeleporter")
import(".data_MapLoadingTips")
import(".data_MissionTypeDef")
import(".data_Mission_Main")
import(".data_Mission_Branch")
import(".data_Mission_Activity")
import(".data_MissionTalk")
import(".data_MissionUnlock")
import(".data_MissionRestAfterZS")
import(".data_Mission_Division")
import(".data_Mission_Dayanta")
import(".data_Mission_Jingying")
import(".data_Mission_Guide")
import(".data_Mission_Shilian")
import(".data_Mission_Jiehun")
import(".data_Mission_Jieqi")
import(".data_ShiMen_GiveItemTask")
import(".data_ShiMen_TalkTask")
import(".data_ShiMen_CatchPetTask")
import(".data_TaskRunRing_GiveItem")
import(".data_TaskRunRing_QuestionLib")
import(".data_TaskRunRing_Talk")
import(".data_TaskRunRing_WarTalk")
import(".data_TaskRunRing_GivePet")
import(".data_TaskExpRunRing")
import(".data_Mission_SanJieLiLian")
import(".data_Mission_BangPai")
import(".data_Org_ChumoTask")
import(".data_Org_AnZhan")
import(".data_Org_AnZhanAward")
import(".data_GuideDef")
import(".data_RbAttr")
import(".data_RbAdden")
import(".data_RbPetAttr")
import(".data_PetClose")
import(".data_ItemSource")
import(".data_Zuoqi")
import(".data_ZuoqiSkill")
import(".data_WorldMapTeleporter")
import(".DataGlobalFunc")
import(".data_GiftOfCheckIn")
import(".data_GiftOfOnline")
import(".data_GiftOfLevelUp")
import(".data_GiftOfFestival")
import(".data_GiftOfNewTermCheckIn")
import(".data_CustomMapPos")
import(".data_Dailyword")
import(".data_TeamDailyword")
import(".data_AI_PET")
import(".data_AI_ROLE")
import(".data_CangkuExpand")
import(".data_DynamicNpc")
import(".data_KeJuAward")
import(".data_KeJuControl")
import(".data_Promulgate")
import(".data_DayantaLevel")
import(".data_DayantaBossPos")
import(".data_DayantaExchange")
import(".data_HeroStarData")
import(".data_HeroStarColorData")
import(".data_FunctionUnlock")
import(".data_DailyHuodongAward")
import(".data_Huodong")
import(".data_ShopEquip")
import(".data_ShopDrug")
import(".data_ShopOther")
import(".data_ShopSecret")
import(".data_ShopSecretFresh")
import(".data_ShopHonour")
import(".data_ShopHonour2")
import(".data_Shop_NPC_Yifu")
import(".data_Shop_NPC_Maozi")
import(".data_Shop_NPC_XieziXianglian")
import(".data_Shop_NPC_Wuqi")
import(".data_Shop_NPC_Yaopin")
import(".data_Shop_NPC_Zawu")
import(".data_Tisheng")
import(".data_TaskExpCatchGhost")
import(".data_TaskExpDaYanTa")
import(".data_TaskExpShiMen")
import(".data_TaskExpTianTing")
import(".data_ProvinceQuestionLib")
import(".data_CapticalQuestionLib")
import(".data_CountryQuestionLib")
import(".data_NpcTalk")
import(".data_JiuguanPrice")
import(".data_JiuguanRole")
import(".data_Market")
import(".data_InsertGem")
import(".data_FuncEquipCtrl")
import(".data_EnhanceEquipNeedQHF")
import(".data_UpgradeEquipNeedJZ")
import(".data_UpgradeXqNeedJZ")
import(".data_MapEffects")
import(".data_ndLvupCondtion")
import(".data_Variables")
import(".data_AttrTip")
import(".data_Chengzhangbd")
import(".data_TaskExpGhostKing")
import(".data_Org_Auth")
import(".data_Org_Upgrade")
import(".data_Org_TotemTask")
import(".data_Org_Huodong")
import(".data_Org_Fuli")
import(".data_Org_RenWuLing")
import(".data_Org_AchivePoint")
import(".data_OrgTotem")
import(".data_EquipShowBaseValue")
import(".data_EquipShowBaseProValue")
import(".data_EquipShowLianhuaProValue")
import(".data_VIPData_dashi")
import(".data_VIPBuyBWC")
import(".data_VIPBuyTili")
import(".data_ChangeColor")
import(".data_RolePosColorData")
import(".data_Org_PaoShangTask")
import(".data_Treasure")
import(".data_GaojiTreasure")
import(".data_GiftOfIdentify")
import(".data_Shop_ChongZhi_dashi")
import(".data_Shop_BuySilver")
import(".data_Shop_BuyCoin")
import(".data_Stall")
import(".data_ChiBangOff")
import(".data_LocalMsgPush")
import(".data_GuaJi_Map")
import(".data_GuaJi_War1")
import(".data_GuaJi_War2")
import(".data_GuaJi_War3")
import(".data_GuaJi_War4")
import(".data_GuaJi_War5")
import(".data_GuaJi_War6")
import(".data_GuaJi_War7")
import(".data_GuaJi_War8")
import(".data_GuaJi_War9")
import(".data_GuaJi_War10")
import(".data_GuaJi_War11")
import(".data_LifeSkill")
import(".data_LifeSkill_Upgrade")
import(".data_LifeSkill_Drug")
import(".data_LifeSkill_Food")
import(".data_LifeSkill_Rune")
import(".data_BaoShiDu_CostCoin")
import(".data_DeviceInfo")
import(".data_LeitaiZhengbai")
import(".data_TongTianBossShape")
import(".data_TongTian1")
import(".data_TongTian2")
import(".data_TongTian3")
import(".data_TongTian4")
import(".data_TongTian5")
import(".data_TongTian6")
import(".data_TongTianFinalAward")
import(".data_XingXiuNormalBoss")
import(".data_XingXiuAward")
import(".data_XingXiuBossLoc")
import(".data_XingXiuSuperBoss")
import(".data_ShituChanganNormalBoss")
import(".data_ShituChanganAward")
import(".data_ShituChanganBossLoc")
import(".data_Title")
import(".data_HuodongOpenType")
import(".data_SkillExpLimit")
import(".data_BaotuTask_Loc")
import(".data_BaotuTask_WarId")
import(".data_BaotuTask_Bonus")
import(".data_ArenaRankAward")
import(".data_ChongZhiExtraAward")
import(".data_TianBinShenJiangNpc")
import(".data_YiZhanDaoDi")
import(".data_GiftOfSpecial")
import(".data_RbChangeCost")
import(".data_WuxingWarData")
import(".data_WuxingOtherWarData")
import(".data_ItemBagExpand")
import(".data_XiaYiShop")
import(".data_XiaYiSource")
import(".data_XueZhanShaChangAward")
import(".data_XueZhanShaChangScoreAward")
import(".data_XueZhanShaChangStarAward")
import(".data_ShopXianGou")
import(".data_TuijianAddPoint")
import(".data_ShenShouHuaJing")
import(".data_LingShouHuaLing")
import(".data_HornCost")
import(".data_MarrySkill")
import(".data_MarryQuestion")
import(".data_FriendGifts")
import(".data_MarryNeedItem")
import(".data_MonsterTeXing")
import(".data_TaskExpXiuLuo")
import(".data_OrgWar_BoxItem")
import(".data_GoldBaoXiang")
import(".data_BaoXiangVar")
import(".data_QiShuBossLoc")
import(".data_QiShuMonster")
import(".data_FinishCnt")
import(".data_GuoQinQianDao")
import(".data_GuoQinFinishCnt")
import(".data_UpgradeAndRefinery")
import(".data_JiangJuan")
