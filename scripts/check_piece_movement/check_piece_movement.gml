// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_piece_movement(frames_needed){
	if keyboard_check(global.KEY_MOVE_RIGHT) || keyboard_check(global.KEY_MOVE_LEFT)
	{		
		
		var xtogo = keyboard_check(global.KEY_MOVE_RIGHT)*GRID - keyboard_check(global.KEY_MOVE_LEFT)*GRID
		if !place_meeting(x+xtogo,y,obj_block) && xtogo != 0
		{
			if alarm[1] == -1 
			{
				das_cooldown = DAS_SPEED
				audio_play_sound(snd_piece_move,0,false)
				x+=xtogo
				if (global.online)
				{
					var buff = xtogo>0 ? NET_MOVE_RIGHT : NET_MOVE_LEFT
					with(global.net)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,buff)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
				alarm[1] = frames_needed //added function to remove das if shift is pressed
			}
		}
		else alarm[1] = -1
	}
	else alarm[1] = -1
}