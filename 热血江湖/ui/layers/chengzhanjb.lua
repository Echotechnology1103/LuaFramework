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
			sizeX = 1,
			sizeY = 1,
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
				lockHV = true,
				sizeX = 0.7929688,
				sizeY = 0.8055556,
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
					name = "kk2",
					posX = 0.5,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.9566502,
					sizeY = 1.02931,
					image = "chengzhanbj#chengzhanbj",
					scale9Left = 0.45,
					scale9Right = 0.45,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "d9",
					posX = 0.5029556,
					posY = 0.6128477,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.6718009,
					sizeY = 0.3253244,
					scale9 = true,
					scale9Left = 0.4,
					scale9Right = 0.4,
					scale9Top = 0.3,
					scale9Bottom = 0.3,
				},
				children = {
				{
					prop = {
						etype = "Scroll",
						name = "lb",
						varName = "scroll",
						posX = 0.4976868,
						posY = 0.5211989,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1,
						sizeY = 0.8797585,
						horizontal = true,
						showScrollBar = false,
					},
				},
				},
			},
			{
				prop = {
					etype = "Image",
					name = "d10",
					posX = 0.5,
					posY = 0.3476498,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.7013106,
					sizeY = 0.2220758,
					image = "chengzhan#zitiao",
					scale9 = true,
					scale9Left = 0.4,
					scale9Right = 0.4,
					scale9Top = 0.3,
					scale9Bottom = 0.3,
				},
				children = {
				{
					prop = {
						etype = "RichText",
						name = "tswb",
						varName = "desc",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.9080468,
						sizeY = 0.9134879,
						text = "提示文本",
						color = "FFC49DE5",
					},
				},
				},
			},
			{
				prop = {
					etype = "Button",
					name = "an",
					varName = "Bid",
					posX = 0.5,
					posY = 0.1730164,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.173399,
					sizeY = 0.1155172,
					image = "chengzhan#jingbiao2",
					imageNormal = "chengzhan#jingbiao2",
					soundEffectClick = "audio/rxjh/UI/anniu.ogg",
				},
			},
			{
				prop = {
					etype = "Button",
					name = "bz",
					varName = "Help",
					posX = 0.8265642,
					posY = 0.1678098,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.04926108,
					sizeY = 0.0862069,
					image = "chengzhan#bz",
					imageNormal = "chengzhan#bz",
					disablePressScale = true,
				},
			},
			},
		},
		{
			prop = {
				etype = "Button",
				name = "gb",
				varName = "Close",
				posX = 0.7589543,
				posY = 0.7690282,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.04140625,
				sizeY = 0.07083333,
				image = "rydt#gb",
				imageNormal = "rydt#gb",
				soundEffectClick = "audio/rxjh/UI/ui_guanbi.ogg",
			},
		},
		{
			prop = {
				etype = "Image",
				name = "top",
				posX = 0.5,
				posY = 0.7862928,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.3210938,
				sizeY = 0.1763889,
				image = "chengzhan#zf",
				scale9Left = 0.4,
				scale9Right = 0.4,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "tt",
					varName = "title",
					posX = 0.5,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.3181818,
					sizeY = 0.4423076,
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
