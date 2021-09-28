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
			name = "jie",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.071875,
			sizeY = 0.1111111,
		},
		children = {
		{
			prop = {
				etype = "Button",
				name = "btn",
				varName = "btn",
				posX = 0.5,
				posY = 0.2875,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.9239131,
				sizeY = 0.5000001,
				image = "zqqz2#an",
				imageNormal = "zqqz2#an",
				imagePressed = "zqqz2#liang",
				imageDisable = "zqqz2#an",
				disablePressScale = true,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "wb",
				varName = "name",
				posX = 0.5,
				posY = 0.2875,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 1.08132,
				sizeY = 0.9836047,
				text = "一阶",
				color = "FFFDE8CD",
				hTextAlign = 1,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "qp",
				varName = "needRoot",
				posX = 0.5,
				posY = 0.675,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.8695652,
				sizeY = 0.5625001,
				image = "zqqz2#qp",
			},
			children = {
			{
				prop = {
					etype = "Label",
					name = "dj",
					varName = "need",
					posX = 0.5,
					posY = 0.6176968,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1.710165,
					sizeY = 0.9907701,
					text = "熔炉3/6",
					color = "FFC93034",
					fontSize = 18,
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
}
--EDITOR animations end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot, l_animations)
end
return create
