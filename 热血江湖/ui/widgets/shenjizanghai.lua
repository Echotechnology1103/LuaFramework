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
				name = "z2",
				posX = 0.5,
				posY = 0.4638885,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.9188007,
				sizeY = 0.9355062,
				image = "a",
				scale9 = true,
				scale9Left = 0.41,
				scale9Right = 0.37,
				scale9Top = 0.3,
				scale9Bottom = 0.3,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "db",
					posX = 0.6220188,
					posY = 0.4905233,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.6549055,
					sizeY = 0.8787524,
					image = "sjzhbj#sjzhbj",
				},
			},
			{
				prop = {
					etype = "Image",
					name = "dt1",
					posX = 0.625213,
					posY = 0.3073761,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.6629893,
					sizeY = 0.5276653,
					scale9 = true,
					scale9Left = 0.45,
					scale9Right = 0.45,
					scale9Top = 0.45,
					scale9Bottom = 0.45,
				},
				children = {
				{
					prop = {
						etype = "Label",
						name = "dz1",
						posX = 0.2046009,
						posY = 0.6577259,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.259005,
						sizeY = 0.1636638,
						text = "需求等级：",
						color = "FF939FF8",
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "dz2",
						varName = "need_lvl",
						posX = 0.4084064,
						posY = 0.6577258,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.4122587,
						sizeY = 0.1636638,
						text = "60",
						color = "FF939FF8",
						fontOutlineColor = "FF27221D",
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "dz3",
						posX = 0.2046009,
						posY = 0.5706268,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.259005,
						sizeY = 0.1636638,
						text = "开启日期：",
						color = "FF939FF8",
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "dz4",
						varName = "open_date",
						posX = 0.4493798,
						posY = 0.5706268,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.4942051,
						sizeY = 0.1636638,
						text = "10：00~12：30",
						color = "FF939FF8",
						fontOutlineColor = "FF27221D",
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "dz5",
						posX = 0.2046009,
						posY = 0.4835275,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.259005,
						sizeY = 0.1636638,
						text = "开启时间：",
						color = "FF939FF8",
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "dz6",
						varName = "open_time",
						posX = 0.4084064,
						posY = 0.4835275,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.4122587,
						sizeY = 0.1636638,
						text = "5",
						color = "FF939FF8",
						fontOutlineColor = "FF27221D",
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Button",
						name = "cj",
						varName = "join",
						posX = 0.8482802,
						posY = 0.1900416,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.2090498,
						sizeY = 0.1800704,
						image = "chu1#an2",
						imageNormal = "chu1#an2",
						soundEffectClick = "audio/rxjh/UI/anniu.ogg",
					},
					children = {
					{
						prop = {
							etype = "Label",
							name = "asc",
							varName = "join_text",
							posX = 0.5,
							posY = 0.53125,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.003805,
							sizeY = 0.9757967,
							text = "报 名",
							fontSize = 24,
							fontOutlineEnable = true,
							fontOutlineColor = "FF2A6953",
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
						name = "dz9",
						varName = "not_open",
						posX = 0.8418556,
						posY = 0.3345736,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.6332906,
						sizeY = 0.1636638,
						text = "尚未开启",
						color = "FFFB2642",
						fontSize = 22,
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "dz10",
						varName = "countdown_desc",
						posX = 0.6806381,
						posY = 0.3345736,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3288093,
						sizeY = 0.1636638,
						text = "结束倒计时：",
						color = "FFFB2642",
						hTextAlign = 2,
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "dz11",
						varName = "countdown",
						posX = 1.014676,
						posY = 0.3345736,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3136994,
						sizeY = 0.1636638,
						text = "10",
						color = "FFFB2642",
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "zs1",
						posX = 0.05313276,
						posY = 0.6573052,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.02949782,
						sizeY = 0.05064479,
						image = "chu1#zsk2",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "zs2",
						posX = 0.05313276,
						posY = 0.4835278,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.02949782,
						sizeY = 0.05064479,
						image = "chu1#zsk2",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "zs3",
						posX = 0.05313276,
						posY = 0.5706268,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.02949782,
						sizeY = 0.05064479,
						image = "chu1#zsk2",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "zs4",
						posX = 0.05441751,
						posY = 0.3738606,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.02949782,
						sizeY = 0.05064479,
						image = "chu1#zsk2",
					},
				},
				{
					prop = {
						etype = "Label",
						name = "dz7",
						posX = 0.2046009,
						posY = 0.3738604,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.259005,
						sizeY = 0.1636638,
						text = "奖励",
						color = "FF939FF8",
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "dz8",
						varName = "tips",
						posX = 0.4481663,
						posY = 0.3738604,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.4122587,
						sizeY = 0.1636638,
						text = "xxx",
						color = "FF939FF8",
						fontOutlineColor = "FF27221D",
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Button",
						name = "jl",
						varName = "rewardBt",
						posX = 0.9110123,
						posY = 1.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1192738,
						sizeY = 0.2447832,
						image = "jjcc#jl",
						imageNormal = "jjcc#jl",
						disablePressScale = true,
					},
				},
				{
					prop = {
						etype = "Button",
						name = "jl2",
						varName = "rankBt",
						posX = 0.9110124,
						posY = 1.202008,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1192738,
						sizeY = 0.2475968,
						image = "jjcc#xytd",
						imageNormal = "jjcc#xytd",
						disablePressScale = true,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "th",
						posX = 0.219596,
						posY = 0.3735965,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.02821531,
						sizeY = 0.06189919,
						image = "zdsjzh#th",
					},
				},
				{
					prop = {
						etype = "Button",
						name = "jl3",
						varName = "comicBtn",
						posX = 0.9116537,
						posY = 0.9068296,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1205563,
						sizeY = 0.239156,
						image = "gzcj#qq",
						imageNormal = "gzcj#qq",
						disablePressScale = true,
					},
				},
				},
			},
			{
				prop = {
					etype = "Grid",
					name = "jd",
					varName = "reward",
					posX = 0.6218236,
					posY = 0.2199235,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.6629893,
					sizeY = 0.337943,
				},
				children = {
				{
					prop = {
						etype = "Scroll",
						name = "lb",
						varName = "rewards",
						posX = 0.3870138,
						posY = 0.2748092,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.6651318,
						sizeY = 0.3514531,
						horizontal = true,
						showScrollBar = false,
					},
				},
				},
			},
			},
		},
		{
			prop = {
				etype = "Button",
				name = "an6",
				varName = "helpBtn",
				posX = 0.9346552,
				posY = 0.1131345,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.05,
				sizeY = 0.0875,
				image = "tong#bz",
				imageNormal = "tong#bz",
				soundEffectClick = "audio/rxjh/UI/anniu.ogg",
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
