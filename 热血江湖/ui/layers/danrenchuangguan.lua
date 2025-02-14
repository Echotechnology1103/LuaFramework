--version = 1
local l_fileType = "layer"

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
			etype = "Image",
			name = "ddd",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 1,
			sizeY = 1,
			image = "b#dd",
			scale9 = true,
			scale9Left = 0.2,
			scale9Right = 0.2,
			scale9Top = 0.2,
			scale9Bottom = 0.2,
			alpha = 0.7,
		},
		children = {
		{
			prop = {
				etype = "Button",
				name = "dd",
				posX = 0.5,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 1,
				sizeY = 1,
			},
		},
		},
	},
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
				name = "dt",
				posX = 0.5,
				posY = 0.4791665,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.7929688,
				sizeY = 0.8055556,
				scale9 = true,
				scale9Left = 0.45,
				scale9Right = 0.45,
				scale9Top = 0.45,
				scale9Bottom = 0.45,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "kk2",
					posX = 0.5,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1,
					sizeY = 1,
					image = "b#db1",
					scale9 = true,
					scale9Left = 0.45,
					scale9Right = 0.45,
				},
				children = {
				{
					prop = {
						etype = "Image",
						name = "zs1",
						posX = 0.02057244,
						posY = 0.1628659,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.05421687,
						sizeY = 0.3755943,
						image = "zhu#zs1",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "zs2",
						posX = 0.9442027,
						posY = 0.1851488,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1592083,
						sizeY = 0.4057052,
						image = "zhu#zs2",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "db2",
						posX = 0.4844976,
						posY = 0.4921793,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.9363168,
						sizeY = 0.959002,
						image = "b#db3",
						scale9 = true,
						scale9Left = 0.47,
						scale9Right = 0.47,
					},
				},
				},
			},
			{
				prop = {
					etype = "Image",
					name = "bj",
					posX = 0.4842368,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.9103448,
					sizeY = 0.862069,
					image = "drcgbj#drcgbj",
				},
			},
			{
				prop = {
					etype = "Button",
					name = "gb",
					varName = "close",
					posX = 0.9650654,
					posY = 0.9355491,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.06600985,
					sizeY = 0.1310345,
					image = "chu1#gb",
					imageNormal = "chu1#gb",
					soundEffectClick = "audio/rxjh/UI/ui_guanbi.ogg",
				},
			},
			{
				prop = {
					etype = "Grid",
					name = "jd",
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
						etype = "Button",
						name = "bz",
						varName = "helpBtn",
						posX = 0.9750901,
						posY = 0.205657,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.06009852,
						sizeY = 0.1137931,
						image = "tong#bz",
						imageNormal = "tong#bz",
						disablePressScale = true,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "gq",
						posX = 0.3937781,
						posY = 0.7530571,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.6,
						sizeY = 0.25,
						text = "当前关卡：",
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "gq2",
						varName = "curName",
						posX = 0.4390237,
						posY = 0.7530571,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.4918025,
						sizeY = 0.25,
						text = "迷雾洞窟",
						color = "FFFEC901",
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "gq3",
						varName = "curDesc",
						posX = 0.26886,
						posY = 0.5877558,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3501639,
						sizeY = 0.2499999,
						text = "迷雾洞窟",
					},
				},
				{
					prop = {
						etype = "Scroll",
						name = "buff",
						varName = "buffList",
						posX = 0.1557388,
						posY = 0.1264749,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.2512315,
						sizeY = 0.0862069,
						horizontal = true,
						showScrollBar = false,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "xian",
						varName = "line1",
						posX = 0.2843672,
						posY = 0.4036049,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1895362,
						sizeY = 0.05517242,
						image = "drcg#xian1",
						rotation = -20,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "xian2",
						varName = "line2",
						posX = 0.4262325,
						posY = 0.5378661,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1448276,
						sizeY = 0.05517241,
						image = "drcg#xian1",
						rotation = -40,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "xian3",
						varName = "line3",
						posX = 0.5659012,
						posY = 0.5395901,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1448276,
						sizeY = 0.05517241,
						image = "drcg#xian1",
						rotation = 30,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "xian4",
						varName = "line5",
						posX = 0.7399943,
						posY = 0.4018857,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1448276,
						sizeY = 0.05517241,
						image = "drcg#xian1",
						rotation = 25,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "xian5",
						varName = "line4",
						posX = 0.7475143,
						posY = 0.5794172,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.2091001,
						sizeY = 0.05040719,
						image = "drcg#xian1",
						rotation = -40,
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "guan1",
						posX = 0.1822968,
						posY = 0.3499383,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.2085238,
						sizeY = 0.1404499,
					},
					children = {
					{
						prop = {
							etype = "FrameAni",
							name = "sh1",
							sizeXAB = 157.0681,
							sizeYAB = 148.8805,
							posXAB = 104.1612,
							posYAB = 68.4498,
							posX = 0.4921352,
							posY = 0.8402776,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7421065,
							sizeY = 1.82763,
							alpha = 0,
							alphaCascade = true,
							frameEnd = 30,
							frameName = "uieffect/pngnuqi.png",
							delay = 0.1,
							playTimes = 999999,
							frameWidth = 102,
							frameHeight = 85,
							column = 5,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "FrameAni",
							name = "dh1",
							sizeXAB = 157.0681,
							sizeYAB = 148.8805,
							posXAB = 108.1544,
							posYAB = 10.54257,
							posX = 0.5110018,
							posY = 0.1294187,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7421065,
							sizeY = 1.82763,
							alpha = 0,
							alphaCascade = true,
							frameEnd = 30,
							frameName = "uieffect/pngnuqi.png",
							delay = 0.1,
							playTimes = 999999,
							frameWidth = 102,
							frameHeight = 85,
							column = 5,
							blendFunc = 1,
							rotation = 180,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "dt1",
							varName = "bg1",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.4771992,
							sizeY = 1.239858,
							image = "drcg#wkq",
							scale9Left = 0.4,
							scale9Right = 0.4,
						},
					},
					{
						prop = {
							etype = "Particle",
							name = "lizi1",
							sizeXAB = 174.3116,
							sizeYAB = 143.7596,
							posXAB = 195.3784,
							posYAB = 112.8136,
							posX = 0.9231132,
							posY = 1.38488,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8235778,
							sizeY = 1.764767,
							alpha = 0,
							angle = 360,
							angleVariance = -360,
							duration = 999999,
							middleColorAlpha = 1,
							middleColorBlue = 1,
							middleColorGreen = 1,
							middleColorRed = 1,
							finishParticleSize = 0,
							startParticleSize = 30,
							startParticleSizeVariance = 20,
							maxParticles = 15,
							maxRadius = 30,
							minRadius = 60,
							minRadiusVariance = 20,
							particleLifespan = 0.6,
							particleLifespanVariance = 0.1,
							particleLifeMiddle = 0.35,
							startColorBlue = 1,
							startColorGreen = 1,
							startColorRed = 1,
							textureFileName = "uieffect/lizi041161121.png",
						},
					},
					{
						prop = {
							etype = "Image",
							name = "jh1",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.559166,
							sizeY = 4.051022,
							image = "uieffect/001guangyun.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "Button",
							name = "btn1",
							varName = "btn1",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.4771992,
							sizeY = 1.239858,
						},
					},
					{
						prop = {
							etype = "Label",
							name = "gqz",
							varName = "name1",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8000001,
							sizeY = 0.9681712,
							text = "四字标题",
							color = "FF929294",
							fontOutlineEnable = true,
							fontOutlineColor = "FF051022",
							fontOutlineSize = 2,
							hTextAlign = 1,
							vTextAlign = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "wct",
							varName = "isFinish1",
							posX = 0.6650941,
							posY = 0.156858,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 0.387429,
							sizeY = 0.4173779,
							image = "drcg#ywc",
						},
					},
					{
						prop = {
							etype = "Image",
							name = "xzk",
							varName = "select1",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							visible = false,
							sizeX = 0.3401816,
							sizeY = 2.393785,
							image = "drcg#xz",
						},
					},
					},
				},
				{
					prop = {
						etype = "Button",
						name = "yjzb",
						varName = "startBtn",
						posX = 0.659896,
						posY = 0.1356631,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1428572,
						sizeY = 0.09482758,
						image = "chu1#an1",
						imageNormal = "chu1#an1",
						soundEffectClick = "audio/rxjh/UI/anniu.ogg",
					},
					children = {
					{
						prop = {
							etype = "Label",
							name = "ys2",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.9120977,
							sizeY = 1.156784,
							text = "挑战",
							fontSize = 22,
							fontOutlineEnable = true,
							fontOutlineColor = "FFB35F1D",
							fontOutlineSize = 2,
							hTextAlign = 1,
							vTextAlign = 1,
						},
					},
					},
				},
				{
					prop = {
						etype = "Button",
						name = "plcs",
						varName = "petBtn",
						posX = 0.8421777,
						posY = 0.1356631,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.1428572,
						sizeY = 0.09482758,
						image = "chu1#an2",
						imageNormal = "chu1#an2",
						soundEffectClick = "audio/rxjh/UI/anniu.ogg",
					},
					children = {
					{
						prop = {
							etype = "Label",
							name = "ys3",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.9120977,
							sizeY = 1.156784,
							text = "出战设置",
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
				{
					prop = {
						etype = "Label",
						name = "hsz",
						varName = "tips",
						posX = 0.7478786,
						posY = 0.2297543,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.6,
						sizeY = 0.25,
						text = "本关卡尚未开启",
						color = "FFC93034",
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "guan2",
						posX = 0.367214,
						posY = 0.4635457,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.2085238,
						sizeY = 0.1404499,
					},
					children = {
					{
						prop = {
							etype = "FrameAni",
							name = "sh2",
							sizeXAB = 157.0681,
							sizeYAB = 148.8805,
							posXAB = 104.1612,
							posYAB = 68.4498,
							posX = 0.4921352,
							posY = 0.8402776,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7421065,
							sizeY = 1.82763,
							alpha = 0,
							alphaCascade = true,
							frameEnd = 30,
							frameName = "uieffect/pngnuqi.png",
							delay = 0.1,
							playTimes = 999999,
							frameWidth = 102,
							frameHeight = 85,
							column = 5,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "FrameAni",
							name = "dh2",
							sizeXAB = 157.0681,
							sizeYAB = 148.8805,
							posXAB = 108.1544,
							posYAB = 10.54257,
							posX = 0.5110018,
							posY = 0.1294187,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7421065,
							sizeY = 1.82763,
							alpha = 0,
							alphaCascade = true,
							frameEnd = 30,
							frameName = "uieffect/pngnuqi.png",
							delay = 0.1,
							playTimes = 999999,
							frameWidth = 102,
							frameHeight = 85,
							column = 5,
							blendFunc = 1,
							rotation = 180,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "dt2",
							varName = "bg2",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.4771992,
							sizeY = 1.239858,
							image = "drcg#wkq",
							scale9Left = 0.4,
							scale9Right = 0.4,
						},
					},
					{
						prop = {
							etype = "Particle",
							name = "lizi2",
							sizeXAB = 174.3116,
							sizeYAB = 143.7596,
							posXAB = 195.3784,
							posYAB = 112.8136,
							posX = 0.9231132,
							posY = 1.38488,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8235778,
							sizeY = 1.764767,
							alpha = 0,
							angle = 360,
							angleVariance = -360,
							duration = 999999,
							middleColorAlpha = 1,
							middleColorBlue = 1,
							middleColorGreen = 1,
							middleColorRed = 1,
							finishParticleSize = 0,
							startParticleSize = 30,
							startParticleSizeVariance = 20,
							maxParticles = 15,
							maxRadius = 30,
							minRadius = 60,
							minRadiusVariance = 20,
							particleLifespan = 0.6,
							particleLifespanVariance = 0.1,
							particleLifeMiddle = 0.35,
							startColorBlue = 1,
							startColorGreen = 1,
							startColorRed = 1,
							textureFileName = "uieffect/lizi041161121.png",
						},
					},
					{
						prop = {
							etype = "Image",
							name = "jh2",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.559166,
							sizeY = 4.051022,
							image = "uieffect/001guangyun.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "Button",
							name = "btn2",
							varName = "btn2",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.4771992,
							sizeY = 1.239858,
						},
					},
					{
						prop = {
							etype = "Label",
							name = "gqz2",
							varName = "name2",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8000001,
							sizeY = 0.9681712,
							text = "四字标题",
							color = "FF929294",
							fontOutlineEnable = true,
							fontOutlineColor = "FF051022",
							fontOutlineSize = 2,
							hTextAlign = 1,
							vTextAlign = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "wct2",
							varName = "isFinish2",
							posX = 0.6650941,
							posY = 0.156858,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 0.387429,
							sizeY = 0.4173779,
							image = "drcg#ywc",
						},
					},
					{
						prop = {
							etype = "Image",
							name = "xzk2",
							varName = "select2",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							visible = false,
							sizeX = 0.3401816,
							sizeY = 2.393785,
							image = "drcg#xz",
						},
					},
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "guan3",
						posX = 0.4921318,
						posY = 0.6098562,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.2085238,
						sizeY = 0.1404499,
					},
					children = {
					{
						prop = {
							etype = "FrameAni",
							name = "sh3",
							sizeXAB = 157.0681,
							sizeYAB = 148.8805,
							posXAB = 104.1612,
							posYAB = 68.4498,
							posX = 0.4921352,
							posY = 0.8402776,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7421065,
							sizeY = 1.82763,
							alpha = 0,
							alphaCascade = true,
							frameEnd = 30,
							frameName = "uieffect/pngnuqi.png",
							delay = 0.1,
							playTimes = 999999,
							frameWidth = 102,
							frameHeight = 85,
							column = 5,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "FrameAni",
							name = "dh3",
							sizeXAB = 157.0681,
							sizeYAB = 148.8805,
							posXAB = 108.1544,
							posYAB = 10.54257,
							posX = 0.5110018,
							posY = 0.1294187,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7421065,
							sizeY = 1.82763,
							alpha = 0,
							alphaCascade = true,
							frameEnd = 30,
							frameName = "uieffect/pngnuqi.png",
							delay = 0.1,
							playTimes = 999999,
							frameWidth = 102,
							frameHeight = 85,
							column = 5,
							blendFunc = 1,
							rotation = 180,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "dt3",
							varName = "bg3",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.4771992,
							sizeY = 1.239858,
							image = "drcg#wkq",
							scale9Left = 0.4,
							scale9Right = 0.4,
						},
					},
					{
						prop = {
							etype = "Particle",
							name = "lizi3",
							sizeXAB = 174.3116,
							sizeYAB = 143.7596,
							posXAB = 195.3784,
							posYAB = 112.8136,
							posX = 0.9231132,
							posY = 1.38488,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8235778,
							sizeY = 1.764767,
							alpha = 0,
							angle = 360,
							angleVariance = -360,
							duration = 999999,
							middleColorAlpha = 1,
							middleColorBlue = 1,
							middleColorGreen = 1,
							middleColorRed = 1,
							finishParticleSize = 0,
							startParticleSize = 30,
							startParticleSizeVariance = 20,
							maxParticles = 15,
							maxRadius = 30,
							minRadius = 60,
							minRadiusVariance = 20,
							particleLifespan = 0.6,
							particleLifespanVariance = 0.1,
							particleLifeMiddle = 0.35,
							startColorBlue = 1,
							startColorGreen = 1,
							startColorRed = 1,
							textureFileName = "uieffect/lizi041161121.png",
						},
					},
					{
						prop = {
							etype = "Image",
							name = "jh3",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.559166,
							sizeY = 4.051022,
							image = "uieffect/001guangyun.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "Button",
							name = "btn3",
							varName = "btn3",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.4771992,
							sizeY = 1.239858,
						},
					},
					{
						prop = {
							etype = "Label",
							name = "gqz3",
							varName = "name3",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8000001,
							sizeY = 0.9681712,
							text = "四字标题",
							color = "FF929294",
							fontOutlineEnable = true,
							fontOutlineColor = "FF051022",
							fontOutlineSize = 2,
							hTextAlign = 1,
							vTextAlign = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "wct3",
							varName = "isFinish3",
							posX = 0.6650941,
							posY = 0.156858,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 0.387429,
							sizeY = 0.4173779,
							image = "drcg#ywc",
						},
					},
					{
						prop = {
							etype = "Image",
							name = "xzk3",
							varName = "select3",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							visible = false,
							sizeX = 0.3401816,
							sizeY = 2.393785,
							image = "drcg#xz",
						},
					},
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "guan4",
						posX = 0.6524608,
						posY = 0.4635456,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.2085238,
						sizeY = 0.1404499,
					},
					children = {
					{
						prop = {
							etype = "FrameAni",
							name = "sh4",
							sizeXAB = 157.0681,
							sizeYAB = 148.8805,
							posXAB = 104.1612,
							posYAB = 68.4498,
							posX = 0.4921352,
							posY = 0.8402776,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7421065,
							sizeY = 1.82763,
							alpha = 0,
							alphaCascade = true,
							frameEnd = 30,
							frameName = "uieffect/pngnuqi.png",
							delay = 0.1,
							playTimes = 999999,
							frameWidth = 102,
							frameHeight = 85,
							column = 5,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "FrameAni",
							name = "dh4",
							sizeXAB = 157.0681,
							sizeYAB = 148.8805,
							posXAB = 108.1544,
							posYAB = 10.54257,
							posX = 0.5110018,
							posY = 0.1294187,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7421065,
							sizeY = 1.82763,
							alpha = 0,
							alphaCascade = true,
							frameEnd = 30,
							frameName = "uieffect/pngnuqi.png",
							delay = 0.1,
							playTimes = 999999,
							frameWidth = 102,
							frameHeight = 85,
							column = 5,
							blendFunc = 1,
							rotation = 180,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "dt4",
							varName = "bg4",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.4771992,
							sizeY = 1.239858,
							image = "drcg#wkq",
							scale9Left = 0.4,
							scale9Right = 0.4,
						},
					},
					{
						prop = {
							etype = "Particle",
							name = "lizi4",
							sizeXAB = 174.3116,
							sizeYAB = 143.7596,
							posXAB = 195.3784,
							posYAB = 112.8136,
							posX = 0.9231132,
							posY = 1.38488,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8235778,
							sizeY = 1.764767,
							alpha = 0,
							angle = 360,
							angleVariance = -360,
							duration = 999999,
							middleColorAlpha = 1,
							middleColorBlue = 1,
							middleColorGreen = 1,
							middleColorRed = 1,
							finishParticleSize = 0,
							startParticleSize = 30,
							startParticleSizeVariance = 20,
							maxParticles = 15,
							maxRadius = 30,
							minRadius = 60,
							minRadiusVariance = 20,
							particleLifespan = 0.6,
							particleLifespanVariance = 0.1,
							particleLifeMiddle = 0.35,
							startColorBlue = 1,
							startColorGreen = 1,
							startColorRed = 1,
							textureFileName = "uieffect/lizi041161121.png",
						},
					},
					{
						prop = {
							etype = "Image",
							name = "jh4",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.559166,
							sizeY = 4.051022,
							image = "uieffect/001guangyun.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "Button",
							name = "btn4",
							varName = "btn4",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.4771992,
							sizeY = 1.239858,
						},
					},
					{
						prop = {
							etype = "Label",
							name = "gqz4",
							varName = "name4",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8000001,
							sizeY = 0.9681712,
							text = "四字标题",
							color = "FF929294",
							fontOutlineEnable = true,
							fontOutlineColor = "FF051022",
							fontOutlineSize = 2,
							hTextAlign = 1,
							vTextAlign = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "wct4",
							varName = "isFinish4",
							posX = 0.6650941,
							posY = 0.156858,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 0.387429,
							sizeY = 0.4173779,
							image = "drcg#ywc",
						},
					},
					{
						prop = {
							etype = "Image",
							name = "xzk4",
							varName = "select4",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							visible = false,
							sizeX = 0.3401816,
							sizeY = 2.393785,
							image = "drcg#xz",
						},
					},
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "guan5",
						posX = 0.823607,
						posY = 0.6924797,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.2085238,
						sizeY = 0.1404499,
					},
					children = {
					{
						prop = {
							etype = "FrameAni",
							name = "sh5",
							sizeXAB = 157.0681,
							sizeYAB = 148.8805,
							posXAB = 104.1612,
							posYAB = 68.4498,
							posX = 0.4921352,
							posY = 0.8402776,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7421065,
							sizeY = 1.82763,
							alpha = 0,
							alphaCascade = true,
							frameEnd = 30,
							frameName = "uieffect/pngnuqi.png",
							delay = 0.1,
							playTimes = 999999,
							frameWidth = 102,
							frameHeight = 85,
							column = 5,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "FrameAni",
							name = "dh5",
							sizeXAB = 157.0681,
							sizeYAB = 148.8805,
							posXAB = 108.1544,
							posYAB = 10.54257,
							posX = 0.5110018,
							posY = 0.1294187,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7421065,
							sizeY = 1.82763,
							alpha = 0,
							alphaCascade = true,
							frameEnd = 30,
							frameName = "uieffect/pngnuqi.png",
							delay = 0.1,
							playTimes = 999999,
							frameWidth = 102,
							frameHeight = 85,
							column = 5,
							blendFunc = 1,
							rotation = 180,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "dt5",
							varName = "bg5",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.4771992,
							sizeY = 1.239858,
							image = "drcg#wkq",
							scale9Left = 0.4,
							scale9Right = 0.4,
						},
					},
					{
						prop = {
							etype = "Particle",
							name = "lizi5",
							sizeXAB = 174.3116,
							sizeYAB = 143.7596,
							posXAB = 195.3784,
							posYAB = 112.8136,
							posX = 0.9231132,
							posY = 1.38488,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8235778,
							sizeY = 1.764767,
							alpha = 0,
							angle = 360,
							angleVariance = -360,
							duration = 999999,
							middleColorAlpha = 1,
							middleColorBlue = 1,
							middleColorGreen = 1,
							middleColorRed = 1,
							finishParticleSize = 0,
							startParticleSize = 30,
							startParticleSizeVariance = 20,
							maxParticles = 15,
							maxRadius = 30,
							minRadius = 60,
							minRadiusVariance = 20,
							particleLifespan = 0.6,
							particleLifespanVariance = 0.1,
							particleLifeMiddle = 0.35,
							startColorBlue = 1,
							startColorGreen = 1,
							startColorRed = 1,
							textureFileName = "uieffect/lizi041161121.png",
						},
					},
					{
						prop = {
							etype = "Image",
							name = "jh5",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.559166,
							sizeY = 4.051022,
							image = "uieffect/001guangyun.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "Button",
							name = "btn5",
							varName = "btn5",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.4771992,
							sizeY = 1.239858,
						},
					},
					{
						prop = {
							etype = "Label",
							name = "gqz5",
							varName = "name5",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8000001,
							sizeY = 0.9681712,
							text = "四字标题",
							color = "FF929294",
							fontOutlineEnable = true,
							fontOutlineColor = "FF051022",
							fontOutlineSize = 2,
							hTextAlign = 1,
							vTextAlign = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "wct5",
							varName = "isFinish5",
							posX = 0.6650941,
							posY = 0.156858,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 0.387429,
							sizeY = 0.4173779,
							image = "drcg#ywc",
						},
					},
					{
						prop = {
							etype = "Image",
							name = "xzk5",
							varName = "select5",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							visible = false,
							sizeX = 0.3401816,
							sizeY = 2.393785,
							image = "drcg#xz",
						},
					},
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "guan6",
						posX = 0.8304924,
						posY = 0.3551033,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.2085238,
						sizeY = 0.1404499,
					},
					children = {
					{
						prop = {
							etype = "FrameAni",
							name = "sh6",
							sizeXAB = 157.0681,
							sizeYAB = 148.8805,
							posXAB = 104.1612,
							posYAB = 68.4498,
							posX = 0.4921352,
							posY = 0.8402776,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7421065,
							sizeY = 1.82763,
							alpha = 0,
							alphaCascade = true,
							frameEnd = 30,
							frameName = "uieffect/pngnuqi.png",
							delay = 0.1,
							playTimes = 999999,
							frameWidth = 102,
							frameHeight = 85,
							column = 5,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "FrameAni",
							name = "dh6",
							sizeXAB = 157.0681,
							sizeYAB = 148.8805,
							posXAB = 108.1544,
							posYAB = 10.54257,
							posX = 0.5110018,
							posY = 0.1294187,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7421065,
							sizeY = 1.82763,
							alpha = 0,
							alphaCascade = true,
							frameEnd = 30,
							frameName = "uieffect/pngnuqi.png",
							delay = 0.1,
							playTimes = 999999,
							frameWidth = 102,
							frameHeight = 85,
							column = 5,
							blendFunc = 1,
							rotation = 180,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "dt6",
							varName = "bg6",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.4771992,
							sizeY = 1.239858,
							image = "drcg#wkq",
							scale9Left = 0.4,
							scale9Right = 0.4,
						},
					},
					{
						prop = {
							etype = "Particle",
							name = "lizi6",
							sizeXAB = 174.3116,
							sizeYAB = 143.7596,
							posXAB = 195.3784,
							posYAB = 112.8136,
							posX = 0.9231132,
							posY = 1.38488,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8235778,
							sizeY = 1.764767,
							alpha = 0,
							angle = 360,
							angleVariance = -360,
							duration = 999999,
							middleColorAlpha = 1,
							middleColorBlue = 1,
							middleColorGreen = 1,
							middleColorRed = 1,
							finishParticleSize = 0,
							startParticleSize = 30,
							startParticleSizeVariance = 20,
							maxParticles = 15,
							maxRadius = 30,
							minRadius = 60,
							minRadiusVariance = 20,
							particleLifespan = 0.6,
							particleLifespanVariance = 0.1,
							particleLifeMiddle = 0.35,
							startColorBlue = 1,
							startColorGreen = 1,
							startColorRed = 1,
							textureFileName = "uieffect/lizi041161121.png",
						},
					},
					{
						prop = {
							etype = "Image",
							name = "jh6",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.559166,
							sizeY = 4.051022,
							image = "uieffect/001guangyun.png",
							alpha = 0,
							blendFunc = 1,
						},
					},
					{
						prop = {
							etype = "Button",
							name = "btn6",
							varName = "btn6",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.4771992,
							sizeY = 1.239858,
						},
					},
					{
						prop = {
							etype = "Label",
							name = "gqz6",
							varName = "name6",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8000001,
							sizeY = 0.9681712,
							text = "四字标题",
							color = "FF929294",
							fontOutlineEnable = true,
							fontOutlineColor = "FF051022",
							fontOutlineSize = 2,
							hTextAlign = 1,
							vTextAlign = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "wct6",
							varName = "isFinish6",
							posX = 0.6650941,
							posY = 0.156858,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 0.387429,
							sizeY = 0.4173779,
							image = "drcg#ywc",
						},
					},
					{
						prop = {
							etype = "Image",
							name = "xzk6",
							varName = "select6",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							visible = false,
							sizeX = 0.3401816,
							sizeY = 2.393785,
							image = "drcg#xz",
						},
					},
					},
				},
				},
			},
			},
		},
		{
			prop = {
				etype = "Image",
				name = "top",
				posX = 0.5,
				posY = 0.8751824,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.20625,
				sizeY = 0.07222223,
				image = "chu1#top",
				scale9Left = 0.4,
				scale9Right = 0.4,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "topz",
					posX = 0.5,
					posY = 0.4996001,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.5151515,
					sizeY = 0.4807692,
					image = "biaoti#drcg",
				},
			},
			},
		},
		{
			prop = {
				etype = "Particle",
				name = "huoxing",
				sizeXAB = 768,
				sizeYAB = 180,
				posXAB = 949.4919,
				posYAB = 183.2908,
				posX = 0.7417906,
				posY = 0.2545705,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.6,
				sizeY = 0.25,
				angle = 45,
				angleVariance = 30,
				emitterType = 0,
				finishParticleSize = 0,
				startParticleSize = 70,
				startParticleSizeVariance = 30,
				maxParticles = 15,
				particleLifespan = 2,
				particleLifespanVariance = 1,
				particleLifeMiddle = 0.3,
				sourcePositionVariancex = 700,
				sourcePositionVariancey = 50,
				speed = 200,
				speedVariance = 50,
				startColorBlue = 1,
				startColorGreen = 1,
				startColorRed = 1,
				textureFileName = "uieffect/067lizi.png",
				useMiddleFrame = true,
				playOnInit = true,
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
	dk = {
		ysjm = {
			scale = {{0, {0.3, 0.3, 1}}, {150, {1.05, 1.05, 1}}, {200, {1,1,1}}, },
		},
	},
	jh1 = {
		jh1 = {
			alpha = {{0, {0.96}}, {5000, {1}}, },
		},
	},
	sh1 = {
		sh1 = {
			alpha = {{0, {0.8}}, {5000, {0.8}}, },
		},
	},
	dh1 = {
		dh1 = {
			alpha = {{0, {0.8}}, {5000, {0.8}}, },
		},
	},
	jh2 = {
		jh2 = {
			alpha = {{0, {0.96}}, {5000, {1}}, },
		},
	},
	sh2 = {
		sh2 = {
			alpha = {{0, {0.8}}, {5000, {0.8}}, },
		},
	},
	dh2 = {
		dh2 = {
			alpha = {{0, {0.8}}, {5000, {0.8}}, },
		},
	},
	jh3 = {
		jh3 = {
			alpha = {{0, {0.96}}, {5000, {1}}, },
		},
	},
	sh3 = {
		sh3 = {
			alpha = {{0, {0.8}}, {5000, {0.8}}, },
		},
	},
	dh3 = {
		dh3 = {
			alpha = {{0, {0.8}}, {5000, {0.8}}, },
		},
	},
	jh4 = {
		jh4 = {
			alpha = {{0, {0.96}}, {5000, {1}}, },
		},
	},
	sh4 = {
		sh4 = {
			alpha = {{0, {0.8}}, {5000, {0.8}}, },
		},
	},
	dh4 = {
		dh4 = {
			alpha = {{0, {0.8}}, {5000, {0.8}}, },
		},
	},
	jh5 = {
		jh5 = {
			alpha = {{0, {0.96}}, {5000, {1}}, },
		},
	},
	sh5 = {
		sh5 = {
			alpha = {{0, {0.8}}, {5000, {0.8}}, },
		},
	},
	dh5 = {
		dh5 = {
			alpha = {{0, {0.8}}, {5000, {0.8}}, },
		},
	},
	jh6 = {
		jh6 = {
			alpha = {{0, {0.96}}, {5000, {1}}, },
		},
	},
	sh6 = {
		sh6 = {
			alpha = {{0, {0.8}}, {5000, {0.8}}, },
		},
	},
	dh6 = {
		dh6 = {
			alpha = {{0, {0.8}}, {5000, {0.8}}, },
		},
	},
	c_dakai = {
		{0,"dk", 1, 0},
	},
	c_jh01 = {
		{0,"jh1", -1, 50},
		{0,"sh1", -1, 50},
		{0,"dh1", -1, 50},
		{2,"lizi1", 1, 0},
	},
	c_jh02 = {
		{0,"jh2", -1, 50},
		{0,"sh2", -1, 50},
		{0,"dh2", -1, 50},
		{2,"lizi2", 1, 0},
	},
	c_jh03 = {
		{0,"jh3", -1, 50},
		{0,"sh3", -1, 50},
		{0,"dh3", -1, 50},
		{2,"lizi3", 1, 0},
	},
	c_jh04 = {
		{0,"jh4", -1, 50},
		{0,"sh4", -1, 50},
		{0,"dh4", -1, 50},
		{2,"lizi4", 1, 0},
	},
	c_jh05 = {
		{0,"jh5", -1, 50},
		{0,"sh5", -1, 50},
		{0,"dh5", -1, 50},
		{2,"lizi5", 1, 0},
	},
	c_jh06 = {
		{0,"jh6", -1, 50},
		{0,"sh6", -1, 50},
		{0,"dh6", -1, 50},
		{2,"lizi6", 1, 0},
	},
}
--EDITOR animations end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot, l_animations)
end
return create
