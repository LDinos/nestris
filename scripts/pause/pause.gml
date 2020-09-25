// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pause(){
	instance_deactivate_all(false)
	audio_stop_all()
	audio_play_sound(snd_pause,0,0)
	instance_create_depth(0,0,-1,obj_pause)
}