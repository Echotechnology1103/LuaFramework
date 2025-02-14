local jtzg={
    _isAllianceActivity = true,
    multiSelectType = true,
    [1]={
        sortid=223,
        type=1,
        --排行榜上榜限制
        rLimit=500,
        --排行榜排名上限
        rNumLimit=10,
        --排名区间
        section={{1,1},{2,2},{3,3},{4,5},{6,10}},
        --积分道具（个人积分道具（同时也是商店货币），军团积分道具）
        itemNeed={"jtzg_a1","jtzg_a2"},
        --排行榜奖励限制领取人数
        rGetLimit=40,
        --排行榜团长奖励限制领取人数
        rLeaderLimit=1,
        serverreward={
            --充值档位（50-259,260-899,900-1899,1900-3399,3400-7999,8000及以上）
            rechargeNum={50,260,900,1900,3400,8000},
            --额外档位（8000-16999,17000-25999,26000及以上）德国版为55级以上且已充值过的玩家能看到第三方充值，前端显示逻辑跟充值界面的第三方按钮一致。
            extraRechargeNum={17000,26000},
            --奖励1
            gift1={props_p988=1,armor_exp=1000,jtzg_a1=5,jtzg_a2=5},
            --奖励2
            gift2={props_p988=5,armor_exp=5000,jtzg_a1=25,jtzg_a2=25},
            --奖励3
            gift3={props_p4804=1,armor_exp=20000,jtzg_a1=100,jtzg_a2=100},
            --奖励4
            gift4={props_p4804=3,armor_exp=30000,jtzg_a1=200,jtzg_a2=200},
            --奖励5
            gift5={props_p4806=2,armor_exp=50000,jtzg_a1=300,jtzg_a2=300},
            --奖励6
            gift6={props_p4806=5,armor_exp=100000,jtzg_a1=500,jtzg_a2=500},
            --额外档位1
            extraGift1={props_p4806=10,armor_exp=200000,jtzg_a1=1000,jtzg_a2=1000},
            --额外档位2
            extraGift2={props_p4806=15,armor_exp=300000,jtzg_a1=1500,jtzg_a2=1500},
            --排行榜基础奖励1
            rank1={props_p4806=10,armor_exp=50000,props_p3416=2,props_p3418=2},
            --排行榜基础奖励2
            rank2={props_p4806=5,armor_exp=25000,props_p3405=2,props_p3415=2},
            --排行榜基础奖励3
            rank3={props_p4806=3,armor_exp=15000,props_p3404=2,props_p3414=2},
            --排行榜基础奖励4
            rank4={props_p4804=3,armor_exp=10000,props_p3403=2,props_p3413=2},
            --排行榜基础奖励5
            rank5={props_p4804=1,armor_exp=5000,props_p3403=1,props_p3413=1},
            --排行榜团长额外奖励1
            trank1={armor_exp=50000,props_p3417=2},
            --排行榜团长额外奖励2
            trank2={armor_exp=25000,props_p3410=2},
            --排行榜团长额外奖励3
            trank3={armor_exp=15000,props_p3409=2},
            --排行榜团长额外奖励4
            trank4={armor_exp=10000,props_p3408=2},
            --排行榜团长额外奖励5
            trank5={armor_exp=5000,props_p3408=1},
            --商店
            shopList={
                [1]={serverreward={props_p4820=1},price=150,limit=20},
                [2]={serverreward={props_p4821=1},price=160,limit=20},
                [3]={serverreward={props_p4806=1},price=600,limit=10},
                [4]={serverreward={props_p4804=1},price=300,limit=10},
                [5]={serverreward={armor_exp=5000},price=100,limit=10},
                [6]={serverreward={armor_exp=2000},price=50,limit=10},
            },
        },
        rewardTb={
            --type=1指普通档位，type=2指额外档位
            gift={
                --奖励1
                {rechargeNum=50,type=1,gift={p={{p988=1,index=1}},am={{exp=1000,index=2}},jtzg={{jtzg_a1=5,index=3},{jtzg_a2=5,index=4}}}},
                --奖励2
                {rechargeNum=260,type=1,gift={p={{p988=5,index=1}},am={{exp=5000,index=2}},jtzg={{jtzg_a1=25,index=3},{jtzg_a2=25,index=4}}}},
                --奖励3
                {rechargeNum=900,type=1,gift={p={{p4804=1,index=1}},am={{exp=20000,index=2}},jtzg={{jtzg_a1=100,index=3},{jtzg_a2=100,index=4}}}},
                --奖励4
                {rechargeNum=1900,type=1,gift={p={{p4804=3,index=1}},am={{exp=30000,index=2}},jtzg={{jtzg_a1=200,index=3},{jtzg_a2=200,index=4}}}},
                --奖励5
                {rechargeNum=3400,type=1,gift={p={{p4806=2,index=1}},am={{exp=50000,index=2}},jtzg={{jtzg_a1=300,index=3},{jtzg_a2=300,index=4}}}},
                --奖励6
                {rechargeNum=8000,type=1,gift={p={{p4806=5,index=1}},am={{exp=100000,index=2}},jtzg={{jtzg_a1=500,index=3},{jtzg_a2=500,index=4}}}},
                --额外档位1
                {rechargeNum=17000,type=2,gift={p={{p4806=10,index=1}},am={{exp=200000,index=2}},jtzg={{jtzg_a1=1000,index=3},{jtzg_a2=1000,index=4}}}},
                --额外档位2
                {rechargeNum=26000,type=2,gift={p={{p4806=15,index=1}},am={{exp=300000,index=2}},jtzg={{jtzg_a1=1500,index=3},{jtzg_a2=1500,index=4}}}},
            },
            rank={
                --排行榜基础奖励1
                {p={{p4806=10,index=1},{p3416=2,index=3},{p3418=2,index=4}},am={{exp=50000,index=2}}},
                --排行榜基础奖励2
                {p={{p4806=5,index=1},{p3405=2,index=3},{p3415=2,index=4}},am={{exp=25000,index=2}}},
                --排行榜基础奖励3
                {p={{p4806=3,index=1},{p3404=2,index=3},{p3414=2,index=4}},am={{exp=15000,index=2}}},
                --排行榜基础奖励4
                {p={{p4804=3,index=1},{p3403=2,index=3},{p3413=2,index=4}},am={{exp=10000,index=2}}},
                --排行榜基础奖励5
                {p={{p4804=1,index=1},{p3403=1,index=3},{p3413=1,index=4}},am={{exp=5000,index=2}}},
            },
            trank={
                --排行榜团长额外奖励1
                {p={{p3417=2,index=2}},am={{exp=50000,index=1}}},
                --排行榜团长额外奖励2
                {p={{p3410=2,index=2}},am={{exp=25000,index=1}}},
                --排行榜团长额外奖励3
                {p={{p3409=2,index=2}},am={{exp=15000,index=1}}},
                --排行榜团长额外奖励4
                {p={{p3408=2,index=2}},am={{exp=10000,index=1}}},
                --排行榜团长额外奖励5
                {p={{p3408=1,index=2}},am={{exp=5000,index=1}}},
            },
            --商店
            shopList={
                {reward={p={p4820=1}},index=1,price=150,limit=20},
                {reward={p={p4821=1}},index=2,price=160,limit=20},
                {reward={p={p4806=1}},index=3,price=600,limit=10},
                {reward={p={p4804=1}},index=4,price=300,limit=10},
                {reward={am={exp=5000}},index=5,price=100,limit=10},
                {reward={am={exp=2000}},index=6,price=50,limit=10},
            }
        },
    },
    [2]={
        sortid=223,
        type=1,
        --排行榜上榜限制
        rLimit=500,
        --排行榜排名上限
        rNumLimit=10,
        --排名区间
        section={{1,1},{2,2},{3,3},{4,5},{6,10}},
        --积分道具（个人积分道具（同时也是商店货币），军团积分道具）
        itemNeed={"jtzg_a1","jtzg_a2"},
        --排行榜奖励限制领取人数
        rGetLimit=40,
        --排行榜团长奖励限制领取人数
        rLeaderLimit=1,
        serverreward={
            --充值档位（50-259,260-899,900-1899,1900-3399,3400-7999,8000及以上）
            rechargeNum={50,260,900,1900,3400,8000},
            --额外档位（8000-16999,17000-25999,26000及以上）德国版为55级以上且已充值过的玩家能看到第三方充值，前端显示逻辑跟充值界面的第三方按钮一致。
            extraRechargeNum={17000,26000},
            --奖励1
            gift1={props_p988=1,armor_exp=1000,jtzg_a1=5,jtzg_a2=5},
            --奖励2
            gift2={props_p988=5,armor_exp=5000,jtzg_a1=25,jtzg_a2=25},
            --奖励3
            gift3={props_p4804=1,armor_exp=20000,jtzg_a1=100,jtzg_a2=100},
            --奖励4
            gift4={props_p4804=3,armor_exp=30000,jtzg_a1=200,jtzg_a2=200},
            --奖励5
            gift5={props_p4806=2,armor_exp=50000,jtzg_a1=300,jtzg_a2=300},
            --奖励6
            gift6={props_p4806=5,armor_exp=100000,jtzg_a1=500,jtzg_a2=500},
            --额外档位1
            extraGift1={props_p4806=10,armor_exp=200000,jtzg_a1=1000,jtzg_a2=1000},
            --额外档位2
            extraGift2={props_p4806=15,armor_exp=300000,jtzg_a1=1500,jtzg_a2=1500},
            --排行榜基础奖励1
            rank1={props_p4806=10,props_p4606=1,props_p3416=2,props_p3418=2},
            --排行榜基础奖励2
            rank2={props_p4806=5,props_p4604=1,props_p3405=2,props_p3415=2},
            --排行榜基础奖励3
            rank3={props_p4806=3,props_p4605=3,props_p3404=2,props_p3414=2},
            --排行榜基础奖励4
            rank4={props_p4804=3,props_p4605=1,props_p3403=2,props_p3413=2},
            --排行榜基础奖励5
            rank5={props_p4804=1,props_p4603=1,props_p3403=1,props_p3413=1},
            --排行榜团长额外奖励1
            trank1={armor_exp=50000,props_p3417=2},
            --排行榜团长额外奖励2
            trank2={armor_exp=25000,props_p3410=2},
            --排行榜团长额外奖励3
            trank3={armor_exp=15000,props_p3409=2},
            --排行榜团长额外奖励4
            trank4={armor_exp=10000,props_p3408=2},
            --排行榜团长额外奖励5
            trank5={armor_exp=5000,props_p3408=1},
            --商店
            shopList={
                [1]={serverreward={props_p4820=1},price=150,limit=20},
                [2]={serverreward={props_p4821=1},price=160,limit=20},
                [3]={serverreward={props_p4806=1},price=600,limit=10},
                [4]={serverreward={props_p4804=1},price=300,limit=10},
                [5]={serverreward={armor_exp=5000},price=100,limit=10},
                [6]={serverreward={armor_exp=2000},price=50,limit=10},
            },
        },
        rewardTb={
            --type=1指普通档位，type=2指额外档位
            gift={
                --奖励1
                {rechargeNum=50,type=1,gift={p={{p988=1,index=1}},am={{exp=1000,index=2}},jtzg={{jtzg_a1=5,index=3},{jtzg_a2=5,index=4}}}},
                --奖励2
                {rechargeNum=260,type=1,gift={p={{p988=5,index=1}},am={{exp=5000,index=2}},jtzg={{jtzg_a1=25,index=3},{jtzg_a2=25,index=4}}}},
                --奖励3
                {rechargeNum=900,type=1,gift={p={{p4804=1,index=1}},am={{exp=20000,index=2}},jtzg={{jtzg_a1=100,index=3},{jtzg_a2=100,index=4}}}},
                --奖励4
                {rechargeNum=1900,type=1,gift={p={{p4804=3,index=1}},am={{exp=30000,index=2}},jtzg={{jtzg_a1=200,index=3},{jtzg_a2=200,index=4}}}},
                --奖励5
                {rechargeNum=3400,type=1,gift={p={{p4806=2,index=1}},am={{exp=50000,index=2}},jtzg={{jtzg_a1=300,index=3},{jtzg_a2=300,index=4}}}},
                --奖励6
                {rechargeNum=8000,type=1,gift={p={{p4806=5,index=1}},am={{exp=100000,index=2}},jtzg={{jtzg_a1=500,index=3},{jtzg_a2=500,index=4}}}},
                --额外档位1
                {rechargeNum=17000,type=2,gift={p={{p4806=10,index=1}},am={{exp=200000,index=2}},jtzg={{jtzg_a1=1000,index=3},{jtzg_a2=1000,index=4}}}},
                --额外档位2
                {rechargeNum=26000,type=2,gift={p={{p4806=15,index=1}},am={{exp=300000,index=2}},jtzg={{jtzg_a1=1500,index=3},{jtzg_a2=1500,index=4}}}},
            },
            rank={
                --排行榜基础奖励1
                {p={{p4806=10,index=1},{p4606=1,index=2},{p3416=2,index=3},{p3418=2,index=4}}},
                --排行榜基础奖励2
                {p={{p4806=5,index=1},{p4604=1,index=2},{p3405=2,index=3},{p3415=2,index=4}}},
                --排行榜基础奖励3
                {p={{p4806=3,index=1},{p4605=3,index=2},{p3404=2,index=3},{p3414=2,index=4}}},
                --排行榜基础奖励4
                {p={{p4804=3,index=1},{p4605=1,index=2},{p3403=2,index=3},{p3413=2,index=4}}},
                --排行榜基础奖励5
                {p={{p4804=1,index=1},{p4603=1,index=2},{p3403=1,index=3},{p3413=1,index=4}}},
            },
            trank={
                --排行榜团长额外奖励1
                {p={{p3417=2,index=2}},am={{exp=50000,index=1}}},
                --排行榜团长额外奖励2
                {p={{p3410=2,index=2}},am={{exp=25000,index=1}}},
                --排行榜团长额外奖励3
                {p={{p3409=2,index=2}},am={{exp=15000,index=1}}},
                --排行榜团长额外奖励4
                {p={{p3408=2,index=2}},am={{exp=10000,index=1}}},
                --排行榜团长额外奖励5
                {p={{p3408=1,index=2}},am={{exp=5000,index=1}}},
            },
            --商店
            shopList={
                {reward={p={p4820=1}},index=1,price=150,limit=20},
                {reward={p={p4821=1}},index=2,price=160,limit=20},
                {reward={p={p4806=1}},index=3,price=600,limit=10},
                {reward={p={p4804=1}},index=4,price=300,limit=10},
                {reward={am={exp=5000}},index=5,price=100,limit=10},
                {reward={am={exp=2000}},index=6,price=50,limit=10},
            }
        },
    },
    [3]={
        sortid=223,
        type=1,
        --排行榜上榜限制
        rLimit=500,
        --排行榜排名上限
        rNumLimit=10,
        --排名区间
        section={{1,1},{2,2},{3,3},{4,5},{6,10}},
        --积分道具（个人积分道具（同时也是商店货币），军团积分道具）
        itemNeed={"jtzg_a1","jtzg_a2"},
        --排行榜奖励限制领取人数
        rGetLimit=40,
        --排行榜团长奖励限制领取人数
        rLeaderLimit=1,
        serverreward={
            --充值档位（50-259,260-899,900-1899,1900-3399,3400-7999,8000及以上）
            rechargeNum={50,260,900,1900,3400,8000},
            --额外档位（8000-16999,17000-25999,26000及以上）德国版为55级以上且已充值过的玩家能看到第三方充值，前端显示逻辑跟充值界面的第三方按钮一致。
            extraRechargeNum={17000,26000},
            --奖励1
            gift1={props_p988=1,armor_exp=1000,jtzg_a1=5,jtzg_a2=5},
            --奖励2
            gift2={props_p988=5,armor_exp=5000,jtzg_a1=25,jtzg_a2=25},
            --奖励3
            gift3={props_p4804=1,armor_exp=20000,jtzg_a1=100,jtzg_a2=100},
            --奖励4
            gift4={props_p4804=3,armor_exp=30000,jtzg_a1=200,jtzg_a2=200},
            --奖励5
            gift5={props_p4806=2,armor_exp=50000,jtzg_a1=300,jtzg_a2=300},
            --奖励6
            gift6={props_p4806=5,armor_exp=100000,jtzg_a1=500,jtzg_a2=500},
            --额外档位1
            extraGift1={props_p4806=10,armor_exp=200000,jtzg_a1=1000,jtzg_a2=1000},
            --额外档位2
            extraGift2={props_p4806=15,armor_exp=300000,jtzg_a1=1500,jtzg_a2=1500},
            --排行榜基础奖励1
            rank1={props_p4806=10,props_p4606=1,alien_r2=10000,alien_r6=500},
            --排行榜基础奖励2
            rank2={props_p4806=5,props_p4604=1,alien_r2=6000,alien_r6=300},
            --排行榜基础奖励3
            rank3={props_p4806=3,props_p4605=3,alien_r2=3000,alien_r6=150},
            --排行榜基础奖励4
            rank4={props_p4804=3,props_p4605=1,alien_r2=2000,alien_r6=100},
            --排行榜基础奖励5
            rank5={props_p4804=1,props_p4603=1,alien_r2=1000,alien_r6=50},
            --排行榜团长额外奖励1
            trank1={armor_exp=50000,alien_r6=300},
            --排行榜团长额外奖励2
            trank2={armor_exp=25000,alien_r6=150},
            --排行榜团长额外奖励3
            trank3={armor_exp=15000,alien_r6=50},
            --排行榜团长额外奖励4
            trank4={armor_exp=10000,alien_r2=2000},
            --排行榜团长额外奖励5
            trank5={armor_exp=5000,alien_r2=1000},
            --商店
            shopList={
                [1]={serverreward={props_p4820=1},price=150,limit=20},
                [2]={serverreward={props_p4821=1},price=160,limit=20},
                [3]={serverreward={props_p4806=1},price=600,limit=10},
                [4]={serverreward={props_p4804=1},price=300,limit=10},
                [5]={serverreward={armor_exp=5000},price=100,limit=10},
                [6]={serverreward={armor_exp=2000},price=50,limit=10},
                [7]={serverreward={alien_r6=10},price=50,limit=100},
                [8]={serverreward={alien_r2=1000},price=100,limit=100},
            },
        },
        rewardTb={
            --type=1指普通档位，type=2指额外档位
            gift={
                --奖励1
                {rechargeNum=50,type=1,gift={p={{p988=1,index=1}},am={{exp=1000,index=2}},jtzg={{jtzg_a1=5,index=3},{jtzg_a2=5,index=4}}}},
                --奖励2
                {rechargeNum=260,type=1,gift={p={{p988=5,index=1}},am={{exp=5000,index=2}},jtzg={{jtzg_a1=25,index=3},{jtzg_a2=25,index=4}}}},
                --奖励3
                {rechargeNum=900,type=1,gift={p={{p4804=1,index=1}},am={{exp=20000,index=2}},jtzg={{jtzg_a1=100,index=3},{jtzg_a2=100,index=4}}}},
                --奖励4
                {rechargeNum=1900,type=1,gift={p={{p4804=3,index=1}},am={{exp=30000,index=2}},jtzg={{jtzg_a1=200,index=3},{jtzg_a2=200,index=4}}}},
                --奖励5
                {rechargeNum=3400,type=1,gift={p={{p4806=2,index=1}},am={{exp=50000,index=2}},jtzg={{jtzg_a1=300,index=3},{jtzg_a2=300,index=4}}}},
                --奖励6
                {rechargeNum=8000,type=1,gift={p={{p4806=5,index=1}},am={{exp=100000,index=2}},jtzg={{jtzg_a1=500,index=3},{jtzg_a2=500,index=4}}}},
                --额外档位1
                {rechargeNum=17000,type=2,gift={p={{p4806=10,index=1}},am={{exp=200000,index=2}},jtzg={{jtzg_a1=1000,index=3},{jtzg_a2=1000,index=4}}}},
                --额外档位2
                {rechargeNum=26000,type=2,gift={p={{p4806=15,index=1}},am={{exp=300000,index=2}},jtzg={{jtzg_a1=1500,index=3},{jtzg_a2=1500,index=4}}}},
            },
            rank={
                --排行榜基础奖励1
                {p={{p4806=10,index=1},{p4606=1,index=2}},r={{r2=10000,index=3},{r6=500,index=4}}},
                --排行榜基础奖励2
                {p={{p4806=5,index=1},{p4604=1,index=2}},r={{r2=6000,index=3},{r6=300,index=4}}},
                --排行榜基础奖励3
                {p={{p4806=3,index=1},{p4605=3,index=2}},r={{r2=3000,index=3},{r6=150,index=4}}},
                --排行榜基础奖励4
                {p={{p4804=3,index=1},{p4605=1,index=2}},r={{r2=2000,index=3},{r6=100,index=4}}},
                --排行榜基础奖励5
                {p={{p4804=1,index=1},{p4603=1,index=2}},r={{r2=1000,index=3},{r6=50,index=4}}},
            },
            trank={
                --排行榜团长额外奖励1
                {r={{r6=300,index=2}},am={{exp=50000,index=1}}},
                --排行榜团长额外奖励2
                {r={{r6=150,index=2}},am={{exp=25000,index=1}}},
                --排行榜团长额外奖励3
                {r={{r6=50,index=2}},am={{exp=15000,index=1}}},
                --排行榜团长额外奖励4
                {r={{r2=2000,index=2}},am={{exp=10000,index=1}}},
                --排行榜团长额外奖励5
                {r={{r2=1000,index=2}},am={{exp=5000,index=1}}},
            },
            --商店
            shopList={
                {reward={p={p4820=1}},index=1,price=150,limit=20},
                {reward={p={p4821=1}},index=2,price=160,limit=20},
                {reward={p={p4806=1}},index=3,price=600,limit=10},
                {reward={p={p4804=1}},index=4,price=300,limit=10},
                {reward={am={exp=5000}},index=5,price=100,limit=10},
                {reward={am={exp=2000}},index=6,price=50,limit=10},
                {reward={r={r6=10}},index=7,price=50,limit=100},
                {reward={r={r2=1000}},index=8,price=100,limit=100},
            }
        },
    },
}

return jtzg
