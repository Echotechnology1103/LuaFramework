local pf_ssdaimubai01_dazhao = 
{
    CLASS = "composite.QSBSequence",
    ARGS = 
    {
        {
            CLASS = "composite.QSBParallel",
            ARGS = 
            {
                {
                    CLASS = "action.QSBApplyBuff",
                    OPTIONS = {is_target = false, buff_id = "pf_ssdaimubai01_bsjs",no_cancel = true},
                },
                {
                    CLASS = "action.QSBApplyBuff",
                    OPTIONS = {is_target = false, buff_id = "zsdaimubai_mianyi",no_cancel = true},
                },
            },
        },
        {
            CLASS = "action.QSBArgsIsUnderStatus",
            OPTIONS = {is_attacker = true,status = "zsdmb_bs"},
        },
        {
            CLASS = "composite.QSBSelector",
            ARGS = 
            {
                --变身后
				{
                    CLASS = "composite.QSBParallel",
                    ARGS = 
                    {
                        {
							CLASS = "action.QSBPlayEffect",
							OPTIONS = {is_hit_effect = false, effect_id = "pf_ssdaimubai01_attack11_1"},
						}, 
						{
                            CLASS = "composite.QSBSequence",
                            ARGS = 
                            {
                                {
                                    CLASS = "action.QSBShowActor",
                                    OPTIONS = {is_attacker = true, turn_on = true, time = 0.6},
                                },
                                {
                                    CLASS = "action.QSBBulletTime",
                                    OPTIONS = {turn_on = true, revertable = false},
                                },
								{
                                    CLASS = "action.QSBSyncActorTimeGearForEffect",
                                },
                                {
                                    CLASS = "action.QSBDelayTime",
                                    OPTIONS = {delay_time = 44/30},
                                },
                                {
                                    CLASS = "action.QSBBulletTime",
                                    OPTIONS = {turn_on = false},
                                },
                                {
                                    CLASS = "action.QSBShowActor",
                                    OPTIONS = {is_attacker = true, turn_on = false, time = 0.1},
                                },
                            },
                        }, 
                        {                           --竞技场黑屏
                            CLASS = "composite.QSBSequence",
                            ARGS = {
                                {
                                    CLASS = "action.QSBShowActorArena",
                                    OPTIONS = {is_attacker = true, turn_on = true, time = 0.6, revertable = true},
                                },
                                {
                                    CLASS = "action.QSBBulletTimeArena",
                                    OPTIONS = {turn_on = true, revertable = true},
                                },
								{
                                    CLASS = "action.QSBSyncActorTimeGearForEffect",
                                },
                                {
                                    CLASS = "action.QSBDelayTime",
                                    OPTIONS = {delay_frame = 44 / 30},
                                },
                                {
                                    CLASS = "action.QSBBulletTimeArena",
                                    OPTIONS = {turn_on = false},
                                },
                                {
                                    CLASS = "action.QSBShowActorArena",
                                    OPTIONS = {is_attacker = true, turn_on = false, time = 0.1},
                                },
                            },
                        },
                        {
                    CLASS = "action.QSBApplyBuff",
                    OPTIONS = {is_target = false, buff_id = "zsdaimubai_mianyi"},
                },
                        {
                            CLASS = "action.QSBPlaySound",
                            OPTIONS = {sound_id ="pf_ssdaimubai01_skill"},
                        },
						{
							CLASS = "composite.QSBParallel",
							ARGS = 
							{ 
								{
									CLASS = "action.QSBPlayAnimation",
									OPTIONS = {animation = "attack11_1"},
								}, 
								{
									CLASS = "composite.QSBSequence",
									ARGS = 
									{
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 2 / 30},
										},
										{
											CLASS = "composite.QSBSequence",
											OPTIONS = {forward_mode = true},
											ARGS = 
											{
												{
													CLASS = "action.QSBArgsIsDirectionLeft",
													OPTIONS = {is_attacker = true},
												},
												{
													CLASS = "composite.QSBSelector",
													ARGS = 
													{   
														{
															CLASS = "composite.QSBParallel",
															ARGS = 
															{ 
																{
																	CLASS = "composite.QSBSequence",
																	ARGS = 
																	{
																		{
																			CLASS = "action.QSBArgsSelectTarget",
																			OPTIONS = {max_distance = true}
																		},
																		{
																			CLASS = "action.QSBDelayTime",
																			OPTIONS = {delay_time = 6 / 30 ,  pass_key = {"selectTarget"}},
																		}, 
																		{
																			CLASS = "action.QSBPlayEffect",
																			OPTIONS = {is_hit_effect = true, effect_id = "pf_ssdaimubai01_attack11_6_1", pass_key = {"selectTarget"}},
																		}, 
																		{
																			CLASS = "action.QSBDelayTime",
																			OPTIONS = {delay_time = 2 / 30 ,  pass_key = {"selectTarget"}},
																		},         
																		{
																			CLASS = "action.QSBDragActor",
																			OPTIONS = {pos_type = "self" , pos = {x = 250,y = 0} , duration = 0.35, flip_with_actor = true },
																		},
																	},
																},
																{
																	CLASS = "composite.QSBSequence",
																	ARGS = 
																	{
																		{
																			CLASS = "action.QSBArgsSelectTarget",
																			OPTIONS = {min_distance = true}
																		},                                                                         
																		{
																			CLASS = "action.QSBDelayTime",
																			OPTIONS = {delay_time = 6 / 30 ,  pass_key = {"selectTarget"}},
																		}, 
																		{
																			CLASS = "action.QSBPlayEffect",
																			OPTIONS = {is_hit_effect = true, effect_id = "pf_ssdaimubai01_attack11_6_1", pass_key = {"selectTarget"}},
																		},
																		{
																			CLASS = "action.QSBDelayTime",
																			OPTIONS = {delay_time = 2 / 30 ,  pass_key = {"selectTarget"}},
																		},          
																		{
																			CLASS = "action.QSBDragActor",
																			OPTIONS = {pos_type = "self" , pos = {x = 250,y = 0} , duration = 0.35, flip_with_actor = true },
																		},
																	},
																},
															},
														},
														{
															CLASS = "composite.QSBParallel",
															ARGS = 
															{ 
																{
																	CLASS = "composite.QSBSequence",
																	ARGS = 
																	{
																		{
																			CLASS = "action.QSBArgsSelectTarget",
																			OPTIONS = {max_distance = true}
																		},                                                                                        
																		{
																			CLASS = "action.QSBDelayTime",
																			OPTIONS = {delay_time = 6 / 30 ,  pass_key = {"selectTarget"}},
																		},  
																		{
																			CLASS = "action.QSBPlayEffect",
																			OPTIONS = {is_hit_effect = true, effect_id = "pf_ssdaimubai01_attack11_6", pass_key = {"selectTarget"}},
																		}, 
																		{
																			CLASS = "action.QSBDelayTime",
																			OPTIONS = {delay_time = 2 / 30 ,  pass_key = {"selectTarget"}},
																		},        
																		{
																			CLASS = "action.QSBDragActor",
																			OPTIONS = {pos_type = "self" , pos = {x = 150,y = 0} , duration = 0.5, flip_with_actor = true },
																		},
																	},
																},
																{
																	CLASS = "composite.QSBSequence",
																	ARGS = 
																	{
																		{
																			CLASS = "action.QSBArgsSelectTarget",
																			OPTIONS = {min_distance = true}
																		},                                                                                        
																		{
																			CLASS = "action.QSBDelayTime",
																			OPTIONS = {delay_time = 6 / 30 ,  pass_key = {"selectTarget"}},
																		},
																		{
																			CLASS = "action.QSBPlayEffect",
																			OPTIONS = {is_hit_effect = true, effect_id = "pf_ssdaimubai01_attack11_6", pass_key = {"selectTarget"}},
																		}, 
																		{
																			CLASS = "action.QSBDelayTime",
																			OPTIONS = {delay_time = 2 / 30 ,  pass_key = {"selectTarget"}},
																		},             
																		{
																			CLASS = "action.QSBDragActor",
																			OPTIONS = {pos_type = "self" , pos = {x = 150,y = 0} , duration = 0.5, flip_with_actor = true },
																		},
																	},
																},
															},
														},
													},
												},
											},
										},                     
									},
								},
								{
									CLASS = "composite.QSBSequence",
									ARGS = 
									{
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 60 / 30},
										},
										{
											CLASS = "action.QSBApplyBuff",
											OPTIONS = {is_target = false, buff_id = "pf_ssdaimubai01_bianshen_tx"},--11
										},
										{
											CLASS = "action.QSBPlayEffect",
											OPTIONS = {is_hit_effect = false, effect_id = "pf_ssdaimubai01_attack11_2"},
										},                      
									},
								},
								{
									CLASS = "composite.QSBSequence",
									ARGS = 
									{
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 60 / 30},
										},
										{
											CLASS = "action.QSBShakeScreen",
											OPTIONS = {amplitude = 4, duration = 0.35, count = 2,},
										},
									},
								},

								{
									CLASS = "composite.QSBSequence",
									ARGS = {
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 65 / 30},
										},
										{
											CLASS = "action.QSBMultipleTrap", --连续放置多个陷阱
											OPTIONS = {interval_time = 0, attacker_face = true,attacker_underfoot = true,count = 1, distance = 0, trapId = "pf_ssdaimubai01_bianshen2"},
										},                     
									},
								},
								{
									CLASS = "composite.QSBSequence",
									ARGS = 
									{
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 65 / 30},
										},
										{
											CLASS = "action.QSBTrap",  
											OPTIONS = 
											{ 
												trapId = "pf_ssdaimubai01_dazhao_lieguang",
												args = 
												{
													{delay_time = 1 / 30 , relative_pos = { x = -200, y = -120}} ,
													{delay_time = 1 / 30, relative_pos = { x = 200, y = -120}} ,
													{delay_time = 2 / 30, relative_pos = { x = -325, y = -10}} ,
													{delay_time = 2 / 30 , relative_pos = { x = 325, y = -10}} ,
													{delay_time = 3 / 30, relative_pos = { x = 240, y = 120}} ,
													{delay_time = 3 / 30, relative_pos = { x = -240, y = 120}},
												},
											},
										},
									},
								},
								{
									CLASS = "composite.QSBSequence",
									ARGS = 
									{
										
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 65 / 30 },
										},
										{
										  CLASS = "action.QSBHitTarget",
										  OPTIONS = {multiple_area_scale = 1.35 },
										},
									},
								},
								{
									CLASS = "composite.QSBSequence",
									ARGS = 
									{
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 65 / 30},
										},
										{
											CLASS = "action.QSBShakeScreen",
											OPTIONS = {amplitude = 8, duration = 0.45, count = 2,},
										},
									},
								},
								{
									CLASS = "composite.QSBSequence",
									ARGS = 
									{
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 65 / 30},
										},
										{
											CLASS = "action.QSBApplyBuff",
											OPTIONS = {is_target = false, buff_id = "pf_ssdaimubai01_bianshen" ,no_cancel = true},
										},
									},                     
								},
								{
									CLASS = "composite.QSBSequence",
									ARGS = 
									{
										{
                    CLASS = "action.QSBApplyBuff",
                    OPTIONS = {is_target = false, buff_id = "zsdaimubai_mianyi"},
                },
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 105 / 30},
										},
										{
											CLASS = "action.QSBAttackFinish",
										},
									},
								},
							},
						},
                    },
                },
				
				--变身前
                {
                    CLASS = "composite.QSBParallel",
                    ARGS = 
                    {
                        {
							CLASS = "action.QSBPlayEffect",
							OPTIONS = {is_hit_effect = false, effect_id = "pf_ssdaimubai01_attack11_1"},
						},  
						{
                            CLASS = "composite.QSBSequence",
                            ARGS = 
                            {
                                {
                                    CLASS = "action.QSBShowActor",
                                    OPTIONS = {is_attacker = true, turn_on = true, time = 0.6},
                                },
                                {
                                    CLASS = "action.QSBBulletTime",
                                    OPTIONS = {turn_on = true, revertable = false},
                                },
								{
                                    CLASS = "action.QSBSyncActorTimeGearForEffect",
                                },
                                {
                                    CLASS = "action.QSBDelayTime",
                                    OPTIONS = {delay_time = 44/30},
                                },
                                {
                                    CLASS = "action.QSBBulletTime",
                                    OPTIONS = {turn_on = false},
                                },
                                {
                                    CLASS = "action.QSBShowActor",
                                    OPTIONS = {is_attacker = true, turn_on = false, time = 0.1},
                                },
                            },
                        }, 
                        {                           --竞技场黑屏
                            CLASS = "composite.QSBSequence",
                            ARGS = {
                                {
                                    CLASS = "action.QSBShowActorArena",
                                    OPTIONS = {is_attacker = true, turn_on = true, time = 0.6, revertable = true},
                                },
                                {
                                    CLASS = "action.QSBBulletTimeArena",
                                    OPTIONS = {turn_on = true, revertable = true},
                                },
								{
                                    CLASS = "action.QSBSyncActorTimeGearForEffect",
                                },
                                {
                                    CLASS = "action.QSBDelayTime",
                                    OPTIONS = {delay_frame = 44 / 30},
                                },
                                {
                                    CLASS = "action.QSBBulletTimeArena",
                                    OPTIONS = {turn_on = false},
                                },
                                {
                                    CLASS = "action.QSBShowActorArena",
                                    OPTIONS = {is_attacker = true, turn_on = false, time = 0.1},
                                },
                            },
                        },
                        {
                    CLASS = "action.QSBApplyBuff",
                    OPTIONS = {is_target = false, buff_id = "zsdaimubai_mianyi"},
                },
                        {
                            CLASS = "action.QSBPlaySound",
                            OPTIONS = {sound_id ="pf_ssdaimubai01_skill"},
                        },
                        {
							CLASS = "composite.QSBParallel",
							ARGS = 
							{ 
								{
									CLASS = "action.QSBPlayAnimation",
									OPTIONS = {animation = "attack11_1"},
								},
								{
									CLASS = "composite.QSBSequence",
									OPTIONS = {forward_mode = true},
									ARGS = 
									{
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 2 / 30},
										},
										{
											CLASS = "action.QSBArgsIsDirectionLeft",
											OPTIONS = {is_attacker = true},
										},
										{
											CLASS = "composite.QSBSelector",
											ARGS = 
											{   
												{
													CLASS = "composite.QSBParallel",
													ARGS = 
													{ 
														{
															CLASS = "composite.QSBSequence",
															ARGS = 
															{
																{
																	CLASS = "action.QSBArgsSelectTarget",
																	OPTIONS = {max_distance = true}
																},                                                                                        
																{
																	CLASS = "action.QSBDelayTime",
																	OPTIONS = {delay_time = 6 / 30 ,  pass_key = {"selectTarget"}},
																},
																{
																	CLASS = "action.QSBPlayEffect",
																	OPTIONS = {is_hit_effect = true, effect_id = "pf_ssdaimubai01_attack11_6_1", pass_key = {"selectTarget"}},
																},
																{
																	CLASS = "action.QSBDelayTime",
																	OPTIONS = {delay_time = 2 / 30 ,  pass_key = {"selectTarget"}},
																},              
																{
																	CLASS = "action.QSBDragActor",
																	OPTIONS = {pos_type = "self" , pos = {x = 250,y = 0} , duration = 0.35, flip_with_actor = true },
																},
															},
														},
														{
															CLASS = "composite.QSBSequence",
															ARGS = 
															{
																{
																	CLASS = "action.QSBArgsSelectTarget",
																	OPTIONS = {min_distance = true}
																},                                                                                        
																{
																	CLASS = "action.QSBDelayTime",
																	OPTIONS = {delay_time = 6 / 30 ,  pass_key = {"selectTarget"}},
																}, 
																{
																	CLASS = "action.QSBPlayEffect",
																	OPTIONS = {is_hit_effect = true, effect_id = "pf_ssdaimubai01_attack11_6_1", pass_key = {"selectTarget"}},
																}, 
																{
																	CLASS = "action.QSBDelayTime",
																	OPTIONS = {delay_time = 2 / 30 ,  pass_key = {"selectTarget"}},
																},            
																{
																	CLASS = "action.QSBDragActor",
																	OPTIONS = {pos_type = "self" , pos = {x = 250,y = 0} , duration = 0.35, flip_with_actor = true },
																},
															},
														},
													},
												},
												{
													CLASS = "composite.QSBParallel",
													ARGS = 
													{ 
														{
															CLASS = "composite.QSBSequence",
															ARGS = 
															{
																{
																	CLASS = "action.QSBArgsSelectTarget",
																	OPTIONS = {max_distance = true}
																},                                                                                         
																{
																	CLASS = "action.QSBDelayTime",
																	OPTIONS = {delay_time = 6 / 30 ,  pass_key = {"selectTarget"}},
																},
																{
																	CLASS = "action.QSBPlayEffect",
																	OPTIONS = {is_hit_effect = true, effect_id = "pf_ssdaimubai01_attack11_6", pass_key = {"selectTarget"}},
																},  
																{
																	CLASS = "action.QSBDelayTime",
																	OPTIONS = {delay_time = 2 / 30 ,  pass_key = {"selectTarget"}},
																},           
																{
																	CLASS = "action.QSBDragActor",
																	OPTIONS = {pos_type = "self" , pos = {x = 250,y = 0} , duration = 0.35, flip_with_actor = true },
																},
															},
														},
														{
															CLASS = "composite.QSBSequence",
															ARGS = 
															{
																{
																	CLASS = "action.QSBArgsSelectTarget",
																	OPTIONS = {min_distance = true}
																},                                                                                        
																{
																	CLASS = "action.QSBDelayTime",
																	OPTIONS = {delay_time = 6 / 30 ,  pass_key = {"selectTarget"}},
																},
																{
																	CLASS = "action.QSBPlayEffect",
																	OPTIONS = {is_hit_effect = true, effect_id = "pf_ssdaimubai01_attack11_6", pass_key = {"selectTarget"}},
																},   
																{
																	CLASS = "action.QSBDelayTime",
																	OPTIONS = {delay_time = 2 / 30 ,  pass_key = {"selectTarget"}},
																},           
																{
																	CLASS = "action.QSBDragActor",
																	OPTIONS = {pos_type = "self" , pos = {x = 250,y = 0} , duration = 0.35, flip_with_actor = true },
																},
															},
														},
													},
												},
											},
										},                    
									},
								},
								{
									CLASS = "composite.QSBSequence",
									ARGS = 
									{
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 60 / 30},
										},
										{
											CLASS = "action.QSBApplyBuff",
											OPTIONS = {is_target = false, buff_id = "pf_ssdaimubai01_bianshen_tx"},--11
										},
										{
											CLASS = "action.QSBPlayEffect",
											OPTIONS = {is_hit_effect = false, effect_id = "pf_ssdaimubai01_attack11_2"},
										},                      
									},
								},
								{
									CLASS = "composite.QSBSequence",
									ARGS = 
									{
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 60 / 30},
										},
										{
											CLASS = "action.QSBShakeScreen",
											OPTIONS = {amplitude = 4, duration = 0.35, count = 2,},
										},
									},
								},
								{
									CLASS = "composite.QSBSequence",
									ARGS = {
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 60 / 30},
										},
										{
											CLASS = "action.QSBPlayEffect",
											OPTIONS = {is_hit_effect = false, effect_id = "pf_ssdaimubai01_attack11_3"},
										},                      
									},
								},
								-- {
									-- CLASS = "composite.QSBSequence",
									-- ARGS = 
									-- {
										-- {
											-- CLASS = "action.QSBDelayTime",
											-- OPTIONS = {delay_time = 51 / 30},
										-- },
										-- {
											-- CLASS = "action.QSBArgsIsDirectionLeft",
											-- OPTIONS = {is_attacker = true},
										-- },
										-- {
											-- CLASS = "composite.QSBSelector",
											-- ARGS = 
											-- {
												-- {
													-- CLASS = "composite.QSBSequence",
													-- ARGS = 
													-- {
														-- {
															-- CLASS = "action.QSBPlayEffect",
															-- OPTIONS = {not_cancel_with_skill = true, effect_id = "zsdaimubai_attack11_1", scale_actor_face = 1},
														-- },
													-- },
												-- },
												-- {
													-- CLASS = "composite.QSBSequence",
													-- ARGS = 
													-- {
														-- {
															-- CLASS = "action.QSBPlayEffect",
															-- OPTIONS = {not_cancel_with_skill = true, effect_id = "zsdaimubai_attack11_1_1", scale_actor_face = -1},
														-- },
													-- },
												-- },
											-- },
										-- },                    
									-- },
								-- },
								{
									CLASS = "composite.QSBSequence",
									ARGS = {
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 65 / 30},
										},
										{
											CLASS = "action.QSBMultipleTrap", --连续放置多个陷阱
											OPTIONS = {interval_time = 0, attacker_face = true,attacker_underfoot = true,count = 1, distance = 0, trapId = "pf_ssdaimubai01_bianshen2"},
										},                     
									},
								},
								{
									CLASS = "composite.QSBSequence",
									ARGS = 
									{
										
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 65 / 30 },
										},
										{
										  CLASS = "action.QSBHitTarget",
										},
									},
								},
								{
									CLASS = "composite.QSBSequence",
									ARGS = 
									{
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 65 / 30},
										},
										{
											CLASS = "action.QSBShakeScreen",
											OPTIONS = {amplitude = 8, duration = 0.45, count = 2,},
										},
									},
								},
								{
									CLASS = "composite.QSBSequence",
									ARGS = 
									{
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 89 / 30},
										},
										{
											CLASS = "action.QSBApplyBuff",
											OPTIONS = {is_target = false, buff_id = "pf_ssdaimubai01_bianshen", no_cancel = true},
										},
									},                     
								},
								{
									CLASS = "composite.QSBSequence",
									ARGS = 
									{
										{
                    CLASS = "action.QSBApplyBuff",
                    OPTIONS = {is_target = false, buff_id = "zsdaimubai_mianyi"},
                },
										{
											CLASS = "action.QSBDelayTime",
											OPTIONS = {delay_time = 150 / 30},
										},
										{
											CLASS = "action.QSBAttackFinish",
										},
									},
								},
							},
						},
                    },
                },
            },
        },
    },
}

return pf_ssdaimubai01_dazhao