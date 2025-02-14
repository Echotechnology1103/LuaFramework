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
			scale9Left = 0.1,
			scale9Right = 0.1,
			scale9Top = 0.1,
			scale9Bottom = 0.1,
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
			sizeX = 0.7,
			sizeY = 0.7,
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
				sizeX = 0.84,
				sizeY = 0.88,
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
					posX = 0.5,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1.70068,
					sizeY = 1.623377,
					image = "jiebaibj#jiebaibj",
					scale9Left = 0.45,
					scale9Right = 0.45,
					scale9Top = 0.2,
					scale9Bottom = 0.7,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "wddw",
					varName = "teamRoot",
					posX = 0.4980485,
					posY = 0.7684225,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1.195791,
					sizeY = 0.5253427,
					scale9 = true,
					scale9Left = 0.45,
					scale9Right = 0.45,
					scale9Top = 0.45,
					scale9Bottom = 0.45,
				},
				children = {
				{
					prop = {
						etype = "Scroll",
						name = "lb",
						varName = "scroll",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1,
						sizeY = 1,
						horizontal = true,
						showScrollBar = false,
					},
				},
				},
			},
			{
				prop = {
					etype = "Image",
					name = "dk",
					posX = 0.692338,
					posY = 0.1983669,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.8250675,
					sizeY = 0.4734849,
					image = "jiebai#dit",
					scale9 = true,
					scale9Left = 0.4,
					scale9Right = 0.4,
				},
				children = {
				{
					prop = {
						etype = "Image",
						name = "top",
						posX = 0.5,
						posY = 0.9516411,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.6844034,
						sizeY = 0.1571428,
						image = "jiebai#top",
					},
					children = {
					{
						prop = {
							etype = "Label",
							name = "dwbh6",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.864768,
							sizeY = 2.515821,
							text = "设置结拜称谓",
							color = "FFFFF337",
							fontOutlineColor = "FF102E21",
							hTextAlign = 1,
							vTextAlign = 1,
						},
					},
					},
				},
				{
					prop = {
						etype = "RichText",
						name = "dwbh7",
						varName = "sworn_desc",
						posX = 0.5,
						posY = 0.3589248,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.7624678,
						sizeY = 0.3832944,
						text = "结拜前缀最长四字，包含1个系统字，后缀3字包含1个系统字。例如：风尘四侠之大侠。",
						color = "FFC93034",
						fontSize = 18,
						fontOutlineColor = "FF102E21",
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "dwbh8",
						varName = "wait_desc",
						posX = 0.5,
						posY = 0.1781616,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1.075447,
						sizeY = 0.3260248,
						text = "请耐心等待队长设置结拜称谓",
						color = "FFC93034",
						fontOutlineColor = "FF102E21",
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Button",
						name = "a3",
						varName = "ok_btn",
						posX = 0.8424256,
						posY = 0.651936,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.2222298,
						sizeY = 0.2761905,
						image = "jiebai#an1",
						imageNormal = "jiebai#an1",
						soundEffectClick = "audio/rxjh/UI/anniu.ogg",
					},
					children = {
					{
						prop = {
							etype = "Label",
							name = "wz1",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8995844,
							sizeY = 0.963034,
							text = "确 定",
							color = "FF914200",
							fontSize = 22,
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
			{
				prop = {
					etype = "Image",
					name = "zd",
					posX = 0.6449661,
					posY = 0.2680568,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.3894534,
					sizeY = 0.1082251,
					image = "jiebai#k1",
					scale9 = true,
					scale9Left = 0.4,
					scale9Right = 0.4,
					scale9Top = 0.4,
					scale9Bottom = 0.4,
				},
				children = {
				{
					prop = {
						etype = "EditBox",
						name = "mz",
						sizeXAB = 251.4853,
						sizeYAB = 50.68176,
						posXAB = 146.5591,
						posYAB = 24,
						varName = "input_label",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.8579655,
						sizeY = 1.05587,
						color = "FFFFF4E4",
						fontSize = 22,
						vTextAlign = 1,
						inputWidth = 300,
						inputHeight = 50,
						phColor = "FFFFF4E4",
						phFontSize = 22,
						autoWrap = false,
					},
				},
				},
			},
			{
				prop = {
					etype = "Grid",
					name = "lt",
					posX = 0.06303353,
					posY = 0.2107433,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.4392799,
					sizeY = 0.5785056,
				},
				children = {
				{
					prop = {
						etype = "Image",
						name = "dws",
						posX = 0.5000001,
						posY = 0.6342436,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.9249282,
						sizeY = 0.645922,
						image = "jiebai#k2",
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
							name = "dws2",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1,
							sizeY = 1,
							image = "jiebai#k2",
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
							name = "lie",
							varName = "msgScroll",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.9649583,
							sizeY = 0.9426894,
						},
					},
					},
				},
				{
					prop = {
						etype = "Image",
						name = "dws3",
						posX = 0.5000002,
						posY = 0.186777,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.9249283,
						sizeY = 0.217897,
						image = "jiebai#k2",
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
							name = "dws4",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1,
							sizeY = 1,
							image = "jiebai#k2",
							scale9 = true,
							scale9Left = 0.4,
							scale9Right = 0.4,
							scale9Top = 0.4,
							scale9Bottom = 0.4,
						},
					},
					{
						prop = {
							etype = "EditBox",
							name = "tes",
							sizeXAB = 203.2347,
							sizeYAB = 55.90775,
							posXAB = 101.6174,
							posYAB = 27.95387,
							varName = "editBox",
							posX = 0.3323007,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.6646012,
							sizeY = 1,
							fontSize = 22,
							vTextAlign = 1,
							phFontSize = 22,
						},
					},
					{
						prop = {
							etype = "Button",
							name = "a4",
							varName = "sendBtn",
							posX = 0.8310255,
							posY = 0.5105772,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.3461913,
							sizeY = 1,
							image = "jiebai#an1",
							imageNormal = "jiebai#an1",
							soundEffectClick = "audio/rxjh/UI/anniu.ogg",
						},
						children = {
						{
							prop = {
								etype = "Label",
								name = "wz2",
								posX = 0.5,
								posY = 0.5,
								anchorX = 0.5,
								anchorY = 0.5,
								sizeX = 0.8995844,
								sizeY = 0.963034,
								text = "发 送",
								color = "FF914200",
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
}
--EDITOR animations end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot, l_animations)
end
return create
