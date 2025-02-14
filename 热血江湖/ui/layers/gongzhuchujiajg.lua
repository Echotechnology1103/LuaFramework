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
			scale9Left = 0.3,
			scale9Right = 0.3,
			scale9Top = 0.3,
			scale9Bottom = 0.3,
			alpha = 0.7,
		},
		children = {
		{
			prop = {
				etype = "Button",
				name = "dd",
				varName = "close",
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
				name = "db1",
				posX = 0.5,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.859375,
				sizeY = 0.875,
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
					varName = "image",
					posX = 0.5,
					posY = 0.54127,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1.163636,
					sizeY = 1.007936,
					image = "gzcjsl#gzcjsl",
					scale9Left = 0.45,
					scale9Right = 0.45,
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
						etype = "Image",
						name = "dw",
						posX = 0.811306,
						posY = 0.635552,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.250497,
						sizeY = 0.5942698,
						scale9 = true,
						scale9Left = 0.4,
						scale9Right = 0.4,
						scale9Top = 0.4,
						scale9Bottom = 0.4,
					},
					children = {
					{
						prop = {
							etype = "Scroll",
							name = "lb1",
							varName = "rankingScroll",
							posX = 0.3328108,
							posY = 0.1919067,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.689448,
							sizeY = 0.7306653,
							showScrollBar = false,
						},
					},
					},
				},
				{
					prop = {
						etype = "Image",
						name = "dk",
						posX = 0.5,
						posY = 0.1878712,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.8703874,
						sizeY = 0.2820756,
						image = "d#tyd",
						alpha = 0.3,
					},
					children = {
					{
						prop = {
							etype = "Scroll",
							name = "lb",
							varName = "rewardScroll",
							posX = 0.2403534,
							posY = 1.162799,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.5306015,
							sizeY = 0.4783137,
							horizontal = true,
							showScrollBar = false,
						},
					},
					{
						prop = {
							etype = "Button",
							name = "qd",
							varName = "closeBtn",
							posX = 0.2403534,
							posY = 0.6065718,
							anchorX = 0.5,
							anchorY = 0.5,
							lockHV = true,
							sizeX = 0.1652157,
							sizeY = 0.3376332,
							image = "chu1#an1",
							imageNormal = "chu1#an1",
							disablePressScale = true,
						},
						children = {
						{
							prop = {
								etype = "Label",
								name = "qdz",
								posX = 0.5,
								posY = 0.5,
								anchorX = 0.5,
								anchorY = 0.5,
								sizeX = 0.884392,
								sizeY = 1.226486,
								text = "确 定",
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
							etype = "Label",
							name = "miao",
							varName = "countDown",
							posX = 0.5387843,
							posY = 0.6065719,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.4084454,
							sizeY = 0.557584,
							text = "5s",
							color = "FFFFEEB2",
							vTextAlign = 1,
						},
					},
					{
						prop = {
							etype = "Label",
							name = "pm15",
							varName = "rewardType",
							posX = 0.2403534,
							posY = 1.562204,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.2753481,
							sizeY = 0.4957687,
							text = "我的排名奖励",
							color = "FFFFE0AB",
							fontSize = 22,
							fontOutlineEnable = true,
							fontOutlineColor = "FF996856",
							fontOutlineSize = 2,
							hTextAlign = 1,
							vTextAlign = 1,
							colorTL = "FFFFFDD1",
							colorTR = "FFFFFDD1",
							colorBR = "FFF0A618",
							colorBL = "FFF0A618",
							autoWrap = false,
						},
					},
					{
						prop = {
							etype = "Label",
							name = "miao2",
							varName = "tipsDesc",
							posX = 0.5,
							posY = 0.1627464,
							anchorX = 0.5,
							anchorY = 0.5,
							visible = false,
							sizeX = 0.5537028,
							sizeY = 0.557584,
							text = "结算提示",
							color = "FFFFEEB2",
							hTextAlign = 1,
							vTextAlign = 1,
						},
					},
					},
				},
				{
					prop = {
						etype = "Label",
						name = "pm14",
						varName = "selfRanking",
						posX = 0.2740069,
						posY = 0.6085438,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1960407,
						sizeY = 0.1758992,
						text = "20",
						fontSize = 34,
						fontOutlineEnable = true,
						fontOutlineColor = "FF562812",
						fontOutlineSize = 2,
						hTextAlign = 1,
						vTextAlign = 1,
						colorTL = "FFFFFDD1",
						colorTR = "FFFFFDD1",
						colorBR = "FFF0A618",
						colorBL = "FFF0A618",
						useQuadColor = true,
					},
				},
				},
			},
			},
		},
		{
			prop = {
				etype = "Button",
				name = "bz2",
				varName = "ShareBtn",
				posX = 0.9094115,
				posY = 0.2339576,
				anchorX = 0.5,
				anchorY = 0.5,
				visible = false,
				sizeX = 0.04765625,
				sizeY = 0.09166667,
				image = "tong#fx",
				imageNormal = "tong#fx",
				disablePressScale = true,
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
}
--EDITOR animations end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot, l_animations)
end
return create
