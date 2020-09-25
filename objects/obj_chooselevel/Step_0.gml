/// @description Insert description here
// You can write your code in this editor
if !option
{
	if keyboard_check_pressed(vk_anykey)
	{
		if keyboard_check_pressed(vk_backspace)
		{
			str = string_delete(str,string_length(str),1)
			if string_length(str) == 0 str = "0"
		}
		else if keyboard_check_pressed(vk_enter)
		{
			global.level = real(str)
			
			if str2 == "0" randomize()
			else random_set_seed(real(str2))
			
			if (!global.online) room_goto(rm_singleplayer)
			else
			{
				global.net = obj_server; 
				global.port = 6969; 
				global.amhost = true;
				room_goto(rm_online)
			}
		}
		else if keyboard_lastkey >= 48 && keyboard_lastkey <= 57
		 {
			 if str == "0" str = keyboard_lastchar
			 else if real(str+keyboard_lastchar) <= 29
			 {
				str += keyboard_lastchar
			 }
		 }
	}
}
else
{
	if keyboard_check_pressed(vk_anykey)
	{
		if keyboard_check_pressed(vk_backspace)
		{
			str2 = string_delete(str2,string_length(str2),1)
			if string_length(str2) == 0 str2 = "0"
		}
		else if keyboard_check_pressed(vk_enter)
		{
			global.level = real(str)
			if str2 == "0" randomize()
			else random_set_seed(real(str2))
			room_goto(rm_singleplayer)
		}
		else if keyboard_lastkey >= 48 && keyboard_lastkey <= 57
		 {
			 if str2 == "0" str2 = keyboard_lastchar
			 else str2 += keyboard_lastchar
		 }
	}
}