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
			etype = "Grid",
			name = "jd",
			posX = 0.5,
			posY = 0.35,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 1,
			sizeY = 0.7,
			layoutType = 2,
			layoutTypeW = 2,
		},
		children = {
		{
			prop = {
				etype = "Image",
				name = "dt",
				varName = "findRoot",
				posX = 0.4150329,
				posY = 0.3133088,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.3884243,
				sizeY = 0.1997664,
				image = "zd#ltd",
				scale9 = true,
				scale9Left = 0.3,
				scale9Right = 0.3,
				scale9Top = 0.3,
				scale9Bottom = 0.3,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "dt2",
					posX = 0.5,
					posY = 0.1887121,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.9847238,
					sizeY = 0.3078994,
					image = "zdte#shd",
					scale9 = true,
					scale9Left = 0.45,
					scale9Right = 0.45,
				},
				children = {
				{
					prop = {
						etype = "Image",
						name = "shd1",
						posX = 0.1369593,
						posY = 1.466161,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1634027,
						sizeY = 0.7419353,
						image = "zdte#shd2",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "shd2",
						posX = 0.4244824,
						posY = 1.466161,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1634027,
						sizeY = 0.7419353,
						image = "zdte#shd2",
					},
				},
				{
					prop = {
						etype = "Image",
						name = "shd3",
						posX = 0.7120056,
						posY = 1.466161,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.1634027,
						sizeY = 0.7419353,
						image = "zdte#shd2",
					},
				},
				},
			},
			{
				prop = {
					etype = "Button",
					name = "an4",
					varName = "shareBtn",
					posX = 0.9565027,
					posY = 0.4812416,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.1086119,
					sizeY = 1.162072,
					image = "zdte#an",
					imageNormal = "zdte#an",
					soundEffectClick = "audio/rxjh/UI/anniu.ogg",
				},
				children = {
				{
					prop = {
						etype = "Label",
						name = "as4",
						posX = 0.5,
						posY = 0.4829059,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.5289713,
						sizeY = 1.023591,
						text = "分享",
						fontSize = 22,
						fontOutlineEnable = true,
						fontOutlineColor = "FFB35F1D",
						fontOutlineSize = 2,
						hTextAlign = 1,
						vTextAlign = 1,
						lineSpaceAdd = 4,
					},
				},
				},
			},
			{
				prop = {
					etype = "Label",
					name = "as2",
					posX = 0.1425051,
					posY = 0.4914445,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.2424476,
					sizeY = 0.4503619,
					text = "累计时间",
					fontSize = 18,
					fontOutlineColor = "FF102E21",
					hTextAlign = 1,
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Label",
					name = "as3",
					posX = 0.425636,
					posY = 0.4914443,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.2424476,
					sizeY = 0.4503619,
					text = "总输出",
					fontSize = 18,
					fontOutlineColor = "FF102E21",
					hTextAlign = 1,
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Label",
					name = "as5",
					posX = 0.7087669,
					posY = 0.4914444,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.2424476,
					sizeY = 0.4503619,
					text = "秒 伤",
					fontSize = 18,
					fontOutlineColor = "FF102E21",
					hTextAlign = 1,
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Label",
					name = "as6",
					varName = "time",
					posX = 0.1425051,
					posY = 0.1939643,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.2851395,
					sizeY = 0.4503619,
					text = "66666",
					fontOutlineColor = "FF102E21",
					hTextAlign = 1,
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Label",
					name = "as7",
					varName = "dmgCnt",
					posX = 0.425636,
					posY = 0.1939644,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.2851395,
					sizeY = 0.4503619,
					text = "66666",
					color = "FF5DFF54",
					fontOutlineColor = "FF102E21",
					hTextAlign = 1,
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Label",
					name = "as8",
					varName = "dmg",
					posX = 0.7087669,
					posY = 0.1939643,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.2851395,
					sizeY = 0.4503619,
					text = "66666",
					color = "FF5DFF54",
					fontOutlineColor = "FF102E21",
					hTextAlign = 1,
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Label",
					name = "as9",
					varName = "name",
					posX = 0.2589084,
					posY = 0.7988594,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.4899547,
					sizeY = 0.4503619,
					text = "名字",
					fontSize = 22,
					fontOutlineColor = "FF102E21",
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
	c_box = {
		{2,"gy", 1, 0},
		{2,"gy2", 1, 0},
		{2,"liz", 1, 0},
	},
}
--EDITOR animations end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot, l_animations)
end
return create
