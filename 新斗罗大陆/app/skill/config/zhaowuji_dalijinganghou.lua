local zhaowuji_dalijinganghou = {
    CLASS = 'composite.QSBParallel',
    ARGS = {
        {
            CLASS = 'composite.QSBSequence',
            OPTIONS = {forward_mode = true}, --不会打断特效
            ARGS = {
                {
                    CLASS = 'action.QSBShowActor',
                    OPTIONS = {is_attacker = true, turn_on = true, time = 0.3, revertable = true}
                },
                {
                    CLASS = 'action.QSBBulletTime',
                    OPTIONS = {turn_on = true, revertable = true}
                },
                {
                    CLASS = 'action.QSBDelayTime',
                    OPTIONS = {delay_time = 23 / 30}
                },
                {
                    CLASS = 'action.QSBBulletTime',
                    OPTIONS = {turn_on = false}
                },
                {
                    CLASS = 'action.QSBShowActor',
                    OPTIONS = {is_attacker = true, turn_on = false, time = 0.1}
                }
            }
        },
        {
            --竞技场黑屏
            CLASS = 'composite.QSBSequence',
            OPTIONS = {forward_mode = true}, --不会打断特效
            ARGS = {
                {
                    CLASS = 'action.QSBShowActorArena',
                    OPTIONS = {is_attacker = true, turn_on = true, time = 0.3, revertable = true}
                },
                {
                    CLASS = 'action.QSBBulletTimeArena',
                    OPTIONS = {turn_on = true, revertable = true}
                },
                {
                    CLASS = 'action.QSBDelayTime',
                    OPTIONS = {delay_time = 23 / 30}
                },
                {
                    CLASS = 'action.QSBBulletTimeArena',
                    OPTIONS = {turn_on = false}
                },
                {
                    CLASS = 'action.QSBShowActorArena',
                    OPTIONS = {is_attacker = true, turn_on = false, time = 0.1}
                }
            }
        },
        {
            CLASS = 'action.QSBPlaySound',
            OPTIONS = {sound_id = 'zhaowuji_skill'}
        },
        {
            CLASS = 'composite.QSBSequence',
            ARGS = {
                {
                    CLASS = 'action.QSBDelayTime',
                    OPTIONS = {delay_frame = 0}
                },
                {
                    CLASS = 'action.QSBPlayEffect',
                    OPTIONS = {effect_id = 'zhaowuji_attack11_1', is_hit_effect = false}
                }
            }
        },
        {
            CLASS = 'composite.QSBParallel',
            ARGS = {
                {
                    CLASS = 'action.QSBPlayAnimation'
                },
                {
                    CLASS = 'composite.QSBParallel',
                    ARGS = {
                        {
                            CLASS = 'action.QSBPlayEffect',
                            OPTIONS = {is_hit_effect = true}
                        },
                        {
                            CLASS = 'action.QSBHitTarget'
                        },
                        {
                            CLASS = 'action.QSBDelayTime',
                            OPTIONS = {delay_time = 4 / 24}
                        },
                        {
                            CLASS = 'action.QSBHitTarget'
                        },
                        {
                            CLASS = 'action.QSBDelayTime',
                            OPTIONS = {delay_time = 4 / 24}
                        },
                        {
                            CLASS = 'action.QSBHitTarget'
                        },
                        {
                            CLASS = 'action.QSBDelayTime',
                            OPTIONS = {delay_time = 4 / 24}
                        },
                        {
                            CLASS = 'action.QSBHitTarget'
                        }
                    }
                },
                {
                    CLASS = 'composite.QSBSequence',
                    ARGS = {
                        {
                            CLASS = 'action.QSBDelayTime',
                            OPTIONS = {delay_frame = 90}
                        },
                        {
                            CLASS = 'action.QSBAttackFinish'
                        }
                    }
                }
            }
        }
    }
}

return zhaowuji_dalijinganghou
