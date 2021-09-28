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
			sizeX = 0.3445312,
			sizeY = 0.05555556,
		},
		children = {
		{
			prop = {
				etype = "Image",
				name = "sxd2",
				varName = "property1",
				posX = 0.5476196,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 1.024943,
				sizeY = 4.699999,
				scale9Top = 0.4,
				scale9Bottom = 0.4,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "jdt3",
					posX = 0.5,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.5199115,
					sizeY = 0.1908697,
					image = "chu1#jdd",
					scale9 = true,
					scale9Left = 0.45,
					scale9Right = 0.45,
				},
				children = {
				{
					prop = {
						etype = "LoadingBar",
						name = "jin3",
						varName = "prop_bar",
						posX = 0.5,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.9531915,
						sizeY = 0.6250002,
						image = "cjb#qixue",
						percent = 54,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "bt3",
						varName = "prop_name",
						posX = -0.04637016,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.4162915,
						sizeY = 1.540105,
						text = "气血：",
						color = "FF634624",
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "bt6",
						varName = "prop_inc",
						posX = 1.249371,
						posY = 0.4436648,
						anchorX = 0.5,
						anchorY = 0.5,
						visible = false,
						sizeX = 0.4162915,
						sizeY = 1.540105,
						text = "+14",
						color = "FF16B800",
						fontOutlineEnable = true,
						fontOutlineColor = "FF2C7400",
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Label",
						name = "ssz3",
						varName = "prop_bar_text",
						posX = 0.5,
						posY = 0.4265104,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.8617272,
						sizeY = 1.540105,
						text = "2000/2000",
						fontOutlineEnable = true,
						fontOutlineColor = "FF567D23",
						fontOutlineSize = 2,
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				{
					prop = {
						etype = "Image",
						name = "zt",
						varName = "propIcon",
						posX = -0.3709067,
						posY = 0.5,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.2127661,
						sizeY = 1.393398,
						image = "zt#qixue",
					},
				},
				},
			},
			{
				prop = {
					etype = "Image",
					name = "sj7",
					posX = 0.5,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.6537932,
					sizeY = 0.3808532,
					image = "uieffect/chuanghuhong.png",
					alpha = 0,
					flippedY = true,
					blendFunc = 1,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "qh3",
					posX = 0.5,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.6537933,
					sizeY = 0.4348624,
					image = "uieffect/FX_light_069.png",
					alpha = 0,
					blendFunc = 1,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "sj8",
					posX = 0.5,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1.495328,
					sizeY = 0.4644776,
					image = "uieffect/jpg_20057.png",
					alpha = 0,
					blendFunc = 1,
				},
			},
			{
				prop = {
					etype = "Particle",
					name = "sj9",
					sizeXAB = 334.2962,
					sizeYAB = 82.86418,
					posXAB = 288.497,
					posYAB = 114.4781,
					posX = 0.6382681,
					posY = 0.608926,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.7395937,
					sizeY = 0.440767,
					angle = 90,
					duration = 0.4,
					emitterType = 0,
					emissionRate = 10,
					finishColorRed = 2,
					finishColorVarianceRed = 40,
					finishParticleSize = 20,
					startParticleSize = 50,
					startParticleSizeVariance = 20,
					maxParticles = 15,
					particleLifespan = 0.4,
					particleLifespanVariance = 0.1,
					particleLifeMiddle = 0,
					sourcePositionVariancex = 80,
					sourcePositionVariancey = 5,
					sourcePositionx = 100,
					sourcePositiony = 10,
					speed = 50,
					speedVariance = 20,
					startColorBlue = 1,
					startColorGreen = 1,
					startColorRed = 1,
					textureFileName = "uieffect/jiantou1.png",
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
	sj6 = {
		bt6 = {
			alpha = {{0, {0}}, {100, {1}}, {1350, {1}}, {1500, {0}}, },
		},
	},
	sj7 = {
		sj7 = {
			alpha = {{50, {1}}, {100, {0}}, },
		},
	},
	qh3 = {
		qh3 = {
			scale = {{0, {0, 3, 1}}, {100, {3, 3, 1}}, {300, {3, 1, 1}}, },
			alpha = {{100, {1}}, {300, {0}}, },
		},
	},
	sj8 = {
		sj8 = {
			alpha = {{0, {0}}, {100, {1}}, {300, {1}}, {600, {0}}, },
		},
	},
	c_shenji = {
		{0,"qh3", 1, 0},
		{0,"sj7", 1, 0},
		{0,"sj8", 1, 0},
		{2,"sj9", 1, 0},
		{0,"sj6", 1, 0},
	},
}
--EDITOR animations end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot, l_animations)
end
return create
