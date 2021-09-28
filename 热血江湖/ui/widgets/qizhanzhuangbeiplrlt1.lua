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
			name = "k",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.3007813,
			sizeY = 0.1347396,
		},
		children = {
		{
			prop = {
				etype = "Button",
				name = "gx",
				varName = "select",
				posX = 0.7274939,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.5225704,
				sizeY = 1,
			},
		},
		{
			prop = {
				etype = "Button",
				name = "an",
				varName = "itemTips_btn",
				posX = 0.1444344,
				posY = 0.5053315,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.243148,
				sizeY = 0.863965,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "dt",
				posX = 0.5,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.99,
				sizeY = 0.98,
				image = "b#scd1",
				scale9 = true,
				scale9Left = 0.45,
				scale9Right = 0.45,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "djk1",
				varName = "item_grade",
				posX = 0.1382196,
				posY = 0.4786324,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.2184794,
				sizeY = 0.8761758,
				image = "djk#ktong",
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "djt1",
					varName = "item_icon",
					posX = 0.5,
					posY = 0.5371094,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.8,
					sizeY = 0.8,
					image = "items#items_gaojijinengshu.png",
				},
			},
			{
				prop = {
					etype = "Image",
					name = "suo2",
					varName = "item_suo",
					posX = 0.1965968,
					posY = 0.2456336,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.3566564,
					sizeY = 0.3529412,
					image = "tb#tb_suo.png",
				},
			},
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "mz1",
				varName = "item_name",
				posX = 0.540747,
				posY = 0.7175786,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.5667835,
				sizeY = 0.4607697,
				text = "道具名称",
				fontSize = 22,
				fontOutlineColor = "FF27221D",
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "dj1",
				varName = "item_level",
				posX = 0.6618758,
				posY = 0.3192158,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.3089699,
				sizeY = 0.4475255,
				text = "战力:",
				color = "FF966856",
				fontOutlineColor = "FF102E21",
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "jz1",
				varName = "money",
				posX = 0.4697083,
				posY = 0.3192155,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.2472865,
				sizeY = 0.4475255,
				text = "2123",
				color = "FF966856",
				fontOutlineColor = "FF102E21",
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "hb1",
				varName = "little_icon",
				posX = 0.289554,
				posY = 0.3254573,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.1038961,
				sizeY = 0.412318,
				image = "tb#tongqian",
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "suo",
					varName = "suo",
					posX = 0.608169,
					posY = 0.2589015,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.55,
					sizeY = 0.55,
					image = "tb#tb_suo.png",
				},
			},
			},
		},
		{
			prop = {
				etype = "Image",
				name = "t2",
				varName = "select_icon1",
				posX = 0.874999,
				posY = 0.4885934,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.1016855,
				sizeY = 0.412318,
				image = "ty#zyd",
			},
		},
		{
			prop = {
				etype = "Image",
				name = "t1",
				varName = "select_icon2",
				posX = 0.904475,
				posY = 0.5676959,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.1745795,
				sizeY = 0.5153975,
				image = "ty#xzjt",
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "dj2",
				varName = "power_value",
				posX = 0.77426,
				posY = 0.3192158,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.2677113,
				sizeY = 0.4475255,
				text = "12345",
				color = "FF966856",
				fontOutlineColor = "FF102E21",
				vTextAlign = 1,
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
