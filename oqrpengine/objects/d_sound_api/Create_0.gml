// Audio is split into two groups: Music and SFX

audio_group_load(SFX)
audio_group_load(Music)


// LOAD GAIN INFO FROM SAVE FILE
audio_master_gain(1)
audio_group_set_gain(Music, 1, 0)
audio_group_set_gain(SFX, 1, 0)