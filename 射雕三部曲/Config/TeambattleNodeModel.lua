TeambattleNodeModel = {
    desc = {
        ID = "#ID",
        chapterModelID = "所属章节ID",
        name = "节点名称",
        needNodeModelID = "开启需要节点ID(条件为或)",
        needLV = "开启等级",
        proposeFAP = "推荐战力值",
        firstReward = "首通奖励",
        heroModelID = "镇守者模型ID",
        fightBgPic = "战斗背景",
        matchPAP = "匹配战力",
        skillChatText = "百战BOSS技能",
        strategyText = "百战攻略",
        fightRewards = "节点战斗掉落前端显示"
    },
    key = {"ID"},
    items_count = 24,
    items = {
        [1111] = {
            ID = 1111,
            chapterModelID = 11,
            name = "白虎门·普通",
            needNodeModelID = "",
            needLV = 50,
            proposeFAP = 250000,
            firstReward = "1111,0,200||1801,18012101,1||1605,16050034,10||1605,16050023,40",
            heroModelID = 12014804,
            fightBgPic = "dingdingdangdang",
            matchPAP = 200000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容以前排眩晕为主,建议前排上阵防将,后排加血",
            fightRewards = "1801,18011101,1||1801,18012301,1||1801,18011201,1||1801,18012101,1||1605,16050034,30||1605,16050023,10"
        },
        [1112] = {
            ID = 1112,
            chapterModelID = 11,
            name = "白虎门·困难",
            needNodeModelID = "1111",
            needLV = 60,
            proposeFAP = 750000,
            firstReward = "1111,0,300||1505,15053302,5||1505,15054101,5||1605,16050034,20||1605,16050023,60",
            heroModelID = 12014804,
            fightBgPic = "dingdingdangdang",
            matchPAP = 600000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容以前排眩晕为主,建议前排上阵防将,后排加血",
            fightRewards = "1505,15053302,1||1801,18012101,1||1605,16050034,40||1605,16050023,12"
        },
        [1113] = {
            ID = 1113,
            chapterModelID = 11,
            name = "白虎门·噩梦",
            needNodeModelID = "1112",
            needLV = 70,
            proposeFAP = 2400000,
            firstReward = "1111,0,400||1505,15053201,5||1505,15054101,5||1605,16050034,30||1605,16050023,80",
            heroModelID = 12014804,
            fightBgPic = "dingdingdangdang",
            matchPAP = 1920000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容以前排眩晕为主,建议前排上阵防将,后排加血",
            fightRewards = "1505,15054102,1||1505,15053301,1||1605,16050034,50||1605,16050023,15"
        },
        [1211] = {
            ID = 1211,
            chapterModelID = 12,
            name = "玄武门·普通",
            needNodeModelID = "1111,1112,1113",
            needLV = 50,
            proposeFAP = 450000,
            firstReward = "1111,0,200||1505,15053202,5||1605,16050034,20||1605,16050023,40",
            heroModelID = 12013605,
            fightBgPic = "dishudong",
            matchPAP = 360000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容格挡较高,建议提高破击属性",
            fightRewards = "1801,18011201,1||1801,18012101,1||1801,18011301,1||1801,18012201,1||1605,16050034,40||1605,16050023,10"
        },
        [1212] = {
            ID = 1212,
            chapterModelID = 12,
            name = "玄武门·困难",
            needNodeModelID = "1112,1113",
            needLV = 60,
            proposeFAP = 1350000,
            firstReward = "1111,0,300||1505,15053102,5||1505,15054101,5||1605,16050034,30||1605,16050023,60",
            heroModelID = 12013605,
            fightBgPic = "dishudong",
            matchPAP = 1080000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容格挡较高,建议提高破击属性",
            fightRewards = "1505,15054202,1||1505,15053102,1||1801,18012301,1||1605,16050034,50||1605,16050023,12"
        },
        [1213] = {
            ID = 1213,
            chapterModelID = 12,
            name = "玄武门·噩梦",
            needNodeModelID = "1113",
            needLV = 70,
            proposeFAP = 4310000,
            firstReward = "1111,0,400||1505,15054202,10||1605,16050034,40||1605,16050023,100",
            heroModelID = 12013605,
            fightBgPic = "dishudong",
            matchPAP = 3450000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容格挡较高,建议提高破击属性",
            fightRewards = "1505,15055302,1||1505,15053202,1||1605,16050034,60||1605,16050023,15"
        },
        [1311] = {
            ID = 1311,
            chapterModelID = 13,
            name = "青龙门·普通",
            needNodeModelID = "1211,1212,1213",
            needLV = 50,
            proposeFAP = 750000,
            firstReward = "1111,0,200||1505,15053301,5||1605,16050034,30||1605,16050023,40",
            heroModelID = 12012411,
            fightBgPic = "hupo",
            matchPAP = 600000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容以后排攻击为主,请保护好自己的后排人物",
            fightRewards = "1801,18011301,1||1801,18012201,1||1801,18011101,1||1801,18012301,1||1605,16050034,50||1605,16050023,10"
        },
        [1312] = {
            ID = 1312,
            chapterModelID = 13,
            name = "青龙门·困难",
            needNodeModelID = "1212,1213",
            needLV = 60,
            proposeFAP = 2310000,
            firstReward = "1111,0,300||1505,15054102,10||1605,16050034,40||1605,16050023,80",
            heroModelID = 12012411,
            fightBgPic = "hupo",
            matchPAP = 1850000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容以后排攻击为主,请保护好自己的后排人物",
            fightRewards = "1505,15054201,1||1505,15053101,1||1605,16050034,60||1605,16050023,12"
        },
        [1313] = {
            ID = 1313,
            chapterModelID = 13,
            name = "青龙门·噩梦",
            needNodeModelID = "1213",
            needLV = 70,
            proposeFAP = 7360000,
            firstReward = "1111,0,400||1505,15055102,15||1605,16050034,50||1605,16050023,120",
            heroModelID = 12012411,
            fightBgPic = "hupo",
            matchPAP = 5890000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容以后排攻击为主,请保护好自己的后排人物",
            fightRewards = "1505,15055301,1||1505,15054202,1||1605,16050034,70||1605,16050023,15"
        },
        [1411] = {
            ID = 1411,
            chapterModelID = 14,
            name = "朱雀门·普通",
            needNodeModelID = "1311,1312,1313",
            needLV = 50,
            proposeFAP = 1200000,
            firstReward = "1111,0,200||1505,15053101,5||1505,15054101,5||1605,16050034,40||1605,16050023,60",
            heroModelID = 12012413,
            fightBgPic = "senlin",
            matchPAP = 960000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容以降怒为主，建议提高闪避属性",
            fightRewards = "1505,15054302,1||1505,15053202,1||1801,18012201,1||1605,16050034,60||1605,16050023,10"
        },
        [1412] = {
            ID = 1412,
            chapterModelID = 14,
            name = "朱雀门·困难",
            needNodeModelID = "1312,1313",
            needLV = 60,
            proposeFAP = 3710000,
            firstReward = "1111,0,300||1505,15054301,10||1605,16050034,50||1605,16050023,100",
            heroModelID = 12012413,
            fightBgPic = "senlin",
            matchPAP = 2970000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容以降怒为主，建议提高闪避属性",
            fightRewards = "1505,15055202,1||1505,15053102,1||1605,16050034,70||1605,16050023,12"
        },
        [1413] = {
            ID = 1413,
            chapterModelID = 14,
            name = "朱雀门·噩梦",
            needNodeModelID = "1313",
            needLV = 70,
            proposeFAP = 11800000,
            firstReward = "1111,0,400||1505,15055202,15||1605,16050034,60||1605,16050023,140",
            heroModelID = 12012413,
            fightBgPic = "senlin",
            matchPAP = 9440000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容以降怒为主，建议提高闪避属性",
            fightRewards = "1505,15055101,1||1505,15054301,1||1605,16050034,80||1605,16050023,15"
        },
        [1511] = {
            ID = 1511,
            chapterModelID = 15,
            name = "蒙古先锋·普通",
            needNodeModelID = "1411,1412,1413",
            needLV = 50,
            proposeFAP = 1800000,
            firstReward = "1111,0,200||1505,15054101,10||1605,16050034,50||1605,16050023,80",
            heroModelID = 12012422,
            fightBgPic = "shamo",
            matchPAP = 1440000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容直线伤害很高,不要把自己高攻将放在一条直线上,需要命中属性",
            fightRewards = "1505,15054301,1||1505,15053201,1||1605,16050034,70||1605,16050023,10"
        },
        [1512] = {
            ID = 1512,
            chapterModelID = 15,
            name = "蒙古先锋·困难",
            needNodeModelID = "1412,1413",
            needLV = 60,
            proposeFAP = 5550000,
            firstReward = "1111,0,300||1505,15055101,15||1605,16050034,60||1605,16050023,120",
            heroModelID = 12012422,
            fightBgPic = "shamo",
            matchPAP = 4440000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容直线伤害很高,不要把自己高攻将放在一条直线上,需要命中属性",
            fightRewards = "1505,15055102,1||1505,15054302,1||1605,16050034,80||1605,16050023,12"
        },
        [1513] = {
            ID = 1513,
            chapterModelID = 15,
            name = "蒙古先锋·噩梦",
            needNodeModelID = "1413",
            needLV = 70,
            proposeFAP = 17740000,
            firstReward = "1111,0,400||1505,15055301,15||1605,16050034,70||1605,16050023,140",
            heroModelID = 12012422,
            fightBgPic = "shamo",
            matchPAP = 14190000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容直线伤害很高,不要把自己高攻将放在一条直线上,需要命中属性",
            fightRewards = "1505,15055302,1||1505,15054201,1||1605,16050034,90||1605,16050023,15"
        },
        [1611] = {
            ID = 1611,
            chapterModelID = 16,
            name = "蒙古大营·普通",
            needNodeModelID = "1511,1512,1513",
            needLV = 50,
            proposeFAP = 2800000,
            firstReward = "1111,0,200||1505,15054201,10||1605,16050034,60||1605,16050023,100",
            heroModelID = 12013511,
            fightBgPic = "shumashikong",
            matchPAP = 2240000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵单体攻击超高,建议保护好你血量最少的人物,抗暴属性必不可少",
            fightRewards = "1505,15054101,1||1505,15053302,1||1605,16050034,80||1605,16050023,10"
        },
        [1612] = {
            ID = 1612,
            chapterModelID = 16,
            name = "蒙古大营·困难",
            needNodeModelID = "1512,1513",
            needLV = 60,
            proposeFAP = 8650000,
            firstReward = "1111,0,300||1505,15055201,15||1605,16050034,70||1605,16050023,120",
            heroModelID = 12013511,
            fightBgPic = "shumashikong",
            matchPAP = 6920000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵单体攻击超高,建议保护好你血量最少的人物,抗暴属性必不可少",
            fightRewards = "1505,15055201,1||1505,15054102,1||1605,16050034,90||1605,16050023,12"
        },
        [1613] = {
            ID = 1613,
            chapterModelID = 16,
            name = "蒙古大营·噩梦",
            needNodeModelID = "1513",
            needLV = 75,
            proposeFAP = 27640000,
            firstReward = "1111,0,400||1505,15055302,15||1605,16050034,80||1605,16050023,140",
            heroModelID = 12013511,
            fightBgPic = "shumashikong",
            matchPAP = 22110000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵单体攻击超高,建议保护好你血量最少的人物,抗暴属性必不可少",
            fightRewards = "1505,15055202,1||1505,15054101,1||1605,16050034,100||1605,16050023,15"
        },
        [1114] = {
            ID = 1114,
            chapterModelID = 11,
            name = "白虎门·地狱",
            needNodeModelID = "1113",
            needLV = 75,
            proposeFAP = 8400000,
            firstReward = "1111,0,500||1505,15055101,15||1605,16050034,100||1605,16050023,160",
            heroModelID = 12014804,
            fightBgPic = "dingdingdangdang",
            matchPAP = 6720000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容以前排眩晕为主,建议前排上阵防将,后排加血",
            fightRewards = "1505,15055301,1||1505,15054202,1||1605,16050034,60||1605,16050023,18"
        },
        [1214] = {
            ID = 1214,
            chapterModelID = 12,
            name = "玄武门·地狱",
            needNodeModelID = "1114",
            needLV = 75,
            proposeFAP = 15100000,
            firstReward = "1111,0,500||1505,15055102,15||1605,16050034,100||1605,16050023,160",
            heroModelID = 12013605,
            fightBgPic = "dishudong",
            matchPAP = 12080000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容格挡较高,建议提高破击属性",
            fightRewards = "1505,15055202,1||1505,15054101,1||1605,16050034,70||1605,16050023,18"
        },
        [1314] = {
            ID = 1314,
            chapterModelID = 13,
            name = "青龙门·地狱",
            needNodeModelID = "1214",
            needLV = 75,
            proposeFAP = 25700000,
            firstReward = "1111,0,500||1505,15055201,15||1605,16050034,100||1605,16050023,160",
            heroModelID = 12012411,
            fightBgPic = "hupo",
            matchPAP = 20560000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容以后排攻击为主,请保护好自己的后排人物",
            fightRewards = "1505,15055301,1||1505,15055102,1||1605,16050034,80||1605,16050023,18"
        },
        [1414] = {
            ID = 1414,
            chapterModelID = 14,
            name = "朱雀门·地狱",
            needNodeModelID = "1314",
            needLV = 75,
            proposeFAP = 41400000,
            firstReward = "1111,0,500||1505,15055202,15||1605,16050034,100||1605,16050023,160",
            heroModelID = 12012413,
            fightBgPic = "senlin",
            matchPAP = 33120000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容以降怒为主，建议提高闪避属性",
            fightRewards = "1505,15055302,1||1505,15055201,1||1605,16050034,90||1605,16050023,18"
        },
        [1514] = {
            ID = 1514,
            chapterModelID = 15,
            name = "蒙古先锋·地狱",
            needNodeModelID = "1414",
            needLV = 75,
            proposeFAP = 62300000,
            firstReward = "1111,0,500||1505,15055301,15||1605,16050034,100||1605,16050023,160",
            heroModelID = 12012422,
            fightBgPic = "shamo",
            matchPAP = 49840000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵容直线伤害很高,不要把自己高攻将放在一条直线上,需要命中属性",
            fightRewards = "1505,15055102,1||1505,15055101,1||1605,16050034,100||1605,16050023,18"
        },
        [1614] = {
            ID = 1614,
            chapterModelID = 16,
            name = "蒙古大营·地狱",
            needNodeModelID = "1514",
            needLV = 75,
            proposeFAP = 96900000,
            firstReward = "1111,0,500||1505,15055302,15||1605,16050034,100||1605,16050023,160",
            heroModelID = 12013511,
            fightBgPic = "shumashikong",
            matchPAP = 77520000,
            skillChatText = "敌人每回合都会增加50%攻击",
            strategyText = "此阵单体攻击超高,建议保护好你血量最少的人物,抗暴属性必不可少",
            fightRewards = "1505,15055201,1||1505,15055301,1||1605,16050034,110||1605,16050023,18"
        }
    }
}