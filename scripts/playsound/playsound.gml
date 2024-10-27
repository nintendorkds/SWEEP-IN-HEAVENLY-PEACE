// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playsound(_sound,_variance=0,_setvolume=1){
	if(audio_is_playing(_sound)){audio_stop_sound(_sound)}
	if(_variance>0)
	{
		audio_play_sound(_sound,0,0,_setvolume,0,random_range(1-_variance,1+_variance))
	}
	else
	{
		audio_play_sound(_sound,0,0)
	}
}