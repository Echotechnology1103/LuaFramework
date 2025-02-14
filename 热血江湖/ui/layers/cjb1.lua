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
				posY = 0.5,
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
					posX = 0.5000001,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1,
					sizeY = 0.9492624,
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
						posX = 0.5,
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
					etype = "Grid",
					name = "kk1",
					varName = "kk1",
					posX = 0.5,
					posY = 0.4913747,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.9999999,
					sizeY = 0.9601052,
				},
				children = {
				{
					prop = {
						etype = "Image",
						name = "g2",
						posX = 0.3507954,
						posY = 0.5154664,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.6039409,
						sizeY = 0.9032775,
						image = "cjbbj1#cjbbj1",
						scale9Left = 0.4,
						scale9Right = 0.4,
						scale9Top = 0.4,
						scale9Bottom = 0.4,
					},
					children = {
					{
						prop = {
							etype = "Label",
							name = "wcd",
							varName = "curpurcent",
							posX = 0.627575,
							posY = 0.06501963,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.6,
							sizeY = 0.1541984,
							text = "完成度：100%",
							color = "FF88DA5E",
							fontOutlineEnable = true,
							fontOutlineColor = "FF2E4010",
							fontOutlineSize = 2,
							hTextAlign = 2,
							vTextAlign = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "jxd2",
							varName = "duigou",
							posX = 0.06686059,
							posY = 0.06606792,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.06199021,
							sizeY = 0.06759443,
						},
					},
					{
						prop = {
							etype = "Button",
							name = "an",
							varName = "showBtn",
							posX = 0.14513,
							posY = 0.07145792,
							anchorX = 0.5,
							anchorY = 0.5,
							visible = false,
							sizeX = 0.2606056,
							sizeY = 0.1400926,
						},
					},
					},
				},
				{
					prop = {
						etype = "Image",
						name = "g1",
						posX = 0.7960366,
						posY = 0.5274574,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3812808,
						sizeY = 0.9284183,
						image = "cjbbj2#cjbbj2",
						scale9Left = 0.4,
						scale9Right = 0.4,
						scale9Top = 0.4,
						scale9Bottom = 0.4,
					},
					children = {
					{
						prop = {
							etype = "Grid",
							name = "maxview",
							varName = "showMaxView",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							visible = false,
							sizeX = 0.8661131,
							sizeY = 0.3483482,
						},
						children = {
						{
							prop = {
								etype = "Label",
								name = "jsfc13",
								posX = -0.2931828,
								posY = -0.683638,
								anchorX = 0.5,
								anchorY = 0.5,
								sizeX = 1.2473,
								sizeY = 0.7341279,
								text = "当前没有其他的神器可与之融合",
								color = "FFC93034",
								fontSize = 22,
								hTextAlign = 1,
								vTextAlign = 1,
							},
						},
						},
					},
					{
						prop = {
							etype = "Label",
							name = "jsfc12",
							varName = "tips",
							posX = 0.5,
							posY = 0.262613,
							anchorX = 0.5,
							anchorY = 0.5,
							visible = false,
							sizeX = 0.6824536,
							sizeY = 0.1446585,
							text = "达到x完美提升属性",
							color = "FFC93034",
							fontSize = 22,
							hTextAlign = 1,
							vTextAlign = 1,
						},
					},
					},
				},
				{
					prop = {
						etype = "Button",
						name = "an1",
						varName = "upLvlBtn",
						posX = 0.7960691,
						posY = 0.2111545,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.1558442,
						sizeY = 0.1077468,
						image = "chu1#an2",
						imageNormal = "chu1#an2",
						soundEffectClick = "audio/rxjh/UI/anniu.ogg",
					},
					children = {
					{
						prop = {
							etype = "Label",
							name = "j1",
							varName = "upLvlBtntxt",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.9322476,
							sizeY = 1.09296,
							text = "强化解封",
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
						etype = "RichText",
						name = "jsfc",
						varName = "haveTimes",
						posX = 0.7960691,
						posY = 0.1298665,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.2783611,
						sizeY = 0.1446585,
						text = "每日可解封3次",
						color = "FF966856",
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Button",
						name = "kan",
						varName = "upBtn",
						posX = 0.7990318,
						posY = 0.2460198,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.2667208,
						sizeY = 0.1608494,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "zl",
						posX = 0.7519819,
						posY = 0.8677177,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.03448276,
						sizeY = 0.05746496,
						image = "tong#zl",
					},
					children = {
					{
						prop = {
							etype = "Label",
							name = "slz",
							varName = "fightPower",
							posX = 3.858539,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 4.749801,
							sizeY = 1.793554,
							text = "5000",
							color = "FFFFE7AF",
							fontSize = 22,
							fontOutlineEnable = true,
							fontOutlineColor = "FFB2722C",
							fontOutlineSize = 2,
							vTextAlign = 1,
						},
					},
					},
				},
				{
					prop = {
						etype = "Button",
						name = "an2",
						varName = "starUpBtn",
						posX = 0.1149183,
						posY = 0.8584117,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.09162562,
						sizeY = 0.1616202,
						image = "xinghun#xinghun",
						imageNormal = "xinghun#xinghun",
						soundEffectClick = "audio/rxjh/UI/anniu.ogg",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "bjt",
						varName = "weaponIcon",
						posX = 0.114427,
						posY = 0.4336644,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1211823,
						sizeY = 0.8027138,
						image = "qr#dao2",
					},
				},
				},
			},
			{
				prop = {
					etype = "Button",
					name = "gb",
					varName = "close",
					posX = 0.966018,
					posY = 0.9081962,
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
					etype = "Scroll",
					name = "lb",
					varName = "scroll",
					posX = 0.7960691,
					posY = 0.5404709,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.2990165,
					sizeY = 0.504343,
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
					sizeX = 0.6401515,
					sizeY = 0.4807692,
					image = "biaoti#cfsq",
				},
			},
			},
		},
		{
			prop = {
				etype = "Sprite3D",
				name = "mx",
				varName = "modle",
				posX = 0.3874225,
				posY = 0.2699118,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1914847,
				sizeY = 0.5545838,
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
	c_dakai = {
		{0,"dk", 1, 0},
	},
}
--EDITOR animations end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot, l_animations)
end
return create
