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
		soundEffectOpen = "audio/rxjh/UI/ui_jiangli2.ogg",
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
				varName = "ok",
				posX = 0.5,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 1,
				sizeY = 1,
				soundEffectClick = "audio/rxjh/UI/ui_guanbi.ogg",
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
				name = "dg",
				posX = 0.5,
				posY = 0.6830809,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.65,
				sizeY = 0.4958333,
				image = "plp#guang",
				alpha = 0,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "dt",
				varName = "dt",
				posX = 0.5,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.5859375,
				sizeY = 0.5277778,
				image = "b#cs",
				scale9 = true,
				scale9Left = 0.4,
				scale9Right = 0.4,
				scale9Top = 0.2,
				scale9Bottom = 0.7,
				alpha = 0,
				alphaCascade = true,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "djhw",
					posX = 0.5,
					posY = 0.6234817,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.5106667,
					sizeY = 0.5,
					image = "plp#plbj2",
				},
			},
			{
				prop = {
					etype = "Grid",
					name = "jl1",
					varName = "awardItem1",
					posX = 0.576148,
					posY = 0.6345995,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.3615547,
					sizeY = 0.6422367,
					alphaCascade = true,
				},
				children = {
				{
					prop = {
						etype = "Image",
						name = "wp1",
						varName = "item_bg1",
						posX = 0.2888711,
						posY = 0.4910695,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3466511,
						sizeY = 0.385167,
						image = "djk#ktong",
						alphaCascade = true,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "djt1",
							varName = "item_icon1",
							posX = 0.5000003,
							posY = 0.5357412,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8000003,
							sizeY = 0.8118517,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "suo",
							varName = "suo",
							posX = 0.1951795,
							posY = 0.2385602,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.3157895,
							sizeY = 0.3225807,
							image = "tb#suo",
						},
					},
					},
				},
				{
					prop = {
						etype = "Label",
						name = "mz",
						varName = "item_desc1",
						posX = 0.2855907,
						posY = 0.225366,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1,
						sizeY = 0.25,
						text = "什么道具",
						color = "FF634624",
						fontSize = 22,
						fontOutlineColor = "FF27221D",
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "mz2",
						varName = "item_count",
						posX = 0.1803846,
						posY = 0.3765258,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.5035361,
						sizeY = 0.25,
						text = "x100",
						fontSize = 18,
						fontOutlineEnable = true,
						fontOutlineColor = "FF27221D",
						hTextAlign = 2,
						vTextAlign = 1,
					},
				},
				},
			},
			{
				prop = {
					etype = "Image",
					name = "dk",
					posX = 0.5,
					posY = 0.2083743,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.7698932,
					sizeY = 0.2995037,
					image = "b#d5",
					scale9 = true,
					scale9Left = 0.4,
					scale9Right = 0.4,
					scale9Top = 0.4,
					scale9Bottom = 0.4,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "sj",
					posX = 0.5,
					posY = 0.9809277,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1.096,
					sizeY = 0.2605263,
					image = "plp#hong",
				},
			},
			{
				prop = {
					etype = "Image",
					name = "hua",
					posX = 0.7169918,
					posY = 0.3791611,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.664,
					sizeY = 0.7289473,
					image = "hua1#hua1",
				},
			},
			{
				prop = {
					etype = "Label",
					name = "xs",
					varName = "desc",
					posX = 0.5004025,
					posY = 0.2101216,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.7366467,
					sizeY = 0.2557167,
					text = "点击空白区域继续",
					color = "FF966856",
					fontSize = 24,
					fontOutlineColor = "FF27221D",
					hTextAlign = 1,
					vTextAlign = 1,
				},
			},
			},
		},
		{
			prop = {
				etype = "Image",
				name = "dg2",
				posX = 0.5,
				posY = 0.7842831,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1726563,
				sizeY = 0.06388889,
				image = "plp#yiwai",
				alpha = 0,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "sz1",
				posX = 0.5,
				posY = 0.7773269,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.5476562,
				sizeY = 0.1847222,
				image = "plp#xx",
				alpha = 0,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "sz2",
				posX = 0.6302946,
				posY = 0.3266647,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.0890625,
				sizeY = 0.0125,
				alpha = 0,
				flippedX = true,
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
	zi = {
		dg2 = {
			move = {{0, {640, 1100, 0}}, {300, {640, 566, 0}}, {350, {640, 568, 0}}, {400, {640, 566, 0}}, },
			alpha = {{0, {1}}, },
		},
	},
	guang = {
		dg = {
			rotate = {{0, {0}}, {3000, {180}}, },
			alpha = {{0, {1}}, },
		},
	},
	dt = {
		dt = {
			scale = {{0, {0, 0, 1}}, {150, {1.1, 1.1, 1}}, {200, {1,1,1}}, },
			alpha = {{0, {1}}, },
		},
	},
	dg2 = {
		sz1 = {
			alpha = {{0, {0}}, {1000, {1}}, {2000, {0}}, },
		},
		sz2 = {
			alpha = {{0, {0}}, {1000, {1}}, {2000, {0}}, },
		},
	},
	gy = {
	},
	c_dakai = {
		{0,"zi", 1, 0},
		{0,"dt", 1, 0},
		{0,"dg2", -1, 200},
	},
}
--EDITOR animations end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot, l_animations)
end
return create
