﻿local alienWeaponSecretSeaCfg={
    --每日重置时间
    resetTime=0,
    --当前章节上限
    maxChapter=8,
    --解锁条件,对应等级
    unlockLevel={35,40,50,55,60,65,70,80},
    --攻打次数,同一张易/普/难都是一样
    unlockAttackNum={2,3,4,5,5,5,5,5},
    --战损比例
    loseFight=0.01,
    -- 最高难度  从1开始
    difficult=3,
    --免费次数
    freeNum=10,
    --购买一次给几次探索次数
    buyNum=5,
    --付费消耗
    exploreNumCost={15,75,110,500,900,1100,1250,1400,1600,1800,2000,2000,2000,2000,2000,2000},
    --vip等级1~10可购买次数
    num={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16},
    --每个关卡产出的经验,boss关卡=基础exp*expBoss
    exp={
        expBoss=1.5,
        normal={
            [1]={63,130,173,210,246,284,325,364},
            [2]={70,143,191,231,270,312,358,400},
            [3]={82,169,226,273,320,369,423,473},
        },
    },
    --全部完成奖励[1]-[8]为章节,包含的[1]-[3]为难度简/普/难
    doneReward={
        [1]={
            [1]={
                {0,100},
                {500,500,100,100,100,100,100,},
                {{"aweapon_ap1",1},{"aweapon_ap3",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {500,500,100,100,100,100,100,},
                {{"aweapon_ap1",1},{"aweapon_ap4",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {500,500,100,100,100,100,100,},
                {{"aweapon_ap1",1},{"aweapon_ap2",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [2]={
            [1]={
                {0,100},
                {500,500,100,100,100,100,100,},
                {{"aweapon_ap3",1},{"aweapon_ap4",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {500,500,100,100,100,100,100,},
                {{"aweapon_ap3",1},{"aweapon_ap2",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {500,500,100,100,100,100,100,},
                {{"aweapon_ap4",1},{"aweapon_ap2",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [3]={
            [1]={
                {0,100},
                {821,821,100,100,100,100,100,},
                {{"aweapon_ap1",2},{"aweapon_ap3",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {821,821,100,100,100,100,100,},
                {{"aweapon_ap1",2},{"aweapon_ap4",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {821,821,100,100,100,100,100,},
                {{"aweapon_ap1",2},{"aweapon_ap2",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [4]={
            [1]={
                {0,100},
                {821,821,100,100,100,100,100,},
                {{"aweapon_ap3",2},{"aweapon_ap4",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {821,821,100,100,100,100,100,},
                {{"aweapon_ap3",2},{"aweapon_ap2",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {821,821,100,100,100,100,100,},
                {{"aweapon_ap4",2},{"aweapon_ap2",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [5]={
            [1]={
                {0,100},
                {1414,1414,100,100,100,100,100,},
                {{"aweapon_ap1",3},{"aweapon_ap3",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {1414,1414,100,100,100,100,100,},
                {{"aweapon_ap1",3},{"aweapon_ap4",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {1414,1414,100,100,100,100,100,},
                {{"aweapon_ap1",3},{"aweapon_ap2",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [6]={
            [1]={
                {0,100},
                {1414,1414,100,100,100,100,100,},
                {{"aweapon_ap3",3},{"aweapon_ap4",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {1414,1414,100,100,100,100,100,},
                {{"aweapon_ap3",3},{"aweapon_ap2",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {1414,1414,100,100,100,100,100,},
                {{"aweapon_ap4",3},{"aweapon_ap2",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [7]={
            [1]={
                {0,100},
                {2741,2741,100,100,100,100,100,},
                {{"aweapon_ap1",4},{"aweapon_ap3",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {2741,2741,100,100,100,100,100,},
                {{"aweapon_ap1",4},{"aweapon_ap4",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {2741,2741,100,100,100,100,100,},
                {{"aweapon_ap1",4},{"aweapon_ap2",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [8]={
            [1]={
                {0,100},
                {2741,2741,100,100,100,100,100,},
                {{"aweapon_ap3",4},{"aweapon_ap4",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {2741,2741,100,100,100,100,100,},
                {{"aweapon_ap3",4},{"aweapon_ap2",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {2741,2741,100,100,100,100,100,},
                {{"aweapon_ap4",4},{"aweapon_ap2",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
    },
    --全部完成奖励[1]-[8]为章节,包含的[1]-[3]为难度简/普/难（包含宝石版）
    doneReward2={
        [1]={
            [1]={
                {0,100},
                {500,500,100,100,100,100,100,},
                {{"aweapon_ap1",1},{"aweapon_ap3",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {500,500,100,100,100,100,100,},
                {{"aweapon_ap1",1},{"aweapon_ap4",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {500,500,100,100,100,100,100,},
                {{"aweapon_ap1",1},{"aweapon_ap2",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [2]={
            [1]={
                {0,100},
                {500,500,88,88,88,88,88,60,},
                {{"aweapon_ap3",1},{"aweapon_ap4",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4871",1},},
            },
            [2]={
                {0,100},
                {500,500,84,84,84,84,84,80,},
                {{"aweapon_ap3",1},{"aweapon_ap2",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4871",1},},
            },
            [3]={
                {0,100},
                {500,500,80,80,80,80,80,100,},
                {{"aweapon_ap4",1},{"aweapon_ap2",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4871",1},},
            },
        },
        [3]={
            [1]={
                {0,100},
                {821,821,80,80,80,80,80,100,},
                {{"aweapon_ap1",2},{"aweapon_ap3",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4871",2},},
            },
            [2]={
                {0,100},
                {821,821,60,60,60,60,60,200,},
                {{"aweapon_ap1",2},{"aweapon_ap4",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4871",2},},
            },
            [3]={
                {0,100},
                {821,821,40,40,40,40,40,300,},
                {{"aweapon_ap1",2},{"aweapon_ap2",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4871",2},},
            },
        },
        [4]={
            [1]={
                {0,100},
                {821,821,60,60,60,60,60,200,},
                {{"aweapon_ap3",2},{"aweapon_ap4",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4871",4},},
            },
            [2]={
                {0,100},
                {821,821,50,50,50,50,50,250,},
                {{"aweapon_ap3",2},{"aweapon_ap2",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4871",4},},
            },
            [3]={
                {0,100},
                {821,821,40,40,40,40,40,300,},
                {{"aweapon_ap4",2},{"aweapon_ap2",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4871",4},},
            },
        },
        [5]={
            [1]={
                {0,100},
                {1414,1414,50,50,50,50,50,250,},
                {{"aweapon_ap1",3},{"aweapon_ap3",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4889",6},},
            },
            [2]={
                {0,100},
                {1414,1414,40,40,40,40,40,300,},
                {{"aweapon_ap1",3},{"aweapon_ap4",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4889",6},},
            },
            [3]={
                {0,100},
                {1414,1414,30,30,30,30,30,350,},
                {{"aweapon_ap1",3},{"aweapon_ap2",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4889",6},},
            },
        },
        [6]={
            [1]={
                {0,100},
                {1414,1414,40,40,40,40,40,300,},
                {{"aweapon_ap3",3},{"aweapon_ap4",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4889",8},},
            },
            [2]={
                {0,100},
                {1414,1414,30,30,30,30,30,350,},
                {{"aweapon_ap3",3},{"aweapon_ap2",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4889",8},},
            },
            [3]={
                {0,100},
                {1414,1414,20,20,20,20,20,400,},
                {{"aweapon_ap4",3},{"aweapon_ap2",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4889",8},},
            },
        },
        [7]={
            [1]={
                {0,100},
                {2741,2741,20,20,20,20,20,400,},
                {{"aweapon_ap1",4},{"aweapon_ap3",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4857",12},},
            },
            [2]={
                {0,100},
                {2741,2741,12,12,12,12,12,440,},
                {{"aweapon_ap1",4},{"aweapon_ap4",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4857",12},},
            },
            [3]={
                {0,100},
                {2741,2741,4,4,4,4,4,480,},
                {{"aweapon_ap1",4},{"aweapon_ap2",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4857",12},},
            },
        },
        [8]={
            [1]={
                {0,100},
                {2741,2741,20,20,20,20,20,400,},
                {{"aweapon_ap3",4},{"aweapon_ap4",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4857",16},},
            },
            [2]={
                {0,100},
                {2741,2741,12,12,12,12,12,440,},
                {{"aweapon_ap3",4},{"aweapon_ap2",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4857",16},},
            },
            [3]={
                {0,100},
                {2741,2741,4,4,4,4,4,480,},
                {{"aweapon_ap4",4},{"aweapon_ap2",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},{"props_p4857",16},},
            },
        },
    },
    --boss奖励,[1]-[8]为章节号,[1]-[3]为难度 简/普/难
    bossReward={
        [1]={
            [1]={
                {0,100},
                {1000,100,100,100,100,100,},
                {{"aweapon_ap5",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {1000,100,100,100,100,100,},
                {{"aweapon_ap5",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {1000,100,100,100,100,100,},
                {{"aweapon_ap5",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [2]={
            [1]={
                {0,100},
                {1000,100,100,100,100,100,},
                {{"aweapon_ap5",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {1000,100,100,100,100,100,},
                {{"aweapon_ap5",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {1000,100,100,100,100,100,},
                {{"aweapon_ap5",1},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [3]={
            [1]={
                {0,100},
                {1642,100,100,100,100,100,},
                {{"aweapon_ap5",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {1642,1,1,1,1,1,},
                {{"aweapon_ap5",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {1642,100,100,100,100,100,},
                {{"aweapon_ap5",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [4]={
            [1]={
                {0,100},
                {1642,100,100,100,100,100,},
                {{"aweapon_ap5",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {1642,100,100,100,100,100,},
                {{"aweapon_ap5",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {1642,100,100,100,100,100,},
                {{"aweapon_ap5",2},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [5]={
            [1]={
                {0,100},
                {2828,100,100,100,100,100,},
                {{"aweapon_ap5",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {2828,100,100,100,100,100,},
                {{"aweapon_ap5",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {2828,100,100,100,100,100,},
                {{"aweapon_ap5",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [6]={
            [1]={
                {0,100},
                {2828,100,100,100,100,100,},
                {{"aweapon_ap5",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {2828,100,100,100,100,100,},
                {{"aweapon_ap5",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {2828,100,100,100,100,100,},
                {{"aweapon_ap5",3},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [7]={
            [1]={
                {0,100},
                {5482,100,100,100,100,100,},
                {{"aweapon_ap5",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {5482,100,100,100,100,100,},
                {{"aweapon_ap5",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {5482,100,100,100,100,100,},
                {{"aweapon_ap5",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
        [8]={
            [1]={
                {0,100},
                {5482,100,100,100,100,100,},
                {{"aweapon_ap5",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [2]={
                {0,100},
                {5482,100,100,100,100,100,},
                {{"aweapon_ap5",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
            [3]={
                {0,100},
                {5482,100,100,100,100,100,},
                {{"aweapon_ap5",4},{"props_p26",1},{"props_p27",1},{"props_p28",1},{"props_p29",1},{"props_p30",1},},
            },
        },
    },
    --客户端全部完成奖励
    doneClientReward={
        [1]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=1,index=1},{ap3=1,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=1,index=1},{ap4=1,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=1,index=1},{ap2=1,index=2}}},
        },
        [2]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap3=1,index=1},{ap4=1,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap3=1,index=1},{ap2=1,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap4=1,index=1},{ap2=1,index=2}}},
        },
        [3]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=2,index=1},{ap3=2,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=2,index=1},{ap4=2,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=2,index=1},{ap2=2,index=2}}},
        },
        [4]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap3=2,index=1},{ap4=2,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap3=2,index=1},{ap2=2,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap4=2,index=1},{ap2=2,index=2}}},
        },
        [5]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=3,index=1},{ap3=3,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=3,index=1},{ap4=3,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=3,index=1},{ap2=3,index=2}}},
        },
        [6]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap3=3,index=1},{ap4=3,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap3=3,index=1},{ap2=3,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap4=3,index=1},{ap2=3,index=2}}},
        },
        [7]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=4,index=1},{ap3=4,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=4,index=1},{ap4=4,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=4,index=1},{ap2=4,index=2}}},
        },
        [8]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap3=4,index=1},{ap4=4,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap3=4,index=1},{ap2=4,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap4=4,index=1},{ap2=4,index=2}}},
        },
    },
    --客户端全部完成奖励（包含宝石版）
    doneClientReward2={
        [1]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=1,index=1},{ap3=1,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=1,index=1},{ap4=1,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7}},aw={{ap1=1,index=1},{ap2=1,index=2}}},
        },
        [2]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4871=1,index=8}},aw={{ap3=1,index=1},{ap4=1,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4871=1,index=8}},aw={{ap3=1,index=1},{ap2=1,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4871=1,index=8}},aw={{ap4=1,index=1},{ap2=1,index=2}}},
        },
        [3]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4871=2,index=8}},aw={{ap1=2,index=1},{ap3=2,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4871=2,index=8}},aw={{ap1=2,index=1},{ap4=2,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4871=2,index=8}},aw={{ap1=2,index=1},{ap2=2,index=2}}},
        },
        [4]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4871=4,index=8}},aw={{ap3=2,index=1},{ap4=2,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4871=4,index=8}},aw={{ap3=2,index=1},{ap2=2,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4871=4,index=8}},aw={{ap4=2,index=1},{ap2=2,index=2}}},
        },
        [5]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4889=6,index=8}},aw={{ap1=3,index=1},{ap3=3,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4889=6,index=8}},aw={{ap1=3,index=1},{ap4=3,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4889=6,index=8}},aw={{ap1=3,index=1},{ap2=3,index=2}}},
        },
        [6]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4889=8,index=8}},aw={{ap3=3,index=1},{ap4=3,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4889=8,index=8}},aw={{ap3=3,index=1},{ap2=3,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4889=8,index=8}},aw={{ap4=3,index=1},{ap2=3,index=2}}},
        },
        [7]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4857=12,index=8}},aw={{ap1=4,index=1},{ap3=4,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4857=12,index=8}},aw={{ap1=4,index=1},{ap4=4,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4857=12,index=8}},aw={{ap1=4,index=1},{ap2=4,index=2}}},
        },
        [8]={
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4857=16,index=8}},aw={{ap3=4,index=1},{ap4=4,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4857=16,index=8}},aw={{ap3=4,index=1},{ap2=4,index=2}}},
            {p={{p26=1,index=3},{p27=1,index=4},{p28=1,index=5},{p29=1,index=6},{p30=1,index=7},{p4857=16,index=8}},aw={{ap4=4,index=1},{ap2=4,index=2}}},
        },
    },
    --客户端boss奖励
    bossClientReward={
        [1]={
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=1}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=1}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=1}}},
        },
        [2]={
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=1}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=1}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=1}}},
        },
        [3]={
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=2}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=2}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=2}}},
        },
        [4]={
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=2}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=2}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=2}}},
        },
        [5]={
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=3}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=3}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=3}}},
        },
        [6]={
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=3}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=3}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=3}}},
        },
        [7]={
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=4}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=4}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=4}}},
        },
        [8]={
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=4}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=4}}},
            {p={{p26=1},{p27=1},{p28=1},{p29=1},{p30=1}},aw={{ap5=4}}},
        },
    },
    troops={
        [1]={
            [1]={tank={{"a10031",300},{"a10011",300},{"a10021",300},{"a10031",300},{"a10001",300},{"a10001",300},},skill={s101=1,s102=1,s103=1,s104=1,},attributeUp={attack=1,life=1,accurate=1,avoid=1,critical=1,decritical=1,}},
            [2]={tank={{"a10032",300},{"a10002",300},{"a10012",300},{"a10022",300},{"a10011",300},{"a10021",300},},skill={s101=1,s102=1,s103=1,s104=1,},attributeUp={attack=1,life=1,accurate=1,avoid=1,critical=1,decritical=1,}},
            [3]={tank={{"a10033",350},{"a10003",350},{"a10013",350},{"a10023",350},{"a10031",350},{"a10011",350},},skill={s101=1,s102=1,s103=1,s104=1,},attributeUp={attack=1,life=1,accurate=1,avoid=1,critical=1,decritical=1,}},
        },
        [2]={
            [1]={tank={{"a10034",350},{"a10004",350},{"a10013",350},{"a10023",350},{"a10033",350},{"a10003",350},},skill={s101=1,s102=1,s103=1,s104=1,},attributeUp={attack=1,life=1,accurate=1,avoid=1,critical=1,decritical=1,}},
            [2]={tank={{"a10034",400},{"a10004",400},{"a10014",400},{"a10024",400},{"a10033",400},{"a10003",400},},skill={s101=1,s102=1,s103=1,s104=1,},attributeUp={attack=1,life=1,accurate=1,avoid=1,critical=1,decritical=1,}},
            [3]={tank={{"a10034",450},{"a10014",450},{"a10024",450},{"a10034",450},{"a10024",450},{"a10004",450},},skill={s101=1,s102=1,s103=1,s104=1,},attributeUp={attack=1,life=1,accurate=1,avoid=1,critical=1,decritical=1,}},
        },
        [3]={
            [1]={tank={{"a10034",500},{"a10014",500},{"a10024",500},{"a10034",500},{"a10024",500},{"a10004",500},},skill={s101=1,s102=1,s103=1,s104=1,},attributeUp={attack=1,life=1.5,accurate=1,avoid=1,critical=1,decritical=1,}},
            [2]={tank={{"a10034",520},{"a10004",520},{"a10014",520},{"a10024",520},{"a10034",520},{"a10014",520},},skill={s101=1.5,s102=1.5,s103=1.5,s104=1.5,},attributeUp={attack=1,life=1.5,accurate=1,avoid=1,critical=1,decritical=1,}},
            [3]={tank={{"a10035",550},{"a10005",550},{"a10034",550},{"a10004",550},{"a10014",550},{"a10024",550},},skill={s101=2,s102=2,s103=2,s104=2,},attributeUp={attack=1,life=1.5,accurate=1,avoid=1,critical=1,decritical=1,}},
        },
        [4]={
            [1]={tank={{"a10035",600},{"a10005",600},{"a10015",600},{"a10034",600},{"a10014",600},{"a10024",600},},skill={s101=2.5,s102=2.5,s103=2.5,s104=2.5,},attributeUp={attack=1,life=2,accurate=1,avoid=1,critical=1,decritical=1,}},
            [2]={tank={{"a10005",620},{"a10015",620},{"a10025",620},{"a10035",620},{"a10035",620},{"a10024",620},},skill={s101=3,s102=3,s103=3,s104=3,},attributeUp={attack=1,life=2,accurate=1,avoid=1,critical=1,decritical=1,}},
            [3]={tank={{"a10035",650},{"a10015",650},{"a10025",650},{"a10005",650},{"a10035",650},{"a10005",650},},skill={s101=3.5,s102=3.5,s103=3.5,s104=3.5,},attributeUp={attack=1,life=2,accurate=1,avoid=1,critical=1,decritical=1,}},
        },
        [5]={
            [1]={tank={{"a10035",680},{"a10015",680},{"a10025",680},{"a10005",680},{"a10035",680},{"a10025",680},},skill={s101=4,s102=4,s103=4,s104=4,},attributeUp={attack=2,life=3,accurate=1,avoid=1,critical=1,decritical=1,}},
            [2]={tank={{"a10035",710},{"a10015",710},{"a10025",710},{"a10005",710},{"a10035",710},{"a10035",710},},skill={s101=4.5,s102=4.5,s103=4.5,s104=4.5,},attributeUp={attack=2,life=3,accurate=1,avoid=1,critical=1,decritical=1,}},
            [3]={tank={{"a10034",750},{"a10004",750},{"a10043",750},{"a10053",750},{"a10063",750},{"a10073",750},},skill={s101=5,s102=5,s103=5,s104=5,},attributeUp={attack=2,life=3,accurate=1,avoid=1,critical=1,decritical=1,}},
        },
        [6]={
            [1]={tank={{"a10082",800},{"a10093",800},{"a10113",800},{"a10123",800},{"a10035",800},{"a10025",800},},skill={s101=5.5,s102=5.5,s103=5.5,s104=5.5,},attributeUp={attack=2,life=5,accurate=1,avoid=1,critical=1,decritical=1,}},
            [2]={tank={{"a10043",850},{"a10053",850},{"a10063",850},{"a10073",850},{"a10082",850},{"a10093",850},},skill={s101=6,s102=6,s103=6,s104=6,},attributeUp={attack=2,life=5,accurate=1,avoid=1,critical=1,decritical=1,}},
            [3]={tank={{"a10073",900},{"a10082",900},{"a10093",900},{"a10113",900},{"a10123",900},{"a10082",900},},skill={s101=6.5,s102=6.5,s103=6.5,s104=6.5,},attributeUp={attack=2,life=5,accurate=1,avoid=1,critical=1,decritical=1,}},
        },
        [7]={
            [1]={tank={{"a10043",1000},{"a10053",1000},{"a10063",1000},{"a10006",1000},{"a10016",1000},{"a10026",1000},},skill={s101=7,s102=7,s103=7,s104=7,},attributeUp={attack=3,life=6,accurate=1,avoid=1,critical=1,decritical=1,}},
            [2]={tank={{"a10082",1100},{"a10093",1100},{"a10113",1100},{"a10016",1100},{"a10026",1100},{"a10036",1100},},skill={s101=7.5,s102=7.5,s103=7.5,s104=7.5,},attributeUp={attack=3,life=7,accurate=1,avoid=1,critical=1,decritical=1,}},
            [3]={tank={{"a10006",1200},{"a10016",1200},{"a10026",1200},{"a10036",1200},{"a10036",1200},{"a10006",1200},},skill={s101=8,s102=8,s103=8,s104=8,},attributeUp={attack=4,life=8,accurate=1,avoid=1,critical=1,decritical=1,}},
        },
        [8]={
            [1]={tank={{"a10094",1250},{"a10114",1250},{"a10124",1250},{"a10016",1250},{"a10026",1250},{"a10036",1250},},skill={s101=8.5,s102=8.5,s103=8.5,s104=8.5,},attributeUp={attack=4,life=9,accurate=1,avoid=1,critical=1,decritical=1,}},
            [2]={tank={{"a10044",1400},{"a10054",1400},{"a10064",1400},{"a10074",1400},{"a10083",1400},{"a10094",1400},},skill={s101=9,s102=9,s103=9,s104=9,},attributeUp={attack=4,life=9,accurate=1,avoid=1,critical=1,decritical=1,}},
            [3]={tank={{"a10083",1500},{"a10083",1500},{"a10083",1500},{"a10094",1500},{"a10114",1500},{"a10124",1500},},skill={s101=9,s102=9,s103=9,s104=9,},attributeUp={attack=4,life=10,accurate=1,avoid=1,critical=1,decritical=1,}},
        },
    },
}

return alienWeaponSecretSeaCfg
