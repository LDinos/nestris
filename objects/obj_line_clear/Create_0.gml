/// @description Insert description here
// You can write your code in this editor
xoffset = GRID
//show_message(x)
//show_message(y)
loops = 1;
alarm[0] = 5
var piece_list = ds_list_create()
collision_rectangle_list(obj_board.x+8,y,obj_board.x+8 + GRID*9, obj_board.y-GRID*4,obj_block,false,true,piece_list,false)
for(var i = 0; i < ds_list_size(piece_list); i++) {with(piece_list[| i]) {move_down++}}
ds_list_destroy(piece_list)