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
			etype = "Label",
			name = "text12",
			varName = "txt2",
			posX = 0.222091,
			posY = 0.8210588,
			anchorX = 0.5,
			anchorY = 0.5,
			lockHV = true,
			sizeX = 0.1783088,
			sizeY = 0.1706765,
			text = "中文",
			fontSize = 40,
			fontOutlineEnable = true,
			fontOutlineColor = "FF00FF00",
			hTextAlign = 1,
			vTextAlign = 1,
		},
		children = {
		{
			prop = {
				etype = "Label",
				name = "text2",
				posX = 1.11773,
				posY = -0.4414468,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.6294004,
				sizeY = 0.659973,
				text = "文本2",
				color = "FFFF0000",
			},
			children = {
			{
				prop = {
					etype = "Grid",
					name = "gggg1",
					posX = 0.6747601,
					posY = 2.003958,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.6000001,
					sizeY = 0.9508579,
				},
				children = {
				{
					prop = {
						etype = "Label",
						name = "sdfsdf",
						posX = 0.3845909,
						posY = -0.5374506,
						anchorX = 0.5,
						anchorY = 0.5,
						lockHV = true,
						sizeX = 0.3734459,
						sizeY = 0.4152558,
						text = "eeeee",
					},
				},
				},
			},
			},
		},
		{
			prop = {
				etype = "Image",
				name = "farm1",
				posX = 2.458259,
				posY = -1.448542,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 1.754008,
				sizeY = 1.434762,
				image = "farm.jpg",
			},
		},
		},
	},
	{
		prop = {
			etype = "Image",
			name = "image1",
			varName = "txt1",
			posX = 0.8508623,
			posY = 0.6511398,
			anchorX = 0.5,
			anchorY = 0.5,
			lockHV = true,
			sizeX = 0.3125,
			sizeY = 0.1194444,
			image = "crop.png",
		},
		children = {
		{
			prop = {
				etype = "Label",
				name = "imagetxt1",
				posX = 0.5,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.4902174,
				sizeY = 0.3000002,
				text = "IMAGE",
				color = "FFFF0000",
				hTextAlign = 1,
				vTextAlign = 1,
			},
		},
		},
	},
	{
		prop = {
			etype = "Label",
			name = "text14",
			varName = "fff",
			posX = 0.222091,
			posY = 0.5635275,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.1783088,
			sizeY = 0.1706765,
			fontSize = 22,
		},
	},
	{
		prop = {
			etype = "Image",
			name = "sdfsdfdf",
			posX = 0.3745,
			posY = 0.5831951,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.1783088,
			sizeY = 0.1706765,
		},
	},
	{
		prop = {
			etype = "Button",
			name = "btn1",
			varName = "btn1",
			posX = 0.6222144,
			posY = 0.1978415,
			anchorX = 0.5,
			anchorY = 0.5,
			enable = false,
			sizeX = 0.1783088,
			sizeY = 0.1706765,
			imageNormal = "farm.jpg",
			imagePressed = "crop.png",
			imageDisable = "land.png",
		},
	},
	{
		prop = {
			etype = "Button",
			name = "btn1_P",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.6,
			sizeY = 0.3,
		},
	},
	{
		prop = {
			etype = "Image",
			name = "sdfsdfdf_P",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.6,
			sizeY = 0.3,
		},
	},
	{
		prop = {
			etype = "Button",
			name = "btn2",
			posX = 0.322091,
			posY = 0.4059963,
			anchorX = 0.5,
			anchorY = 0.5,
			enable = false,
			sizeX = 0.1783088,
			sizeY = 0.1706765,
			imageNormal = "farm.jpg",
			imagePressed = "crop.png",
			imageDisable = "land.png",
		},
	},
	{
		prop = {
			etype = "Button",
			name = "btn3",
			posX = 0.322091,
			posY = 0.4059963,
			anchorX = 0.5,
			anchorY = 0.5,
			enable = false,
			sizeX = 0.1783088,
			sizeY = 0.1706765,
			imageNormal = "farm.jpg",
			imagePressed = "crop.png",
			imageDisable = "land.png",
		},
	},
	{
		prop = {
			etype = "Button",
			name = "btn4",
			posX = 0.322091,
			posY = 0.4059963,
			anchorX = 0.5,
			anchorY = 0.5,
			enable = false,
			sizeX = 0.1783088,
			sizeY = 0.1706765,
			imageNormal = "farm.jpg",
			imagePressed = "crop.png",
			imageDisable = "land.png",
		},
	},
	{
		prop = {
			etype = "Button",
			name = "btn5",
			posX = 0.322091,
			posY = 0.4059963,
			anchorX = 0.5,
			anchorY = 0.5,
			enable = false,
			sizeX = 0.1783088,
			sizeY = 0.1706765,
			imageNormal = "farm.jpg",
			imagePressed = "crop.png",
			imageDisable = "land.png",
		},
	},
	{
		prop = {
			etype = "Label",
			name = "text15",
			varName = "fff2",
			posX = 0.322091,
			posY = 0.6635275,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.1783088,
			sizeY = 0.1706765,
		},
	},
	{
		prop = {
			etype = "Label",
			name = "text16",
			varName = "fff3",
			posX = 0.322091,
			posY = 0.6635275,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.1783088,
			sizeY = 0.1706765,
		},
		children = {
		{
			prop = {
				etype = "Label",
				name = "text19",
				varName = "fff6",
				posX = 0.322091,
				posY = 0.6635275,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1783088,
				sizeY = 0.1706765,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "text20",
				varName = "fff7",
				posX = 0.322091,
				posY = 0.6635275,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1783088,
				sizeY = 0.1706765,
			},
		},
		},
	},
	{
		prop = {
			etype = "Label",
			name = "text17",
			varName = "fff4",
			posX = 0.322091,
			posY = 0.6635275,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.1783088,
			sizeY = 0.1706765,
		},
	},
	{
		prop = {
			etype = "Label",
			name = "text18",
			varName = "fff5",
			posX = 0.322091,
			posY = 0.6635275,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.1783088,
			sizeY = 0.1706765,
		},
	},
	{
		prop = {
			etype = "Label",
			name = "text21",
			varName = "fff8",
			posX = 0.422091,
			posY = 0.7635275,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.1783088,
			sizeY = 0.1706765,
			text = "ttttttttttt",
		},
		children = {
		{
			prop = {
				etype = "Label",
				name = "text22",
				varName = "fff9",
				posX = 0.322091,
				posY = 0.6635275,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1783088,
				sizeY = 0.1706765,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "text23",
				varName = "fff10",
				posX = 0.322091,
				posY = 0.6635275,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1783088,
				sizeY = 0.1706765,
			},
		},
		},
	},
	{
		prop = {
			etype = "Label",
			name = "text24",
			varName = "fff11",
			posX = 0.6133475,
			posY = 0.8288617,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.1783088,
			sizeY = 0.1706765,
			text = "ttttttttttt",
		},
		children = {
		{
			prop = {
				etype = "Label",
				name = "text25",
				varName = "fff12",
				posX = 0.322091,
				posY = 0.6635275,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1783088,
				sizeY = 0.1706765,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "text26",
				varName = "fff13",
				posX = 0.322091,
				posY = 0.6635275,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1783088,
				sizeY = 0.1706765,
			},
		},
		},
	},
	{
		prop = {
			etype = "HBox",
			name = "hbox1",
			posX = 0.4049038,
			posY = 0.6914525,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.4177744,
			sizeY = 0.4661465,
		},
		children = {
		{
			prop = {
				etype = "Button",
				name = "btn6",
				posX = 0.4094999,
				posY = 0.2419089,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.3531267,
				sizeY = 0.5107692,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		{
			prop = {
				etype = "Button",
				name = "btn7",
				posX = 0.322091,
				posY = 0.4059963,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.3531267,
				sizeY = 0.5107692,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		{
			prop = {
				etype = "Button",
				name = "btn8",
				posX = 0.3986343,
				posY = 1.146677,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.3531267,
				sizeY = 0.5107692,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		{
			prop = {
				etype = "Button",
				name = "btn9",
				posX = 0.322091,
				posY = 0.4059963,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.3531267,
				sizeY = 0.5107692,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		{
			prop = {
				etype = "Button",
				name = "btn10",
				posX = 0.322091,
				posY = 0.4059963,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.3531267,
				sizeY = 0.5107692,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		{
			prop = {
				etype = "Button",
				name = "btn11",
				posX = 0.3953331,
				posY = 0.3677798,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.3531267,
				sizeY = 0.5107692,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		},
	},
	{
		prop = {
			etype = "VBox",
			name = "vbox1",
			posX = 0.1499374,
			posY = 0.5672492,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.2181025,
			sizeY = 0.816713,
		},
		children = {
		{
			prop = {
				etype = "Button",
				name = "btn12",
				posX = 0.422091,
				posY = 0.5059963,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.1783088,
				sizeY = 0.1706765,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		{
			prop = {
				etype = "Button",
				name = "btn13",
				posX = 0.422091,
				posY = 0.5059963,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.1783088,
				sizeY = 0.1706765,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		{
			prop = {
				etype = "Button",
				name = "btn14",
				posX = 0.422091,
				posY = 0.5059963,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.1783088,
				sizeY = 0.1706765,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		},
	},
	{
		prop = {
			etype = "VBox",
			name = "vvv",
			posX = 0.6452167,
			posY = 0.2054698,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.2539819,
			sizeY = 0.229037,
		},
		children = {
		{
			prop = {
				etype = "HBox",
				name = "hhhhh",
				posX = 0.5,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.6,
				sizeY = 0.3,
			},
		},
		{
			prop = {
				etype = "HBox",
				name = "hhhhh2",
				posX = 0.6,
				posY = 0.6,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.6,
				sizeY = 0.3,
			},
		},
		},
	},
	{
		prop = {
			etype = "LoadingBar",
			name = "bbbb1",
			posX = 0.454126,
			posY = 0.6519552,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.3125,
			sizeY = 0.1194444,
			image = "crop.png",
			percent = 33,
		},
	},
	{
		prop = {
			etype = "HBox",
			name = "hbox2",
			varName = "hbox",
			posX = 0.3042876,
			posY = 0.1867266,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.4177744,
			sizeY = 0.4661465,
		},
		children = {
		{
			prop = {
				etype = "Button",
				name = "btn15",
				posX = 0.4094999,
				posY = 0.2419089,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.3531267,
				sizeY = 0.5107692,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		{
			prop = {
				etype = "Button",
				name = "btn16",
				posX = 0.322091,
				posY = 0.4059963,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.3531267,
				sizeY = 0.5107692,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		{
			prop = {
				etype = "Button",
				name = "btn17",
				posX = 0.3986343,
				posY = 1.146677,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.3531267,
				sizeY = 0.5107692,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		{
			prop = {
				etype = "Button",
				name = "btn18",
				posX = 0.322091,
				posY = 0.4059963,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.3531267,
				sizeY = 0.5107692,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		{
			prop = {
				etype = "Button",
				name = "btn19",
				posX = 0.322091,
				posY = 0.4059963,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.3531267,
				sizeY = 0.5107692,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		{
			prop = {
				etype = "Button",
				name = "btn20",
				posX = 0.3953331,
				posY = 0.3677798,
				anchorX = 0.5,
				anchorY = 0.5,
				enable = false,
				sizeX = 0.3531267,
				sizeY = 0.5107692,
				imageNormal = "farm.jpg",
				imagePressed = "crop.png",
				imageDisable = "land.png",
			},
		},
		},
	},
	},
}
--EDITOR elements end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot)
end
return create
