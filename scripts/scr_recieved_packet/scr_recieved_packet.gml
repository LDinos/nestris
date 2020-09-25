function scr_recieved_packet(buffer) {
	buffer_seek(buffer,buffer_seek_start,0)
	var msg = buffer_read(buffer,buffer_u8)
	switch msg
	{
		case NET_RESTART_SIGNAL: //client accepts this
			restart()
			buffer_seek(global.net.buffer,buffer_seek_start,0)
			buffer_write(global.net.buffer,buffer_u8,NET_RESTART)
			network_send_packet(client_socket,global.net.buffer,buffer_tell(global.net.buffer))
		case NET_RESTART: //server accepts this
			restart()
			break;
		case NET_SEND_USERNAME: //server accepting this after welcoming user
			global.user2 = buffer_read(buffer,buffer_string)
			break;
		case NET_CONNECT_SUCCESS: //client accepts this
			with(obj_board)
			{
				global.level = buffer_read(buffer,buffer_u8)			
				global.user2 = buffer_read(buffer,buffer_string)
				random_set_seed(buffer_read(buffer,buffer_u32))
				global.level2 = global.level
				global.line_clear_goal = level_line_goal[global.level]
				global.line_clear_goal2 = global.line_clear_goal
				first_level = global.level		
				for(var i = 0; i < 1000; i++) 
				{
				pieces[i] = choose(spr_piece_i,
								spr_piece_j,
								spr_piece_l,
								spr_piece_o,
								spr_piece_s,
								spr_piece_t,
								spr_piece_z)
				}		
			}
			spawn_piece(0)
			//spawn_piece(-P2_OFFSET)
			with(obj_piece) frames_remaining = 120
			buffer_seek(global.net.buffer,buffer_seek_start,0)
			buffer_write(global.net.buffer,buffer_u8,NET_SEND_USERNAME)
			buffer_write(global.net.buffer,buffer_string,global.user)
			network_send_packet(client_socket,global.net.buffer,buffer_tell(global.net.buffer))
			break;
		case NET_MOVE_LEFT:
			with(obj_piece2) x-= GRID
			break;
		case NET_MOVE_RIGHT:
			with(obj_piece2) x+= GRID
			break;
		case NET_MOVE_DOWN:
			var plusonescore = buffer_read(buffer,buffer_bool)
			global.score2 += plusonescore
			with(obj_piece2) y+= GRID
			break;
		case NET_ROTATE_LEFT:
			with(obj_piece2) 
			{
				if (sprite_index == spr_piece_s) || (sprite_index == spr_piece_z) || (sprite_index == spr_piece_i)
				{
					if (image_angle == -90) {image_angle = 0; if (sprite_index == spr_piece_s) || (sprite_index == spr_piece_z) y+= GRID}
					else {image_angle = -90; if (sprite_index == spr_piece_s) || (sprite_index == spr_piece_z) y-= GRID}
				}
				else if (sprite_index != spr_piece_o) {image_angle += 90*1; if (abs(image_angle) == 360) image_angle = 0}
				//audio_play_sound(snd_piece_rotation,0,false)	
			}
			break;
		case NET_ROTATE_RIGHT:
			with(obj_piece2) 
			{
				if (sprite_index == spr_piece_s) || (sprite_index == spr_piece_z) || (sprite_index == spr_piece_i)
				{
					if (image_angle == -90) {image_angle = 0; if (sprite_index == spr_piece_s) || (sprite_index == spr_piece_z) y+= GRID}
					else {image_angle = -90; if (sprite_index == spr_piece_s) || (sprite_index == spr_piece_z) y-= GRID}
				}
				else if (sprite_index != spr_piece_o) {image_angle += 90*(-1); if (abs(image_angle) == 360) image_angle = 0}
				//audio_play_sound(snd_piece_rotation,0,false)	
			}
			break;
		case NET_PIECE_SPAWN:
			if global.amhost spawn_piece(P2_OFFSET)
			else spawn_piece(-P2_OFFSET)
			break;
		case NET_PIECE_PUT:
			with(obj_piece2) put_piece(true)
			break;
		case NET_GAMEOVER:
			audio_play_sound(snd_death,0,false)
			break;
	}
}
