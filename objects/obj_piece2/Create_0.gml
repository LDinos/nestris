/// @description Insert description here
// You can write your code in this editor
if (obj_board.piece_index2 > array_length(obj_board.pieces)-1) {sprite_index = obj_board.pieces[0]; obj_board.piece_index2++}
else sprite_index = obj_board.pieces[obj_board.piece_index2++]
x += sprite_xoffset //center me on the grid
y += sprite_yoffset //center me on the grid


if (sprite_index == spr_piece_i) x-=32 //if I am I piece, put me in the real center (other pieces arent really in center)

if (sprite_index != spr_piece_i) global.line_drought2++
else global.line_drought2 = 0
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
