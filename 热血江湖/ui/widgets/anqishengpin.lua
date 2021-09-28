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
			name = "shengxing",
			varName = "upStarRoot",
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
				name = "bbb2",
				posX = 0.5948526,
				posY = 0.5996159,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.5989159,
				sizeY = 0.1225166,
				image = "d2#xhd",
			},
		},
		{
			prop = {
				etype = "Image",
				name = "bbb1",
				posX = 0.5948526,
				posY = 0.8359903,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.5989159,
				sizeY = 0.1225166,
				image = "d2#xhd",
			},
		},
		{
			prop = {
				etype = "Image",
				name = "wpk7",
				varName = "item_bg_icon",
				posX = 0.1935316,
				posY = 0.8359903,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.2568096,
				sizeY = 0.1686977,
				image = "djk#kbai",
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "wp7",
					varName = "item_icon",
					posX = 0.5,
					posY = 0.5427376,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.7960408,
					sizeY = 0.7786804,
					image = "items#items_zhongjijinengshu.png",
				},
			},
			{
				prop = {
					etype = "Button",
					name = "dj2",
					varName = "item_btn",
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
				etype = "Label",
				name = "yxxh",
				posX = 0.2753842,
				posY = 0.9461958,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.3777075,
				sizeY = 0.06958167,
				text = "优先消耗",
				color = "FF966856",
				fontSize = 22,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "wpm1",
				varName = "item_name",
				posX = 0.5817329,
				posY = 0.8660131,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.5291588,
				sizeY = 0.08186086,
				text = "伏魔花灵剑碎片",
				fontSize = 22,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "sl7",
				varName = "item_count",
				posX = 0.5188813,
				posY = 0.8099928,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.376423,
				sizeY = 0.07413035,
				text = "1/1000",
				fontSize = 22,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "yxxh2",
				posX = 0.4629319,
				posY = 0.7322818,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.752803,
				sizeY = 0.06958167,
				text = "不足时用以下材料替代",
				color = "FF966856",
				fontSize = 22,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "wpk8",
				varName = "replaceItemBgIcon",
				posX = 0.1935315,
				posY = 0.6139271,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.2568096,
				sizeY = 0.1686977,
				image = "djk#kbai",
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "wp8",
					varName = "replaceItem_icon",
					posX = 0.5,
					posY = 0.5427376,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.7960408,
					sizeY = 0.7786804,
					image = "items#items_zhongjijinengshu.png",
				},
			},
			{
				prop = {
					etype = "Button",
					name = "dj3",
					varName = "replaceItem_btn",
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
				etype = "Label",
				name = "wpm2",
				varName = "replaceItem_name",
				posX = 0.5817329,
				posY = 0.6448378,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.5291588,
				sizeY = 0.08186086,
				text = "伏魔花灵剑碎片",
				fontSize = 22,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "sl8",
				varName = "replaceItem_count",
				posX = 0.5188814,
				posY = 0.5859433,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.376423,
				sizeY = 0.07413035,
				text = "1/1000",
				fontSize = 22,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "kk3",
				posX = 0.5,
				posY = 0.2965656,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.8536584,
				sizeY = 0.375388,
				image = "b#d2",
				scale9 = true,
				scale9Left = 0.4,
				scale9Right = 0.4,
				scale9Top = 0.4,
				scale9Bottom = 0.4,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "top3",
					posX = 0.5,
					posY = 0.9967328,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.5794834,
					sizeY = 0.1715577,
					image = "chu1#top2",
				},
				children = {
				{
					prop = {
						etype = "Label",
						name = "topz",
						posX = 0.5000004,
						posY = 0.4720048,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.724027,
						sizeY = 1.251684,
						text = "升品加成",
						color = "FFF1E9D7",
						fontOutlineEnable = true,
						fontOutlineColor = "FFA47848",
						fontOutlineSize = 2,
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				},
			},
			{
				prop = {
					etype = "Scroll",
					name = "lb",
					varName = "scroll",
					posX = 0.5,
					posY = 0.4432142,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1.019727,
					sizeY = 0.8747591,
				},
			},
			},
		},
		{
			prop = {
				etype = "Button",
				name = "sx",
				varName = "upstar_btn",
				posX = 0.4999999,
				posY = 0.03006197,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.4206963,
				sizeY = 0.1073345,
				image = "chu1#an2",
				imageNormal = "chu1#an2",
				soundEffectClick = "audio/rxjh/UI/anniu.ogg",
			},
			children = {
			{
				prop = {
					etype = "Label",
					name = "sxz",
					posX = 0.5,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.6,
					sizeY = 1.143481,
					text = "升 品",
					fontSize = 22,
					fontOutlineEnable = true,
					fontOutlineColor = "FF2A6953",
					fontOutlineSize = 2,
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
}
--EDITOR animations end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot, l_animations)
end
return create
