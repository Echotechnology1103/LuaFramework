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
				name = "fj1",
				posX = 0.5,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.84375,
				sizeY = 0.3611111,
				image = "d#diban",
				scale9 = true,
				scale9Left = 0.4,
				scale9Right = 0.4,
				scale9Top = 0.4,
				scale9Bottom = 0.4,
			},
			children = {
			{
				prop = {
					etype = "Sprite3D",
					name = "mx",
					posX = 0.04032291,
					posY = -0.26605,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.2075582,
					sizeY = 2.154152,
				},
			},
			},
		},
		{
			prop = {
				etype = "Image",
				name = "k1",
				posX = 0.5212541,
				posY = 0.4360047,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.7273214,
				sizeY = 0.2693967,
				scale9 = true,
				scale9Left = 0.3,
				scale9Right = 0.3,
				scale9Top = 0.3,
				scale9Bottom = 0.3,
			},
			children = {
			{
				prop = {
					etype = "RichText",
					name = "wz2",
					varName = "label",
					posX = 0.4663475,
					posY = 0.6169207,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.4574435,
					sizeY = 0.2850465,
					text = "获得碎片：",
					color = "FFFD5E18",
					fontSize = 22,
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Button",
					name = "an",
					varName = "closeBtn",
					posX = 0.8281708,
					posY = 0.3360211,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.2570373,
					sizeY = 0.4322434,
					propagateToChildren = true,
					soundEffectClick = "audio/rxjh/UI/anniu.ogg",
				},
				children = {
				{
					prop = {
						etype = "Button",
						name = "bta",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.6811694,
						sizeY = 0.7633555,
						image = "chu1#an2",
						imageNormal = "chu1#an2",
						disableClick = true,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "ff",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.6700117,
						sizeY = 0.9609028,
						text = "确 定",
						fontSize = 24,
						fontOutlineEnable = true,
						fontOutlineColor = "FF2A6953",
						fontOutlineSize = 2,
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				},
			},
			{
				prop = {
					etype = "Image",
					name = "wp1",
					varName = "gradeIcon1",
					posX = 0.264933,
					posY = 0.3154925,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.06009362,
					sizeY = 0.2901323,
					image = "djk#ktong",
				},
				children = {
				{
					prop = {
						etype = "Image",
						name = "t1",
						varName = "icon1",
						posX = 0.5,
						posY = 0.5424054,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.807728,
						sizeY = 0.7993146,
						image = "zm#zm_ptdz.png",
					},
				},
				{
					prop = {
						etype = "Label",
						name = "sl1",
						varName = "countLabel1",
						posX = 1.656417,
						posY = 0.5530652,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1.185459,
						sizeY = 0.5906994,
						text = "x10",
						color = "FF43261D",
						vTextAlign = 1,
					},
				},
				},
			},
			{
				prop = {
					etype = "Image",
					name = "wp3",
					varName = "gradeIcon2",
					posX = 0.3917694,
					posY = 0.3154925,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.06009362,
					sizeY = 0.2901323,
					image = "djk#ktong",
				},
				children = {
				{
					prop = {
						etype = "Image",
						name = "t3",
						varName = "icon2",
						posX = 0.5,
						posY = 0.5424054,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.807728,
						sizeY = 0.7993146,
						image = "zm#zm_xuantie.png",
					},
				},
				{
					prop = {
						etype = "Label",
						name = "sl3",
						varName = "countLabel2",
						posX = 1.656417,
						posY = 0.5530652,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1.185459,
						sizeY = 0.5906994,
						text = "x10",
						color = "FF43261D",
						vTextAlign = 1,
					},
				},
				},
			},
			{
				prop = {
					etype = "Image",
					name = "wp2",
					varName = "gradeIcon3",
					posX = 0.5186079,
					posY = 0.3154925,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.06009362,
					sizeY = 0.2901323,
					image = "djk#ktong",
				},
				children = {
				{
					prop = {
						etype = "Image",
						name = "t2",
						varName = "icon3",
						posX = 0.5,
						posY = 0.5424054,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.807728,
						sizeY = 0.7993146,
						image = "zm#zm_yaocao.png",
					},
				},
				{
					prop = {
						etype = "Label",
						name = "sl2",
						varName = "countLabel3",
						posX = 1.656417,
						posY = 0.5530652,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1.185459,
						sizeY = 0.5906994,
						text = "x10",
						color = "FF43261D",
						vTextAlign = 1,
					},
				},
				},
			},
			{
				prop = {
					etype = "Label",
					name = "db",
					varName = "descLabel",
					posX = 0.5170047,
					posY = 0.864136,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.6389099,
					sizeY = 0.3766913,
					text = "为了表示我的诚意，特定奉上一些宝图残片，还望笑纳。",
					color = "FF43261D",
					fontSize = 22,
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
