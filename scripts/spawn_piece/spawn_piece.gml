// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawn_piece(offset){
	var obj = obj_piece
	if (offset != 0) obj = obj_piece2
	instance_create_depth(obj_board.x + offset +GRID*4,obj_board.y,-1,obj)
}