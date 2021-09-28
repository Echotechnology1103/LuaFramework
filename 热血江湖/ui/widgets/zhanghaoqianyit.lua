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
			name = "jd",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.5811486,
			sizeY = 0.05,
		},
		children = {
		{
			prop = {
				etype = "RichText",
				name = "bs",
				varName = "desc",
				posX = 0.5131161,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.9737677,
				sizeY = 2,
				color = "FF966856",
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
