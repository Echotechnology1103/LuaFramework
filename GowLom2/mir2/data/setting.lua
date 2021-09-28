local setting = {
	base = {
		DelayShow = false,
		NPCShowName = true,
		firePeral = false,
		lockColor = true,
		defeatTip = true,
		showExpValue = 20000,
		singleRocker = true,
		showExpEnable = false,
		equipBarLvl = true,
		touchRun = true,
		showOutHP = true,
		guild = false,
		autoUnpack = true,
		soundEnable = true,
		showNameOnly = false,
		doubleRocker = false,
		heroShowName = true,
		hideCorpse = false,
		hiBlood = false,
		petShowName = true,
		monShowName = true,
		quickexit = false,
		heroShowTitle = true,
		levelShow = true
	},
	protected = {
		role = {
			hp = {
				lastTime = 0,
				space = 10000,
				uses = "������;�",
				isPercent = false,
				value = 0,
				enable = false
			},
			mp = {
				lastTime = 0,
				space = 10000,
				uses = "������;�",
				isPercent = false,
				value = 0,
				enable = false
			},
			jiu = {
				lastTime = 0,
				space = 500,
				isPercent = true,
				value = 10,
				enable = false
			},
			yaojiu = {
				lastTime = 0,
				space = 9000,
				isPercent = false,
				value = 10,
				enable = false
			}
		},
		hero = {
			hp = {
				lastTime = 0,
				space = 10000,
				uses = "������;�",
				isPercent = false,
				value = 0,
				enable = false
			},
			mp = {
				lastTime = 0,
				space = 10000,
				uses = "������;�",
				isPercent = false,
				value = 0,
				enable = false
			},
			jiu = {
				lastTime = 0,
				space = 500,
				isPercent = true,
				value = 10,
				enable = false
			},
			yaojiu = {
				lastTime = 0,
				space = 9000,
				isPercent = false,
				value = 10,
				enable = false
			},
			miss = {
				lastTime = 0,
				space = 9000,
				isPercent = false,
				value = 40,
				enable = true
			}
		}
	},
	drugs = {
		roleSetting = {
			withNumber = false,
			withPercent = true
		},
		heroSetting = {
			withNumber = false,
			withPercent = true
		},
		role = {
			percentDrug = {
				normalHP = {
					value = 0.75,
					space = 2000,
					isPercent = true,
					lastTime = 0,
					enable = true
				},
				normalMP = {
					value = 0.75,
					space = 2000,
					isPercent = true,
					lastTime = 0,
					enable = true
				},
				quickHP = {
					value = 0.5,
					space = 500,
					isPercent = true,
					lastTime = 0,
					enable = true
				},
				quickMP = {
					value = 0.25,
					space = 500,
					isPercent = true,
					lastTime = 0,
					enable = true
				}
			},
			numberDrug = {
				normalHP = {
					value = 10,
					space = 4000,
					lastTime = 0,
					enable = false
				},
				normalMP = {
					value = 10,
					space = 4000,
					lastTime = 0,
					enable = false
				},
				quickHP = {
					value = 10,
					space = 4000,
					lastTime = 0,
					enable = false
				},
				quickMP = {
					value = 10,
					space = 4000,
					lastTime = 0,
					enable = false
				}
			}
		},
		hero = {
			percentDrug = {
				normalHP = {
					value = 0.75,
					space = 500,
					isPercent = true,
					lastTime = 0,
					enable = true
				},
				normalMP = {
					value = 0.75,
					space = 500,
					isPercent = true,
					lastTime = 0,
					enable = true
				},
				quickHP = {
					value = 0.5,
					space = 500,
					isPercent = true,
					lastTime = 0,
					enable = true
				},
				quickMP = {
					value = 0.25,
					space = 500,
					isPercent = true,
					lastTime = 0,
					enable = true
				}
			},
			numberDrug = {
				normalHP = {
					value = 10,
					space = 4000,
					lastTime = 0,
					enable = false
				},
				normalMP = {
					value = 10,
					space = 4000,
					lastTime = 0,
					enable = false
				},
				quickHP = {
					value = 10,
					space = 4000,
					lastTime = 0,
					enable = false
				},
				quickMP = {
					value = 10,
					space = 4000,
					lastTime = 0,
					enable = false
				}
			}
		}
	},
	autoUnpack = {
		newbee = {
			pack = "���ֽ�ҩ��",
			name = "���ֽ�ҩ",
			min = 0,
			enable = true
		},
		hpMid = {
			pack = "��ҩ���У���",
			name = "��ҩ(����)",
			min = 0,
			enable = true
		},
		hpSmall = {
			pack = "��ҩ(С)��",
			name = "��ҩ(С��)",
			min = 0,
			enable = true
		},
		hpMid = {
			pack = "��ҩ(��)��",
			name = "��ҩ(����)",
			min = 0,
			enable = true
		},
		hpBig = {
			pack = "������ҩ",
			name = "ǿЧ��ҩ",
			min = 0,
			enable = true
		},
		hpMidz = {
			pack = "��ҩ�а�(��)",
			name = "��ҩ����(��)",
			min = 0,
			enable = true
		},
		hpBigz = {
			pack = "������ҩ(��)",
			name = "ǿЧ��ҩ(��)",
			min = 0,
			enable = true
		},
		mpSmall = {
			pack = "ħ��ҩ(С)��",
			name = "ħ��ҩ(С��)",
			min = 0,
			enable = true
		},
		mpMid = {
			pack = "ħ��ҩ(��)��",
			name = "ħ��ҩ(����)",
			min = 0,
			enable = true
		},
		mpBig = {
			pack = "����ħ��ҩ",
			name = "ǿЧħ��ҩ",
			min = 0,
			enable = true
		},
		mpMidz = {
			pack = "ħ��ҩ�а�(��)",
			name = "ħ��ҩ����(��)",
			min = 0,
			enable = true
		},
		mpBigz = {
			pack = "����ħ��ҩ(��)",
			name = "ǿЧħ��ҩ(��)",
			min = 0,
			enable = true
		},
		quick1 = {
			pack = "̫��ˮ��",
			name = "ǿЧ̫��ˮ",
			min = 0,
			enable = true
		},
		quick2 = {
			pack = "����ѩ˪��",
			name = "����ѩ˪",
			min = 0,
			enable = true
		},
		quick3 = {
			pack = "����ҩ��",
			name = "����ҩ",
			min = 0,
			enable = true
		},
		quick4 = {
			pack = "����ҩ��(����)",
			name = "����ҩ(����)",
			min = 0,
			enable = true
		},
		reel1 = {
			pack = "������;��",
			name = "������;�",
			min = 0,
			enable = true
		},
		reel2 = {
			pack = "�������Ѿ��",
			name = "�������Ѿ�",
			min = 0,
			enable = true
		},
		reel3 = {
			pack = "�سǾ��",
			name = "�سǾ�",
			min = 0,
			enable = true
		},
		reel4 = {
			pack = "�л�سǾ��",
			name = "�л�سǾ�",
			min = 0,
			enable = true
		}
	},
	job = {
		autoDun = false,
		autoInvisible = false,
		autoZhanjiashu = false,
		autoSword = false,
		autoAllSpace = false,
		autoFire = false,
		autoSpace = false,
		autoDunHero = false,
		autoWide = true,
		autoSkill = {
			space = 10,
			enable = false
		}
	},
	autoPack = {
		recover = {
			pack = "����ҩ��",
			name = "����ҩ",
			idx = 348,
			enable = true
		},
		snow = {
			pack = "����ѩ˪��",
			name = "����ѩ˪",
			idx = 347,
			enable = true
		},
		sun = {
			pack = "̫��ˮ��",
			name = "ǿЧ̫��ˮ",
			idx = 346,
			enable = false
		}
	},
	autoRat = {
		noPickUpItem = false,
		autoBindDrug = false,
		pickUpRatting = true,
		autoPoison = false,
		ignoreCripple = true,
		autoSpaceMove = {
			space = 10,
			use = "������;�",
			enable = false
		},
		autoRoar = {
			space = 10,
			cnt = 5,
			enable = false
		},
		atkMagic = {},
		areaMagic = {
			cnt = 5,
			enable = false
		},
		autoPet = {
			enable = false
		},
		autoCure = {
			percent = 70,
			enable = false
		},
		autoCurePet = {
			percent = 60,
			enable = false
		}
	},
	display = {
		showHeroOutHP = false,
		showMonOutHP = true,
		mapScale = 1.25
	},
	cpu = {
		speedMode = false,
		loadMons = false,
		normalFont = false
	},
	help = {
		count = 7,
		looked = 0
	},
	chat = {
		whisperLimit = 1,
		alwaysTranslate = false,
		opens = {
			��� = true,
			ս�� = true
		},
		autoLoadVoice = {
			enable = false
		},
		autoPlayVoice = {
			���� = false,
			�л� = false,
			˽�� = false,
			ս�� = false,
			��� = false,
			���� = false
		}
	},
	item = {
		pickOnRatting = false,
		pickUp = false,
		showName = true,
		hindGood = false,
		filt = {}
	},
	other = {
		medalImpress = false,
		buyNotTip = false
	},
	initEnd = function ()
		sound.setEnable(setting.base.soundEnable)

		an.label.normal = setting.cpu.normalFont
		local filt = setting.item.filt

		if not filt.��Ʒ���Ե��� then
			filt.��Ʒ���Ե��� = {
				hintName = true,
				pickOnRatting = true,
				isGood = true,
				pickUp = true
			}
		end

		setmetatable(filt, {
			__index = _G.def.items.filt
		})

		return 
	end,
	getGoodAttItemSetting = function ()
		return setting.item.filt.��Ʒ���Ե���
	end,
	resetItemFilt = function ()
		setting.item.filt = {}
		local filt = setting.item.filt

		if not filt.��Ʒ���Ե��� then
			filt.��Ʒ���Ե��� = {
				hintName = true,
				pickOnRatting = true,
				isGood = true,
				pickUp = true
			}
		end

		setmetatable(setting.item.filt, {
			__index = _G.def.items.filt
		})

		return 
	end
}
local default = clone(slot0)
setting.reset = function ()
	for k, v in pairs(default) do
		setting[k] = clone(v)
	end

	setting.initEnd()

	return 
end
setting.init = function (playerName)
	setting.reset()

	for k, v in pairs(setting) do
		local saved = cache.getSetting(playerName, k)

		if saved then
			for k2, v2 in pairs(saved) do
				v[k2] = v2
			end
		end
	end

	setting.initEnd()

	return 
end

return setting
