-- K-开服活动配置.xls
return {
other={
{}},

total_chongzhi={
[0]={seq=0,},
[1]={seq=1,need_chognzhi=1000,reward_item={[0]={item_id=28403,num=1,is_bind=1}},title=2,},
[2]={seq=2,need_chognzhi=2000,reward_item={[0]={item_id=28404,num=1,is_bind=1}},title=3,},
[3]={seq=3,need_chognzhi=3000,reward_item={[0]={item_id=28405,num=1,is_bind=1}},title=4,},
[4]={seq=4,need_chognzhi=6000,reward_item={[0]={item_id=28406,num=1,is_bind=1}},title=5,},
[5]={seq=5,need_chognzhi=12000,reward_item={[0]={item_id=28407,num=1,is_bind=1}},title=6,},
[6]={seq=6,need_chognzhi=25000,reward_item={[0]={item_id=28408,num=1,is_bind=1}},title=7,},
[7]={seq=7,need_chognzhi=50000,reward_item={[0]={item_id=28409,num=1,is_bind=1}},title=8,},
[8]={seq=8,need_chognzhi=100000,reward_item={[0]={item_id=28410,num=1,is_bind=1}},title=9,},
[9]={seq=9,need_chognzhi=200000,reward_item={[0]={item_id=28411,num=1,is_bind=1}},title=10,}},

puton_equipment={
[0]={seq=0,},
[1]={seq=1,need_num=6,global_fetch_times=500,},
[2]={seq=2,need_jie=1,global_fetch_times=250,},
[3]={seq=3,need_jie=1,need_num=6,global_fetch_times=150,},
[4]={seq=4,need_jie=2,global_fetch_times=100,},
[5]={seq=5,need_jie=2,need_num=6,global_fetch_times=50,},
[6]={seq=6,need_jie=3,global_fetch_times=20,},
[7]={seq=7,need_jie=3,need_num=6,global_fetch_times=10,}},

capability={
[0]={seq=0,},
[1]={seq=1,capability=20000,global_fetch_times=500,},
[2]={seq=2,capability=40000,global_fetch_times=250,},
[3]={seq=3,capability=60000,global_fetch_times=150,},
[4]={seq=4,capability=80000,global_fetch_times=100,},
[5]={seq=5,capability=100000,global_fetch_times=50,},
[6]={seq=6,capability=120000,global_fetch_times=20,},
[7]={seq=7,capability=150000,global_fetch_times=10,}},

rolelevel={
[0]={seq=0,},
[1]={seq=1,level=201,global_fetch_times=500,},
[2]={seq=2,level=250,global_fetch_times=250,},
[3]={seq=3,level=280,global_fetch_times=150,},
[4]={seq=4,level=301,global_fetch_times=100,},
[5]={seq=5,level=350,global_fetch_times=50,},
[6]={seq=6,level=380,global_fetch_times=20,},
[7]={seq=7,level=401,global_fetch_times=10,}},

equipment_gift={
{},
{prof=2,prof_client="花舞",},
{prof=3,prof_client="天音",},
{prof=4,prof_client="冰皇",},
{seq=1,price=300,seq_client="饰品",},
{seq=1,prof=2,price=300,prof_client="花舞",seq_client="饰品",},
{seq=1,prof=3,price=300,prof_client="天音",seq_client="饰品",},
{seq=1,prof=4,price=300,prof_client="冰皇",seq_client="饰品",}},

kill_boss={
[1]={seq=1,scene_name="魔池一层",scene_id=9010,born_x=46,born_y=214,boss_capability=15000,},
[2]={seq=2,boss_id=3003,boss_name="秘·勾魂死神",scene_name="魔池一层",scene_id=9010,born_x=150,born_y=150,boss_capability=36000,},
[3]={seq=3,boss_id=3004,boss_name="尊·雷神",scene_id=9010,boss_capability=15000,},
[4]={seq=4,boss_id=7053,boss_type=5,boss_name="尊·战神兰斯",scene_id=9040,born_x=39,born_y=91,boss_capability=36000,},
[5]={seq=5,boss_id=3005,scene_name="魔池二层",scene_id=9010,born_x=253,born_y=127,},
[6]={seq=6,boss_id=3006,boss_name="秘·战神兰斯",scene_name="魔池二层",scene_id=9010,},
[7]={seq=7,boss_id=3007,boss_name="尊·兽人首领",scene_id=9010,born_x=166,born_y=275,},
[8]={seq=8,boss_id=3008,boss_name="尊·机械战士",born_x=52,born_y=103,},
[9]={seq=9,boss_id=3009,boss_name="秘·死镰法师",scene_name="魔池二层",born_x=127,born_y=37,boss_capability=240000,},
[10]={seq=10,boss_id=3010,boss_name="秘·三头龙",scene_name="魔池二层",born_x=46,born_y=214,boss_capability=240000,},
[11]={seq=11,boss_id=3011,boss_name="尊·雷神",scene_name="妖谷二层",born_x=125,born_y=279,boss_capability=240000,},
[12]={seq=12,boss_id=3012,boss_name="尊·勾魂死神",scene_name="妖谷二层",born_x=150,born_y=150,boss_capability=240000,},
[13]={seq=13,boss_id=3013,boss_name="秘·雷神",scene_name="魔池三层",born_x=253,born_y=127,boss_capability=385000,},
[14]={seq=14,boss_id=3014,boss_name="秘·勾魂死神",scene_name="魔池三层",boss_capability=385000,},
[15]={seq=15,boss_id=3015,boss_name="尊·兽人首领",scene_name="妖谷二层",born_x=212,born_y=349,boss_capability=385000,},
[16]={seq=16,boss_id=3016,boss_name="尊·战神兰斯",scene_name="妖谷三层",scene_id=9012,born_x=259,born_y=155,boss_capability=385000,}},

kill_boss_reward={
[0]={seq=0,},
[1]={seq=1,boss_seq_1=5,boss_seq_2=6,boss_seq_3=7,boss_seq_4=8,reward_item={item_id=29986,num=1,is_bind=1},title="进阶BOSS",},
[2]={seq=2,boss_seq_1=9,boss_seq_2=10,boss_seq_3=11,boss_seq_4=12,reward_item={item_id=29987,num=1,is_bind=1},title="荣耀BOSS",item_special={[0]={item_id=5145,num=1,is_bind=1},[1]={item_id=5245,num=1,is_bind=1},[2]={item_id=5345,num=1,is_bind=1}},},
[3]={seq=3,boss_seq_1=13,boss_seq_2=14,boss_seq_3=15,boss_seq_4=16,reward_item={item_id=29988,num=1,is_bind=1},title="王者BOSS",item_special={[0]={item_id=6146,num=1,is_bind=1},[1]={item_id=6246,num=1,is_bind=1},[2]={item_id=6346,num=1,is_bind=1}},}},

zhanchang_zhengba={
{},
{act_sep=2,act_name="公会争霸",title_id=2005,item_id=22203,},
{act_sep=3,act_name="攻城战",title_id=2006,item_id=22204,},
{act_sep=4,act_name="领土战",title_id=2007,item_id=22205,}},

gift_shop={
{price=788,},
{seq=1,gift_item_0={item_id=26330,num=1,is_bind=1},gift_item_1={item_id=26330,num=1,is_bind=1},gift_item_2={item_id=26300,num=20,is_bind=1},gift_item_3={item_id=22704,num=1,is_bind=1},model_assetbundle="actors/gather/6042_prefab,6042",show_language_1="坐骑直升二阶",show_language_2="战力突飞猛进",item_special="22108,26330",name="坐骑大礼包",},
{seq=2,gift_item_0={item_id=26331,num=1,is_bind=1},gift_item_1={item_id=26331,num=1,is_bind=1},gift_item_2={item_id=26301,num=20,is_bind=1},gift_item_3={item_id=22704,num=1,is_bind=1},model_assetbundle="actors/gather/6043_prefab,6043",show_language_1="羽翼直升二阶",show_language_2="战力畅游世界",item_special="22109,26331",name="羽翼大礼包",},
{seq=3,gift_item_0={item_id=29991,num=1,is_bind=1},price=988,model_assetbundle="actors/weapon/100101_prefab,100101;actors/weapon/100201_prefab,100201;actors/weapon/100301_prefab,100301;actors/weapon/100401_prefab,100401",show_language_1="究极高阶武器",show_language_2="战力毁天灭地",item_special="8144,8244,8344,8744",name="神级武器礼包",}},

other_default_table={baibeifanli_price=188,baibeifanli_item={item_id=29926,num=1,is_bind=1},baibeifanli_level_limit=40,index=3,},

total_chongzhi_default_table={seq=0,need_chognzhi=500,reward_item={[0]={item_id=28402,num=1,is_bind=1}},title=1,},

puton_equipment_default_table={seq=0,need_jie=0,need_color=4,need_color_client="橙",need_num=4,reward_item={[0]={item_id=26000,num=1,is_bind=1}},global_fetch_times=9999,},

capability_default_table={seq=0,capability=15000,reward_item={[0]={item_id=26000,num=1,is_bind=1}},global_fetch_times=9999,},

rolelevel_default_table={seq=0,level=150,reward_item={[0]={item_id=26000,num=1,is_bind=1}},global_fetch_times=9999,},

equipment_gift_default_table={seq=0,prof=1,reward_item={item_id=26000,num=1,is_bind=1},price=100,prof_client="炎尊",seq_client="防具",},

kill_boss_default_table={seq=1,boss_id=3002,boss_type=2,boss_name="秘·遗忘大帝",scene_name="妖谷一层",scene_id=9011,born_x=169,born_y=35,boss_capability=100000,jump_view="",},

kill_boss_reward_default_table={seq=0,boss_seq_1=1,boss_seq_2=2,boss_seq_3=3,boss_seq_4=4,reward_item={item_id=29985,num=1,is_bind=1},title="新手BOSS",item_special={[0]={item_id=22026,num=1,is_bind=1}},},

zhanchang_zhengba_default_table={act_sep=1,act_name="元素战场",title_id=2004,item_id=22202,},

gift_shop_default_table={seq=0,gift_item_0={item_id=29990,num=1,is_bind=1},gift_item_1={item_id=0,num=1,is_bind=1},gift_item_2={item_id=0,num=1,is_bind=1},gift_item_3={item_id=0,num=1,is_bind=1},gift_item_4={item_id=0,num=1,is_bind=1},gift_item_5={item_id=0,num=1,is_bind=1},gift_item_6={item_id=0,num=1,is_bind=1},gift_item_7={item_id=0,num=1,is_bind=1},price=388,origin_price=50,model_assetbundle="actors/gather/6038_prefab,6038",show_language_1="极品品质属性",show_language_2="战力远超橙装",item_special="1144,1244,1344,1744",name="装备大礼包",}

}

