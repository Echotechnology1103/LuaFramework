return {
{
	id = 2,
	parentid = 1,type = 0,level = 0,circle = 0,entrust = 0,star = 0,guideId = 0,timelimit = 0,interval = 0,maxcount = 1,
	cangiveup = false,
	automount = true,
	autoRun = true,
	excludetree = true,
	showTimerBox = false,
	randomTarget = false,
	name = Lang.Quest.name2,
	content = Lang.Quest.desc2,
	promtype = 1,
    prom = 0,
	compType = 0,
	comp = 2,
	target = {
		{
			type = 0, id = 1, count = 1, rewardId = 0,useList = false,
			location = {
				sceneid = 1, x= 87,y = 52,entityName = Lang.EntityName.m1,hideFastTransfer = false,
			},
		},
	},
	conds = {
	},
	awards = {
		{
			{ type = 2, id = 0, count = 22000, group = 0,strong = 0,quality = 0,job = 0,sex = -1,bind = true,levelRate = 0.00, ringRate = 0.00},
			{ type = 0, id = 445, count = 1, group = 0,strong = 0,quality = 0,job = 0,sex = -1,bind = true,levelRate = 0.00, ringRate = 0.00},
			{ type = 6, id = 0, count = 4000, group = 0,strong = 0,quality = 0,job = 0,sex = -1,bind = true,levelRate = 0.00, ringRate = 0.00},
		},
	},
	PromMsTalks = {
		Lang.Quest.promTlk21,
	},
	CompMsTalks = {
		Lang.Quest.compTlk21,
	},
	CompMsTip = {
		Lang.Quest.compTip21,
	},
	PassMsTip = {
	},
},
}