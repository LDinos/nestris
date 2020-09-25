/// @description Insert description here
// You can write your code in this editor
if (!dont_move)
{	
	give_softdrop_score = 0;
	check_piece_movement(16 - 10*keyboard_check(global.KEY_SHIFT));

	if keyboard_check(global.KEY_MOVE_DOWN) && !dont_move_down {give_softdrop_score = 1; if (frames_remaining > 1 && frames_remaining != 0) frames_remaining= 1}
	else if !keyboard_check(global.KEY_MOVE_DOWN) dont_move_down = false

	if keyboard_check_pressed(global.KEY_ROT_LEFT) || keyboard_check_pressed(global.KEY_ROT_RIGHT)
	{
		var rotate = false;
		if keyboard_check(global.KEY_ROT_LEFT) && !keyboard_check(global.KEY_ROT_RIGHT) && rot_cooldown != 1 
		{
			rot_cooldown = 1
			rotate = true;
		}
		if keyboard_check(global.KEY_ROT_RIGHT) && !keyboard_check(global.KEY_ROT_LEFT) && rot_cooldown != -1
		{ 
			rot_cooldown = -1
			rotate = true;
		}
		if (rotate)
		{
			prev_angle = image_angle
			y_prev = y
			if (sprite_index == spr_piece_s) || (sprite_index == spr_piece_z) || (sprite_index == spr_piece_i)
			{
				if (image_angle == -90) {image_angle = 0; if (sprite_index == spr_piece_s) || (sprite_index == spr_piece_z) y+= GRID}
				else {image_angle = -90; if (sprite_index == spr_piece_s) || (sprite_index == spr_piece_z) y-= GRID}
				//if (sprite_index == spr_piece_s || sprite_index == spr_piece_z) y+= GRID*sign(image_angle)
			}
			else if (sprite_index != spr_piece_o) {image_angle += 90*rot_cooldown; if (abs(image_angle) == 360) image_angle = 0}
			
			if place_meeting(x,y,obj_block) {image_angle = prev_angle; if (sprite_index == spr_piece_s || sprite_index == spr_piece_z) y= y_prev} //dont do rotation if we touch a block
			else
			{
				audio_play_sound(snd_piece_rotation,0,false)
				if (global.online)
				{
					var buff = rot_cooldown == 1 ? NET_ROTATE_LEFT : NET_ROTATE_RIGHT
					with(global.net)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,buff)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			}
		}
	}
	else rot_cooldown = 0
	
	if (frames_remaining != 0)
	{
		frames_remaining--
	}
	else
	{
		if !place_meeting(x,y+GRID,obj_block) 
		{
			y+=GRID; score += give_softdrop_score
			if (global.online)
			{
				with(global.net)
				{
					buffer_seek(buffer,buffer_seek_start,0)
					buffer_write(buffer,buffer_u8,NET_MOVE_DOWN)
					buffer_write(buffer,buffer_bool,other.give_softdrop_score)
					network_send_packet(client_socket,buffer,buffer_tell(buffer))
				}
			}
		}
		else {if place_meeting(x,y+GRID,obj_block) put_piece(false); }
		frames_remaining = gravity_speed
	}
}