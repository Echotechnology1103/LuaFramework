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
			sizeX = 0.6,
			sizeY = 0.6,
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
				sizeX = 0.75,
				sizeY = 0.8,
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
					name = "wk",
					varName = "background",
					posX = 0.5,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1.105903,
					sizeY = 1.481481,
					image = "gaobai#bj",
					scale9 = true,
					scale9Top = 0.4,
					scale9Bottom = 0.4,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "kk",
					posX = 0.5,
					posY = 0.5173319,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.8644516,
					sizeY = 0.5315333,
					scale9 = true,
					scale9Left = 0.45,
					scale9Right = 0.45,
					scale9Top = 0.45,
					scale9Bottom = 0.45,
				},
				children = {
				{
					prop = {
						etype = "EditBox",
						name = "srk",
						sizeXAB = 377.373,
						sizeYAB = 124.656,
						posXAB = 247.9666,
						posYAB = 113.2441,
						varName = "input_label",
						posX = 0.4980009,
						posY = 0.6164694,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.7578927,
						sizeY = 0.6785923,
						color = "FF966856",
						fontSize = 26,
						phColor = "FF966856",
						phFontSize = 26,
					},
				},
				{
					prop = {
						etype = "RichText",
						name = "wbz",
						varName = "label",
						posX = 0.498001,
						posY = 0.6164694,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.7578927,
						sizeY = 0.6785923,
						text = "在此处输入您想对他（她）说的话，最多可输入80个字",
						color = "FFCB4940",
						fontSize = 22,
						lineSpace = 15,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "dx",
						varName = "title",
						posX = 0.4071218,
						posY = 1.174067,
						anchorX = 0.5,
						anchorY = 0.5,
						visible = false,
						sizeX = 0.6147904,
						sizeY = 0.4456536,
						text = "告白对象名称：",
						color = "FF966856",
						fontSize = 22,
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "dx2",
						varName = "userName",
						posX = 0.5,
						posY = 1.092407,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.443115,
						sizeY = 0.4456536,
						text = "xxxxxxxx",
						color = "FFA34CE6",
						fontSize = 24,
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				},
			},
			{
				prop = {
					etype = "Button",
					name = "a2",
					varName = "btn1",
					posX = 0.2967321,
					posY = 0.07729378,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.2517361,
					sizeY = 0.1591435,
					image = "chu1#an2",
					imageNormal = "chu1#an2",
					soundEffectClick = "audio/rxjh/UI/ui_guanbi.ogg",
				},
				children = {
				{
					prop = {
						etype = "Label",
						name = "wz2",
						posX = 0.4999996,
						posY = 0.5363636,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.8313715,
						sizeY = 0.8905213,
						text = "本服发送",
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
			{
				prop = {
					etype = "Button",
					name = "a3",
					varName = "btn2",
					posX = 0.7100697,
					posY = 0.07729378,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.2517361,
					sizeY = 0.1591435,
					image = "chu1#an1",
					imageNormal = "chu1#an1",
					soundEffectClick = "audio/rxjh/UI/ui_guanbi.ogg",
				},
				children = {
				{
					prop = {
						etype = "Label",
						name = "wz3",
						posX = 0.5,
						posY = 0.5363636,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.8313715,
						sizeY = 0.8905213,
						text = "跨服发送",
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
					etype = "Image",
					name = "tb1",
					varName = "frame1",
					posX = 0.2951613,
					posY = 0.2660363,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.1215278,
					sizeY = 0.2025463,
					image = "djk#ktong",
				},
				children = {
				{
					prop = {
						etype = "Image",
						name = "djt",
						varName = "item1",
						posX = 0.5117359,
						posY = 0.5147778,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.7831926,
						sizeY = 0.7795459,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "suo1",
						varName = "suo1",
						posX = 0.2196834,
						posY = 0.2403314,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.4374999,
						sizeY = 0.4375,
						image = "tb#suo",
					},
				},
				{
					prop = {
						etype = "Label",
						name = "xy2",
						varName = "count1",
						posX = -0.4087766,
						posY = 0.2004407,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 2.647688,
						sizeY = 0.7138428,
						text = "x1",
						fontSize = 18,
						fontOutlineEnable = true,
						hTextAlign = 2,
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Button",
						name = "btn1",
						varName = "itemBtn1",
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
					etype = "Image",
					name = "tb2",
					varName = "frame2",
					posX = 0.7139835,
					posY = 0.2660363,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.1215278,
					sizeY = 0.2025463,
					image = "djk#ktong",
				},
				children = {
				{
					prop = {
						etype = "Image",
						name = "djt2",
						varName = "item2",
						posX = 0.5117359,
						posY = 0.5147778,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.7831926,
						sizeY = 0.7795459,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "suo2",
						varName = "suo2",
						posX = 0.2196834,
						posY = 0.2403314,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.4374999,
						sizeY = 0.4375,
						image = "tb#suo",
					},
				},
				{
					prop = {
						etype = "Label",
						name = "xy3",
						varName = "count2",
						posX = -0.4087766,
						posY = 0.2004407,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 2.647688,
						sizeY = 0.7138428,
						text = "x1",
						fontSize = 18,
						fontOutlineEnable = true,
						hTextAlign = 2,
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Button",
						name = "btn2",
						varName = "itemBtn2",
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
					etype = "Button",
					name = "gb",
					varName = "close_btn",
					posX = 0.8917274,
					posY = 0.967981,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.1006944,
					sizeY = 0.162037,
					image = "gaobai#gb",
					imageNormal = "gaobai#gb",
					disablePressScale = true,
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
	dk = {
		ysjm = {
			scale = {{0, {0.3, 0.3, 1}}, {150, {1.1, 1.1, 1}}, {200, {1,1,1}}, },
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
