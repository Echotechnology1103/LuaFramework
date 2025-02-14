--version = 1
local l_fileType = "node"

local UIUtil = require "ui/common/UIUtil"

--EDITOR elements start tag
local eleRoot = 
{
	prop = {
		etype = "Layer",
		name = "root",
		posX = 0,
		posY = 0,
		anchorX = 0,
		anchorY = 0,
	},
	children = {
	{
		prop = {
			etype = "Grid",
			name = "ysjm",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 1,
			sizeY = 1,
		},
		children = {
		{
			prop = {
				etype = "Image",
				name = "hdlx1",
				varName = "activityUI",
				posX = 0.6205041,
				posY = 0.4488765,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.6309943,
				sizeY = 0.8333333,
				scale9 = true,
				scale9Left = 0.3,
				scale9Right = 0.3,
				scale9Top = 0.3,
				scale9Bottom = 0.3,
				alpha = 0.9,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "bjt",
					posX = 0.4806634,
					posY = 0.6201072,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.950556,
					sizeY = 0.7354568,
					image = "hddt#bj",
					scale9 = true,
					scale9Left = 0.4,
					scale9Right = 0.4,
					scale9Top = 0.4,
					scale9Bottom = 0.4,
				},
			},
			{
				prop = {
					etype = "Scroll",
					name = "lb4",
					varName = "scroll2",
					posX = 0.4806634,
					posY = 0.6201071,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.9472039,
					sizeY = 0.729845,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "smdf",
					posX = 0.4806634,
					posY = 0.131221,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.95,
					sizeY = 0.2346132,
					image = "d#bt",
					scale9 = true,
					scale9Left = 0.4,
					scale9Right = 0.4,
					scale9Top = 0.4,
					scale9Bottom = 0.4,
				},
			},
			{
				prop = {
					etype = "Button",
					name = "sd",
					varName = "sweepBt",
					posX = 0.8659245,
					posY = 0.1217877,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.1958489,
					sizeY = 0.1,
					image = "chu1#an2",
					imageNormal = "chu1#an2",
					disablePressScale = true,
				},
				children = {
				{
					prop = {
						etype = "Label",
						name = "ms",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.9216794,
						sizeY = 1.353547,
						text = "一键扫荡",
						fontSize = 22,
						fontOutlineEnable = true,
						fontOutlineColor = "FF347468",
						fontOutlineSize = 2,
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				},
			},
			},
		},
		{
			prop = {
				etype = "Grid",
				name = "jdtt",
				varName = "sche1Cont",
				posX = 0.4126782,
				posY = 0.179731,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.6654841,
				sizeY = 0.1666667,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "jdtdt",
					posX = 0.6704797,
					posY = 0.03123716,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.6550859,
					sizeY = 0.1441762,
					image = "rcb#jdd",
					scale9 = true,
					scale9Left = 0.45,
					scale9Right = 0.45,
				},
			},
			{
				prop = {
					etype = "LoadingBar",
					name = "jdt",
					varName = "process1",
					posX = 0.4390221,
					posY = 0.03123715,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.1640421,
					sizeY = 0.1593526,
					image = "rcb#jdt",
					percent = 75,
				},
			},
			{
				prop = {
					etype = "LoadingBar",
					name = "jdt2",
					varName = "process2",
					posX = 0.595293,
					posY = 0.03123715,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.1640421,
					sizeY = 0.1593526,
					image = "rcb#jdt",
					percent = 75,
				},
			},
			{
				prop = {
					etype = "LoadingBar",
					name = "jdt3",
					varName = "process3",
					posX = 0.7515639,
					posY = 0.03123715,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.1640421,
					sizeY = 0.1593526,
					image = "rcb#jdt",
					percent = 75,
				},
			},
			{
				prop = {
					etype = "LoadingBar",
					name = "jdt4",
					varName = "process4",
					posX = 0.9078348,
					posY = 0.03123719,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.1640421,
					sizeY = 0.1571848,
					image = "rcb#jdt",
					percent = 75,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "bxdt2",
					posX = 0.5197754,
					posY = 0.3399496,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.09834707,
					sizeY = 0.273176,
					image = "rcb#bxd",
				},
				children = {
				{
					prop = {
						etype = "Grid",
						name = "tx2",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1,
						sizeY = 1,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "diguang25",
							posX = 0.5127509,
							posY = 1.260542,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 2.119283,
							sizeY = 5.415948,
							image = "uieffect/001guangyun.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "diguang26",
							posX = 0.5235927,
							posY = 1.149501,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 2.271214,
							sizeY = 5.804207,
							image = "uieffect/016fangshe.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "diguang27",
							posX = 0.5235927,
							posY = 1.232915,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 1.902253,
							sizeY = 4.861315,
							image = "uieffect/shanguang_00058.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					},
				},
				{
					prop = {
						etype = "Image",
						name = "bx2",
						varName = "reward_icon1",
						posX = 0.5154326,
						posY = 1.065139,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.8695652,
						sizeY = 2.25,
						image = "rcb#bx1",
					},
				},
				{
					prop = {
						etype = "Button",
						name = "an7",
						varName = "reward_btn1",
						posX = 0.5,
						posY = 1.13889,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1.168886,
						sizeY = 2.61643,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "kbx2",
						varName = "reward_get_icon1",
						posX = 0.6518981,
						posY = 1.22086,
						anchorX = 0.5,
						anchorY = 0.5,
						visible = false,
						sizeX = 1.152174,
						sizeY = 2.5,
						image = "rcb#bx1k",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "hhd2",
						varName = "value_img2",
						posX = 0.5000442,
						posY = -0.4985655,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.6630435,
						sizeY = 1.111111,
						image = "rcb#jdjd1",
					},
					children = {
					{
						prop = {
							etype = "Label",
							name = "hyd11",
							varName = "reward_txt1",
							posX = 0.5,
							posY = 0.4,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.149065,
							sizeY = 0.9340368,
							text = "50",
							color = "FFF5D410",
							fontSize = 22,
							fontOutlineEnable = true,
							fontOutlineColor = "FF2B1300",
							hTextAlign = 1,
							vTextAlign = 1,
						},
					},
					},
				},
				{
					prop = {
						etype = "Particle",
						name = "qianlz8",
						sizeXAB = 163.4342,
						sizeYAB = 60.24582,
						posXAB = 127.927,
						posYAB = 61.46799,
						posX = 1.52705,
						posY = 1.875103,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1.950895,
						sizeY = 1.83782,
						duration = 999999,
						emitterType = 0,
						rotationStartVariance = 50,
						finishParticleSize = 0,
						startParticleSize = 60,
						startParticleSizeVariance = 20,
						gravityy = 40,
						maxParticles = 7,
						particleLifespan = 1,
						sourcePositionVariancex = 35,
						sourcePositionVariancey = 20,
						startColorBlue = 1,
						startColorGreen = 1,
						startColorRed = 1,
						textureFileName = "uieffect/lizi041161121.png",
					},
				},
				},
			},
			{
				prop = {
					etype = "Image",
					name = "bxdt3",
					posX = 0.6766788,
					posY = 0.3399496,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.09834707,
					sizeY = 0.273176,
					image = "rcb#bxd",
				},
				children = {
				{
					prop = {
						etype = "Grid",
						name = "tx3",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1,
						sizeY = 1,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "diguang22",
							posX = 0.5127509,
							posY = 1.260542,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 2.119283,
							sizeY = 5.415948,
							image = "uieffect/001guangyun.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "diguang23",
							posX = 0.5235927,
							posY = 1.149501,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 2.271214,
							sizeY = 5.804207,
							image = "uieffect/016fangshe.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "diguang24",
							posX = 0.5235927,
							posY = 1.232915,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 1.902253,
							sizeY = 4.861315,
							image = "uieffect/shanguang_00058.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					},
				},
				{
					prop = {
						etype = "Image",
						name = "bx3",
						varName = "reward_icon2",
						posX = 0.5154326,
						posY = 1.065139,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.8913043,
						sizeY = 2.277777,
						image = "rcb#bx2",
					},
				},
				{
					prop = {
						etype = "Button",
						name = "an8",
						varName = "reward_btn2",
						posX = 0.5,
						posY = 1.13889,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1.168886,
						sizeY = 2.61643,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "kbx3",
						varName = "reward_get_icon2",
						posX = 0.6627676,
						posY = 1.165343,
						anchorX = 0.5,
						anchorY = 0.5,
						visible = false,
						sizeX = 1.184783,
						sizeY = 2.444444,
						image = "rcb#bx2k",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "hhd3",
						varName = "value_img3",
						posX = 0.5000442,
						posY = -0.4985655,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.6630435,
						sizeY = 1.111111,
						image = "rcb#jdjd1",
					},
					children = {
					{
						prop = {
							etype = "Label",
							name = "hyd12",
							varName = "reward_txt2",
							posX = 0.5,
							posY = 0.4,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.149065,
							sizeY = 0.9340368,
							text = "50",
							color = "FFF5D410",
							fontSize = 22,
							fontOutlineEnable = true,
							fontOutlineColor = "FF2B1300",
							hTextAlign = 1,
							vTextAlign = 1,
						},
					},
					},
				},
				{
					prop = {
						etype = "Particle",
						name = "qianlz10",
						sizeXAB = 163.4342,
						sizeYAB = 60.24582,
						posXAB = 127.927,
						posYAB = 61.46799,
						posX = 1.52705,
						posY = 1.875103,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1.950895,
						sizeY = 1.83782,
						duration = 999999,
						emitterType = 0,
						rotationStartVariance = 50,
						finishParticleSize = 0,
						startParticleSize = 60,
						startParticleSizeVariance = 20,
						gravityy = 40,
						maxParticles = 7,
						particleLifespan = 1,
						sourcePositionVariancex = 35,
						sourcePositionVariancey = 20,
						startColorBlue = 1,
						startColorGreen = 1,
						startColorRed = 1,
						textureFileName = "uieffect/lizi041161121.png",
					},
				},
				},
			},
			{
				prop = {
					etype = "Image",
					name = "bxdt4",
					posX = 0.8335822,
					posY = 0.3399496,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.09834707,
					sizeY = 0.273176,
					image = "rcb#bxd",
				},
				children = {
				{
					prop = {
						etype = "Grid",
						name = "tx4",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1,
						sizeY = 1,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "diguang19",
							posX = 0.5127509,
							posY = 1.260542,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 2.119283,
							sizeY = 5.415948,
							image = "uieffect/001guangyun.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "diguang20",
							posX = 0.5235927,
							posY = 1.149501,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 2.271214,
							sizeY = 5.804207,
							image = "uieffect/016fangshe.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "diguang21",
							posX = 0.5235927,
							posY = 1.232915,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 1.902253,
							sizeY = 4.861315,
							image = "uieffect/shanguang_00058.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					},
				},
				{
					prop = {
						etype = "Image",
						name = "bx4",
						varName = "reward_icon3",
						posX = 0.5154326,
						posY = 1.065139,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.8913043,
						sizeY = 2.277777,
						image = "rcb#bx2",
					},
				},
				{
					prop = {
						etype = "Button",
						name = "an9",
						varName = "reward_btn3",
						posX = 0.5,
						posY = 1.13889,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1.168886,
						sizeY = 2.61643,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "kbx4",
						varName = "reward_get_icon3",
						posX = 0.6627676,
						posY = 1.165343,
						anchorX = 0.5,
						anchorY = 0.5,
						visible = false,
						sizeX = 1.184783,
						sizeY = 2.444444,
						image = "rcb#bx2k",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "hhd4",
						varName = "value_img4",
						posX = 0.5000442,
						posY = -0.4985655,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.6630435,
						sizeY = 1.111111,
						image = "rcb#jdjd1",
					},
					children = {
					{
						prop = {
							etype = "Label",
							name = "hyd13",
							varName = "reward_txt3",
							posX = 0.5,
							posY = 0.4,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.149065,
							sizeY = 0.9340368,
							text = "50",
							color = "FFF5D410",
							fontSize = 22,
							fontOutlineEnable = true,
							fontOutlineColor = "FF2B1300",
							hTextAlign = 1,
							vTextAlign = 1,
						},
					},
					},
				},
				{
					prop = {
						etype = "Particle",
						name = "qianlz7",
						sizeXAB = 163.4342,
						sizeYAB = 60.24582,
						posXAB = 127.927,
						posYAB = 61.46799,
						posX = 1.52705,
						posY = 1.875103,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1.950895,
						sizeY = 1.83782,
						duration = 999999,
						emitterType = 0,
						rotationStartVariance = 50,
						finishParticleSize = 0,
						startParticleSize = 60,
						startParticleSizeVariance = 20,
						gravityy = 40,
						maxParticles = 7,
						particleLifespan = 1,
						sourcePositionVariancex = 35,
						sourcePositionVariancey = 20,
						startColorBlue = 1,
						startColorGreen = 1,
						startColorRed = 1,
						textureFileName = "uieffect/lizi041161121.png",
					},
				},
				},
			},
			{
				prop = {
					etype = "Image",
					name = "bxdt5",
					posX = 0.9904855,
					posY = 0.3399496,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.09834707,
					sizeY = 0.273176,
					image = "rcb#bxd",
				},
				children = {
				{
					prop = {
						etype = "Grid",
						name = "tx5",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1,
						sizeY = 1,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "diguang16",
							posX = 0.5127509,
							posY = 1.260542,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 2.119283,
							sizeY = 5.415948,
							image = "uieffect/001guangyun.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "diguang17",
							posX = 0.5235927,
							posY = 1.149501,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 2.271214,
							sizeY = 5.804207,
							image = "uieffect/016fangshe.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "diguang18",
							posX = 0.5235927,
							posY = 1.232915,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 1.902253,
							sizeY = 4.861315,
							image = "uieffect/shanguang_00058.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					},
				},
				{
					prop = {
						etype = "Image",
						name = "bx5",
						varName = "reward_icon4",
						posX = 0.5154326,
						posY = 1.065139,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.923913,
						sizeY = 2.25,
						image = "rcb#bx3",
					},
				},
				{
					prop = {
						etype = "Button",
						name = "an10",
						varName = "reward_btn4",
						posX = 0.5,
						posY = 1.13889,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1.168886,
						sizeY = 2.61643,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "kbx5",
						varName = "reward_get_icon4",
						posX = 0.6627676,
						posY = 1.109787,
						anchorX = 0.5,
						anchorY = 0.5,
						visible = false,
						sizeX = 1.23913,
						sizeY = 2.333333,
						image = "rcb#bx3k",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "hhd5",
						varName = "value_img5",
						posX = 0.5000442,
						posY = -0.4985655,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.6630435,
						sizeY = 1.111111,
						image = "rcb#jdjd1",
					},
					children = {
					{
						prop = {
							etype = "Label",
							name = "hyd14",
							varName = "reward_txt4",
							posX = 0.5,
							posY = 0.4,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.149065,
							sizeY = 0.9340368,
							text = "50",
							color = "FFF5D410",
							fontSize = 22,
							fontOutlineEnable = true,
							fontOutlineColor = "FF2B1300",
							hTextAlign = 1,
							vTextAlign = 1,
						},
					},
					},
				},
				{
					prop = {
						etype = "Particle",
						name = "qianlz6",
						sizeXAB = 163.4342,
						sizeYAB = 60.24582,
						posXAB = 127.927,
						posYAB = 61.46799,
						posX = 1.52705,
						posY = 1.875103,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1.950895,
						sizeY = 1.83782,
						duration = 999999,
						emitterType = 0,
						rotationStartVariance = 50,
						finishParticleSize = 0,
						startParticleSize = 60,
						startParticleSizeVariance = 20,
						gravityy = 40,
						maxParticles = 7,
						particleLifespan = 1,
						sourcePositionVariancex = 35,
						sourcePositionVariancey = 20,
						startColorBlue = 1,
						startColorGreen = 1,
						startColorRed = 1,
						textureFileName = "uieffect/lizi041161121.png",
					},
				},
				},
			},
			{
				prop = {
					etype = "Label",
					name = "wbz",
					varName = "txt",
					posX = 0.6799002,
					posY = -0.178044,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.6363204,
					sizeY = 0.6244123,
					text = "xxxx",
					color = "FF966856",
					hTextAlign = 1,
					vTextAlign = 1,
				},
			},
			},
		},
		},
	},
	},
}
--EDITOR elements end tag
--EDITOR animations start tag
local l_animations =
{
	diguang17 = {
		diguang17 = {
			rotate = {{0, {0}}, {4000, {180}}, {6000, {270}}, {8000, {0}}, },
			alpha = {{0, {1}}, },
		},
	},
	diguang16 = {
		diguang16 = {
			alpha = {{0, {1}}, },
		},
	},
	diguang18 = {
		diguang18 = {
			rotate = {{0, {0}}, {5000, {-180}}, {7500, {-270}}, {10000, {0}}, },
			alpha = {{0, {1}}, },
		},
	},
	bx5 = {
		bx5 = {
			rotate = {{0, {0}}, {50, {10}}, {100, {0}}, {150, {-10}}, {200, {0}}, {1000, {0}}, },
		},
	},
	diguang20 = {
		diguang20 = {
			rotate = {{0, {0}}, {4000, {180}}, {6000, {270}}, {8000, {0}}, },
			alpha = {{0, {1}}, },
		},
	},
	diguang19 = {
		diguang19 = {
			alpha = {{0, {1}}, },
		},
	},
	diguang21 = {
		diguang21 = {
			rotate = {{0, {0}}, {5000, {-180}}, {7500, {-270}}, {10000, {0}}, },
			alpha = {{0, {1}}, },
		},
	},
	bx4 = {
		bx4 = {
			rotate = {{0, {0}}, {50, {10}}, {100, {0}}, {150, {-10}}, {200, {0}}, {1000, {0}}, },
		},
	},
	diguang23 = {
		diguang23 = {
			rotate = {{0, {0}}, {4000, {180}}, {6000, {270}}, {8000, {0}}, },
			alpha = {{0, {1}}, },
		},
	},
	diguang22 = {
		diguang22 = {
			alpha = {{0, {1}}, },
		},
	},
	diguang24 = {
		diguang24 = {
			rotate = {{0, {0}}, {5000, {-180}}, {7500, {-270}}, {10000, {0}}, },
			alpha = {{0, {1}}, },
		},
	},
	bx3 = {
		bx3 = {
			rotate = {{0, {0}}, {50, {10}}, {100, {0}}, {150, {-10}}, {200, {0}}, {1000, {0}}, },
		},
	},
	diguang26 = {
		diguang26 = {
			rotate = {{0, {0}}, {4000, {180}}, {6000, {270}}, {8000, {0}}, },
			alpha = {{0, {1}}, },
		},
	},
	diguang25 = {
		diguang25 = {
			alpha = {{0, {1}}, },
		},
	},
	diguang27 = {
		diguang27 = {
			rotate = {{0, {0}}, {5000, {-180}}, {7500, {-270}}, {10000, {0}}, },
			alpha = {{0, {1}}, },
		},
	},
	bx2 = {
		bx2 = {
			rotate = {{0, {0}}, {50, {10}}, {100, {0}}, {150, {-10}}, {200, {0}}, {1000, {0}}, },
		},
	},
	c_bx5 = {
		{0,"diguang17", -1, 0},
		{0,"diguang16", -1, 0},
		{0,"diguang18", -1, 0},
		{0,"bx5", -1, 0},
		{2,"qianlz6", 1, 0},
	},
	c_bx4 = {
		{0,"diguang20", -1, 0},
		{0,"diguang19", -1, 0},
		{0,"diguang21", -1, 0},
		{0,"bx4", -1, 0},
		{2,"qianlz7", 1, 0},
	},
	c_bx3 = {
		{0,"diguang23", -1, 0},
		{0,"diguang22", -1, 0},
		{0,"diguang24", -1, 0},
		{0,"bx3", -1, 0},
		{2,"qianlz10", 1, 0},
	},
	c_bx2 = {
		{0,"diguang26", -1, 0},
		{0,"diguang25", -1, 0},
		{0,"diguang27", -1, 0},
		{0,"bx2", -1, 0},
		{2,"qianlz8", 1, 0},
	},
}
--EDITOR animations end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot, l_animations)
end
return create
