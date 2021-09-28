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
			name = "jn1",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.1164062,
			sizeY = 0.1388889,
		},
		children = {
		{
			prop = {
				etype = "Image",
				name = "jnk1",
				varName = "borderIcon",
				posX = 0.5,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.6510069,
				sizeY = 0.8699999,
				image = "jn#jnbai",
			},
		},
		{
			prop = {
				etype = "Image",
				name = "jnt1",
				varName = "skill_icon",
				posX = 0.5032886,
				posY = 0.49,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.4697989,
				sizeY = 0.7,
				image = "skillqiang#qiang_16fengmo",
			},
		},
		{
			prop = {
				etype = "Image",
				name = "zbz",
				varName = "is_equip",
				posX = 0.6943122,
				posY = 0.2703775,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.2416108,
				sizeY = 0.34,
				image = "jn#zbz",
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
