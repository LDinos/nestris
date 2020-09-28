/// @description Insert description here
// You can write your code in this editor
if (obj_board.piece_index > array_length(obj_board.pieces)-1) {sprite_index = obj_board.pieces[0]; obj_board.piece_index++}
else sprite_index = obj_board.pieces[obj_board.piece_index++]
x += sprite_xoffset //center me on the grid
y += sprite_yoffset //center me on the grid


if (sprite_index == spr_piece_i) x-=32 //if I am I piece, put me in the real center (other pieces arent really in center)
ghost_x = x
ghost_y = y
make_ghost_piece()
das_cooldown = 0 //cooldown before the held button makes the piece move again
rot_cooldown = 0 //this tells which way to rotate the piece. -1 -> clockwise, 1 -> counter clockwise
gravity_speed = find_level_frame_speed() //how many frames does it take for the piece to go down
frames_remaining = gravity_speed //how many frames remaining yet so we can move down? It acts as a countdown
dont_move = false; //if gameover, remove controls
dont_move_down = false; //if we were holding down arrow previously, dont go down until he leaves the button
if keyboard_check(global.KEY_MOVE_DOWN) dont_move_down = true;
subskin = 1
switch(sprite_index)
{
	case spr_piece_i:
	case spr_piece_o:
	case spr_piece_t:
		subskin = 3
		break;
	case spr_piece_j:
	case spr_piece_s:
		subskin = 2
		break;
	case spr_piece_z:
	case spr_piece_l:
		subskin = 1
		break;
}
if (global.online)
{
	with(global.net)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NET_PIECE_SPAWN)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
}
check_piece_movement(6)
if instance_place(x,y,obj_block)
{
	audio_play_sound(snd_death,0,false)
	if (global.online)
	{
		with(global.net)
		{
			buffer_seek(buffer,buffer_seek_start,0)
			buffer_write(buffer,buffer_u8,NET_GAMEOVER)
			network_send_packet(client_socket,buffer,buffer_tell(buffer))
		}
	}
	dont_move = true;
}
if (sprite_index != spr_piece_i) global.line_drought++
else global.line_drought = 0
