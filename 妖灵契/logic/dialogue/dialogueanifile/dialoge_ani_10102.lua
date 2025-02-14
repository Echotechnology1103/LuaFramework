module(...)
--dialogueani editor build
DATA={
	[1]={
		cmdList={
			[1]={
				args={
					[1]={[1]=[[小美]],},
					[2]={[1]=1508,},
					[3]={[1]=25.5,[2]=4.1,},
					[4]={[1]=105,},
					[5]={[1]=1,},
					[6]={[1]=0,},
				},
				cmdType=[[player]],
				func=[[AddPlayer]],
				name=[[生成人物]],
			},
			[2]={
				args={
					[1]={[1]=[[小佳]],},
					[2]={[1]=1510,},
					[3]={[1]=26.7,[2]=3.6,},
					[4]={[1]=-68,},
					[5]={[1]=2,},
					[6]={[1]=0,},
				},
				cmdType=[[player]],
				func=[[AddPlayer]],
				name=[[生成人物]],
			},
			[3]={
				args={
					[1]={[1]=1,[2]=[[小美]],},
					[2]={[1]=[[这些花好漂亮呀！不知道贵不贵……]],},
				},
				cmdType=[[player]],
				func=[[PlayerSay]],
				name=[[剧场冒泡说话]],
			},
		},
		delay=4,
		idx=1,
		startTime=0,
		type=[[player]],
	},
	[2]={
		cmdList={
			[1]={
				args={
					[1]={[1]=2,[2]=[[小佳]],},
					[2]={[1]=[[都没有写价钱……不如问问老板？]],},
				},
				cmdType=[[player]],
				func=[[PlayerSay]],
				name=[[剧场冒泡说话]],
			},
		},
		delay=4,
		idx=2,
		startTime=4,
		type=[[player]],
	},
	[3]={
		cmdList={
			[1]={
				args={
					[1]={[1]=1,[2]=[[小美]],},
					[2]={[1]=[[可是那个老板看起来好凶哦……]],},
				},
				cmdType=[[player]],
				func=[[PlayerSay]],
				name=[[剧场冒泡说话]],
			},
		},
		delay=4,
		idx=3,
		startTime=8,
		type=[[player]],
	},
	[4]={
		cmdList={
			[1]={
				args={
					[1]={[1]=2,[2]=[[小佳]],},
					[2]={[1]=[[让你男朋友送你就好了嘛！不如我们去吃东西吧。]],},
				},
				cmdType=[[player]],
				func=[[PlayerSay]],
				name=[[剧场冒泡说话]],
			},
		},
		delay=4,
		idx=4,
		startTime=12,
		type=[[player]],
	},
	[5]={
		cmdList={
			[1]={
				args={
					[1]={[1]=1,[2]=[[小美]],},
					[2]={[1]=[[听说那边的拉面店打折，去试试吧？]],},
				},
				cmdType=[[player]],
				func=[[PlayerSay]],
				name=[[剧场冒泡说话]],
			},
		},
		delay=4,
		idx=5,
		startTime=16,
		type=[[player]],
	},
	[6]={
		cmdList={
			[1]={
				args={[1]={[1]=2,[2]=[[小佳]],},[2]={[1]=[[好呀好呀！]],},},
				cmdType=[[player]],
				func=[[PlayerSay]],
				name=[[人物说话]],
			},
		},
		delay=3,
		idx=6,
		startTime=20,
		type=[[player]],
	},
	[7]={
		cmdList={
			[1]={
				args={[1]={[1]=1,[2]=[[小美]],},[2]={[1]=13.9,[2]=0.5,},[3]={[1]=-68,},},
				cmdType=[[player]],
				func=[[PlayerRunto]],
				name=[[人物移动]],
			},
			[2]={
				args={[1]={[1]=2,[2]=[[小佳]],},[2]={[1]=15,[2]=0.6,},[3]={[1]=360,},},
				cmdType=[[player]],
				func=[[PlayerRunto]],
				name=[[人物移动]],
			},
		},
		delay=5,
		idx=7,
		startTime=23,
		type=[[player]],
	},
	[8]={
		cmdList={
			[1]={
				args={[1]={[1]=1,[2]=[[小美]],},[2]={[1]=0,},},
				cmdType=[[player]],
				func=[[SetPlayerActive]],
				name=[[设置人物是否可见]],
			},
			[2]={
				args={[1]={[1]=2,[2]=[[小佳]],},[2]={[1]=0,},},
				cmdType=[[player]],
				func=[[SetPlayerActive]],
				name=[[设置人物是否可见]],
			},
		},
		delay=1,
		idx=8,
		startTime=28,
		type=[[player]],
	},
}

CONFIG={
	isLoop=1,
	isStroy=0,
	isTrigger=1,
	loopTime=60,
	mapInfo=[[]],
	minTriggerLevel=5,
	name=[[剧场动画名_10102]],
}
