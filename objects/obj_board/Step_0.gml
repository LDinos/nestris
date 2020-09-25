/// @description Insert description here
// You can write your code in this editor
if !global.online
{
	if keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("P"))
	{
		pause()
	}
}