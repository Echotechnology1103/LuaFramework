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
			etype = "Image",
			name = "shengxing2",
			varName = "upstarMaxRoot",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.29375,
			sizeY = 0.7763889,
			scale9 = true,
			scale9Left = 0.2,
			scale9Right = 0.2,
		},
		children = {
		{
			prop = {
				etype = "Image",
				name = "kk4",
				posX = 0.5,
				posY = 0.249841,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 1,
				sizeY = 0.4336006,
				image = "b#d2",
				scale9 = true,
				scale9Left = 0.45,
				scale9Right = 0.4,
				scale9Top = 0.4,
				scale9Bottom = 0.4,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "top5",
					posX = 0.5,
					posY = 0.9018417,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.4946809,
					sizeY = 0.1485254,
					image = "chu1#top2",
				},
				children = {
				{
					prop = {
						etype = "Label",
						name = "wbz",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.8099124,
						sizeY = 1.24792,
						text = "满星加成",
						color = "FFF1E9D7",
						fontOutlineEnable = true,
						fontOutlineColor = "FFA47848",
						fontOutlineSize = 2,
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "mei",
						varName = "maxLvl_Decs",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						visible = false,
						sizeX = 0.6,
						sizeY = 0.25,
					},
				},
				},
			},
			},
		},
		{
			prop = {
				etype = "Label",
				name = "zsxm2",
				varName = "attribute3",
				posX = 0.3861538,
				posY = 0.3587377,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.2895475,
				sizeY = 0.0673549,
				text = "神兵伤害：",
				color = "FF966856",
				fontSize = 22,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "zsxm3",
				varName = "attribute4",
				posX = 0.3861537,
				posY = 0.2906336,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.2895475,
				sizeY = 0.0673549,
				text = "神兵防御：",
				color = "FF966856",
				fontSize = 22,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "zsxm4",
				varName = "attribute5",
				posX = 0.3861537,
				posY = 0.2225295,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.2895475,
				sizeY = 0.0673549,
				text = "暴击：",
				color = "FF966856",
				fontSize = 22,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "zsxm5",
				varName = "attribute6",
				posX = 0.3861537,
				posY = 0.1544254,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.2895475,
				sizeY = 0.0673549,
				text = "韧性：",
				color = "FF966856",
				fontSize = 22,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "zsxm6",
				varName = "attribute7",
				posX = 0.3861538,
				posY = 0.08632129,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.2895475,
				sizeY = 0.0673549,
				text = "神兵品阶：",
				color = "FF966856",
				fontSize = 22,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "zsxz",
				varName = "value3",
				posX = 0.7052807,
				posY = 0.3587377,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.3169703,
				sizeY = 0.06050921,
				text = "55",
				color = "FFF1E9D7",
				fontSize = 22,
				fontOutlineEnable = true,
				fontOutlineColor = "FFA47848",
				fontOutlineSize = 2,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "zsxz2",
				varName = "value4",
				posX = 0.7052807,
				posY = 0.2906336,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.3169703,
				sizeY = 0.06050921,
				text = "55",
				color = "FFF1E9D7",
				fontSize = 22,
				fontOutlineEnable = true,
				fontOutlineColor = "FFA47848",
				fontOutlineSize = 2,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "zsxz3",
				varName = "value5",
				posX = 0.7052807,
				posY = 0.2225295,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.3169703,
				sizeY = 0.06050921,
				text = "55",
				color = "FFF1E9D7",
				fontSize = 22,
				fontOutlineEnable = true,
				fontOutlineColor = "FFA47848",
				fontOutlineSize = 2,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "zsxz4",
				varName = "value6",
				posX = 0.7052807,
				posY = 0.1544254,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.3169703,
				sizeY = 0.06050921,
				text = "55",
				color = "FFF1E9D7",
				fontSize = 22,
				fontOutlineEnable = true,
				fontOutlineColor = "FFA47848",
				fontOutlineSize = 2,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "zsxz5",
				varName = "value7",
				posX = 0.7052807,
				posY = 0.08632129,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.3169703,
				sizeY = 0.06050921,
				text = "55",
				color = "FFF1E9D7",
				fontSize = 22,
				fontOutlineEnable = true,
				fontOutlineColor = "FFA47848",
				fontOutlineSize = 2,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Grid",
				name = "dh",
				posX = 0.5,
				posY = 0.7219295,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.9715773,
				sizeY = 0.5491226,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "dg",
					posX = 0.5,
					posY = 0.5384012,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.7929671,
					sizeY = 0.912039,
					image = "top#top_dg.png",
				},
			},
			{
				prop = {
					etype = "Image",
					name = "max",
					posX = 0.5,
					posY = 0.5256008,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.9738194,
					sizeY = 0.912039,
					image = "top#top_d1.png",
				},
				children = {
				{
					prop = {
						etype = "Image",
						name = "wzt",
						varName = "maxLvl",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3828571,
						sizeY = 0.2649481,
						image = "top#top_manji.png",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "xx1",
						posX = 0.2632484,
						posY = 0.370391,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1057143,
						sizeY = 0.1403509,
						image = "top#top_xx.png",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "xx2",
						posX = 0.6426246,
						posY = 0.6751535,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.08975991,
						sizeY = 0.1191692,
						image = "top#top_xx.png",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "xx3",
						posX = 0.7281994,
						posY = 0.2968292,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.08405344,
						sizeY = 0.111593,
						image = "top#top_xx.png",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "xx4",
						posX = 0.4315438,
						posY = 0.2477895,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.08405414,
						sizeY = 0.1115939,
						image = "top#top_xx.png",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "xx5",
						posX = 0.3488223,
						posY = 0.7802449,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.08975991,
						sizeY = 0.1191692,
						image = "top#top_xx.png",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "dian1",
						posX = 0.8822292,
						posY = 0.1987372,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.08976699,
						sizeY = 0.1102402,
						image = "top#top_xx2.png",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "dian2",
						posX = 0.4144221,
						posY = 0.8643095,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.03841935,
						sizeY = 0.04718167,
						image = "top#top_xx2.png",
						alpha = 0.6,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "dian3",
						posX = 0.870817,
						posY = 0.8678133,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.03841935,
						sizeY = 0.04718167,
						image = "top#top_xx2.png",
						alpha = 0.6,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "dian4",
						posX = 0.0949493,
						posY = 0.748707,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.03841935,
						sizeY = 0.04718167,
						image = "top#top_xx2.png",
						alpha = 0.4,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "dian5",
						posX = 0.1434442,
						posY = 0.5770615,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.03841935,
						sizeY = 0.04718167,
						image = "top#top_xx2.png",
						alpha = 0.6,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "dian6",
						posX = 0.5741652,
						posY = 0.9168531,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.04855397,
						sizeY = 0.0596277,
						image = "top#top_xx2.png",
						alpha = 0.2,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "dian7",
						posX = 0.8622613,
						posY = 0.4544558,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.03841935,
						sizeY = 0.04718167,
						image = "top#top_xx2.png",
						alpha = 0.6,
					},
				},
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
	max = {
		dh = {
			scale = {{0, {0, 0, 1}}, {300, {1.1, 1.1, 1}}, {400, {1,1,1}}, },
		},
	},
	xz = {
		dg = {
			rotate = {{0, {0}}, {4000, {180}}, },
		},
		xx1 = {
			alpha = {{0, {0.3}}, {600, {0.8}}, {1600, {1}}, {2500, {0.3}}, },
		},
		xx2 = {
			alpha = {{0, {0.3}}, {600, {0.8}}, {1600, {1}}, {2500, {0.3}}, },
		},
		xx3 = {
			alpha = {{0, {0.3}}, {600, {0.8}}, {1600, {1}}, {2500, {0.3}}, },
		},
		xx4 = {
			alpha = {{0, {0.3}}, {600, {0.8}}, {1600, {1}}, {2500, {0.3}}, },
		},
		xx5 = {
			alpha = {{0, {0.3}}, {600, {0.8}}, {1600, {1}}, {2500, {0.3}}, },
		},
	},
	gy = {
	},
	gy2 = {
	},
	gy3 = {
	},
	gy4 = {
	},
	gy5 = {
	},
	c_dakai = {
		{0,"max", 1, 0},
		{0,"xz", -1, 400},
	},
}
--EDITOR animations end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot, l_animations)
end
return create
