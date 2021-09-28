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
			name = "ltyy",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.408703,
			sizeY = 0.1594567,
		},
		children = {
		{
			prop = {
				etype = "Image",
				name = "tp",
				posX = 0.406,
				posY = 0.4688649,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.7914902,
				sizeY = 0.8877298,
				scale9 = true,
				scale9Left = 0.45,
				scale9Right = 0.45,
				scale9Top = 0.6,
				scale9Bottom = 0.3,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "pd2",
					varName = "set_image",
					posX = 0.89,
					posY = 0.8180949,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.1666425,
					sizeY = 0.2060456,
					image = "lt#dw",
				},
			},
			{
				prop = {
					etype = "Label",
					name = "mz2",
					varName = "fromName",
					posX = 0.5,
					posY = 0.8180947,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.5922352,
					sizeY = 0.4036733,
					text = "公认热血最强玩家",
					color = "FF964C4C",
					hTextAlign = 2,
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Label",
					name = "mz3",
					varName = "chatTime",
					posX = 0.126,
					posY = 0.8180949,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.2507591,
					sizeY = 0.4526497,
					text = "shijian",
					color = "FF4C6644",
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "yt",
					posX = 0.594,
					posY = 0.3417002,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.8138916,
					sizeY = 0.6279483,
				},
				children = {
				{
					prop = {
						etype = "Image",
						name = "yst",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1,
						sizeY = 1,
						image = "lt#yuyin",
						flippedX = true,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "stz2",
						varName = "msgSec",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.5671099,
						sizeY = 0.6581978,
						text = "600秒",
						fontSize = 22,
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "sts2",
						varName = "anim",
						posX = 0.87,
						posY = 0.5034732,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.0652819,
						sizeY = 0.453125,
						image = "lt#bf",
						flippedX = true,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "hd",
						varName = "redPoint",
						posX = -0.03,
						posY = 0.8744736,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.04747774,
						sizeY = 0.25,
						image = "lt#hd",
					},
				},
				{
					prop = {
						etype = "Grid",
						name = "tx",
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
							name = "x",
							posX = 0.8969914,
							posY = 0.5158415,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.09495549,
							sizeY = 0.4999999,
							image = "uieffect/011..png",
							alpha = 0,
							flippedX = true,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "x2",
							posX = 0.8702856,
							posY = 0.5158415,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.09495549,
							sizeY = 0.4999999,
							image = "uieffect/022.png",
							alpha = 0,
							flippedX = true,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "x3",
							posX = 0.8406125,
							posY = 0.5470915,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.189911,
							sizeY = 0.9999999,
							image = "uieffect/033.png",
							alpha = 0,
							flippedX = true,
						},
					},
					},
				},
				},
			},
			},
		},
		{
			prop = {
				etype = "Image",
				name = "txk2",
				varName = "frame",
				posX = 0.898,
				posY = 0.560451,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.2381318,
				sizeY = 0.8710132,
				image = "zdtx#txd",
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "tx2",
					varName = "headIcon",
					posX = 0.5054789,
					posY = 0.6925332,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.7210885,
					sizeY = 1.110169,
				},
			},
			{
				prop = {
					etype = "Button",
					name = "txa2",
					varName = "headBtn",
					posX = 0.5,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1,
					sizeY = 1,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "vip",
					varName = "vipIcon",
					posX = 0.5111111,
					posY = -0.010714,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.7786397,
					sizeY = 0.43,
				},
			},
			},
		},
		{
			prop = {
				etype = "Button",
				name = "yyt",
				varName = "playBtn",
				posX = 0.4389305,
				posY = 0.3397888,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.7061073,
				sizeY = 0.5638145,
				disablePressScale = true,
				soundEffectClick = "audio/rxjh/UI/anniu.ogg",
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
	x = {
		x = {
			alpha = {{0, {0}}, {100, {1}}, },
		},
		x2 = {
			alpha = {{0, {0}}, {500, {1}}, },
		},
		x3 = {
			alpha = {{0, {0}}, {1000, {1}}, },
		},
	},
	c_bofang = {
		{0,"x", -1, 0},
	},
}
--EDITOR animations end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot, l_animations)
end
return create
