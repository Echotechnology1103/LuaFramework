

---@classdef record_equipment_info
local record_equipment_info = {}
  
record_equipment_info.id = 0 --编号  
record_equipment_info.name = "" --装备名称  
record_equipment_info.type = 0 --装备类型  
record_equipment_info.star = 0 --星级  
record_equipment_info.potentiality = 0 --潜力  
record_equipment_info.wear_level = 0 --可穿戴等级  
record_equipment_info.strength_type = 0 --强化属性类型  
record_equipment_info.strength_value = 0 --初始强化属性类型值  
record_equipment_info.strength_growth = 0 --属性成长率  
record_equipment_info.money = 0 --强化花费系数  
record_equipment_info.is_sold = 0 --是否可出售  
record_equipment_info.price_type = 0 --出售价格类型  
record_equipment_info.price = 0 --出售价格类型值  
record_equipment_info.refining_type_1 = 0 --精练属性类型1  
record_equipment_info.refining_value_1 = 0 --初始精练属性类型值1  
record_equipment_info.refining_growth_1 = 0 --成长值1  
record_equipment_info.refining_type_2 = 0 --精练属性类型2  
record_equipment_info.refining_value_2 = 0 --初始精练属性类型值2  
record_equipment_info.refining_growth_2 = 0 --成长值2  
record_equipment_info.refining_exp = 0 --精练初始需求经验值  
record_equipment_info.suit_id = 0 --套装关联ID  
record_equipment_info.res_id = "" --资源id  
record_equipment_info.directions = "" --装备描述  
record_equipment_info.quality = 0 --品质  
record_equipment_info.gm = 0 --GM后台是否可发  
record_equipment_info.fragment_id = 0 --碎片id  
record_equipment_info.equipment_skill_1 = 0 --神兵技能id1  
record_equipment_info.equipment_skill_2 = 0 --神兵技能id2  
record_equipment_info.equipment_skill_3 = 0 --神兵技能id3  
record_equipment_info.equipment_skill_4 = 0 --神兵技能id4  
record_equipment_info.equipment_skill_5 = 0 --神兵技能id5  
record_equipment_info.equipment_skill_6 = 0 --神兵技能id6  
record_equipment_info.equipment_skill_7 = 0 --神兵技能id7  
record_equipment_info.equipment_skill_8 = 0 --神兵技能id8  
record_equipment_info.equipment_skill_9 = 0 --神兵技能id9  
record_equipment_info.equipment_skill_10 = 0 --神兵技能id10  
record_equipment_info.equip_star_id = 0 --升星码


equipment_info = {
   _data = {
    [1] = {1001,"白龙枪刃",1,2,12,1,6,66,3,8,1,1,1000,6,13,13,15,10,10,200,1000,"20011","白龙套装部件之一，张角部下黄巾军精锐标配装备，其实只是根绑了粗铁尖的棍子而已。",2,1,0,0,0,0,0,0,0,0,0,0,0,0,},
    [2] = {1002,"白龙轻甲",2,2,12,1,3,40,2,8,1,1,1000,3,8,8,16,10,10,200,1000,"20012","白龙套装部件之一，张角部下黄巾军精锐标配装备，粗铁锻造的便宜货，一按一个指头印。",2,1,0,0,0,0,0,0,0,0,0,0,0,0,},
    [3] = {1003,"白龙头饰",3,2,12,1,4,40,2,8,1,1,1000,4,8,8,14,8,8,200,1000,"20013","白龙套装部件之一，张角部下黄巾军精锐标配装备，烂牛皮加粗铁片的组合物，",2,1,0,0,0,0,0,0,0,0,0,0,0,0,},
    [4] = {1004,"白龙腰带",4,2,12,1,5,800,40,8,1,1,1000,5,160,160,13,8,8,200,1000,"20014","白龙套装部件之一，张角部下黄巾军精锐标配装备，用牛皮制成，外以粗布捆系，能有效保护腰部。",2,1,0,0,0,0,0,0,0,0,0,0,0,0,},
    [5] = {2001,"流星枪刃",1,3,13,1,6,115,6,16,1,1,1000,6,26,26,15,10,10,400,2000,"20041","流星套装部件之一，曹操部下青州兵标配装备，枪刃长一尺三寸，可以用来穿烤串。",3,1,2001,0,0,0,0,0,0,0,0,0,0,0,},
    [6] = {2002,"流星轻甲",2,3,13,1,3,70,4,16,1,1,1000,3,16,16,16,10,10,400,2000,"20042","流星套装部件之一，曹操部下青州兵标配装备，铁匠拍胸脯保证是精铁锻造，但还是一砸就扁。",3,1,2002,0,0,0,0,0,0,0,0,0,0,0,},
    [7] = {2003,"流星头盔",3,3,13,1,4,70,4,16,1,1,1000,4,16,16,14,8,8,400,2000,"20043","流星套装部件之一，曹操部下青州兵标配装备，因为质量不过关，士兵们都拿它当水壶。",3,1,2003,0,0,0,0,0,0,0,0,0,0,0,},
    [8] = {2004,"流星腰带",4,3,13,1,5,1400,70,16,1,1,1000,5,320,320,13,8,8,400,2000,"20044","流星套装部件之一，曹操部下青州兵标配装备，看着金光闪闪，其实是黄铜镀的样子货。",3,1,2004,0,0,0,0,0,0,0,0,0,0,0,},
    [9] = {2011,"飞雪长枪",1,3,13,1,6,115,6,16,1,1,1000,6,26,26,15,10,10,400,2010,"20151","飞雪套装部件之一，陶谦部下丹阳兵标配装备，枪头以寒铁锻造，入手冰寒，为夏日降温佳品。",3,1,2011,0,0,0,0,0,0,0,0,0,0,0,},
    [10] = {2012,"飞雪皮甲",2,3,13,1,3,70,4,16,1,1,1000,3,16,16,16,10,10,400,2010,"20152","飞雪套装部件之一，陶谦部下丹阳兵标配装备，内衬牛皮，夏天小心捂出痱子。",3,1,2012,0,0,0,0,0,0,0,0,0,0,0,},
    [11] = {2013,"飞雪发冠",3,3,13,1,4,70,4,16,1,1,1000,4,16,16,14,8,8,400,2010,"20153","飞雪套装部件之一，陶谦部下丹阳兵标配装备，样子看着不赖，八成是淘宝爆款。",3,1,2013,0,0,0,0,0,0,0,0,0,0,0,},
    [12] = {2014,"飞雪腰带",4,3,13,1,5,1400,70,16,1,1,1000,5,320,320,13,8,8,400,2010,"20154","飞雪套装部件之一，陶谦部下丹阳兵标配装备，由锦缎缠绕而成，但观赏性远大于实用性。",3,1,2014,0,0,0,0,0,0,0,0,0,0,0,},
    [13] = {3001,"龙翼枪刃",1,4,18,1,6,198,10,43,1,1,1000,6,33,33,15,10,10,500,3000,"20061","龙翼套装部件之一，董卓部下西凉铁骑标配装备，戟头形若龙翼，双面开刃，经常砍到自己人。",4,1,3001,0,0,0,0,0,0,0,0,0,0,0,},
    [14] = {3002,"龙翼轻甲",2,4,18,1,3,120,6,43,1,1,1000,3,20,20,16,10,10,500,3000,"20062","龙翼套装部件之一，董卓部下西凉铁骑标配装备，甲上带龙头雕像，看着牛逼哄哄，特拉仇恨。",4,1,3002,0,0,0,0,0,0,0,0,0,0,0,},
    [15] = {3003,"龙翼头盔",3,4,18,1,4,120,6,43,1,1,1000,4,20,20,14,8,8,500,3000,"20063","龙翼套装部件之一，董卓部下西凉铁骑标配装备，整体为龙头造型，原本额处镶着宝石，结果被士兵抠下来卖钱了。",4,1,3003,0,0,0,0,0,0,0,0,0,0,0,},
    [16] = {3004,"龙翼腰带",4,4,18,1,5,2400,120,43,1,1,1000,5,400,400,13,8,8,500,3000,"20064","龙翼套装部件之一，董卓部下西凉铁骑标配装备，镶龙头浮雕搭扣，但因为太结实了常常解不开。",4,1,3004,0,0,0,0,0,0,0,0,0,0,0,},
    [17] = {3011,"惊雷斧盾",1,4,18,1,6,198,10,43,1,1,1000,6,33,33,15,10,10,500,3010,"20051","惊雷套装部件之一，曹仁部下虎豹骑标配装备，大刀沉重无比，砸死人不偿命。",4,1,3011,0,0,0,0,0,0,0,0,0,0,0,},
    [18] = {3012,"惊雷铁甲",2,4,18,1,3,120,6,43,1,1,1000,3,20,20,16,10,10,500,3010,"20052","惊雷套装部件之一，曹仁部下虎豹骑标配装备，铠甲造型拉风，外带尖刺，有效防止色狼袭胸。",4,1,3012,0,0,0,0,0,0,0,0,0,0,0,},
    [19] = {3013,"惊雷头盔",3,4,18,1,4,120,6,43,1,1,1000,4,20,20,14,8,8,500,3010,"20053","惊雷套装部件之一，曹仁部下虎豹骑标配装备，头盔顶上带了根尖刺，雷雨时能有效避雷。",4,1,3013,0,0,0,0,0,0,0,0,0,0,0,},
    [20] = {3014,"惊雷护腰",4,4,18,1,5,2400,120,43,1,1,1000,5,400,400,13,8,8,500,3010,"20054","惊雷套装部件之一，曹仁部下虎豹骑标配装备，腰带上带有尖刺，虽然能攻守兼备，也很容易扎到下面的要害。",4,1,3014,0,0,0,0,0,0,0,0,0,0,0,},
    [21] = {3021,"落月长枪",1,4,18,1,6,198,10,43,1,1,1000,6,33,33,15,10,10,500,3020,"20171","落月套装部件之一，公孙瓒部下白马义从标配装备，因为枪上带弯月装饰，将士们举枪战斗时常会高喊“代表月亮消灭你！”。",4,1,3021,0,0,0,0,0,0,0,0,0,0,0,},
    [22] = {3022,"落月软甲",2,4,18,1,3,120,6,43,1,1,1000,3,20,20,16,10,10,500,3020,"20172","落月套装部件之一，公孙瓒部下白马义从标配装备，看着通体艳红闪瞎眼，实际只是刷了层红漆而已。",4,1,3022,0,0,0,0,0,0,0,0,0,0,0,},
    [23] = {3023,"落月发冠",3,4,18,1,4,120,6,43,1,1,1000,4,20,20,14,8,8,500,3020,"20173","落月套装部件之一，公孙瓒部下白马义从标配装备，通体使用练银锻造，内部衬以软牛皮，佩戴舒适美观，没杯子时还可以用来盛水用。",4,1,3023,0,0,0,0,0,0,0,0,0,0,0,},
    [24] = {3024,"落月腰带",4,4,18,1,5,2400,120,43,1,1,1000,5,400,400,13,8,8,500,3020,"20174","落月套装部件之一，公孙瓒部下白马义从标配装备，用练银锻造而成的腰带，外面缠绕精美锦缎，不仅美观大方，对腰部更具备不错防护力。",4,1,3024,0,0,0,0,0,0,0,0,0,0,0,},
    [25] = {4001,"辉煌噬心刃",1,5,20,1,6,247,12,68,1,1,1000,6,46,46,15,10,10,700,4000,"20071","辉煌套装部件之一，为于吉随身兵器，挥舞时能发出刺骨魔音，和于吉唱歌跑调的威力不相上下。",5,1,4001,0,0,0,0,0,0,0,0,0,0,4001,},
    [26] = {4002,"辉煌梦龙甲",2,5,20,1,3,150,8,68,1,1,1000,3,28,28,16,10,10,700,4000,"20072","辉煌套装部件之一，为于吉贴身护甲，肩甲带黄金的龙头浮雕，咬一口还有牙印哦。",5,1,4002,0,0,0,0,0,0,0,0,0,0,4002,},
    [27] = {4003,"辉煌头盔",3,5,20,1,4,150,8,68,1,1,1000,4,28,28,14,8,8,700,4000,"20073","辉煌套装部件之一，为于吉护身头盔，以珍贵的北地玄金锻造而成，不过由于太沉了经常让于吉扭到脖子。",5,1,4003,0,0,0,0,0,0,0,0,0,0,4003,},
    [28] = {4004,"辉煌腰带",4,5,20,1,5,3000,150,68,1,1,1000,5,560,560,13,8,8,700,4000,"20074","辉煌套装部件之一，为于吉护体腰带，外面裹以丝绸，造型仙风道骨，非常符合于吉的神棍气质。",5,1,4004,0,0,0,0,0,0,0,0,0,0,4004,},
    [29] = {4011,"破军枪盾",1,5,20,1,6,247,12,68,1,1,1000,6,46,46,15,10,10,700,4010,"20181","破军套装部件之一，为姜维随身兵器，枪头经特殊处理，更为宽大，姜维常用它来拍被子。",5,1,4011,0,0,0,0,0,0,0,0,0,0,4011,},
    [30] = {4012,"破军铁甲",2,5,20,1,3,150,8,68,1,1,1000,3,28,28,16,10,10,700,4010,"20182","破军套装部件之一，为姜维贴身护甲，造型威猛霸道，并且另有冬暖夏凉的妙用。",5,1,4012,0,0,0,0,0,0,0,0,0,0,4012,},
    [31] = {4013,"破军头盔",3,5,20,1,4,150,8,68,1,1,1000,4,28,28,14,8,8,700,4010,"20183","破军套装部件之一，为姜维护身头盔，通体采用精铁混杂绿玉砂锻造，造型凶悍威猛，就可惜有点绿油油的……",5,1,4013,0,0,0,0,0,0,0,0,0,0,4013,},
    [32] = {4014,"破军护腰",4,5,20,1,5,3000,150,68,1,1,1000,5,560,560,13,8,8,700,4010,"20184","破军套装部件之一，为姜维护体腰带，上面镶以恶鬼雕像，比较沉重，导致姜维没事就老提裤子。",5,1,4014,0,0,0,0,0,0,0,0,0,0,4014,},
    [33] = {4021,"贪狼长枪",1,5,20,1,6,247,12,68,1,1,1000,6,46,46,15,10,10,700,4020,"20191","贪狼套装部件之一，为郭嘉随身兵器，枪头扭曲如蛇，枪尖分叉如狼牙，传言有”谁用谁变弯“的诅咒。",5,1,4021,0,0,0,0,0,0,0,0,0,0,4021,},
    [34] = {4022,"贪狼皮甲",2,5,20,1,3,150,8,68,1,1,1000,3,28,28,16,10,10,700,4020,"20192","贪狼套装部件之一，为郭嘉贴身护甲，镶嵌有镀金甲片，帅气潇洒。郭嘉曾赞曰：”我的贪狼甲，时尚最时尚“。",5,1,4022,0,0,0,0,0,0,0,0,0,0,4022,},
    [35] = {4023,"贪狼发冠",3,5,20,1,4,150,8,68,1,1,1000,4,28,28,14,8,8,700,4020,"20193","贪狼套装部件之一，为郭嘉护身头盔，外形如张嘴露獠牙的凶狼，不过表情比较猥琐看上去像色狼。",5,1,4023,0,0,0,0,0,0,0,0,0,0,4023,},
    [36] = {4024,"贪狼护腰",4,5,20,1,5,3000,150,68,1,1,1000,5,560,560,13,8,8,700,4020,"20194","贪狼套装部件之一，为郭嘉护体腰带，用炼金锻造狼头雕像裹连，精美华贵，一股高富帅的装逼气息。",5,1,4024,0,0,0,0,0,0,0,0,0,0,4024,},
    [37] = {5001,"血狱断魂刃",1,6,23,1,6,297,15,84,1,1,1000,6,52,52,15,10,10,800,5000,"20081","血狱套装部件之一，为左慈随身兵器，通体血红、煞气逼人，晕血的人可用不了。",6,1,5001,101,102,103,104,105,106,107,108,109,110,5001,},
    [38] = {5002,"血狱魔腾甲",2,6,23,1,3,180,9,84,1,1,1000,3,32,32,16,10,10,800,5000,"20082","血狱套装部件之一，为左慈贴身护甲，其上涂绘鬼怪火焰图案，是吓哭熊孩子的利器。",6,1,5002,401,402,403,404,405,406,407,408,409,410,5002,},
    [39] = {5003,"血狱头盔",3,6,23,1,4,180,9,84,1,1,1000,4,32,32,14,8,8,800,5000,"20083","血狱套装部件之一，为左慈护身头盔，造型宛若恶鬼咆哮，头顶带一簇血色红缨，非常符合中二人士的品味。",6,1,5003,301,302,303,304,305,306,307,308,309,310,5003,},
    [40] = {5004,"血狱腰带",4,6,23,1,5,3600,180,84,1,1,1000,5,640,640,13,8,8,800,5000,"20084","血狱套装部件之一，为左慈护体腰带，整体造型鲜红狰狞，世人称之为”姨妈红“。",6,1,5004,201,202,203,204,205,206,207,208,209,210,5004,},
    [41] = {6001,"天罡龙胆枪",1,7,25,1,6,346,17,101,1,1,1000,6,59,59,15,10,10,900,6000,"20091","天罡套装部件之一，为赵云贴身兵器，挥舞时如银龙游弋，最适合用来耍帅把妹。",7,1,6001,111,112,113,114,115,116,117,118,119,120,6001,},
    [42] = {6002,"天罡聚灵甲",2,7,25,1,3,210,11,101,1,1,1000,3,36,36,16,10,10,900,6000,"20092","天罡套装部件之一，为赵云贴身防具，以亮银点缀，其上加以狮头浮雕，颇有百兽之王的气质。",7,1,6002,411,412,413,414,415,416,417,418,419,420,6002,},
    [43] = {6003,"天罡头盔",3,7,25,1,4,210,11,101,1,1,1000,4,36,36,14,8,8,900,6000,"20093","天罡套装部件之一，为赵云贴身防具，头盔轻便而不失坚韧，妈妈再也不担心我扭到脖子了。",7,1,6003,311,312,313,314,315,316,317,318,319,320,6003,},
    [44] = {6004,"天罡腰带",4,7,25,1,5,4200,210,101,1,1,1000,5,720,720,13,8,8,900,6000,"20094","天罡套装部件之一，为赵云贴身防具，外面以虎皮包裹，其上遍镶宝石，亮瞎敌人的狗眼。",7,1,6004,211,212,213,214,215,216,217,218,219,220,6004,},
    [45] = {7001,"无双方天戟",1,7,25,1,6,396,20,128,1,1,1000,6,66,66,15,10,10,1000,7000,"20101","无双套装部件之一，为吕布成名兵器，不仅外形拉风， 戟头还带挂钩，吕布常用来进行远程自拍。",7,1,7001,111,112,113,114,115,116,117,118,119,120,7001,},
    [46] = {7002,"无双帝皇甲",2,7,25,1,3,240,12,128,1,1,1000,3,40,40,16,10,10,1000,7000,"20102","无双套装部件之一，为吕布贴身防具，用料考究，外观华丽，穿上后能极大提升王霸之气。",7,1,7002,411,412,413,414,415,416,417,418,419,420,7002,},
    [47] = {7003,"无双头盔",3,7,25,1,4,240,12,128,1,1,1000,4,40,40,14,8,8,1000,7000,"20103","无双套装部件之一，为吕布贴身防具，头顶两根雉尾随风抖动， 霸气凌人，逼格陡然增加。",7,1,7003,311,312,313,314,315,316,317,318,319,320,7003,},
    [48] = {7004,"无双腰带",4,7,25,1,5,4800,240,128,1,1,1000,5,800,800,13,8,8,1000,7000,"20104","无双套装部件之一，为吕布贴身防具，上面刻满火星文，文艺装B青年必备之物。",7,1,7004,211,212,213,214,215,216,217,218,219,220,7004,},
    [49] = {7011,"青龙偃月刀",1,7,25,1,6,396,20,128,1,1,1000,6,66,66,15,10,10,1000,7010,"20111","青龙套装部件之一，为关二爷的随身兵器，别名又叫冷艳锯，用它来割脑袋，一割一个准。",7,1,7011,111,112,113,114,115,116,117,118,119,120,7011,},
    [50] = {7012,"青龙流光甲",2,7,25,1,3,240,12,128,1,1,1000,3,40,40,16,10,10,1000,7010,"20112","青龙套装部件之一，为关二爷的贴身防具，百炼精铁熔铸的重甲，没点力气穿上后根本不能移动。",7,1,7012,411,412,413,414,415,416,417,418,419,420,7012,},
    [51] = {7013,"青龙头盔",3,7,25,1,4,240,12,128,1,1,1000,4,40,40,14,8,8,1000,7010,"20113","青龙套装部件之一，为关二爷的贴身防具，虽然看着后很威风，但戴着通体绿色的头盔，颇有戴绿帽子的感觉。",7,1,7013,311,312,313,314,315,316,317,318,319,320,7013,},
    [52] = {7014,"青龙腰带",4,7,25,1,5,4800,240,128,1,1,1000,5,800,800,13,8,8,1000,7010,"20114","青龙套装部件之一，为关二爷的贴身防具，同时也是一条软鞭，抽打起来让人欲生欲死。",7,1,7014,211,212,213,214,215,216,217,218,219,220,7014,},
    [53] = {7021,"朱雀凤羽扇",1,7,25,1,6,396,20,128,1,1,1000,6,66,66,15,10,10,1000,7020,"20121","朱雀套装部件之一，为诸葛亮随身宝贝，用春鸽的羽毛制作，因为太耗羽毛，结果导致春鸽绝种。",7,1,7021,111,112,113,114,115,116,117,118,119,120,7021,},
    [54] = {7022,"朱雀星璇甲",2,7,25,1,3,240,12,128,1,1,1000,3,40,40,16,10,10,1000,7020,"20122","朱雀套装部件之一，诸葛亮随身防具，蜀国皇宫数百织女以金丝、豹虎毛裘精工缝制，其上绣朱雀，穿戴后尽显儒雅。",7,1,7022,411,412,413,414,415,416,417,418,419,420,7022,},
    [55] = {7023,"朱雀金冠",3,7,25,1,4,240,12,128,1,1,1000,4,40,40,14,8,8,1000,7020,"20123","朱雀套装部件之一，诸葛亮随身防具，蜀国皇宫数百织女以金丝、豹虎毛裘精工缝制，其上镶以宝石，通体华美异常。",7,1,7023,311,312,313,314,315,316,317,318,319,320,7023,},
    [56] = {7024,"朱雀腰带",4,7,25,1,5,4800,240,128,1,1,1000,5,800,800,13,8,8,1000,7020,"20124","朱雀套装部件之一，诸葛亮随身防具，蜀国皇宫数百织女以金丝、豹虎毛裘精工缝制，其上垂以飘饰，宛若朱雀羽翼。",7,1,7024,211,212,213,214,215,216,217,218,219,220,7024,},
    [57] = {7031,"白虎青虹剑",1,7,25,1,6,396,20,128,1,1,1000,6,66,66,15,10,10,1000,7030,"20131","白虎套装部件之一，为曹操随身兵器，据说为上古宝剑，使用者可以达到人剑合一的境界，简称剑人！",7,1,7031,111,112,113,114,115,116,117,118,119,120,7031,},
    [58] = {7032,"白虎霸首甲",2,7,25,1,3,240,12,128,1,1,1000,3,40,40,16,10,10,1000,7030,"20132","白虎套装部件之一，为曹操贴身防具，通体由白银黄金锻造，因为太过拉风（zhi qian），铠甲零部件经常莫名丢失。",7,1,7032,411,412,413,414,415,416,417,418,419,420,7032,},
    [59] = {7033,"白虎头盔",3,7,25,1,4,240,12,128,1,1,1000,4,40,40,14,8,8,1000,7030,"20133","白虎套装部件之一，为曹操贴身防具，头盔上镶有栩栩如生的虎头浮雕，因为太过逼真，戴上头盔后，仿佛脑袋被老虎啃了半截。",7,1,7033,311,312,313,314,315,316,317,318,319,320,7033,},
    [60] = {7034,"白虎腰带",4,7,25,1,5,4800,240,128,1,1,1000,5,800,800,13,8,8,1000,7030,"20134","白虎套装部件之一，为曹操贴身防具，打造时特意按华佗秘方熔了一条虎鞭在其中，据说能提升男性的能力。",7,1,7034,211,212,213,214,215,216,217,218,219,220,7034,},
    [61] = {7041,"玄武轰天锤",1,7,25,1,6,396,20,128,1,1,1000,6,66,66,15,10,10,1000,7040,"20141","玄武套装部件之一，为许褚随身兵器，重九十八斤，上面被许褚刻着“我的宝贝我的爱人”字样。",7,1,7041,111,112,113,114,115,116,117,118,119,120,7041,},
    [62] = {7042,"玄武裂地甲",2,7,25,1,3,240,12,128,1,1,1000,3,40,40,16,10,10,1000,7040,"20142","玄武套装部件之一，为许褚的贴身防具，铠甲正面雕着一只巨大的乌龟头，造型既拉风，也拉仇恨。",7,1,7042,411,412,413,414,415,416,417,418,419,420,7042,},
    [63] = {7043,"玄武头盔",3,7,25,1,4,240,12,128,1,1,1000,4,40,40,14,8,8,1000,7040,"20143","玄武套装部件之一，为许褚贴身防具，用寒锻造的头盔，因为太冰冷，摸上去仿佛被火烧一样。",7,1,7043,311,312,313,314,315,316,317,318,319,320,7043,},
    [64] = {7044,"玄武腰带",4,7,25,1,5,4800,240,128,1,1,1000,5,800,800,13,8,8,1000,7040,"20144","玄武套装部件之一，为许褚贴身防具，重达三十斤的纯金属腰带，造型虽拉风， 但因为太重，裤子也很容易掉下来。",7,1,7044,211,212,213,214,215,216,217,218,219,220,7044,},
    [65] = {9001,"阿东的皮搋子",1,7,25,1,6,800000,17,128,1,1,1000,6,66,66,15,10,10,1000,7040,"20141","阿东的皮搋子",7,1,0,0,0,0,0,0,0,0,0,0,0,9001,},
    [66] = {9002,"浩浩的内衣",2,7,25,1,21,800000,1,128,1,1,1000,3,40,40,16,10,10,1000,7040,"20142","浩浩的内衣",7,1,0,0,0,0,0,0,0,0,0,0,0,9002,},
    [67] = {9003,"随风装逼头绳",3,7,25,1,17,10000,1,128,1,1,1000,4,40,40,14,8,8,1000,7040,"20143","随风装逼头绳",7,1,0,0,0,0,0,0,0,0,0,0,0,9003,},
    [68] = {9004,"清源不用腰带",4,7,25,1,5,8000000,200,128,1,1,1000,5,800,800,13,8,8,1000,7040,"20144","清源不用腰带",7,1,0,0,0,0,0,0,0,0,0,0,0,9004,},
    }
}



local __index_id = {
    [1001] = 1,
    [1002] = 2,
    [1003] = 3,
    [1004] = 4,
    [2001] = 5,
    [2002] = 6,
    [2003] = 7,
    [2004] = 8,
    [2011] = 9,
    [2012] = 10,
    [2013] = 11,
    [2014] = 12,
    [3001] = 13,
    [3002] = 14,
    [3003] = 15,
    [3004] = 16,
    [3011] = 17,
    [3012] = 18,
    [3013] = 19,
    [3014] = 20,
    [3021] = 21,
    [3022] = 22,
    [3023] = 23,
    [3024] = 24,
    [4001] = 25,
    [4002] = 26,
    [4003] = 27,
    [4004] = 28,
    [4011] = 29,
    [4012] = 30,
    [4013] = 31,
    [4014] = 32,
    [4021] = 33,
    [4022] = 34,
    [4023] = 35,
    [4024] = 36,
    [5001] = 37,
    [5002] = 38,
    [5003] = 39,
    [5004] = 40,
    [6001] = 41,
    [6002] = 42,
    [6003] = 43,
    [6004] = 44,
    [7001] = 45,
    [7002] = 46,
    [7003] = 47,
    [7004] = 48,
    [7011] = 49,
    [7012] = 50,
    [7013] = 51,
    [7014] = 52,
    [7021] = 53,
    [7022] = 54,
    [7023] = 55,
    [7024] = 56,
    [7031] = 57,
    [7032] = 58,
    [7033] = 59,
    [7034] = 60,
    [7041] = 61,
    [7042] = 62,
    [7043] = 63,
    [7044] = 64,
    [9001] = 65,
    [9002] = 66,
    [9003] = 67,
    [9004] = 68,

}

local __key_map = {
  id = 1,
  name = 2,
  type = 3,
  star = 4,
  potentiality = 5,
  wear_level = 6,
  strength_type = 7,
  strength_value = 8,
  strength_growth = 9,
  money = 10,
  is_sold = 11,
  price_type = 12,
  price = 13,
  refining_type_1 = 14,
  refining_value_1 = 15,
  refining_growth_1 = 16,
  refining_type_2 = 17,
  refining_value_2 = 18,
  refining_growth_2 = 19,
  refining_exp = 20,
  suit_id = 21,
  res_id = 22,
  directions = 23,
  quality = 24,
  gm = 25,
  fragment_id = 26,
  equipment_skill_1 = 27,
  equipment_skill_2 = 28,
  equipment_skill_3 = 29,
  equipment_skill_4 = 30,
  equipment_skill_5 = 31,
  equipment_skill_6 = 32,
  equipment_skill_7 = 33,
  equipment_skill_8 = 34,
  equipment_skill_9 = 35,
  equipment_skill_10 = 36,
  equip_star_id = 37,

}



local m = { 
    __index = function(t, k) 
        if k == "toObject" then
            return function()  
                local o = {}
                for key, v in pairs (__key_map) do 
                    o[key] = t._raw[v]
                end
                return o
            end 
        end
        
        assert(__key_map[k], "cannot find " .. k .. " in record_equipment_info")
        
        
        return t._raw[__key_map[k]]
    end
}


function equipment_info.getLength()
    return #equipment_info._data
end



function equipment_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_equipment_info
function equipment_info.indexOf(index)
    if index == nil then
        return nil
    end
    
    return setmetatable({_raw = equipment_info._data[index]}, m)
    
end

---
--@return @class record_equipment_info
function equipment_info.get(id)
    
    return equipment_info.indexOf(__index_id[id])
        
end



function equipment_info.set(id, key, value)
    local record = equipment_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function equipment_info.get_index_data()
    return __index_id
end