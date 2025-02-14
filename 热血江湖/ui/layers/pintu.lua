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
				varName = "imgBK",
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
				posY = 0.5074113,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.4009364,
				sizeY = 0.7219948,
				image = "b#cs",
				scale9 = true,
				scale9Left = 0.45,
				scale9Right = 0.45,
				scale9Top = 0.25,
				scale9Bottom = 0.7,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "hua",
					posX = 0.6034021,
					posY = 0.2755831,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.9703845,
					sizeY = 0.5328601,
					image = "hua1#hua1",
				},
			},
			{
				prop = {
					etype = "Image",
					name = "kk",
					posX = 0.5,
					posY = 0.4920961,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.646923,
					sizeY = 0.6386626,
					image = "b#d2",
					scale9 = true,
					scale9Left = 0.45,
					scale9Right = 0.45,
					scale9Top = 0.45,
					scale9Bottom = 0.45,
				},
				children = {
				{
					prop = {
						etype = "Grid",
						name = "ptk2",
						varName = "ptk1",
						posX = 0.1692348,
						posY = 0.8307775,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3313253,
						sizeY = 0.3313254,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "pt2",
							varName = "img1",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1,
							sizeY = 0.9999999,
							image = "pt#1",
							effect = "img1",
						},
					},
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "ptk3",
						posX = 0.5,
						posY = 0.8307775,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3313253,
						sizeY = 0.3313254,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "pt3",
							varName = "img2",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.018182,
							sizeY = 0.9999999,
							image = "pt#2",
						},
					},
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "ptk4",
						posX = 0.831327,
						posY = 0.8307775,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3313253,
						sizeY = 0.3313254,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "pt4",
							varName = "img3",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1,
							sizeY = 0.9999999,
							image = "pt#3",
						},
					},
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "ptk5",
						posX = 0.1692348,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3313253,
						sizeY = 0.3313254,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "pt5",
							varName = "img4",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1,
							sizeY = 1.009091,
							image = "pt#4",
						},
					},
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "ptk6",
						posX = 0.5,
						posY = 0.5000001,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3313253,
						sizeY = 0.3313254,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "pt6",
							varName = "img5",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.018182,
							sizeY = 1.009091,
							image = "pt#5",
						},
					},
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "ptk7",
						posX = 0.831327,
						posY = 0.5000001,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3313253,
						sizeY = 0.3313254,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "pt7",
							varName = "img6",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1,
							sizeY = 1.009091,
							image = "pt#6",
						},
					},
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "ptk8",
						posX = 0.1692348,
						posY = 0.1752422,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3313253,
						sizeY = 0.3313254,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "pt8",
							varName = "img7",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1,
							sizeY = 1.009091,
							image = "pt#7",
						},
					},
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "ptk9",
						posX = 0.5,
						posY = 0.1752423,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3313253,
						sizeY = 0.3313254,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "pt9",
							varName = "img8",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1.018182,
							sizeY = 1.009091,
							image = "pt#8",
						},
					},
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "ptk10",
						posX = 0.8313269,
						posY = 0.1752422,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.3313253,
						sizeY = 0.3313254,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "pt10",
							varName = "img9",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1,
							sizeY = 1.009091,
							image = "pt#9",
						},
					},
					},
				},
				},
			},
			{
				prop = {
					etype = "Button",
					name = "a1",
					varName = "okBtn",
					posX = 0.5046528,
					posY = 0.09056889,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.2825416,
					sizeY = 0.1058026,
					image = "chu1#an2",
					imageNormal = "chu1#an2",
					soundEffectClick = "audio/rxjh/UI/ui_guanbi.ogg",
				},
				children = {
				{
					prop = {
						etype = "Label",
						name = "f1",
						varName = "no_name",
						posX = 0.4931034,
						posY = 0.5105112,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.8313926,
						sizeY = 0.9422305,
						text = "开 始",
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
					etype = "Image",
					name = "top",
					posX = 0.5,
					posY = 1.004101,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.5144207,
					sizeY = 0.1000315,
					image = "chu1#top",
				},
				children = {
				{
					prop = {
						etype = "Label",
						name = "ms2",
						varName = "titleText",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.977486,
						sizeY = 1.386964,
						text = "拼图",
						color = "FF966856",
						fontSize = 24,
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				},
			},
			{
				prop = {
					etype = "Label",
					name = "ms",
					varName = "desc",
					posX = 0.5,
					posY = 0.8828975,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.7902296,
					sizeY = 0.1486858,
					text = "规则描述写在这里",
					color = "FF966856",
					hTextAlign = 1,
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Label",
					name = "ts",
					varName = "tips",
					posX = 0.5095196,
					posY = -0.03992146,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.7902296,
					sizeY = 0.1391074,
					text = "我记住了，开始拼图",
					hTextAlign = 1,
					vTextAlign = 1,
				},
			},
			},
		},
		{
			prop = {
				etype = "Button",
				name = "gb",
				varName = "closeBtn",
				posX = 0.6739346,
				posY = 0.8272473,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.05078125,
				sizeY = 0.0875,
				image = "baishi#x",
				imageNormal = "baishi#x",
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
