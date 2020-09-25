/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("P"))
	{
		audio_play_sound(snd_pause,0,0)
		instance_activate_all()
		instance_destroy()
	}