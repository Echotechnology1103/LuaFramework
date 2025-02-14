-- this file is generated by program!
-- don't change it manaully.
-- source file: guild_war_data.xls

Config = Config or {} 
Config.GuildWarData = Config.GuildWarData or {}
Config.GuildWarData.data_const_key_depth = 1
Config.GuildWarData.data_const_length = 36
Config.GuildWarData.data_const_lan = "en"
Config.GuildWarData.data_const = {
	["active_member_condition"] = {key="active_member_condition",val=5,desc="Players who have been offline for X days and above cannot participate in the Guild battle"},
	["active_member_num"] = {key="active_member_num",val=1,desc="Required number of active participants"},
	["battle_duration"] = {key="battle_duration",val=132,desc="Guild battle duration, unit: hour"},
	["box_rule"] = {key="box_rule",val=1,desc="1. Treasure chests are generated after the Guild battle is over, and only the Guilds participating in the Guild battle can get them\n2. There are two types of treasure chests: the winner\'s <div fontcolor=289b14>Golden Treasure Box</div>, and the loser\'s <div fontcolor =289b14>Bronze treasure chest</div>\n3. The number of treasure chests is generated based on the number of active members in the Guild (1 to 1). Only active members can open the treasure chest, and each person can only open it once\n4. Players can open the treasure chest Get a certain amount of <div fontcolor=289b14>Guild Contributions</div>, and there is a chance that you can get a large amount of Guild Contributions."},
	["box_time_limit"] = {key="box_time_limit",val=28800,desc="Treasure chest duration, unit: second"},
	["challange_time_limit"] = {key="challange_time_limit",val=2,desc="Maximum number of challenges"},
	["clear_time"] = {key="clear_time",val={0,0,0},desc="Complete end time node"},
	["easy_diff_addition"] = {key="easy_diff_addition",val=900,desc="Simple difficulty attribute correction factor"},
	["easy_difficulty"] = {key="easy_difficulty",val=900,desc="Difficulty coefficient of record calculation (simple)"},
	["end_time"] = {key="end_time",val={20,0,0},desc="End time node"},
	["guard_id"] = {key="guard_id",val=81001,desc="Neutral guard monster ID"},
	["guild_lose_reward"] = {key="guild_lose_reward",val={{10,400},{1,30000}},desc="All-Union Mail Reward for the Loser"},
	["guild_win_reward"] = {key="guild_win_reward",val={{10,666},{1,50000}},desc="Winner All-Union Mail Reward"},
	["hard_diff_addition"] = {key="hard_diff_addition",val=1100,desc="Difficulty attribute correction factor"},
	["hard_difficulty"] = {key="hard_difficulty",val=1100,desc="Difficulty coefficient of record calculation (difficulty)"},
	["limit_lev"] = {key="limit_lev",val=1,desc="Guild level 3 open"},
	["limit_open_time"] = {key="limit_open_time",val=1,desc="Open after 3 days of opening"},
	["lose_guard_record"] = {key="lose_guard_record",val=1,desc="The record of failure to challenge the stronghold"},
	["lose_ruins_record"] = {key="lose_ruins_record",val=1,desc="The record obtained by failing to challenge the ruins"},
	["lose_strongholds_reward_easy"] = {key="lose_strongholds_reward_easy",val={{1,5000}},desc="Challenge base failure reward_simple"},
	["lose_strongholds_reward_hard"] = {key="lose_strongholds_reward_hard",val={{1,15000}},desc="Challenge stronghold failure reward_difficulty"},
	["lose_strongholds_reward_normal"] = {key="lose_strongholds_reward_normal",val={{1,9000}},desc="Challenge base failure reward_normal"},
	["marketplace_rule"] = {key="marketplace_rule",val=1,desc="1. Guild Treasure Rewards: The party who wins in the Guild battle will receive the Guild Treasure Reward. This part of the rewards will not be directly put into the player\'s bag, but will be put into the Guild Treasure to become a commodity for players to exchange. Guild treasure house rewards are divided into fixed drop rewards and random drop rewards. Fixed drop rewards are guaranteed to drop, and random drop rewards are randomly drawn from the reward pool for <div fontcolor=289b14>1</div> items to drop. . \n2. Record reward: It depends on the member\'s record ranking in the Guild. The higher the ranking, the more generous the reward. The reward will be settled after the Guild battle is over and sent out via email"},
	["matching_time"] = {key="matching_time",val={{1,4,0},{3,4,0},{5,4,0}},desc="What day of the week matches {day of the week, hour, minute}"},
	["normal_diff_addition"] = {key="normal_diff_addition",val=1000,desc="Normal difficulty attribute correction factor"},
	["normal_difficulty"] = {key="normal_difficulty",val=1000,desc="Difficulty coefficient of record calculation (normal)"},
	["operation_coefficient_1"] = {key="operation_coefficient_1",val=1000,desc="Record calculation variable 1"},
	["operation_coefficient_2"] = {key="operation_coefficient_2",val=1000,desc="Record calculation variable 2"},
	["ruins_challange_limit"] = {key="ruins_challange_limit",val=5,desc="The maximum number of times the ruins can be challenged"},
	["start_time"] = {key="start_time",val={12,0,0},desc="Time node"},
	["time_desc"] = {key="time_desc",val=0,desc="Every Monday, Wednesday and Friday 12:00-20:00"},
	["treasure_item_amount"] = {key="treasure_item_amount",val=1,desc="The number of rewards randomly dropped from the treasure chest"},
	["win_ruins_record"] = {key="win_ruins_record",val=5,desc="The record of successfully challenging the ruins"},
	["win_strongholds_reward_easy"] = {key="win_strongholds_reward_easy",val={{10,50},{1,20000}},desc="Challenge base victory reward_simple"},
	["win_strongholds_reward_hard"] = {key="win_strongholds_reward_hard",val={{10,120},{1,50000}},desc="Challenge stronghold victory reward_difficulty"},
	["win_strongholds_reward_normal"] = {key="win_strongholds_reward_normal",val={{10,80},{1,30000}},desc="Challenge Base Victory Reward_Normal"},
}
