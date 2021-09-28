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
			name = "dj1",
			varName = "root",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			lockHV = true,
			sizeX = 0.06249998,
			sizeY = 0.1111111,
			image = "djk#kbai",
		},
		children = {
		{
			prop = {
				etype = "Button",
				name = "ban",
				varName = "btnRwd0",
				posX = 0.5,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 1,
				sizeY = 1,
				effect = "btnRwd0",
			},
		},
		{
			prop = {
				etype = "Image",
				name = "djt1",
				varName = "imgRwd0",
				posX = 0.4986848,
				posY = 0.522688,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.7460668,
				sizeY = 0.7568947,
				image = "imgRwd0",
			},
		},
		{
			prop = {
				etype = "Label",
				name = "sl1",
				varName = "txtRwd0Num",
				posX = 0.5410964,
				posY = 0.1987401,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.7460538,
				sizeY = 0.3426855,
				image = "txtRwd0Num",
				text = "x55",
				fontSize = 18,
				fontOutlineEnable = true,
				hTextAlign = 2,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "suo",
				varName = "imgLock0",
				posX = 0.2132257,
				posY = 0.2238212,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.3191488,
				sizeY = 0.3191489,
				image = "tb#suo",
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
