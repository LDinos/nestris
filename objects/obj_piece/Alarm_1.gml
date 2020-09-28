/// @description Move me
var xtogo = keyboard_check(global.KEY_MOVE_RIGHT)*GRID - keyboard_check(global.KEY_MOVE_LEFT)*GRID
if !place_meeting(x+xtogo,y,obj_block) && xtogo != 0
{
	das_cooldown = DAS_SPEED
	audio_play_sound(snd_piece_move,0,false)
	x+=xtogo
	make_ghost_piece()
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
}
alarm[1] = 6	