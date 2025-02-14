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
			varName = "rootGird",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.159375,
			sizeY = 0.2611111,
		},
		children = {
		{
			prop = {
				etype = "Image",
				name = "db",
				varName = "bg",
				posX = 0.5,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 1,
				sizeY = 1,
				image = "xingpan#xwk3",
				scale9Left = 0.4,
				scale9Right = 0.4,
				scale9Top = 0.4,
				scale9Bottom = 0.4,
				alpha = 0.5,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "xingyao",
				varName = "x1",
				posX = 0.2996559,
				posY = 0.6666383,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.1960784,
				sizeY = 0.2263466,
				image = "xingpan#huix",
				scale9Left = 0.4,
				scale9Right = 0.4,
				scale9Top = 0.4,
				scale9Bottom = 0.4,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "xingyao2",
				varName = "x2",
				posX = 0.5006412,
				posY = 0.6666383,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1960784,
				sizeY = 0.2263466,
				image = "xingpan#huix",
				scale9Left = 0.4,
				scale9Right = 0.4,
				scale9Top = 0.4,
				scale9Bottom = 0.4,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "xingyao3",
				varName = "x3",
				posX = 0.7065765,
				posY = 0.6666383,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1960784,
				sizeY = 0.2263466,
				image = "xingpan#huix",
				scale9Left = 0.4,
				scale9Right = 0.4,
				scale9Top = 0.4,
				scale9Bottom = 0.4,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "xingyao4",
				varName = "x4",
				posX = 0.2996561,
				posY = 0.4351872,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1960784,
				sizeY = 0.2263466,
				image = "xingpan#huix",
				scale9Left = 0.4,
				scale9Right = 0.4,
				scale9Top = 0.4,
				scale9Bottom = 0.4,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "xingyao5",
				varName = "x5",
				posX = 0.5006412,
				posY = 0.4351872,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1960784,
				sizeY = 0.2263466,
				image = "xingpan#huix",
				scale9Left = 0.4,
				scale9Right = 0.4,
				scale9Top = 0.4,
				scale9Bottom = 0.4,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "xingyao6",
				varName = "x6",
				posX = 0.7065766,
				posY = 0.4351872,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1960784,
				sizeY = 0.2263466,
				image = "xingpan#huix",
				scale9Left = 0.4,
				scale9Right = 0.4,
				scale9Top = 0.4,
				scale9Bottom = 0.4,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "xingyao7",
				varName = "x7",
				posX = 0.2996559,
				posY = 0.206652,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1960784,
				sizeY = 0.2263466,
				image = "xingpan#huix",
				scale9Left = 0.4,
				scale9Right = 0.4,
				scale9Top = 0.4,
				scale9Bottom = 0.4,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "xingyao8",
				varName = "x8",
				posX = 0.5006412,
				posY = 0.206652,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1960784,
				sizeY = 0.2263466,
				image = "xingpan#huix",
				scale9Left = 0.4,
				scale9Right = 0.4,
				scale9Top = 0.4,
				scale9Bottom = 0.4,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "xingyao9",
				varName = "x9",
				posX = 0.7065764,
				posY = 0.2066521,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1960784,
				sizeY = 0.2263466,
				image = "xingpan#huix",
				scale9Left = 0.4,
				scale9Right = 0.4,
				scale9Top = 0.4,
				scale9Bottom = 0.4,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "web",
				varName = "wordTxt",
				posX = 0.5,
				posY = 0.8610926,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 1.198513,
				sizeY = 0.3995484,
				text = "期望1",
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
