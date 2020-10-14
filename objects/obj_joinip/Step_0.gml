if mouse_check_button_pressed(mb_right)
{
	str = clipboard_get_text()
}
else if keyboard_check_pressed(vk_anykey)
{
	if (keyboard_lastkey == vk_backspace)
	{
		if (firstwrite) {str = ""; firstwrite = false}
		else str = string_delete(str,string_length(str),1)
	}
	else if (keyboard_lastkey == vk_enter) 
	{
		global.ip = str; 
		global.net = obj_client; 
		global.level = 0; 
		global.online = true; 
		global.port = 6969; 
		global.amhost = false; 
		room_goto(rm_online)
	}
	else
	{
		if (firstwrite) {str =""; firstwrite = false}
		str += keyboard_lastchar
	}
}